import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/programs.dart';
import 'section.dart';

class ProgramShowcase extends StatelessComponent {
  const ProgramShowcase({super.key});

  static const _flagshipSlugs = ['fly-with-flutter', 'flut-hacks', 'namma-devs'];

  @override
  Component build(BuildContext context) {
    final flagships = <Program>[
      for (final slug in _flagshipSlugs)
        if (programBySlug(slug) != null) programBySlug(slug)!,
    ];

    return Section(
      eyebrow: 'Flagship programs',
      title: 'What we run, all year round.',
      subtitle:
          'Three programs that anchor the community calendar. Plus workshops, roadshows, and more on the programs page.',
      muted: true,
      child: div(classes: 'showcase-grid', [
        for (final program in flagships)
          a(href: '/programs/${program.slug}', classes: 'showcase-card', [
            span(classes: 'showcase-icon', [.text(program.icon)]),
            div(classes: 'showcase-meta', [
              span(classes: 'showcase-type', [.text(program.type)]),
              span(classes: 'showcase-freq', [.text(program.frequency)]),
            ]),
            h3(classes: 'showcase-name', [.text(program.name)]),
            p(classes: 'showcase-desc', [.text(program.description)]),
            span(classes: 'showcase-link', [.text('Learn more →')]),
          ]),
      ]),
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.showcase-grid').styles(
      display: .grid,
      gap: .all(24.px),
      raw: {'grid-template-columns': 'repeat(3, 1fr)'},
    ),
    css('.showcase-card').styles(
      display: .flex,
      padding: .all(32.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(16.px)),
      transition: Transition('all', duration: 200.ms, curve: .easeOut),
      flexDirection: .column,
      gap: .all(12.px),
      color: textColor,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: surfaceColor,
    ),
    css('.showcase-card:hover').styles(
      border: .all(style: BorderStyle.solid, color: primaryColor, width: 1.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 12.px, blur: 32.px, color: .rgba(1, 88, 155, 0.15)),
      transform: .translate(x: 0.px, y: (-4).px),
    ),
    css('.showcase-icon').styles(
      fontSize: 2.8.rem,
      lineHeight: 1.em,
    ),
    css('.showcase-meta').styles(
      display: .flex,
      flexDirection: .row,
      flexWrap: .wrap,
      alignItems: .center,
      gap: .all(8.px),
    ),
    css('.showcase-type').styles(
      padding: .symmetric(vertical: 3.px, horizontal: 10.px),
      radius: .all(.circular(999.px)),
      color: primaryColor,
      fontSize: 0.7.rem,
      fontWeight: .w700,
      letterSpacing: 0.5.px,
      backgroundColor: Color('#E8F2FB'),
      raw: {'text-transform': 'uppercase'},
    ),
    css('.showcase-freq').styles(
      color: mutedTextColor,
      fontSize: 0.8.rem,
      fontWeight: .w500,
    ),
    css('.showcase-name').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 1.6.rem,
      fontWeight: .w700,
      letterSpacing: (-0.3).px,
    ),
    css('.showcase-desc').styles(
      flex: .grow(1),
      color: mutedTextColor,
      fontSize: 0.95.rem,
      lineHeight: 1.65.em,
    ),
    css('.showcase-link').styles(
      margin: .only(top: 8.px),
      color: primaryColor,
      fontSize: 0.9.rem,
      fontWeight: .w600,
    ),
    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.showcase-grid').styles(raw: {'grid-template-columns': '1fr'}),
    ]),
  ];
}
