class CharactersModel {
  int charId;
  String name;
  String birthday;
  // occupation means jobs
  List<dynamic> occupation;
  String image;
  String status;
  String nickName;
  // appearance for first series
  List<dynamic> appearance;
  String portrayed;
  String category;
  // appearance for second series
  List<dynamic> betterCallSaulAppearance;

  CharactersModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.image,
    this.status,
    this.nickName,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance,
  });

  CharactersModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'];
    image = json['img'];
    status = json['status'];
    nickName = json['nickname'];
    appearance = json['appearance'];
    portrayed = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}
