import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/button.dart';
import '../components/cta_band.dart';
import '../components/section.dart';
import '../constants/theme.dart';
import '../data/podcast_episodes.dart';
import '../data/programs.dart';

@client
class ProgramDetail extends StatelessComponent {
  final String slug;
  const ProgramDetail({required this.slug, super.key});

  @override
  Component build(BuildContext context) {
    final program = programBySlug(slug);
    if (program == null) {
      return _NotFound();
    }

    return .fragment([
      _DetailHeader(program: program),
      _detailBody(program),
      const CtaBand(
        headline: 'Want to speak, sponsor, or volunteer?',
        buttonLabel: 'Get in touch',
        buttonHref: '/contact',
      ),
    ]);
  }

  Component _detailBody(Program program) {
    if (program.slug == 'namma-devs') {
      return _EpisodesSection();
    }
    return _RegisterInterest(program: program);
  }

  @css
  static List<StyleRule> get styles => [
    // ── Detail header band (muted bg) ─────────────────────────────────
    css('.detail-header', [
      css('&').styles(
        padding: .symmetric(vertical: 64.px),
        backgroundColor: surfaceMuted,
      ),
      css('.detail-header-inner').styles(
        display: .flex,
        maxWidth: 1120.px,
        padding: .symmetric(horizontal: 24.px),
        margin: .symmetric(horizontal: .auto),
        flexDirection: .column,
        gap: .all(32.px),
      ),
      css('.back-link').styles(
        display: .inlineFlex,
        transition: Transition('color', duration: 180.ms, curve: .easeOut),
        alignItems: .center,
        gap: .all(6.px),
        color: mutedTextColor,
        fontSize: 0.95.rem,
        fontWeight: .w500,
      ),
      css('.back-link:hover').styles(color: primaryColor),
      css('.detail-header-body').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(32.px),
      ),
      css('.detail-icon-tile').styles(
        display: .flex,
        width: 120.px,
        height: 120.px,
        border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
        radius: .all(.circular(22.px)),
        justifyContent: .center,
        alignItems: .center,
        fontSize: 4.rem,
        backgroundColor: surfaceColor,
        raw: {'box-shadow': '0 1px 2px rgba(14, 26, 36, 0.04)'},
      ),
      css('.detail-text').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(14.px),
      ),
      css('.detail-chips').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
      ),
      css('.detail-title').styles(
        margin: .zero,
        color: textColor,
        fontSize: 2.5.rem,
        fontWeight: .w700,
        lineHeight: 1.1.em,
      ),
      css('.detail-desc').styles(
        maxWidth: 720.px,
        margin: .zero,
        color: mutedTextColor,
        fontSize: 1.1.rem,
        lineHeight: 1.7.em,
      ),
      css.media(MediaQuery.screen(maxWidth: 720.px), [
        css('.detail-header-body').styles(flexDirection: .column, alignItems: .start),
        css('.detail-icon-tile').styles(width: 88.px, height: 88.px, fontSize: 3.rem),
        css('.detail-title').styles(fontSize: 1.9.rem),
      ]),
    ]),

    // ── Episodes ──────────────────────────────────────────────────────
    css('.episodes', [
      css('&').styles(display: .flex, flexDirection: .column, gap: .all(40.px)),
      css('.episode-card').styles(
        display: .flex,
        border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
        radius: .all(.circular(18.px)),
        overflow: .hidden,
        flexDirection: .column,
        backgroundColor: surfaceColor,
        raw: {'box-shadow': '0 1px 2px rgba(14, 26, 36, 0.04)'},
      ),
      css('.episode-frame').styles(
        width: 100.percent,
        border: .all(style: BorderStyle.none, color: Colors.transparent, width: .zero),
        raw: {'aspect-ratio': '16 / 9', 'display': 'block'},
      ),
      css('.episode-meta').styles(
        display: .flex,
        padding: .all(28.px),
        flexDirection: .column,
        gap: .all(10.px),
      ),
      css('.episode-tag').styles(
        display: .inlineFlex,
        padding: .symmetric(vertical: 4.px, horizontal: 10.px),
        radius: .all(.circular(999.px)),
        alignSelf: .start,
        color: primaryColor,
        fontSize: 0.72.rem,
        fontWeight: .w700,
        letterSpacing: 1.2.px,
        backgroundColor: Color('#E8F2FB'),
        raw: {'text-transform': 'uppercase', 'font-feature-settings': '"tnum"'},
      ),
      css('.episode-title').styles(
        margin: .zero,
        color: textColor,
        fontSize: 1.35.rem,
        fontWeight: .w700,
        lineHeight: 1.3.em,
      ),
      css('.episode-desc').styles(
        margin: .zero,
        color: mutedTextColor,
        fontSize: 1.rem,
        lineHeight: 1.7.em,
      ),
    ]),

    // ── Register-interest card ─────────────────────────────────────────
    css('.register-card', [
      css('&').styles(
        display: .flex,
        maxWidth: 720.px,
        padding: .all(56.px),
        margin: .symmetric(horizontal: .auto),
        border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
        radius: .all(.circular(20.px)),
        flexDirection: .column,
        alignItems: .center,
        gap: .all(16.px),
        textAlign: .center,
        backgroundColor: surfaceColor,
        raw: {'box-shadow': '0 1px 2px rgba(14, 26, 36, 0.04)'},
      ),
      css('.register-eyebrow').styles(
        color: accentColor,
        fontSize: 0.8.rem,
        fontWeight: .w700,
        letterSpacing: 1.5.px,
        raw: {'text-transform': 'uppercase'},
      ),
      css('.register-title').styles(
        maxWidth: 560.px,
        margin: .zero,
        color: textColor,
        fontSize: 1.85.rem,
        fontWeight: .w700,
        lineHeight: 1.2.em,
      ),
      css('.register-body').styles(
        maxWidth: 560.px,
        margin: .zero,
        color: mutedTextColor,
        fontSize: 1.05.rem,
        lineHeight: 1.7.em,
      ),
      css('.register-actions').styles(
        display: .flex,
        margin: .only(top: 8.px),
        flexWrap: .wrap,
        justifyContent: .center,
        gap: .all(12.px),
      ),
      css.media(MediaQuery.screen(maxWidth: 600.px), [
        css('.register-card').styles(padding: .all(32.px)),
        css('.register-card .register-title').styles(fontSize: 1.4.rem),
      ]),
    ]),

    // ── Detail-page chips share base styles with programs.dart ────────
    // (No need to redeclare — `.chip` is already defined globally there.)
  ];
}

// ── Header ─────────────────────────────────────────────────────────────

class _DetailHeader extends StatelessComponent {
  final Program program;
  const _DetailHeader({required this.program});

  @override
  Component build(BuildContext context) {
    return div(classes: 'detail-header', [
      div(classes: 'detail-header-inner', [
        a(href: '/programs', classes: 'back-link', [.text('← All programs')]),
        div(classes: 'detail-header-body', [
          div(classes: 'detail-icon-tile', [.text(program.icon)]),
          div(classes: 'detail-text', [
            div(classes: 'detail-chips', [
              span(classes: 'chip-type', [.text(program.type)]),
              span(classes: 'chip-freq', [.text(program.frequency)]),
            ]),
            h1(classes: 'detail-title', [.text(program.name)]),
            p(classes: 'detail-desc', [.text(program.description)]),
          ]),
        ]),
      ]),
    ]);
  }
}

// ── Episodes section (Namma Devs) ──────────────────────────────────────

class _EpisodesSection extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Section(
      eyebrow: 'Episodes',
      title: 'Watch the conversations.',
      subtitle: 'Real stories from Flutter developers in our community, recorded openly and shared freely.',
      child: div(classes: 'episodes', [
        for (final ep in podcastEpisodes) _EpisodeCard(episode: ep),
      ]),
    );
  }
}

class _EpisodeCard extends StatelessComponent {
  final PodcastEpisode episode;
  const _EpisodeCard({required this.episode});

  @override
  Component build(BuildContext context) {
    final num = episode.number < 10 ? '0${episode.number}' : '${episode.number}';
    return div(classes: 'episode-card', [
      iframe(
        src: 'https://www.youtube.com/embed/${episode.videoId}',
        loading: .lazy,
        referrerPolicy: .strictOriginWhenCrossOrigin,
        classes: 'episode-frame',
        allow: 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share',
        attributes: {'allowfullscreen': '', 'title': 'Namma Devs Episode $num — ${episode.title}'},
        [],
      ),
      div(classes: 'episode-meta', [
        span(classes: 'episode-tag', [.text('Episode $num')]),
        h3(classes: 'episode-title', [.text(episode.title)]),
        p(classes: 'episode-desc', [.text(episode.description)]),
      ]),
    ]);
  }
}

// ── Register-interest (everything except namma-devs) ───────────────────

class _RegisterInterest extends StatelessComponent {
  final Program program;
  const _RegisterInterest({required this.program});

  @override
  Component build(BuildContext context) {
    return Section(
      child: div(classes: 'register-card', [
        p(classes: 'register-eyebrow', [.text('Stay in the loop')]),
        h3(classes: 'register-title', [.text('Be the first to know about the next ${program.name}.')]),
        p(classes: 'register-body', [
          .text(
            'We\'re actively running this program. Drop us a note and we\'ll let you know about the next session, how to participate, or how to bring it to your campus or city.',
          ),
        ]),
        div(classes: 'register-actions', [
          const Button.primary('Register interest', '/contact'),
          const Button.ghost('← Back to all programs', '/programs'),
        ]),
      ]),
    );
  }
}

// ── Not-found fallback ─────────────────────────────────────────────────

class _NotFound extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return .fragment([
      Section(
        eyebrow: 'Hmm',
        title: 'We couldn\'t find that program.',
        subtitle: 'It may have moved, or the link is wrong. Head back and pick another one.',
        child: div(
          styles: Styles(display: .flex, justifyContent: .start),
          [const Button.primary('Back to programs', '/programs')],
        ),
      ),
      const CtaBand(
        headline: 'Want to speak, sponsor, or volunteer?',
        buttonLabel: 'Get in touch',
        buttonHref: '/contact',
      ),
    ]);
  }
}
