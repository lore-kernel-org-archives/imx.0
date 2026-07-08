Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF00F3016F1
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516639; cv=fail; b=B7vmMeVsrUx7Ph3hZ/IXthYQ5FauIX/Y+KCMJxr2gQWqiXoabllXDZ8+r7BeoyD04ckAns89XKjh9y7mfbK3kpZ60rGT+1hkHI4vDzOAZY1cn1Jz8eDasYhZosPEPi/2rvk1El28JlOfx+6dt8bfnsw6J4BYUb1wP0srisUXR/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516639; c=relaxed/simple;
	bh=DAww2k2XRicgTK5H7FGZ9szU6SPeZYzv1KqFhVYfqZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DUwBx/pe10ayfFhTTIMy8NbjDekFYwYAnEGGZDdr8A9ZwykhI6Y9lxk9m221+ZmFXc04ZZzGEUMNRwBDuZfeaQi6PkAJj1hU/jJ57X8sQixqw22FQsiTzNz+JSUbpMncGK96fn71DHUPZnR4WsFA+Jj3G3KETD8ADNbqYO19Gpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oIus2+DQ; arc=fail smtp.client-ip=52.101.83.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oIus2+DQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBmB6huGbKhK2fhaTxEX3wmPM1cDsuiyFAKXfuOLhs4Je7OVdX3DuPvHJjBbibx6ht55ZsJxMmb5PcosNEIi4QL0W0cjj1QkFouGHm4g2c9epXiIp9L0Ru224ApQPn4vSCk7UV8ER2h5dmkOIPHo+PTRk6c2knBEKvJq2AJJZi4pvLo0IV8gyRwg/sqynid1Yt9V8iWeffGSSH9N5w4blJnga1y1X4ZELtL2r+yYof1IgWproNLoleWmZoCtSsNap+CP8FINRgrB5zyvyzi/Ljl7Vi83MPcamlUp3XNxB/Z9CUPpyo/PQ/84+KzFFnLXei2/VSbNpWaKNcjJytY7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0lBQ518sa1xHcOuBFEqATSp4k1XysRr14rIjNcK6Z8=;
 b=OQyI31stZh8oVANxvXtRn83+H9m/VpXYS+39GqDZMLTCQscyEH+OllXF7VzVmv73mZm0Sso0OM45KFmzMmzVCSNHVefhhEtlbnvg2xlTUq3tI71U1ZIih6+yXbfopiHwvFCONh4jLWljUJZXEsxV15ENq8apVtmE4Op86xUsV314Uczk5HTkXme+pSboYtD1O3HKKWPkOgVKUKT0a1p8B/ixtg5chT0dtHqp7tqBEFZRuenvpsu4CaxncmEIlZSQsikKIPgHR3kefNqgkA5907cIih92K0oub0HAdxwLub+n0/j55hw9pFZImPo+m4mzJ499yHYP4dikKtn/s5WVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0lBQ518sa1xHcOuBFEqATSp4k1XysRr14rIjNcK6Z8=;
 b=oIus2+DQvdjqsQW5PpiWWADiC13YXgmlNUOoTiPeNSZ4iSChV3OYutXoAmQDNepHOK3t0u5BjE/9XpIFrGYpFFGXWVuOHrXQ98C3OIdPRuMZBSR4P9f8sv4+6C1eImENtT4BUpon9e8DPkZGUdN3iY1zCNg6Jd3bX1X3ex1ZNrDp4TcKgcbG3VvVBPWb67Gnu3RUmAK+ILeVAjZ45SysJsbPm/Z4mEsaSW7P5Yrrm/36fYo5ML2MxoFGgikRaKSVEiG1h2whEDL6syrYy8XZ3ngH6Pr+7hhF5ZYZiXbfgSlHCwGQZ78i+bUOFVfKpb4MQkxKP1rHwkORohWUNs0Ruw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12125.eurprd04.prod.outlook.com (2603:10a6:150:316::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 8 Jul
 2026 13:17:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 13:17:07 +0000
Date: Wed, 8 Jul 2026 08:16:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
Subject: Re: [PATCH v6 2/5] i3c: master: Report actual GET CCC payload length
 on success
Message-ID: <ak5NyFGrGUIsBHqs@SMW015318>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SA1PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12125:EE_
X-MS-Office365-Filtering-Correlation-Id: 083e8d4b-f7e1-4c2b-cf6c-08dedcf335bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	B3uFMpms8/rS210QemuzF1fMrTIA2tOIAo6rY7Bv5dtSienp+baObo0ZtfTszEQLiYeTIw282VOqrXfeEwhRQVqDaH4xJElnF3tpuB7HTRWm3EifzGCZujQKQCh/IiOyoMjLRorNQLo842exefEADsCCYJOzIVt0CEA0eqkDwhf1CS8iwjDI0KtmoB1SljddtQvQKIz6PzRjq+nFbRTzbyAnwxaJYvDDzM67SBz2n+GFW1N8CwHXKAhevWQit9Xi72l/Awy5UULFKwFvQJzeUTxAHUm/Vx+WbzfqJEhJF5y6BUUrjw7rIoBgLdty9/4BqKW8t5rwhEZESReTPD3h43z8djBCdt26DaC7gOXDOedkSX3b/adhse41d7uYwqARUOHD7W+LHDNsrqZOEZHreEfAETg/0JMYIG1yI0DHRZxlcsDmDfs2gwhFOuGwxHgT1HTNyQWNOmydTBzsvLbomhew4qif7H5q37iQE7F+mcwwn8bGBLg2kyfi4pmO4jgIb49ql+JDU9UHVQYueSR+K1SkOxAsAFSEROuYhXCrsBfkDPSWk12Vq79ByH7IoUjqQ6AvYxYE7AwNdTT3XPrp3VuKG2bCtr8iQBLZ40OA3ApnYm4rATEADsc8TB66HZo5TI8JHAdj1U/dK5HPaSVeO7yepFUOrdFUPTq6ZBvWd3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YxKLDaED2/YGVoJ8DmIA2xP6X30n/poWV8d3VK7zh1R2YGGkAOuEEgXrvlBg?=
 =?us-ascii?Q?JMlXw6JBUpiGtzbpq6KOdkLYRO7JGte8cXTtNXlzHkKRx675UOB/k28Ug2uX?=
 =?us-ascii?Q?OXsW1x+HQgrPVHBSOODRt68sLNUVgiyqL7rx+DQrdvI34MXpLxtUfuVY+Vc0?=
 =?us-ascii?Q?eey3XCu/ormuufwma5opZnxkA0wj6xsvz3RoYOVWSji5tKaJMzsdBn96+Ayb?=
 =?us-ascii?Q?pqqHbW4W8fcVAehzpJMyaXZ0bMGIDboJ3DTHTl3hMhAT4zqR6ySeEIpMqq8S?=
 =?us-ascii?Q?UUzG2PdftzCTnzMkdluKfQG+wh8PwsfTJOdHXsEvk8MBnU15NCJr76B3DD/1?=
 =?us-ascii?Q?Dqj+NJdaRF5qBF9dbl6oAJFjGriByqIBvSz7z6zPLcjjOKriDvHncVp7s+re?=
 =?us-ascii?Q?UFVEoJp7xmb5q6PcAagCLpTXKgNYcEwHgP9+9LEnfPP3CG5xKTJz2n/c5Sm/?=
 =?us-ascii?Q?Dm2IP6pVJUZsM/ZHNTj7KA3Mup8JrcUnRMEZcnduym5uIzovC7eqTI3Aut0c?=
 =?us-ascii?Q?umYFOcdLuTTVga5mZMVgF7i8c5kZIIivmziwD+u2y/0b37igFoCPVnL+bByM?=
 =?us-ascii?Q?TN8GZQg0ggy4XFgsGSMCbQ62FUapJjra9w/Z9KHPlWw0v/xMjnxEAamca91D?=
 =?us-ascii?Q?N9521+8v7T1HT+HwGP/LdvgM2RUpvKTtfe/aUUVHNXPGSncBj6SLWb49qCJA?=
 =?us-ascii?Q?mNVobW9HuvxwWpOdSQyT+Ll+4ZVTiwJGl4bDQvE9OrybTHpViyCci5t+Tx6r?=
 =?us-ascii?Q?++XgK9s75Yh8TySapn4fIowFUFrolON5y4tK8unQ12ukA2OJvRX7T6iUd/1U?=
 =?us-ascii?Q?XPbaOhosIrdNMHLphl4TkIbk1jNQlW22Mb0BtfiJSMrbQ4C14s3UI4wUg+Oy?=
 =?us-ascii?Q?8ybyZm1/FALQ+v61gDR3YtUPo9uLjvGiztZ/HmLWm8pANxsd2Zdte5sq1nIw?=
 =?us-ascii?Q?UA5TyYRnn2p/y9qWzJ9TeDmdf88zF8gisH52bJqFpG9dUpqfyXKFxkPwP5Ev?=
 =?us-ascii?Q?QZ9VJeKki13Z6Ld6Y0Wne0VMDde2q+I1Cu5MZURRzSL3BABot7Aoxp/Kbcz/?=
 =?us-ascii?Q?02OgEvvP1lmJt6wLyJF9y4kBxhsPi2/+cM4ftJyHpoZuJbcOgUCzLXEBK5ZL?=
 =?us-ascii?Q?6ynzSw9SqePqTaHpOS2fcJK7/foKfMgiJFWN8rUsJtxdEzInB4QrOuz1jXps?=
 =?us-ascii?Q?oSEl81iWCOGs+ZDrX/D9SuN+h9n1VarGXdTuljXyEycyklMeLpgo8dNK9xLO?=
 =?us-ascii?Q?1hMlGJVbabWk4k0NLwniorJEKceNRVyzSGCibG6HexkjH5lm7KoZqWtLO2xZ?=
 =?us-ascii?Q?XiZypFR5ifO4t5DMpD2BRR4TirXwNfLDgcZxR8akK6okzBP9+s7/04Kcv+GK?=
 =?us-ascii?Q?moedKlcCrHbg40e0wmVWCgPJeVRX7eaOl0a0+WHc8X81RyrkvXLvmfndlqwE?=
 =?us-ascii?Q?a2ve0IcAyGLJI0qXrBIwPA4LDNcBKlYa3X5nIrS3iWZvZJUuYXR4w8hSTedO?=
 =?us-ascii?Q?qO7qXgdQ3ULDGwJKgD348dvI+kUTzgo0Ssc/OpFbc/rHc/ihy8Vz3mTZNvFu?=
 =?us-ascii?Q?kjLfUzMcTEX4oSQKBF5NRFYEdUlbiYmVyZW32pRf5DJJL00A6ikTUm8VFT5P?=
 =?us-ascii?Q?lutumjFX+lSuXi1bJnk1lr1+vND1YCtezumVdUpIrLATwH88OgveAHuwm5ub?=
 =?us-ascii?Q?6uPMWO/GN5xE9EavRy5DKNW/VoQ/BsN7XpgMHWT4yWVaoVZPM27eszb95MvI?=
 =?us-ascii?Q?IpyyKZGTeuqKUfhB8vu2Uu35c7E6LJZr/1myfXwPiNBOZIk994LB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083e8d4b-f7e1-4c2b-cf6c-08dedcf335bf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:17:07.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STDwDZL7LPmnjC0LvzRJpvUeTIoJ1R8YLMIHsPx59RabLsRX5C9VWR5FsrQJuXgSG+vAeISPEZMuPeM0j6w6UA94QhQ8OQXMa1316Re/OMUqWfU3X4oiHAI/8FzkRF45
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12125

On Wed, Jul 08, 2026 at 12:17:38AM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Set dests[].payload.actual_len on successful GET CCC transfers in I3C
> master drivers so the core can distinguish requested and received
> buffer lengths. Switch core GET helpers to use actual_len instead of
> len when interpreting GET CCC results.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v6:
> - Fix ADI and Cadence GET actual_len: store hardware-reported xfer bytes
>   in cmd->rx_len and set actual_len from that, not from payload.len.
> - Fix Renesas GET actual_len: drain the response FIFO at rx_buf + rx_count
>   in resp_isr, clamp rx_count to data_len before subtracting (avoids
>   unsigned underflow when rx_isr reads round up to 32-bit words), and
>   report actual_len from cmd->rx_count.
>
> Changes in v5:
> - New patch scope: all I3C master drivers (adi, dw, cdns, renesas, svc,
>   mipi-hci) set actual_len on successful GET transfers.
> - dw_i3c_ccc_get() sets actual_len from cmd->rx_len; dw_i3c_ccc_set()
>   does not touch actual_len (fixes v4 regression).
> - Initialise actual_len to 0 in i3c_ccc_cmd_dest_init().
> - Switch core GET helpers (getmrl, getmwl, getmxds, gethdrcap) to use
>   actual_len instead of len when interpreting GET results.
>
> Changes in v4:
> - Refactor dw_i3c_ccc_map_err() to return enum i3c_error_code; callers
>   assign ccc->err.
> - Map I3C_ERROR_M2 only for RESPONSE_ERROR_IBA_NACK (broadcast address
>   7'h7E not ACKed). Do not report target-address NACK as M2.
> - Keep RESPONSE_ERROR_ADDRESS_NACK returning -EIO in
>   dw_i3c_master_end_xfer_locked().
> ---
>  drivers/i3c/master.c                   | 11 ++++++-----
>  drivers/i3c/master/adi-i3c-master.c    |  3 +++
>  drivers/i3c/master/dw-i3c-master.c     |  5 ++++-
>  drivers/i3c/master/i3c-master-cdns.c   |  3 +++
>  drivers/i3c/master/mipi-i3c-hci/core.c |  5 +++--
>  drivers/i3c/master/renesas-i3c.c       | 16 ++++++++++++----
>  drivers/i3c/master/svc-i3c-master.c    |  4 ++--
>  7 files changed, 33 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5cd4e5da2233..037b3b980717 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -901,6 +901,7 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
>  {
>  	dest->addr = addr;
>  	dest->payload.len = payloadlen;
> +	dest->payload.actual_len = 0;
>  	if (payloadlen)
>  		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
>  	else
> @@ -1302,7 +1303,7 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto out;
>
> -	switch (dest.payload.len) {
> +	switch (dest.payload.actual_len) {
>  	case 3:
>  		info->max_ibi_len = mrl->ibi_len;
>  		fallthrough;
> @@ -1337,7 +1338,7 @@ static int i3c_master_getmwl_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto out;
>
> -	if (dest.payload.len != sizeof(*mwl)) {
> +	if (dest.payload.actual_len != sizeof(*mwl)) {
>  		ret = -EIO;
>  		goto out;
>  	}
> @@ -1376,14 +1377,14 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
>  			goto out;
>  	}
>
> -	if (dest.payload.len != 2 && dest.payload.len != 5) {
> +	if (dest.payload.actual_len != 2 && dest.payload.actual_len != 5) {
>  		ret = -EIO;
>  		goto out;
>  	}
>
>  	info->max_read_ds = getmaxds->maxrd;
>  	info->max_write_ds = getmaxds->maxwr;
> -	if (dest.payload.len == 5)
> +	if (dest.payload.actual_len == 5)
>  		info->max_read_turnaround = getmaxds->maxrdturn[0] |
>  					    ((u32)getmaxds->maxrdturn[1] << 8) |
>  					    ((u32)getmaxds->maxrdturn[2] << 16);
> @@ -1412,7 +1413,7 @@ static int i3c_master_gethdrcap_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto out;
>
> -	if (dest.payload.len != 1) {
> +	if (dest.payload.actual_len != 1) {
>  		ret = -EIO;
>  		goto out;
>  	}
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 047081c9f064..b5ab2e4e5d57 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -246,6 +246,7 @@ static void adi_i3c_master_end_xfer_locked(struct adi_i3c_master *master,
>  		if (cmd->cmd0 & REG_CMD_FIFO_0_RNW) {
>  			rx_len = min_t(u32, REG_CMDR_FIFO_XFER_BYTES(cmdr), cmd->rx_len);
>  			adi_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
> +			cmd->rx_len = rx_len;
>  		}
>  		cmd->error = REG_CMDR_FIFO_ERROR(cmdr);
>  	}
> @@ -360,6 +361,8 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  		adi_i3c_master_unqueue_xfer(master, xfer);
>
>  	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
> +	if (!xfer->ret && cmd->rnw)
> +		cmd->dests[0].payload.actual_len = ccmd->rx_len;
>
>  	return xfer->ret;
>  }
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 655693a2187e..6998ffd15f5f 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -780,7 +780,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
>  	ret = xfer->ret;
> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> +	cmd = &xfer->cmds[0];
> +	if (!ret)
> +		ccc->dests[0].payload.actual_len = cmd->rx_len;
> +	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
>  		ccc->err = I3C_ERROR_M2;
>
>  	return ret;
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 5cfec6761494..cd6adbcecc26 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -574,6 +574,7 @@ static void cdns_i3c_master_end_xfer_locked(struct cdns_i3c_master *master,
>  		cmd = &xfer->cmds[CMDR_CMDID(cmdr)];
>  		rx_len = min_t(u32, CMDR_XFER_BYTES(cmdr), cmd->rx_len);
>  		cdns_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
> +		cmd->rx_len = rx_len;
>  		cmd->error = CMDR_ERROR(cmdr);
>  	}
>
> @@ -715,6 +716,8 @@ static int cdns_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>
>  	ret = xfer->ret;
>  	cmd->err = cdns_i3c_cmd_get_err(&xfer->cmds[0]);
> +	if (!ret && cmd->rnw)
> +		cmd->dests[0].payload.actual_len = ccmd->rx_len;
>  	cdns_i3c_master_free_xfer(xfer);
>
>  	return ret;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b781dbed2165..2b215658e093 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -326,7 +326,7 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
>  		goto out;
>  	for (i = prefixed; i < nxfers; i++) {
>  		if (ccc->rnw)
> -			ccc->dests[i - prefixed].payload.len =
> +			ccc->dests[i - prefixed].payload.actual_len =
>  				RESP_DATA_LENGTH(xfer[i].response);
>  		switch (RESP_STATUS(xfer[i].response)) {
>  		case RESP_SUCCESS:
> @@ -343,7 +343,8 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
>
>  	if (ccc->rnw)
>  		dev_dbg(&hci->master.dev, "got: %*ph",
> -			ccc->dests[0].payload.len, ccc->dests[0].payload.data);
> +			ccc->dests[0].payload.actual_len,
> +			ccc->dests[0].payload.data);
>
>  out:
>  	hci_free_xfer(xfer, nxfers);
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index f39c449922ca..25a2b2ed618e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -805,6 +805,8 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  	ret = xfer->ret;
>  	if (ret)
>  		ccc->err = I3C_ERROR_M2;
> +	else if (ccc->rnw)
> +		ccc->dests[0].payload.actual_len = cmd->rx_count;
>
>  	return ret;
>  }
> @@ -1072,10 +1074,16 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
>  			break;
>  		case I3C_INTERNAL_STATE_CONTROLLER_READ:
>  		case I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ:
> -			if (NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) && !cmd->err)
> -				bytes_remaining = data_len - cmd->rx_count;
> -
> -			i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
> +			if (!cmd->err) {
> +				u32 rx_count = min(cmd->rx_count, data_len);
> +
> +				bytes_remaining = data_len - rx_count;
> +				if (bytes_remaining)
> +					i3c_readl_fifo(i3c->regs + NTDTBP0,
> +						       cmd->rx_buf + rx_count,
> +						       bytes_remaining);
> +				cmd->rx_count = data_len;
> +			}
>  			renesas_clear_bit(i3c->regs, NTIE, NTIE_RDBFIE0);
>  			break;
>  		default:
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index e2d99a3ac07d..c92d96e6b4d8 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1706,8 +1706,8 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
>  		svc_i3c_master_dequeue_xfer(master, xfer);
>  	mutex_unlock(&master->lock);
>
> -	if (cmd->actual_len != xfer_len)
> -		ccc->dests[0].payload.len = cmd->actual_len;
> +	if (ccc->rnw)
> +		ccc->dests[0].payload.actual_len = cmd->actual_len;
>
>  	ret = xfer->ret;
>  	svc_i3c_master_free_xfer(xfer);
> --
> 2.43.7
>
>
