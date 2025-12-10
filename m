Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023088.outbound.protection.outlook.com [40.107.162.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59BC26FA5B
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380024; cv=fail; b=HKhHVScd8meKP004gZJ+CEapMXsLj3yqZ3ZLkfPd2uDuat7ZwWM+bIg9jn69jC5/T7Wv1k5io2z9AabesndayNa4gm3n1agHNn55bWKZIhG4EG08a7vJzw3SGcCHjdOXJ1hGq3nQujDkW8GjyIwt1CBMoivgwsVK+UifQXo6yP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380024; c=relaxed/simple;
	bh=U2v18UmYXyxRxgSLu2UXhhvB7Fp9+l3tnd1CGMr8Mmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wag049C4YFf43+fp8N2NukD5/b88zxlLqHiBGzCmzJ7abEw5PWBJGjAo8Smf0fXdZWxQYmiS1Hbl4d1ViReM9nWfe1kZdtBmMxLRB+ighv8QGf2l6oCxmSlGTQdD8A/ctulS1NQYowjNAbOkw2CrSBLgVK5jwh+vG4o0vYFKwWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=qgZo2Y6f; arc=fail smtp.client-ip=40.107.162.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="qgZo2Y6f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wERDab0d6sbgM5PFE0h9nFje513nhpTcvVovT+nymTqPiCigHJRR8kyoBquonPujoqZzfXsF0NYoHbhR0JHZb/skzLVvJPWDrRg2conSqn8gsdlkN79fH4YLUKPvMO2HsAkDnPkefovSL58sCFp/ywUoIhRQwRY5CGfdfAs/VnUV8Fz/f/S1RF0ilyvamms+suTVPUZrrbBwQ0J/l1taImwexaklMtjGLdi6SWEqLCiljhEpCtDLF2TbtyxOA1Gu5iaDga0rjs1zbUS8lvO5TK72Pm8G+PHEaAMEuR9IxLDG5uEBSkdOIynu4GUOuEgNzSkRvkzRvBPSXqb+uuj4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLiAHdwLrrTtAb7WXEO2B+WkLRD0WKuXCR00+TEvVdI=;
 b=Njb4moHtGCPcgLDDZ+QPqkkLVdTdQTm07wVKzQt1FT1aiF/X2tdVtPvstpY5kQAE9zV3vLuwZKnquN56IM81mNMOURn9BCck3JAqnzwW/7B3nCLjYwqinIxs1tHFSpa0GZ/ypPwK8Bsjzv6CQS6zArtl5GksCVgz1lRF2vf5GD/B522PCIpQREPj5lMew3UggrdsfeP3oHlN48qyCe6Zq4YZENareWYLeeOWsAo6zoPEg/oF8sDt+/KbgdrfOKfnK8aPywTW7A11cnyJ9UT0UPDeVMkWUI2+4AitejxM4SkMJct5SjVF+NTcCz+SSbAwfI7Z/FEnhM2mJPtPbto3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLiAHdwLrrTtAb7WXEO2B+WkLRD0WKuXCR00+TEvVdI=;
 b=qgZo2Y6ffNSiPZj3+P9jlFks/puP+zkMjtkHMgJWptbTcnpUotpFBmzUYzGQNUHSuNyISSmFSNDpxdc4pLONDdXuL245VQSZlbTaTFi6xl/DJwL9o6SoWGwJd5W5BDvNdi6E00eNX/o+gL8VwiFtoVrD2DF0EfAk3CbCt2SkXFYeGUW0DKK5nQHxMkEPsAQgh0UYf1J0iiX2/RwSRjiTQK4x4dTL8zDrlfEkcwiiVeMLHHtUyvrOc5hBi66Uuk5NlNIB+zvrsh0gCPyAgdM1Gv3jmm7pLF78+Z/GAKFfsV2sKqqCcoqGiMqpAk2BYLOlTNZpwJPvyyxMm/6UJLjNTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by DU0PR08MB8347.eurprd08.prod.outlook.com (2603:10a6:10:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:10 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:10 +0000
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
Subject: [PATCH v1 4/6] arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
Date: Wed, 10 Dec 2025 16:19:56 +0100
Message-ID: <20251210152000.42265-5-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210152000.42265-1-stefano.r@variscite.com>
References: <20251210152000.42265-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0032.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::8) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|DU0PR08MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1d5810-2959-42b9-61a6-08de37ff9b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cfnf3x+noG1OC2D2urRwRJYm24S3GdurwYujVMJL0HqnnTdjlcl+kgdNMMl5?=
 =?us-ascii?Q?fJ0y4pCrKBlHSm8tQrS2LU2CPXPuZ04L2sNvz6EJYAXMYd2F0mKBW/TzUReT?=
 =?us-ascii?Q?+GUF/Uxfyvmq5boTYyqy3rMYePVsqZmgF+CAuJzs3s/IHbqoiYuB1aUvWwSc?=
 =?us-ascii?Q?S4lPAu0qKOoahyTwWyDRm5K0ffI20EsiKJsyIPBNC+dZX2oue3ey6ENCFSdf?=
 =?us-ascii?Q?A8VOpIWZ0rCnS/Av4wSS8B9aY0+zBH5fSYb6N0CZbdDKq+hY9NM4JDlW6QC5?=
 =?us-ascii?Q?7WXkOOpPlKZwR2ARTPRApetuOX0KmrZjZpw5m+6jISYMx3tcC2r+WIJaIhAS?=
 =?us-ascii?Q?ReasUQ8BbRjfkBySfu07xVWogi1qkFpAZnIa6S4c0BQCKyfJ+SJ6ezP4+w64?=
 =?us-ascii?Q?dmrwEfuPLyyC5cDvt8qHSA0vZWUeB/5eyhTMUCbsvLIAl5peCURNK0hTqqjA?=
 =?us-ascii?Q?1BHTvRQ+KLnNTYAwd017bQK1V9SrC2D2nrhMb4IFkyGwMk8F24ra7992rn6r?=
 =?us-ascii?Q?eyrk66O6QFLWUUvsfL6CY94+97wu1Q1YcytGpgZkPSK/AlJGuEClYqj6DXmW?=
 =?us-ascii?Q?ikdz37tPsqJ3on6496gIs4ad5qv2FaWIciQJk2evn9+YI9hMbzOPwm5cNq4p?=
 =?us-ascii?Q?RMZhCS/6H8LdEunP8VApTO5hd6BAUy3fxFEAxhzHonAZmiC6paXjs9JcYtBH?=
 =?us-ascii?Q?rcD2xcOEfLc42O7e3eCH8GOHlCSyW7b4SoP/+YEjfMDPe3QM6LRerpoMNqJg?=
 =?us-ascii?Q?3jUb5W7WNAiCEy32McE7yZqteRJ9tEoExOSt63PZzfEwyaQkuHVJG6Tid6TM?=
 =?us-ascii?Q?DvhfJtSoA0yHAU6XiaGcSisCn+7QNaTrRpAi25ARVO3vcJOWp26q3SHpRu9e?=
 =?us-ascii?Q?0xBN+6IIxF7m0zPAp/NKO34Z99bFRAGhlsaNCz0MX0j7fPgoPwZiovYEJFWU?=
 =?us-ascii?Q?PD3W8j06gj1sPBR3DTQqjrOKCh1NpB9NTuoEUdQs3lf3JtsyTP24GgrG/NQt?=
 =?us-ascii?Q?BQn5/HYts+Ub0oTjuet9QBnXYzJsNcRBgdFjErvmbekxTCPc9cFgnrwQZDuP?=
 =?us-ascii?Q?Z+PS4/H3P9mAsCCGKd3u1jtixwFDmRym9B8Nx4jmtjN/cK/7OlBGxGVmJ3Ss?=
 =?us-ascii?Q?22uZj1YgrSHkr7yKQhe59sEOaKUFHVf57OUl1l8uc0UIPnE4xdPpgMj9zgY6?=
 =?us-ascii?Q?Auwx3yugrurrVl5nO5auuGXz3SswStL7cV0o5Li57jA+7LLwTfyTze5lTl9g?=
 =?us-ascii?Q?+5EmzUqgpXDOhy3KzXNvROHnDuGq+kZxz/Jsogbo8KS8yRjwwzibiB9C3mo9?=
 =?us-ascii?Q?+iJ1gmfrlsRRSv5+h3HZpZpTIF13TctaMe8gCXrVzeq1+TdyCTjIjrnB+nq6?=
 =?us-ascii?Q?4/sF1iQH6TSs9VDrEIqoyPzQgD/cVG393nnUbAC8/+dhC+By3Kel3PyxISH/?=
 =?us-ascii?Q?xAiqK1MaETzdmGaXQLzyPNADrMrs9bA6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PKvtT6iXiTevzA3458WB8dlq8C9EZ/cZTjo5g3reX1ZyV3uuUKzKQxJltmQA?=
 =?us-ascii?Q?EPkY8frTHd3DDZjFC05wBXpMjkZdfnqn20fsW+qEqXOsIj1FBTWWeuM9RZsJ?=
 =?us-ascii?Q?AWpUdlHIZRCXIv+T5JY/KQv+n82OiJ8azInVC7iceSqVn/OOL0Gc0PN7EbdN?=
 =?us-ascii?Q?kOlr61k+JK63XsBdZnAgoFa0D6rbKPZbMlnKmR0dTr12u4qu6HrJ5BlrgbMZ?=
 =?us-ascii?Q?lrldkc/7H2O5c+TxXknAPOmH9v6zlVXteg/08JjF4uB4rJI31M8DXw1zQOYm?=
 =?us-ascii?Q?TL5B7iTJ90XCcZa5BzQ7HrVDUiLfRn72irJfMoRuklWv63YpDqRd+1Nf1lKP?=
 =?us-ascii?Q?vqptKb2zo74QWD2fls4jIq9H8GaNOjgQgl4Vuch03/F8AkkScNg/K/aDhbAE?=
 =?us-ascii?Q?Ie2CmTDrOv8gSAWOLp8/2bFLRjmrVIrvawnCQSVxsTl3DGrDXfqE++tk/xnD?=
 =?us-ascii?Q?Tj7KkM6zhMRyJSo8H02AAItUPfvjf1QfJ33Bl2/FC+YcGQRxCucEC2VEoeOq?=
 =?us-ascii?Q?8OhEgWjbuyGOCbh5wnxDWH/2xRgf1H72d/ToF13xx9Hi62zr1nvxGRv5ZhQj?=
 =?us-ascii?Q?eRx4y3AkCAIDENZy+CuBAOmtcwP0YgJJnciUHapr4JloevwPJ8ctcfqwmy9m?=
 =?us-ascii?Q?p0rPOvI+RS0Ee6DEtqdaVl+mbsObbIYDLDaAj38dh+qpx1hBKTQD4sXt8TUR?=
 =?us-ascii?Q?ul5fUHvNxl1Lk8Psze//ck7KVcSiHLUFwG9uPFrAf0FwFKLyRaLWa+Nl03Ot?=
 =?us-ascii?Q?LKhu+s1f8R/CmCznxinQFwiAoRjPDnPmigHtO8kqsuJJEBcsxQ3iiGTACPg8?=
 =?us-ascii?Q?mn8CKBNKDKBGKKmSXTvBkQNytCpFRPHz7dCx7NT5i73LnltVz1DjKX78Vrv9?=
 =?us-ascii?Q?auHiIC2YOj5dPL9uq6C3eZvvbp/KCvUriNyX9MJvER6ghxIDr4iPmAJG3szI?=
 =?us-ascii?Q?fKrD+GKZs1lKpIJsV+t1UDZQwax2P1VothCA6xrT8R8sP2LeH8u6FbTCOt/f?=
 =?us-ascii?Q?aIjXOLcDYVPguC47nWtoapyYbvILtnx06rq3JqWa0GPxGArEo9o/U0dXCG5e?=
 =?us-ascii?Q?tPLQuE7+iHLBEtscX0mmM6dcRFZc4YXz5nbFiXLFsSIaXU6gVsyomMmf+mx2?=
 =?us-ascii?Q?LHXlEl4MwmZOtc7m16/YJoPin3PPZQnYoQJGzjhiv3c9aO6Uv5QjG7rpoA0H?=
 =?us-ascii?Q?S5OgXr+VHLjmIG1J5jPtm1TX/32o5jkRDri8RMw2RfFk3EvSnNj901rFh35s?=
 =?us-ascii?Q?q6Gnb5HdUQeqy6J6rYo0tXo+uK8od4XfRkMsDkRD/VD+Q41Iz533x8GOH4QD?=
 =?us-ascii?Q?OORULuvEWM4QnEwHRhgKrfFPbJk+eGcoBYvldNhLBxM7N1w0nKG/IgPtiuCJ?=
 =?us-ascii?Q?8UnKmOQqmq5d9QxoDAz1ig6QCV7oeEKm+6aYNdv/+FYG+k/RB3jQG68hjNjE?=
 =?us-ascii?Q?NpJi0fRbefpsOsqNTsviSgHr6yz9mMUf4ZvpoxW1S1fTvPjciRLSJvbbb0Nk?=
 =?us-ascii?Q?h7/e2gRJW6cc6imiIsvsj+MmUo8uNxDjf0dNFElrNRueA9GHOLAvl4mFUweA?=
 =?us-ascii?Q?Wq0MIeUHWiXGoDOgPl9mzWnAwDPKruXSr1eSkJot?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1d5810-2959-42b9-61a6-08de37ff9b77
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:10.1235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mJ9efmbm0iY8D2jhcnK53+IcizSAwoj4bSVOBsTZ56bge4KurwAORls9gHzxFPpTh6C5F3lm3H0l/DBl2glSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8347

Add device tree nodes for the WiFi and Bluetooth module mounted on the
VAR-SOM-MX8MP. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 5bba91dcef17..e7f5ec10cbac 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -21,6 +21,15 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+		status = "okay";
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -202,6 +211,33 @@ ldo5: LDO5 {
 	};
 };
 
+/* BT */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_bluetooth>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	non-removable;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+	status = "okay";
+};
+
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -222,6 +258,14 @@ &wdog1 {
 
 &iomuxc {
 
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09                              0xc0
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04                             0xc0
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
@@ -256,6 +300,48 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                          0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX                          0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS                         0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS                          0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d6
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
@@ -309,4 +395,11 @@ pinctrl_wdog: wdoggrp {
 			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B				0xc6
 		>;
 	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08                              0xc0
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                            0xc0
+		>;
+	};
 };
-- 
2.47.3

