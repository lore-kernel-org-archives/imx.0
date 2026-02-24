Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013052.outbound.protection.outlook.com [52.101.83.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862A2D8390
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771961241; cv=fail; b=r7JucZoImZQ+2Kr0jP40hy6Y7vesoprktyQ3MD6ItCmjtF1JNR00mXLwZaDGip1eZJvwr6I49vElQ42ks9g2ZuioRXeMsm3uNA/QMbqnpO41lSopRa+esr9dcJafZ/HZZkPOHa3AO0QAHrvhROdGI217yNy9gnj+5U1yu1qm1Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771961241; c=relaxed/simple;
	bh=inz73PtBl34GswfWEyOIkpBcam9Owx/9NhLHZpyMaLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B+czN7pC+eqvOgF1BP0JqXbKg9CgpaVAhktePEeBGvgCWNUucozvhFYG4Upf9JLuU1xsbx4eoHkPAtleP03ltaVMXDFExSk5FzCMSzqCjh/BiYWDwZf/D/nAfOur3xCMtbzLs/lD5x5fPlHhbyzJZQzbBL/e6wYWcmknszdRHSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V0clvfAo; arc=fail smtp.client-ip=52.101.83.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V0clvfAo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZVPnLFw4odsprsbyA0AlTvBET9H+hhy0sgBtzCwUbN8cWAns+oL2AjqHJWyDXJ40Iae90WMHw7shB71aWg2AqQgH4mnHVEAROYGD16gVSB6cX9Un9peKY+t3/UFOrTYJTwaUxwcjos4UhNOTFEEUoukgeK5tU/jqCYrpH9Qjx3rxT9/HJb2ft7SrjPHOhJQemMXPrxznQvENKlQYHDP8zhf0f+IGnlio+P0l2Mc56GTQofHkTciUZO+MMAN9oPwu2ccv9EGct52/qlGBczcMToT0hv7drCDftSc96KgyJm8saAy6J6YGArhP2R3Sc9vO7xHUSIA4h09/jy+QPQwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjzqmukvHlvvu53Li0J01j3Z+jqSeB1J69YQ7TWjxsw=;
 b=yxVkJB3J+QQANVQltKxCo8qfR/f06+i0ZYqVWgG4xHWkh+R9BlqSfLsvB1YRVA90OEJTTWUUGXUEJx+BHw9xzTvu/YDCzL8Zsu7mSOxhiOLeAy8hdmzhz/V1eUmw3W6y2TWXG12FdvmJsyzQpg0R/DISJW1zOYi+9q6KU3muNj7eHSl5W3zeGF4kgU0uBfgnABXgfbw5Aq9jAzCVajQzvaKA4V18qbUMIpVi9kP+o2IgZyiyQvJEK3BFeC3CylQnN+jz3zaLz65uX0a1D5YITc75m1U8SFXgPEA/tu2bitWyHyUemefr3DmilSEIdgN25KoTttFgOaRLT6aS1NYpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjzqmukvHlvvu53Li0J01j3Z+jqSeB1J69YQ7TWjxsw=;
 b=V0clvfAoSeZ+D4B7pYnwWdoP8VscILMOgVF/7LoLEWamYi5pLyTdfJMOYftMJcekwll88N3G05e9jSWEV8YABAs/nl4GOk+QTQ7YymW8C3hVGbibNyI0rG7b4NQnYdfUB7UjSosYll22HQlV2FIzMMSra/LukihfE6cJ6EZ7RS5GoRUUiHZiRxHI5xvI870j7z4xs78sYzlMlHkvGb90FlaolfkqDVcOKpHkNVh2DW9F59xUFhDsSh0K3wwMAkR2Ki5uxy6w/ueo0ylH/4TbNpZUytEBsa8+ABcIhnSL0jcCE3yMHZJ5fd7sNrw44eal6hmykdDyUb23ldTUwjC1QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 19:27:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:27:15 +0000
Date: Tue, 24 Feb 2026 14:27:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
Message-ID: <aZ37idnmQkRZrh4k@lizhi-Precision-Tower-5810>
References: <20260119183604.88192-1-stefano.r@variscite.com>
 <20260119183604.88192-4-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119183604.88192-4-stefano.r@variscite.com>
X-ClientProxiedBy: SJ0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 28afdf38-321d-43e2-0661-08de73dab79d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Yv3QxHIhbZ5MCE3X8oY7W5sXRZHI2ayrX8pcQYFO1n5yQ1DR9HYkPkJ4llAz?=
 =?us-ascii?Q?hqWtwBNnN0GS3xxzs88DWsyoI6aamz///dD3mgxjedtRnQ3AoE30NC7eibJA?=
 =?us-ascii?Q?ZfFqjIjz0RgNWeXTqoi1Nm4wVd/RsDbINVPh7A5XytrX0yjZl210YdOaJ76g?=
 =?us-ascii?Q?to+s0CY/NQzER+zfnTsYmRCcriSJbRaJ6ejezFU/SNKBDzrXd8DHCU7gVVXY?=
 =?us-ascii?Q?ELKUNW96yFKElKaJtfSF+omXbDFahIo59y5hX7mtSMfcvKAhMYTOzWkP6g7W?=
 =?us-ascii?Q?gW/oawcy1mFswept5McVo1XrH/EwSVxdeGEntaqmR1bKB2q3Tq1hM3bbD7eT?=
 =?us-ascii?Q?r7Fdl7+/yWWfi4gWBEwxX8KNrWkpm7IORR9GqVyw53PTu6/HUM7Rs+8C2TvK?=
 =?us-ascii?Q?rTyPZ7vkqOtvYwx4BG9BOiNBZ4hK/SHJkQgcd2WWPY8FWzBbOJIsGPWWsWZa?=
 =?us-ascii?Q?lDBy9u8xBUsf7Anr9duHfnAkMs37lo69T2YuCwyPt9RRO5KP4etoNn8pajqF?=
 =?us-ascii?Q?n4fT/BbGUz1SsvFntOny1HWO4PC1Qu6EwWCdH7J3iAAOw8ukRqTMFcarsgAn?=
 =?us-ascii?Q?pLlngyDpecedwJZXOlYPJacOGRDZjSyZFg9LNkSX51omSjAclZ39g8mTPgWn?=
 =?us-ascii?Q?6L5s4VNQX9mDV81PboHX149SzkKVJuPYFfl9oOFUbdJLwzeNVqZFRTCsca4e?=
 =?us-ascii?Q?pCi4ZBd8KSiEoK90Rm0uHXtLgpA6UrT7NiwhQA8fhL1mvdvWfV2/lVyLUlDj?=
 =?us-ascii?Q?hXAFjHzXMRbQFWrzIRvI8xCUxpAOgGMPE5k/hyI74ggl/IxJ/g4yWr2WGoxY?=
 =?us-ascii?Q?DiXqgrge1BSgK/iSBa1xCmMoXCr+NYlCRsF1BzCeWJ5gPlLXP5kLQryWYR8J?=
 =?us-ascii?Q?20qDJW5O6u2DvYnCeUeOoRoWIKgYwq9lDcwYAqL09wtPpn0v60pH9uiTcRNb?=
 =?us-ascii?Q?d4uBQWGS+gtVDDw0bjlgiAp3faVxblUjIgn6iaysYXOc5OO34A/+Okh1baag?=
 =?us-ascii?Q?RqfoPSPYU746+uv+1gJrc+E8J7bKOShdZ71aGP7QkPp2JHsL6JmJHmtxPqXw?=
 =?us-ascii?Q?fJo/igWme8TG4uE/N5OYWRZZ3ZR959ruPhQ5tqEmBC9P32tj9SfVgur+KmPZ?=
 =?us-ascii?Q?13HTY9hj4UhTayHPJPoWb+qKdio4YXMBP+AZ5E8RxoZCY5oHQmNdOlavWwzF?=
 =?us-ascii?Q?W3V8RwpHCgUMTRXW0m7Xr0qj37E5dKhN1vJiMvWC0iB6RiwV/vzMiCt4lmyn?=
 =?us-ascii?Q?UUuj78PLK+yvnlc/EeCApc3umzYo8+ALg9EREYHKhAf/w3Utrjq6tS32/9C5?=
 =?us-ascii?Q?Ntq20tC11KHaeQ4WyreQntyqQYjVsUfpa9F1RM/56IbkcM81UjWzXsnmJrBO?=
 =?us-ascii?Q?t0+OK5Dk9bU+o8Dx6vjjrAuwCcZoxrkfyE4m0ko5svY9nEujMURIop8YfBjn?=
 =?us-ascii?Q?siSbjTPtE1BHQOPNYUObO23Rgc7pzt4qNOHFDwwveE2gF7u/7D3HJV+ZuDhF?=
 =?us-ascii?Q?9fBLXYQbf4LvUqUKQjPIl6vbOK7SRndHWC+twP51tqHUhE0ny5TlLpvAUq1M?=
 =?us-ascii?Q?Nj4nN8kSo6cnF8SOHso=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?avdk9bRfvqIcI+mv6JHI/3o0RXRROA8w8M6VF2vumKmJB3vns5b1B4YDwEBN?=
 =?us-ascii?Q?fKdesPX0y4uLTAVDyJeLnhr1kMtNlfmzn/RfOFJM5CJQVTzKN1d1JYjPZYJW?=
 =?us-ascii?Q?Rj8ekQ0EgqRl23CVXNPWanPIyBhC+InaeM1fc6q9sQMWrAzlfvQWqMcG//kA?=
 =?us-ascii?Q?JvpFFla8P72FKplqbvPng8wFp38sdlk86GhEo+H8UYcTUpEYYeybBw5cDhZu?=
 =?us-ascii?Q?R03RYNkt6zhaSegV6GSeW19UVh/jV5uaowtaP/43nLJjnNkMWNUWdSzzEQu4?=
 =?us-ascii?Q?WBfXwbLFIGysvsuBz7+TSybRQ8kFMTcmYME/AGpmNAwTHGCbMwuXKGmAWIiK?=
 =?us-ascii?Q?dd72TbXXcyJFgIdwpgiyPXGjTCfvTiGMT966yemW4DsMS08K410oip/hms4H?=
 =?us-ascii?Q?uWZRSTPIYGQB7X1sIxd+LGTyLP+Wucw5bQoMKmFSQf0pr2hscE2z3Xzfs5s8?=
 =?us-ascii?Q?uc2V5WfGcHzLu1iGoTf4DljffqISVJUvkx4qP4X1fbEURey8ecKbtN6dDJlN?=
 =?us-ascii?Q?eysXpV/R7xPDabHiU0JPJaRv+IIejoqE6mS9FUHRGQuz4U4HNVdgsySKWbYy?=
 =?us-ascii?Q?XRzagF4H9ilhxmi+FtZhvsw2UK28hZaA/yEQvs6bvwraVdsV7TBllBGKU9ZZ?=
 =?us-ascii?Q?x9aKw0+w5TquOPHBJV3XQGYbDogpxXGHTaVH2rwGk0BbwBcGBlUh8HmDpuu0?=
 =?us-ascii?Q?KwbAbIra3Zp/NtcffTVZtwvP1NY6FMc3FClfnhPMYOI6HqgcVRjOVpN8TNVt?=
 =?us-ascii?Q?2WRk9KPNGhv3v6LH1sjOVFcmQiQ9a14/78ybSA04iFkKPVxKIbAYDpR5aqvm?=
 =?us-ascii?Q?/RJo0pl7N1o63STgz2TOWeXMfNTjcwVHeOJQ9LFdyhmTeiS9XaR0hz9fxGWY?=
 =?us-ascii?Q?fTbpI/OYaeKZqI8y2pGPafnMOyKDqkpadMU/+G/2ZEnqwyDV2Vj3radqHJuD?=
 =?us-ascii?Q?4HdZrfe9pB2hctgfacWVAsfAIwtvg6Gpvu0zNimvhpW8vlzw0HU3ka9IXc+V?=
 =?us-ascii?Q?a5k5P0NMtHbvqXMvhOkya3qZl+IYyneN8Q3OZXddhyYP8XE0njOASNXt4odS?=
 =?us-ascii?Q?Sa90XOfyVxlQBQds9cz3e03n25e0Yx+RV8HqNyk2Sr6iBe5Bc6XQHOdkOVtf?=
 =?us-ascii?Q?huCUld/CNsziRB33uzwvTQyOVbEAbxH/wRYF0QAlxhVpVqQmqv9/F2K7XXSK?=
 =?us-ascii?Q?Xd+eVfcEnBUe/7dbpeW2ddbu9rEgrNyu9mTvYqr/lHCJHdx2IN0QGlqCNmPb?=
 =?us-ascii?Q?on66Lvdkr/0hUCgKLcHU/UQaHaAwXOnzYcFLOhHPzVIqEA8sqKwxsVxXgcDz?=
 =?us-ascii?Q?Nuvhar33rYfcmgUG7Xj9alJ2RvvH7O6CL/FOTUP1x+77JhIFYIxuMumlDYEG?=
 =?us-ascii?Q?F7nBL6wS4eWJ5E2YnFLzZfahmcf9uToYXueSriRwR5hElOjoELMHvJzOji+1?=
 =?us-ascii?Q?lNkAyOQr+XNpG7vdABwHfTscmtrgknYbU4FWyAwGdYA/HMYsMG6Ug0NtYkTp?=
 =?us-ascii?Q?KAS0H7WIainqJN7hTopyYi6FO2UNInjghbtrlJdU2zuCzUj5Yvo0jrta9YiV?=
 =?us-ascii?Q?6asgEHcRf06bL12bTksBfvfVMOCGsaiLohK6BZsDuV0NSF20Z1emET0y5i7D?=
 =?us-ascii?Q?lDAPwNKzeK2JGN1b8d6LFlf9VIvtLHyGSssBpZiFDFJwVkMUWWJbvfGAp085?=
 =?us-ascii?Q?0pXOGvABcg/qAQOkFCepY8hyP29SK4sq3NPk/KzA7nhCiM4r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28afdf38-321d-43e2-0661-08de73dab79d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:27:15.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxeSwJy2DwykGXgHxxtOHgAbLWCrmw5KEEQmxWVWe8uGgHF5UgtJe3z45RagXijwMTJDXSYgi44zDTvgtSJLsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117

On Mon, Jan 19, 2026 at 07:35:55PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite Sonata carrier board with
> the DART-MX95 system on module.
>
> The Sonata board includes
> - uSD Card support
> - USB ports and OTG
> - Additional Gigabit Ethernet interface
> - 10Gb Ethernet SFP+ connector
> - Uart interfaces
> - OV5640 Camera support
> - GPIO Expanders
> - RTC module
> - TPM module
> - PCIE support
>
> Link: https://variscite.com/carrier-boards/sonata-board/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v5:
> - Fix newlines and nodes order
> v4:
> - Add GPIO_OPEN_DRAIN to i2c gpios
> - Move pinmux to eof
> v3:
> - Fix specific node names with generic ones
> - Remove fixed-link property for SFP
> v2:
> - Add SFP cage node for enetc_port2 following sff,sfp.yaml binding
>
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
>  2 files changed, 592 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0..411f86013ec6 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -404,6 +404,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
>
>  imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> new file mode 100644
> index 000000000000..840eaa274b8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> @@ -0,0 +1,591 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Variscite Sonata carrier board for DART-MX95
> + *
> + * Link: https://variscite.com/carrier-boards/sonata-board/
> + *
> + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +#include "imx95-var-dart.dtsi"
> +
> +/ {
> +	model = "Variscite DART-MX95 on Sonata-Board";
> +	compatible = "variscite,var-dart-mx95-sonata",
> +		     "variscite,var-dart-mx95",
> +		     "fsl,imx95";
> +
> +	aliases {
> +		ethernet0 = &enetc_port0;
> +		ethernet1 = &enetc_port1;
> +		ethernet2 = &enetc_port2;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		serial0 = &lpuart1;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	typec_con: connector {
> +		compatible = "usb-c-connector";
> +		data-role = "dual";
> +		label = "USB-C";
> +		op-sink-microwatt = <0>;
> +		power-role = "dual";
> +		self-powered;
> +		sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
> +		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +		try-power-role = "sink";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				typec_con_hs: endpoint {
> +					remote-endpoint = <&usb3_data_hs>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				typec_con_ss: endpoint {
> +					remote-endpoint = <&usb3_data_ss>;
> +				};
> +			};
> +		};
> +	};
> +
> +	clk_osc_can0: clock-osc-40m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <40000000>;
> +	};

order by node name, not label.

Frank

> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		led-heartbeat {
> +			label = "Heartbeat";
> +			gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	gpio-keys {
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
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VDD_SD2_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		off-on-delay-us = <12000>;
> +	};
> +
> +	reg_phy1_supply: regulator-phy1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SUPPLY_PHY1";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <10000>;
> +		regulator-always-on;
> +	};
> +
> +	sfp0: sfp {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&lpi2c3>;
> +		los-gpios = <&pca9534 1 GPIO_ACTIVE_HIGH>;
> +		maximum-power-milliwatt = <2000>;
> +	};
> +};
> +
> +&enetc_port1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc1>;
> +	phy-handle = <&ethphy1>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	status = "okay";
> +};
> +
> +&enetc_port2 {
> +	phy-mode = "10gbase-r";
> +	sfp = <&sfp0>;
> +	status = "okay";
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&lpi2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio", "sleep";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
> +	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
> +	scl-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pca9534: gpio@22 {
> +		compatible = "nxp,pca9534";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pcie2-sel-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "pcie-clk-sw";
> +		};
> +
> +		sfp-sel-hog {
> +			gpio-hog;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "sfp-sw";
> +		};
> +	};
> +
> +	/* Capacitive touch controller */
> +	ft5x06_ts: touchscreen@38 {
> +		compatible = "edt,edt-ft5206";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_captouch>;
> +		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		wakeup-source;
> +	};
> +
> +	typec@3d {
> +		compatible = "nxp,ptn5150";
> +		reg = <0x3d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ptn5150>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		port {
> +			typec_dr_sw: endpoint {
> +				remote-endpoint = <&usb3_drd_sw>;
> +			};
> +		};
> +	};
> +
> +	/* DS1337 RTC module */
> +	rtc@68 {
> +		compatible = "dallas,ds1337";
> +		reg = <0x68>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		wakeup-source;
> +	};
> +};
> +
> +&lpi2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_lpi2c4>;
> +	pinctrl-1 = <&pinctrl_lpi2c4>;
> +	status = "okay";
> +};
> +
> +&lpi2c8 {
> +	pca6408_1: gpio@20 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pca6408_2: gpio@21 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg = <0x2e>;
> +	};
> +};
> +
> +&lpspi7 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi7>;
> +	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	/* Resistive touch controller */
> +	ads7846: touchscreen@0 {
> +		compatible = "ti,ads7846";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_restouch>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +		pendown-gpio = <&gpio2 24 GPIO_ACTIVE_LOW>;
> +		spi-max-frequency = <1500000>;
> +		ti,x-min = /bits/ 16 <125>;
> +		ti,x-max = /bits/ 16 <4008>;
> +		ti,y-min = /bits/ 16 <282>;
> +		ti,y-max = /bits/ 16 <3864>;
> +		ti,x-plate-ohms = /bits/ 16 <180>;
> +		ti,pressure-max = /bits/ 16 <255>;
> +		ti,debounce-max = /bits/ 16 <10>;
> +		ti,debounce-tol = /bits/ 16 <3>;
> +		ti,debounce-rep = /bits/ 16 <1>;
> +		ti,settle-delay-usec = /bits/ 16 <150>;
> +		ti,keep-vref-on;
> +		wakeup-source;
> +	};
> +};
> +
> +/* Console */
> +&lpuart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +/* Header (J12.4, J12.6) */
> +&lpuart8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart8>;
> +	status = "okay";
> +};
> +
> +&netc_emdio {
> +	ethphy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <100000>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_YELLOW>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +		};
> +	};
> +};
> +
> +&pcie0 {
> +	reset-gpio = <&pca6408_2 3 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	reset-gpio = <&pca6408_2 2 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&usb2 {
> +	dr_mode = "host";
> +	adp-disable;
> +	hnp-disable;
> +	srp-disable;
> +	disable-over-current;
> +	status = "okay";
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +
> +	port {
> +		usb3_drd_sw: endpoint {
> +			remote-endpoint = <&typec_dr_sw>;
> +		};
> +	};
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			usb3_data_hs: endpoint {
> +				remote-endpoint = <&typec_con_hs>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb3_phy {
> +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
> +	fsl,phy-pcs-tx-swing-full-percent = <100>;
> +	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default","state_100mhz","state_200mhz","sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			/* GPIO Expanders shared IRQ */
> +			IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
> +		>;
> +	};
> +
> +	pinctrl_captouch: captouchgrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
> +		>;
> +	};
> +
> +	pinctrl_enetc1: enetc1grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK		0x57e
> +			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL		0x57e
> +			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3			0x57e
> +			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2			0x57e
> +			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1			0x57e
> +			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0			0x57e
> +			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK		0x57e
> +			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL		0x57e
> +			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0			0x57e
> +			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1			0x57e
> +			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2			0x57e
> +			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3			0x37e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX				0x39e
> +			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX			0x39e
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: ledgrp {
> +		fsl,pins = <
> +			IMX95_PAD_CCM_CLKO2__GPIO3_IO_BIT27				0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO28__LPI2C3_SDA					0x40000b9e
> +			IMX95_PAD_GPIO_IO29__LPI2C3_SCL					0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28				0x31e
> +			IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29				0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c4: lpi2c4grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO30__LPI2C4_SDA					0x40000b9e
> +			IMX95_PAD_GPIO_IO31__LPI2C4_SCL					0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpspi7: lpspi7grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO04__GPIO2_IO_BIT4				0x3fe		/* j16.4 ADS7846 */
> +			IMX95_PAD_UART2_TXD__AONMIX_TOP_GPIO1_IO_BIT7			0x3fe		/* j14.4 MCP2518FDT */
> +			IMX95_PAD_XSPI1_DATA4__GPIO5_IO_BIT4				0x3fe		/* j25.2 spidev */
> +			IMX95_PAD_GPIO_IO05__LPSPI7_SIN					0x3fe
> +			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT				0x3fe
> +			IMX95_PAD_GPIO_IO07__LPSPI7_SCK					0x3fe
> +		>;
> +	};
> +
> +	pinctrl_ptn5150: ptn5150grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14				0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7				0x31e
> +		>;
> +	};
> +
> +	pinctrl_restouch: restouchgrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24				0x31e
> +		>;
> +	};
> +
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO32__GPIO5_IO_BIT12				0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e
> +			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart8: uart8grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO13__LPUART8_RX					0x31e
> +			IMX95_PAD_GPIO_IO12__LPUART8_TX					0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0				0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x15fe
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x13fe
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x13fe
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x13fe
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x13fe
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x13fe
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
> +		>;
> +	};
> +};
> --
> 2.47.3
>
