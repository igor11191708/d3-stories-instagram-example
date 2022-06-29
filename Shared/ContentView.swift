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

    @State var pause = false

    var body: some View {
        GeometryReader { _ in
            Color.white
            if show {
                StoriesWidget(
                    manager: StoriesManager.self,
                    stories: Stories.allCases,
                    pause: $pause
                )
            }

        }.overlay(btn, alignment: .bottom)
            .onChange(of: show){ if $0 == false { pause = false } }
    }

    var btn: some View {
        #if os(iOS)
            HStack {
                Button {
                    show.toggle()
                } label: {

                    Text(show ? "hide" : "show")
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .foregroundColor(.primary)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 15))
                        .padding(.top, 25)
                        .padding(.horizontal)
                }.padding(.bottom, 5)

                if show {

                    Button {
                        pause.toggle()
                    } label: {

                        Text(pause ? "resume" : "pause")
                            .font(.system(size: 17))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .foregroundColor(.primary)
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 15))
                            .padding(.top, 25)
                            .padding(.horizontal)
                    }.padding(.bottom, 5)
                }
            }
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
