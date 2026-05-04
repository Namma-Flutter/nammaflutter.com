import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class NammaCard extends StatelessComponent {
  final String title;
  final String description;
  final String? href;
  final List<String> tags;
  final bool external;

  const NammaCard({
    required this.title,
    required this.description,
    this.href,
    this.tags = const [],
    this.external = false,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    final children = [
      h3(classes: 'card-title', [Component.text(title)]),
      p(classes: 'card-desc', [Component.text(description)]),
      if (tags.isNotEmpty)
        div(classes: 'card-tags', [
          for (final t in tags) span(classes: 'card-tag', [Component.text(t)]),
        ]),
    ];

    if (href != null) {
      return a(
        href: href!,
        classes: 'card',
        attributes: external ? {'target': '_blank', 'rel': 'noopener noreferrer'} : null,
        children,
      );
    }

    return div(classes: 'card', children);
  }

  @css
  static List<StyleRule> get styles => [
    css('.card').styles(
      display: .flex,
      padding: .all(24.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(12.px)),
      transition: Transition('all', duration: 200.ms, curve: .easeOut),
      flexDirection: .column,
      gap: .all(12.px),
      color: textColor,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: surfaceColor,
    ),
    css('.card:hover').styles(
      border: .all(style: BorderStyle.solid, color: primaryColor, width: 1.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 24.px, color: .rgba(1, 88, 155, 0.12)),
      transform: .translate(x: 0.px, y: (-2).px),
    ),
    css('.card:hover .card-title').styles(color: primaryColor),
    css('.card-title').styles(
      transition: Transition('color', duration: 150.ms),
      color: textColor,
      fontSize: 1.1.rem,
      fontWeight: .w700,
    ),
    css('.card-desc').styles(flex: .grow(1), color: mutedTextColor, fontSize: 0.95.rem, lineHeight: 1.6.em),
    css('.card-tags').styles(display: .flex, flexWrap: .wrap, gap: .all(6.px)),
    css('.card-tag').styles(
      padding: .symmetric(vertical: 3.px, horizontal: 10.px),
      radius: .all(.circular(999.px)),
      color: primaryColor,
      fontSize: 0.75.rem,
      fontWeight: .w500,
      backgroundColor: Color('#E8F2FB'),
    ),
  ];
}
