class TeamMember {
  final String name;
  final String? bio;
  final String? photo;
  final String? github;
  final String? twitter;
  final String? linkedin;

  const TeamMember({
    required this.name,
    this.bio,
    this.photo,
    this.github,
    this.twitter,
    this.linkedin,
  });
}

const team = <TeamMember>[
  TeamMember(
    name: 'Justin Benito',
    bio:
        'Sparked Namma Flutter after connecting with Abhishek Doshi and the Flutter India community. Passionate about growing Flutter grassroots in Chennai.',
    github: 'https://github.com/justinbenito',
    twitter: 'https://x.com/JustinbenitoB',
    linkedin: 'https://linkedin.com/in/justinbenito',
    photo: 'images/justin.png',
  ),
  TeamMember(
    name: 'Harish Raj R',
    linkedin: 'https://www.linkedin.com/in/harish-raj-r-/',
    photo: 'images/harishraj.png',
  ),
  TeamMember(
    name: 'Praveen Pandiyan',
    linkedin: 'https://www.linkedin.com/in/pandiyan-praveen/',
    photo: 'images/praveen.png',
  ),
  TeamMember(
    name: 'Shiva Prasath R',
    linkedin: 'https://www.linkedin.com/in/shivaprasathr396',
    photo: 'images/shiva.png',
  ),
  TeamMember(
    name: 'Akash Senthil',
    github: 'https://github.com/AkashProfessionalCoder',
    twitter: 'https://x.com/akashprocoder',
    linkedin: 'https://www.linkedin.com/in/akashprocoder',
    photo: 'images/akash.png',
  ),
  TeamMember(
    name: 'Vaishnavi G',
    linkedin: 'https://linkedin.com/in/vaishnavi-g-900b8121a',
    photo: 'images/vaishnavi.png',
  ),
  TeamMember(
    name: 'Kumaran Karunakaran',
    github: 'https://github.com/kumaran-flutter',
    linkedin: 'https://www.linkedin.com/in/kumarankarunakaran/',
    photo: 'images/kumaran.png',
  ),
  TeamMember(
    name: 'Harish Anbalagan',
    bio: 'Creator of Namma Wallet. Focused on community ops, speaker programs, and making every event count.',
    github: 'https://github.com/Harishwarrior',
    twitter: 'https://x.com/theflutterboi',
    linkedin: 'https://www.linkedin.com/in/harishanbalagan/',
    photo: 'images/harish.png',
  ),
];
