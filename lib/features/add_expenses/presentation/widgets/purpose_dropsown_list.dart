import 'package:flutter/material.dart';

class CustomDropdownList extends StatefulWidget {
  final String? selectedItem;
  final List<String> items;
  final String hintText;
  final ValueChanged<String?> onChanged;

  const CustomDropdownList({
    super.key,
    required this.selectedItem,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  State<CustomDropdownList> createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  final GlobalKey _containerKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showDropdown() {
    final RenderBox renderBox = _containerKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          elevation: 4,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 4),
              shrinkWrap: true,
              children: widget.items.map((item) {
                return ListTile(
                  title: Text(item, style: const TextStyle(color: Colors.white)),
                  onTap: () {
                    widget.onChanged(item);
                    _removeDropdown();
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _containerKey,
      onTap: () {
        if (_overlayEntry == null) {
          _showDropdown();
        } else {
          _removeDropdown();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedItem ?? widget.hintText,
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
