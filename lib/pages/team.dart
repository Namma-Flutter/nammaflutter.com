import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/cta_band.dart';
import '../components/section.dart';
import '../constants/theme.dart';
import '../data/team.dart';

@client
class Team extends StatelessComponent {
  const Team({super.key});

  @override
  Component build(BuildContext context) {
    return .fragment([
      Section(
        eyebrow: 'Our family',
        title: 'The people behind Namma Flutter.',
        subtitle: 'A crew of organisers, speakers, and contributors keeping the community going.',
        child: div(classes: 'team-grid', [
          for (final m in team) _memberCard(m),
        ]),
      ),
      const CtaBand(
        headline: 'Want to contribute? We\'d love to have you.',
        buttonLabel: 'Join the community',
        buttonHref: '/contact',
      ),
    ]);
  }

  static Component _memberCard(TeamMember m) {
    return div(classes: 'member-card', [
      div(classes: 'member-avatar', [
        if (m.photo != null)
          img(src: m.photo!, classes: 'member-photo', attributes: {'alt': m.name})
        else
          span(classes: 'member-initials', [.text(_initials(m.name))]),
      ]),
      div(classes: 'member-info', [
        h4(classes: 'member-name', [.text(m.name)]),
        p(classes: 'member-role', [.text(m.role ?? 'Core Team Member')]),
        if (m.bio != null) p(classes: 'member-bio', [.text(m.bio!)]),
        div(classes: 'member-links', [
          if (m.github != null)
            a(
              href: m.github!,
              classes: 'member-link',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer', 'aria-label': 'GitHub'},
              [
                img(src: 'images/github.svg', width: 20, height: 20, attributes: {'alt': 'GitHub'}),
              ],
            ),
          if (m.twitter != null)
            a(
              href: m.twitter!,
              classes: 'member-link',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer', 'aria-label': 'Twitter'},
              [
                img(src: 'images/twitter.svg', width: 20, height: 20, attributes: {'alt': 'Twitter'}),
              ],
            ),
          if (m.linkedin != null)
            a(
              href: m.linkedin!,
              classes: 'member-link',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer', 'aria-label': 'LinkedIn'},
              [
                img(src: 'images/linkedin.svg', width: 20, height: 20, attributes: {'alt': 'LinkedIn'}),
              ],
            ),
        ]),
      ]),
    ]);
  }

  static String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.substring(0, 2).toUpperCase();
  }

  @css
  static List<StyleRule> get styles => [
    css('.team-grid').styles(
      display: .grid,
      gap: .all(20.px),
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(280px, 1fr))'},
    ),
    css('.member-card').styles(
      display: .flex,
      padding: .all(20.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(12.px)),
      flexDirection: .row,
      alignItems: .start,
      gap: .all(16.px),
      backgroundColor: surfaceColor,
    ),
    css('.member-avatar').styles(
      display: .flex,
      width: 48.px,
      height: 48.px,
      minWidth: 48.px,
      radius: .all(.circular(12.px)),
      overflow: .hidden,
      justifyContent: .center,
      alignItems: .center,
      backgroundColor: primaryColor,
    ),
    css('.member-photo').styles(
      width: 100.percent,
      height: 100.percent,
      raw: {'object-fit': 'cover'},
    ),
    css('.member-initials').styles(color: Colors.white, fontSize: 1.1.rem, fontWeight: .w700),
    css('.member-info').styles(display: .flex, flexDirection: .column, gap: .all(4.px)),
    css('.member-name').styles(color: textColor, fontSize: 1.rem, fontWeight: .w700),
    css('.member-role').styles(color: mutedTextColor, fontSize: 0.85.rem, fontWeight: .w500),
    css('.member-bio').styles(
      margin: .only(top: 4.px),
      color: mutedTextColor,
      fontSize: 0.9.rem,
      lineHeight: 1.6.em,
    ),
    css('.member-links').styles(
      display: .flex,
      margin: .only(top: 4.px),
      flexWrap: .wrap,
      gap: .all(12.px),
    ),
    css('.member-link').styles(
      display: .flex,
      alignItems: .center,
      raw: {'opacity': '0.6', 'transition': 'opacity 150ms ease'},
    ),
    css('.member-link:hover').styles(raw: {'opacity': '1'}),
  ];
}
