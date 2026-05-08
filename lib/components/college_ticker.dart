import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/colleges.dart';

class CollegeTicker extends StatelessComponent {
  const CollegeTicker({super.key});

  @override
  Component build(BuildContext context) {
    // Duplicate the list for a seamless infinite loop (animate -50% of 2x list).
    final items = <Component>[];
    for (var pass = 0; pass < 2; pass++) {
      for (final college in flyWithFlutterColleges) {
        items.add(span(classes: 'college-pill', [.text(college)]));
      }
    }

    return div(classes: 'colleges-wrap', [
      div(classes: 'container', [
        div(classes: 'colleges-head', [
          p(classes: 'colleges-eyebrow', [.text('On the road')]),
          h2(classes: 'colleges-title', [.text('Colleges we\'ve been to.')]),
          p(classes: 'colleges-sub', [
            .text(
              'Hands-on Flutter sessions taken directly to campuses across Tamil Nadu through Fly with Flutter.',
            ),
          ]),
        ]),
      ]),
      div(classes: 'colleges-marquee', [
        div(classes: 'colleges-track', items),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('@keyframes colleges-scroll', [
      css('from').styles(raw: {'transform': 'translateX(0)'}),
      css('to').styles(raw: {'transform': 'translateX(-50%)'}),
    ]),
    css('.colleges-wrap').styles(
      padding: .only(top: 80.px, bottom: 32.px),
      backgroundColor: surfaceColor,
    ),
    css('.colleges-head').styles(
      display: .flex,
      margin: .only(bottom: 32.px),
      flexDirection: .column,
      alignItems: .center,
      gap: .all(8.px),
      textAlign: .center,
    ),
    css('.colleges-eyebrow').styles(
      margin: .zero,
      color: accentWarm,
      fontSize: 0.85.rem,
      fontWeight: .w700,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.colleges-title').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 2.2.rem,
      fontWeight: .w700,
      letterSpacing: (-0.5).px,
      lineHeight: 1.2.em,
    ),
    css('.colleges-sub').styles(
      maxWidth: 560.px,
      margin: .zero,
      color: mutedTextColor,
      fontSize: 1.rem,
      lineHeight: 1.6.em,
    ),
    css('.colleges-marquee').styles(
      display: .flex,
      padding: .symmetric(vertical: 24.px),
      alignItems: .center,
      backgroundColor: surfaceColor,
      raw: {
        'overflow': 'hidden',
        'mask-image':
            'linear-gradient(90deg, transparent 0, #000 80px, #000 calc(100% - 80px), transparent 100%)',
        '-webkit-mask-image':
            'linear-gradient(90deg, transparent 0, #000 80px, #000 calc(100% - 80px), transparent 100%)',
      },
    ),
    css('.colleges-track').styles(
      display: .flex,
      alignItems: .center,
      gap: .all(14.px),
      raw: {
        'width': 'max-content',
        'animation': 'colleges-scroll 50s linear infinite',
      },
    ),
    css('.colleges-track:hover').styles(raw: {'animation-play-state': 'paused'}),
    css('.college-pill').styles(
      padding: .symmetric(vertical: 10.px, horizontal: 20.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(999.px)),
      transition: Transition('all', duration: 180.ms, curve: .easeOut),
      color: textColor,
      fontSize: 0.95.rem,
      fontWeight: .w600,
      backgroundColor: surfaceMuted,
      raw: {'white-space': 'nowrap', 'flex-shrink': '0'},
    ),
    css('.college-pill:hover').styles(
      border: .all(style: BorderStyle.solid, color: primaryColor, width: 1.px),
      color: primaryColor,
      backgroundColor: Color('#E8F2FB'),
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.colleges-wrap').styles(padding: .only(top: 56.px, bottom: 24.px)),
      css('.colleges-title').styles(fontSize: 1.6.rem),
      css('.college-pill').styles(
        padding: .symmetric(vertical: 8.px, horizontal: 16.px),
        fontSize: 0.85.rem,
      ),
    ]),
  ];
}
