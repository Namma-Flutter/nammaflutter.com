enum EventType { past, upcoming }

class EventItem {
  final String title;
  final String date;
  final String venue;
  final EventType type;
  final String? link;
  final String? description;

  const EventItem({
    required this.title,
    required this.date,
    required this.venue,
    required this.type,
    this.link,
    this.description,
  });
}

const events = <EventItem>[
  EventItem(
    title: '2nd Year Cotton Anniversary',
    date: '9 May 2026',
    venue: 'Comcast',
    type: EventType.past,
  ),
  EventItem(
    title: 'FOSS United Coimbatore X Namma Flutter Meetup',
    date: '28 Mar 2026',
    venue: 'iamneo.ai, Coimbatore',
    type: EventType.past,
  ),
  EventItem(
    title: 'Oru Pudi ?',
    date: '31 Jan 2026',
    venue: 'Ocean Academy, Puducherry',
    type: EventType.past,
  ),
  EventItem(
    title: 'Flutter Devcon',
    date: '20 Dec 2025',
    venue: 'PayPal India Development Center',
    type: EventType.past,
  ),
  EventItem(
    title: 'Indie App Development with Flutter',
    date: '20 Sept 2025',
    venue: 'Sciflare Technologies',
    type: EventType.past,
  ),
  EventItem(
    title: 'FOSS X Namma Flutter Madurai Meetup',
    date: '23 Aug 2025',
    venue: 'Dot Com Infoway',
    type: EventType.past,
  ),
  EventItem(
    title: 'July Meetup (Singapengal in Flutter)',
    date: '26 Jul 2025',
    venue: 'Mako IT Lab',
    type: EventType.past,
  ),
  EventItem(
    title: 'June Meetup',
    date: '21 Jun 2025',
    venue: 'M2P Fintech',
    type: EventType.past,
  ),
  EventItem(
    title: '1st year Paper Anniversary powered by Zoho Apptics',
    date: '26 Apr 2025',
    venue: 'Entrans Technologies Private Limited',
    type: EventType.past,
  ),
  EventItem(
    title: 'Namma Flutter Annual Beginner Flutter Workshop',
    date: '15 Feb 2025',
    venue: 'Chennai',
    type: EventType.past,
  ),
  EventItem(
    title: 'Mini Hackathon',
    date: '21 Dec 2024',
    venue: 'Thiran Technologies Private Limited',
    type: EventType.past,
  ),
  EventItem(
    title: 'November Meetup',
    date: '9 Nov 2024',
    venue: 'Ticel Bio Park Phase 2',
    type: EventType.past,
  ),
  EventItem(
    title: 'Namma Flutter Dev-con',
    date: '28 Sept 2024',
    venue: 'Freshworks',
    type: EventType.past,
  ),
  EventItem(
    title: 'August Online Meetup',
    date: '24 Aug 2024',
    venue: 'Online',
    type: EventType.past,
  ),
  EventItem(
    title: 'Namma Flutter - July Meetup',
    date: '27 Jul 2024',
    venue: 'Pickyourtrail Capital Towers, Teynampet, Chennai',
    type: EventType.past,
  ),
  EventItem(
    title: 'Code Sapiens Summer of Code X NammaFlutter',
    date: '7 Jul 2024',
    venue: 'Online',
    type: EventType.past,
  ),
  EventItem(
    title: 'Flutter Chennai - June Meetup',
    date: '15 Jun 2024',
    venue: 'Thiran Technologies Private Limited',
    type: EventType.past,
  ),
  EventItem(
    title: 'Flutter Beginner Session',
    date: '30 Apr 2024',
    venue: 'Gmeet',
    type: EventType.past,
  ),
];
