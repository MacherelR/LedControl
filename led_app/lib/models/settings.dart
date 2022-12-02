class LedControllerSettings {
  const LedControllerSettings({int rVal = 255, int gVal = 0, int bVal = 0})
      : _rValue = rVal,
        _gValue = gVal,
        _bValue = bVal;

  final int _rValue;
  final int _gValue;
  final int _bValue;

  LedControllerSettings.fromJson(Map<String, dynamic> json)
      : _rValue = json['rValue'] ?? 255,
        _gValue = json['gValue'] ?? 0,
        _bValue = json['bValue'] ?? 0;

  Map<String, dynamic> toJson() => {
        'rValue': _rValue,
        'gValue': _gValue,
        'bValue': _bValue,
      };

  int get rValue => _rValue;
  int get gValue => _gValue;
  int get bValue => _bValue;
}
