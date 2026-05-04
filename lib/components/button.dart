import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

enum ButtonVariant { primary, secondary, ghost }

class Button extends StatelessComponent {
  final String label;
  final String href;
  final ButtonVariant variant;
  final bool external;

  const Button.primary(this.label, this.href, {this.external = false, super.key}) : variant = ButtonVariant.primary;

  const Button.secondary(this.label, this.href, {this.external = false, super.key}) : variant = ButtonVariant.secondary;

  const Button.ghost(this.label, this.href, {this.external = false, super.key}) : variant = ButtonVariant.ghost;

  @override
  Component build(BuildContext context) {
    final cls = switch (variant) {
      ButtonVariant.primary => 'btn btn-primary',
      ButtonVariant.secondary => 'btn btn-secondary',
      ButtonVariant.ghost => 'btn btn-ghost',
    };
    if (external) {
      return a(
        href: href,
        classes: cls,
        attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
        [.text(label)],
      );
    }
    return a(href: href, classes: cls, [.text(label)]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.btn').styles(
      display: .inlineFlex,
      minHeight: 44.px,
      padding: .symmetric(vertical: 12.px, horizontal: 28.px),
      cursor: .pointer,
      transition: Transition('all', duration: 180.ms, curve: .easeOut),
      justifyContent: .center,
      alignItems: .center,
      fontSize: 1.rem,
      fontWeight: .w600,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.btn-primary').styles(
      radius: .all(.circular(999.px)),
      color: Colors.white,
      backgroundColor: primaryColor,
    ),
    css('.btn-primary:hover').styles(backgroundColor: primaryColorDark),
    css('.btn-secondary').styles(
      border: .all(style: BorderStyle.solid, color: primaryColor, width: 2.px),
      radius: .all(.circular(8.px)),
      color: primaryColor,
      backgroundColor: Colors.transparent,
    ),
    css('.btn-secondary:hover').styles(color: Colors.white, backgroundColor: primaryColor),
    css('.btn-ghost').styles(
      radius: .all(.circular(8.px)),
      color: primaryColor,
      backgroundColor: Colors.transparent,
    ),
    css('.btn-ghost:hover').styles(color: primaryColorDark),
  ];
}
