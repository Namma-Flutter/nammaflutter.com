import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/cta_band.dart';
import '../components/section.dart';
import '../constants/theme.dart';

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
              'In 2024, Justin Benito and Harish — inspired by the Flutter India community — organised the first Namma Flutter meetup in Chennai. '
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
      maxWidth: 720.px,
      flexDirection: .column,
      gap: .all(16.px),
    ),
    css('.about-story p').styles(color: mutedTextColor, fontSize: 1.05.rem, lineHeight: 1.75.em),
    css('.stats-band').styles(
      padding: .symmetric(vertical: 48.px),
      backgroundColor: primaryColor,
    ),
    css('.stats-grid').styles(
      display: .grid,
      gap: .all(24.px),
      textAlign: .center,
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(160px, 1fr))'},
    ),
    css('.stat-item').styles(display: .flex, flexDirection: .column, gap: .all(4.px)),
    css('.stat-value').styles(
      margin: .zero,
      color: Colors.white,
      fontSize: 2.5.rem,
      fontWeight: .w700,
    ),
    css('.stat-label').styles(
      margin: .zero,
      color: .rgba(255, 255, 255, 0.75),
      fontSize: 0.9.rem,
    ),
    css('.about-pillars').styles(
      display: .grid,
      gap: .all(24.px),
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(240px, 1fr))'},
    ),
    css('.about-pillar').styles(
      display: .flex,
      padding: .all(24.px),
      radius: .all(.circular(12.px)),
      flexDirection: .column,
      gap: .all(10.px),
      backgroundColor: surfaceColor,
    ),
    css('.pillar-icon').styles(fontSize: 1.8.rem),
    css('.pillar-title').styles(color: textColor, fontSize: 1.rem, fontWeight: .w700),
    css('.pillar-body').styles(color: mutedTextColor, fontSize: 0.9.rem, lineHeight: 1.6.em),
    css.media(MediaQuery.screen(maxWidth: 640.px), [
      css('.stats-band').styles(padding: .symmetric(vertical: 32.px)),
      css('.stat-value').styles(fontSize: 1.75.rem),
      css('.about-pillars').styles(raw: {'grid-template-columns': '1fr'}),
    ]),
  ];
}
