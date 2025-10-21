import 'package:cached_network_image/cached_network_image.dart';
import 'package:erp/core/extensions/navigation_extension.dart';
import 'package:erp/core/routing/routes_name.dart';
import 'package:erp/features/jobs/cubit/jobs_cubit.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobItemWidget extends StatefulWidget {
  JobItemWidget({super.key, required this.job});
  JobModel job;

  @override
  State<JobItemWidget> createState() => JobItemWidgetState();
}

class JobItemWidgetState extends State<JobItemWidget> {
  @override
  Widget build(BuildContext context) {
    final statusStyle = _getStatusStyle(widget.job.status ?? 'N/A');

    return GestureDetector(
      onTap: () async {
        context
            .pushNamed(
          Routes.jobDetailsScreen,
          arguments: widget.job,
        )
            .then((v) {
          if (v != null) {
            context.read<JobsCubit>().updateJobInList(v);

            // Also update local state
            setState(() {
              widget.job = v;
            });
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.job.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.sp),
                child: CachedNetworkImage(
                  imageUrl: widget.job.avatar ??
                      'https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/87.jpg',
                  height: 60.sp,
                  width: 60.sp,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.shade200,
                    height: 60.sp,
                    width: 60.sp,
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(width: 14.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.job.customerName ?? 'Unknown Customer',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 15, color: Colors.grey),
                      SizedBox(width: 3.sp),
                      Expanded(
                        child: Text(
                          widget.job.address ?? '',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.sp),
                  Row(
                    children: [
                      // ✅ Beautiful dynamic status badge
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 5.sp),
                        decoration: BoxDecoration(
                          color: statusStyle["bgColor"] as Color,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              statusStyle["icon"] as IconData,
                              color: statusStyle["textColor"] as Color,
                              size: 14.sp,
                            ),
                            SizedBox(width: 4.sp),
                            Text(
                              statusStyle["label"] as String,
                              style: TextStyle(
                                color: statusStyle["textColor"] as Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$${widget.job.price?.toStringAsFixed(0) ?? '--'}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🧠 Returns a color/icon style based on job status
  Map<String, dynamic> _getStatusStyle(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return {
          "label": "Pending",
          "bgColor": Colors.orange.withValues(alpha: 0.15),
          "textColor": Colors.orange.shade700,
          "icon": Icons.access_time_filled,
        };
      case 'ACCEPTED':
        return {
          "label": "Accepted",
          "bgColor": Colors.blue.withValues(alpha: 0.15),
          "textColor": Colors.blue.shade600,
          "icon": Icons.check_circle_outline,
        };
      case 'PICKED_UP':
        return {
          "label": "Picked Up",
          "bgColor": Colors.amber.withValues(alpha: 0.15),
          "textColor": Colors.amber.shade700,
          "icon": Icons.local_shipping_outlined,
        };
      case 'DELIVERED':
        return {
          "label": "Delivered",
          "bgColor": Colors.green.withValues(alpha: 0.15),
          "textColor": Colors.green.shade700,
          "icon": Icons.done_all_rounded,
        };
      default:
        return {
          "label": "Unknown",
          "bgColor": Colors.grey.withValues(alpha: 0.15),
          "textColor": Colors.grey.shade600,
          "icon": Icons.help_outline,
        };
    }
  }
}
