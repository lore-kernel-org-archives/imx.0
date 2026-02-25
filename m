Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83395413249
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 15:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034082; cv=fail; b=nS02j1MH4Dd/5oagTw5kT2TH5mqTwtuQcZuXKMbL6YaN18IlWvxTr78HgxdkPN79fYHwo42sw/Q080XKY7FDotxyCXasPg21AQfbOYUvkWEaLz6zm0VJ2KP4j+OyboREiDYrg0R6TaMzRmhWHl9dJDGzR86Z3o48NB08gn1zqUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034082; c=relaxed/simple;
	bh=ypXOCkgQXm8npnIXZN0WoA1LkGh0ggNQiuw6eEB6tjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q57/VQupN82jWXttNQsEOiIfUfgnYFYe2u63vtRzAEBVYEpCYflV6/m/Jx60X9aAJyuzzl5TSIjAFhLFswZXRfzf38Ik6EKZ67j00nzQVbTYTfyriIw079AGYp72rq5M+tNNY9kh4R3bQeHuUN95X6KkJx3NuFD3cnGxh+IfOdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZgolKNle reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZgolKNle"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgbCDEP8fFuRb4l3rFwAuV1LDE00psJJ1eIvAWvk6P+7aqE71rVZo+mBBg5XXw1tKPwCbIpxlTkg+pd7+oaOxTq70WzBxgtHWr5/TldW2zfzAXtvm0MuTGCfPZj9GOw3hBzNz/6dExGe8VPf8wwaU8uAo8iZyaRn6sK8pix1o4V0xXpbuR44EyCypP9BNmyFnuKP7AQ+GKhK7EI9wcssvV8DSqwag2mcHE9gj7TBGcuImd0FkHHscJc0LTunol3BIg6pH7m1VS9GIfKNW00A2K69O5lZN+UYckcAcQsqgDwrHIf2r1PPe4p9hhMbHmre/DjpEafwcGqAEo8JsmeDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1mUwM00AekQt1WCU+7scxLupujvqYAlESHRf6siSdE=;
 b=kLOwZcKjioVBixjkfUgnVXeKlTD3dc9fSSWWt0brLbSbEYLZxkBHHCKyF6qqq5V3qmDvPlQPIiHpWw8EHJ2ek+WPPigF/2x0jRIUrCYYz1aqSpyo7LCppugy5rjy9CMoEwHNHsfDy05Wd/ItrsAMyf/6+YpTKCgVrRmvMKDncjvjwPg3dMUDCxnrlSNXQ5DvDJuNriEqaVRD7gcZw1hKl8Lf4QB8/QfYXmcl4DYwAFKozIyzQuZz/Oh/6AttLGeOhYlZcY9uKzQaeBMzRS10BZqihTf+nDPKGbLMP17n4M8SJ37uVH/H2yBX5vfAFeIfc8gDBb1SfTHjN2HXS9P+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1mUwM00AekQt1WCU+7scxLupujvqYAlESHRf6siSdE=;
 b=ZgolKNle4JE5AaF0STugHDJ6chYhJPKhYscoMH5CdyjQccHCiKvwX4Of3ElDqLejsHuXPgW3I3prciMvk7HTyNbWS7+i/9rJlfVOhxLi322kgS/Y5oXwBhZXb+GbEhSqdkIxhKguQGn4hZX+ZVv5GNPHDmyM4x7Kg4wgNxtKjn5NwNzYHc+uqdZ2tiZMAsIuG0LgK892pUvRutQ14lO8jSNgms70GTj7RgIDOrcRU0JndZcIRevtvGlhcwpQ6OLIRZhRCIqLXl8H5dl6wzDzn1yveuxwl1wBrzlyH4nbd/+g7/eE4aR6tZXnhZkj6qvTkSnAHppcpF+RYlKTPuyiWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 15:41:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:41:15 +0000
Date: Wed, 25 Feb 2026 10:41:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314:
 fix UART1 RTS/CTS muxing
Message-ID: <aZ8YFYbRIHlcmWk3@lizhi-Precision-Tower-5810>
References: <20260225083419.5639-1-nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225083419.5639-1-nora.schiffer@ew.tq-group.com>
X-ClientProxiedBy: SN7PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:806:127::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: faebdd44-fa74-4fda-c9e4-08de74844fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|52116014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	dXd0PXmExVBmyutr4JcuUoSXjJ4ODQgWxb8dzh5OlYxy9TYcyvfc73wn077+orEpbTn8CKzkwnJrvxiH0+GmQ0MRtadKctV5Njnh1LnQVRvdl8sqfT/1Ofcf/Pg9IoIERTKOCSdtuGwAI/lB4ODOuki5xKRk9UgaAFsYksGPckr/HOdXQNSVRSwGfzzu1eKcbMMplsak0pUMKQTRpjYWvdNJ+9fPcwm5KOmbVU/zrasx4aPyzitc+UsQSCkPFd8WVj6REqALyfEbt8fUIYvMfJe6gx+oJ6F+ZoK+0uz0bfYEzEJmgyiF426ungtIJcZtY7OeWt4RB+huQl345zFZkAuEnG4WRUXG7a9rVYaE/3IzqIobgMtfWT3MuSJmSKkaEuSnAZV3O4NAKCZYJPjuC3CYaK1jyo/DlAvBp2PM5piFLdbcYoRtRNFj0pHOEjNDQ1REfkNPYEOOOMRhgN20antW9I8WchvpQmnUDElWvxXRHTPsD41IHfPoI9+xEvAvgmQh4xy1ooBNBlzDXveSlvTeFqZYfaFtUKZWOkyKLGBblm6wmkYNKvwRxWZJZAhblITzaJXBRt1gCd/5elv59sQf5LnfTJyFBUA658ViR15Y2Ji5oHWgtNFbeTZVinQ0mWvshuNqpGSJ10KTYH3tJORmGJ8u0I89TEG0DY4u04TCxDW4EsZlb2PXJIr92384mS5OiJ3GWAXR5uPvyoTOLwmnc7vmMo7r4CX/XyxZOFE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(52116014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?xPJFQNt6gLzM//Fpd/umTjuOujzrbGJ5HQJKbqQ9mOv2pUu6xUVeIUjSJW?=
 =?iso-8859-1?Q?CjpLndrneaq/qCRfaHdaq7VIH2IZZwIZqxJm5KrhUPWPYg9JAfjX1juT9v?=
 =?iso-8859-1?Q?V0g8M8qoLg5k5+XMAa+KM0crV5+KleqB/yP97H3+zNeglV2ZIb1MuQBMaH?=
 =?iso-8859-1?Q?UB8qfObAfb/WlNTu4wz2fdEx22ExEg0GPvbm8ZP2vThUTtO4wHHUYvVU9Q?=
 =?iso-8859-1?Q?AFM/UioAI8qfBicsvItN14JvG4Ndk1SkSkG3PLduOXc0Qt1WljN34qeazx?=
 =?iso-8859-1?Q?cyYqsdj3GmJjeiiQRKHq13jLTQUpHv7sKOYwi3sfnnFc5GdwBZLJBz9fD2?=
 =?iso-8859-1?Q?UhArP4E43u4dj7rzLXOd1ZindBteDKIFb5BiUz8+hIW8Im68KSocApJzJ4?=
 =?iso-8859-1?Q?7D4kfUNdIYS4Lnoe1vQ9VHGRL5EWAtyDSMoGHbi7/PFN697AqxlS7hiv+T?=
 =?iso-8859-1?Q?DoFfA0FSzUCuvvgIpFHOD3jzvWgA0o8E3AnreriBM2+aSqinZBXZwf85Ag?=
 =?iso-8859-1?Q?PF3N2L6TKdKtc1H1BTj+ieRK1xx5SFIUaU9eU93vn/cIdHoZtpdljN5RrQ?=
 =?iso-8859-1?Q?PDUpUj0O8w2Z/27TiWNmRh3cMjwzprCQnShjP9yD2F7UFN04Rdu/a9G8BU?=
 =?iso-8859-1?Q?NDhWjGT9i6GPYbG0lKsa3jq8EmJTVfYKq+C0lKwyNZVmRY1dnxaETllCUo?=
 =?iso-8859-1?Q?azZuG78kyUPhdx/Rt/csQkl0S+3W+9JgnMohv8mJRRPOH+xRNR9a6koiwf?=
 =?iso-8859-1?Q?3OQE3PaKcAlSlMkpJN8kvWLuZ44QA4Yqp8x+8vw6UWtUYW1g1A/FGk2/j4?=
 =?iso-8859-1?Q?75n+dML/sRFpFU0tGScjQadaS1fUPl+854FmWflDu1ScAqBes1ho5jpOuA?=
 =?iso-8859-1?Q?nXMmvA8uuWtdgr9HFk2/0qtz4NG56pgj0UCFHZEYQDcljWqmjIP6SFodgF?=
 =?iso-8859-1?Q?qStb6XGCGQ77B268DVMbQmJ7RBnLx4YUELBAXDrxCnIkp03uoTSXQCw+12?=
 =?iso-8859-1?Q?SxXxmIUFenQjdplgqVWMCdByaEr6EYjmG4ZiQtkXwk7WgK1KLSrhOkHeQ1?=
 =?iso-8859-1?Q?EnuVKYIDiwNeqRlG9SFneU07A48ErZ49AvblBKKCvFtjRI8gIfxVsGBpmP?=
 =?iso-8859-1?Q?DhWMmK4Y5X8AVeVfizU0EwLu9jI4Txx2/wljIeF4e9vK03Xksxusq0eb4N?=
 =?iso-8859-1?Q?ucRWPcWKWT/WxcqsxWMUO64guEmY7xeRAcs9jHv6XeplNBvXoDULgTLyGv?=
 =?iso-8859-1?Q?t2JMcikLvSnM0q1lsASpB3yJCJLcb3sstcqGaw9E6qOwEOxSgC78y9l2q0?=
 =?iso-8859-1?Q?PGF6OQhcSaCVS3/dKHO/SQnE8+6QRUTJPhW/wVCdiUqOMG9EP2cMUm4glG?=
 =?iso-8859-1?Q?MgdyfMxTlRWKqaxOTP2zN4l7na2h+wVyKUO8WOAFV65jTSRTgXGud1IUX8?=
 =?iso-8859-1?Q?xWIVCL2YbbSxiDdWcgt9GFKqvoF/qUbrnm3L0BndzZAdDwRZjnBisihcbm?=
 =?iso-8859-1?Q?of2uK+iI1tIR5XVFTcImrfgkBdtlV1FKONjj2fZefRA4KsucLv/6RKfme5?=
 =?iso-8859-1?Q?HnK1S3GmaJtkCWfbdnGys2oIGAAGJO8kO1JWAy2DB18v9PtYkP7ahheaXO?=
 =?iso-8859-1?Q?5WnyGamH0/qnUkRm81imes4qZ80Pq0klqVgXawy9H0uSExCWsycRt2bsze?=
 =?iso-8859-1?Q?PLxTl69R4FCQbnK6WwdTsptIk8oPR94vcThnh62/nXT6w+PVCVlnrTe7yO?=
 =?iso-8859-1?Q?jKlkQRf76jo0tUnZBLAIxmQ7q9gGoDyoUZ/1NEBxkHksziPVjd5llE4qmG?=
 =?iso-8859-1?Q?ORbBF0g7Jg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faebdd44-fa74-4fda-c9e4-08de74844fbb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:41:15.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLh1Cj/oekvmMhcNhH2iZwIrzOc86iYgJtSsA9ULNa6RGn9OwayhcUacpxnKfQB8DnmyKHSd2YjwJEkEmfZ0Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355

On Wed, Feb 25, 2026 at 09:34:18AM +0100, Nora Schiffer wrote:
> The pinmuxing for UART1 was mixing DCE and DTE modes, which cannot work.
> Consistently use DCE mode.
>
> This switches the RTS and CTS pins, which is fine for this board, as
> UART1 is routed to a pin header.

Is below commit better?

UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
configured using the DTE pinmux setting.

Correct the pinmux to match DCE mode, which does not affect existing
functionality because UART1 signals are routed to a pin header.

Frank
>
> Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> index b7f69c92b7748..1665a5030b993 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> @@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
>  			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
> -			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
> -			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
> +			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
> +			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
>  	};
>
>  	pinctrl_uart1_gpio: uart1gpiogrp {
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>
