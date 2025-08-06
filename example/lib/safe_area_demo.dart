import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

/// Demo showing how the suggestions box respects safe area insets
class SafeAreaDemo extends StatelessWidget {
  const SafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safe Area Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TypeAhead with Safe Area Handling',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'The suggestions box will automatically stay within the safe area, '
              'avoiding status bars, notches, and home indicators.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            TypeAheadField<String>(
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search for a color',
                    hintText: 'Type "red", "blue", "green"...',
                  ),
                );
              },
              itemBuilder: (context, color) {
                return ListTile(
                  title: Text(color),
                  leading: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _getColorFromString(color),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
              suggestionsCallback: (pattern) async {
                final colors = [
                  'Red',
                  'Blue',
                  'Green',
                  'Yellow',
                  'Purple',
                  'Orange',
                  'Pink',
                  'Brown',
                  'Black',
                  'White',
                  'Gray',
                  'Cyan',
                  'Magenta',
                  'Lime',
                  'Teal',
                  'Indigo',
                  'Amber',
                  'Deep Purple',
                  'Light Blue',
                  'Light Green',
                ];

                return colors.where((color) => color.toLowerCase().contains(pattern.toLowerCase())).toList();
              },
              onSelected: (color) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: $color')),
                );
              },
              decorationBuilder: (context, child) {
                return Material(
                  type: MaterialType.card,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: child,
                );
              },
              // Test different directions to show safe area handling
              direction: VerticalDirection.down,
              autoFlipDirection: true,
              autoFlipMinHeight: 100,
            ),
            const SizedBox(height: 32),
            const Text(
              'Try typing to see the suggestions box respect safe areas:',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Top safe area (status bar)\n'
              '• Bottom safe area (home indicator)\n'
              '• Left/right safe areas\n'
              '• Auto-flip when space is limited',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'pink':
        return Colors.pink;
      case 'brown':
        return Colors.brown;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'gray':
        return Colors.grey;
      case 'cyan':
        return Colors.cyan;
      case 'magenta':
        return Colors.pink;
      case 'lime':
        return Colors.lime;
      case 'teal':
        return Colors.teal;
      case 'indigo':
        return Colors.indigo;
      case 'amber':
        return Colors.amber;
      case 'deep purple':
        return Colors.deepPurple;
      case 'light blue':
        return Colors.lightBlue;
      case 'light green':
        return Colors.lightGreen;
      default:
        return Colors.grey;
    }
  }
}
