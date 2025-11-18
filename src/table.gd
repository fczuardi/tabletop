class_name Table extends Node3D

@export var seats_container: Node3D
@export var seat_model: Node3D
var _seats_count: int
@export var seats_count: int:
    get():
        return _seats_count
    set(value):
        _seats_count = value
        _clear_seats()
        _setup_seats()

func _ready() -> void:
    assert(seat_model, "Missing seats container")
    assert(seat_model, "Missing seat model")

func _clear_seats():
    for c in seats_container.get_children():
        if c != seat_model:
            c.queue_free()

func _setup_seats() -> void:
    assert(_seats_count >= Constants.MIN_PLAYERS && \
            _seats_count <= Constants.MAX_PLAYERS, "Invalid number of seats")
    for s in range(_seats_count -1):
        var seat_rotation: float = (360.0 / _seats_count) * (s + 1)
        var new_seat: Node3D = seat_model.duplicate()
        new_seat.name = "Seat %s" % (s + 1)
        new_seat.rotate_y(deg_to_rad(seat_rotation))
        seats_container.add_child(new_seat)
