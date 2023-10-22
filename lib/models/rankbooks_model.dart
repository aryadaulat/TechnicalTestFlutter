class RankBooks {
  final String status;
  final String copyright;
  final int numResult;
  final List<dynamic> results;

  RankBooks(
      {required this.status,
      required this.copyright,
      required this.numResult,
      required this.results});

  factory RankBooks.fromJson(dynamic json) {
    return RankBooks(
      status: json['status'],
      copyright: json['copyright'],
      numResult: json['num_results'],
      results: json['results']['lists'],
    );
  }
}
