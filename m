Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2060.outbound.protection.outlook.com [40.107.241.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0F19C56D
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628451; cv=fail; b=HhQ43oFz276IgB1xxZjQlDIRGLjTIsXrc3iujycl4MebCjDDYNgyELhuuq9zeXOwUHOlIfi1mpPrpTyM9R6TvdfvtNtXwf4WOMT9FeGhi5nFgIRqe1d1rrrKP6V5ORXVvcWoA8Kj0TgSdEka+MoRT0FQh9OTbvkxO8d7dtYtJPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628451; c=relaxed/simple;
	bh=7zZ8mvpscqKCbfk5vCeRQIvGIj+sWe0ngkif/CHHWCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kN97XImTyEpMZH4QF/vO/RdTdgkOWHbjA6+OTM+JV81ptjIIDRggTrDThLPiWp/pWHJrkyDK3dv292L7lfImy1zE6hN6NplD6/UEbOZpQ3/V0x9Y8KDgFO1EsT1FRTXe6Mu9g7zRw8/aJGFYpsxfPOfS6OmjjknJ2fMJzMiVr/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZDbDXRRd; arc=fail smtp.client-ip=40.107.241.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZDbDXRRd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enFskVG3qk+rxw0HN2gwoqjuyjo+1ZI5F6ZUI/ImnL8IL/TC6jzubaKKuOqol9OYHC2cSasqNQtj2CE+X53DFmX8oRGp8P+vdK4N+snkX/ukiXhjSsUWKBciT/DmjI0OpLkvKtCkivAGMRk/8Dz3I79fe2ZMn52cYQJ5if5ZyAJ38uBCBYJNuefKFVgdOazzDHeO3+6qfhEoWXG0he2H9V/bS6G7u7aPVg8JI3W5s/odrWs0PQg7fjnQTM7MiUizBompF34vSs2iVS6gRXEnZ49RaBUCYdmcTx9TRwNT6N165wJ3VHcXgEwjSPjdQX7GNsCH1lYZH63DAMtTKSzuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfsOr/l/ydBNIawpPhtF2+F+V5EqcG++mDno9DRtca4=;
 b=lRUdoHIfDuNyiC7/2ldXM4fJNv4oKLmf/ujr5wbgth8Vt05sX7wqCMhvlyYIuNi1xsCaNf+lBoAzKcczifRfPOEbGMj8eAUVjGraB3JWeVudMQ7XvOIQ2tYaGo3kUs2niY1NNf16hZzlxLN92By7nbAHdMFkApNOg8Nv1qVK8AChErMDKysmXI79cwEySkqaj84hEetrueLGpVCMmQNhYd38h8NaRlN6U3MmM2x9+HUtPa0B7sWy0n/r+7+ru6SaS1JuFOhdTW7XZKYukE7ybaxtoMYVp3qfHHhy8x5lj6ISRe0hFA20UvS1APv14VVrarXhZX9bSp4C0d/x4GOF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfsOr/l/ydBNIawpPhtF2+F+V5EqcG++mDno9DRtca4=;
 b=ZDbDXRRd68msPrnuOQtyMlQsi7zXRqa+qkYNsNtl/wgzFpVOm8px8BaLTv8NbsyiuXMrL6DOntAmHDW1Bw/ulbxv2Sd+zBa8BNPMmENxy9IzymQ5XaQs78gLIeMwD5I9EwLp1K8Lh72Gf/F8aKisDINegXPm+6BCAlwMO1UxaX30wBrnFmhEKpDnf6aqgWiSM+jHBV6tGXSKP1emjxYsDgdx0rW9FoP5fySuWVjpbCoZn94Ml6OkudM0hvWkd2ad8JMylZ9T0XiG2FaXEdjmeqQbK4jzu7A6eGlGMynf70Fjge95jcv3hhKUpcDauzrPdtt2ZsIlWwX+fzIOUivwnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9139.eurprd04.prod.outlook.com (2603:10a6:102:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 17:14:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:14:06 +0000
Date: Thu, 19 Dec 2024 12:13:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Message-ID: <Z2RUVK/nj5Mf8hVr@lizhi-Precision-Tower-5810>
References: <20241219-imx-ocotp-v3-0-b22371098071@nxp.com>
 <20241219-imx-ocotp-v3-2-b22371098071@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-imx-ocotp-v3-2-b22371098071@nxp.com>
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: ac32f650-bc41-44e5-e6a2-08dd20508b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wsifyr/t6P8YtG/E5lanzOydPeJ43n3JjCdEQC5pRJLHkBwAgQQG9r1HFslJ?=
 =?us-ascii?Q?GcDfCQ62wwtLOi5+g/W2KWmim+gxEl1nQU0mMrd+b9BrGMjbsMmtXwGLHX7L?=
 =?us-ascii?Q?Mas634wBxo0ywKcm1QtTAV+k3vSKo++L3cP2IefUu8cM+9zHK29G7rnQCUOi?=
 =?us-ascii?Q?S+tj5k6z7e5qJ1aDjMGaQ/KPeVExUj6j8hBmz2MehrtD/OUjAwOxU0GTRy3X?=
 =?us-ascii?Q?L6VC7cxzmfXFfdu3rCeisnhYl/hIUpMPb+wcCGWKr3tLrQLX2N7d7Q+AN2cn?=
 =?us-ascii?Q?T2pVzO6vUJuV32xe+rFVJoJ5t+qULBigmeqZ4kjkLnDf3eq2DS93TotYAY1x?=
 =?us-ascii?Q?4deyPrBGVDyy1UCvKgjMt+1vIY2rN2lW9sbZzP2YIpqpP5KP+i+g6v44IPAd?=
 =?us-ascii?Q?XvxCCLUP6sD3Md5FG+kBuje2BweCDt0SK82F9QhleIUcA0Y1h1R0AkqLZydP?=
 =?us-ascii?Q?uxFy82VenW8V2yGDI6D4PZ90dzUhB8v7Ms5bJzmUEqRsiSj7JzKxU/+VYWrs?=
 =?us-ascii?Q?qH6GdnHainIRaUunAtReUrcoSK3+PBAfBVl5xZZ5uC/RVKvFptmnStuepE4O?=
 =?us-ascii?Q?YawWjxQAI6anqlpdv3TcD7B2hRov626JvGdrQWuTYaBJPzOJLYtxxXs/JOH0?=
 =?us-ascii?Q?oFc4UJqnmbxgVcO8qEsXZw1m0ld73SmC4bdjz1/8hVTYVWQ/GgkShMTds1cA?=
 =?us-ascii?Q?azHSiG0tqzE5q/qeZdZpUrBK0wPFMwprK69nj7bCSGcKN4nfjPzDV3W4CeID?=
 =?us-ascii?Q?NrmYDapmLksSmJKM/mBUZA44pj9BXT63Ju4AJj/pVVKASOHRctl31T1Nvkbj?=
 =?us-ascii?Q?QhTAPC3FtmbGFEJW0e2x1dAdMAJvxcaPzjkg7cbipvapBnIf8tg/6ip9sFO3?=
 =?us-ascii?Q?ezi4yKKQnP4y5BoUOIBEVAcAfoUuNm1OuDdhn1fcqQLjPQNeryi54TtFGKzo?=
 =?us-ascii?Q?LJEuwCb2uU1dvQ6bVoIwuob1whg3jCwk6+WNmhdUUfZ29hUyqRmhAkXdlKwJ?=
 =?us-ascii?Q?DmaicUEKYhiGKT1jXkGQ2D9CvF+iVDzb/7tzwEiaHAAP35BqiD7bYDsJiZFF?=
 =?us-ascii?Q?tGiAsi6wBCu+fbZ9YhPB0qe1IME2ZjgNVbkb8lvFnxuY3rXubGhpkka6/FH+?=
 =?us-ascii?Q?W9TMIvJQd7l/GuYaSGTFKXdtCNvQqCHCLnyuAWjxbcGqbFM2B2Hp+EkYHs6B?=
 =?us-ascii?Q?cCD/hTU3bF1KB0h5dBIdWhsbsmL4diGZyxuLC38pV2zQ+RE1SEam4tnil3OT?=
 =?us-ascii?Q?KarPD+5o9qOA4ymY0uP9SwwMJcRL4sq92XkJgr0AXBW6SDZwieaX67iY7BoS?=
 =?us-ascii?Q?wzQNO6hIvBAA3sAK5jlkEtRniWsE/PoJmWLHOt3/MVV+3PYvPODVNt14/1kv?=
 =?us-ascii?Q?oX9d0JzCWmXsqyuVXYckb/UTYkfchHlMhONtQJxc0GyfgIN7NaTaI494m2wg?=
 =?us-ascii?Q?+xtIkPXSqiyNpQdDqqBpBwUM1fbshrnj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DgLbmIY7bvcy0EGHXSOkvaV1VVp7I/fe6yaaawxfI+V3BO2hMtC/72qgo4Rj?=
 =?us-ascii?Q?Jc/HYAajHfOpctgXFo4gEKaOLCWX5rAl2OQa9s7/9tL8S/EmM0PVisN0xSue?=
 =?us-ascii?Q?2Pq4QEAcnxgUY0pX3py4Vx9AcMvR+8DIYBFbwEzLgm92Ag72ZHAkBUSiOUn1?=
 =?us-ascii?Q?7V9LiaIOJH1QnRjpCD29m2X8DyrLfolWyy8AonAU36ZeA71RZRAR8EK3QOfu?=
 =?us-ascii?Q?e0PpWYsjaghvv8XP9TsF0v/WoDvvyrVISGRkTnUS2uP5uglcXi6HJ5ixi/OU?=
 =?us-ascii?Q?gSuuUomeiIGh9s6VXzNNjouDFYfl25UNDRmEuFFMz+YOmv4oFsvvHeVUEqZh?=
 =?us-ascii?Q?BWNmQ4IVtOQZ/LZQMOwMg/owMGIUNfnAfrcoUdJviUC3ixd74u755CNvL27t?=
 =?us-ascii?Q?z7wUbd7ohHOxdNnpPpWpOObNpzZbuLPyiF7tdp8Yndb2NtdIwnA4gLQOXRmy?=
 =?us-ascii?Q?F8z7ab2ld7LumG4aRL6NqcUGKNWpnmxQrMdELkp+ybb9amUTP9g+dwwuEhom?=
 =?us-ascii?Q?UljVSraRMR9NQJTVMFQ99TjrZSmMT6hfUuuLg4zvuTGwGz75RJQdq08z7LYJ?=
 =?us-ascii?Q?eedrffbeOO9sJ4dfkH/cqDMp7Kdopaljs4OIXpeoEo5txEciRFjKaX2P2za4?=
 =?us-ascii?Q?ip/JcLMKxgwXS878dbIJ+89vTw19tcTyL6oMRsyU48sJ3aoXSWIdL2bydElj?=
 =?us-ascii?Q?HSRjYS5OLj0n3fmAY4x/DhomBUicDny+IbFvLEVcEgGaEUgLAr2GxZ4yz/JP?=
 =?us-ascii?Q?SgpE05NICCBhoEWrKczoG9WSiIY+lx6GRG6sDn42d348pdG0+tnm/uzaSkwF?=
 =?us-ascii?Q?1wEBnXnQddCF93i/x0VOsrDxJC7kbzZgak0Oik0spMdiiORZy91Y57jgX1ZX?=
 =?us-ascii?Q?MubqwmuQZ6WZ+SY2qbdngfG26R86lG/JTDtqbWf4PgOnBtOD6NYB5ZvgqJT6?=
 =?us-ascii?Q?f23BrymXD6vpFPMvbCpjQuneYzUV8VkfLoqOtPCYDU9H/YImBM9EQN2p7Q96?=
 =?us-ascii?Q?mgXWap/Jct0cVJ79YyI2LfV32vws/IeSD1mLxHt2GngovQKrB3GbPByFKX3x?=
 =?us-ascii?Q?To/FNtqfjfByNf+57SPuIMb7tO5GUabh8lrfjV3f51cGzNpOENnd3qP8kHCB?=
 =?us-ascii?Q?dWCS0pIS/VzUEEbhyemqcXWuuQAKFGqpNbC97XYpm8QYUQujpl5YeQXNF+L0?=
 =?us-ascii?Q?a5fyMnMHlqO6zU2gmrOK+NPCB2vBWwu1kb3dmYlDBnXqvNS9eRrhq9sq1goC?=
 =?us-ascii?Q?MbBX5Nv+oA8paPgXmhWMYi5D74ep2A8B1mfRogaHmuMajL79MHJNjMwjxmNp?=
 =?us-ascii?Q?RcGo/aTJN4TS3153Kzdc8XpmaSNY2Cf70qN1Tq67QbEpgPB5oVvjbDFe3RDO?=
 =?us-ascii?Q?n4cCQmBnlxMlI1eajSS7kf/2Wz+caN1hX2Va7wk6eYTd75c5ArM/GbOCucn6?=
 =?us-ascii?Q?KHO57S2wkZcuRm+3DKLDU3P9J3c796fW7aW0K7s3kaFHU5Dsqm48+ucqKWCC?=
 =?us-ascii?Q?TZlPsoqrJgI03GT/SBGifLv6B1Z79bVAYK2qqCG0usK+5GpVXL2nbaFBjPhJ?=
 =?us-ascii?Q?uiIBasyPvMSX1oP2/P2o2QlYksCYg+YR4haxg4kx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac32f650-bc41-44e5-e6a2-08dd20508b0b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:14:05.9684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxcCeCn612zpF7YvVG0hIKqJaPAfubdzjQWOuQJNRUifU1LiErFIBgdwTlHv55fC6zTFwICnnBgfLg/yKXTVdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9139

On Thu, Dec 19, 2024 at 10:25:18PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX9 OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>  - Introduce ocotp_access_gates to be container of efuse gate info
>  - Iterate each node under '/soc' to check accessing permission. If not

Nit: Iterate all nodes to ....

>    allowed to be accessed, detach the node
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 183 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 182 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..173863b1fd7de150576b78f03c256a151b174389 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -5,6 +5,8 @@
>   * Copyright 2023 NXP
>   */
>
[...]
> +
> +	for_each_available_child_of_node_scoped(parent, child) {
> +		struct of_phandle_iterator it;
> +		int err;
> +		u32 id;
> +
> +		of_for_each_phandle(&it, err, child, "access-controllers",
> +				    "#access-controller-cells", 0) {
> +			struct of_phandle_args provider_args;
> +			struct device_node *provider = it.node;
> +
> +			if (err) {
> +				dev_err(dev, "Unable to get access-controllers property for node %s\n, err: %d",
> +					child->full_name, err);
> +				of_node_put(provider);
> +				return err;
> +			}
> +
> +			/* Only support one cell */
> +			if (of_phandle_iterator_args(&it, provider_args.args, 1) != 1) {
> +				dev_err(dev, "wrong args count\n");

you call of_node_put(provider) in above err branch.
why not call it here?

Frank
> +				return -EINVAL;
> +			}
> +
> +			id = provider_args.args[0];
> +
> +			dev_dbg(dev, "Checking node: %s gate: %d\n", child->full_name, id);
> +
> +			if (imx_ele_ocotp_check_access(pdev, id)) {
> +				of_detach_node(child);
> +				dev_err(dev, "%s: Not granted, device driver will not be probed\n",
> +					child->full_name);
> +			}
> +		}
> +
> +		imx_ele_ocotp_grant_access(pdev, child);
> +	}
> +
> +	return 0;
> +}
> +

[...]

>
> --
> 2.37.1
>
