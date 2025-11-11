# 我的第一个NFT合约

## 描述

该合约基于ERC721标准，提供NFT铸造功能。



## 开发流程

合约编写、合约部署、上传元数据、NFT铸造、NFT上市（opensea）。

- 合约编写：使用remix在线编写NFT合约
- 合约部署：输入管理员钱包地址进行部署
- 上传元数据：登录filebase，上传数字资产，获取到IPFS地址后，编写对应的metadata.json文件；上传metadata.json文件获取到对应IPFS地址
- NFT铸造：调用safeMint方法铸造NFT，需输入铸造的目标地址以及元数据（metadata.json）的IPFS地址
- NFT上市：登录opensea可查看NFT，输入价格可进行售卖



## 相关知识

NFT（non fungible token）：非同质化代币，唯一性，每个代币独一无二。

NFT实现原理：

<img src="img\NFT实现原理.png" alt="NFT实现原理"/>



## 参考B站UP仁科的视频

https://www.bilibili.com/video/BV1jGkZYuERg