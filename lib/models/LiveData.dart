import 'dart:async';

class LiveData<StoreNotes> {
  StreamController<StoreNotes> _controller = StreamController.broadcast();

  Stream<StoreNotes> get stream => _controller.stream;

  void setValue(StoreNotes value) {
    _controller.add(value);
  }

  void dispose() {
    _controller.close();
  }
}