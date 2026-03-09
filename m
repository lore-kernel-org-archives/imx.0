Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D11B396D2B
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081546; cv=fail; b=A13zapv+73wWqlH4dRTVscFRSHq/wOwWeB2p8IX8h7uw2a/4P5J74/6J2zkcIdG3PiYyJftT3JwjchwI0tpk1Eecc7Ndn1asgNVCBzRdVBG1l0l1Q71SyxnigfqlMl71CGuOsD5zL8kORkmiH0INW8yJIkKpd2/0hzrTVN4z0bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081546; c=relaxed/simple;
	bh=AB9WCF0mBcrIjIKEsg+lpxSThtiqWGnhoQZuPn8RGWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RM7Fxk2IXs97Cx4Rl+V155S5VMgfC+61fNwZ65w3n9o3I5miKpQtWVVySZ4kWWMXZGbVCFhdkyYFPXmxqzPW9t5LfLEeDSpCr5rMtvJsVVzv2mKGZ2usmbGPtvoaPtfar7MBMbwwgRa91Os91B4IQYi7ObyCmuJxvmJ+NWeWgB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LDEs6eqi; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LDEs6eqi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWvg8po7hNFtkAQNl+vqgbSkrCCVQ7FUnpnPOWYPs3GnfTItNKa/bxaA/fxLOwjBi00oSllH7BekM2vgOiWJFq9S+7jRwUChz2zlL7a6LRZsu5t6SF9FJjC/Tuc+Jj7xEevTggTbsOSW9dqlEcWX613M7YE4IEtObMQ8EHqwKIRH9UugKvdHqq2X0OToMQjPPydlnhxnYEHF1j16ejpI1BmRLDBuzLp4adEyxBbPxeHE0GbbYusy/DyiYZFo97MmXyaJyMiKC7d3K+fgs/jGGH2zEefImHiq9hMXdYUoz5uhD18CxKIXqljWdBWR6rZERDLLmjAC0sCY71c9iTr84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNVLNEcB/i/BVMvlN5mmnjH/ronqZ9RfHk1ok51j3Rg=;
 b=tLoel73LGxTHxMLY9HvOx7gvJ/Vt+2itz+zTgHivM0xK7GdW1baLd58v9t+CrTWBjG08e2Y8nwlGXd720HYSC6l1a59OkukzxRRU3OhEJ18R8pjo4SLQqLv+zgaXCGyfQwL8WZiUCR6wC0dxftUV1JqHvu0etx3bDbQo6XwmRyCxkXu1jQdSB5ivlMi9ZSL/xIN7bEdnEyH00iYkBAJoerApB076Fs4oo1XbArM1SXZti1b7Gx3N7DuKB7QwPkJ201TdQ5cAmH6BOGElbPpfMK5BbubNfs3Mp71EbPqq2hzt3fcxV5bX3MPzmw1hXEJ3/oGgHFMj1HW9kTmWK5BsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNVLNEcB/i/BVMvlN5mmnjH/ronqZ9RfHk1ok51j3Rg=;
 b=LDEs6eqi9FEQWcJ/QlBVr2Z2mmhwXpKDWNiBPd8F2gz6YRJ00zmnLy1ZTBSnDoRhor/+VF96hZgE4YaoaAkpC4We+fHNXmaV6hSMk50ThRiFxCV4rBv5Cn91nxYnqqUU+Z3J8gEEu+NtW01UbuBl1a9fcGiIlzc/y32OyQAveu7nhw/Q8PcuHBHYG1gbH23UmxEgcaCdezs7SjbFuX9CdjCV9nZtazypt56ErtEJA/LnFlMsZpkagq+XBwQ9qVSo3F7MNG/eaxfaoi2jpiJz3dU1qzw2VwMlySkv98Afi1aKiUrDvP34YqTczIdkNSTQxDTeJK0tUFxRvogRJi5biw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Mon, 9 Mar
 2026 18:39:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 18:39:01 +0000
Date: Mon, 9 Mar 2026 14:38:53 -0400
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
Subject: Re: [PATCH v9 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Message-ID: <aa8TvVC8KWBiVGrG@lizhi-Precision-Tower-5810>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
 <20260226-imx8mp-hb-iiot-v9-8-4533235eeb34@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-imx8mp-hb-iiot-v9-8-4533235eeb34@solid-run.com>
X-ClientProxiedBy: PH7PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:510:324::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: e8805108-5241-4a39-be0e-08de7e0b21e1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|366016|7416014|19092799006|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 H8mvhp/wyKqDh1fyheWzD4XIEQRmL2SV/+81CTmOqk3159zNwU3EOjNtqQQa3ROM6Fu3lXwhjlHMUFmyl3wqN1HKQnUGjuPxE9IGIR6Fwe4v1KwHtx7zXkxjBavl55ZE41yrZ4/zc3wqQO/f9qwMHkht5Z3ayJ2PDojWN2+Yw7+f7PLAdLuL/5P+2Pew8Gz1g1sg74KBHknpfBNzIs2yKBFFTwdXMUZQpbHEk+Oyh969Y2DUamTU8hsU+dGnDdQZ9L1H2zMoMXRNBZpwQjELJ7Yoq+GdNwfne4HTAgykdOd+x6cCgNSOD/rwvrQmjFvq2W0toSJ44RxZMUgRKU0GWRH1BBilDQUsoJmlite2oFxqnMQgS1tiL6clTb2QZzumOrjSxUUQkhZddbhERkFKh55SvWtsWl+3h0cJbFuwb509BEeOHVjGHM4LIrRG/vbMcQbkk4y6dZS2bC0Z5Ntgwg7DofN7L0LaG/X7HeknEDPtsxTo/VIrpWkLx7pQJeax2eMXwPVCoyR6H9QnEwyqrtPDlo4sFfrrG/hkXz99t0Tg8R5zjkh92u7Y4yTPXh/BmdYPKv3HVQGR0amIilGIzJtJGQJJLThtA9zsh1t6c/sPdVGCvL6VZj9CuXqGJUQUewk1BeNi8KXCkoMUtLDbxpT1C5WdckbGSnCs+VqcZdhJcEYHOCKcYctwl14gtBTlMmGyP0rax6IZYaDrtS1zCl2CfNaqV7zzXmw6QMu77vk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(19092799006)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?t08JlLPkmb1VqW6jXw0J+awEAROdG3Q1V1aC59EQJIWTtK8aAMUoqU2XD4j8?=
 =?us-ascii?Q?aRAX1SRA+E4s7QvAT0ck/VYNtzUkamUeqJQKAQJgamLBYVMZvcurS/k3g1Ud?=
 =?us-ascii?Q?bOXnd2Z8cF2cYI20Ga8XYZrK1fB8nbX0RPSFpfb1xdy2tpRHXkkaL2Jf3xUJ?=
 =?us-ascii?Q?mF4FKwHaOqxYi+frbFbDcV4q/0kpYctRInFJ5o/51rn3np3oEbsgcwiukfhJ?=
 =?us-ascii?Q?31Yq5EKSYc+fxukX62kXkUbzvClbYDyEkNHlG1NRzHEjAMVH1MVSB7hWQtAj?=
 =?us-ascii?Q?nHfkx/E0fYIrBpRRMF1fc2MavGuLJxvxAwyE9KFclKL/VhXZT1GAz9v24Qh3?=
 =?us-ascii?Q?rBydOcu5YihA6C/jJe4/a4FeY9LyNSRjO8OKdRwMB8CC1khDt9PP6TucbqKO?=
 =?us-ascii?Q?syihr3akIGJv4pWHE8LuGqam4Gn+A7ZWHb/6s/if2bGmKCg+vsHzxYdEkhjE?=
 =?us-ascii?Q?Zpisiax1nu/Ej7GGyOmRqqQMshr7uLFI4ndSWTXPgKUEEYs1ZJVcGPMiIp28?=
 =?us-ascii?Q?r04nx6xBsBgYJAfCAAECggsIOPu1UrcNWRhm8G/nuXB5+NFNuILdNxe/gz3A?=
 =?us-ascii?Q?nNWrc626FOp5GMOfnntVvUjEu0+4ilP6oV2LG5bnV2NhR4A7FBaIIlPud81I?=
 =?us-ascii?Q?RgAztdRZAa7nAscTxKj5CguDGEmFhcHD5Fbosl6WDkzXpY/h48HuayNTEQoA?=
 =?us-ascii?Q?y5EwzDo7JE8RiHniyMFdnEOfDM7JRmYi9UhMosQbLLgIo7crLLnmeSYHHPxw?=
 =?us-ascii?Q?3yzSs4zGd2j7YE0VSz06Ldahw/mT+OcgX22K/RJap96BKWD7nWnTBUsr0stU?=
 =?us-ascii?Q?BIPv/XkDpn/2gMkiPRSjc7D1oBsfnsdFrwY8+/S9pTj3OyGOiVllOJUQCDcJ?=
 =?us-ascii?Q?1GjxDUMzzyN4MdT8n3EzcEgY5//7+gSIixqGVKpJyz/MX/bgWcfFk88saVNF?=
 =?us-ascii?Q?bH/Vs3blUqESi82Z2QajIPsZhiaJlcrEZuE2jfqsYzEQHSRLlysqEsk8TuQd?=
 =?us-ascii?Q?8aBoI/5CKb3XzSczKh0ByrXMH6iOOBx0or2QYJ4oXiF81uY12Qzj+8a8M9Mr?=
 =?us-ascii?Q?/OxLugU9e4lj1ZEjMF+E93c4/o8IytDCEHkyrpbXWElv5XhmRrHX1OdwYDP7?=
 =?us-ascii?Q?THhMS7s/mCNSnbPQ5OZ0cicbaCF21zp/CMPpDhMy1x7f6DDtaXxuvmgzK6Ty?=
 =?us-ascii?Q?c5lxivayPAGGtLDvrAEHo6oiWnEutXOER6iAfcFAYpYiYT/T5xpmG43fs+oL?=
 =?us-ascii?Q?U5raZo+w8pimfoOuNdfcZeq7CbUUc24LreMzNjeK6iHcduu6br4XGBCZDp6b?=
 =?us-ascii?Q?0j2tyrpSImrafVlmbKCVZeXf0Gqg2yTRdBcgYLSa5azg0oiNiyzZ0jt+H87T?=
 =?us-ascii?Q?ZiO1LPcGBrmqoIZ5A5l/gxmrEDGCEekNnp94rzPP6tZY568zeyasJfTDm12q?=
 =?us-ascii?Q?al/NxGUladFizNBJqMQ/HNYlWYMEQtIZFIpSkmhmBYp2jguialY8NKnbv7fH?=
 =?us-ascii?Q?UzUIAl0xW72sxekpFeYO+WRRtAvSsRwiJoJxkxbzaw8a4dftsboEqmFkqKQh?=
 =?us-ascii?Q?KbzY88M/WyLXzilOsZ+kCeSSrcqqHm/cSuCtq37rOGiuwpR3oOw7nHw/Kxe5?=
 =?us-ascii?Q?gEC8hZtSmBOf6BLIy0+1adMZjYlodyIA53Nb6yxNplyfF7KJ3TgsRV1lres7?=
 =?us-ascii?Q?qUAsXEOYy2ej1VXCD7YfJX56xHndFVXfFFCE31qJ5qG/4mFs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8805108-5241-4a39-be0e-08de7e0b21e1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:39:01.3429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJer6hSdssgElevk52a6dZjf3AKt3efnxaLD0UvahZEU4IZWYAOSBVqRSc/q96hwB6+Y6qP6TgPKyP9XMyD04Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089

On Thu, Feb 26, 2026 at 06:36:37PM +0200, Josua Mayer wrote:
> Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.
>
> The SoM features:
> - 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - NPU (assembly option)
> - WiFi + Bluetooth
>
> The HummingBoard Ripple features:
> - 2x USB-2.0 Type-A connector
> - 1Gbps RJ45 Ethernet with PoE
> - microSD connector
> - microHDMI connector
> - mpcie connector with USB-2.0 interface + SIM card holder
> - microUSB connector for console (using fdtdi chip)
> - RTC with backup battery
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 +++++++++++++++++++++
>  3 files changed, 730 insertions(+)

Please run https://github.com/lznuaa/dt-format for new dts(i) files.

>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a61ed098ff8d..1314aec6634b 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -126,6 +126,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
>  imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb

> +
> +	carrier_eeprom: eeprom@57{

Need space before {, dt-format can fix this for you. patch 1-4 already
picked, only need resent 5-8 after run dt-format.

Frank

