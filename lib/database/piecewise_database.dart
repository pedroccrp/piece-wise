import 'package:piece_wise/database/schema_builder.dart';
import 'package:piece_wise/models/piece.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String databaseName = 'piece_wise.db';
const int databaseVersion = 1;

class PiecewiseDatabase {
  static final PiecewiseDatabase _instance = PiecewiseDatabase._internal();

  PiecewiseDatabase._internal();

  factory PiecewiseDatabase() => _instance;

  static late Database _database;
  static get database => _database;

  static Future<void> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);
    _database = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _createDatabase,
    );
  }

  static Future<void> _createDatabase(Database db, int version) async {
    await db.execute(
      SchemaBuilder.generateCreateTableQuery(Piece.tableName, Piece.fields),
    );
  }
}
