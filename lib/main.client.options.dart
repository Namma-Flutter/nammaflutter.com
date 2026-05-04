// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:nammaflutter/pages/about.dart' deferred as _about;
import 'package:nammaflutter/pages/apps.dart' deferred as _apps;
import 'package:nammaflutter/pages/contact.dart' deferred as _contact;
import 'package:nammaflutter/pages/events.dart' deferred as _events;
import 'package:nammaflutter/pages/home.dart' deferred as _home;
import 'package:nammaflutter/pages/program_detail.dart'
    deferred as _program_detail;
import 'package:nammaflutter/pages/programs.dart' deferred as _programs;
import 'package:nammaflutter/pages/store.dart' deferred as _store;
import 'package:nammaflutter/pages/team.dart' deferred as _team;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'about': ClientLoader((p) => _about.About(), loader: _about.loadLibrary),
    'apps': ClientLoader((p) => _apps.Apps(), loader: _apps.loadLibrary),
    'contact': ClientLoader(
      (p) => _contact.Contact(),
      loader: _contact.loadLibrary,
    ),
    'events': ClientLoader(
      (p) => _events.Events(),
      loader: _events.loadLibrary,
    ),
    'home': ClientLoader((p) => _home.Home(), loader: _home.loadLibrary),
    'program_detail': ClientLoader(
      (p) => _program_detail.ProgramDetail(slug: p['slug'] as String),
      loader: _program_detail.loadLibrary,
    ),
    'programs': ClientLoader(
      (p) => _programs.Programs(),
      loader: _programs.loadLibrary,
    ),
    'store': ClientLoader((p) => _store.Store(), loader: _store.loadLibrary),
    'team': ClientLoader((p) => _team.Team(), loader: _team.loadLibrary),
  },
);
