Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8129484222
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 18:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831706; cv=fail; b=h9Cr90m+LMj+35GrcA4vj77YwlRemFO/Sx5Z5JfCzZnW/MJsJlT3jdqBVKaKDb3ZqAYsx/AHumfyIPi+QJ9/DOwev1bB6mUSSlSe03CtMvhMdrlSGk8WlTmuPcGNNe+CGBtzo0eaKEg4nE2BLchd163uRCrLLN9O/2lPZi2HPQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831706; c=relaxed/simple;
	bh=ZP09ndYBZoXUXNma4mlPhQFaEirYHgMdLTuxbMYLECc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uPE9M9WeDettfCL5t4Q1M6fJENb1dEolbf4wo/LxfL1zx23JutskT95d6vVDEKtnS8eR22+jEpHTlheffdcutkBHF/cxx1ChUZ6NewF6U0N+KzpAr/rHv1TJy9Rxfa/4ubz7viUL1TAuuTXJI+K+oY8b6BPOFys5EdkhKqvjGSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t98FcVPE; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t98FcVPE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8gw1dVDoUKXZsn8wPf5huvdc+U2kdoXfqjdicix/Ae44oDLFxiLRSf3YKDpui8C29FvcP8Jz5s4awoZEOLr1WktGw2u1KwAr2gwBcp2//VNhjWb1EYafQwIu28lBCNky9gdz15xVOYwAH9x8YWhGRY5191HplJ0txAEgVh5ezM4iI4dN07dq2qltvnLbJEpQ9vvKHofZh0lZ1ZtYP2fcR29JqhJKa9IQgl2vez/O1x9PVeyQs/+SwDFtRB78JXZ7LGqrVeSxXn2gW5/4XrUwfu1gR3fLml6Ka9es45PsOjJbFWix/upfDGj38JZmc8q2FCfwxjwbulhiZnTVXYzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeLeFCHm3Fak8vEBW3rHQ8HD8+EilDqh5QmGS3mhuWc=;
 b=TC9h+AH+Oosqtt0dMPjgat+dnEYY+F2q1KaZbEa+YYUxvySwh/b2mPaI0Ex6xvFjQ4m9DAqaP+OVrNSPWlVMxddO2MZ63g2UqrKclo44dOnzTuy8bhGvgCBjCOBvRtKMDETj0OPMGVUfwYb45dTu7bKeMPoktgkdsFBZVMm292owMgy1fXt+5OflXsr+dkl3HM3ClHskAQTKynfipJ+TOt/QxEiYFqN9Ww8MbTAn8eQrLRlVatV8nethFY1xF95BBMebrpXpw9HWWMzci6t1FAVHOSFUslk4K+I4dyjkEa4l3OkGP1y6oH0hC6H/gTSq0fQJCPWw+70A4sg6jM1RKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeLeFCHm3Fak8vEBW3rHQ8HD8+EilDqh5QmGS3mhuWc=;
 b=t98FcVPEQu3ik138VOCmg1jb3ykMJ0Qnn4FrKGq8cPZP8raNBB7U66RxSXJVwM6IsiT1+WnNpOIT60WjK377gdn9btotSAkrGJtIwfy7rUsTUg8O6YB5pJCphZsny66mfBVrZiPcunoSh7+h148bAdI3SslN3bD/uM2QGVLV/Y5b0cvaf3XMRilaUgibOXI18so4SmOBa73ir7JRUQCbdyQfU+OLBjDTDNnaqTBnlx1gCkZulErFqb9AbddP/TRlN0EqA53xrBw60aQCRaGOWtH8/WT6PozvUEAagA0vJdlCUCIb2MSI+RhmFvkLdrB12iQNvuSOW47ZyU8X9NwASw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9632.eurprd04.prod.outlook.com (2603:10a6:20b:477::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 18:34:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:34:53 +0000
Date: Thu, 23 Jul 2026 13:34:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 03/11] firmware: imx: ele: Export API functions
Message-ID: <amJew0ynuWRybpJm@SMW015318>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
 <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-3-e26930345b4c@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-3-e26930345b4c@kontron.de>
X-ClientProxiedBy: SA1P222CA0184.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: f18033ca-6bfe-475d-79c3-08dee8e91648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oAn2QcCwddMp/bf0/JUCZGoTZScxQkU3qidyZ/b41QhrdQfUiQW+GirGTmUQJxTShqvl5f9jVdWYNKPhbY5Q1xLiNT/z9gx2bIaGoR1Z05ka/wUwKgII/3Q5FXLZ8jZBVU7CZKhsGMZ5cQSfBiy8INaCaJMRnypFNNciFKCEVkPrGmiFL9R8HCPwJQCJLYNOUELKU8LD8nJWIhEOHAu8VhDxRg09FQleyf3UO2ytUnumboTH/8nWGJlNR0FTYmnzTYAUQYYpEFQdTNrOPv+V0T11ZG65CKLH50Bpvs73nGxznWQgE2NTOMXOni3IjbVEko78NTPSQ57w7EOG6vWVze1iHpSsezYxvpYJGwL5Ib3nx/jPJVh+E5pjgUguqFDKrxUF/sH2PvWOTLkoer7rNlGzrdCXPBjHM/wZPX7q2hsF66kf/Ugf2IyB1Q6AGD6k5gjaB5qSO8XbgijWthsRPg6pC1ecRFsu3sdsix66kDp8OpjrHEcw/Llwaz6RYCBdVQSPJ6NxmJCEXX9s0q7Br9oZZpg8JXztGtFw4MkD5fXK+xWG97fCnoOD6SaOT3H3YUqeIV7R0eAifQ7znJ+rWj/lHjNCiLu76hzbjLLijDRo17ynOU4hQJ3ApLAAdvFZYybr2xJjEK2zU70Ph90s4+jtBkyGfHq6mvcGsJnreLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zsBmcirRtaNbxlVkE7leWKjQGCqiO28Bt/8bAz9IEcjXIpP3lSV6UOmMu7Me?=
 =?us-ascii?Q?zqlU4kMSkB1Inr32RezIYUs7CF4SVxelkrYLJI+W+kvc9Svj5siIWiLUYzxr?=
 =?us-ascii?Q?SbkafTNiX3vgyDvsQQcG7IAq/Tkgax4nSvX9EKp9zaLSjgZIiYfcmpAcpL10?=
 =?us-ascii?Q?WvY0EwzmxmmC3U2E8gES3vexKL1R9DuZt533IAk6p3sz3XXV/FsvJTGMU2Yi?=
 =?us-ascii?Q?ZOT0Ry00+9EhQTBuIOdTsMx3IROam9z9QoAbafUJRR3FRLGk34bSzqRB6m/P?=
 =?us-ascii?Q?Nvk8a7zNSNcUXFQpsNyH43ibH72C53n8VMiJUEWObm3TtUpu/C1S7vVRSjWq?=
 =?us-ascii?Q?HBtSgT62Y7KuSlpe9RMO6Eywt0ZmrrRD/dTHLG1a3dijfPSXA12dCL69r8JF?=
 =?us-ascii?Q?tmi6qnjKTmlwYDcsFyrEzW3OrwiLAwnK+9Qi/puWaE2idoRr0uh5VDE62MEF?=
 =?us-ascii?Q?QqzK4HXK0z5QWzmlOqVBPVZK2XRBqjpjaQYi1Mi+yK6EPe1Xt9Bxn/Bsut60?=
 =?us-ascii?Q?diiNO9r36d3Mtzph57A/rfkcXGJEO1pALzsC6pRbFjR/sTECAUbFHUgWdC5W?=
 =?us-ascii?Q?HJ7NQpnGuoYF1EzrMZyBijBdhUb8xLe0mNSsYhBi4noj9imhjKLr4ljU9wtn?=
 =?us-ascii?Q?j8YTJHdeEJHMSdZy03iwr1VqthjOpCSaLP9JVgYWOL5MobLLM9BdWjn14byl?=
 =?us-ascii?Q?4WcXbVYpqIkLdlKa/57+tACS688lWGp9BBepmHhqVmtcKBCB+tnKgiWZPTqb?=
 =?us-ascii?Q?xJaKmfYuHE55FfmqnqRA4gNeyW7t+w6uZGXcbYDlegXBQBcjnXbPvHgLp3r6?=
 =?us-ascii?Q?FGFzmRmL4NfxSWpYNdcAXkL99Mo98PieHg31TsCZ5Sh+H5g/GOWJOlV3GYdb?=
 =?us-ascii?Q?g0N+Bpy0Jj2qzX3GFrqelNwftJR4eRtrcCBux4bl14oiKsqnXzAzRGVvrvJF?=
 =?us-ascii?Q?KL0wD/CRNWmUvlCEYb2mtYSIa/GtGWSAIJZxFZTdI95621JBuDzIY70wh/Xi?=
 =?us-ascii?Q?B5Jcc6s79qjw2keSCjFL1Noo+CdXzOuDmLs+QBH76U1BbmyMmlxviahMrxLs?=
 =?us-ascii?Q?xcvsRjHZbNlNWCfkW40hKr04DsNKvMU2TKBJQ0/2+jO9nk79ZgE5B83Wem14?=
 =?us-ascii?Q?OEJRZEjBIH3+n4TNKaN2KkWX2mT7cov3abYt8Ec6qZ/Keo04gXVjrAs/FKHa?=
 =?us-ascii?Q?DRL9uohZt5SFEBLocUxJMVwq6S0ymh57MKG6VyaroHJEjOmUn2khCHjBUZ73?=
 =?us-ascii?Q?9rrHy1F7D1Rot2ldMnvUKyA47o2zTW+gJOX2ELJ2CTYUvcSgXvYoqMnq3asT?=
 =?us-ascii?Q?7qLfXluaYbILtFvluy+66vVoa54Lqtb8gv70CqWES+joEvk5olW/aU44mv+I?=
 =?us-ascii?Q?Q9kjvpJx8uTX33d7hLVOHTQYXwLJrGq3I2Zyai2stLNTYPdprSn8LoIG8F6x?=
 =?us-ascii?Q?TZB2HuGTDfz8KYxj1b9RB2kzxn+uaaodSB8Yl5LobsiC9bdPAchERskmcpAC?=
 =?us-ascii?Q?OGVWoTJZgrKWbCZ6UHrSQMQqfykvg6r+VL/tWn+DCHH3HYigSlB6W3UNBZX6?=
 =?us-ascii?Q?Z6tCjYCkL3AtYObZIvw0eBRwQ3Z4a+pxdWXwskRvkxgdJCx2v5XTe83W8Yfm?=
 =?us-ascii?Q?+b7S2r3qXa32N/1pxxA4WVmCfDNT09hfuEDHiUBNsyESRNbXoP4afIyE1QiH?=
 =?us-ascii?Q?pZOTXC/ewr3vQX2T5wDDPIROdP7sMhh8dIg2dULOCJLGqGocdJGBBDukz6fa?=
 =?us-ascii?Q?IAoqx+E/wMPdfZXZ1xWHhx1bfUpSQ2zzPmsgF7eJbS2v+OHqgOWO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18033ca-6bfe-475d-79c3-08dee8e91648
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:34:53.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHQSQzvwPQ7q4ecvmZqZNv181q0aqD30Le7BeFVGBwwhEUIJVzwnPCcrqjkA/H+c7l/M+XYGOIZ2jfz0Mh8otkOhxy2AwBCeC/Hu6YMlYH4qfpUE1eNFD4D2iSyagGQ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9632

On Thu, Jul 23, 2026 at 09:27:25AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> Export generic ELE API functions to send and receive messages. This
> allows drivers to implement functions based on the ELE API.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/firmware/imx/ele_base_msg.c | 42 ++++++++++----------
>  drivers/firmware/imx/ele_common.c   | 35 ++++++++++++++++-
>  drivers/firmware/imx/ele_common.h   | 14 -------
>  drivers/firmware/imx/se_ctrl.c      |  6 +--
>  drivers/firmware/imx/se_ctrl.h      | 14 +------
>  include/linux/firmware/imx/se_api.h | 78 +++++++++++++++++++++++++++++++++++++
>  6 files changed, 137 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> index 28b835f2880f..a4ab45efdd63 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -8,6 +8,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/completion.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/firmware/imx/se_api.h>
>  #include <linux/genalloc.h>
>
>  #include "ele_base_msg.h"
> @@ -106,8 +107,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
>  		}
>  	}
>
> -	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
> +	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
>
>  	tx_msg->data[0] = upper_32_bits(get_info_addr);
>  	tx_msg->data[1] = lower_32_bits(get_info_addr);
> @@ -120,8 +121,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
>  		return ret;
>  	}
>
> -	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> -				      ELE_GET_INFO_RSP_MSG_SZ, true);
> +	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> +					  ELE_GET_INFO_RSP_MSG_SZ, true);
>  	if (ret < 0) {
>  		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
>  		return ret;
> @@ -156,16 +157,16 @@ int ele_ping(struct se_if_priv *priv)
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
> +	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				ELE_PING_REQ, ELE_PING_REQ_SZ, true);
>
>  	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
>  			       rx_msg, ELE_PING_RSP_SZ);
>  	if (ret < 0)
>  		return ret;
>
> -	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
> -				      ELE_PING_RSP_SZ, true);
> +	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
> +					  ELE_PING_RSP_SZ, true);
>
>  	return ret;
>  }
> @@ -196,8 +197,9 @@ int ele_service_swap(struct se_if_priv *priv,
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -			    ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
> +	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ,
> +				true);
>
>  	tx_msg->data[0] = flag;
>  	tx_msg->data[1] = addr_size;
> @@ -212,8 +214,8 @@ int ele_service_swap(struct se_if_priv *priv,
>  	if (ret < 0)
>  		return ret;
>
> -	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
> -				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
> +	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
> +					  ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
>  	if (ret)
>  		return ret;
>
> @@ -248,8 +250,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -			    ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
> +	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
>
>  	tx_msg->data[0] = lower_32_bits(contnr_addr);
>  	tx_msg->data[1] = 0;
> @@ -260,8 +262,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
>  	if (ret < 0)
>  		return ret;
>
> -	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
> -				      ELE_FW_AUTH_RSP_MSG_SZ, true);
> +	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
> +					  ELE_FW_AUTH_RSP_MSG_SZ, true);
>
>  	return ret;
>  }
> @@ -286,8 +288,8 @@ int ele_debug_dump(struct se_if_priv *priv)
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
> -			    ELE_DEBUG_DUMP_REQ_SZ, true);
> +	imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
> +				ELE_DEBUG_DUMP_REQ_SZ, true);
>
>  	msg_ex_cnt = 0;
>  	do {
> @@ -298,8 +300,8 @@ int ele_debug_dump(struct se_if_priv *priv)
>  		if (ret < 0)
>  			return ret;
>
> -		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
> -					      ELE_DEBUG_DUMP_RSP_SZ, true);
> +		ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
> +						  ELE_DEBUG_DUMP_RSP_SZ, true);
>  		if (ret) {
>  			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.", ret);
>  			break;
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> index fbb6e584341a..f9c56fd42af0 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -3,11 +3,26 @@
>   * Copyright 2025 NXP
>   */
>
> +#include <linux/export.h>
> +
>  #include "ele_base_msg.h"
>  #include "ele_common.h"
>  #include "ele_fw_api.h"
>  #include "se_ctrl.h"
>
> +/* Fill a command message header with a given command ID and length in bytes. */
> +int imx_se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
> +			u8 cmd, u32 len, bool is_base_api)
> +{
> +	hdr->tag = priv->if_defs->cmd_tag;
> +	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
> +	hdr->command = cmd;
> +	hdr->size = len >> 2;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(imx_se_fill_cmd_msg_hdr);
> +
>  int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
>  {
>  	struct se_if_priv *priv = dev_ctx->priv;
> @@ -261,6 +276,21 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
>  	return err;
>  }
>
> +/*
> + * Send/receive blocking call for external drivers, operating on the SE
> + * interface private data (the misc device context is resolved internally).
> + */
> +int imx_se_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
> +			void *rx_msg, int exp_rx_msg_sz)
> +{
> +	if (!priv)
> +		return -EINVAL;
> +
> +	return ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, tx_msg_sz,
> +				rx_msg, exp_rx_msg_sz);
> +}
> +EXPORT_SYMBOL_GPL(imx_se_msg_send_rcv);
> +
>  static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
>  				       struct se_msg_hdr *header)
>  {
> @@ -402,8 +432,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  	}
>  }
>
> -int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
> -			    u8 msg_id, u8 sz, bool is_base_api)
> +int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
> +				u8 msg_id, u8 sz, bool is_base_api)
>  {
>  	struct se_msg_hdr *header = &msg->header;
>  	u32 status;
> @@ -450,6 +480,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(imx_se_val_rsp_hdr_n_status);
>
>  int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
>  {
> diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
> index b63a3fbf087a..8f0739960d4d 100644
> --- a/drivers/firmware/imx/ele_common.h
> +++ b/drivers/firmware/imx/ele_common.h
> @@ -28,20 +28,6 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
>  		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
>
>  void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
> -
> -int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
> -			    u8 msg_id, u8 sz, bool is_base_api);
> -
> -/* Fill a command message header with a given command ID and length in bytes. */
> -static inline void se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
> -				       u8 cmd, u32 len, bool is_base_api)
> -{
> -	hdr->tag = priv->if_defs->cmd_tag;
> -	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
> -	hdr->command = cmd;
> -	hdr->size = len >> 2;
> -}
> -
>  int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
>
>  int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> index 3c14964830a6..53f252d2f111 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -911,9 +911,9 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
>  		"message received, start transmit to user");
>
>  	rsp_status_err =
> -		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> -					cmd_snd_rcv_rsp_info.rx_buf_sz,
> -					tx_msg->header.ver == priv->if_defs->base_api_ver);
> +		imx_se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> +					    cmd_snd_rcv_rsp_info.rx_buf_sz,
> +					    tx_msg->header.ver == priv->if_defs->base_api_ver);
>
>  	if (!rsp_status_err) {
>  		err = se_dev_ctx_cpy_out_data(dev_ctx);
> diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
> index af7738ad76cd..76082e8b977c 100644
> --- a/drivers/firmware/imx/se_ctrl.h
> +++ b/drivers/firmware/imx/se_ctrl.h
> @@ -7,6 +7,7 @@
>  #define SE_CTRL_H
>
>  #include <linux/bitfield.h>
> +#include <linux/firmware/imx/se_api.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/semaphore.h>
> @@ -95,22 +96,9 @@ struct se_if_device_ctx {
>  	struct kref refcount;
>  };
>
> -/* Header of the messages exchange with the EdgeLock Enclave */
> -struct se_msg_hdr {
> -	u8 ver;
> -	u8 size;
> -	u8 command;
> -	u8 tag;
> -}  __packed;
> -
>  #define SE_MU_HDR_SZ		4
>  #define SE_MU_HDR_WORD_SZ	1
>
> -struct se_api_msg {
> -	struct se_msg_hdr header;
> -	u32 data[];
> -};
> -
>  struct se_if_defines {
>  	const u8 se_if_type;
>  	u8 cmd_tag;
> diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
> index b1c4c9115d7b..90104ecaaede 100644
> --- a/include/linux/firmware/imx/se_api.h
> +++ b/include/linux/firmware/imx/se_api.h
> @@ -11,4 +11,82 @@
>  #define SOC_ID_OF_IMX8ULP		0x084d
>  #define SOC_ID_OF_IMX93			0x9300
>
> +/**
> + * struct se_msg_hdr - Header of the messages exchanged with the secure enclave.
> + * @ver: API version the message conforms to (base or firmware API version).
> + * @size: Message size in 32-bit words, including the header.
> + * @command: Command identifier.
> + * @tag: Message tag identifying it as a command or a response.
> + */
> +struct se_msg_hdr {
> +	u8 ver;
> +	u8 size;
> +	u8 command;
> +	u8 tag;
> +}  __packed;
> +
> +/**
> + * struct se_api_msg - A message exchanged with the secure enclave.
> + * @header: Message header describing the command and its length.
> + * @data: Command or response payload, sized per @header.size.
> + */
> +struct se_api_msg {
> +	struct se_msg_hdr header;
> +	u32 data[];
> +};
> +
> +/* Opaque handle to a secure-enclave interface instance. */
> +struct se_if_priv;
> +
> +/**
> + * imx_se_fill_cmd_msg_hdr() - Populate the header of a command message.
> + * @priv: Secure-enclave interface instance the command targets.
> + * @hdr: Message header to be filled in.
> + * @cmd: Command identifier to place in the header.
> + * @len: Total message length in bytes, including the header.
> + * @is_base_api: %true to tag the message with the base API version, %false to
> + *               use the firmware API version.
> + *
> + * Fill in the tag, version, command and size fields of @hdr so that the message
> + * can be sent to the secure enclave.
> + *
> + * Return: 0 on success.
> + */
> +int imx_se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
> +			    u8 cmd, u32 len, bool is_base_api);
> +
> +/**
> + * imx_se_msg_send_rcv() - Send a command to the secure enclave and wait for the
> + *                         response.
> + * @priv: Secure-enclave interface instance to communicate with.
> + * @tx_msg: Buffer holding the command message to send.
> + * @tx_msg_sz: Size of the command message in bytes.
> + * @rx_msg: Buffer receiving the response message.
> + * @exp_rx_msg_sz: Expected size of the response message in bytes.
> + *
> + * Blocking send/receive helper for external drivers. The transaction is
> + * serialized internally and the misc device context is resolved from @priv.
> + *
> + * Return: number of bytes received on success, or a negative error code.
> + */
> +int imx_se_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
> +			void *rx_msg, int exp_rx_msg_sz);
> +
> +/**
> + * imx_se_val_rsp_hdr_n_status() - Validate a response header and status code.
> + * @priv: Secure-enclave interface instance the response came from.
> + * @msg: Response message to validate.
> + * @msg_id: Command identifier the response is expected to match.
> + * @sz: Expected response size in bytes.
> + * @is_base_api: %true if the command used the base API version, %false if it
> + *               used the firmware API version.
> + *
> + * Check that the response tag, command identifier, size and API version match
> + * the expectations, and that the enclave reported a successful status.
> + *
> + * Return: 0 if the response is valid and successful, or a negative error code.
> + */
> +int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
> +				u8 msg_id, u8 sz, bool is_base_api);
> +
>  #endif /* __SE_API_H__ */
>
> --
> 2.55.0
>
>
