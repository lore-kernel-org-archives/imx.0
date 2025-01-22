Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3442163A5
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737575724; cv=fail; b=swcVyED42pIjqMqtlS+BN5AVaRjmy6byG6ZqZKFT2k3Se06OWV8ZPedA95NWtaDW3VfVWgM50PoTmDZhdqyU5Rr4gFrrc/XQ2vRe+mL0A+GpYlgHyPv47fR+VPBSCI3S9qDE5vr4rsNmvrb3g6NCT/bguBWHiSnmvgkDN0KyarM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737575724; c=relaxed/simple;
	bh=xjwecHM0jqfir6H2JOiHbKHUwFSFNngPxaul+606FZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G4vK2UHQzImwhIULhNRbuRqgCBi+GIWRiGR2o3bpXSrY0yyRz/QcuzSh1XX2TRfCmOhz7UqAnsR7525nD5y5yOYDbTIzTQiyP79yLCWnvm3ms5XjL/AfB1/lBb2TZo4xn8EO3GiBtX4KWDpN5fGj2Pz0pgEPWDs4PQjzDZenrp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SjIgMV89; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SjIgMV89"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8lzeUIHIXhWTVBnjdDInn+c5lZ/xTT5ZevtE7nKdzJqx942LswB9a5pCuBUgPEs8IMokyFV8ccbldjz+mVFGrvqfJ5vhbgf48Re62uHOAqY22IukZsUbEAzbX+04IHDgmOeAW5mDR3zeg5BrEx77Vg/3x9UCoypyuwKFVHdDmyQHp+mAxHr+EPi6iWxCZRYNbeloMd2Hgs1DO1VMzlhUUByTpZulmLntOea0F27rodfC5DI1hBuJhnOQuQBF5/+3MBoDfNUnpNnUelJcDCWtHQVh+Y8umKpqcpfZKLrW+G98ROiuULZTbSVemiWP80RebBds+0UZD1H0jIpvrDTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bIzP/2KMB4uA6xE+lcz6SPi6zrG4UAOawX81+5Su8Q=;
 b=iXDfimcEZHRY5UMJMxSkMYN1nWy1HItHNpNuFj5q4ln4L1xCCdKP5ujY33mfYSXGPtYyX9N44N7upeOSq9CreHcYpyipsLqbpGih/jhC/o0cqt6GmqMnN9INJJO/ZkAtsYcVC7Xe27iiiIjO7wfiCXZvF0FIrrkDQpTxYcPFeM5wuChIxbTF/LlTMPE1Qu36qSGilDI+MpeG4Tb0r0mQdEnSECs1wVU0tStZ01GeNEjBqKysYO1b0Z9lB/8EqF9eZLjMQ/71LLXPHV+NgMBMiKS97o7sJUfX83ZzozKUi0tT17Q3Dif6UHB1idg8HxQvKmrdbVSxCBtUY8tLGBL50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bIzP/2KMB4uA6xE+lcz6SPi6zrG4UAOawX81+5Su8Q=;
 b=SjIgMV89ERDHOyMp+mAqSM1zd9ui3GTKcKzXM7vN5Z2lhYjiWw0aTrPXZzVWBIQhv+KdE/b/N+9lelgLzCs8OsD412uWgTPshHUiRNKyy4rKV0iq2xkThH3mxgINkAYEXQ3nSfbt+gpodB6B3TsK6iDdyjFXYwtwIiNph+5MV7A+xPujwdf0k8RCbT//LJeFpyJIFmxBEsUjjhbpU2uj7dCOKgaBmzrh7tSDFF2TwqTxYRufeaRZpSVKh9ahhCGm3ovcQxdC9DrPiNICP4BP5Z6rWFHw0FSYHohOnL7S/h8xVzuj1TZREmbp/mw+V/7GMMukXgYrkPSGBDBMClZsMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 19:55:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8356.017; Wed, 22 Jan 2025
 19:55:19 +0000
Date: Wed, 22 Jan 2025 14:55:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, broonie@kernel.org,
	shawnguo@kernel.org, conor+dt@kernel.org, peng.fan@nxp.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH 2/4] ASoC: SOF: imx: Add mach entry to select cs42888
 topology
Message-ID: <Z5FNHnwvN+KeUrFY@lizhi-Precision-Tower-5810>
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
 <20250122163544.1392869-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122163544.1392869-3-daniel.baluta@nxp.com>
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dd6066-ca55-44b0-1f39-08dd3b1eb2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aYy2OoLqZ7HxvokhsxuENu/KSg8LG64lJKdxF0q5P2VdtBc/3KB8oiQYUEH3?=
 =?us-ascii?Q?vK0HNYjnKmYg7a64X+ISolA6P2pubQAPHl8m38aXZvyFWfLdrrzdxRwQXbQ3?=
 =?us-ascii?Q?pL4834Akn53vgwGB79mKS7inT9UawsG5/Peb2vNtl2EaxJj8snVQkWh4fMJ1?=
 =?us-ascii?Q?xaOXdr3GHT4leTfk6Okr2eQcJPD4+SiEyh3Ud77rvPZoCzJQkGRAAYiTcku3?=
 =?us-ascii?Q?kFyUFXP1b1bl/aTQkQe51fEa8dVpJVz2zI7Eyz0enfbfvVtNBh5EiUIwjRVt?=
 =?us-ascii?Q?eAnYUohDZjPLVAZSaNX2CZxsmx3c1cCCdd7gRJdWPhNQKWbfZqB0o2R2tpPn?=
 =?us-ascii?Q?rRA7YsszuZzoK2KuQ5IRP6wPPxqtOpqQS6TR/vZx8ZOocsknUFAkxSFHqamX?=
 =?us-ascii?Q?NWTEOxjcINQKyAfGhgFSCabhEWFTog8/LNB4X248EbvyL4qpOsq5z57Ki0Qh?=
 =?us-ascii?Q?vT/ADPUDvKB3BawH8+QKz0u1LIE2ayqlbF71YeBfvNrqvGGN5q9j/zLnmGLe?=
 =?us-ascii?Q?Sd3WaiwI7biCM0TBt22WVg0qpcgKt+r7aA5QrP5RXZc8dtFmsXyt2qbxCjJP?=
 =?us-ascii?Q?I41UQgbpPgpcO+nkfEVXd+ECtEYjkNuKgOmf1XEq0nX+FfDAokJq8RxuKfOF?=
 =?us-ascii?Q?Eg3CnQxk7uyS57Xq6qYONPIvCSuDDY/MbjL5Yo+FE+NV2ovZP2iQk2k4uQ2G?=
 =?us-ascii?Q?yANQu73v02gUMgzZyRiidyxr8Ssi8XlWrbo+nUk5G53iQPQdMuFF4vtKMLlh?=
 =?us-ascii?Q?G4AdIJv3u9ivXEoxBLmxWX9TpVx+YVZF1ZMf7dCTPBa71LrfBjJVVTinMQHl?=
 =?us-ascii?Q?UPFGwDLhJJFczcB4s4xQZiXqfFdpAHB1+xhXji1PUIk6D2dXdL238HkWtNc4?=
 =?us-ascii?Q?wIqtmH9cQD9TSTPnTm5tgLXF0zibJ7WIvtcl1nSOwN/FKNSYGMYCMKm8GZhK?=
 =?us-ascii?Q?hInGJSdzxiqESwy5ATRQzzw0HDrdduYAa7xVCZF5D0W7WJxkW1lvPZBY8Cre?=
 =?us-ascii?Q?GWz8DSqXl9iggkcKHa2hPBp0u6kk9axcW83sxChn0RUt1lCV3iS08QzacNAG?=
 =?us-ascii?Q?B3/8/NwDJfMRbrZS3wt0AawXo0kOJ9NhSw/QGp1QQua0OKFWqvyx6gBwOAup?=
 =?us-ascii?Q?l8GaLxdIghXi6xXmJoZtrvZA3Kh2uiTcDpMxk8SGrimHRv9C2rbMhChq0ye6?=
 =?us-ascii?Q?Ce3EYtxRLdDiyHYRQtKp34OI9sj9PUcr6Qsp11IaymIYXm8IpCXeyyKZH4i+?=
 =?us-ascii?Q?XAQcgV9o2j6fyXFa6dw5NpYyqFgl2Fk0cpZspvhs15slTZUJ4wEyC4WXT4Ta?=
 =?us-ascii?Q?gxL7osoJDSJqBfmZIx6KaLNa2b7snQFMi66duzOihQKY+2eLm9IgPl192JV4?=
 =?us-ascii?Q?7N4leBX2HMM18slFbwZHN49LAidwau7SCurwCY3UMKXfoosn1cLwTGEIX5dH?=
 =?us-ascii?Q?L16mlyjhxgOWg0m/LkGSqLa4Sp18XQ4e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6eSudlyi81wZuHWeoBV0flwd0Qbc3zVA8waZequstPKQgEdSECjToKYq1db2?=
 =?us-ascii?Q?nWMbe5lPd3UcVnKJayLX5+wM7kw33uRIJA6s+u4AAytpqsJJ3bL/wU1AR8Zu?=
 =?us-ascii?Q?usFSgKI5qcEOhsTJaI12i/F8Qy9bq703SPsfHbAOPageWRWupOPqgmBX/GS6?=
 =?us-ascii?Q?RJg6/yte67UCXF0inXLk2UeDdTIz7eeogcIYWepGti2uwSgyO1A+ulCNXnse?=
 =?us-ascii?Q?aG7bp6NdQ5+OLpxN0MWxdMqevtuJo4s2TJoYpftiurzSdSzCISAiha3zhDve?=
 =?us-ascii?Q?aK18eG/e68NBfwBnsVmqOR1giXXWPbb49QpqN90x2TGJu+TyEdnz/856vZa/?=
 =?us-ascii?Q?ZAHLgTGITm9NFPDDnqVO6NChpV3SehcCFdyc/iUISYfjOtc9Sq9oGjLBI00O?=
 =?us-ascii?Q?G90mmCgcreSluL7Hp6+jV7DJdP0w4N2k5jWL9qWtY0QdMJM6r8jacwyJaqdh?=
 =?us-ascii?Q?rVcCmThfkO+GkjPBF3y+DNEUrVCzZgj6n7X6oRqDl7kvv7+Y3yWspA5g0yho?=
 =?us-ascii?Q?sA0Q7bgA9Xah0+EzytiuaRMOoJfMnTB0JM1VSAGZhCRj6VK3mS3HlqNA8v/q?=
 =?us-ascii?Q?Dy678tg6dUMWfMbJ3IOzNjZ4XCsEoKrEaVPwdjXmQbX7zZ3AfOa/bsFHSz5+?=
 =?us-ascii?Q?v8ICDsWQmyCfPQ6bQ+xnp2+ju//pTNZHlZGmP9pwOK5s/fGBRYdqtLkfz0ea?=
 =?us-ascii?Q?lHn4W96+TTUEcY9KiZbDNpBKXo/7d8M+J8N9qRqtR1ruJ1iPDSDHDKOcWOKZ?=
 =?us-ascii?Q?yoyjJAfN5TlYzX80bZ+dBCMHzabfgHI+X0UzCZtPOtxqfyCRBxDZ+jK4egXU?=
 =?us-ascii?Q?B82Szebl25zmQ/QQYYKx0MOXpDx1YIoajyOF8nMwuEevJT9AYacayybm0fD2?=
 =?us-ascii?Q?0442Mu1kWKbaGZGgq4I0GoMgFMz9GjBmquID5et/Op3D4YhHQapCjrtbqZXk?=
 =?us-ascii?Q?b2fM7TtzWWJ977vzJaihu6O1v456ZndmZWr8GLlVK+7hrSQPGDPCcp/jSSzU?=
 =?us-ascii?Q?OHinKLT3XmnrP7aaiY6wqmaILxEYbIS8u9P6mqYq32VTA1nyI9Mis6DDc61+?=
 =?us-ascii?Q?U0AN3OSGASazDo5bhohlNuYd6J7bnLjnL0Dnc5PZwHiJcoEHwbYRCN1NXNd0?=
 =?us-ascii?Q?xa+EXOuhJ/h1mxZS/3LRvx2Rw7L6+tQV0FMDR28YDNKq/+oBvOLHWdhx19Vs?=
 =?us-ascii?Q?Rui/9VY7ye3KeXJXCtgZCs+M8z1VDh7gHHvLrgsYjB3yJ+CVsYg/4cpxy0B7?=
 =?us-ascii?Q?e+H0VyFOwrwo7Q2VcVxWz/4oO4eaI21RVln686iiWY6SZZvlX66sIiVYXktu?=
 =?us-ascii?Q?j7g5j2sa7z19lz4uLZ2a4MOUK+AgYaDRWqvnrTv6gvBryW5HZfDQj4ZAL96r?=
 =?us-ascii?Q?BBqoasVfw93LNPLEUPnBZDoG5AjmgW851o8pQnCLODf+LP3yUOajiFlRyq2r?=
 =?us-ascii?Q?LsYLcq0PIeILFvO5vLeS6d3F8IlFiYNxAYbMeTK7mcKmIJIKevcPGT38GrLs?=
 =?us-ascii?Q?cjy+Wa28lkpwbmE82PoQo79ytZP4YdWJjUNFHi4xCfV5EeCZOAQKGt0zAMlY?=
 =?us-ascii?Q?AvtiwjFWjVRiBK2LrKd/7wZv8y+8WTztBgegKMW8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dd6066-ca55-44b0-1f39-08dd3b1eb2cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 19:55:19.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQ3Jq6gtPWR6zmk9WsPXi77qpjuLxS7njaMfgC65ElolAeXaL2QA4+mW1bZ8wjKEJtVU7GH/VA2nVg3+yjQxoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876

On Wed, Jan 22, 2025 at 06:35:42PM +0200, Daniel Baluta wrote:
> After commit 2b9cdef13648 ("ASoC: SOF: imx: Add devicetree support
> to select topologies") we select topology to be used by the board
> compatible string in the dts.

I am confused. why not use "sof-imx8-cs42888.tplg" in imx8's dts instead
use board's compatible string "fsl,imx8qxp-mek-bb".

More and more boards will be added in future. This file will become bigger
and bigger!

Frank

>
> Now that we have a way to know when the baseboard is installed, use
> the board compatible and select proper topology files when the cs42888
> Audio IO card is used.
>
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/sof/imx/imx8.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 0b85b29d1067..d6117a3d4266 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -611,6 +611,17 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
>  		.sof_tplg_filename = "sof-imx8-wm8960.tplg",
>  		.drv_name = "asoc-audio-graph-card2",
>  	},
> +	{
> +		.compatible = "fsl,imx8qxp-mek-bb",
> +		.sof_tplg_filename = "sof-imx8-cs42888.tplg",
> +		.drv_name = "asoc-audio-graph-card2",
> +	},
> +	{
> +		.compatible = "fsl,imx8qm-mek-bb",
> +		.sof_tplg_filename = "sof-imx8-cs42888.tplg",
> +		.drv_name = "asoc-audio-graph-card2",
> +	},
> +
>  	{}
>  };
>
> --
> 2.43.0
>
