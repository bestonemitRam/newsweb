import 'package:flutter/material.dart';
import 'package:newsweb/page_routes/routes.dart';
import 'package:newsweb/utils/appimage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.10),
                child: Container(
                  width: size.width * 0.40,
                  child: Image.asset(
                    //AppImages.welcomescreenillimage,
                    "",

                    fit: BoxFit.fill,
                    //  width: 30.w,
                    // height: 10.h,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 5.w,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  // shape: StadiumBorder(

                  //   side: BorderSide(
                  //     color: Colors.black,
                  //     width: 2.0,
                  //   ),
                  // ),
                  child: Container(
                    width: size.width * 0.25,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 5.w, right: 5.w, bottom: 10.h),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp),
                            ),
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
                                    color: Colors.black, fontSize: 14.sp),
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
                                      border: Border.all(color: Colors.black)),
                                  child: Form(
                                      child: TextFormField(
                                    // controller: controller.mobileController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter phone number ',
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp)),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.sp),
                                  ))),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.amber)),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.dashBoardScreenActivity);
                              },
                              child: SizedBox(
                                  height: 50,
                                  width: size.width * 0.68,
                                  child: Center(
                                      child: Text(
                                    'Login',
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
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
