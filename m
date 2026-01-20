Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94B19DF4F
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768871981; cv=fail; b=GpIRLfdtzjPkJ9AB5uLQKsHQUMtoZuGNt5UaxYCFwDn1FGIKNbC76N9pgUs4n67tryUU099iMnhryz74V3/9XMnXQwYySAhRLDLEzpfJzOkFo4ndG/z/8S8+Pt922X7pcFCjG/4+GFSxOEF+l51ZYoMqhs5FgOtoXbQ4QW+pOHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768871981; c=relaxed/simple;
	bh=8J+BaIWCEAR1PYVE0dFdaEfN5v0T1G9chLb/IAQAY30=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Kx7w5AtYxWmLd/Daovu33kwvT0dhHNj7wFslghzkJgqwVoXIFhuw/hp0Vdoj/QWCGPrd0o114x3KH/FxPd5aO3bcjjV4eX304SPXMjjO6AnLrkmvCAYx3+Tr7UW1cEEvti2sGi6BvIBMn5zWkBtAAFoh90zdhu++QQPQ8ecLRrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WjXmuvpu; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WjXmuvpu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgT5LhAcc/zcUC+8dfXxpHfaCZaQMajHmdLJpIjmgxBU4pwleQje1ocwbkU++dfyMHCaVod90sMPCUW8U6jbIhkVGRhfCTDRKuUohoS+R7zcc7mp+uqFWRwM02U4xz3/3CSJEvm6YQhbgkLoh8QEVEuURxm5FfJankTdtdSrCGfSCn/3EVRlwWD7okD2yiEk7EpN8sjcJQDPeeVOXTpS3X9Z3b2QTxMFvADm6KzkVGKaKmzSSsAWlxDS+u2uXP97b93N7SxYWKtJeQAACnJG1Oxa699FOK9LyTVbGcpi0kJx21Y5pcb6SAxNK84izOIT9yOHUOEEMMXrelfm/yb46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG1CGdSmsqeHjUmZjRX7RvfeuquzW+W+NGIjZ0VHFtk=;
 b=XHjFf2CscmxyZvndgG8x/AqvkjYW0ALu0Pn7HsAgzLzSjb37A6wEw4wj1YGJKgzEgeXZxM3yuzfKm/dycCXB/u8styYw4dXrSCTc+klhIVnBYZ5eU8EFLaHesT+hu7YXFvazrzKpIomyGX7x8+rsUt6TdGW5PMvdyPd/W+GfYX8E97kCq2WBk0Alz7Q8u3bXO/3mWJxCabT6KATRSE21teJyKCMF+uemQ6yB+RSaWWUPV4xrE/km9SlR4Z6BIhNFgJb1H4vC7cGPocOzXdxqIZ5FNZrSlCZbA5RQNPUYLGJ8DgZ9SXDFkzJ41YrbBtIxOhP0cBOoQUpndO5D1Kceaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG1CGdSmsqeHjUmZjRX7RvfeuquzW+W+NGIjZ0VHFtk=;
 b=WjXmuvpu+8RCzvZ+7gJIs9WeHlyWGmNaKwqarBfcOGZdZVhSSjjTcpXyeBFbpR8iTSJ7AqEWB11c+Lnwph08DskrGPF3h+AjSPwXVWUBc/+46UHmz4tPE0yL++tu/2SLzU+AxAIdZXU6I5YQrZO7OibIvVX+gu8e5mrCpcED/Hzuk2FAazpPn+190BncE9slcKy9iu8umg+sd/y5k2IlAFC5ed58yl872NiZtBNhtklufmgbNJvXBIRj2PeJlz/9efQvSfeVp5mAC8vIWXGVjbWiywnNcg6yiYT3xT5jpsvp4Y1X33R/zx4EvbbbgA0ic9aPV93+tcr/wyNjsvedfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1SPRMB0132.eurprd04.prod.outlook.com (2603:10a6:150:8f::11)
 by AS4PR04MB9652.eurprd04.prod.outlook.com (2603:10a6:20b:4cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 01:19:36 +0000
Received: from GV1SPRMB0132.eurprd04.prod.outlook.com
 ([fe80::39c3:5ceb:db6f:8add]) by GV1SPRMB0132.eurprd04.prod.outlook.com
 ([fe80::39c3:5ceb:db6f:8add%3]) with mapi id 15.20.9520.006; Tue, 20 Jan 2026
 01:19:36 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] arm64: dts: imx95: Add fsl,max-link-speed property for pcie-ep[0,1]
Date: Tue, 20 Jan 2026 09:17:57 +0800
Message-Id: <20260120011757.1387140-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To GV1SPRMB0132.eurprd04.prod.outlook.com
 (2603:10a6:150:8f::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1SPRMB0132:EE_|AS4PR04MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ab4d8a-4954-4983-295e-08de57c1f96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cos4ItIr1WVCgPaEGf1wMv6hWAA1wNDhrT7XaD9PLVoDm3r858wg8y3f/91Y?=
 =?us-ascii?Q?oir3iRWncoCwnII/w2t6qx+MbTH6rc68CFgjaBW3VwZn8lhNCpvWGShWDygW?=
 =?us-ascii?Q?yIN+y/nHei62CYiS6zEm+o5+Hww/5RhWt1dYsWikQZ1/RGSQ5ydc91pkT/n8?=
 =?us-ascii?Q?0V2/SOGy3HTolFb/rnP5SaYTY9NptnaX5WUkuNMnD5xkvOb52O0rZj3DcPhX?=
 =?us-ascii?Q?eRPsbqP8hCeEjJcZDQc47RUPaibiB/j6Unw2/Rn3qBrHrBPKhs06QCRuEa/Z?=
 =?us-ascii?Q?5+Pi76MlI2iqa9A24qehxJGdKKV+QbrinzaOBPrcu7LyYkQlKVE5yABpa8me?=
 =?us-ascii?Q?Xf3KzZljv3IzFIJN1FoXn+pnqgxaL7p9c0KFj2RW+8Jq/nGaVwolAbcXDWvR?=
 =?us-ascii?Q?MZTFM+p2STlUwmYC5SC0ZFf22qfQvZY/LPQv141TF8yqswRNtB4J+HZEZ7ZA?=
 =?us-ascii?Q?j1705wxeDkGTCpmEIIAuS23XwkR7YiNBfUa1LnOG4DLR32oQGPisdOf1/UbE?=
 =?us-ascii?Q?0gXR3RXi5pgSiDtcHEGv2HJhCcxOn8tSx7Nd7zI0ykF1cxADHvxcx0PmUCDA?=
 =?us-ascii?Q?RWjHAmx8p9IAPSKNmd79Sopz9zysPRrgKrjs+06jn5+wHlrxQWW9w2V/ad3I?=
 =?us-ascii?Q?V/sxbzBLwZwsTPS6xQpxNp6PyfZELnXFy9cAfu6TCdgHlTH7iZFh10q1M9mn?=
 =?us-ascii?Q?JaAMTKV8KIvQvjJXtBGQeqLP7HnzvGPAI0RlOyUJXfya9ZXXDiZT2UNHZ+Ll?=
 =?us-ascii?Q?0SZu+1dxxbhtzKDqnXvTnoKxLQ60oxDEd+mWWL3mZD14WDYpfzAwdgcLO44A?=
 =?us-ascii?Q?KrVsWv2AIuvhkoL7CBsMeGusWd5kb9Ktbv0gCp+g0KNq7UCIErhQKq1ztRlY?=
 =?us-ascii?Q?c2pl1WgcIVx1moF7qGtfRthJRRjk+Gh5D3l2vHysk9xliohYjAASMoos4Z5S?=
 =?us-ascii?Q?xRNertXoMCkFLFuwhdrHaJqIUjru0n4HUxa26hddIDDmEiBm7HilUzt+t1eS?=
 =?us-ascii?Q?GQTl1xllGUTbNVrP/1togGD5h+t+ZoNsVRcneSAAeAf09/ne/w/Lg/hgYA0v?=
 =?us-ascii?Q?y2GyRLaM2tHOHTbbK73ccAmiO9tFWkWXjkpj8K8c2LxOo2rR0pLArsRDPFKW?=
 =?us-ascii?Q?MiDrCigPKd1kDWSw7QVbmBj6iwHDcO6O+Ge142WpswMxj0ATDKQCx0Cte7bW?=
 =?us-ascii?Q?9RAzh67KxJ6XYeCMio6c29B1Uh/ssm1AfZ42QGIhgoxQunrMeIEpq/3pO/2E?=
 =?us-ascii?Q?54OZqPzh3AurrmEClt75nHvrgM4L/JFjXWx9fBnMZgdC1807HqZLk5q+qxjS?=
 =?us-ascii?Q?ROGPdpzpYW+/UHfvFGIXJEMqNztlqWOa9S21TswTTpm4JXCSN/H9rJndgdw+?=
 =?us-ascii?Q?uSvX1BE5HeDnDhY6xCSoPcn2bXh9530OUJh44W/f4ABiid9s611/3U4GkhZ2?=
 =?us-ascii?Q?El0pcgDyI7x5lppViVOBj2gJItSYPeguPP2NnZKAnFrNZzG+xCHSVonVTIQS?=
 =?us-ascii?Q?8cvmcFoTChgbn+I32lFaQFLor0YdvWGP5Nqa8BWSXKFHzMIRu6+6jKrSAL/s?=
 =?us-ascii?Q?d6djTJFPXGIv2dPpqICpk0p91Tl9Wq/4Gcfc/SpxHy38HDqJfdPq0LegWTEQ?=
 =?us-ascii?Q?WOUR/8C2KVQpM3rNiIuedn4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1SPRMB0132.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o5zxuDINt4v+rvUcvri5rm/XJQ+TKzcd26eSSnNDPuusaJlbLn0vh1VBav9l?=
 =?us-ascii?Q?0HVMHOYhtq7sCkpysHG08u4E6Rj4+ZPauSNexpdLcwi+V+y3XubgkUMWbNMA?=
 =?us-ascii?Q?PwovTRRj9XLvc/QNT173YruqNlzF7S8a00EKPjCx6SOv9Fbo0ZJHHyFW5qOB?=
 =?us-ascii?Q?gNfB+e5pRa5qPfX31+gzyr3UhPpwIVgyxgidsza3BGpar++6b4Cx00+Vc0Ep?=
 =?us-ascii?Q?5XJszBfDVyhKTu0sdGid2EZN4+aj6P9TlRrTsMabc+ifUIYJA4HHGhgCiEhv?=
 =?us-ascii?Q?Hi2eFwXp0yuNGNI7qvoTbqPvnfaYyznAN9Mqz8yp+vfxcBVxf8Phnb6rlSz5?=
 =?us-ascii?Q?MnhMv09vos1RyW6fIj3+tEhTT9+v3ES1F+3/9uM5ke/Xrvb9U7HvqjXMVcHt?=
 =?us-ascii?Q?PGtKEcYUYv6yD8CgYJYjLkjf0yMyFCWynIgJML8tVIZn3XJ1X48zdXWXhEKs?=
 =?us-ascii?Q?MYxUhngQ0Mn5Hdh0CXh+P9aCO3BkmOOCEVRGvji9J9xs8trC6iuKE9/WQP0+?=
 =?us-ascii?Q?DTl5ZGj4OmPsCTMoRGS7vG9fY6SLure3g0Vx9oGsfwWduE9+PbMI//b1rTd8?=
 =?us-ascii?Q?OSZQqfIUi2PsvrB4swRBpnl1+P+qu3uZj7rY2hf2ng/kByQtTTbGgXpfe7PC?=
 =?us-ascii?Q?Eq1RMqP/vFinGlGzirxyivcMtj8C3I+RS4FsiF5RIpghgW/oP/dlTsz3Ljtj?=
 =?us-ascii?Q?u29Xe1kMq80iY+O9qkBnWxrR7VdyIclOvBflr4i1jj6gZXc+phmaRt4DmzTo?=
 =?us-ascii?Q?GOUm4oYlFHEDrAD6f3OqnN/BYot+vHVp1DvgqxpB8RtTtkaE6qj2jSY7/Vwt?=
 =?us-ascii?Q?JDGvZZS6hxDPw2tuFyla4ZR80M4MKo9r3xZv3UIm04KDiZ+uP88xXTO+10MO?=
 =?us-ascii?Q?5FdsOnYQIguTqUCVJf+/BIxPQzNmFhabZB3K/g/zihv5HSqrWqOuXwjIiS5s?=
 =?us-ascii?Q?MPNrW1plnTuYoRN8iDRr5PXis+t395LPDLEv7zk8p+QCh+UvVotBJwKDeG03?=
 =?us-ascii?Q?9njnSeUXGx6uejyzixinYJQ32uqd8YFa3fO9QYtWxK45Uu5CRnL+C1WFOqpl?=
 =?us-ascii?Q?+25mg6sa10wj5rR2gYaXBud+/2jTJEfiVSEO+eqfDz7LCnxgr9nrzoUkv1RS?=
 =?us-ascii?Q?bo8+MF/iD8zhMxXweDejc5B+r4NuB7uHJ4+8Nq0CxzKZNp2jf5ZhwJNTISgD?=
 =?us-ascii?Q?6aTFmp4P11e6GlD8YHOrcVvZtK/sp4SJ1KylIx3JK+sbbDDFw75VROZC1Bym?=
 =?us-ascii?Q?fWszNf3pr1FMdZp392Ih7Y4SdfEBYW20zYKhV6mjbjlsnNMgcdajEjUtMBjQ?=
 =?us-ascii?Q?pKT5/j3ZM4raPMxDwtrPEnng7WXPNDkdYwJavQA/Y53fAV2IY3dBvtNYBIi4?=
 =?us-ascii?Q?CVlpxYkOiEBn4zcg7Y9YkJ7Ww6W2FNCNx9fE6g2oXETzzwffNj3wLXhe4QJz?=
 =?us-ascii?Q?9vyKXmir54GOGnUcvCF8n1UvTbUMb6itUCuqIntBlQ/WRHh+3WAcNgLhGn5+?=
 =?us-ascii?Q?bbIIG8q7ZqUjPKFdsd5X5XPPWz4tZ7ClIx1SHI4TzgBY91GhjTquNdTyhkik?=
 =?us-ascii?Q?TsSz2a655smkJQwzYVmvOfuCcFPY9cQdWqPkAzdBNJOgGLBjjDTxLHo8npl8?=
 =?us-ascii?Q?N+N2ybRrtQT+K13TWPQBLAwUdo2AQlyPZ3RaW0m98EIE41MIIVbXPLEFbQgD?=
 =?us-ascii?Q?ZR9XRkM3BGN58QBcV2q3ToD8SgkON/U+ndUKnXsi36HR+5v9zo5fsac5fdVi?=
 =?us-ascii?Q?4eRYRSkaCg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ab4d8a-4954-4983-295e-08de57c1f96a
X-MS-Exchange-CrossTenant-AuthSource: GV1SPRMB0132.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 01:19:36.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LafuBDnEbgi4ZnysArVqKpj1yPUnoSnbvOBfSlx3x8VGkuSRJCOF7GK02gEDuT1SyHFZ5Z9tTp3ESF2hfNSxcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9652

Add fsl,max-link-speed property for pcie_ep[0,1].

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index a4d854817559..255cf942f87a 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1910,6 +1910,7 @@ pcie0_ep: pcie-ep@4c300000 {
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
 			msi-map = <0x0 &its 0x10 0x1>;
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
 			status = "disabled";
 		};
 
@@ -1987,6 +1988,7 @@ pcie1_ep: pcie-ep@4c380000 {
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
 			msi-map = <0x0 &its 0x98 0x1>;
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
 			status = "disabled";
 		};
 
-- 
2.37.1

