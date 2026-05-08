class Sponsor {
  final String name;
  final String? logoUrl;
  final String? websiteUrl;

  const Sponsor({required this.name, this.logoUrl, this.websiteUrl});
}

const sponsors = <Sponsor>[
  Sponsor(name: 'Zoho Apptics', websiteUrl: 'https://www.zoho.com/apptics/'),
  Sponsor(name: 'Vyuh', websiteUrl: 'https://vyuh.tech'),
  Sponsor(name: 'Shivante'),
];
