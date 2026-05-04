import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import 'button.dart';

class CtaBand extends StatelessComponent {
  final String headline;
  final String buttonLabel;
  final String buttonHref;

  const CtaBand({required this.headline, required this.buttonLabel, required this.buttonHref, super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'cta-band', [
      div(classes: 'container', [
        h2(classes: 'cta-band-headline', [.text(headline)]),
        Button.secondary(buttonLabel, buttonHref),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.cta-band').styles(
      padding: .symmetric(vertical: 64.px),
      backgroundColor: primaryColor,
    ),
    css('.cta-band .container').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      gap: .all(24.px),
      textAlign: .center,
    ),
    css('.cta-band-headline').styles(
      color: Colors.white,
      fontSize: 2.rem,
      fontWeight: .w700,
    ),
    css('.cta-band .btn-secondary').styles(
      border: .all(style: BorderStyle.solid, color: Colors.white, width: 2.px),
      color: Colors.white,
    ),
    css('.cta-band .btn-secondary:hover').styles(
      color: primaryColor,
      backgroundColor: Colors.white,
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.cta-band').styles(padding: .symmetric(vertical: 40.px)),
      css('.cta-band-headline').styles(fontSize: 1.5.rem),
    ]),
  ];
}
