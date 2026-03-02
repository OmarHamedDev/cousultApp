class AppointmentsEntity {
  final String id;
  final String dayOfWeek;
  final int startTime;
  final String createdAt;
  final String consultantId;
  final String consultantName;
  final String sessionDuration;
  final int endTime;
  final bool isBooked;
  final int consultantSessionDuration;
  final String consultantAvatar;
  AppointmentsEntity({
    required this.id,
    required this.sessionDuration,
    required this.dayOfWeek,
    required this.startTime,
    required this.createdAt,
    required this.consultantId,
    required this.consultantName,
    required this.endTime,
    required this.isBooked,
    required this.consultantSessionDuration,
    required this.consultantAvatar,
  });
}
