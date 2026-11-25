import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../theme.dart';

final dateFmt = DateFormat('yyyy-MM-dd');
final dateTimeFmt = DateFormat('yyyy-MM-dd HH:mm');

void snack(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

Future<bool> confirm(BuildContext context, String message,
    {String ok = 'ඔව්', String title = 'තහවුරු කරන්න', bool danger = false}) async {
  final r = await showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('අවලංගු')),
        FilledButton(
          style: danger
              ? FilledButton.styleFrom(backgroundColor: Theme.of(c).colorScheme.error)
              : null,
          onPressed: () => Navigator.pop(c, true),
          child: Text(ok),
        ),
      ],
    ),
  );
  return r ?? false;
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key, this.trailing});
  final String text;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 12, 8),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(color: Brand.gold, borderRadius: BorderRadius.circular(2)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(text,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Brand.brownDark)),
            ),
            ?trailing,
          ],
        ),
      );
}

class EmptyHint extends StatelessWidget {
  const EmptyHint(this.text, {super.key, this.icon = Icons.info_outline});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(32, 40, 32, 24),
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Brand.goldLight,
                border: Border.all(color: Brand.gold.withValues(alpha: 0.4), width: 2),
              ),
              child: Icon(icon, size: 40, color: Brand.brownMid),
            ),
            const SizedBox(height: 14),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Brand.brownMid, fontSize: 15, height: 1.4)),
          ],
        ),
      );
}

const statusLabels = {
  'draft': 'කෙටුම්පත',
  'complete': 'සම්පූර්ණයි',
  'verified': 'තහවුරු කළා',
};

Color statusColor(String status) => switch (status) {
      'verified' => Brand.ok,
      'complete' => Brand.info,
      _ => Brand.pending,
    };

class StatusBadge extends StatelessWidget {
  const StatusBadge(this.status, {super.key});
  final String status;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration: BoxDecoration(
          color: statusColor(status).withValues(alpha: 0.13),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusColor(status).withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(status == 'verified' ? Icons.verified : Icons.circle,
                size: 12, color: statusColor(status)),
            const SizedBox(width: 4),
            Text(statusLabels[status] ?? status,
                style: TextStyle(fontSize: 13, color: statusColor(status), fontWeight: FontWeight.w700)),
          ],
        ),
      );
}

/// Small "label: value" row used on profile cards.
class InfoRow extends StatelessWidget {
  const InfoRow(this.label, this.value, {super.key});
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty || value == '—') return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Brand.sand))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(color: Brand.muted, fontSize: 14)),
          ),
          Expanded(
            child: Text(value!,
                style: const TextStyle(color: Brand.brownDark, fontSize: 15, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

/// Horizontal bar used on the statistics screen.
class BarRow extends StatelessWidget {
  const BarRow(this.label, this.value, this.max, {super.key, this.suffix = '', this.color = Brand.gold});
  final String label;
  final num value;
  final num max;
  final String suffix;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 128,
            child: Text(label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Brand.brownDark, fontSize: 14)),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: max == 0 ? 0 : value / max,
                minHeight: 12,
                color: color,
                backgroundColor: Brand.sand,
              ),
            ),
          ),
          SizedBox(
            width: 64,
            child: Text('${NumberFormat.decimalPattern().format(value)}$suffix',
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.w800, color: Brand.brownDark)),
          ),
        ],
      ),
    );
  }
}

/// Big number tile for dashboards.
class StatTile extends StatelessWidget {
  const StatTile(this.label, this.value, this.icon, {super.key, this.onTap});
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: cs.primary),
              const SizedBox(height: 6),
              Text(value, style: Theme.of(context).textTheme.headlineSmall),
              Text(label, style: TextStyle(color: cs.outline)),
            ],
          ),
        ),
      ),
    );
  }
}
