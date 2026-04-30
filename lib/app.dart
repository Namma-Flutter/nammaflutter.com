import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/footer.dart';
import 'components/header.dart';
import 'pages/about.dart';
import 'pages/apps.dart';
import 'pages/contact.dart';
import 'pages/events.dart';
import 'pages/home.dart';
import 'pages/program_detail.dart';
import 'pages/programs.dart';
import 'pages/store.dart';
import 'pages/team.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'main', [
      const Header(),
      div(classes: 'content-area', [
        Router(
          routes: [
            Route(path: '/', title: 'Home', builder: (context, state) => _page(const Home())),
            Route(path: '/about', title: 'About', builder: (context, state) => _page(const About())),
            Route(path: '/apps', title: 'Apps', builder: (context, state) => _page(const Apps())),
            Route(path: '/programs', title: 'Programs', builder: (context, state) => _page(const Programs())),
            Route(
              path: '/programs/fly-with-flutter',
              title: 'Fly with Flutter | Namma Flutter',
              builder: (context, state) => _page(const ProgramDetail(slug: 'fly-with-flutter')),
            ),
            Route(
              path: '/programs/flut-hacks',
              title: 'Flut Hacks | Namma Flutter',
              builder: (context, state) => _page(const ProgramDetail(slug: 'flut-hacks')),
            ),
            Route(
              path: '/programs/namma-workshops',
              title: 'Namma Workshops | Namma Flutter',
              builder: (context, state) => _page(const ProgramDetail(slug: 'namma-workshops')),
            ),
            Route(
              path: '/programs/namma-devs',
              title: 'Namma Devs | Namma Flutter',
              builder: (context, state) => _page(const ProgramDetail(slug: 'namma-devs')),
            ),
            Route(
              path: '/programs/devrooms',
              title: 'DevRooms | Namma Flutter',
              builder: (context, state) => _page(const ProgramDetail(slug: 'devrooms')),
            ),
            Route(
              path: '/programs/namma-flutteristas',
              title: 'Namma Flutteristas | Namma Flutter',
              builder: (context, state) => _page(const ProgramDetail(slug: 'namma-flutteristas')),
            ),
            Route(
              path: '/programs/namma-flutter-roadshow',
              title: 'Namma Flutter RoadShow | Namma Flutter',
              builder: (context, state) => _page(const ProgramDetail(slug: 'namma-flutter-roadshow')),
            ),
            Route(path: '/store', title: 'Store', builder: (context, state) => _page(const Store())),
            Route(path: '/events', title: 'Events', builder: (context, state) => _page(const Events())),
            Route(path: '/team', title: 'Team', builder: (context, state) => _page(const Team())),
            Route(path: '/contact', title: 'Contact', builder: (context, state) => _page(const Contact())),
          ],
        ),
      ]),
      const Footer(),
    ]);
  }

  static Component _page(Component child) => div(classes: 'page-fade-in', [child]);

  @css
  static List<StyleRule> get styles => [
    css('.page-fade-in').styles(
      display: .flex,
      flexDirection: .column,
      flex: Flex(grow: 1),
    ),
    css('.main').styles(
      display: .flex,
      minHeight: 100.vh,
      flexDirection: .column,
    ),
    css('.content-area').styles(
      display: .flex,
      flexDirection: .column,
      flex: Flex(grow: 1),
    ),
  ];
}
