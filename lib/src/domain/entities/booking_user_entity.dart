class BookingUserEntity {
  final String userId;
  final String consultantId;
  final String status;
  final String startAt;
  final String endAt;
  final int duration;
  final int price;
  final String createdAt;
  final String  consulName;
  final String  consulTitle;
  final String  consulAvatar;
  final String  paymentStatus;
  BookingUserEntity({required this.userId,
    required this.consultantId,
    required this.status,
    required this.startAt,
    required this.endAt,
    required this.duration,
    required this.price,
    required this.createdAt,
    required this.consulName,
    required this.consulTitle,
    required this.consulAvatar,
    required this.paymentStatus
  });
}


