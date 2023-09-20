import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stucap_admin/data/models/student_model.dart';

class StudentsRepository {
  
  CollectionReference studentRef = FirebaseFirestore.instance.collection('students');

  Future<String> addStudent (Map<String, dynamic> data) async{
    String? studentID;
    await studentRef.add(data).then((value) {
      studentID = value.id;
    });
    return studentID!;
  }

  Future updatePresenceStatus (String uid) async{
      await studentRef.doc(uid).update({'presenceStatus': true});
  }
  
  // Registered Students
  Stream<StudentModel> studentModel (String uid){
     return studentRef.doc(uid).snapshots().map((event) => StudentModel.fromMap(event));
  }

  List<StudentModel> listStudent (QuerySnapshot querySnapshot){
    return querySnapshot.docs.map((e) => StudentModel.fromMap(e)).toList();
  }

  Stream<List<StudentModel>> listRegisteredStudents (){
    return studentRef.snapshots().map(listStudent);
  }


  // Present students
  Stream<List<StudentModel>> listPresentStudents (String promotion){
     return studentRef.where("promotion", isEqualTo: promotion).where("presenceStatus", isEqualTo: true).snapshots().map(listStudent);

  }
  
}