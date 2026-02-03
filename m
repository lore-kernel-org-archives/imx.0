Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E916630E842
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770110056; cv=fail; b=q/Czwee2XT5JJD580tp2J6LgA55b+i6DnDewLOhDWPSh6nnKopPDO/Y2++n2g5UeiNxln7BblnvHXu8MwluXHwlPI2HlydSpDjgrrvj1qi3EzAFiFfM4u42LmlrunHkvLoMUOvtZ6Aw58WhK+gtKqDlQt7WJBcPEFX44DKaY/a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770110056; c=relaxed/simple;
	bh=F0/zQ0x0g4TFM8hrWQXOFDrqxC6olOCxQX4e+tG1CEc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eYW4RCrdFfFDJ9Rny6GuCEGQ8XyjigY9N9jhzghGHmmPr/ClhlCf5xUhjN9gGcpjtv291pXigtTWX2R8pITcqAhanzfy9LJdPggHDp2kIgv9uWknbHl55B9gWbUaJa/4j7VTxIvbFYnSbXZi7meijDdcr3BCjX+CK/U/NkXbyP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VTlry7t+; arc=fail smtp.client-ip=52.101.84.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VTlry7t+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON3CaGeK4Fa+i5tZfEq98xl4DVonjiZKmi5JpBb5pED0aybIplpBtWuKhNmntIyp/0V0RFuZ2tiSz2MeZyHxOtSy6Lrh+5sQtFkwSaA9bH8BvIp2MsvwKmBeW+Mw/ExEdIOaxy29tHTM60rqVVJPwb3teyRt9ghAyHE6nZPeTyAxUaVWOqIkHK0j2mtSU6HpMMmjo2iBdd2lbQrY/fm+oLB3jxdf1F+syt1wtVG4+lq2T1etLPYo1t+VynNNlMPU5SR/jK4fHA8ukRQ0Bt+HgsdbwoAXmXIeMbBDEZVLF6NRsQ3Ar40xudaagMhVCNWeA0URRXr/4YvI3rusqjMYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMXLAKM4ovq+1df3U8CtISeTem7Fnsj6ij/KfouyvMA=;
 b=rTeuDsr++z6Mxq2xktykQs/H53y9RQsWAbXCVG/DHWD80ZjXevhJyF9LwmYJ2HNDShIUo5wKz8cNXtMxpbATf6/l+jYqVjzPv9ZuWWt9ebRJoMJnoMhEYcNaxnqGtJNEkcR3c+bCUYfhxXwX61/v9u0LrgSsxuNc6KrRO/t+2fpSatjIcYa020Vp3Rd4qNEosP9Rt2uYfDUAjX5fctAWTSPAx6xRFs2VVtdksm2nmkdq7HE7woWEWc8zTNAUBZWlFKZ5y6tu2c6J5dzJXUR2KsS5gM+AY8IVGTJdusjOr1cif2TVPPj32VVFgKXdBo9bYQc/fSFCYG9LJb0bySwJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMXLAKM4ovq+1df3U8CtISeTem7Fnsj6ij/KfouyvMA=;
 b=VTlry7t+5+SvFNOyBhuWKaPI4Ar2DHmAApkmwE8J0rE6Kemk3CTYZ7+KXQquufnEjN141UEu+qTyT9vrwKhoxxb92giIXbZfkYOEUvqQhrpJ7fPj7ci+ssxio/4cSGlvadxaKOA4Y0VQR402bzdQGTTIvL6Byh/9ftrVdqg/tqGwA9+kVq5Js3sqe0Yyym1pUKbQolUmdsDzYmH479BSqe5+zYTv3R23iJtCJTcic9Z2Dlv5lSkwWVZbK5nZRHmm6N/f278xhW+UXAOcndnl2fRJiw5oJNRQfyIvbPCA1SdH9GbJoR4F5frUts6RdIWf3nB4zQ4rWppW8rOumkz0Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by AM9PR04MB8132.eurprd04.prod.outlook.com (2603:10a6:20b:3eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 09:14:11 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 09:14:11 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
Date: Tue,  3 Feb 2026 17:14:59 +0800
Message-Id: <20260203091459.1595474-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To GV2PR04MB12102.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12102:EE_|AM9PR04MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 208ffab6-2512-4d60-d92b-08de630497b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yT9pOsUxWgeJpBKMliozMDEAY1xPJNAHlyRljsRcg5NZWWT9wT9Jx5s5TR8m?=
 =?us-ascii?Q?pLqBpbww2JYR6MNR3k3xGqdZIT8nFZbDDL1UYIfeg1X7bKh1vHjxCmTSkjaC?=
 =?us-ascii?Q?tWieQGqep6J/X6fDlpq0+IYazlpWJ4EtvN+0aeiiU9Zut53a5HWkO7L/c7eg?=
 =?us-ascii?Q?+KXuNoTuJtLyERByhhO/F4m+986Y6lOQwbVKeXggoPnKF7/Mg6olEiJ+TVv+?=
 =?us-ascii?Q?PLCPrhqPOooDoCBEr+4gbw0jAeLhyVbEbV3H+CEHGxKoesMY4bn9MYS3+Enu?=
 =?us-ascii?Q?XHh0vTUig5DXpIO0Yi0GB9TwzZJBkN04nutsuBSH7Vu6xk0F9LClNcBcYqLK?=
 =?us-ascii?Q?SCOVxhr9JcYN2nh64EJF1wrzMmjcdwmsYq8FbDlTDpv7NeIOv/XW6xiVU6hr?=
 =?us-ascii?Q?zctGU/niOwABECYSiiB5zxqMHKYvjKAKAJfg19fXPAAZvq9DWBHqkGO5rdqq?=
 =?us-ascii?Q?wPT9n6TdJtEZPY/L9VOc/OD290rQxRs9jTssFyr6KPQKV7q7WqhKU8zxGdgy?=
 =?us-ascii?Q?bU76I+sopEWoqP3qk1fwLrKLplTbncjygLy3DMhZAsRdJInVbcFtaSt8I4st?=
 =?us-ascii?Q?emz+n5ioBsczXU1wPrQqAaHCOrU7gsJ0hpnk7oI2BjTGdnwxT4W1B79VkKWC?=
 =?us-ascii?Q?0QTknWD7HGklBFz2XpL9tJxL/mz67Ymm/m/X4L66stSTDjHZM8aukXmvSWGV?=
 =?us-ascii?Q?KBhKK5+f3MwsreMLiPaW/9o8dS2DHQqRSCObXW+qRuwhhrLR8M+Q9bvYkfv+?=
 =?us-ascii?Q?ml4VAdn1plzc6tbcOvO9IMM2Qud9aiRM7lo2loJ1+mehWKo7XOu5yT0Xv/2k?=
 =?us-ascii?Q?HG2BQYJNfQI/MlWaW3qB+0WrTOVCqn16zsph5nr4UC0B135r9EsP7razomu4?=
 =?us-ascii?Q?D6khTO7iDQNsaukXWxfsTcDnNeOh0nojzPKebvEaRXIFl+6GieDPVluwQIkm?=
 =?us-ascii?Q?H3ywgbiHY7Ij+vdbNhfqxliWL6pzrt6mCFOb8jK3m3BgMA1uff7Y18hGEV+T?=
 =?us-ascii?Q?JWv2101vhHbH0JMF5ugUxTp7ISNgFEdI9HUZKvAtXgJW1LZKglFTxcw15Brz?=
 =?us-ascii?Q?SnFxjj8yRASaOldlE0jmPCkSm6HRJbernWlJdDTWpZXYK15rhEFzGQdcuHTN?=
 =?us-ascii?Q?DWTmsyVR+lqhEexb03D3jLSEDnaT0C7mHtnBN6vilkJ9NIg74h0crdekWrHO?=
 =?us-ascii?Q?TNVpKgySEzZjbcRsMImDn4H07e2L0WEdRx+tANwKf+SiaHYIqfQYsNIEn8LR?=
 =?us-ascii?Q?T2rVPqdw6qlx/FzgdZUGGzml69HDgrcAfLm+nPQjXXZzqCoaQ1ziPTq1zyMZ?=
 =?us-ascii?Q?BcHb6s5Zlzct/lZylgbQ9QPV0yh9uMPagm1we9iILYhDsYFZHwVhZKec2iGx?=
 =?us-ascii?Q?1/RF7c3Bq6c3pzBJ9jzPPnD7UEKjOHfhn9uJms/84K74A1m34YGcXdyz9+E3?=
 =?us-ascii?Q?2oXpHkvdVCO/KDepqmHUI3ZzOqDsfP5+SVjjZgIdKk1ZdXTbgKknzA/7fEi9?=
 =?us-ascii?Q?kuRwR2twKUj0ZCl9dsrvjOR6a8EuzxVbOU19U7pDUbnuJNo11DnIHm+ABTWt?=
 =?us-ascii?Q?YKe/sTBL3ge/+eCtXIVCAKDYsXcGj/OukYhAlTeirx6+N1K2h0IlNIrQM1CK?=
 =?us-ascii?Q?Y8abNCyfj+BRsy6z5D8H3+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D/Brwcw/lozEmIU+pj0RyGPPhkEdzLyzArTfv+1yxXFjJYUBmGvwh+TWoSK6?=
 =?us-ascii?Q?V7MVQlAdmDSwbVoSGmUNE8icyvA8gviXGZQokbHk1rugcmyM2hrOI+2hxnKH?=
 =?us-ascii?Q?bK+thazGm+k89ml8yEjRtwDxcZlcLJvGRcJa91pL33ngE/wF+U4OE/LBIl1J?=
 =?us-ascii?Q?lZdd69qZGlWs53JXPvbEhNuGabhQ+aFIVf1xuiBWyEm/QC+H1cjfXjUtYw2h?=
 =?us-ascii?Q?P2vUhA9eK+eKM5SpnT3jl4j7BSZrrojpXVO3VT+Je2aLPHVc1EDXSdF1x+WU?=
 =?us-ascii?Q?a/LzafazAZxDQ6RbsQF51cCgHp4YE4sfq4hn/3nVMtuUmeYJd1GcwMlYjXSK?=
 =?us-ascii?Q?f4PR/VIBDUkYlr/EExAa7v2ngkLTuxVJhauNhR43ZSttGGFnzplUhLWiFri5?=
 =?us-ascii?Q?SLtoX93p3t3r0lCI6avpFh5s/tGv9BoDsvMj+AK/nTXRT1wkeO4jgo6slB7Q?=
 =?us-ascii?Q?9IarGlQ6HPQLIQn62gq02uAVj/MOEWiw+BH41WaR58/2pw2g307yRrepJBqo?=
 =?us-ascii?Q?Gr3o4rOQY6wGb6/RKwQcRkWW1MbW0/7jgpuBHZqpKPOnFvkWxjWDDPgc7XAU?=
 =?us-ascii?Q?qRJOT8RYnkWrUKHCMlpUHgkHUwc+m5gmGR5QVrZjXF/K9OSejSCkl6iSXgEG?=
 =?us-ascii?Q?hw3iwsDPAKMbz8tmaZ4YJ6yq0TfPVNw4f0mBV6tkwY/c3rZdOLVGD/Ousg9x?=
 =?us-ascii?Q?Pf8iXXZ22xfZic9+MUDI1mD/6dywdDKLkx07JXTo45+mYbiBwDtuLHwgOW3c?=
 =?us-ascii?Q?CNDQH4jonrgJEhe+3RLOBZ5TXoLK3fG+r7gXYMxOaqJAQkjQd8/zrYg9Dygl?=
 =?us-ascii?Q?GaCUr/Tysy1mG4YJcvy6HVizniYOsAFuwWnwxJyTcs8JBxUobk2zWSWu03rH?=
 =?us-ascii?Q?U24AZf0XMcsbSBu0mdf5iqG6Sd3GsgVlJ/FF6JIpn+jQX7OIOOcAtZmEuUDu?=
 =?us-ascii?Q?3NWn7z6snIenSRp0Xz6jJFWwBsm8QJ9AcKVLJhSycw2AyD8CyCJzgOIm5nj3?=
 =?us-ascii?Q?nEqDyHFQUuZIiz6Rk4eAwUHgX3XfPEJddy1FIMFCwJdhFDg3V2Q21aE9OvmM?=
 =?us-ascii?Q?IyRBhOJiQdU8Pj2R7o8Z9M+eQWRLEIjcCdc01qU9tJfTq3WmNxA7ES5iXwC6?=
 =?us-ascii?Q?rwDo7M1eK+F87j4Dh1EIuQdzDzeQGIwGy8Lj/w0jK5QfOpVgG7SHr1RuxrgV?=
 =?us-ascii?Q?HGNOM3fKU9rqFipQzlofEvwHV2u1ni7bJ/iaidaI/Kx9cZxKhxJWz9scDNtN?=
 =?us-ascii?Q?3DhcXIcQUtx244YGZQjAVTZ77bqCU3b42ee4DOloS9APCiyaHjbo92SrkZlf?=
 =?us-ascii?Q?mxH/8qUbb0bqBdiWD5FnU0ApIiJOJzqCuSnTxzO+ImSFS6bJIPaevJoUH2Wg?=
 =?us-ascii?Q?U+KYqaucDOK8Sxb53nI7Is/YFHUQcL5N+gBWpTtD5ocBujfxdIyzlNW5UJEW?=
 =?us-ascii?Q?/r2xGifntdzj1Fw3d0g82OEgOS2mcBhEGqS6K3+fGYTFfbdTR0nNKVobcM6Y?=
 =?us-ascii?Q?ENY6/Y/Wpd8b5DfIdFWOvoFhbaSdCMjrdgTGG7ivGnappeGjpVoBvjIFuO6+?=
 =?us-ascii?Q?0M3s2rtlKj5wcNmQWzG86sGhjQn7u46h6OnYvLF7q3w0+lj2vTvCbZpAmNos?=
 =?us-ascii?Q?E4R4ArNZPs+77SHxxC4F0Rg9/nDx5tyfpodnemUzMFxkMnIP4FXbmkkoeTP/?=
 =?us-ascii?Q?aioOtqWBYlGre2pm/CGpqZsnVuNrIsMBEDj31jTMheBDZZRp7T84OgNvcVXH?=
 =?us-ascii?Q?LppdnxngTQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208ffab6-2512-4d60-d92b-08de630497b2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 09:14:11.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWrKfW99e7+x/9E9BYTrTNDf/pvQsOAkBDYSEgYsz1Oacg2mXDg26uJlmF+f1i5JL7q8jyiO9OxNYqB2CZA1lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8132

Add usdhc3 to support M.2 SDIO WiFi on i.MX943 EVK board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index f54404c9bfc9..8f4f6875d036 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -20,6 +20,7 @@ aliases {
 		i2c5 = &lpi2c6;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
 		serial0 = &lpuart1;
 		serial5 = &lpuart6;
 	};
@@ -54,6 +55,33 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * M.2 device only can be enabled(W_DISABLE1#) after all Power
+		 * Rails reach their minimum operating voltage (PCI Express M.2
+		 * Specification r5.1 3.1.4 Power-up Timing).
+		 * Set a delay equal to the max value of Tsettle here.
+		 */
+		startup-delay-us = <5000>;
+	};
+
+	reg_m2_wlan: regulator-wlan {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -145,6 +173,12 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 		device_type = "memory";
 	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6416_i2c3_u46 4 GPIO_ACTIVE_LOW>;
+	};
+
 };
 
 &enetc1 {
@@ -760,6 +794,18 @@ IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
 		>;
 	};
 
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO48__USDHC3_CLK		0x158e
+			/* Need to config the SION for CMD pad, refer to ERR053138 */
+			IMX94_PAD_GPIO_IO49__USDHC3_CMD		0x4000138e
+			IMX94_PAD_GPIO_IO50__USDHC3_DATA0	0x138e
+			IMX94_PAD_GPIO_IO51__USDHC3_DATA1	0x138e
+			IMX94_PAD_GPIO_IO52__USDHC3_DATA2	0x138e
+			IMX94_PAD_GPIO_IO53__USDHC3_DATA3	0x138e
+		>;
+	};
+
 	pinctrl_xspi1: xspi1grp {
 		fsl,pins = <
 			IMX94_PAD_XSPI1_SCLK__XSPI1_A_SCLK	0x3fe
@@ -802,6 +848,23 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	/*
+	 * Only enable SDIO2.0 mode as the corresponding GPIO pads are 3.3V, the
+	 * max frequency is 50MHz.
+	 */
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3>;
+	pinctrl-names = "default", "sleep";
+	bus-width = <4>;
+	vmmc-supply = <&reg_m2_wlan>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &wdog3 {
 	fsl,ext-reset-output;
 	status = "okay";
-- 
2.37.1

