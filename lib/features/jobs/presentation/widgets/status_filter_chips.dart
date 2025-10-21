import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/features/jobs/cubit/jobs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusFilterChips extends StatelessWidget {
  final JobsCubit cubit;

  const StatusFilterChips({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final statuses = cubit.getUniqueStatuses();

    if (statuses.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // All Filter Chip
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: FilterChip(
              label: const Text('All'),
              selected: cubit.selectedStatus == null,
              onSelected: (selected) {
                cubit.filterByStatus(null);
              },
              backgroundColor: Colors.white,
              selectedColor: AppColors.primaryColor900.withValues(alpha: 0.1),
              checkmarkColor: AppColors.primaryColor900,
              side: BorderSide(
                color: cubit.selectedStatus == null
                    ? AppColors.primaryColor900
                    : Colors.grey.shade300,
                width: 1.5,
              ),
              elevation: 2,
              shadowColor: Colors.grey.withValues(alpha: 0.3),
              labelStyle: TextStyle(
                color: cubit.selectedStatus == null
                    ? AppColors.primaryColor900
                    : Colors.grey[600],
                fontWeight: cubit.selectedStatus == null
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
          // Status Filter Chips
          ...statuses.map((status) {
            final isSelected = cubit.selectedStatus == status;
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: FilterChip(
                label: Text(status),
                selected: isSelected,
                onSelected: (selected) {
                  cubit.filterByStatus(selected ? status : null);
                },
                backgroundColor: Colors.white,
                selectedColor: AppColors.primaryColor900.withValues(alpha: 0.1),
                checkmarkColor: AppColors.primaryColor900,
                side: BorderSide(
                  color: isSelected
                      ? AppColors.primaryColor900
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
                elevation: 2,
                shadowColor: Colors.grey.withValues(alpha: 0.3),
                labelStyle: TextStyle(
                  color:
                      isSelected ? AppColors.primaryColor900 : Colors.grey[600],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
