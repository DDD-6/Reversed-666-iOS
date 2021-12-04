//
//  BringTabView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/13.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct BringTabView: View {
    @State private var selection: Tab = .main
    @State var show = false
    
    let viewModel: TabViewModel
    
    init() {
        viewModel = TabViewModel(component: UserServiceManagerImpl())
    }
    
    enum Tab {
        case main
        case bookmark
        case my
    }
    
    var body: some View {
        ZStack {
            LottieView(name: "bring_splash", show: $show)
            // default Frame....
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .background(.black)
                .opacity(show ? 0 : 1)
            
            TabView(selection: $selection,
                    content:  {
                MainView()
                    .tabItem {
                        Image(selection == .main
                              ? "icTabHomeFill"
                              : "icTabHome")
                    }
                    .tag(Tab.main)
                
                BookmarkView()
                    .tabItem {
                        Image(selection == .bookmark
                              ? "icTabHeartFill"
                              : "icTabHeart")
                    }
                    .tag(Tab.bookmark)
                
                MypageView()
                    .tabItem {
                        Image(selection == .my
                              ? "icTabMyPageFill"
                              : "icTabMyPage")
                    }
                    .tag(Tab.my)
            })
                .opacity(show ? 1 : 0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BringTabView()
    }
}

