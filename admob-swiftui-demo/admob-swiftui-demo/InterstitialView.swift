import SwiftUI

struct InterstitialView: View {
    private var ad = OpenAd(adKey: "ca-app-pub-2448514547070512/2692915559")
    
    var body: some View {
        Text("Interstitial View")
            .onAppear {
                ad.tryToPresentAd()
            }
    }
}
