<h1 align=center>知识点、技巧、坑</h1>



### WKWebView
- 失败的回调方法有2ge，前一个加载时失败调用，后一个在  main frame
后调用。
- 加载网页时，一个链接请求多次，会发生 NSUrlErrorCancel 错误，这个错误不用处理. 

```
/*! @abstract Invoked when an error occurs while starting to load data for
 the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error;


/*! @abstract Invoked when an error occurs during a committed main frame
 navigation.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error;
```

### UITextField/UITextview
- enablesReturnKeyAutomatically  设置YES，有些第三方输入法没效果。