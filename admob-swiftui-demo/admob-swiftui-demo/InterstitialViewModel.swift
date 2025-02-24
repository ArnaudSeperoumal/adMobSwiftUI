import Foundation
import GoogleMobileAds
import SwiftUI

@Observable
class InterstitialViewModel: NSObject, ObservableObject, FullScreenContentDelegate {
    static let shared = InterstitialViewModel()
    private var adKey = "ca-app-pub-2448514547070512/5910626590"
    
    public var interstitialAd: InterstitialAd?
    
    private override init() {
        super.init()
    }
    
    func loadAd() async {
        do {
            interstitialAd = try await InterstitialAd.load(
                with: adKey, request: Request())
            interstitialAd?.fullScreenContentDelegate = self
        } catch {
            print("DEBUG => Failed to load interstitial ad with error: \(error.localizedDescription)")
        }
    }
}

extension InterstitialViewModel {
    func adDidRecordImpression(_ ad: FullScreenPresentingAd) {
      print("DEBUG => \(#function) called")
    }

    func adDidRecordClick(_ ad: FullScreenPresentingAd) {
      print("DEBUG => \(#function) called")
    }

    func ad(
        _ ad: FullScreenPresentingAd,
      didFailToPresentFullScreenContentWithError error: Error
    ) {
      print("DEBUG => \(#function) called")
    }

    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
      print("DEBUG => \(#function) called")
    }

    func adWillDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
      print("DEBUG => \(#function) called")
    }

    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
      print("DEBUG => \(#function) called")
      // Clear the interstitial ad.
      interstitialAd = nil
    }
}
