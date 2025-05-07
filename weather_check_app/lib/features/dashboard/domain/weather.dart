class Weather {
  const Weather({
    required this.cityName,
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.seaLevel,
    required this.windSpeed,
    required this.windDegrees,
  });

  final String cityName;
  final String description;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final int seaLevel;
  final double windSpeed;
  final double windDegrees;

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      cityName: map['name'] as String,
      description: map['weather'][0]['description'] as String,
      temperature: (map['main']['temp'] as num).toDouble(),
      feelsLike: (map['main']['feels_like'] as num).toDouble(),
      humidity: map['main']['humidity'] as int,
      seaLevel: map['main']['sea_level'] as int,
      windSpeed: (map['wind']['speed'] as num).toDouble(),
      windDegrees: (map['wind']['deg'] as num).toDouble(),
    );
  }

  @override
  String toString() {
    return 'Weather(cityName: $cityName, description: $description, temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, seaLevel: $seaLevel, windSpeed: $windSpeed, windDegrees: $windDegrees)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.cityName == cityName &&
        other.description == description &&
        other.temperature == temperature &&
        other.feelsLike == feelsLike &&
        other.humidity == humidity &&
        other.seaLevel == seaLevel &&
        other.windSpeed == windSpeed;
  }

  @override
  int get hashCode {
    return cityName.hashCode ^
        description.hashCode ^
        temperature.hashCode ^
        feelsLike.hashCode ^
        humidity.hashCode ^
        seaLevel.hashCode ^
        windSpeed.hashCode;
  }
}
