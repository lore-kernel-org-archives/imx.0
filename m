Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61437A492
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770654184; cv=fail; b=RonoFkYH53WPpVJloR/xc5Q+duh3J1gYy0DmxVq+kBb/ChSj/1fVCbk9VzSFyQQYpT1Y0OH3TDyVFwC7Zb1gIBnHVShnbhvQzY6pMNGWu4biy4JcWN5QxQppe7qtsrsMxF716wtzxGhfO8ZqwBujmv/Uy1g88OPjoK0Crb0U13g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770654184; c=relaxed/simple;
	bh=Cb4gy2/t+gjUjfNfJ4ZPlRd5PFE74FVeVlOl1d4Ygd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NS632LzQar5set5+yK52XZUmX9tymUmmZqhOCRSjenvTY8JTOli7Zc9YaZojggzPWH18gnRe4Yj07dKbrlbFxf36R+gPOAIDMAu+QvLQb+XOt/Ufkpngak2TJzLsezBi5F9ut3nSDnR6Tmqk7qKec+4Z6i6yesGTMw4evGZEHSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B+JfYjqp; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B+JfYjqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlaMeNxXNo4HoAzbdahWzHnljJCvw0hFDMVNdQYB8MTaBZOOk+UpmJvmEqfEJx+Xe1oJ9F1MngYdhtIGDFr8omn2muMXV1fpbdoYurmRO9NRycIeGVuvNbYCeu/nfQryyIzgvsSyERy79SXOf68bxTm7mKFafF5NvBWtYsdCTPaKAaKV7cFxoajVVrFK0mntkXc0s34AzKHYj+TQi6jYxHjcZcjBDNCC9OWVAVKcxJfjgOeprgIETPRyBjZIa3q1B6GLyIc/Di1qs/kYVFOCiACUoNLA+DCDiwFXa2FBdBAHweLgv+l89XKxEQvdFjs8xg/oMyaoxoPnCRpNB0im+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKk5pnZ/HKt5u75PkIUpGsU2bfqMs+869yyY386bo6I=;
 b=g/7oFgRlX2ig7VOf1OQ1dpHM0PBU+jRklijTyrQThec3C+35eM5TkxEBnMnKzRETnyYMbr9uC0qr0dLuNA//R+ujxwzCReVaIzvy1JLBKyrEhkKcjnM5CD5A/UAIg4063dUN+Grq5GBnray2Xju9hemCysv7kbk+1UChnnlDvBLANWIz6NgmISNYK1Pc5nYchffi5zTCX1uyxZHx7LEfWBl9DU6aknwP5XOL6sW2an3ndOwTCAlN4xdnadoGkcw9mhHX/D9DRLoj0Utt4VB4j4ALjyFKcuYqwJIQ8gtPYW5OIO9aOHfUDAGNUS52XZBgyeuf/QDziW+zNZ8VkAMIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKk5pnZ/HKt5u75PkIUpGsU2bfqMs+869yyY386bo6I=;
 b=B+JfYjqpzquWChOfEWRu7vunx2jEIh4mGlmrbNi5g8AbTG2irWQ/utPRVBMNsA7mAepb7XBCraOcem5h/wBUxGNh82P8DirfGXA4OxRE+IcYCSovv8YepNOiravJfforYcAZ3+GDBpuTVYa+T4U1x2Tw1abBCwd2ycKJu3SyXdOTc0mXa1PcDE6R3jgN7IlPoHqo7gOKGIOrYcwkPP2WtLQCgug4SApEfiivlze/Avt45sEfxbHX16EB3s75Nw4EVtE7sZNmw9S1hW1Ocyu3q6L/rHU2KWOcPmoVwsRNrVcIzGs4GsXL5emBBtk8ogNS+adDiQsFxtaO6Vg5b9zOWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9370.eurprd04.prod.outlook.com (2603:10a6:10:359::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 16:22:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 16:22:59 +0000
Date: Mon, 9 Feb 2026 11:22:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: sherry.sun@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
Message-ID: <aYoJ3MUSFSY5boTR@lizhi-Precision-Tower-5810>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
 <20260209055745.1545129-2-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209055745.1545129-2-hongxing.zhu@nxp.com>
X-ClientProxiedBy: PH8P221CA0064.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da2b8db-9af7-4026-ad41-08de67f77daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|19092799006|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q/WZ2pTZbfx/d3mNIma0W2XuyjYehVDzvmHVNLEKBoSViupHPnoqfO4IA4gf?=
 =?us-ascii?Q?nqSHVMi8KaYhUAGL/6pxdbx27Zrm7h5A6/gVmcfcTOroIny0asUVGhrjJ3bQ?=
 =?us-ascii?Q?3jNONVmTNtiho30BimhsPtOibjbPgkv9nKo0Ye0l8NV0pRL1XlKBGdlA2tqd?=
 =?us-ascii?Q?niCppqcmAzcJm0+Lz6XGAhc1FsmjhYRFLbyQraZxYFuKYp6Mzsm6L2JjgoBP?=
 =?us-ascii?Q?K8GwwaDg8LpCAF5Bu+G/TqRUG/YayQ4sGu91221hheGqBWgTym4+iGEaBhQf?=
 =?us-ascii?Q?sAQiotn8GqdqjaepmZwbFy7Fuj8JMmHWGTA5uSr+1kHVTYu3gm3yNdT8I3o3?=
 =?us-ascii?Q?xuuBrhFAKzp8oJpohw3sIJEPQkfE7GhbQguPBw1Zy83pDvOEQKOlaYLIoVDQ?=
 =?us-ascii?Q?jUDwWXqKiCMNcrt9do8IdbBX2RuvY0wRZzQskxfh5AyUVNqU5y/Xk1MIcNse?=
 =?us-ascii?Q?IFF3IJ5OC+EKJ2axhqsQZAO8L1ATrjeluG5Q8Ruu4nO6tXmHMhN52J5IPVbr?=
 =?us-ascii?Q?n0C4zTAH/2jLzVzXoujLaJWzuNMI7mXPw4vvp/zWJ0/OOcvD6Zf/Ej+45Qr4?=
 =?us-ascii?Q?JVrolbX/REhDLU2QO72xP1DAGZmXHznFNzuIHgm0GEmkXkX+Ic0YawYsNXg7?=
 =?us-ascii?Q?e6sXNGArRMXIi794iMMsUmQ8UtbDIOZAC1Ud8z84FmOH4jiFDmjQ1OwRzQQt?=
 =?us-ascii?Q?Bu64w96NuHYfZw99sDg1+yrKaGHQ9PnH9jPE/MRxeH0wjRauI+Sc6mznkPvi?=
 =?us-ascii?Q?aapp26OIDb41RxgWdDbegG9a4RZR709arz75j28JGGBVRbppiccheF8Ib8RW?=
 =?us-ascii?Q?C3Hdeb0HN4ZtZqIVLJbQiC7ORKQvfYV5fCfDwo5H3aIOBSWTI/phYpU7hblX?=
 =?us-ascii?Q?tej25kW+ItLK5vD6RsVjHNAcAoqlqFYOiC9Ns4m7oYSJuAJGw6eieXAv/kIT?=
 =?us-ascii?Q?n32ZId9NNOJcZvhfxT+kCpRpLaawZclkkZc5oZ4adNUfHm5XID9PMjSzFMjK?=
 =?us-ascii?Q?Sv07u2FFVWGSgz9SSXKzLmSM7peE4ApIxh6yTDZnft6oFLINQLUJw8Wn7V+O?=
 =?us-ascii?Q?rrwl0SvZ7yAN5ZfpELbYnH9gQq5c24VTWk4K+WiyniY0uPA87ZoXzyGitqsa?=
 =?us-ascii?Q?haZMoC/yg4wQLuirCGFEsqQw1u1YehCYBnbLuN74oCzLw0lsoMosCJTO/SRj?=
 =?us-ascii?Q?UKVzLarkwX/kEROkd46haAXJsgLcrUU7boTow6wykaohmvBcFRN2WOajl58i?=
 =?us-ascii?Q?O5wxw7Dz03zSxakKy/HUczQ8tYZ9bdPdggrzAo2Oocd86ejImWMN3pP9mjw9?=
 =?us-ascii?Q?u9r1HX157mX1jmNnadsGvvw+ZZmtx8uohqy7Oc3Lf0Az3qoz51dp5HtRzUll?=
 =?us-ascii?Q?ePdjRJCOTAE0Iusmgal75gogpDqjxnsFLL2I0qh8qxDI2g6m0n9Dr5amxFBG?=
 =?us-ascii?Q?LiT4Ho1t+XW+2J+HES9q0SQEnMP9T3AndwTwqxJi8Pqd9O2Y2TRFCvr5Og4Q?=
 =?us-ascii?Q?RsW0dEjyFxv4lIPrRnOeOYo+8nVD1cyTXdPwPbzohRUiPsxExRPQXCuO30P8?=
 =?us-ascii?Q?t4J8r9V1QClcY921osQ2M58cfxPsHXrtVor4U80LHk5i5nXi7JtHq+fHqC4d?=
 =?us-ascii?Q?jwZy/Oc0tX8xMDjiRsqJEY8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(19092799006)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E0q8Cwp7aCLAPAPYpRRlrn1ZGAqyUyD+3HyEIDvmcX7gtWer1iA2If1jH04C?=
 =?us-ascii?Q?ipITBYtYT4onBh50inpzC0zPsxKBqy1ZngEfKllMhZpxMzTRkx9FEb0JNSTJ?=
 =?us-ascii?Q?70Dk2q/r43OhghB0zpm7j2K4as+IxHTbujgDH5On44J1nqmADtJNljzEKYCr?=
 =?us-ascii?Q?O0gBpFpZYLXgX5N/+6tNZWVmgzDw9qYlO2XObLjmaf33fTfMDUOTL9lwZLlP?=
 =?us-ascii?Q?W3MpX3htiOZPzb/uI8GLAbC2KTMj1iAevMlXR+AHS5O3FAgBqARhKUfFBGwn?=
 =?us-ascii?Q?H0Edvh4fNyhHlM1HzvK6TjVF3F1u9hsf4bg4Gd869ANniaZvGTti68lO5nz9?=
 =?us-ascii?Q?/fzRoYXA5V6mZRVYeNBZFJkw0hARLfuCFPo2iSkm1oWW1DS7R8WrH4d6jeKl?=
 =?us-ascii?Q?Q34SL0g7ZGCTUU9syYIKsQ8CYSmVuEBxTVHUnvbJ0FZoheS7XooorVXSQVz0?=
 =?us-ascii?Q?TLB5TqmuXctJIT4pte329SckWcUlWg4Wt1Vn9/jDVIPbetbkHFw6cN0XrjE3?=
 =?us-ascii?Q?do0uAQh1ML2xMdaWOdlcGyrIQy852JWEEw8Mvd1Yi3NjZvmpoxxp4cup8Dtd?=
 =?us-ascii?Q?qsMu0XmpIbBb6ERUmMTYRsYoRevosaMBp8aYDRpJA4UBYcHzJi/dzhvHVhLE?=
 =?us-ascii?Q?WNteccouk/tqDRLDG8dCweRMjRoobIQ9w3vhPUDFbZ2yqK8qr0J+mDVeQvaY?=
 =?us-ascii?Q?o2ALfstH10fNWudN/HUvRsOp2qyu0SPqIwrCtYl6onVcfMIxnFZbHpndFtwf?=
 =?us-ascii?Q?Z2Z1JM/7+DxYMv6IiLDupPK55toXvQBc4HG/8GP6NeIYm3Ashl8y2U3sL9Yy?=
 =?us-ascii?Q?Q4QpQYVk7VaCqiU7YEqywzxyic68yAfpb1E09PQH+buZGNGpFk0J6C0Q4t67?=
 =?us-ascii?Q?+bTWy/En/wOtQWv1+GFDpjNy+4PiajpL0IDQphNCHDb9LcKjWfuLbsfYk+QX?=
 =?us-ascii?Q?hYiGzgTsGPrWz9jTUZrBV63tv90wXtUlLgXfv6uLSBuPrGLff8XYk+TK50BA?=
 =?us-ascii?Q?SedHjZMyn2YTJHfv77R/u5bb8ffAOa0vqzx7OcQBLAVk2+SyuiNX0KYQUEZL?=
 =?us-ascii?Q?k1t517Fl7ZUuM1yRRj6Nu2ac8KHCGUWr7A2uyErYUP9SMyDiHmyE/ealHfs5?=
 =?us-ascii?Q?oiCveACxYBFscnlHNy4Wm3CuYOQC34SSjxGp3zXkvxLGEM7sqgiq/KVTSjFt?=
 =?us-ascii?Q?fkw0m20UElSJ18ukAX7/Yi/scVK02I//bBMYSh/PyewZkMIRsE7yRCwZKBl2?=
 =?us-ascii?Q?NKq8y7TNhfS2taIkUx0+C8QvQTAlKsNMtatIRHR/Ontsp8AppV5PZK3MNcYs?=
 =?us-ascii?Q?lydvJ4cXGaGguWPlaxESm2jfOtSTzh1DHCdzf3HRpoimc0iVabh1eCv78qSA?=
 =?us-ascii?Q?c0L3o3VAXQ3GfM76FS/0mBFGtgbqgkW2th/oaZN4ZkgyQIklD/tsyo/1rrEh?=
 =?us-ascii?Q?7rT3oCuLDX18qCN9OijZ7uSWdkPFfydfKB3YYxamnZgUqQ+hsAMWvzwRV/sB?=
 =?us-ascii?Q?8s2FuoQPhS4RoxyFW6+SvCqAmfeWqOPFZjlBbO8kpEnSpMlgyijEvmcl0QFG?=
 =?us-ascii?Q?Wv6y9Ag2X+wPYbupv6oM0r1R7OWhI937NiqzOk4trvNwdl0I3VZvtQbrO84B?=
 =?us-ascii?Q?mUMo8O97xtI0979VjclWEtbwNX+w6GDrPrGyJhaJ3NBKLS+Z7uyhrG16wG5Y?=
 =?us-ascii?Q?9lO9vBcmGmLYw89IiQiKEC5jZxtN4nf5ZQW5Bwhwn+/W69WA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da2b8db-9af7-4026-ad41-08de67f77daa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:22:59.7940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYg9fl/TwoZ7LLzAwIKv0kDEOqucpeKI9Je9MkHocrd9MDiwbZdvcPtjRljQJVBZEcTWtyW039Fa0cIdSH19kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9370

On Mon, Feb 09, 2026 at 01:57:43PM +0800, Richard Zhu wrote:
> Add pcie0 and pcie0-ep supports.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 89 ++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index d2f31c8caf6eb..0b9f4ea7859d6 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -66,6 +66,13 @@ sai4_mclk: clock-sai4-mclk1 {
>  		clock-output-names = "sai4_mclk";
>  	};
>
> +	clk_sys100m: clock-sys100m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "clk_sys100m";
> +	};
> +
>  	firmware {
>  		scmi {
>  			compatible = "arm,scmi";
> @@ -1223,6 +1230,88 @@ wdog3: watchdog@49220000 {
>  			};
>  		};
>
> +		hsio_blk_ctl: syscon@4c0100c0 {
> +			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> +			reg = <0x0 0x4c0100c0 0x0 0x1>;
> +			#clock-cells = <1>;
> +			clocks = <&clk_sys100m>;
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +		};
> +
> +		pcie0: pcie@4c300000 {
> +			compatible = "fsl,imx95-pcie";
> +			reg = <0 0x4c300000 0 0x10000>,
> +			      <0 0x60100000 0 0xfe00000>,
> +			      <0 0x4c360000 0 0x10000>,
> +			      <0 0x4c340000 0 0x4000>;
> +			reg-names = "dbi", "config", "atu", "app";
> +			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
> +				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			linux,pci-domain = <2>;
> +			msi-map = <0x0 &its 0x10 0x1>,
> +				  <0x100 &its 0x11 0x7>;
> +			msi-map-mask = <0x1ff>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			num-viewport = <8>;
> +			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi", "pme", "intr";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &gic 0 0 GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &gic 0 0 GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &gic 0 0 GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
> +			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +					 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
> +			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
> +			assigned-clock-parents = <0>, <0>,
> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			fsl,max-link-speed = <3>;
> +			status = "disabled";
> +		};
> +
> +		pcie0_ep: pcie-ep@4c300000 {
> +			compatible = "fsl,imx95-pcie-ep";
> +			reg = <0 0x4c300000 0 0x10000>,
> +			      <0 0x4c360000 0 0x1000>,
> +			      <0 0x4c320000 0 0x1000>,
> +			      <0 0x4c340000 0 0x4000>,
> +			      <0 0x4c370000 0 0x10000>,
> +			      <0x9 0 1 0>;
> +			reg-names = "dbi","atu", "dbi2", "app", "dma", "addr_space";
> +			num-lanes = <1>;
> +			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dma";
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +					 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
> +			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
> +			assigned-clock-parents = <0>, <0>,
> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +			msi-map = <0x0 &its 0x10 0x1>;
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			status = "disabled";
> +		};
> +
>  		netc_blk_ctrl: system-controller@4ceb0000 {
>  			compatible = "nxp,imx94-netc-blk-ctrl";
>  			reg = <0x0 0x4ceb0000 0x0 0x10000>,
> --
> 2.37.1
>
