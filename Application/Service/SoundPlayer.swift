import AVFoundation

class SoundPlayer: NSObject, AVAudioPlayerDelegate {
    static let sharedInstance = SoundPlayer()
    var players: [URL: AVAudioPlayer] = [:]
    var temporaryPlayers: [AVAudioPlayer] = []

    enum Sound: String {
        case topPlayerCorrectAnswer = "top_player_correct_answer"
        case topPlayerIncorrectAnswer = "top_player_incorrect_answer"
        case bottomPlayerCorrectAnswer = "bottom_player_correct_answer"
        case bottomPlayerIncorrectAnswer = "bottom_player_incorrect_answer"
        case emptySound = "empty_sound"

        var fileName: String {
            return self.rawValue
        }
    }
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
