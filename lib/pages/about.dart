import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/cta_band.dart';
import '../components/section.dart';
import '../constants/theme.dart';
import '../data/sponsors.dart';

@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return .fragment([
      Section(
        eyebrow: 'Our story',
        title: 'Born in Chennai, built for everyone.',
        subtitle:
            'Chennai\'s premier Flutter community, building the future of mobile development. Whether you\'re a beginner or an expert, there\'s something for everyone.',
        child: div(classes: 'about-story', [
          p([
            .text(
              'In 2024, Justin Benito and Harish — inspired by the Flutter India community and mentors like Abhishek Doshi — organised the first Namma Flutter meetup in Chennai. '
              'What started as a small gathering quickly grew into a movement.',
            ),
          ]),
          p([
            .text(
              '"Namma" means "ours" in Tamil. That\'s the spirit behind everything we do — this community belongs to everyone in it. '
              'Join us for Flutter learning, hands-on workshops, and community networking.',
            ),
          ]),
        ]),
      ),
      div(classes: 'stats-band', [
        div(classes: 'container', [
          div(classes: 'stats-grid', [
            _stat('6,000+', 'Community Members'),
            _stat('30+', 'Speakers'),
            _stat('12+', 'Workshops'),
          ]),
        ]),
      ]),
      Section(
        eyebrow: 'What we do',
        title: 'More than meetups.',
        muted: true,
        child: div(classes: 'about-pillars', [
          _pillar(
            '🤝',
            'Networking',
            'Opportunities to network with thousands of Flutter enthusiasts across Chennai and beyond.',
          ),
          _pillar('🎤', 'Talks', 'Regular sessions led by experienced community members and industry speakers.'),
          _pillar('🛠️', 'Workshops & Meetups', 'Hands-on workshops and hackathons where you build real Flutter apps.'),
          _pillar('📖', 'Knowledge Resources', 'Access to curated tutorials, open-source code, and recorded sessions.'),
        ]),
      ),
      Section(
        eyebrow: 'Our sponsors',
        title: 'Backed by great companies.',
        subtitle: 'These organisations make our events and programs possible.',
        child: div(classes: 'sponsors-grid', [
          for (final s in sponsors)
            div(classes: 'sponsor-card', [
              p(classes: 'sponsor-name', [.text(s.name)]),
            ]),
        ]),
      ),
      Section(
        eyebrow: 'Where we are now',
        title: 'Growing beyond Chennai.',
        subtitle:
            'As of 2026, Namma Flutter has expanded to Madurai and collaborates regularly with FOSS United. DevCon is now an annual flagship event drawing 200+ attendees.',
        muted: true,
        child: .empty(),
      ),
      const CtaBand(
        headline: 'Want to get involved? Come say hi.',
        buttonLabel: 'Contact us',
        buttonHref: '/contact',
      ),
    ]);
  }

  static Component _stat(String value, String label) => div(classes: 'stat-item', [
    p(classes: 'stat-value', [.text(value)]),
    p(classes: 'stat-label', [.text(label)]),
  ]);

  static Component _pillar(String icon, String title, String body) => div(classes: 'about-pillar', [
    span(classes: 'pillar-icon', [.text(icon)]),
    h3(classes: 'pillar-title', [.text(title)]),
    p(classes: 'pillar-body', [.text(body)]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.about-story').styles(
      display: .flex,
      flexDirection: .column,
      gap: .all(16.px),
      maxWidth: 720.px,
    ),
    css('.about-story p').styles(fontSize: 1.05.rem, color: mutedTextColor, lineHeight: 1.75.em),
    css('.stats-band').styles(
      backgroundColor: primaryColor,
      padding: .symmetric(vertical: 48.px),
    ),
    css('.stats-grid').styles(
      display: .grid,
      gap: .all(24.px),
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(160px, 1fr))'},
      textAlign: .center,
    ),
    css('.stat-item').styles(display: .flex, flexDirection: .column, gap: .all(4.px)),
    css('.stat-value').styles(
      fontSize: 2.5.rem,
      fontWeight: .w700,
      color: Colors.white,
      margin: .zero,
    ),
    css('.stat-label').styles(
      fontSize: 0.9.rem,
      color: .rgba(255, 255, 255, 0.75),
      margin: .zero,
    ),
    css('.about-pillars').styles(
      display: .grid,
      gap: .all(24.px),
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(240px, 1fr))'},
    ),
    css('.about-pillar').styles(
      display: .flex,
      flexDirection: .column,
      gap: .all(10.px),
      padding: .all(24.px),
      backgroundColor: surfaceColor,
      radius: .all(.circular(12.px)),
    ),
    css('.pillar-icon').styles(fontSize: 1.8.rem),
    css('.pillar-title').styles(fontSize: 1.rem, fontWeight: .w700, color: textColor),
    css('.pillar-body').styles(fontSize: 0.9.rem, color: mutedTextColor, lineHeight: 1.6.em),
    css('.sponsors-grid').styles(
      display: .grid,
      gap: .all(16.px),
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(180px, 1fr))'},
    ),
    css('.sponsor-card').styles(
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
      padding: .symmetric(vertical: 24.px, horizontal: 20.px),
      backgroundColor: surfaceMuted,
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(10.px)),
      minHeight: 80.px,
    ),
    css('.sponsor-name').styles(
      fontSize: 1.rem,
      fontWeight: .w600,
      color: mutedTextColor,
      textAlign: .center,
      margin: .zero,
    ),
    css.media(MediaQuery.screen(maxWidth: 640.px), [
      css('.stats-band').styles(padding: .symmetric(vertical: 32.px)),
      css('.stats-grid').styles(raw: {'grid-template-columns': 'repeat(3, 1fr)'}),
      css('.stat-value').styles(fontSize: 1.75.rem),
      css('.about-pillars').styles(raw: {'grid-template-columns': '1fr'}),
      css('.sponsors-grid').styles(raw: {'grid-template-columns': '1fr'}),
    ]),
  ];
}
