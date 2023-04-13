import 'package:booking_system_flutter/main.dart';
import 'package:booking_system_flutter/utils/colors.dart';
import 'package:booking_system_flutter/utils/images.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

extension strEtx on String {
  Widget iconImage({double? size, Color? color, BoxFit? fit}) {
    return Image.asset(
      this,
      height: size ?? 24,
      width: size ?? 24,
      fit: fit ?? BoxFit.cover,
      color: color ?? (appStore.isDarkMode ? Colors.white : appTextSecondaryColor),
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(ic_no_photo, height: size ?? 24, width: size ?? 24);
      },
    );
  }

  Color get getPaymentStatusBackgroundColor {
    switch (this) {
      case BOOKING_STATUS_PENDING:
        return pending;
      case BOOKING_STATUS_ACCEPT:
        return accept;
      case BOOKING_STATUS_ON_GOING:
        return on_going;
      case BOOKING_STATUS_IN_PROGRESS:
        return in_progress;
      case BOOKING_STATUS_HOLD:
        return hold;
      case BOOKING_STATUS_CANCELLED:
        return cancelled;
      case BOOKING_STATUS_REJECTED:
        return rejected;
      case BOOKING_STATUS_FAILED:
        return failed;
      case BOOKING_STATUS_COMPLETED:
        return completed;
      case BOOKING_STATUS_PENDING_APPROVAL:
        return pendingApprovalColor;
      case BOOKING_STATUS_WAITING_ADVANCED_PAYMENT:
        return waiting;

      default:
        return defaultStatus;
    }
  }

  Color get getBookingActivityStatusColor {
    switch (this) {
      case ADD_BOOKING:
        return add_booking;
      case ASSIGNED_BOOKING:
        return assigned_booking;
      case TRANSFER_BOOKING:
        return transfer_booking;
      case UPDATE_BOOKING_STATUS:
        return update_booking_status;
      case CANCEL_BOOKING:
        return cancel_booking;
      case PAYMENT_MESSAGE_STATUS:
        return payment_message_status;

      default:
        return defaultActivityStatus;
    }
  }

  Color get getJobStatusColor {
    switch (this) {
      case BOOKING_STATUS_PENDING:
        return pending;
      case BOOKING_STATUS_ACCEPT:
        return accept;
      case BOOKING_STATUS_ON_GOING:
        return on_going;
      case BOOKING_STATUS_IN_PROGRESS:
        return in_progress;
      case BOOKING_STATUS_HOLD:
        return hold;
      case BOOKING_STATUS_CANCELLED:
        return cancelled;
      case BOOKING_STATUS_REJECTED:
        return rejected;
      case BOOKING_STATUS_FAILED:
        return failed;
      case BOOKING_STATUS_COMPLETED:
        return completed;
      case BOOKING_STATUS_PENDING_APPROVAL:
        return pendingApprovalColor;
      case BOOKING_STATUS_WAITING_ADVANCED_PAYMENT:
        return waiting;

      default:
        return defaultStatus;
    }
  }

  String toBookingStatus({String? method}) {
    if (this == BOOKING_TYPE_ALL) {
      return language.lblAll;
    } else if (this == BOOKING_STATUS_PENDING) {
      return language.lblPending;
    } else if (this == BOOKING_STATUS_ACCEPT) {
      return language.accepted;
    } else if (this == BOOKING_STATUS_ON_GOING) {
      return language.onGoing;
    } else if (this == BOOKING_STATUS_IN_PROGRESS) {
      return language.inProgress;
    } else if (this == BOOKING_STATUS_HOLD) {
      return language.lblHold;
    } else if (this == BOOKING_STATUS_CANCELLED) {
      return language.cancelled;
    } else if (this == BOOKING_STATUS_REJECTED) {
      return language.rejected;
    } else if (this == BOOKING_STATUS_FAILED) {
      return language.failed;
    } else if (this == BOOKING_STATUS_COMPLETED) {
      return language.completed;
    } else if (this == BOOKING_STATUS_PENDING_APPROVAL) {
      return language.pendingApproval;
    } else if (this == BOOKING_STATUS_WAITING_ADVANCED_PAYMENT) {
      return language.waiting;
    }

    return this;
  }
}
