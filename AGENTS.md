# AGENTS.md

This file provides guidance to AI Agents when working with code in this repository.

## Project Overview

**nammaflutter.com** is the marketing website for Namma Flutter — Chennai's largest Flutter developer community. It is a pure Jaspr web app (no Flutter SDK dependency) with server-side rendering and client-side hydration.

- **Dart SDK**: 3.11.5
- **Jaspr mode**: `server` (no flutter embedding)

## Commands

```bash
# Development server with hot reload (port 8080)
jaspr serve

# Production build (output: build/jaspr/)
jaspr build

# Analyze (no errors expected)
dart analyze lib/

# Format (line width 120)
dart format --line-length 120 lib/

# Regenerate build_runner outputs after adding/removing @client pages
dart run build_runner build --delete-conflicting-outputs
```

## Architecture

### Dual-environment execution model

Jaspr runs code in two separate environments:

- **Server** (`main.server.dart`): Dart VM — shelf HTTP server, SSR via `serveApp`, port 8080.
- **Client** (`main.client.dart`): Compiled to JavaScript via `dart2js` — hydrates `@client` components in the browser.

Components annotated `@client` are compiled for **both** environments: pre-rendered on the server, re-mounted (hydrated) on the client. Components without `@client` are server-only.

### Routing

Routes are registered in `lib/app.dart` using `jaspr_router`. The `App` component is server-only. Each page is a `@client` component so it hydrates correctly on the client.

| Route | Page | Notes |
|---|---|---|
| `/` | `Home` | Hero + section previews + CTA band |
| `/about` | `About` | Founding story, stats, mission |
| `/apps` | `Apps` | NammaApps grid from `data/apps.dart` |
| `/programs` | `Programs` | Program list from `data/programs.dart` |
| `/store` | `Store` | Coming-soon placeholder |
| `/events` | `Events` | Past + upcoming from `data/events.dart` |
| `/team` | `Team` | Founders + core team from `data/team.dart` |
| `/contact` | `Contact` | Socials, email, join CTA |

### Key files

| File | Role |
|---|---|
| `lib/main.server.dart` | Server entrypoint — shelf router, `serveApp`, Document title/meta |
| `lib/main.client.dart` | Client entrypoint — initializes and hydrates `@client` components |
| `lib/app.dart` | Root `App` component — server-only, Router + Header + Footer |
| `lib/constants/theme.dart` | Design tokens (colors, typography) + global CSS via `@css` |
| `lib/components/header.dart` | Sticky nav header — server-rendered, 7-link nav, active-state detection via `context.url` |
| `lib/components/footer.dart` | Site footer — server-rendered, link columns, socials |
| `lib/components/section.dart` | `Section` wrapper — eyebrow/title/subtitle/child, max-width container, alternate backgrounds |
| `lib/components/card.dart` | `NammaCard` — title, description, tags, optional link |
| `lib/components/button.dart` | `Button.primary / .secondary / .ghost` — renders `<a>`, pill or rounded |
| `lib/components/hero.dart` | Landing hero — kicker, headline, subtext, two CTAs, logo |
| `lib/components/cta_band.dart` | `CtaBand` — full-width primary-color strip with CTA button |
| `lib/components/section_preview.dart` | `SectionPreview` — icon + title + desc + link, used on Home |
| `lib/data/apps.dart` | `AppItem` list — Namma Wallet, Flappy Dash, Dash Race, UI Kit |
| `lib/data/programs.dart` | `Program` list — Fly with Flutter, Beginner Workshop, Hackathons, etc. |
| `lib/data/events.dart` | `EventItem` list — past and upcoming events with dates/venues |
| `lib/data/team.dart` | `TeamMember` lists — `founders` and `coreTeam` |
| `lib/data/socials.dart` | `SocialLinks` constants — GitHub, Discord, Twitter, LinkedIn, Medium, email |

### CSS / styling

All CSS is written in Dart using Jaspr's type-safe `Styles` / `css()` DSL.

- Use the `@css` annotation on a `static List<StyleRule> get styles` getter inside each component.
- Nest rules using `css('selector', [css('&')...])` — the `&` refers to the parent selector.
- Use `.raw({'property': 'value'})` as the **last** named argument in `.styles()` for properties not covered by the typed API (e.g. `text-transform`, `grid-template-columns`, `scroll-behavior`).
- Media queries: `css.media(MediaQuery.screen(maxWidth: 768.px), [...])`
- Transitions: `Transition('all', duration: 200.ms, curve: .easeOut)`
- The analyzer plugin `jaspr_lints` enforces `prefer_html_components`, `sort_children_last`, and `styles_ordering`.

**Known API quirks in this Jaspr version:**

- `textTransform: .uppercase` is not available — use `raw: {'text-transform': 'uppercase'}` instead.
- `ListStyle(...)` is an enum, not a class — use `raw: {'list-style': 'none'}` instead.
- `jaspr/dom.dart` exports an `events` symbol that conflicts with `data/events.dart` — add `hide events` to the jaspr import: `import 'package:jaspr/dom.dart' hide events;`.

### Data layer

Content is stored as `const` Dart lists in `lib/data/`. Pages import and map over these lists — no database, no API calls. To update content, edit the data files directly.

`lib/data/socials.dart` is the single source of truth for all community URLs. Several values are marked `// TODO: confirm` and should be verified before launch.

### Generated files (do not edit)

- `lib/main.server.options.dart`
- `lib/main.client.options.dart`

Regenerated by `jaspr_builder` via `build_runner`. Run `dart run build_runner build --delete-conflicting-outputs` if they become stale (e.g., after adding new `@client` pages).

### API routes

Add custom server-side endpoints to the `shelf_router` in `main.server.dart` **before** the `serveApp` mount.
