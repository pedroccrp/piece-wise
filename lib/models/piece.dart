enum PieceLearningState {
  planned,
  learning,
  learned,
  polishing,
  performanceReady,
}

enum PieceDifficulty { easy, comfortable, advanced, challenging }

class Piece {
  final int? id;
  final String name;
  final PieceLearningState learningState;
  final PieceDifficulty difficulty;

  Piece({
    this.id,
    required this.name,
    required this.learningState,
    required this.difficulty,
  });

  Piece copyWith({
    int? id,
    String? name,
    PieceLearningState? learningState,
    PieceDifficulty? difficulty,
  }) {
    return Piece(
      id: id ?? this.id,
      name: name ?? this.name,
      learningState: learningState ?? this.learningState,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  static String get tableName => 'piece';

  static Map<String, String> get fields => {
    'id': 'INTEGER PRIMARY KEY',
    'name': 'TEXT',
    'learningState': 'TEXT',
    'difficulty': 'TEXT',
  };

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'learningState': learningState.name,
      'difficulty': difficulty.name,
    };
  }

  factory Piece.fromJson(Map<String, dynamic> json) {
    return Piece(
      name: json['name'],
      learningState: PieceLearningState.values.byName(json['learningState']),
      difficulty: PieceDifficulty.values.byName(json['difficulty']),
    );
  }
}
