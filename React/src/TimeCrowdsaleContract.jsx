import { ethers } from 'ethers';

// Address of your deployed TimeCrowdsale contract
const contractAddress = '0x123...';

// ABI (Application Binary Interface) of your TimeCrowdsale contract
const contractABI = [
  // Define your contract's ABI here
];

// Function to connect to Ethereum provider and instantiate the contract
async function connectToContract() {
  // Connect to Ethereum provider (e.g., MetaMask)
  await window.ethereum.request({ method: 'eth_requestAccounts' });
  const provider = new ethers.providers.Web3Provider(window.ethereum);

  // Instantiate the contract
  const contract = new ethers.Contract(contractAddress, contractABI, provider.getSigner());
  return contract;
}

// Function to check if the crowdsale is open
async function isOpen() {
  const contract = await connectToContract();
  const isOpen = await contract.isOpen();
  return isOpen;
}

// Function to purchase tickets
async function purchaseTickets(guesses) {
  const contract = await connectToContract();
  const tx = await contract.purchaseTickets(guesses);
  await tx.wait();
}

// Function to fetch total guesses
async function totalGuesses() {
  const contract = await connectToContract();
  const total = await contract.totalGuesses();
  return total.toNumber();
}

export { isOpen, purchaseTickets, totalGuesses };
