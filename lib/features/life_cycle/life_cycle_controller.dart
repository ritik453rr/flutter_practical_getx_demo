import 'package:get/get.dart';

class LifeCycleController extends GetxController {
  /// Called when the controller is first created.
  /// Use this to initialize variables, start data loading, etc.
  @override
  void onInit() {
    super.onInit();
    print('🔵 onInit: Controller initialized');
  }

  /// Called after the widget and controller are fully initialized and rendered.
  /// Use this for actions that require the UI to be ready (like dialogs or navigation).
  @override
  void onReady() {
    super.onReady();
    print('🟡 onReady: UI is ready');
  }

  /// Called just before the controller is destroyed.
  /// Use this to clean up (cancel timers, close streams, etc.)
  @override
  void onClose() {
    super.onClose();
    print('🔴 onClose: Controller destroyed');
  }

}
