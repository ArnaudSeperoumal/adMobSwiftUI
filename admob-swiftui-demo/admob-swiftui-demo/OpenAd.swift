import GoogleMobileAds

final class OpenAd: NSObject, FullScreenContentDelegate {
    var adKey: String
    var appOpenAd: AppOpenAd?
    
    init(adKey: String) {
        self.adKey = adKey
        super.init()
    }
    
    func requestAppOpenAd() {
        let request = Request()
        AppOpenAd.load(with: adKey,
                       request: request,
                       completionHandler: { [weak self] (appOpenAdIn, _) in
            guard let self = self else { return }
            self.appOpenAd = appOpenAdIn
            self.appOpenAd?.fullScreenContentDelegate = self
            print("[OPEN AD] Ad is ready")
            
            if let rootView = UIApplication.shared.windows.first?.rootViewController {
                self.appOpenAd?.present(from: rootView)
            }
        })
    }
    
    func tryToPresentAd() {
        if let gOpenAd = self.appOpenAd {
            gOpenAd.present(from: (UIApplication.shared.windows.first?.rootViewController)!)
        } else {
            self.requestAppOpenAd()
        }
    }
}
