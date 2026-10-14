# Agent instructions

For an ArmKeyKey release, follow the source repository's
[canonical release checklist](https://github.com/jr-everstar/ArmKeyKey/blob/main/Documentation/ReleaseChecklist.md)
(local sibling checkout: `../ArmKeyKey/Documentation/ReleaseChecklist.md`).

Update this tap only after the immutable GitHub Release PKG is publicly available
and its final signed/notarized bytes are verified. Set cask version to
`APP_VERSION,BUILD` and SHA-256 to the final stapled PKG's checksum. Review the
README, description, requirements, livecheck and installer caveats too.

Run style, info, online audit, livecheck and fetch against the actual edited
checkout. Publish through the user's authorized workflow, then verify the remote
tap and Homebrew download. Record the tap commit and results in the source
repository's release publication record. Local edits alone are not completion.

Preserve unrelated work. Do not overwrite release assets, commit credentials or
PKGs, or implicitly install, uninstall or log out the active user for validation.
