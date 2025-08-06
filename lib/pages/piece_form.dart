import 'package:flutter/material.dart';
import 'package:piece_wise/models/piece.dart';
import 'package:piece_wise/pages/piecewise_page.dart';
import 'package:piece_wise/repositories/piece_repository.dart';
import 'package:piece_wise/utlis/piecewise_logger.dart';

enum PieceFormResult { saved, cancelled }

class PieceForm extends StatefulWidget {
  final Piece? piece;

  const PieceForm({this.piece, super.key});

  @override
  State<PieceForm> createState() => _PieceFormState();
}

class _PieceFormState extends PiecewisePageState<PieceForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  PieceLearningState _learningState = PieceLearningState.planned;
  PieceDifficulty _difficulty = PieceDifficulty.easy;

  @override
  void initState() {
    super.initState();
    if (widget.piece != null) {
      _name = widget.piece!.name;
      _learningState = widget.piece!.learningState;
      _difficulty = widget.piece!.difficulty;
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildNameField(),
          _buildLearningStateDropdown(),
          _buildDifficultyDropdown(),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      initialValue: _name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildLearningStateDropdown() {
    return DropdownButtonFormField<PieceLearningState>(
      decoration: const InputDecoration(labelText: 'Learning State'),
      value: _learningState,
      items:
          PieceLearningState.values.map((learningState) {
            return DropdownMenuItem<PieceLearningState>(
              value: learningState,
              child: Text(learningState.name),
            );
          }).toList(),
      onChanged: (value) {
        setState(() {
          _learningState = value!;
        });
      },
    );
  }

  Widget _buildDifficultyDropdown() {
    return DropdownButtonFormField<PieceDifficulty>(
      decoration: const InputDecoration(labelText: 'Difficulty'),
      value: _difficulty,
      items:
          PieceDifficulty.values.map((difficulty) {
            return DropdownMenuItem<PieceDifficulty>(
              value: difficulty,
              child: Text(difficulty.name),
            );
          }).toList(),
      onChanged: (value) {
        setState(() {
          _difficulty = value!;
        });
      },
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      child: const Text('Save'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          _savePiece();
        }
      },
    );
  }

  void _savePiece() async {
    final piece = Piece(
      id: widget.piece?.id,
      name: _name,
      learningState: _learningState,
      difficulty: _difficulty,
    );

    if (piece.id != null) {
      PieceRepository.update(piece);
    } else {
      PieceRepository.create(piece);
    }

    Navigator.pop(context, PieceFormResult.saved);
  }
}
