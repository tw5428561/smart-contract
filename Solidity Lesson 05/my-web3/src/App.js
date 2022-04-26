import React, { Component } from 'react';
import Web3 from "web3";
class App extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }
  async componentDidMount() {
    //判断页面是否安装Metamask
    if (typeof window.ethereum !== 'undefined') {
      const ethereum = window.ethereum
      //禁止自动刷新，metamask要求写的
      ethereum.autoRefreshOnNetworkChange = false

      try {
        //第一次链接Metamask
        const accounts = await ethereum.enable()
        console.log(accounts)
        //初始化Provider
        const provider = window['ethereum']
        console.log(provider)
        //获取网络ID
        console.log(provider.chainId)
        //实例化Web3
        const web3 = new Web3(provider)
        console.log(web3)

        ethereum.on('accountsChanged', function (accounts) {
          console.log("accountsChanged:" + accounts)
        })
        ethereum.on('networkChanged', function (networkVersion) {
          console.log("networkChanged:" + networkVersion)
        })
      } catch (e) {

      }
    } else {
      console.log('没有metamask')
    }
  }
  render() {
    return (
      <div></div>
    );
  }
}

export default App;