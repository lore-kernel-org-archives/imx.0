Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35035F8D1
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027135; cv=fail; b=g5US2Mb1e8gy3FeIuAMXIVpP6kxwZ42vA0OPTKXPyAPPDEUuyG9qzaXG5dkTJT1HOAhXmsKzXpQarapVRo4Nyc5D+IEa4YfQD03iMWsFncsWZikeTfRM81n0H002VE51YPWDmpepFZghn8lR77dd+ZaoQSK/hZecyXxTs4gDKy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027135; c=relaxed/simple;
	bh=IVbJEk/kRM1rBDwRSmVyrLSIfxGB2xDj/I4rqpR6W48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lGXI8D6uxQpO9HJgl20Au8NQZRYEQOXVRfXA+WpTbwT1jRAYdTnDRRF8xE9Aik2GiFVqZPhHxzFqH16yFzAr131WN82hJWoC3Ri+i3S70ciEtrIUuLLZf6yenUO7fLHC8LBmXN7Pf6TTy8cVrf8X4Y+WwKfOUqsghFMfw3Pq8lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ktlW41Mh; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ktlW41Mh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyaIeAGQp26sian3r1hFXF/OVIsvYr5jhXof/Fk3SOgk/fUdTLHKl9ptQyDhEyU2h16NEsVDkqntaCG/SsLFR564TxPoiwgZ9DKILRBP220jTyBfXd9/SRVFrOVY0TeR79GnDgqYKDeO+Vk7SdaTKIpM1h3PbcyAHsw3iXMRwK4xo1d7Tm5RTHXZreqGxwqkQgAKcAtQDxe3x5DJZFc6oCtfqjF6J0va/o/XF6pQQ1+/GmKNAm8BXjccYN7xECqUBtO31k8qpOEBgO5zcXoOAcTeZTn9XCr+KK/IZfV2AkN6GZyipG5yzKgfhzmyHrFRRw4pceUynurGQkGXbDe/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fvkRsFCT0mSwHJCw1CiNlW0Ujo4nBK1Ur7XfR0soFc=;
 b=r8C91RwhlbFCsGmSoEXET/MsAz+weHF9f59AVu/TeZVzMQqnOmR8bU6L5YuYlCHcNInQbnL+JXk5A8wQ/2PvahiY8gNIe/3YBC4+N1ciS9bejp9siRuL3nOT4Oucd580LnGoq+RdqerDWVQRpQNZDOX13pPkQD9Lz4Uuz/fqc1ACnGig0W9eN0hu//Xc86jTm7GhrI79PdyGJyJrflY0O76UX7r9oSXQVOpNwkXALMC4DMp/eej91PVIzkbfg+M4s7eqbAbIQD/wOlMf1vlBR8q3V+6VyaWhVIFCgTWgCPy+oh2oHL/H52OqG65BZWYCjTd72HFhgP0DHFLWCZaK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fvkRsFCT0mSwHJCw1CiNlW0Ujo4nBK1Ur7XfR0soFc=;
 b=ktlW41MhPS5i98NB5OWIXelcFXt/CuevmgYHFHG22j/3pDV2UTQN1FnKHVi6djd/DBfoeQozwlBhYC1MfTob4qMZNhfcg1qEvPc6fBP9p2Hyzc935ZFxPTOaGqb8uKCpzliqNsunUVU+om6pjkTZi+euymVG+3wUUJoGPeUlwpedMuk0NGumCte41Qkhn1uR1nVygDq0kwsAGtpQ4gr5kfZQ+rxj6OBMEX3764mvkTevlU6sCY6x7aTTKh5nVSwYNwU76WZdRnemix6bHlWH4SDJrTuGXqlhzR1eeN+hDBR725l1QCPaq2iKQ3LehDVGR73U5sY266FBv2sm2K12rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10281.eurprd04.prod.outlook.com (2603:10a6:102:467::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:25:29 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 20:25:29 +0000
Date: Wed, 21 Jan 2026 15:25:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 4/8] arm64: dts: imx8mp-sr-som: build dtbs with
 symbols for overlay support
Message-ID: <aXE2MU7728bJ8xjn@lizhi-Precision-Tower-5810>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
 <20260118-imx8mp-hb-iiot-v7-4-ef1176119a8e@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-imx8mp-hb-iiot-v7-4-ef1176119a8e@solid-run.com>
X-ClientProxiedBy: PH8PR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10281:EE_
X-MS-Office365-Filtering-Correlation-Id: 59817150-7ac9-429d-a512-08de592b37eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?XCRCYCiTlZNI+RXOXlawOMa1Rbo9l0LNdo2LMMWufSp3WV39mlsym1UI+zf6?=
 =?us-ascii?Q?vEu36hABaGQy4iUUBenXCxE5rtRXQZtOpS3ep1H0JakLewmjzdlP8Slur/Ro?=
 =?us-ascii?Q?ewbEnenGo10UszjVb4HJXibnpPOdEv/6++f5wClx4yCR6tz4TsULIP8O/Rx5?=
 =?us-ascii?Q?mBaqFH4gD8Af+HgYuOYCBpANCaVvtQtU/vXlYnUqbV7tyQZQegZ8/jJ0snPV?=
 =?us-ascii?Q?Gew+lXQeFL0uVefj00YX2Hfvq0xVOZ2OeQVCjwh7grDKoLQdVaDYSU+lhy7O?=
 =?us-ascii?Q?VNBhZUKEbjCReR8q8n7dbg/W6VFqkh2aJti8TkPyVQlj8rMHE+mKQ49R8PuU?=
 =?us-ascii?Q?q7qB7wdrJB3Fl3nj8oXvpX1qJqNg+5z9WrwfA07D1MGUFWFIu2r5xutqMwPT?=
 =?us-ascii?Q?OPdi7Kt+O94fvVvdKvpNzlzQ0WtKXAWsqxUgMp4jeFWaYBIUO6XULSmDO3Hj?=
 =?us-ascii?Q?DL3YyYBw3IdSmRj4g66055iqxrHfa3b4MEJ/X+JJabyICfhLq4v/7SouzLKk?=
 =?us-ascii?Q?rBw3/232bTotO5FunZJOIAnn87/faV1qe/RBYlaq2lQbRxiL5AWfgc5CAVOC?=
 =?us-ascii?Q?9LoCtAkymLPN3+ZCyNWGfElV1GgI90uaYUM6db9n4gt09GAoM2+6F+h+cxr5?=
 =?us-ascii?Q?f0r3Uz4eb9/sgvbQ+sE/eYDCb0iYBkt8Q5AaUt5iOS88x9fIQx7ApVrkmOpp?=
 =?us-ascii?Q?uM54kUGDnN0KMLox7CmbFUpAOCCWUHxbopkrqdlZ5i4x6vRHR91ORgq7k0C0?=
 =?us-ascii?Q?G2qdpPBvZnP3D/OrshN6XA3PCQz9tSo45IDhViV/k2Go4VJ/nC1hsvvSFJ20?=
 =?us-ascii?Q?MxuvsZnsME5QDjm7B6mLp3KGsU5ljX2DPdXw//O9HhFYEaqcyDtLYMX8PdSb?=
 =?us-ascii?Q?RsTEHXs2D2Cbmur3gmGriDnoIfK91alOpNqGC8g4g1X4e2vAMskR1RwTq/bI?=
 =?us-ascii?Q?BkjJW4x2wiM+AL34qJLqFPcC5gT45wx9JZDOOEyVMow09MS6kMI7rNNFPG15?=
 =?us-ascii?Q?WrcJn8krfatRakYDEKIFN5h4l0IBN6N0xmrNdp2kK+frXeC9NKGX07rFscTR?=
 =?us-ascii?Q?G5KwRrU4m+pNjGs2kpduF7qOUUPvWxj6aoOx4jOEWJNsllgD19XUjooUxmFv?=
 =?us-ascii?Q?qYPYC+k/uuo1urhgmC5sbiiSlYJlgZUy+zLkK/hqrXCZ3c2gBZv0abO89bLT?=
 =?us-ascii?Q?7tQRElOk6a1XMj2YYz5C7nwckDxqhE6hDtRmgylsZpLGDte7Ks/piR6UVyWg?=
 =?us-ascii?Q?+o+04LzPbLPttaE8cPDMITMTBDOlUQ/dlUwnKD4kkW+IjWEHvXxHCAmyfVmH?=
 =?us-ascii?Q?RC3TevmEesEdItMlnP/xbKcWXbZA3jrCcXZ1hFx2wv9stH0EOXXUjftFLPNv?=
 =?us-ascii?Q?ajfAvXp27MZAJ0w8nEM0hewZ/OM0mjZ53IlDRiIxb0q2Z7v8XUTB8KMMjewH?=
 =?us-ascii?Q?h8b3254sSeLGUBcgQwxclrH5aADrILAURppjGN6lGuUuw5KiGG0VMMw8kzJQ?=
 =?us-ascii?Q?iaujC5KGJCeioYBmaYO6DpYDoZzU6EXJdBRudLmcR4WG6JdmZiDX4dwz3Qfv?=
 =?us-ascii?Q?e6o6kFRSkHKG5203R2DWL1+Ffcrp2I5jrZkglRJA6oT5X0yVIA/L6jP2ZQ1v?=
 =?us-ascii?Q?SFOoXQ/eVuCFExXy4EPx7+Y=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ppJKGcvXxxFNHoQqSfp/QApKKOvq3M7/XklneCUQJtaoLYiUZDKe8LCDtU6t?=
 =?us-ascii?Q?2CbjFqJ9y4Rs3qkigO2DZ0KExhC7Es59Yg1tzZlDgHcE7RMvBmibDL5egkxg?=
 =?us-ascii?Q?h7SzuIL6APNxiB6gtMdqLWeDopmZ85E92aRY1pHWRW6+ruYugypOvwZdr51r?=
 =?us-ascii?Q?auZ6YQAv/JQNZx5jcNsXiR30stHntKpLdF17Yi/UClIneJzok+ZXTo1cs99q?=
 =?us-ascii?Q?g6DupxNax/DRROgTpl1zRmJsk8wP9zJQrKHrbtbbRsFS6tAfjCtGjliEl2qM?=
 =?us-ascii?Q?DoxfTX6PYl855g6i1QbyWMn6rRvdHDmvWFyhI+XDIpEH9k3mkvnJrxgjwfwe?=
 =?us-ascii?Q?dxMQ4Wp8Ge7GXOmpxhqMZSzPgkx1fg91UBWkyqTh297bGquE+t1juPfn/ffb?=
 =?us-ascii?Q?GrpWSaGUEkDhOICaUlEgZSLuRdlNHaGV4VkAXXyTgnhiF0ugAlgi0WrDNXJT?=
 =?us-ascii?Q?RkMTKhELrc5I8on++iQeYj9O92oMxrXSmXUHepvHv97R8PYtsjiIxHrCw5CA?=
 =?us-ascii?Q?UiJ4IDllffhfgsHtZjkAs3+/kFVKsHFnlcdRSnmhhBVaqMZzIpJbSArCVSOg?=
 =?us-ascii?Q?/jWu2KeEe3Rtkqc+PIKlKNGzTJIym5ZHkv3UsV7NGqSP3+mEaLAmw/RBZEeg?=
 =?us-ascii?Q?Lc1fXgRFrzXB3gTq/gAkgRWBkHUKA/TUGjNC2MTmyn/Ex0RHOeD6+xwg1fqR?=
 =?us-ascii?Q?cFqukiLSbnrqr6GHq513Br91vKTmoKrDQBfcF1ng42T2ntXIghzvINGkjfH3?=
 =?us-ascii?Q?Jga6uch2+MxKrLNzONs0wFgn1VoLls+JYKPycr/k6e2C2LIE/sk9eRmnkQmQ?=
 =?us-ascii?Q?Tq7hQtKPgDo9gqk9lJw0EzK8s827EeeHBHCoMQPC3A5/V5K8oo25O6wAA8tF?=
 =?us-ascii?Q?w/hXwrSga1j//J5RPhHkOvx68uy4GvA5isDyr2RDeA1UdDMJBrHdr0s05CcF?=
 =?us-ascii?Q?PX4j3jcO3RML6oifUoL+SA39kbHAY3KBgwrRaePOeFL6jgyOntXiGyyuVD9R?=
 =?us-ascii?Q?Lltl+UON96CvZs/VouL1o2Nonif+lwv5i9TSrNAp0WfWmm1+YrQnkaXtaYs8?=
 =?us-ascii?Q?cdUV2CQl4fE+o9oPGf0KzGFPAXOgYxL3Fb/Y3wNRlEf/jtMUiyI8wmS02CPv?=
 =?us-ascii?Q?CvRiAfms6MadstslOMejI/tVsln1xQSBcaYAVNophHklCYyQjUMHW43ylKyc?=
 =?us-ascii?Q?7zgOnMSoNK3NBEPu7DKV+86OQvSWBe7doPffg24Rs5mZOFhLfj8Nv3IQfPKD?=
 =?us-ascii?Q?3yP/ZNkBu/hA8AixNgymwR9mhj1K9HBCx46gtGg7cQ8qHchc1xNBS80qBHAc?=
 =?us-ascii?Q?a4nfFoEZQXfy79cLyf9+dMzgjv7j8HP2wNvOKfE3KO8/ZIm2l1zYRiN35ANq?=
 =?us-ascii?Q?ytVenCwgJy2htVxo0s+dHGsGI9kuEjSH0EkMyxcpUom66sFiro3IpOiFi2dC?=
 =?us-ascii?Q?apLQvmHQ0Dga+Uvg5JUC9yKAj0ZIG+TFfzSFFm76TVEKcZlfIISrbtZyaMN/?=
 =?us-ascii?Q?0tViaUUtoytaw6YLCoDRmNVaQ3A5rf5oa92DyvWMLTw312wePM/D7NlvQwLd?=
 =?us-ascii?Q?mKWSYJyNcdy+vxeN1hQKVS7uymOauiEgh1//zfT0eP8Po63wkRxaFqQLwRuS?=
 =?us-ascii?Q?RXuNpy8ogboMIU75xkQFdRVo178CbYi6mwme/BkiY+WqapbT3iRn+SQgVT95?=
 =?us-ascii?Q?p9azCjMEDQh571EeqDC3XEXBiVZWj2l8TL90lVU8z9bDH4uc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59817150-7ac9-429d-a512-08de592b37eb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:25:29.1094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1LD5eSMMRT06xCzOoQXhCrDkubXYRFyONIQpSScs9LGDpK4O78QwzGWHC+jIc8mAfDlENut0W5BDKoj0a0+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10281

On Sun, Jan 18, 2026 at 02:51:41PM +0200, Josua Mayer wrote:
> Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
> dtc flags) to enable support for device-tree addons.

Do you means addon as overlay?

>
> The SoM has a camera connector for basler cameras that can be enabled by
> downstream dtbo.

why no upstream dtbs?

> Hence by extension all boards based on this SoM should support addons.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0..c4c6fd6de963 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -203,6 +203,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
> +DTC_FLAGS_imx8mp-cubox-m := -@

should it put before dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb?

Frank

>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
> @@ -213,9 +214,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
> +DTC_FLAGS_imx8mp-hummingboard-mate := -@
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
> +DTC_FLAGS_imx8mp-hummingboard-pro := -@
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
> +DTC_FLAGS_imx8mp-hummingboard-pulse := -@
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
> +DTC_FLAGS_imx8mp-hummingboard-ripple := -@
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
>
> --
> 2.43.0
>
>
