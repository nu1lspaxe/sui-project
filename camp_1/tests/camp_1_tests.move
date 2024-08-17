#[test_only]
module camp_1::camp_1_tests {

    use std::debug;
    use std::type_name;
    use camp_1::camp_1;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_hello_world() {
        debug::print(&camp_1::hello_world());
    }

    #[test]
    fun test_sum() {
        let sum_result = camp_1::sum(1,2);
        debug::print(&sum_result);
        assert!(sum_result == 3,0);
    }

    #[test]
    fun test_vector() {
        let mut numbers = camp_1::numbers();
        debug::print(&numbers);
        numbers.push_back(4);
        debug::print(&numbers);
        numbers.pop_back();
        debug::print(&numbers);

        let mut idx = 0;
        while (idx < numbers.length()) {
            let num = numbers.borrow(idx);
            debug::print(num);
            idx = idx + 1;
        };
        debug::print(&numbers);

        let mut idx = 0;
        loop {
            if (idx >= numbers.length()) break;
            let num = numbers.borrow(idx);
            debug::print(num);
            idx = idx + 1;
        };
        debug::print(&numbers);
    }

    #[test]
    fun test_option() {
        let numbers = camp_1::numbers();

        let opt = camp_1::try_borrow(&numbers, 0);
        debug::print(&opt);
        assert!(opt.is_some(), 0);

        let opt = camp_1::try_borrow(&numbers, 3);
        debug::print(&opt);
        assert!(opt.is_none(), 0);
    }

    #[test]
    fun test_type_name() {
        debug::print(&type_name::get<u64>());
        debug::print(&type_name::get<vector<u64>>());
        debug::print(&type_name::get<Option<u64>>());
    }


    #[test, expected_failure(abort_code = ::camp_1::camp_1_tests::ENotImplemented)]
    fun test_camp_1_fail() {
        abort ENotImplemented
    }
}
