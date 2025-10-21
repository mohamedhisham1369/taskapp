import 'package:cached_network_image/cached_network_image.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerInfoCard extends StatelessWidget {
  final JobModel job;
  const CustomerInfoCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.12),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: job.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: CachedNetworkImage(
                imageUrl: job.avatar ??
                    'https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/87.jpg',
                height: 60.sp,
                width: 60.sp,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: Colors.grey.shade200,
                  height: 60.sp,
                  width: 60.sp,
                ),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 14.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.customerName ?? 'Unknown Customer',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 17),
                ),
                SizedBox(height: 4.sp),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 15, color: Colors.grey),
                    SizedBox(width: 3.sp),
                    Expanded(
                      child: Text(
                        job.address ?? '',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
