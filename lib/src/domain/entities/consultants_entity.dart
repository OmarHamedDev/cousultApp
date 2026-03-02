class ConsultantsEntity {
  final String publicId;
  final String id;
  final String name;
  final String title;
  final String avatar;
  final num rating;
  final num sessionPrice;
  final num sessionDuration;
  final num reviews;
  ConsultantsEntity({
    required this.publicId,
    required this.name,
   required this.title,
    required this.id,
    required this.sessionPrice,
   required this.avatar,
   required this.rating,
    required this.sessionDuration,
    required this.reviews}
  );
}
