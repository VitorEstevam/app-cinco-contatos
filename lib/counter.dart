import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  _Counter() {
    getValueFromMemory();
  }

  @action
  increment() {
    value++;
    saveValueOnMemory();
  }

  @action
  reset() {
    value = 0;
    saveValueOnMemory();
  }

  saveValueOnMemory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', value);
  }

  @action
  getValueFromMemory() async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getInt('counter') ?? 0;
  }
}

//context.watch<Counter>().value
//context.read<Counter>().increment