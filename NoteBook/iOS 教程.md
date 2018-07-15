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
 


## __attribute__
- [__attribute__ 作用，动态库的链接顺序](https://blog.csdn.net/mutourenzhang/article/details/47803803)

## 内存管理

## 数据库
- [MesaSQLLite 下载地址&教程](https://linux.cn/thread-14659-1-1.html)







