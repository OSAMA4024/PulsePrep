import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownBox extends StatefulWidget {
  const CustomDropdownBox({super.key});

  @override
  State<CustomDropdownBox> createState() => _CustomDropdownBoxState();
}

class _CustomDropdownBoxState extends State<CustomDropdownBox> {
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isVisible = false;

  void _toggleDropdown() {
    if (_isVisible) {
      _hideDropdown();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    final RenderBox button = _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);
    final Size buttonSize = button.size;
    final Size screenSize = overlay.size;

    const double dropdownWidth = 180;
    const double dropdownHeight = 160; // approx total height of your menu

    // Decide vertical direction
    bool openUpward = buttonPosition.dy + buttonSize.height + dropdownHeight > screenSize.height;

    // Decide horizontal alignment
    bool alignRight = buttonPosition.dx + dropdownWidth > screenSize.width;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: openUpward
            ? buttonPosition.dy - dropdownHeight // open upward
            : buttonPosition.dy + buttonSize.height, // open downward
        left: alignRight
            ? buttonPosition.dx + buttonSize.width - dropdownWidth // shift left
            : buttonPosition.dx, // default left
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: dropdownWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMenuItem(Icons.person, "Profile", () {
                  debugPrint("Profile tapped");
                  _hideDropdown();
                }),
                _buildMenuItem(Icons.notifications, "Notification", () {
                  debugPrint("Notification tapped");
                  _hideDropdown();
                }),
                _buildMenuItem(Icons.logout, "Logout", () {
                  debugPrint("Logout tapped");
                  _hideDropdown();
                }),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isVisible = true);
  }


  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isVisible = false);
  }

  Widget _buildMenuItem(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Color(0xff82272E), size: 20),
            const SizedBox(width: 12),
            Text(text, style:  GoogleFonts.openSans(fontSize: 14, color: Color(0xff545454), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _buttonKey,
      icon: const Icon(Icons.more_vert, color: Colors.black),
      onPressed: _toggleDropdown,
    );
  }
}
