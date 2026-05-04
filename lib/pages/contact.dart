import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/button.dart';
import '../components/section.dart';
import '../constants/theme.dart';
import '../data/socials.dart';

@client
class Contact extends StatelessComponent {
  const Contact({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      eyebrow: 'Get in touch',
      title: 'We\'d love to hear from you.',
      subtitle: 'Questions, speaker pitches, sponsorship enquiries — all welcome.',
      child: div(classes: 'contact-grid', [
        div(classes: 'contact-info', [
          _row('images/gmail.svg', 'Email', SocialLinks.contactEmail, 'mailto:${SocialLinks.contactEmail}'),
          _row('images/logo.png', 'Luma', 'View upcoming events', SocialLinks.luma, external: true),
          _row('images/telegram.svg', 'Telegram', 'Join the community group', SocialLinks.telegram, external: true),
          _row('images/whatsapp.svg', 'WhatsApp', 'Join the WhatsApp group', SocialLinks.whatsapp, external: true),
          _row('images/github.svg', 'GitHub', 'Namma-Flutter on GitHub', SocialLinks.github, external: true),
          _row('images/twitter.svg', 'Twitter / X', 'Follow us @nammaflutter', SocialLinks.twitter, external: true),
          _row('images/linkedin.svg', 'LinkedIn', 'Connect on LinkedIn', SocialLinks.linkedin, external: true),
          _row('images/medium.svg', 'Medium', 'Read our publication', SocialLinks.medium, external: true),
          _row('images/youtube.svg', 'YouTube', 'Watch on YouTube', SocialLinks.youtube, external: true),
        ]),
        div(classes: 'contact-cta-panel', [
          h3(classes: 'contact-panel-title', [.text('Join the community')]),
          p(classes: 'contact-panel-desc', [
            .text(
              'The best way to be part of Namma Flutter is to show up. '
              'Join our Telegram, come to a meetup, or open a pull request. We\'ll take it from there.',
            ),
          ]),
          div(classes: 'contact-panel-btns', [
            Button.primary('Join Telegram', SocialLinks.telegram, external: true),
            Button.secondary('Star on GitHub', SocialLinks.github, external: true),
          ]),
        ]),
      ]),
    );
  }

  static Component _row(String iconSrc, String label, String display, String href, {bool external = false}) {
    final attrs = external ? {'target': '_blank', 'rel': 'noopener noreferrer'} : <String, String>{};
    return a(href: href, classes: 'contact-row', attributes: attrs, [
      img(src: iconSrc, width: 24, height: 24, classes: 'contact-row-icon', attributes: {'alt': label}),
      div(classes: 'contact-row-text', [
        span(classes: 'contact-row-label', [.text(label)]),
        span(classes: 'contact-row-display', [.text(display)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.contact-grid').styles(
      display: .grid,
      alignItems: .start,
      gap: .all(32.px),
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(300px, 1fr))'},
    ),
    css('.contact-info').styles(display: .flex, flexDirection: .column, gap: .all(12.px)),
    css('.contact-row').styles(
      display: .flex,
      padding: .all(16.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(10.px)),
      transition: Transition('all', duration: 150.ms),
      flexDirection: .row,
      alignItems: .center,
      gap: .all(16.px),
      color: textColor,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.contact-row:hover').styles(
      border: .all(style: BorderStyle.solid, color: primaryColor, width: 1.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 2.px, blur: 8.px, color: .rgba(1, 88, 155, 0.08)),
    ),
    css('.contact-row-icon').styles(width: 24.px, height: 24.px, raw: {'flex-shrink': '0'}),
    css('.contact-row-text').styles(display: .flex, flexDirection: .column, gap: .all(2.px)),
    css('.contact-row-label').styles(
      color: mutedTextColor,
      fontSize: 0.8.rem,
      fontWeight: .w600,
      letterSpacing: 0.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.contact-row-display').styles(color: textColor, fontSize: 0.95.rem, fontWeight: .w500),
    css('.contact-cta-panel').styles(
      display: .flex,
      padding: .all(32.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(16.px)),
      flexDirection: .column,
      gap: .all(16.px),
      backgroundColor: surfaceMuted,
    ),
    css('.contact-panel-title').styles(color: textColor, fontSize: 1.4.rem, fontWeight: .w700),
    css('.contact-panel-desc').styles(color: mutedTextColor, fontSize: 1.rem, lineHeight: 1.7.em),
    css('.contact-panel-btns').styles(display: .flex, flexWrap: .wrap, gap: .all(12.px)),
  ];
}
