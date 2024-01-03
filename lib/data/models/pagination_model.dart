class PaginationModel {
  int? requestedLimit;
  int? requestedOffset;
  int? pageSize;
  int? totalResults;

  PaginationModel(
      {this.requestedLimit,
      this.requestedOffset,
      this.pageSize,
      this.totalResults});

  PaginationModel.fromJson(Map<String, dynamic> json) {
    requestedLimit = json['RequestedLimit'];
    requestedOffset = json['RequestedOffset'];
    pageSize = json['PageSize'];
    totalResults = json['TotalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestedLimit'] = requestedLimit;
    data['RequestedOffset'] = requestedOffset;
    data['PageSize'] = pageSize;
    data['TotalResults'] = totalResults;
    return data;
  }
}
