// 2023-08-04 16:27:35 -> 16:27
String formatTime(String timeData) {
  // 두 가지 형식을 구분하여 처리
  // yyyy-mm-dd hh:mm:ss 형식인 경우 hh:mm으로 변환
  List<String> parts = timeData.split(' ');
  if (parts.length >= 2) {
    String timePart = parts[1];
    return timePart.substring(0, 5); // hh:mm 부분만 추출
  }

  return ''; // 오류 처리 등에 사용할 기본 값
}
