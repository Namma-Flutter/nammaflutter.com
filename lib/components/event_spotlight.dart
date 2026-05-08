import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/events.dart' as data;
import 'button.dart';

class EventSpotlight extends StatelessComponent {
  const EventSpotlight({super.key});

  @override
  Component build(BuildContext context) {
    final upcoming = data.events.where((e) => e.type == data.EventType.upcoming).toList();
    if (upcoming.isEmpty) return .fragment(const []);
    final event = upcoming.first;

    return div(classes: 'spotlight-wrap', [
      div(classes: 'container', [
        div(classes: 'spotlight-card', [
          div(classes: 'spotlight-meta', [
            span(classes: 'spotlight-tag', [.text('Upcoming event')]),
            span(classes: 'spotlight-date', [.text(event.date)]),
          ]),
          h2(classes: 'spotlight-title', [.text(event.title)]),
          p(classes: 'spotlight-venue', [.text('📍 ${event.venue}')]),
          if (event.description != null)
            p(classes: 'spotlight-desc', [.text(event.description!)]),
          div(classes: 'spotlight-cta', [
            Button.primary('Register →', event.link ?? '/events', external: event.link != null),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.spotlight-wrap').styles(
      padding: .symmetric(vertical: 64.px),
      backgroundColor: surfaceColor,
    ),
    css('.spotlight-card').styles(
      display: .flex,
      padding: .all(40.px),
      radius: .all(.circular(20.px)),
      flexDirection: .column,
      gap: .all(16.px),
      color: Colors.white,
      backgroundColor: darkSurface,
      raw: {
        'background-image':
            'linear-gradient(135deg, rgba(1, 88, 155, 0.45) 0%, rgba(255, 107, 53, 0.25) 100%)',
        'box-shadow': '0 24px 60px rgba(10, 22, 40, 0.25)',
      },
    ),
    css('.spotlight-meta').styles(
      display: .flex,
      flexDirection: .row,
      flexWrap: .wrap,
      alignItems: .center,
      gap: .all(12.px),
    ),
    css('.spotlight-tag').styles(
      padding: .symmetric(vertical: 4.px, horizontal: 12.px),
      radius: .all(.circular(999.px)),
      color: Colors.white,
      fontSize: 0.75.rem,
      fontWeight: .w700,
      letterSpacing: 1.px,
      backgroundColor: accentWarm,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.spotlight-date').styles(
      color: .rgba(255, 255, 255, 0.85),
      fontSize: 0.95.rem,
      fontWeight: .w600,
    ),
    css('.spotlight-title').styles(
      color: Colors.white,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 2.4.rem,
      fontWeight: .w700,
      letterSpacing: (-0.5).px,
      lineHeight: 1.15.em,
    ),
    css('.spotlight-venue').styles(
      margin: .zero,
      color: .rgba(255, 255, 255, 0.8),
      fontSize: 1.rem,
    ),
    css('.spotlight-desc').styles(
      maxWidth: 640.px,
      margin: .zero,
      color: .rgba(255, 255, 255, 0.7),
      fontSize: 0.95.rem,
      lineHeight: 1.7.em,
    ),
    css('.spotlight-cta').styles(margin: .only(top: 12.px)),
    css('.spotlight-card .btn-primary').styles(
      color: darkSurface,
      backgroundColor: Colors.white,
    ),
    css('.spotlight-card .btn-primary:hover').styles(
      color: Colors.white,
      backgroundColor: accentWarm,
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.spotlight-wrap').styles(padding: .symmetric(vertical: 40.px)),
      css('.spotlight-card').styles(padding: .all(28.px)),
      css('.spotlight-title').styles(fontSize: 1.6.rem),
    ]),
  ];
}
