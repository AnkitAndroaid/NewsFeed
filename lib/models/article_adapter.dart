import 'package:hive/hive.dart';
import 'article.dart';

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final typeId = 1;

  @override
  Article read(BinaryReader reader) {
    return Article(
      title: reader.readString(),
      description: reader.readString(),
      urlToImage: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.writeString(obj.urlToImage);
  }
}