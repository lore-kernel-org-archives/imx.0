Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F953C8C46
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022257; cv=fail; b=Cir0oWNxlZv7O7KeYvsCyhteeM7Vrd5YiEx0u65ZRABpHlRF8P9ZRRn2WEP2CgF/zsmTt2YgIxcvf4naGHwM5vdwtLLXY+AcniqdnFf8KcmRiuukEQ0EHCvuLJLIe5fcoTIiOjTbkl2ilONxsxAZD2mgyIcZnOT7LLvEZwc22og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022257; c=relaxed/simple;
	bh=emCkP7GuCMG5BBozbBlX7kvKpmwa2OPqBzaTuLWnKd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nklNWf3tP9uOmbKnAj8/cERzUQBf/+so+KL9m72lub4DUXqbV/AGp2sUlvzns6w8aNjJylLOBI5lubZmVjKkPZJPPzg8Te0A/YOPUpfk+6SELOMK1OC/ZpTg7U7+sUGbM2YCV8utKOPumDSbmZzX/jQah8+n/w94qkvS9b/TaW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=obqeqgG6; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="obqeqgG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuX0fI2sxczWAbqqYRsY5sjJ4awR/s2c0GyHv8hidXa1zyTIN0LHQ5OSM3kB13m3kxaYqwJD1z2A7g0FnhTT1Zy7pQNeWohssLYfxtz5YPvdYwqyanXGAUJ+0EGARUlQzjmcXh3iAxalf7E8UgsiK7O8DR/loZ/6tg1FwHHpUAK0mOg1a8edxD2jjkJ80qqIAOvRLIEPWvrLxgG43NAQMNJ0uw9P5bU+PACMtajQpyRUD+JpQcQVF/5Oo/IdA//1hwKCLaN+YZiG/scV2a5MFygzOhbeqTnMr5obVQPrj08KYqwuD58C2PfrPwM0PO8Cex7RaYsK75/hFHBCzWfwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hdLUowH2V9IMm27Ho5jcJp3Bogt0DqTR3VrfsopSPU=;
 b=IErOwxg/VIWUE6su6QDKSWhmE37XawSiQ4RSsKAxYFKXS2npudTT2Fwep6aOf87U7Zja7OyYWcYBO+v7rW6ezurQ1JSdxANwUb5Y+Pl+eCKxwDeEPejvdQwPQ/LSEBTFaLcOltcsq6wgM9+71IsRPARsBW5jrwQHxuW+jBPXqA84E/0FCVlJQL7kQbXZXtXWWQe1SInHKl1jcMklLCnJTXhmQB6fjQRewXrA6kHEytFxLNVyhPkcxcdo/3klvylczGGlGVMS2cIj7kDAF7P1+eVM8FOpLGHDurzRahQKXgFDfiRgXorfcco20qaeRsZjdB9rrTV9FMC/sKkAaBEDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hdLUowH2V9IMm27Ho5jcJp3Bogt0DqTR3VrfsopSPU=;
 b=obqeqgG6+90BGgpGWCXvHHOjFfzarQyjHa26zaMXOksX8BQdbg+/55XEzLqKbuxfKK3O/zO9cS3167Cs5BwGKDgYJtDlCbRB012CIgPhf19HDZhTyz3z0K8v38U4UQZFc4zPfLxCVWMP945c4EKPyGRv9IDiEps6Zl1x4gj4rUdxy8v9PIpPmqQT78Jy01hQuB2d1/G5XBq/Xpn1zQkWlUBGKYfqOz5lB7son94Qj+oLenb01nGgaPyJKWva1Zeb3OW3oBojV8LlkTKAC26SsGo3UzIfwhkEQwuttYkH54iqIb4vmeYgCmHTZmkumSo4EnDMzGwfN0Sr1UWtS5vLOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:44 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:44 +0000
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
Subject: [PATCH v2 13/17] arm64: dts: imx95-15x15-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Tue, 18 Aug 2026 12:02:07 +0900
Message-ID: <20260818030211.3141710-14-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0164.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: f58c5fd3-e43d-4967-6347-08defcd5506c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZtPrpg04DQj2v20BjaHMpN6CAscZUEqvyqN1xW3bhesU28wibqdgmt5ZbV6a+/gUsC8dQ7VZXZ7RGGmIQGLxH4CT+iSBOO/95nLh8fqyt2aPRNYEp1hmnCC83MR6jNbRy45bTvS4QahfBLFjwbOgZb8GJSOq7i82hn73/c6YCP5Ls4cILjVWOoIJZGpjxZVopIpH7ggBoiGcYXdwNJn8UiXRo1H9HSmSidLt7mT4vuGp4BHRvHVA8V4SlH+PT41gfTNiT8GQb5zGUx7gZJgk8P1Zwr0U2iu6Gef/va63mGxfPYAnot3xWdVgzbPtCYuCQVSi2UzRWqip7SV9pSS40+GjKAYx7k5vBCbfAFjaKbZ8dWxfOHuKc+wWp/R/sKLv92rFyaLYfS0xR2buI4kn7B/yDH7boCSoxtz+jBThItF2x4xjD0IAOQuHS0o3yadSiVWzGEqn1YhEKFDGmAMABz38kQEYML27SpqnMMfUzeGk5ioH4gy6U6yVZ0uqk67DvyiBOfTyyIumllxZ82DDe6HZ2TVqe4yWTqBiwuRf3ZmWu+pQrZ8ooIXCLwyLniOb6WKyMnPuHhptSlVbRGPpL/6FbkyzN4If7GcHdKqN66yBWez+ZZxrYDKWOp/8LwUMp+r0Kzl54W3dOy9OdVp8p7dKhU0vzBJjKmMa49dH2Ro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vtmV+F18LOBd8Kvo5h983MznhyQsmsnKcKxa9y9vxaFeLHNEzprf+7Chx9FS?=
 =?us-ascii?Q?O0pFVq2JwG+fjIIpuqgSmA5v9fY1E1Dy/U5EO3J3K4+Wxd4Yt8u77ltrCgpI?=
 =?us-ascii?Q?n+4ej7nSaXhnO4tXU4OTnyYa3iswMJMmah/SJtEUX2n1fG/GdrSxepfk0VWg?=
 =?us-ascii?Q?de/Tp8MTGfOgAymTxxLsJsi5Gc90VrxaHfmjMiozL4p9C1Qdqp69GB6PWXe8?=
 =?us-ascii?Q?7MUv5F9DnlOl3gWSz/su9noNg96OZlygJOA59al3avmMugS99feMSezsf4eb?=
 =?us-ascii?Q?4sd+TKTBaQRlqfHX3+MPMQYGvKo/v0k2zUgqEe5MpOr2BKLx4XwTXJIa0fQn?=
 =?us-ascii?Q?ZjsmMmTjd1kjB2OeMvdMdyhjrH+fgtRZDDa0dlfcb9pmKqPzPPmYQrTSRVI8?=
 =?us-ascii?Q?uunmU21IX1mkxCxqp+VvkhmiY9EL52btvWTjsRl+xyci/tAaSTjhErrr/u5N?=
 =?us-ascii?Q?a55aUtDYjAhXHoAABuHmSorb4Zgrrb5zOOlvW2RfwRD4ry+6GTpHMrVuxzMg?=
 =?us-ascii?Q?5NFeZi9BvAKHVuesNZIMDM9nIZov8ds+nCy2iObum4+aYLvNJxzSInbGVv6L?=
 =?us-ascii?Q?DDmTvE8J6u65D7lerMsRGfIPa68Wv52XlATpdnEKwhx9ASMo6Xt3iiHaB/cY?=
 =?us-ascii?Q?TXyKTNE6niYGO756gKAA84LKRkT3uilx7vuLT04oqHJTaMEes13kSYdtvwei?=
 =?us-ascii?Q?N4Cks7OfDpbM+8KgsTxN3vAtvDg7RWOjyx5FoAuq3hq3RJHM8FBQSAVzq/zk?=
 =?us-ascii?Q?nDLeEaUR8SHzvmUzBNs09ILPVAiahczsR2t/sp2EGPmucLn518bvsz0DeABt?=
 =?us-ascii?Q?6Xu8IOoe2IEY967WbmOnUT/ldSwsORCxX1w+lVPpm5w6NF1fB5h+GohZPcr3?=
 =?us-ascii?Q?dKGtsowo3cBUhqHVVhtsqAh0UTZRFuYauwQ+y0jHy2H8cA6y+5+ajOBjtKR9?=
 =?us-ascii?Q?W61S2fpnP7ckSy1aVYT1vqOimOIiPUPvr6xZ2O++Y70WZNCrWMBX6ZNVhuKc?=
 =?us-ascii?Q?StzrmkcEphzNVW31vX8DyHJS8N+0yGnfVvtFzshM7NaZ9hSwc93LFaIPw3dM?=
 =?us-ascii?Q?WxSLBvTUphGjkU78XdBLqRAkwOphIpSvln4C/vYVwdtkTon9lMy3HsLT8U/4?=
 =?us-ascii?Q?7YwLMAj6w5XaHpwsMLAcrsPkRFeHw9GHW6p7H3LygyE9CncPPwtAGzn84AFH?=
 =?us-ascii?Q?7cDsJynmYqSajActHO9r89lDUa8oBTZ5Svnve4f1eeDU2ciG4VcAgz7EZDci?=
 =?us-ascii?Q?t48Srwsat9oSwLYRzTZXMDgUSho/NLLPcWZ4m+Zg1k/FUBJqQ9vjfkdtlqMI?=
 =?us-ascii?Q?bEZh8oMO+xP1o2NtleEoIshJuVtbAiLu+qli0WzADaTB+nN5sTZ/7wCNRNiA?=
 =?us-ascii?Q?D+aFkuvoWr33x9nW0k5YNpeLYzAUSgq+8xFFaUxpKzDyFdB/8rstvgYuRLx6?=
 =?us-ascii?Q?RSVzNbk4sPcPnwKu3MZz2U14HHwCKMy/Vr+GO7K4Eotq8VzX0do+JbUWUyhe?=
 =?us-ascii?Q?AP8UpeBklORDA1mZ4vfMeo8S9+05hXiab0U8g034dwkduPE5Mnfhm/LHN14R?=
 =?us-ascii?Q?1vZVuZHcc59IUeMw7o5TvDi8sJ6cgYSGoJt2nseWWl0xrvXKf9eWBBZgmZa2?=
 =?us-ascii?Q?MRdBdHep69/MQG+ep23A2DqpbpnO2ATdIuoVbUw2pHDPnoNrjjDovP4oldnN?=
 =?us-ascii?Q?HpYowyX4AVt4sie8BQw9UqjX5+rGJumlEwfSL1Z90PuD4Sdei/AuXNS8OM5g?=
 =?us-ascii?Q?Q8w5l5PBK6qV2qiFQW3QsK6cQm3qdAPKRCVmmStdWH3QuN7WJw4Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58c5fd3-e43d-4967-6347-08defcd5506c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:44.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnDHvqfX5+rt8Stw6oRsERX+9tBKkVWafy2t3FwheWZCHLMPw00cKCHehz2P8PtxGaWXheMjc2tb+h/qJ26XNobeZdynUMGscajYMVme5Ho+tGV3k+ZUT08RebiRrm2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source.

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

