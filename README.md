# IOS网页app外壳

替换掉 `ViewController.swift`文件中 `let url = NSURL(string: "http://www.jianshu.com")` 里面的域名即可，
已经在info.plist中添加了http的允许`NSAllowsArbitraryLoads = Yes`，所以可以访问http的地址里。


加载本地html文件 教程

https://stackoverflow.com/questions/49638653/load-local-web-files-resources-in-wkwebview
