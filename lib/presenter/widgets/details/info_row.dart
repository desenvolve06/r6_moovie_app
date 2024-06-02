import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String releaseDate;
  final String vote;
  final String popularity;

  const InfoRow({
    super.key,
    required this.releaseDate,
    required this.vote,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 110,
          child: Row(
            children: [
              Expanded(
                child: _buildInfoItem(Icons.date_range, releaseDate),
              ),
              _buildDivider(),
              Expanded(
                child: _buildInfoItem(Icons.star, vote),
              ),
              _buildDivider(),
              Expanded(
                child: _buildInfoItem(Icons.bar_chart, popularity),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon, color: Colors.grey.shade600),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "|",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
