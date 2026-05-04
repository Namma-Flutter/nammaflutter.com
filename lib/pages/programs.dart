import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/button.dart';
import '../components/cta_band.dart';
import '../components/section.dart';
import '../constants/theme.dart';
import '../data/programs.dart';

@client
class Programs extends StatelessComponent {
  const Programs({super.key});

  @override
  Component build(BuildContext context) {
    final featured = programs.first;
    final rest = programs.skip(1).toList();

    return .fragment([
      Section(
        eyebrow: 'What we run',
        title: 'Programs for every level.',
        subtitle:
            'From student bootcamps to city-wide roadshows. Here\'s how Namma Flutter shows up for the community.',
        child: div(classes: 'programs-stack', [
          _Banner(program: featured),
          div(classes: 'programs-grid', [
            for (final prog in rest) _ProgramCard(program: prog),
          ]),
        ]),
      ),
      const CtaBand(
        headline: 'Want to speak, sponsor, or volunteer?',
        buttonLabel: 'Get in touch',
        buttonHref: '/contact',
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.programs-stack').styles(display: .flex, flexDirection: .column, gap: .all(48.px)),

    // ── Banner (featured program, full-width) ─────────────────────────
    css('.banner', [
      css('&').styles(
        display: .grid,
        position: .relative(),
        radius: .all(.circular(20.px)),
        overflow: .hidden,
        backgroundColor: primaryColor,
        raw: {
          'grid-template-columns': '1fr',
          'background-image':
              'radial-gradient(circle at 18% 30%, rgba(19,185,253,0.45), transparent 55%), radial-gradient(circle at 85% 100%, rgba(255,255,255,0.10), transparent 55%)',
        },
      ),
      css('.banner-grid-overlay').styles(
        position: .absolute(top: .zero, left: .zero),
        width: 100.percent,
        height: 100.percent,
        opacity: 0.16,
        pointerEvents: .none,
        raw: {
          'background-image':
              'linear-gradient(rgba(255,255,255,0.14) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.14) 1px, transparent 1px)',
          'background-size': '36px 36px',
          'mask-image': 'radial-gradient(circle at 30% 50%, black 20%, transparent 70%)',
        },
      ),
      css('.banner-emoji').styles(
        position: .absolute(top: .zero, right: 24.px),
        userSelect: .none,
        pointerEvents: .none,
        fontSize: 18.rem,
        lineHeight: 1.em,
        raw: {
          'opacity': '0.18',
          'transform': 'rotate(-12deg) translateY(-12%)',
          'filter': 'drop-shadow(0 12px 32px rgba(0,0,0,0.18))',
        },
      ),
      css('.banner-chips').styles(
        display: .flex,
        position: .absolute(top: 28.px, right: 28.px),
        flexDirection: .column,
        alignItems: .end,
      ),
      css('.banner-body').styles(
        display: .flex,
        position: .relative(),
        padding: .symmetric(vertical: 64.px, horizontal: 56.px),
        flexDirection: .column,
        gap: .all(20.px),
      ),
      css('.banner-eyebrow').styles(
        display: .inlineFlex,
        alignItems: .center,
        gap: .all(8.px),
        color: accentColor,
        fontSize: 0.78.rem,
        fontWeight: .w700,
        letterSpacing: 1.5.px,
        raw: {'text-transform': 'uppercase'},
      ),
      css('.banner-title').styles(
        maxWidth: 640.px,
        margin: .zero,
        color: Colors.white,
        fontSize: 3.rem,
        fontWeight: .w700,
        lineHeight: 1.1.em,
      ),
      css('.banner-desc').styles(
        maxWidth: 620.px,
        margin: .zero,
        color: Color('#DCEAF7'),
        fontSize: 1.1.rem,
        lineHeight: 1.7.em,
      ),
      css('.banner-actions').styles(
        display: .flex,
        margin: .only(top: 12.px),
        flexWrap: .wrap,
        gap: .all(12.px),
      ),
      // Override .btn-primary on the banner to white-on-primary pill
      css('.banner-actions .btn-primary').styles(
        color: primaryColor,
        backgroundColor: Colors.white,
      ),
      css('.banner-actions .btn-primary:hover').styles(backgroundColor: Color('#EAF4FB')),
      // Override .btn-ghost to be a translucent white pill
      css('.banner-actions .btn-ghost').styles(
        border: .all(style: BorderStyle.solid, color: Color('#FFFFFF66'), width: 1.5.px),
        radius: .all(.circular(999.px)),
        color: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      css('.banner-actions .btn-ghost:hover').styles(
        color: Colors.white,
        backgroundColor: Color('#FFFFFF1A'),
      ),
    ]),

    // ── Card grid ─────────────────────────────────────────────────────
    css('.programs-grid').styles(
      display: .grid,
      gap: .all(24.px),
      raw: {'grid-template-columns': 'repeat(3, minmax(0, 1fr))'},
    ),

    // ── Program card ──────────────────────────────────────────────────
    css('.program-card', [
      css('&').styles(
        display: .flex,
        position: .relative(),
        padding: .all(28.px),
        border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
        radius: .all(.circular(16.px)),
        overflow: .hidden,
        transition: Transition('all', duration: 220.ms, curve: .easeOut),
        flexDirection: .column,
        gap: .all(16.px),
        color: textColor,
        backgroundColor: surfaceColor,
        raw: {'box-shadow': '0 1px 2px rgba(14, 26, 36, 0.04)'},
      ),
      css('&::before').styles(
        content: '""',
        display: .block,
        position: .absolute(top: .zero, left: .zero, right: .zero),
        height: 4.px,
        backgroundColor: primaryColor,
      ),
      css('&:hover').styles(
        border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
        raw: {
          'transform': 'translateY(-4px)',
          'box-shadow': '0 16px 40px rgba(1, 88, 155, 0.10)',
        },
      ),
      css('&:hover .card-name').styles(color: primaryColor),
      css('&:hover .card-arrow').styles(
        color: primaryColor,
        raw: {'transform': 'translateX(6px)'},
      ),
      css('.card-header').styles(
        display: .flex,
        justifyContent: .spaceBetween,
        alignItems: .start,
        gap: .all(12.px),
      ),
      css('.card-icon').styles(
        fontSize: 1.85.rem,
        lineHeight: 1.em,
      ),
      css('.card-name').styles(
        margin: .zero,
        transition: Transition('color', duration: 220.ms, curve: .easeOut),
        color: textColor,
        fontSize: 1.25.rem,
        fontWeight: .w700,
        lineHeight: 1.3.em,
      ),
      css('.card-desc').styles(
        margin: .zero,
        color: mutedTextColor,
        fontSize: 0.95.rem,
        lineHeight: 1.65.em,
      ),
      css('.card-footer').styles(
        display: .flex,
        margin: .only(top: 4.px),
        justifyContent: .end,
        alignItems: .center,
      ),
      css('.card-arrow').styles(
        transition: Transition('all', duration: 220.ms, curve: .easeOut),
        color: mutedTextColor,
        fontSize: 1.3.rem,
        fontWeight: .w500,
      ),
    ]),

    // ── Chips (TYPE + FREQ, BL-rounded only, freq smaller and attached) ─
    css('.chip-type').styles(
      display: .inlineFlex,
      padding: .symmetric(vertical: 5.px, horizontal: 12.px),
      alignItems: .center,
      gap: .all(6.px),
      color: primaryColor,
      fontSize: 0.72.rem,
      fontWeight: .w700,
      letterSpacing: 1.px,
      backgroundColor: Color('#E0EEF9'),
      raw: {'border-radius': '0 0 0 10px', 'text-transform': 'uppercase'},
    ),
    css('.chip-freq').styles(
      display: .inlineFlex,
      padding: .symmetric(vertical: 1.px, horizontal: 8.px),
      alignItems: .center,
      color: mutedTextColor,
      fontSize: 0.5.rem,
      fontWeight: .w600,
      letterSpacing: 0.8.px,
      backgroundColor: Color('#EEF2F6'),
      raw: {'border-radius': '0 0 0 8px', 'text-transform': 'uppercase'},
    ),
    css('.chip-stack').styles(display: .flex, flexDirection: .column, alignItems: .end),

    // ── Per-type colored category chip ────────────────────────────────
    css('.type-education .chip-type').styles(color: primaryColor, backgroundColor: Color('#E0EEF9')),
    css('.type-hackathon .chip-type').styles(color: Color('#92400E'), backgroundColor: Color('#FEF3C7')),
    css('.type-workshop .chip-type').styles(color: Color('#065F46'), backgroundColor: Color('#D1FAE5')),
    css('.type-podcast .chip-type').styles(color: Color('#5B21B6'), backgroundColor: Color('#EDE9FE')),
    css('.type-community .chip-type').styles(color: Color('#1E40AF'), backgroundColor: Color('#DBEAFE')),
    css('.type-inclusion .chip-type').styles(color: Color('#9D174D'), backgroundColor: Color('#FCE7F3')),
    css('.type-roadshow .chip-type').styles(color: Color('#115E59'), backgroundColor: Color('#CCFBF1')),

    // ── Banner-specific chip overrides (translucent white) ────────────
    css('.banner .chip-type').styles(
      color: Colors.white,
      backgroundColor: Color('#FFFFFF38'),
      raw: {'border-radius': '0 0 0 10px', 'text-transform': 'uppercase', 'backdrop-filter': 'blur(6px)'},
    ),
    css('.banner .chip-freq').styles(
      color: Color('#FFFFFFC8'),
      backgroundColor: Color('#FFFFFF1F'),
      raw: {'border-radius': '0 0 0 10px', 'text-transform': 'uppercase'},
    ),

    // ── Per-type accent stripe (top-edge bar on each card) ────────────
    css('.program-card.type-hackathon::before').styles(backgroundColor: Color('#F59E0B')),
    css('.program-card.type-workshop::before').styles(backgroundColor: Color('#10B981')),
    css('.program-card.type-podcast::before').styles(backgroundColor: Color('#8B5CF6')),
    css('.program-card.type-community::before').styles(backgroundColor: Color('#3B82F6')),
    css('.program-card.type-inclusion::before').styles(backgroundColor: Color('#EC4899')),
    css('.program-card.type-roadshow::before').styles(backgroundColor: Color('#14B8A6')),
    css('.program-card.type-education::before').styles(backgroundColor: primaryColor),

    // ── Responsive ────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: 960.px), [
      css('.programs-grid').styles(raw: {'grid-template-columns': 'repeat(2, minmax(0, 1fr))'}),
      css('.banner .banner-emoji').styles(fontSize: 14.rem),
      css('.banner .banner-body').styles(
        padding: .symmetric(vertical: 48.px, horizontal: 36.px),
      ),
      css('.banner .banner-title').styles(fontSize: 2.4.rem),
    ]),
    css.media(MediaQuery.screen(maxWidth: 640.px), [
      css('.programs-grid').styles(raw: {'grid-template-columns': '1fr'}),
      css('.banner .banner-chips').styles(
        position: .absolute(top: 16.px, right: 16.px),
      ),
      css('.banner .banner-emoji').styles(fontSize: 11.rem, raw: {'opacity': '0.14'}),
      css('.banner .banner-body').styles(
        padding: .symmetric(vertical: 40.px, horizontal: 24.px),
      ),
      css('.banner .banner-title').styles(fontSize: 1.9.rem),
      css('.banner .banner-desc').styles(fontSize: 1.rem),
    ]),
  ];
}

// ── Banner (featured program) ──────────────────────────────────────────

class _Banner extends StatelessComponent {
  final Program program;
  const _Banner({required this.program});

  @override
  Component build(BuildContext context) {
    return div(classes: 'banner', [
      div(classes: 'banner-grid-overlay', []),
      span(classes: 'banner-emoji', [.text(program.icon)]),
      div(classes: 'banner-chips', [
        _ChipStack(type: program.type, frequency: program.frequency),
      ]),
      div(classes: 'banner-body', [
        span(classes: 'banner-eyebrow', [.text('★ Featured Program')]),
        h2(classes: 'banner-title', [.text(program.name)]),
        p(classes: 'banner-desc', [.text(program.description)]),
        div(classes: 'banner-actions', [
          Button.primary('Learn more →', '/programs/${program.slug}'),
          Button.ghost('Bring it to your campus', '/contact'),
        ]),
      ]),
    ]);
  }
}

// ── Program card ───────────────────────────────────────────────────────

class _ProgramCard extends StatelessComponent {
  final Program program;
  const _ProgramCard({required this.program});

  @override
  Component build(BuildContext context) {
    final typeClass = 'type-${program.type.toLowerCase()}';
    return a(href: '/programs/${program.slug}', classes: 'program-card $typeClass', [
      div(classes: 'card-header', [
        span(classes: 'card-icon', [.text(program.icon)]),
        _ChipStack(type: program.type, frequency: program.frequency),
      ]),
      h3(classes: 'card-name', [.text(program.name)]),
      p(classes: 'card-desc', [.text(program.description)]),
      div(classes: 'card-footer', [
        span(classes: 'card-arrow', [.text('→')]),
      ]),
    ]);
  }
}

// ── Stacked chip group: type on top, frequency 1.5× smaller below ──────

class _ChipStack extends StatelessComponent {
  final String type;
  final String frequency;
  const _ChipStack({required this.type, required this.frequency});

  @override
  Component build(BuildContext context) {
    return div(classes: 'chip-stack', [
      span(classes: 'chip-type', [.text(type)]),
      span(classes: 'chip-freq', [.text(frequency)]),
    ]);
  }
}
