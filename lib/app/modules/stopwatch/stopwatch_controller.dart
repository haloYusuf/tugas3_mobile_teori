import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/core/services/session_service.dart';

class StopwatchController extends GetxController {
  static StopwatchController get to => Get.find();
  
  final SessionService _session = SessionService();
  
  RxString elapsedTime = '00:00:00.000'.obs;
  RxBool isRunning = false.obs;
  RxInt milliseconds = 0.obs;
  RxInt seconds = 0.obs;
  RxInt minutes = 0.obs;
  RxInt hours = 0.obs;
  
  DateTime? _startTime;
  DateTime? _lastPauseTime;
  Duration _accumulatedTime = Duration.zero;
  
  @override
  void onInit() {
    super.onInit();
    _loadStopwatchState();
  }
  
  void _loadStopwatchState() {
    final savedState = _session.getStopwatchState();
    if (savedState != null) {
      isRunning.value = savedState['isRunning'] ?? false;
      milliseconds.value = savedState['milliseconds'] ?? 0;
      seconds.value = savedState['seconds'] ?? 0;
      minutes.value = savedState['minutes'] ?? 0;
      hours.value = savedState['hours'] ?? 0;
      _accumulatedTime = Duration(
        hours: hours.value,
        minutes: minutes.value,
        seconds: seconds.value,
        milliseconds: milliseconds.value,
      );
      
      if (isRunning.value) {
        _startTime = DateTime.now().subtract(_accumulatedTime);
        _startTimer();
      } else {
        _updateDisplay();
      }
    }
  }
  
  void _saveStopwatchState() {
    _session.saveStopwatchState({
      'isRunning': isRunning.value,
      'milliseconds': milliseconds.value,
      'seconds': seconds.value,
      'minutes': minutes.value,
      'hours': hours.value,
    });
  }
  
  void _startTimer() {
    _startTime ??= DateTime.now().subtract(_accumulatedTime);
    
    Future.delayed(const Duration(milliseconds: 10), () {
      if (isRunning.value) {
        final currentDuration = DateTime.now().difference(_startTime!);
        _updateTime(currentDuration);
        _startTimer();
      }
    });
  }
  
  void _updateTime(Duration duration) {
    _accumulatedTime = duration;
    hours.value = duration.inHours;
    minutes.value = duration.inMinutes.remainder(60);
    seconds.value = duration.inSeconds.remainder(60);
    milliseconds.value = duration.inMilliseconds.remainder(1000);
    _updateDisplay();
  }
  
  void _updateDisplay() {
    elapsedTime.value = 
      '${hours.value.toString().padLeft(2, '0')}:'
      '${minutes.value.toString().padLeft(2, '0')}:'
      '${seconds.value.toString().padLeft(2, '0')}.'
      '${milliseconds.value.toString().padLeft(3, '0')}';
    _saveStopwatchState();
  }
  
  void toggleStopwatch() {
    if (isRunning.value) {
      _lastPauseTime = DateTime.now();
    } else {
      if (_lastPauseTime != null) {
        final pauseDuration = DateTime.now().difference(_lastPauseTime!);
        _startTime = _startTime?.add(pauseDuration);
      }
    }
    isRunning.toggle();
    
    if (isRunning.value) {
      _startTimer();
    }
    _saveStopwatchState();
  }
  
  void resetStopwatch() {
    isRunning.value = false;
    _accumulatedTime = Duration.zero;
    _startTime = null;
    _lastPauseTime = null;
    hours.value = 0;
    minutes.value = 0;
    seconds.value = 0;
    milliseconds.value = 0;
    _updateDisplay();
  }
  
  void handleBack() {
    Get.back();
  }
}