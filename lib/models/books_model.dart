class Books {
  final String status;
  final String copyright;
  final int numResult;
  final List<dynamic> results;

  Books(
      {required this.status,
      required this.copyright,
      required this.numResult,
      required this.results});

  factory Books.fromJson(dynamic json) {
    return Books(
      status: json['status'],
      copyright: json['copyright'],
      numResult: json['num_results'],
      results: json['results'],
    );
  }

  get length => results.length;
}
