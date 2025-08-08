import 'package:flutter/services.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:vibration/vibration.dart';
import 'dart:io' show Platform;

class HapticService {
  static bool _isEnabled = true;
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      final canVibrate = await Vibration.hasVibrator() ?? false;
      final hasCustomVibrationsSupport = await Vibration.hasCustomVibrationsSupport() ?? false;

      print('📳 Haptic Service Initialized:');
      print('   • Can Vibrate: $canVibrate');
      print('   • Custom Vibrations: $hasCustomVibrationsSupport');
      print('   • Platform: ${Platform.operatingSystem}');

      _isInitialized = true;
    } catch (e) {
      print('❌ Failed to initialize haptic service: $e');
      _isInitialized = false;
    }
  }

  static void setEnabled(bool enabled) {
    _isEnabled = enabled;
    print('📳 Haptic feedback ${enabled ? 'enabled' : 'disabled'}');
  }

  static bool get isEnabled => _isEnabled;

  static Future<void> lightImpact() async {
    if (!_isEnabled) return;

    try {
      if (Platform.isIOS) {
        await HapticFeedback.lightImpact();
      } else {
        // Android fallback
        await HapticFeedback.lightImpact();
      }
    } catch (e) {
      print('❌ Light haptic failed: $e');
    }
  }

  static Future<void> lightSelection() async {
    if (!_isEnabled) return;

    try {
      await Haptics.vibrate(HapticsType.light);
    } catch (e) {
      // Fallback to standard light impact
      await lightImpact();
    }
  }

  static Future<void> mediumImpact() async {
    if (!_isEnabled) return;

    try {
      if (Platform.isIOS) {
        await HapticFeedback.mediumImpact();
      } else {
        await HapticFeedback.mediumImpact();
      }
    } catch (e) {
      print('❌ Medium haptic failed: $e');
    }
  }

  static Future<void> mediumSelection() async {
    if (!_isEnabled) return;

    try {
      await Haptics.vibrate(HapticsType.medium);
    } catch (e) {
      await mediumImpact();
    }
  }

  static Future<void> heavyImpact() async {
    if (!_isEnabled) return;

    try {
      if (Platform.isIOS) {
        await HapticFeedback.heavyImpact();
      } else {
        await HapticFeedback.heavyImpact();
      }
    } catch (e) {
      print('❌ Heavy haptic failed: $e');
    }
  }

  static Future<void> heavySelection() async {
    if (!_isEnabled) return;

    try {
      await Haptics.vibrate(HapticsType.heavy);
    } catch (e) {
      await heavyImpact();
    }
  }

  static Future<void> selectionClick() async {
    if (!_isEnabled) return;

    try {
      await HapticFeedback.selectionClick();
    } catch (e) {
      print('❌ Selection click failed: $e');
    }
  }

  static Future<void> success() async {
    if (!_isEnabled) return;

    try {
      await Haptics.vibrate(HapticsType.success);
    } catch (e) {
      // Fallback pattern for success
      await mediumImpact();
      await Future.delayed(const Duration(milliseconds: 100));
      await lightImpact();
    }
  }

  static Future<void> warning() async {
    if (!_isEnabled) return;

    try {
      await Haptics.vibrate(HapticsType.warning);
    } catch (e) {
      // Fallback pattern for warning
      await lightImpact();
      await Future.delayed(const Duration(milliseconds: 50));
      await mediumImpact();
    }
  }

  static Future<void> error() async {
    if (!_isEnabled) return;

    try {
      await Haptics.vibrate(HapticsType.error);
    } catch (e) {
      // Fallback pattern for error
      await heavyImpact();
      await Future.delayed(const Duration(milliseconds: 100));
      await heavyImpact();
    }
  }

  static Future<void> bondSearch() async {
    await lightSelection();
  }

  static Future<void> bondCardTap() async {
    await mediumSelection();
  }

  static Future<void> bondDetailLoaded() async {
    await success();
  }

  static Future<void> bondApiError() async {
    await error();
  }

  static Future<void> bondTabSwitch() async {
    await lightSelection();
  }

  static Future<void> isinCopied() async {
    await mediumSelection();
  }

  static Future<void> searchCleared() async {
    await lightImpact();
  }

  static Future<void> pullToRefresh() async {
    if (!_isEnabled) return;

    try {
      if (await Vibration.hasCustomVibrationsSupport() ?? false) {
        await Vibration.vibrate(
          pattern: [0, 100, 50, 100], // Pattern: wait, vibrate, wait, vibrate
          intensities: [0, 128, 0, 255], // Intensities for each step
        );
      } else {
        await lightImpact();
      }
    } catch (e) {
      await lightImpact();
    }
  }

  static Future<void> dataLoadSuccess() async {
    if (!_isEnabled) return;

    try {
      await lightImpact();
      await Future.delayed(const Duration(milliseconds: 50));
      await lightImpact();
    } catch (e) {
      await lightImpact();
    }
  }


  static Future<void> testHaptics() async {
    print('🧪 Testing haptic feedback...');

    await Future.delayed(const Duration(milliseconds: 500));
    print('   • Light Impact');
    await lightImpact();

    await Future.delayed(const Duration(milliseconds: 500));
    print('   • Medium Impact');
    await mediumImpact();

    await Future.delayed(const Duration(milliseconds: 500));
    print('   • Heavy Impact');
    await heavyImpact();

    await Future.delayed(const Duration(milliseconds: 500));
    print('   • Success Pattern');
    await success();

    await Future.delayed(const Duration(milliseconds: 500));
    print('   • Error Pattern');
    await error();

    print('✅ Haptic test completed');
  }

  static Future<Map<String, dynamic>> getCapabilities() async {
    final canVibrate = await Vibration.hasVibrator() ?? false;
    final hasCustomVibrationsSupport = await Vibration.hasCustomVibrationsSupport() ?? false;
    final hasAmplitudeControl = await Vibration.hasAmplitudeControl() ?? false;

    return {
      'canVibrate': canVibrate,
      'hasCustomVibrationsSupport': hasCustomVibrationsSupport,
      'hasAmplitudeControl': hasAmplitudeControl,
      'platform': Platform.operatingSystem,
      'isEnabled': _isEnabled,
      'isInitialized': _isInitialized,
    };
  }
}