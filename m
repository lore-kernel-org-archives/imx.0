Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F731E51D
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 21:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740691689; cv=fail; b=hzEYcdZreMNJyjrG0Oy9E6CDZK4wwRUvxjXzgCVmYCPBdIqqRAmRj0jD5Ne8oYU6dB5ZoltMcF0VNr1PjrVKhXS4R5XoAM3gkjShMIW3rqPyfMyxzN2NEKgSJIIw8irE9nPhpBvw8c/ZuNe32T4Bzv80i1U6ipF04+gxd9HX8NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740691689; c=relaxed/simple;
	bh=ZSWtqftb0vqNXHxf/w6EUnyUDXjjbDG11uhhbRNy/AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Uk/5RAeFWNIguS4K6SARnR3PzuXBQMLb/5/Utmv6UusST07jf7x7Z1L2ULAamEd/qnar2jMrtG0qMBUFAQLY6uVXzzJFHxwVCTPpUdgb+sgrzbMGFrRehyVeti/qN1DsM5NCza/bnJ9gHqP4RZo2GdIndh+hmmClFKM/tAzaEWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CMl1l9Xf; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CMl1l9Xf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUkFq9GwPNj2atVHCRQFWO59iWeMLT+1Ztuol+cu4C1ueTjPdtrh4xVK+Z10pKzW1/pCpMPWqpULtVlF4OmwWlW6KHGOCSkGAmIWSNR4rgBWXDS9tY2uP7syE41mLajAxXpFnDDWXuIeUJnIJgwhR1o1pbvEp2i8Vqs6jEtAVXozkjfOg4ZQ5SbsHQjmJMUm6VtE/bYTs7vCW4qLUqWLSxZbw5taFisTU8gOYAK0WYRA/LKAf9vVq5JY4OnZmWnm+sZb3qh+tY1xyWL1KtZTPKHMAXpMaV4ZFAp6Atis3Vpz4VBNHP+M9oUBz/W5vtwIPXWMYbhV79OJa/EooKYRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=damlPDJsZLmQG7t9L3wRPou5FFv/7BUhgBmDt9d9rXQ=;
 b=n5/ralQyVa1l7zZJHogJwjwgitsKzmZuMlpOzpnwQD2DGaiOV3+cCE6eC3MhCASPSoyLJZaYo9r3qtdIG3y+yM3xZWM6d4+S0nSPFNhyQFpz/jqMdbe2kjOS3J7ZV/C5Qai3vDLHmyAJ+YUZP+RLg0fPMomt4fysEl+4HVnt3kWKswq/53uuWQERS0XzXiOl6XxuKzYM1h2E9kXFjQiLwX0Cf7Ed08zg5GJPMIF37onvJztJ7Jjhtm9GDeTduHS9FfjS9TCqdsYjtlksaoaB12pp0Xy8KfrN5xQ/FScHHe5MGVGmUDNdLDTG9YogIEIXAO1ArC5uMZFn8+/zQo7zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=damlPDJsZLmQG7t9L3wRPou5FFv/7BUhgBmDt9d9rXQ=;
 b=CMl1l9Xf72B9eIaW9WtbVQJEEmpT3mdqvc9DkSFk0EjJyNu53xgj+YXqaWqI+Iz9F+mnfRPF80DR6ByBes49oEQz3+QawB8aJgYTp/If0KRKNAqI7ETqjEWmp+TqvyT3Qc4dLkrl6tjAQDn0nHT5NIzDzR8VCEyvP3Wdr+1AkXOJJ08viYJUEwLrocd1eQvV7k+QsZ9vnab2Ejy8Pcx8jRZorUo+m7gxi98xvWoz+rhlM3DTS+t2N1VOgalmMXhcQe2z5yOQZ72ZMqjAYp0KErQoCWjNP2qUOqzhk8WD+zdXGsxxvVpZ3cZRoBpUw2ki1HDmBKpTFMZArvc+8WXOzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 21:28:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 21:28:01 +0000
Date: Thu, 27 Feb 2025 16:27:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <Z8DY14NJYXjwKz7Z@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de>
 <Z8CkSUry5puMu6Mx@lizhi-Precision-Tower-5810>
 <d41c9cf5-9ec4-4b9a-b281-653873fb8df0@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d41c9cf5-9ec4-4b9a-b281-653873fb8df0@denx.de>
X-ClientProxiedBy: BYAPR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:a03:100::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8d6cdc-9838-4a6b-24ac-08dd57759d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fh38/w0XcL93TzXpHnfGwKgVHYjoflENYf1/FLgNJu+YaoipGAY1DN8++rlP?=
 =?us-ascii?Q?zj+vf/blwE/U66e3sX4fQ2ncqe0TVr+4jQsuEw2UqA1oGMzmR+VAjBbMNkfm?=
 =?us-ascii?Q?5hNk2gSn8qZedItMkaWMX3zBEY/D3zH1ET5cMbdBKSJHYj2TT89FB8DhyffJ?=
 =?us-ascii?Q?eT6cFrJeJoUhh2qZ92NLXRgiT2t4bKMrB2dSsE4SGIT+KK2O05FZkVvPK3bd?=
 =?us-ascii?Q?ENM/LVgmBuo5zEvM2au3HC3i9lGO4u6LqpWlr/A/Pj8Etzq6CCykL+TrwtpF?=
 =?us-ascii?Q?D/aqYWU0C2nkS7Dcs+w3JERVtxN+akeBBLX0CHlxK8e7VGTx49utPqotOI5M?=
 =?us-ascii?Q?XY6spOCldi2d1wdXELzLqKjAl57D1mSC2ToG+jccqdtZiyCsT94F1rewLQUR?=
 =?us-ascii?Q?PepI9x3s6Ppt4cyWHkIy3cuPuIxIXjRPFwayHpWJwszMqaDfVkSI6/p3GMuN?=
 =?us-ascii?Q?yahZxkI/p8OxGrZ9R07N+ZB21lTLQrCRzt6oNwlGdTQ5/R3VtjkATN2+4ij3?=
 =?us-ascii?Q?2gqFXifQK/AxVkidHzoXDV8joZkq2OOTIaHsJ3nvcfpH920Q18lTeNChaohW?=
 =?us-ascii?Q?RkP99zKvcxeWe2uCFhCA+Y0Z9PFk+frKiJ0CJQSD6iwQcswr8Kr3QS8HcZp9?=
 =?us-ascii?Q?0ZuptydSd7F7Hq/dCEjYVwnnLwCK4VHqup+5+GXmJ1fWfr27NpTz9rvsVg4j?=
 =?us-ascii?Q?6PtEpFZit3FtA6ohac7gcef36nTjn4av1gtYz+B2QFYyJfK47z9hvQNGVTzI?=
 =?us-ascii?Q?1WB4lkpndSzHvCVjHl8wU31q3jF4xnRcHz0zqUyDX8CTQYMPiHvOUdMJsS2l?=
 =?us-ascii?Q?BEKIzo1cK04NS5kwct8ruEeNJdwSLFmnoTRFl+PfqYfUZVPFZKRqBTpMkvvA?=
 =?us-ascii?Q?tjAoIKWWs0bbetETBDlXfVPed8mOf9b44Gnh4fxFY7PZC019Xz2HlfsyZVnQ?=
 =?us-ascii?Q?mGATtTMjoFjCIaagDmFlpKFpEXEg99AYomzb1knGlYexWiSG3bV8C2DvmUyr?=
 =?us-ascii?Q?D0WvaryrwNtgcOaL/ptW+va3MuyFwpcuBy/yjWjwGIz2bwAoSgwoMhLJq9qF?=
 =?us-ascii?Q?K3Z1fVKpQsqDvy/3blw6N3x/x2cB40w72R+RB43+QesLUQzImct0Z96PGZU5?=
 =?us-ascii?Q?iO+m+3dVLLxeU5+FC+qv42IRuURkbm5FvRtcaBg/imRTqBKI6vU62nyK3l/C?=
 =?us-ascii?Q?zP/+JEONWKrJR7MiAF8C/qylzgsk9Mk5LMiPGlchbpBp+hbM3pFjOH9zdK/c?=
 =?us-ascii?Q?8k0H7GhXAnZdzyM7xlzG9oX1VbXXwJv2cd8vD/6k3P7UGQm5zkLfGHGX+xBk?=
 =?us-ascii?Q?1lGVIIay6fvChhFtMiiszmvW0oia4uDDrfosQxFaCoKb2F5j2eXssji9ONiV?=
 =?us-ascii?Q?vr8+6fys9WAshAq9lCNYw1MPg7FNJAn4aWXWnwT35XLQlp8L5fCsnBSHB8r8?=
 =?us-ascii?Q?v/fJoNxq7s6OzJNxqxzZchlLVVkhe1VH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ji0B6jcHuhihUFRvPrEvCYAV8f57SBShJxnEjcVuozp2YU8v060b3e9pxgr+?=
 =?us-ascii?Q?DEqB7iCx+PBpYDSO1r0Ek0JH+RrVeK0vC0xTfixhQRPMG/zeeTc9TZrhBOtb?=
 =?us-ascii?Q?TG2PMlmehFO4KUBCOoQbwY9z4JNvww8hFemaPWRs6qWi2WiDH7pvws/eUZM5?=
 =?us-ascii?Q?gs8XEnsnaWPCWbYUpcrPyZ95TohSlGlmFZAE635+N1LBscAxOetjJTGw4fh1?=
 =?us-ascii?Q?Tlo03vzstRG0QRwyKdhwDj0EJ4HbWbHsKJsXVFEA8JTfKPKO0VTCv1T8SJ1H?=
 =?us-ascii?Q?paUs4Y2EnmwrAZ2DABI7v0gjsrsTgfh8PFoTevkluKonBXt2Qy6myzwkAydA?=
 =?us-ascii?Q?JuDHIna8I+YHXs+PlRcPHZRo87qhpL62NSpVB1V3CjpKCGO2X/ibbX0WWJp1?=
 =?us-ascii?Q?AHDAjUWMB7kIOuPkp9FO1G+MxPwBsnbsUrAyNoveCEDljbnOukVkE0X82v0a?=
 =?us-ascii?Q?sfXkkVLutwCWA5arI2ToDkLo4aOVxjC4cHT7LCc2Gq11cenwrZUj9VFTjuw/?=
 =?us-ascii?Q?9Ry1ij2pb/sMYpcZVaS7ImlTrdiC/OZ7zdKJ029kddP2Yaf5/X6AX8OxUg7m?=
 =?us-ascii?Q?3AV2PNOiOpPpPZa6aZFxunG14hfRTeCQm/qorZ0P81tAreOqvXxD4vcG6cCN?=
 =?us-ascii?Q?sknGGJuWoIuKVd6IBPXofQvD/eM8QwCct0TPTJUdSnEpPNY/5u0oflSZpvNF?=
 =?us-ascii?Q?GUuXSDCWWRaPkInFc52j1E4tVDyblRTa1p/CLj41WyaRUDmXMnOilz0PgB2r?=
 =?us-ascii?Q?qN4wq8Gh6/iR6anNCDGg2h7GPNHhYH45zSEsF/48FK+QdBOqhAOR8lPTK+n2?=
 =?us-ascii?Q?b+l26t0PIbdFIT8jnmmkDKaib+TRXePyj/E5AIjaYlDJOLscl9Ps4XCAnvcK?=
 =?us-ascii?Q?Z1JkLmdmX35IvPguFCsNke2WJDVUPw+pvAiMEK3Um2HK5DS5VkEuFGK/WDPH?=
 =?us-ascii?Q?8Ut0oQJfKUTgp9zwSVZhej6faS7N6/ZlMbqNbJTkScB8NMJqdBqu4GqysfS4?=
 =?us-ascii?Q?O//U/Oi4nKUgUZAEYb21o3Q4Ydxu0sCnfshsKdctCtOnaLStOEAkPHp80t72?=
 =?us-ascii?Q?mvtJh+0dGmWOFh9jL3Zpht7o0Bu+8IjcR0KagyTqct24z4l7VKOa7AQ8YFkh?=
 =?us-ascii?Q?kW4yZjo7pyNO/MAbrkN/ZQKfFr/xkBkdVq3rgUyhIT3rHGIlWzQIjUwEpG2R?=
 =?us-ascii?Q?sQJjIvOsCdFUE8aTW00uE6x63E9i4JqK+MgU/WGorhMjUtAsaeuDfF7XKA7l?=
 =?us-ascii?Q?xNsqJ+DXH+HBxrKBfoEtKQtqegis6akqlA4Q8KYBWq1BrdzicEfzkxnUDPtB?=
 =?us-ascii?Q?b7tJCaI3tJf3LgxaULpQuxe8ndf+8aBkCx4gBKITIYJJzykpBeNcaJcEQefg?=
 =?us-ascii?Q?ChEyItd06FwhxhzMnfFXZptBk0CB49FCtX9zI069ZyV2HEl2Wdk1Zh9sxBhC?=
 =?us-ascii?Q?SMokRJJcfcIiYRhobDku2ZGxgj5YRQekXoMAP3Ay0Faiw/KIaF5La1wEI7eG?=
 =?us-ascii?Q?5Pac48JqOmr3QEAWRrXToYgswmHRHHHxxCcHxxJtHmVuRf1fC8Ed4wnh2yNY?=
 =?us-ascii?Q?XvInhMpXTxapXXo/I1o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8d6cdc-9838-4a6b-24ac-08dd57759d1b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 21:28:01.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaM5stdJ1VlO4valKsSX+tGVJgrZnFlWjZ/iZbNhX0VlrbDz6TKjQIFXCr6VBQ+9HlIzRItMeETqVS8b4K0xTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857

On Thu, Feb 27, 2025 at 09:36:55PM +0100, Marek Vasut wrote:
> On 2/27/25 6:43 PM, Frank Li wrote:
> [...]
>
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > index 3af13173de4bd..36bad211e5558 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -249,6 +249,37 @@ dummy: clock-dummy {
> > >   		clock-output-names = "dummy";
> > >   	};
> > >
> > > +	gpu_fixed_reg: fixed-gpu-reg {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-min-microvolt = <920000>;
> > > +		regulator-max-microvolt = <920000>;
> > > +		regulator-name = "vdd_gpu";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> >
> > Does really need regulator-boot-on and regulator-always-on ?
>
> I don't think so, this is a development remnant, fixed, thanks.
>
> [...]
>
> > > +		gpu: gpu@4d900000 {
> > > +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
> > > +			reg = <0 0x4d900000 0 0x480000>;
> > > +			clocks = <&scmi_clk IMX95_CLK_GPU>;
> > > +			clock-names = "core";
> > > +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "gpu", "job", "mmu";
> > > +			mali-supply = <&gpu_fixed_reg>;
> > > +			operating-points-v2 = <&gpu_opp_table>;
> > > +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
> > > +			power-domain-names = "mix", "perf";
> > > +			resets = <&gpu_blk_ctrl 0>;
> > > +			#cooling-cells = <2>;
> > > +			dynamic-power-coefficient = <1013>;
> > > +			status = "disabled";
> >
> > GPU is internal module, which have not much dependence with other module
> > such as pinmux. why not default status is "disabled". Supposed gpu driver
> > will turn off clock and power if not used.
> My thinking was that there are MX95 SoC with GPU fused off, hence it is
> better to keep the GPU disabled in DT by default. But I can also keep it
> enabled and the few boards which do not have MX95 SoC with GPU can
> explicitly disable it in board DT.
>
> What do you think ?

GPU Fuse off should use access-control, see thread
https://lore.kernel.org/imx/20250207120213.GD14860@localhost.localdomain/

Frank
