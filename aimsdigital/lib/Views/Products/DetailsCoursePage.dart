import '../../Bloc/bloc/course_bloc.dart';
import '../../Helpers/BaseServerUrl.dart';
import '../../Helpers/Colors.dart';
import '../../Helpers/ModalAddCart.dart';
import '../../Models/Home/CoursesHome.dart';
import '../../Models/Course.dart';
import '../Cart/CartPage.dart';
import '../Home/HomePage.dart';
import '../../Widgets/AnimationRoute.dart';
import '../../Widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCoursePage extends StatelessWidget {
  final Course course;

  DetailsCoursePage({@required this.course});

  @override
  Widget build(BuildContext context) {
    final courseBloc = BlocProvider.of<CourseBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 10.0, bottom: 100.0),
              children: [
                _AppBarCourse(
                    nameCourse: course.nameCourse, uidCourse: course.id),
                SizedBox(height: 20.0),
                _ImageCourse(uidCourse: course.id, imageCourse: course.picture),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    children: [
                      CustomText(
                        text: course.nameCourse,
                        fontSize: 25,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomText(
                      text: '\$ ${course.price}',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                SizedBox(height: 20.0),
                SizedBox(height: 20.0),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomText(
                      text: 'Description',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    children: [
                      CustomText(text: course.description, fontSize: 17)
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomText(
                      text: 'Payment methods',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 60,
                  color: Color(0xfff5f5f5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'Assets/visa.svg',
                        height: 60,
                        color: Colors.blue,
                      ),
                      SvgPicture.asset(
                        'Assets/mastercard.svg',
                        height: 60,
                      ),
                      // SvgPicture.asset(
                      //   'Assets/american express.svg',
                      //   height: 60,
                      // ),
                      // SvgPicture.asset('Assets/paypal.svg', height: 55),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200], blurRadius: 15, spreadRadius: 5)
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0))),
                        child: CustomText(text: 'Add To Cart', fontSize: 20),
                        onPressed: () async {
                          modalAddCartSuccess(context, course.picture);

                          final Courseselect = CourseCart(
                              uidCourse: course.id,
                              image: course.picture,
                              name: course.nameCourse,
                              price: course.price.toDouble(),
                              amount: 1);

                          courseBloc.add(AddCourseToCart(course: Courseselect));
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pop(context);
                          Navigator.of(context).push(customRoute(
                              page: HomePage(), curved: Curves.easeInOut));
                        },
                      ),
                    ),
                    // SizedBox(width: 15.0),
                    Container(
                      height: 40.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0.sh)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0.h))),
                        child: CustomText(
                            text: 'Buy Now',
                            fontSize: 18.h,
                            color: Colors.white),
                        onPressed: () {
                          final courseselect = CourseCart(
                              uidCourse: course.id,
                              image: course.picture,
                              name: course.nameCourse,
                              price: course.price.toDouble(),
                              amount: 1);

                          courseBloc.add(AddCourseToCart(course: courseselect));

                          Navigator.of(context).push(customRoute(
                              page: CartPage(), curved: Curves.easeInOut));
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RaitingCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 160,
            child: RatingBarIndicator(
              rating: 4,
              itemCount: 5,
              itemSize: 30.0,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ),
          CustomText(text: '124 Reviews', fontSize: 17, color: Colors.grey)
        ],
      ),
    );
  }
}

class _ImageCourse extends StatelessWidget {
  final String imageCourse;
  final String uidCourse;

  const _ImageCourse({this.uidCourse, this.imageCourse});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '$uidCourse',
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Image.network(publicServerUrl + imageCourse),
      ),
    );
  }
}

class _AppBarCourse extends StatelessWidget {
  final String nameCourse;
  final String uidCourse;

  const _AppBarCourse({this.nameCourse, this.uidCourse});

  @override
  Widget build(BuildContext context) {
    final courseBloc = BlocProvider.of<CourseBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: CircleAvatar(
            backgroundColor: Color(0xffF3F4F6),
            radius: 24,
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          ),
        ),
        Container(
            width: 250,
            child: Text(nameCourse,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.getFont('Roboto',
                    fontSize: 19, color: Colors.grey))),
        CircleAvatar(
          backgroundColor: Color(0xffF3F4F6),
          radius: 24,
          child: IconButton(
            icon: Icon(Icons.favorite_border_rounded, color: Colors.black),
            onPressed: () =>
                courseBloc.add(AddOrDeleteCourseFavorite(uidCourse: uidCourse)),
          ),
        ),
      ],
    );
  }
}
