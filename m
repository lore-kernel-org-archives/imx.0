Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714C233149
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537359; cv=fail; b=PNsCYwuECoQYq2UWBoPOyBzBfCy8SYzdWV6H+dOxuV8KXKoOryGV7i4Q+3GueLd1hMz4zK6e5krIVduOPAjZq9B09ViBzumJpzZZBHy25vXoosZrfyoOntz8CNGPDQ1CzTVoYMWRxW5++S4Ojm35+TVLGgzclec5wDyGeUV4y1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537359; c=relaxed/simple;
	bh=RCxFVc6CunYqQmaaQP4WTdB9WVAlg93I3uFea5dUOeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WcsoNXJUxtlla2NLESANo4a02GPzD1GErS/gWpV8iFRE8lLvzfL+CVExiF8BHwzUIDhhlZpPz5Na++CVboRHkm2I1fhAjJsrFD3dyWdGfwGHwsm9B/9WoSIDACLEvrHDucsbz8httJB1U2k2qHkQLYD7aZxboTPFZBV2b8mQ9QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ggDmjWpO; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ggDmjWpO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0XTLZEmkhcZ2Yz6Wq12kHk1FUFca/CKIvQj/lNjq+7jUqvOArJD5UKMAuV4Dgvi/yk0nYK6aeWhcVuaocLCVY49NSHmL8QpMR0N7tZIEG3P1zY6EuSFCraigH2vyg5ke7ukw5QDa59DPH2ImLR+q9aBTBCD/VJC7dagOcRF0YHFptgSAlXt9Q2skSMinLTn9YGXN8XLhhnVgvI5hc0bfkgcFGEON5WJj2xkoAS+95omA77HDfxPJgOLoKKeUR/Av4OsNq30UWb+NoNqRfRHuwt5jYaLs4b9t70pZa/TZgaBFNsJWefO+dq/n3XAHQNPl0RdWQymF/IIjIbcrrFERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7o8twz/MEZfY0KmMI9Gs8CQCbn/bO9zVI+J/Vm/pa8=;
 b=IetugBaSYPYzpG18+hKkcKCq1impWwjEi7tM/wyBWjIpkCsTLuJ3lsNEMwHXctuVFbzWDfLE9Y6ftkOyrwjvZvTnN6CIjwJlDP1XUWwE1MYZKIH6IVdOGW8vH/qAMSRw5IBmoI1BstoWQ/dQSXsFV0KES3P6UgGkqkFlPmb2MxcPlOOIB7KjUwGg13LTi02v43/A1RRm1yZqnG5kXTHuRjF2cPyL3+XaouzpNmkA6H2S5GqblSqA2QqVatTo4f/4ILhmnZg6cyPQPdgQqgVofj8o8ZhBCrYjo0wC3ojl5lHPp6CEColF3nHZC2ojU11mAIHDGsAut6raiayGcfTNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7o8twz/MEZfY0KmMI9Gs8CQCbn/bO9zVI+J/Vm/pa8=;
 b=ggDmjWpO2O3jXkEDO8Ur78MuL9toDqctai1o+9ZzEj/WEOkq8C/djDzIkQDqHPhifo2vftSth/nTgmHQTJaXWvKcwNdkw+8L6n2Ehjgbal+7B/BJ1L6/hAjWBWnLLwzDJw7b1qxPcLaAaHImAu37mSP9JaCgdCpQmW/uN7wh1YX9GQZk05dTC1AbImXbBG2hZpai1JIs9cHJKkZIoWPhGRr4PjcZtXBvqAQZVRNDKYi3dFfHITbYQvVFu/7f/QnTvXXwpJuskJFq+l+qMPl4vTlzv5K0vwozZv/l90bhOP4fI4h3KebhgH5fg6x95Fx0BqHAPgkC9+ahXwC2n8Qh6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10402.eurprd04.prod.outlook.com (2603:10a6:10:55b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 18:09:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Tue, 27 Jan 2026
 18:09:15 +0000
Date: Tue, 27 Jan 2026 13:09:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, zaq14760@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: add pixpaper display overlay for
 i.MX93 FRDM
Message-ID: <aXj/Qs4smDjoURoZ@lizhi-Precision-Tower-5810>
References: <20260127025740.2601841-1-onlywig@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127025740.2601841-1-onlywig@gmail.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10402:EE_
X-MS-Office365-Filtering-Correlation-Id: 0541a6dd-23cf-4fd5-6eca-08de5dcf2e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|19092799006|7416014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?34rHdEfWpilhmk+e88UR1Co+9jyKU4g2l6Mg7+Gdu9p6KrPV9nOgjTYWY7o5?=
 =?us-ascii?Q?JO+s+p7mG9gBfDyANcBxCyC2m08PFVarDkZvS4ovULbOUgOnDZCflPr04wf1?=
 =?us-ascii?Q?BCkAnyN1373GpnbScXtU2CUlkYSZ+x9EqUVMAWYKCZxZrV1VaX9lYj9Ushvd?=
 =?us-ascii?Q?VfqIG3ifFjvVgHaL31HWSGMSFQRMkGal8BtQDrQjFXuZF/nAb8YENpUAS7bX?=
 =?us-ascii?Q?M+iP95Su4/jtFmnaAXiSCIsdz4X0XeBF6FswfHSAvtKqqWOMa/2ZC8XBbgtW?=
 =?us-ascii?Q?6AwYPn1nIu7vJqAIB1x8Mf2ZxQuxjBUb21/OZ5UUOEqAzCGSMqc3zVXNe+ym?=
 =?us-ascii?Q?uCpnAvHEHk8TyLZo+HziJOQ+Y+GpKcLI7rVm3eu6oUh7Wp7C+NRcBcE9pach?=
 =?us-ascii?Q?+xTkwm015lPrKe4ysdT9rAd30w1ZF3xWmDRVZNoRIDb96BDLiXig1h8TEr1y?=
 =?us-ascii?Q?5fr9KEQf8HHkUd3CnXOhIyirUM/yOKirS/MPpyZbIYgiAqZ2qyfjo5XHdzmK?=
 =?us-ascii?Q?lVzX8/bac8NXmexSX/3dDkPLao5prZg6nE/z/Hk5k+WAqgZv+AdnhbrsFZqo?=
 =?us-ascii?Q?rCazZmelKC8ATqgOp3cPTq+Gu4vbG3enYD7UvsheH34bkUsMwxSl13IayTn6?=
 =?us-ascii?Q?zBZ1eWDpTnz5X90PMVrJEY6frfeey0OtgOJpLlxxNGYksNhSHSwv1pgisndU?=
 =?us-ascii?Q?2400uVE4fefEsDH00H1RXtQWvP1kMfDU0QiLc62jGoVOg3oDb+6o8loJYPBr?=
 =?us-ascii?Q?HvQf6pCS2o2rFUvBVg0YdEmPH5GzBam1BP9dVdOFuIZXHKQ2QOwh4TBpngyQ?=
 =?us-ascii?Q?AOVzxtEx8qUwj3GIZ9I96JdJjKjH8rzkhwXP0NFeZS4uqT6JBiCcgBHvGKFR?=
 =?us-ascii?Q?W9xaqJhUcDEIYV5hvUrr1Mo/TrPteByrZuqK3xduFRMTKFOiJ3vTB0+m4l8L?=
 =?us-ascii?Q?upD0S1sxE2CTUnUr3kbcM59Qb7ioUTaTL4pJ83LDxDFgDZiIm2gJv4R9BMW4?=
 =?us-ascii?Q?nlg761tF3213P1q5WBrysqqMxs9S/REG/ajnfdg1vfUV6lp5lB07O5RCq7Ra?=
 =?us-ascii?Q?YfHRQStLIXPnXrcQOhneroxPHrJAhvFONYhkTU42wk9kxLJTxteuOufgKtZL?=
 =?us-ascii?Q?pSa3YnJUNuFWS70gJwJxSrnJ9DZxh1aOJ0cQNfanEcJopDto5soVg6u1llI9?=
 =?us-ascii?Q?0ZXh6U0V9uiZLnehjomgbBZypSJhPFB8mRUmEBt7/qe3O/z5hGTY2R8rYAoC?=
 =?us-ascii?Q?Tz03jyxW2vaIF9dr5QQaUOxwxkpn+d+S5Wl1TbXoYvtAUvvfi5MLWTW4Rp7A?=
 =?us-ascii?Q?tlodde8g5ZU3u0fUYk1D4v/GIDn5of6W8ySnSpEq0QYr1EsUOhCozCABJUhc?=
 =?us-ascii?Q?hIW7MuEFnot4TgHTmgLQ5hjJJJrdKOcwav6RD+NW6wynKe+lA90ScUuCIES7?=
 =?us-ascii?Q?q8nwsSuGgJN9GRSyyli7ADngNfnQNF/UiAj8AKLxAQYnQMof+IkNVNoU8tX4?=
 =?us-ascii?Q?86jewH57uc2vt6aPyMMjvFyULZQJXBVqb90pGyba45yCA4zwMO3OAZhrl7Bs?=
 =?us-ascii?Q?rzcrjmCGwjP4XtnI/66NRG2fru6iOHQ38zcZ8jtOyjaGm+xGafMM2nOMP+8/?=
 =?us-ascii?Q?uOHVN09rYnBrgqk+JE65o3M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(19092799006)(7416014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gHS1vX2smGxyrY+WZZ8m7BiotrLaCILrl7f/qJuTG4xeA3FCipAZIPRog7oy?=
 =?us-ascii?Q?gDhf0y6hGt5jX9mPCpuyi3GydtHQkAjmHILez/ovxlBy49nRMyvC5UwQmLPx?=
 =?us-ascii?Q?DDQjLmN7O6aWUgC+r0HlEpMPESZJ+HaPwJCsVoEAbzBarekR43ntsnvCkT1g?=
 =?us-ascii?Q?8nVSb5hXnEqTxv3N4cMJ0IYJBKRKogYfF16QvO8Lc7uf0WCnM0YQZx4wske8?=
 =?us-ascii?Q?x6futHMMDUuQafhn7de5J77w9LkSi010s3pk0SIBQzaAnOAncOooa0CNU7xa?=
 =?us-ascii?Q?kLZWDlPY+bs6qqKx+zSNnK1hjarrvdkZG8s70sP5LQKYzQrgCGELgvQXxzhp?=
 =?us-ascii?Q?FQNrMcRusR8CJM1AX2MfjAjvEgEqK/6bJvBnw0RLC5uwB/yajD9FK4iWt19+?=
 =?us-ascii?Q?Hcecfdw8zNco1bq4GHkQkEaXEe3lGixSVZxlYkZVMMF2SdUdXrZD/4LpI7LH?=
 =?us-ascii?Q?XfBnxnBucsbwQzyu5tNsMXKMo9WqFj3xprbrHrqjchQEclGVJMGQXoJOKC93?=
 =?us-ascii?Q?cPsi01r0+Z5FF1nvB5BqypCebxTFlnCEmYJWyZ5UQyXnDJTG/+1sfEgtmbt3?=
 =?us-ascii?Q?i1ik2/+TWgbNTCS/BDIGPQ2AR/F8tC9Uz5a34o3aHEt3t/93EL5kSUFLrHa8?=
 =?us-ascii?Q?r574uOaPiJvKfn22Zrz/R4ZuPaJqlNSTEeigQsQuRvFxgeT/dd+6qOG+7Cs/?=
 =?us-ascii?Q?nyAZJoL13JONNlDB7ZpMMGmGfVAU7NLEhDPQB1VMhG64P5ucA1wjiTXGMMUV?=
 =?us-ascii?Q?bHs99gYelu71qgBurWzRVLAk1Y/pQwwooEfhbE9lQ3OsLc8IcsapEF5doZic?=
 =?us-ascii?Q?Q2DUNFzGS6M1SMwsLRubJKr0UcPlqJDi8Jxu5RVRqgdLlCmO67ZxY0KN03bn?=
 =?us-ascii?Q?X6/FizrLzEL/HkBrer5A2wyeqPtIjinpSBlgD+2ZuFv0LSOGvah8mSB6hhEO?=
 =?us-ascii?Q?L3z3Kw9IeZIjPv2lbHn1gItvTvjSjPZFb0cT9RgDRKCG52/JZJjdwqi98ks4?=
 =?us-ascii?Q?brvPkpoWUAOxwRdoEoFFTfYay2deixuEdnAflN/QN1lOiesuMadsqekF/Mcv?=
 =?us-ascii?Q?dnnKnPN3Ls1Y5uwa3XYHrzUpn2G/uKqydXrlAyg6Pc6H6nKVUe7x2I2xYyqZ?=
 =?us-ascii?Q?Nu/DZ7NsYNxsh0ElPLgEnmo5j6r7BuwmTdXJtCAM8yA+EWDdzy4Nxa+D5lSi?=
 =?us-ascii?Q?T4jTRlSH25qnbKg9tnGfu7DXi1oH06tDk2UfiSojP+QpqHojoFCGk78fnmYW?=
 =?us-ascii?Q?9FSREsXQf2aM4zUa7XGoMrQgNmkOhwVW73yIKAw8Kah78JKby0SzSFtzUz0O?=
 =?us-ascii?Q?U0qxjGBZeLNJvAlmuPrN+M8RA6qDi41g99+3G7T/kIQkKJAw6hH98aVus001?=
 =?us-ascii?Q?qLpZEuzqW1Gj+vHlrfkZ1ZUnFM6vFSYM7hFIC7rhXEqnQ4Y6bY7iyyhQgJGU?=
 =?us-ascii?Q?YJbpqKCaMrlkqMk3/a6PqOEVlvJCXd6c/hn8ZQ3vY83US8/kBmVW+WiqQtAJ?=
 =?us-ascii?Q?nXMsic90avC29suQDLKh6riaY4mMyHjlept+cxGUFOeA1w+Xgy6xHhYuCuwd?=
 =?us-ascii?Q?6XIZTa/7TMDCeIf3qVKaZghOsgp3+PNUZIuB6i5OTi5RJ0GIceyp7XFKyhM6?=
 =?us-ascii?Q?z/yi2u3FvzWnwKH9389k5sqvCtWDraDdaSNcdRZ7Wa58myzuKB8fAxBoJEgT?=
 =?us-ascii?Q?inLOU5N+8KGI/gX/K8Nf9ASoZK06WsSSTbQ5K3AXXZvndPhP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0541a6dd-23cf-4fd5-6eca-08de5dcf2e4e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 18:09:15.2910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVVf5OJQFiFfJ1VhgIXRDHahM4cA0qerM0mjs/w1UqYc+dZksFIg3Aw1YUO3hEmgRuhdJDyXmgJITFZMWCEnbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10402

On Tue, Jan 27, 2026 at 10:57:40AM +0800, Wig Cheng wrote:
> Add device tree overlay to support the MayQueen PixPaper e-paper display
> on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> interface and uses GPIO pins for reset, busy and DC control.
>
> The overlay configures:
>     - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
>     - PixPaper display device with proper GPIO assignments
>     - SPI frequency set to 5MHz for stable operation
>
> This enables support for the Open-EP Community pixpaper-213-c module on
> the NXP i.MX93 platform.

Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.

>
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  3 ++
>  .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ce8f937c2315..fedd3552b577 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -403,6 +403,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>
> +imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
> +

imx93-11x11-frdm-pixpaper.dtb, Keep alphabet order.

>  imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
>  imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> new file mode 100644
> index 000000000000..38e0c5dd82f9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
> + * support on NXP FRDM i.MX 93 Development Board
> + *
> + * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&iomuxc {
> +	pinctrl_lpspi3: lpspi3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
> +			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
> +			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
> +			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK*/
> +		>;
> +	};
> +
> +	pinctrl_epd_ctrl: epdctrlgrp {

keep alphabet according to node name.

> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
> +			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
> +			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
> +		>;
> +	};
> +};
> +
> +&lpspi3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	fsl,spi-num-chipselects = <1>;

vendor property should be last one just before status.

You can use https://github.com/lznuaa/dt-format to format your dts.


Frank Li
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> +	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	display@0 {
> +		compatible = "mayqueen,pixpaper";
> +		reg = <0>;
> +		spi-max-frequency = <5000000>;
> +		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> --
> 2.43.0
>
