import 'package:jaspr/dom.dart' hide events;
import 'package:jaspr/jaspr.dart';

import '../components/section.dart';
import '../constants/theme.dart';
import '../data/events.dart';

@client
class Events extends StatelessComponent {
  const Events({super.key});

  @override
  Component build(BuildContext context) {
    final upcoming = events.where((e) => e.type == EventType.upcoming).toList();
    final past = events.where((e) => e.type == EventType.past).toList();

    return Section(
      eyebrow: 'Events',
      title: 'From meetups to conferences.',
      subtitle: 'A growing calendar of Namma Flutter events — in Chennai and beyond.',
      child: .fragment([
        if (upcoming.isNotEmpty) ...[
          h3(classes: 'events-group-heading', [.text('Upcoming')]),
          div(classes: 'events-list', [
            for (final e in upcoming) _eventCard(e),
          ]),
        ],
        h3(classes: 'events-group-heading events-group-heading-past', [.text('Past Events')]),
        div(classes: 'events-list', [
          for (final e in past) _eventCard(e),
        ]),
      ]),
    );
  }

  static Component _eventCard(EventItem e) {
    return div(classes: 'event-card', [
      div(classes: 'event-date', [.text(e.date)]),
      div(classes: 'event-info', [
        div(classes: 'event-header', [
          h4(classes: 'event-title', [.text(e.title)]),
          span(
            classes: e.type == EventType.upcoming ? 'event-badge event-badge-upcoming' : 'event-badge event-badge-past',
            [.text(e.type == EventType.upcoming ? 'Upcoming' : 'Past')],
          ),
        ]),
        p(classes: 'event-venue', [.text(e.venue)]),
        if (e.description != null) p(classes: 'event-desc', [.text(e.description!)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.events-group-heading').styles(
      margin: .only(bottom: 16.px, top: 40.px),
      color: textColor,
      fontSize: 1.25.rem,
      fontWeight: .w700,
    ),
    css('.events-group-heading-past').styles(color: mutedTextColor),
    css('.events-list').styles(display: .flex, flexDirection: .column, gap: .all(16.px)),
    css('.event-card').styles(
      display: .flex,
      padding: .all(24.px),
      border: .all(style: BorderStyle.solid, color: borderColor, width: 1.px),
      radius: .all(.circular(12.px)),
      flexDirection: .row,
      alignItems: .start,
      gap: .all(24.px),
      backgroundColor: surfaceColor,
    ),
    css('.event-date').styles(
      minWidth: 100.px,
      padding: .only(top: 2.px),
      color: primaryColor,
      fontSize: 0.9.rem,
      fontWeight: .w600,
    ),
    css('.event-info').styles(display: .flex, flexDirection: .column, gap: .all(6.px), flex: .grow(1)),
    css('.event-header').styles(
      display: .flex,
      flexDirection: .row,
      flexWrap: .wrap,
      alignItems: .center,
      gap: .all(10.px),
    ),
    css('.event-title').styles(color: textColor, fontSize: 1.05.rem, fontWeight: .w700),
    css('.event-badge').styles(
      padding: .symmetric(vertical: 3.px, horizontal: 10.px),
      radius: .all(.circular(999.px)),
      fontSize: 0.75.rem,
      fontWeight: .w600,
    ),
    css('.event-badge-upcoming').styles(color: primaryColor, backgroundColor: Color('#E8F2FB')),
    css('.event-badge-past').styles(color: mutedTextColor, backgroundColor: surfaceMuted),
    css('.event-venue').styles(color: mutedTextColor, fontSize: 0.9.rem),
    css('.event-desc').styles(color: mutedTextColor, fontSize: 0.9.rem),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.event-card').styles(flexDirection: .column),
    ]),
  ];
}
