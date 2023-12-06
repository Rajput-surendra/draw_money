/// msg : "Lotteries list."
/// data : {"name":"Lottery List","lotteries":[{"game_id":"59","game_name":"Shri Durga Maa Lottery","game_name_hindi":"","open_time":"03:10 PM","open_time_sort":"00:00:00","close_time":"10:20 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-12-06","end_date":"2023-12-06","result_date":"2023-12-06","result_time":"15:12","ticket_price":"40","image":"https://developmentalphawizz.com/lottomoney/assets/images/1701855436download2.jpg","lottery_number":"","category_id":"","ticket_count":"2000","start_number":"1","game_category":"5","winners":[{"id":"114","game_id":"57","winner_price":"10000","winning_position":"1","start_position":"1","end_position":"1","lottery_no":"12","lottery_number":"12","user_id":"54","book_status":"1","purchase_status":"1","user_name":"dyffyfccy","email":"raj@gmail.com","mobile":"9999999999","password":"","api_key":"","referral_code":"bb8404266325","referred_by":null,"security_pin":"7816","image":null,"address":"","dob":"0000-00-00","wallet_balance":"0","hold_amount":"0","last_update":"2023-12-05 16:00:42","insert_date":"2023-12-06 16:06:14","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"5000","winning_position":"3","start_position":"3","end_position":"3","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"1000","winning_position":"4-20","start_position":"4","end_position":"20","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"500","winning_position":"21-50","start_position":"21","end_position":"50","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"}],"user_count":"0","active":"0","result":[{"user_name":"Shreya Mishra ","mobile":"8877441122","winning_position":"21-50","winner_price":"500","lottery_number":"36"}]}]}

class GetResultListModel {
  GetResultListModel({
      String? msg, 
      Data? data,}){
    _msg = msg;
    _data = data;
}

  GetResultListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msg;
  Data? _data;
GetResultListModel copyWith({  String? msg,
  Data? data,
}) => GetResultListModel(  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get msg => _msg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// name : "Lottery List"
/// lotteries : [{"game_id":"59","game_name":"Shri Durga Maa Lottery","game_name_hindi":"","open_time":"03:10 PM","open_time_sort":"00:00:00","close_time":"10:20 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-12-06","end_date":"2023-12-06","result_date":"2023-12-06","result_time":"15:12","ticket_price":"40","image":"https://developmentalphawizz.com/lottomoney/assets/images/1701855436download2.jpg","lottery_number":"","category_id":"","ticket_count":"2000","start_number":"1","game_category":"5","winners":[{"id":"114","game_id":"57","winner_price":"10000","winning_position":"1","start_position":"1","end_position":"1","lottery_no":"12","lottery_number":"12","user_id":"54","book_status":"1","purchase_status":"1","user_name":"dyffyfccy","email":"raj@gmail.com","mobile":"9999999999","password":"","api_key":"","referral_code":"bb8404266325","referred_by":null,"security_pin":"7816","image":null,"address":"","dob":"0000-00-00","wallet_balance":"0","hold_amount":"0","last_update":"2023-12-05 16:00:42","insert_date":"2023-12-06 16:06:14","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"5000","winning_position":"3","start_position":"3","end_position":"3","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"1000","winning_position":"4-20","start_position":"4","end_position":"20","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"500","winning_position":"21-50","start_position":"21","end_position":"50","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"}],"user_count":"0","active":"0","result":[{"user_name":"Shreya Mishra ","mobile":"8877441122","winning_position":"21-50","winner_price":"500","lottery_number":"36"}]}]

class Data {
  Data({
      String? name, 
      List<Lotteries>? lotteries,}){
    _name = name;
    _lotteries = lotteries;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    if (json['lotteries'] != null) {
      _lotteries = [];
      json['lotteries'].forEach((v) {
        _lotteries?.add(Lotteries.fromJson(v));
      });
    }
  }
  String? _name;
  List<Lotteries>? _lotteries;
Data copyWith({  String? name,
  List<Lotteries>? lotteries,
}) => Data(  name: name ?? _name,
  lotteries: lotteries ?? _lotteries,
);
  String? get name => _name;
  List<Lotteries>? get lotteries => _lotteries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_lotteries != null) {
      map['lotteries'] = _lotteries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// game_id : "59"
/// game_name : "Shri Durga Maa Lottery"
/// game_name_hindi : ""
/// open_time : "03:10 PM"
/// open_time_sort : "00:00:00"
/// close_time : "10:20 PM"
/// status : "1"
/// result_status : "1"
/// market_status : "1"
/// market_off_day : ""
/// date : "2023-12-06"
/// end_date : "2023-12-06"
/// result_date : "2023-12-06"
/// result_time : "15:12"
/// ticket_price : "40"
/// image : "https://developmentalphawizz.com/lottomoney/assets/images/1701855436download2.jpg"
/// lottery_number : ""
/// category_id : ""
/// ticket_count : "2000"
/// start_number : "1"
/// game_category : "5"
/// winners : [{"id":"114","game_id":"57","winner_price":"10000","winning_position":"1","start_position":"1","end_position":"1","lottery_no":"12","lottery_number":"12","user_id":"54","book_status":"1","purchase_status":"1","user_name":"dyffyfccy","email":"raj@gmail.com","mobile":"9999999999","password":"","api_key":"","referral_code":"bb8404266325","referred_by":null,"security_pin":"7816","image":null,"address":"","dob":"0000-00-00","wallet_balance":"0","hold_amount":"0","last_update":"2023-12-05 16:00:42","insert_date":"2023-12-06 16:06:14","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"5000","winning_position":"3","start_position":"3","end_position":"3","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"1000","winning_position":"4-20","start_position":"4","end_position":"20","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"112","game_id":"59","winner_price":"500","winning_position":"21-50","start_position":"21","end_position":"50","lottery_no":"36","lottery_number":"36","user_id":"61","book_status":"1","purchase_status":"1","user_name":"Shreya Mishra ","email":"mishra.1@gmail.com","mobile":"8877441122","password":"","api_key":"","referral_code":"81b4f8557505","referred_by":null,"security_pin":"3399","image":"2326944435680643254.jpg","address":"","dob":"0000-00-00","wallet_balance":"5000","hold_amount":"0","last_update":"2023-12-06 13:28:04","insert_date":"2023-12-06 18:14:13","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"}]
/// user_count : "0"
/// active : "0"
/// result : [{"user_name":"Shreya Mishra ","mobile":"8877441122","winning_position":"21-50","winner_price":"500","lottery_number":"36"}]

class Lotteries {
  Lotteries({
      String? gameId, 
      String? gameName, 
      String? gameNameHindi, 
      String? openTime, 
      String? openTimeSort, 
      String? closeTime, 
      String? status, 
      String? resultStatus, 
      String? marketStatus, 
      String? marketOffDay, 
      String? date, 
      String? endDate, 
      String? resultDate, 
      String? resultTime, 
      String? ticketPrice, 
      String? image, 
      String? lotteryNumber, 
      String? categoryId, 
      String? ticketCount, 
      String? startNumber, 
      String? gameCategory, 
      List<Winners>? winners, 
      String? userCount, 
      String? active, 
      List<Result>? result,}){
    _gameId = gameId;
    _gameName = gameName;
    _gameNameHindi = gameNameHindi;
    _openTime = openTime;
    _openTimeSort = openTimeSort;
    _closeTime = closeTime;
    _status = status;
    _resultStatus = resultStatus;
    _marketStatus = marketStatus;
    _marketOffDay = marketOffDay;
    _date = date;
    _endDate = endDate;
    _resultDate = resultDate;
    _resultTime = resultTime;
    _ticketPrice = ticketPrice;
    _image = image;
    _lotteryNumber = lotteryNumber;
    _categoryId = categoryId;
    _ticketCount = ticketCount;
    _startNumber = startNumber;
    _gameCategory = gameCategory;
    _winners = winners;
    _userCount = userCount;
    _active = active;
    _result = result;
}

  Lotteries.fromJson(dynamic json) {
    _gameId = json['game_id'];
    _gameName = json['game_name'];
    _gameNameHindi = json['game_name_hindi'];
    _openTime = json['open_time'];
    _openTimeSort = json['open_time_sort'];
    _closeTime = json['close_time'];
    _status = json['status'];
    _resultStatus = json['result_status'];
    _marketStatus = json['market_status'];
    _marketOffDay = json['market_off_day'];
    _date = json['date'];
    _endDate = json['end_date'];
    _resultDate = json['result_date'];
    _resultTime = json['result_time'];
    _ticketPrice = json['ticket_price'];
    _image = json['image'];
    _lotteryNumber = json['lottery_number'];
    _categoryId = json['category_id'];
    _ticketCount = json['ticket_count'];
    _startNumber = json['start_number'];
    _gameCategory = json['game_category'];
    if (json['winners'] != null) {
      _winners = [];
      json['winners'].forEach((v) {
        _winners?.add(Winners.fromJson(v));
      });
    }
    _userCount = json['user_count'];
    _active = json['active'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }
  String? _gameId;
  String? _gameName;
  String? _gameNameHindi;
  String? _openTime;
  String? _openTimeSort;
  String? _closeTime;
  String? _status;
  String? _resultStatus;
  String? _marketStatus;
  String? _marketOffDay;
  String? _date;
  String? _endDate;
  String? _resultDate;
  String? _resultTime;
  String? _ticketPrice;
  String? _image;
  String? _lotteryNumber;
  String? _categoryId;
  String? _ticketCount;
  String? _startNumber;
  String? _gameCategory;
  List<Winners>? _winners;
  String? _userCount;
  String? _active;
  List<Result>? _result;
Lotteries copyWith({  String? gameId,
  String? gameName,
  String? gameNameHindi,
  String? openTime,
  String? openTimeSort,
  String? closeTime,
  String? status,
  String? resultStatus,
  String? marketStatus,
  String? marketOffDay,
  String? date,
  String? endDate,
  String? resultDate,
  String? resultTime,
  String? ticketPrice,
  String? image,
  String? lotteryNumber,
  String? categoryId,
  String? ticketCount,
  String? startNumber,
  String? gameCategory,
  List<Winners>? winners,
  String? userCount,
  String? active,
  List<Result>? result,
}) => Lotteries(  gameId: gameId ?? _gameId,
  gameName: gameName ?? _gameName,
  gameNameHindi: gameNameHindi ?? _gameNameHindi,
  openTime: openTime ?? _openTime,
  openTimeSort: openTimeSort ?? _openTimeSort,
  closeTime: closeTime ?? _closeTime,
  status: status ?? _status,
  resultStatus: resultStatus ?? _resultStatus,
  marketStatus: marketStatus ?? _marketStatus,
  marketOffDay: marketOffDay ?? _marketOffDay,
  date: date ?? _date,
  endDate: endDate ?? _endDate,
  resultDate: resultDate ?? _resultDate,
  resultTime: resultTime ?? _resultTime,
  ticketPrice: ticketPrice ?? _ticketPrice,
  image: image ?? _image,
  lotteryNumber: lotteryNumber ?? _lotteryNumber,
  categoryId: categoryId ?? _categoryId,
  ticketCount: ticketCount ?? _ticketCount,
  startNumber: startNumber ?? _startNumber,
  gameCategory: gameCategory ?? _gameCategory,
  winners: winners ?? _winners,
  userCount: userCount ?? _userCount,
  active: active ?? _active,
  result: result ?? _result,
);
  String? get gameId => _gameId;
  String? get gameName => _gameName;
  String? get gameNameHindi => _gameNameHindi;
  String? get openTime => _openTime;
  String? get openTimeSort => _openTimeSort;
  String? get closeTime => _closeTime;
  String? get status => _status;
  String? get resultStatus => _resultStatus;
  String? get marketStatus => _marketStatus;
  String? get marketOffDay => _marketOffDay;
  String? get date => _date;
  String? get endDate => _endDate;
  String? get resultDate => _resultDate;
  String? get resultTime => _resultTime;
  String? get ticketPrice => _ticketPrice;
  String? get image => _image;
  String? get lotteryNumber => _lotteryNumber;
  String? get categoryId => _categoryId;
  String? get ticketCount => _ticketCount;
  String? get startNumber => _startNumber;
  String? get gameCategory => _gameCategory;
  List<Winners>? get winners => _winners;
  String? get userCount => _userCount;
  String? get active => _active;
  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['game_id'] = _gameId;
    map['game_name'] = _gameName;
    map['game_name_hindi'] = _gameNameHindi;
    map['open_time'] = _openTime;
    map['open_time_sort'] = _openTimeSort;
    map['close_time'] = _closeTime;
    map['status'] = _status;
    map['result_status'] = _resultStatus;
    map['market_status'] = _marketStatus;
    map['market_off_day'] = _marketOffDay;
    map['date'] = _date;
    map['end_date'] = _endDate;
    map['result_date'] = _resultDate;
    map['result_time'] = _resultTime;
    map['ticket_price'] = _ticketPrice;
    map['image'] = _image;
    map['lottery_number'] = _lotteryNumber;
    map['category_id'] = _categoryId;
    map['ticket_count'] = _ticketCount;
    map['start_number'] = _startNumber;
    map['game_category'] = _gameCategory;
    if (_winners != null) {
      map['winners'] = _winners?.map((v) => v.toJson()).toList();
    }
    map['user_count'] = _userCount;
    map['active'] = _active;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// user_name : "Shreya Mishra "
/// mobile : "8877441122"
/// winning_position : "21-50"
/// winner_price : "500"
/// lottery_number : "36"

class Result {
  Result({
      String? userName, 
      String? mobile, 
      String? winningPosition, 
      String? winnerPrice, 
      String? lotteryNumber,}){
    _userName = userName;
    _mobile = mobile;
    _winningPosition = winningPosition;
    _winnerPrice = winnerPrice;
    _lotteryNumber = lotteryNumber;
}

  Result.fromJson(dynamic json) {
    _userName = json['user_name'];
    _mobile = json['mobile'];
    _winningPosition = json['winning_position'];
    _winnerPrice = json['winner_price'];
    _lotteryNumber = json['lottery_number'];
  }
  String? _userName;
  String? _mobile;
  String? _winningPosition;
  String? _winnerPrice;
  String? _lotteryNumber;
Result copyWith({  String? userName,
  String? mobile,
  String? winningPosition,
  String? winnerPrice,
  String? lotteryNumber,
}) => Result(  userName: userName ?? _userName,
  mobile: mobile ?? _mobile,
  winningPosition: winningPosition ?? _winningPosition,
  winnerPrice: winnerPrice ?? _winnerPrice,
  lotteryNumber: lotteryNumber ?? _lotteryNumber,
);
  String? get userName => _userName;
  String? get mobile => _mobile;
  String? get winningPosition => _winningPosition;
  String? get winnerPrice => _winnerPrice;
  String? get lotteryNumber => _lotteryNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = _userName;
    map['mobile'] = _mobile;
    map['winning_position'] = _winningPosition;
    map['winner_price'] = _winnerPrice;
    map['lottery_number'] = _lotteryNumber;
    return map;
  }

}

/// id : "114"
/// game_id : "57"
/// winner_price : "10000"
/// winning_position : "1"
/// start_position : "1"
/// end_position : "1"
/// lottery_no : "12"
/// lottery_number : "12"
/// user_id : "54"
/// book_status : "1"
/// purchase_status : "1"
/// user_name : "dyffyfccy"
/// email : "raj@gmail.com"
/// mobile : "9999999999"
/// password : ""
/// api_key : ""
/// referral_code : "bb8404266325"
/// referred_by : null
/// security_pin : "7816"
/// image : null
/// address : ""
/// dob : "0000-00-00"
/// wallet_balance : "0"
/// hold_amount : "0"
/// last_update : "2023-12-05 16:00:42"
/// insert_date : "2023-12-06 16:06:14"
/// status : "1"
/// verified : "1"
/// betting_status : "0"
/// notification_status : "1"
/// transfer_point_status : "0"

class Winners {
  Winners({
      String? id, 
      String? gameId, 
      String? winnerPrice, 
      String? winningPosition, 
      String? startPosition, 
      String? endPosition, 
      String? lotteryNo, 
      String? lotteryNumber, 
      String? userId, 
      String? bookStatus, 
      String? purchaseStatus, 
      String? userName, 
      String? email, 
      String? mobile, 
      String? password, 
      String? apiKey, 
      String? referralCode, 
      dynamic referredBy, 
      String? securityPin, 
      dynamic image, 
      String? address, 
      String? dob, 
      String? walletBalance, 
      String? holdAmount, 
      String? lastUpdate, 
      String? insertDate, 
      String? status, 
      String? verified, 
      String? bettingStatus, 
      String? notificationStatus, 
      String? transferPointStatus,}){
    _id = id;
    _gameId = gameId;
    _winnerPrice = winnerPrice;
    _winningPosition = winningPosition;
    _startPosition = startPosition;
    _endPosition = endPosition;
    _lotteryNo = lotteryNo;
    _lotteryNumber = lotteryNumber;
    _userId = userId;
    _bookStatus = bookStatus;
    _purchaseStatus = purchaseStatus;
    _userName = userName;
    _email = email;
    _mobile = mobile;
    _password = password;
    _apiKey = apiKey;
    _referralCode = referralCode;
    _referredBy = referredBy;
    _securityPin = securityPin;
    _image = image;
    _address = address;
    _dob = dob;
    _walletBalance = walletBalance;
    _holdAmount = holdAmount;
    _lastUpdate = lastUpdate;
    _insertDate = insertDate;
    _status = status;
    _verified = verified;
    _bettingStatus = bettingStatus;
    _notificationStatus = notificationStatus;
    _transferPointStatus = transferPointStatus;
}

  Winners.fromJson(dynamic json) {
    _id = json['id'];
    _gameId = json['game_id'];
    _winnerPrice = json['winner_price'];
    _winningPosition = json['winning_position'];
    _startPosition = json['start_position'];
    _endPosition = json['end_position'];
    _lotteryNo = json['lottery_no'];
    _lotteryNumber = json['lottery_number'];
    _userId = json['user_id'];
    _bookStatus = json['book_status'];
    _purchaseStatus = json['purchase_status'];
    _userName = json['user_name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _password = json['password'];
    _apiKey = json['api_key'];
    _referralCode = json['referral_code'];
    _referredBy = json['referred_by'];
    _securityPin = json['security_pin'];
    _image = json['image'];
    _address = json['address'];
    _dob = json['dob'];
    _walletBalance = json['wallet_balance'];
    _holdAmount = json['hold_amount'];
    _lastUpdate = json['last_update'];
    _insertDate = json['insert_date'];
    _status = json['status'];
    _verified = json['verified'];
    _bettingStatus = json['betting_status'];
    _notificationStatus = json['notification_status'];
    _transferPointStatus = json['transfer_point_status'];
  }
  String? _id;
  String? _gameId;
  String? _winnerPrice;
  String? _winningPosition;
  String? _startPosition;
  String? _endPosition;
  String? _lotteryNo;
  String? _lotteryNumber;
  String? _userId;
  String? _bookStatus;
  String? _purchaseStatus;
  String? _userName;
  String? _email;
  String? _mobile;
  String? _password;
  String? _apiKey;
  String? _referralCode;
  dynamic _referredBy;
  String? _securityPin;
  dynamic _image;
  String? _address;
  String? _dob;
  String? _walletBalance;
  String? _holdAmount;
  String? _lastUpdate;
  String? _insertDate;
  String? _status;
  String? _verified;
  String? _bettingStatus;
  String? _notificationStatus;
  String? _transferPointStatus;
Winners copyWith({  String? id,
  String? gameId,
  String? winnerPrice,
  String? winningPosition,
  String? startPosition,
  String? endPosition,
  String? lotteryNo,
  String? lotteryNumber,
  String? userId,
  String? bookStatus,
  String? purchaseStatus,
  String? userName,
  String? email,
  String? mobile,
  String? password,
  String? apiKey,
  String? referralCode,
  dynamic referredBy,
  String? securityPin,
  dynamic image,
  String? address,
  String? dob,
  String? walletBalance,
  String? holdAmount,
  String? lastUpdate,
  String? insertDate,
  String? status,
  String? verified,
  String? bettingStatus,
  String? notificationStatus,
  String? transferPointStatus,
}) => Winners(  id: id ?? _id,
  gameId: gameId ?? _gameId,
  winnerPrice: winnerPrice ?? _winnerPrice,
  winningPosition: winningPosition ?? _winningPosition,
  startPosition: startPosition ?? _startPosition,
  endPosition: endPosition ?? _endPosition,
  lotteryNo: lotteryNo ?? _lotteryNo,
  lotteryNumber: lotteryNumber ?? _lotteryNumber,
  userId: userId ?? _userId,
  bookStatus: bookStatus ?? _bookStatus,
  purchaseStatus: purchaseStatus ?? _purchaseStatus,
  userName: userName ?? _userName,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  password: password ?? _password,
  apiKey: apiKey ?? _apiKey,
  referralCode: referralCode ?? _referralCode,
  referredBy: referredBy ?? _referredBy,
  securityPin: securityPin ?? _securityPin,
  image: image ?? _image,
  address: address ?? _address,
  dob: dob ?? _dob,
  walletBalance: walletBalance ?? _walletBalance,
  holdAmount: holdAmount ?? _holdAmount,
  lastUpdate: lastUpdate ?? _lastUpdate,
  insertDate: insertDate ?? _insertDate,
  status: status ?? _status,
  verified: verified ?? _verified,
  bettingStatus: bettingStatus ?? _bettingStatus,
  notificationStatus: notificationStatus ?? _notificationStatus,
  transferPointStatus: transferPointStatus ?? _transferPointStatus,
);
  String? get id => _id;
  String? get gameId => _gameId;
  String? get winnerPrice => _winnerPrice;
  String? get winningPosition => _winningPosition;
  String? get startPosition => _startPosition;
  String? get endPosition => _endPosition;
  String? get lotteryNo => _lotteryNo;
  String? get lotteryNumber => _lotteryNumber;
  String? get userId => _userId;
  String? get bookStatus => _bookStatus;
  String? get purchaseStatus => _purchaseStatus;
  String? get userName => _userName;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get password => _password;
  String? get apiKey => _apiKey;
  String? get referralCode => _referralCode;
  dynamic get referredBy => _referredBy;
  String? get securityPin => _securityPin;
  dynamic get image => _image;
  String? get address => _address;
  String? get dob => _dob;
  String? get walletBalance => _walletBalance;
  String? get holdAmount => _holdAmount;
  String? get lastUpdate => _lastUpdate;
  String? get insertDate => _insertDate;
  String? get status => _status;
  String? get verified => _verified;
  String? get bettingStatus => _bettingStatus;
  String? get notificationStatus => _notificationStatus;
  String? get transferPointStatus => _transferPointStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['game_id'] = _gameId;
    map['winner_price'] = _winnerPrice;
    map['winning_position'] = _winningPosition;
    map['start_position'] = _startPosition;
    map['end_position'] = _endPosition;
    map['lottery_no'] = _lotteryNo;
    map['lottery_number'] = _lotteryNumber;
    map['user_id'] = _userId;
    map['book_status'] = _bookStatus;
    map['purchase_status'] = _purchaseStatus;
    map['user_name'] = _userName;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['api_key'] = _apiKey;
    map['referral_code'] = _referralCode;
    map['referred_by'] = _referredBy;
    map['security_pin'] = _securityPin;
    map['image'] = _image;
    map['address'] = _address;
    map['dob'] = _dob;
    map['wallet_balance'] = _walletBalance;
    map['hold_amount'] = _holdAmount;
    map['last_update'] = _lastUpdate;
    map['insert_date'] = _insertDate;
    map['status'] = _status;
    map['verified'] = _verified;
    map['betting_status'] = _bettingStatus;
    map['notification_status'] = _notificationStatus;
    map['transfer_point_status'] = _transferPointStatus;
    return map;
  }

}