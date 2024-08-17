/// Module: camp_1
module camp_1::camp_1 {

    use std::string::{String, utf8};

    fun hello_world_bytes(): vector<u8> {
        b"hello world"
    }

    public fun hello_world(): String {
        let bytes = hello_world_bytes();
        utf8(bytes)
    }

    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    public fun try_borrow(vec: &vector<u64>, i: u64): Option<u64> {
        let vec_len: u64 = vec.length();
        if (i < vec_len) {
            option::some(*vec.borrow(i))
        } else {
            option::none()
        }
    }

    #[test_only]
    public fun numbers(): vector<u64> {
        vector[1, 2, 3]
    }
}
