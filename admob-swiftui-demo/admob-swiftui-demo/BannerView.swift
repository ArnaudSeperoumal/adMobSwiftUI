import SwiftUI
import adMobSwiftUI

struct AdMobBannerView: View {
    var adKey: String
    var size: BannerSize
    
    var body: some View {
        BannerAdView(adUnitID: adKey, size: size)
            .frame(width: 320, height: 50)
    }
}
