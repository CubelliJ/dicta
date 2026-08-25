import AVFoundation
import Foundation
import SwiftUI
import UniformTypeIdentifiers

@MainActor
final class DictaViewModel: ObservableObject {
    @Published var transcript = ""
    @Published var isRecording = false
    @Published var statusMessage = "Ready"

    private var recorder: AVAudioRecorder?

    func toggleRecording() {
        isRecording ? stopRecording() : startRecording()
    }

    private func startRecording() {
        AVCaptureDevice.requestAccess(for: .audio) { [weak self] allowed in
            Task { @MainActor in
                guard allowed else {
                    self?.statusMessage = "Microphone access is required"
                    return
                }
                self?.beginRecording()
            }
        }
    }

    private func beginRecording() {
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("dicta-live.m4a")
        let settings: [String: Any] = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 44100, AVNumberOfChannelsKey: 1]
        do {
            recorder = try AVAudioRecorder(url: url, settings: settings)
            recorder?.record()
            isRecording = true
            statusMessage = "Recording…"
        } catch {
            statusMessage = "Unable to start recording"
        }
    }

    private func stopRecording() {
        recorder?.stop()
        isRecording = false
        statusMessage = "Recording saved — transcription provider not configured"
    }

    func importRecording(_ result: Result<[URL], Error>) {
        switch result {
        case .success(let urls) where urls.first != nil:
            statusMessage = "Recording imported — ready to transcribe"
        case .failure:
            statusMessage = "Could not import recording"
        default:
            break
        }
    }
}
