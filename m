Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394A747ECD2
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038159; cv=fail; b=My4MTsQmZqz5wJxaoZSlWHu7bJ7j1fcOWPM/zZzU01Ocx5qLs8O+VY6c0R2jpmRDrjcOYbiZOJsmLtE5GXqqXegziakaXXYG5SMsfjgh43s6Bxr2niJjmuPN195JQRyQIyA3n66GuRVpvNYK0K0s1L1FaYnKAS2jZstXQcYQlzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038159; c=relaxed/simple;
	bh=thxdzHZgmWKg2OGbnjQmUvm8coddnEYwDfi9QmE4K2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z0AAiIsxBhfNqYhcqAVaUlE0wM9Kvy80H2fPVu+k45HoAbfKmsxh5cA/LrUPUWuk7pqryHT6Eb5RhvoLB8lprJ1U+i2bGwk27NC+2+aUAmgTL3eOEX0+rJN7/fAhvRy5bELBsg9ZkBCQdAgJZTOI7aNlLh0x/iu4geHgfRh33vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QqyZwqGZ; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QqyZwqGZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAGGmrpHPWGP1kdFlVkX9bpyt3Zs+pc1ckxLlUzCnnQFOFnEnTYTgeRiiSimr4pJEzXtXWU7LcZ1/IuhISiY39hs+xonanB/CyN9OFy0HFQ55C2K4543nFtHV9CtJeYNgBto5UOOch1p7tTt6N0q1EbHCQXOIMple+88H6nHbbf4a372iOKQU/VmolHT+HG5uqjcMpkEGTyMCF4Rm/KgUhiDp2TGpaPEiRd7Wlwtpu0wFRfROmMHpD0sHal2BddDI90Gq+KLlzdLb/XSfwllV6ttgcJkagLpl43DvKQpTEQysA7VedKVeHtqnWKNLpSltAR2ralRWEZ/0Rmym6GKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9HGqgccBUAgZJ/63/SNZYDBZN7hMB09QG/uqQNJnfs=;
 b=wCLt6QZZxT0lVmSp4WTK12PdVxwxRf1XE3BHJf0SK3pzyAfgUkl7jcKJAuSPaEhcoFMCAG/ZG4XaW3R1oB0US3wFuH5KXumbgg0bY++VAhJ6OZcpK592BHlL12DXpK0TGr0Mt9vQlQG2m/obSh+w7B0/WGTwvOSwREZ0bZRHgcgeqQgduudQlwyS42pjXQqfFPcIiTVLYuqgPhnOWdQYjrSB8GQklf/pNbY/RzDK8JhF8sB5raUX1pqsyGgpj656HC/Ix4mUSp+WAjVQRR3Oqc29Qud0GM+iuoUJTl9pr0Md5KYchvfkBB0cxlAKXe2T/UC3v8JY8ictFTJV53E6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9HGqgccBUAgZJ/63/SNZYDBZN7hMB09QG/uqQNJnfs=;
 b=QqyZwqGZKHI6IT6/q2RvN/e50eooO3wpgpb0GuuUTTYwFw8xOjTO7omhEIeBibaNjBZ7RDxr+adrizKWOk8A9mNPaYu2uEUR8nhmVT91kj0SrL659Pd20Psuhtlq7UG0lXqlxEw3dHaWZwZ2d5lYIgm2syBSlaocTqtZ/ZZzpvhvra+jYn7vNqdKoXlQV7S0rewYCpHO+ABnbkbljSCy3GSZY4qYgLSLYQs4nIXeBP32FV4qpt81XOm4CanQlqCVuXgxtm0omFKYiaOYMUkd2Sk3RNDTooVYdxdAg2CIWmgGHDRZ79JIuyRIrgjE8RU+vtjOJuMkVZimC4ys5pnWDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 14:09:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 14:09:03 +0000
Date: Tue, 14 Jul 2026 09:08:51 -0500
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
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 03/10] firmware: imx: ele: Export API functions
Message-ID: <alZC88rhuHs20bTV@SMW015318>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-3-b8266d93514b@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-3-b8266d93514b@kontron.de>
X-ClientProxiedBy: SA9PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:806:20::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5f3e3f-1f65-4991-4be0-08dee1b175ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VSJnPuphcTSIRqNnu+qbniEy912mcKya5nKNmqPSE/+K/63Fur+14Ls3IU3x5KvDsFXIBkGxDWt+BipNXJanPINt6X/vbdyoRPHagZrgf0tugN/IPE95b5c29Cloz6aON9sc8rnumK6cRRfAn+nebAwJ5XzLBiesXnOC0IpSxDI9PqjXtNZ+JVb6Kz96MA4v0DLVNSNcBgBAO9VJIoafP09EKN185s8dUEztYoGfT/Dz1nhm1ivdaftC6gqPZ2o3aju9hpDSlqu8x/ezb8iWD9IcdT781WlSiLF1J3e3xdHiJhczYqaekcqFR7UIBGREN64PJqjjVc4KkB4Vt6TecR6vIAGWkmP/mfNNKsix4qaoPrIDjus2lVb8bL6e4jaMyu5hmJLqSKgghcnJhCeA6BJcIVAI1W2gHrRj8EGZ37EM2YIqLtNUr3bdJQB/zat4AZLmqy1XADAmU7DSCoGtzax87uGsnDWFEUIw7QizBpkfk6CFl8Bvn9bSD8SSFKKmLoQ4BZ481DA00vQpMKp+OtY70qM3wIgfcvcnW/toM72GY5R4c2tkpfLx5TTtpQEzzmKMrNF9QTMBUxB0qpZLxDUdnnEEnDFhs9eIrcJSRN5bIhwDfYV+bOPuG1ss+YLsvWI5eMyHJeA6eAEs5uCbFEX85W6ybAgFEZRsk9aPjIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IdCOZ/j+/g7/WAAXj59XwttfdsqdHb/axSGMIVsTtJJvIDvtwfgCXFF0PCyv?=
 =?us-ascii?Q?wLzZ7W/a8tHrhe5n0O6cy5PFpKKl9x6pG/+l1Frsay4qd2vVMVdqI8Tiv3Ea?=
 =?us-ascii?Q?2frlZ4m3z7iJwDvMCLaWq9ISufNa1KDbFgXyvfRRZfM3Z2EEc6tB6tJT95Gt?=
 =?us-ascii?Q?Z9Vwsj/gVjFZfAqtJINTwAGBEP4tPM+LH4EDFj87JOa4D7vWR9h0GWdqqXsh?=
 =?us-ascii?Q?wiXdQPdfm+bllzfsUYo2/Uu/nr+RLmPWbIXPOVqXCraH/ZMJEEmWNiSSr/3B?=
 =?us-ascii?Q?JVbb65COpAc3O4sXsQiLIMrtDeECdjz2h2nOyyZ919YECOHfr/YbMJ2uYjnz?=
 =?us-ascii?Q?aZOaFs9/zKSYGvWqzRkPH7mXVAppDkh6skAFLaYPq8MCIMk6L3S8uNHFWLrN?=
 =?us-ascii?Q?/LTyD4Yw+hhe9RkPyEmDVF0v3L3K7dFvdYxwJ04Xb7Yjg3tpjW4PkOrg+Ine?=
 =?us-ascii?Q?LJJBMtFc/JC8cxP0WLIOEekaTtHmZH/VD6/HJUyw96pdSF8FCi3qLUQOKbWe?=
 =?us-ascii?Q?9hqAaVOnB3VxIfKvQLXmt5MEUDZVPGOUn+TyeczZh7+PKPjZoBUsY8j2CdVU?=
 =?us-ascii?Q?TPXpPmq+yvmRUZWCxxYUdfcVqSqG1THIX9YJl8znPCsk9pWbE+mE7CwQcgPX?=
 =?us-ascii?Q?O3QfwEPJrLjohQMTQpLRP3hbs/FzovbeD/1hro6JlZJtSJVy10wU+27ntldl?=
 =?us-ascii?Q?cdZfFtuOOUUWTlIH8N8nk5QTTrPLGiqz7IuFUz5DEcxGiMk/6PlyB8hJhCDl?=
 =?us-ascii?Q?dsXi+vnCorDfTpVGJLTLQ+bUd7JSJoSx0+d3MyLCBVr2WKAx6Etjlvodg+kj?=
 =?us-ascii?Q?/ZJQ31NpiecyV2hf6BDHi6Ai6RNGnK8P4S3+LPQ50PC3Mkafn5/364SbyGWl?=
 =?us-ascii?Q?IGj4DeZZgdBBuHul2JEnnDgtqBZU8w8aVdOpWS7HU8JPtdSSiAPMUxBHKND/?=
 =?us-ascii?Q?eYOz2NWybe/7kq0NSnQYuwlxWt22gD45ihyd0VQ8kYGeDw/v8vMjMKDOfpMy?=
 =?us-ascii?Q?9/xy0T21p5jkvwl59Rp8ndDPqilCblZMHY6KDVdZ7/Zt6gXqpIP50LFxI7uW?=
 =?us-ascii?Q?sEXVcmD5wZQtxyObRjQAqAwigZBHmCG+MSUZsa/QUi4dnk56FEKBJ9VJNwMn?=
 =?us-ascii?Q?Og3aHsNg3kCImbc/bFZr6STLljavYan83BrqyyKnCUbMgnVftvHb6ZhWmVRD?=
 =?us-ascii?Q?j3ZLJwrP3VTaYFisB19366cilkaC391xG+1MxKRbxl01RM9ybFjAflbBwx8H?=
 =?us-ascii?Q?Zs4RIBfD2ZzV8ILvYCgponrqnPItx7zkcDimZ+4JZtdvHdhjqfQDBlHJS3Uw?=
 =?us-ascii?Q?m7noetBm9KAX18+bKz6kaPmpRW9uXIMkjK/4qJ+yV7WCL9vqzjvlJ8dIjinl?=
 =?us-ascii?Q?i30hudaG1xfabf1ek1LHyGF8672QjpajYOcwegeQlAIs1jqvMwpkSb/CCLlN?=
 =?us-ascii?Q?uPo2M+kKN5XjyHvX1OKDUZmifQBhE5G5v+WOtrlBLOQjuoFRd16TAr2870qC?=
 =?us-ascii?Q?LX4Zu76ZAvBD0/h+oFVbEE7ajQ54CKqleZMZSiOA1qV0QWPaZexfvfewk+o8?=
 =?us-ascii?Q?j7Xx2cMvJB5QAWp0UxBUMoSaPYsUUjEkj23JrJ6Bwbd4cUK2bdoinXN2Qz1e?=
 =?us-ascii?Q?yCvvkp9unCd61C1z++derUu2Np55xoMx/OPsErOu8c0WoMcnHVz9zh1jdwLf?=
 =?us-ascii?Q?ZwdhRbVszRsJaQ4ldVVxzMMrRxJWcF+JN1WL+PSmBBNsNtrZlB907APMW/rF?=
 =?us-ascii?Q?4w3+t4MxABasBs4CfBRxOCvoSVvWDQPHWCb2CHE8uLPUoNyBO1ON?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5f3e3f-1f65-4991-4be0-08dee1b175ba
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:09:03.7137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nH8fILCYbui2fy8JxTpbfGRco7kwTU0XhWJu14a9LyqE15NPydv8XwMQl2UTfdo2+9Ybcud4p+84/eZU2NDn6Z03j+Tg9nnJx89wx3gyOhShOi4kt4GBMstTuwgf1+y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

On Mon, Jul 13, 2026 at 04:53:39PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> Export generic ELE API functions to send and receive messages. This
> allows drivers to implement functions based on the ELE API.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/firmware/imx/ele_base_msg.c | 47 +++++++++++-----------
>  drivers/firmware/imx/ele_common.c   | 35 ++++++++++++++++-
>  drivers/firmware/imx/ele_common.h   | 15 -------
>  drivers/firmware/imx/se_ctrl.h      | 14 +------
>  include/linux/firmware/imx/se_api.h | 78 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 136 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> index ec718d322abc..69e70fd6a0d3 100644
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
> @@ -79,9 +80,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
>  		return -ENOMEM;
>  	}
>
> -	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -				  ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
> -				  true);
> +	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				      ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
> +				      true);
>  	if (ret)
>  		goto exit;
>
> @@ -93,8 +94,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
>  	if (ret < 0)
>  		goto exit;
>
> -	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> -				      ELE_GET_INFO_RSP_MSG_SZ, true);
> +	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> +					  ELE_GET_INFO_RSP_MSG_SZ, true);
>  	if (ret < 0)
>  		goto exit;
>
> @@ -132,10 +133,10 @@ int ele_ping(struct se_if_priv *priv)
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -				  ELE_PING_REQ, ELE_PING_REQ_SZ, true);
> +	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				      ELE_PING_REQ, ELE_PING_REQ_SZ, true);
>  	if (ret) {
> -		dev_err(priv->dev, "Error: se_fill_cmd_msg_hdr failed.");
> +		dev_err(priv->dev, "Error: imx_se_fill_cmd_msg_hdr failed.");
>  		return ret;
>  	}
>
> @@ -144,8 +145,8 @@ int ele_ping(struct se_if_priv *priv)
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
> @@ -169,9 +170,9 @@ int ele_service_swap(struct se_if_priv *priv,
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -				  ELE_SERVICE_SWAP_REQ,
> -				  ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
> +	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				      ELE_SERVICE_SWAP_REQ,
> +				      ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
>  	if (ret)
>  		return ret;
>
> @@ -189,8 +190,8 @@ int ele_service_swap(struct se_if_priv *priv,
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
> @@ -225,8 +226,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> -				  ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
> +	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				      ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
>  	if (ret)
>  		return ret;
>
> @@ -239,8 +240,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
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
> @@ -265,8 +266,8 @@ int ele_debug_dump(struct se_if_priv *priv)
>  	if (!rx_msg)
>  		return -ENOMEM;
>
> -	ret = se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
> -				  ELE_DEBUG_DUMP_REQ_SZ, true);
> +	ret = imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
> +				      ELE_DEBUG_DUMP_REQ_SZ, true);
>  	if (ret)
>  		return ret;
>
> @@ -279,8 +280,8 @@ int ele_debug_dump(struct se_if_priv *priv)
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
> index 76bd3841acfc..81f3057aa7bf 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -3,9 +3,24 @@
>   * Copyright 2025 NXP
>   */
>
> +#include <linux/export.h>
> +
>  #include "ele_base_msg.h"
>  #include "ele_common.h"
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
>  int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header)
>  {
>  	if (!header->size || header->size > MAX_WORD_SIZE)
> @@ -155,6 +170,21 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
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
> @@ -239,8 +269,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  	complete(&se_clbk_hdl->done);
>  }
>
> -int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
> -			    u8 msg_id, u8 sz, bool is_base_api)
> +int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
> +				u8 msg_id, u8 sz, bool is_base_api)
>  {
>  	struct se_msg_hdr *header = &msg->header;
>  	u32 status;
> @@ -285,6 +315,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(imx_se_val_rsp_hdr_n_status);
>
>  int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
>  {
> diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
> index bdc13d1b715d..792b0c6d9dae 100644
> --- a/drivers/firmware/imx/ele_common.h
> +++ b/drivers/firmware/imx/ele_common.h
> @@ -28,21 +28,6 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
>
>  void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
>
> -int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
> -			    u8 msg_id, u8 sz, bool is_base_api);
> -
> -/* Fill a command message header with a given command ID and length in bytes. */
> -static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
> -				      u8 cmd, u32 len, bool is_base_api)
> -{
> -	hdr->tag = priv->if_defs->cmd_tag;
> -	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
> -	hdr->command = cmd;
> -	hdr->size = len >> 2;
> -
> -	return 0;
> -}
> -
>  int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
>
>  int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
> diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
> index 7f9b0d199cfc..70a1ba369a06 100644
> --- a/drivers/firmware/imx/se_ctrl.h
> +++ b/drivers/firmware/imx/se_ctrl.h
> @@ -7,6 +7,7 @@
>  #define SE_MU_H
>
>  #include <linux/bitfield.h>
> +#include <linux/firmware/imx/se_api.h>
>  #include <linux/miscdevice.h>
>  #include <linux/semaphore.h>
>  #include <linux/mailbox_client.h>
> @@ -73,21 +74,8 @@ struct se_if_device_ctx {
>  	struct list_head link;
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
>  #define SE_MU_HDR_SZ	4
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
