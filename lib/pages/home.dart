import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/college_ticker.dart';
import '../components/cta_band.dart';
import '../components/hero.dart';
import '../components/section.dart';
import '../components/section_preview.dart';

@client
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return .fragment([
      const Hero(
        kicker: 'Flutter Community Events & Meetups',
        headline: 'Namma Flutter Chennai',
        subtext:
            'Chennai\'s premier Flutter community, building the future of mobile development. Join us for Flutter learning, hands-on workshops, and community networking. Whether you\'re a beginner or an expert, there\'s something for everyone!',
        primaryLabel: 'Join our Telegram',
        primaryHref: 'https://t.me/nammaflutter',
        primaryExternal: true,
        secondaryLabel: 'View Events',
        secondaryHref: 'https://lu.ma/Nammaflutter',
        secondaryExternal: true,
      ),
      const CollegeTicker(),
      Section(
        eyebrow: 'Everything we do',
        title: 'Explore Namma Flutter',
        subtitle: 'From beginner workshops to full-scale conferences — here\'s what we\'re about.',
        child: div(classes: 'previews-grid', [
          const SectionPreview(
            icon: '🧑‍💻',
            title: 'About Us',
            description: 'Our story, mission, and the people who started it all.',
            href: '/about',
          ),
          const SectionPreview(
            icon: '📱',
            title: 'Apps',
            description: 'Open-source Flutter apps built by the Namma community.',
            href: '/apps',
          ),
          const SectionPreview(
            icon: '🎓',
            title: 'Programs',
            description: 'Workshops, hackathons, and recurring programs for every level.',
            href: '/programs',
          ),
          const SectionPreview(
            icon: '🛍️',
            title: 'Store',
            description: 'Namma Flutter merch — coming soon.',
            href: '/store',
          ),
          const SectionPreview(
            icon: '📅',
            title: 'Events',
            description: 'Past and upcoming meetups, DevCons, and conferences.',
            href: '/events',
          ),
          const SectionPreview(
            icon: '👥',
            title: 'Team',
            description: 'Meet the organizers and speakers behind Namma Flutter.',
            href: '/team',
          ),
        ]),
        muted: true,
      ),
      const CtaBand(
        headline: 'Ready to be part of Chennai\'s Flutter community?',
        buttonLabel: 'Get in touch',
        buttonHref: '/contact',
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.previews-grid').styles(
      display: .grid,
      gap: .all(24.px),
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(280px, 1fr))'},
    ),
  ];
}
