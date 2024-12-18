Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13E51FA270
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734545110; cv=fail; b=hRk2WPRPD84Ksc3OngZqn/cnDKIhsfxoG7PYGmFfX+61/edhUtKkeuym21l7jswcjYH2iblHyP0z2UXmzmauj1taeeRRkua2nkeOmXQDekUAkY7dDj46nwXucp8Owkd6+HIEHt7kAQHU9RcA0jgKAPrEBzuzJiQTo+jDcZzNbVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734545110; c=relaxed/simple;
	bh=+9lhVvQiTeBnxyLPk692kT2EPeq1fmQ0E2PKFOLdcic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ITJBjn1c+XEmbUXpZKcHYl6s27n52DKO0HV5OMdHnqx/xgOc+3TwW84PRkagzbsXm8OZYe2AsFmAK7FVes7HgR/eOKObyzTkVD084RCe9L+4LOykl1o6Ij03p4aY2ipc3VyKndOX2/B6MCrYtmu1uAi7GQbbvGFcb3dHUz1j63Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WCrG3BgE; arc=fail smtp.client-ip=40.107.20.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WCrG3BgE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m51mj9RBtgaU8o9v+MAKy9A5xGGIgoGzg+H729YgmwWzTfwAQySE01VKwhcfb2z5/SK3bPUVZFdJ9/Jf43eajsvrHmnj8IfihNcTY2lQUtHgn5x+KULq3lighDLXM2cj8IGJlXEToh0VJcwdId5bk+uN1lN1z3gC8EzXXVe0DSk2cz3kyCn5Byix+6M5+AvVrCOnGiDjIci1q88GlJawmvrr1rIr5AgDSq78Bu11c0/hLs4BnadduiMngIV90lN3roZfEtiX5ofcmQ8bh4ckiDaH5ddgFWD4oph9rteK94YP5VV3A9z/FuM2p1kMqGLxCMz3JOPKz3GhEp3wyKUR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTxAfSD+KpBUJ+toK0FJ43yuj6Fc4OaJR2TsluZwcCw=;
 b=M2qi5/qoZHoEZTABZ0IpkJo8avf3ESHJEuTTKI4K9Nlxkw6UR2hM+A8BF6K1z9UG55qqdOOpJIu0JKVone3pFx5thTkzxFXjlz0femCWiFh5bF51ISfb7BgZo0pR95C/aUO9WKUHp8z1ZOINXalVzgYcxrZLLemPrvjRk8kiqO9HiDhZpqrf4xmDyLCYBQsDGtYINOzC6UIT46bmF79Y14fp7RfYzMvouPAztJ90UN6Lx3XZ+dw+vuEOJF62/e2vEOtgmuSrGjNbDdC1/ISxmLiHR3CjWn8yuMmpEMooyHHd6/nnjnMZbQuarKwoU8gCG1qJX22yp0fm3Xc3lTSNUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTxAfSD+KpBUJ+toK0FJ43yuj6Fc4OaJR2TsluZwcCw=;
 b=WCrG3BgERyOaY9+WoTwbwRMfrGVM24IkwiLxM18Bx/oSvP+D9K+JXAv9g62rHE/NMUhIiw2/Ypha+VQ+qezqU7wOPpX3OTlrs/LbKrzm2+NcfCOHs9d49r+sdgbZARZv9P6YUbKCQirwYcGDO8ziDEgDTGHBKucckYvrF+6xXmMeOaS5QC7tn/b5HlcLzXQ6ryI8T9bt1OruwNto/t5Be3F1aif9Wq6zSEq/OrHCGeAY412nwg54rdkdzfz/3QLLiJnIL34HnC326VEe/MEzGsroS7/BfJrZrQiwsupyB4M8Q71LUQEc2b0pqvXyD3aPZIeQT3YX3S5viGjOY4VVKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10342.eurprd04.prod.outlook.com (2603:10a6:800:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 18:05:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 18:05:06 +0000
Date: Wed, 18 Dec 2024 13:04:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx95: add ENETC 0 support
Message-ID: <Z2MOysEbkh1j5eds@lizhi-Precision-Tower-5810>
References: <20241218061725.1608466-1-wei.fang@nxp.com>
 <20241218061725.1608466-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218061725.1608466-3-wei.fang@nxp.com>
X-ClientProxiedBy: BY3PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffa3428-f522-4f56-fdd5-08dd1f8e80a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p+gb5y5hxzbvw0MdA3O3CqK7cPFU1RAPotxcn8+jlHU76tE7CNVYWH8I5x0r?=
 =?us-ascii?Q?oJN9YRmF1P8BVdZsMM0sw/MUnmrdACSK4ElIi4Zv3kwF4Vq/yfZTgolIsIJt?=
 =?us-ascii?Q?sJRkMJ3kMg8IhSoCwvujNKvw5triQYgHA55/+J1CM+qJc/rVtg85IDvhDz9+?=
 =?us-ascii?Q?hctTHOs5uzPdOevU3rtMayIK2ez5dDgiQ9kTx7/doUN/cH3174fQA4Y/qpUD?=
 =?us-ascii?Q?34R7fNZKIrC7KkMh0ferkU/459xqJtGeGCOQ9dG3msxJFohPnFhPcJrhDw6u?=
 =?us-ascii?Q?BC0yM+28un9Cb8Wjf1szhsXOE1cACcUx+N8SsnY5OoF2Nz/g+NyJAAYqoUy2?=
 =?us-ascii?Q?gN9/Ad5/J6p8cLfYUuoODsQJZM2khdXnEKdt6DHWaqamjPuPw9odR75VAh85?=
 =?us-ascii?Q?3ds3tc9R9dopveBSEYYOyIBcvinzzuqMWFGGVmkMLsiAuR6RhTpvONn31DIT?=
 =?us-ascii?Q?JN9Zn5JPr5VE9Cqu8LvD9gcxKMh8IcfqpEvaypMZO0CVjkhVLhLMFjEwx+i5?=
 =?us-ascii?Q?wydOBES6hywHL1QOn65GpIgmtrkmOPgsyZKmR3EXpoF8kl74kMffxK+aBGs5?=
 =?us-ascii?Q?oap0y3TS84okQQozxn88vAsIWEl0yJoYfOE5Qz8yb3SeMtBrEgq6GdJGebbg?=
 =?us-ascii?Q?jF0YuR/HU3F8IT4VlFBF48fgBmcdBhUBu6KilLjbVgKuc/BnNMuEG7Et0MYP?=
 =?us-ascii?Q?8T6xOhXiBEZOSpZcVwREBG6kadS209g51w4xp6FVo5h22N4+rK5HrWIpFFUB?=
 =?us-ascii?Q?2vyMl6f/Cj5PWqHiuoXFT+jfrz06r1gTfCmWNQMnzaez4VZUVE8QWjDzZNIk?=
 =?us-ascii?Q?aW1qw+3FZQAEDbDxAY3FLyLTk8PwH04DOf8VbPibWpT9myycQ4WuTt3kfyNF?=
 =?us-ascii?Q?7edRzgCKffKmncfWHeqFg4ZKZKwKkjFPT9wrapWA/rMKNfU5PnJuddPONoWr?=
 =?us-ascii?Q?x2Enx09G0ixwogTmvEY5yV9paW6WTRw1Fy9Q/2jBX4HaGPDPUA470nzKfIpT?=
 =?us-ascii?Q?Cgs91amDVWJ9XGXSrL26tP6tZ0gfRBZYXsY5G2sBPobUMFA5XmY960AjgMdC?=
 =?us-ascii?Q?IYISqo/b/mt1sjmZKHgxLg8VccEXDI1rpojptssnJF7SbnkV1uQKsc1bsoux?=
 =?us-ascii?Q?rNQ94rojSU8FkZrbQIuDUOpHhaZivImG9gWa/MD0kQ6pbiAZ783N9Y+jzjNK?=
 =?us-ascii?Q?TJPBp6a5iN8e2J235dBnl8VW9G3jhoymDW/p9wuGwcDVCvUIr8m7D82UCK6k?=
 =?us-ascii?Q?yz0ifwSkVKBuxePV/PLEQPMWSvyn3+esPVsslQg4+PDuuNVTbBuZx8pD8VoX?=
 =?us-ascii?Q?JLRFtThiddRoNndqZpW28+7BG6B3YLWo4MEXJQF1l75h8ZikgAux0QVLKlLu?=
 =?us-ascii?Q?PSiZjBFk/NwPVyMjIslF3TGV1xloZ/hVtMeleCJNfExydwCpBc9cCqheOO3Q?=
 =?us-ascii?Q?mCQTcQaPE5RVkr2jUyRpuWQzWacPLhro?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s66ruk0SJ+1oZvTiuCb44/pPZ1tlFQiALZrYAQoY2X0zOWhqLbbaG8NobB89?=
 =?us-ascii?Q?+MnAJYzjdjupk4dVnwmtkpIG6wAzI1ghttEkkuiYkx9DHTqatzXo+PAFU3Wa?=
 =?us-ascii?Q?uVgDW5JgCd1WB6VY1/eYjh5NNTuxo5MK9eCucfayKEmhQ+Q92TLoDF+YKBqB?=
 =?us-ascii?Q?7e12nhGM8GLwmk/Ezsph91Tluc9LdzoJFjk8uMfkDiWcrM+DvrOv4esHZCOX?=
 =?us-ascii?Q?15xJrJq2R9LXYxMlce1d04RaVm/NwSRMcgX4szpYEOZNJTHYP5eGo1JcrFBa?=
 =?us-ascii?Q?VqysAIFdf25ak9YNsAP7G4T0GLZ4Ex1X9nxm7jpoFUr3cTOOupA0E7mGS6RL?=
 =?us-ascii?Q?e1M6NuxgO2gv5KKMS0msiZ6Gga+zfb1fpbM+DusvBHMBw45d78pOYviROxyE?=
 =?us-ascii?Q?Ow051S/4tZFJp9DRUp5AfuMFVFGVIxPTCh9srFoqVQmBnoqbAsxw3+MJ6FhM?=
 =?us-ascii?Q?R7U+mu0X2XAmHDKyeGH44+BOZx1jR8XP5+/eHAsZ/OctnClAeMDIqYScicK8?=
 =?us-ascii?Q?ji/NB8m89irzMnV/Q3PnZMfV6w3EKA0KKEHlpnvXeaZMryswal75E5WkeIaQ?=
 =?us-ascii?Q?oVyhYmu8knjX65lf4KUKc/Nfr0KFZk2rYjmVyJPF73wVV05fGJLc2qYrQeBR?=
 =?us-ascii?Q?/kcPT/K6rFdQ0huQPoBGQ+sgd2SPn6W/G1DcRqcqMh1wFZWDvPysqt3vB5g/?=
 =?us-ascii?Q?N4+AQjyuOgtHh6CWEB3jSqUWaajlspoi3hj5W9MHypKZ/PmSgjO3MrFBKgmO?=
 =?us-ascii?Q?99SWNkouI+5g8Avo4nF6mfUuyhFngalO3PnKB70+egWfYKH/lzcm4QeLiM3J?=
 =?us-ascii?Q?H3TokilIAVsHfp1yxh1aVZUB1OPP9FCRulPAVl81Z0izG6rUNVN0fD3D/nwH?=
 =?us-ascii?Q?mGuU283UwOirZvkVMMTnxVo2671zJ1FS59IC4n2LvLwfJNwh8KFQCYYH8kXc?=
 =?us-ascii?Q?LssOevBor1bCcgiaJDApFXAaySC+K366MVGFd6O9HohCT9q0aNruQwhYwgZm?=
 =?us-ascii?Q?ZIL61NXfGt0Otfu2a2c6r9Kj5JHEi1T5Lx8orX6ZDJQS0xtUtlYjadDoJ8La?=
 =?us-ascii?Q?KfAugHb90SLxdsUS5W6UdVq8RvfPGaEEf7FCFV1dbNmV6+aHyVEJ2kgQB+0l?=
 =?us-ascii?Q?XP2U4ORaAQfDwN93HK3SWc8VfMd8pB6A/xTc8yJS3RYUL4Ys5EZr46Tg3Wg+?=
 =?us-ascii?Q?/u7gVdgRwyYDs7+e49cMkr6uZb8BjNTL6SoLJf6aNouvq8RPlhQy0BLpuB2U?=
 =?us-ascii?Q?sCNlMf0HMbeBPdpnbomyPRXW3gxmB5FMcpsVnVSmTYG/S98YJmibUY0bMiZk?=
 =?us-ascii?Q?qdRy67qTDOZosgjm7BdBMBr0umkqQyI27s+c3uqHxsV/KW6Cavm7EPis2hk0?=
 =?us-ascii?Q?Jhq1Wi0XOd+0x2Cp3kUiPd5X/VfufHyMZx+YiCQCXe8Z1uJrht5alH8kjp5C?=
 =?us-ascii?Q?eHnRVB6yH6mpjuvcATtUorivjcMZcH56rqHdLx/83xr24hr/6KW40psIfyq9?=
 =?us-ascii?Q?8dmKNtjYY/isk9hAp8chW4fpLpiUwH14dU6B0wxanlWqJQIyMOUqQiuBI5Un?=
 =?us-ascii?Q?SSG3cWDNRDH+rPGM8oTtcJoOiUOetinLrBZ4BcVi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffa3428-f522-4f56-fdd5-08dd1f8e80a2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 18:05:06.1453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGJJrZ81eT2SoIyJe4RcHgGV9uF+0tolXhnsw5w7eHqqns92qEsFfSOgo+yRa5kbLI77Yq233As3t84zIKQ2aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10342

On Wed, Dec 18, 2024 at 02:17:25PM +0800, Wei Fang wrote:

nit: arm64: dts: imx95-19x19-evk: add ENETC 0 support

> Add ENETC 0 (1G ethernet port) support for i.MX95-19x19-EVK board. In
> addition, because all ENETC instances share MDIO bus, so enable EMDIO
> at the same time.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 6086cb7fa5a0..e838234c8317 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -38,6 +38,7 @@ aliases {
>  		mmc0 = &usdhc1;
>  		mmc1 = &usdhc2;
>  		serial0 = &lpuart1;
> +		ethernet0 = &enetc_port0;
>  	};
>
>  	bt_sco_codec: audio-codec-bt-sco {
> @@ -428,6 +429,33 @@ &wdog3 {
>  	status = "okay";
>  };
>
> +&netcmix_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@1 {
> +		reg = <1>;
> +		realtek,clkout-disable;
> +	};
> +};

Please keep order by these node. netc should after enetc

> +
>  &scmi_iomuxc {
>  	pinctrl_flexspi1: flexspi1grp {
>  		fsl,pins = <
> @@ -665,6 +693,30 @@ IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
>  			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
>  		>;
>  	};
> +
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
> +			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
> +			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
> +			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
> +			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
> +			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
> +			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
> +			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
> +			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
> +			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
> +			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
> +			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
> +		>;
> +	};
> +
> +	pinctrl_emdio: emdiogrp{
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x57e
> +			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
> +		>;
> +	};

some here, keep order,
enetc0grp should before flexspi1grp

Frank

>  };
>
>  &thermal_zones {
> --
> 2.34.1
>
