/// msg : "Lotteries list."
/// data : {"name":"Lotteries list","lottery":{"game_id":"56","game_name":"Test Monday 05","game_name_hindi":"","open_time":"11:00 AM","open_time_sort":"00:00:00","close_time":"10:00 PM","status":"1","result_status":"0","market_status":"1","market_off_day":"","date":"2023-12-05","end_date":"2023-12-05","result_date":"2023-12-05","result_time":"21:00","ticket_price":"50","image":"1701775902Screenshot2023-08-22160853.png","lottery_number":"","category_id":"","ticket_count":"1000","start_number":"45","game_category":"5","active":"0","timer":"15","wallet_balance":"0","lottery_numbers":[{"id":"104","game_id":"56","lottery_number":"280","user_id":"54","book_status":"1","purchase_status":"1"},{"id":"105","game_id":"56","lottery_number":"280","user_id":"54","book_status":"1","purchase_status":"1"},{"id":"106","game_id":"56","lottery_number":"108","user_id":"54","book_status":"1","purchase_status":"1"}],"winning_position_history":[{"id":"67","game_id":"56","winner_price":"10000","winning_position":"1","lottery_no":"0"},{"id":"68","game_id":"56","winner_price":"5000","winning_position":"2","lottery_no":"0"},{"id":"69","game_id":"56","winner_price":"2000","winning_position":"3","lottery_no":"0"}]}}

class LotteryListModel {
  LotteryListModel({
      String? msg, 
      Data? data,}){
    _msg = msg;
    _data = data;
}

  LotteryListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msg;
  Data? _data;
LotteryListModel copyWith({  String? msg,
  Data? data,
}) => LotteryListModel(  msg: msg ?? _msg,
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

/// name : "Lotteries list"
/// lottery : {"game_id":"56","game_name":"Test Monday 05","game_name_hindi":"","open_time":"11:00 AM","open_time_sort":"00:00:00","close_time":"10:00 PM","status":"1","result_status":"0","market_status":"1","market_off_day":"","date":"2023-12-05","end_date":"2023-12-05","result_date":"2023-12-05","result_time":"21:00","ticket_price":"50","image":"1701775902Screenshot2023-08-22160853.png","lottery_number":"","category_id":"","ticket_count":"1000","start_number":"45","game_category":"5","active":"0","timer":"15","wallet_balance":"0","lottery_numbers":[{"id":"104","game_id":"56","lottery_number":"280","user_id":"54","book_status":"1","purchase_status":"1"},{"id":"105","game_id":"56","lottery_number":"280","user_id":"54","book_status":"1","purchase_status":"1"},{"id":"106","game_id":"56","lottery_number":"108","user_id":"54","book_status":"1","purchase_status":"1"}],"winning_position_history":[{"id":"67","game_id":"56","winner_price":"10000","winning_position":"1","lottery_no":"0"},{"id":"68","game_id":"56","winner_price":"5000","winning_position":"2","lottery_no":"0"},{"id":"69","game_id":"56","winner_price":"2000","winning_position":"3","lottery_no":"0"}]}

class Data {
  Data({
      String? name, 
      Lottery? lottery,}){
    _name = name;
    _lottery = lottery;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _lottery = json['lottery'] != null ? Lottery.fromJson(json['lottery']) : null;
  }
  String? _name;
  Lottery? _lottery;
Data copyWith({  String? name,
  Lottery? lottery,
}) => Data(  name: name ?? _name,
  lottery: lottery ?? _lottery,
);
  String? get name => _name;
  Lottery? get lottery => _lottery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_lottery != null) {
      map['lottery'] = _lottery?.toJson();
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
/// result_status : "0"
/// market_status : "1"
/// market_off_day : ""
/// date : "2023-12-05"
/// end_date : "2023-12-05"
/// result_date : "2023-12-05"
/// result_time : "21:00"
/// ticket_price : "50"
/// image : "1701775902Screenshot2023-08-22160853.png"
/// lottery_number : ""
/// category_id : ""
/// ticket_count : "1000"
/// start_number : "45"
/// game_category : "5"
/// active : "0"
/// timer : "15"
/// wallet_balance : "0"
/// lottery_numbers : [{"id":"104","game_id":"56","lottery_number":"280","user_id":"54","book_status":"1","purchase_status":"1"},{"id":"105","game_id":"56","lottery_number":"280","user_id":"54","book_status":"1","purchase_status":"1"},{"id":"106","game_id":"56","lottery_number":"108","user_id":"54","book_status":"1","purchase_status":"1"}]
/// winning_position_history : [{"id":"67","game_id":"56","winner_price":"10000","winning_position":"1","lottery_no":"0"},{"id":"68","game_id":"56","winner_price":"5000","winning_position":"2","lottery_no":"0"},{"id":"69","game_id":"56","winner_price":"2000","winning_position":"3","lottery_no":"0"}]

class Lottery {
  Lottery({
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
      String? active, 
      String? timer, 
      String? walletBalance, 
      List<LotteryNumbers>? lotteryNumbers, 
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
    _active = active;
    _timer = timer;
    _walletBalance = walletBalance;
    _lotteryNumbers = lotteryNumbers;
    _winningPositionHistory = winningPositionHistory;
}

  Lottery.fromJson(dynamic json) {
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
    _active = json['active'];
    _timer = json['timer'];
    _walletBalance = json['wallet_balance'];
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
  String? _active;
  String? _timer;
  String? _walletBalance;
  List<LotteryNumbers>? _lotteryNumbers;
  List<WinningPositionHistory>? _winningPositionHistory;
Lottery copyWith({  String? gameId,
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
  String? active,
  String? timer,
  String? walletBalance,
  List<LotteryNumbers>? lotteryNumbers,
  List<WinningPositionHistory>? winningPositionHistory,
}) => Lottery(  gameId: gameId ?? _gameId,
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
  active: active ?? _active,
  timer: timer ?? _timer,
  walletBalance: walletBalance ?? _walletBalance,
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
  String? get active => _active;
  String? get timer => _timer;
  String? get walletBalance => _walletBalance;
  List<LotteryNumbers>? get lotteryNumbers => _lotteryNumbers;
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
    map['active'] = _active;
    map['timer'] = _timer;
    map['wallet_balance'] = _walletBalance;
    if (_lotteryNumbers != null) {
      map['lottery_numbers'] = _lotteryNumbers?.map((v) => v.toJson()).toList();
    }
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
/// lottery_no : "0"

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

/// id : "104"
/// game_id : "56"
/// lottery_number : "280"
/// user_id : "54"
/// book_status : "1"
/// purchase_status : "1"

class LotteryNumbers {
  LotteryNumbers({
      String? id, 
      String? gameId, 
      String? lotteryNumber, 
      String? userId, 
      String? bookStatus, 
      String? purchaseStatus,}){
    _id = id;
    _gameId = gameId;
    _lotteryNumber = lotteryNumber;
    _userId = userId;
    _bookStatus = bookStatus;
    _purchaseStatus = purchaseStatus;
}

  LotteryNumbers.fromJson(dynamic json) {
    _id = json['id'];
    _gameId = json['game_id'];
    _lotteryNumber = json['lottery_number'];
    _userId = json['user_id'];
    _bookStatus = json['book_status'];
    _purchaseStatus = json['purchase_status'];
  }
  String? _id;
  String? _gameId;
  String? _lotteryNumber;
  String? _userId;
  String? _bookStatus;
  String? _purchaseStatus;
LotteryNumbers copyWith({  String? id,
  String? gameId,
  String? lotteryNumber,
  String? userId,
  String? bookStatus,
  String? purchaseStatus,
}) => LotteryNumbers(  id: id ?? _id,
  gameId: gameId ?? _gameId,
  lotteryNumber: lotteryNumber ?? _lotteryNumber,
  userId: userId ?? _userId,
  bookStatus: bookStatus ?? _bookStatus,
  purchaseStatus: purchaseStatus ?? _purchaseStatus,
);
  String? get id => _id;
  String? get gameId => _gameId;
  String? get lotteryNumber => _lotteryNumber;
  String? get userId => _userId;
  String? get bookStatus => _bookStatus;
  String? get purchaseStatus => _purchaseStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['game_id'] = _gameId;
    map['lottery_number'] = _lotteryNumber;
    map['user_id'] = _userId;
    map['book_status'] = _bookStatus;
    map['purchase_status'] = _purchaseStatus;
    return map;
  }

}