// The 'fibonacci_10' program.
// Sets the fibonacci_10 mapping with the first 10 sums of the fibonacci sequence

//Notes:
//   -No recursive function calls
//   -Loop bounds must be defined by constants, can't be defined by variables
//   -Mapping methods can only be called in finalize function
//   -Can't have transitions with zero input and output

program fibonacci_10_v2.aleo {
    mapping fibonacci_10: u8 => u8;

    transition populate_fibonacci(n : u8){
        return then finalize();
    }

    finalize populate_fibonacci(){
        Mapping::set(fibonacci_10, 0u8, 0u8);
        Mapping::set(fibonacci_10, 1u8, 1u8);
    }

    transition populate_fibonacci_2(n : u8){
        return then finalize();
    }

    finalize populate_fibonacci_2(){
        for i: u8 in 2u8..11u8 {
            let dub_pred : u8 = Mapping::get(fibonacci_10, i-2u8);
            let pred : u8 = Mapping::get(fibonacci_10, i-1u8);
            Mapping::set(fibonacci_10, i, dub_pred + pred);
        }
    }

}
