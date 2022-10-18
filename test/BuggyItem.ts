import { ethers } from "hardhat";
import { expect } from "chai";
import { BuggyItem } from "../typechain-types"

context(`BuggyItem`, async () => {
    let item: BuggyItem;
    beforeEach(async () => {
        const ItermContract = await ethers.getContractFactory('BuggyItem');
        item = await ItermContract.deploy('BuggyItem', 'BITM');
        await item.deployed();
    })

    it(`Mint nft`, async () => {
        await item.mintNft();
        const totalSupply = await item.totalSupply();
        expect(totalSupply).to.be.equal(2);
    })
})