enum PieceLearningState {
  planned,
  learning,
  learned,
  polishing,
  performanceReady,
}

enum PieceDifficulty { easy, comfortable, advanced, challenging }

class Piece {
  final String name;
  final PieceLearningState learningState;
  final PieceDifficulty difficulty;

  Piece({
    required this.name,
    required this.learningState,
    required this.difficulty,
  });

  Piece copyWith({
    String? name,
    PieceLearningState? learningState,
    PieceDifficulty? difficulty,
  }) {
    return Piece(
      name: name ?? this.name,
      learningState: learningState ?? this.learningState,
      difficulty: difficulty ?? this.difficulty,
    );
  }

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
