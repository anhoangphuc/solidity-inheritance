import { ethers } from "hardhat";
import { expect } from "chai";
import { Item } from "../typechain-types"

context(`Item`, async () => {
    let item: Item;
    beforeEach(async () => {
        const ItermContract = await ethers.getContractFactory('Item');
        item = await ItermContract.deploy('Iterm', 'ITM');
        await item.deployed();
    })

    it(`Mint nft`, async () => {
        await item.mintNft();
        const totalSupply = await item.totalSupply();
        expect(totalSupply).to.be.equal(2);
    })
})