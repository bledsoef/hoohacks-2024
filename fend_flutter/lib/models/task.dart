class GameTask {
  const GameTask({
    required this.gameName,
    required this.title,
    required this.details,
    required this.reward,
    required this.networkImage,
    required this.expirationDate,
    required this.status,
    required this.dateCompleted,
    required this.quantity, 
    required this.metric,
    required this.category,
    required this.progress
  });

  final String gameName;
  final String title;
  final String details;
  final String reward;
  final String networkImage;
  final String expirationDate;
  final bool status;
  final String dateCompleted;
  final int quantity;
  final String metric;
  final String category;
  final int progress;
} 
