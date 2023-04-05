const std = @import("std");

pub const ChessboardError = error{
    IndexOutOfBounds,
};

pub fn square(index: usize) ChessboardError!u64 {
    if (index == 0 or index > 64) {
        return ChessboardError.IndexOutOfBounds;
    }

    return std.math.pow(u64, 2, index - 1);
}

pub fn total() u64 {
    var ret: u64 = 0;
    var idx: usize = 1;

    while (idx <= 64) {
        ret += square(idx) catch 0;
        idx += 1;
    }

    return ret;
}
