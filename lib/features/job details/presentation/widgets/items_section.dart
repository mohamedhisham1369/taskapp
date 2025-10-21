import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsSection extends StatelessWidget {
  final JobModel job;
  const ItemsSection({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Items',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          SizedBox(height: 10.sp),
          ...?job.items?.map(
            (item) => Padding(
              padding: EdgeInsets.symmetric(vertical: 6.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name ?? '', style: const TextStyle(fontSize: 14)),
                  Text('x${item.qty ?? 0}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
