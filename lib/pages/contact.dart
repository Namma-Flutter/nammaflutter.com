import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/section.dart';
import '../constants/theme.dart';
import '../data/socials.dart';

const _speakerFormUrl = 'https://form.typeform.com/to/XmL7gb4G';

@client
class Contact extends StatelessComponent {
  const Contact({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      eyebrow: 'Get in touch',
      title: 'Pick your platform.',
      subtitle: 'Pitch a talk, ask a question, or just say hi. Whichever feels right.',
      child: div(classes: 'bento', [
        a(
          href: _speakerFormUrl,
          classes: 'tile tile-form',
          attributes: const {'target': '_blank', 'rel': 'noopener noreferrer'},
          [
            div(classes: 'form-glyph', [.text('🎤')]),
            div(classes: 'form-body', [
              span(classes: 'form-eyebrow', [.text('Speaker form')]),
              h3(classes: 'form-title', [.text('Want to take the mic?')]),
              p(classes: 'form-desc', [
                .text(
                  'Pitch a talk for a Namma Flutter meetup. Quick demos, deep dives, hot takes, we want to hear it.',
                ),
              ]),
            ]),
            span(classes: 'form-cta', [.text('Open speaker form  →')]),
          ],
        ),
        _tile(
          classes: 'tile-telegram',
          iconSrc: 'images/telegram.svg',
          eyebrow: 'Community chat',
          label: 'Telegram',
          handle: 't.me/nammaflutter',
          href: SocialLinks.telegram,
        ),
        _tile(
          classes: 'tile-github',
          iconSrc: 'images/github.svg',
          eyebrow: 'Code',
          label: 'GitHub',
          handle: '@Namma-Flutter',
          href: SocialLinks.github,
        ),
        _tile(
          classes: 'tile-youtube',
          iconSrc: 'images/youtube.svg',
          eyebrow: 'Watch',
          label: 'YouTube',
          handle: 'Namma Devs podcast',
          href: SocialLinks.youtube,
        ),
        _tile(
          classes: 'tile-email',
          iconSrc: 'images/gmail.svg',
          eyebrow: 'Old school',
          label: 'Email us',
          handle: SocialLinks.contactEmail,
          href: 'mailto:${SocialLinks.contactEmail}',
          external: false,
        ),
        _tile(
          classes: 'tile-whatsapp',
          iconSrc: 'images/whatsapp.svg',
          eyebrow: 'Chat',
          label: 'WhatsApp',
          handle: 'Join the group',
          href: SocialLinks.whatsapp,
        ),
        _tile(
          classes: 'tile-luma',
          iconSrc: 'images/logo.png',
          eyebrow: 'Events',
          label: 'Luma',
          handle: 'lu.ma/Nammaflutter',
          href: SocialLinks.luma,
        ),
        _tile(
          classes: 'tile-medium',
          iconSrc: 'images/medium.svg',
          eyebrow: 'Read',
          label: 'Medium',
          handle: 'medium.com/nammaflutter',
          href: SocialLinks.medium,
        ),
        _tile(
          classes: 'tile-twitter',
          iconSrc: 'images/twitter.svg',
          eyebrow: 'Follow',
          label: 'X (Twitter)',
          handle: '@nammaflutter',
          href: SocialLinks.twitter,
        ),
        _tile(
          classes: 'tile-linkedin',
          iconSrc: 'images/linkedin.svg',
          eyebrow: 'Connect',
          label: 'LinkedIn',
          handle: '/company/nammaflutter',
          href: SocialLinks.linkedin,
        ),
        div(classes: 'tile tile-info', [
          span(classes: 'info-eyebrow', [.text('Made in')]),
          h3(classes: 'info-title', [.text('Chennai, Tamil Nadu')]),
          p(classes: 'info-sub', [
            .text('Designed and built with '),
            span(classes: 'info-heart', [.text('💙')]),
            .text(' by the Namma Flutter community, since 2026.'),
          ]),
        ]),
      ]),
    );
  }

  static Component _tile({
    required String classes,
    required String iconSrc,
    required String eyebrow,
    required String label,
    required String handle,
    required String href,
    bool external = true,
  }) {
    final attrs = external ? {'target': '_blank', 'rel': 'noopener noreferrer'} : <String, String>{};
    return a(href: href, classes: 'tile $classes', attributes: attrs, [
      img(
        src: iconSrc,
        classes: 'tile-icon',
        attributes: {'alt': '$label icon', 'loading': 'lazy'},
      ),
      div(classes: 'tile-body', [
        span(classes: 'tile-eyebrow', [.text(eyebrow)]),
        span(classes: 'tile-label', [.text(label)]),
        span(classes: 'tile-handle', [.text(handle)]),
      ]),
      span(classes: 'tile-arrow', [.text('→')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.bento').styles(
      display: .grid,
      gap: .all(16.px),
      raw: {
        'grid-template-columns': 'repeat(4, 1fr)',
        'grid-auto-rows': '180px',
      },
    ),
    css('.tile').styles(
      display: .flex,
      padding: .all(20.px),
      radius: .all(.circular(20.px)),
      transition: Transition('all', duration: 220.ms, curve: .easeOut),
      flexDirection: .column,
      justifyContent: .spaceBetween,
      gap: .all(12.px),
      color: textColor,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: surfaceColor,
      raw: {
        'border': '1px solid #E2E8F0',
        'overflow': 'hidden',
        'position': 'relative',
      },
    ),
    css('.tile:hover').styles(
      transform: .translate(x: 0.px, y: (-4).px),
      raw: {'box-shadow': '0 18px 36px rgba(10, 22, 40, 0.12)'},
    ),
    css('.tile-icon').styles(
      width: 36.px,
      height: 36.px,
      raw: {'object-fit': 'contain'},
    ),
    css('.tile-body').styles(display: .flex, flexDirection: .column, gap: .all(2.px)),
    css('.tile-eyebrow').styles(
      color: mutedTextColor,
      fontSize: 0.7.rem,
      fontWeight: .w700,
      letterSpacing: 1.2.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.tile-label').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 1.4.rem,
      fontWeight: .w700,
      lineHeight: 1.1.em,
    ),
    css('.tile-handle').styles(
      margin: .only(top: 4.px),
      color: mutedTextColor,
      fontSize: 0.85.rem,
      fontWeight: .w500,
      raw: {'word-break': 'break-word'},
    ),
    css('.tile-arrow').styles(
      transition: Transition('transform', duration: 200.ms),
      color: mutedTextColor,
      fontSize: 1.2.rem,
      raw: {'position': 'absolute', 'top': '20px', 'right': '20px'},
    ),
    css('.tile:hover .tile-arrow').styles(raw: {'transform': 'translate(4px, -4px)'}),
    css('.tile-form').styles(
      padding: .all(36.px),
      color: Colors.white,
      backgroundColor: accentWarm,
      raw: {
        'grid-column': '1 / span 2',
        'grid-row': '1 / span 2',
        'border': 'none',
        'background-image':
            'radial-gradient(ellipse at top right, rgba(255, 255, 255, 0.18) 0%, transparent 60%)',
      },
    ),
    css('.tile-form .form-glyph').styles(fontSize: 3.2.rem, lineHeight: 1.em),
    css('.tile-form .form-eyebrow').styles(
      display: .block,
      margin: .only(bottom: 12.px),
      color: .rgba(255, 255, 255, 0.85),
      fontSize: 0.75.rem,
      fontWeight: .w700,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.tile-form .form-title').styles(
      margin: .zero,
      color: Colors.white,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 2.8.rem,
      fontWeight: .w700,
      letterSpacing: (-1).px,
      lineHeight: 1.05.em,
    ),
    css('.tile-form .form-desc').styles(
      maxWidth: 460.px,
      margin: .only(top: 14.px),
      color: .rgba(255, 255, 255, 0.92),
      fontSize: 1.05.rem,
      lineHeight: 1.6.em,
    ),
    css('.tile-form .form-cta').styles(
      display: .inlineFlex,
      padding: .symmetric(vertical: 14.px, horizontal: 24.px),
      radius: .all(.circular(999.px)),
      transition: Transition('all', duration: 200.ms),
      alignItems: .center,
      color: accentWarm,
      fontSize: 1.rem,
      fontWeight: .w700,
      backgroundColor: Colors.white,
      raw: {'align-self': 'flex-start'},
    ),
    css('.tile-form:hover').styles(
      transform: .translate(x: 0.px, y: (-4).px),
      raw: {'box-shadow': '0 24px 48px rgba(255, 107, 53, 0.35)'},
    ),
    css('.tile-form:hover .form-cta').styles(
      color: Colors.white,
      backgroundColor: darkSurface,
    ),
    css('.tile-telegram').styles(
      color: Colors.white,
      backgroundColor: Color('#0088CC'),
      raw: {'grid-column': '3 / span 2', 'grid-row': '1', 'border': 'none'},
    ),
    css('.tile-telegram .tile-icon').styles(
      width: 44.px,
      height: 44.px,
      raw: {'filter': 'brightness(0) invert(1)'},
    ),
    css('.tile-telegram .tile-eyebrow').styles(color: .rgba(255, 255, 255, 0.8)),
    css('.tile-telegram .tile-label').styles(color: Colors.white),
    css('.tile-telegram .tile-handle').styles(color: .rgba(255, 255, 255, 0.85)),
    css('.tile-telegram .tile-arrow').styles(color: Colors.white),
    css('.tile-github').styles(
      color: Colors.white,
      backgroundColor: darkSurface,
      raw: {'grid-column': '3', 'grid-row': '2', 'border': 'none'},
    ),
    css('.tile-github .tile-icon').styles(raw: {'filter': 'brightness(0) invert(1)'}),
    css('.tile-github .tile-eyebrow').styles(color: .rgba(255, 255, 255, 0.55)),
    css('.tile-github .tile-label').styles(color: Colors.white),
    css('.tile-github .tile-handle').styles(color: .rgba(255, 255, 255, 0.7)),
    css('.tile-github .tile-arrow').styles(color: Colors.white),
    css('.tile-youtube').styles(
      color: Colors.white,
      backgroundColor: Color('#0F0F0F'),
      raw: {
        'grid-column': '4',
        'grid-row': '2',
        'border': 'none',
        'background-image':
            'radial-gradient(circle at bottom right, rgba(255, 0, 0, 0.22) 0%, transparent 65%)',
      },
    ),
    css('.tile-youtube .tile-icon').styles(raw: {'filter': 'brightness(0) invert(1)'}),
    css('.tile-youtube .tile-eyebrow').styles(color: .rgba(255, 255, 255, 0.55)),
    css('.tile-youtube .tile-label').styles(color: Colors.white),
    css('.tile-youtube .tile-handle').styles(color: .rgba(255, 255, 255, 0.7)),
    css('.tile-youtube .tile-arrow').styles(color: Color('#FF0000')),
    css('.tile-email').styles(raw: {'grid-column': '1', 'grid-row': '3'}),
    css('.tile-whatsapp').styles(
      color: Colors.white,
      backgroundColor: Color('#25D366'),
      raw: {'grid-column': '2', 'grid-row': '3', 'border': 'none'},
    ),
    css('.tile-whatsapp .tile-icon').styles(raw: {'filter': 'brightness(0) invert(1)'}),
    css('.tile-whatsapp .tile-eyebrow').styles(color: .rgba(255, 255, 255, 0.8)),
    css('.tile-whatsapp .tile-label').styles(color: Colors.white),
    css('.tile-whatsapp .tile-handle').styles(color: .rgba(255, 255, 255, 0.9)),
    css('.tile-whatsapp .tile-arrow').styles(color: Colors.white),
    css('.tile-luma').styles(raw: {'grid-column': '3', 'grid-row': '3'}),
    css('.tile-medium').styles(
      color: Colors.white,
      backgroundColor: Color('#191919'),
      raw: {'grid-column': '4', 'grid-row': '3', 'border': 'none'},
    ),
    css('.tile-medium .tile-icon').styles(raw: {'filter': 'brightness(0) invert(1)'}),
    css('.tile-medium .tile-eyebrow').styles(color: .rgba(255, 255, 255, 0.55)),
    css('.tile-medium .tile-label').styles(color: Colors.white),
    css('.tile-medium .tile-handle').styles(color: .rgba(255, 255, 255, 0.7)),
    css('.tile-medium .tile-arrow').styles(color: Colors.white),
    css('.tile-twitter').styles(
      color: Colors.white,
      backgroundColor: Colors.black,
      raw: {'grid-column': '1', 'grid-row': '4', 'border': 'none'},
    ),
    css('.tile-twitter .tile-icon').styles(raw: {'filter': 'brightness(0) invert(1)'}),
    css('.tile-twitter .tile-eyebrow').styles(color: .rgba(255, 255, 255, 0.55)),
    css('.tile-twitter .tile-label').styles(color: Colors.white),
    css('.tile-twitter .tile-handle').styles(color: .rgba(255, 255, 255, 0.7)),
    css('.tile-twitter .tile-arrow').styles(color: Colors.white),
    css('.tile-linkedin').styles(
      color: Colors.white,
      backgroundColor: Color('#0A66C2'),
      raw: {'grid-column': '2', 'grid-row': '4', 'border': 'none'},
    ),
    css('.tile-linkedin .tile-icon').styles(raw: {'filter': 'brightness(0) invert(1)'}),
    css('.tile-linkedin .tile-eyebrow').styles(color: .rgba(255, 255, 255, 0.8)),
    css('.tile-linkedin .tile-label').styles(color: Colors.white),
    css('.tile-linkedin .tile-handle').styles(color: .rgba(255, 255, 255, 0.9)),
    css('.tile-linkedin .tile-arrow').styles(color: Colors.white),
    css('.tile-info').styles(
      backgroundColor: surfaceMuted,
      raw: {
        'grid-column': '3 / span 2',
        'grid-row': '4',
        'background-image': 'url(images/kolam-bg.svg)',
        'background-repeat': 'repeat',
        'background-size': '120px 120px',
        'background-position': 'center',
      },
    ),
    css('.tile-info .info-eyebrow').styles(
      color: accentWarm,
      fontSize: 0.75.rem,
      fontWeight: .w700,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.tile-info .info-title').styles(
      color: textColor,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 2.rem,
      fontWeight: .w700,
      letterSpacing: (-0.5).px,
    ),
    css('.tile-info .info-sub').styles(
      maxWidth: 360.px,
      margin: .zero,
      color: mutedTextColor,
      fontSize: 0.95.rem,
      lineHeight: 1.5.em,
    ),
    css('@keyframes heart-beat', [
      css('0%').styles(raw: {'transform': 'scale(1)'}),
      css('20%').styles(raw: {'transform': 'scale(1.2)'}),
      css('40%').styles(raw: {'transform': 'scale(1)'}),
      css('60%').styles(raw: {'transform': 'scale(1.15)'}),
      css('80%').styles(raw: {'transform': 'scale(1)'}),
      css('100%').styles(raw: {'transform': 'scale(1)'}),
    ]),
    css('.info-heart').styles(
      display: .inlineBlock,
      raw: {
        'animation': 'heart-beat 2.4s ease-in-out infinite',
        'transform-origin': 'center',
      },
    ),
    css('.tile-info:hover').styles(
      transform: .translate(x: 0.px, y: 0.px),
      raw: {'box-shadow': 'none'},
    ),
    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.bento').styles(
        raw: {'grid-template-columns': 'repeat(2, 1fr)', 'grid-auto-rows': '160px'},
      ),
      css('.tile-form').styles(
        padding: .all(28.px),
        raw: {'grid-column': '1 / span 2', 'grid-row': '1 / span 2'},
      ),
      css('.tile-form .form-title').styles(fontSize: 2.rem),
      css('.tile-form .form-desc').styles(fontSize: 0.95.rem),
      css('.tile-telegram').styles(raw: {'grid-column': '1 / span 2', 'grid-row': '3'}),
      css('.tile-github').styles(raw: {'grid-column': '1', 'grid-row': '4'}),
      css('.tile-youtube').styles(raw: {'grid-column': '2', 'grid-row': '4'}),
      css('.tile-email').styles(raw: {'grid-column': '1', 'grid-row': '5'}),
      css('.tile-whatsapp').styles(raw: {'grid-column': '2', 'grid-row': '5'}),
      css('.tile-luma').styles(raw: {'grid-column': '1', 'grid-row': '6'}),
      css('.tile-medium').styles(raw: {'grid-column': '2', 'grid-row': '6'}),
      css('.tile-twitter').styles(raw: {'grid-column': '1', 'grid-row': '7'}),
      css('.tile-linkedin').styles(raw: {'grid-column': '2', 'grid-row': '7'}),
      css('.tile-info').styles(raw: {'grid-column': '1 / span 2', 'grid-row': '8'}),
    ]),
    css.media(MediaQuery.screen(maxWidth: 560.px), [
      css('.bento').styles(
        gap: .all(12.px),
        raw: {'grid-template-columns': '1fr', 'grid-auto-rows': '160px'},
      ),
      css('.tile-form').styles(raw: {'grid-column': '1', 'grid-row': '1 / span 2'}),
      css('.tile-form .form-title').styles(fontSize: 1.7.rem),
      css('.tile-telegram').styles(raw: {'grid-column': '1', 'grid-row': '3'}),
      css('.tile-github').styles(raw: {'grid-column': '1', 'grid-row': '4'}),
      css('.tile-youtube').styles(raw: {'grid-column': '1', 'grid-row': '5'}),
      css('.tile-email').styles(raw: {'grid-column': '1', 'grid-row': '6'}),
      css('.tile-whatsapp').styles(raw: {'grid-column': '1', 'grid-row': '7'}),
      css('.tile-luma').styles(raw: {'grid-column': '1', 'grid-row': '8'}),
      css('.tile-medium').styles(raw: {'grid-column': '1', 'grid-row': '9'}),
      css('.tile-twitter').styles(raw: {'grid-column': '1', 'grid-row': '10'}),
      css('.tile-linkedin').styles(raw: {'grid-column': '1', 'grid-row': '11'}),
      css('.tile-info').styles(raw: {'grid-column': '1', 'grid-row': '12'}),
    ]),
  ];
}
