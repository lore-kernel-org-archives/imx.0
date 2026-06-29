Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954613A2E12
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719295; cv=fail; b=GxOJTy9D5qv+X++QHiQCiRdSDWp+qqgZR27ko7jgWD3laovBK8UhQSiiXLkkvUeT7E9NoFiIaE5DsVIpUlAGk/gWqgC6XoNkTcUD5t6rCDzz2xJD0Fwh2G9fd84jtYVwxMjQhSQi9QSqbfJ6O8wDgdMz2DlneZ3yv8si/liwGZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719295; c=relaxed/simple;
	bh=sGVCePa8KccIjZTqobASbPziJpKvwfU4QqWzx/WdAKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NDBQFqxOYayRZ8t+ar399kXgGTPicf05E/zpB4hpWMJraE/5h0hMf/+Dhp1DcuhakvHiabFA6h/1HugfQLxSG7thZ5AnMjtAZjHsh/NjD9P6qK+gLP1jg1jaECGLInLInAe64w0fMBVrmDNYyfeNr4WbHit52SEPHqFyqrUF7qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nNG9to2/; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nNG9to2/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuQk2fiejcFXRBLN6q6mF9XFuGgKkCkCu4CgW+ibeYpRestgtFR6NBlZPCcJlPvS/iKb7VNIi3eJ2F3IwpfgPeCz2Ar/i5UENas7wGIzg+SOJywx7wOQYFtj8MukEt7HnLh9ahy94MlCk3JDvfnfM/ABVzTEZ2jmXQ3kp+NU+DFtwqBsz6og9FSfxvedhdBzkL6sv/CaBPbWh+g0Qx8MOwfG1fw+RakUqYH8kh0FxfaYeyjC8LLl+iBqGDhGEeNopcqW20d0eaj1MfOLGQ4bgnPoDUEvPl0kl7BXsWw5QFHOcf0SB852OSu5jpXo24mV59iFWeghyNPPqYhQwx40qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMwPyjMFS+65qzStTr1X2QwWkAhlaaTnzoUjFypE/qw=;
 b=tvcwqpEjTkWtpWOn7La5QZpwYvbO+H4ZbZ7uZN+w4ckfwJgztZCpdqk0m1V0ES+hNKrHT6DutcZP6ZbQlzMwMC++RMBg+sUevfOvGtmngNLQbbNy9m8A5XLgOF4eZrUUT1dcv06dTQeSHIftBqF1lM6La3fgx1QyB+k60BvILSI1BiL6Z3DqOGX9IyLvX3g3Piw+ov2IJEi6Pu0etp+k3L/h6P/raEVu5KyN/nIHOGXWjuTc/W8kflprY6qSgYCGh25FoS0Eg/tK6PCdNDAtTC3lVqlZdDo1VFRqUMQJHtuD1R7zYHrVz34r7ZHgKg2V/U26tdAnDxquPf2b1IHuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMwPyjMFS+65qzStTr1X2QwWkAhlaaTnzoUjFypE/qw=;
 b=nNG9to2/94V1TT9RWdZTy7DF0AsPQ1ZV6JIjG/X9r0MO0FZ/jtxEU9ByCncKmHWpRE75zyM2iOnFoe4HneJziqZTXp2d7AK61I618bSc9h3Id3yDQ9cDN0Sz416CJCI0GjnplM1VtUoMS+0Rc/TDWVdsyAXXcePpcqQVF1HQ0F0MLv6jm1ykCcOtwWWwwFIVe6Drmoy+0+h+hOVqc6D4C46BsWIDk9ATZoMqHbudu33Rw5iDqs6UuQD7/vtvSoUTOOFzXpbzb6yWZeJkG60ZJTmyIJUPHgbsDgYRBdDSgjlUBCsYS+o/YXSm7pz+Yd3h2CutFWgmUGgcdHzCYcqO2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by PA1PR04MB10553.eurprd04.prod.outlook.com
 (2603:10a6:102:485::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:47:55 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:47:55 +0000
From: chancel.liu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
Date: Mon, 29 Jun 2026 16:47:32 +0900
Message-ID: <20260629074734.3643227-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::11) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|PA1PR04MB10553:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e63322f-c9ac-407a-800f-08ded5b2bacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|19092799006|376014|6133799003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xx3stcnO1dDp9TlSlK2W4+OLTpo4K7Ce42E3idqhjoOKtpwCypbPQ5pDVP+vt83NB1EG/8jBfb8eL+AWs7+6EbrjRj/HDoz3/DBlK/pmyH/3pmnvk2bBUOrBEY6/U6/qAFXay9ajasoQgll6ANKgRbMbQb8YwVVk07eZfmdweJWugR/VgFj8o5dBxfgBBeZe7ZfcMwG+r+hkHEu8rprp+kiV2hZx5Ju4n99/MNasUuiX4w5xOVlCnkOR6g+Wyr/FqTs8wTTCBk05RhoOQeY0F5TLdqxbfWAms77CG9wgETI2QGnPVI/KHCS9qZa3/Kkd3qqY8H8OXSaTaK+EFbqNvdJ2ZKaoECYZY7F1Hjc1WqGayb5UKQBFcsD0J6OPu9zgXHuO24JEa/S5eZALrMkha/miU/FNi61pR/ZtLg76e+fqxqjwa5QrZOrORBYBpL0e1c+PEOtw+HM1OUwRkRlXEEG+8I8kv5iNKQpwX3hv76yq3njA9KBpGxAarXAxfHIL8HFI28+mD+5OhT6nrtkfg33cb3n+/4xWvGIq9RenVnXwe/5KfGskfskXycecR5+p5OWoK9RuW2UgjLb3m91/TdD/nTBAsAtM0SC/jEZVg7VsAtv8cW3YWAMkgsW32SjfhNquBhVv/7Q8BBUIBG3tbgfGyaafLMkzjXiLvnz1XY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(19092799006)(376014)(6133799003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VUhph25LFKJQHO06dRo3UhG1C8Hzr+3eYJE97ZfT/Ja7AHwNzGbtIJ6GHEVi?=
 =?us-ascii?Q?WuyhMDYgOKN0Qu9HQEZ/gabvuPi+wPZFZLuqyhttHyCcRCBepQDuEsQT28wd?=
 =?us-ascii?Q?1FkBw12yJVDluElxiLHCwGHYIpm7b+rjgbAKTu1FYIREOELX63iNkd3MxpGq?=
 =?us-ascii?Q?h7qzayS96YTH3qh+oFyWbNrEzimWPD9yEvHewHWIa6bpPrig0NP+nqIDPsWZ?=
 =?us-ascii?Q?zGpcENU9iOQBL0hsx6P2Uq15cGRMPe7RbZfXIvvFnel49d7nSzhrCoZC+L6m?=
 =?us-ascii?Q?HyWvYlHFVgwKV26oZSIQK7Nb8XLBJ5oFRkuIC/kLhpCkY/nz5lBP9M7GFO3N?=
 =?us-ascii?Q?4PpbY2XMdpufacxerdwDR8G4a5QtcvbT8NVfPalmEGPQuHpTiT7aVuZiVI5X?=
 =?us-ascii?Q?HCBYds5+EfkImVetC5OmUqlBOp9QRaingR3CQw0SDGyUlvFdZmb2ivFRWgJ4?=
 =?us-ascii?Q?auLifWPa5l+z8F7iJyBuKiUFXTfatsRKP3vcbEoxXZEjY9o5CqP8tUo7nwg8?=
 =?us-ascii?Q?pQl+kq/B7Q3l55Gt5wNvhCoCeJoh0CRY93DfpLIIguJRUThj9oI1wTtKtaTG?=
 =?us-ascii?Q?A1BGDogO8tPrkM/cVFubpYs3sdCWdReDF3yX3XHM/a1LiUHgsgQ2NEVJaFCu?=
 =?us-ascii?Q?XdyJZk+2EbgwtjJESiYiDOE/S2sJoyZ3GZ+4r2tS5WIXfrnBlpcHmiC+7fNB?=
 =?us-ascii?Q?kupIUuli5PcFBQaAaXlLTlmFdg3vFf+gbDrtYnnsUosMS20C7rYYHg1LKgSb?=
 =?us-ascii?Q?l9wJI1hh+VAFH94hMOAOrqbZGNBBX/REnrL8qQmjbLKpRqOESWeEKgcdhbGb?=
 =?us-ascii?Q?WVfyfOtbjMKK7T/DAF8rcdjC6qWdq/XR8vswGjoPU4Z7NAD2ZBXZF02hIpln?=
 =?us-ascii?Q?tiNXwm4xHuHl0/SFRjN2/+RocJu02IaE0+lYWUu9zOj9Je2/iO1wUbt3yEq0?=
 =?us-ascii?Q?uAyp07so17ZNElHKdYbTaIrFW+SaZcz4rwjjaGiF/g+ovT6nl9ODa/EKglUP?=
 =?us-ascii?Q?mkAmjBtbVJSE5Q9kI38ZeHtjRHwmLdlxgpE7lePyUeMhoJg9R1BPc5aD1ula?=
 =?us-ascii?Q?29mOwH8ibbrkTl9ra/B5xIlp3V/Vxzj5fVza877q+43FH+G9Y79PECBKV6Ox?=
 =?us-ascii?Q?fE9SVYqdJ6LxMphhjvvkHfT2hdyR7mhtXV+2Wqtq5lOJIzHNRFHmD1UiXKgG?=
 =?us-ascii?Q?+7ZCBYYxxRIHG9gmRULOQTkEPCXyTL0J64WoY6LFv7n1YFFk7TQqKFcEGixb?=
 =?us-ascii?Q?SOSpq7Ld5eGQkFQWTdMGC4Hq5+H/1Fydf0fB3efP4tsO5PeeXHdpok9nn12F?=
 =?us-ascii?Q?l6M7nWngow6750XokQvSl/0iygLLGkxtitYlrVMamKHhpbfLJyyRWwwrnAsZ?=
 =?us-ascii?Q?/IsuKQ4g2NCCYOHA6gomzjel7Nr4jr17Z6uibYSTyMXID8WkvtwAp0h9L0xx?=
 =?us-ascii?Q?Nrj/sro/YozBOiitbq+NjVD1EOGOoEi9ImXnZy2kx6mpSZZyJivZ9h0iguYR?=
 =?us-ascii?Q?1jXcbfmLCHo7IPDzR8cSGKW4WAhjlYa98YC2DXD2olj/zH6D5q26sdkGzvy9?=
 =?us-ascii?Q?/dlukrf8oSUHo47quhJrlrBShcSRw92ltNfLhW4dAyCl0QqSU6KSWQG/iu+/?=
 =?us-ascii?Q?sGq/j6Nk7GH6WQe+jSAIf/ooIN7IczIrmvBfoeYrzXavoIe132jH5Ti/os/v?=
 =?us-ascii?Q?kyI7v2LACA//1F55fXiD5IM64Wc2sR08vDbUucPutUb9Y24r5e0IuGyQwYmV?=
 =?us-ascii?Q?zTEN9svpqj0mchThGq3uSbc7grOVn/73F4r75WKsKlUSQGgKyQ/S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e63322f-c9ac-407a-800f-08ded5b2bacf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:47:55.2479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRXgEfJ192QT2HO4oU8K6zhIQiHpNml4A++NIK72JI5vh/ntFMGMeWyZu/qD79C0sCBFputK1V6iMz5VXLPLr70Pa7Tgqx3E7XLSrg2j3yI53czD13tgZW+rL9tnF9B6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10553

From: Chancel Liu <chancel.liu@nxp.com>

IMX-AUD-IO is an add-on board which can be connected to i.MX95 19x19
EVK through a physical connector. This connector is described as a
fsl,aud-io-slot connector to expose a constrained subset of GPIO and
clock resources to the add-on board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 55 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 2e463bc7c601..f5ca8edf74af 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -43,6 +43,19 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	aud_io_slot: connector {
+		compatible = "fsl,imx95-19x19-evk-aud-io";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &i2c6_pcal6416 8 1>;
+		gpio-map-mask = <0xffff 0x0>;
+		/* Only pass through GPIO polarity flag bit 0. */
+		gpio-map-pass-thru = <0x0 0x1>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX95_CLK_SAI2>;
+		clock-map-mask = <0xff>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -94,7 +107,7 @@ flexcan2_phy: can-phy1 {
 		standby-gpios = <&i2c4_gpio_expander_21 3 GPIO_ACTIVE_LOW>;
 	};
 
-	reg_vref_1v8: regulator-1p8v {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
@@ -108,6 +121,22 @@ reg_3p3v: regulator-3p3v {
 		regulator-name = "+V3.3_SW";
 	};
 
+	aud_io_reg_3v3: regulator-aud-io-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&i2c6_pcal6416 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aud_io_reg_5v: regulator-aud-io-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-5v";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-pwr";
@@ -382,7 +411,7 @@ i2c5_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -598,6 +627,28 @@ &sai1 {
 	status = "okay";
 };
 
+aud_io_cpu: &sai2 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	clocks = <&scmi_clk IMX95_CLK_BUSNETCMIX>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI2>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-asynchronous;
+};
+
 &sai3 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.50.1

