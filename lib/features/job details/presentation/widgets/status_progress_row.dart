import 'package:erp/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusProgressRow extends StatelessWidget {
  final List<String> statusOrder;
  final int currentIndex;

  const StatusProgressRow({
    super.key,
    required this.statusOrder,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Stack(
        children: [
          Positioned(
            top: 12.sp,
            left: 30.w,
            right: 30.w,
            child: Row(
              children: List.generate(statusOrder.length - 1, (index) {
                final isLineActive = index < currentIndex;
                return Expanded(
                  child: Container(
                    height: 2.sp,
                    color: isLineActive
                        ? _getStatusColor(statusOrder[index + 1], true)
                        : Colors.grey.shade300,
                  ),
                );
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(statusOrder.length, (index) {
              final isActive = index <= currentIndex;
              final isCurrent = index == currentIndex;
              final statusColor = _getStatusColor(statusOrder[index], isActive);
              final icon = _getStatusIcon(statusOrder[index]);

              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isCurrent
                          ? Border.all(color: statusColor, width: 2.sp)
                          : null,
                    ),
                    child: CircleAvatar(
                      radius: 12.sp,
                      backgroundColor:
                          isActive ? statusColor : Colors.grey.shade300,
                      child: Icon(
                        icon,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      _formatStatusText(statusOrder[index]),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: isActive ? statusColor : Colors.grey,
                        fontWeight:
                            isActive ? FontWeight.w700 : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status, bool isActive) {
    if (!isActive) return Colors.grey.shade300;

    switch (status.toUpperCase()) {
      case 'PENDING':
        return Colors.orange;
      case 'ACCEPTED':
        return Colors.blue;
      case 'PICKED_UP':
        return Colors.amber.shade700;
      case 'DELIVERED':
        return Colors.green;
      case 'IN_PROGRESS':
        return Colors.purple;
      case 'CANCELLED':
        return Colors.red;
      default:
        return AppColors.primaryColor900;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return Icons.access_time;
      case 'ACCEPTED':
        return Icons.check_circle_outline;
      case 'PICKED_UP':
        return Icons.local_shipping;
      case 'DELIVERED':
        return Icons.done_all;
      case 'IN_PROGRESS':
        return Icons.autorenew;
      case 'CANCELLED':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  String _formatStatusText(String status) {
    return status
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}
