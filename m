Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26D443A81
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 18:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571423; cv=fail; b=GxSZbE0UNqbR2a6aGDL9tSWrpnm6wPGcjHX2YN4sV7aYZ2Tajz+B07mcfyJiC+ODBdRjYvPSGqOGSxEriGqBOPbzQgeRtkjM4JoaR8x6JDqPybp/+J9dtEq4lq5GxeortoVX7T2kxx3mYnsg3mi5nGpoDi9VhU/YciaFZhvHm9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571423; c=relaxed/simple;
	bh=oaFM/WgEo0sSJNpaEFt1SaYPQlZ0zPiSOaBoWlHBH30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WXxDLkB2gD1/m+59txln+vz8HZ4FN+LjuJ9Fsf0xdzhnrpLWXKUtsQI6jeAOqyqPSxG7d0y1zZAEUA6iZAdYLNSRMiNL0nAinFWyvzLPubTuyqW1V2Svj7Hw9cEP1wjHMcWv0kLDoEMKduJl+VvQrtZCNQCMw8TEXoV35rVDNsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GxR8GyBI; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GxR8GyBI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpZ36BC94nLofJ2qCf4FuvibxGUJ4CbQWIPiqHhHXJ2ZiafZiByKq2oIjMkPQjwt+oAbowgNjFC7CiaK5V8sPQx3s27h8DEd+J5CZI2wxzMgJLFbM+SkfiBJNqvtHrYcTx97Uhg0t5aSSjssur7otuoyuB4kLRWFgcx/8DmqK7qe7VYXSQVZrDArmVMfmkFvviaJ3AhsoP+kSPW5Jea5JSOaUn84YBwB9D8dRPnZ/LH04E9JcZL6iuDJbmuT11bmxZFEIGEFkPTY4NxroIM2O4axjdASK6742u8LBevYFNIIIJaDOfImmWsya42VRhhKWvEti2d6sI7+dsYHDYNkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt0tx+IYnRPbsl1u4VqQ63swtZ8sEVShAksOEYL9NhM=;
 b=UOnaWpFFBUfSH0kufOhn4gwYs/z0KTmH4QUpSpKS09o2eD8iuDrk8bd/DWNM0QWtikI7NH/mcTEIVbrkMFiHqSHAv+xTfiQgQiaMBtDp8xed3Yh6y8WO3/a8A9Bfe5fkcV344YmpJh33LkWkQ7ZKGSGwpAkK98uTWgpdGCALHqjwZHNx5GgZ+XnImngtReZE8x8zpoTtQ6Ysugj2+fCl7lfl1ZAea7D3ErasySQw3sUOSjjfLnuHBn9INeL2CU4QB1ruXgqLxaJbUmiLSPTO6v0GouhHe/mtA8e5+fbUmw/I4mka2+bpyqjo6WmrJit0MtRhKOimphxTDYF8tiC9EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt0tx+IYnRPbsl1u4VqQ63swtZ8sEVShAksOEYL9NhM=;
 b=GxR8GyBIpGUkGmQPXcAJj3Fvb+u1dBkn0xz6C+adJPJX7odWv1T2BsXmmAwOQ4LqS7y3jTWVFMRan16RBpiioPdTmhHPHn/TQWZO4SXoJJUieXlhlb61gMuPdbAZNW7iSD42MNNxlKcEnGimQ7bqJ5RcaHxKtUDZePZDmnbRRm5pIY5x60p16JjkMJQCtZC6KuJpLTT9N5ErNA9TzegkHWLe++rsKsiMFXIvhvYdxxz5zMPkJV4R6n0VNcpmmg3GxESu5wqJoMDR8Ir89Rs6V5KhLL7+hNwOItFYDBKSe8WXtywn5fgwpyYUk3Geafg2xwE6Ce6UdtJ+vnqTbs0m+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 18:16:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 18:16:54 +0000
Date: Mon, 20 Jul 2026 14:16:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
X-ClientProxiedBy: SA1PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebe7a76-4169-461e-fc2f-08dee68b13eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|4143699003|13003099007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 kho1rXtgG/MMxxJx8n8K73/+OjszyNdxJr3UtK9wt9zf66XMMmZSH6A8LvcNr7fglNT9UtZOE1SqgphlruFo9m/KpWTaZG2PCc6VAswavB1W7oQyVnpkvXPiR/P5MeILu8Z+x4JUvYjP8hKsqE/CDmS7SSJmA6op1T8mXQ/Z2cdhGAQEu4StzAW0Y7SYh7lKdE1KamTmyPQwNserZ+BzvGfaMlSyu3LdGZJZiko+tUDJT1iXGuRZaR/osDCV9ze+8S67qkMS7lFNItxMuavXQAbSXSXNJlN8lwUCHHecysVOn4/OQFPio0qKaTYgejO3RsjBWga3Dhn+KBW6Q2jUZD6f+qe9Yd9Say9Nle46oYi0DLveV/q2fbMitTWukc819QB3CFDJjjHrWR9ZRObUus/emnQ5C8aK8pm6o75ub4LW0Jagh/pJ5Njo/bfhuRbmDlMz9NpDbq4C0fu/fhm+JBVIKQvSK33KUCKThpbJLlohipCb6HEgg8tXJWHBB238+3/yRFdoF7WBJMPN/IsTUDu7d8Du/w7k+agHkSSmVxFRVqiohPaw1J6j+aIBaP5PzJT2dYWn3RCdRvkXAv7gXoxnPNXnJmfmxfAZGaiDq7SXFjBsIXKZhv8n9aWS8YcydimJ96Ihzu9mmQ3G6qWOr7VrYUxT2ouMfxsHqdm4nNU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(4143699003)(13003099007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MUuWICOnekfKok7Y/uxxFUuoMVh+RbQeDQmF9P/PtW8Y8xVtdZjNcyCD5fw3?=
 =?us-ascii?Q?6x2lJ4ki9p/0ic2aoGglHJdwuEOFiqbzHSfkTt3vmEPIlHW5MLcXFJ/VkMju?=
 =?us-ascii?Q?a+TYgvuaF4hL/oow2pu8f8J7Kdy+LmeqKd+DtsNRDAdv4Ey4joVtSgEbMCKm?=
 =?us-ascii?Q?KuuMmuLfa9SD8EHMUCs62c82ebJNQ1vGxmyIGOg5dExNHJS8XtHPVGEdgL90?=
 =?us-ascii?Q?vb9n6mlpWye+oBD5ysXnckYqFcUROAaL7gHjt166rxslFALUiGNq9sjVKskS?=
 =?us-ascii?Q?tFXRZRHcofRaqc4y5Y4WY6Le6eVRg00vF2bAcKuBi/z0yyXkE/y4YOl3Vt4y?=
 =?us-ascii?Q?3uOqgTm4S1QecKvgTxWsH8Orcz4wqx1XTYrJtzauhm3SdP15fB3JjDgNUY2w?=
 =?us-ascii?Q?XoONxKj81C36gw8ECyEOyORDLZhPp5uyFN9zx7CJuWgacqO3F6AreR7a63V0?=
 =?us-ascii?Q?4XMuirYp8E2Vo2jlE0GEd9QCmX1sTnvc7PpqEiMftzAAXqeP56yea2gl0sQb?=
 =?us-ascii?Q?Qx6qvmqXZWWEt98bCc0DZkkp+TtyXszOHWIfdR4CFPbRBDaZj5ZpzL/XoWgH?=
 =?us-ascii?Q?LT2OPHMn1X+AVBj4nALgPeM8td8X2bVOqtBII7ENUud2y2Vj6mQVk/yjFBRx?=
 =?us-ascii?Q?fYZAEawzNEXnZ78M7XmtZu3jlmQIINHilEiWoBSOJLMqEvuC+G7z+XF9Wuup?=
 =?us-ascii?Q?9N6xyoeDGASrS5GQl5vepD/3qUxkv1BLrqd1XSsYYX4WwRirjlJL8naDWXTu?=
 =?us-ascii?Q?3K2wLYuctdtEViKb0w5l6yfkWGGzLTNinXK7PhpQ3Al0J9kGiBcMwNEle0Fh?=
 =?us-ascii?Q?UgeloOQLkQmp8aUKrza2/A3DUT3snbSBcVivxqfdTPg9YCcqL+GGI0cswu0v?=
 =?us-ascii?Q?gnWFvwSxchVp8M2JEJk157U/fnu4fEDa/GEdxoLOt2Mp3Ox9aJ+8DvAXXLct?=
 =?us-ascii?Q?pMDSRDhgVL2J6iBFgB7VU6/uEFZqsFmRxjVhXI5r1XIc50p5WM62LBdGtNKI?=
 =?us-ascii?Q?lW3en2KFqEQyND4VIQOeLPb4hp/y5++AIWtuHBijNxTj4PK1zzsYk/vDeGul?=
 =?us-ascii?Q?jFSy2CUZzCHIXWA77tcpcEFaefjUqnx3ZzBE19FeloVJshGkvSiKlu9lXdcb?=
 =?us-ascii?Q?LSJe9yKIP5UsO3bSBxTE1LJqp1T+0bOHgbVKVEDKuo3+4YoMcg3hIbKaqoR7?=
 =?us-ascii?Q?lVD3AmdlmtXqX0l9PMLeNt+dqG1fnD6/syhv0p9aFpwVxiamunOqkIEVGj1m?=
 =?us-ascii?Q?cbwKs0Jpkz6uvEcznnpAtxvnwE9yTiIVrRwjBxmeL32SbkqGvO+RIuzU96gP?=
 =?us-ascii?Q?tTmZKeiXBOcd8rfWIA+Ln0GtxySmCbS+dlLOP2KYUWJ3g8WIH6cDXa1liHnU?=
 =?us-ascii?Q?fQSBNi+ex8xW2/VV/Qnga/iBurPvJqPS4FNwwpQlEYcLz3iwFMIvXjkZr2WV?=
 =?us-ascii?Q?yxcDSzCaE2ifJ0il8GobBOXpk9MvMy/kn9X2RCL6VxbNBIpAbqh+zE+RCpkQ?=
 =?us-ascii?Q?ESGbLI8i9kwqmMniktctx3bXJiy6F58if2LcAuNryul8v+x3bzIY8QEybwZF?=
 =?us-ascii?Q?wu60wYwzRsxve61t/+vcoq6XlXHDuJg2z4xjdYn+LYMMyanUYzjMou4P8/si?=
 =?us-ascii?Q?LX2lXmB61frnzWl1qM/tFReHZ2LsPxD41vs9R3Xj7gllIeFeuXYSDEwob9Xz?=
 =?us-ascii?Q?vW0yVNOomPueAk/lKuCl8FzMovsd1ZLF+8ZzEBOjtcH6r1hwvTrnlJ4j6Kt/?=
 =?us-ascii?Q?HxdTHsi5P95mJHLl9qaiX+/dIBX26MTSCtqgxvvM6U8TQznhvz9o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebe7a76-4169-461e-fc2f-08dee68b13eb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 18:16:54.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nE/xaNXhtl5xBSZzTgAalqvY1fdF+YZs4XbVZZ4hfjRob2RiFj1STQoAHpkJwNTcgr2StVSSMrcoslO0Qov2b8+nTFljlWdre0nwtQOi1sVhaR7oemz3FgPdh5vrM3cu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9562

On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
>
> The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> camera module.
>
> Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> Link: https://www.toradex.com/accessories/csi-camera-ov5640
> Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
>  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
>  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
>  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
>  4 files changed, 119 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index c465aa19e526..ed3d678e7c5e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo

Need not add dtbo here,

+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb can
auto dtbo build dtbo.

check other dtbo.

Frank

>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
> @@ -197,6 +199,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
> @@ -217,6 +221,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
>  imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
>  	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
>  imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
> +imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640-24mhz.dtbo
> +imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
>  imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
>  	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
>  imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
> new file mode 100644
> index 000000000000..f479b709c151
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex CSI Camera Module 5MP OV5640 on Verdin CSI_1.
> + *
> + * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx8mm-verdin-ov5640.dtsi"
> +
> +&clock_camera {
> +	clock-frequency = <24000000>;
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
> new file mode 100644
> index 000000000000..0632bdb1b679
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	clock_camera: clock-camera {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +	};
> +
> +	regulator_camera: regulator-camera {
> +		compatible = "regulator-fixed";
> +		/* Verdin GPIO_8_CSI (SODIMM 222) - CSI_1_PWR_EN */
> +		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-name = "V_CSI";
> +		startup-delay-us = <5000>;
> +	};
> +};
> +
> +&csi {
> +	status = "okay";
> +};
> +
> +/* Verdin I2C_4_CSI */
> +&i2c3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
> +		clocks = <&clock_camera>;
> +		clock-names = "xclk";
> +		AVDD-supply = <&regulator_camera>;
> +		DOVDD-supply = <&regulator_camera>;
> +		DVDD-supply = <&regulator_camera>;
> +		/* Verdin GPIO_6_CSI (SODIMM 218) - CSI_1_PWDN */
> +		powerdown-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
> +		/* Verdin GPIO_5_CSI (SODIMM 216) - CSI_1_RESET# */
> +		reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			ov5640_to_mipi_csi2: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&imx8mm_mipi_csi_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			imx8mm_mipi_csi_in: endpoint {
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&ov5640_to_mipi_csi2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
> new file mode 100644
> index 000000000000..d56234913b61
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex CSI Camera Set 5MP OV5640 on Verdin CSI_1.
> + *
> + * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> + * https://www.toradex.com/accessories/csi-camera-ov5640
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx8mm-verdin-ov5640.dtsi"
> +
> +&clock_camera {
> +	clock-frequency = <27000000>;
> +};
>
> --
> 2.43.0
>
