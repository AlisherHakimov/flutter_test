import 'package:hive/hive.dart';

part 'fact.g.dart';

@HiveType(
  typeId: 0,
)
class Fact extends HiveObject {
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? updatedAt;

  Fact({
    this.text,
    this.updatedAt,
  });
}
