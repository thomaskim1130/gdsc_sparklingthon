class IdolModel {
  String id;
  String groupName;
  String koreanName;
  String votes;
  String votesPercentage;
  int rank;
  late String imagePath = "assets/images/$id.png";

  IdolModel(
      {required this.id,
      required this.groupName,
      required this.koreanName,
      required this.votes,
      required this.votesPercentage,
      required this.rank});

  factory IdolModel.fromJson(Map<String, dynamic> json) {
    return IdolModel(
        id: json['id'],
        groupName: json['groupName'],
        koreanName: json['koreanName'],
        votes: json['votes'],
        votesPercentage: json['percent'],
        rank: json['rank']);
  }
}
