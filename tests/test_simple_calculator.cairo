use array::ArrayTrait;
use starknet::ContractAddress;
use snforge_std::{declare, ContractClassTrait};

use calculator::simple_calculator::ISimpleCalculatorDispatcher;
use calculator::simple_calculator::ISimpleCalculatorDispatcherTrait;

//declare and deploy a Starknet contract
fn deploy_contract(name: felt252) -> ContractAddress {
    let contract = declare(name);
    contract.deploy(@ArrayTrait::new()).unwrap()
}


//Testing addition 
//Remark: If function parameters are given fuzzing will be used.
#[test]
fn test_add_two_numbers(a: felt252, b: felt252) {
    // Declare and deploy   
    let contract_address = deploy_contract('SimpleCalculator');

    // Create a Dispatcher object that will allow interacting with the deployed contract
    let dispatcher = ISimpleCalculatorDispatcher { contract_address };

    let result = dispatcher.add_two_numbers(a, b);
    assert(result == a + b, 'invalid sum');
}

//Testing subtraction
#[test]
fn test_subtract_two_numbers(a: felt252, b: felt252) {
    let contract_address = deploy_contract('SimpleCalculator');

    let dispatcher = ISimpleCalculatorDispatcher { contract_address };

    let result = dispatcher.subtract_two_numbers(a, b);
    assert(result == a - b, 'invalid difference');
}

//Testing multiplication
#[test]
fn test_multiply_two_numbers(a: felt252, b: felt252) {
    let contract_address = deploy_contract('SimpleCalculator');

    let dispatcher = ISimpleCalculatorDispatcher { contract_address };

    let result = dispatcher.multiply_two_numbers(a, b);
    assert(result == a * b, 'invalid product');
}

//Testing division
//Remark: The fuzzer only supports felt252 arguments, so i couldn't use it here
#[test]
fn test_divide_two_numbers() {
    let contract_address = deploy_contract('SimpleCalculator');

    let dispatcher = ISimpleCalculatorDispatcher { contract_address };

    let result = dispatcher.divide_two_numbers(42, 7);
    assert(result == 6, 'invalid quotient');
}
