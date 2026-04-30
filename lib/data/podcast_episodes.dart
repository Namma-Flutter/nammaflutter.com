class PodcastEpisode {
  final int number;
  final String title;
  final String description;
  final String videoId;

  const PodcastEpisode({
    required this.number,
    required this.title,
    required this.description,
    required this.videoId,
  });
}

const podcastEpisodes = <PodcastEpisode>[
  PodcastEpisode(
    number: 1,
    title: 'Journey of a Flutter Developer',
    description:
        'Praveen and Harish share how they got started with Flutter, what kept them hooked, and the lessons from years of building production apps.',
    videoId: 'Y2DXbXJ2Tgo',
  ),
  PodcastEpisode(
    number: 2,
    title: 'Flutter is easier than Web',
    description:
        'A conversation from our Madurai chapter with Magesh and Renga on why Flutter feels more approachable than the web stack.',
    videoId: 'SlGxBpfE7_s',
  ),
];
