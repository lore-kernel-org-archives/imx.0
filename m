Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A83CB2DC
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022275; cv=fail; b=HWYLPcUaocxieLQWm7QfplPxB3sL5eEdrkJVcI2r5RztrzvgBxtbBH1lMFrQzfs2ow2gVPGCFcL03JFEIkI1REieaAIOYDwWwi7FU3ycbTJlTJ+8smEWyVj7YzNsF/drQ9jq7BNTmNsW/ECcPDTC6CEaz4Z1ZPJNXH/dT7JuMy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022275; c=relaxed/simple;
	bh=WpoZlkXpuB2RS91qSKpvQytUXcQsyQx+VwPdQVmfA6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VGs8492B6ZInXcelCYek8Spb5n8MOHyc2/p5njGPgxbp+MoonDTL4rJ5qB65K+w9syE8hw0AQhGxhydOAWwD00La7GQMRHl8ASOc6aCz1poa6ozj9r80WhnG84UyWGiCHK+BlKtE7Zi10ENVBnfRgYPM+lNOg7WlMBC5CqGpxN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qdO2IiVd; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qdO2IiVd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyK00tGnusbKZopkMuN0thZJoFrqDbMKUG7rxwGX0d3s5B2fUqpjRQeQPte0O2U8yXRGf6azm+vsAksRj5YZ8gx0Jyx/s0QZ4TaT784hacUjHqaBeNlxSJVGYpfCMzisdUmaoOtSarLk4kRilf4UZNTDxvPB52sDxaN7f18v6mDvsJQ+aQ50UYTmrJAJoH+W9mBEQH3hRT4Wi5DibEAw2rN++u9H/quwACTcbRq5lVt/qcY/OuZIPA/5cppb26OwTDpen0RldgANPDRG6fI1oHkfoaIC3JQ/MbFQl+aIXF89p79Pv3t2VM0WwAIRCO8/GVXnRe2kFVRLXrbQc0QGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4Im33RBjvPqRXE33FNquvcKAgl0XFM5kAPQsocMBlY=;
 b=loOWmk4sng1Um6FY/vgO7fHLBBHWw6Vb4MhLCTOcOxxc7H4Y91zBgqVFY/zS+vLnJAqGVI9SgHOB9alfLC/NQmGdZZ4XROWpz1x7X9fhGy0WVjrc916yQDCBQZweSLoBkpo2fpLH244Nvd3gBIJXGgCyOkwHYW01T3eN5g53zsl0C9tKvdzTWx93mdkD5R571jmf0sk8KN9awR1ygx/nyjCq/hw1HMs51+rCvIISntP8kEvt5RCcIVI+93R/3Vr4qVXriNJJ0xrzduWjibM8UFczf+/X+bhHLHe3IAkWv4LyW9J9tZmNUqqfRLrgnv+kyj5HlHJLaTud6kqCsqK7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4Im33RBjvPqRXE33FNquvcKAgl0XFM5kAPQsocMBlY=;
 b=qdO2IiVdQ9DTVroV0hAG5gI5MTxIo+e6UR55m7ci8ItW/zgTyA6/i7BIOG4nC3d54LcgkywR1sQPV2H6EQbnBuspGU3oIE01NST7F1CCs9GlS0fZ8n6Q9JuaNqhGGmDFx46nARtc/BryoBNQbYbHmpES8+e3N+ha8N/JpYJcksRsrPAsdUalDp5QcTgkt1zJSxI56cV9usBzp+JI/s5bOS/NwDBfaCRjfIo/eN6Kw9tHkf7mFEWD6ZuZWYoy/6bilVAJSihOGVMFEwgPYRfc1/u31rhUej58GmaB9qJnttQQfxxtfyHf2IGLcw2OngeHRTh9VX8o4LYW4tkw4K2nOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6829.eurprd04.prod.outlook.com
 (2603:10a6:803:13b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 03:04:04 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:04:04 +0000
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
Subject: [PATCH v2 16/17] arm64: dts: imx952-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Tue, 18 Aug 2026 12:02:10 +0900
Message-ID: <20260818030211.3141710-17-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0029.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a179459-72ef-4fb8-b5a8-08defcd55c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jnob+X9bLckFN0GNCwL4ylSAxiqD6YmzDg5x1e29TrNxzXZ9UmfpuywaJ9hOeSwXW/VYfKZd5z82tEx+gySoNI0+3xDdmBDb2mvxLaE5oC/hMgPV6/msz2bdw63f1G0++2cp43dDVt4qWawdcOBsCYl6OCnd7OQCRJkOGwYG+x3UpWpwWKIWJlMPPA8Cv6/GyAvCxY7dmbC8RcA3qA3UWBberzQrSowT42SHaAuUBrCtgzHljAXALw+tFwgaeYwdvZJj9NUZYwQ5dcJu/daP0Jw7PKpzkFRUm1Qpm+3pr2g5mBGLXDM4u0ov+Y6RK3RSvfL3LP2SmVEIQ8EjQ5Cj5v8vrFsGW1askGKJsgjGNQcYDxCTipXogFp6uJ0ZRISe5NycsO6fbLFkjRisujj7lJDvHLS3iOWxSQbzjt4QOuPGM+m+XsyhKG2ZMwHkR9ws1OVniXzDYL595dodoNvFVtobM+LgN1HN4lIPn3NlWma8hw+F7lEmepXXo0Oj9YSdMHWgePGGXugr8VXGs6UA23czCCUOS+3FCc8F+NVY9WONrVgF47WSCVCfLtii+YVKCDyJohp2S7UVF6NDSmRXyl1aIif5+W/9S/zAK2emvxlP5IAGbf7fBXO8bDN2Zabj6H2czmEga7AUe6KbAouG1i9MtUvl5T+lLxr08DW8qwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OC1/nUKv+1XkkqyPTXlZQbBSCRiIwt6UCVcYPxy+NWB7jRYn1GDA6ArYQvLa?=
 =?us-ascii?Q?9Qd0GDoEkX128qAv9y+JBUYFgdM1eSTGQ7s52Tk3Bm+ZmjAYc8RiJ4Ad3tt7?=
 =?us-ascii?Q?+PV7tydk9wQaoan+z+pDeU5gNlRi4Sz4G+/BpXVhEi292oeE0eX06X1zt+9N?=
 =?us-ascii?Q?YqRPPPBeCgc6NePgpCy1O2wJSLMmXzH4pbzl2+UkkIgiiCB2vxe+kkWOxf9+?=
 =?us-ascii?Q?bmhRapkzeMyjN8uLnwHvWBAJyQ71SXrAKQ/hG2xEFex9nX28SWPjc8k0kimW?=
 =?us-ascii?Q?FEclERz2N1I4s8IQBViOmVPX3HkTPaBCG+NwzAcYQKCmPLhKXCqQOhP+kBLU?=
 =?us-ascii?Q?2tDNDwXliZkfpv5bABZaKiRnQMpvznZgG4auRqA6cQQsTda6wDedhbELwOdC?=
 =?us-ascii?Q?vVWz7+T5VUIMm4iLD1C2WXJreb35r9QYf0MiYQFNQ9oRAZ7QRkO3smu/VM/0?=
 =?us-ascii?Q?hSUYmkw6N+3dApouHCvtDnbSErj1hlmCcQFVj3kbfCLmd9+fq7mwy65USLrJ?=
 =?us-ascii?Q?OesQMT6W8VEC2hmrlRGc3sbe17UIZ0oG0vM7Y7RzQXA5WTF4MEQvvjWxjkQK?=
 =?us-ascii?Q?vLAp/WBxtgIqL2I+LC04HobD7xxAMqr6EmJEBE3l6ZGpvdP0Ysuz2iy6xL4m?=
 =?us-ascii?Q?wABR7/WVfYTYDX8Ttp/TVr8pOPTOffojVYZGHSRskqTBXaHEO2OdLPk8fNFI?=
 =?us-ascii?Q?2vuN6gkHiy30K+hvNlV0GV3K23BQyFDZTvfuHfzljF+E+4W7bqXpR/GwFQMX?=
 =?us-ascii?Q?/nqUrbYKq1b1X0a5ITRw0uiSg72Zk//9WOlBve1CLgJ/Wxc1dccL72hYcnkr?=
 =?us-ascii?Q?Jl8oXn+0DDCDj8roT/PnZGNdwUWUY/kSwGTa/8KlYyFG21VuYAZF6XClS92f?=
 =?us-ascii?Q?gGu+1GHckEUCuXdl46b6+/Yr++9f2YwbOuzoiPvlAQTtp9MCFNK00XvkNbaH?=
 =?us-ascii?Q?hiOQgbeWA9lA505kZvXZylgHXoEa27RfsapgByN0fLKB8Hx1HKXXjsCzC8t2?=
 =?us-ascii?Q?xC5jNWVZx558FUFV1SuSe8WrgYvNARTp8QqHb3Yi7U1hs3ZmusAfSA01b+FT?=
 =?us-ascii?Q?YReXdjyk9P+z14aIiEq/42E4hPXuRu6M7YNdFhiO9x9iA2VefI7NAxoMYWB2?=
 =?us-ascii?Q?kVQv4abMpCYR9RMwBj88RAqQIdpZ6+sUzAZWqbPIEsRJFyHN5VlpIpTWMWcz?=
 =?us-ascii?Q?ZisK9C9zhihvPrxn7xalevciG/bUf8UdUs4zLY2c0ig1EtRHBX2mkTrqY+DB?=
 =?us-ascii?Q?pLpbuIy/UmpQlRS4u5T4mMlMmRBvFmAs4gGWi46Ax+2esqigUSslPWEnlCgw?=
 =?us-ascii?Q?awC10kKFMBX5zve6fYHs/2vPbalRht6p8WT4Bp+T9YyT6dmEAbdfRWydMmrw?=
 =?us-ascii?Q?yQdXb//ZezfWETRIxg09jG8JnA25v+T2k3bWarlSFrMbPdEfBptKKN/k6tkj?=
 =?us-ascii?Q?ZxkmFJOlqKzzQLY/ekMczAHuasgaj+9bxR719Vu6AwOqPLnjlCXSiYxL7Rg3?=
 =?us-ascii?Q?QsjnjXvV0ymPvdGJJv6d+bnrs1YfbfbbhRxw+KwzWQVlMtB3Z/59w5UPhujq?=
 =?us-ascii?Q?nIvv5a6mH8rUFx3aKfFeSbiF9m1Bly4bKBuNngfc1ejcKpgWnN7Uyw2TTasU?=
 =?us-ascii?Q?ImUPLJZJCP9sPvkXZSAYD8py9+pZLIGPm3IYiusZGD0FNnB/WFRrDcLg3txN?=
 =?us-ascii?Q?RNxRrwpG+qpTocT0snJtUUDANCC3cAExAsUZt60ZZgGAYf2pilmI5Td0P02S?=
 =?us-ascii?Q?w7i+NFTysIQAo9r2yn1FcL6sOV1qZnSrFqZHGq/XNyUmPHRE/q42?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a179459-72ef-4fb8-b5a8-08defcd55c9d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:04:04.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpJ6SqunxITHb0fuzaFuX3pqBko2wiEKRpWO5MY5rOSitwCmXzKMFJyzwc/r7uj/bCubAaqOTfhnKOrK5yIF26pBnk0lUg9E+wEKJV2FmKBZ8FicNlDV2QWNz3F6V1tF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6829

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 21 ++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index e9d735dc2a51..522c6cb9abf2 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -231,7 +231,7 @@ &mu7 1 1
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-inversion;
 		simple-audio-card,bitclock-master = <&btcpu>;
@@ -503,7 +503,7 @@ &lpspi7 {
 	status = "okay";
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
@@ -519,11 +519,21 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_enable>;
+	pinctrl-names = "default";
+};
+
 &mu7 {
 	status = "okay";
 };
 
 &sai1 {
+	clocks = <&scmi_clk IMX952_CLK_BUSAON>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI1>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
@@ -704,6 +714,13 @@ IMX952_PAD_GPIO_IO07__WAKEUPMIX_TOP_LPSPI7_SCK		0x39e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX952_PAD_PDM_CLK__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX952_PAD_PDM_BIT_STREAM0__AONMIX_TOP_MQS1_RIGHT	0x31e
+		>;
+	};
+
 	pinctrl_pcal6416: pcal6416grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO10__WAKEUPMIX_TOP_GPIO2_IO_10		0x31e
-- 
2.50.1

