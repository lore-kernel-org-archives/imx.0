Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF93B2FC7
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 18:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845325; cv=fail; b=QKGLN04L7EmBy5NWNf/3T7KpgCE2OB96kiXMvG3u13jWGFjFqZwB6PlZWcD8W7sDz3HYzCRrQENkDShY8xhISYzmpjk6I1tgFFmiS+7/1K2PhD4ti+j+VqMjgYXBs7YZ/XFvEy/FTwVtNtHC3esPQiQI7Nid89krDse3lvk4KkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845325; c=relaxed/simple;
	bh=pkOonAqTfq4seDkZ2zUIZ0jGnNL8eAQI5CGR2eD+TZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rl/J0vZnOvnhzuMhx04Ktz0jxc7L/TgaaGJkuO5gnBsN6jHqLg0cJKhwVP4Q1F5Jzq/8KW517FwouLbGltUcd1KekUHmwaLDVQXixL5rRHPQwTW6sQ2JBZglgaIrP836bkHrIdxfdI5LE6T8gTw9dJONJwb0p639yBaaB7PhK30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aMJEcFL3; arc=fail smtp.client-ip=52.101.72.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aMJEcFL3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvFHgkhLaLTtcAA5JEDPJrA7F0KI6vXvoSrQUZz9Ia/JuTGILM7bp0ZfsY+dshjidK5/NDZApYXXJla3pjMQHWQs0LlXZfNTL+0A7plfBgD8eoUd0OEnJ8IbCO2QmL2/2HuHhSWcLGs7QgGUzYuSwuvuDCRgyAhpIezn4QmY9TRjvjPh+fD+Hjtpgav2Lh9M/9jYbBp+NYtguTt4LNVJ087tXgL/teJMZOuSRiQCHy+4aYB5AiL1B9wjSrt7DTpe/ZJSw3SANxV2pb5V8dlAKPzmgDDwFHn9legxaTn1zbDFNxQ6YOBUwqd9QyiPW/FwP/oyPyGketq/aXcmyP+0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zh9lchrUm/qn+cm3AxRNjIMzRDf10A5lqKklyQ16UFU=;
 b=P6xnHnDuHu04zj7zPKIxSNk/+MzkfFrPm/KUv776wMUBm6HM8WZNtKa7cgafAq6bYOHKlp0RhiiMsTNuYiYkN8sUnCbOYOyPuvmJSBE32oiB/PDHWnanb7X1Hmj2mrlR2wQpNG+t+6jBk+TgHxgi5r57j/CEQagZcDlNxCMfWNdJl5ir7C+nDbzuYMouIIBWIg2HorNfd0/1mQ5U2/hkrp+az/O8vjlNMvq4W2D1XqVC8PALUy7oHh3AhxVeAVFrK3S5y1DgJuhJGJuVbesPODfnTnsvd0gL9bOJgRuxmhbXw9ikw/D7AIO1aimz9j/xH64xJOwoHeJx9Z49c9i1FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh9lchrUm/qn+cm3AxRNjIMzRDf10A5lqKklyQ16UFU=;
 b=aMJEcFL33S5mFpbib1sPvWl6R1ohAi9eLvhZYgGPaFRGS0gqrkhm4JnlZoPclKschsHOvtaur8iSCAA0KPkAlnR2dmFW46cDh3tMdn9JDPTn2y5PrT57t8MR8SLW9d6RRJ0o1ELaq8gHNK7k+efgRGKrYZ9HMPQzbT9QKbE2BA+LY9FraF/ZbcZF7KqYhEjdqfM7zqMpusdJbeG0htVrufY0G1qhAK95KUpMglXtxNuPbxH2jIiv5xA9zMqFcinrp5vNl2FgfnTIDBJ0nBlMj3h6sRvS5m4x6PAzDC8/cQTlnZbAfIscmSiZkHwM6PSHsEBXVgtcnlwAu6cEsM/XpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8754.eurprd04.prod.outlook.com (2603:10a6:20b:42d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 18:48:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 18:48:39 +0000
Date: Tue, 30 Jun 2026 14:48:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
Subject: Re: [PATCH v4 3/3] i3c: master: Validate GET CCC payload length and
 retry Direct GET once
Message-ID: <akQPfmc-9p88Un7z@lizhi-Precision-Tower-5810>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: PH8PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: d8919b17-02bb-4ca8-d849-08ded6d83347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	OE958KrQJRthD98J5NTU8pnYoo2fdYLT959LfpalKrHBMWQerBxO4u+wUgB8b1Rj3KlmhohnQ1E3TVB15rvQj3F2uY254EKMUnQpajva5KTh95QXftUQmgjgFm4hedAt1Bw3hjSh4NoOIpL+pnX22UrQlVppGRqjwPBM6v3HYL8rFTsQx77Pg+XiHTymPzMX29Z8RP/gJfDm+UUhQVerRkY3FoaMCcnCBHM/KZFaTDW1/vbdFaoN/sNuR6QhyHtcowxTZig7XZGWD+YDmylhyUMQRjoCpGY5NGHcpMTUlxrycISY2C1X9kX6EAmcAm6vpTBbrStFFoIX5sL/efvA2xn2zHpHa+EZcxNPE+qlMPjTqV/xDbqWtjEy8ZJBydG9N9JzI21JbsdaG+1TbPUgAUrTk5geTmSPcFv3MCkU/jkDCA9CM9MigCMxIQElmGUHs1ACpdWGCr9d/Y1MHWubZ740JmrVNDdLB8Wm4gBQ+Wa25JrULnNx26U7WBRgQDLByNDw9x3iv1/bKCZjH64SNWJ2qBpU48fBD5oj4AoDPM2JeEL15+BDk68788rnahRmZbjktwiJ7FVM3ZYbvUJLYWJahshvvz2Iet6qMKJRmFdu9Oi/XmeT/9fJb0vqD1K2vHaa9O+YJWxtxeyvKc6Jj3sP+Le9E5gO15Ny6BcVGy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nZn9khwYdP25DQmI8Cstlf8Y/YfPE/HW9X/roLLpPjzK7dVxNS3U4d3LANo9?=
 =?us-ascii?Q?w7aC4KXfFrrvo9ZDjy2X/8kWBlUJctHWWed4H+cG5f/u7CWcJJVh4xUrDPen?=
 =?us-ascii?Q?PRqISGkexP0mnL8P6H/p/8mbISdlVAUOnSYFzz6CP6+KAszHYvzDQokQ8Zaf?=
 =?us-ascii?Q?XlXFfTc+Y1B2XaBU9mpdUytxpiC2iya100kor7toJ8oaUQjaPmx2rbVWjb+A?=
 =?us-ascii?Q?WxEAqIqiSKpkiDlAgyPuPr74K7GEIpzuCC3856BYr4JmPTq0EdHTzSYvWRyP?=
 =?us-ascii?Q?0MpOIuaaBgz2R+miacM8jQHYaPps3wX+n1pA2o1nlrsNZeOHK72kZeRk2s83?=
 =?us-ascii?Q?gtLoH6rb/HAFmOT1KQbcuULQSFVoTHPzG5JEDXzs6rtFjriWJJFISnLxeEZ4?=
 =?us-ascii?Q?dgQz7fML8oiUi5A6FOArydKmDNeKf/lPYfaiLrL+mboh6OjSaQiycpcNe+cB?=
 =?us-ascii?Q?0oqwhqFy/dZGO52a9PAIwkx12i3KcItY5HMQPU1if+rM+/RQ6rX72OPOmwVN?=
 =?us-ascii?Q?OgX5+ZxZBR0sHMKoTF0bKy0UQ60uTtmouDJIeSa5hXv/wH8JlqAb5mD11jTI?=
 =?us-ascii?Q?z8EXg72cOZbC3evQs97tlA2SsZihJTkjEKOFF7cSnPCdpE4JKopeyBLRO+Y5?=
 =?us-ascii?Q?KQdeJb2+UbBV0VH9SvkryvmA9VYbrf26RoHIB1icPrQBUpNVr2/julqUPqDc?=
 =?us-ascii?Q?mO8G3dUGmjmMwSL8WmKRz4gozYidzL48RQ4AlaBhSm1+qxs1pWyHnW5xPx8A?=
 =?us-ascii?Q?sreIgEodAO5FTE78g6QVbMtEhSuFLvjWC/4VZNUIQMwBylmeHQ3/v8xk+kif?=
 =?us-ascii?Q?xetDw0FXECUW4RiQiGXZYzAZkROC8WfnOYnTQgDPAjeAzP5B+WCMIXkAjUki?=
 =?us-ascii?Q?/l04sTYElJn/LeJz5KXvRTaxm2pw95INuIAWYA5lO9gZ1lfsdtH/xJodfmtb?=
 =?us-ascii?Q?vb70u16306TLJ6be64qGyrVoRepPGzevFkivZ7VmT+dqqm0+hlRZcuK7+oSF?=
 =?us-ascii?Q?SdSFI9J4XDoHcU4Sr0SzX7SnrJxKJWluy420Z18rgqVP3snUZZ8rSEiyqjpx?=
 =?us-ascii?Q?nvVSqwIoKA5znMEYTs6LvkmeCVcxwm6t9VxxvzlHKkHDFytYnhKGtdBIs5eI?=
 =?us-ascii?Q?+DgXq09FJcJkD/CQt70fYn988oHtaHMLGxYCw4NEb7UQ5pS/2gLpPv0VVV9e?=
 =?us-ascii?Q?+Edte0judR6Mrnw1b8NfQG1xjtRGOmWA1V2TmmNBLye2qh1SUNiwF9d5ZaAE?=
 =?us-ascii?Q?DqPOtqUmVWx4uXyVK6+nvatL1EZlHIJ8VDoOn+4wK02f4Hu0gmlLQyOO+xms?=
 =?us-ascii?Q?SC3WvYikTb2HlMozDCVZJVtSfk1rF7yUM4eBUp5GKBYnarFYRSeNC33ipbbF?=
 =?us-ascii?Q?QaWOEVmR22V3gI45KDcJLv49E8/xYgjvFk8rvB8YEVgkkZ7hSjXs7swW8goe?=
 =?us-ascii?Q?X+QtIxFNqWP21AVU62e8re8LH6HvXpPdHnROaOg2Vk8CEGqCEDFIkPPIkPCf?=
 =?us-ascii?Q?6eBHuZlLpypEAv3UN+OwTW+ex3KEtDHmL+8nFXXqDPYctzr37PDDwAH+Uzzy?=
 =?us-ascii?Q?Awd2tlzWkSBDbS6hgQlwL3s2CfhMlvWTSeglr22bLvEOMdUHYNLGR3vcteJj?=
 =?us-ascii?Q?AdZOZDX/5d4/ZCnZ560iifmmeGc2ZUY349zF6LMK6JcOMcn1Use87fsXUsHA?=
 =?us-ascii?Q?sJzujqi0xNq2M/8IOxp2qffbsFPlcYHleeNQg9pCvw5DDfxRBvkAN9Le6MuY?=
 =?us-ascii?Q?SJgrC1Woy1zat97CAQRyEVCbkks3CEvvKlMqtzLXV5Z2pRLAN6UH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8919b17-02bb-4ca8-d849-08ded6d83347
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:48:39.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BaJFDNLZaHa4z4jCI41sbceLo7/orGIqfVQ85eVt/21D7T39NRPgKxZuffog+FEuY00jXR62NVM+v8ZTI891wWiulxoXaBBxNN16GYP9FP0X4gXWBnuMWj9Wlmc8LEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8754

On Tue, Jun 30, 2026 at 06:20:27AM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
> variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
> at the call site.
>
> Validate GET payload length in i3c_master_send_ccc_cmd_locked() using
> actual_len and optional_bytes. Retry failed Direct GET CCCs up to
> cmd->retries times (default I3C_CCC_RETRIES) on any error; SET CCCs are
> not retried by default.
>
> Add i3c_ccc_cmd_init_retries() and set actual_len in I3C master drivers
> on successful GET transfers.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  drivers/i3c/master.c                   | 92 ++++++++++++++++++++++----
>  drivers/i3c/master/adi-i3c-master.c    |  2 +
>  drivers/i3c/master/i3c-master-cdns.c   |  2 +
>  drivers/i3c/master/mipi-i3c-hci/core.c |  5 +-
>  drivers/i3c/master/renesas-i3c.c       |  2 +
>  drivers/i3c/master/svc-i3c-master.c    |  4 +-
>  include/linux/i3c/ccc.h                |  7 ++

Can you spit ccc.h and master.c to one patch, other driver change to
anthoer patche.

>  7 files changed, 98 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5cd4e5da2233..29dc0793a5a4 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -901,6 +901,8 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
>  {
>  	dest->addr = addr;
>  	dest->payload.len = payloadlen;
> +	dest->payload.actual_len = 0;
> +	dest->payload.optional_bytes = 0;
>  	if (payloadlen)
>  		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
>  	else
> @@ -914,17 +916,55 @@ static void i3c_ccc_cmd_dest_cleanup(struct i3c_ccc_cmd_dest *dest)
>  	kfree(dest->payload.data);
>  }
>
...
>
> +static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
> +			     struct i3c_ccc_cmd_dest *dests,
> +			     unsigned int ndests)
> +{
> +	i3c_ccc_cmd_init_retries(cmd, rnw, id, dests, ndests,
> +				 rnw ? I3C_CCC_RETRIES : 0);

why only read need retry?

> +}
> +
...
>
> @@ -953,7 +996,24 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	    !master->ops->supports_ccc_cmd(master, cmd))
>  		return -EOPNOTSUPP;
>
> -	return master->ops->send_ccc_cmd(master, cmd);
> +	max_attempts = cmd->retries + 1;
> +	ret = -EIO;
> +	for (attempt = 0; attempt < max_attempts; attempt++) {
> +		unsigned int i;
> +
> +		if (cmd->rnw)
> +			for (i = 0; i < cmd->ndests; i++)
> +				cmd->dests[i].payload.actual_len = 0;
> +
> +		cmd->err = I3C_ERROR_UNKNOWN;
> +		ret = master->ops->send_ccc_cmd(master, cmd);
> +		if (!ret && cmd->rnw)

i3c_ccc_validate_payload_len() already checked cmd->rnw, needn't check here
again.

> +			ret = i3c_ccc_validate_payload_len(cmd);
> +		if (!ret && cmd->err == I3C_ERROR_UNKNOWN)
> +			break;

if i3c_ccc_validate_payload_len() return failure, why need try here.
suppose only need retry when target NACK request.

> +	}
> +
> +	return ret;
>  }
>
>  static struct i2c_dev_desc *
...
> @@ -1363,6 +1427,8 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
>  	if (!getmaxds)
>  		return -ENOMEM;
>
> +	dest.payload.optional_bytes = 3;
> +

move these set optional_bytes to new patch

>  	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	if (ret) {
...
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index f39c449922ca..fec614700843 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -805,6 +805,8 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  	ret = xfer->ret;
>  	if (ret)
>  		ccc->err = I3C_ERROR_M2;
> +	else if (ccc->rnw)
> +		ccc->dests[0].payload.actual_len = cmd->rx_count;

update actual_len's patch should just flow add field actual_len's patch

>
>  	return ret;
>  }
...
> +
>  /**
>   * struct i3c_ccc_cmd_payload - CCC payload
>   *
>   * @len: requested payload length
>   * @actual_len: number of bytes received on a GET CCC (filled by the driver)
> + * @optional_bytes: GET CCCs may return up to this many fewer bytes than @len

					   up to @len - @optional_bytes

Frank
>   * @data: payload data. This buffer must be DMA-able
>   */
>  struct i3c_ccc_cmd_payload {
>  	u16 len;
>  	u16 actual_len;
> +	u16 optional_bytes;
>  	void *data;
>  };
>
> @@ -374,12 +378,15 @@ struct i3c_ccc_cmd_dest {
>   * @ndests: number of destinations. Should always be one for broadcast commands
>   * @dests: array of destinations and associated payload for this CCC. Most of
>   *	   the time, only one destination is provided
> + * @retries: number of times to retry a failed Direct GET CCC (see
> + *	     &I3C_CCC_RETRIES)
>   * @err: I3C error code
>   */
>  struct i3c_ccc_cmd {
>  	u8 rnw;
>  	u8 id;
>  	unsigned int ndests;
> +	unsigned int retries;
>  	struct i3c_ccc_cmd_dest *dests;
>  	enum i3c_error_code err;
>  };
> --
> 2.43.7
>
