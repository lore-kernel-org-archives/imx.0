Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4F329E53
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395970; cv=fail; b=DEdZA79uvfhnho/VJ/5zcq/S53sABtJDTXXAf5U8mYCgFzYAC3afWnd0lk4BrYNESt3DBbVAvlVTyVKGz+RGeODqKcp4mz0n+AGtxanDhDpEtO1U9oSP+QbAeOieSc9+lmm+bnNOL+6xKvjGsoQAFnFBhsFQuXoklmCIOm9Sbso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395970; c=relaxed/simple;
	bh=xENy08Flg4Ciyf2ZDjZvP3WazlKQO4QBDJiNlypqCxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pTriua8N+Y3Uw+1UgY/tfCp8+eqHaNyZfEsWk97DfAoBJxPO17NJFOy1Me/fh6P/fvbei7As+LkwJBoqCcX74sdBAVSBMNdobDjdjlmlHeQ2/0kY7wHweoTtaqye7J2O/vypNypVlqEOMLmWWR/4ptGAmVl/ZpE03fr3LKOzfms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KkAKnkg2; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KkAKnkg2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wox/eYXy9ysS9vtA7ncD+KVW8O4gc++fCuOTuBzenF6SFD2FtnCsYokrwTyudDfu897i8953dk3t50FgV8VVYx18JTYkRH4pMPpSjRNy2jCAZoEfZuranyF08Txj86X2f60WvmysKxhRh+V/YppEzXf1QStFzbaniO2xbEC8aA74gwrOymOJBGF1Kl4dax8CWjl32jB3qnpOxPj3n53OYNxz5a4uBxdZJ8bkB/1kGfQ3LPdirLxMs+dl8m+62JdGI6JMvq2W7SKFvNynOqn4w9tGJX4VJfqYJYkZCxcaryKFyEEBqyqKtdGJu5ct5CEyZot61hPQuBFeM02zwcU0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2Dj6ohCmzOto7VwCGXW23/JY9Wj4SjMQHfiij7NcMo=;
 b=OH5ltPImAV9Cdq5NCA/ZR7s8cfdgeb86GJW0g/+06NSBFnjVR94Fkyb4hpFSlXuKpq+IlVr9XVYbyoS35mqViOGOPY5zQlBbHoIIvAp3PY3YswBB3a1SV7LjWe2wkLChRPeSAkcfkQPVvzNpf/+FVbn3L0P1lksVgp9lvoots70/bB6E5EHEAs8ihl9PWSRw8N9UbMxlvPTZvxVSRqLVS0EtDmP61Jocre5dSAoZyv5laphkDJugTf6Z9KaIP8JgaCU/qOLytph8D/BVmno+8GJLyHxVYczzOjOAd8+N+GXMNBhl5eGFOFeY6LMBpTFpl3jp6w1TuVeVIBQZQ2RUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2Dj6ohCmzOto7VwCGXW23/JY9Wj4SjMQHfiij7NcMo=;
 b=KkAKnkg2yvx9gVrl/Zkk+DiKcw7qJzNNDUXI5DSj3F+xxOxd3pjDqgu+I+OuTQQlqvhX1KvJnnaEVH3Sw5qwQDBT6G8M3SmQrQwRhyW26XIsG36KZA0KLb9SFEztRAbF/FUhrTfyc8CvyIZoPGaTbwGgy5pYaGmLWCeEf/3EeUxJfr7kFjER4PYQPHyPwI6pdtTX7Zwd1XjTCRjr+CCY7VJz1lU5ar//mocNoSIJdTjfn5qEa8RebERQcUVRi8pVCzrZgQ+lV5bDnzH9Q4Jt93GvBL0EacqFSlc84AfBmDp6hl06XqinNNGy8RcVLh9gWhSSrvBpyDyFO/CcvdqpoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10603.eurprd04.prod.outlook.com (2603:10a6:102:484::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 16:39:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 16:39:27 +0000
Date: Fri, 6 Feb 2026 11:39:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
Message-ID: <aYYZN8ODrxumC1-X@lizhi-Precision-Tower-5810>
References: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
 <20260206055007.3995679-2-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206055007.3995679-2-hongxing.zhu@nxp.com>
X-ClientProxiedBy: PH7P220CA0159.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10603:EE_
X-MS-Office365-Filtering-Correlation-Id: 183e9315-4922-498a-2a05-08de659e4b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UO9TNKVlaAfZ9YWkGOQxcHyu7sFpU7J+G66bDMd+PD+STQvZXQzttvXd19TR?=
 =?us-ascii?Q?fRrWtS7rxpkGicvcuLX42UYQrXMyR3seafgLc0q7VItDpYdQoUs2PPxsZwtV?=
 =?us-ascii?Q?9Q2zHg4fGwlyrVI9DSQeBfXrC2eRasK1GkwCPjSo4PW/Uo3Yqgvr2ix77UOH?=
 =?us-ascii?Q?vn3LudQWD40xmrLdONotZjSOvtrx9ATBL6+RdIpFt9dLaRq8BYTlNmw2zbEl?=
 =?us-ascii?Q?Am0LxdFQbrnzkO+SmTrk4d5/cSp0JNv4F9qKy7O2aZSyc+Ln5ila1laTCRLR?=
 =?us-ascii?Q?kWympow4afbF4enPtxTE0f0KTZ8RBlqfwUU0ciNgbSis8JVSTMBjUdASvR8V?=
 =?us-ascii?Q?obBWAElgXQQDrq5QKP2CjwXG7uEK/EPOy5rSEgWzYNAffqn/0txEZnCElMtR?=
 =?us-ascii?Q?bsLRGBSwCvYQ+pGlfzSCgKRr6T7lJt2l1/bI6iYDA/gr6J0oT9N2uKJ+3nVL?=
 =?us-ascii?Q?59L+a5PGVxvPZJrwrmPcEwpjvO5Nad90ccx6ZoQoW6xCZBCSVh9kGa2+YPbQ?=
 =?us-ascii?Q?nFgE1ofVEs+Dv5Ri3gyiwnJzoiZGJzdQue6zjq0hlnF6tFgCsWJlmoFiEZO4?=
 =?us-ascii?Q?bMqEJN+MmyBxYEIo4FDe0YSgAe8WkE4/PDgDoURn2/KE3UQMVzJVKlTlltV5?=
 =?us-ascii?Q?d9lOmWADw5P7heDrdbE1QzhmlQL0+eDUAJ6ucxDqOuGSBvnaoA22oSKAQ06c?=
 =?us-ascii?Q?jkiYvudQR8ot7SQc9lhv+wp3c0K+FvmYTcxrMGwU4yer+s7coAcGOvhc92c+?=
 =?us-ascii?Q?cCuYd6JIM2Ou7aHISrMWHXvQdqVHLJwVAJTns1CClsq0y7YnARFK36tlPZvE?=
 =?us-ascii?Q?TUojcHZmYOVyPfbzNsDyAsJNYBSG5CeBBGEFRtW6obsHr+7dbZo4upXKdYTl?=
 =?us-ascii?Q?4kLE59B2D3VMKBoCfrwuBZjS5DjCLI5TR7fIAyUEMA7QQO7SUC1iluRPwAbD?=
 =?us-ascii?Q?TGXv8hCgTIJ7GQEmXLRWDrtKzLbsgZHxPoy6VgvlUFlVpIgkGyOazhy7L3iK?=
 =?us-ascii?Q?J7+Rv88LAcgR+R0NsSR8HyqOyqJBLxQw1MfQUsaxvb5NxkK/q1Ry1eL7vDIr?=
 =?us-ascii?Q?+EczpX/Qt0wheamkRNvVnGYZ0h4l59gaJtA9fcMyrWBzLbbo/wsglrUZbgzF?=
 =?us-ascii?Q?vLfNryhsMWRUTBcEwTvd9aubsX5NiS6vOTMWOHfx19VXnSPA6hGGwWa6XUBf?=
 =?us-ascii?Q?odlEnKRMO6eRU78kVUmIlbLTwmwWOK7mXdWM/Cj33gIhHt+vbmcreC+DngAS?=
 =?us-ascii?Q?q1ivuYFedlW5dR5pXvd6KJtCMFvrxw/5FNpGErb8mN4LmIDF0baiMhpEa8cE?=
 =?us-ascii?Q?AcNy1JskKH5JfJcaYXZP2My97h80r9m0E5oPD7DolqdovDrgNHmuVMPOzqvw?=
 =?us-ascii?Q?0vdWe2iXaOtIoEs2opq8D+wqBDJvi7/XwUZBWhTOFFxmZSwEGyBYS12vo/5I?=
 =?us-ascii?Q?PI/5u+BUJ9FYxC55745EwKJ66no7/3awb7men+DAtCqwcugYqPRGmOyDrIwT?=
 =?us-ascii?Q?EqmAJY1Zi165bNPlCIr7qKUgR2bnJ57Tq0pD9XJts5AWXOKWM8U0E9BIRycA?=
 =?us-ascii?Q?+ZAk3862BrxupahwDCpoXGnL9flRYfZZXQeOBf81cqgb0zMRp/cJrfpFaII6?=
 =?us-ascii?Q?u3YEwMR9jiCTlJOS5PCPNXw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+KxgRCigrsE8lYtc/Ayb3FPGPel9zaqdJ+kwLiUsjhsRN5SlzgPhS2bB8DJ?=
 =?us-ascii?Q?/MZaTFAGNstJFyFG5AaM2BIgtABZERW2gvYxC2nrSxPgllSDc1vjAq3R5WLO?=
 =?us-ascii?Q?+ZkRmVUmwahZlgLXahXIRo6Zq92B54m1gkVexSGMoJmACgxy0XBlGrzzy8TQ?=
 =?us-ascii?Q?c/CWLljgiclbcFpV2CnoarsLHXFXnbutv3mMxw44OYQgARIv/VYKwsqRhhhm?=
 =?us-ascii?Q?71rZkk/zhi1g2y3IUx7eZRtYkZAtFyHXEE7FHNV/qE41TpQxuUydauoTs0M5?=
 =?us-ascii?Q?vj5iq9WfWd0UalS9i6TeUmr9G6RMUP4qWp+YGFubY0UNhatmwBLVUMqxia7d?=
 =?us-ascii?Q?Au8k03ZiCzcBHzpmsTmWaoEnZzKINPWV8Nxx597f1WeWzOjCimOxEEExy4XI?=
 =?us-ascii?Q?OY2yLB68RFWGnUvUVhUEBBYKMesMfa1GygtQWGfBisVR+JB6mc9AdMSMFs+I?=
 =?us-ascii?Q?/Or+Ih95yV/FTNE4+bPuwFDij6vCzJX3VzlDWj+sCsck0mi6w3IZ0A8DQChU?=
 =?us-ascii?Q?qsygc+/me4GsIzSDGw4ns5iKsSafPU2XKcZvtBnwRShqrt7pbFzOhP1f3po5?=
 =?us-ascii?Q?Q946LZHRwfG0Vq3FUtOjfqtAE+3GEgegPs3+vzBrgGCe7D5DKM/iaIcj8crq?=
 =?us-ascii?Q?aILQ/6eDs8OJ9ZBsQIjZLTjcAE6dYj/kcJ1fSqvJ1/0ln/I3dZyDNxPFHdy9?=
 =?us-ascii?Q?rszr+zNOIlyLm9y9fu57oIMOQeDc19qICxxIBAeTzRv5Mh892oWspHdtJGkS?=
 =?us-ascii?Q?FsA8xNWcfyWkE5BcSZiGAGhb+n35UrxuFo4By1agnoFlkDImpNTHUMWZbBZK?=
 =?us-ascii?Q?Jjs2TNZ1R57nqeQbh+hRGmSHAwDF4/ubxvN7BCWTFUUivO6pXpyoR4vB5wjr?=
 =?us-ascii?Q?L7ZnD+vot6czoM3vJzjEBOxcd/2NmcnhiB54a98uApD9NMSmlXMBsIpfZPHo?=
 =?us-ascii?Q?rfLmLpqWw2sY8eQfN+U8BnwNpZzrFRm5xuDfFr8Kg4YJlaaJMmg9rkXqqgJF?=
 =?us-ascii?Q?18x9NFRSAKxXG15bheePliDMCBJhXbV3CuK9dPARCiiMbnWTnI0kXEoZlxXu?=
 =?us-ascii?Q?7AAwHeZQNfs4xX+wd07+uxs9YXmhPz4FEkwO1vRPTY7gx0aj+jgAmc64eak8?=
 =?us-ascii?Q?jXDZpHWr7NawVlQHF9mm9RzPn6RmzQcGLhxRq6RZ4TIMcinFiRxNrcl42pc6?=
 =?us-ascii?Q?TuEDEwgRIb9K3JXvKufP/bkOghFiZpZf+RhofiPwyRmOyaETOcu+/K0AmL+/?=
 =?us-ascii?Q?wWk1shhUL4ifNJp6vW0yCeuLJ06O2Gin4nGIxOTtPKZTtM7i7PXS6z/1LS5Z?=
 =?us-ascii?Q?gUvvLJSCdEYN0DFZ+APCzCab8DkDI7EZS+53xaJ1K8LRZ/Vo9YQ2JAAGa2kg?=
 =?us-ascii?Q?MW2f3q84FpuA4+1C+zdvnG7oFnN2S2vhKRvz104Oclu9Ed4OLfQfrCLl/aau?=
 =?us-ascii?Q?K54LyCw9wEtByBPIpTMV+a8RMrxqljRVo4fj/mDD01MM3OG4LtOGsSEK5MY2?=
 =?us-ascii?Q?CiDF6B+P00GEcUe7XH8GAnCzRKWSZz5JaPI+n4lNMygkX+BGMZ+j2sq1NHkF?=
 =?us-ascii?Q?A0spEHD2xmgluSj4yRqoDhPwiAxuHDtEFZRUXjwZEnp9oZdu0OBCnt/EC6cm?=
 =?us-ascii?Q?NZhX+1hjSh2Y5S6L2/ZWl0lua8X/a3PFk5vbZWDKWmxjgLEkdayEp+GfXuJ3?=
 =?us-ascii?Q?yPccygv0ezjQVp/kvITNfuZPA6ykqQAheEVSpqQP70+2I+k8Gf3YoCEQRitS?=
 =?us-ascii?Q?wUiUOjx8Iw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183e9315-4922-498a-2a05-08de659e4b42
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:39:27.6395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8q5hR2ngeLLzvSjNxyAsl5uViGiNh1mh8dkoEgdTn44VDJzGTBv8CIQavaJLuwYR8StRwu1QGjhLs1vkzVHvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10603

On Fri, Feb 06, 2026 at 01:50:05PM +0800, Richard Zhu wrote:
> Add pcie0 and pcie0-ep supports.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 89 ++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index d2f31c8caf6eb..d2fe6e0aebaf8 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -38,6 +38,13 @@ clk_ext1: clock-ext1 {
>  		clock-output-names = "clk_ext1";
>  	};
>
> +	clk_sys100m: clock-sys100m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "clk_sys100m";
> +	};
> +

keep order as node name clock-sys100m. which should be after clock-sai1-mclk1.

>  	sai1_mclk: clock-sai1-mclk1 {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> @@ -1366,5 +1373,87 @@ ddr-pmu@4e090dc0 {
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
>  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		hsio_blk_ctl: syscon@4c0100c0 {

order according to hex address, 4c0100c0 less than 4e090dc0

Frank
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
>  	};
>  };
> --
> 2.37.1
>
