import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../view_model/home_cubit.dart';

class CustomSearchHomeConsultantWidget extends StatefulWidget {
  const CustomSearchHomeConsultantWidget({super.key});

  @override
  State<CustomSearchHomeConsultantWidget> createState() => _CustomSearchHomeConsultantWidgetState();
}

class _CustomSearchHomeConsultantWidgetState extends State<CustomSearchHomeConsultantWidget> {
  final TextEditingController _controller = TextEditingController();
  bool showClear = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        setState(() {
          showClear = value.isNotEmpty;
        });
        homeCubit.searchConsultant(value);
      },
      style: context.textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: "ابحث عن مستشارك ",
        hintStyle: context.textTheme.bodyLarge,
        suffixIcon: showClear
            ? IconButton(
          icon: const Icon(Icons.clear, color: Colors.red),
          onPressed: () {
            _controller.clear();
            setState(() => showClear = false);
            homeCubit.searchConsultant("");
          },
        )
            : null,
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w, end: 10.w),
          child: Icon(
            Icons.search_sharp,
            color: AppColors.kWeight,
            size: 25.sp,
          ),
        ),
        filled: true,
        fillColor: AppColors.kGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
