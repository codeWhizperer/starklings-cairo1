// starknet1.cairo


// I AM NOT DONE

#[starknet::contract]
mod JoesContract {

#[storage]
struct Storage{
    owner:felt252
}
    #[external(v0)]
    impl IJoesContract of super::IJoesContract<ContractState>{
        fn set_owner(ref self:ContractState, _owner:felt252){
            // TODO
        }

        fn get_owner(self:@ContractState) -> felt252 {
            // TODO
        }
    }

}

#[starknet::interface]
trait IJoesContract<TContractState> {
    fn get_owner(self:@TContractState) -> felt252;
    fn set_owner(ref self:TContractState, _owner:felt252);
}

#[cfg(test)]
mod test {
    use array::ArrayTrait;
    use array::SpanTrait;
    use super::JoesContract;
    use starknet::syscalls::deploy_syscall;
    use traits::TryInto;
    use option::OptionTrait;
    use starknet::class_hash::Felt252TryIntoClassHash;
    use core::result::ResultTrait;
    use super::IJoesContractDispatcher;
    use super::IJoesContractDispatcherTrait;
    use starknet::ContractAddress;

    #[test]
    #[available_gas(2000000000)]
    fn test_contract_view() {
        let dispatcher = deploy_contract();
        dispatcher.set_owner('Joe');
        assert( 'Joe' == dispatcher.get_owner(), 'Joe should be the owner.' );
    }

    fn deploy_contract() -> IJoesContractDispatcher {
        let mut calldata = ArrayTrait::new();
        let (address0, _) = deploy_syscall(
            JoesContract::TEST_CLASS_HASH.try_into().unwrap(), 0, calldata.span(), false
        ).unwrap();
        let contract0 = IJoesContractDispatcher { contract_address: address0 };
        contract0
    }
}