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
      display: .flex,
      width: 100.percent,
      padding: .symmetric(vertical: 80.px),
      flexDirection: .column,
      flex: Flex(grow: 1),
    ),
    css('.section-muted').styles(backgroundColor: surfaceMuted),
    css('.section-eyebrow').styles(
      margin: .only(bottom: 8.px),
      color: accentColor,
      fontSize: 0.85.rem,
      fontWeight: .w600,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.section-title').styles(
      margin: .only(bottom: 12.px),
      color: textColor,
      fontSize: 2.rem,
      fontWeight: .w700,
    ),
    css('.section-subtitle').styles(
      maxWidth: 600.px,
      margin: .only(bottom: 40.px),
      color: mutedTextColor,
      fontSize: 1.1.rem,
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.section').styles(padding: .symmetric(vertical: 48.px)),
      css('.section-title').styles(fontSize: 1.6.rem),
      css('.section-subtitle').styles(margin: .only(bottom: 28.px), fontSize: 1.rem),
    ]),
    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.section').styles(padding: .symmetric(vertical: 40.px)),
      css('.section-title').styles(fontSize: 1.35.rem),
    ]),
  ];
}
