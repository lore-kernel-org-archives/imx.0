Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021112.outbound.protection.outlook.com [40.107.39.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43603C417E
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786184087; cv=fail; b=Zm2sbdufVAgPnNtX44IHSXB1O+7XUMM6f7SDDRN5oIX9Rb8PAEZQGHYKK/qo+wzE1SYG1nB3l1Hqh3b87Kj/Cnl4XN9Pc15J4BFW8Wk5/gg9e3dlorsxMwWi4JJNVTHpGc8YiZ5VuAd8uiqBGuIuO1/46fJJRBu9fkkgP+imF00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786184087; c=relaxed/simple;
	bh=/nrplkqSKvDU5zAe9nhDSXUEZ+Jb/cPvVRBzm9FJMUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WNpuBUePmfzpEPZrIkjtwBBLhwdT8lLdpKvfbsxaQGGbiQaxx+YXODrCrqXupgtQ2+eGnTp5Z3RL5cbFUszIGZgE2B+hfAXnqTp+SUiHnIAS3IUP3vzUVIzfksoGth3FPIgllXxfX1GCcoZCFpl6T0HEGP8SRSdcisqgAKLxqxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=rCQFZe/b; arc=fail smtp.client-ip=40.107.39.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="rCQFZe/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/+wBzk9A0lmpNsYvHw56B9jr8OAQdFhTp5ntQOoAqM3jpiCHv3CIT3pyq/XKYFEcc5T0hi8Cicb9mpsvgKN0NNG9HaJZln5HuT+E17hhTD/NtfJ8CpqLClfiGlVDFaA9+zBFMidYVt1nd/YuRGmnKshRVIJLuUQsaOaGSYvEajXda6wdDZEEx4A4PKLt3CcugYwt0hR63U6ZILwuf8LF2B6Ro+/IbuRznCeLnlGIaWW5OhYAsN8yu59OfvVOQK/ghByik5lsvUS99lghR+pE2ATht8gWb+l6i2z41xf7VxDOd5uTtEvswq+Jyoqq5H9mmSwvpHvKbjmJAC37fc8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es+8Kv+YIotAohjSsiZ85UgPuPmS3W1il9OTYJoC8ss=;
 b=gvGnqfDh9v1MbROfUZvJrEPYee0uBtuU6Q0Yg/OIik229LL1iCIN/lj1VJwCuKkmXwX3RRZuV2Aaqy8qCvl7FvOyn5AmEHpl3x6nWhP8i677q+h5gsTMGQp3G/bdSOltJPss47Yx7kDYIw96/7X0YdDxnB10pBbWMpxl62Upn9kwI3thsTUzQo1o4f/oRqYeVQDPcG+KVN+sNBgTHpTCoP/ulY8dk1j5NzvwE3kaPpNMbw/wclg/OVrvNlKtvXl8dFb+qsL/M1+J6JYt6lvpcY+DqHOwZzUsX+VAsFNYLPRDaHrBQd5k5j/xdBNzeol467nNCAoOuNL1TtWFArAIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es+8Kv+YIotAohjSsiZ85UgPuPmS3W1il9OTYJoC8ss=;
 b=rCQFZe/beVeimMYfkhY6eyukxvOz215WJp6DhRiDmi4soczxB6kJofm7IEgdtROXZP+0Y1zILmy1PmbHpHQOEecQD8Jb/WwrwenQ/U5VoVH5jb3niTiYF2FETAfv7UNmcns5xm0PmnQ6Z/Whw5zcmKju55knwEEdTT2wHWKvT688Ao7cXLFuUrq8I2RwnSG3HZ+kTdgd8bS/xJhbxXV27bEueUkBLR0b3nAQ7VqFfgllzwlqLtkIQcySsqqaWOpm531VUd3jHzD9WKK06rDX3BgjXQ2NKrPqtYeiy5FO5QiTTHsCm1pySeslDVvsDKrz30BIfjBEdcJorgMf2x7VcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYBP282MB4053.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 10:14:41 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 10:14:41 +0000
Date: Sat, 8 Aug 2026 10:14:27 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH v2 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645 analog
 audio
Message-ID: <7b0c26c6741c64291e03f668ce961c47cbcb0772.1786177290.git.rudi@heitbaum.com>
References: <cover.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786177290.git.rudi@heitbaum.com>
X-ClientProxiedBy: ME3PR01CA0045.ausprd01.prod.outlook.com
 (2603:10c6:220:f7::13) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYBP282MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b494f3-0ef0-4ac1-b814-08def535dc4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	UwEkAwSDu/2KoMQxduqaagGvlg8kLkwnsMCf6vHfgMK+1N76S8F88QN7s134W9a+D/8MYktVepSatdGdxAbsEOLBkhDQnDZBMPBO62sIVqgJOVXzWmj5CjZcGb5vziz9+FqKg3FzI1C74qZf9wqlrvaA1pxbMSEOKSTcJGYnsRR2SuPC1/P6tYr8kilWDdMiUENAmvoQOezRfM2Ve/ycFMd3NcfuhNt8JPSTWdMtX5BB73KMlWITxurRve1Hea9RWOxp46p0bSj/WVyg7HXoZGhnowStJbx2HwJH4a2kMM2S+yBPMqx4DuOx9oYdcTmbuPYjeSsnexQTf9jmZReBbl1FFyz7gbFKJdrVhD5g9G34bKi0YhIBndFSNjTqjIRpYZn1pDkftvs1AV0idaFFUkhsixKEOAjgODTdbRJlLNryHvvC5M5UGP9RGNY+aWe3C8oCUc6/fxBOTbiaEjvdK+yAlt96aG9Nq6GJ9/j5L3eHMSyFljwH4ncFOneob3EJqm24cDEmGan18JMAXDhcpfmrZmAuc9Rhq369x7AkeaYM1ZHNbCKh8DRO3IDSIroUIQa42vfpP0hhq1MRh1zTPwS1oft22GrMWud2bch0E0Ndfu+4idccFuh8E080eM1XzT0JcquXKsODkh9VLFm+5Sh9jHRsQopUThcqn9Ig7zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xZXa67TbxDlE/w643FAtEXnWpiXNmMaJRDthUgf/6taC/X1XI/APGEZLbwsG?=
 =?us-ascii?Q?1nYGsOihf4AbEJRsOm7HbBiWCCK3liP8WwWnkVKOUJJXeQjpgAGVSB3Bxlio?=
 =?us-ascii?Q?k2rKTY9bDveGyXIqUkrKmV2LFbvy0b+XvLltDGoWJGrrvEZgO4W5x6KaWxvY?=
 =?us-ascii?Q?CF/KJYsqheWEjXY84Bxck+5iiq1xlkf6M0dVqonzdRvE9g+1AvTBMDFmCrKh?=
 =?us-ascii?Q?LUyjcSoenwwK/NeT32f71M7n3AqmB9un20jPUY/PNFPVkAusTmxbgvgBxixK?=
 =?us-ascii?Q?U52KRhuwknwSsiELpCN1EszrkAqyq2J/tPKWCKcUZmUqMg/Wvg3T/DtjpkV5?=
 =?us-ascii?Q?wcOBOaXoSx46ws1YYmfSu7fF94qkm2WQtui6qLJWT4wL9Zb7sCb+PLRHUzqK?=
 =?us-ascii?Q?zN7mV1gaLxEAOxrvXBXXRJTuAQ+Iqqx0Rjr8AB5qgCvMXG5MNAslsOB/n/X8?=
 =?us-ascii?Q?3TyBrRKzAjEJph3sA1hemyfIqNdhl9k1DVXoEyChKJIW3a+fN9mnKRpR6RWr?=
 =?us-ascii?Q?/3EHJtQ4swLQeu8ylh1lTTbIRFYEnOxwVpeTtIe+0G9ytk3ekEU+o0+GwQpC?=
 =?us-ascii?Q?dSfEwr0QOVwhnhQnjA3xnyPXRPSq/quzsS/FupuT/A1SA9dIQvPIHSGmMknw?=
 =?us-ascii?Q?jO2Uxd8VCZT9rjwVnPg1mBXS7afnTpozvjU6ujEDlF1AXJraSzNysORZSNwv?=
 =?us-ascii?Q?gDnmKI9zl2MtFVaqHO5vgI6eltCWfb5hcijF7PbD/gBqVt36gEcesV39YBen?=
 =?us-ascii?Q?p2h7JvOSRLcK+R4Lu6dhse4bs13w9UMn3aMFErlFPg+EnHBfdQmaclet+Usp?=
 =?us-ascii?Q?qv2IVqCtKB1j1UMCZt4nn1Dm3dOV7sgVPuPQEV7tu0mmCpU9mUQI4NI2pNhx?=
 =?us-ascii?Q?YRnZw2u12rgJ98zWO8KxWzOe22Dh48pGBvc8DiB8SaLe1U53lDh9JTqOr9wT?=
 =?us-ascii?Q?Eo9FzahVimT7g2x/UU1rtCOVGbbjWiUY9pbbyCIyI3Bsai0UuzCq7LDB1tHw?=
 =?us-ascii?Q?j76OLkGDooIMjhPYLEmeUFvsQ5DGU7ZbUbZ5ipUkfbgQOLtorDzoH5a3g4D3?=
 =?us-ascii?Q?x3Oj4e5u1k0vSus/+500xeVSjTVXNUQ916/lM8Hx2OoAGS9FBEGZOG3GbqEP?=
 =?us-ascii?Q?zKPH/rvQrCg+Wq/cVZTPIu8BLVU6+YzMXNRxeSAiliti47FPPMddlKnEctfF?=
 =?us-ascii?Q?50pBUWPozlG6IVc4CbhQm+pgtDXQGaAnwf3Id9xTOVWX9EbUZnxqbsbM9oxG?=
 =?us-ascii?Q?URyElviZ8Ry2Hk/+cUd9eyvkWbbgLtM2Su+rq+vhSUXPr9CSfs6Cb6EyR6Yv?=
 =?us-ascii?Q?CKU7Bn9j1eG8Nkpc/e9mCWu6eDg1APNn/BQm+VtvGLf+IOC9iBH35lTapoa3?=
 =?us-ascii?Q?LM0FxY+TdC+KJR2KwDuI9FXw7AVT7uY5aCkWARJjqbOvf07op6mdpn/669Yl?=
 =?us-ascii?Q?CagKlXwRue8PxX6HcSW2dyNnRfcEvqESg/ofXrQn3ZaWAqMMiumDuAYozD7n?=
 =?us-ascii?Q?/5L/KgzLSEGzGAQMXZ41FnpfLUIjPisjvNUom0NhPj5sH/g9J9hNxeVLjHWD?=
 =?us-ascii?Q?bxXK9eGAuhWQ8p5TJ4ZbqHSeikqOZsFKAT2y6dXKc5NJQ+r7lwKwPfIxoN3d?=
 =?us-ascii?Q?qMEPle2mgTCbHd6WBxALL104RWVSJd2xuHAEdLiAWAX+wusq4uQa0a6VCs0/?=
 =?us-ascii?Q?nGjdeFgLlXMiXyH3bsvttluVdfHxb2y4m8jZLnop7JhORnAs0y7Medtw2AQ7?=
 =?us-ascii?Q?L6e7yu7f5A=3D=3D?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b494f3-0ef0-4ac1-b814-08def535dc4f
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 10:14:41.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXBapAyC48fc2vzQ/8PvvCB85X1Xf6faZlnBUoQa6alIn+V6FG91uwR+8TZZLwuxaMQQcybi5LmiAJDXf2PEWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4053

The board has an rt5645 on i2c3 driving the 3.5 mm headphone jack, its
microphone and two on-board DMICs, fed by sai2. The vendor kernel drives it
from a machine driver of its own, so its devicetree carries no widgets or
routing and the graph is rebuilt here for simple-audio-card. micbias1 is a
supply, so it is the source of its route rather than the sink.

GPIO5_IO4 carries headphone detect and has to be muxed away from its reset
function, or both hp-detect-gpios and the codec interrupt point at a pad
that is still SPDIF_RX. Leaving realtek,jd-mode unset selects the mode in
which the driver takes jack state from hp-detect-gpios.

Pin the slot width at 32 bits. With none set fsl_sai_hw_params() derives it
from the sample width, and a 24 bit open then asks for a 2.304 MHz bit
clock, which is not an even divider of 24.576 MHz, so hw_params returns
-EINVAL. 32 bit slots give a ratio of 8 and still carry 16 and 24 bit data:
rt5645_hw_params() only writes a BCLK-to-frame ratio for AIF2, so on AIF1
the codec ignores the padding bits.

Declare both audio PLL families and system-clock-direction-out, which
44.1 kHz needs. fsl_sai only reparents its mclk between the 8 kHz and
11.025 kHz families if the node names them pll8k and pll11k, and
fsl_sai_set_dai_sysclk() returns immediately unless the direction is out.
Without either, 44100 stays on the advertised rate list while the mclk
cannot produce it, and hw_params fails.

AVDD and CPVDD are required by the binding. Both come from ANALOG_1v8,
which a baseboard DC-DC supplies rather than the PMIC on the SOM, so a
fixed always-on regulator is the only description available.

Route "Headphone Mic" to IN1P, the pin the jack's sleeve reaches. Without
it only the micbias supply route exists and the microphone input is not
connected to anything.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
v2:
 - add avdd-supply/cpvdd-supply and the fixed regulator they need; the
   binding requires them, so dtbs_check failed and the driver fell back to
   dummy regulators
 - route "Headphone Mic" to IN1P
 - no clocks property on the cpu dai, deliberately. The fallback in
   simple_util_parse_clk() picks the DAI node's IPG clock and
   simple_init_dai() sets it as the system clock once at card init, which
   is meaningless for the SAI but harmless - hw_params replaces it with
   rate * mclk-fs before any stream starts. Naming a clock instead makes
   simple_util_hw_params() call clk_set_rate() on it directly, bypassing
   fsl_sai_set_mclk_rate() and the PLL reparent, and 44.1 kHz then fails
   in hw_params. Tested both ways.

 .../boot/dts/freescale/imx8mq-phanbell.dts    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 2d134eefb765..af4b9d266451 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -37,6 +37,14 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		enable-active-high;
 	};
 
+	reg_audio_1v8: regulator-audio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "BB_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	fan: gpio-fan {
 		compatible = "gpio-fan";
 		gpio-fan,speed-map = <0 0>, <8600 1>;
@@ -46,6 +54,42 @@ fan: gpio-fan {
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
+					    "IN1P", "Headphone Mic",
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
@@ -272,6 +316,20 @@ &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
+
+	rt5645: audio-codec@1a {
+		compatible = "realtek,rt5645";
+		reg = <0x1a>;
+		avdd-supply = <&reg_audio_1v8>;
+		cpvdd-supply = <&reg_audio_1v8>;
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
@@ -295,6 +353,27 @@ ethphy0: ethernet-phy@0 {
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
@@ -383,6 +462,12 @@ MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x05
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
@@ -410,6 +495,16 @@ MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x41
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

