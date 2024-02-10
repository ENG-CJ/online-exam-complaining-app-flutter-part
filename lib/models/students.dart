class Students {
  late String? id, name, gender, address, image, semester, className;
  late int? mobile, s_id, c_id, password;

  Students(
      {this.id,
      this.name,
      this.gender,
      this.mobile,
      this.address,
      this.s_id,
      this.c_id,
      this.image,
      this.password
      ,
        this.semester,
        this.className
      });

  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
        id: json['id'],
        name: json['studentName'],
        gender: json['gender'],
        mobile: int.parse(json['mobile']),
        address: json['address'],
        s_id: int.parse(json['s_id']),
        c_id: int.parse(json['c_id']),
        image: json['image'],
        password: int.parse(json['password']),
        semester: json['semester'],
        className: json['className'],

    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['address'] = address;
    data['s_id'] = s_id;
    data['c_id'] = c_id;
    data['image'] = image;
    data['password'] = password;
    return data;
  }
}
