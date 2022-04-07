
const request = async () => {
    let user;
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy({
        value: hre.ethers.utils.parseEther("0.1")
    });
    await waveContract.deployed();
    console.log('Contract address: ', waveContract.address);

    let contractBalance = await hre.ethers.provider.getBalance(
        waveContract.address
      );
      console.log(
        "Contract balance:",
        hre.ethers.utils.formatEther(contractBalance)
      );
    let colorTx = await waveContract.registerColor('red');
    await colorTx.wait();

    contractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
    );
    console.log(
    "Contract balance:",
    hre.ethers.utils.formatEther(contractBalance)
    );

    const [_, randomPerson] = await hre.ethers.getSigners();
    waveTxn = await waveContract.connect(randomPerson).registerColor("blue");
    await waveTxn.wait();

    contractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
    );
    console.log(
    "Contract balance:",
    hre.ethers.utils.formatEther(contractBalance)
    );

    let count = await waveContract.getTotalColors();
    console.log('TOTAL VOTES:', count);

    
    let colors = await waveContract.getColors();
    console.log('TOTAL colors:', colors);
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