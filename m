Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74852045A6
	for <imx@lists.linux.dev>; Fri, 14 Mar 2025 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970565; cv=fail; b=eKSzoGXMDK32vmNn+MCw1dhRuZTI+Xx5zMuhYdrVQE7vZZiG+Tn/8UY3PSsRyOgFQWEH7dn1yNWnZ6npNKCPuKFXxT3wNeYRA75MXeg1dEOIPJzxaQIKvtZoepENuOHqMQcW4CF7tb+w3uhHajx0abwOcmY9+zexymqV0RKioOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970565; c=relaxed/simple;
	bh=nt+Ov9nZEofwjWbYHMAHx0l6oM1lvgzW75PxZZTmpi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rz+Y3mpaiuJaxeV0i1M43DWbg+5oJz5Snd2ANCfGH042XhXwCGIroFPqYiyJE14q9k0Nrm2GPXD3UlBJr2YJakCoYeVXwaxCkuazkIy6i0i1Q5I3Pl6NoBoNxqrYPFbjGhjyMcZHCWy+aR4C6NnQ9yI8NDRoQHQGYpd/NcgL1mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TvAFrcn1; arc=fail smtp.client-ip=40.107.241.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TvAFrcn1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rltCqj75cAU1Y5jwiWJdVNGv/k7/2UjUS+6XT8t92JlVuHCiTggJXAqcCZ/azWM4wP5hattOx9YHb3oGJGnUSC4AR6VrZWiQWbXIsksORT7iGlpc0OenhcjFZ8mqe5p7sNrokK2SwtKJRkSNe1w/OZH7GCQXAlUUi52sGn8lg+McGafvsl9mHP08u/+2OJR3skAO2yPBjUdX1g1C1hNEn++Z2Xrewb6PnIyc3KMr7xo8+MAMqNzFKRSkkt0Fj5QafU5HQsUhhCJHUaFUNfOYCCHms35HsNmv9WJmv4Xif7mNudEb3Uo+UoGwQShjtPF1VMM7D4nAJ3wUuTLLVPqwlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+41Fy972ig9KcaBu7s2U7q+un1M83nCsQZVooi9z7Bg=;
 b=L8eOwknf3hBioEHhhoMRNKlFW4pCKbghdJe8hdwWwnml0td75RGqYj+X2YWX7D7qDVT+fmM9Ky21Rs0acIsNHNbOjzSQKEkSGmhwGrHWTBADDZYE5XUwcwiGj+NK5mhUzn0gXQ4Y+PpTKR35CgX62am4HBUh40bxuY518l2wMWhpRakVMizxZgWN5VM5ilwfpFGRLiqMTuFFdMkWD7Kn0xjQ/U3klcrAhuLRIW6pAa6fNKQ/D3HnDOZdHswDXVRZIYVbrLQ1Wee4MsnEg6pIfVQnsTE8LJbZ7NaP2pZcHeRRmn2U4ie62iDZbV58Si+mGvcVUlBed/C83HxYl63mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+41Fy972ig9KcaBu7s2U7q+un1M83nCsQZVooi9z7Bg=;
 b=TvAFrcn1PrUON2/BdtrnrYPvSWM9f0vc7cs/KXWpRNavuAkkEWOSCEnyql2FTY8KzKozR1wmT1N/mSemfEGGwGAeg9xe8NHmZbMSSZLiyzu45azb2lj4GWptcjs+Rnpxj+DRsVvx0rTzFMdXZHaQpDE8vgjLvibv2PXtgv49ODgcCseKJRr55SAQSkcleVyPES1/H4xM0yBDTXF4T9b7K++om9Lje5lPocFNjE0YiGrolX8/Dz3Ybh653DeLov0iXVXwcd1TfGFY6d7JPD41F1cOo2T+yEhKOwt1cVKBuXFEtAja/IaBvAUoaDKFNWvS+8e1QNEWtKtmmCwBZfy0aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 16:42:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 16:42:37 +0000
Date: Fri, 14 Mar 2025 12:42:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com
Subject: Re: [PATCh v3 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <Z9RcdQbJYUk+SPte@lizhi-Precision-Tower-5810>
References: <20250313071628.729168-1-ping.bai@nxp.com>
 <20250313071628.729168-3-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313071628.729168-3-ping.bai@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a89c2aa-b90f-4d4a-fca8-08dd63173aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ntKFxV6+pfKa8c2bxg+dQW1QBVXdRAFWio4/MCER0FjIVP/sYkkz1TOsEwk?=
 =?us-ascii?Q?zvYecQAAxZ0oeH6uUcoQgwsNQg3xDzsZ35wC1YfdoJjFAy6rH6y1ntA7SwAe?=
 =?us-ascii?Q?T79dtIRIAK8LIJhFgv3/1iVJH0k15TpmC59RVpOdy2ugC+B1oPmVh1mypLxB?=
 =?us-ascii?Q?2pNJP7xC0vWcDMlqGDoUsKDfhKl9xeCzsdl4wFbqFrjKvJ6JHDed6+6qPgpp?=
 =?us-ascii?Q?gsusXLMSKVRbzh2mVRNLD56RJfJ60XvYSV3XyHp6IRkAvmcyc+kn2izns8iF?=
 =?us-ascii?Q?oFPCfulTpUWrGQar475I0ZRkJD1f45EPw3bYaoRGuUyOkrW1Y6mtlNh9xSZW?=
 =?us-ascii?Q?ZEX2u5ujnqdkSAIsrLtuq3gcWgvPIdx54dADC/q7dnbC3DQocpFUBCwO+Jmw?=
 =?us-ascii?Q?biooYSfMje30yOh+MVDDusg2Sqr3wPRi5vj+6zULfmCUCt0yWwa0V8M7EJ78?=
 =?us-ascii?Q?DvLejYiFQh6IXcpuYLz/WRY6zERCEGtvSaQb6fvCtFkZwjZfGMRfjCo3Hq/z?=
 =?us-ascii?Q?HIVLqughEo7P21rAh4P4aZ91fmVHyqPdzPW/ggrUvUVexKx7hVBN2nBLsdsn?=
 =?us-ascii?Q?DPLCxNy1bUVj/5XsRDNnDqpviBSrVLhEL/Fiz1L1sUDVPStRCGKZqM+OAvoQ?=
 =?us-ascii?Q?YsEze7eYMDCUsHELMU+CSXZD5oGCyngXcAHy4mxM/72SV5bkEwIZQkNnMBLc?=
 =?us-ascii?Q?7EP1vmVbDKFFy/1Gyf5422GQkiY2cLEYXzBS2tnfyL619XaOrvWUfLCMREoM?=
 =?us-ascii?Q?ZnyidafLtLUaKqLiRrv2N/JVisd68ZLYR24V/u9v/RthZWEoqMj6NHyXJKPG?=
 =?us-ascii?Q?iXSd9V3ttV9SeYHkqodKSbOpg65DfgwiEphn0zHrQUWi4PGNSimX1WcCliTA?=
 =?us-ascii?Q?JeyTY98Zh7n6b3jZMhULLBo2sVvTWb9BmbaUNJsp/jvS4pv9mDUy6t7OFj2d?=
 =?us-ascii?Q?KyPCX3sLbTq0FX7C0/V+Q9jBaS1Btu/K6rD971Co5FLgzZEYCjTQc4sTWemZ?=
 =?us-ascii?Q?KEtLsDNh+kDmh024aGt6G4L2/XnrmHl2/H1hGESSvCShn6OrZQxFOfRa5CYz?=
 =?us-ascii?Q?m2bctRlt+j3zv5+49ClMu+ly+J+8+xExnUomWOCsZ2pTQ+F92Zh/jhoWTV5A?=
 =?us-ascii?Q?JkThrNB0gGoBdN8tnqWwbivCKP/ZBHuulQd3jxhBsBfOYiqVEZsun8B7RgHy?=
 =?us-ascii?Q?dxPdcx/N8YCsPp5NtNXiB4V9z4MULuySxWdBGL6HjlcoIOPwpXmCub/SOaCe?=
 =?us-ascii?Q?cUpW+XrZ/zX7SaZpl1QPfIAQ0C3DGmC4lgeMu0/PsdHDlHN2JvMKvOORGWoJ?=
 =?us-ascii?Q?3RySqm9IO1vgWi/QKd7+E20ZY6s29pnFMD6ixF8StZxbmZKiKbwe3IJ2MoAB?=
 =?us-ascii?Q?L6xITGiiBH4IUy42mqXkAHUluJC8TFbYiD6QJZR0ELw0rMSvnjeGukTiUCcA?=
 =?us-ascii?Q?jFCo+/KZGis=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XvHL2BRNQF+KH7w1BN1LxAcj6fMNOXF74WwJRprodL3UsDU4TOw5MVay+cQX?=
 =?us-ascii?Q?w0yRR6nDxLNKx+aQ13R2hy68pmU0K8XHqzufGPX1F8VFARJD0dggcizjuLSb?=
 =?us-ascii?Q?MNFdt0HHrrMw9FqMxT1eY+XB8Lz3Wc+AI+X0UTd7kGLD3+hRa4qZ9FtP2Yto?=
 =?us-ascii?Q?tEHsUNUV/kjbLHVLdXHF3yiawnKysi92OUTeTNCbWhFQdgiq2pi9UiSnfOCo?=
 =?us-ascii?Q?eRhZ5aREFUWIkNRwlVs2NeAN6ODy6q+5Rfq+IPp54mrdvscBpfxhLwGVZMtN?=
 =?us-ascii?Q?jEQDtdtbV98YuWiyZlPQ/a+Nq/bZdk5lUeU2OLHRClgs6GRzOTDoquLT70GC?=
 =?us-ascii?Q?ZubAsAYtIQRPZvVQkoa8lbjnHnFPK6TFLwBqQSuIpU8qTcx7Ce5XqtgLyY2M?=
 =?us-ascii?Q?5kYzVn9HZzUrKCPaRk6GfWh2QBtB50n+vdyhHmryj/WOLEv6vwcwe4yxg8Pe?=
 =?us-ascii?Q?p+aLfqsdLnJhbMGNrc1LgOjc/fK2tsVvsd12Vn+Cd1F5I6w8+YlUhHkjVGTQ?=
 =?us-ascii?Q?WH9TKYzDxFSaOitKfKIzDpKMmXaOPld2sUZS1Y9xgcBNEN35+oThk8KN8hur?=
 =?us-ascii?Q?aOIfwmrJrYkJGJzIS3hKY25QvmKKH+2rFjY9Wv9Dm083D1U2MkixtUk2naFy?=
 =?us-ascii?Q?+C86IJsMdqjttZVt0WgGMyNNzkJQyMXOuo+EAgkqCkb58lF+UeuxxEX6KEO9?=
 =?us-ascii?Q?K2cL5lC7ncRjoxRXlZGiZLoQ96XF8SBjW9DRJPu48MRG3YYtQJ73zNwE3BVI?=
 =?us-ascii?Q?5ZhXQohCjiKz93f8V2FGZZnRJpEyGD4tli7OSaKUVaH3g5pY2VYEj4eJzrNF?=
 =?us-ascii?Q?KlCEniMgC6vl+bcmE+hJbf76/NCYjo25eEFpJMGHKpzHwS+a77Fd58Y4rqhs?=
 =?us-ascii?Q?fNtaDssrhPRdWrgPJK+T+fnVM0DLBZ8L2sItvr+JebX1KhLdWS1wxJvTG9NB?=
 =?us-ascii?Q?fK8Zdn1XNS9TSepdNZh6eqsUxrSh5zq65pCHN3lWXk0bl2lkmdmJXobIduEp?=
 =?us-ascii?Q?W0J8twYI6XgS7oMBy718JtFmTUYtZkrftKDI8ju8jA2gmhpuLywHPBEqpnS5?=
 =?us-ascii?Q?+ydvhz5eMqyev6HCagyvwiMVTIj8ngCCsCk+hMNqBxbu4teXoZWMZDZiGSvD?=
 =?us-ascii?Q?z9MXefKYwFP/X3VQdvSqBU2pEOmhHf4BL5WJyMHWMwhr43QCsBgKM1f1i6Cs?=
 =?us-ascii?Q?G0BdntC3/GCKzHO4YR5vAhCc002ojThrw8Y5E3EyRPzL4bqSffgBuzgGekEL?=
 =?us-ascii?Q?AkLV+9svwBu3WwW3Kjrsz6USOh3QpYxc0yzR+Xs5dSKDPc4FtSaQ7VKLMM1n?=
 =?us-ascii?Q?249allrng7m+HY54hQQrGF6XwLHuBvz4LlmNYWU9HXU5VMypWye0PLzQynog?=
 =?us-ascii?Q?XZ2Slmbj+K2Re0XFEuV7EX3983+7ZA2ktYQZdsbi6BVBBnF+u90rGV7jhlG/?=
 =?us-ascii?Q?MU32jkvXGMZAhZCCQQBUQSTfTh1M0i1BWR71HPXHrlQPFkDEWhUnTj0Yuxry?=
 =?us-ascii?Q?CNFG8jpSHrg5049qgJ8dLBpuSNYDTTOIO+RQ9LwoqvE6eRPijC/jxrTgh76y?=
 =?us-ascii?Q?W+IapB9ILMH6ifESifMg5tq3/LCX7jfcumEXwJe4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a89c2aa-b90f-4d4a-fca8-08dd63173aa8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 16:42:37.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wA2Rgaz1LdqSzJHk+vdVyH6k9m91Qy+J4tWp9zAhhIXP24YVPifUYVX/X1pKCa2Vrh3kT4BnnpL1TYU/JDmoKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010

On Thu, Mar 13, 2025 at 03:16:27PM +0800, Jacky Bai wrote:
> Add the minimal dtsi support for i.MX943. i.MX943 is the
> first SoC of i.MX94 Family, create a common dtsi for the
> whole i.MX94 family, and the specific dtsi part for i.MX943.
>
> The clock, power domain and perf index need to be used by
> the device nodes for resource reference, add them along
> with the dtsi support.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v3 changes:
>   - remove the blank line
>   - add PAD config macro define as suggested by Frank Li
>   - update the device nodes compatible strings for imx94 as suggested by Krzysztof
>
>  - v2 changes:
>   - remove the unnecessary macro define in clock header as suggested by Krzysztof
>   - split the dtsi into imx94.dtsi and imx943.dtsi
>   - use low case in the pinfunc header as Frank suggested
>   - reorder the device nodes and properties
> ---
...
> +		aips2: bus@42000000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0x0 0x42000000 0x0 0x800000>;
> +			ranges = <0x42000000 0x0 0x42000000 0x8000000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			edma2: dma-controller@42000000 {
> +				compatible = "fsl,imx94-edma5", "fsl,imx95-edma5";
> +				reg = <0x42000000 0x210000>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "dma";
> +				#dma-cells = <3>;
> +				dma-channels = <64>;
> +				interrupts-extended = <&a55_irqsteer 0>, <&a55_irqsteer 1>, <&a55_irqsteer 2>,
> +					<&a55_irqsteer 3>, <&a55_irqsteer 4>, <&a55_irqsteer 5>,

Does below method work?

interrupt-parent = <&a55_irqsteer>
interrupts = <3>, <4>, <5>, ....

> +					<&a55_irqsteer 6>, <&a55_irqsteer 7>, <&a55_irqsteer 8>,
> +					<&a55_irqsteer 9>, <&a55_irqsteer 10>, <&a55_irqsteer 11>,
> +					<&a55_irqsteer 12>, <&a55_irqsteer 13>, <&a55_irqsteer 14>,
> +					<&a55_irqsteer 15>, <&a55_irqsteer 16>, <&a55_irqsteer 17>,
> +					<&a55_irqsteer 18>, <&a55_irqsteer 19>, <&a55_irqsteer 20>,
> +					<&a55_irqsteer 21>, <&a55_irqsteer 22>, <&a55_irqsteer 23>,
> +					<&a55_irqsteer 24>, <&a55_irqsteer 25>, <&a55_irqsteer 26>,
> +					<&a55_irqsteer 27>, <&a55_irqsteer 28>, <&a55_irqsteer 29>,
> +					<&a55_irqsteer 30>, <&a55_irqsteer 31>, <&a55_irqsteer 64>,
> +					<&a55_irqsteer 65>, <&a55_irqsteer 66>, <&a55_irqsteer 67>,
> +					<&a55_irqsteer 68>, <&a55_irqsteer 69>, <&a55_irqsteer 70>,
> +					<&a55_irqsteer 71>, <&a55_irqsteer 72>, <&a55_irqsteer 73>,
> +					<&a55_irqsteer 74>, <&a55_irqsteer 75>, <&a55_irqsteer 76>,
> +					<&a55_irqsteer 77>, <&a55_irqsteer 78>, <&a55_irqsteer 79>,
> +					<&a55_irqsteer 80>, <&a55_irqsteer 81>, <&a55_irqsteer 82>,
> +					<&a55_irqsteer 83>, <&a55_irqsteer 84>, <&a55_irqsteer 85>,
> +					<&a55_irqsteer 86>, <&a55_irqsteer 87>, <&a55_irqsteer 88>,

> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0>;

I remember compatible is first property, then reg.

Frank
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l0>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l1>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l2>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l3>;
> +		};
> +
> +		l2_cache_l0: l2-cache-l0 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2_cache_l1: l2-cache-l1 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2_cache_l2: l2-cache-l2 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2_cache_l3: l2-cache-l3 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l3_cache: l3-cache {
> +			compatible = "cache";
> +			cache-size = <1048576>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-level = <3>;
> +			cache-unified;
> +		};
> +	};
> +};
> --
> 2.34.1
>
