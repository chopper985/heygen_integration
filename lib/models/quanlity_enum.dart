enum QualityEnum {
  high('high'),
  medium('medium'),
  low('low');

  const QualityEnum(this.quality);

  final String quality;
}

extension QuanlityEnumX on String {
  QualityEnum get getQualityEnum {
    final int index =
        QualityEnum.values.indexWhere((quality) => quality.quality == this);

    if (index == -1) return QualityEnum.medium;

    return QualityEnum.values[index];
  }
}
