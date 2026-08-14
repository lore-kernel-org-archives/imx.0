Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B1640DB36
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692128; cv=fail; b=uPzSFF3YcIikdh8XB1+6L6QpQKf4nfPc2F2BhU34CYhEWf4Iok0bn9keeugo9kXkl6s9GnhgVHaT8HH5Kty3/qQyZPdvxkuAu6xUwlrDgyU+4K64DdVNaK88Sp+QRTxCcFSlMw1RdBdOVvGRkRAf9/9SVg0lNYs1mYYxNKnzOPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692128; c=relaxed/simple;
	bh=xPsXgSoJV1xUTvoU4jXcZMKlZYs3+Onow4fPXAWyQc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=usGss/ox20C8WFtNHiA29iIAZShtDT2t0d+Y2cb7KBuPeMlfyTXOJFcsmQZwJ2f4hsIwVXIVwrysBcP0A39lSRbWGPlaOEgfmAXqW+aIKoa5EL4EjBGPnHloSwFMlyLM0HUHHtbBazZNO+kyPfaiIs7n26eJug0hS2HrwIJTeb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m2bdYL2V; arc=fail smtp.client-ip=52.101.70.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m2bdYL2V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIpRnXFeggcClAg7n3xPoLpOyEMp4Tkn7HONqlzNPm729eF80yl89J0E0baV7PvbGRuu/jdLRfGLB6l0hz3d0Mq9GQgm9PezhzqrBdMyu2oLcIiPk3u+tTzrKY/dDboS6xjUVKKsg/2zoFPz/lBvJbJK8a6ZKKAjcYnk9Ea152B+cLTp4HZ6LE7LY6mz0R15KEx+wun4LxBSd6zbrS8r2txQ4smdDDoMHCO/LdtPOOjpD6/WeiZUaSMwTp7xn0DCq7Vx+qIndhm1LhX9VHRem+Y0lvr5FNSIVBvskqp/j27H70R/14XAc0bEFkL7lFYjx33K/uLjF0oRjc6uP3L1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVDL/izTOtLzyYtZ1AjQLlIoMfrfe+MWu/EkEYSbEBo=;
 b=TwN8NuuRFnilAZVHvHU9RUkIuZ52yLRTwn9oxyYVEkeaivR4Tmcq5H9DE4SCyZh4pfKdX6G/qFncdxAZJYuaJMCo2lij2acss0ePs9DwKiyw7q+5gq3YMnyIU0CK1THSV+npSmTa347uTTTH84b30aqmxSIV1rykEKkE+YtN6oVcXs23mnBU394pelD78A+yluIeTmDYxdqQ+PcZCNAZ7qWNz2r22IFUTMSmoFqyjrWetyj1YXLOWkglKlCtebY6Zg0zWEPdqRsYXQgeePLNZotOk1CBCXrM40imHFZSu4GJVfp2d3Qkxn6VI/9ru7QNqhxnTy/CHapICm7QABKK1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVDL/izTOtLzyYtZ1AjQLlIoMfrfe+MWu/EkEYSbEBo=;
 b=m2bdYL2V0OwNFtx7CnAPa6RXkbPcXFmikelsEBFiESRBpTAQJ3lj5M+iZvm7sEg7gb3NgAk+OymH/GyP8O78Q4Utetj2xU2yQ8EiQpE53hZLOFmIxuqGtXDNbWEe41gDKIojpZ6KE98mAp64bPcz4N2f0c4xoZMR2GgMOiDyw7OLV48Y2hERo8sIqzWqaaJLYT5emVUfeS4w82uHOsEFFBds1MLtYBBrFt1HLQok83wip4Hz67UNEsz91N26mHiglnaE18wje4dVG66HtpOJLi9jwl/UhlNf8q0aiFT8kEWioJdn8tjddJUw0R5nQW+r5NlPmmLUeYyBHru1KoJ7Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:22:03 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:22:03 +0000
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
Subject: [PATCH 13/17] arm64: dts: imx95-15x15-evk: Add pinmux and mark conflicting devices for MQS1
Date: Fri, 14 Aug 2026 16:20:17 +0900
Message-ID: <20260814072022.4064009-14-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0068.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ed1f0d-092c-416e-1f4e-08def9d4bd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PvGdXFg4tTdHP1eRQvRR8VtlnO9iEdt4C3gY3E7Zg9Z8Nqh/82rDUpaBPDafM1yMn1d/lzJyItxmpqVHnK6nmK2mgP2cLAWXiVsFRDilV0D8l/7gPD3oKuDiJZKFhlWo1j0dw0MscErT4Una2ZYGrX64W4YRzdPMU+BWqSk4khMrsN5C3a1pGhf97IivSwm7VX1/lUC0RXpHGgabG32UGRz0/5VaoTv/r7Ozm6JuFxL4N1lynUBVkkTuwo3pzAfiyb+SQM8Ov2oTIdlHMf3ZrEee6krIndzpl0bknYWmFwFXVQv3te8cbS1uhQjQ2hpzvXvJdnYpTo1YcclynP8LyW8+xGNdaWoNZUtUYfFnaSfaWcZn2RIYQ802bDvyrwqvUqLT05zHfqcdR/zU6TYz0005ISw9yIiGY9BkGMc8F6atxNoorJFkimBICwXe46MuogaGf7DZtMyly98vo1RIBleSl5PcevzrgZKcY52Ka0PgQFSJ7oQHYHpm5K+ziJvnX9iSortzeUlMXNBoicZDTTcMxFkjI3CZd5mVOlICCBWMTH2VU9DNM0W8HYeQCVoqxCc5WjbuF5cE9zymyD9qprlQBFmTjU3GORPe0dnUvTyz6pC9JzhSdPWf7aLxnIr6vc4MUX588A0FZu4FXFAVCfJ4h3OlyXaU15gfIV4Ux7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gub2RqAPSd0R2lCv3BkRWZfGZtZD0CklT1hbY4Ua3AjL1VqL/YpcK3wowpf2?=
 =?us-ascii?Q?Dna82l5g2x0TBcE2+kjv0p9u9qonS9UafhSvD2LWSGwt8uPC6BZW/KOwinMw?=
 =?us-ascii?Q?al1UFam+ijOJ6LhQG80mpBLAJ3K0+uZkynXIBtHu+Kw9N9aSW2LfiJGEm2jG?=
 =?us-ascii?Q?Ost2udSpsHwyQCg8Qub+vh3AvgvekH/WAqxiDw2qAJYQdlreD/Lh6p7+Q7T9?=
 =?us-ascii?Q?sQhoe3u2Ltt9ziZ4VF34YRTQw9FTPseSif1CPhHnAS619hXszT+gl9uOVdFS?=
 =?us-ascii?Q?/p6G7bsNQad/XMg1WfojjFsWUd/cLjaF0VWSmvWcBYUbT8eBCg42wIgECyTN?=
 =?us-ascii?Q?MxseiMzour6U8ByOLeaXJ+tm83ceTyjQvG+21z1OLHkNlj9IVldy5GmMcqDQ?=
 =?us-ascii?Q?KGOVlJseAEtIcGNj4bXMcIfwGI6feiVlJb4KXDBORggi7SVl2/xN5TznV5gv?=
 =?us-ascii?Q?5UyeDxa37vOXksKA0+cvZZJZ0vXdmoAvpr5PAywvHJqIgtHHrESQDVFOh17n?=
 =?us-ascii?Q?XqSm44cl6+9oxEva+eUnpQxGsUxNEEQDY41oWf/TKOQIs3pvx3B39znzB3pe?=
 =?us-ascii?Q?OcFCJ8NqB2k8NkAHHx77mrnNJYQqT0eDl6be9RUvyOojaQt+Xq77ts/1RN4q?=
 =?us-ascii?Q?EcZIJSx5WXOd5TdPDSwPtz5EN+n8Y4A9RCIOWr0k7ia4IR0vqPcWyGFi4FQF?=
 =?us-ascii?Q?KC+wm6M+MOULCll4AvSbt1Pc+XvQMTlSSgWr135PGbahBz+DFxjbW60wm5KH?=
 =?us-ascii?Q?KspGjXLv/G8xYXTNehMB1gHANqo9mljla8GmrhsG0RlVebu9TqliJMLWMC0b?=
 =?us-ascii?Q?ceyRLIVTxa3bRO3fcZISLISrtmxdMocbfyOHcMpJkpFJizBtkR2Xe7A+ZZPn?=
 =?us-ascii?Q?VU8/YxgMcYj3K0VzfFYyTZFo9PJctINwyymNe4zVTJoC4MFgZ8/PnWx6FsRj?=
 =?us-ascii?Q?zHlVWemLCq5Dmgf0FNkEoF4WQvacBPydxFFQdUaD8jYCptF9Hz3gQmrODlJk?=
 =?us-ascii?Q?OZtQsTPaYnAW4EvCWa7zHplfJqWikJubqXfj4+V1hqzKcoFuI6Te8ZvplfY0?=
 =?us-ascii?Q?oXnZxgPsqGCS0hMuNerw+X9jD5QokFiAWuoq4dIIEiuPPtJ9H9ccwalA5lOW?=
 =?us-ascii?Q?T+5Fwi9QemNYeXQ47PqmSYOi6wj6zsy6qOudiiLgMOko9/wvvCe/PXdqbsI1?=
 =?us-ascii?Q?JXBQQquiiJAbg+yY5oS6/DkEUukmLX+28Fzwz49qznGsMm8kV8V8pSxV0rt5?=
 =?us-ascii?Q?9vFsYPTo/Cppe8gSeFqiHI6Kzo2Hzteq+z2d5cIjzA0/LbeqadkXNASntk2j?=
 =?us-ascii?Q?t99/VWvEcZz+jNetVGreJYeJoCs/qmjGTsEcIZ4PJWx/i0ZatXLbeFMpm8XD?=
 =?us-ascii?Q?YVWMULl9JXcAM2schclmOCWNstj8V9wVMkgd+Qv9PVoUBPevSeYDR2HhQEyX?=
 =?us-ascii?Q?KWvKMZLkWUTKrfXKhoz5osdoCbbHdVaGBtmImG8h/Ampn6EhAQaQbXURveMQ?=
 =?us-ascii?Q?iw0xA1XZ87XBzTnRkW6TQJviMVfnSKVcIkwnTAtlNXUocDOChV9uFSJXFKoC?=
 =?us-ascii?Q?YHtZ9JZ6UNj+AE+GLI5qYfrnxQjYTk1NailfWaFh8jhxmX9VAjyBRtMl8RxX?=
 =?us-ascii?Q?JH+OjmV+sCh/HWxMmhY+wz59SpbxhJLJH+60TpZ8qxHQqEVkCB/dtOY1c9WV?=
 =?us-ascii?Q?e50Of8vFcEPCOXX+iqgokf1pAF7RMWj7UHPTPb55x2hdbLWNhIpW3LeZSBxt?=
 =?us-ascii?Q?/O/uYvFcHKv48sN/7TjN6Clkz0YrUuDOpYQEZOhdb85Aq6HchsrU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ed1f0d-092c-416e-1f4e-08def9d4bd13
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:22:03.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1Eh5Hosiv+Y3DJhLKyYRgoHPPP66eJ/4GIaDpPPPNNOLxmIpDGo3tyKHRUD0VDGuPIlq2Ij3p4OR+YKb2t4Ln6l1qEJO9uO9TJ6tSh0N+8sDaNmL251uMecyOV2t6FA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index aaa2608793bf..1013bbfc08b3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -239,7 +239,7 @@ vpu_boot: vpu-boot@a0000000 {
 		};
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-inversion;
 		simple-audio-card,bitclock-master = <&btcpu>;
@@ -498,7 +498,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
@@ -512,6 +512,11 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
+	pinctrl-names = "default";
+};
+
 &mu7 {
 	status = "okay";
 };
@@ -592,6 +597,11 @@ &pcie0_port0 {
 };
 
 &sai1 {
+	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
@@ -670,6 +680,13 @@ IMX95_PAD_GPIO_IO27__CAN2_RX				0x39e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_MQS1_LEFT			0x31e
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_MQS1_RIGHT	0x31e
+		>;
+	};
+
 	pinctrl_hp: hpgrp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO21__GPIO2_IO_BIT21			0x31e
-- 
2.50.1

