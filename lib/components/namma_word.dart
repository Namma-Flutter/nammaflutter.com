import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class NammaWord extends StatelessComponent {
  const NammaWord({super.key});

  @override
  Component build(BuildContext context) {
    return span(
      classes: 'namma-word',
      attributes: {'aria-label': 'Namma'},
      [
        span(classes: 'namma-en', attributes: {'aria-hidden': 'true'}, [.text('Namma')]),
        span(classes: 'namma-ta', attributes: {'aria-hidden': 'true'}, [.text('நம்ம')]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.namma-word').styles(
      cursor: .pointer,
      raw: {
        'display': 'inline-grid',
        'vertical-align': 'baseline',
        'white-space': 'nowrap',
      },
    ),
    css('.namma-en, .namma-ta').styles(
      transition: Transition('opacity', duration: 250.ms, curve: .easeInOut),
      raw: {
        'grid-column': '1',
        'grid-row': '1',
      },
    ),
    css('.namma-en').styles(raw: {'opacity': '1', 'justify-self': 'start'}),
    css('.namma-ta').styles(
      fontFamily: const .list([tamilFontFamily, FontFamilies.sansSerif]),
      raw: {
        'opacity': '0',
        'justify-self': 'end',
        'transform': 'translateX(0.18em)',
      },
    ),
    css('.namma-word:hover .namma-en').styles(raw: {'opacity': '0'}),
    css('.namma-word:hover .namma-ta').styles(raw: {'opacity': '1'}),
  ];
}
