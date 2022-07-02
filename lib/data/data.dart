import 'package:dio/dio.dart';
import 'package:note_app/data/course/course.dart';
import 'package:note_app/data/get_all_courses/get_all_courses.dart';
import 'package:note_app/data/url.dart';

abstract class ApiCalls {
<<<<<<< HEAD
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>> getAllNotes();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<NoteModel> deleteNote(String id);
  Future test();
=======
  Future<List<Course>> getAllCourses();
>>>>>>> 91782b6c3c3a4bed318be3a69771fb70bd90d4c4
}

class CourseDB extends ApiCalls {
  final dio = Dio();
  final url = Url();

  @override
<<<<<<< HEAD
  Future<NoteModel?> createNote(NoteModel value) async {
    // var response =await dio.post('http://test-api-flutter-app.herokuapp.com/create',
    //     data: {'id': 12, 'title': 'wendu', 'content': 'wendu'},
    //     options: Options(headers: {
    //       'Content-type': 'application/json; charset=UTF-8',
    //     }));

    // print(response);

    // dio.post('http://127.0.0.1:3000/create/');

    print('dsd');
    var response = await dio.post<NoteModel>(
        'http://test-api-flutter-app.herokuapp.com/create',
        data: value.toJson(),
        options: Options(headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }));

    print('d');
    print(response.data);
    print('d');
    return null;
    // return _result.data;
  }

  @override
  Future<NoteModel> deleteNote(String id) async {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final _result =
        await dio.get<GetAllNotesResp>(url.baseUrl + url.getAllNotes);
=======
  Future<List<Course>> getAllCourses() async{
       final _result =
        await dio.get<GetAllCourses>(url.baseUrl + url.getAllCourses);
>>>>>>> 91782b6c3c3a4bed318be3a69771fb70bd90d4c4

    if (_result.data == null) {
      return [];
    } else {
      return _result.data!.data;
    }
  }
<<<<<<< HEAD

  @override
  Future<NoteModel?> updateNote(NoteModel value) async {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

  @override
  Future test() async {
    final testurl =
        'https://cugram.herokuapp.com/Bca/Semester-1/MFCA/Previous-Question-Papers';
    final _result = await dio.get(testurl);

    if (_result.data == null) {
      return ['failed'];
    } else {
      print(_result.data!.data);
      return _result.data;
    }
  }
=======
>>>>>>> 91782b6c3c3a4bed318be3a69771fb70bd90d4c4
}


