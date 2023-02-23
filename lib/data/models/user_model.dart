class UserModel {
  String? token;
  int? id;
  String? fullname;
  String? phone;
  String? phoneFull;
  String? username;
  dynamic bopingId;
  dynamic email;
  dynamic birthday;
  dynamic affId;
  dynamic type;
  dynamic bankAccountNo;
  dynamic bankCode;
  dynamic planId;
  dynamic lastLogin;
  dynamic packageId;
  dynamic bankName;
  dynamic tpToken;
  dynamic saleAdvised;
  dynamic registerIp;
  dynamic codePay;
  dynamic balance;
  String? luckyNumber;
  String? momoCode;
  String? country;
  String? gender;
  String? avatar;
  bool? isVerifyPhone;
  bool? isVerifyFullName;

  UserModel({
    this.token,
    this.id,
    this.fullname,
    this.phone,
    this.username,
    this.bopingId,
    this.email,
    this.birthday,
    this.affId,
    this.type,
    this.bankAccountNo,
    this.bankCode,
    this.planId,
    this.lastLogin,
    this.packageId,
    this.bankName,
    this.tpToken,
    this.saleAdvised,
    this.registerIp,
    this.codePay,
    this.balance,
    this.isVerifyPhone,
    this.phoneFull,
    this.luckyNumber,
    this.momoCode,
    this.country,
    this.avatar,
    this.gender,
    this.isVerifyFullName,
  });

  UserModel.fromJson(dynamic json) {
    token = json['token'];
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    phoneFull = json['phoneFull'];
    username = json['username'];
    bopingId = json['boping_id'];
    email = json['email'];
    birthday = json['birthday'];
    affId = json['aff_id'];
    type = json['type'];
    bankAccountNo = json['bank_account_no'];
    bankCode = json['bank_code'];
    planId = json['plan_id'];
    lastLogin = json['last_login'];
    packageId = json['package_id'];
    bankName = json['bank_name'];
    tpToken = json['tp_token'];
    saleAdvised = json['sale_advised'];
    registerIp = json['register_ip'];
    codePay = json['code_pay'];
    balance = json['balance'];
    isVerifyPhone = json['is_verify_phone'];
    isVerifyFullName = json['is_verify_fullname'];
    luckyNumber = json['lucky_number'];
    momoCode = json['momo_code'];
    country = json['country'];
    gender = json['gender'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['id'] = id;
    map['fullname'] = fullname;
    map['phone'] = phone;
    map['phoneFull'] = phoneFull;
    map['username'] = username;
    map['boping_id'] = bopingId;
    map['email'] = email;
    map['birthday'] = birthday;
    map['aff_id'] = affId;
    map['type'] = type;
    map['bank_account_no'] = bankAccountNo;
    map['bank_code'] = bankCode;
    map['plan_id'] = planId;
    map['last_login'] = lastLogin;
    map['package_id'] = packageId;
    map['bank_name'] = bankName;
    map['tp_token'] = tpToken;
    map['sale_advised'] = saleAdvised;
    map['register_ip'] = registerIp;
    map['code_pay'] = codePay;
    map['balance'] = balance;
    map['is_verify_phone'] = isVerifyPhone;
    map['is_verify_fullname'] = isVerifyFullName;
    map['lucky_number'] = luckyNumber;
    map['momo_code'] = momoCode;
    map['country'] = country;
    map['country'] = country;
    map['gender'] = gender;
    map['avatar'] = avatar;
    return map;
  }
}
