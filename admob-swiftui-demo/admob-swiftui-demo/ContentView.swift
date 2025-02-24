//
//  ContentView.swift
//  admob-swiftui-demo
//
//  Created by Arnaud SEPEROUMAL on 24/02/2025.
//

import SwiftUI
import GoogleMobileAds

enum AdvertType: String, CaseIterable {
    case banner
    case largeBanner
    case interstitial
    case interstitial2
}

struct ContentView: View {
    private var advert: [AdvertType] = AdvertType.allCases
        
    
    var body: some View {
        NavigationStack {
            ForEach(advert, id: \.self) { ad in
                NavigationLink(ad.rawValue, value: ad)
            }
            .navigationDestination(for: AdvertType.self) { advert in
                switch advert {
                case .banner:
                    AdMobBannerView(adKey: "ca-app-pub-3940256099942544/2934735716", size: .banner)
                case .largeBanner:
                    AdMobBannerView(adKey: "ca-app-pub-3940256099942544/2934735716", size: .largeBanner)
                case .interstitial:
                    InterstitialView()
                case .interstitial2:
                    Interstitial2View()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
