class ConsultantsPersonEntity {
  final String personId;
  final String publicId;
  final String title;
  final String name;

  final String avatar;
  final num rating;
  final num sessionDuration;
  final num reviews;
  final String description;
  final num experienceYears;
  final String proofPurpose;
  final String? service;
  final List<String> proofDocuments;
  final num sessionPrice;
  final num totalBalance;
  final num availableBalance;
  final String status;
  final String? reason;
  final bool haveUpdate;
  ConsultantsPersonEntity({
    required this.personId,
    required this.publicId,
    required this.title,
    required this.avatar,
    required this.rating,
    required this.name,
    required this.sessionDuration,
    required this.reviews,
    required this.description,
    required this.experienceYears,
    required this.proofPurpose,
    required this.service,
    required this.proofDocuments,
    required this.sessionPrice,
    required this.totalBalance,
    required this.availableBalance,
    required this.status,
    required this.reason,
    required this.haveUpdate,
  });
}
