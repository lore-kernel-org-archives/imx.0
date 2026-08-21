Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14D472549
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327784; cv=fail; b=FiuiTinyLIkQb2Z1yInimJ/KNbGPvptFpujoPSZw+QmKNOwBz2E5KGlKqcBPqq5BaOGeF1+clRNvhhqtrW8/nCgyT52QQ1C9aUZ4VjOsra+IClnlOY04/xzrheDvjYky/Ym3ZPzxnM1FKmsqErmYiWXKBfMbpXYwXO9UNXl1s+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327784; c=relaxed/simple;
	bh=FBd692XNWIXEBlSvhrjhBh9YlKo16zUC4ejh0ETN+EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NeVQHn/kCyTjUoPjMbYVLhMUIvtB1QFS39B0XRO8vO8+yqHG0IK2GduNI0iod1OGgB8qcSJp6q2p3s5glUJQZr0Qt+XlZucJk29deI4YsoKnZFQwTxonqHE4aOPJKqLH/StfD03lj4bJHkLqwgGH2m0DtLPm+FFeAv1hvO8PaOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g5cr9feG; arc=fail smtp.client-ip=40.107.159.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g5cr9feG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfMDfAtQiOpIns84fYURLdWblJdBAlXdnHVxJyz/OKwkNaZ5JqNef0pFDigq0pOeysypruyldCeOlyuUgaNXuPZRLiPsiwG6JWhase635Bsa1zLq1aEQXTlNrxFQPeSOK9dTvGHQGuiQxPYpPTmBfoxiKg/Rae3jVkX3hT+NZZA78w1D3GE62t983uzK4FkwI3pBY5ibESSO3oP1WaXRx7bIWHOPvIGYfzJt7EzjclZs/MiWk1VzWSzaedVqPJB/6qMkOXiAKw0Firb0a1vOWmJyRFA2eKN2mPNTVEf9lipqZHrseso21o3ROBt1OW0aO53vXpMVvg0UB1XYkybKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GYW851qCsBToK11EEMYMqGrrxqkhUiscxOxDQ5WtXo=;
 b=AVUBSBeCeyT9utXvFWIQCRdoTrKCDmB+JbYucs9X30JH1x21XfHpuX81+xA9Vz3tAPVIKDWU0JhNEPLo9qaYapyI2j6W/qYTVvRxrV+SzAAi25QSOiiI8DMQ9JVCakFA2bRHLXQrwzBg3WSgTFvXPNsF8K4+ml/AUWJ0jpC9/YMd40EvrrbVGgYrKfERjK7GV+eeeBe5XJkDtI9lLIH2bWY1wNm11k7jrs9w8oYiAFzypL4lBBdHAcQXIsBfDDdZO+7RvUeTihNkyK7WoC5KdvPL3KkCbd1M7Ia05BRMIR4qsRW3j1Nre5MaR0YkuvKHu/hf2vIxhG1YzVuLveVeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GYW851qCsBToK11EEMYMqGrrxqkhUiscxOxDQ5WtXo=;
 b=g5cr9feGkkqS8kdXxJURoeH4fEKVqEPZzOJQ+T+nQ4qTH3sKfSNfSwqzligBYbrlxIkofaMDVYy6tJw2XcU879+E68LJjPYICBEcQr5Lq63rV2qq4Ak+UELUVBTQ+lZQxVeQ17GT8/3Ckp0DScAofoGH5OBwkrDd6UVK3DZITHGvvnaxlBz3WPzd4wzbmA/DGdfo+HetERNEa57MAG8rDWBQX9WCfdbubAgOD+YNkUmOCmyUd5XmUOkJxvD0BmSOEBOcoIzDeGUINvqK5/IodvcejhbKaKa2NuAmTz0XEE+rSTLez5/tR2AzBxoGKhXvr8gmC+KTkYWlxFMGD+QRnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:56:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:56:13 +0000
Date: Fri, 21 Aug 2026 11:56:05 -0400
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
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v40 4/7] firmware: imx: device context dedicated to priv
Message-ID: <aoh1FQFxUciEl1PL@lizhi-Precision-Tower-5810>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
 <20260822-imx-se-if-v40-4-74fbce2f2f95@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822-imx-se-if-v40-4-74fbce2f2f95@nxp.com>
X-ClientProxiedBy: SA0PR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:806:d2::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c51ec0d-6077-4eeb-f923-08deff9cba0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|23010399003|366016|18002099003|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mHwz6x67ga/RonkJjIhbHXzlDpDDq62/ut+cNxYYn5DHSK9D3Y5yii5OQPg4BtnwBDDd4hzf9gIE67/lyeV/gN862+otDanT2MhZEnLqz/RKou/N0CO63RCaU7zbzRyPAnfGfq0RuGV/oSKrSB4C/P2glVz2eosNZWq3kKBxyQMVATSfRbWTmZkDIjVcQhqICFKU09rpEs5a6+HtkusWjMhGXWW+XmoFeoTN0h+OXwmjm18W/YAMdTiSn5xcvwOgIgGYq6OnajHoyx6YdGXaVEAoBPV2RzCEV8OTWd3YBcC3NmG/jFsLfsPg4wkHgLEfCYm45RQPo7VS+JY0F77IjKd3IlS7pJpm3ZBSGk8IxxFHMaOtvLqedSH9R+GKf3ZDUe2FKHFmsqCyk8FyTE8megr3k2QZakSaQaffNvNOzygEsQ9INfGLZYdpIvynZzFPazjn28ZabNvis0Es22qrTVEmjvtsD7FcxxCfQZZkekQ3+GXp8OvMtiyKZgcKp7BCPyYZUjVVL4Mj8xnv02FDzDs9goIVIdWqUW6+fCEyJFeSXKIfSrcj4KbWnjfPVKQBwYFK376VRRt+Y/s5EuntNNYhcWzI944SyHIed26iW2UWHqmae6Ug5nQm1V6xEeF43BZdKMnef7i5UP+NHnuFHwF5aZ+vZp+0hteZ5JM3508=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mqlhyljpaEhKAVQZPlOjkYmVwfg8WFAGmcsbxMRdORf9fcaK3uyKUiv3WKAY?=
 =?us-ascii?Q?pO7+tc5pnW76lVaMLhG0lzUXWx/s9VYPJRZ+LV1HJMkHazXtSAayB8B+ZRyi?=
 =?us-ascii?Q?pGVGSz4ApEfizz/Som5HvCHPECfS6uadPyuWmPKgtQw+5jtqjUHtaqRyxLqX?=
 =?us-ascii?Q?B2qtihDCSgPTGbZnCngKP+lNhgV7VneEty9W54WWoflCj8nhAlxYblzqw+NX?=
 =?us-ascii?Q?d+S6/7Tcp7V7Nm3VfX8BhS0V8tzCbuaXNBieLtNCT/z0b6oXYt2yWCepbWjs?=
 =?us-ascii?Q?GjC+i7QSAedD53EISSOYKx6xt8V8VY1tVq/u1U80DH1EB4R5u9Tr/tpkzS1M?=
 =?us-ascii?Q?7UcAknd2HwX1WfxCcvBPiPB/fqdhYUnMSrLpkXjNGIIlQ2USCV+LTx2v4rvb?=
 =?us-ascii?Q?UnZFR7PH58RMwQtuKedUkaD73yz7BlTlG0eqb73JZI4dDBp92zHgE8SQ8Ngq?=
 =?us-ascii?Q?e7yokQIc1JQMzCi26cqr1EtFDgWVLY/x/tABPDhfiBiYKrfn9UWaxDUovi4q?=
 =?us-ascii?Q?ejHv0siAfvPLg0dE9vAhcMo6OBP0cY75eaqFR2b9DQEJNfG5kFQ/iYnB+lNt?=
 =?us-ascii?Q?ZEjJpqiWx2zMxxbGOiivA9zEUvHkI3V75KT4eaRrk0+K71zdN1psNREzmBLc?=
 =?us-ascii?Q?C3+o3X41bSKj4LgC/sHBgOY6oETRhjwo6xVfMifoTp5j1RwhYeW3KDSQkShh?=
 =?us-ascii?Q?jc1PEkdtXwUWhZ5P68WLWm7kJ8mlRMb7IpbuE3RhbhW2P2vSN1g/c2+5HjRR?=
 =?us-ascii?Q?6W1xb8IvIMG8HfLRb0ZjRtWC0u1NnlsU6wbhhBAgiR/Y8AZs2cWLGvLtI9Sr?=
 =?us-ascii?Q?OvpXPiz++rpPZ3EoiWHKHkt5mmSko/sBTbB6PUpOYpP0Y5c90OsIBnOtlI/W?=
 =?us-ascii?Q?ZgILlEH8FZrJftJlmI9wynu3i6ZvaQrAQCE4fapd3i88CTY/DUz2+j0YCWeJ?=
 =?us-ascii?Q?pbA/v+tjao1vRXOaqJwM0i3ei6Lnkx49oim+LA0sGPd7bmIMSmV7UxYMWHuy?=
 =?us-ascii?Q?GQI2e+bDu7W+tLCFu6qbsnepd77gy1dUV1lfq3q/JG0HBFwbHKXErvVO5F7q?=
 =?us-ascii?Q?d4WO3EmtXPXg8EqhBxfsMzvZlDV3hS/Xm/6dbhlYOU3Q0zCJ8oTk0GKCfRnR?=
 =?us-ascii?Q?CqvHKSLU/dIq+i30iR32DJVnH1AdSWXNF3iUcHKldds4/roqeBZXbAlzUOF5?=
 =?us-ascii?Q?02xlEJAY4QUTvWbMy3r1M8y05npfci757fXbgbVsrpAiHxMPVb7lnaDZzqLe?=
 =?us-ascii?Q?aDULEZOvXFB3K0MvxI5XHDbWMWIs8kgU3O692CVVW1wXcz0LauZqh5wppQnq?=
 =?us-ascii?Q?kFX+/AbfdZV4fUe6qwdHIyFJjI4xYoBH4sfLRNHYqamQnjznMB3OO2sSsprR?=
 =?us-ascii?Q?YeN3BydY5EF9ZTwF/mIhUB2DWbMi8CDDKFa1Mj5zk3F2cOUbfajd9WuCEPhE?=
 =?us-ascii?Q?hU5zJJQCynfiL5qA40IhFj4/SVHVNs/+/kakbdgz2be4a8BAaBmoixe98pCv?=
 =?us-ascii?Q?1wmgSilWr1ea0N9YzL8UBuGYuGk3zWRmXmpc868HXbwmLdVJ7mKN348VCtgt?=
 =?us-ascii?Q?SztmgJv1UnzEdQOYkpNVwPRe9E5EPtd+q0nb9Tc7wNcqohh6PHBEnIA4CmLD?=
 =?us-ascii?Q?gcQL3grQuQhSK5GQ73+3iewrNPQ9KAfiTvPehY++RsMZdfzVKyLnYZGtqaZI?=
 =?us-ascii?Q?C+sPYmGobPdfyrUWlNZ+vXG06LSILMHreqETFHTCCA//cVD9T0scXwTEMjfI?=
 =?us-ascii?Q?Ms1IxAX+BIHamb57HIk/V8XICf8AwNKZ3sib8I1l5+6LWaT0+FoP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c51ec0d-6077-4eeb-f923-08deff9cba0a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:56:13.5827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NrYelWUOwvoyuXY2XUbwF20GL5+bkEocHXkrN336pLk8OWDi0RF3ayxj4HFpDIiPJbdpQ05vjNKn9oaDUOkHFDkR30pJinWQi+b7JVJ8MPzcvVgzg15SwrQGc4aGaHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On Sat, Aug 22, 2026 at 12:06:11AM +0530, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> Add priv_dev_ctx to prepare enabling misc-device context based send-receive
> path, to communicate with FW.
>
> No functionality change.
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/firmware/imx/ele_base_msg.c | 15 +++++-----
>  drivers/firmware/imx/ele_common.c   | 55 +++++++++++++++++++++----------------
>  drivers/firmware/imx/ele_common.h   |  8 +++---
>  drivers/firmware/imx/se_ctrl.c      | 41 +++++++++++++++++++++++++++
>  drivers/firmware/imx/se_ctrl.h      |  9 ++++++
>  5 files changed, 94 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> index 724f6e913ce7..b70e3ef88a16 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -71,8 +71,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
>  	tx_msg->data[0] = upper_32_bits(get_info_addr);
>  	tx_msg->data[1] = lower_32_bits(get_info_addr);
>  	tx_msg->data[2] = sizeof(*s_info);
> -	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> -			       ELE_GET_INFO_RSP_MSG_SZ);
> +
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
> +			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
>  	if (ret < 0) {
>  		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
>  		return ret;
> @@ -117,8 +118,8 @@ int ele_ping(struct se_if_priv *priv)
>  	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
>  			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
>
> -	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
> -			       ELE_PING_RSP_SZ);
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
> +			       rx_msg, ELE_PING_RSP_SZ);
>  	if (ret < 0)
>  		return ret;
>
> @@ -165,7 +166,7 @@ int ele_service_swap(struct se_if_priv *priv,
>  	if (ret)
>  		return -EINVAL;
>
> -	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
>  			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
>  	if (ret < 0)
>  		return ret;
> @@ -213,7 +214,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
>  	tx_msg->data[1] = 0;
>  	tx_msg->data[2] = lower_32_bits(img_addr);
>
> -	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
>  			       ELE_FW_AUTH_RSP_MSG_SZ);
>  	if (ret < 0)
>  		return ret;
> @@ -251,7 +252,7 @@ int ele_debug_dump(struct se_if_priv *priv)
>  	do {
>  		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
>
> -		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
> +		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
>  				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
>  		if (ret < 0)
>  			return ret;
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> index 04ee5112d346..b662063c3b1c 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -46,8 +46,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
>  	return 0;
>  }
>
> -int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
> +int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
>  {
> +	struct se_if_priv *priv = dev_ctx->priv;
>  	bool is_rsp_wait_with_timeout = false;
>  	bool wait_uninterruptible = false;
>  	unsigned long remaining_jiffies;
> @@ -134,7 +135,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
>  	return ret;
>  }
>
> -int ele_msg_send(struct se_if_priv *priv,
> +int ele_msg_send(struct se_if_device_ctx *dev_ctx,
>  		 void *tx_msg,
>  		 int tx_msg_sz)
>  {
> @@ -146,9 +147,9 @@ int ele_msg_send(struct se_if_priv *priv,
>  	 * carried in the message.
>  	 */
>  	if (header->size << 2 != tx_msg_sz) {
> -		dev_err(priv->dev,
> -			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
> -			*(u32 *)header, header->size << 2, tx_msg_sz);
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
> +			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
>  		return -EINVAL;
>  	}
>
> @@ -158,9 +159,10 @@ int ele_msg_send(struct se_if_priv *priv,
>  	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
>  	 * the caller-owned buffer may be released after a successful send.
>  	 */
> -	err = mbox_send_message(priv->tx_chan, tx_msg);
> +	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
>  	if (err < 0) {
> -		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
>  		return err;
>  	}
>
> @@ -172,38 +174,41 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> +	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
>  	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
>  	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
>  	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
>  }
>
> -/* API used for send/receive blocking call. */
> -int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
> -		     void *rx_msg, int exp_rx_msg_sz)
> +/* API used for send/receive blocking calls. */
> +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> +		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
>  {
> +	struct se_if_priv *priv = dev_ctx->priv;
>  	unsigned long flags;
>  	int err;
>
>  	guard(mutex)(&priv->se_if_cmd_lock);
>
>  	if (atomic_read(&priv->fw_busy)) {
> -		dev_dbg(priv->dev, "ELE became unresponsive.\n");
> +		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
>  		return -EBUSY;
>  	}
>  	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
>  	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
>  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> +	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
>  	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
>  	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
>  	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
>
> -	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
> +	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
>  	if (err < 0) {
>  		ele_msg_send_rcv_cleanup(priv);
>  		return err;
>  	}
>
> -	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
>
>  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
>  		/*
> @@ -214,7 +219,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
>  		if (err > 0)
>  			err = -ERESTARTSYS;
>  		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
> -		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
> +			dev_ctx->devname, err);
>  	}
>
>  	ele_msg_send_rcv_cleanup(priv);
> @@ -243,6 +249,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  {
>  	struct se_clbk_handle *se_clbk_hdl;
>  	struct device *dev = mbox_cl->dev;
> +	const char *devname = NULL;
>  	struct se_msg_hdr *header;
>  	bool sz_mismatch = false;
>  	struct se_if_priv *priv;
> @@ -266,7 +273,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  	if (header->tag == priv->if_defs->cmd_tag) {
>  		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
>  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> -		if (!se_clbk_hdl->rx_msg) {
> +		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
>  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  			dev_warn(dev, "No command receiver registered for message: %.8x\n",
>  				 *((u32 *)header));
> @@ -280,8 +287,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
>  		 * breaker handling used for rsp_tag messages.
>  		 */
> -		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
> -			*(u32 *)header);
> +		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
> +			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
>
>  		/*
>  		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
> @@ -296,13 +303,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
>  		 */
>  		se_clbk_hdl->rx_msg_sz = min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
> +		devname = se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
> -				*(u32 *)header,
> +				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
> +				devname, *(u32 *)header,
>  				(header->size << 2), rx_msg_sz);
>  	} else if (header->tag == priv->if_defs->rsp_tag) {
>  		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
> @@ -324,8 +332,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  			return;
>  		}
>  		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
> -		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
> -			*(u32 *)header);
> +		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
> +			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
>
>  		/*
>  		 * For rsp_tag traffic, the sender provides the expected response
> @@ -337,14 +345,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  			sz_mismatch = true;
>
>  		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
> +		devname = se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
> -				*(u32 *)header,
> +				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
> +				devname, *(u32 *)header,
>  				(header->size << 2), exp_rx_msg_sz);
>  	} else {
>  		dev_err(dev, "Failed to select a device for message: %.8x\n",
> diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
> index 7bf2febefc45..07e6b6a1bafa 100644
> --- a/drivers/firmware/imx/ele_common.h
> +++ b/drivers/firmware/imx/ele_common.h
> @@ -16,12 +16,12 @@
>
>  int se_update_msg_chksum(u32 *msg, u32 msg_len);
>
> -int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
> +int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
>
> -int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
> +int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
>
> -int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
> -		     void *rx_msg, int exp_rx_msg_sz);
> +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> +		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
>
>  void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
>
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> index df3d1da28a75..2ee0f70c38cd 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -284,6 +284,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
>  	return 0;
>  }
>
> +static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
> +				    struct se_if_device_ctx **new_dev_ctx)
> +{
> +	const char *err_str = "Failed to allocate memory";
> +	struct se_if_device_ctx *dev_ctx;
> +	int ret = -ENOMEM;
> +
> +	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
> +
> +	if (!dev_ctx)
> +		return ret;

		return -ENOMEM;

> +
> +	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
> +				     get_se_if_name(priv->if_defs->se_if_type),
> +				     ch_id);
> +	if (!dev_ctx->devname)
> +		goto exit;
> +
> +	dev_ctx->priv = priv;
> +	*new_dev_ctx = dev_ctx;
> +
> +	return 0;
> +exit:
> +	*new_dev_ctx = NULL;
> +
> +	kfree(dev_ctx->devname);
> +	kfree(dev_ctx);
> +	return dev_err_probe(priv->dev, ret, "%s", err_str);

Needn't var err_str and generally, needn't print msg for -ENOMEM

	return -ENOMEM;


> +}
> +
>  static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
>  				 struct mbox_client *cl, const char *name)
>  {
> @@ -328,6 +358,11 @@ static void se_if_probe_cleanup(void *plat_dev)
>
>  	dev_set_drvdata(dev, NULL);
>
> +	if (priv->priv_dev_ctx) {
> +		kfree(priv->priv_dev_ctx->devname);
> +		kfree(priv->priv_dev_ctx);
> +	}
> +
>  	kfree(priv);
>  }
>
> @@ -425,6 +460,12 @@ static int se_if_probe(struct platform_device *pdev)
>  		load_fw->imem_mgmt = true;
>  	}
>
> +	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed[0x%x] to create device contexts.",
> +				     ret);

Needn't print error code, dev_err_probe() already print for you.

		dev_err_probe(dev, ret, "Failed to ...\n"):

and need "\n" for all error message, please double other.

Frank
> +
>  	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
>  		ret = get_se_soc_info(priv, se_info);
>  		if (ret)
> diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
> index 54b2a262a2c3..dd4a1ea7e35a 100644
> --- a/drivers/firmware/imx/se_ctrl.h
> +++ b/drivers/firmware/imx/se_ctrl.h
> @@ -20,6 +20,7 @@
>  #define MESSAGING_VERSION_7		0x7
>
>  struct se_clbk_handle {
> +	struct se_if_device_ctx *dev_ctx;
>  	struct completion done;
>  	bool signal_rcvd;
>  	u32 rx_msg_sz;
> @@ -44,6 +45,12 @@ struct se_imem_buf {
>  	u32 state;
>  };
>
> +/* Private struct for each char device instance. */
> +struct se_if_device_ctx {
> +	struct se_if_priv *priv;
> +	const char *devname;
> +};
> +
>  /* Header of the messages exchange with the EdgeLock Enclave */
>  struct se_msg_hdr {
>  	u8 ver;
> @@ -106,6 +113,8 @@ struct se_if_priv {
>  	struct se_fw_load_info load_fw;
>
>  	atomic_t fw_busy;
> +
> +	struct se_if_device_ctx *priv_dev_ctx;
>  };
>
>  char *get_se_if_name(u8 se_if_id);
>
> --
> 2.43.0
>
