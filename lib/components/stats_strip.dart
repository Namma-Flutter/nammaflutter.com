import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/apps.dart';
import '../data/colleges.dart';
import '../data/events.dart' as data;

class StatsStrip extends StatelessComponent {
  const StatsStrip({super.key});

  @override
  Component build(BuildContext context) {
    final stats = <({String value, String label})>[
      (value: '6,000+', label: 'Members'),
      (value: '${data.events.length}+', label: 'Events'),
      (value: '${flyWithFlutterColleges.length}+', label: 'Colleges reached'),
      (value: '${apps.length}', label: 'Apps shipped'),
    ];

    return div(classes: 'stats-strip', [
      div(classes: 'container', [
        div(classes: 'stats-row', [
          for (var i = 0; i < stats.length; i++)
            div(classes: 'stat', [
              span(classes: 'stat-value', [.text(stats[i].value)]),
              span(classes: 'stat-label', [.text(stats[i].label)]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.stats-strip').styles(
      padding: .symmetric(vertical: 56.px),
      backgroundColor: darkSurface,
      raw: {
        'background-image':
            'radial-gradient(ellipse at top left, rgba(19, 185, 253, 0.18) 0%, transparent 55%), '
            'radial-gradient(ellipse at bottom right, rgba(255, 107, 53, 0.14) 0%, transparent 55%)',
      },
    ),
    css('.stats-row').styles(
      display: .grid,
      gap: .all(0.px),
      raw: {'grid-template-columns': 'repeat(4, 1fr)'},
    ),
    css('.stat').styles(
      display: .flex,
      padding: .symmetric(vertical: 8.px, horizontal: 16.px),
      flexDirection: .column,
      alignItems: .center,
      gap: .all(8.px),
      textAlign: .center,
      raw: {'border-right': '1px solid rgba(255, 255, 255, 0.12)'},
    ),
    css('.stat:last-child').styles(raw: {'border-right': 'none'}),
    css('.stat-value').styles(
      color: Colors.white,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 3.2.rem,
      fontWeight: .w700,
      letterSpacing: (-1).px,
      lineHeight: 1.em,
      raw: {
        'background': 'linear-gradient(135deg, #FFFFFF 0%, #13B9FD 100%)',
        '-webkit-background-clip': 'text',
        'background-clip': 'text',
        '-webkit-text-fill-color': 'transparent',
      },
    ),
    css('.stat-label').styles(
      color: .rgba(255, 255, 255, 0.7),
      fontSize: 0.8.rem,
      fontWeight: .w600,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.stats-strip').styles(padding: .symmetric(vertical: 40.px)),
      css('.stats-row').styles(raw: {'grid-template-columns': 'repeat(2, 1fr)'}),
      css('.stat').styles(padding: .symmetric(vertical: 16.px, horizontal: 12.px)),
      css('.stat:nth-child(2)').styles(raw: {'border-right': 'none'}),
      css('.stat:nth-child(1), .stat:nth-child(2)').styles(
        raw: {'border-bottom': '1px solid rgba(255, 255, 255, 0.12)'},
      ),
      css('.stat-value').styles(fontSize: 2.4.rem),
    ]),
    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.stat-value').styles(fontSize: 2.rem),
      css('.stat-label').styles(fontSize: 0.7.rem),
    ]),
  ];
}
