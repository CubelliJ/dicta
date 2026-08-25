# Contributor Guidance

## Design principles

1. **Do incremental steps.** Make one focused change at a time, validate it, and only then continue.
2. Keep Dicta lightweight, macOS-native, and keyboard-friendly.
3. Prefer clear states and useful error messages over hidden behavior.
4. Keep audio capture and transcription provider integrations loosely coupled.
5. Preserve user privacy: request microphone access only when needed and avoid unnecessary audio persistence.

## Validation

After meaningful edits, run the smallest relevant build or test command and report environment-specific limitations clearly.
