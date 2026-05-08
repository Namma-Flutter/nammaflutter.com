import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/sponsors.dart';

class SponsorsGrid extends StatelessComponent {
  const SponsorsGrid({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'sponsors-wrap', [
      div(classes: 'container', [
        div(classes: 'sponsors-stage', [
          div(classes: 'sponsors-tiles', [
            for (var i = 0; i < 12; i++) _tile(i),
          ]),
          div(classes: 'sponsors-center', [
            p(classes: 'sponsors-eyebrow', [.text('Our Sponsors')]),
            h2(classes: 'sponsors-title', [.text('Powered by partners who back the community.')]),
            p(classes: 'sponsors-sub', [
              .text(
                'Companies that fund venues, food, and gear so Namma Flutter stays free and open for every developer in Tamil Nadu.',
              ),
            ]),
            a(
              href: 'mailto:hello@nammaflutter.com',
              classes: 'sponsors-link',
              [.text('Become a sponsor →')],
            ),
          ]),
        ]),
      ]),
    ]);
  }

  Component _tile(int slot) {
    final sponsor = slot < sponsors.length ? sponsors[slot] : null;
    final classes = ['sponsor-tile', 'sponsor-slot-$slot', if (sponsor == null) 'sponsor-empty'].join(' ');

    final inner = sponsor == null
        ? span(classes: 'sponsor-placeholder', [])
        : (sponsor.logoUrl != null
              ? img(
                  src: sponsor.logoUrl!,
                  attributes: {'alt': sponsor.name, 'loading': 'lazy'},
                )
              : span(classes: 'sponsor-name', [.text(sponsor.name)]));

    if (sponsor?.websiteUrl != null) {
      return a(
        href: sponsor!.websiteUrl!,
        classes: classes,
        attributes: {'target': '_blank', 'rel': 'noopener noreferrer', 'aria-label': sponsor.name},
        [inner],
      );
    }
    return div(classes: classes, [inner]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.sponsors-wrap').styles(
      padding: .symmetric(vertical: 96.px),
      backgroundColor: surfaceMuted,
    ),
    css('.sponsors-stage').styles(
      raw: {'position': 'relative'},
    ),
    css('.sponsors-tiles').styles(
      display: .grid,
      gap: .all(16.px),
      raw: {
        'grid-template-columns': 'repeat(6, 1fr)',
        'grid-template-rows': 'repeat(4, 110px)',
      },
    ),
    css('.sponsor-tile').styles(
      display: .flex,
      padding: .all(16.px),
      radius: .all(.circular(16.px)),
      transition: Transition('all', duration: 200.ms, curve: .easeOut),
      justifyContent: .center,
      alignItems: .center,
      backgroundColor: surfaceColor,
      raw: {
        'box-shadow': '0 6px 18px rgba(10, 22, 40, 0.06)',
        'border': '1px solid #E2E8F0',
      },
    ),
    css('.sponsor-tile:hover').styles(
      transform: .translate(x: 0.px, y: (-3).px),
      raw: {'box-shadow': '0 14px 28px rgba(10, 22, 40, 0.12)'},
    ),
    css('.sponsor-tile img').styles(
      maxWidth: 80.percent,
      raw: {'max-height': '60%', 'object-fit': 'contain'},
    ),
    css('.sponsor-name').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 1.rem,
      fontWeight: .w700,
      textAlign: .center,
    ),
    css('.sponsor-empty').styles(
      backgroundColor: Color('#EDF2F7'),
      raw: {
        'border': '1px dashed #CBD5E0',
        'box-shadow': 'none',
      },
    ),
    css('.sponsor-empty:hover').styles(
      transform: .translate(x: 0.px, y: 0.px),
      raw: {'box-shadow': 'none'},
    ),
    css('.sponsor-placeholder').styles(
      display: .block,
      width: 28.px,
      height: 28.px,
      radius: .all(.circular(999.px)),
      backgroundColor: Color('#CBD5E0'),
      raw: {'opacity': '0.5'},
    ),

    // Asymmetric placement — leaves a hole in the middle for the centered content
    css('.sponsor-slot-0').styles(raw: {'grid-column': '1', 'grid-row': '1'}),
    css('.sponsor-slot-1').styles(raw: {'grid-column': '2', 'grid-row': '1 / span 2'}),
    css('.sponsor-slot-2').styles(raw: {'grid-column': '5', 'grid-row': '1 / span 2'}),
    css('.sponsor-slot-3').styles(raw: {'grid-column': '6', 'grid-row': '1'}),
    css('.sponsor-slot-4').styles(raw: {'grid-column': '1', 'grid-row': '2'}),
    css('.sponsor-slot-5').styles(raw: {'grid-column': '6', 'grid-row': '2'}),
    css('.sponsor-slot-6').styles(raw: {'grid-column': '1', 'grid-row': '3'}),
    css('.sponsor-slot-7').styles(raw: {'grid-column': '2', 'grid-row': '4'}),
    css('.sponsor-slot-8').styles(raw: {'grid-column': '5', 'grid-row': '4'}),
    css('.sponsor-slot-9').styles(raw: {'grid-column': '6', 'grid-row': '3'}),
    css('.sponsor-slot-10').styles(raw: {'grid-column': '1', 'grid-row': '4'}),
    css('.sponsor-slot-11').styles(raw: {'grid-column': '6', 'grid-row': '4'}),

    css('.sponsors-center').styles(
      display: .flex,
      width: 50.percent,
      maxWidth: 460.px,
      flexDirection: .column,
      alignItems: .center,
      gap: .all(12.px),
      textAlign: .center,
      raw: {
        'position': 'absolute',
        'top': '50%',
        'left': '50%',
        'transform': 'translate(-50%, -50%)',
        'pointer-events': 'none',
      },
    ),
    css('.sponsors-center a').styles(raw: {'pointer-events': 'auto'}),
    css('.sponsors-eyebrow').styles(
      margin: .zero,
      color: accentWarm,
      fontSize: 0.85.rem,
      fontWeight: .w700,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.sponsors-title').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 2.2.rem,
      fontWeight: .w700,
      letterSpacing: (-0.5).px,
      lineHeight: 1.15.em,
    ),
    css('.sponsors-sub').styles(
      margin: .zero,
      color: mutedTextColor,
      fontSize: 1.rem,
      lineHeight: 1.6.em,
    ),
    css('.sponsors-link').styles(
      margin: .only(top: 8.px),
      color: primaryColor,
      fontSize: 1.rem,
      fontWeight: .w600,
    ),
    css('.sponsors-link:hover').styles(color: primaryColorDark),

    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.sponsors-wrap').styles(padding: .symmetric(vertical: 56.px)),
      css('.sponsors-stage').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(32.px),
      ),
      css('.sponsors-tiles').styles(
        raw: {
          'grid-template-columns': 'repeat(3, 1fr)',
          'grid-template-rows': 'auto',
        },
      ),
      css('.sponsor-tile').styles(height: 90.px),
      css('.sponsor-slot-0, .sponsor-slot-1, .sponsor-slot-2, .sponsor-slot-3, '
              '.sponsor-slot-4, .sponsor-slot-5, .sponsor-slot-6, .sponsor-slot-7, '
              '.sponsor-slot-8, .sponsor-slot-9, .sponsor-slot-10, .sponsor-slot-11')
          .styles(raw: {'grid-column': 'auto', 'grid-row': 'auto'}),
      css('.sponsors-center').styles(
        width: 100.percent,
        maxWidth: 100.percent,
        raw: {
          'position': 'static',
          'transform': 'none',
          'pointer-events': 'auto',
        },
      ),
      css('.sponsors-title').styles(fontSize: 1.6.rem),
    ]),
  ];
}
