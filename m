Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066E1946BC
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993885; cv=fail; b=mFmP8mQfAcp3DC6JaXeX61T/2LddOT0yWIpbDWzHYHy/Ep7vCZRVNI/1+00LKRDjpD1oP6TYDak9FZ3XRmRz61ibpJUrzz6wlNqzzg41l13iQZmo/gjL9A+Oi5TMU3wzfiiUnFNEQTSunOMNqw+P/lCBsYmACF0/204x85Iu4Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993885; c=relaxed/simple;
	bh=tyGBWj7TsT9Jn69P3/YDYQqqdxEVdqCGbAgjqgP0//Q=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=u2v+juG38mER4fs3tzMHLc9IT8IkusWxhNTV641yzCmx/RY66lc1KYfZmh+YwD/FuRnVLICubMEctE3C0ackO4GpBM5EWkmsnpGhaeBCxfrsRQnRu/9p9mxOulnGAsz9lgS4VgjAcOiMKuI/FnOm72bvICrkG1OIWkWlPCKVLA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dnJmUY4u; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dnJmUY4u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRAiOAW/ogqmuQ5p2O6TCopo/pMFuPX29mubFD10ja8b+uPnIhiccsSE+cg5qSjelounYi61zk+PPoHo2Bykc1qIllx4CZyKmGYKlnN8ZaB664Rv6FWNHXAkWlMct5rsqLZk5Jrlhl0WUshqkpOVF5C4PXKplILB5vxDEasgMNK/WN4pRf5hT/JtCkYU6nX7F6LeUN2UnXPfQe2LdVlfQw62rrm4oqyQwbdghGGHZTkMJxyI78rOMszoYarF1GpAFHuqL+MGyLq4VZV+fAwDcUB9XDJBxtvxi4jPf3yIJ3pWVeaEMqYZUFTcCHK66SoGT9NOY2LEyR0l7sgdatoCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf7itIToiV9SqbN9+ntxK9v+Il2Im5AzHDVU4hj5Hcg=;
 b=FyhF96TMhfncUZKpMPUOEuUx7rHKI7xO6oe53/jisXbWAEcZT8oL16KWLrDbtEr++bB10rHt6HgriNc9fi3atUDYkP9Ca/1fz6LLUgW/N25CLR8+QB02BNUudUJxsBVsPlNTXmixrtKz3BtoNXNF3wnqM9MbLvwnVJTkFCk7B7paXHuJo0aQkCssUaOllFl6LmnjEW9L0/PJebmPJVdERXs4UbGHltw30FdZO1TowIg0KBhPqs7eyFsFtm4K5aFjYs0rcWb1JVoN28eyYGObJiPl5X7OEIihSxi8q/xkUXC6dG21bWFXtaD8wFtJ0yUjh30RXVU/1GGTK6ft2bRAcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf7itIToiV9SqbN9+ntxK9v+Il2Im5AzHDVU4hj5Hcg=;
 b=dnJmUY4uNfdRA3gIWQcESAoRpWAbwMGc3Wr4OfySHgDk7piDrTi+xPFABi+gmc85eF/n2X8/GrzrAk+NbUjoWei4DKWs+ZFySzKZyYxGH8M0umu4zqCrtQ0hdL0HYdO5IPNgLZnXjI4lRj/NfkYji0ykS0wbBSdBLDEoJkNCP92GnnHoRQ8xmZ4/kxlgsPkR3S7LGTTc/bdRCDXsBT6DFegYV6hyw3+e5H3y/sxAeG5F6NgE7RHM17Sh3evZWlBeUZJZxTtx539HLHnyAl9zU8iUMkyRGwfYTDIyPbm7+XsKBWmOIVpjXkOD2HUnPmkyXUYe56RjvFxsPoT3sfOQFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 03:11:20 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 03:11:20 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH] arm64: dts: imx95: add some USB3 PHY tuning properties
Date: Fri, 27 Jun 2025 11:13:48 +0800
Message-Id: <20250627031348.3455547-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA4PR04MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: a7873355-3e2e-4613-2c4c-08ddb52849f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aWFZP9REdzv38sAa1xdzyL9p6+TU/FWFK02OR2C0t5yIc+2YnbWVAzIxc01q?=
 =?us-ascii?Q?dWE30Z5ms63utl33N/rdXGHf6L7vSG83IjwnbpP7ovYGtfHtO0pUOzpYJWxF?=
 =?us-ascii?Q?n8RRX6UxytSgRWKzAqNb0MrOxdBvdvLDKcH8PgEUjJGgLc0ttK+Ul8XpZmvC?=
 =?us-ascii?Q?eAc3XH8s475m2K1lgI8CyacpzG1ZiMrSl3TYj1OSVyPbhliE926BiwlsPvGR?=
 =?us-ascii?Q?I1esO6U8Bfa+iX/oTalZXxWnXqOwUaARx/pxQevfKYaLrrE+sbt5bfyzl54H?=
 =?us-ascii?Q?yxh1VX0GwDcZ3c0hUvoRjeizBnM8glfLoKsdWzoFrTP0TMC+TgRs/a4QWvMO?=
 =?us-ascii?Q?qJhw3ZQLxprZkuthV9aRxdL/abM/JKQVT3AdK3FXGqxFChsNg53DkdKTPxqX?=
 =?us-ascii?Q?QZE8GGDMLgw/X5vk1/iQXBVT2tyk7/BOUWGaFe47SE4u5KCLKjshFG8HwcAF?=
 =?us-ascii?Q?rE/fzHjtERlWaND7T8yrOWHq+N48cgCIFpa0i8flM+pjHzfRblEEqkc/2ZYJ?=
 =?us-ascii?Q?24WMhJf5dzXgVQOlD52yR+g+8XWohxjgGKJSXekf/XEmH9fkI2zsEgIyzAcX?=
 =?us-ascii?Q?CgATeAr+n0HWwA1kBingnoOptjgikYmBiqmGRCjj0iOOB2p1dvyhHTQllEW9?=
 =?us-ascii?Q?fVJmvxWGXLGpdejnhmPnXeSjCAOVH6u4cViT5lEqYqoYMVYIGxnuOU2DqcJ1?=
 =?us-ascii?Q?cNvK/GwP2qUr1YXWTnan6NuHAUJPGIKA4u0i1XiCsUMLT3ZNzaZaXQthWw1L?=
 =?us-ascii?Q?gzeUOwTdVNCbpApXpoySRBEVgQJppX+lq0mOfXkvBjd32wS5SdFwiSA5xHpJ?=
 =?us-ascii?Q?pWqbzVuS53AnIDzgocjPpbfYKNM0ssMDe+by648nXpuP7B88waAVhAmnsv3m?=
 =?us-ascii?Q?GH43A4/bJurjjDshLdbwQL0F3kH5o1+Ba35Bu6OI0LTjxd7I+P2q8tc9ufGo?=
 =?us-ascii?Q?2UQZfd91JXMhlA/FnALnHDn7BXBh/DzupvGTRd4j9080+KhpQ/+midsvZo3h?=
 =?us-ascii?Q?qE41Xqs+iD5T/7z+hrBB/jjitr6GWrImi7mq8IIIc8DASmq4s0asNwRXjxwv?=
 =?us-ascii?Q?ItuTn0PlA0gxEOlY7U3na3DhLyBCIzZAJhpVbNL+FGCWCdd8aLXjPDengVti?=
 =?us-ascii?Q?1hALpgcmVEzEptBwsSIK0pe2mKRXM7hGf9fHRSffZNDtcBou0K2gf2/FQhTm?=
 =?us-ascii?Q?EoJev/r6x3mu3uJlVE30iIbDBsQLpqFzQ4/VULOqjLChPWv8aZHqw8l0jKDy?=
 =?us-ascii?Q?t9+bl2QyWJUTGYolW7duuHuCjAUacUL5G0NTkQAgh3lCn3B9LzJQcD5vNM//?=
 =?us-ascii?Q?3eSbp8XnyQdDsW+bN7m15uxyUbHyeCpGD3tUFiKaiKw920OK2Joaqcl86KB1?=
 =?us-ascii?Q?uzCpwX9s0AXLzELrioTD8R6RWvZO3WoLmjYnsxM54u84GEubdmHaZUmXbpSq?=
 =?us-ascii?Q?xjaii2qMVI87S2uQDRpYxKGlEr1Jur3osKb02wVeN/c9VItbjTtdFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RwCm6Z04LbqzGDyX23nhFen+LTfRHCQeLhRbHGC0tV0367pzeNM+l9dcqzrm?=
 =?us-ascii?Q?/CE9uhbaik4dg9rfMcsLot6Mjd/eJk4MfSwK0wg9+4GkeXru15sOcUpCNqrG?=
 =?us-ascii?Q?HgaQ91ttHcuMFbh48xgIzUyV7m7P9Ljg3GW7fC0qdCmGT77JfcW7f9f4FZ/L?=
 =?us-ascii?Q?kA1Zvfo/16gcZGHbvbwSveyI9ngJtAVuimbpEZLjojwLl9uEPeU5BSWX3Fwg?=
 =?us-ascii?Q?z9QLLGQXmmtuVSJNbGVCS2jEZ/oa6Ex1+99rFdGwD275Kxo+70Z6UcvzXcNH?=
 =?us-ascii?Q?I88/dZXj+ZRrJlN7xmsUQz1Zo/1zkktT+ndhJoP0o+GbvNanv+91A6r/vO58?=
 =?us-ascii?Q?QMELFF0RKoCGEJUHVEFms0UHM41WK3F57sn645Emmz+lmEwwcLWC0UXjCwyP?=
 =?us-ascii?Q?ym8Xa/tMrMrNAUWNDWVllmYN3K3gIqakfdlJfVjjcYFvE/rusvLcWacKsir9?=
 =?us-ascii?Q?tp7Bt91rV88/kiVbDc2pDWcMNwHvtDURbhAhIBaLx4BIgb/V3+IvfZerMBwD?=
 =?us-ascii?Q?iWabfFA2Hsp02xIAAQN3HUtDZaUOdnW7rfK6Giv0Ty7HHBrTTx8LZgoJLhpD?=
 =?us-ascii?Q?QHpV6mee2f/HxaY/P8VqoPEQELfM5vy47spdCC3QsKuw1igwuTQomheMRT/D?=
 =?us-ascii?Q?mkXstX6huZn/7xu5WqP/IKYikszW7Z3/Bn+DNIhdzagLUtDKAKOjrJZocN5g?=
 =?us-ascii?Q?Q3s3Vh7M4wrLI9hO3ahCdUnGy9Qen1EMtvOmDDXHlkrdt81tTQzQ20aBgLFT?=
 =?us-ascii?Q?gRDt+Bqn+rTg8KU4g1E34ruehxJyePvEdHfIVDW/Io+QrDj57nUQp5M/2zGd?=
 =?us-ascii?Q?Zx3a3EBOWCIqqBWHu4CZoTRAGAlS5p4WVrlKOXOl2JkjZFYrv33zJ06cbqUK?=
 =?us-ascii?Q?F5l51qjgT2fBLl1+zmn7+6miN36KG0uqp4cWGtgAmcY/wov5TYZ7njB/pinp?=
 =?us-ascii?Q?YOe63pRfPQWnYlJvEWgf/SwtgVeh9+twuzUplTa6d9vqGVCG7iqqoqLaTCKq?=
 =?us-ascii?Q?yEpWVKSW6zWwqt/0dqosr+vyiMAxKPkl8BTEg8W7zaVjO2k2WLCio9odwK8n?=
 =?us-ascii?Q?WCT3GQHXpzoU3w22c6z8EEHqSIObJY1s86hlMnKi6VLBPXueNHWpbRYtZLHD?=
 =?us-ascii?Q?eWeISaCYEcbaGxVWQWPgtA1anIsLWvuNOkSH9wRS/IDg+vbw6X/0zUkJcQlG?=
 =?us-ascii?Q?PVCn2cfY5uge1AjiICcqs/6yGU+RWWCiPP+MWdtMfTNQcLie2TuD31/WEXec?=
 =?us-ascii?Q?BuMBI6kZtpmNUVt7HuY/A6JKfEKV/gclDdU6TN8z/Dek9RG4/0Ech4PAxzL1?=
 =?us-ascii?Q?Ddqrtw4Yb0LhtKkk/bRA7ScOrj8ykPq861IPhZ+StufSL9ND0GkvniRS+EFc?=
 =?us-ascii?Q?s4m2HNGxSUedOVPL1hjh/u3FZToNYC80ZQfsemNJDjRpsFaxyDjGVask0RyH?=
 =?us-ascii?Q?swg0KLZURFOO52tiAqOjIx+J94UzK37qfFlmDBkUU9pX8vSqVaLiaDxr+MsH?=
 =?us-ascii?Q?B1+rtt275Od4aRPV3hEs+iPpE176MUt7louhKySX+UAGDlJfAcdiH8I0tlO/?=
 =?us-ascii?Q?OzlPOUcWEP87m6wlrFpSHjaSu3Dgt1cbS9NZEP1F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7873355-3e2e-4613-2c4c-08ddb52849f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 03:11:20.3642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MdJlSSGTDcZugBJDPuRtUuUZg0xkUFtJLAdfVwZbaNZhfyeGvBA+qFObG8hNwK/fhFH8av6JTa21Zj44ZSPFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789

Add some USB3 PHY tuning properties to imx95-15x15-evk and
imx95-19x19-evk boards to improve USB signal quality.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 6 +++++-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 6c47f4b47356..b26e9db7832a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -1069,8 +1069,12 @@ usb3_data_hs: endpoint {
 };
 
 &usb3_phy {
-	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+	orientation-switch;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6886ea766655..e212f12f869a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -514,7 +514,11 @@ usb3_data_hs: endpoint {
 };
 
 &usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
 	orientation-switch;
 	status = "okay";
 
-- 
2.34.1

