import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    // 引入webview
    var webView: WKWebView!
    // 引入加载指示器
    var activityIndicator: UIActivityIndicatorView!

    func setWebView() {
        
        // 实例化webView
        let webView = WKWebView(frame: UIScreen.main.bounds)
        
        // 引入一个navigationDelegate用来监听网页加载状态的东东
        webView.navigationDelegate = self as WKNavigationDelegate
        
        // 禁止网页回弹效果
        webView.scrollView.bounces = false
        
        // 加载网页URL
        let url = NSURL(string: "https://www.jianshu.com/")
        let request = NSURLRequest(url: url! as URL)
        
        
        // 加载本地网页文件
//        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "website")!
//        webView.loadFileURL(url, allowingReadAccessTo: url)
//        let request = URLRequest(url: url)
        
        
        // 展示网页
        webView.load(request as URLRequest)
        view.addSubview(webView)
        
       
        
        // 定制加载指示器
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        
        // 在视图中添加指示器
        view.addSubview(activityIndicator)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
        
        // 设置状态栏背景颜色
        guard let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
            return
        }
        statusBarView.backgroundColor = UIColor.white
        
    }
    
    // 以下三个函数监听webview的加载情况，并控制指示器的状态
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


