class RecordClass{
  final String user;
  final String action;
  final String date;
  final String time;


  RecordClass({this.user = '', this.action = '', this.date = '', this.time = ''});

  factory RecordClass.fromRTDB(Map<String, dynamic> data) {
    return RecordClass(user: data['User'], action: data['action'], date: data['date'], time: data['time'],);
  }

}