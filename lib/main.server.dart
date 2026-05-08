library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);
  runApp(
    Document(
      title: 'Namma Flutter, Chennai\'s Flutter Community',
      head: [
        meta(attributes: {'name': 'viewport', 'content': 'width=device-width, initial-scale=1.0'}),
        meta(
          attributes: {
            'name': 'description',
            'content':
                'Namma Flutter is Chennai\'s largest Flutter developer community: meetups, hackathons, open-source apps, and more.',
          },
        ),
        meta(attributes: {'name': 'og:title', 'content': 'Namma Flutter, Chennai\'s Flutter Community'}),
        meta(attributes: {'name': 'og:type', 'content': 'website'}),
        link(rel: 'manifest', href: 'manifest.json'),
        link(rel: 'icon', type: 'image/png', href: 'favicon.png'),
        link(rel: 'stylesheet', href: 'styles.css'),
      ],
      body: const App(),
    ),
  );
}
