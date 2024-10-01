enum TaskMode {
  async("async"),
  sync("sync");

  const TaskMode(this.mode);

  final String mode;
}
