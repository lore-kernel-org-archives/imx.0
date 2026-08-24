Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5E34D93B
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538136; cv=fail; b=U5yHqOjoKupkpYv6BuHi7X34ZZ7yUHjTJww4Y+JxiIXf4Eq5JkDIsvpEBAnoJ2nJUbdgr80sDzng2+yumdSBF9FkPTGxlngGflH6K2N11NsZqqVcJs0SO8imcI6Me1A1kHKyAxKfzfXtzdMst+gnLFNKf/IZymRSoGv48xIstpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538136; c=relaxed/simple;
	bh=A27SkGrs0+dEaY3z7NQ5Z2mlU1/Py5My/eHuWtJlbzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TAspXHJqz90omvytI6FH5BL6SavpFls+el6NHZjEbvdWZgiCMHYZ47RqCmmDFJYbYv6/n1Cvc2kG/UFEgYiUJnUke/gD6gmHVYfDMM+8sBn31d21It9SWVbQGQAipTScWBKMgn29uiE2j8k+C8nhqRhjcgedRSoeoAep2RXFxf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AXFUGpBt; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AXFUGpBt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdJRV4F1FkzBzR68WIPfUdq53h+b9V47m6cGZqMG9dlQifgidUl3ndu32d2cmbQqpFixqA3ejuoE6mX8qrZOzF7bbOJmGgvOKJwbrr+bCl5mfLRQ5tdrEyKSysIXrKE3hd2e3BsIZ3ipeSOvQvKd3GwkpzDUWXXqEtlE9q9TiIw/06shd9E7YdfwU6XRKqu/xJ1Apb1l8MkNzA7rmrcpn9j4Idq/GMLcq7RgaHNuYjCVkdPzGsZnsajPzxaQLwER8ZurNgTM6fcQvvdm97DAv+q4O8cGrp05MXe5dxtbkwHAh3uavfZ8N4bDnwK+rXPVspELBlAj9W2zasVQVu3Awg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfRWm9pySWV119cyJM4tetQffY2MEeMP3H4EVBEsc18=;
 b=BxdmjwExOIx7rjWm73TI78PD3mNbBe2h8vf0fnGGEROyAlMR+BypkpH0+5Tg7VhryAjLmHUAtMC8Tnhinutt1NQNgGkVHTNMblRufFvsRXe8BffiAbYgQ6030/2+iFGw5k0/t0HkFHEls3M6iXGeRQBIOg56Qy94fPq5ElVGiaUp9bQKL2cfFT38nBdcW3xb6IgXcgM89ksaqzHxM/JlqsAE/4Ydp2m8HxldNliFsVEj4D8rynyMySbe2LXA+mfDa3GSaW+JoHXn3ePuCHhUzq/NVMj7T8gakTCN5lkyU71BWN5h4Wy3/KoPn8VwABTQqKHOliuqKrraRW5RtP2x3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfRWm9pySWV119cyJM4tetQffY2MEeMP3H4EVBEsc18=;
 b=AXFUGpBtUwGJsHKV82y6V4i/T33PKtW1qF2sIQSobYEJiBKN9M4Kse8DXBvN9z/nH0eDwZgfA8ZFrRVlWx+14M6GCyhXMRSJd4JuxOO3v80eA6+Nek0l7zwhFinYG3HwoYSqRPK4Eh+7qUJElekzCfqM+uFMCoFHfS+mzLUO0TDJbP5S9Xry0hw+cYp/JlhM8wRR+4IzfZEu3aoXUrQYtq2vSiBT3d4UInYJEtTVn6yA8VmM0Oy8OT9zlFtK/p+Kh/bkNuss26P2M2AC8T0KsRisZx88EE7t24KLkqukdrpEJTfWHPdzCgC2cJwQ6vKeo8pDBnFdSQtY9Q0b524IgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:22:11 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:22:11 +0000
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
Subject: [PATCH v3 15/17] arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
Date: Mon, 24 Aug 2026 11:20:18 +0900
Message-ID: <20260824022020.2812810-16-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed2d8e9-ffa6-447b-a510-08df0186811a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	l+M9dSuiX6czRsqoeQBycYdmtScKwfDjVdILULbqviczZ1D56gzwHSSHBS4vO2mpf3PfuZL5Z6xwyCQv5XgKFWWLada2D8C/mUGTxEf/hmQwMi3rIb+vQ/tP1q3DLKDPph1fmfhfe6n2/ph/9XNWab2wh0qTKInm1aVEZ256cYY0YKeAQmP+zsAKSlg2mf/4eYyFvn8gqwC/7GQLwCZQQm+NxKvOsy0/ZmcekgGifIebfNa6XF2JwrY3+NB+6QM/OyWZcnGyLeIT8CYzcn1fEXNvEL22zz3Xl/jHroXP6pxQPgl17qtMJ75kxGDWHGMUuk3wKB27CNOyc4yhwCv7T7ro3xLkQnXPkkRfllbrfykWJkPEZZur2ZDIP/X41yJhjolyQo7fKjpgf00l94neBhrIAZ0I3b4BpSzRKu8NJIp9de1Eksg0sBoAFe0SBerqCUXykGqpWIsASROrpjhCkZyl6KJ3OcF4cMz31GSVTk1Wv25dTQYJoDe67KnVX6/RIlmwzh8XDj6dzNCz0wNAavsLepANX8G3X6oqCpsR4Y4ZdZyJM7qWd9BtBjjhPWxq7tFx+qbg1seKOnD+ZAhv6Sy0ZE2vs6k6oRJfIT8Wu4bdg3YkNj3bRtGrjSld/SBRD4OU9ewk8/ZiSvEq6ssnaX+M+ExWcraBTHfNO7dcyCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fMP8LbOhDyQr9BtRLewgzxWxyAf+26VSUqbyHxSNhckI8QJYFXr08TzXPJ7I?=
 =?us-ascii?Q?VGgXvZSqkFBYN2F1M8wgGgR9gyJVIEbkWpV3Z3XVV/ay6ITcCnnr6AlFRlhv?=
 =?us-ascii?Q?HNZqaEVwklHV42o1ocshx/ry52uJcM/XjBsy1FlttiP23kEYKYZRENA7QU7e?=
 =?us-ascii?Q?0a3ftNme2ILo9ezlEH9bxdq/uJvEng9zaBI41AR8kQZ8eoBtWybqyUuvAAe3?=
 =?us-ascii?Q?W4FDy/qXDm0HbH8DRhz2BeaGYyXhX5fS6F+xt18vSl9zDWE/KkWFDN00dx31?=
 =?us-ascii?Q?lgagi7zf/tOgkda7wqYItFu9wxhJe73bk8AGRcCTyJ5WRHk2opFgaa5YYFqk?=
 =?us-ascii?Q?Dq8NalqnzYkiG07fks01TyvjkW67bZzZ2majqqAyrI25uz4bJ2Wy6biHOWFM?=
 =?us-ascii?Q?m1PFIHem5rj/AZkU6+yomRMpuCguo+rEy4VtR8VRfalmKYpIGN5AEmoz//O5?=
 =?us-ascii?Q?WR48vwevyq5ljLLH8zE6D+oisLCrjDALuPBN0Zr5UmG6jXdqEOP7RodPkSAF?=
 =?us-ascii?Q?j5LWW4PsipbVvviya2bQ8bnL/J0uznHlrDWetsAdHdzwwAAal9cyY+z3+txx?=
 =?us-ascii?Q?d0897RErTJ08JQUjjXk+7eHCNX5W8Tv9cfFRf+mB3WDQPy31zuo18zHqxCEZ?=
 =?us-ascii?Q?+HyRQo8sOse4eTC+fKXOTMChRiOoBoaOvsdNOUbKeKtcJmM5wOnqUmR8WK7z?=
 =?us-ascii?Q?mcLA0dusMilrPpQz/t56r0C2CvtiDDpg3ajmTbOZ3ldDR3JvxtUdVMz7M1W4?=
 =?us-ascii?Q?7T9tw5RRw02FC11saz7lYENdHjLCMic9tex/oKCFuojcdxwyq2glV1wQqe2c?=
 =?us-ascii?Q?jJQSy0R8bSRFg1KPmjJjDGPYMX/RuJWauh8HUwbNn7Wh8Qy6waj/nXy9n/P1?=
 =?us-ascii?Q?ctxAAa7AqJGXgFWtXIBGsmguGd8RxzvS+zxIcv1ZluXqAoZ9GNZlRxRgRYPu?=
 =?us-ascii?Q?5GTEgU5bv8TnhGw2FlBLZ6OnOWl7vTKKpBEHRo4QM/kJLoKhJqvYvz+r7qyr?=
 =?us-ascii?Q?rdAYW5vEIKwWcRtlYU4liKK86sZfJq7yySALq7MQT9jJjcZuV+FQ+19p5aHh?=
 =?us-ascii?Q?6u7Fg4d77RimO3Sz0eGs9h8VEwWzFvE/qOPxI3CgIPxjHk4y6MGrkK5nKpwO?=
 =?us-ascii?Q?YYr1NNjTqGE51FZJMozVs/u/dikdr7KBWaYgm1DLvui31ZJWMXI35+U4ARlq?=
 =?us-ascii?Q?MA1iXUzJDUOM4XsLwxoT4B5+Zvedw69+LJbwEmGUh6eDZWogKu61WGK2LFJv?=
 =?us-ascii?Q?XCKlrGnPT2lj8UNqts28oV10+U6+Gl0gvSz6Dw+T1TVGR5O1kZQZnq96yDsw?=
 =?us-ascii?Q?WNvFWHT8Yhtneg2wTUTK2jJkx6K1J5EDvJsfGoqFXW6UMyAP4Nr82jxCgUMf?=
 =?us-ascii?Q?wU/zwBa7fGF3XANpBZKXANEQaMzLzY4mFokRriOxusC/QCawjwePOW1jZn14?=
 =?us-ascii?Q?fJrzJp6pnID4+EPzP1isTxxJ6ySGJLXQkHxbcf9IhpU1JjfkXplRhpjCm+0v?=
 =?us-ascii?Q?aOhMDqV88BZyti31y7ol9axU36yO1RdL63xLocjtBok8WlSzOfg7byBYKjqy?=
 =?us-ascii?Q?hA1ecywb5i6vNU4PXAt1COytKusz1oUV1rINvb0FkU/GbzOrEmZ4hnYvzRaL?=
 =?us-ascii?Q?btKPmVPaFbIjOCBSFiLiII139/QVpv/oya3EW42mwWRsropZRAojbrtqW0u1?=
 =?us-ascii?Q?S5KVFzx4fBJ9Q/ZV1HTs1pv1Cm0bPO841SbKIkbd8Blt2vf1pd/GOJXz/un4?=
 =?us-ascii?Q?d2qWX/jwc4lVqg3qz3RLtxjVqaA6BAHRZSObHDNH+4IUAi+JD6bT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed2d8e9-ffa6-447b-a510-08df0186811a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:22:11.4375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMeCS/G7VU/VnHstuleebm0NsVsXHYeXERkK7daSDNeb/i1lNBpqhWeyJRLHUpUYxldSqnvgMww97MVDAZGYH4cgiIjjZJkQnjf3tNeWg0MJZ4hPQyBGzePl9o/0dF28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

From: Chancel Liu <chancel.liu@nxp.com>

CAN1 has pin conflict with PDM. MQS1 requires an enable signal via a
separate GPIO. Replace static gpio-hog settings with GPIO-controlled
board muxes using the pinctrl-multiplexer framework, so that the
conflicting functions can be selected at runtime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 50 ++++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 2224b90aafe9..e9d735dc2a51 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -52,6 +52,40 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can1_pdm_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_en_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416 15 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_pdm_mux 1>;
+		};
+
+		mqs1_disable: mqs1-disable-grp {
+			mux-states = <&mqs1_en_mux 0>;
+		};
+
+		mqs1_enable: mqs1-enable-grp {
+			mux-states = <&mqs1_en_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can1_pdm_mux 0>;
+		};
+	};
+
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -284,7 +318,7 @@ &asrc2 {
 /* pin conflict with PDM */
 &flexcan1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-0 = <&pinctrl_flexcan1>, <&mqs1_disable>, <&can1_fun>;
 	phys = <&flexcan1_phy>;
 	status = "disabled";
 };
@@ -387,18 +421,6 @@ pcal6416: gpio@21 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pcal6416>;
 		vcc-supply = <&reg_3p3v>;
-
-		pdm-can-sel-hog {
-			gpio-hog;
-			gpios = <10 GPIO_ACTIVE_HIGH>;
-			output-low;
-		};
-
-		mqs-en-hog {
-			gpio-hog;
-			gpios = <15 GPIO_ACTIVE_HIGH>;
-			output-low;
-		};
 	};
 };
 
@@ -491,7 +513,7 @@ &micfil {
 				<&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&mqs1_disable>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
-- 
2.50.1

