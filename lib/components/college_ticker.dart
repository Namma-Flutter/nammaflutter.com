import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/colleges.dart';

class CollegeTicker extends StatelessComponent {
  const CollegeTicker({super.key});

  @override
  Component build(BuildContext context) {
    // Duplicate items for a seamless infinite loop: animating -50% of 2× list = -100% of one pass
    final items = <Component>[];
    for (var pass = 0; pass < 2; pass++) {
      items.add(span(classes: 'ticker-lead', [.text('✈️ Fly with Flutter')]));
      items.add(span(classes: 'ticker-sep', [.text('·')]));
      for (final college in flyWithFlutterColleges) {
        items.add(span(classes: 'ticker-item', [.text(college)]));
        items.add(span(classes: 'ticker-sep', [.text('·')]));
      }
    }

    return div(classes: 'ticker-wrap', [
      div(classes: 'ticker-viewport', [
        div(classes: 'ticker-track', items),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('@keyframes ticker-scroll', [
      css('from').styles(raw: {'transform': 'translateX(0)'}),
      css('to').styles(raw: {'transform': 'translateX(-50%)'}),
    ]),
    css('.ticker-wrap').styles(
      display: .flex,
      padding: .symmetric(vertical: 14.px),
      alignItems: .center,
      backgroundColor: surfaceMuted,
      raw: {
        'border-top': '1px solid #E2E8F0',
        'border-bottom': '1px solid #E2E8F0',
        'overflow': 'hidden',
      },
    ),
    css('.ticker-viewport').styles(
      flex: Flex(grow: 1),
      raw: {'overflow': 'hidden'},
    ),
    css('.ticker-track').styles(
      display: .flex,
      alignItems: .center,
      gap: .all(0.px),
      raw: {
        'width': 'max-content',
        'animation': 'ticker-scroll 45s linear infinite',
      },
    ),
    css('.ticker-track:hover').styles(
      raw: {'animation-play-state': 'paused'},
    ),
    css('.ticker-lead').styles(
      padding: .symmetric(horizontal: 24.px),
      color: primaryColor,
      fontSize: 0.9.rem,
      fontWeight: .w700,
      raw: {'white-space': 'nowrap'},
    ),
    css('.ticker-item').styles(
      padding: .symmetric(horizontal: 16.px),
      color: textColor,
      fontSize: 0.88.rem,
      fontWeight: .w500,
      raw: {'white-space': 'nowrap'},
    ),
    css('.ticker-sep').styles(
      color: accentColor,
      fontSize: 0.75.rem,
      raw: {'flex-shrink': '0'},
    ),
  ];
}
