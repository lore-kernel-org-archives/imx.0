Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6330C606
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538103; cv=fail; b=M/xhAP4QcoVHrmgojiu8lANLeuaUK3qcpZGeTtNZuZFNLVlJuTD+v7tl8m7wpRgW1PaolkD4oitfgLhIBCo8PwEFe8YZELgfmBZuAw1CydRLCeSrAHWdJ34i2Vm/AfIcD8ZajJlE1HT05QVjwY8MNJhSsZ0ObKXycXTN/yz097c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538103; c=relaxed/simple;
	bh=3rrq/vOvlmuP98E54kaHrRmCSGIrq23xHd+HLsb6sMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PnTkeZAuN/201jksoy6rFWDF7JUaJYmOMGdCRGMscarMOmUQNnP8jvUGkl+u4MoDo3RpOpJ4Kf3XlNlkLdRAZs8NrMOuCkppv6TSb60ZhbGmTZBgPd7c/tjoyK0ukmDXP+4pt1l7cVrcuwtHwcCFERBkiBiCjwFj3fRPCdas1z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aIwelb6Z; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aIwelb6Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9lWg1W3BdQUWoYf3F3EvpF047466bCDnDyDriVKM1HSXfrepAEVHsBqHeZm/Hu75mXhEepddp3MZwkrdFopSDYUBwgEF/XFp45Px7zeG+47X0RAjSkL8vcr0HQ+beuoA2YQ+XWXWwbosFQFOFKKSU59Wm3pGLgcyYwXAyUua9MpVbIRxiwYHp2DpTL1R6pXbrAvP60sHBKBC15z6BpVMCw4hwXBWBmkI1EQdoD9Hg9LGp2sdnSRq5vWO2ZRyIfwb7v7eu7BB3G0fEgpdfr+6lbhY3zl3C9soBFLqtt+XFe1y4clWhCD88Pua3ibXbDfy47enXJAiu7MDIp5hnBhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoLdI2hId2QLy4QYGSgPEY0KfXdjYZ3fN1E8LCBVcXA=;
 b=MJJqW0Pe/t4VSrnGrp1w3a6CFWr3C0nTcsATWV9K1A+ut4INRZrf9Ve6WN78FdmysmWZSM11jWjqdEcy/52sEwr+p8PGAuwGBN2q37Aixh/spCbY7mKA8bxt7BUfJacDlVDENBp+uGTUOI13/3/vvPLBFh7+bzblJWGSVjnWITcbH7P7lwyvzWcszsqhe40sJFADvAdByDlZRVGzICVjlasW3hzsNyp8dbWjrQlv8erzgHM/WcWpKGvoxbChT9n22wdbjy5DesTRWdl3upRdF4rE/MVLm1HowqapGzYCl8EVBUQHX6zJVtz5FWgCdn8vXAb8w3tSzRHoxw5l/TUg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoLdI2hId2QLy4QYGSgPEY0KfXdjYZ3fN1E8LCBVcXA=;
 b=aIwelb6ZpmzAzsFvvhG2KaAY0Kf6YthOfpUPTr8VXYUEnITlTIy1NIkKmeQnwHchmBH9kXsmeyMLMOm+sIAfh1bJd7AnZq0JSZjNJ2rBV6h0V9b0sz4HWqC7Xrlp6GaPAdQrA+5kvw2eN4tV8KZ/zMVmzOAPwKbO4oAeXhpd1YsZEGWQL9N3+yEFcdD8bwPTJzY8tw+h5NeUcED8udUclDQlrE3Nbn7WeB4bnF8mVksoFYLBaXFBaNFiz/Y4I1BSkc7SfjAQfcFFsqXUmVzgZFBIpHAQsuEvHtrzxQaJG6X50e9Nr8SxuwRxQ5qKu8tsHA6C+PfZc3iGN5eY0kUYOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:38 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:37 +0000
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
Subject: [PATCH v3 10/17] arm64: dts: imx943-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Mon, 24 Aug 2026 11:20:13 +0900
Message-ID: <20260824022020.2812810-11-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0121.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: c737da01-8333-4f73-709d-08df01866d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WtJsszX9tTpSkPUXCd9yDED1UNLIJ9UnNXgOH6gYSJQ49ECV08hJqAEcdA3rKxZArY3KmMoiXTB+yE6oI26pZq9cGuPudwSwtJn7OFVH/zKaKJ9dJdr//ofGnDdcPKY1Q4WI5dVvwN1/jaPISi1c3g7WRswlO6pCZvz4H6Kjxma5919EqWV3tsmw/Eawf4Gw/Q4Wg+kfZP2+4oz0/MOsyfjREEj57f21vrISCJ+GvsJsywJ61eLJi7jGx51Z0btfu/zp0YfAmcolYh5E5NZKwyU/7V5Uv3hM8ecK6OaZR+fxHs3LKTUX9GQlwN+a0rGqBzjkLLmhylDdbby+cdKS94JWGMPdPruMY9yHrIjYNa9phkn+j5Tzi57CtHNjzYbsKe9vHZaWCJ5e75YxGFU966FqHeY58z5ZOVfQB1lmRMcAcSD/IAF8NeGvnDvmqRAOLvv/6bvU94gPGemtuwDEztpkrLvkJSYxnbMcldmZiHQ+xJ010NLwlkMfo2bgdlkohnw7C86yRJRbwMuHcFgnolyVSBE60A2uUkpvUuPWUD02f8VYzNN+NUA6wO4uFvQuCatOkAIMmbH6ZZF2Iiur2GsDA8gt47tX82r0p0+8aCgBvHCiHFSig9+mLM8PYWuh89vUacsO/4YT0i2fTu0gfaQzMuy/Okbfsr7gJ65JIBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ybmR6iGHse0/k5U1jgEJNRweby8R9B24ITU3NV1jomp4P5DVKtz2Yte05+qP?=
 =?us-ascii?Q?QJ7rwCKttKrQndcf847H+AYon+uwxBXmmaxoW7owqzqu9XPO6u1igbozwFnm?=
 =?us-ascii?Q?012xmpb9OhlkBttJ1/FriGARv1Pm7QEH7iAfyfFuA8LiJ+glzOymP/JPef8U?=
 =?us-ascii?Q?cY06wwCpGU4FnLy7F5NWKmbrzMNMNsxojoVSO3OEG0LkqGA9G3R7g4WXoBZz?=
 =?us-ascii?Q?bN7foLotPEUoxuDZf8JYIIydhLwRcwBLSbRIh2CD97kBOiutYtgtwrvHeROL?=
 =?us-ascii?Q?+ETzCB7/nFTpJDSiGY6SP0Ve2h6dQO/7+ge7HRQ8UjAxD4IoWmVqpoJyR337?=
 =?us-ascii?Q?8CnG/RHIhAkF+CS7A5dNfCli/0sVnbgeDkWuVKaUqhLxqSal5W1xj+09UPFg?=
 =?us-ascii?Q?mXfmK4DgR+EEKdDnISqsCBTRA7jW6/LZaIr1h3ERbrXzAtXovLBDi0DWKahw?=
 =?us-ascii?Q?Lj7aTSswyP98oxVH5bOthda1xrGfqUVzuULxEgB8URHnvqgi/XHTJ3Gxvs93?=
 =?us-ascii?Q?phjQrmskpuB0+2+WvFPkMmqTAEdl+GRHMn6u33YNOfv1RhemlWmw3MRej8aF?=
 =?us-ascii?Q?ngQnIlX2WJbWUAJPDjPXEMcvtr1cR64uRKlGKT6GD0ShQWwm+blSlj+c6mvX?=
 =?us-ascii?Q?S9Sv4aGWMKjealJeGVdsPgGi5dDS4GJMQdhLRRuT9haEKOm2YouByUvMzjwV?=
 =?us-ascii?Q?GeUmIBf3Nvdoi6vartpmKvbRpfvR7dEPW2YRObr19osF1HJyTBARvXLhn6s9?=
 =?us-ascii?Q?1WTi1B9//mepwv+NDxdCoiv0UiFibvxmHxndMqRjC+M3wbTlnQKbwv/jcpCq?=
 =?us-ascii?Q?FrIMZU6bNjd6ffshs2ozFPbHpSGRD0w6uRsURBHDlFpurh5OhSCkAEBf3MhJ?=
 =?us-ascii?Q?j819aNeHPnl/GxBBkkuyvwgM5LvDkDK2djXQ+nKuB3dN0ypS9Ji4HpqnrYMc?=
 =?us-ascii?Q?4IU7+myBBFSWeFsCUnUqjF+2HW4fMHeQHjR4Gr4utUPwDb5AARDCkDZLV2Jv?=
 =?us-ascii?Q?SwFK2mWtc1xB27Ntj1ZKXY+J2V6iPpxRsKhpHJ3uqJYoQZiv5O+dj3dwuzN8?=
 =?us-ascii?Q?l6iJXX2JLyh/GFNGT4wg4icI/AaH4o1L6NS/u5DruQ0bIPd8nInyCe3t7ZHh?=
 =?us-ascii?Q?PVuRYHI+OkzaWnwjKj+O/p4TgDzubyOlbIAXM/Eufogi9ZZh4OojcJ1zlTu+?=
 =?us-ascii?Q?U29RIf0fK4SxIHm8aqnVJURb4hQXv0alha18B141Vxm528gSuRkPXuwPSH07?=
 =?us-ascii?Q?FLaek0dNVC1/DxVJep0k1LL32YLULJClMhgqLGPhLLXwL549iZ42ZTIkswhd?=
 =?us-ascii?Q?9TbPOkr+bBzpafM21cZY1J1acKoomyew5a7Ynn2ntup7dpm2KeBJ7hnV+lrB?=
 =?us-ascii?Q?g4fhLVI9sp1OmVQA4rH+ZyN18jF2YlNSPOG4RjVSVEG2+Nqnax/uEre7FDKn?=
 =?us-ascii?Q?0K4SUWxrWpWuBVF7PVu3gP+hycfRZGaw8L5DKuDnfFAXZ47LN3BQ04P38F2S?=
 =?us-ascii?Q?C3wanwdNe8WZ+eYEtlx9Wf+NTxEQ5xvVxIaVp8Fb1XArjFfwm/hYDCF8Ggzo?=
 =?us-ascii?Q?hjAwb4v/4GYMQBbpaQ2/1CGlCN8ckMEuDev8BipRqqAV6grYjnCCH9SOJ5ap?=
 =?us-ascii?Q?ecQV/qzLS1/5m9AU4flr24So+m+MelrAOL6B9hbOZNEvMMKSIAQhEG/k90m/?=
 =?us-ascii?Q?hZhgaA5Qsq5awkeRqijvR4k6ycLLWmaB/U73G1MHW9pY5bQUTlcE4B/r1tXL?=
 =?us-ascii?Q?SoBa+w0uiJ4dZKKeZSIjtILO4P/8Lw3SkLtH9eZ7nSmDYs0rByP4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c737da01-8333-4f73-709d-08df01866d19
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:37.8799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AQUdpK9/DMuGh7aQ+t4YX6ycoeA6iLJdW3XoiF/CmqUqPr1j/aDVy2iP1ebckBhHGeKd+QeaJQB6xf1mJ77ZRKYAm8XaWMDn5YK9MEsLdFrHtUe6juR+sRb7fg0ix4z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the WM8962
sound card. Add the MQS1 pinctrl group and label the conflicting device
and card so the shared imx9-mqs overlay can disable them. The overlay
and its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source. Also
describe the MQS output amplifier using the simple-audio-amplifier.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 34 ++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 07b782ef698a..e2856c991e9a 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -33,6 +33,12 @@ aliases {
 		serial5 = &lpuart6;
 	};
 
+	amp_mqs1: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "MQS AMP";
+		VCC-supply = <&reg_3p3v>;
+	};
+
 	bt_sco_codec: bt-sco-codec {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
@@ -111,6 +117,13 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -341,7 +354,7 @@ cpu {
 		};
 	};
 
-	sound-wm8962 {
+	mqs1_conflict_card: sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-codec = <&wm8962>;
 		audio-cpu = <&sai1>;
@@ -720,7 +733,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
@@ -736,6 +749,11 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>, <&pdm_fun>;
+	pinctrl-names = "default";
+};
+
 &mu11 {
 	status = "okay";
 };
@@ -782,6 +800,11 @@ &netc_timer1 {
 };
 
 &sai1 {
+	clocks = <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX94_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
@@ -904,6 +927,13 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX94_PAD_PDM_CLK__MQS1_LEFT		0x31e
+			IMX94_PAD_PDM_BIT_STREAM0__MQS1_RIGHT	0x31e
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
-- 
2.50.1

