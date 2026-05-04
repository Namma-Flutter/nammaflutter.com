class AppItem {
  final String name;
  final String tagline;
  final String description;
  final String repoUrl;
  final String? siteUrl;
  final List<String> tags;

  const AppItem({
    required this.name,
    required this.tagline,
    required this.description,
    required this.repoUrl,
    this.siteUrl,
    this.tags = const [],
  });
}

const apps = <AppItem>[
  AppItem(
    name: 'Namma Wallet',
    tagline: 'Open-source Flutter wallet',
    description:
        'A fully functional digital wallet app built with Flutter, showcasing real-world payment UX patterns and state management.',
    repoUrl: 'https://github.com/Namma-Flutter/namma_wallet',
    tags: ['Flutter', 'State Management'],
  ),
  AppItem(
    name: 'Flappy Dash',
    tagline: 'Flutter game in a weekend',
    description:
        'A Flappy Bird inspired game built at a Namma Flutter hackathon. Pure Flutter, no game engine — just canvas and physics.',
    repoUrl: 'https://github.com/Namma-Flutter/flappy_dash',
    tags: ['Flutter', 'Game', 'Canvas'],
  ),
  AppItem(
    name: 'Namma UI Kit',
    tagline: 'Community design system',
    description:
        'A growing library of production-ready Flutter widgets and design tokens used across Namma Flutter projects.',
    repoUrl: 'https://github.com/Namma-Flutter/namma_ui_kit',
    tags: ['Flutter', 'UI Kit', 'Design System'],
  ),
  AppItem(
    name: 'Dash Race',
    tagline: 'Fast-paced Flutter racing game',
    description:
        'A high-speed racing game featuring Dash, showcasing real-time gameplay and game loop mechanics built entirely with Flutter.',
    repoUrl: 'https://github.com/Namma-Flutter/dash_race',
    tags: ['Flutter', 'Game', 'Animation'],
  ),
];
