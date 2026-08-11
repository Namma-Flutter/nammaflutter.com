import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/events.dart' as event_data;
import 'namma_word.dart';

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
    final upcomingEvents = event_data.events.where((event) => event.type == event_data.EventType.upcoming).toList();
    final upcomingEvent = upcomingEvents.isEmpty ? null : upcomingEvents.first;
    final eventHref = upcomingEvent?.link ?? '/events';
    final eventUri = Uri.tryParse(eventHref);
    final isExternalEventLink =
        eventUri != null && eventUri.isAbsolute && eventUri.scheme == 'https' && eventUri.host.isNotEmpty;

    return header([
      if (upcomingEvent != null)
        a(
          href: eventHref,
          target: isExternalEventLink ? .blank : .self,
          classes: 'event-announcement',
          attributes: {
            if (isExternalEventLink) 'rel': 'noopener noreferrer',
          },
          [
            span(classes: 'event-announcement-title', [.text(upcomingEvent.title)]),
            span(classes: 'event-announcement-details', [.text('${upcomingEvent.date} · ${upcomingEvent.venue}')]),
            span(classes: 'event-announcement-cta', [.text('Explore the event  →')]),
          ],
        ),
      div(classes: 'header-inner container', [
        a(href: '/', classes: 'header-logo', [
          const NammaWord(),
          .text(' Flutter'),
        ]),
        input(type: InputType.checkbox, id: 'nav-toggle', classes: 'nav-toggle-input'),
        label(
          htmlFor: 'nav-toggle',
          classes: 'hamburger',
          attributes: {'aria-label': 'Toggle navigation'},
          [
            span(classes: 'hamburger-bar', []),
            span(classes: 'hamburger-bar', []),
            span(classes: 'hamburger-bar', []),
          ],
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
      border: .only(
        bottom: BorderSide.solid(color: borderColor, width: 1.px),
      ),
      backgroundColor: Colors.white,
      raw: {'backdrop-filter': 'blur(8px)'},
    ),
    css('.event-announcement').styles(
      display: .flex,
      width: 100.percent,
      minHeight: 44.px,
      padding: .symmetric(vertical: 9.px, horizontal: 24.px),
      flexDirection: .row,
      flexWrap: .wrap,
      justifyContent: .center,
      alignItems: .center,
      gap: .all(10.px),
      color: Colors.white,
      textAlign: .center,
      fontSize: 0.88.rem,
      fontWeight: .w600,
      textDecoration: TextDecoration(line: .none),
      lineHeight: 1.4.em,
      backgroundColor: primaryColor,
      raw: {'background-image': 'linear-gradient(90deg, #087CF0 0%, #7448F5 100%)'},
    ),
    css('.event-announcement-title').styles(fontWeight: .w700),
    css('.event-announcement-details').styles(opacity: 0.86),
    css('.event-announcement-cta').styles(fontWeight: .w700),
    css('.header-inner').styles(
      display: .flex,
      height: 64.px,
      flexDirection: .row,
      justifyContent: .spaceBetween,
      alignItems: .center,
      gap: .all(24.px),
    ),
    css('.header-logo').styles(
      color: primaryColor,
      fontSize: 1.1.rem,
      fontWeight: .w700,
      textDecoration: TextDecoration(line: .none),
      raw: {'white-space': 'nowrap'},
    ),
    css('.header-nav').styles(
      display: .flex,
      flexDirection: .row,
      flexWrap: .wrap,
      alignItems: .center,
      gap: .all(4.px),
    ),
    css('.nav-link').styles(
      display: .flex,
      padding: .symmetric(vertical: 6.px, horizontal: 12.px),
      radius: .all(.circular(6.px)),
      transition: Transition('all', duration: 150.ms),
      alignItems: .center,
      color: mutedTextColor,
      fontSize: 0.9.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
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
      radius: .all(.circular(2.px)),
      transition: Transition('all', duration: 250.ms),
      backgroundColor: textColor,
    ),
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.event-announcement').styles(
        minHeight: 48.px,
        padding: .symmetric(vertical: 8.px, horizontal: 16.px),
        gap: .all(5.px),
        fontSize: 0.8.rem,
      ),
      css('.event-announcement-details').styles(display: .none),
      css('.header-inner').styles(
        height: .auto,
        minHeight: 56.px,
        flexWrap: .wrap,
        alignItems: .center,
        gap: .all(0.px),
      ),
      css('.hamburger').styles(
        display: .flex,
        padding: .all(8.px),
        radius: .all(.circular(6.px)),
        cursor: .pointer,
        flexDirection: .column,
        gap: .all(5.px),
        raw: {'margin-left': 'auto'},
      ),
      css('.hamburger:hover').styles(backgroundColor: surfaceMuted),
      css('.header-nav').styles(
        display: .none,
        width: 100.percent,
        padding: .only(bottom: 12.px, top: 8.px),
        border: .only(
          top: BorderSide.solid(color: borderColor, width: 1.px),
        ),
        flexDirection: .column,
        gap: .all(0.px),
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
        width: 100.percent,
        padding: .symmetric(vertical: 10.px, horizontal: 16.px),
        radius: .all(.circular(8.px)),
        fontSize: 0.95.rem,
      ),
    ]),
  ];
}
