import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/socials.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'container', [
        div(classes: 'footer-top', [
          div(classes: 'footer-brand', [
            p(classes: 'footer-logo', [.text('Namma Flutter')]),
            p(classes: 'footer-tagline', [
              .text('Chennai\'s Flutter developer community — built by the community, for the community.'),
            ]),
          ]),
          div(classes: 'footer-links', [
            _col('Community', [
              _link('About', '/about'),
              _link('Events', '/events'),
              _link('Programs', '/programs'),
              _link('Team', '/team'),
            ]),
            _col('Projects', [
              _link('Apps', '/apps'),
              _link('Store', '/store'),
              _extLink('GitHub', SocialLinks.github),
            ]),
            _col('Connect', [
              _extLink('Telegram', SocialLinks.telegram),
              _extLink('WhatsApp', SocialLinks.whatsapp),
              _extLink('Twitter / X', SocialLinks.twitter),
              _extLink('LinkedIn', SocialLinks.linkedin),
              _extLink('Medium', SocialLinks.medium),
              _extLink('YouTube', SocialLinks.youtube),
            ]),
          ]),
        ]),
        div(classes: 'footer-bottom', [
          p([.text('© ${DateTime.now().year} Namma Flutter Chennai. All rights reserved.')]),
          div(classes: 'footer-built-with', [
            a(
              href: 'https://jaspr.dev',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer', 'aria-label': 'Built with Jaspr'},
              [
                img(src: 'images/builtwithjaspr.svg', width: 106, height: 40, attributes: {'alt': 'Built with Jaspr'}),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }

  Component _col(String heading, List<Component> links) => div(classes: 'footer-col', [
    p(classes: 'footer-col-heading', [.text(heading)]),
    ...links,
  ]);

  Component _link(String label, String href) => a(href: href, classes: 'footer-link', [.text(label)]);

  Component _extLink(String label, String href) => a(
    href: href,
    classes: 'footer-link',
    attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
    [
      .text(label),
    ],
  );

  @css
  static List<StyleRule> get styles => [
    css('.site-footer').styles(
      padding: .symmetric(vertical: 56.px),
      color: Colors.white,
      backgroundColor: textColor,
    ),
    css('.footer-top').styles(
      display: .flex,
      margin: .only(bottom: 40.px),
      flexDirection: .row,
      flexWrap: .wrap,
      justifyContent: .spaceBetween,
      gap: .all(48.px),
    ),
    css('.footer-brand').styles(
      display: .flex,
      maxWidth: 260.px,
      flexDirection: .column,
      gap: .all(12.px),
    ),
    css('.footer-logo').styles(
      margin: .zero,
      color: Colors.white,
      fontSize: 1.4.rem,
      fontWeight: .w700,
    ),
    css('.footer-tagline').styles(
      margin: .zero,
      color: .rgba(255, 255, 255, 0.6),
      fontSize: 0.9.rem,
      lineHeight: 1.6.em,
    ),
    css('.footer-links').styles(
      display: .flex,
      flexDirection: .row,
      flexWrap: .wrap,
      gap: .all(40.px),
    ),
    css('.footer-col').styles(
      display: .flex,
      flexDirection: .column,
      gap: .all(10.px),
    ),
    css('.footer-col-heading').styles(
      margin: .only(bottom: 4.px),
      color: .rgba(255, 255, 255, 0.5),
      fontSize: 0.8.rem,
      fontWeight: .w700,
      letterSpacing: 1.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.footer-link').styles(
      transition: Transition('color', duration: 150.ms),
      color: .rgba(255, 255, 255, 0.75),
      fontSize: 0.9.rem,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.footer-link:hover').styles(color: Colors.white),
    css('.footer-bottom').styles(
      display: .flex,
      padding: .only(top: 24.px),
      border: .only(
        top: BorderSide.solid(color: .rgba(255, 255, 255, 0.12), width: 1.px),
      ),
      flexDirection: .row,
      flexWrap: .wrap,
      justifyContent: .spaceBetween,
      gap: .all(8.px),
    ),
    css('.footer-bottom p').styles(
      margin: .zero,
      color: .rgba(255, 255, 255, 0.45),
      fontSize: 0.85.rem,
    ),
    css('.footer-built-with').styles(
      display: .flex,
      justifyContent: .center,
      alignItems: .center,
    ),
    css('.footer-built-with a').styles(
      display: .block,
      transition: Transition('opacity', duration: 150.ms),
    ),
    css('.footer-built-with a:hover').styles(
      opacity: 0.8,
    ),
    css('.footer-built-with img').styles(
      width: 106.px,
      height: 40.px,
      raw: {'max-width': 'none'},
    ),
    css.media(MediaQuery.screen(maxWidth: 640.px), [
      css('.site-footer').styles(padding: .symmetric(vertical: 40.px)),
      css('.footer-top').styles(flexDirection: .column, gap: .all(28.px)),
      css('.footer-brand').styles(maxWidth: 100.percent),
      css('.footer-links').styles(flexDirection: .column, gap: .all(24.px)),
      css('.footer-bottom').styles(flexDirection: .column, alignItems: .center, textAlign: .center),
    ]),
  ];
}
