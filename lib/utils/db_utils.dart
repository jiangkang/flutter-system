import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 数据库工具类
class DbUtils {
  DbUtils._();

  /// 打开数据库
  /// [dbName] 是数据库名，如test.db
  /// [createCallback] 这里可以创建数据表
  static Future<Database> openDb(String dbName,
      {OnDatabaseCreateFn createCallback, int version = 1}) async {
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: createCallback,
      version: version,
    );
  }
}
