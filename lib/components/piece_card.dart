import 'package:flutter/material.dart';
import 'package:piece_wise/models/piece.dart';
import 'package:piece_wise/pages/piece_form.dart';
import 'package:piece_wise/routes/piecewise_routes.dart';

class PieceCard extends StatelessWidget {
  final Piece piece;
  final VoidCallback onPieceUpdate;

  const PieceCard({
    super.key,
    required this.piece,
    required this.onPieceUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(piece.id),
      title: Text(piece.name),
      subtitle: Text(piece.learningState.name),
      trailing: Text(piece.difficulty.name),
      onTap: () => _openCard(context),
    );
  }

  void _openCard(BuildContext context) async {
    final formResult = await Navigator.pushNamed(
      context,
      PiecewiseRoutes.pieceForm,
      arguments: piece,
    );
    if (formResult is PieceFormResult && formResult == PieceFormResult.saved) {
      onPieceUpdate.call();
    }
  }
}
