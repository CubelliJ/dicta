import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @EnvironmentObject private var model: DictaViewModel
    @State private var showingImporter = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "waveform")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.tint)
                Text("Dicta").font(.headline)
                Spacer()
                Text(model.statusMessage)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                Button { showingImporter = true } label: {
                    Label("Import recording", systemImage: "plus")
                }
                .buttonStyle(.bordered)
            }
            .padding(20)
            Divider()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    if model.transcript.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "mic")
                                .font(.system(size: 34))
                                .foregroundStyle(.tint)
                            Text("Ready when you are")
                                .font(.title3.weight(.semibold))
                            Text("Record live audio or import an existing recording to get a transcript.")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.secondary)
                            Button(model.isRecording ? "Stop recording" : "Start recording") {
                                model.toggleRecording()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 70)
                    } else {
                        Text("Transcript")
                            .font(.title2.weight(.semibold))
                        Text(model.transcript)
                            .textSelection(.enabled)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                            .background(.quaternary.opacity(0.5), in: RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(28)
                .frame(maxWidth: 800)
                .frame(maxWidth: .infinity)
            }

            Divider()
            HStack {
                Label(model.isRecording ? "Recording live audio" : "Microphone ready", systemImage: model.isRecording ? "record.circle.fill" : "mic")
                    .foregroundStyle(model.isRecording ? .red : .secondary)
                Spacer()
                if model.isRecording {
                    Button("Stop") { model.toggleRecording() }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                }
            }
            .padding(16)
        }
        .fileImporter(isPresented: $showingImporter, allowedContentTypes: [.audio], allowsMultipleSelection: false) { result in
            model.importRecording(result)
        }
    }
}
