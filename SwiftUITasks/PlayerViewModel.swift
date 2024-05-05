//
//  PlayerViewModel.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 02.05.2024.
//

import Foundation
import AVFoundation

final class PlayerViewModel: ObservableObject {
    @Published public var maxDuration: Float = 0.0
    private var player: AVAudioPlayer?
    private var musics: [Music] = [.init(image: "FirstLogo",
                                                artistName: "Twenty one pilots",
                                                musicName: "Stressed Out",
                                                artistImage: "Logo"),
                                          .init(image: "SecondLogo",
                                                artistName: "Twenty one pilots",
                                                musicName: "Heathens",
                                                artistImage: "Logo")]
    @Published var currentMusic: Music?

    public func play() {
        playSong(model: musics[0])
        player?.play()
    }

    public func stop() {
        player?.stop()
    }

    public func nextMusic() {
        playSong(model: musics[1])
        player?.play()
    }

    public func previousMusic() {
        play()
    }

    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }

    private func playSong(model: Music) {
        guard let audioPath = Bundle.main.path(forResource: model.musicName, ofType: "mp3") else { return }
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            currentMusic = model
            maxDuration = Float(player?.duration ?? 0.0)
        } catch {
            print(error.localizedDescription)
        }
    }

}
