Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50B32ABD0
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738275; cv=fail; b=klNZKu4XfWz0tafe4B6CPoK1BWy+6RNjMqBXgFJbOO5yAS8O/F1qjQQL00qYnknsY3tpSMHHvHfPw8y/U5Rzn3pGP4p16wlv06qdVDHNEpZV4fpB88paP4rVN6i1h0ibF0xsPSyP1IAeHWVpF1P34QLc8ZPmcvlTZjUGGmQZXhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738275; c=relaxed/simple;
	bh=CAm6jyBLeKJCNKIgHH6fS1Q085zcHeVsZaUrC5k2jV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PHDbE1Du9O+FaCMT4ufJ2HhMVNgIxSC0xxiqunkiCvPd/7kBPWFEssYtw2lsZlnU2KfCEEk1wnuBqs9VW965Zodn6Jduesksu2BfXu2sgKJGkYWu6akEl8K7HlEIXsPKf2tFR3iuAxnBjwMKgqa8SXjGf+9yhFVuUXu7/2TQR/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FDaGO5g7; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FDaGO5g7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klyRxz7XWQpaQorbm/DkgNUJP7Yp7UAtZA2SweNNvXtxjZbUROtIWM3l8lzIM23ptUIgyUyw8SD0dDcX06Usar6iKSEV7ZPh1Qxu3tD4WmvACvpSuGJCHc32mREsZQy86pl0HozCAuMc+6woZxVNtSrgPQflVKcI0PKvb84TyjnFRsyfii9g9redMHr5FmlOdNIWtvUCAVgUuikKUA7yvPjICq2oOiUaJkDSKp/o2xyeUWneyrrOxI30DBAvtBY3955gKYWeJf+HN1sv4WCJzAlM3xUQbDzZSsDeQS+KjKvnMQS8pkjpMvWremJAAFhqJKQLWBqM/qLxKq+BO3R5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKbZCFKQGgrQMbgBnUQLdsjsAvW6bnPHVCw/34hdwmY=;
 b=RTHog3GWvYSO+H8lJBlXJ1kuazSgTLDjz611QM0c6Nqa6+Ka7d/9RA+1xh9sSXppqqc0R/VSla+liNh7XBpBp+XWuwSdObZZCh3mqo+8PcMdoQoOmST794zIo8TNLOp/W8+sh+3pUGQ032RWcAIJ5qPvEIfEDizjEdbpk1NWb1DYm2k3BS8WrwdzPdfLxdg9P5Ht/mXUv5ctqLOkQvE3z/NuaZra+PyYi8v1erJKhU571znGqv/c92ua73c14S/hxNwgv09uWiSx8Dtb5CWXNPasC2Bl1JAHZh8myORV4iiWRrfHHKuI6fn9BLGDd4JFgG7uPZRUGc8s7YfW3+ZGIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKbZCFKQGgrQMbgBnUQLdsjsAvW6bnPHVCw/34hdwmY=;
 b=FDaGO5g7w8zYFKRMgMbsIFS/n+zPhweUR3QEBW1YLeQtTyCk32IjEkrBTAQztlHQFVHrE65kxsNhEQ3VgGPdH2JJNmlRxmmVDvRY53ohDRwIA3GT5eaPKRfTRRKioNy/ab7U8MvVI5e61t7RK4Y6HA2F2fjW+zk0Y8+4SWQQ/ATMJvIJIInJmmjr5bzeqtwgNzK3nEbZdtifxcU8nPDGt7rT73qDScUQEENpy47ozHj8nMPXOKmY2LH4XXZk5IlwOmTNh3ywo+QmPvPQcw80RpYXFPd4dto1HLbJWU46Au8Pb86C0m6WAMYTpg00AuM9IisMUcx6lvTcnqzz+GMKfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 15:44:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 15:44:30 +0000
Date: Tue, 10 Feb 2026 10:44:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on
 i.MX6ULL DHCOR
Message-ID: <aYtSV8oynehECLPM@lizhi-Precision-Tower-5810>
References: <20260209170739.22379-1-marex@nabladev.com>
 <aYoyrqV2lSJetls5@lizhi-Precision-Tower-5810>
 <9760a129-ee03-4556-b98b-2625739b21fa@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9760a129-ee03-4556-b98b-2625739b21fa@nabladev.com>
X-ClientProxiedBy: SA9PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:806:a7::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: d0023f7c-04ae-498b-f7d2-08de68bb476b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A38g+xzgelhFuOavtzbv/O3sDX037u435j0tTm77xkBXUyeAILnAu9KENIf3?=
 =?us-ascii?Q?5C9EGOEPRCcuoKRfOBh9gtCirzcDk4l0qceMo4R8jUKqUsjnMqu0yZEgml6d?=
 =?us-ascii?Q?aqC1keMn1LJleVYWgtvn7V0PXOMMcfQ6VqLSG6nDcurQImCmRQjQHmhxvZjF?=
 =?us-ascii?Q?NqqJNakIoAic5BoLh/BQRQkrKqQEBBA4Bw4pWxC7CfJ0xMil9csM+OFHL8AG?=
 =?us-ascii?Q?FfsyWLxgn+kopuSfxEo3MdJg8DwouR4zcZog8dI4PaBBguhtTZoWs5JqL0tf?=
 =?us-ascii?Q?ElU5l4tvUdoB1stVfbIzySs2hIEeQULmUTVNo7PD3mob3pVnGZbJhTUEfdpg?=
 =?us-ascii?Q?yXbsyDxO78YtMBIU9uz/1F1J9ZTIMCyKlO9/ZPqBvuaZKIuQn1Djmorpf72Q?=
 =?us-ascii?Q?EC0wo1c/a6JDIWsprUii+E1vDUZkYXAcwrCrSqlj5BRvX3wsjfeU0o1xY7My?=
 =?us-ascii?Q?ym/WouBamGLk15gjSXj7GZIbef35C8pnJN0ARkyrCw7e2lL6CcqIJo/Nki0u?=
 =?us-ascii?Q?fPOIFmvaiNwkWSZ0+twpPtRxGSQthq0zqP4N6C1LpdfdEg1tlYYNzxnYaUo5?=
 =?us-ascii?Q?wQArJQVe6zZuXMAojXCdiYpvwXIuDACEZehGZ1R2BB/rgkuwk43Tuy1OHoDq?=
 =?us-ascii?Q?ZvcJ/hoXHj+ew9+pmaPkfa/kmPCoLb48QUl6D1/3uLbkUVO4CZJqqSI/yUl5?=
 =?us-ascii?Q?R2DyBLvlYcIMwWkghJcwZm5IBBXdXA0Uq/3OxZtKlB/nlBeQ/epRhauKs0Nn?=
 =?us-ascii?Q?wiKnDhmB7qs7YhsWNpBtFPvly1OPBMtLrbJgQKAvMpLyzh+jyeJcgbNk8c/I?=
 =?us-ascii?Q?55R5BUGcl+cehaLhwlqpwzykU4tOlYaKEy1wFW/fr4AVrMuYniSoaw7eybA+?=
 =?us-ascii?Q?Gyjv2cN6cM5FxZIZctEjX3kLsAAs6PglmQSPJKESXQcbIiaSIWP/fECiNifi?=
 =?us-ascii?Q?YF+piyowrgAZjpZ+pdFNT17/E2QqXDR9w9lXtDp6t6yqfPKD3nJTHJ/ROCrv?=
 =?us-ascii?Q?y1Y0S57bukf1o/tRrwN8jTl+auPaCD7LPV0hHnaJTk+fpg6vLLjIuLgMnzoL?=
 =?us-ascii?Q?E82azZxCsyiQMl7LQKZpHmYMAiZh8/9gWVpkB21k5HN/HkHCEIaCXSx5ZeHo?=
 =?us-ascii?Q?5YbwTjpIrVSY9QfJ3t4qe3SjYe73QTCOPwm0+NXUSk00wqJ85Tf+ypYJA/dX?=
 =?us-ascii?Q?3Mz4uwxApHGfVn0f3IeRLERlGiCgHdUZeas25mDhY+9erBqrGu0J7i7vgfBm?=
 =?us-ascii?Q?gQ2sGFvH3d9HlF9Y1MfiKqN5DrWenBvWMA9Pw383td4nyyNLU6cJYNmKr2V8?=
 =?us-ascii?Q?WBWr9TJDAgY/85TW1Y32JiKIljpkk+XqcIVBGVUhlMEIGJ0kJ4DlwD78y54o?=
 =?us-ascii?Q?R1JF6rhmSx6dXtcCS+g5D4pkrr97n3jyunIBC/FSzu/tPVPeCm5a6laCqSw5?=
 =?us-ascii?Q?40hjmDt+9efJNhn/VWh/iGyP5L7TUs7jEsOCdg29MSwzJHsq2xYVQYfqyw5T?=
 =?us-ascii?Q?uLfUWVQgZegwZh+CJWu9EcAk89tkPgFYuBvGCeXLNDLkGvQvsh0DgrMQ0ntf?=
 =?us-ascii?Q?VfbfPXa7lMZPVAuAsXPFt0OSdptzYqFgLZqTW8O0+Pnh6lQlO6DKY695sqkO?=
 =?us-ascii?Q?1XgPxzI1yTM8+pHvC7SFzHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jyT6spHhswXXt5oZxdl3SIJWZEJzohr5TK9RTw7e0kVLmuFAJ/S6T8w0MI4U?=
 =?us-ascii?Q?Fsg36NJGg8Sagsq21BUR5NMMF/OxfFmhhib5S9QkBw8CJQUriub0dk/Fbrfs?=
 =?us-ascii?Q?lDpxRWQ+i2IZuiGcL27l9xjRRqMHpjG/k5zWpMLWBR/xpAjPKFRJcXiKFgkP?=
 =?us-ascii?Q?W915lZPTAPz5SI8adgYq28RY2S6dgIUfLfcUptMXYpzn7zEXEsV8MMok55xv?=
 =?us-ascii?Q?+GI9wF25C/GnzExrIw/PIUBZC4PEKV4JwP6TbjLylzfVDL0UAnX6eP+wiR5e?=
 =?us-ascii?Q?Y3zesuLLXxlrAvh2oEAfbdWyxsydoVu0xc1DwzXMvGSsKT9RM/CyvHBogt8O?=
 =?us-ascii?Q?yDnB0XMYy1DCWGtFp/Bp+SD5vaQutX+glkvL3WpV9CDXU+/XjqL2b9RfxGvl?=
 =?us-ascii?Q?olVG2GE0p0uiOcR5cYgbaP7vb4UVJ7dXluUBQesRiNUYbBrPZ8a4tZC7Are5?=
 =?us-ascii?Q?4DT6itjUmB0nlvhlVXmfzFHTSvY91pFcF0q+DaYCi1vb3ofw4XwURaisbDEq?=
 =?us-ascii?Q?A/MONNs3dzTc0DAvbA4C0gYrLqmGgJ3SICv125Gj6G5uVr8CcQY33VzmraaG?=
 =?us-ascii?Q?HzFmp/q6pQl+hn903IMrOLki43UCOIBR/Tkw2449uMiES0N4xVl3peipDVYn?=
 =?us-ascii?Q?RkGjFRfLobC23A32Rw7OqAoizUQa6o5EAz96jZ8fElFxsVzVyYv7kJr8d7Xq?=
 =?us-ascii?Q?qKpwMsMhhV+sWrYOnSasSqYWrE5KfZ3+HvUekR/7TzbMKz5syyLoarRGCsEz?=
 =?us-ascii?Q?K8ifVifeHlyZxqQM3P+VApOYQ0HmOP+xUD2D3HNGehHIToPToAtXJZj2aOMe?=
 =?us-ascii?Q?ZrOBdh9Wf+8zTXEAz5+YT3RuWBYTXIEXfcZ0N2kk4nTKLNvRSGNF163HnGQq?=
 =?us-ascii?Q?DWaES4q1ZeFMXwVkDxsKhFQflMAESeLGJ6LzeNJjHrAUCGbgQfVFaOLqnYr/?=
 =?us-ascii?Q?BVhivk4u0XwIOpBR37dP0TVXO4Fz/Vb0RvyeK06P14eVshl4aq9VUHnYrsSX?=
 =?us-ascii?Q?BNixMNwglABlxlwtQDrx3lMUSr3kYcbFakxaBfF4rzdd8owghxAdeEyq3kN6?=
 =?us-ascii?Q?JlCEe8ndgIdq8rwOm0SASA9XYttFS4SFBJXzBbnU16AxW9fQpoDIyji/8ewd?=
 =?us-ascii?Q?ioI9HJY9O2vsSfkDMzPoXj6e0MP35ks0PyvwLAzAKgBjpcN6dEGb7GojoAgu?=
 =?us-ascii?Q?Twez+hLdxPn8+3EgtMaclAltV+GJMcjbd5QHbRaPAKPv+VmZYaFuPhAzpOwQ?=
 =?us-ascii?Q?WL6cSduFJ4P3N6H8wvE+k25Q2ra5dzXaXw00rTZfG1x+tAWU2jvLOyKFmeuj?=
 =?us-ascii?Q?7h0YrvXUEpn9QANS8Z35gdaSKdFX5C7HV/kYl2mc3SgoWS2iDBLusf+dA87I?=
 =?us-ascii?Q?rpGAhwdfZ0xt1EeVZ0bkKEONXsdz0d0Fbw9wYs3HbzUYgO6jtrCl8MrxiBaS?=
 =?us-ascii?Q?XsZFs/Y3IymnjAO3VqQLlo3+mnr7GY/XgoIHUDrp4+NBbtIAm9NPCkSTor2i?=
 =?us-ascii?Q?LiAB9GsO9IfoPpf8j/SSPjBuKk0umWlkfMQSHqtfEiLSr/PEvyQhlp6cfWUo?=
 =?us-ascii?Q?Zr2DU/GsWjj9f7aBygDkwIRSAfQDSk0PsJ84ZpVGjIK66rMwv9Nt5wEfXNC4?=
 =?us-ascii?Q?D3yNey0ntD+1g2N6cmQdCtx1InSuOM3O6x9B9kcascCBsHpNWclQ61nB6msE?=
 =?us-ascii?Q?FZgg+NlFUi+aKMPRBXn+81EXMtl2w0vC3gcGFi7nUTwEqJG2Ex3chYKQTMia?=
 =?us-ascii?Q?dUklXj/E/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0023f7c-04ae-498b-f7d2-08de68bb476b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:44:30.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcnAXyf4V+C1RDGmRAL5uw1QyUVR2wtaGOnu+1UZErNYsINS/5lPWmeR8gzRGM8gVDMcV3Xri+3HIEAKWaOeKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074

On Mon, Feb 09, 2026 at 09:41:24PM +0100, Marek Vasut wrote:
> On 2/9/26 8:17 PM, Frank Li wrote:
>
> Hello Frank,
>
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
> > > index 75486e1b0c15f..a0adcd3fe1229 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
> > > @@ -201,7 +201,7 @@ &uart2 {
> > >   	 * the speed can be increased accordingly.
> > >   	 */
> > >   	bluetooth: bluetooth {
> > > -		compatible = "brcm,bcm43430a1-bt"; /* muRata 1DX */
> > > +		compatible = "brcm,bcm4329-bt"; /* muRata 1DX or 1YN */
> >
> > in driver, brcm,bcm43430a1-bt and brcm,bcm4329-bt should be the same.
> >
> > >   		max-speed = <3000000>;
> > >   		vbat-supply = <&vcc_3v3>;
> > >   		vddio-supply = <&vcc_3v3>;
> > > @@ -222,7 +222,7 @@ &usdhc1 {
> > >   	status = "okay";
> > >
> > >   	brcmf: wifi@1 {
> > > -		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac"; /* muRata 1DX */
> > > +		compatible = "brcm,bcm4329-fmac"; /* muRata 1DX or 1YN */
> >
> > driver have not check "brcm,bcm43430a1-fmac".
> >
> > Look like driver can work for both CHIP without modify dts.
> Sure, the driver can work even with the current DT, but the DT isn't
> accurate as it describes compatible string specifically for the 1DX part.
> This change makes the DT use more generic compatible which fits both 1DX and
> 1YN parts. And it also fixes the comment accordingly.

Okay, can you descript more clear at commit message, especially how driver
can auto detect 1DX and 1YN.

Frank
