import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama  = "Favian Muhammad Rasyad Reswara"; //nama
  final String npm   = "2406495634"; //npm
  final String kelas = "B"; //kelas

  void _snack(BuildContext ctx, String msg) {
    final m = ScaffoldMessenger.of(ctx);
    m.hideCurrentSnackBar();
    m.showSnackBar(SnackBar(content: Text(msg)));
  }

  Widget _bigButton({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football Shop',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _Info('Name',  nama),
                      _Info('NPM',   npm),
                      _Info('Class', kelas),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              _bigButton(
                context: context,
                color: const Color(0xFF2196F3), 
                icon: Icons.table_rows,
                label: 'All Products',
                onPressed: () => _snack(
                  context,
                  'Kamu telah menekan tombol All Products',
                ),
              ),
              const SizedBox(height: 16),
              _bigButton(
                context: context,
                color: const Color(0xFF43A047), 
                icon: Icons.inventory_2,
                label: 'My Products',
                onPressed: () => _snack(
                  context,
                  'Kamu telah menekan tombol My Products',
                ),
              ),
              const SizedBox(height: 16),
              _bigButton(
                context: context,
                color: const Color(0xFFE53935), 
                icon: Icons.add_circle,
                label: 'Create Product',
                onPressed: () => _snack(
                  context,
                  'Kamu telah menekan tombol Create Product',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final String label;
  final String value;
  const _Info(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black54)),
        const SizedBox(height: 6),
        Text(value),
      ],
    );
  }
}

