import 'package:flutter/material.dart';
import 'package:piece_wise/models/piece.dart';
import 'package:piece_wise/pages/piece_form.dart';
import 'package:piece_wise/repositories/piece_repository.dart';
import 'package:piece_wise/routes/piecewise_routes.dart';

class PieceFeed extends StatefulWidget {
  const PieceFeed({super.key});

  @override
  State<PieceFeed> createState() => _PieceFeedState();
}

class _PieceFeedState extends State<PieceFeed> {
  List<Piece> pieces = [];

  @override
  void initState() {
    _loadPieces();
    super.initState();
  }

  void _loadPieces() async {
    final pieces = await PieceRepository.getAll();
    if (pieces == this.pieces) return;
    setState(() {
      this.pieces = pieces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPieceList(),
      floatingActionButton: _buildAddPieceButton(),
    );
  }

  Widget _buildPieceList() {
    return ListView.builder(
      itemCount: pieces.length,
      itemBuilder: (context, index) {
        return _buildPieceItem(pieces[index]);
      },
    );
  }

  Widget _buildPieceItem(Piece piece) {
    return ListTile(
      key: ValueKey(piece.id),
      title: Text(piece.name),
      subtitle: Text(piece.learningState.name),
      trailing: Text(piece.difficulty.name),
    );
  }

  Widget _buildAddPieceButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        final formResult = await Navigator.pushNamed(
          context,
          PiecewiseRoutes.pieceForm,
        );
        if (formResult is PieceFormResult &&
            formResult == PieceFormResult.saved) {
          _loadPieces();
        }
      },
    );
  }
}
