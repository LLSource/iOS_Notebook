# <h1 style='text-align:center;'>iOS 教程</h1>

## 说明
本文主旨在于收集 iOS 的各类文章，按照知识点分类，就像 iOS 教材一样，平时学习做参考。


## 架构
1、[iOS的MVC框架之模型层的构建](https://www.jianshu.com/p/fce02188edec?utm_campaign=hugo&utm_medium=reader_share&utm_content=note&utm_source=qq)

## runtime
### 1、 分类的实现原理： 
```
objc_setAssociatedObject(id _Nonnull object, const void * _Nonnull key,
 id _Nullable value, objc_AssociationPolicy policy)
 
 全局哈希表继承自 unordered_map                object 所有关联对象哈希表 unordered_map
 --------                                      传入的参数 key 作为 KEY
 |  key  |: ~uintptr_t(object)-----> value       |-------|
 | ----  |                                       | key   | : Class(policy, value)
 |       |                                       |-------|
 | ----  |                                       |       |
 |       |                                       |-------|
 | ----  |                                       |-------|
```

1. 知识点1[ intptr_t 和uintptr_t ](https://blog.csdn.net/lsjseu/article/details/42360709)


 intptr_t 和uintptr_t 类型用来存放指针地址。它们提供了一种可移植且安全的方法声明指针，
 而且和系统中使用的指针长度相同，对于把指针转化成整数形式来说很有用。
 
 ~uintptr_t(id) 方法返回一个 18446603735771633215 ,这是对象的地址；C++ 里不能直接讲地址赋值（intptr_t p2 = &a;），必须使用 ~uintptr_t（）
 
2. 知识点2 [unordered_map](https://blog.csdn.net/haolipengzhanshen/article/details/51970348?locationNum=3&fps=1)

 unordered_map  first is key, second is value
 
 find() 方法返回迭代器类型
 
 map.erase("c"); // 删除 key 为 c 的值
 
### 2、weak 的实现

> runtime 维护一个全局 StripedMap ，利用弱引用对象的地址从 StripedMap 的数组中取 SideMap，此map 中有一个 weak_table_t  结构体, 此weak 表里面存着一系列由 对象 和对象相关的弱指针数组 组成的 entry，添加弱指针时就向 ertry 的弱指针数组添加元素；当对象释放时，从 entry 的弱指针数组中情况所有内容，并将 entry 从 weak 表中移除。

![weak原理图](https://raw.githubusercontent.com/jalyResource/iOS_Notebook/master/NoteBook/Resources/Images/iOS_runtime_weak.JPG)

- [cocoaChina讲解weak原理](http://www.cocoachina.com/ios/20170328/18962.html)

### 3、autoreloasePool 的实现
- [雷纯锋-autoreloasePool](http://blog.leichunfeng.com/blog/2015/05/31/objective-c-autorelease-pool-implementation-principle/)

 autoreleasepool 是没有单独的内存结构的，它是通过以 AutoreleasePoolPage 为结点的双向链表来实现的。 将 @autoreleasePoll { } 转换为 C++，最终实现是这样的：
 
 ```
 /* @autoreleasepool */ {
    void *atautoreleasepoolobj = objc_autoreleasePoolPush();
    // 用户代码，所有接收到 autorelease 消息的对象会被添加到这个 autoreleasepool 中
    objc_autoreleasePoolPop(atautoreleasepoolobj);
}
 ```
 
- push 操作，push 就是钓鱼 AutoreleasePoolPage  的 push
 
 ```
 void *
objc_autoreleasePoolPush(void)
{
    if (UseGC) return nil;
    return AutoreleasePoolPage::push();
}
static inline void *push()
{
    id *dest = autoreleaseFast(POOL_SENTINEL);
    assert(*dest == POOL_SENTINEL);
    return dest;
}

 ```
 
 通过 autoreleaseFast 完成插入操作
 
 ```
 static inline id *autoreleaseFast(id obj)
{
    AutoreleasePoolPage *page = hotPage();
    if (page && !page->full()) {
        return page->add(obj);
    } else if (page) {
        return autoreleaseFullPage(obj, page);
    } else {
        return autoreleaseNoPage(obj);
    }
}
```
  分别对三种情况进行了不同的处理：
  - 当前 page 存在且没有满时，直接将对象添加到当前 page 中，即 next 指向的位置；
  - 当前 page 存在且已满时，创建一个新的 page ，并将对象添加到新创建的 page 中；
  - 当前 page 不存在时，即还没有 page 时，创建第一个 page ，并将对象添加到新创建的 page 中。
  
每调用一次 push 操作就会创建一个新的 autoreleasepool ，即往 AutoreleasePoolPage 中插入一个 POOL_SENTINEL ，并且返回插入的 POOL_SENTINEL 的内存地址。

- autorelease 

AutoreleasePoolPage 的 autorelease 函数的实现对我们来说就比较容量理解了，它跟 push 操作的实现非常相似。只不过 push 操作插入的是一个 POOL_SENTINEL ，而 autorelease 操作插入的是一个具体的 autoreleased 对象。

```
static inline id autorelease(id obj)
{
    assert(obj);
    assert(!obj->isTaggedPointer());
    id *dest __unused = autoreleaseFast(obj);
    assert(!dest  ||  *dest == obj);
    return obj;
}

```

- pop 操作

前面提到的 objc_autoreleasePoolPop(void *) 函数本质上也是调用的 AutoreleasePoolPage 的 pop 函数。

pop 函数的入参就是 push 函数的返回值，也就是 POOL_SENTINEL 的内存地址，即 pool token 。当执行 pop 操作时，内存地址在 pool token 之后的所有 autoreleased 对象都会被 release 。直到 pool token 所在 page 的 next 指向 pool token 为止。


- ep:下面是某个线程的 autoreleasepool 堆栈的内存结构图，在这个 autoreleasepool 堆栈中总共有两个 POOL_SENTINEL ，即有两个 autoreleasepool 。该堆栈由三个 AutoreleasePoolPage 结点组成，第一个 AutoreleasePoolPage 结点为 coldPage() ，最后一个 AutoreleasePoolPage 结点为 hotPage() 。其中，前两个结点已经满了，最后一个结点中保存了最新添加的 autoreleased 对象 objr3 的内存地址。

![origin](http://blog.leichunfeng.com/images/AutoreleasePoolPage1.png)

此时，如果执行 pop(token1) 操作，那么该 autoreleasepool 堆栈的内存结构将会变成如下图所示：

![pop](http://blog.leichunfeng.com/images/AutoreleasePoolPage2.png)

- 每一个线程都会维护自己的 autoreleasepool 堆栈。换句话说 autoreleasepool 是与线程紧密相关的，每一个 autoreleasepool 只对应一个线程。

- 总结
通常情况下，我们是不需要手动添加 autoreleasepool 的，使用线程自动维护的 autoreleasepool 就好了。根据苹果官方文档中对 Using Autorelease Pool Blocks 的描述，我们知道在下面三种情况下是需要我们手动添加 autoreleasepool 的：

 - 如果你编写的程序不是基于 UI 框架的，比如说命令行工具；
 - 如果你编写的循环中创建了大量的临时对象；
 - 如果你创建了一个辅助线程。







## __attribute__
- [__attribute__ 作用，动态库的链接顺序](https://blog.csdn.net/mutourenzhang/article/details/47803803)

## 内存管理

## 数据库
- [MesaSQLLite 下载地址&教程](https://linux.cn/thread-14659-1-1.html)







