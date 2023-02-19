import 'package:flutter/material.dart';
import 'package:todo/theme/color.dart';

class TodoRow extends StatelessWidget {
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String initialValue;

  const TodoRow({
    super.key,
    required this.initialValue,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64.0,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  Icons.check_box_outline_blank,
                  color: ColorTheme.primary,
                ),
              ),
              Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  onChanged: onChanged,
                  initialValue: initialValue,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1.0),
      ],
    );
  }
}
