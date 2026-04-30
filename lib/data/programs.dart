class Program {
  final String slug;
  final String name;
  final String type;
  final String frequency;
  final String description;
  final String icon;

  const Program({
    required this.slug,
    required this.name,
    required this.type,
    required this.frequency,
    required this.description,
    required this.icon,
  });
}

const programs = <Program>[
  Program(
    slug: 'fly-with-flutter',
    name: 'Fly with Flutter',
    type: 'Education',
    frequency: 'Quarterly',
    description:
        'Taking Flutter directly to colleges and schools. Hands-on sessions that spark the next generation of mobile developers before they even graduate.',
    icon: '🚀',
  ),
  Program(
    slug: 'flut-hacks',
    name: 'Flut Hacks',
    type: 'Hackathon',
    frequency: 'Quarterly',
    description:
        '48 hours. One theme. Build something real. Our hackathon challenges teams to ship a complete Flutter app from scratch, under pressure.',
    icon: '⚡',
  ),
  Program(
    slug: 'namma-workshops',
    name: 'Namma Workshops',
    type: 'Workshop',
    frequency: 'Bi-monthly',
    description:
        'Deep-dive technical sessions on specific Flutter topics: state management, animations, architecture, and more. Smaller groups, focused practice.',
    icon: '🛠️',
  ),
  Program(
    slug: 'namma-devs',
    name: 'Namma Devs',
    type: 'Podcast',
    frequency: 'Bi-monthly',
    description:
        'The unofficial Flutter podcast from Chennai. Developer stories, framework deep-dives, and community conversations, recorded and shared openly.',
    icon: '🎙️',
  ),
  Program(
    slug: 'devrooms',
    name: 'DevRooms',
    type: 'Community',
    frequency: 'Monthly',
    description:
        'Casual, round-table Flutter discussions. No slides, no pressure. A space to talk through problems, explore ideas, and learn from each other.',
    icon: '💬',
  ),
  Program(
    slug: 'namma-flutteristas',
    name: 'Namma Flutteristas',
    type: 'Inclusion',
    frequency: 'Half-yearly',
    description:
        'Dedicated events celebrating women building with Flutter. A welcoming space for talks, networking, and amplifying underrepresented voices in the community.',
    icon: '💜',
  ),
  Program(
    slug: 'namma-flutter-roadshow',
    name: 'Namma Flutter RoadShow',
    type: 'Roadshow',
    frequency: 'Monthly',
    description:
        'Namma Flutter on the move. Taking events beyond Chennai to bring the community to developers across Tamil Nadu and beyond.',
    icon: '🗺️',
  ),
];

Program? programBySlug(String slug) {
  for (final p in programs) {
    if (p.slug == slug) return p;
  }
  return null;
}
