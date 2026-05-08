import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/apps_showcase.dart';
import '../components/college_ticker.dart';
import '../components/cta_band.dart';
import '../components/event_spotlight.dart';
import '../components/hero.dart';
import '../components/namma_word.dart';
import '../components/podcast_strip.dart';
import '../components/program_showcase.dart';
import '../components/sponsors_grid.dart';
import '../components/stats_strip.dart';
import '../data/socials.dart';

@client
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return .fragment([
      const Hero(
        kicker: 'Flutter Community Events & Meetups',
        tagline: 'Chennai\'s loudest Flutter community.',
        subtext:
            'Workshops, hackathons, meetups, and a podcast, built by the community for the community. Whether you\'re shipping your first widget or your hundredth, there\'s a seat for you.',
        primaryLabel: 'Join our Telegram',
        primaryHref: SocialLinks.telegram,
        primaryExternal: true,
        secondaryLabel: 'View Events',
        secondaryHref: SocialLinks.luma,
        secondaryExternal: true,
      ),
      const StatsStrip(),
      const EventSpotlight(),
      const ProgramShowcase(),
      const AppsShowcase(),
      const CollegeTicker(),
      const SponsorsGrid(),
      const PodcastStrip(),
      CtaBand(
        headline: [
          .text('Ready to be part of '),
          const NammaWord(),
          .text(' Flutter?'),
        ],
        buttonLabel: 'Join our Telegram',
        buttonHref: SocialLinks.telegram,
        buttonExternal: true,
      ),
    ]);
  }
}
