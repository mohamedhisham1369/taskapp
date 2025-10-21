import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryInfoSection extends StatelessWidget {
  final JobModel job;
  const DeliveryInfoSection({super.key, required this.job});

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
          const Text('Delivery Info',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          SizedBox(height: 8.sp),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.blueGrey, size: 18),
              SizedBox(width: 6.sp),
              Expanded(
                child: Text('ETA: ${job.eta ?? 'Unknown'}',
                    style:
                        TextStyle(fontSize: 13, color: Colors.grey.shade700)),
              ),
            ],
          ),
          SizedBox(height: 6.sp),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.note_alt_outlined,
                  color: Colors.blueGrey, size: 18),
              SizedBox(width: 6.sp),
              Expanded(
                child: Text(job.notes ?? 'No notes available',
                    style:
                        TextStyle(fontSize: 13, color: Colors.grey.shade700)),
              ),
            ],
          ),
          SizedBox(height: 6.sp),
          Row(
            children: [
              const Icon(Icons.local_shipping_outlined,
                  color: Colors.blueGrey, size: 18),
              SizedBox(width: 6.sp),
              Text('Truck Type: ${job.truckType ?? 'N/A'}',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
            ],
          ),
        ],
      ),
    );
  }
}
