import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import 'button.dart';
import 'namma_word.dart';

class Hero extends StatelessComponent {
  final String kicker;
  final String tagline;
  final String subtext;
  final String primaryLabel;
  final String primaryHref;
  final String secondaryLabel;
  final String secondaryHref;
  final bool primaryExternal;
  final bool secondaryExternal;

  const Hero({
    required this.kicker,
    required this.tagline,
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
          h1(classes: 'hero-headline', [
            const NammaWord(),
            .text(' Flutter'),
          ]),
          p(classes: 'hero-tagline', [.text(tagline)]),
          p(classes: 'hero-subtext', [.text(subtext)]),
          div(classes: 'hero-ctas', [
            Button.primary(primaryLabel, primaryHref, external: primaryExternal),
            Button.secondary(secondaryLabel, secondaryHref, external: secondaryExternal),
          ]),
        ]),
        div(classes: 'hero-logo', [
          img(src: 'images/hello-bubble.svg', classes: 'hero-greeting', attributes: {'alt': 'Hello!'}),
          img(src: 'images/logo.png', width: 380, attributes: {'alt': 'Namma Flutter mascot'}),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('@keyframes hero-float', [
      css('0%').styles(raw: {'transform': 'translateY(0)'}),
      css('50%').styles(raw: {'transform': 'translateY(-12px)'}),
      css('100%').styles(raw: {'transform': 'translateY(0)'}),
    ]),
    css('.hero').styles(
      display: .flex,
      padding: .symmetric(vertical: 24.px),
      alignItems: .center,
      backgroundColor: surfaceColor,
      raw: {
        'height': 'calc(100vh - 64px)',
        'max-height': 'calc(100dvh - 64px)',
        'min-height': '560px',
        'flex-shrink': '0',
        'background-image': 'url(images/kolam-bg.svg)',
        'background-repeat': 'repeat',
        'background-size': '160px 160px',
        'background-position': 'center',
        'overflow': 'hidden',
      },
    ),
    css('.hero .container').styles(
      display: .flex,
      width: 100.percent,
      flexDirection: .row,
      justifyContent: .spaceBetween,
      alignItems: .center,
      gap: .all(48.px),
      raw: {'position': 'relative'},
    ),
    css('.hero-content').styles(
      display: .flex,
      maxWidth: 620.px,
      flexDirection: .column,
      gap: .all(14.px),
    ),
    css('.hero-kicker').styles(
      margin: .zero,
      color: accentWarm,
      fontSize: 0.85.rem,
      fontWeight: .w700,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.hero-headline').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 4.5.rem,
      fontWeight: .w700,
      letterSpacing: (-1.5).px,
      lineHeight: 1.05.em,
    ),
    css('.hero-tagline').styles(
      margin: .zero,
      color: textColor,
      fontSize: 1.4.rem,
      fontWeight: .w600,
      lineHeight: 1.4.em,
    ),
    css('.hero-subtext').styles(
      maxWidth: 540.px,
      color: mutedTextColor,
      fontSize: 1.05.rem,
      lineHeight: 1.7.em,
    ),
    css('.hero-ctas').styles(
      display: .flex,
      margin: .only(top: 8.px),
      flexDirection: .row,
      flexWrap: .wrap,
      gap: .all(12.px),
    ),
    css('.hero-logo').styles(
      cursor: .pointer,
      raw: {
        'flex-shrink': '0',
        'position': 'relative',
        'z-index': '1',
        'animation': 'hero-float 5s ease-in-out infinite',
      },
    ),
    css('.hero-logo img').styles(
      raw: {'filter': 'drop-shadow(0 24px 32px rgba(1, 88, 155, 0.18))'},
    ),
    css('@keyframes hero-bubble-pop', [
      css('0%').styles(raw: {'transform': 'translate(0, 0) scale(0.6) rotate(-8deg)', 'opacity': '0'}),
      css('60%').styles(raw: {'transform': 'translate(0, -8px) scale(1.08) rotate(2deg)', 'opacity': '1'}),
      css('100%').styles(raw: {'transform': 'translate(0, -4px) scale(1) rotate(0deg)', 'opacity': '1'}),
    ]),
    css('.hero-greeting').styles(
      width: 180.px,
      transition: Transition('opacity', duration: 200.ms, curve: .easeOut),
      raw: {
        'height': 'auto',
        'position': 'absolute',
        'top': '-50px',
        'left': '-30px',
        'opacity': '0',
        'pointer-events': 'none',
        'transform-origin': 'bottom right',
        'image-rendering': 'pixelated',
        'z-index': '2',
        'filter': 'drop-shadow(0 6px 12px rgba(10, 22, 40, 0.18))',
      },
    ),
    css('.hero-logo:hover .hero-greeting').styles(
      raw: {
        'opacity': '1',
        'animation': 'hero-bubble-pop 0.4s cubic-bezier(0.34, 1.56, 0.64, 1) forwards',
      },
    ),
    css.media(MediaQuery.screen(maxWidth: 1100.px), [
      css('.hero-greeting').styles(
        width: 160.px,
        raw: {'top': '-45px', 'left': '-25px'},
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.hero-logo img').styles(width: 280.px),
      css('.hero-greeting').styles(
        width: 130.px,
        raw: {'top': '-35px', 'left': '-20px'},
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.hero').styles(
        padding: .symmetric(vertical: 24.px),
        raw: {'height': 'auto', 'min-height': 'calc(100dvh - 64px)'},
      ),
      css('.hero .container').styles(flexDirection: .column, gap: .all(24.px)),
      css('.hero-headline').styles(fontSize: 3.rem),
      css('.hero-tagline').styles(fontSize: 1.15.rem),
      css('.hero-logo').styles(display: .none),
    ]),
    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.hero-headline').styles(fontSize: 2.2.rem),
      css('.hero-tagline').styles(fontSize: 1.05.rem),
      css('.hero-subtext').styles(fontSize: 0.95.rem),
    ]),
  ];
}
