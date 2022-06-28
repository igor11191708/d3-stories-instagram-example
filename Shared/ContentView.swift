//
//  ContentView.swift
//  Shared
//
//  Created by Igor Shelopaev on 28.06.2022.
//

import SwiftUI
import d3_stories_instagram

struct ContentView: View {

    @State var show = true

    var body: some View {
        GeometryReader { _ in
            Color.white
            if show {
                StoriesView(
                    manager: StoriesManager.self,
                    stories: Stories.allCases,
                    leeway: .seconds(1)
                )
            }

        }.overlay(btn, alignment: .bottom)
    }

    var btn: some View {
        #if os(iOS)
            Button {
                show.toggle()
            } label: {

                Text(show ? "Hide stories" : "Show stories")
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .foregroundColor(.primary)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 15))
                    .padding(.top, 25)
                    .padding(.horizontal)
            }.padding(.bottom, 5)
        #else
            EmptyView()
        #endif

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
