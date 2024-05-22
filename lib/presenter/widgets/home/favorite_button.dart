import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final ValueChanged<bool> onChanged;

  const FavoriteButton({super.key, this.isFavorite = false,
    required this.onChanged,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: [isFavorite],
      onPressed: (index) {
        setState(() {
          isFavorite = !isFavorite;
          widget.onChanged(isFavorite);
        });
      },
      children:  [
        Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.white),
      ],
    );
  }
}
//usamos apenas o estado local para controlar o ícone de favorito.
//O componente FavoriteIconButton agora é um StatefulWidget que gerencia seu
// próprio estado de favorito e notifica o pai quando o estado muda através da
// função onChanged. Isso torna o componente mais simples, mas também significa
// que ele não mantém o estado do favorito globalmente,
// sendo limitado ao contexto local em que é utilizado.