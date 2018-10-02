import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView() // 函数的调用，一定要写在方法内
    }
    
    func setWebView()
    {
        let webView = WKWebView(frame: UIScreen.main.bounds)
        let url = NSURL(string: "http://www.jianshu.com")
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
        view.addSubview(webView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

