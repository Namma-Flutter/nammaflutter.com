import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/apps.dart';
import 'section.dart';

class AppsShowcase extends StatelessComponent {
  const AppsShowcase({super.key});

  static const _rotations = [-6, -2, 2, 6];

  @override
  Component build(BuildContext context) {
    final featured = apps.take(4).toList();

    return Section(
      eyebrow: 'Built by the community',
      title: 'Apps shipped from Namma Flutter.',
      subtitle:
          'Open-source Flutter projects born out of meetups, hackathons, and weekend builds. Browse the full catalog on the apps page.',
      child: .fragment([
        div(classes: 'apps-row', [
          for (var i = 0; i < featured.length; i++)
            a(
              href: featured[i].repoUrl,
              classes: 'app-tile',
              attributes: {
                'target': '_blank',
                'rel': 'noopener noreferrer',
                'style': 'transform: rotate(${_rotations[i % _rotations.length]}deg)',
              },
              [
                div(classes: 'app-tile-screen', [
                  span(classes: 'app-tile-glyph', [.text('📱')]),
                ]),
                div(classes: 'app-tile-meta', [
                  h3(classes: 'app-tile-name', [.text(featured[i].name)]),
                  p(classes: 'app-tile-tag', [.text(featured[i].tagline)]),
                ]),
              ],
            ),
        ]),
        div(classes: 'apps-cta', [
          a(href: '/apps', classes: 'apps-link', [.text('Explore all apps →')]),
        ]),
      ]),
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.apps-row').styles(
      display: .flex,
      padding: .symmetric(vertical: 40.px, horizontal: 16.px),
      flexDirection: .row,
      flexWrap: .wrap,
      justifyContent: .center,
      alignItems: .center,
      gap: .all(28.px),
    ),
    css('.app-tile').styles(
      display: .flex,
      width: 200.px,
      padding: .all(20.px),
      radius: .all(.circular(20.px)),
      transition: Transition('transform', duration: 250.ms, curve: .easeOut),
      flexDirection: .column,
      gap: .all(14.px),
      color: textColor,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: surfaceColor,
      raw: {
        'box-shadow': '0 18px 40px rgba(10, 22, 40, 0.12)',
        'border': '1px solid #E2E8F0',
      },
    ),
    css('.app-tile:hover').styles(
      raw: {'transform': 'rotate(0deg) translateY(-6px) !important'},
    ),
    css('.app-tile-screen').styles(
      display: .flex,
      height: 220.px,
      radius: .all(.circular(14.px)),
      justifyContent: .center,
      alignItems: .center,
      raw: {
        'background': 'linear-gradient(160deg, #01589B 0%, #13B9FD 100%)',
      },
    ),
    css('.app-tile-glyph').styles(
      fontSize: 4.rem,
      lineHeight: 1.em,
    ),
    css('.app-tile-meta').styles(
      display: .flex,
      flexDirection: .column,
      gap: .all(4.px),
    ),
    css('.app-tile-name').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 1.05.rem,
      fontWeight: .w700,
    ),
    css('.app-tile-tag').styles(
      margin: .zero,
      color: mutedTextColor,
      fontSize: 0.85.rem,
      lineHeight: 1.4.em,
    ),
    css('.apps-cta').styles(
      display: .flex,
      justifyContent: .center,
    ),
    css('.apps-link').styles(
      color: primaryColor,
      fontSize: 1.rem,
      fontWeight: .w600,
    ),
    css('.apps-link:hover').styles(color: primaryColorDark),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.apps-row').styles(gap: .all(20.px)),
      css('.app-tile').styles(width: 160.px, padding: .all(14.px)),
      css('.app-tile-screen').styles(height: 180.px),
    ]),
  ];
}
