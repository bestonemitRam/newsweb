import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsweb/page_routes/routes.dart';
import 'package:newsweb/utils/apphelper.dart';
import 'package:newsweb/utils/appimage.dart';
import 'package:newsweb/view_model/controller/dashboard_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    'Hindi',
    'English',
  ];

  String? selectedValue;
  final RetailerController controller = Get.put(RetailerController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    top: 2.h, left: 5.w, right: 5.w, bottom: 10.h),
                child: Obx(
                  () => Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Create ",
                          style: TextStyle(
                              color: AppHelper.themelight
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16.sp,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Language',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: size.width * 0.30,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: AppHelper.themelight
                                            ? Colors.white
                                            : Colors.black26,
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.yellow,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.redAccent,
                                    ),
                                    offset: const Offset(-20, 0),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness: MaterialStateProperty.all(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16.sp,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select ',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: size.width * 0.30,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: AppHelper.themelight
                                            ? Colors.white
                                            : Colors.black26,
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.yellow,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.redAccent,
                                    ),
                                    offset: const Offset(-20, 0),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness: MaterialStateProperty.all(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "     Title",
                            style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppHelper.themelight
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: 14.sp),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: size.width * 0.80,
                              // width: 20,
                              height: 55,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(28)),
                                  border: Border.all(
                                      color: AppHelper.themelight
                                          ? Colors.white
                                          : AppHelper.themelight
                                              ? Colors.white
                                              : Colors.black)),
                              child: Form(
                                  child: TextFormField(
                                // controller: controller.mobileController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter news title ',
                                    hintStyle: TextStyle(
                                        color: AppHelper.themelight
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14.sp)),
                                style: TextStyle(
                                    color: AppHelper.themelight
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14.sp),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "     News",
                            style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14.sp),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: size.width * 0.80,
                              // width: 20,
                              height: 15.h,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(28)),
                                  border: Border.all(
                                      color: AppHelper.themelight
                                          ? Colors.white
                                          : Colors.black)),
                              child: Form(
                                  child: TextFormField(
                                // controller: controller.mobileController,
                                maxLines: 50,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter News ',
                                    hintStyle: TextStyle(
                                        color: AppHelper.themelight
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14.sp)),
                                style: TextStyle(
                                    color: AppHelper.themelight
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14.sp),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "     Taken from",
                            style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14.sp),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: size.width * 0.80,
                              // width: 20,
                              height: 55,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(28)),
                                  border: Border.all(
                                      color: AppHelper.themelight
                                          ? Colors.white
                                          : Colors.black)),
                              child: Form(
                                  child: TextFormField(
                                // controller: controller.mobileController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter website name ',
                                    hintStyle: TextStyle(
                                        color: AppHelper.themelight
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14.sp)),
                                style: TextStyle(
                                    color: AppHelper.themelight
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14.sp),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "     News URL",
                            style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14.sp),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: size.width * 0.80,
                              // width: 20,
                              height: 55,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(28)),
                                  border: Border.all(
                                      color: AppHelper.themelight
                                          ? Colors.white
                                          : Colors.black)),
                              child: Form(
                                  child: TextFormField(
                                // controller: controller.mobileController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter news url ',
                                    hintStyle: TextStyle(
                                        color: AppHelper.themelight
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14.sp)),
                                style: TextStyle(
                                    color: AppHelper.themelight
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14.sp),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "     Contact",
                            style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14.sp),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: size.width * 0.80,
                              // width: 20,
                              height: 55,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(28)),
                                  border: Border.all(
                                      color: AppHelper.themelight
                                          ? Colors.white
                                          : Colors.black)),
                              child: Form(
                                  child: TextFormField(
                                // controller: controller.mobileController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter phone number ',
                                    hintStyle: TextStyle(
                                        color: AppHelper.themelight
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14.sp)),
                                style: TextStyle(
                                    color: AppHelper.themelight
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14.sp),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => controller.selectImage(),
                            child: Padding(
                              padding: EdgeInsets.all(size.height * 0.02),
                              child: Text('Browse Image'),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          ElevatedButton(
                            onPressed: () => controller.selectvideo(),
                            child: Padding(
                              padding: EdgeInsets.all(size.height * 0.02),
                              child: Text('Browse video'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (controller.imageBytes.value != null)
                            Container(
                              // width: MediaQuery.of(context).size.width,
                              width: size.width * 0.15,
                              height: size.height * 0.15,
                              child: Container(
                                child: Image.memory(
                                  controller.imageBytes.value!,
                                  width: size.width * 0.10,
                                  height: size.height * 0.10,
                                ),
                              ),
                            ),
                          if (controller.fileName.value != '')
                            SizedBox(
                              // height: 5.h,
                              width: 5.h,
                            ),
                          Container(
                            //width: size.width * 0.,
                            //height: size.height * 0.50,
                            child: Container(
                                child: Text(controller.fileName.value)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          onPressed: () 
                          {
                            controller.addData();
                            // Navigator.pushNamed(
                            //     context, Routes.dashBoardScreenActivity);
                          },
                          child: SizedBox(
                              height: 50,
                              width: size.width * 0.80,
                              child: Center(
                                  child: Text(
                                'Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              )))),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
