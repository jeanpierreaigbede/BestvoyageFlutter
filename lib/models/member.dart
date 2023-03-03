import 'package:cloud_firestore/cloud_firestore.dart';

class Member{
  String? uid;
  String? lastName;
  String? email;
  String? firstName, type, telephone;


  Member({
    required this.uid,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.telephone,
    required this.type
  });

  Member.fromDocumentSnapschot({required DocumentSnapshot document}){

    uid = document['uid'];
    lastName = document['lastName'];
    email = document['email'];
    firstName = document['firstName'];
    telephone = document["telephone"];
    type = document['type'];
  }

  toMap(Member member){
    return {
      "uid":member.uid,
      "lastName":member.lastName,
      "email":member.email,
      "firstName":member.firstName,
      "telephone":member.telephone,
      "type":member.type
    };
  }
}