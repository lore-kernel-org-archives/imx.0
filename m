Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3B830C606
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538121; cv=fail; b=ZY4UZOicvnH8zkVu4WZfUA/4ImYjmyYU6olF9Z/Bm0WguG4LzAU2mQmE1eA/oGavQd8xBH8666oNLy2wL+XNJacc30bCtc+XP1MGoE1JISzG/T1QgnJnLUgxsjJnNVC+962Foctfk+/8lKV5PrAlj0AJ3QIMeaXl7h6CgNr2JUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538121; c=relaxed/simple;
	bh=FalH9QS9XMAbo+fpAeP47wlleUvQFUKs9xTETT9SnlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6YqQoQkcnzXZf5ng3bsivdfRIiWIRoHk7McxKokYfnQ3dkHF1NKtlLk7mrvSfNGNqxMgyogAa0vupjGTxfoVr/QEUUZCq3gDrCe0wZKqzfd0A9/vVHDaT7rdLKdfjqcCYp0mSgWE0jiTPz0AVgPWzsNYr56QGoLkgxbA/NS+WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bwBErfn4; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bwBErfn4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk9ypsaEwif5vFPtoNolay+7gqv7Vk8LkVnFrqlvUhc4tCF6P2rWcbKvXMXL+OiGIHYNg2dJAhwPhOIOL33Q/49SK4YqezwnIkOVuFtkyY+KNVq9F3hCliREyIgyYgQmZ7Hf5Anvva1iF522AMGAzI061n2s96rbyAKNVEQzkSPvrEwWQHtzWdxSmwlg0z7C6BAy5P7KjWXAolfMOMudEv1rbI5vZhr2+9guOjyK8rdNcag4K6n6F0JLnO+1sbul0AmRosRcHRWJwHDKhtUvYV3gxqsr8PfbqrK3BQo+t1wUDGVPKEMRgnTxCZoc2Vr0y5ueY3bagS7yY0ETJg+iyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixrj6uJ1A5nJoLuTPkDgA5vfVTQsp7MsZtvepvrAZDU=;
 b=E0Oaabann76vdqMVf1RCq2K36pqgtLSSqJkWYr3JniwWHI11I1ljvE11/cGqQfHoV6x8pMZefs9DZLs1eiGIYpTDXdQIMz/4z7Rs84gcsjhtscjzkdrnb2HSlhNZLkZ2FstY4EhQS2YSUCdxh7LzM4+OqH0nQWMkUl4qlXJUobYbd+r2Rv0C1VGE8Fkc2FnALVB/8tPZreWNOWWoD+olhJyksRErEUK1Qnodxb+AYYm3tUb0GrEXVKi7/5zeYowhw9MGdi3sGJn+ZiYBNWmGb+hstfoI8LZttbIK3s+cv2CmlqtHElCwlh1WNrmr51dlPQDf4cvQZOE0F4hBsIIjzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixrj6uJ1A5nJoLuTPkDgA5vfVTQsp7MsZtvepvrAZDU=;
 b=bwBErfn4FgnxvdW72QIxLQdC6sV7r69/PO8+GoqqgOlurTrKXkwfbzwIoYZ98Sx+KgXZalKhUTWNhrY4aWR85x/dRwIAQHl28GmqsUfKG6X04mVvvzvFvfO+4kgRItNan1BJuMPMvsj2TAjDtPsecLYkzvXxlCNVNym2IZ4Iwm9Wg7XhUUKwQpDj1zAgU8GmGHBjrrWnYpSL9kKXM8Pxq1rHYCpf0c7tpqQfCwhacV5qLBGcsXoJ7W2UccIqrUhuPPk4mVBU+TVhZqFmghNqxGRrenkE5H9c0njU1+VWkoi+4kgFKzpzbNJmXvciFeo3tZF15QwOi0Z6W74ixIuS+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:57 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:57 +0000
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
Subject: [PATCH v3 13/17] arm64: dts: imx95-15x15-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Mon, 24 Aug 2026 11:20:16 +0900
Message-ID: <20260824022020.2812810-14-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b37dd5f-c323-46f3-8100-08df018678af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1zAy5tAdrppV87CA1aOhscOShdlYoNUeT4XpWK9ZF0/BDx0VUmKfcFQLZTttHVp8Ovsv9Y9cpiTW7cqqOjRs+5n7veq+kZuNVMIaHhIcVZxKvfcpv5bBorOJ38Tgf7VfPm+wClfXo7L6w+5agq25JAAUBk/3nvRApI1YWB2uBMKROfVjS9Z07t0Blvwuq/PBiW43HhVuCVhleeqO7SsHCuGoKmZkVjwayb+EzXuMNnnoKOIWxBbuRPS+vwEYpPOj9t04WZwbfxgooUYnC+r8nGu1HN00c27G02yLnmxYabCi6RYAqkxqomU6Wz/26K4kgqQne44EWu3IqlK7Z3WAda03FP2YCCAqjqgZL2zToi+0L8rLuewQtS6IZfIqprxGsbKJB3lFCjcTrvK3hpQfTwQb7EEeBbhtC8gQmMUPGRhj1gEd1p5niPZiwsMiJn+UsbvDO2fOaIrdGRVQHuOcXfEA4KpR8sE/RtxI3gwuOQARhDu1RH0mKJKUcnd/ypSe3lXjkElWUKKpmN9emphHOg4vG3O4BiUmLmpNxtoGpQRB+tEWiUOCvaMBOcdhQiM/8s7Dtx5Xp5fEUDa91MQkQDzfnCOTWewXJeQ3h1u5zZd7rkC0kt4Kdqpdq4nmattD9sjwPzQqx/PqzWCgh4xByMFS/mX//AaonpRzzbamNgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s4jgT/4W90sXPBbSOP6cUdMwMc/h75FoH9eiAj3VWN2XWWluYuLYq9h1+s6C?=
 =?us-ascii?Q?8tGsjZGbXoRzfb5OjxlbfL6jUjxtjmIThXxbTrBKthLibFTbJCJcab8tiV17?=
 =?us-ascii?Q?L06kVpRCIp1MwbM23JK8s7phdjjcI7MHSOmkFUkhBp5r/7sMqWOwSPHsBaZm?=
 =?us-ascii?Q?XFT1TlOm7zglxaNMXi4FqgXvBjQVWagRAgikDdjJZ6WxG3LuQ7ypjIth9sOd?=
 =?us-ascii?Q?YT+1svoTo7aWEpi1jj1XT1PDR5EiZsZMR1L/oPEuzOmjJCOptEIDl+Xw1vIV?=
 =?us-ascii?Q?z1A25X2vFIXugleuYSXjCH7W4bWnWV6yvyKn6If/dbDmXCN7niZW2FXbnOpf?=
 =?us-ascii?Q?0En2U8dolfs6wJWEspZei8ShnvJ7KNXV7bDxCZFV9btpm2aVcUFonvc9tXHB?=
 =?us-ascii?Q?Y3MrHBIQF9P3wCuYCJG5XtaIWExMfmP4KdioDy0S1w5wlpyP7k2kCLowrxdf?=
 =?us-ascii?Q?9W9SI3bGDE4YRM1PmW34x8iWVXQeL5ivZV7aylSBcWpXdjhR0uCtqvQJyS5X?=
 =?us-ascii?Q?QUW6C+G8amt5u62DkpAEhrXZFpO5jVuDlYKCXfXh1nKCUo4SgbRbNJ8Yo5Nw?=
 =?us-ascii?Q?44U6v1DktyJkhYcI4s2Fr8J8GpapWdQADACi/RkuVQ7cOWQGD2qI1FllrUum?=
 =?us-ascii?Q?p/ig/BUSJ/o0/DYHM1yeQ4mBqA7HHYxzRA/VNwZJyXvyxUXiSC0kgRlhxfeL?=
 =?us-ascii?Q?Qrkej3aPKOrVeq3ZtQIPrSydpHMyQr6uRt24/WdaTeZqsONc0a+WJXCsoeD+?=
 =?us-ascii?Q?eR4SDJqFc8Srlt1DhoIQbJKI9iQ1LZvAzQ94UB2SSs0d/gDPwR50oEPfRUTW?=
 =?us-ascii?Q?RCtSTLjhdTVPr1T3wCPqecbjwtsfXyzCD8IIpMDRIK1e2BHderA1c8lJR9jh?=
 =?us-ascii?Q?ulzX7rcN8gHlYdWJKIKpdODRmzjai57jIzjQb/eVN1kvz2C7H98xbEc6mw4i?=
 =?us-ascii?Q?NcYT+GqTezZc/CQm0lMH/i+RiUhS7IEZzETXWBrdmAW5kAAyHT4j20hT1UTW?=
 =?us-ascii?Q?6X3Qdqdp3CAdHdn437+b+8MtQvjrYe/qQzvai1KL714A59LLJIjPb9nyX3eW?=
 =?us-ascii?Q?RLec4qZsjrXaWQ9N1PyElmlcX272hxaTs4VVypnwkkfpGKc0VDr/1IT71KNl?=
 =?us-ascii?Q?FuFb5Y+DNquuRFzgb7K0v6b/T6bM1zR+qwcp0NlhO6MW1SY5ds9ydu9WjTkX?=
 =?us-ascii?Q?+7SGsYtM2Pup+QeLpcD+CJMw0xkRwod8s8idACaMp1C7QnODL9cU++k8fJxs?=
 =?us-ascii?Q?idEMucg4Z8J9+zYiO+buv416YW/gls/7D+6SZkKCZ8lhWsnfkyEhBk6vuA7U?=
 =?us-ascii?Q?elIsHn0ojwz634Y8WMqMtsq9iJMbpY5MzDnzJDESnD0vgc15ohxgNZJp4qI5?=
 =?us-ascii?Q?rKYDAm+b+V3uMvLjAD+xAib1hFbqf49dA6kXgauwHhx58Vr2RUUKOE0AsKfg?=
 =?us-ascii?Q?mn1VyxkH5NkHFf7vQ8YG28CVkgkUn0eYomvusXJpeidYhumWPqBuZOoYPBcq?=
 =?us-ascii?Q?3ISxg2IIXuEVROrMEbBoELKH1ehV5k907uc+ZNQ2HQOBYwCMLWYArOkgvb9U?=
 =?us-ascii?Q?EW9bbu8CmEvutt7h3tDnAP4YgKD0AR+7z/fMP4QObLabgGaLEvIlWuW1bWRi?=
 =?us-ascii?Q?nHt3g6W8fJP17dffZ+DmhRX8ksgQ8dO2zZ6Ir8QsjKb37Lw1ziwtzAcBbnKx?=
 =?us-ascii?Q?Z2C6I+ItblsWvbi+HeyMQuBcgPjRQMlXAm7QO7loJUwgEEPMjeiOweUF30CB?=
 =?us-ascii?Q?31a+iIK1kUbccM3EQN5k8NhSxQberDxSzmpnN2T6k4+UYTDXbmzo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b37dd5f-c323-46f3-8100-08df018678af
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:57.3138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+L0Y+bboiW4CTbLavtdS+ulpksbut40PLfIuPKIyFACSfJhe52NqhexCfiIY6QgWw+7SrvtXAnNf3bHTYBn+14m6YuCa3ytjwaTTnjEqLI1aZo1PodlQE5jjXtMStVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source. Also
describe the MQS output amplifier using the simple-audio-amplifier.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index aaa2608793bf..1ca6850a7365 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -48,6 +48,12 @@ aliases {
 		serial4 = &lpuart5;
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
@@ -239,7 +245,7 @@ vpu_boot: vpu-boot@a0000000 {
 		};
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-inversion;
 		simple-audio-card,bitclock-master = <&btcpu>;
@@ -498,7 +504,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
@@ -512,6 +518,11 @@ &micfil {
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
@@ -592,6 +603,11 @@ &pcie0_port0 {
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
@@ -670,6 +686,13 @@ IMX95_PAD_GPIO_IO27__CAN2_RX				0x39e
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

