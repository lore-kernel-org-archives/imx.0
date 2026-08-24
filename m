Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED2F2931EE
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538087; cv=fail; b=C33ukj/nWpDtF64+I9GmQiBWH4EoC6GxWeYKhriJXxaUwuGpB+lYaXlb7FkaEqwGYp8n+NNE7Ht/U2wuYK7UHQ0k49W6fYXcSrtsK4ic3iA9fKg90d7z937Zxiw/N06EFBj47P9uav/zhwuYRUIWEhglnS609j3Bs1AY6QJ2BgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538087; c=relaxed/simple;
	bh=NrMqJsOgUvqTtjdFw2F912ElwEL1chtCGOjoPPAdQLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eSvygwhW9abns/xl0dhlLmQES57ipF/st1o8l06WvXNTWZT/Q5yOad/fDn/bgZVPct3D0neZ2g7ZMYnDI0roiwBJAHyVHoo8FQlJCdVdUgJAM3yJdlAivZrIksiADDJvD9sc+1ThiJfwbAeW+OCWyR5kbrEfUgB2TDJdjKkUlUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X7Y3F0XF; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X7Y3F0XF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEa/EXEZVVTqj8Ax8NYFRoyrcNGh7NFAgRbKa+3YuzERZZtA+UmG7uB0tpadoC7GaOSFi7aMsE0VmG9zSM9ScWYrxhb+W1KkjJcME5MDVORzI5lfFGRvoPjZkAB1HGx9uC1MhXH1jmGqrVVNdN1ub49Mvcx0lEZlWhaPFmJvM1PDGm15/99tKkWkw2ioVfJ7k4StLeoLd8uf+vLMQJpsv+E9jm6rO88WLpFi2SxxK845+rkyreAn7JTWJYiioSjrJ6ztuBV4mpuYIx+czwLs80V0jmij8VfTgqehoTgNGV0/h//VO4BBWW4s+f2x1tDGx6OGmHpXYFdwgCjfHeFKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=OM3fSWLi/ADiyxaNgZdWyDoOZyYyqbbrdDblLoBs3tRm7ozJvYt7E9Q3hDbG5fkHnG91gR32F90fukIkewmCZ/WdGPfr53vMuDRC+s3DEoIcQfdS768xKel46Si2ILTnKrDRTXZQY0wlwKLabu4Ux2dROT2j9AAwA3/KIIxfsc53Xig7z7WDcC1H3tX4KDMGSz/NYTWtb29eVtKPZrzpCjLHyaZSsmMQmOuUChT9STSWshBo4MV+dJwx0an3mjN7fh6DATPUMo7WiMBQSzJV5d8zRpq/OzMU/KJPUmGT2AlwpmLCpm4iwi+JCQf+VRMacOv92sRpu69wrFBXHdbBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=X7Y3F0XFnwsDwRpr/lVPhlpqFsuWhCeRLuFv0TmoFbsqbNvESCSQZr46yCZM5H5A5e0GwWOYnehckW4mUfnPja8GJuM9E+uZEg79unpEHkvnx7hren8deFmmqh2EVLtqRUz04+XIRvCdhMufJJ9YlgXozc0CPUw5FsqmExUMA5kUOJskQI9vSFaCcwUZQXk0zWI3SzYgY9G35ELRe8OEhrmlgqbvijLjb4E+TdohMrHjlH2LoNstGnoPmJBg7Ps5M6otp/D31TWs7kZROjexlAgR5FdKHiJBJrqRb3MXBH27df3rEOV4s7Vq3qjS3PLONUdYwM17HzbNgHr3qW09KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:23 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:23 +0000
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
Subject: [PATCH v3 08/17] arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
Date: Mon, 24 Aug 2026 11:20:11 +0900
Message-ID: <20260824022020.2812810-9-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0035.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: c37a7ce6-766e-4797-8b40-08df01866457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e+zPu8W8/vC0nPyiqISrjtszFDGDlwjJnje6zUTlOQ/DMt+SucEaQuLNMrBG1DELHZ8XJQNikmXQivH8l9qS7/WwQUc0viq5nIGSVSpp4TwcwAhpMw8rsckiW8m6S6c1PZ2W22D/BHt7/t9GQ8iWLlOrop5kJv1BEMX0VWN5DPTeqbXM+kE4evdyQRx3e02qr0gkraktqNWlZqileDkCnYq2MUjyGmDaGg1rVsZDZpoyRZ3xlGPq2w2AsgyvHYbZgWmS3CUOsnhIAI8AM2ucTtpRila9NWiITShPlaz5CY9yRAvwKiOrvkLTFdK3o3Z04cxmu3MI0PY+5+hpGwLvdEdkOjqq8ASgOFJXCLEKegr9i/FOoOoLMdbUgXLy7b+/e4XILLHOIamSOmA4G1rI0wJ1siSPxp6B4cVSFAebjfDjm7e42Soje1XgUvV3mOa3O+u5cKLpSBjjTcDpZO8TLEJnEuMQ1lnTWwo1prKU+Y5MMhCpieH8997pFqvmsOR9g+3De1T5oALS+c/EO/GEZjgTumWpocluQrVlKy/BB/2bvlsYRRlvD7hn/5TKj9yKfLRzhsHFiNDe4hvo/pGYyFoUy1q3FEmJG2RbWrV55PYwrmFkpo1RIvDtnIkOTHewPJFqVYopZCkxiYwpK/K9UG7R9y6+pHEt+gRdbbjgPAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?syezX0cMhlHG/MFecuqyrc6f5IjlwmOZ0PNo1mtAdopWoHlWJtrZG+Yu98Md?=
 =?us-ascii?Q?AdgP6gf3/3hyfmZx/sZawN7LN9OngXr3KHe6+H7UIkVsuJsps5Rd967THZMb?=
 =?us-ascii?Q?PZ2ty0HWbnfv7PfmQ2aVk0d/G3gGCMm0maJTEL2WTslL5uYvEhbEa2BNPalJ?=
 =?us-ascii?Q?ehMJtFjXWEMT62JJ00W3s/SwB5MtX4Ts4yoN/vgkZ+vkiJWV6SNDIfNJkrjh?=
 =?us-ascii?Q?kOk2tpndbkGiGOW3Ys6KyH8/H6twvGd6gT/nWcqPQTbeDfA3ZctjacTpWT+5?=
 =?us-ascii?Q?r6+WiCXlPzuTbQtaiQp9wu6bz8Z5NH92ct9PVG6heY61a+kDeUfCljqHxM8i?=
 =?us-ascii?Q?9P1X1A133vpjcSLIIQ7D2mqNkdowIVe/cF5bve4lfLC8UyiQs14q5KNfFQhq?=
 =?us-ascii?Q?zw2PUqO0LdnoW0dRVWc3Htop2j3qcJaIIjJRT/2/35XVO/BcfdpffEdJsC+y?=
 =?us-ascii?Q?h0SgLnT9rAiG0ohDO+lC6K5tFzhhLmZ8wz4CcjktQS2/QY9v/XgysIJ3qctu?=
 =?us-ascii?Q?XrYjzeW8SYeJdH7kr0jJN8GlxNeZlZX2bZmLB3LXml5pALIIAwIhfyd40oyU?=
 =?us-ascii?Q?aKUx3kNYxZ5n5vvV1GxF+wsK/y8a6pNbXEK7jGRi2WtXyOQAldCnRoiAruIH?=
 =?us-ascii?Q?J9XgyN/+KC79KUpwq7R7/UGbHS8ZjPXACU3YOysY1WG1/ZQgWtQKPrVIWG9q?=
 =?us-ascii?Q?jqMFPOhIgyYh5mRC76Bl/m7K22dYpCiegMjpxa9W5WXfft46m4oO9qhGdqy/?=
 =?us-ascii?Q?eWY7Be6AM/oHYNEOeEqICkmlZDqwiMpiNUDfIYdhQZtl8QQSHpKCkf0+MypE?=
 =?us-ascii?Q?AB6v2UlO2zEUxh2j30AmuUrA0mBcmktd15zvgHFs/tOe4c2Cl1TawLjrua6e?=
 =?us-ascii?Q?rpakOk/+TcZvBYg0Sd7MvNw7DKs3ytZYhhJpDZoMBoj8usaEN+1QVDpDkRka?=
 =?us-ascii?Q?mpAUF2qXCvtsQGaytkO6mbEWNNbRekS3mqjbuYqYyLxdO4yyJygDuBI6Pghv?=
 =?us-ascii?Q?7B1+NXCL9YSp3KE0Qw6MVsoBZIYTkwcx2clHi2ShmRTs5LkdrZQ7QwoEKQIz?=
 =?us-ascii?Q?FOFRwAMptYEsgD0tL+RnSdMP+nr7ygQBZ/0Wlcot8B2PjLze9tTpK8M2Y5O2?=
 =?us-ascii?Q?Fg71D/PX316wzuInQSW5ig4nVomwgNfpM5PmEuv3XtoaFtF7+NOEECeOQvag?=
 =?us-ascii?Q?SPtIwstwa9n0sDtYJVOH8tFytXt5zKk67fuSpsA+WwRXLBOIq8lS4F8gWoPj?=
 =?us-ascii?Q?EF4muIHp5m/i/HxitpsCcnnVecVDOQzAzWJhx/jpcZFunrUVrSeE8/FAtNNM?=
 =?us-ascii?Q?gjbvrFNOWIL3Tb2ourvTfJyvFml7oUahqhpubWsiwFYpo86397G0bo3NwYmE?=
 =?us-ascii?Q?qOGrrVRXIRHhWIb2WHUn4B72/2zmEpa9b0dynOo9EcRfHomo5kAtO38vVddv?=
 =?us-ascii?Q?P2A7GWh3lmSaVzo3fXribGAtt9tvr0kmlkDyf1maIlzDsWarbqVTL0L8ADST?=
 =?us-ascii?Q?J4YsTVjbnBIDRcrPq/9P6FYa9QMlrGAp5Yn26hLuRrLMlEDVM7JfZtIw2eEv?=
 =?us-ascii?Q?T9TMxR2PVnuGTZA7z1EiEasjr9dJSfChhf74K+5H6AnnXoL6BiIynFEtpLQX?=
 =?us-ascii?Q?VKLbvQFmURTDktIIUJEbQUmeTMKH7njga3m/JUisgmXUXwLXKoPe4ZxhJEPp?=
 =?us-ascii?Q?wtCEZzpsD7ce9pMLvAISMS6AwRPLp7so1CjPpe80NXreJpGkl4/3tfeCeVvY?=
 =?us-ascii?Q?VbS8vqo4HPNs7Z2eCUlHcxqcIfSLJ0Mgk5ALx9ni12GUWe1QId8g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37a7ce6-766e-4797-8b40-08df01866457
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:23.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMDECtqKhURHb4GBkBxtoHKIPT4tzV2KHDPzqXL4+CbqZQvJc5l1unCbg6ecUJ0vxiEWaJsCvwrIqD1AHKUWr/EFygmDuACjXp5pisbruz62xT9DyZKXkVJFeyQNNwt8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
sound-dai-cells describes the node as an ASoC DAI provider. Both are
fixed SoC integration properties rather than board specific, so add them
here in the common dtsi instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 34833e62bd79..a0d1922389d6 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -131,6 +131,9 @@ scmi_misc: protocol@84 {
 
 	mqs1: mqs1 {
 		compatible = "fsl,imx943-aonmix-mqs";
+		clocks = <&scmi_clk IMX94_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1

