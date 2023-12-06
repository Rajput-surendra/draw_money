/// msg : "Lotteries list."
/// data : {"name":"Lotteries List","lotteries":[{"game_id":"56","game_name":"Test Monday 05","game_name_hindi":"","open_time":"11:00 AM","open_time_sort":"00:00:00","close_time":"10:00 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-12-05","end_date":"2023-12-05","result_date":"2023-12-05","result_time":"21:00","ticket_price":"50","image":"https://developmentalphawizz.com/lottomoney/assets/images/1701775902Screenshot2023-08-22160853.png","lottery_number":"","category_id":"","ticket_count":"1000","start_number":"45","game_category":"5","user_count":"5","lottery_count":"5","active":"1","lottery_numbers":"280,108,59","winning_position_history":[{"id":"67","game_id":"56","winner_price":"10000","winning_position":"1","lottery_no":"635"},{"id":"68","game_id":"56","winner_price":"5000","winning_position":"2","lottery_no":"476"},{"id":"69","game_id":"56","winner_price":"2000","winning_position":"3","lottery_no":"316"}]},{"game_id":"57","game_name":"Test Wednesday","game_name_hindi":"","open_time":"01:45 PM","open_time_sort":"00:00:00","close_time":"11:50 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-12-06","end_date":"2023-12-06","result_date":"2023-12-06","result_time":"13:55","ticket_price":"60","image":"https://developmentalphawizz.com/lottomoney/assets/images/1701850562Lotteryimage.jpg","lottery_number":"","category_id":"","ticket_count":"1000","start_number":"1","game_category":"5","user_count":"2","lottery_count":"2","active":"0","lottery_numbers":"719","winning_position_history":[{"id":"70","game_id":"57","winner_price":"1500","winning_position":"1","lottery_no":"5"},{"id":"71","game_id":"57","winner_price":"1000","winning_position":"2","lottery_no":"17"},{"id":"72","game_id":"57","winner_price":"500","winning_position":"3","lottery_no":"5"}]}]}

class MyLotteryModel {
  MyLotteryModel({
      String? msg, 
      Data? data,}){
    _msg = msg;
    _data = data;
}

  MyLotteryModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msg;
  Data? _data;
MyLotteryModel copyWith({  String? msg,
  Data? data,
}) => MyLotteryModel(  msg: msg ?? _msg,
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

/// name : "Lotteries List"
/// lotteries : [{"game_id":"56","game_name":"Test Monday 05","game_name_hindi":"","open_time":"11:00 AM","open_time_sort":"00:00:00","close_time":"10:00 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-12-05","end_date":"2023-12-05","result_date":"2023-12-05","result_time":"21:00","ticket_price":"50","image":"https://developmentalphawizz.com/lottomoney/assets/images/1701775902Screenshot2023-08-22160853.png","lottery_number":"","category_id":"","ticket_count":"1000","start_number":"45","game_category":"5","user_count":"5","lottery_count":"5","active":"1","lottery_numbers":"280,108,59","winning_position_history":[{"id":"67","game_id":"56","winner_price":"10000","winning_position":"1","lottery_no":"635"},{"id":"68","game_id":"56","winner_price":"5000","winning_position":"2","lottery_no":"476"},{"id":"69","game_id":"56","winner_price":"2000","winning_position":"3","lottery_no":"316"}]},{"game_id":"57","game_name":"Test Wednesday","game_name_hindi":"","open_time":"01:45 PM","open_time_sort":"00:00:00","close_time":"11:50 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-12-06","end_date":"2023-12-06","result_date":"2023-12-06","result_time":"13:55","ticket_price":"60","image":"https://developmentalphawizz.com/lottomoney/assets/images/1701850562Lotteryimage.jpg","lottery_number":"","category_id":"","ticket_count":"1000","start_number":"1","game_category":"5","user_count":"2","lottery_count":"2","active":"0","lottery_numbers":"719","winning_position_history":[{"id":"70","game_id":"57","winner_price":"1500","winning_position":"1","lottery_no":"5"},{"id":"71","game_id":"57","winner_price":"1000","winning_position":"2","lottery_no":"17"},{"id":"72","game_id":"57","winner_price":"500","winning_position":"3","lottery_no":"5"}]}]

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

/// game_id : "56"
/// game_name : "Test Monday 05"
/// game_name_hindi : ""
/// open_time : "11:00 AM"
/// open_time_sort : "00:00:00"
/// close_time : "10:00 PM"
/// status : "1"
/// result_status : "1"
/// market_status : "1"
/// market_off_day : ""
/// date : "2023-12-05"
/// end_date : "2023-12-05"
/// result_date : "2023-12-05"
/// result_time : "21:00"
/// ticket_price : "50"
/// image : "https://developmentalphawizz.com/lottomoney/assets/images/1701775902Screenshot2023-08-22160853.png"
/// lottery_number : ""
/// category_id : ""
/// ticket_count : "1000"
/// start_number : "45"
/// game_category : "5"
/// user_count : "5"
/// lottery_count : "5"
/// active : "1"
/// lottery_numbers : "280,108,59"
/// winning_position_history : [{"id":"67","game_id":"56","winner_price":"10000","winning_position":"1","lottery_no":"635"},{"id":"68","game_id":"56","winner_price":"5000","winning_position":"2","lottery_no":"476"},{"id":"69","game_id":"56","winner_price":"2000","winning_position":"3","lottery_no":"316"}]

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
      String? userCount, 
      String? lotteryCount, 
      String? active, 
      String? lotteryNumbers, 
      List<WinningPositionHistory>? winningPositionHistory,}){
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
    _userCount = userCount;
    _lotteryCount = lotteryCount;
    _active = active;
    _lotteryNumbers = lotteryNumbers;
    _winningPositionHistory = winningPositionHistory;
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
    _userCount = json['user_count'];
    _lotteryCount = json['lottery_count'];
    _active = json['active'];
    _lotteryNumbers = json['lottery_numbers'];
    if (json['winning_position_history'] != null) {
      _winningPositionHistory = [];
      json['winning_position_history'].forEach((v) {
        _winningPositionHistory?.add(WinningPositionHistory.fromJson(v));
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
  String? _userCount;
  String? _lotteryCount;
  String? _active;
  String? _lotteryNumbers;
  List<WinningPositionHistory>? _winningPositionHistory;
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
  String? userCount,
  String? lotteryCount,
  String? active,
  String? lotteryNumbers,
  List<WinningPositionHistory>? winningPositionHistory,
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
  userCount: userCount ?? _userCount,
  lotteryCount: lotteryCount ?? _lotteryCount,
  active: active ?? _active,
  lotteryNumbers: lotteryNumbers ?? _lotteryNumbers,
  winningPositionHistory: winningPositionHistory ?? _winningPositionHistory,
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
  String? get userCount => _userCount;
  String? get lotteryCount => _lotteryCount;
  String? get active => _active;
  String? get lotteryNumbers => _lotteryNumbers;
  List<WinningPositionHistory>? get winningPositionHistory => _winningPositionHistory;

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
    map['user_count'] = _userCount;
    map['lottery_count'] = _lotteryCount;
    map['active'] = _active;
    map['lottery_numbers'] = _lotteryNumbers;
    if (_winningPositionHistory != null) {
      map['winning_position_history'] = _winningPositionHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "67"
/// game_id : "56"
/// winner_price : "10000"
/// winning_position : "1"
/// lottery_no : "635"

class WinningPositionHistory {
  WinningPositionHistory({
      String? id, 
      String? gameId, 
      String? winnerPrice, 
      String? winningPosition, 
      String? lotteryNo,}){
    _id = id;
    _gameId = gameId;
    _winnerPrice = winnerPrice;
    _winningPosition = winningPosition;
    _lotteryNo = lotteryNo;
}

  WinningPositionHistory.fromJson(dynamic json) {
    _id = json['id'];
    _gameId = json['game_id'];
    _winnerPrice = json['winner_price'];
    _winningPosition = json['winning_position'];
    _lotteryNo = json['lottery_no'];
  }
  String? _id;
  String? _gameId;
  String? _winnerPrice;
  String? _winningPosition;
  String? _lotteryNo;
WinningPositionHistory copyWith({  String? id,
  String? gameId,
  String? winnerPrice,
  String? winningPosition,
  String? lotteryNo,
}) => WinningPositionHistory(  id: id ?? _id,
  gameId: gameId ?? _gameId,
  winnerPrice: winnerPrice ?? _winnerPrice,
  winningPosition: winningPosition ?? _winningPosition,
  lotteryNo: lotteryNo ?? _lotteryNo,
);
  String? get id => _id;
  String? get gameId => _gameId;
  String? get winnerPrice => _winnerPrice;
  String? get winningPosition => _winningPosition;
  String? get lotteryNo => _lotteryNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['game_id'] = _gameId;
    map['winner_price'] = _winnerPrice;
    map['winning_position'] = _winningPosition;
    map['lottery_no'] = _lotteryNo;
    return map;
  }

}