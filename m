Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D554492527
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189238; cv=fail; b=JzrDrBz0GlFYJSaS7eaKls79abkkVwsiuBxxIC5wIt9SivlmUbDC4uYMionlX5XPcatPmWEQ64tkO3/sCeP2QEfoS1bDvknPNbP1YTvtq2JjEuKgF8sjmCqoDUNkkjw5ywFWuUmusy4xa7YqHINMbEUxA7tITvwuD2BmpNBPmqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189238; c=relaxed/simple;
	bh=KJ8BCnhEQXQ6q2Xr7Q9FAAtQtpXQdfeaEapRLRM9jwk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BMzpvAoEoLEdl/WAb9aZu6rSA+R9T10+a/WJgb/CoO0OA3DATX3bIgOd/uWZFbs8zkaF4HLzXGLLb2bKX5/eUTujriBrhtZMWjCcE+IG2kfGde4vr3k826uK+50OPadAK+HK7M4FIAu76o5xw8BcGEofyEw8vkyPuQICYBLtHOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J48eDoZo; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J48eDoZo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqIJqN02l4inhhC2r5wW/N2yMHA5rk9XzjoyQRNcGfGkDseKX4ONWT3iHC0WWBNpvqUdtMQslzh2mW/0T6fLlcbA4xArmIEXpZ8tQ3IJ8uLTFfl1eSQGNQXoUSgwbCRaekr9Z5wgGcjKw2vqQrXMGL1bpY5bk+/ki7s94SR7OdS0UD1XOIgTgTFNxKGLjIz2/FqvPEa3ujVDpYTeFcOE5bG6wV67FqjaTipOlwR1HoxwFmRfOJzXGAXJizVje4sshm2Qmdc7Xedr4zt34pjGDySlwgMV21A2i+0VZL8c62DoXJpYok0Qhd0BGxUX4hlyB22ZTl2OtwANX/PW+oaLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihiGbYX8u+/PIJpapCEricacu0gFPG8TcjPmAolmHy4=;
 b=f1Rabmipqqe3UdT3wHZqGtAdeBTh7/VgWeM1aFmfUaFQAXoWKIF8+JbrO/1wnV9s5sXELZaqgHZZ8lBtVrwCO24Yz7GKKQEszQ9oD0KRxM8ekl2b+c+MIV3ycwh63br3ECSyRjWMbxZGghd+x8gBhonZT4N6eZE/jwTgoYFNTJ4+nzaUsPX8+bEnZhGdgbMHG9EkwnZxoplcCNEy3i7pvAfaJih+stjoGRCqz9mSPJsTmHMdfaKmM++4ZD0JnX9bmjyOkrYfi08PKbG4VWRW4YmjNU/uk07rR1RTS31dCGKMHpxfp1EqRgW0H6eEECQN4741440VvumILl80dlOD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihiGbYX8u+/PIJpapCEricacu0gFPG8TcjPmAolmHy4=;
 b=J48eDoZoTjsfhjkUNt13BvBGISv+dcal+4kiSbepHnjKwUKtWN7+BvkF46I3cgPrQ0W+Xn+mrPq1bOliwIYSf78tSREiP4kLlJmBPdNSZIKqu54XFNpHsqxrov5Hw+4Zx6vyutGlF7KV558U2RFOXyR1XTgjkm3n801ZKwwSOdZ7EVARQz4nWmGd0f/ZomfbA0GhG1ge/INdeG50rk6iD9yfbB0j+hlnhiY/3QUnCjqtG+1GjRAGhnqO+dWFdyeRan6mxCJaAB/0drl3APfHPMgoc1kGZvw7yo0/AfLpwWUfUtYBCfq+CW7q7uQ3w1stlAugo/bshNatFEaCLWCqBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by GVXPR04MB11542.eurprd04.prod.outlook.com (2603:10a6:150:2c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 11:13:53 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:13:53 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Tue, 19 May 2026 19:15:16 +0800
Subject: [PATCH 2/5] arm64: dts: imx91-9x9-qsb: add pinctrl for wdog3 reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-b4-imx91-qsb-opt-v1-2-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|GVXPR04MB11542:EE_
X-MS-Office365-Filtering-Correlation-Id: 22367798-d7ee-4483-0932-08deb597b60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020|22082099003|18002099003|56012099003|11063799006|3023799003;
X-Microsoft-Antispam-Message-Info:
	yxC/Z6y+qw8k+CSiEpusvvdL/263eaIFSYlho+gxN+yuicHvSUaiPohaSSRhBSICzn7dQXp4/QVO8uZ1o2PmJW1qzN8c/Cni07rqzYjSsq0/Stja8WQbaG0gXqi1mFt9K0CJO1uiO7b+/vE8ouZB5XR4iy3nOzTNR9PiVtyadWSEV1Q+21UZBKUkEEIJ2NR88BwaDztgcbUNrIKXlMT+ybKMKDfEDhnDfe93r5JeA0xOsyfH48F1yDf0hQ1uQgLKhKZZi7zB4A6KabhYEKCKT2lwVyqIOKERQFuMVIIpeAL//FAxJbfCOVn9JSahj6tTDzADOKn7unbwHykrFDt3fq6P2KlMArtJUrGjGVmapyQfvSI4Rla0vNu9VSiFdj4tnz15hfem2+OpxArPEU/Yk7ZcT7bQroopXgGiQ3isIwmRlvskRmHb6GbDpQsnwWZwm9uMiEI/f7hLF7wlYAD+QKk+eLaHlSxPCeSpevtRI0IfxFJxRNQ/bDGlNj8L0HEiuSLYD1Li7DzwctKSXelLCbgKgN8GABIk0HSImKMvZT9kxYVAx9vhv8h9hNkdgdJs9S2oMs4kIUyWwK/gA+jACpScXo172uULILVGM6xlsB106buedJsg53F7fz5fKp3en17eCaasfevpqvYAZuLxMpqQYpLGF6wPwyv+VH4V6zva4ckjrQXJACnM3SuwvWgfz9pcyfGxKFhmZPaV2yJCXBzCrD2LyY3J04BStxRBGyLBbZSVJ3fY1w4NAd2dC06LLyTpIxrRy0QYzLDWhj/BxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003)(11063799006)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjk1eU9Sa014MU10eTR4ZTNkYTY3MlVkUlJyRFN3VXc4WERycHF3MXkzcnlC?=
 =?utf-8?B?ZzFremVOOGJ5UFVGU2IvWnJBeUl1dUhDRmwvb2thSkszOFFnbjNXZDJjT0Y3?=
 =?utf-8?B?SEhtaFBPdUxoZkZZQlhzZEFmQUFQbWY5LzViY1FiWldoOTJrWHByVFg1cDFL?=
 =?utf-8?B?NWFFdE1peUd3Z1FodFRpMm5CeXlkVmlUbzRSYVJXTXpCZlI0dk8wY3FPZlpz?=
 =?utf-8?B?cU4zQ2J5NnptU1dYQ0VxQmFsUE1WTUdYcXYwaTFFUnMrVEN3dTNKc3RCWmZx?=
 =?utf-8?B?REhXQXNTVXhBMTM1cmlxM2l5NmwvQzhXY2lkdWJCSXBoVVErVUFRYWN3dFlJ?=
 =?utf-8?B?L3hNSnRNU0JocjF1V3kwSStlR0VGeVYvZi9CVUNDRFFXUmJtWTJUdXE3dVdv?=
 =?utf-8?B?WHdtSmx0ZGo4L1JLVmdjR3UzZWY5OUF3Ukcya0tnV3ljWFdrS2UwRklIRXUr?=
 =?utf-8?B?dE9sWDZ6VjZDZDZVK0tzY3Rod3dXdUVqTVpnNUt1aTg0c1l3dThtUUlMRmVH?=
 =?utf-8?B?Rm5PcVdkTTZpMVR3ckpKbDhNU0JKOW9QNlFaRDg0c2VuNkJnN2IvdG94MHpO?=
 =?utf-8?B?UUY5Rk5vd1c4ZHVBWHRNTHV3QnZyZVpJaU1lRlpDUUJvRGkwMm03S05sSDZO?=
 =?utf-8?B?NUx1UVJWTE10dHhVbVZsOTJGTzgvZWVKZUxhV21ENWgwRHV3aDN1Z1o4bXRh?=
 =?utf-8?B?cFd0Q0pwd1l2ZjBSWUEwNHNiTGkxemV5cGcwbWJVR29HOGUwY1llWHRnem5w?=
 =?utf-8?B?eUhpLzNPdDhrMlBueVMvUU9ZWW9iTGFkaWtUZnFpc0pDTk5jK3kvRkR1eGlp?=
 =?utf-8?B?cGlJc2V4bklvUjZucGFHWTE2ZFA1cGo1UGtpenVKYi9oUWZ5OWE0aFdDM0Y1?=
 =?utf-8?B?MnhrdW9BNWJlYnhrZ0FoVERDZnVyNUtkSlBWL1RFS2FiaFJacTRlaGFDWDE0?=
 =?utf-8?B?R0dwWEIyc29QTGxPZndYaUQvOU11TTEvaDg1T2J5amhHZ0NSWmlmU0pBWnZ0?=
 =?utf-8?B?OHptUzIxcW01TmNVaVFBMTlFQXcyazlzd2kvZ2lUVk5CSnJIWHNIZXNPbnEz?=
 =?utf-8?B?MmIxWUlBOUVDNE40QXRzaU0zWXFDNW5HZFZYWVUzNGEvS1BjZ1dGMjV1T3lH?=
 =?utf-8?B?TVJoMmdQL0U1ODN5eDNEVjREUEdQODUrc1hDUm9BeW16NWJ4d3VNekM4SW9r?=
 =?utf-8?B?VUZVRE5qU0h5eVhFUmM2NHo5cERkUnp6S1ZZTU9FS3ZtNCsxaW9SdGZHTHBM?=
 =?utf-8?B?ZUFJR2U0SVAzS2hHSmZMYTFUSCt2THQwbjh4dmRnSVNaQTQxODRFOTRzY09N?=
 =?utf-8?B?dTVTZDU3cURiZHVobEpCWnoyUXhFb0FXamJEWFZGM2JPTXdubjNFNUs4ZzBp?=
 =?utf-8?B?ME1JTWx1djluM2pSZnhlSUtPbUFGQklwZkdPam9kVmVQVnhZWTVQS2xYYk5a?=
 =?utf-8?B?Sk1MMkg1R2ZjOCttZU5QN0dXRndLcGV3NVF2dytqOXdTNkwycTU0YnhsT0dx?=
 =?utf-8?B?T1lCZjZ1a053b3JwdDFIMDhkRlJCaUtjQnc1T2xQRktVWmxEUk9IV25NbSti?=
 =?utf-8?B?REdtZ3B0QmY3eFI1TkoyWkxTeDhvUzFFVXNXVTRMdzcySHZKNXppcnlDb0Za?=
 =?utf-8?B?V3FyNldkdDFzdTFBUTZlQUJkQmNTNWhoWG9YcmJ1ZHZhQmRubWpPRXBVOEhZ?=
 =?utf-8?B?cVk2V2NQZURmaDVXL1Q3MGxBM0xRRXFNczg4VFJMTXFIbjBYdGFiY2JnbFk2?=
 =?utf-8?B?OEFaQ0lqQzFSRmtYUzZvVzVvVU9IQ3cvZEdTdVlVVGxoeTBnTTZtOUJ3MnB2?=
 =?utf-8?B?cDVUdlZmcVQxRzJYM1lLWUZrdmtVdDFmVFByVC9rY2lxSC9pZndoMjVGTVJZ?=
 =?utf-8?B?NnlqVmV5TllTeEsrUm1QaGluYzRKRmFrSkFHQzFuUFhNRjNYR1A3N1EyWnJw?=
 =?utf-8?B?dEQyTW05UTQyMlMzVmwzSGN1Y3E1U2JaWFBCQjhNS2ZVSFAvQ3RVSW9qU1RY?=
 =?utf-8?B?SHdLZndGS0xJSm9jL3c4cWNpR3VtRTFmUVFSeTFrNkZDOGZsQlc0SW5KMksy?=
 =?utf-8?B?SDZQWm90UytObGZWclRQZnlvaUFyTFExTmZXbFN6eEo0ZTBtQVJwWm1KYkFQ?=
 =?utf-8?B?TkRuQW8rZVdvWnQybitnV1RsMGltRHIycnhaVEZYdzVnM0k4cmViVG8wQTVQ?=
 =?utf-8?B?YXVZRWhjTU9neVZFWVR0RGVvL3RXYm9oSSt3RWRYNUdyZ2N2RktOdnQ0ZzJI?=
 =?utf-8?B?cVk0TDV3M2NaekQrRXY0NS9MRHh6S3hUd0JYZ3E2dGFncUVUMUxicENqQ2p6?=
 =?utf-8?Q?/skRfyEMWtbz/Q+fiY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22367798-d7ee-4483-0932-08deb597b60b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:13:53.2901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rvmZbvRXIaHiGLKxPV40YcpjEw9wfJVrFplPNR9tOdmA8g6X65puxcY3nJs/rOQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11542

The wdog3 node enables fsl,ext-reset-output to assert an external
reset signal upon watchdog timeout, but lacks pinctrl configuration
for the physical pad.

Without proper pinctrl settings, which could cause the watchdog timeout
to fail to reset the board hardware.

Add pinctrl configuration to ensure the pin is properly muxed and
configured for external watchdog reset functionality.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 9cbfe57be2d3c37208611dfba5acd428f0b58c3e..62549a6de1b64496ffa5cf3f543145a00dbb10a8 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -230,6 +230,12 @@ MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x13fe
 			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX91_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
 };
 
 &lpi2c1 {
@@ -419,6 +425,8 @@ &usdhc2 {
 };
 
 &wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
 	fsl,ext-reset-output;
 	status = "okay";
 };

-- 
2.37.1

