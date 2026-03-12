Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64344302165
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 03:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773287283; cv=fail; b=GultNRrX8K5Gu2yUjF+p5TLZ8JICzaYnJllK/+YLBbOM6eddlGqHD0tkI/6bYpiVNM7YXIDCw5iz+Cho14NHUWD37FyY+286PebAlO2W85I2Uta0HGTkQCmtXsB7bIA2YnwbC3mfGPBT6Qlc20fbpiDFsCfkzuOOfCfsCG0DUpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773287283; c=relaxed/simple;
	bh=TPJ5nKPzaF+UEllYcKXbG6BfmNcBebL4MRQWXErTsqU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N8KM1H8/N2kYI8E+dxyAIw1I8iLsQx4KYG56sPXm4i7HxW63ogucWksASFCIQ/rX0FuEObtHZtOyxBzVn2sb9b65ppGjErK+qSE+d8572RcKKVCLhcprT8jZB0fEVp/YxTPhafnUjHwa+7Ze1hXq8B+bLI/Q/tcfeRu+lqQ87pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jepOGJCd; arc=fail smtp.client-ip=52.101.83.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jepOGJCd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYbWxYyp9ixixOGtV7MI6omdzjzSN+sCz/ihJbiUjdzMYol9NI8xRJKsufZ4PilsRkMtflQbxlIOqp6pUc+U1KknSsGwou1e1zD19zjtaH2xxTfzn9Onp0ROvmVTc8JqpgvOH7QhNQyyZA9O3o2TYC/1nf4iDcTnIQz/e2/VF58DS/IaNYYJ5xZdAfRljYYXTPflGq5z7jz0QOnVsXK5PulUVxWWF+SGvVye7qQRX+/1TpFsaDUGsJTB2nznVo09PQf5DIcKgZjhJluYXpbY9GQfzVEcCblegI7V3TFO7P+GDC7HvfzZ+bob9R7Ogb1iLRMj/dmdLUY3gxTtGTfpQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5342xpxgfdMPoAgy1aEbjB9N+WEL41Xngv2PRjhfOro=;
 b=G+9BfGsVA9TzbbXtVZ261ApobuQJU/l/wJZ//FBBtCCEneGsNUaUjIXISgMP8fLYLIkfLQPl4KkpRPoY+ulFmPPknbpPr455FoJ6DABoBDqFY10BQ2lZFGaAECsNVzW3X12P8JB7uEgz8e0qhO4cudqBRcYigb/xIt3eeoSKN615lcPPXfjUlbeujcgiwREMUePJQ/NjnxWq3pLx/5gpB4L8E6Rlc1J/4+DO5sgIGwFlh6xQ5rLQ7PcykalLnzIUS/tv5thzk3SZBIGNVi99zj9zwtP0roy9RUABvOAHkwrSsNb/uTCXFhpu19l0mW/kkSCIpD7b1cQ/etJBjGFdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5342xpxgfdMPoAgy1aEbjB9N+WEL41Xngv2PRjhfOro=;
 b=jepOGJCdBE5PaoztAksTHVBVARR5M9akk0lgc2tZ1itVPrr8a9Weawi7HAlEoUGXwrHLSVdsqLz04h8kKjrQi/7mpVyXqqBIGMCSuyb9Fevey00KoGi0JnRxTtgs8iQMc3Gx2TrMrzZTNzaJyM8Fy1UVHLdsUnJzb4cLOUkzGDn3SZWS5vOyaWQp+CICOd/VxftRWvrrtasCPX5ylhBKQMMOQRJ4pSCfAMdroKyAxvYYQA1riy+4eLOiqxOn8Te+foUSJbX3a12XCTMYqZULWF1Jw3iBJqsEO+F6tU7QIes6IOFCAmP4kwwKz0k0Xsex0MlwkXfwKR0f1kYUNQ+1vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB7636.eurprd04.prod.outlook.com (2603:10a6:20b:281::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:47:54 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 03:47:56 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: imx952-evk: Add bt-sco sound card support
Date: Thu, 12 Mar 2026 11:49:11 +0800
Message-Id: <20260312034912.4007057-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: cec8aca5-fe7a-4016-6c4c-08de7fea25ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	EqBeDanKcygH/w0xKr/bAPbMpiONv/uQCC0EHMV2dnqQRllQM6J+W/xtvQv/HqyfOdhdHiS+7sg1CLqZlRpo3KhXRy8jXy7OMYhxe+kxJvz9aWesU+ZFt58pbYG/76Vqw3rYUuOlDbJpqCCNSUIbIPAViDs9PfeH/ePxDi0zgXg0jy87OoZq0bYrzXku6nYOIpSE4iGRj+N4pyQXLyf9DI1ZUg3SOmrHwDivGW7LBbGzDXT1gJWIs56pr7Wm7iIkx0HuDSPabBldb4mipWQtcCCF+8S1T8/IAjxi8QaN2SQqgjOWtBIPxjjZmg+9CsxuNMDF0Gfy0/grL0g2BG/RunSTd1gAksasRTo1P1KWft4SY7LWYfBExj3FFLnr59zYeWvXd/C9/jK5CoJTpaWigfB+4R7Azsxb41ip0gVrATnEkCgbQoAz3/G1wYu+FE0HcYZfPZ0JANzmj2Q+LPNr8egwFioLcMLCDse+IB+rMFjBlSbqY6gkfcK18d5+9O8U6Wt+WF7rtzlRToAqC7IEOT5IL0cGsW4JuPk+OnNrs5uUWXqQtKu50OpgZ8VNa6Z5vtv9D91hYfbkAeGn0GHFBgMNGIutfV1D+tXoY26gHMv0nHtg4d8wZSWB3whf4xMiqK6Ilc8bVfc7MbvpkyrR0+5qWSsH2Lej0qDemtYlv5y1cm0WooJdIQyo5axf+pUyfG/tnQ+vqQx8RxbFFSscAvfBId13XLIIlEYh4sbi0jBSBFlBdryi18q/WUrHihIe/k0Vau1MUNeriX4lO41dYjipLQUNd7/3rE1ISTJ7d/+IHu4BW0yYshau67WA+9Le
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ePaAIrXVHJLPhE6OydcNMiLehe9gUb8Op4pJ8AxviuJtkUtv2agk7Fz2+jP/?=
 =?us-ascii?Q?C+GtyQjuFp6DpSxlqsbjwQvYz1WDEdSOKk77S6Vz2KgcH2nM4Ci9/+kwRZc1?=
 =?us-ascii?Q?mV0D+QxIQfMgK8rFte8OGN25PXFaN4yWguv5wEe46Enu1HF77i5ri9nFKKQ4?=
 =?us-ascii?Q?x3Cl8NkeCOIcii9+R/KREiOU83ga3qP6Yqs3KdliCbwM3wUWVMmGDG0I7SKn?=
 =?us-ascii?Q?HZAYtFmegUbiVtjSWh9iMkyPa5SuAEbzLf4w51iNHRiuJPssKEPrT9lJiPtD?=
 =?us-ascii?Q?LJb00s/lRbazhXns5O3FPanVrD9b3BKB0dfkkgAXqOLPWSCteXARtm2CUGtg?=
 =?us-ascii?Q?5kkB9+60zr2QIwH0nd2MzWnfPuVCVPy+pGZcGyr5Htd0+P4kmzUMRlgEV+6t?=
 =?us-ascii?Q?M98zh5lMBtctpMioyMh7J/BIa6g5g1F3wfMQlBXu3zNcuaPP/qxFXPpwYSZN?=
 =?us-ascii?Q?AKsi7QxMwHwfkLp63uSiga+npIRWFfkhbYZAPGoSeTaYOiqq2Ked0rUe3Lal?=
 =?us-ascii?Q?AcLBVEXM1TS8wQ92GioaPJTcxn36h4GiPUJiCoPZwVO3pbQXBPThAmCNwOa9?=
 =?us-ascii?Q?qiTGuNxgywPtsFycUtUENlbnKYFsNP3XPL0Ldwu8Q7zf6Jgal521Pe595ro4?=
 =?us-ascii?Q?0EM0GUsDAuk9hwf/45RKfJ+hBSSV7BqMJ8k7jeS/5AXDV0two7X5hGlNwbT3?=
 =?us-ascii?Q?i8TmoC3+Zi0wKXBuJ2aCv6lzDEdMeiO9ksuJL1EcDpEUbcWYXs+CNFT92U45?=
 =?us-ascii?Q?nijz+J4f1Jvh5fNHJF1fB9VpQyBppBR2Ax+PXjNpBPWv+AXJmQXLJobxhrAr?=
 =?us-ascii?Q?Z/9id26BU4pZLYPm13Trr7IQssHHJtWKRwulYehwj4A+lpmBMSMQAQLlaKDI?=
 =?us-ascii?Q?X4DtGe7zhEgDNCa9w/eEy+ebYQrfHTRihaAIA6eR292p0DnY1jvlx59gxXR8?=
 =?us-ascii?Q?Ffz4BzxZUvLV4G5Y4Ps6xDVaq87QGKXGW10sLMONkQwca8Y9rTH1FwbTcADn?=
 =?us-ascii?Q?jwan1TYDYn2Vq1lu2PZ0LMFP1PGASlrtA7BxaknAVQ/FiKZMX7QbvUUwHDUP?=
 =?us-ascii?Q?ag/tXUjGSrBHgUXtFeMvgFl48Llf0m/V+RS4tXJU0w9U4z5B4ry+dZwV/IIK?=
 =?us-ascii?Q?HU5LJzCeJrn2qHFYnhogEMciGm0ZdYS2gd3wTA07rNU5Ixfap+pfKtj+3SWx?=
 =?us-ascii?Q?7o8BpENs0BRFkg7QdHiVe3AZac7jOmh0J/KYDyyWU2slKYh7vHHZqeL6o/Uc?=
 =?us-ascii?Q?7/s0tXObvqPINHBz8SNKsyC1rgaRgC1Mv5kDNwIg3H7vmIBovYgPZHbL244G?=
 =?us-ascii?Q?q6CZC9plgubcSzqAscHhIV4LLrqfTnRHSa5Sb7Nn8S+2L74e1pVo/ztzSLnw?=
 =?us-ascii?Q?CkY4DlImpeKaC65Faun2BOaRfenRIwJvS4+EcPaEzeMhsvLUUG4PtU1Sej0k?=
 =?us-ascii?Q?RWB/UUcMSpmfcFDmB2sAoIMDlK2+5f04IITWg3uK8M0aPsceG0WtvCxl+Wf6?=
 =?us-ascii?Q?MrhBw/BO4kSIdo/ftCHawGJiPJTDl5M0bY+lBIqQ/Au83IAFjWhzp2kDNRjw?=
 =?us-ascii?Q?nYkPeagRQ9i0mV+XcoUwRg6D+Qjmk+TDYLHY6BzkZBnySAUkuo1toAF/sBWh?=
 =?us-ascii?Q?3G9wCXpFtSzLV2s01w0WCa5oWxkc0xTFLh+Wv/obH4pG1TEFtfwFYQ/g+7zO?=
 =?us-ascii?Q?zMdE1+FTn4UwhDbVPgRuYWiGPLKIS5QFQphr5rS4eQJUM9W6XoIAycTZh46Y?=
 =?us-ascii?Q?O/GEesGo3w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec8aca5-fe7a-4016-6c4c-08de7fea25ad
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:47:56.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSas8+S8lqmtwFKUbyOWFWbsp5jTUYHhNPhAz+YylnGCAxxkpMLF5/l8OcsY+XHyFCNTFDvoGtYpEwn9ddo9fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7636

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index ef0058b98573..2615fbb63145 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -43,6 +43,11 @@ aliases {
 		spi6 = &lpspi7;
 	};
 
+	bt_sco_codec: audio-codec-bt-sco {
+		#sound-dai-cells = <1>;
+		compatible = "linux,bt-sco";
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -140,6 +145,25 @@ reg_usb_vbus: regulator-vbus {
 		enable-active-high;
 	};
 
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&btcpu>;
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,name = "bt-sco-audio";
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+
+		btcpu: simple-audio-card,cpu {
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+			sound-dai = <&sai1>;
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-asrc = <&asrc1>;
@@ -387,6 +411,23 @@ &lpspi7 {
 	status = "okay";
 };
 
+&sai1 {
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	pinctrl-names = "default", "sleep";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &sai3 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -575,6 +616,24 @@ IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			IMX952_PAD_SAI1_RXD0__AONMIX_TOP_SAI1_RX_DATA_0		0x31e
+			IMX952_PAD_SAI1_TXC__AONMIX_TOP_SAI1_TX_BCLK		0x31e
+			IMX952_PAD_SAI1_TXFS__AONMIX_TOP_SAI1_TX_SYNC		0x31e
+			IMX952_PAD_SAI1_TXD0__AONMIX_TOP_SAI1_TX_DATA_0		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			IMX952_PAD_SAI1_RXD0__AONMIX_TOP_GPIO1_IO_14		0x51e
+			IMX952_PAD_SAI1_TXC__AONMIX_TOP_GPIO1_IO_12		0x51e
+			IMX952_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_11		0x51e
+			IMX952_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_13		0x51e
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
-- 
2.34.1

