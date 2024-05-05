//
//  ContentView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Constants

        private enum Constants {
            static let backButton = "BackButton"
            static let playButton = "PlayButton"
            static let stopButton = "StopButton"
            static let nextButton = "NextButton"
            static let saveButton = "SaveButton"
            static let shareButton = "ShareButton"
            static let titleAlert = "Поделиться"
        }

        @ObservedObject var playerViewModel = PlayerViewModel()
        var body: some View {
            GeometryReader{_ in
                VStack{
                    Spacer()
                        .frame(height: 61)
                    musicPicture
                    musicInfo
                    slider
                    playerControl
                }
            }.background(.appBackground)
        }

        @State private var progress: Float = 0
        var slider: some View {
            HStack{
                Slider(value: Binding(get: {
                    progress
                }, set: { newValue in
                    progress = newValue
                    playerViewModel.setTime(value: newValue)
                }), in: 0...playerViewModel.maxDuration)
                let roundedDuration = String(format: "%.2f", playerViewModel.maxDuration.rounded() / 60)
                let formattedDuration = roundedDuration.replacingOccurrences(of: ".", with: ":", options: .literal)
                
                Text(formattedDuration)
                
                
            }
                           .foregroundColor(.white)
                           .padding()
                       }

                       @State var isPlay = false
                       var playerControl: some View {
                           HStack{
                               Spacer()
                               Button(action: {
                                   playerViewModel.previousMusic()
                                   progress = 0
                               }, label: {
                                   Image(Constants.backButton)
                                       .frame(width: 66, height: 6)
                               })
                               Spacer()
                               Button(action: {
                                   !isPlay ? playerViewModel.play() : playerViewModel.stop()
                                   isPlay.toggle()
                               }, label: {
                                   Image(!isPlay ? Constants.playButton : Constants.stopButton)
                                       .frame(width: 60, height: 60)
                               })
                               Spacer()
                               Button(action: {
                                   playerViewModel.nextMusic()
                                   progress = 0
                               }, label: {
                                   Image(Constants.nextButton)
                                       .frame(width: 60, height: 60)
                               })
                               Spacer()
                                       }.tint(.white)
                                   }

                                   var musicPicture: some View {
                                       Image(playerViewModel.currentMusic?.image ?? "FirstLogo")
                                           .resizable()
                                           .frame(width: 280, height: 280)
                                           .cornerRadius(12)
                                   }

                                   @State private var actionSheetCall = false
                                   @State private var isAlert = false
                                   var musicInfo: some View {
                                       HStack{
                                           Image(playerViewModel.currentMusic?.artistImage ?? "Logo")
                                               .resizable()
                                               .frame(width: 60, height: 60)
                                               .clipShape(Circle())
                                           VStack{
                                               Text(playerViewModel.currentMusic?.musicName ?? "Stressed out")
                                                   .bold()
                                               Text(playerViewModel.currentMusic?.artistName ?? "Twenty one pilots")
                                           }
                                           Spacer()
                                           Button {
                                               actionSheetCall.toggle()
                                           } label: {
                                               Image(Constants.saveButton)
                                           }
                                           Button {
                                               isAlert.toggle()
                                           } label: {
                                                          Image(Constants.shareButton)
                                                      }
                                                  }
                                                  .foregroundColor(.white)
                                                  .padding()
                                                  .confirmationDialog("", isPresented: $actionSheetCall) {
                                                  } message: {
                                                      if let text = playerViewModel.currentMusic?.musicName {
                                                          Text("Трек \(text) сохранен в папку загрузки")
                                                      }
                                                  }
                                                  .alert(Constants.titleAlert, isPresented: $isAlert) {
                                                      Button("Да"){}
                                                      Button("Нет"){}
                                                  }
                                              }
}

#Preview {
    ContentView()
}
