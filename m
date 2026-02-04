Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2DF2BF002
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 02:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172288; cv=fail; b=sIrLtmdGSRGhn8JHAtOKUyeG0oGcnzxJLgPMU07w8SdEMINC8AK5E4QwikTPL46IrkrHDzNU0Od1iO/TrKNw6rIb3O+KEons1eg2H0mIeEhHm1+sqTSAiGnMifaRnxYW0EfgcS+AGmfiXPhIqYqgc1CdmKbJsHgz/9yXmB9ZZr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172288; c=relaxed/simple;
	bh=NT/hDjwoSu0/qRF/b1nPp9MsMTLrGn12lRPD4RAFvB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pu7d7tWEEnz2DBIPbPsClQGVXb0xHyUow2Y047XRn1hzeLycrg9F4Vf+/vlaicUvzDYm2HvTfz/WFMgtY9MzGGG1s2f1W0nrt59ylDsQQla71UZQHY4Uw2POTgAWHNyj4hEUXNY7NVXaqOMAihTbMrJMARboZTTBrV8h2timNLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bNOme9zq; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bNOme9zq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueQbbC6wsHj0N/UmCyrWPNpfLgh/hCaHqw810QHIqOP/zqwVPMID8i104aDkoZUXfs/7vqptxqfO9EIWV78+LHzcQsLp6nIEyeQtmQvVPt5tcgSpsN58R5OxByn4Ogs9IILFhkhl2a8L7d0EaF+BtfJwLLXx1T1DTVMQhovd9op+QRDxLC/Y2dKhVWFQNEO6Y/tv3QNegTX9Mz7eFFsDDjjvb2LBJxcvVypaDKkJcm3kdvt2TH2Ll1gD99yRgAl3h5tUxcQ/YjXZ6xG8HVjjrfR4EKY76muTsuKhKg1KKBR0W4m28TyekkoltFu/GtOmLGiW9MF7Rd5JU5qyGputSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvIgc1xw9AbmN/GRyvG2+LBxgZgb/d6Zl/fPIVsNLc0=;
 b=W1Uh2Gk/UxyCFbnK4dMc1wKD62PjiUPBkrG3wGS3RDBbHIXOp5K4bPVoqFxLcsgSce00uTtQYkBv8cZhOQVbkBEbn2lVF85mfDKE2a62EmV9xYqyVMHDw5dJ7jREECUQAwzl87XSLU0dPTkWwMIa+ydLA/CfahklmskZVZKyY0Z+oGHGgWROvOM19k24sq4DZJ1KA6S9mj3lgDfiWBvYYsscTATyMpA9TduBf8qZW1PaxrhyolfzfB7X5J4lndlG7cHhjT+ViGfejDELVTJFP/InB6N3WSG0+z/y8kpgk1vPpcCWGQGqdmGTTJgu1TmHLWwi7qGwW5IV/7VdNY3bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvIgc1xw9AbmN/GRyvG2+LBxgZgb/d6Zl/fPIVsNLc0=;
 b=bNOme9zqrrkV9r3IQVDXIN6WPGPWsRhy2n7FRHRcbw/H9+9vaeBuugGYXvW/8hzPHw4Az3cg599uzgSumpv0Tq38pptF41D+mhe26GXJX8As/2LorNmUwxhMSuUS8J4/kxOXCB7NrS0vxkCESr4cSYe00b7LhRNV3Q8IxB9ScxjxfNZ1bOk5YToyDUP+N/IY6q6ybRTkL/dr1M2Fx7ZbmqlyCua856EYGOGr8cYUVCjvpotkwfbeSPk5bLtHThzMmbDuCXLn9f9kbHOMWAKqDXLZge36+OQz1f3JC4c2j3knhR4Be/n7/cmFkXXHqGSt8/ISWhTueqCOUMN3VnqQnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB8589.eurprd04.prod.outlook.com
 (2603:10a6:102:218::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:31:23 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:31:23 +0000
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
Subject: [PATCH 3/3] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support
Date: Wed,  4 Feb 2026 10:32:04 +0800
Message-Id: <20260204023204.2382433-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260204023204.2382433-1-sherry.sun@nxp.com>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAXPR04MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: 812a0927-c968-4eea-f739-08de63957d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ollBaTSGtctIgjoLzieGvha/egr+YNmh1G/ierkXPJ5bVEovPQ5zluvD2tBT?=
 =?us-ascii?Q?l+4W7Mc9oeX2pw2/03C7TFtLjNNzftIw/eozUEdCdLKupD5Z++CM1ZkerGpV?=
 =?us-ascii?Q?7CeMOTYqNE5q4zR3rkGPoQE3Jrnri9aI2FtyBoOtN+1Q0WcSq6B/dF1U8zt9?=
 =?us-ascii?Q?WJvZfNd+oZEKKSPipoV/7m/GDzOVKjYOO9Va2vCKEwOdirQuOnn5gxU1QkL8?=
 =?us-ascii?Q?DlS3+CXE+proadYhHbnPXIvJni5DAad+9tFegWpxKTfq/LEfAPjtOmXu0zE0?=
 =?us-ascii?Q?ZAFfQvxYn2K5Rl9kvy1Ifr1uICBBZ/0PmhDQlZHM6m070CS1o5hWdDcnut+r?=
 =?us-ascii?Q?JYmUq0RWU9ITExf+H86JaPIWxqoDR+JXNBjr1JlHbPlaGNQJujwvbMZ9VLUi?=
 =?us-ascii?Q?C2vT9Jty1I0R9k/7ZiNmAlVinVyk9p0GDaRxNNKX9RCtamrU9gh09ie6nRzp?=
 =?us-ascii?Q?WUEjTMoqixaXLkUXjRuJeDbUoEpkgxvqWpDExVuW90wqtBFKhT/uSxWJT42t?=
 =?us-ascii?Q?/bIgoWYJ0UAzkfjfCJD6u+PBBjldxgMBBzRHx1hYBaFvizNRPjG0FSDcG0Au?=
 =?us-ascii?Q?mmZNN9nYUi2u5ZBcM7E5Al20L6O+5lFVkNoMciqdpwMvgo4S5UCZPCdvP7Qw?=
 =?us-ascii?Q?e7hqvl7ecIWNBy8msz1ch2bA4soT9T9udHNjap8DV/8RJz0LiWvd3Q7oUJ9s?=
 =?us-ascii?Q?LM9dD4LyQhJWPJ/nqBmmWHL3S7HlSIqe+uNeAnOo0X7oyT29TUMwEdFT3B8G?=
 =?us-ascii?Q?vrpTiR9e0cdG9JPFr1mzKH6mcQGIaHV6/xtKtg9M8GkLIIPhk3StrHpaQvcd?=
 =?us-ascii?Q?QeotxxSiQ6UswA5PyiI0uO4EjSM9Rm5rZy3jYgBsi4SJ48uzSs8bzbFCnF9w?=
 =?us-ascii?Q?CSQe7IQVA/QrWyWDw8+QNoVqB5ed46egl9+nbZ+zczQ2sltudfRqyrCy2Xm3?=
 =?us-ascii?Q?4SBs9EY9Ydl/h8F63eG+hWt7vtDVOKAxgT+RlNefMPX9bgJGFSRzVwh2Z2hG?=
 =?us-ascii?Q?Rbj5b2nx4MnzfQVJlhul0RxBF4jhBzn6xCG57pZd7XrKDUueIX+sS+HCmAat?=
 =?us-ascii?Q?TUSiJYFMAD9nf3V5nKpfy6I0w5m0FaThYxrVIWPxr05AMb4cWmua/hBCJ4Pl?=
 =?us-ascii?Q?Y8DG5N8VBlYuRV6mAsns9XUURGgmA/W/W0tpnj2A4WeLvfnToBliaGK8Bu2o?=
 =?us-ascii?Q?eVhCQXFJSgq2Tz4c62Z5l2a/nnCsfQqjDn0el4FEZhJ06oA+g2ZmEV3qX86L?=
 =?us-ascii?Q?M+7RLljxz2FZrKUUfzvvtYqd1ofP+qeLetW1GuMMSemAbhuSISyrL0QGL9wU?=
 =?us-ascii?Q?Ep7v8dy8yNNE6g/Y5kr0ar1xBIUS/dDFFKpqH1VoIHpnw45ib681m+TeaQOm?=
 =?us-ascii?Q?M90ZA1H8T7JPl5o57NhsQ7AKeE3xqziznNIl77p8MNGYQZto+q0i+T8Ni4jM?=
 =?us-ascii?Q?5B681aH+hxJEYD2/3bmCTD3TBtcPp1d1m48ARaXtmapXaDo/z81ljlTt5A2l?=
 =?us-ascii?Q?N7t17pZ8rTKZobC5HdsKLgaR2U28H8NSnoBzVImOFi4hHbSPUvyuq9LgOf+T?=
 =?us-ascii?Q?WZDOEgtBMtWtI2uGUnpd3eKxhrfoDcYsjLUItWzBCCylkoLm2ghNPQ4TmlgW?=
 =?us-ascii?Q?thBheG5LH4NKEiVeH8gC+DY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vuNcgCI9jkKXJ+Uhetaw00Wx2zHCQHC1PefWBl72v6ra4w/iPdMd1jVE+4Bh?=
 =?us-ascii?Q?U/b5AH3HqqzbQeJBId1F3HweJdLL71z2ZJg50ApQQqU7gHPIFQwILHmzqrmR?=
 =?us-ascii?Q?YHASy8QhgyWT48lSYta5bg4Qq4ul7cZaVcvg5+RtNl5RaaLAbBX4XUAMuait?=
 =?us-ascii?Q?yEQoyBpNF6k2+r4m5AZEtYytRtBtqDSSn1TPUsDghp2QrwadodAQvgJ0jZLE?=
 =?us-ascii?Q?vv2DCCd0jQdyfGvsY8PiAQpmxrmbIYzaUAvFfZ9jVK8cX5qEcuOEBzeagAKF?=
 =?us-ascii?Q?y9cLLGmVRr+OXUQUTIOnwQgsPZmVdGoTaP14w4+dFkb+dXt4jgQJrmmZRR2N?=
 =?us-ascii?Q?Z7lXxQDoOISxqoKZ2QG+cccsjmSoTH+7d9oGnaq3hf+ApDFfBEEQzenqGSMO?=
 =?us-ascii?Q?vY7y9fn4A8Q7E1yM3Ixwlta9q2RouYPYfOfeaxjZ+/oK7OEQDCjDA8/fZggy?=
 =?us-ascii?Q?Ipjqy8h8T+vT6aDw6wPR13zSfBQSYmgpjLREdO6jFIPMjuCxyan3X17vM8Pm?=
 =?us-ascii?Q?ZLnL11FzARLzlwN1gJP8rr5pf9gOKIrGp4nw1IXfn+4THaK6XJvd6eLrmR1F?=
 =?us-ascii?Q?65cgVnFA6aEI5H2KPpbtrJyzb3A4fip8Qs4VutlAO34RvG+tf7qbe4MB11U5?=
 =?us-ascii?Q?g9WSF0bXVnp+cCjzFzViRoHYzMIN4uwFMKGDoe2usf+AXpk/4GQI5e6w0cYr?=
 =?us-ascii?Q?vqUmK+TDleB65Vfy8k5aJYnf6Q7TGSWiPCBo8/xPDKMsIg9+Ebq1VLxd0n+L?=
 =?us-ascii?Q?875sXhzEe8x+ewAJ7E1j8eUxX3Nkm6vioiwqwU6O0EjiExDbQxKT4YhIUlbt?=
 =?us-ascii?Q?HPqZX4teuc//MKdyrMcpL4lKA02+jUajI9xhA4UPt6ORcnDTZUdEiupxCSLB?=
 =?us-ascii?Q?nQtnDFDnZ9p36a0jPHTIz26PNdbtc18HhpGCkOrnQHCkrCG1JDUu2JkL8ipf?=
 =?us-ascii?Q?rlEdCY0NJMmBKjK8gVzE1IL3B+HTU0APOicaXIPySlnf+bJDDKu3gZa1qwGm?=
 =?us-ascii?Q?O699JCpNUU9tVaLUE5Y0umzlXzcoDjwQd+OTGJGGOnMWNMbuk791zSWxIk0J?=
 =?us-ascii?Q?v/AWfvXIQDnamY0pN66b9Q3rvkt1yUX/Rfo1fTqdYeQ8mPhoTLHEjaJPexWN?=
 =?us-ascii?Q?I/Z6Vs2dRegT77nFYHyVb8AnlJxKzxLlkq4Ef6B7A10wn7rTSIIy7tdbBW5B?=
 =?us-ascii?Q?nKF+sj5gS2WZTKKLLWX3uHgKsjzFWM/1vfz8zTmZsemp1zRufDNQww2rWEWw?=
 =?us-ascii?Q?GMZy1YoXc5EvzXjw9mcLMrsiFM9kPKjWokS5JSiNEG6ksppV5OVS1Gtq+yHZ?=
 =?us-ascii?Q?MvAvUBTtr3w2hCwyQLTrGAGKXp/rbKwiuLYOTS3T9TgIo2erbHCRreRUNo5s?=
 =?us-ascii?Q?Gct/hDjXWv9EydY+WVfpCXV/NCyDePOUcyrRJEykuDz3qmq5j5Tle1JP0h3C?=
 =?us-ascii?Q?1SMgLEq3adMFK/U28ztqQUfC/sFV1OqVcnqv+fxJBLYQFkOoZd5dxo73bgxt?=
 =?us-ascii?Q?9F6eGRT9MxHJwdf38z+b+htjxHzBeV/tWx72Vpwd7+Gn7+fqyF9tlbxiyPXI?=
 =?us-ascii?Q?FwlRSjj5P/CBXTJW2SXl66xg6BuVSRI7vDWnkub11ex6pqhsXC4jdkO97gdH?=
 =?us-ascii?Q?N+H1wd6W3pDMJor3t4FSVFqihdFmBm1bDF79Usvl2hgZIY7+zU03MOA1swis?=
 =?us-ascii?Q?k8MfdZlBQHuc/8BLOOVHdkkpr5eQvqv9ft/o4yrFVXGbpRgI/+ta8JA4qg6D?=
 =?us-ascii?Q?M1ThBejULg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812a0927-c968-4eea-f739-08de63957d18
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:31:23.4051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIy1WbiIMtDhnUHB/NaUSc3URxHaxRxnRq7sANQy+5gy9JKdnmBV73E3GmNNSoJEgf4+nNSmY/QJMaTBmPnpaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8589

Add usdhc1 to support M.2 SDIO WiFi on i.MX8MP EVK board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index f86d6b428a47..0b45ff73a5a9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -250,6 +250,13 @@ cpu {
 		};
 	};
 
+	usdhc1_pwrseq: usdhc1_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc1_pwrseq>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -863,6 +870,19 @@ &uart3 {
 	status = "okay";
 };
 
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	vmmc-supply = <&reg_m2_wlan>;
+	status = "okay";
+};
+
 &usdhc2 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
 	assigned-clock-rates = <400000000>;
@@ -1169,6 +1189,45 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS		0x140
 		>;
 	};
 
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc1_pwrseq: usdhc1pwrseq {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10	0x140
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
-- 
2.37.1

