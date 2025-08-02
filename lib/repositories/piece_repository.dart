import 'package:piece_wise/database/piecewise_database.dart';
import 'package:piece_wise/models/piece.dart';
import 'package:sqflite/sqflite.dart';

class PieceRepository {
  static Database get _database => PiecewiseDatabase.database;

  static Future<Piece> create(Piece piece) async {
    final id = await _database.insert(
      Piece.tableName,
      piece.copyWith(id: null).toJson(),
    );
    return piece.copyWith(id: id);
  }

  static Future<List<Piece>> getAll({int limit = 100, int offset = 0}) async {
    final result = await _database.query(
      Piece.tableName,
      limit: limit,
      offset: offset,
    );
    return result.map((e) => Piece.fromJson(e)).toList();
  }

  static Future<Piece?> getById(int id) async {
    final result = await _database.query(
      Piece.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? Piece.fromJson(result.first) : null;
  }

  static Future<int> update(Piece piece) async {
    return await _database.update(
      Piece.tableName,
      piece.toJson(),
      where: 'id = ?',
      whereArgs: [piece.id],
    );
  }

  static Future<int> delete(Piece piece) async {
    return await _database.delete(
      Piece.tableName,
      where: 'id = ?',
      whereArgs: [piece.id],
    );
  }
}
