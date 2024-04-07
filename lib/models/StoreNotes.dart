class StoreNotes {
  int _id;
  String _title;
  String _description;
  DateTime _dateTime;

  StoreNotes(this._id, this._title, this._description, this._dateTime);

  // Getters
  int get id => _id;
  String get title => _title;
  String get description => _description;
  DateTime get datetime => _dateTime;

  // Setters
  set id(int value) {
    _id = value;
  }

  set title(String value) {
    _title = value;
  }

  set description(String value) {
    _description = value;
  }

  set datetime(DateTime value) {
    _dateTime = value;
  }
}