import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentResultDialog extends StatelessWidget {
  final bool isSuccess;
  final VoidCallback onDone;

  const PaymentResultDialog({
    super.key,
    required this.isSuccess,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 70.h,
              width: 70.h,
              decoration: BoxDecoration(
                color: isSuccess ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSuccess ? Icons.check_circle_rounded : Icons.error_outline_rounded,
                color: isSuccess ? Colors.green : Colors.red,
                size: 50.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              isSuccess ? "تم الدفع بنجاح" : "فشلت عملية الدفع",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),
            Text(
              isSuccess
                  ? "تم تأكيد موعدك بنجاح، يمكنك متابعة تفاصيل الحجز الآن."
                  : "حدث خطأ أثناء معالجة الدفع، يرجى المحاولة مرة أخرى.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSuccess ? Colors.green : Colors.black87,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  onDone();
                },
                child: Text("موافق", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}