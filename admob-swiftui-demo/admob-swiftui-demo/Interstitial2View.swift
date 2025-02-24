import SwiftUI
import GoogleMobileAds

struct Interstitial2View: View {
    @State private var interstitialAd: InterstitialAd?
    
    @State var display: Bool = false
    
    var body: some View {
        Text("Interstitial 2 View")
        .onChange(of: InterstitialViewModel.shared.interstitialAd) { oldValue, newValue in
            guard let interstitialAd = newValue else { return }
            guard !display else { return }
            display = true
            if let rootView = UIApplication.shared.windows.first?.rootViewController {
                print("DEBUG => present interstitialAd 1")
                interstitialAd.present(from: rootView)
            }
        }
        .task {
            await InterstitialViewModel.shared.loadAd()
        }
    }
}
