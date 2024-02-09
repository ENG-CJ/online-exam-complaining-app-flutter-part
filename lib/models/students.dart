class Students {
  late String? id , name , gender ,address , image;
  late int? mobile , semester_id , class_id , password;

  Students({this.id , this.name , this.gender , this.mobile
  , this.address , this.semester_id , this.class_id , this.image , this.password});


  factory Students.fromJson(Map<String , dynamic> json ){
    return Students(
      id : json['id'],
      name: json['name'],
      gender: json['gender'],
      mobile: json['mobile'],
      address: json['address'],
      semester_id: json['semester_id'],
      class_id: json['class_id'],
      image: json['image'],
      password: json['password']
    );
  }

  Map<String , dynamic> toJson(){
    Map<String , dynamic> data = <String , dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['address'] = address;
    data['semester_id'] = semester_id;
    data['class_id'] = class_id;
    data['image'] = image;
    data['password'] = password;
    return data;
  }

}