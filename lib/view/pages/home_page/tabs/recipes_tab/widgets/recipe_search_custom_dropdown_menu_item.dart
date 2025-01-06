import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class RecipeSearchCustomDropdownMenuItem<T> extends PopupMenuEntry<T> {
  ///[value] is the value of that item
  final T value;

  ///[text] is what represents that value and being displayed in the UI.
  final String text;
  final void Function()? onRemove;

  const RecipeSearchCustomDropdownMenuItem({
    super.key,
    required this.value,
    required this.text,
    this.onRemove,
  });

  @override
  State<StatefulWidget> createState() {
    return _RecipeSearchCustomDropdownMenuItemState<T>();
  }

  @override
  double get height => 32;

  @override
  bool represents(T? value) => this.value == value;
}

class _RecipeSearchCustomDropdownMenuItemState<T> extends State<RecipeSearchCustomDropdownMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context, widget.value);
      },
      title: Text(widget.text),
      contentPadding: EdgeInsets.only(left: 16),
      trailing: IconButton(
        onPressed: () {
          if (widget.onRemove != null) {
            widget.onRemove!();
          }
        },
        icon: HugeIcon(
          icon: HugeIcons.strokeRoundedCancel01,
          color: Colors.black,
          size: 16,
        ),
      ),
    );
  }
}
