Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0E34FF78
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538044; cv=fail; b=EydTQQYg0pGfuzCj+9B6xxw19yrUG19OI9nWgBvHdpBHMxoBbvM9Cw8tRLvezcPFpAH6A066kiSepsdYD5Wqgyf1vEw2HuXvbKJyplA68mRARZrJXIMNpL5Jn4sDnkHWj1FH+cYxLPw6CnCrL4t5AUdGrTXiPlWcmpWvMbIGECg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538044; c=relaxed/simple;
	bh=lO6+8JP/5itsQwgcnohkZClbise7bAlm6teP+wj1Tag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mb4p0t4iFu2LNMBt2NPwR6/d3uhLV+farCk7YmsVtUxS0V8JTcvqSpSTHqnEgqGQJDwOAWN135nM1WnmQA9kxufba0POZYbQaxw3iP1/WKWXe5XORBprDAcv4AlLXELMhW5LE+61bW7K72C4Ax/bcGfD6Twgvn1lWXXA+NN6tlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iHcoJUI/; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iHcoJUI/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUmaXREHIhNdS5iQHoH62in2gI3a6W1cBodB/y2fgrIn77O6nUHVg4RlAAxooMs9HQVAj/iyVZI2lMcq0bmQfIZWz78BPqNkclgvrNq+z4oszBfblt8mNaluU8p6BtQw60cx0b7cbj4uiJOgsTEoRoGHvr207s2VFbGnXrkW6t7D5wU6eX57+S8Q3zGHPADFwUeSyetCwv6zoVRpOU2G+bpGpTGG4cj+xocusmM4Cm8W3iwSdmUYRV5d/I0S7/wWi72biohaX9NyPqCt8Tv9AafLOj+OmNmssBr1cY6OeMi3TxKEMV3U4A6s1hPBSVZIddSuKAO74ok6ruvRJHsUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+q5vVy3/mHMMRg8yJeHxHFAos4TmuZ4TO7+Jg4SLdw=;
 b=lJrhuU+vUN6ehiWqIBW8+98B6ghAMEmh0jd/aK2GS/+quk1T2EO1Pw+drEETXACDxd1+r6+dgh5JMkVS2NY3ZDdcrqX3C5nGNeBmHxcDgKCUejzoE7CQb0n8Vs30Wgci5mgiN04zBlhJV3BEzcEPWXB5b9P0sBmQAObvYjakfhfyCFwsSy3R2vZ56IwIGr28swaUWiHpfojEDoQt9M9t64lU5EQ/s655RfTfgdQ6nrRq9fwC4nWbQa5r4Vm2V+8LynUk8IFsAr1uRBFG/GEio/eyHieTSjLyI3cDGja7kwbUSNa5sPvd5BSBj+x9Ob6LWsgUSCgu+0g3QwDc6Eb9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+q5vVy3/mHMMRg8yJeHxHFAos4TmuZ4TO7+Jg4SLdw=;
 b=iHcoJUI/ukbwMku0EilC7EO4inUJ2viy4tnrzlGryLg+QwRmgHaKuMFZgEdWPopd1h1NVlX6YOknAEWXtfeaCTszcN+erpo0bm0H9YSordfeVVFerGYMrXzEnw23i7ocENit+XnH/L94UXm4nC8fQFrPlAUKbGMX8HQqXXIM1Ys1+Z3i4g8TRr5gamD6tR6Tjyc9QfggO3UO1mb9zv2rV1M/jiRzAiyfr92sSCp8/1/J6rjVxdMWd23fFMkQ9CIfHMta/uJU6HrctfEWh76QsEjFablUFhkrP70QED65LG0dATdapvvft1VPPMDFr9oqEqKKjvGFwjk975GDFmDhWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:20:40 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:20:40 +0000
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
Subject: [PATCH v3 02/17] arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and MQS1
Date: Mon, 24 Aug 2026 11:20:05 +0900
Message-ID: <20260824022020.2812810-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::18) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d34aba-bf4a-4010-76bd-08df01864aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1Cd+qIAvMHFkJc4nDwWpzoC5aNJVNfimpTWJxi19xKwbuPJCflzUDamnLZpfdy6yalaxwsxxGr0GxIn+K6Ax1KIFnXh6NOTJEfvPZv+iClbUN8BEpfCyD75BYXUPqmd6X4u0xDdMw4kwMeV3ThU0E4pqAq9jPFKnSQKPvt4X+a11ArNpef+ZAgS19EksQ9LGYvut43qvlgpKLIpe4nE/eLk3X/nZhZ4Fh/ldU3pZiekJFbhhO1v4o3Zxlndx0sBAV8ZZWk7ypsW7KYCdI9M1h0hXWyWq6mpQda/If0f6zMfkdIluCvod88k+/GFMCQRtSlm48mexgcxj8658mhqaSMZ6K+WEMjgogGMp2byMZ0JPebW193KSukMRyqwSlet7Wv2KRLyZeptiFdKce56K2PAvRLICUgRomgxuWNgU1hAwVZLU+/OCLhtsDQriQzRdDqYpTGUVKpHJJyxFc8hv/6mLSU84xfjpKmdwNlVvjhp09LYtDCNmbf5C8PYHd+VEkYgN2gM7SX8PKSXHvgqLxSUAGDuzYbnUPlB3mS2vnXOtySkMF6mNnc7Sp6FoSco+hDPvls/P6zCHBHOzvgQg/tZIqjtoR+9gsiPlQ9p2vnTbhUpfYLnKKs//zrN7y4srWQmEKeSSA+qpGKVjaq9JL77SaW5oAwOmSN5ZVx/9wyc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ohHn8skvUsKtXn+6dzu+Y0bzdOXlqyG0GlZqKL/tftSveh/V7+DyQeGMZAvz?=
 =?us-ascii?Q?Xtr63SatM299OFd6LCyiJbCwhdZmSNjOgvQkU0+R6H7JuqnZr3aEvt/ijzVF?=
 =?us-ascii?Q?KBnOBycHGKcSTG6qU1oxXOgBOyNtQqDth6ULnqprTZ3d4iOM+eyq+ur16qV1?=
 =?us-ascii?Q?mNsewb9e58+2lxe8j4Z6xVk+rPhb+zbxSoSMYRRc5QvUugtFHmeqG+DP+dAz?=
 =?us-ascii?Q?4YAAwPFa4W3NBeABEqYmeZaOegU5egs13K3B5zRTHvH8ETFpoyHXjD8/GLQG?=
 =?us-ascii?Q?3lRhkQLyYAANZcbSTMoDCxtMSVdkMxx0bvRDbDzzodXXz7uz/vpP6CsC5q5m?=
 =?us-ascii?Q?hgNwoIDYznkTBLZBNfwuVYRv1dyMXQsuQ7FWCB33o5+suq7o+3KVGFTdHRWc?=
 =?us-ascii?Q?oxGV53kGtd7tVdXKKweizzUtfdT0KOff6nlTAbNw0oJoSYqdTHzEkRJaIYUZ?=
 =?us-ascii?Q?z44WaX7QPwTdC97NkYKVEuDF/noaJDnoikfrDvSxijgtejU7DiPTVmFf6KZa?=
 =?us-ascii?Q?mTrTSfIjlbxlfKcTWQw8j0EeOBoL0BwK2aQoatDV9TtXeP54GiiUa5Iqstzq?=
 =?us-ascii?Q?ishR7z7yZW8LMswURLe5xboFQKSIWL41cpYcniskP0/7bwOf/uXVAQMqb28C?=
 =?us-ascii?Q?6oMftTsxAI+mWzqng4waa42xHdb1iGUx9mLI6u1YH6h7dMZCDtq52Giy4GzJ?=
 =?us-ascii?Q?ADd7ZP7OsB3t2mRj+x0NSNdDOadlIwrHrCRO47PCnFK167Whdp60juX8Nr0+?=
 =?us-ascii?Q?EY5c8D6SL+i8zqUYLYLSB8H7A6nOYkRqAgiXXtI4DQui634MUZm2S9ChGGjM?=
 =?us-ascii?Q?EJ8tR2fcMVd1TQOitCmcAOvmUp66+DERbEQiPy5vhAN3pp08sxERBIaUba2Y?=
 =?us-ascii?Q?e0h15zEQCqh0HJzmmCzAOFsuV4P1G2KEiIMvMVwncFv6XMlDIyFqC9Xa2M0P?=
 =?us-ascii?Q?cUxJRrFpWxCeS5g645AFUnbEK9HlRHs+LYKqppjIngRWnpVP3f6YezVxIV5+?=
 =?us-ascii?Q?dOasToWIj7wpN0HoaPcayrrvtNjU3SD5N6r6oelmKGLc7ilUBSLXSjdIJdGh?=
 =?us-ascii?Q?StgegyJjL+iwS0owyyZXEqSmlfGw7lnfapnoStga7lyWtPwVSn3AlWA0afFb?=
 =?us-ascii?Q?0vFpSJQ+S5bFSrjMsqE+onEKfh3NxMUflp/N0m8kUp80Z0xWxaPmKf7f13Wb?=
 =?us-ascii?Q?z1aRrwgPOnbErTBVLbA4O8BlUCa7T+S/x4mCmtpIu+OI9sJPqzNBGRNqZ9wK?=
 =?us-ascii?Q?Ttn/wcr/KJdCfIWyPkpwArm32Fqw55bElB2wzt1DL9zhkzaEBdZz/G/O4518?=
 =?us-ascii?Q?h/3wstXrSAtp2OK7DDr/EVwRbKw6UYLUqCM6nOyi3FAiYpRKKuZlQZ68kSAd?=
 =?us-ascii?Q?gfBgILLs1PmEhOMAqY2deUim1eL934ra6FNBiAvGw1i+eFh0ROEvkGkKb97s?=
 =?us-ascii?Q?/u+Ue7kKdqpcLoAtk1WDBw+Ig/AcJgEx1yre9swY0JSYp46qxO/I2hB+wbA2?=
 =?us-ascii?Q?KV3znMxkxqizYxbXHujppPencKa0xTrGPEfmXya0sJmZNtwOYXgr9bCL/0g3?=
 =?us-ascii?Q?WytofHjQvidM+CpFqu8aSEC0AjfhZ3Uv0ZBUvcHagQ33m9UmwS9tOwTaeikR?=
 =?us-ascii?Q?agcT/JuIsRHYGatXhUJ3mzacvkcie+NemwErdhwUJ2ldY2wAwbisNQhlD1Q/?=
 =?us-ascii?Q?53uAgYw70f8/ERCes4b82YU4SRXbobNNXrNMV3bgNs+7IZ52pEbiA1oBqLBn?=
 =?us-ascii?Q?fP9Rb7PjHbvcow2YV7BRUWUD3R/G8sxA1IkIwqbxEWYZQv+byIie?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d34aba-bf4a-4010-76bd-08df01864aaf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:20:40.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW0EqlqiyK9yior/f5tvZf/JQfwOn13ovX1ZCJJz5RqaN+nWdkstxCfWH4QzmDdKtGa1mXGcSJl9jgo8Ybwyt9IU+Ub06w3b3ojj/7MgrVjz3uWrb5cvGQ1H7njlb6uq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

PDM has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between PDM and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 5716febb5a50..4d1ada6a3942 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -41,6 +41,25 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	pdm_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&adp5585 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&pdm_mqs1_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&pdm_mqs1_mux 0>;
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
@@ -484,7 +503,7 @@ bluetooth {
 
 &micfil {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	assigned-clocks = <&clk IMX93_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-- 
2.50.1

