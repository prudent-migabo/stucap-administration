import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel{
  String? avatar;
  String? middleName;
  String? lastName;
  String? promotion;
  bool? presenceStatus;
  double? academicFees;
  bool? inscriptionStatus;
  Timestamp? createdAt;
  String? studentID;

//<editor-fold desc="Data Methods">
  StudentModel({
    this.avatar,
    this.middleName,
    this.lastName,
    this.promotion,
    this.presenceStatus,
    this.academicFees,
    this.inscriptionStatus,
    this.createdAt,
    this.studentID,
  });


  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'middleName': middleName,
      'lastName': lastName,
      'promotion': promotion,
      'presenceStatus': presenceStatus,
      'academicFees': academicFees,
      'inscriptionStatus': inscriptionStatus,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  factory StudentModel.fromMap(DocumentSnapshot doc) {
    Map map = doc.data()! as Map;
    return StudentModel(
      avatar: map['avatar'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      promotion: map['promotion'] ?? '',
      presenceStatus: map['presenceStatus'] ?? false,
      academicFees: map['academicFees'] ?? 0.0,
      inscriptionStatus: map['inscriptionStatus'] ?? false,
      createdAt: map['createdAt'] ?? 0,
      studentID: doc.id,
    );
  }

}