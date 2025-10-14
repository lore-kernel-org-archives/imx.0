Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426372FFDDA
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760456900; cv=fail; b=KL3XEaU1fjiVsKWy2UZOHSZgRjfH13CsEZnt737ESl7BcwGrQJekRBnDUSpvuRlFMj0YoZ3feQXc4B4M3kKI+CuIUHynQWx0GFiZimEg26hIZs8wemEUYbBeTq9HqmtVJ5YfhwD5K3LBjcPJ0XokoeNXnPC4BVN9bGDEG+z0jyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760456900; c=relaxed/simple;
	bh=nYpH39mdm3O7kAyrqU9Y/VOjq6EqnTiAIBQdQsEqHrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fH120QC96jsPEWAYtHkdaMpgbjvnrHAUc/bN+cgZuN/SjcxG8rJm94W5BgB0CYKK6IObXRuiDOvPCDbjI2pkjxt+i7w74MagPntaOt6xQ1r88KtsLpJu9lPeWDlP7aZki9iRhuSM8AhdHYIi3aDq+n9C38ZgQLz7tfNyzvkibAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YL4fcwzJ; arc=fail smtp.client-ip=52.101.72.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YL4fcwzJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEG/Pkg03PfLUr0YnQlJe6WUf2iz6sntbX9j6uW8Sm/9yFj3J3jxamhpl+L4eRNU5zHrRY6FqQ5/jMboBg5LaLCeXcum5G2QMkl9NFgHv0znlyrvDOBzZ1KO/Dso8eN0xdHaKCFDGFMWxGU20SMIMhQucE2nmR2JmWXNip/Rwho//KlnXTmrYAwoADtSQGz/aYsN1bRwj27nFCw5iUsWYIww7qbjnsArmSVt1SiexnJTlU/PaRoNvhbpeFWULzK9Yfp1u5EkXpZvv3hYbKMaqbg/1gg+iNx1t5aHA/Eugg46vSNkphRrrQE2zoQhYsLeVUy8bpvld/0bk9qoEumBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yX1WKXiOTJNFfuvaV78xKrmTQ5jgflOZo9lwOsQeyqw=;
 b=G0BUQkz5WOD00+LxEr3jJaYl3iahbOmnhRsYNzQgqexbJIe/BHEPv3K0spC7qfzr4Rh2QJJ6KjoYtucJIZiQzipJL6iaGy4mZdQCcjErkQwLhcwdAXsKaAeCpTATPIpN82wySFe61cTM5NHFhJz5zODrvjR2qH9ew8vM7m4GSd/Lo76U9r3WJhjU6fs5BQQXDeyYHpGNAzot2uSyL2LMLCO2u0k4EVYQI4iDMUQrJZcyVytJEMEeGKsUH3tGZ8NciuFq1pm/HIvX5RKOJjF9gaG6/5KhoF0a6G5Uc1SXeJd4K4xye9mbRltefZilAsm+ZtC/HrELlCC7psW4nRtkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yX1WKXiOTJNFfuvaV78xKrmTQ5jgflOZo9lwOsQeyqw=;
 b=YL4fcwzJhGbqm0X67X1yXJTLMz7X9Ikm0+9q+Phf7DIFaJoknMKVpyBI9YWGMxfVPtNg1nZM0iFfrzVLIcgBNlmfnP8o0LnzQvD3bI7aNdUHFmjd9p+25CAgxFrxeapQvaF36L9XIPFRbdflDKMqJWJlqrDGKnkiwWVcgZfOfsoDGY3PgTRwlpWCcyn7ZGt2E8o19eR+I/N715oKP7de5WoahiPgDUDNNKaPbauaBjWa8zpwJucNuMm2EXueSBRbxTuvbfW9IiQyYdsuXz/Bz0xeQI6n0TU1uWdvIWvc/8jsf99D6JDgU7sQTfytxTynBzmk5jfw3s0Vls1tECy+dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10262.eurprd04.prod.outlook.com (2603:10a6:102:464::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:48:14 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:48:13 +0000
Date: Tue, 14 Oct 2025 11:48:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] firmware: imx: scu-irq: fix OF node leak in
Message-ID: <aO5wtuMZILTYTBce@lizhi-Precision-Tower-5810>
References: <20251014-imx-firmware-v1-0-ba00220613ca@nxp.com>
 <20251014-imx-firmware-v1-1-ba00220613ca@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-imx-firmware-v1-1-ba00220613ca@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10262:EE_
X-MS-Office365-Filtering-Correlation-Id: b70a3818-b09c-4ec9-d58f-08de0b3915ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cfqbHqHEuBtqmC4F6OAVFy0sqKtAzAUoBcI/PzGpptLgM2QnsmUAL8cKICeK?=
 =?us-ascii?Q?uVsrLLR7Q2LF97+FCLKrUnmBBIbzxJpZDldfMQ+mpn0/VaoWxMrCM1crUwLp?=
 =?us-ascii?Q?H3Mw4uol9ooM3hTsvdzDIWrmwsM27StMC+SXQUuS5cvNHTAPHvC6ciZcBiMM?=
 =?us-ascii?Q?wIvLwvUfStU5R+GjoZjpB731uP+XxlutyGzlJJUCXstSVeU4kHrl0MLevyut?=
 =?us-ascii?Q?czGpCMdbByiQLZQt1n81SRV/oOk8d5TVdgAEuhBMUE/sW6vA29J5AGd4PR9N?=
 =?us-ascii?Q?muSwY0MYRbK86Ulfwqdc3QhBEQ7lBPjyfoOWmFTwRhTJck1+a2ZsBqM2BPX6?=
 =?us-ascii?Q?2AlkWZAitsXr1itLSPdu1142rPR16V/Gv9EP3py17nCxJDRxcx43u6lD3NE3?=
 =?us-ascii?Q?toGLpZalLB371nPLKLaGep2zpANBGywoudCKA6J2AMtIjPSML7xoRrkZqXZ+?=
 =?us-ascii?Q?7m8jxvQQiQB0BHfYlwlROd9ju4o1KWYO7Hokga25m+3TGzw06EysoPm2CMou?=
 =?us-ascii?Q?h3eorg7+c9sGRQUJ953/MON35xmTI81jB5n3Cy3de5696tkeHwSv89EVT1WM?=
 =?us-ascii?Q?mU3rkdPeuZ3IeQjW9t93tlVPdcxzxLHqooMkaQFq2WyLyUE3L/d+zQJ2zkiY?=
 =?us-ascii?Q?tDgxlgJo2Y9y0+FfYDzMWZbZdu6hQXp+aoT6ZdJWueCGrNoSl/6kf2CadmqN?=
 =?us-ascii?Q?5H6MIyPHrOMZJV2rdoAFGGwlL4lUD61eudsVsgYWCmUZj7q3vqEgYNUWDgtk?=
 =?us-ascii?Q?ETu9qyUwlZu85oSdi1qyhiWXf6B0Yu1XYTcB9osXUMBv9XpAijMMyPo2iPfv?=
 =?us-ascii?Q?RkQ2aWTHmffDEJ6aYjd1zJr7BQXNJKq/eHH1pPiJNAw1W5RvoA6pUhriUH6j?=
 =?us-ascii?Q?cFWFyOMiOk7TI82qsX7rLKDcRdikwG35MpS0j3tSjCdIS27nkZ+DpAwfL+O9?=
 =?us-ascii?Q?laZrcDWboW8F75Pdw29WVAN4AF2QNlN5LsN2EZHgb7p6hzTXgmezwVH6mgO3?=
 =?us-ascii?Q?IjPFfaoOmnd77PkxKZvFvhowJBhw9zkrGvOPjwNXcOF1tknZzBcgv3tmdg+1?=
 =?us-ascii?Q?rIYX0PQMv2kn/M3MCr0z50X+EmJcbbuIUMa0IrgVUQbztN2fkWV5LFTwrYZH?=
 =?us-ascii?Q?RePTIRHVoktjZVfiwrr5JEH0ONfguJkwP/WJMMsaLVKwfDah3Q1MpYSSTl2v?=
 =?us-ascii?Q?VX9ABhQl0B1Ize1KWjAOOzzC8kRlmW9h/x4UbfHb9qjM30Z6dZK6zigSR9gl?=
 =?us-ascii?Q?E/Q6zIp8nPgaPx+rzDK9w9flbaR2oHyDYvY60o3rpV4l78r2sANhT+bhbG61?=
 =?us-ascii?Q?jnihf8LiAxZbJj5O5vcDkrxOG/KkdkO0Qt6a4xXJkg5XQCl88Ssz/QHo9Xnt?=
 =?us-ascii?Q?cMdgmFjtoxJ/PoaGA9KDb6dub/DSwYzqeGdfAviPFO1UAwoGe9Xf7l1Kj3HJ?=
 =?us-ascii?Q?LyFpC6+A/GkJW9XI1684GCB1WPECh7M8ZwJbHdC84UlC7RSR2dx0Bkknn63k?=
 =?us-ascii?Q?B515Qf5/teni/fM5dTBalD8FubIdI/vPtfvY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?88Ak72B/1DkRqx7mTttG0Xt2hiQvWgStAnKoUFolqOIZT0uw2HRYD/9jEiDr?=
 =?us-ascii?Q?/NJu14Z7Ox2GpqZ7UUeZWA700Zrx3AHWqBY+udc1tgGcIo+yK9+/omaNKIqe?=
 =?us-ascii?Q?8NYdAAc40pgYBuVYzbE5H3VhJG2qYw+VW9wq4JCA5DSMCYPs/eP87g/HjwuC?=
 =?us-ascii?Q?QWHJdrk+e7GuVQs98UEDaRRWvBUlPNShOTBNN4W3bySJv5wvMhql7TTb5yzK?=
 =?us-ascii?Q?Nm2Mxdd1YOR73P6oc+boTGumExOH20DHDT+XM56FObfQIxMDmeCIMc7LaK9e?=
 =?us-ascii?Q?CaZEaC8g2/7TTLv8ELoRUTccMm7kOsnAf9dOCqJLRETPS9NTqqr+17T/bhWT?=
 =?us-ascii?Q?ubtT144ihho/FFa4Sag9YAVeJ+HjOlgn5PUo1yhOg8Af49TV234xHXiMtcq5?=
 =?us-ascii?Q?9D2g1UJ4nLVMIGNpIs9Y033bI8GcxmV1Jd9DKNJc07qEvJ5YCehVwZKt9cpK?=
 =?us-ascii?Q?6cWI7te4zVZ6ZsWcoC7SQAWB1YQVgKN0QPblsJyu0qqR6Ni+aADwzwYIPPB8?=
 =?us-ascii?Q?N1LBCNMpfJOqzziaPG0L11/dZJcmWWT9JANr5+ffonGFMck9fiNxoTY8Gj4R?=
 =?us-ascii?Q?DSYSxL1e9ZmiE+rnKTlR8RMwyCbZEbJ4eLtCm0vG7Ba0ZRsXQoIYKK6VK3QF?=
 =?us-ascii?Q?uI2PXoxwXEv96j4t6U3n5TuDUKUMimEeRbFgSmHd0UWVnPAtDHgIOMoyRXG0?=
 =?us-ascii?Q?DP2Z471BQZHD7iBhPztjDFTE5L2WsybnViinl7ykIJchYVXbqtBCYGQzZnOl?=
 =?us-ascii?Q?rPM2IxcjpycrPFyhY16e+zlwDJQMV4NAOJhD7dkMCPYQY4RgSm0Cot+X4aak?=
 =?us-ascii?Q?RcnFPDUN45Pk+2V+DrqnrZUzjqeZCQOte53t+02Xa4OVawAhZwpPwBoRy7h2?=
 =?us-ascii?Q?wmaspMl7ZgkL7mCLqYHNQPBNqW5csVRUAne26SjDGdFS+aiUnUKSTgItVzxc?=
 =?us-ascii?Q?7wKo+iplvP/4k1JgOYxlA38q+pInXl3TeyBuOHf9e/We2LPysk2vX5jScUBx?=
 =?us-ascii?Q?EdxEiBVft52aU4+QbRygspMcjdqN3KXaQp0s27MBJ5qp92uZe3IrNHFjaVHs?=
 =?us-ascii?Q?tIfVoaKS78bewjOzHphKARv/xgSn9UzVHNQaU9Q5TC6myP+4muSn1cWvwdma?=
 =?us-ascii?Q?MSwrrx2nlOIOCQLu61ozROEwSLa053ZfexGY48ueGdhwX/wweWq/kens3su4?=
 =?us-ascii?Q?uHnUfceq4YJ7b7OwsRuKZIsaXp6WhbUjarH5m5gM3EYk04w6VB6VkamFPAp3?=
 =?us-ascii?Q?OHdUgBObgnYMbHABwLloAEr+yMwZiw43+Lhv3KaKb5ou9bmFbCx0QvE1mB1l?=
 =?us-ascii?Q?Jk8oW+osEo8EltmEdcp8diN06q6mz9C6+F0Nl2fR/RraAZx14LJr3TdtAzjw?=
 =?us-ascii?Q?fgp+T1aZ1An39f5V67qZ7tSlTeWHJKyU07YcT+EaqMwIczHI8UWptZM6eAXs?=
 =?us-ascii?Q?BCF/RQ+bIrMRsO9PYE7IUZuX+0Bh6oJbV1UYKPtnTDaKkcwOZAjejbLzECFE?=
 =?us-ascii?Q?NwHT7E6H4mmuw5NfAhGQXrRTdRn1XxA9YWmaDeDjIxojiXFQKP2I671VRWvx?=
 =?us-ascii?Q?RT06xoa8bmaAdxu4AOX68rDwGQbAA8lyPphGtqau?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70a3818-b09c-4ec9-d58f-08de0b3915ad
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:48:13.9180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoYr3sVr067Ppu64tG4ZfuGnKB0hljxrJNOOkj7XF5hpfSkpa4qfJ5KsgOo4SNKOwW+Eon/ItXD+D9fZHH/j0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10262

On Tue, Oct 14, 2025 at 12:54:38PM +0800, Peng Fan wrote:
> imx_scu_enable_general_irq_channel() calls of_parse_phandle_with_args(),
> but does not release the OF node reference. Add a of_node_put() call
> to release the reference.
>
> Fixes: 851826c7566e ("firmware: imx: enable imx scu general irq function")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/firmware/imx/imx-scu-irq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
> index 6125cccc9ba79cd3445a720935b5c0b276c83d73..f2b902e95b738fae90af9cbe54da4f488219906f 100644
> --- a/drivers/firmware/imx/imx-scu-irq.c
> +++ b/drivers/firmware/imx/imx-scu-irq.c
> @@ -226,8 +226,10 @@ int imx_scu_enable_general_irq_channel(struct device *dev)
>  	INIT_WORK(&imx_sc_irq_work, imx_scu_irq_work_handler);
>
>  	if (!of_parse_phandle_with_args(dev->of_node, "mboxes",
> -				       "#mbox-cells", 0, &spec))
> +				       "#mbox-cells", 0, &spec)) {
>  		i = of_alias_get_id(spec.np, "mu");
> +		of_node_put(spec.np);
> +	}
>
>  	/* use mu1 as general mu irq channel if failed */
>  	if (i < 0)
>
> --
> 2.37.1
>
