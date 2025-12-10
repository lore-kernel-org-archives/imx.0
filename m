Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023088.outbound.protection.outlook.com [40.107.162.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1452139CE
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380027; cv=fail; b=BpfBplHy2FvEDYLGwno4OFH80fUmp1tYymU7oPjFV4xAbUHhtbGE6Nv8dFbX+DJVHIsMsJsPMn540a3L8br6fnfjr2IIjNvvllHvoSszBJ2iLcSPOVuzpqfIR8Sy6FZZk52SjUqtJHbRVuMG/AvPcJYRbiwu7cMofRhZROYklQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380027; c=relaxed/simple;
	bh=2BUPsrNioNxK4+IHCCv/2w8ycDCSKi9sjQBr9y1shEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RR/gLM0BHrySLbv9KlErlMXySk5b+K3DZzpNRgGIKitHRmeB+pTnHNY0pFen2RS+uFlxl1Vi+4/0vRsIX4Z+am9vx17E8PwJkKutn2wZa64XziIqO4uw/lgA0/rvazgbfoPUSb+w7mFri6K735+ZPYPFe5xbsLjpR0oEuJ/URcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=fGb7/OxH; arc=fail smtp.client-ip=40.107.162.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="fGb7/OxH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUTars9/bX3mmdDXY1FYa0q03AIqkFUBdnBdCZ6FlxCFISEdcARUwA49TSu4EVyIkMCZ7IOaQYpYRk4vTgqJOum4xfmE9esG10qeof4im8io7CqrRR/nBYApU0lGBbMQdihLo//qPxbCKhbItC2HKjBp+v1N/oRe7Wg9qJECwRz0IlaKVL9DYyNIF5Ybfo0nf2ZFbDMVTfkna0//uE71swpctTpMdomRzacFfyG8gcBLME0q8aLB4rCOn6s0sTLZMY7cSz2mNgxCHjs15FbQlsCRPjGB8eUVd4iSd3tzzGxlMW+Wwa4NT6ZlNzsh2p7ewNf+qftSMLPMrj5q6PN1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOpZh7LYAA8Dtx9qfwir93rZZO8/sCuUlp6Rdd8i9AU=;
 b=Dj1X0R59rn7y6EZjiH3rdxV5RMIFDxGpJA1xovyluBqN9Y+LhHsv6GFTiF9iyl+rNvYriyWHN9x1S0tHZ3vMgX18qqvtceSP2wt4iDNDankdeFFXwOzRiuvwtQ6JlsoYPL/cprNMsEWhZFTOGxMeVvpIwuDUmiVZEILkG1ooGXZVmvlX4m7ng1RI0i2yNPtY67Pj/RlK+KCWZjMu54SgXkDH2N4TOglNHxnHsmL6HCEPE1ZdVXR0pSDHm/RhRA9lISp9Fbaj2Mi+dQ2NVATZP6482u6tVElrbny78po1Wu2mGw0Kg+5GeN//1HjZjZywdccMYoFzcDcA3t9RjpnSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOpZh7LYAA8Dtx9qfwir93rZZO8/sCuUlp6Rdd8i9AU=;
 b=fGb7/OxHawCSSdt8l3xu+xL2MbNE1Os2TeOdjmgIsujQPYUJxltDFOTw/oPfJLmr2LKT1Sgi5wNlVyNgnFLCYpvEJAQEQjttkG/+4+ez+n7X9HMlMAQyC12b4Ci61BA94f+1sZN8RDC7oGZntR14UQ+UFM86niKi4ckeKedTNfoOzcOBNkXg8q9cllDKjnbktxQZORBsdPMERJc7Fb0saJsQX1MqhaDPo5KiLU+tJJKgL1Wmk47OvAe+xMafqY1yuUMn3DsUjJLDHj4YYvmtIcAJj/Fzce0IcjSIp41wtCA9yu9ZKyBMvd+A6YX9zXiJ7R+brx77IqDptlBEPynYQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by DU0PR08MB8347.eurprd08.prod.outlook.com (2603:10a6:10:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:11 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:11 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 5/6] arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
Date: Wed, 10 Dec 2025 16:19:57 +0100
Message-ID: <20251210152000.42265-6-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210152000.42265-1-stefano.r@variscite.com>
References: <20251210152000.42265-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::17) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|DU0PR08MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: acb98aa8-5603-44f7-f78b-08de37ff9c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7yciks/XLhBaKOv3m8Vy2quuh9zBCCGrFHYJuOK0fcCWCkDzygZRy0FlKr/Q?=
 =?us-ascii?Q?/kxiNXOI6Xb4rPTr4JyJm6sCZMnFV8S9lhWx0HddvjSkSPJIlHetHdUR6mua?=
 =?us-ascii?Q?g1WwLtyDOHfln6EdA5HhIwtZdiY2bTERIRH/+Dn1xFG25OkM6RTjJiJAmQYC?=
 =?us-ascii?Q?qiUbVmMi8d0vcSVhqGS+2rp8VPiH05AbKJbyKACWBU4iFG9mGGROT0pM9TqZ?=
 =?us-ascii?Q?uBknd/912mlTpK211nhpwM2mZayYM97nKIO6+EdJxuIHYxewL5CPlAq75C0o?=
 =?us-ascii?Q?Y+bHFcwc5CS5eTagQMvN4f4mDJA/iQJWy5ayQ136QoByBhwQ0sBiaOaoZvJa?=
 =?us-ascii?Q?p/sOZXJ0JmkqVN4p3CbmgDd4nImV+qqkzHln0kru0wBjWkN83SGz2Qs8owv0?=
 =?us-ascii?Q?Ycb4vIRDzWPx8LHNRGj0A3ol8bNBwhzvLe6m+9lPS0RMQsCURxIHer1MtXfV?=
 =?us-ascii?Q?OywA5BCQ3GpYh8ESnhuTIImldE/1qgRk1K5PK00kvgL8cG5zRbXTfxeyVPDT?=
 =?us-ascii?Q?vLpkS/dJfqVRvGHBADzbmzld/TtQmIpcTnJHd9gkwavXYbeCN1jax8RQfhi8?=
 =?us-ascii?Q?SPt98N1HgKDqqLOgZV4UK1ATC9D+E4Y7+L2PbuPFKjj85Ih6JIMR7Yu8618u?=
 =?us-ascii?Q?xQLq0DitrQSJplbIkhPK/Ex8GGyIMnr0fgCqRM8LF5kW+s7n3qD3L+c+k+2d?=
 =?us-ascii?Q?YyHElai5TJTiazgK9LXeQgCzEMXpVu4eZtG/fwvoHRASJlvvWycA19UAna/p?=
 =?us-ascii?Q?5q/isyvaFgfFBceumZexkU640POQlx6L0Foo324e/Q8y0ajK4k7Dkx+eV9H6?=
 =?us-ascii?Q?t/zeuSi3UAaGn5dSgLabYlISvU0WZPBZ1O4Yat1HOXfByXbNwRfbsptrYtuS?=
 =?us-ascii?Q?JzXR4gdQGoA3/9+KAgFnv07Wp7pMsxP/oKunQ3oa55BXgQcbd7V6H3HDvWlS?=
 =?us-ascii?Q?2nNVtT+DEygsnPL3NrKUQ3kBL/RdewO8w0MnSErpt0HEsktbAC457lVLyQuU?=
 =?us-ascii?Q?gjsnp+x5qKroNwEeWgZRi6yytoyKqbTKQQ4KkAH+oPtRKJKb/G3HVd9a4hSO?=
 =?us-ascii?Q?ogNA3V9ZVtIy0z1PulQpR9wrxtyUx5jwWjU04FqvCRSyCfKRRYqMWzaQ/tYt?=
 =?us-ascii?Q?nCvlYLlZOMgnC294YF1fa2CupKmE0eLdMt+ZKrMLGGKfjzotPR7HZkoTKe1S?=
 =?us-ascii?Q?7d7F7sO8MYizpuBucguArIXkbmQ+Kl31t0feoHRkkFWeGudHCSRkKq2RdHIa?=
 =?us-ascii?Q?zZsFBjrqqqAWJq0ANnJNtujlZjQU5D63V2Pwgkg04WiUAibtT6Bj638pU69m?=
 =?us-ascii?Q?ud29uOcyJ7OsOFQrAk9M3rWESYb3JMsK4Wj7EFDQa9jTu8C66a/CcbpZj8DM?=
 =?us-ascii?Q?F2vnlNoO/DDdK1URuByJWl9xJYCL37d2nfurO5EjrEmyLPzDeYjuN0G0MN+f?=
 =?us-ascii?Q?bsDyyCxfIYc0yJs0tjZv0+vrjWLpuxwC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hZugpS+2k9CKdSiUmn86BGjLBUw+maAsZwesjiLvO4slKbBJ/4oMKmdIAqFg?=
 =?us-ascii?Q?zKZu3UV101j1B6urfYdxdZJadieG14iriJ+NMupyx1GsbhDhIBAFEJnp0nNh?=
 =?us-ascii?Q?X10fOm8m+9QBH+NLpq8kn/6ywY5MjxWZslRSuKVQpiU4OtxRJYUJJmj5zHbx?=
 =?us-ascii?Q?Yxnoq/2qVRPwMaLv8CpVu+4D1MD24bHSZki/aMUe6S0M3VkYXcGMR/ipOZQJ?=
 =?us-ascii?Q?WTAo9SF7cZWQDi03593NunSqyIOC73I4uibqi6Cj2C1uo1MioCtFdg18Rsec?=
 =?us-ascii?Q?1+BDyRZooJ+4ejTkrjkLokayDl0cHIU8M2zGzwNaABOLuy5CnkdNv+feo6ao?=
 =?us-ascii?Q?rOX9lbQ092W6DqghvNXuXtt0H7/LaDZMXB3upNzyMuWMUoVCAmECgN30q4FX?=
 =?us-ascii?Q?AdN3ItuUBwcCaYhQeg+R2WJWg7afe8bEBJ8mNaMVtCE8KnTlaElgr5NdVt31?=
 =?us-ascii?Q?M/6Xpixk/v8BKSl0F785tkEWMNEjlVXUg229pSIIyOQVMBtv0eHg+2s/XMmB?=
 =?us-ascii?Q?UxJWPxT8E7vbX2Q6nxvRt2lAojBFHIwonf3XctS/rHIvBzGHe9QZ6tMo1UaP?=
 =?us-ascii?Q?4mui9ZMm4pxT55kxdDeuqtHerk5cXfz4dIFCfhkNfa8DUiMl0i2kyswI9kai?=
 =?us-ascii?Q?pHaZFHavHoWh9WZV/lxpKN6/Uv55KSfU3GEYI2L/UTUbfNZ2wLt9hCy9fkBI?=
 =?us-ascii?Q?nE9qj1AkuqlxfyweBqNsd625TO62t1WYCp2Qa6KqaQQxhwKXd+6ReDZUiX81?=
 =?us-ascii?Q?513bLD+E6X+QWKi096iPzq7z9Kvfr9JNuG3vpYdD6r5sj/3M+Ug0KxgtBocw?=
 =?us-ascii?Q?qo2hOGjRHHlc4XlRLSruK3j4EWBcTvDM5d229pL+bhN5h39+AtLjdgaaBqdn?=
 =?us-ascii?Q?bgUmMSMudY/M0D/yhdEw7IywcPF4V2QBy8W0DENAdDDuebagik2EZ2DwVlbJ?=
 =?us-ascii?Q?jHpMInJiisv7iOKjV7SP/Tl6z8+Sa4L/m5/cJVMx8G5/oQItB7ZTjB6fI61h?=
 =?us-ascii?Q?k157RT2g5+v96KYudQRfuMlb+f2m+3wkv1cJz4g4W8fC/dttItjysrFs9UhS?=
 =?us-ascii?Q?j9taHpViFkbnmUnOdq9JjzNU6JeoQEC1Pp1c9q7YBzkY14VMZUgH+Pe7BnW1?=
 =?us-ascii?Q?12Kyg6UAfReaafYQpYiYpmgQdupgsvdQwJG7aNhU3KDhTuoExgaH4Xs/QW+s?=
 =?us-ascii?Q?XyMy0UNiHSNc5gC3JzLbhzi5gCbi5QGWYbio1FPbL1TmJYiVtMj+Wk6OUBVX?=
 =?us-ascii?Q?QZBmv0AjmTJ89ayK4EdwjOtOPFhGCNTrXZrrBU97WcIVN1rAjq9rSzGBsFLy?=
 =?us-ascii?Q?D0z9NSZxtXs+ce2U+dMaWMnxCvs6oXWHjP/iHtq+e+zaoD/0lC/rHv14W8XP?=
 =?us-ascii?Q?vjCvZFbIwgtBLGLF9xnwhlsgWcFBn1WPqtOA/0f7YH40XPABKcJG6jea/Jkj?=
 =?us-ascii?Q?7btUXWKjb1F7dinYIRhoZtLSiXKTBS4OOi6GpUeEumH3VEQbUtzmCNKSjNNE?=
 =?us-ascii?Q?Dhg+S+VmywkQZkeR94bG2D60rIeN+s97QFuRR+eCNPLNAFJMmO4y8gG3+zLL?=
 =?us-ascii?Q?BGxeCBqE0xyu15gzLvqcc5dDzAxZfHWAt3dHhzJD?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb98aa8-5603-44f7-f78b-08de37ff9c8a
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:11.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psFWaPXnwBW4sLRo52CggXJpM6SFqJGIwJXLYiv1JJHfFFgBvKzsRslStVlWPpyLczpvF4N3zrgra38Uj650JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8347

The VAR-SOM-MX8MP can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index e7f5ec10cbac..169fc6a9c8cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -30,6 +30,14 @@ iw61x_pwrseq: wifi-pwrseq {
 		status = "okay";
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -47,6 +55,34 @@ reg_phy_vddio: regulator-phy-vddio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
 };
 
 &A53_0 {
@@ -209,6 +245,52 @@ ldo5: LDO5 {
 			};
 		};
 	};
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_audio_supply>;
+		CPVDD-supply = <&reg_audio_supply>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&reg_audio_supply>;
+		MICVDD-supply = <&reg_audio_supply>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+	};
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <11536000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
 };
 
 /* BT */
@@ -300,6 +382,18 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK                    0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK                      0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK                    0xd6
+		>;
+	};
+
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                          0x140
-- 
2.47.3

