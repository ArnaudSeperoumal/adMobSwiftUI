import GoogleMobileAds
import SwiftUI
import UIKit

public enum BannerSize {
    case banner
    case largeBanner
    
    func toSize() -> AdSize {
        switch self {
        case .banner:
            return AdSizeBanner
        case .largeBanner:
            return AdSizeLargeBanner
        }
    }
}

public struct BannerAdView: UIViewControllerRepresentable {
    let adUnitID: String
    let size: BannerSize
    #if DEBUG
    let delegate = MyGADBannerDelegate()
    #endif
    
    public init(adUnitID: String, size: BannerSize = .banner) {
        self.adUnitID = adUnitID
        self.size = size
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        let bannerView = BannerView()
        let viewController = UIViewController()
        bannerView.adSize = size.toSize()
        bannerView.adUnitID = self.adUnitID
        bannerView.rootViewController = viewController
        viewController.view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(bannerView)
        viewController.view.addConstraints(
            [bannerView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
             bannerView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor)
            ])
        #if DEBUG
        bannerView.delegate = delegate
        #endif
        bannerView.load(Request())
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
#if DEBUG
class MyGADBannerDelegate: NSObject, BannerViewDelegate {
//    var controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController

    func bannerViewDidReceiveAd(_ bannerView: BannerView) {
        print("bannerViewDidReceiveAd")
        // Create a new alert
        var dialogMessage = UIAlertController(title: "Display", message: "bannerViewDidReceiveAd", preferredStyle: .alert)
        // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })

         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
        // Present alert to user
//        controller?.present(dialogMessage, animated: true, completion: nil)
    }

    func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
        print("didFailToReceiveAdWithError \(error.localizedDescription)")
        // Create a new alert
        var dialogMessage = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })

         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
        // Present alert to user
//        controller?.present(dialogMessage, animated: true, completion: nil)
    }

    func bannerViewDidRecordClick(_ bannerView: BannerView) {
        print("bannerViewDidRecordClick")
    }

    func bannerViewDidRecordImpression(_ bannerView: BannerView) {
        print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: BannerView) {
        print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: BannerView) {
        print("bannerViewWillDismissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: BannerView) {
        print("bannerViewDidDismissScreen")
    }
}
#endif
