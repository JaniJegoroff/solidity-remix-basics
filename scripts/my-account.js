(async () => {
  let accounts = await web3.eth.getAccounts();
  let myAccount = accounts[0];
  console.log(accounts);
  console.log(myAccount);

  let balance = await web3.eth.getBalance(myAccount);
  let balanceInEth = web3.utils.fromWei(balance, "ether");
  console.log(balanceInEth + " ETH");
})();
