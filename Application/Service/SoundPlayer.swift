import AVFoundation

final class SoundPlayer: NSObject, AVAudioPlayerDelegate {
    static var shared: SoundPlayer = {
        let instance = SoundPlayer()
        return instance
    }()

    enum Sound: String {
        case topPlayerCorrectAnswer = "top_player_correct_answer"
        case topPlayerIncorrectAnswer = "top_player_incorrect_answer"
        case bottomPlayerCorrectAnswer = "bottom_player_correct_answer"
        case bottomPlayerIncorrectAnswer = "bottom_player_incorrect_answer"
        case emptySound = "empty_sound"
        case roundWon = "round_won"

        var fileName: String {
            return self.rawValue
        }
    }

    var players: [URL: AVAudioPlayer] = [:]
    var temporaryPlayers: [AVAudioPlayer] = []

    private override init() { }

    func play(sound: Sound) {
        guard let soundFileNameURL = Bundle.main.url(forResource: sound.fileName, withExtension: "mp3") else { return }

        if let player = players[soundFileNameURL] {
            if !player.isPlaying {
                player.play()
            } else {
                guard let temporaryPlayer = try? AVAudioPlayer(contentsOf: soundFileNameURL) else { return }
                temporaryPlayer.delegate = self
                temporaryPlayers.append(temporaryPlayer)
                temporaryPlayer.prepareToPlay()
                temporaryPlayer.play()
            }
        } else {
            guard let player = try? AVAudioPlayer(contentsOf: soundFileNameURL) else { return }
            players[soundFileNameURL] = player
            player.play()
        }
    }
}

extension SoundPlayer: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
