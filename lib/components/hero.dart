import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import 'button.dart';

class Hero extends StatelessComponent {
  final String kicker;
  final String headline;
  final String subtext;
  final String primaryLabel;
  final String primaryHref;
  final String secondaryLabel;
  final String secondaryHref;
  final bool primaryExternal;
  final bool secondaryExternal;

  const Hero({
    required this.kicker,
    required this.headline,
    required this.subtext,
    required this.primaryLabel,
    required this.primaryHref,
    required this.secondaryLabel,
    required this.secondaryHref,
    this.primaryExternal = false,
    this.secondaryExternal = false,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'hero', [
      div(classes: 'container', [
        div(classes: 'hero-content', [
          p(classes: 'hero-kicker', [.text(kicker)]),
          h1(classes: 'hero-headline', [.text(headline)]),
          p(classes: 'hero-subtext', [.text(subtext)]),
          div(classes: 'hero-ctas', [
            Button.primary(primaryLabel, primaryHref, external: primaryExternal),
            Button.secondary(secondaryLabel, secondaryHref, external: secondaryExternal),
          ]),
        ]),
        div(classes: 'hero-logo', [
          img(src: 'images/logo.png', width: 280, attributes: {'alt': 'Namma Flutter mascot'}),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero').styles(
      padding: .symmetric(vertical: 96.px),
      backgroundColor: surfaceColor,
    ),
    css('.hero .container').styles(
      display: .flex,
      flexDirection: .row,
      justifyContent: .spaceBetween,
      alignItems: .center,
      gap: .all(48.px),
    ),
    css('.hero-content').styles(
      display: .flex,
      maxWidth: 580.px,
      flexDirection: .column,
      gap: .all(16.px),
    ),
    css('.hero-kicker').styles(
      margin: .zero,
      color: accentColor,
      fontSize: 0.9.rem,
      fontWeight: .w600,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.hero-headline').styles(
      color: textColor,
      fontSize: 3.5.rem,
      fontWeight: .w700,
      lineHeight: 1.1.em,
    ),
    css('.hero-subtext').styles(
      maxWidth: 520.px,
      color: mutedTextColor,
      fontSize: 1.15.rem,
      lineHeight: 1.7.em,
    ),
    css('.hero-ctas').styles(
      display: .flex,
      flexDirection: .row,
      flexWrap: .wrap,
      gap: .all(12.px),
    ),
    css('.hero-logo').styles(raw: {'flex-shrink': '0'}),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.hero').styles(padding: .symmetric(vertical: 64.px)),
      css('.hero .container').styles(flexDirection: .column, gap: .all(32.px)),
      css('.hero-headline').styles(fontSize: 2.2.rem),
      css('.hero-logo').styles(display: .none),
    ]),
    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.hero').styles(padding: .symmetric(vertical: 40.px)),
      css('.hero-headline').styles(fontSize: 1.8.rem),
      css('.hero-subtext').styles(fontSize: 1.rem),
    ]),
  ];
}
