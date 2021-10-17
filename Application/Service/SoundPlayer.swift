import AVFoundation

final class SoundPlayer: NSObject, AVAudioPlayerDelegate {
    static let shared = SoundPlayer()

    private var players: [URL : AVAudioPlayer] = [:]
    private var temporaryPlayers: [AVAudioPlayer] = []

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

    private override init() {}

    func play(sound: Sound) {
        let soundFileName = sound.fileName
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") else { return }

        if let player = players[url] {
            if !player.isPlaying {
                player.prepareToPlay()
                player.play()
            } else {
                do {
                    let temporaryPlayer = try AVAudioPlayer(contentsOf: url)
                    temporaryPlayer.delegate = self
                    temporaryPlayers.append(temporaryPlayer)
                    temporaryPlayer.prepareToPlay()
                    temporaryPlayer.play()
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        } else {
            do {
                let player = try AVAudioPlayer(contentsOf: url)
                players[url] = player
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

extension SoundPlayer: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
