Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5B932B99F
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538080; cv=fail; b=ObV/s8ikje14QpQQU+7l47lZ4x1NAS1fxYsarcliSHozcleI6vAD4oIYA+1HR5I2X48nG6DL4+6CdElc8iU1fsRNHM/zajqAAXhX0njlGaeHKedsUh8IdzCzpSMb5JotYMaGo7Auptr+rnz5NV6qvhz4jxaS8NRlu4abHnNfw7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538080; c=relaxed/simple;
	bh=bY7cR4eURX21Z94Zwa0EaV33M9MGla0xNGXAuIZVuoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IxARhuMel48N+5ItBLzadubDWaIMhtFP+JEC6y4w5KiF2KBvHF3fHiMQRC3vyiHsuTs398rj7hImaW5UqfUG+3RmWzTb+Rz8X8l0rwINd0uc/NjxjQBcNr9kPNQVtecEbkZSFBlA0SbCjaW56agNfMuFvaJWJ8TavHj/I9UJFoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p90FCO6e; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p90FCO6e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR4vq6GAaRibeQ9lbX9WAUCzA1lplohSlxcrCUba/zmkoNIeKvmL62eizy1EHY9Cfs5MmVqtrKuu7/wxxViKZbYjpUXERsvyJW9ZFGzqjUYitE/Pfjru8SMAMx85cVGRCdkJo8RLgMgvied9SyHQDwyDvQI1UdeIeX8hRThFxwOkVuc2ag5ZZFf2sgPflFI0oMUNipZ6NO8dcT7AccNXlpjmzj4EjJS8dmRiQcgyeooK6GdU0WZ5tRX/VDErJu2ub3XXHp1CsXL/1FefhElgrdd1G3zPDJsfMsEX3xKbodtXQIj7qHMSImSIZWapN+VRWGEaFFeMeqr94g5EBVzXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/JnlFn2xGoTqRGjD8LqcxnfR3VEi9j7RsHMIwIa14k=;
 b=daXfq2/qLD+oBWT6KzpSpUpLOhCVmg/AZrF7Lt6GEq5JxLDcrQ2K3rhc/a7yIgjA9l+7m2yYbNEvvtWVdd6t5u47e762GwoyUetOMj+XRGZ516JS4AugMR0A45s17wmwEMbUufwOsDO4Uf/uMwd8g4hOl2pYfL4/j/D/P+3ygBKFTudTdngybimfDr4g/g29/p4+WfSwKTfX+bLRSC7A2tOPwdZJpwrLFuSZUyB5cnPCJfSogw7iRMgFONHyqvNpyqSSaF0JV9TBCoZp/HTkyAIXJ2lZctDaZw9kBvuLm+oYkuS73Fl/Qp2YAgaO5s8VAKSGKO9pDVkikY2CunJGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/JnlFn2xGoTqRGjD8LqcxnfR3VEi9j7RsHMIwIa14k=;
 b=p90FCO6ewUiebjZw6NeHYdogtY2CxVqVJq/NnL5ozg5N4XikVXWh+TRJMKRKtvvXp4tLJhUOBoAqsnK7m/aO2K1+zpqH5eShScLZ1mPH2XMDPCMeocl/95tLZyNL3eWFc3pYUGWqHLpiPSPYIYfk+8w55kiQD93ry41F+s/x20CoK7obRGRLGI63GYe6aB/RgJuYpJ5gtL59+PnDFmzGnIM/RB/XlJNCzOVjcwfRbltBZykvwtYTkjNBo5J3hevzBEBvSD4aHAc2TCHL/AHWCniq/gulA3dNkALZz6cOSr+jg+QCi3TspqyInn4WuFa2rV+eduv8qMS1v50Z29NRYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:16 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:16 +0000
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
Subject: [PATCH v3 07/17] arm64: dts: imx93-14x14-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Mon, 24 Aug 2026 11:20:10 +0900
Message-ID: <20260824022020.2812810-8-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0034.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::11) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: c59ac311-d8ff-4d9b-315c-08df01866048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jcCirfvn/RUTAejhlK9VLJcItnMD/yrkt9SHX1Mt8Mtnewx8Knf6aiCOCtIQ3W1MQWM8sJnCKN0NBucO1ViREoN/Wsp16mEBJ4zNE3zX0Hf3L621KLNEvjvN8hln441PMRbJ0pGRNmiSFqmRrnXrJyocVkAygJ8JfesXbgQtAQ5NnjSc53x9FjQOMNK+uMJrKkYTfnSsygSC0aCEOQBdPlTB/D2xih+xODRk73B9ZfmdXldKsDEvUayKhPYQeVA4zMkMmWwlPniQQeTMidh8c78Ajt1XptterYtBoUZfdHrZF8kmryS+c4uQBrtcMgjKIPoJstNhOuU77oLObzsk4Up5Px8yE0WEQ0gz0nD+/4xdrzx33reSw/AvojGLE18ClZKxAyX/SUnCDIdRoVh6DWkWsSvH2EtwlFg4WM2Sup61GIh9Plnc5ayw4YAyWKyhTS2EIdGeEMV3DVWa/S+/oNVxnSjZfPgVAh2dXE/2eJTDV5ZAIOTy6rkAPDHuGnS8cgVA1Sk+xQCBaEFxODi6lp1S6q1GVn2F6VNPFPVAJ1jdnFDAF1YPua83iqiMkYYOTxfUwi5Wmd6piJZEVp5xnkxJ14FhRq8tAhGqmxainyp9m1ZKFf9dDnjKYLMWPZUn9lBpVVruhb+zWCF5v1DwTPPDzt/VEVa5J1DmXQg+5Ow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?czkFWBJ9zWczfleWBc7kOj1kBZY0ZHasP8lwZNcNyLQ7gjdrKDstomDPmdRv?=
 =?us-ascii?Q?SZAjX9jBsK+s/JutF4Qpq5n0XyiYlIrYlZBR7Mb6miey874dwCr8J5lpqhw6?=
 =?us-ascii?Q?gnNmiSXg9exiNt0ueZjHgquSnyqUakWNWq0H1/rfgZ40zgAHzuFSUOIQvJ+5?=
 =?us-ascii?Q?55JP5Z6FvWbu7adl1+d08ctTfTMfZsZ+/RelVuE8bUKX19fBefK2wUzT8bV6?=
 =?us-ascii?Q?FNhWtR42y7CMY733NRfygSc5kbdtiX8GEP2iOUfiiFlV3ydX+/jtxivEqL9u?=
 =?us-ascii?Q?ds5fdmCD0lxZ5KpdeX6gFI4M6GfGOCO8ymF2PDLm31vi8ft8f4qk9f1T3W6H?=
 =?us-ascii?Q?VjHrIOfw0OadRrndmTZrQqAQZ5TqIFcVeObsCSQpOdkuoldQkaNVZI1K00Tz?=
 =?us-ascii?Q?tHsaOvzoU2sAgJCIOX+66dOvKpt1fJsdjiuofKsUCvq0h4oeultQOyq2lqpZ?=
 =?us-ascii?Q?Zmhdv5fdQgXZQVm2MNr7+el1EX/PX8vFNVNtgKN8EkOKVUYJxab8uWPVZIzF?=
 =?us-ascii?Q?MtiRMZPyZ5IZ3/VvW6hC2lC707+4G8gvpBffX8jzFzkRHK7cxBO0Qp+/Si4y?=
 =?us-ascii?Q?FyFuk926vMqY+0sex9G1H6Z5LwJLj705tfNPhAoBM/rYbrMmhQImcS1ZAFZg?=
 =?us-ascii?Q?6z+IC+BBuDvWsMLWzm7Fy51dgAcJkQg/EH9x06xpduAsMLl+CrXhg81hAb/s?=
 =?us-ascii?Q?9NUhkVn6QjPTlevTs49RrFn3+qEVn6jN0QxuknRxsd+GhNO53dMDSpu0nz5p?=
 =?us-ascii?Q?Tz0ShS9pBNMKoWetEu7oNpTeWis5GjBekMZNwm9PnRUaXZ959uxOTag6udWs?=
 =?us-ascii?Q?jC4DAHbLKV4HL141p9/ZN4fjbRm/OBqP5KTCyAROk0VhAwtgUqhD85m0+h4L?=
 =?us-ascii?Q?Wg6Tv0EeIwcmRzPBhkIgdVzTsp7UYBxFg3Cg/a0KHLFOKbuug18CGFwPpCVY?=
 =?us-ascii?Q?N09YXTr72exLuJiJRhyJaizyUAhPcRIXOXAbkTXbeSmTANJFnnYEmo8CgzqX?=
 =?us-ascii?Q?8DtJgXZAel8G95+tnTjK1cr6MW0BuQ8TA8eLSzIz2yM0O4DKfuAzgovn+Ey7?=
 =?us-ascii?Q?Ot+UhRPAr8oo815HObi/z+ysARS2dQNq+uKCczBKOOgL1NpUUyhUHcZn5OUO?=
 =?us-ascii?Q?7ns+Us/9yb6Ss7kmVSRPRp799NtPOOD6GEtG2xZFhrBIA/kDspSzsiSsLsR2?=
 =?us-ascii?Q?w9NNKLqRygKk9iyHbJ82cmzs0i5D5+7E1QnOpNrjOU2wDa6Ya767nR6mlmFW?=
 =?us-ascii?Q?ucFqiA3KQhnC9j3U/g7WOxhGrxlbWOt7suNr0SnLESheh/J2ZGGM4R6+E257?=
 =?us-ascii?Q?tpBFLOWGoYcqnvVXA82iPys6kcd3fAzTJcMkZUGKHwBlNlTyb4Rh2Bm24uag?=
 =?us-ascii?Q?iAnWSZUjJSkj/By+PLEg6BuzgojHyBFonirOrJIyhMTuCtV7cIjml4zYfozs?=
 =?us-ascii?Q?9BJm1zVr9z7HaJ4heCfqrxYKrqcYzlkLLOvQsby6Z2gaRXY/tHkziBh+pUli?=
 =?us-ascii?Q?KYy2XgTk9Xwo6b3QOkX2OL7z37kgS5SaEnZcVAyMw59rRdG8EOV/ujRGY+s/?=
 =?us-ascii?Q?CVJOjAUrBeZtN1YUKtFIqmr9HFX8kHN3bT1d27E9dpa2aDoZ6TNXJzf3z6LB?=
 =?us-ascii?Q?GenTJXdRZSRVlSdCmqitrSQSdeQyZxyLZpNUe9CnuL5sES1Ke3en9GTy58Sa?=
 =?us-ascii?Q?XDRFI2Ydhk58bJ6bXfUJTxAa/1a1FxJ+UQcjEFKCTQ459IUDv5FbfWsdVdR4?=
 =?us-ascii?Q?tC0UlV8xXGgEdv/aJmsE5KE/q077+QC+0gG2YvwT4Iw88CxAJeaN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59ac311-d8ff-4d9b-315c-08df01866048
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:16.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5H/7U0dAeS6nUXb4mCsEvIVzVkW8cgRi03Q3kKKfNNH6VyFOTNX7V6DtIP6vFGMDXI/UWqoGaT42i1cYziBG7m76tkHd6bsi7eRJpxOugiQVTeSxOyi8YL6sHrYlmwJF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with FlexCAN1 and its sound card conflicts with the BT
SCO card. Add the MQS1 pinctrl group and label the conflicting device
and card so the shared imx9-mqs overlay can disable them. The overlay
and its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source. Also
describe the MQS output amplifier using the simple-audio-amplifier.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index e35946bc3ddf..a025a08130f8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -28,6 +28,13 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	amp_mqs1: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&pcal6524_2 1 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "MQS AMP";
+		VCC-supply = <&reg_5v>;
+	};
+
 	bt_sco_codec: bt-sco-codec {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
@@ -101,6 +108,13 @@ vdevbuffer: vdevbuffer@a4020000 {
 		};
 	};
 
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "+V5_SW";
+	};
+
 	reg_can1_stby: regulator-can1-stby {
 		compatible = "regulator-fixed";
 		regulator-name = "can1-stby";
@@ -193,7 +207,7 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -271,7 +285,7 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
-&flexcan1 {
+mqs1_conflict_dev: &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>, <&can1_fun>;
 	xceiver-supply = <&reg_can1_stby>;
@@ -431,6 +445,11 @@ bluetooth {
 	};
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
+	pinctrl-names = "default";
+};
+
 &mu1 {
 	status = "okay";
 };
@@ -442,6 +461,10 @@ &mu2 {
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -559,6 +582,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
-- 
2.50.1

