Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E514CA288
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 16:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328966; cv=fail; b=O+AjH7frosKOZ7OnzkO7ItGFBd9r4v6aU9STQ12bKjanH34dnWSm47ogEpLq+xAXo3ixWXrZYNfloaPWMvkw2cx4b74eNqwnXJYxQANWUJ4Cio0M3UNKrfeZcaWrzw0fWfeIqPSSklc18niYcRUOIYNRECaPqFL0TKXxjYUlefk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328966; c=relaxed/simple;
	bh=u3ofUnyKdW/2nLlkcfN4uErJuqcjm8q32b4ElHov0JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A/VI3SO+DwArIT2EjDC1uaiKzOzwpYLspBcF5ILYawA/fuKTsrLS9zLpdv2QG30SHDy5J9VjybnQc5XlJxAERR1bD4IqZtOC2EEyv0cg/BLOrlQWMtML9FELrOx7PlIWHcyUwx/LdGjzcV9D5hsOionbBUmjIe6STGK1z9y5UCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LJspDSoP; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LJspDSoP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ba4MD3Tq+tU3Rc5zCBfKtRz3wHdjA4MaSp6lroRVwmf7KxmvCu3byDDDX99XF+1I0RrmeV8XQmmgNGXC9aje1+mlOXy9iPf9K+gY8/N5RXQfHROeaZWdLesoKIhMyPmLQensrZgvrvBhb66qQGEei/Jv2+xzNNFwzJteZupBNga0FXO+F/S2dW+oW5H6cIjeeoK1+xIR+QOya2hX8gSSLmIShMVPN130A4Rrb1Qayz5xcqTRR4qPNh4OANebbmCW2ffl3FnswMbnOwVLo3MToQ9Y0jsNZljSKnlkwqi+PQ9KHj8OL78eL7zHna7RqsdpRh6Z3siMxA7/tFFJ5yxKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrOg4/9ozQIULLAfN49roa4/efULOnqd90BWxMQmU/A=;
 b=JXDpv7W3suPz1ZAXigbJJpUy9vAP8jmOHtFWyvzlsbwovXpfPDilzYu4s46D1twvj4a8wJqJaxMnRKtAXmpI5Ktp2xjRCgoAKGp39MBpNjE9s1ukBqPIjKl4voBr6uqEbiRYNf0rvBeWN93orez/UKnnCfypFOlkYHSWNFc2QWyPorrASzlk/NKM7Nw1a/hHBxDxiCQw/vvO1hbR+T73uDNV70UCYjQZOelOpamJE2Dj2oefh9oObuRsMV7mEQhg71frzHleLK8L32aryt8Mwy9KLjG70/hua+CHgFc2p+WzsJ5zWoKMRmu9SHfdjX8LjJqDO1Qv6ASqh0e/AcO6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrOg4/9ozQIULLAfN49roa4/efULOnqd90BWxMQmU/A=;
 b=LJspDSoPXQ2k7WDPJrmdN90Fi8VHYnESGU/GH/ohBueH0DWmpHBJmaYktE1BPlU7YPOvLtuhsbWmVCrbuCZAKV7hlYGATF5xuctOuSJoLPrL++VD9IK2tEUBNu+3yEBX2yEc4NNjwD36dFtPnGX/W+hcTapZ4+K4CYj9q6rPaSz/CNUrphtw08Uiz2LlOwdzaRBADj4SHS6Mlt5yTfqLAP3xEb9OtiFNIMci54V7Nu+k1cns8fsPIJwCgk9bOrHTk7I+RqwDf8LjwxMDf/234ZBiqQVLyZ5TsQ6UGn66SNviRbvOmHAiZ4E0xhxLQFKsYyI2hrdqdY5u80kboMPFcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 16:15:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 16:15:59 +0000
Date: Fri, 21 Aug 2026 12:15:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: pankaj.gupta@oss.nxp.com
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v40 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <aoh5s9KcE_s_U4eu@lizhi-Precision-Tower-5810>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
 <20260822-imx-se-if-v40-3-74fbce2f2f95@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822-imx-se-if-v40-3-74fbce2f2f95@nxp.com>
X-ClientProxiedBy: DX0P273CA0047.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5a::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c64af16-55ab-41cb-0007-08deff9f7ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|10067099003|5023799004|11063799006|4143699003|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qz/BbvwA++q9FPiDg1cuTX307uZQaEccGiQqulHOlFViOVw4N4c1L7kYaZgEvmKYtsuKzYwYQC/dIII1LFA3fmlDrRQcliDl6YpEUt2jCKljUeSQC37bycqivoi0LDqQw6iBLMxb59Wq/QJhkHH7IMaq0yrdfELOFcPXEgSnBxFU9DTpTCNWqNxgFdEdLxowyGrWK8wWzFDtB/eh2Xo1MKoamomuyWwQkMR9dgK9CMSTA9dx+i16vkSdTcEJd032M8BkXYL2VUEL6Dx1aIqRmaDThIao4LhP3rncNpssivuDkLb4x+hRWsvAM/x2rCYo7tCcTccJY9V/w+eHIgBgMg7H74PpGgXtOZmC2357NCcKJkj+ew4u4r9d+4X4r2Dc7w0ZTLV1bMicRGEXpGH6InzGF8Byq3OY9PxF5QERzFye2gRYxsy7eXWWOygaUd/NT6d3pxcZGcdMTYm5v+2GPXGTPieENjfpvE50pQ5XTLb+d+Nj1H+4HotQNmlIk9hkABaSUJyjd7dqxV1Ml7XxkV7reeJiekSTDSRskq3iwYXaA4aKGvDQjmCJweJzFfAtVqEhF1acViP+lpcOttXKKrP8BWgHU5SEVOmvwoWEMddteNKyQnh2frSEVozcVc4L9r9KlTGPMAjSM96AaAgosL+3zfjSdq5vu3dQtvw/8S0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aTk3o5IKII32+ZTxIQe85ddrJpIxSpCdfGbNj8ggUoABInmvPbY3Hn9aJFU/?=
 =?us-ascii?Q?1hxxdjZEo6mhh72vz+fMKQpFd6vfhUHpfqD/SGvSUDQkWbVTCOAYkB9DpHcI?=
 =?us-ascii?Q?lma4XQcCB8t8Gra00p+Nkb2vPqbJFlfsKrihABJ9sDKntqPeV37bvekMflsT?=
 =?us-ascii?Q?3o+FX/SmWuFwHTVrGc+ulBL0c+u5T2tLUpXKj3JlfAfitf59YKO6pkHqVT1v?=
 =?us-ascii?Q?tSOvstyBLEnmwdxHIoUEG4ltyrulkR+CWlPCA+3sKAIv1n1auypcNxkTYOFl?=
 =?us-ascii?Q?ebouylv+bCY1fAupl7wyApgXCRbPzzOBtLP+GEuFIF8JPgSczRb6MURCdXbV?=
 =?us-ascii?Q?pfW8Ig52AmgV+BwfYK3S42Z0M/ONVflRjkkNVwlfSyL7N9MTkC7vUwWEhrKA?=
 =?us-ascii?Q?Fqo/WVw0FAh3jKvf572Jdnu6ZvG7bKCcTFkYFjxsdtI98AdSjMP0yeiEsfIe?=
 =?us-ascii?Q?74uMU0sgCcdURjnN8RUHGz2VrwAriXIxf4FoohI8XxtOXaFrGlzzwWf0d8cq?=
 =?us-ascii?Q?ngub5YPsCZp4/wPJrIiR4/IZPEHE2xxxl+OHpJNxNRq9WOK+usdtyGn6j7Yx?=
 =?us-ascii?Q?qoFDhLjV+OQeQxTLaIzmTjnDsXZ8ymV9JWvAAv5xV0Qhz+dzMkTwmuE4trpJ?=
 =?us-ascii?Q?tE4z5KczP9ZwuV63m9EkQeXudZOGdiaAdkMD5gZK5jLM1o5Wa6UgKbJkonF5?=
 =?us-ascii?Q?ynYv28UHAzQ3465zRj544TbskeNBWHv4cGsnAu8tfPFA1Ibe6SWxJqxG48N3?=
 =?us-ascii?Q?XWBIGY/plntSMiornN8BEhLrRS7yJLUlBb5gJGEM+YyVASt5mf8Q7E2sgZe0?=
 =?us-ascii?Q?TKs0UetdvvLfuHsUhm6gBlah5UQ+UpRlzCykJsaoX7ieFPG0Zirgx3S/xXcU?=
 =?us-ascii?Q?AWECVQCdt6JeF2XgfQKiJwas21+fr5KeJjuKkIcLX+T/Ix//mqb8nVbrJP6U?=
 =?us-ascii?Q?yNORNi/o5MPoR1YAtGM4up+cYESjxzEePLQw7hy86GjHyLVFqryKKUI+pEmE?=
 =?us-ascii?Q?h77Z65rEHjCyu3tEI0cRyuN/KQdNgCCIkG0T36WWrtRhzd+WFLERiQwYwpqP?=
 =?us-ascii?Q?0LUY/o4UQEsbv1chmmcS5P8Nzlsem2QwEE0DA4EVLsq57rliFw64jyyC/TRe?=
 =?us-ascii?Q?29eOPSE9StqvFYqx0FZ+593eSR4D/lhBaJePgyeslil1ypgi10ogtBFY6Z3p?=
 =?us-ascii?Q?+x5E2vlZVneQ9xFnanY2aKUIRGg+3Sl12XJphVBl7+VdeGAx/Y+A+t4qifTm?=
 =?us-ascii?Q?yp6RSt1/0BdpqhFfg7MudhPyxphTqpaTGAM5wib11EfoIkG31DzHRHhdR+4C?=
 =?us-ascii?Q?eePybrm56xE+wwdN1szWUO9JxpXUVsOhp6ei42o2KmHW2t21nnn9CrwXhMoI?=
 =?us-ascii?Q?bTIBA8iLkBtk9Vcr/mu8BxgEb43lPHBPnOQqJjWuC4Ae3nmSgcvgDWNxgKnm?=
 =?us-ascii?Q?znOdtx0QPtEoTXaQanN1AvY2CIU18+XfKppzT/m6DnzVaHo3rLOa4x1qiftf?=
 =?us-ascii?Q?Fio0w1cTdXFyyc/Lfve3aoQCAjYqFAmpYMfdLkojtJQTCSLuZ/+5oZb8vYF4?=
 =?us-ascii?Q?9ZrL9g64JuDTtrngto69aH3BpoovxBO2sostHeSBBy/3aSmUwjdm0PYSjsMo?=
 =?us-ascii?Q?lVKiV1fOiAo46yZpOjdkgj0vFiy9D3fsS19+jEeVMv4n8ipgMH2++5N3VKqZ?=
 =?us-ascii?Q?3ii2hvPOClHBrkuwdhlyMWMFvt3ZufIR7O2Y/HUPc0+p9LG6lnVJCgpUUxws?=
 =?us-ascii?Q?SVEJN4PPfjGpocHkR2n+h5X3zxu3CqyNIOFD+sBtCd3W/848p7VC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c64af16-55ab-41cb-0007-08deff9f7ccf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:15:59.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjiVaNwPw0NzOctUXfEg7ZFHt+YWhrxIrqgFNoU6K3gkPqXpEx7rworT54JbSG1i+ZoJZjZWmIGW8dKRYDX4cwcWDD3WNqKcBjh65ldxdZwspUKYmgyD/XnBSx9BGebY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986

On Sat, Aug 22, 2026 at 12:06:10AM +0530, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> Add MU-based communication interface for secure enclave.
>
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
>
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
>
> Other dependent kernel drivers will be:
> - NVMEM: that supports non-volatile devices like EFUSES,
>   managed by NXP's secure-enclave.
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
...
> +
> +int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
> +			dma_addr_t img_addr)
> +{
> +	int ret = 0;

Need init 0 here, first use ret at ele_msg_send_rcv(), which already
set it

> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	if (upper_32_bits(contnr_addr) || upper_32_bits(img_addr)) {
> +		dev_err(priv->dev, "Wrong address: %pap %pap\n", &contnr_addr, &img_addr);
> +		return -EINVAL;
> +	}
> +
> +	struct se_api_msg *tx_msg __free(kfree)	=
> +		kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	struct se_api_msg *rx_msg __free(kfree) =
> +		kzalloc(ELE_FW_AUTH_RSP_MSG_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +			    ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
> +
> +	tx_msg->data[0] = lower_32_bits(contnr_addr);
> +	tx_msg->data[1] = 0;
> +	tx_msg->data[2] = lower_32_bits(img_addr);
> +
> +	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
> +			       ELE_FW_AUTH_RSP_MSG_SZ);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
> +				      ELE_FW_AUTH_RSP_MSG_SZ, true);
> +
> +	return ret;
> +}
> +
...
> +
> +	header = msg;
> +	rx_msg_sz = header->size << 2;
> +
> +	/* Incoming command: wake up the receiver if any. */
> +	if (header->tag == priv->if_defs->cmd_tag) {
> +		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
> +		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +		if (!se_clbk_hdl->rx_msg) {
> +			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +			dev_warn(dev, "No command receiver registered for message: %.8x\n",
> +				 *((u32 *)header));
> +			return;
> +		}
> +
> +		/*
> +		 * cmd_tag messages are delivered only to the explicitly registered
> +		 * command receiver. Unlike the synchronous response waiter path, the
> +		 * command receiver uses a dedicated long-lived buffer installed by
> +		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
> +		 * breaker handling used for rsp_tag messages.
> +		 */
> +		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
> +			*(u32 *)header);

check other message, need "\n"

> +
> +		/*
> +		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
> +		 * as the NVM command are initiated by FW.
> +		 * Size is revealed as part of this call function.
> +		 */
> +
> +		if (rx_msg_sz > MAX_NVM_MSG_LEN)
> +			sz_mismatch = true;
> +
> +		/*
> +		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
> +		 */
> +		se_clbk_hdl->rx_msg_sz = min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);

now, should needn't use min_t(), min() should work.

> +		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
> +		complete(&se_clbk_hdl->done);
> +		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +		if (sz_mismatch)
> +			dev_err(dev,
> +				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
> +				*(u32 *)header,
> +				(header->size << 2), rx_msg_sz);

...
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sys_soc.h>
> +
> +#include "ele_base_msg.h"
> +#include "ele_common.h"
> +#include "se_ctrl.h"
> +
> +#define MAX_SOC_INFO_DATA_SZ		256
> +#define MBOX_TX_NAME			"tx"
> +#define MBOX_RX_NAME			"rx"

Only use once, needn't define macro for MBOX_TX_NAME and MBOX_RX_NAME

> +
> +#define SE_TYPE_STR_DBG			"dbg"
> +#define SE_TYPE_STR_HSM			"hsm"
> +
> +#define SE_TYPE_ID_DBG			0x1
> +
> +#define SE_TYPE_ID_HSM			0x2
> +
> +struct se_soc_dev_regn {
> +	bool soc_dev_registered;
> +	struct soc_device *soc_dev;
> +	struct soc_device_attribute *soc_dev_attr;
> +};
> +
> +struct se_var_info {
> +	u16 soc_rev;
> +	struct se_soc_dev_regn soc_dev_regn;
> +	/* To serialize populating common SoC level info. */
> +	struct mutex se_var_info_lock;
> +};
> +
> +/* contains fixed information */
> +struct se_soc_info {
> +	const u16 soc_id;
> +	const char *soc_name;
> +	const struct se_fw_img_name se_fw_img_nm;
> +	bool imem_state_mgmt;
> +};
> +
> +struct se_if_node {
> +	struct se_soc_info *se_info;
> +	u8 *pool_name;
> +	bool reserved_dma_ranges;
> +	struct se_if_defines if_defs;
> +};
> +
> +/* common for all the SoC. */
> +static struct se_var_info var_se_info = {
> +	.soc_rev = 0,
> +	.se_var_info_lock = __MUTEX_INITIALIZER(var_se_info.se_var_info_lock)
> +};
> +
> +static struct se_soc_info se_imx8ulp_info = {
> +	.soc_id = SOC_ID_OF_IMX8ULP,
> +	.soc_name = "i.MX8ULP",
> +	.se_fw_img_nm = {
> +		.prim_fw_nm_in_rfs = IMX_ELE_FW_DIR
> +			"mx8ulpa2-ahab-container.img",
> +		.seco_fw_nm_in_rfs = IMX_ELE_FW_DIR
> +			"mx8ulpa2ext-ahab-container.img",
> +	},
> +	.imem_state_mgmt = true,
> +};
> +
> +static struct se_if_node imx8ulp_se_ele_hsm = {
> +	.se_info = &se_imx8ulp_info,
> +	.pool_name = "sram",
> +	.reserved_dma_ranges = true,
> +	.if_defs = {
> +		.se_if_type = SE_TYPE_ID_HSM,
> +		.cmd_tag = 0x17,
> +		.rsp_tag = 0xe1,
> +		.success_tag = ELE_SUCCESS_IND,
> +		.base_api_ver = MESSAGING_VERSION_6,
> +		.fw_api_ver = MESSAGING_VERSION_7,
> +	},
> +};
> +
> +static struct se_soc_info se_imx93_info = {
> +	.soc_id = SOC_ID_OF_IMX93,
> +};
> +
> +static struct se_if_node imx93_se_ele_hsm = {
> +	.se_info = &se_imx93_info,
> +	.reserved_dma_ranges = true,
> +	.if_defs = {
> +		.se_if_type = SE_TYPE_ID_HSM,
> +		.cmd_tag = 0x17,
> +		.rsp_tag = 0xe1,
> +		.success_tag = ELE_SUCCESS_IND,
> +		.base_api_ver = MESSAGING_VERSION_6,
> +		.fw_api_ver = MESSAGING_VERSION_7,
> +	},
> +};
> +
> +static const struct of_device_id se_match[] = {
> +	{ .compatible = "fsl,imx8ulp-se-ele-hsm", .data = &imx8ulp_se_ele_hsm },
> +	{ .compatible = "fsl,imx93-se-ele-hsm", .data = &imx93_se_ele_hsm },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, se_match);
> +
> +char *get_se_if_name(u8 se_if_id)
> +{
> +	switch (se_if_id) {
> +	case SE_TYPE_ID_DBG: return SE_TYPE_STR_DBG;
> +	case SE_TYPE_ID_HSM: return SE_TYPE_STR_HSM;
> +	}
> +
> +	return "unknown";
> +}
> +
> +static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
> +{
> +	return &priv->load_fw;
> +}
> +
> +static void se_soc_device_unregister(struct se_soc_dev_regn *soc_dev_regn)
> +{
> +	guard(mutex)(&var_se_info.se_var_info_lock);
> +
> +	if (soc_dev_regn->soc_dev) {
> +		soc_device_unregister(soc_dev_regn->soc_dev);
> +		soc_dev_regn->soc_dev = NULL;
> +	}
> +
> +	if (soc_dev_regn->soc_dev_attr) {
> +		/*
> +		 * revision and serial_number are the only kasprintf()-allocated
> +		 * strings. machine points into the DT, and soc_id/family are
> +		 * constants, so they must not be freed.
> +		 */
> +		kfree(soc_dev_regn->soc_dev_attr->revision);
> +		kfree(soc_dev_regn->soc_dev_attr->serial_number);
> +		kfree(soc_dev_regn->soc_dev_attr);
> +		soc_dev_regn->soc_dev_attr = NULL;
> +	}
> +
> +	soc_dev_regn->soc_dev_registered = false;
> +}
> +
> +/*
> + * Build and register a soc_device entry for this SoC. Separated from
> + * get_se_soc_info() so that the firmware-fetch path and the sysfs
> + * registration path can be reasoned about independently.
> + */
> +static int se_soc_dev_register(struct se_if_priv *priv, u16 soc_rev,
> +			       const char *soc_name, const u8 *uid)
> +{
> +	struct soc_device_attribute *attr;
> +	struct soc_device *sdev;
> +	int err;
> +
> +	if (!soc_rev || !soc_name || !uid)
> +		return -EINVAL;
> +
> +	attr = kzalloc_obj(*attr, GFP_KERNEL);
> +	if (!attr)
> +		return -ENOMEM;
> +
> +	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, soc_rev))
> +		attr->revision = kasprintf(GFP_KERNEL, "%x.%x",
> +					   FIELD_GET(DEV_GETINFO_MAJ_VER_MASK, soc_rev),
> +					   FIELD_GET(DEV_GETINFO_MIN_VER_MASK, soc_rev));
> +	else
> +		attr->revision = kasprintf(GFP_KERNEL, "%x",
> +					   FIELD_GET(DEV_GETINFO_MAJ_VER_MASK, soc_rev));
> +
> +	if (!attr->revision) {
> +		err = -ENOMEM;
> +		goto err_free_attr;
> +	}
> +
> +	attr->soc_id = soc_name;
> +
> +	err = of_property_read_string(of_root, "model", &attr->machine);
> +	if (err) {
> +		err = -EINVAL;
> +		goto err_free_rev;
> +	}
> +
> +	attr->family = "Freescale i.MX";
> +
> +	attr->serial_number = kasprintf(GFP_KERNEL, "%016llX",
> +					GET_SERIAL_NUM_FROM_UID(uid, MAX_UID_SIZE >> 2));
> +	if (!attr->serial_number) {
> +		err = -ENOMEM;
> +		goto err_free_rev;
> +	}
> +
> +	sdev = soc_device_register(attr);
> +	if (IS_ERR(sdev)) {
> +		err = PTR_ERR(sdev);
> +		goto err_free_serial;
> +	}
> +
> +	/*
> +	 * Publish the singleton. Freed once, at module unload, by
> +	 * se_soc_device_unregister(). Caller holds se_var_info_lock.
> +	 */
> +	var_se_info.soc_dev_regn.soc_dev = sdev;
> +	var_se_info.soc_dev_regn.soc_dev_attr = attr;
> +
> +	/* Mark registration complete so get_se_soc_info() skips this path on retry. */
> +	var_se_info.soc_dev_regn.soc_dev_registered = true;
> +
> +	return 0;
> +
> +err_free_serial:
> +	kfree(attr->serial_number);
> +err_free_rev:
> +	kfree(attr->revision);
> +err_free_attr:
> +	kfree(attr);
> +
> +	return err;
> +}
> +
> +static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
> +{
> +	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
> +	u8 data[MAX_SOC_INFO_DATA_SZ];
> +	struct ele_dev_info *s_info;
> +	int err;
> +
> +	guard(mutex)(&var_se_info.se_var_info_lock);
> +
> +	/*
> +	 * Early exit: both objectives already complete, nothing to do.
> +	 */
> +	if (var_se_info.soc_rev &&
> +	    (!se_info->soc_name || var_se_info.soc_dev_regn.soc_dev_registered))
> +		return 0;
> +
> +	err = ele_fetch_soc_info(priv, &data);
> +	if (err < 0)
> +		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
> +
> +	s_info = (struct ele_dev_info *)data;
> +
> +	if (!var_se_info.soc_rev) {
> +		var_se_info.soc_rev = s_info->d_info.soc_rev;
> +
> +		/*
> +		 * Only update IMEM state when the load_fw path is active;
> +		 * on SoCs without IMEM management (e.g. i.MX93) the field
> +		 * is not meaningful.
> +		 */
> +		if (load_fw->imem_mgmt)
> +			load_fw->imem.state = s_info->d_addn_info.imem_state;
> +	}
> +
> +	if (se_info->soc_name && !var_se_info.soc_dev_regn.soc_dev_registered) {
> +		err = se_soc_dev_register(priv, var_se_info.soc_rev,
> +					  se_info->soc_name, s_info->d_info.uid);
> +		if (err < 0)
> +			return dev_err_probe(priv->dev, err,
> +					     "Failed to register SE SoC device.");
> +	}
> +
> +	return 0;
> +}
> +
> +static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
> +				 struct mbox_client *cl, const char *name)
> +{
> +	struct mbox_chan *t_chan;
> +
> +	t_chan = mbox_request_channel_byname(cl, name);
> +	if (IS_ERR(t_chan))
> +		return dev_err_probe(dev, PTR_ERR(t_chan),
> +				     "Failed to request %s channel.", name);
> +
> +	*chan = t_chan;
> +
> +	return 0;
> +}
> +
> +static void se_if_probe_cleanup(void *plat_dev)
> +{
> +	struct platform_device *pdev = plat_dev;
> +	struct device *dev = &pdev->dev;
> +	struct se_if_priv *priv;
> +
> +	priv = dev_get_drvdata(dev);
> +	if (!priv)
> +		return;
> +
> +	if (priv->rx_chan)
> +		mbox_free_channel(priv->rx_chan);
> +	if (priv->tx_chan)
> +		mbox_free_channel(priv->tx_chan);
> +
> +	/*
> +	 * Being device managed buffer, no need to free the buffer allocated
> +	 * in se probe to store encrypted IMEM.
> +	 */
> +
> +	/*
> +	 * No need to check, if reserved memory is allocated
> +	 * before calling for its release. Or clearing the
> +	 * un-set bit.
> +	 */
> +	of_reserved_mem_device_release(dev);
> +
> +	dev_set_drvdata(dev, NULL);
> +
> +	kfree(priv);
> +}
> +
> +static int se_if_probe(struct platform_device *pdev)
> +{
> +	const struct se_soc_info *se_info;
> +	const struct se_if_node *if_node;
> +	struct se_fw_load_info *load_fw;
> +	struct device *dev = &pdev->dev;
> +	struct se_if_priv *priv;
> +	int ret;
> +
> +	if_node = device_get_match_data(dev);
> +	if (!if_node)
> +		return -EINVAL;
> +
> +	se_info = if_node->se_info;
> +
> +	priv = kzalloc_obj(*priv, GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->if_defs = &if_node->if_defs;
> +	dev_set_drvdata(dev, priv);
> +
> +	mutex_init(&priv->se_if_cmd_lock);
> +	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
> +	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
> +	atomic_set(&priv->fw_busy, 0);
> +	init_completion(&priv->waiting_rsp_clbk_hdl.done);
> +	init_completion(&priv->cmd_receiver_clbk_hdl.done);
> +
> +	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
> +	if (ret)
> +		return ret;
> +
> +	/* Mailbox client configuration */
> +	priv->se_mb_cl.dev		= dev;
> +	priv->se_mb_cl.tx_block		= false;
> +	priv->se_mb_cl.knows_txdone	= false;
> +	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
> +
> +	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
> +	if (ret)
> +		return ret;
> +
> +	ret = se_if_request_channel(dev, &priv->rx_chan, &priv->se_mb_cl, MBOX_RX_NAME);
> +	if (ret)
> +		return ret;
> +
> +	if (if_node->pool_name) {
> +		priv->mem_pool = of_gen_pool_get(dev->of_node, if_node->pool_name, 0);
> +		if (!priv->mem_pool)
> +			return dev_err_probe(dev, -ENOMEM,
> +					     "Unable to get sram pool = %s.",
> +					     if_node->pool_name);
> +	}
> +
> +	if (if_node->reserved_dma_ranges) {
> +		ret = of_reserved_mem_device_init(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					    "Failed to init reserved memory region.");
> +	}
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set 32-bit coherent DMA mask.");

Needn't check return value, dma_set_mask_and_coherent() always return
0 when >=32.

> +
> +	/*
> +	 * Initialize load_fw_lock before registering the misc device.
> +	 * A userspace process could open the device and trigger se_load_firmware()
> +	 * via IOCTL immediately after misc_register(), so the mutex must be ready
> +	 * before the device becomes visible.
> +	 */
> +	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
> +		load_fw = get_load_fw_instance(priv);
> +		mutex_init(&load_fw->load_fw_lock);

devm_mutex_init()? because below code has error path.

Frank
> +		load_fw->se_fw_img_nm = &se_info->se_fw_img_nm;
> +		load_fw->is_fw_tobe_loaded = true;
> +	}
> +
> +	/* By default, there is no pending FW to be loaded.*/
> +	if (se_info->imem_state_mgmt) {
> +		load_fw = get_load_fw_instance(priv);
> +
> +		/* allocate buffer where SE store encrypted IMEM */
> +		load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
> +							&load_fw->imem.daddr,
> +							GFP_KERNEL);
> +		if (!load_fw->imem.buf)
> +			return dev_err_probe(dev, -ENOMEM,
> +					     "dmam-alloc-failed: To store encr-IMEM.");
> +		load_fw->imem_mgmt = true;
> +	}
> +
> +	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
> +		ret = get_se_soc_info(priv, se_info);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
> +	}
> +
> +	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
> +		 get_se_if_name(priv->if_defs->se_if_type));
> +
> +	return ret;
> +}
> +
> +static int se_suspend(struct device *dev)
> +{
> +	struct se_if_priv *priv = dev_get_drvdata(dev);
> +	struct se_fw_load_info *load_fw;
> +	int ret = 0;
> +
> +	load_fw = get_load_fw_instance(priv);
> +
> +	if (load_fw->imem_mgmt) {
> +		ret = se_save_imem_state(priv, &load_fw->imem);
> +		if (ret)
> +			dev_err(dev, "Failure saving IMEM state[0x%x]", ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int se_resume(struct device *dev)
> +{
> +	struct se_if_priv *priv = dev_get_drvdata(dev);
> +	struct se_fw_load_info *load_fw;
> +	int ret = 0;
> +
> +	load_fw = get_load_fw_instance(priv);
> +
> +	if (load_fw->imem_mgmt) {
> +		ret = se_restore_imem_state(priv, &load_fw->imem);
> +		if (ret)
> +			dev_err(dev, "Failure restoring IMEM state[0x%x]", ret);
> +	}
> +
> +	return ret;
> +}
> +
> +DEFINE_SIMPLE_DEV_PM_OPS(se_pm, se_suspend, se_resume);
> +
> +static struct platform_driver se_driver = {
> +	.driver = {
> +		.name = "fsl-se",
> +		.of_match_table = se_match,
> +		.pm = pm_sleep_ptr(&se_pm),
> +	},
> +	.probe = se_if_probe,
> +};
> +
> +static int __init se_init(void)
> +{
> +	return platform_driver_register(&se_driver);
> +}
> +module_init(se_init);
> +
> +static void __exit se_exit(void)
> +{
> +	platform_driver_unregister(&se_driver);
> +
> +	/*
> +	 * The soc_device is a module-scoped singleton that outlives any single
> +	 * MU interface bind/unbind. Release it here, once, after every interface
> +	 * has been unbound, so its lifetime is tied to the module rather than to
> +	 * the first-probed interface.
> +	 */
> +	se_soc_device_unregister(&var_se_info.soc_dev_regn);
> +}
> +module_exit(se_exit);
> +
> +MODULE_AUTHOR("Pankaj Gupta <pankaj.gupta@nxp.com>");
> +MODULE_DESCRIPTION("iMX Secure Enclave Driver.");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
> new file mode 100644
> index 000000000000..54b2a262a2c3
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#ifndef SE_CTRL_H
> +#define SE_CTRL_H
> +
> +#include <linux/bitfield.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/semaphore.h>
> +
> +#define MAX_FW_LOAD_RETRIES		50
> +#define SE_MSG_WORD_SZ			0x4
> +
> +#define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
> +#define MAX_NVM_MSG_LEN			(256)
> +#define MESSAGING_VERSION_6		0x6
> +#define MESSAGING_VERSION_7		0x7
> +
> +struct se_clbk_handle {
> +	struct completion done;
> +	bool signal_rcvd;
> +	u32 rx_msg_sz;
> +	/*
> +	 * Assignment of the rx_msg buffer to held till the
> +	 * received content as part callback function, is copied.
> +	 */
> +	struct se_api_msg *rx_msg;
> +	/*
> +	 * Serialise the timeout path in ele_msg_rcv() against
> +	 * se_if_rx_callback() so that the callback can never
> +	 * memcpy into a buffer that the timeout path has already
> +	 * freed.
> +	 */
> +	spinlock_t clbk_rx_lock;
> +};
> +
> +struct se_imem_buf {
> +	u8 *buf;
> +	dma_addr_t daddr;
> +	u32 size;
> +	u32 state;
> +};
> +
> +/* Header of the messages exchange with the EdgeLock Enclave */
> +struct se_msg_hdr {
> +	u8 ver;
> +	u8 size;
> +	u8 command;
> +	u8 tag;
> +}  __packed;
> +
> +#define SE_MU_HDR_SZ		4
> +#define SE_MU_HDR_WORD_SZ	1
> +
> +struct se_api_msg {
> +	struct se_msg_hdr header;
> +	u32 data[];
> +};
> +
> +struct se_if_defines {
> +	const u8 se_if_type;
> +	u8 cmd_tag;
> +	u8 rsp_tag;
> +	u8 success_tag;
> +	u8 base_api_ver;
> +	u8 fw_api_ver;
> +};
> +
> +struct se_fw_img_name {
> +	const char *prim_fw_nm_in_rfs;
> +	const char *seco_fw_nm_in_rfs;
> +};
> +
> +struct se_fw_load_info {
> +	const struct se_fw_img_name *se_fw_img_nm;
> +	bool is_fw_tobe_loaded;
> +	bool imem_mgmt;
> +	struct se_imem_buf imem;
> +	/* to serialize the fw load state */
> +	struct mutex load_fw_lock;
> +};
> +
> +struct se_if_priv {
> +	struct device *dev;
> +
> +	struct se_clbk_handle cmd_receiver_clbk_hdl;
> +	/*
> +	 * Update to the waiting_rsp_dev, to be protected
> +	 * under se_if_cmd_lock.
> +	 */
> +	struct se_clbk_handle waiting_rsp_clbk_hdl;
> +	/*
> +	 * prevent new command to be sent on the se interface while previous
> +	 * command is still processing. (response is awaited)
> +	 */
> +	struct mutex se_if_cmd_lock;
> +
> +	struct mbox_client se_mb_cl;
> +	struct mbox_chan *tx_chan, *rx_chan;
> +
> +	struct gen_pool *mem_pool;
> +	const struct se_if_defines *if_defs;
> +	struct se_fw_load_info load_fw;
> +
> +	atomic_t fw_busy;
> +};
> +
> +char *get_se_if_name(u8 se_if_id);
> +#endif
> diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
> new file mode 100644
> index 000000000000..b1c4c9115d7b
> --- /dev/null
> +++ b/include/linux/firmware/imx/se_api.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __SE_API_H__
> +#define __SE_API_H__
> +
> +#include <linux/types.h>
> +
> +#define SOC_ID_OF_IMX8ULP		0x084d
> +#define SOC_ID_OF_IMX93			0x9300
> +
> +#endif /* __SE_API_H__ */
>
> --
> 2.43.0
>
