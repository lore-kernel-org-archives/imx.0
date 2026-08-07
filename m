Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazon11020093.outbound.protection.outlook.com [52.101.152.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CDF472F9A
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.152.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109589; cv=fail; b=ExRCahupyGea5lvZeB834Y/ECj6WdwDeFJ/p0qCzMJc/5w6ae6++HIcS/H5bfa+k1lD40P2i0BSa2tX26RTELvmUoJ9s1xfHvr7TOoWUviFfiUWKeyEtV8TKsu7pVjH6o2CsopxR66i/7zo1r1vSYsYhxlriT2i1lcZqqGz3J5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109589; c=relaxed/simple;
	bh=2fzujzGbvynxi6VxstStwn3FF3/4/sjU14+JeTfUhL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RCevbIpC0vZiQ7VBIAzBR9cab4TLjNMqysGbgwnHbroEUfyyPYrzSaAe//vsiyA19Z2h5bAxw0i6TmUGNpSGjrmruPTm/mSFv6eLcdumthfPf3AhqLEtl9vUTlhn9Dtd7dGW7LNH4VzqIIi8DTYaP9+FiirLeJzWr+oIjhD7c5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=52.101.152.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW+H3GSRo1IdqGW+NSLWQb9urC8dJ56A+UbdtAwnw2Jusm/4rrN2PzGOaYliEsEuMqfxqtZkwQFdHKtr8CcB4fOMxorktSX6aNDI5Akdwh4SEfDhVD1/kWCUZN5n82gy8VIkhKktIxg0WmUxKau3RelknABOUetQePYaG71cY3HlqpxKIwkOLGp7LVEhd1C84htimsjHzd/Ovm7rkJ/0OffEAAEOomxRkGJ+G+qz7mdJA9EfxJRyE47xFnUIZY/NJ0iHYVwdrYCy0x/Y9AFN3oOb/X8hkMOdAdbKHFvT0XX6wO7y1bshYvgD2kLspH6ttLwx7wn4huDA4kKND2vVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4xz8KrW2i4Tcj8JT0l8kltcTGvUGQ1PQuarbGz/1x8=;
 b=Kfoywp0N2paqJyUTKQkOVGaVjdupf4g9eZ+wyvTAAv/HvFtNfBxiMR6SYc7wtaG3M+8J1DNYRdM3hXor1otckl0IpTLXkzRxMsH8LW+UrCuu4MlJHGYwqj8uSLwLPhSxhyeizpx46uVXLhq9OgIH3MOYuuINe1Jq7yv+xRWy/7jbwouRFQVgul3x2AqpysDPfNx0l8qO7y9kzX3HiouFhfHqdY9v3rVyAOrx9EPk9NgSpdTDJNuvNoiLoJanAEdr2c/4NSIj/GFmJjZ6ryoZcpo36O4p0YXoTOTjq+fk4O0RZGpKlmb0RFg9cKgeKeuzsBhzHAyqCUDNGg9GBVWlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY7P282MB3978.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 13:33:01 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:33:01 +0000
Date: Fri, 7 Aug 2026 13:32:44 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645 analog
 audio
Message-ID: <54ab90ba6c05b38c6561e0ea732d487da9443f1e.1786107926.git.rudi@heitbaum.com>
References: <cover.1786107925.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786107925.git.rudi@heitbaum.com>
X-ClientProxiedBy: MEWPR01CA0054.ausprd01.prod.outlook.com
 (2603:10c6:220:1df::18) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY7P282MB3978:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb78f01-4432-4956-059c-08def4886709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tYZsENBAPZiCZ+9yisx0FkUBk58oMfPqMeMDHxIJpCHMKut7gE/kjkrt8s33ieVxRM5qYAy4vC7xlFYePrNRmKruMmVUyoM0Qak05YYCiSTCE8NbrYWOSDEDCL3eV1vafgJTcDmgdf7Fcx6xE4s/k1ejLzrYAOkIn8pBsbg3+cpWqg2IabTGDCImyj1PVeMM/hE7UbmRSARl+l6OGYNHklu5UQabU81FQ+QneATg50D/0lXUAcx2t5kBmJmgNUT6ilO0n4rZQIr/O8VhI3RgBWFfVzpMyh7lir7Qy6ZAWE86Bc8CVLHAdpAuHdXoWn9aYfiTDDRJdrFx78tbT/9FVzzGzOWS1URkR6DlzAhRauLJoKfUyd9mrjSP3LPAKynAIXo2BZWrcw6+C/66OcsxQH3Z977/vkmNBa9A5ZB1u71dseuKL5zTxWj1l5+LZvCFLbhCzfgeBVgvtXowfFK3HRGPeqyM15kaIlR+0b1DSLaKdemgbqxdOJ3UAGSQOLs41rVKsyUCsV5p/Fx/LKFQu6T0x6Wh6b4laH/9dXJjVmfsQwiUFpSjoqxGrluxOq51otXykAbXNt4cbW4qj8RN3rYlcMlUpWpjPGdUVuwwYC0zqGTE6lQTeY6qiYwNep6TGOPSwo+0dqLj/JEuxvlDqcuvpkl+btOgmnhjpVZKZh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nsMVIVj/nHk7zZt+bRtLo4VldJhWEFbAcZaGZwjXkaRBpmIZidGhQFbhKtVH?=
 =?us-ascii?Q?bh12eQlB1YvzqZRWC3+kjm/iKf7Ocb+eAq8snnzQCfUOzB69O/dSuOCqKYuH?=
 =?us-ascii?Q?NhV8drSDEv+YIN7ycbe+UGk8H7ZxdYn2hV7zndopJhnNm8ncOksPa+kwDWEv?=
 =?us-ascii?Q?Nce8Wa12s2lz16iYsdshPph7S+sYandjIM2XyPhoBnUQ0Xk627/y33wtOL88?=
 =?us-ascii?Q?YlARU0Q0okjMFUAgwiIVm8fnXDh2R8d3MADJbjriAHQYLlw3nR2ThlSriR4d?=
 =?us-ascii?Q?Gq36OPBNupadvOWyOxVZ9hoItXodZwh7jTrxQvOpdxmNzWSQeEcV3Lij2R7C?=
 =?us-ascii?Q?ANC06yIxeVnOkGVGldxxHuH3bybVFoTG7hXjB2KQNLSAAvLrz54pXSaw+Swh?=
 =?us-ascii?Q?ODZTs2lnY+dpQaUseIf4JvBCwRbH5VnZcXU1LVBrcgl7pOZeMeZJEr4dwJ/K?=
 =?us-ascii?Q?GUQQ4gK7bMa3J3STWUunH3XxQhKi1ngSkAUcOae6VldDB4DQTekQX4MBIRBE?=
 =?us-ascii?Q?Isr1aVvH6p/E6NPaBfTpyOTzcT7oa3crUXw6a49ui4rL/ls9QSEA3BFZNV+U?=
 =?us-ascii?Q?rYCPbspKUZPDPMRoFibXnB1zBJWXpRa6P/CJHi1gYgAZZocqUuT0nsi1A+oo?=
 =?us-ascii?Q?hHfwgFbcnmAx8r/7oM/4glwlWmMcl53x1jr7kaLSQCnSnzZZoz1yR0/bc/Q3?=
 =?us-ascii?Q?0njxNwxuf15m1d1TOHIadavtPBXUDaKUVBVfPs8lqfMOYGgM6VxKoqywfU9D?=
 =?us-ascii?Q?S/M7PzwSpiE3mHiSv+8jU6dEYBuD18M9F4HTp+vgBm+qZRB3gm6jGwIfi6Cu?=
 =?us-ascii?Q?6Gv0fGLvVAOGNP3OcuKJad7TNxJ0ywQcn49kkC67UzBUX42QEmEsx75r3f0q?=
 =?us-ascii?Q?BojcLWNT29lwQhzxKmzMoJPriWbHTvdyjFDwdsNh76WO06wtgYIn6GdeP7jv?=
 =?us-ascii?Q?Q/1oC8QUfsjCrTUB/NbjvtMOKqj3yETAmbapjASVgxVtZacCscdvlYoha85R?=
 =?us-ascii?Q?6yOS3LVMpoJuiIGqfMuDlC1F5aiOqD3lkm3wl6FOBFFqG2Z4t0PQtnZh5HO+?=
 =?us-ascii?Q?k+pW1ocuUSDYBCoTjhpUDsFcmvnsumN36ln4KPll5LkfDJsnrCJsFu1mhP36?=
 =?us-ascii?Q?+1/0+GN1+0U403rglioHJyCU8hWu09jq6qR0xsZHxtxb385Tz+AlBGm/qHxE?=
 =?us-ascii?Q?cSP2sYi4lnpHrfalHKzeitsa8YHLzpqP8/nD1qeEz8DzeQXo7yW2JW6Wz10o?=
 =?us-ascii?Q?b4f8aBys8Fic3rlJg5XTZGJGecfCdgb6HtcUYIeSUI49Hlth/wpaGmCYrI/m?=
 =?us-ascii?Q?6Opqg+jyhaP5G3HJEDTIegLRPk9CrZU4Tjh/6VKhJ0gVCocCiVEnyhibe+lB?=
 =?us-ascii?Q?DKxzMCSJz5tz6YvMPLJILCIKC4Kh3/FW10JL8C8J8RHqtGkckwvZFpVVku0B?=
 =?us-ascii?Q?UjWjkshu+WMyw7RKaW3NDW93EaoyqM+WAzVzVg5IIUW7aBilAc3M0actPaVL?=
 =?us-ascii?Q?/de0zbGZtHNt/aa2ioPoyX6SyDVaarDjVeUn3Vpba+XVyQwgKpylCLOX7Jk7?=
 =?us-ascii?Q?281mBPwduGRNcheQgrqmOJOVZbR/YDa/Pc+vdglNXxH8jqqKWyNkJWChKnHw?=
 =?us-ascii?Q?cpoEoeRpfyJAA4EBYJXreKrN9QZdBb0E7qnysgK3dWHPJ97/NHS4OKYKut/q?=
 =?us-ascii?Q?PuOHiAD4yC7mEplWbQ9VvEjopXck9c451jveFD6w2Yxf/XnP?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb78f01-4432-4956-059c-08def4886709
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 13:33:01.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2EQ1spcP3FmVipEXfrLNQkVwC2b0cErU6Y2FQoyZBAvZES/zx5pb69UVuJElaNxm5BS3HNeV+DVaTypGqmsGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3978

The board has an rt5645 on i2c3 driving the 3.5 mm headphone jack, its
microphone and two on-board DMICs, fed by sai2.

The vendor kernel drives this codec from a machine driver of its own,
"google,edgetpu-audio-card", so its devicetree carries no widgets or
routing and the graph here is rebuilt for simple-audio-card. micbias1 is a
supply widget, and a supply is the source of a route rather than its sink -
as rt5645's own { "IN1P", NULL, "LDO2" } has it - so the sink/source pair
is "Headphone Mic", "micbias1".

GPIO5_IO4 carries headphone detect. The pad has to be muxed away from its
reset function, or both hp-detect-gpios and the codec interrupt point at a
pad that is still SPDIF_RX. Leaving realtek,jd-mode unset selects the mode
in which the driver takes jack state from hp-detect-gpios.

The slot width is pinned at 32 bits. With none set fsl_sai_hw_params()
takes it from the sample width, so a 24 bit open asks for a bit clock of
48000 * 2 * 24 = 2.304 MHz; fsl_sai_set_bclk() only accepts even dividers
and 24.576 MHz / 2.304 MHz is 10.67, so hw_params returns -EINVAL. 32 bit
slots ask for 3.072 MHz, a ratio of 8, and still carry 16 bit at the same
clock: rt5645_hw_params() takes the data length from params_width() and
only writes a BCLK-to-frame ratio for AIF2, so on AIF1 the codec ignores
the padding bits.

Declare both audio PLL families. fsl_sai only moves its mclk between the
8 kHz and 11.025 kHz families if the node names them as pll8k and pll11k,
which fsl_asoc_reparent_pll_clocks() then selects between by requested
rate. Without them the mclk is stuck at whatever assigned-clock-rates set
while 44100 is still on the advertised rate list, so ALSA is offered a rate
the clock cannot produce, does not resample, and hw_params fails:
44100 * 2 * 32 = 2.8224 MHz, and 24.576 MHz divided by that is 8.707.

The cpu dai also needs system-clock-direction-out. Without it
simple_util_parse_clk() leaves clk_direction at 0, which is
SND_SOC_CLOCK_IN, and fsl_sai_set_dai_sysclk() opens with
"if (dir == SND_SOC_CLOCK_IN) return 0". So set_sysclk returns without
setting the mclk rate and without ever reaching the reparent, silently and
at every rate.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 2d134eefb765..b819e644fa54 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -46,6 +46,41 @@ fan: gpio-fan {
 		pinctrl-0 = <&pinctrl_gpio_fan>;
 		status = "okay";
 	};
+
+	sound-analog {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "Coral Analog";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sound_analog_cpu>;
+		simple-audio-card,frame-master = <&sound_analog_cpu>;
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,widgets = "Headphone", "Headphone Jack",
+					    "Microphone", "Headphone Mic",
+					    "Microphone", "Internal Mic";
+
+		simple-audio-card,routing = "Headphone Jack", "HPOL",
+					    "Headphone Jack", "HPOR",
+					    "Headphone Mic", "micbias1",
+					    "DMIC L1", "Internal Mic",
+					    "DMIC R1", "Internal Mic";
+
+		/*
+		 * 32 bit slots regardless of the sample width. sai2 divides its
+		 * 24.576 MHz root by an even integer only, so a 24 bit frame at
+		 * 48 kHz would ask for 2.304 MHz, a ratio of 10.67.
+		 */
+		sound_analog_cpu: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+			system-clock-direction-out;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&rt5645>;
+		};
+	};
 };
 
 &A53_0 {
@@ -272,6 +307,18 @@ &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
+
+	rt5645: audio-codec@1a {
+		compatible = "realtek,rt5645";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp_det>;
+		#sound-dai-cells = <0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
+		hp-detect-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		realtek,dmic1-data-pin = <2>;
+	};
 };
 
 &fec1 {
@@ -295,6 +342,27 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	/*
+	 * pll8k and pll11k let fsl_sai move the mclk between the two
+	 * audio PLL families, so 44.1 kHz rates work as well as 48 kHz.
+	 */
+	clocks = <&clk IMX8MQ_CLK_SAI2_IPG>,
+		 <&clk IMX8MQ_CLK_SAI2_ROOT>,
+		 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>,
+		 <&clk IMX8MQ_AUDIO_PLL1_OUT>,
+		 <&clk IMX8MQ_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk1", "mclk2", "mclk3",
+		      "pll8k", "pll11k";
+	assigned-clocks = <&clk IMX8MQ_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MQ_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -383,6 +451,12 @@ MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x05
 		>;
 	};
 
+	pinctrl_hp_det: hpdetgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_SPDIF_RX_GPIO5_IO4			0xd6
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
@@ -410,6 +484,16 @@ MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x41
 		>;
 	};
 
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_SAI2_MCLK_SAI2_MCLK		0xd6
+			MX8MQ_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC		0xd6
+			MX8MQ_IOMUXC_SAI2_TXC_SAI2_TX_BCLK		0xd6
+			MX8MQ_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0		0xd6
+			MX8MQ_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0		0xd6
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
-- 
2.53.0

