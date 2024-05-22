import 'package:flutter/material.dart';

class ToogleFavorite extends StatefulWidget {
  final bool isFavorite;
  final ValueChanged<bool> onChanged;

  const ToogleFavorite({
    super.key,
    required this.isFavorite,
    required this.onChanged,
  });

  @override
  _ToogleFavoriteState createState() => _ToogleFavoriteState();
}

class _ToogleFavoriteState extends State<ToogleFavorite> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onChanged(_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
