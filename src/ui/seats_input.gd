class_name SeatsInput extends HBoxContainer

@export var table: Table
@export var slider: HSlider
@export var value_label: Label

func _ready() -> void:
    slider.value_changed.connect(_on_value_change)
    slider.value = table.seats_count

func _on_value_change(value: float):
    value_label.text = "%d" % value
    table.seats_count = int(value)
