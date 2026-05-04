# nammaflutter.com

Official website for **Namma Flutter** — Chennai's largest Flutter developer community.

Built with [Jaspr](https://jaspr.site) in static mode: routes are pre-rendered to HTML at build time and deployed as a fully static site. Pure Dart, no Flutter SDK dependency, ships as a lightweight JS bundle.

---

## Pages

| Route | Description |
|---|---|
| `/` | Landing — hero, section previews, CTA |
| `/about` | Founding story, mission, stats |
| `/apps` | Open-source Flutter apps built by the community |
| `/programs` | Recurring programs — meetups, hackathons, workshops |
| `/programs/<slug>` | Per-program detail page (Fly with Flutter, Flut Hacks, Namma Devs, etc.) |
| `/events` | Past and upcoming events |
| `/team` | Founders and core team |
| `/store` | NammaStore (coming soon) |
| `/contact` | Socials, email, join CTA |

---

## Tech stack

| | |
|---|---|
| Framework | [Jaspr](https://jaspr.site) `^0.23` — static site generation |
| Language | Dart `3.11.5` |
| Routing | [jaspr_router](https://pub.dev/packages/jaspr_router) |
| Styling | CSS-in-Dart via Jaspr's `Styles` API |
| Hosting | GitHub Pages (auto-deployed on push to `master`) |

---

## Getting started

### Prerequisites

- Dart `3.11.5` on PATH
- Jaspr CLI: `dart pub global activate jaspr_cli`

### Install dependencies

```bash
dart pub get
```

### Run dev server

```bash
jaspr serve
# → http://localhost:8080
```

Hot reload is enabled by default. Edit any `.dart` file in `lib/` and the page refreshes automatically.

### Production build

```bash
jaspr build
# Output: build/jaspr/
```

Jaspr pre-renders every route to `build/jaspr/` — `index.html`, `team/index.html`, `about/index.html`, etc. Deploy the whole folder to any static host.

### Other commands

```bash
# Analyze (no errors expected)
dart analyze lib/

# Format (120-char line width)
dart format --line-length 120 lib/

# Regenerate build_runner outputs (after adding/removing @client pages)
dart run build_runner build --delete-conflicting-outputs
```

---

## Deployment

Pushes to `master` trigger GitHub Actions which builds the site and deploys to GitHub Pages automatically. The workflow:

1. Runs `jaspr build --verbose` — pre-renders all routes to `build/jaspr/`
2. Uploads `build/jaspr/` as the Pages artifact
3. Deploys via `actions/deploy-pages`

---

## Project structure

```
lib/
├── main.server.dart          # Server entrypoint — runApp(Document(...))
├── main.client.dart          # Client entrypoint — hydrates @client components
├── app.dart                  # Root App component — Router, Header, Footer
│
├── constants/
│   └── theme.dart            # Design tokens + global CSS
│
├── components/               # Shared UI components
│   ├── header.dart           # Sticky nav with mobile hamburger menu
│   ├── footer.dart           # Site footer
│   ├── section.dart          # Section wrapper with container
│   ├── card.dart             # NammaCard — title, description, tags
│   ├── button.dart           # Button.primary / .secondary / .ghost
│   ├── hero.dart             # Landing hero section
│   ├── cta_band.dart         # Full-width CTA strip
│   ├── college_ticker.dart   # Auto-scrolling colleges marquee
│   └── section_preview.dart  # Icon + title + link card (Home page)
│
├── data/                     # Content as const Dart lists
│   ├── apps.dart             # NammaApps
│   ├── programs.dart         # Community programs (with slug + type)
│   ├── podcast_episodes.dart # Namma Devs podcast episodes
│   ├── colleges.dart         # Colleges featured in the ticker
│   ├── events.dart           # Past + upcoming events
│   ├── team.dart             # Founders + core team
│   └── socials.dart          # Community URLs (GitHub, Telegram, etc.)
│
└── pages/                    # @client page components
    ├── home.dart
    ├── about.dart
    ├── apps.dart
    ├── programs.dart
    ├── program_detail.dart   # Per-program detail view (/programs/<slug>)
    ├── store.dart
    ├── events.dart
    ├── team.dart
    └── contact.dart
```

---

## Updating content

All content is stored as `const` Dart lists in `lib/data/`. No CMS, no API — just edit the file and restart the dev server.

| What to update | File |
|---|---|
| Add/edit an app | `lib/data/apps.dart` |
| Add/edit an event | `lib/data/events.dart` |
| Add/edit a team member | `lib/data/team.dart` |
| Add/edit a program | `lib/data/programs.dart` (set a unique `slug` — used in `/programs/<slug>` URL) |
| Add/edit a podcast episode | `lib/data/podcast_episodes.dart` |
| Add/edit a college on the ticker | `lib/data/colleges.dart` |
| Update social/community links | `lib/data/socials.dart` |

---

## Contributing

1. Fork the repo and create a feature branch off `master`.
2. Run `dart analyze lib/` — no errors expected.
3. Run `dart format --line-length 120 lib/` before committing.
4. Open a pull request against `master`.

---

## Community

| Platform | Link |
|---|---|
| Website | [nammaflutter.com](https://nammaflutter.com) |
| GitHub | [github.com/Namma-Flutter](https://github.com/Namma-Flutter) |
| Telegram | See `lib/data/socials.dart` |
| Twitter / X | @NammaFlutter |
