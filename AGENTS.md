# Contributor Guidance

## Design principles

1. **Do incremental steps.** Make one focused change at a time, validate it, and only then continue.
2. **Use the Git workflow `feature/{branch} -> develop -> main`.** Every transition must happen through a pull request; do not merge directly between branches.
3. Keep Dicta lightweight, macOS-native, and keyboard-friendly.
4. Prefer clear states and useful error messages over hidden behavior.
5. Keep audio capture and transcription provider integrations loosely coupled.
6. Preserve user privacy: request microphone access only when needed and avoid unnecessary audio persistence.

## Validation

After meaningful edits, run the smallest relevant build or test command and report environment-specific limitations clearly.
