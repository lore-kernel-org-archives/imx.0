Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810F63A9D9A
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234533; cv=fail; b=D/P7MWmRJE8KvLPmB4Tty0ah/DDWLyE58Xp+2WQehxnHQopiiwhDbZPqOlc4T6IOWrGUXP5ASnG34t/TXKuD/PE0O5gAJiEJ9YuEhMv9bs9Xkz5wTv872iRDuK6qtq1ZeWScxzggDKtvVqLd8lLqAnP4bXic/L0IJbaEu7KI0VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234533; c=relaxed/simple;
	bh=7b0PNCl+BnbNiM0phqyHP0OzQu6KtXz/zj76eLQgYTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pAuqmKAcqb+GPMUo2uO7ETGUfIL7YC5jPozp+kGvOyWbwD//H4ZijT5TM/y7Xv1qvbkuiMm4ytfO/rjKF4OpFwKIuJT5tDY1k0q97+/TeWhQjJbLAYQ/PIFe2XwpxAwFWJ3X46YrqQn9QQC8Y7OW3YyMlVNrqD3bpHfk7GFJi/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HrmYSM6G; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HrmYSM6G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwFrWsKMrahbINqgVVK0S86NQRGfcGSrA9J4lBOKuhH2Q7Zt5HnvPWtzZ7E74RT5XylFcRNdiyoHQwGpd3yIHGmxEHeV+muXd8lpSBogM8wOTFQEZ35kIYnZRu0jjXwwUO9sK+clmty1LjlzJVFBUnWrL3l36ileWgGjqCrKCEtgXF447qJST16+pS2u+X+ArN6wK5a1oUlWi5lUbwyeOzHREwCQ8uE+aeg32kehf7zPo4ddJcrl5LR5J5ROOtM+FbJ+ycF+RSlgBUia1NpUWtCyZX5nbnPXbTsut4Tdl6GHp+qZQI55P2rFZrZYd06WyobBF9WnmCeGsW8LQ9A+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiuHTdm7YlvC1On0nqLutcCzHhCteVyJkyKIo9Sn5wc=;
 b=oG9x7K+TJGIOF4O/NyDtr2x42M1eKWXYMCEounkcdOfP8UmV4SLAM3L8C/vnRUT+WdMb5gx7hm0xJEMJKKkqu1Pcgag1r+3tLM8Rbg3TTuzCz34KJQ0jRmq1+9Dovxlo7M3xYOZ35Hi3QhcXl1mE78T+A+oirQKwFZjQYuKua/htUNUsboh9F8Bi7Prnx3GZQelTV29vNRvp+g9vRJp0/XdmRg0LGZaj6rkryOJTp8o+EMkkObLHbPFBGSBM22m5OMTKiYZBo0+af+yAnpyEHnAm7gxGjmK+sMSzyUB8w6EtXXPZ3YMQOh5saS5BPgoldqPg35C8P2FxAM379N6QZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiuHTdm7YlvC1On0nqLutcCzHhCteVyJkyKIo9Sn5wc=;
 b=HrmYSM6GxaeZISBYkf8/153HXiBeXHHukTPgB1LKonD1VxyBV20iCtr9kw4J0hTKun1kZSeJBVsz/iT2VKWm+Uj5v2pM7ZaTI/QJPU40T+7tZClM8mz4GjYJzqzAQRjnulbtxU04bjJYdxc/FmhiWXG8Iy1f440wfoO7ZOKWcjJXw4KqymWhWQw9oYjdJsGF/teUUIOwTWlVlE+QMiNOnjEVrL+IUuFmcOc8Hmq5lkwoZThEjsmdz6n44ZOh6RmXc2NyZgJQ46X8mKVs3Bmz6PyNQwKxvDvfV9LxSVgw94UERnS9JoIsLxgAfKj0krHo1Yft4beygfRpxW24pwbmGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB10062.eurprd04.prod.outlook.com (2603:10a6:10:4e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 19:48:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 19:48:48 +0000
Date: Wed, 4 Feb 2026 14:48:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: imx91-var-dart: Add support for
 Variscite Sonata board
Message-ID: <aYOil4idKr4xCtoe@lizhi-Precision-Tower-5810>
References: <20260204170356.35169-1-stefano.r@variscite.com>
 <20260204170356.35169-4-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204170356.35169-4-stefano.r@variscite.com>
X-ClientProxiedBy: PH1PEPF00013310.namprd07.prod.outlook.com
 (2603:10b6:518:1::b) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aefe844-11a5-4bae-df85-08de642669b0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?QvS9qaEB9x8l7ov4R8pc+aNULX9wv/fVF3eMBSr+EfNkeQElzpD3dkLAfE1T?=
 =?us-ascii?Q?HC1b2kAtDtbEsOehWqIXxe2Boy+ZF9r0bvPfC2XYp2cAPIm4KdYoIP++Z8xR?=
 =?us-ascii?Q?zDSQ20ZIro073tnTNTORcoGAn/7ZjWOyMMCR1qnfxNMrmyli6gLvlsztCM8O?=
 =?us-ascii?Q?vzrvjudNJGIoTfUHt6L7EM53DnUwTAh/FHp0z+P5FpmMkrkUAsQi+ek/uE3N?=
 =?us-ascii?Q?AfeLxwSVCCozZ1teeSDtRp9KFDwdk9WyTW2tPKVQqGrcRog+zcm35PikOPys?=
 =?us-ascii?Q?SH4taj2eP6YGfJI2hs4SKlV4SqOmYyrmqYKYRomE2SOypcmxuWssHRtPRLaM?=
 =?us-ascii?Q?Z16eB4aFKixmV8dujB9w4vgBkhuATEhG4gGsNUgAJqDeXtNTN+50Yu91Qm8p?=
 =?us-ascii?Q?aiWziorbc3Lj71vX0jeSI46BOn7VDoBCSBGcTX/c0FGw2JyRdWeoioLobH5D?=
 =?us-ascii?Q?fsz2DhVztUco+vvlxEbKAZYTPwLQ8zUD8xSsJ/thI8B3Uo4axm7F/i3Ic5aI?=
 =?us-ascii?Q?xo4MLDMb2X2bnVgfNZVqXrQt22ARcqNBdo5FFKzoRbFtcSnkUCXb+pklGjdU?=
 =?us-ascii?Q?TOS7eg1V0o79c8sHSLc5jATUJDcVEvGZi7eJRbm6dBMGazxsoW8nx9G5rxc2?=
 =?us-ascii?Q?X2/J+5aSxDfWJKG1NWBnBKNL5/saZOjSIo6g3iiXAraXnY8k2O9h+nizodua?=
 =?us-ascii?Q?swvQErIIYqTP4adDieUY2mvtS3bKClOmlTz0jLl57iiLBSmgWLUy3AWW5XL6?=
 =?us-ascii?Q?wUllwkitF6usLL2Dpq6/qPakOTs4hqK+5LMkxlikHE2O21KZ3l+JwsjlI4z5?=
 =?us-ascii?Q?+f0CJQ77qHCXG6rpbT4U/cph39IFPyvHHKFxvXXHdeTdqSGA7enmSNGRaVaO?=
 =?us-ascii?Q?xmHwswQrCqr7YBFVVKNjO7JTp4380BNEmmOymDo6IRnoH28qVQKq1IbbXkaU?=
 =?us-ascii?Q?FvKHxGXZk17+zXfcaGpL/jEh+WAiCc6tMRacuRIdZrjB1aNGNMbGxpBm5qj/?=
 =?us-ascii?Q?wZAkxsKKY8GvDPB3HN5s7K9K1Bv1u5M3yPDo5HVLkL6DkvW1ASRT4tPS2fWV?=
 =?us-ascii?Q?eWTXH6a3JN1DwYxxgXFIqZq6XXEtYd3VpTUquPpP8QogxshzutxWyEJBOjUx?=
 =?us-ascii?Q?mqfyoWxvfuatago3ML5ivrBJ4Pnqft596YAVs0Rp+dDiGvJOMrLLJgxC3YUK?=
 =?us-ascii?Q?pQfEIffQnVSiHlQfrnX4Kgg1yV0YJsddmt10GHaIyUOER2cqfzULF7/ZdNMX?=
 =?us-ascii?Q?t1XZA52c+yUYYSrStawW8KSCvFMOeB43R5Uc1Sx1bFlMORwNn3s25tNo5MsX?=
 =?us-ascii?Q?KB6dIsor1yLszdhJ2WvucX/+tfiA4BcXZo0/mYXyrv/7LHexupyWO7zqaQXl?=
 =?us-ascii?Q?3hT76xPMq2y0GUnziLitxuiQcfw6XN4RyUNkZMJ4srVIRQstJAICZrYpyYpu?=
 =?us-ascii?Q?8YUmg+mIb48wwDaBnzXvLV6RUwjzr0Q89xb4f8cgBCGZwHmmPMgaByzzipqj?=
 =?us-ascii?Q?B9tqE9Y6kAw/VmDSkAkLrvIBKep75b5dInrsI96dZdn0yEpeyvoxKcU1jPdD?=
 =?us-ascii?Q?Lg0D0I+2DESzyfyxdkI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rI9sZskVVrP80Yj3DNgiy2vlkDYPSge2nhww6RhiFmV2rZ1ePAJkwQRlXhzo?=
 =?us-ascii?Q?pyROIozNTyMt17sNxYf+xhTIDzyrDRWGg0TaYgIuGvdfUOvzHScqaQ/1Vk0J?=
 =?us-ascii?Q?SqaYAmGVaga0TtFWbZHjOuLyA9g+cWVqyz32IBILwMZXe+DDDbPlxnaqhoAr?=
 =?us-ascii?Q?vX3bkSJt79OhX4pamSaOjAJvl1JUgrnc7JVBpbFuyJosDT6TwOruQRgz8LGW?=
 =?us-ascii?Q?AsWd0DaC6OLu9Z9zAzdzp6kOqLhXW0/BstVkGtQ9/x1LomF4qcBB4EoCTYHC?=
 =?us-ascii?Q?Hb+hLuWKX9IO0YExiUYjYFAr3JxHeBTjtDbSEQFveHHgJzsqXxacWam7tpY3?=
 =?us-ascii?Q?EChbcHs2PBI0KUE+f0m7YIh9J/Fb1Zvfllq5VdokycavNZpXqXYSQ4YSQCvi?=
 =?us-ascii?Q?SoJYj0ItOUU8ocQqkw8vWyOP93s5UBb+qt3OsgH4UCCkTDyRfhygn208OhOG?=
 =?us-ascii?Q?93Uo6WuMd8/HO0QpprbSMCPIGP1r3geysXPAIlPu81zffAGvv6Svz6K2cVDm?=
 =?us-ascii?Q?+38T3HLAlOYaF52sAYREOZxHLLEfP3YrSCIjy5ZfqVWJdxFo+AB/hCTjvrV0?=
 =?us-ascii?Q?6t1/+yPoJcLJa+2U5SRxvkLgOCORunwZBNEJEvp8r3XKSd887ClOow/Y0Deb?=
 =?us-ascii?Q?ASbJ4K3169ewoFOPy/bMsYmi5E6Zwa3r2hFroZ+phrNEGW8mc1GFN7D/rpnN?=
 =?us-ascii?Q?a2F5AqxM5lYyIIxv93wmMcjrtOtQX2oZ02GONahYpnlmUpyDiV8pZJrGcdJG?=
 =?us-ascii?Q?PO6Aa5GqF+zOUrF5RJxhEAXUxKv8J1dtO+H1DjxJ4cFKpYUXQ3S0kP5ZO4Ra?=
 =?us-ascii?Q?q6LnMR+pQfYoFzKirVcKXhWg/Q6tneSf0OVm8BalBAUFxpc/vItswe4wcoCQ?=
 =?us-ascii?Q?ET3teCDV1RVCjtBbvb2ZzrdY5TKzUdkkwZx00ZuktwUcnwzSy3nuS5k8K5Oe?=
 =?us-ascii?Q?8uRX6Kpcl2ZopFjE40t1R62byZM7QFftNqlAfYoo0M7bzRUxkgDccyCXlmxm?=
 =?us-ascii?Q?SXMWXEa9ysyx5/qRHdq5MFfJrn/TftvCU7gPT0KwVA/ib2+sEfXblLfPyTO6?=
 =?us-ascii?Q?cWSS8ikWeYqdO2kSjZnMErGZH2OIc13VO2Qo/LYdTsxfRC3u+RIy+1SZI/1D?=
 =?us-ascii?Q?MUifXeIaZQf78mAOzP5LDVuzAQmtANxMtl6Ph/1GrOu0GLNR5X3ADp5o8vXf?=
 =?us-ascii?Q?QE5bgeLKKnaKaIuL2HjwXEJMzWxGxCnO3302Snjh/BlFXVk2me0Un269noUd?=
 =?us-ascii?Q?kSRMc4XZ4AWZILeQ5Uuo8vPYpYvBDBJ6vM7hk9r8IoOwvi/Af+JX2L33IDIr?=
 =?us-ascii?Q?BRhy3sZ1AFaaAbVvUUKAvLgxHBz9vRnwDvO1nGL/bWTxxlSxQaFioTlPkBmF?=
 =?us-ascii?Q?iksnulLanHqFDgFp9Xi3NywSqyWIpcliXh9PQ5LKdrv4Q16QorIuwCSmKk/1?=
 =?us-ascii?Q?ULFaH1GusQni4oNfXbEEtt69xKKGRw+aj7EbiT0m3mhVoalV21QjdMGH4/zm?=
 =?us-ascii?Q?APXK8Phe84PFb80eIVIOyX6Lbw4Gu4fbwF0rAgUSEvIAz6Nj//zQ/HCMzFBG?=
 =?us-ascii?Q?+CJWGnrK9uVhzP5c+uQxzLzKKo/BvTsfCB6ZuW0utCz0KzT1PFekrh7Ji6FQ?=
 =?us-ascii?Q?/ehsSApsxeA+x+lQ7kokPjLj7GvIqg5eXcrNLEEMC+6/YiL7JSWAvIPL+I8j?=
 =?us-ascii?Q?CSn4ijCpfP8xD7EFaM/tcTedI32AWBNj6DCbIZ9b4htdW3yB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aefe844-11a5-4bae-df85-08de642669b0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:48:48.0165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3UOANIt4vHNDSvZtdeXZoYhLdT+jTpV5xAXWvmI7d+0pzlj0uurUAjXQthb5fYhKCjXv/0i8sbQFnBxocWdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10062

On Wed, Feb 04, 2026 at 06:03:56PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite Sonata carrier board with
> the DART-MX91 system on module.
>
> The Sonata board includes
> - uSD Card support
> - USB ports and OTG
> - Additional Gigabit Ethernet interface
> - Uart interfaces
> - GPIO Expanders
> - RTC module
> - TPM module
>
> Link: https://variscite.com/carrier-boards/sonata-board/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
>  2 files changed, 499 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0..839d98bdd2a1 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -370,6 +370,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx91-var-dart-sonata.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> new file mode 100644
> index 000000000000..8e4bcebfdda5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> @@ -0,0 +1,498 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Variscite Sonata carrier board for DART-MX91
> + *
> + * Link: https://variscite.com/carrier-boards/sonata-board/
> + *
> + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "imx91-var-dart.dtsi"
> +
> +/ {
> +	model = "Variscite DART-MX91 on Sonata-Board";
> +	compatible = "variscite,var-dart-mx91-sonata",
> +		     "variscite,var-dart-mx91",
> +		     "fsl,imx91";
> +
> +	aliases {
> +		ethernet0 = &eqos;
> +		ethernet1 = &fec;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		serial0 = &lpuart1;
> +		serial1 = &lpuart2;
> +		serial2 = &lpuart3;
> +		serial3 = &lpuart4;
> +		serial4 = &lpuart5;
> +		serial5 = &lpuart6;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-emmc {
> +			label = "eMMC";
> +			gpios = <&pca6408_2 7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "mmc0";
> +		};
> +	};
> +
> +	gpio-keys {

order as node name. put before gpio-leds

> +		compatible = "gpio-keys";
> +
> +		button-back {
> +			label = "Back";
> +			linux,code = <KEY_BACK>;
> +			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-up {
> +			label = "Up";
> +			linux,code = <KEY_UP>;
> +			gpios = <&pca6408_1 5 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-home {
> +			label = "Home";
> +			linux,code = <KEY_HOME>;
> +			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-down {
> +			label = "Down";
> +			linux,code = <KEY_DOWN>;
> +			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};

button-* order by gpio pin number or node name.

> +	};
> +
> +	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VDD_SD2_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		off-on-delay-us = <20000>;
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {

order by node name regulator-adc-vref instead of label.

Frank
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x40000000>;
> +			reusable;
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
> +/* Use external instead of internal RTC */
> +&bbnsm_rtc {
> +	status = "disabled";
> +};
> +
> +&eqos {
> +	mdio {
> +		ethphy1: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <15000>;
> +			reset-deassert-us = <100000>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	pinctrl-1 = <&pinctrl_fec_sleep>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy1>;
> +	status = "okay";
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&lpi2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "sleep", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c1>;
> +	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
> +	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
> +	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pca6408_1: gpio@20 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pca6408_2: gpio@21 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pca9534: gpio@22 {
> +		compatible = "nxp,pca9534";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg = <0x2e>;
> +	};
> +
> +	/* Capacitive touch controller */
> +	ft5x06_ts: touchscreen@38 {
> +		compatible = "edt,edt-ft5206";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_captouch>;
> +		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		wakeup-source;
> +	};
> +
> +	/* USB Type-C Controller */
> +	typec@3d {
> +		compatible = "nxp,ptn5150";
> +		reg = <0x3d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_extcon>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		port {
> +			typec1_dr_sw: endpoint {
> +				remote-endpoint = <&usb1_drd_sw>;
> +			};
> +		};
> +	};
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1337";
> +		reg = <0x68>;
> +	};
> +};
> +
> +/* Console (J10) */
> +&lpuart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +/* Header (J12.4, J12.6) */
> +&lpuart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart6>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	disable-over-current;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	status = "okay";
> +
> +	port {
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +/* SD */
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	no-sdio;
> +	no-mmc;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			/* GPIO Expanders shared IRQ */
> +			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
> +		>;
> +	};
> +
> +	pinctrl_captouch: captouchgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> +		>;
> +	};
> +
> +	pinctrl_extcon: extcongrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO4__GPIO4_IO29			0x31e
> +		>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0             0x57e
> +			MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1             0x57e
> +			MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2             0x57e
> +			MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3             0x37e
> +			MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC             0x5fe
> +			MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL       0x57e
> +			MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0             0x57e
> +			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1             0x57e
> +			MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2             0x57e
> +			MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3             0x57e
> +			MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC             0x5fe
> +			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL       0x57e
> +		>;
> +	};
> +
> +	pinctrl_fec_sleep: fecsleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_RD0__GPIO4_IO24                  0x51e
> +			MX91_PAD_ENET2_RD1__GPIO4_IO25                  0x51e
> +			MX91_PAD_ENET2_RD2__GPIO4_IO26                  0x51e
> +			MX91_PAD_ENET2_RD3__GPIO4_IO27                  0x31e
> +			MX91_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> +			MX91_PAD_ENET2_RX_CTL__GPIO4_IO22               0x51e
> +			MX91_PAD_ENET2_TD0__GPIO4_IO19                  0x51e
> +			MX91_PAD_ENET2_TD1__GPIO4_IO18                  0x51e
> +			MX91_PAD_ENET2_TD2__GPIO4_IO17                  0x51e
> +			MX91_PAD_ENET2_TD3__GPIO4_IO16                  0x51e
> +			MX91_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> +			MX91_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX91_PAD_PDM_CLK__CAN1_TX			0x139e
> +			MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x139e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> +			MX91_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1_gpio: lpi2c1-gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_I2C1_SCL__GPIO1_IO0			0x31e
> +			MX91_PAD_I2C1_SDA__GPIO1_IO1			0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c7: lpi2c7grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO07__LPI2C7_SCL			0x40000b9e
> +			MX91_PAD_GPIO_IO06__LPI2C7_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c7_gpio: lpi2c7-gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO07__GPIO2_IO7			0x31e
> +			MX91_PAD_GPIO_IO06__GPIO2_IO6			0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO3__GPIO4_IO28			0x31e
> +		>;
> +	};
> +
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO02__GPIO2_IO2			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX91_PAD_UART1_RXD__LPUART1_RX			0x31e
> +			MX91_PAD_UART1_TXD__LPUART1_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart6: uart6grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO05__LPUART6_RX			0x31e
> +			MX91_PAD_GPIO_IO04__LPUART6_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart7: uart7grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO09__LPUART7_RX			0x31e
> +			MX91_PAD_GPIO_IO08__LPUART7_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK			0x1582
> +			MX91_PAD_SD2_CMD__USDHC2_CMD			0x1382
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x1382
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x1382
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x1382
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x1382
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK			0x158e
> +			MX91_PAD_SD2_CMD__USDHC2_CMD			0x138e
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x138e
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x138e
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x138e
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x138e
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK			0x15fe
> +			MX91_PAD_SD2_CMD__USDHC2_CMD			0x13fe
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__GPIO3_IO1			0x51e
> +			MX91_PAD_SD2_CMD__GPIO3_IO2			0x51e
> +			MX91_PAD_SD2_DATA0__GPIO3_IO3			0x51e
> +			MX91_PAD_SD2_DATA1__GPIO3_IO4			0x51e
> +			MX91_PAD_SD2_DATA2__GPIO3_IO5			0x51e
> +			MX91_PAD_SD2_DATA3__GPIO3_IO6			0x51e
> +			MX91_PAD_SD2_VSELECT__GPIO3_IO19		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0			0x51e
> +		>;
> +	};
> +};
> --
> 2.47.3
>
