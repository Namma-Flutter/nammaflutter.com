import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class SectionPreview extends StatelessComponent {
  final String icon;
  final String title;
  final String description;
  final String href;

  const SectionPreview({
    required this.icon,
    required this.title,
    required this.description,
    required this.href,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return a(href: href, classes: 'preview-card', [
      span(classes: 'preview-icon', [.text(icon)]),
      h3(classes: 'preview-title', [.text(title)]),
      p(classes: 'preview-desc', [.text(description)]),
      span(classes: 'preview-link', [.text('Learn more →')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.preview-card').styles(
      display: .flex,
      padding: .all(28.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(12.px)),
      transition: Transition('all', duration: 180.ms, curve: .easeOut),
      flexDirection: .column,
      gap: .all(8.px),
      color: textColor,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: surfaceColor,
    ),
    css('.preview-card:hover').styles(
      border: .all(style: BorderStyle.solid, color: primaryColor, width: 1.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 24.px, color: .rgba(1, 88, 155, 0.1)),
      transform: .translate(x: 0.px, y: (-3).px),
    ),
    css('.preview-icon').styles(fontSize: 2.rem, lineHeight: 1.em),
    css('.preview-title').styles(color: textColor, fontSize: 1.1.rem, fontWeight: .w700),
    css('.preview-desc').styles(flex: .grow(1), color: mutedTextColor, fontSize: 0.9.rem),
    css('.preview-link').styles(color: primaryColor, fontSize: 0.9.rem, fontWeight: .w600),
  ];
}
