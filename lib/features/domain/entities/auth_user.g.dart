// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserImplAdapter extends TypeAdapter<_$AuthUserImpl> {
  @override
  final int typeId = 0;

  @override
  _$AuthUserImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AuthUserImpl(
      uid: fields[1] as String?,
      name: fields[2] as String?,
      email: fields[3] as String?,
      phoneNumber: fields[4] as String?,
      profilePicture: fields[5] as String?,
      address: fields[6] as String?,
      location: fields[7] as String?,
      isRegistered: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, _$AuthUserImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.profilePicture)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.isRegistered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
