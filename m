Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653D3B0582
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022196; cv=fail; b=KQ012+ZnHmpuqz+FIDxAnjZrwLsb1THWVtMXyAZoq6D14pUiYwWKMbFUisJ/4Uaojk88cmiDYWnkZLrlmH8LK6UsctbG6wn2TPBGggD0JoHe+ZFHCRL00slEBFFx0wuKoom02KALSsoh7qjF/WK02v35qKXbMug6VdHXjPV/uLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022196; c=relaxed/simple;
	bh=Nipn0JifD6KiN/meLWTnsBve8yN8oBR8X7xZC+avWI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tHIxrZDfZXUbF4MzI/Uu90u1joAiowY8z52dMFfk50KppcWR3nN7ixc+oy7ArHMREvMNyCZJ0I7CyLPm3hW8Pgb1Ng8eCX2NifdNz46JpHTN7fOhMPfkLQKjivGzNfev+intUPmUgQKjehtKONgMESnWLii7/JzmALreveIaTKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xc7SXDju; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xc7SXDju"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUvOWK+LjC/ut/ta48CrIRXrHaGIisw4sB3602kThhpuxGLwCZVdJUpUPyvLnOBQm8duOYD9j2iqZdoIfz9lDPqgjDZRtIUBE+yUwC4ja9sby3RthB14S/8YOjBxY1thZK61ywgnMI7HeUzJR42FHIWN6s3bFmr3MtPj261uVD2sCry0WMW+9mMAi1JVk27Zc7zfflXK9FiBGPQ0OE78ro0PhAB/TiVEr6uSWVMJeLr6eUG0uwzsSFFmUoYcYalLxytMdazt8RYzf0kUz2hq3a/GLG+S/HQLuExOt+xRAno3oHCdxYOIURvW7G25jpa9QCf7LL6jPoIQXf68FYEF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuYlIY+7fPsMYrBIeAglR0Ba2534pdXfrsCDwDFqWqI=;
 b=yVJZkNGV9p5owfNxMjq5xHIwBFg00poiA0MD7refMh9B2Iwx/8BbLSBi2YWFdjftVEq4sno0xfDIRVWrZjgViP/F7AI/TyguZ+uqq8KQCdcmZAxTBNR8+GhcJtf71UTveSpNn4OvhTMqy7pPoHD8+kmLwjJZLY62SC+INZ9tPQpxlpaHBNCgC3SljEpdWbw48jrWp3RnQATV2lMVz5GoPx/nh+w1FIFDKrjb3h8B5S1IOyu236zUyimxOBgSqW5JmpZ15+UOs/Rxs8k/qnaKbmn1yklzIkxrIPpUktiOrfO2Opab6tYYq5Puwk7bah+u481X/WF+/CZb4/SeCcO4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuYlIY+7fPsMYrBIeAglR0Ba2534pdXfrsCDwDFqWqI=;
 b=Xc7SXDjuMJKxYDMMerNT2qtB6oTexkhV8vvj+Hj2IYcLDX/gNtct164CZMjRyecRTy6qh0iuuLYMR5VgE7l8boCsJ6Iy4QwPan32e0CSeVXbNqZEt/Pe2l4UGSJIe0ooWpV2y9QxuyuaPsvLrK2Q4ZMl9yImINx+WYmLvLPTwOksBIYNLAuw8dKigu/aS1QaaoPhTufrNstvXOHBTZlqBIn20UM6fPOPfzI5odQGmt2ydB237Txzt1hmhXn3kA4ct8BmJzVWvNoYW8FZRH1pk21rTVcKMjXzpqnToydUl3dAksVtS9TJEEFT55nk+w+ENQdBJBVPcptkRZqQL1pF5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:49 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:49 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/17] arm64: dts: imx93-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Tue, 18 Aug 2026 12:01:59 +0900
Message-ID: <20260818030211.3141710-6-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0124.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::11) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddc5cf2-45f1-4283-9fac-08defcd52fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	o/cHvzlcl2QRlva1TKSnvTnzIFMb9kVetwQPfS1EQKuXOxYaGKE1/ZJUjKiBht5FtolJyguNrnTuAW82xaIUiOYOesZEcdGcUsfNozXtXXSkF7+Qv8P1XRQXqvEY/gSAxV9Uz5hoDqYupQxAUy0ZgVQmRLm0jK5U/2/phQngxbUMy0XF84ObJT/b6FDaDS9ZGZcXwiW0r+YQYUO5zfzzvC10MkbQd2Gz7299+oy7kbQqV/McUX9LNwM+TvqDjyH9T6LB8SxTHT4oxTxeJA84xrvF+ufLgBJjwPtOcMiAevWXZhuBzCerHXytR+WOi2QkOCoH6zCcRKdP/0Pu20XWNzaIK+E0AKH6nob3A9P8wfHsjOQM8p7n+XLITlBHA0NsCStM05ebtfeVD/OPD78HycwrRs7/OsqwGQ3LaSrXW9j1jsCsoU2QyMjW88y3yqEhJezXG340o3Dl0yD1XaemfU88Z60hnbHrBaoAkAKMhwHZTNppKnB+NiKysQutARYLmimNyFSbi+P8T9tBqDbZ1sdIWAlJEj2dogH3LOOZeqJ4VAy9Tymz9HAaRng9QEbN3OrFp0CWJGW/V2tjdPsX5YFHX4a8xSWYNadShYRjWwhJnqKgYtjhPYyNEn3am+TPzdJxr+m02aPuyC14/KTcspCGLLnujB85qxyOWC0s3Dg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ydHXRwNeA2xU6k3xzlA9FDfgLUA9xKybHtaxfstqRGBJ2Z+dRK0EPSd/S4w9?=
 =?us-ascii?Q?t1TpSal7KWMpn097IV2M1opBnsyOz7eqO0GQWJ6E90+uL1GXvA23WWnpypDg?=
 =?us-ascii?Q?vUvavd1XFgE5PH65Wn2PXzSWQTPpFSvQX2N7mA1IT6t8034d2U6eerGgzPMv?=
 =?us-ascii?Q?vhEFYwiVrFNkFEZTS/oGR4HTEYsPjqJmX2fCqZjd8AvyZI2WoygHhEaU9k+r?=
 =?us-ascii?Q?FjDmNRwjWSGwtubiPZ+6SDw73tzrdaYPhAA4czY0upyCQW+Hn+7YEmi+g1at?=
 =?us-ascii?Q?AW+jRF2iR1nna9bOMymh0mDR7RxvmMPo4JsPq5En7QrXyr30UKWulpUfcmH2?=
 =?us-ascii?Q?taBFkb4aOv7xuI/YV9gIdw6Q6PtD59lsLOa3Tkl/QZSJV18gru4aVm1wqbOb?=
 =?us-ascii?Q?kW68vxbrCHhfkCr5sTOjrnZLBnK9LyYE6H3oIzrbd5CR8UQtvDe5Etcl6B7H?=
 =?us-ascii?Q?wsxW90hWSb7g0OPOch6Sb1eOB1cSig2Yw2cTZ3EKTzA0/ZYbW4P5fIWFfo5R?=
 =?us-ascii?Q?5SRPxuY5QP9kRdvvck3bYRijSd1wD8BuCjyfLoiq6yejY6crPF3xq4kt1I7E?=
 =?us-ascii?Q?LrxMhd+0ihuLXQKiRTk9nAGtXWAPSV2hgvxwM2Hry66owbxFy+jgVt+e2BAM?=
 =?us-ascii?Q?rW+vy9EfHcdlvy8sm4kUoIRvURbAWn9JV2IjOJvAAvnJcCxrUSrBuPRpQWNk?=
 =?us-ascii?Q?Wx3kDAl7nd75rM+TtTulgM3q6Mmzr0Ls4EQMqOdgYEmDqX4lqSW3eh5o+ajw?=
 =?us-ascii?Q?F6sld5Nk4oiIZWTfUBbu6llnM9ab1LjgAVhUd7dnoFeVDYF5+TDljZQVhsIm?=
 =?us-ascii?Q?nscqPSDRWOTXUfAZ8V2BjvstucFm/GfkVCu2xHKTp2D25nEU5I+junPZRJy+?=
 =?us-ascii?Q?3xTehfCVGdxZAc0gjxAJm6pyXZ2fx/VBWiNMq2Zs58blF980uUm2yWAm9gdd?=
 =?us-ascii?Q?VM5oHU9GC0XJnv/jDmm6DzwifHyRJCshPAWCauHu6V/wSz2iDTfDfALMi8QI?=
 =?us-ascii?Q?VXMesSHenvNQGiv0SDMCX2sKLstMaQx+76QMkneu+fMRJQljvBkUnJyRYblz?=
 =?us-ascii?Q?pdGnqxsKqq+bRSlS9Vpd36ozKAjrfkrmXVhWN5p6dN7EDtiza7JFmN0YAwX6?=
 =?us-ascii?Q?lafoq6McPUEotrtUKMi4y03WNtxwvKskXf2NM20rceFmsuSZ1WsOZYQ2gdUS?=
 =?us-ascii?Q?XuXZuXGsuW7F/c8v3Je0BbpdbHNTEpK8rMHAJsmgImZlnElWtrGef2t2os26?=
 =?us-ascii?Q?shrKdAzBtdcVJE9P8caBka/w5aPyPHSfCy0FqHJGyGORWdfDOMGObykeghNU?=
 =?us-ascii?Q?BGfeqVjAgNmHLt8860OVdM3QHSVMIoh9sE7sX597/GQyGNbnwiVwgxnkb0so?=
 =?us-ascii?Q?rDpWCUKvb913dmWLU9Xmx7foyAcItRkddbdjJw/xRqgM+XsEecRFa5ErYTkB?=
 =?us-ascii?Q?0qkbNSjR/Q4ZGr8wxGu5sULblbdm3MHYazE3++mJvmoe6lmjDXaRgjrhS/jh?=
 =?us-ascii?Q?+00p2sYnv9wUJCz3R9hjP4Tt2FQidBAjISXXA3MvWSl4OKvXqyG/ndig7mtG?=
 =?us-ascii?Q?vJDGcxxQm9C0JIxsQpzCdkZ3+alkRKVSbJxu7J8eAr2oHcxVWJ9oFjqxCyMx?=
 =?us-ascii?Q?7IXILZvcS1dVryqjnT7UiHTVkFkllBFI2vPEcQ3L4pmmqcT7NwOkF2f+Rj4G?=
 =?us-ascii?Q?S/Fd5JaWwcyoJ28TIrNWJ+WM5vvbhGLYfyp86yYLpwObxtxyStNa50O2fBXh?=
 =?us-ascii?Q?eyw5mrP5aMm9pUYJ+vXigCDQ0AIR0o32v1tNj6dftJ4M4Kb4vD8u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddc5cf2-45f1-4283-9fac-08defcd52fd5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:49.5355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyxB60q3nBOvq98zmdo00DGeHq62+jP0LdQmfni20hJh59qEl515ziDoi9X8ZlhsTf5uwDLNx9EYmE46SxEOwyVUAB61xaLPwkkcz914sZFAbkeAGdncnO8uYTL3ckAh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 4418fc6a0901..71822d06ebf6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -71,7 +71,7 @@ bt_sco_codec: bt-sco-codec {
 		#sound-dai-cells = <1>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -105,7 +105,7 @@ cpu {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
@@ -115,6 +115,11 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
+};
+
 &pcal6524 {
 	m2-pcm-level-shifter-hog {
 		gpio-hog;
@@ -127,6 +132,10 @@ &sai1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai1>;
 	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -150,6 +159,13 @@ &usdhc3 {
 };
 
 &iomuxc {
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
-- 
2.50.1

