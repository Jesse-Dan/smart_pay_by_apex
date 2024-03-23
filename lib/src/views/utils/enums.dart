// ignore_for_file: constant_identifier_names

enum Tag {
  DEBUG,
  ERROR,
  SUCCESS,
  LOADING,
  CALLBACK,
  DIO_REQUEST,
  SERVICE_ACTION,
  BLOC_EVENT,
  PERSON_SUCCESS,
}

enum ButtonType { LONG_BTN, SHORT_BTN }

enum ResponseType {
  Success,
  Error,
  NotFound,
  TIME_OUT,
  SESSION_ENDED,
  CSFR_ERROR,
  CLIENT_ERROR,
  UNKNOWN_ERROR
}

enum HttpMethod { get, post, put, patch, delete }

enum CheckBoxTextPosition {
  left,
  right,
  both,
}

enum BtnContentType { IMG, TEXT }

enum TextFieldType { PHONE, TEXT, PASSWORD, OTP, DROPDOWN }

enum AppNotifierType { SUCCESS, ERROR }

enum AppNotifierFormat { NEW_POST, USER_OPERATION, FAVORITE }

enum PostCardType { favourite, all }

enum CommentType { Comment, Reply }

enum SubType {
  Basic,
  Essential,
  Flex,
  // Premium,
  // Gold,
  // Platinum,
  // Ultimate,
  // Diamond,
  // Executive,
}

enum NotificationType { FAVORITE, SECURITY, DEFAULT, ACTION }

enum PredefinedDateFormat {
  dateOnly,
  timeOnly,
  dateTime,
  time12HourFormat,
  time24HourFormat
}

enum HandlerBtnCount { one, two, zero }

enum ExamMode { Training, Exam, Accuracy, Speed, Custom }

enum ExamType { JAMB, WAEC, OTHERS }

enum ImageResizeMode {
  cover,
  contain,
  stretch,
}
