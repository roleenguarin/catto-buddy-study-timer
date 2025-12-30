enum BackgroundType { asset, file }

class BackgroundInfo {
  final BackgroundType type;
  final String path;

  BackgroundInfo({required this.type, required this.path});
}