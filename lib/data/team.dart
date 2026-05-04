class TeamMember {
  final String name;
  final String? role;
  final String? bio;
  final String? photo;
  final String? github;
  final String? twitter;
  final String? linkedin;

  const TeamMember({
    required this.name,
    this.role,
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
    bio: 'Namma Chennai pola varuma, Namma Flutter dhaan en peruma 🩵 Taking Namma Flutter from Chennai to Globe',
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
    bio: 'A Flutter developer passionate about contributing to the community, actively serving and supporting others. As a core team member, I ensure events run smoothly while creating meaningful and engaging experiences for participants.',
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
    name: 'Kamlesh',
    linkedin: 'https://www.linkedin.com/in/nithin-kamlesh/',
    photo: 'images/kamlesh.png',
  ),
  TeamMember(
    name: 'Santosh',
    linkedin: 'https://www.linkedin.com/in/santosham/',
    photo: 'images/santosh.png',
  ),
  TeamMember(
    name: 'Sarvesh M Rao',
    linkedin: 'https://www.linkedin.com/in/sarvesh-m-rao/',
    photo: 'images/sarvesh.png',
  ),
  TeamMember(
    name: 'Lashika',
    linkedin: 'https://www.linkedin.com/in/lashika-n-b-2b6204289/',
    photo: 'images/lashika.png',
  ),
  TeamMember(
    name: 'Jasim Anwar',
    linkedin: 'https://www.linkedin.com/in/jasim-anwar-81626925b/',
    photo: 'images/jasim.png',
  ),
  TeamMember(
    name: 'Sanju R',
    linkedin: 'https://www.linkedin.com/in/sanju-r-/',
    photo: 'images/sanju.png',
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
