import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    // MARK - Targets, also known as the tiny portals where web magic happens
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var bifLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainWebView.navigationDelegate = self
        
        // Option 1: A URL on the real live internet, where servers roam free
        // let appUrl = URL(string:"https://biffud.com")
        // let appRequest = URLRequest(url: appUrl!)
        // mainWebView.load(appRequest)

        // Option 2: A file in the Website directory, because sometimes the app packs its own lunch
        // To make this work, you need a folder named Website that contains your website.
        // Add this folder using the "Add Files" feature of xcode, and be sure "Add folder references"
        // is the selected option.
        let appUrl = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Website")!
        let appRequest = URLRequest(url: appUrl)
        mainWebView.load(appRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = RandomColor.getRandomColor()
    }
    
    // Error: the web view tripped over a digital banana peel
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        performSegue(withIdentifier: "errorSegue", sender: nil)
    }
    
    // Loading started: commence tiny browser calisthenics
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    // Loading finished: reveal the web app and take a modest bow
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        bifLogo.isHidden = true;
        mainWebView.isHidden = false;
    }
    
    // Link was clicked: external links get escorted to Safari like VIP guests
    func webView(_ webView: WKWebView, decidePolicyFor: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        if decidePolicyFor.targetFrame == nil {
            if let url = decidePolicyFor.request.url {
                let app = UIApplication.shared
                if app.canOpenURL(url) {
                    app.open(url, options: [:], completionHandler: nil)
                    return decisionHandler( WKNavigationActionPolicy.cancel )
                }
            }
        }
        return decisionHandler( WKNavigationActionPolicy.allow )
    }
}
