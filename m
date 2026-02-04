Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A52394464
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194119; cv=fail; b=JhoMT0pYIlcdjh83+1J5nM6frba4AA6BfzRLM3O9ABv3aA2nKnwKXIS5cz3EBxiPfq8IoeYMsjhU9FVHBFTJoWVltnNxyQimJ7quUcxJm68jDDG2Swbek+BokfWSl54jbsvYs2Ifh06NQEFHWdLyjDe6ig0grg/YqOxlUNOeO3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194119; c=relaxed/simple;
	bh=cSx5UI1yUQI1gTbKJfvcC8W5t8I3LyAVQdXBrrYHHr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mkLSEWar5yVtJsF8Os95gQjfFk9FNA8fSh1eKYCBIGyNrH34QAOlUO6kxS481MnPViWe7cEdDm3wBxDuWFoa7H7Y+5WddaavjMN8QZd0jrUhuTQSvM5LVovburGQqEO4jHduDzyfhrAhGX3Q9ZeqxMFyVrUuaLEa+6sItGN2MHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nqJvVQGu; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nqJvVQGu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km/OUq5ZxTPj3OZRLyH/EuIJNlosycrWi8jy9rNM49gLKKU5+/gIpZSrql8AgkRW+HCZ9rU+ZfaTTWftB0/XB7Whey+dF6nC4LNkKIbgPttEccyb7VQM7/bRzmgQF59VFPLlCNXqTqG+PFQf5BnShvdeD6NmligrSQdI/amoHmy5qHApHY55wUfceQxNHrC4KEu7d/bM1vg1qdQeLaLKP+40OFwUL883btVL3/3Tf3ufuHVU4QXKlBFWn4yak5XYOkaVr7gJEnTHmNOFnia7Hq3SZ0Yo/kjcdZGskV+Q7b7xaBNAH9h6TDf48ts2klyb7Vgq3qn7HflHY8dKs/07jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3QDVnFQcSYLa3WUt5jpiQKZYp8YNezlk6qsbfnxqTQ=;
 b=xAgZJRXLFqWB6BaMxXsA54d4s9nJHfPI88ieBnRa+AlbKhzVaGizsOKMdFzb7YNqiUPp2kbD4J01ptcjgSK6HFgS8KFR/g6bVbCuGrKQcJcDz3omtM9lemQahHpgBQITemmEcQuXkQnSPkuiMU1DQzPOoHrIEINiV1k+Q2zYYjBG69YIFl0jgcBN5mr13kU8uHUtbps3YAYS4FNDyVz0DqBYHs46+iwrIAzMOhY6FxLOMsN1Ju+IBEFu4Qh5JSjtKXd/LtTmPGJE/BjAT7Jqq9v+mNOoeC40eAN+Z7Lnoa9xGqjAW48HFKVFlx2tCI9c6MvwgGrKZCRiirTTPBlpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3QDVnFQcSYLa3WUt5jpiQKZYp8YNezlk6qsbfnxqTQ=;
 b=nqJvVQGu/lQJeQ8e6ZgNgpOADlD28wwKaoB7nj4I520mquQJ2ZlfINdqOanz4qT091e/K9qvp++goP5kgVu91mFXxocMnBaUv3KfZhvJLWakkuRS10Sy2BewxHqFXnFlMe9B2I4E8ms9HNQw5/Z8JxSwk0gfjooGrtAp3fwlPN05YNHN8ZZ2H8W2vtbNH2wpOpF0UYR+AfNxY2gf+0haJcamAZG7sUSnIYdD1keD+7qdmV8QA7ZGCG25yj6jKoelmckSefU7yWDFqI4XpXK6zOxwjS63ZGoW630GutZoCCShENrdaTVQEPk8Av3NXegqvQwsoUVeaBirUH/rIxSFDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA4PR04MB9245.eurprd04.prod.outlook.com
 (2603:10a6:102:2a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 08:35:12 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 08:35:12 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V6 3/5] arm64: dts: imx93: Move 11x11 EVK specific parts back to imx93-11x11-evk.dts
Date: Wed,  4 Feb 2026 16:35:49 +0800
Message-Id: <20260204083551.2867263-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260204083551.2867263-1-sherry.sun@nxp.com>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA4PR04MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: d67acc00-92e5-412c-e7fc-08de63c85015
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?h4eGtugM1r4BBjiZ2Zj8wcYtm435lIKjF8sixH7zxDuqO2Ire/SWlwWWHW4b?=
 =?us-ascii?Q?ge+h/TsNZJneUim9Cc1wydiK30mQG1KJMVSG+U1CyUS1J/fyKmB7V42fDVIb?=
 =?us-ascii?Q?3rO/1BUhd8uq9xABmzVbD73g7EP04SA7TOH41qxfoyWzIJOIEq7t6hQgBrzh?=
 =?us-ascii?Q?Y2RofTBMCs4RmPNK/S7BOSqMEQrvOTeXdPHYVxj4wpXE5wQOmL4LDqDoSJ3d?=
 =?us-ascii?Q?sAtuwqsXVTP8wJ0u5ZMrjzDr2MdfBSESsBXkQ43ihmX37bAk8s/dnsOO2pQH?=
 =?us-ascii?Q?ACiew1yiWgK9Fx6U8RLHffGJDKsS2OKPuDtaB4KRjuMGy7szJLLTbGIHaOC+?=
 =?us-ascii?Q?cWROwMhTlSnpzoNK9YH+X+187JEKyijsrxHTK91QAn38O2JZJd9+FzlRZW18?=
 =?us-ascii?Q?vO11+8PrLqij6Sp+qck1EKtk/zNdR78jF/p/XH0DOxok7YLwncX7MyXn9ri5?=
 =?us-ascii?Q?fYr0PYW9EuAhh1j+H2o8dhLLZ34/cm/f3QQH2KMziAEbWe3+n0N1oic/KApV?=
 =?us-ascii?Q?YDjurOAmewwP6pLdNxV7E58Qg0IU4JuKg3Gxjir+xWLvhT/09eBsSh6vRiuO?=
 =?us-ascii?Q?gdjtJvT38dsznEwAf/86HZXyLfIkfOyrdoaPYy3YdYHOZRuL51Kuxm/Vq3ed?=
 =?us-ascii?Q?kEgp+K1ucydBoz6gjyHHsBpR9cx920s0pnSTr4gCZ9xKXi6zoSdYBfrvL149?=
 =?us-ascii?Q?vCtMfe/HqwRj0s9QSSOv2XVQw90N/6pgIlFhQSdWnwEQZBPsv/tXcnYBZpu8?=
 =?us-ascii?Q?fu2hjKUXAODxT1AmHfBImnBytNpei3NxdX8gy/puPJAaJsdpJ0G1IXEiTvjg?=
 =?us-ascii?Q?2+2cMz24xlF+EYG5CMmwfUJK2a2uKO/3bN9Z2esgAIu2raW1vLRgXZXe/2wr?=
 =?us-ascii?Q?pz23nfkNdM8TOd91Z8wiTmeP3YfHvgPv/mPPkaI2h5CtLuEsp5fz+LHDOr6I?=
 =?us-ascii?Q?2jPwda6MpjpVQeyHz1YzgyP0AP50XzF3Rzi4/EYUhwAfgdN+exiZbt1WOrVX?=
 =?us-ascii?Q?9TQXGtpq/B9mhNJisWIXNqG4xosg5Vn+cXwzb7gRMCnaCpKsR4EPGAVnB0dC?=
 =?us-ascii?Q?+KRo/L9+F4FpA6izKHqM5iFpvHpOGJNLg/HfxqaGOGsA54K3ZfYAp//qUCHM?=
 =?us-ascii?Q?31HFBMht9es0IyWxZluNWLsYtS0zAsXtMASjX2YjQw2pjfPeCJLIGS2Zo7VU?=
 =?us-ascii?Q?zd4EFhW4QTqGRcBMbEyhZwWK7gMUlsodZ7sAf/OX/+m0q5AK/4TfJitRdu6W?=
 =?us-ascii?Q?LxT9/Ic2y3ktX+hA5g96XONpxlXeIhDAQYad9xXLS/QZOkEK5kpGxDB9sYL1?=
 =?us-ascii?Q?Gj/I+/+EzE60REKaci6jTj4jo/+hRl+T42Qr9CoqMDUzWAFge956qogYGDFX?=
 =?us-ascii?Q?dABGL7QVb240JQAthkPfQGjzWEYmLuSIiqS9bJHOBbGhLnbdIkDxR+K8H8SY?=
 =?us-ascii?Q?ZbPvljcZU9HcJTn7nTrInZFJz6Ofem6DBmFAvz6+Fyz8t9SnSwEqONtmTRur?=
 =?us-ascii?Q?KnvUNwEX5JsdeXWT7oo11UaqYXEkn6nnnONFQTEYA+GIAPfiI51XKb/qJK7C?=
 =?us-ascii?Q?ffRcREK14Gn1x2YlcZMqGyglZKEBgdXlvFjLA93NaE2bDruOGXqeSL8ndX93?=
 =?us-ascii?Q?/YRYjsdUShebfq+Y3FbwKFvt7D865A2iLbrVqieg1iiE?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?j2VZ+jjEQFfPbsbaSjYCuETz01RXEADSeLDG3AQ3uyDoqLRtaGTpf99qZ+xB?=
 =?us-ascii?Q?oKvWNa4dL9z2/B3ManTJBF7tKS14MrDDA5BxivU3TswWqpHZa3QxyqLCaRlI?=
 =?us-ascii?Q?54G9h8K3ky7aDPlBYJsrkp3z0sWyJhXe2w/F0+s/lNGVRLTatPyEtAyZvtjD?=
 =?us-ascii?Q?BNq6qv2SJiuOnSHe+jGN7j0+GVBpW+Jd9KRXXU9rwnczBAGXoYv6oztQM6W/?=
 =?us-ascii?Q?+2FV6N+LeLzBxm4s/tBumDHE2jL8Ybul68T0a9CVwAsSQLCeH2LJ27DuNAsR?=
 =?us-ascii?Q?eE8D5+y7ybP0cqE8VdM/mjHcQYRbDakYimP10uB4riDqkzL5bHrGQ8q7NsCA?=
 =?us-ascii?Q?ah2W3CTKaaifP66t8oBNMQ/ngZnOCABu/mSjZAebKy0lO5YAoVQahoN/k8jW?=
 =?us-ascii?Q?AGR1S2wGaIwBrdMerfLWqGw9oJUlh9eeafAfv2KRwGf6PqdSQQn2ukl4vzvm?=
 =?us-ascii?Q?ef2RPhQ9G4M8vQemqBpcVqKHMpJ+ad2hbL1tXaVT1P7FP95Xy9z2IkAmZQyV?=
 =?us-ascii?Q?LXqM0o5nW7MuNDmZMqPxERiH8Qxfa69HIMO3tcA76brIqtE/MwX2JZB8wz/A?=
 =?us-ascii?Q?ZHsoL6Ya0+7FMYdefVjwZyKku99BPuf7jZxs9sFIAv1rPctr4u9imPNIK7SI?=
 =?us-ascii?Q?qFtpPjQRzMAGtnfEGdTPi03rWdu5K3QIf7gDywKfBubRJFzgoZquLOSI16eJ?=
 =?us-ascii?Q?FqKs9TwDL/9XDgq1GQgjBzYSqSt4zwAoZrfDAJp44eF4Zud6YRvmG2jfM8Ju?=
 =?us-ascii?Q?xZnFtevy9ZfxAhui3PV/6tRKn3+y6OsHA293FS59JF9b5+ztgmOrepz/YLaD?=
 =?us-ascii?Q?QCoTLIm1PiMJIbFk9bqDboTCNsq4VLkWK88phRUN6pfOVXGPHdBlN8ERTo+9?=
 =?us-ascii?Q?+NuA/dAJGG2YjYp0cP5AjMj2WUbSbU+maX4MLfhPLVScJ7YhayRK/J9pT3Bk?=
 =?us-ascii?Q?1WE48k8rc23FdE+Aqu3MozQpmNPlQnq7ficnNQ7pskh0sdsv0/BNUB9n4KNZ?=
 =?us-ascii?Q?fRkxCX0XOUEMsQ6p0rowAojq8UID9yPSL23F2R9zz/gIpol+6sU0S1p8dnSw?=
 =?us-ascii?Q?KAPZvy9oLShK5LrNI3gOXi+yZZG1mUAvdFsMqJ00HNygjyq+PRu1H5OmZW6E?=
 =?us-ascii?Q?qdVQF5C0sVK6r70cSA9c6AT2cSb18vR650A+cNq1fA5Q4lil/BSwffWjtNoK?=
 =?us-ascii?Q?NX1shk5qsDaCQXfmfJbx9phT5jkdMruBD7KS8lbqR/ogJoTO7PeWH1MB08F+?=
 =?us-ascii?Q?fSCJqkfyw3TagoW1qvtKJz6rD9sIsInz/amtEfL8YL2deFm6Q6Vgcd0Dy8zt?=
 =?us-ascii?Q?t3jWndf2EFAhvmXAgrKgYI+Lu/yoEqSxow60hpkadFsTxIAkJ7RrOqsPE1FE?=
 =?us-ascii?Q?MIdR+iKQ/ccCfjQouwaaMRM3VhcAMa8BnRRlVQ4bVf4lP27j/5NJWYi8xpM4?=
 =?us-ascii?Q?N2faqc3YOKfyoyzvCIkFeBxq6CsQ5SXTA/R4kAkBKg54+pTgI3Wu6jentXwr?=
 =?us-ascii?Q?LGqQ3PCCeiFxpd4rHCyeOA9Uaf9imQF5XdAFLN3BnJ62WwH3fkBFqrDDj1L9?=
 =?us-ascii?Q?qj0YRqODFTWPcGjSEcJ4sJ4D7kZCYchtl+tsS6c8l8eWM3eBB+ODDLWuQmtJ?=
 =?us-ascii?Q?Xty81ZiYU/DUGKSSckvWyOS3Ju+VKAULGhJ0Dd6LdpSLXehVGzMLjbCXAol/?=
 =?us-ascii?Q?sJRuumUbdNMrgWBq5ulTNi58j8eNo9+hBNs7a+yapwaBcxU+T0CE+H41gz+1?=
 =?us-ascii?Q?84DAI/NZ4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67acc00-92e5-412c-e7fc-08de63c85015
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:35:12.2255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llOjFdW7OjEMnwblZawXCIP/a+HciuB5r3Ap/RVjyH4zBNXv9+2Bzypk4KkjdYihbJuN2fshShKC3DpQZhIfqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9245

The previous patch renamed imx93-11x11-evk.dts to
imx93-11x11-evk-common.dtsi to prepare for adding the i.MX93 Wireless
EVK, which shares most of its design with the 11x11 EVK.

Move the board specific differences out of imx93-11x11-evk-common.dtsi
and back into imx93-11x11-evk.dts, ensuring that the common dtsi only
contains the truly shared parts between the two EVK boards.

No functional changes intended.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../dts/freescale/imx93-11x11-evk-common.dtsi | 198 -----------------
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 206 ++++++++++++++++++
 2 files changed, 206 insertions(+), 198 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index 6279b8eb4ea7..301e9f05122e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -107,15 +107,6 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
-	reg_m2_pwr: regulator-m2-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "M.2-power";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -128,28 +119,6 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
-	reg_usdhc3_vmmc: regulator-usdhc3 {
-		compatible = "regulator-fixed";
-		regulator-name = "WLAN_EN";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&reg_m2_pwr>;
-		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
-		/*
-		 * IW612 wifi chip needs more delay than other wifi chips to complete
-		 * the host interface initialization after power up, otherwise the
-		 * internal state of IW612 may be unstable, resulting in the failure of
-		 * the SDIO3.0 switch voltage.
-		 */
-		startup-delay-us = <20000>;
-		enable-active-high;
-	};
-
-	usdhc3_pwrseq: usdhc3_pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
-	};
-
 	backlight_lvds: backlight-lvds {
 		compatible = "pwm-backlight";
 		pwms = <&adp5585 0 100000 0>;
@@ -161,44 +130,6 @@ backlight_lvds: backlight-lvds {
 		status = "disabled";
 	};
 
-	bt_sco_codec: bt-sco-codec {
-		compatible = "linux,bt-sco";
-		#sound-dai-cells = <1>;
-	};
-
-	sound-bt-sco {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "bt-sco-audio";
-		simple-audio-card,format = "dsp_a";
-		simple-audio-card,bitclock-inversion;
-		simple-audio-card,frame-master = <&btcpu>;
-		simple-audio-card,bitclock-master = <&btcpu>;
-
-		btcpu: simple-audio-card,cpu {
-			sound-dai = <&sai1>;
-			dai-tdm-slot-num = <2>;
-			dai-tdm-slot-width = <16>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&bt_sco_codec 1>;
-		};
-	};
-
-	sound-micfil {
-		compatible = "fsl,imx-audio-card";
-		model = "micfil-audio";
-
-		pri-dai-link {
-			link-name = "micfil hifi";
-			format = "i2s";
-
-			cpu {
-				sound-dai = <&micfil>;
-			};
-		};
-	};
-
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		model = "wm8962-audio";
@@ -350,12 +281,6 @@ pcal6524: gpio@22 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		m2-pcm-level-shifter-hog {
-			gpio-hog;
-			gpios = <19 GPIO_ACTIVE_HIGH>;
-			output-high;
-		};
 	};
 
 	pmic@25 {
@@ -548,16 +473,6 @@ bluetooth {
 	};
 };
 
-&micfil {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
-	pinctrl-1 = <&pinctrl_pdm_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_PDM>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <49152000>;
-	status = "okay";
-};
-
 &mu1 {
 	status = "okay";
 };
@@ -566,17 +481,6 @@ &mu2 {
 	status = "okay";
 };
 
-&sai1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_sai1>;
-	pinctrl-1 = <&pinctrl_sai1_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_SAI1>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
 &sai3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai3>;
@@ -647,21 +551,6 @@ &usdhc2 {
 	no-mmc;
 };
 
-&usdhc3 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
-	mmc-pwrseq = <&usdhc3_pwrseq>;
-	vmmc-supply = <&reg_usdhc3_vmmc>;
-	bus-width = <4>;
-	keep-power-in-suspend;
-	non-removable;
-	wakeup-source;
-	status = "okay";
-};
-
 &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -808,40 +697,6 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
 		>;
 	};
 
-	pinctrl_pdm: pdmgrp {
-		fsl,pins = <
-			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
-			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
-			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
-		>;
-	};
-
-	pinctrl_pdm_sleep: pdmsleepgrp {
-		fsl,pins = <
-			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
-			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
-			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
-		>;
-	};
-
-	pinctrl_sai1: sai1grp {
-		fsl,pins = <
-			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
-			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
-			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
-			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
-		>;
-	};
-
-	pinctrl_sai1_sleep: sai1sleepgrp {
-		fsl,pins = <
-			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
-			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
-			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
-			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
-		>;
-	};
-
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
@@ -996,59 +851,6 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
 		>;
 	};
 
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3: usdhc3grp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
-		>;
-	};
-
-	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
-			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
-			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
-			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
-			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
-			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
-		>;
-	};
-
-	pinctrl_usdhc3_wlan: usdhc3wlangrp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
-		>;
-	};
-
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index b88876bb7128..c6db9c85f2ac 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -11,4 +11,210 @@
 / {
 	model = "NXP i.MX93 11X11 EVK board";
 	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
+
+	aliases {
+		mmc2 = &usdhc3;
+	};
+
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
+
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "bt-sco-audio";
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,bitclock-master = <&btcpu>;
+
+		btcpu: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+	};
+
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			link-name = "micfil hifi";
+			format = "i2s";
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+};
+
+&micfil {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-1 = <&pinctrl_pdm_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <49152000>;
+	status = "okay";
+};
+
+&pcal6524 {
+	m2-pcm-level-shifter-hog {
+		gpio-hog;
+		gpios = <19 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
+			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
+		>;
+	};
+
+	pinctrl_pdm_sleep: pdmsleepgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
+		>;
+	};
 };
-- 
2.37.1

