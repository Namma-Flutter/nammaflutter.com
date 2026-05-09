import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

const _storeUrl = ' store.nammaflutter.com ';

@client
class Store extends StatelessComponent {
  const Store({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'store-page', [
      div(classes: 'store-content', [
        div(classes: 'store-eyebrow', [
          span(classes: 'store-dot', []),
          span(classes: 'store-eyebrow-text', [.text('Live now · NammaStore')]),
        ]),
        h1(classes: 'store-headline', [
          span(classes: 'store-headline-line', [.text('Wear the')]),
          span(classes: 'store-headline-line store-headline-accent', [.text('community.')]),
        ]),
        p(classes: 'store-subtext', [
          .text(
            'Tees, hoodies, stickers, and more from the Namma Flutter shop. Made for Flutter folks across Tamil Nadu and beyond.',
          ),
        ]),
        a(
          href: _storeUrl,
          classes: 'store-cta',
          attributes: const {'target': '_blank', 'rel': 'noopener noreferrer'},
          [
            span([.text('Shop the drop')]),
            span(classes: 'store-cta-arrow', [.text('→')]),
          ],
        ),
        p(classes: 'store-footnote', [
          .text('Ships across India · Limited drops · New designs every season'),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('@keyframes store-dot-pulse', [
      css('0%').styles(raw: {'transform': 'scale(1)', 'opacity': '0.9'}),
      css('70%').styles(raw: {'transform': 'scale(2.4)', 'opacity': '0'}),
      css('100%').styles(raw: {'transform': 'scale(1)', 'opacity': '0'}),
    ]),
    css('.store-page').styles(
      display: .flex,
      padding: .symmetric(vertical: 32.px, horizontal: 24.px),
      justifyContent: .center,
      alignItems: .center,
      color: textColor,
      backgroundColor: surfaceColor,
      raw: {
        'height': 'calc(100dvh - 64px)',
        'min-height': '560px',
        'flex-shrink': '0',
        'background-image': 'url(images/merch-bg.svg)',
        'background-repeat': 'repeat',
        'background-size': '280px 280px',
        'background-position': 'center',
        'overflow': 'hidden',
      },
    ),
    css('.store-content').styles(
      display: .flex,
      maxWidth: 720.px,
      flexDirection: .column,
      alignItems: .center,
      gap: .all(20.px),
      textAlign: .center,
    ),
    css('.store-eyebrow').styles(
      display: .inlineFlex,
      padding: .symmetric(vertical: 7.px, horizontal: 14.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(999.px)),
      alignItems: .center,
      gap: .all(10.px),
      backgroundColor: surfaceColor,
      raw: {'box-shadow': '0 4px 12px rgba(10, 22, 40, 0.05)'},
    ),
    css('.store-dot').styles(
      display: .inlineBlock,
      width: 8.px,
      height: 8.px,
      radius: .all(.circular(999.px)),
      backgroundColor: Color('#22C55E'),
      raw: {'position': 'relative'},
    ),
    css('.store-dot::after').styles(
      display: .inlineBlock,
      width: 8.px,
      height: 8.px,
      radius: .all(.circular(999.px)),
      backgroundColor: Color('#22C55E'),
      raw: {
        'content': '""',
        'position': 'absolute',
        'top': '0',
        'left': '0',
        'animation': 'store-dot-pulse 2s ease-out infinite',
      },
    ),
    css('.store-eyebrow-text').styles(
      color: textColor,
      fontSize: 0.78.rem,
      fontWeight: .w600,
      letterSpacing: 0.4.px,
    ),
    css('.store-headline').styles(
      display: .flex,
      margin: .zero,
      flexDirection: .column,
      gap: .all(0.px),
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 5.6.rem,
      fontWeight: .w700,
      letterSpacing: (-2).px,
      lineHeight: 0.95.em,
    ),
    css('.store-headline-line').styles(display: .block),
    css('.store-headline-accent').styles(
      raw: {
        'background': 'linear-gradient(135deg, #FF6B35 0%, #FF9670 100%)',
        '-webkit-background-clip': 'text',
        'background-clip': 'text',
        '-webkit-text-fill-color': 'transparent',
      },
    ),
    css('.store-subtext').styles(
      maxWidth: 580.px,
      margin: .zero,
      color: mutedTextColor,
      fontSize: 1.05.rem,
      lineHeight: 1.6.em,
    ),
    css('.store-cta').styles(
      display: .inlineFlex,
      margin: .only(top: 8.px),
      padding: .symmetric(vertical: 16.px, horizontal: 32.px),
      radius: .all(.circular(999.px)),
      transition: Transition('all', duration: 240.ms, curve: .easeOut),
      alignItems: .center,
      gap: .all(12.px),
      color: Colors.white,
      fontSize: 1.05.rem,
      fontWeight: .w700,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: accentWarm,
      raw: {
        'box-shadow': '0 14px 32px rgba(255, 107, 53, 0.30)',
        'letter-spacing': '0.2px',
      },
    ),
    css('.store-cta:hover').styles(
      transform: .translate(x: 0.px, y: (-3).px),
      backgroundColor: Color('#FF7E4D'),
      raw: {'box-shadow': '0 20px 44px rgba(255, 107, 53, 0.42)'},
    ),
    css('.store-cta-arrow').styles(
      display: .inlineBlock,
      transition: Transition('transform', duration: 220.ms, curve: .easeOut),
      fontSize: 1.2.rem,
    ),
    css('.store-cta:hover .store-cta-arrow').styles(raw: {'transform': 'translateX(4px)'}),
    css('.store-footnote').styles(
      margin: .only(top: 4.px),
      color: mutedTextColor,
      fontSize: 0.82.rem,
      letterSpacing: 0.4.px,
    ),
    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.store-headline').styles(fontSize: 4.rem, letterSpacing: (-1.5).px),
      css('.store-subtext').styles(fontSize: 0.98.rem),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.store-page').styles(
        padding: .symmetric(vertical: 24.px, horizontal: 16.px),
        raw: {'height': 'auto', 'min-height': 'calc(100dvh - 64px)'},
      ),
      css('.store-content').styles(gap: .all(16.px)),
      css('.store-headline').styles(fontSize: 2.8.rem, letterSpacing: (-1).px),
      css('.store-subtext').styles(fontSize: 0.92.rem),
      css('.store-cta').styles(
        padding: .symmetric(vertical: 14.px, horizontal: 26.px),
        fontSize: 1.rem,
      ),
      css('.store-footnote').styles(fontSize: 0.75.rem),
    ]),
  ];
}
