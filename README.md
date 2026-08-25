# Dicta

A lightweight macOS-native speech-to-text interface for live audio and existing recordings.

## Goals

- Capture live microphone audio with a clear start/stop workflow.
- Transcribe existing recordings without leaving the app.
- Keep the interface native, focused, and keyboard-friendly.
- Make transcription state and errors easy to understand.

## Requirements

- macOS 13 or later
- Xcode 15 or later
- Swift 5.9 or later

## Development

Open this package in Xcode and run the **Dicta** scheme. Microphone access is requested only when recording starts. Add a transcription provider to `DictaViewModel` when connecting a speech-to-text backend.

## License

MIT
