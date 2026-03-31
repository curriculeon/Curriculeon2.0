# What is Blockchain?

### Terminology
* `data` - a unit of information
* `hash` - unique identifier of a `block`.
* `block` - An encapsulation of `data`, `hash`, and a `hash of previous-block`.
* `ledger` - collection of transactions.
    * View more about ledgers by clicking [here](https://cdn.jwplayer.com/videos/r9YKUddZ-dOv10K2F.mp4)
* `blockchain` - a distrubed ledger open to anyone whose underlying implementation is a `LinkedList` of type `Block`
    * data recorded in blockchain becomes very difficult to change  because of the nature of `ledger`s
* `genesis block` - the first `node` in a `blockchain`.
* `cryptocurrency` - 
* `smart contract` - a program that is stored on the `blockchain` that can be used to automatically exchange `coins` based on certain conditions.
* `transactor` - an entity responsible for creating transactions
* `transaction` - a record of an exchange of `cryptocurrency` containing a digital signature from the `transactor`.
    * transactions are published broadcasted and verified decentrally.



## Properties of a Blockchain
* Upon creation of a `block`, a `hash` is calculated.
* Changing `data` of the block will cause the `hash` to change; thus `hash` can be used to detect changes in a `block`.
    * Upon the `hash` changing, it is no longer considered the same block.
* `hash of previous-block` is used to ensure that the integrity of `previous-block` is upheld by more than just `previous-block`; rather `current-block` must also uphold its data-integrity, as well as all subsequent `block`s.
    * This methodology is what manifests a transparent, integral, and secure system.