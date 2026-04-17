Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79955371CEA
	for <imx@lists.linux.dev>; Fri, 17 Apr 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776424965; cv=fail; b=VOzTUI6CXImPkrPCNqVOvfDcz6OPjtNUMWDM3Gwr3q6eniF5GHisJwSFJKxrFriJBntPYOtszKHI+s353NiEfX2wI5vzDVLDmkqAY2/P7fMxt8jJfEaDvoG6n26oV9LKGDvww20ySg4m7AXuxVfeRzqPORjQqtpeMYWF0VM9Cgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776424965; c=relaxed/simple;
	bh=1Jnwt6f7H/tSc6zbkSGonPbGHXxtiyEbkV/4ZV/K68s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FpYKe399Tw73xmAfZAHa41c0VDrA8HCpmwcEsHU/INO2mjHxnw9x8XtFsVP9tIR3Jfsp2wWf1F2wRvDCAWLHP74biouJT9oXGBBqcuFPoDapEABGHT6POEQYlIWsjyHNdFFveSEV596JmPAT57h7pQYg+xFkal+J7c5Qn9EHH8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IqfYFI8a; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IqfYFI8a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/Ci38UqnzatI0mnOxFj3VEaUMMSZ0h6FVs1k96Nh/gCO0gLWY3nymFzWYKj9JQoI7jBb6CrpWR0sx2TQUTdlvFGl8YXmufUJDhbsDWYXUqWaN0Jz5ZMJOHHr+lCIDApoI200TdEYaEkPF8Gndu2d6HmoMZrPMTB2TJV2kJTY/2XP4YiYMSIkUtaZlF5zaI1eViau2lVMefARoO4/1qzEl9PK45mtD/311Y3HL5BuqncvvJCzhRUvBF6p1U5ttJGUVcxubuByNsLgyxx1gda7tWCze6sCvRf4/mLfQlD+aA4sMBA2yeRKVtm0hn6cRlwjMv8JcmuXJ4YshVSUob7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGbSXclm7AmYENt3Vu+eUOF4lyYxN8bRKYs+wlkU5Kw=;
 b=h3gbl52wqj6JSsM/6rvG+U15a6UzkQ+kbU/w/h+KAZEeKDQ3/z7t02D1J9Ptm0oji3xhAHz30FIYd5QK2TAxmEULJ4MLejLHRq84GbqxCD/5UtnjYGUsdGpXKKNCTT6XH4/S2Nl5HeEuhsf67mfoR7npQ5NqG6ekJtXyX9i2bkU+7sUMR+Rm/TrnFrkCpj1w1YLqXlxOMQr+UdRwc4emJbgccp2Zz2SE4Fjh5NQpZ1FD90aQzii4AOcgMrHkRlJlftQmq1GF+Yxe84Nu/LLsBalEt2PWbEKK1PBrYqEp3bEZ3713VUvIIKpvuWtQxbEsBML3UKOx6dHeHWX6pDspyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGbSXclm7AmYENt3Vu+eUOF4lyYxN8bRKYs+wlkU5Kw=;
 b=IqfYFI8adepWTXIYx93jgZPn2bCMMTnhOJkfCBhGREuEIaQiCUTD7do4n+357uorStR4cOzc/WgfEajMP6MYZpe8JOmpg9gCZTtVFCp6/kBhnqeinLg+gvH8HZFRNm4m4rc8l9n/Kn5sohyl08QvbTJxrTK3a8fFOz3kBV4pu2Xp0a7lG4YSe9JVnppsNe05ObaQPWPtDpdkbgf13KbDSOUkH1Bv8+//Du+Abt08oy2WMbWjeRHz6rjrxt4BL/sxLqO5pfKZpGW+9s8fyeIxOrPcwJG8n1OYZOZYwljERQThobn/TKXX/vpQaTvJbiWpXCLDotWydQXnv7vDYUhvDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8933.eurprd04.prod.outlook.com (2603:10a6:10:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:22:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:22:40 +0000
Date: Fri, 17 Apr 2026 07:22:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Robby Cai <robby.cai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	martin.kepplinger@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct MIPI CSI clocks
Message-ID: <aeIX-YbSwhmuJwst@lizhi-Precision-Tower-5810>
References: <20260417110200.753678-1-robby.cai@nxp.com>
 <20260417110200.753678-2-robby.cai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417110200.753678-2-robby.cai@nxp.com>
X-ClientProxiedBy: SA0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:806:130::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b64d7f0-b3c5-492f-a4b4-08de9c73a2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jOnQiDk6IlKdmPGe0w+YlWYVl1xSIzP3fHHFQHYgBJhYwXxXHL/bepWmkMg2g6iBgvx2zM6gdF3po/BhcZhbYinPQRIADRCpXEKn354uZFfQk1qdlgS4kgDzddVwor811y6qzEb+TKOenobEwK+Vti7YPJ0etrHnaltBAPzO2wcbi7tT6E/+37oiEhpiciGo/NUQ6c0fRa1UiOR0mXzjRJWgZOnvXjv0cqCkTpJaIoYHhq7eBon3AGuLdldC/Vjs5kEkMJrehQUMig6qs4mb3lzmFVsC+f5DT+3uUZaS+C4lFxVcSl4c7jLQotA6aw3qIlOcA5G/AV7/QFR2U4YODk/sWzQ7Bh70w2ZjbFRFJbk4lEmwlntE0ztvKy+elNVNn/k3Rh9/EaOjgVdgOMgwp+9cPrixkiMVhhDC0LufClRaAD97Syx8LIv+9CsF5VfckoZdhGSg39BdfhSwb0sLq9+tE7U+0KI5ax//a26MUfQmQU4n/RK7dZWLRrY/Y+JeBWUO0rt+/8i/PZaDEO5CLGti4Qf55HPrqNEtTfx3+l3t0MOUlVC3Tk+kACI0QzdCiHitGlp7acR8vhO2TBn3xo/hGWcfwkviZjFuT0Y1QMc72B+R79QJwvaJXIfZA3wLY2a4Z1PKy0FNsnJELx5EQMpbbW2mdsi2XNWey9APHLO7agubt1PbkL1WzOPoBt12iLwQBso7L0uGZypq9Z891W8+rOlF75+MoFd/qsqHd0c4P8mKAiH/Ok/9OxtqFVY7uYPoNngVM5urHrABWJ6NgwOrs7UAtjR4sSZ/XKnB+Eg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?osT3CtGpz+Iswsx8S3wL3PJ/UyBfukbm9y9s80Ml3zbkxMUOxm7MhPzeS7bd?=
 =?us-ascii?Q?4UhjELuIBNZtasIwadY12KSN2yZLegPw3/jwdCjy82rH0FnYLEUf85LFog7X?=
 =?us-ascii?Q?DsuWJHTu7Lo3oCAe+m6166hrPj1Xjw0+2djCdWCM7TePO6873J3Kz3/dQ6Bj?=
 =?us-ascii?Q?CbCHzI3lBqtz6A4NYbLJHx1eipPjVSonmAZXGhii+3bl37UUAQ69QFpmfxqn?=
 =?us-ascii?Q?RxYLlR2fouIk0uK2W4Oy5NXFKWGEBvAikrJ1K+0mXH2H41Qu9t+j0aOT8ZKh?=
 =?us-ascii?Q?FC5BqJZOtICpcVJRiss3PFBe6vEeaaWM7zKxGm3GNNkjdV/x52TwV+8d41Tr?=
 =?us-ascii?Q?0q+2u6H5U0sJzig+qql1M34gIeYiaDF93m1c62GU+LYT3fqS1PtC1G+IvhbU?=
 =?us-ascii?Q?6RI2GnJg+4aUFwUfTZBUuCaZSVdQ+w84583XRTg6ZKr1Mwhz1UyFs6yYmTqK?=
 =?us-ascii?Q?Nf/sSPg2N7JenVGxzyttG2n8zDGsXid1ETm2P2VKBwRtceycXh10Wu8QDGPp?=
 =?us-ascii?Q?NdonqTzGwlJVGg8r+VVy6yHnpaZvCwPex4Krs6aoQx2qhoz/7/87+scAQy6K?=
 =?us-ascii?Q?Y55a7UylwfhpkHePcWvip1LAizzky0DverIcHINQSuYNLxen0/wN7lVbuzAR?=
 =?us-ascii?Q?Y4ucMEFu3SYDw0Z9dYfG9SQFZIgnFkQFkQDuDzmrC/8teT7TKfD+r7luyZg2?=
 =?us-ascii?Q?mlGbaHgK5MMPoHhm8r0BW5d58T0+TL+qvY5wJY2gebP2zQloGw8WJXsozlXn?=
 =?us-ascii?Q?YyllbBztMfZ3QMh7ZAEpf/liehCu+/5B7FrQpENu9grA18Ebnln9HBUPYN7F?=
 =?us-ascii?Q?CoWtwP/qipzdDmmcRz2V/B9Rtukg5ZvdxbYGX/PF73K0OD2r+WeNxkrmY7+F?=
 =?us-ascii?Q?/yBjWLw20Fzhl75bctDY8ooS6xKW0XBWQhpkLd5m+i+tux6oLUBFeptFXEoA?=
 =?us-ascii?Q?pU1saKkafoGRJJFU2Obw8TEIItaO8JcBprpQLlg/iLRWkzjjIGvYddJ30Xff?=
 =?us-ascii?Q?0OnSzjEWTJ44I/IxzCl90E7n1IqAHkhdRHqfNuXp09xanFQ3kyAGmZfd3dze?=
 =?us-ascii?Q?KM5RIPlg0phjqEBbR9hlH9BVjCKsr3XmCmZQd+CenTrpLFjVaXWQ/Tt9fWa7?=
 =?us-ascii?Q?zPTNtXoP21A7BcHYU0UNsHeMS3EwBuEUyZNgv2GC8RJ1stesGbdLT8RQRr02?=
 =?us-ascii?Q?zSNIJZ3fX0lOaB9B2VBxd05hKWHS0Uvl028Xpl671TIlE7uSy3pIgIV/6eHP?=
 =?us-ascii?Q?5Os5CN8cMmiCaUPmP+Oy8oPgDGbBf+DcfGdTr8r7SzeCa8gmxDSVelQ06Oos?=
 =?us-ascii?Q?6FekzR+m1FNKMuYp+eC3+TaoIT/ZTontbNkLDTrnOw74R9FcAO6iB9HAWvwq?=
 =?us-ascii?Q?xNTWIfLUACDaOYubiGOF6CIqY6BOlrhkx+u0Dvj3kJIgDWyZ2VXyhMXC0r22?=
 =?us-ascii?Q?DX/XchVIAZ4RV3RqOMhU3mY6kDJItMCIxMXbWEwIY4c3yS6Jj9cf9zhH8hu3?=
 =?us-ascii?Q?OwYQ7bF2p5rDppk/xlYDVRqOM77l5N/H6oVyjKlVKVXI4iRABGX0y9e5tKn9?=
 =?us-ascii?Q?f9xwYMe9VXjrM0iJDXKWw64hObpydehytmziJUYywg//3XqWTnAdfs37dXwz?=
 =?us-ascii?Q?ukY7qS0gOgb8+1sxH3H/ZnNKQ5Wx+5dG04L9Gi262VXJWLgaHFRyKMgnlRgL?=
 =?us-ascii?Q?GlCWs7cBMM8eavoF58HhEqPsWpUzeqYEZTBHWukuKq959TQT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b64d7f0-b3c5-492f-a4b4-08de9c73a2ba
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:22:39.9441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+ElVXT5v+iHa0dRdLjUuDGZ6S8U8p2k4XaBUkh4OfXrniesBiYYVA9MXapoCz/XAzoUGjlIQrmk5Ml2bfLRrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8933

On Fri, Apr 17, 2026 at 07:01:59PM +0800, Robby Cai wrote:
> CSI capture may intermittently fail due to mismatched clock rates. The
> previous configuration violated the timing requirement stated in the
> i.MX8MQ Reference Manual:
>
>   "The frequency of clk must be exactly equal to or greater than the RX
>    byte clock coming from the RX DPHY."
>
> Update the clock configuration to ensure that the CSI core clock rate is
> equal to or greater than the incoming DPHY byte clock.

You reduce clock, how to make sure it >= ?

> The updated clock
> ratios are consistent with those used in NXP's downstream BSP.

"downstream BSP" is not solidate reference for clock rate, it'd better
refer to date sheet, dose datasheet require such frequecy

Frank
>
> Fixes: bcadd5f66c2a ("arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 6a25e219832c..165716d08e64 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1377,7 +1377,7 @@ mipi_csi1: csi@30a70000 {
>  				assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
>  				    <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
>  				    <&clk IMX8MQ_CLK_CSI1_ESC>;
> -				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
> +				assigned-clock-rates = <133000000>, <100000000>, <66000000>;
>  				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
>  					<&clk IMX8MQ_SYS2_PLL_1000M>,
>  					<&clk IMX8MQ_SYS1_PLL_800M>;
> @@ -1429,7 +1429,7 @@ mipi_csi2: csi@30b60000 {
>  				assigned-clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
>  				    <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
>  				    <&clk IMX8MQ_CLK_CSI2_ESC>;
> -				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
> +				assigned-clock-rates = <133000000>, <100000000>, <66000000>;
>  				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
>  					<&clk IMX8MQ_SYS2_PLL_1000M>,
>  					<&clk IMX8MQ_SYS1_PLL_800M>;
> --
> 2.37.1
>
