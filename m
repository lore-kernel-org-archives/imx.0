Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180EB30C601
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346565; cv=fail; b=jB4/MTuEfvBiKc12dRcFpbspOPAddoDIsCc3d1LBxblgy7LruSUx7cAYDaPCik1S2gKNq2k4uObp81nl4hBcMsj4RDFHV8AkpkVTxGVTYgs52P+QP9LLLD6nVTZ7H7fwCjlIDeqH6cHkb+P7VfAIUSfcbmL4B6TW5LxFcTjGTUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346565; c=relaxed/simple;
	bh=7uG3jpCdtZP1sNAGxrcHukh63Z6gJjXuMSkDWwqJNY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f0jzYW3LvCdqnQs88wiepUDx9PoW0GdUzUjzy3QVKGKHRrLx4/sBzE1OH+aG/1Uz9wDU9EPmyU0QYx/AiBAluFl9kA+oXauv4BgyyxZUsqwQPP64KTMvF0Hm+ilWi7tnJhc2D2iQnYx/os8ZBOoCLGg/V0Zx3tSwYQLRgN6s4I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ampqvswQ; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ampqvswQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Boc0jrgqXJNc3pq1tXvE/WnER1l+bBSPKHJ4y0OQkhDQekb67V3KJO6sBT/+PkbavjMgSaLUr/spSUtMHCDvZPEwJU7sh6AeIBDnRRRUrl+bYmc9qM/blVvqUksWc5J4oWOanoZNXTkHYynyJKOW4SvFYdqY7Ek7IpynlrGFIVpcxu9CuKFzKUVMcCkDjjMQwqQ+KRvo6qVbns9AI17smgpXq4o2o0ZjOC1pyEWExUt4zXB/OLsy2mgBVAQqaxyIWAQaTovh5JU8Rbc9lk48h16daGJmYDg0V6oPMWEQ6MzrGpBs4VD7pDonEsvTXXtMNWPziNjRf2B+1I0tK8AnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVN7Na/CxCz+oWvjciWTQ4wH/Ami14pOkRs92IznNTw=;
 b=rkiTvRdXyUznXp5SMufsynvIPh3+ivZmAjkmQlQNY+e3vTgGzZbQ27Vhj7oDji2KZZYJqvh86lusEK4OrmkTKCql5ii9xACHJ/xiws/EvYFEYHIhZDv6UZpse4E76hiD+rq47M04ZgYz+OC7VeY+i56cUGB1rPZH9rYva+Y7G/j1b584TEDJTfo7MzhAFxq/8+K6WKrcVciMybm7ulCiGjrF+dMzcm0ostmEIFmqer13obiFkCoRkIDZsIPFQNOK1cjlELwOCs+bM32G/4PUEjlOL0WyuhrvexT/y1NfyC9SnAdE7EDDmyATggtx/3CmSMlqVCBfPvp71JMtVlRf5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVN7Na/CxCz+oWvjciWTQ4wH/Ami14pOkRs92IznNTw=;
 b=ampqvswQHoIIv4wYtOxQqTkdtJoD3SwL/t0tB9KGzFHKYBzcQ41yxetB5gPeH3Mx9wmKeou2I97YJIEOQaPQP2Z93GD3UWKJWt/tzwBKX9jrMXOXxuMB/UofxmVOYHPCZU+67dPRCUzaxJ5B1M0L0UAwNAyxQEu1qOY0UJ7GwJhHIQP91eZ/0mL0WTvuoqN/mEau7+0tzYQ/R3mC3UYiaTxTd1ovkxyD4PqFzsc0ZzqUHE635eNLd86Y6eHYBtZPUIgQYa/RXterv700OlLF5YYr4gdfmVJsaJ/SG27mmhm2T+4a86puG+xBeTsssyDjEFI1PooT3bdBkcPdlWAPew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10976.eurprd04.prod.outlook.com (2603:10a6:800:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:42:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 20:42:39 +0000
Date: Mon, 1 Jun 2026 16:42:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL
 handling
Message-ID: <ah3uuIeZ4Z6BMwfi@lizhi-Precision-Tower-5810>
References: <20260529134850.22196-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529134850.22196-1-stefano.r@variscite.com>
X-ClientProxiedBy: SA0PR11CA0141.namprd11.prod.outlook.com
 (2603:10b6:806:131::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10976:EE_
X-MS-Office365-Filtering-Correlation-Id: 48aad05a-d5a8-409a-b28e-08dec01e51cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|3023799007|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 +sRmyu9WoCI8ayxqRNzk7GDfc0iV3SswyCU6u6LYHUDSJWxFiK8Bav/IgIe3OwuSfz0ym/NSC+Mr6NJki+5ahbSDor6fYjHwG5gTGXkWX3KMZzgYgDYNUiHDDEwRl8fTYs4qdTKrsuoRhP9u5l9AkY0HUQZwQvTS7crEhcCpn/YN1XcO41UNiY5CAAZRpGuM6OzyMhkt8hiOya1AbvhuwIXzwJ9NX1d0KZkEgPB2MIV5nbDaqeu+VJZXxF2N99CmXpX3Pe+1taHk/CfhWhZSrinWiqW2hQNU5dTM5I7Rd7dBlZUjnAoq4bVbvPZP4PLeYkJcjY7Kn3H4jCVzKBD6EiUJxBuzJ6SG6+X9cAx2T0xNxi0f/96dH2xWDc4y40pl+3rE13ZzdeuJLmWNR1LYwOODiogn1/hpbKVbWc+Tg1GqCzOhfe+S6aX9yxm6YPiO2mPheFm0WbJdxaOdd0ouSKGrM09WwiPzFZ4zttDLs1+/b3tJvfphvdgAX/l/Yw/LrjALdudGhm3sFDX2qvDaQS+QUHLtxp1Lc8azEwSBUMk1gYq4h5Tdr6/4RK3z+vSBg80su9jwhk+tFojOaIO1eIRFgHmxGzc3chm4V69p2qBr40dqq0VSBNAcTfIjeYZgIKBYcPvY5Gmg9wnNlR0T4AA7b4QvuNZR/0upab51dA224qNZVZBRswiL9Bihdk3PMKDgI97YTYB830ZSskjZcTNDwHvdwx92GazavkeVQCixMRS/yZrEswAofqr/0ZS2
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Rtb4Q6ujcRa3CHSX+ECShuh6gm7S3IAICensbajS+jioG+l/dMDYl66+iTgK?=
 =?us-ascii?Q?oKnpOOez+V+2SMpWCjzzO351qHBlm9C/T9RE9eR++n9+nLX7PDoVwv6+VW6u?=
 =?us-ascii?Q?cMrFGCgXMJcAmB2+Rty80qqGls6h957dF8MMT47+maF75J00lM6OfJI6Uszr?=
 =?us-ascii?Q?dP1vV8pG2fg/cogyBOAwRwKR1ucN7qIzc7r7Qtsgr5YfIYsQKvangETloQLx?=
 =?us-ascii?Q?53QcBjxEY2sNZeCZqNSIBxAWorQaXMod+MSOXg+1a03mQgCKxIQlTklRbbCl?=
 =?us-ascii?Q?ELKezmrWM+5991daqzWpB4y5XSGlL2ZMowuNbB2ELeNVeJsQApnT+ze13byh?=
 =?us-ascii?Q?V+x2agorKhKqZINhUMi9TQuQLLUmc1sSDC6KZlyzTnAxlK05psVBMfz2sGrh?=
 =?us-ascii?Q?ctDHhuFspiXxGspEg52HOWcRh7wQ2g5yL3ieYiwKw06Wxnpdm9NqxGmNvnc5?=
 =?us-ascii?Q?+2ceEQM/oLE3Xjoq/JDVMGBakMlMBtOirV05eXb/HWhvTzWaSRdzigIQuavM?=
 =?us-ascii?Q?wQMzG5aIoNYd/5ySIBhemhOCML1zCMr/uueXnwzFpLkK4PcxZgL13Hp31V/t?=
 =?us-ascii?Q?Sje7AGw/lJ/yodVDwXvtskj/ySv7LSmpYaWaYT+kZAq6/OgKIqOIItxHO614?=
 =?us-ascii?Q?mrD1qnSnG8Co2EtPr/Z3N4Jj757pQScmwNQASgdpDMfqHenpmaZo8YQWT0AC?=
 =?us-ascii?Q?ly2uajV2rv3TtQrSN3rpjHrmNHqEGzRlHKxbP52lKPY/FTfop98xM/0BI7EB?=
 =?us-ascii?Q?V2xxjVmAEX7NkRJQHqhNYn0JuxUrABOxcJI9lW14VwtaFSveH+ig7DQkgMC7?=
 =?us-ascii?Q?0hvBVjmsuoAMz2jmyEpU11OEssYbchFfExFZiC7NmPTV0aslpzVkZdtd1E9n?=
 =?us-ascii?Q?fEmE5sF8Tqi3G33So/lbg/EgDVZeq3VP08W+zy4X8mTljSQq9d7Cw5rbWnvR?=
 =?us-ascii?Q?FgZF26RipE6++1C9P4fXTn7WN4bIR1kqESRALWazE+6WNEXAgdNim+cnpc1G?=
 =?us-ascii?Q?CeWLa3pnzpigECWxA7U0hP52qa0gpMFeSYfbd0q9nKPYBdDhb3NoNUjH+Bir?=
 =?us-ascii?Q?iXWnei5htycqp1LJNbqTZdNlZUicBc2Tbp5Ba4U0ZqlM+zYtObFifwg/tObN?=
 =?us-ascii?Q?nuxgfqeuYP7igv82ilfOQnTYh5jx21cL0ZA+B9pBs9Z68232DBBsq/fmNM4F?=
 =?us-ascii?Q?PA2XXN95zRaVG4Z+/MCLlf68vyeTsAhaZabcX4CuTi82aepunM5J/7O3dV2m?=
 =?us-ascii?Q?MCc4v/x4GD09GxHsCkBIvAvXfAMgxuOxgj+5KdKelzZdlNmlTnZPwnH4RcVE?=
 =?us-ascii?Q?Pt9+TgjSyC1knMlmu9N0zD2JrM0nP6gkbVoSkfF+8D7B7miOuf2aNDZPmwLa?=
 =?us-ascii?Q?SYfp21HDs8TvzzuLaMNBVuWV7vyGyq/ZVAIloXXnLyhfRdno9qh/4MAec/5S?=
 =?us-ascii?Q?sUdxii8pdUkLgF13z/CEOi8jA9zvTSWQCFbmdsrVoqK2MAJ3f7C8aKgQ9FMK?=
 =?us-ascii?Q?tmiPq0I9963bDX7t3DjilC8Acg6einj9CDOCT+WCmsjpIUzvEkB1Bf4IeLMe?=
 =?us-ascii?Q?5m3XUYctvASIOEUHsuF+/czR38WzMHjHxpzENx9vqQZGka3hS6mUIw2gnDCJ?=
 =?us-ascii?Q?r0S7TAUB4wRUcWfHljzRRZApiUotbbaU2ppWe5RLfAbE9Ihpz0imqv001+ue?=
 =?us-ascii?Q?Opr14L3qcFChmDcHf4E1qLCPGYXU+OtlXSckPNEwHmi2Pavw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48aad05a-d5a8-409a-b28e-08dec01e51cc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:42:38.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTnpybyxmGQloCqfv0JjuOSQksxWsjMDA8bwMnshplzoG0L+tr6EY2zwg2e7CitruXBP0GF+1g2CXIMI3deYiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10976

On Fri, May 29, 2026 at 03:48:50PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
> the Symphony carrier board.
>
> The signal needs to be driven high on the i.MX91 variant to keep the
> board in the expected display configuration. Move the handling of this
> line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
> the correct GPIO expander.

Look like this can't resolve your problem.  gpio driver may probe later
than display, so gpio-hog may not set correct when display setup.

Frank
>
> Fixes: b3292129dcef ("arm64: dts: imx91-var-som: Add support for Variscite Symphony board")
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  .../dts/freescale/imx91-var-som-symphony.dts     | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
> index ac9fed58357e..c1e6c9978275 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
> @@ -97,13 +97,6 @@ reg_fec_phy: regulator-fec-phy {
>  		regulator-always-on;
>  	};
>
> -	reg_rgb_sel: regulator-rgb-enable {
> -		compatible = "regulator-fixed";
> -		regulator-name = "RGBSEL";
> -		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VSD_3V3";
> @@ -258,7 +251,6 @@ pca6408: gpio@21 {
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&gpio2>;
>  		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> -		vcc-supply = <&reg_rgb_sel>;
>  		wakeup-source;
>
>  		tpm-enable-hog {
> @@ -267,6 +259,14 @@ tpm-enable-hog {
>  			output-high;
>  			line-name = "tpm_en";
>  		};
> +
> +		/* RGB_SEL */
> +		lvds-brg-enable-hog {
> +			gpio-hog;
> +			gpios = <7 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "lvds_brg_en";
> +		};
>  	};
>
>  	/* USB Type-C Controller */
> --
> 2.47.3
>
