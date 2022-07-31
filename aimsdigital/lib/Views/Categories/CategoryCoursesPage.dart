import '../../Controller/CourseController.dart';
import '../../Helpers/BaseServerUrl.dart';
import '../../Models/Home/CoursesHome.dart';
import '../../Widgets/StaggeredDualView.dart';
import '../../Widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Products/DetailsCoursePage.dart';

class CategoryCoursesPage extends StatefulWidget {
  final String uidCategory;
  final String category;

  const CategoryCoursesPage(
      {@required this.uidCategory, @required this.category});

  @override
  _CategoryCoursesPageState createState() => _CategoryCoursesPageState();
}

class _CategoryCoursesPageState extends State<CategoryCoursesPage> {
  List<Course> listCourse = [];

  getCourses() async {
    listCourse = await dbCourseController.getCoursesForCategories(
        id: widget.uidCategory);
    setState(() {});
  }

  @override
  void initState() {
    getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: CustomText(text: widget.category, color: Colors.black),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: StaggeredDualView(
              itemCount: listCourse.length,
              spacing: 5,
              alturaElement: 0.15,
              aspectRatio: 0.8,
              itemBuilder: (_, i) => Card(
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10.0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue[300],
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              DetailsCoursePage(course: listCourse[i]))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          // height: 100.sm,
                          child: Column(
                            children: [
                              Container(
                                child: Hero(
                                    tag: listCourse[i].id,
                                    child: Image.network(
                                      publicServerUrl + listCourse[i].picture,
                                      height: 140.sm,
                                    )),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                listCourse[i].nameCourse,
                                style: GoogleFonts.getFont('Roboto',
                                    fontSize: 17, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomText(
                                  text: '\$ ${listCourse[i].price}',
                                  fontSize: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
