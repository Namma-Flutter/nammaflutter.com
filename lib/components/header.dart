import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  static const _routes = [
    (label: 'About', path: '/about'),
    (label: 'Apps', path: '/apps'),
    (label: 'Programs', path: '/programs'),
    (label: 'Events', path: '/events'),
    (label: 'Team', path: '/team'),
    (label: 'Store', path: '/store'),
    (label: 'Contact', path: '/contact'),
  ];

  @override
  Component build(BuildContext context) {
    final active = context.url;

    return header([
      div(classes: 'header-inner container', [
        a(href: '/', classes: 'header-logo', [.text('Namma Flutter')]),
        input(type: InputType.checkbox, id: 'nav-toggle', classes: 'nav-toggle-input'),
        label(
          [
            span(classes: 'hamburger-bar', []),
            span(classes: 'hamburger-bar', []),
            span(classes: 'hamburger-bar', []),
          ],
          htmlFor: 'nav-toggle',
          classes: 'hamburger',
          attributes: {'aria-label': 'Toggle navigation'},
        ),
        nav(classes: 'header-nav', [
          for (final route in _routes)
            a(
              href: route.path,
              classes: active == route.path ? 'nav-link nav-link-active' : 'nav-link',
              [.text(route.label)],
            ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header').styles(
      position: .sticky(top: 0.px),
      zIndex: ZIndex(100),
      backgroundColor: Colors.white,
      border: .only(
        bottom: BorderSide.solid(color: borderColor, width: 1.px),
      ),
      raw: {'backdrop-filter': 'blur(8px)'},
    ),
    css('.header-inner').styles(
      display: .flex,
      flexDirection: .row,
      alignItems: .center,
      justifyContent: .spaceBetween,
      height: 64.px,
      gap: .all(24.px),
    ),
    css('.header-logo').styles(
      fontSize: 1.1.rem,
      fontWeight: .w700,
      color: primaryColor,
      textDecoration: TextDecoration(line: .none),
      raw: {'white-space': 'nowrap'},
    ),
    css('.header-nav').styles(
      display: .flex,
      flexDirection: .row,
      alignItems: .center,
      gap: .all(4.px),
      flexWrap: .wrap,
    ),
    css('.nav-link').styles(
      display: .flex,
      alignItems: .center,
      padding: .symmetric(vertical: 6.px, horizontal: 12.px),
      fontSize: 0.9.rem,
      fontWeight: .w500,
      color: mutedTextColor,
      textDecoration: TextDecoration(line: .none),
      radius: .all(.circular(6.px)),
      transition: Transition('all', duration: 150.ms),
    ),
    css('.nav-link:hover').styles(color: primaryColor, backgroundColor: Color('#F0F6FC')),
    css('.nav-link-active').styles(
      color: primaryColor,
      fontWeight: .w700,
      backgroundColor: Color('#E8F2FB'),
    ),
    css('.nav-toggle-input').styles(display: .none),
    css('.hamburger').styles(display: .none),
    css('.hamburger-bar').styles(
      display: .block,
      width: 22.px,
      height: 2.px,
      backgroundColor: textColor,
      radius: .all(.circular(2.px)),
      transition: Transition('all', duration: 250.ms),
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.header-nav').styles(gap: .all(2.px)),
      css('.nav-link').styles(
        padding: .symmetric(vertical: 4.px, horizontal: 8.px),
        fontSize: 0.82.rem,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 640.px), [
      css('.header-inner').styles(
        flexWrap: .wrap,
        height: .auto,
        minHeight: 56.px,
        gap: .all(0.px),
        alignItems: .center,
      ),
      css('.hamburger').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(5.px),
        cursor: .pointer,
        padding: .all(8.px),
        radius: .all(.circular(6.px)),
        raw: {'margin-left': 'auto'},
      ),
      css('.hamburger:hover').styles(backgroundColor: surfaceMuted),
      css('.header-nav').styles(
        display: .none,
        flexDirection: .column,
        width: 100.percent,
        gap: .all(0.px),
        padding: .only(bottom: 12.px, top: 8.px),
        border: .only(
          top: BorderSide.solid(color: borderColor, width: 1.px),
        ),
        raw: {'flex-basis': '100%'},
      ),
      css('.nav-toggle-input:checked ~ .header-nav').styles(display: .flex),
      css('.nav-toggle-input:checked ~ .hamburger .hamburger-bar:nth-child(1)').styles(
        raw: {'transform': 'translateY(7px) rotate(45deg)'},
      ),
      css('.nav-toggle-input:checked ~ .hamburger .hamburger-bar:nth-child(2)').styles(opacity: 0.0),
      css('.nav-toggle-input:checked ~ .hamburger .hamburger-bar:nth-child(3)').styles(
        raw: {'transform': 'translateY(-7px) rotate(-45deg)'},
      ),
      css('.nav-link').styles(
        padding: .symmetric(vertical: 10.px, horizontal: 16.px),
        fontSize: 0.95.rem,
        width: 100.percent,
        radius: .all(.circular(8.px)),
      ),
    ]),
  ];
}
