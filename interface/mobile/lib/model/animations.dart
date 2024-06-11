class Animation {
  int id;
  String nama;
  String image;
  bool isHovered;

  Animation({
    required this.id,
    required this.nama,
    required this.image,
    required this.isHovered,
  });
}

var animationList = [
  Animation(
    id: 0,
    nama: 'Eye Expression',
    image: 'Animation Display (1).png',
    isHovered: false,
  ),
  Animation(
    id: 1,
    nama: 'Inready',
    image: 'Animation Display (2).png',
    isHovered: false,
  ),
  Animation(
    id: 2,
    nama: 'Zuma AIBot',
    image: 'Animation Display (3).png',
    isHovered: false,
  ),
  Animation(
    id: 3,
    nama: 'Cat Funny',
    image: 'Animation Display (4).png',
    isHovered: false,
  ),
  Animation(
    id: 4,
    nama: 'Cat Eyebrow',
    image: 'Animation Display (5).png',
    isHovered: false,
  ),
  Animation(
    id: 5,
    nama: 'Cat Drumming',
    image: 'Animation Display (6).png',
    isHovered: false,
  ),
];