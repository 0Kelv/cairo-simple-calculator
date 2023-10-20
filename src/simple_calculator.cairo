//@ dev A simple onchain calculator written in Cairo

#[starknet::interface]
trait ISimpleCalculator<TContractState> {
    fn add_two_numbers(self: @TContractState, x: felt252, y: felt252) -> felt252;
    fn subtract_two_numbers(self: @TContractState, x: felt252, y: felt252) -> felt252;
    fn multiply_two_numbers(self: @TContractState, x: felt252, y: felt252) -> felt252;
    fn divide_two_numbers(self: @TContractState, x: u128, y: u128) -> u128;
}

#[starknet::contract]
mod SimpleCalculator {
    #[storage]
    struct Storage {}

    #[external(v0)]
    impl SimpleCalculatorImpl of super::ISimpleCalculator<ContractState> {
        //add two numbers
        fn add_two_numbers(self: @ContractState, x: felt252, y: felt252) -> felt252 {
            let sum: felt252 = x + y;
            sum
        }

        //substract two numbers
        fn subtract_two_numbers(self: @ContractState, x: felt252, y: felt252) -> felt252 {
            let diff: felt252 = x - y;
            diff
        }

        //multiply two numbers
        fn multiply_two_numbers(self: @ContractState, x: felt252, y: felt252) -> felt252 {
            let prod: felt252 = x * y;
            prod
        }

        //divide two numbers
        fn divide_two_numbers(self: @ContractState, x: u128, y: u128) -> u128 {
            let quot: u128 = x / y;
            quot
        }
    }
}

