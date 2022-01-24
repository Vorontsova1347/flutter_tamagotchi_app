
class Tama{
  String name;
  bool gender;

  double cheerfulness;
  double satiety;
  double healthe;
  double play;

  Tama({
    required this.name,
    required this.gender,
    required this.cheerfulness,
    required this.satiety,
    required this.healthe,
    required this.play});

  static fromJson({json}) {
    Iterable l = json['posts'];
    Tama t = Tama(
        name: 'Name',
        gender: true,
        play: json['game'],
        healthe: json['healthe'],
        cheerfulness: json['sleep'],
        satiety: json['food']
    );

    return t;
  }
}