// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:nammaflutter/components/button.dart' as _button;
import 'package:nammaflutter/components/card.dart' as _card;
import 'package:nammaflutter/components/college_ticker.dart' as _college_ticker;
import 'package:nammaflutter/components/cta_band.dart' as _cta_band;
import 'package:nammaflutter/components/footer.dart' as _footer;
import 'package:nammaflutter/components/header.dart' as _header;
import 'package:nammaflutter/components/hero.dart' as _hero;
import 'package:nammaflutter/components/section.dart' as _section;
import 'package:nammaflutter/components/section_preview.dart'
    as _section_preview;
import 'package:nammaflutter/constants/theme.dart' as _theme;
import 'package:nammaflutter/pages/about.dart' as _about;
import 'package:nammaflutter/pages/apps.dart' as _apps;
import 'package:nammaflutter/pages/contact.dart' as _contact;
import 'package:nammaflutter/pages/events.dart' as _events;
import 'package:nammaflutter/pages/home.dart' as _home;
import 'package:nammaflutter/pages/program_detail.dart' as _program_detail;
import 'package:nammaflutter/pages/programs.dart' as _programs;
import 'package:nammaflutter/pages/store.dart' as _store;
import 'package:nammaflutter/pages/team.dart' as _team;
import 'package:nammaflutter/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _about.About: ClientTarget<_about.About>('about'),
    _apps.Apps: ClientTarget<_apps.Apps>('apps'),
    _contact.Contact: ClientTarget<_contact.Contact>('contact'),
    _events.Events: ClientTarget<_events.Events>('events'),
    _home.Home: ClientTarget<_home.Home>('home'),
    _program_detail.ProgramDetail: ClientTarget<_program_detail.ProgramDetail>(
      'program_detail',
      params: __program_detailProgramDetail,
    ),
    _programs.Programs: ClientTarget<_programs.Programs>('programs'),
    _store.Store: ClientTarget<_store.Store>('store'),
    _team.Team: ClientTarget<_team.Team>('team'),
  },
  styles: () => [
    ..._theme.globalStyles,
    ..._app.App.styles,
    ..._button.Button.styles,
    ..._card.NammaCard.styles,
    ..._college_ticker.CollegeTicker.styles,
    ..._cta_band.CtaBand.styles,
    ..._footer.Footer.styles,
    ..._header.Header.styles,
    ..._hero.Hero.styles,
    ..._section.Section.styles,
    ..._section_preview.SectionPreview.styles,
    ..._about.About.styles,
    ..._apps.Apps.styles,
    ..._contact.Contact.styles,
    ..._events.Events.styles,
    ..._home.Home.styles,
    ..._program_detail.ProgramDetail.styles,
    ..._programs.Programs.styles,
    ..._store.Store.styles,
    ..._team.Team.styles,
  ],
);

Map<String, Object?> __program_detailProgramDetail(
  _program_detail.ProgramDetail c,
) => {'slug': c.slug};
