import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/podcast_episodes.dart';

class PodcastStrip extends StatelessComponent {
  const PodcastStrip({super.key});

  @override
  Component build(BuildContext context) {
    final episodes = podcastEpisodes.take(3).toList();

    return div(classes: 'podcast-wrap', [
      div(classes: 'container', [
        div(classes: 'podcast-head', [
          div([
            p(classes: 'podcast-eyebrow', [.text('Namma Devs')]),
            h2(classes: 'podcast-title', [.text('The unofficial Flutter podcast from Chennai.')]),
          ]),
          a(
            href: 'https://www.youtube.com/@nammaflutter',
            classes: 'podcast-all',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            [.text('All episodes →')],
          ),
        ]),
        div(classes: 'podcast-grid', [
          for (final ep in episodes)
            a(
              href: 'https://www.youtube.com/watch?v=${ep.videoId}',
              classes: 'podcast-card',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
              [
                div(classes: 'podcast-thumb', [
                  img(
                    src: 'https://i.ytimg.com/vi/${ep.videoId}/hqdefault.jpg',
                    attributes: {'alt': ep.title, 'loading': 'lazy'},
                  ),
                  span(classes: 'podcast-play', [.text('▶')]),
                ]),
                div(classes: 'podcast-meta', [
                  span(classes: 'podcast-num', [.text('Episode ${ep.number}')]),
                  h3(classes: 'podcast-ep-title', [.text(ep.title)]),
                  p(classes: 'podcast-desc', [.text(ep.description)]),
                ]),
              ],
            ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.podcast-wrap').styles(
      padding: .symmetric(vertical: 80.px),
      color: Colors.white,
      backgroundColor: darkSurface,
    ),
    css('.podcast-head').styles(
      display: .flex,
      margin: .only(bottom: 40.px),
      flexDirection: .row,
      flexWrap: .wrap,
      justifyContent: .spaceBetween,
      alignItems: .end,
      gap: .all(16.px),
    ),
    css('.podcast-eyebrow').styles(
      margin: .only(bottom: 8.px),
      color: accentWarm,
      fontSize: 0.85.rem,
      fontWeight: .w700,
      letterSpacing: 1.5.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.podcast-title').styles(
      maxWidth: 700.px,
      color: Colors.white,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 2.2.rem,
      fontWeight: .w700,
      letterSpacing: (-0.5).px,
      lineHeight: 1.2.em,
    ),
    css('.podcast-all').styles(
      color: Colors.white,
      fontSize: 0.95.rem,
      fontWeight: .w600,
    ),
    css('.podcast-all:hover').styles(color: accentColor),
    css('.podcast-grid').styles(
      display: .grid,
      gap: .all(20.px),
      raw: {'grid-template-columns': 'repeat(3, 1fr)'},
    ),
    css('.podcast-card').styles(
      display: .flex,
      radius: .all(.circular(16.px)),
      transition: Transition('transform', duration: 200.ms, curve: .easeOut),
      flexDirection: .column,
      color: Colors.white,
      textDecoration: TextDecoration(line: .none),
      raw: {
        'overflow': 'hidden',
        'background': 'rgba(255, 255, 255, 0.05)',
        'border': '1px solid rgba(255, 255, 255, 0.1)',
      },
    ),
    css('.podcast-card:hover').styles(
      transform: .translate(x: 0.px, y: (-4).px),
      raw: {'background': 'rgba(255, 255, 255, 0.08)'},
    ),
    css('.podcast-thumb').styles(
      raw: {
        'position': 'relative',
        'aspect-ratio': '16 / 9',
        'overflow': 'hidden',
      },
    ),
    css('.podcast-thumb img').styles(
      width: 100.percent,
      height: 100.percent,
      raw: {'object-fit': 'cover'},
    ),
    css('.podcast-play').styles(
      display: .flex,
      width: 56.px,
      height: 56.px,
      radius: .all(.circular(999.px)),
      transition: Transition('all', duration: 180.ms),
      justifyContent: .center,
      alignItems: .center,
      color: darkSurface,
      fontSize: 1.4.rem,
      backgroundColor: Colors.white,
      raw: {
        'position': 'absolute',
        'top': '50%',
        'left': '50%',
        'transform': 'translate(-50%, -50%)',
        'box-shadow': '0 8px 24px rgba(0, 0, 0, 0.4)',
      },
    ),
    css('.podcast-card:hover .podcast-play').styles(
      color: Colors.white,
      backgroundColor: accentWarm,
    ),
    css('.podcast-meta').styles(
      display: .flex,
      padding: .all(20.px),
      flexDirection: .column,
      gap: .all(8.px),
    ),
    css('.podcast-num').styles(
      color: accentColor,
      fontSize: 0.75.rem,
      fontWeight: .w700,
      letterSpacing: 1.px,
      raw: {'text-transform': 'uppercase'},
    ),
    css('.podcast-ep-title').styles(
      color: Colors.white,
      fontFamily: const .list([displayFontFamily, FontFamilies.sansSerif]),
      fontSize: 1.15.rem,
      fontWeight: .w700,
      lineHeight: 1.3.em,
    ),
    css('.podcast-desc').styles(
      margin: .zero,
      color: .rgba(255, 255, 255, 0.65),
      fontSize: 0.85.rem,
      lineHeight: 1.6.em,
    ),
    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.podcast-wrap').styles(padding: .symmetric(vertical: 56.px)),
      css('.podcast-title').styles(fontSize: 1.6.rem),
      css('.podcast-grid').styles(raw: {'grid-template-columns': '1fr'}),
    ]),
  ];
}
