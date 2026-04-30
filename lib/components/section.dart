import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class Section extends StatelessComponent {
  final String? id;
  final String? eyebrow;
  final String? title;
  final String? subtitle;
  final Component child;
  final bool muted;

  const Section({
    required this.child,
    this.id,
    this.eyebrow,
    this.title,
    this.subtitle,
    this.muted = false,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    final attrs = id != null ? {'id': id!} : <String, String>{};
    return section(
      classes: muted ? 'section section-muted' : 'section',
      attributes: attrs,
      [
        div(classes: 'container', [
          if (eyebrow != null) p(classes: 'section-eyebrow', [.text(eyebrow!)]),
          if (title != null) h2(classes: 'section-title', [.text(title!)]),
          if (subtitle != null) p(classes: 'section-subtitle', [.text(subtitle!)]),
          child,
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.section').styles(
      padding: .symmetric(vertical: 80.px),
      width: 100.percent,
      flex: Flex(grow: 1),
      display: .flex,
      flexDirection: .column,
    ),
    css('.section-muted').styles(backgroundColor: surfaceMuted),
    css('.container').styles(
      maxWidth: 1120.px,
      margin: .symmetric(horizontal: .auto),
      padding: .symmetric(horizontal: 24.px),
    ),
    css('.section-eyebrow').styles(
      color: accentColor,
      fontWeight: .w600,
      fontSize: 0.85.rem,
      letterSpacing: 1.5.px,
      margin: .only(bottom: 8.px),
      raw: {'text-transform': 'uppercase'},
    ),
    css('.section-title').styles(
      fontSize: 2.rem,
      fontWeight: .w700,
      color: textColor,
      margin: .only(bottom: 12.px),
    ),
    css('.section-subtitle').styles(
      fontSize: 1.1.rem,
      color: mutedTextColor,
      maxWidth: 600.px,
      margin: .only(bottom: 40.px),
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.section').styles(padding: .symmetric(vertical: 48.px)),
      css('.container').styles(padding: .symmetric(horizontal: 16.px)),
      css('.section-title').styles(fontSize: 1.6.rem),
      css('.section-subtitle').styles(
        fontSize: 1.rem,
        margin: .only(bottom: 28.px),
      ),
    ]),
  ];
}
