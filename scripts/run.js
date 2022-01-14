
const request = async () => {
    let user;
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Contract deployed to:", waveContract.address);
    console.log("Contract deployed by:", owner.address);
    user = await waveContract.registerUser('Luiz Phellipe', 'phellipe501@gmail.com', 'black', 0);
    user = await waveContract.registerUser('Gabriel Carneiro', 'luizinhophe@hotmail.com', 'red', 1);
    let userSuccess = await waveContract.getUsers();
    await userSuccess.wait();
    // waveCount = await waveContract.getTotalWaves();
/*
    waveTxn = await waveContract.connect(randomPerson).wave();
    await waveTxn.wait();
    waveCount = await waveContract.getTotalWaves();
*/
}

const runRequest = async () => {
    try {
        await request();
        process.exit(0);
    } catch (err) {
        console.log(err);
        process.exit(1);
    }
};

runRequest();