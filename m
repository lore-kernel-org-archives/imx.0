Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5D3115BD
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214761; cv=fail; b=ufGmFuGM15wuVRrc+CQJQ1sKuAwzRid88BahFJTILvFpUjEAH0SEhppgOqLIj9mLWVb8oqTGNLbymjPcVkQssdHSGph8VDAKp/l2dDxIBBT3/SfGRkNgvPTVmzXjDeOdxdsrZ9WCoxruISuSajkhmlKTPQD89IS1CVbhlmUWBm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214761; c=relaxed/simple;
	bh=svNl/vPParnfXN2b3DlnJwxtaesXQdtDyT5phk/YeKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f6ZzQ3Bubi0PgtlzFGglG+y/D7U9A9PG5dn1G75rYIpshIJVpekPBjqsmEkrnHY7TKcB4NkU6FJoUXzEKuFXjPrh+mHTZwbtI7ZrXbqOQzV8y78TsgfHjzp5ePyrw936daW02LQMJ/dwRHz/QW1l1pecGN3vVKMxTmvsMfAhx0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ExckCRk/; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ExckCRk/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTMsZZY+u3M6id6Bi7yPzxGvZ9/m4YqUxXaJFT72azZLrUTDfq+NLdk7/Ji9DjkltsJ29h1kPcnguFhT/o3lERKht/Te6EHahcDbh/IFsXFOp0n3HFXvI6BBVuR1GdR86+A4DU9IQkp8p8lyglN8oqJFJwWZgqMHwia5gtmUHjFZC1YU2lRLUbsKfQJfoTh9cSCCHsVIYLmOV23+FqUKFY4s2HFl5M/DAugTCkZyxUZuDwY35V42jVzDVeTWoDL/u2uAzS+7oEfJ+1nZYnjGLfvSpP2OCOQFd7WjSVqSfIWhvfBivPqoA6fMwQwDDi4/Al4qUUJLWl/MdJOemvWIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp8HSdmmR+14SDCnBGqQ8apDjEHM9QM/RW1CWl53Uu8=;
 b=hIV8SUDl1tqpVbzUwt6PXc1Wg2xDf3AMqA7jBfftmm7cg3P+lgPWSMZcAls/pHnq+gDi+zfIlEEjHAohh3G03wxPooGqp7H2tIKRxdpYI2GsR3EANrjBBo6pNEngRAbtvFwSJ51A3vNUiOTNUi9y4TWIlNZ4KNFrCaD46RsZeWrsSeHMOktmobAHTfuxsifdFIaZFTwchZNgHSArsG6hHE1lj9c/jzdnBVHYhdlzOn8V+/LEyWs438b3CytUUXJ+wXo9zAMsFlW23boaI1mZsh5xfOsCoCqg3N7pJp2w1cHjSwsbhqSjrfIbSab0ML3m9BEGu8xuXX/5M5RKMZ6qhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp8HSdmmR+14SDCnBGqQ8apDjEHM9QM/RW1CWl53Uu8=;
 b=ExckCRk/fLn1Sur5iF+AaMqX8LmNWiS+rWL+kDo/u8nWmnGeAZFyBznNKRm9QTi23sLuMhd1pcyGBYbVa4AyEzTebQqCEFQBIKRjgJ+/Ugt2k9cqymr5Hb3HvdTfcx6Xv5Drc+x5nGIBAUuOxVOGIiWx1a3vJKXxxOyudENjY04wfEvrjWLPAKVkY7CS3iUB2Oh/bnABuDc1QkHdwiw3fwV8GsxMH0G3BSPX8Zp5tbBB3UVIa9ctUGg2U+1mcc6Y+YTPXJTMdoVAt+h10XAM5DZjCzRYbUZqYIKuaCktQBswWT4LvuSNmp/1kNy2cTGg/3mwGkh/SFf9+hOxOTuzag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by DU4PR04MB11727.eurprd04.prod.outlook.com (2603:10a6:10:623::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:32:37 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:32:36 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
Date: Thu, 20 Aug 2026 16:36:18 +0800
Message-Id: <20260820083620.877251-2-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|DU4PR04MB11727:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ebd4af-a9f1-4bab-2d07-08defe959626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w81JSCJAFxcm7LlEY4ZB21WW5wEkR4C897sncVVBzHnemQagaw5kCPyPvQ71AMTSH8YJtPcc70Id9Qygc4JZzqjDiRqQfvaV0Ua0WVols5G/cB6znHMb9oE0pp7i0N0ta32Xm7c6Ab9Ii+DBBCjAg84FxfL2hAMKC7NGZL7flKgWDPfWla0pp1OKX3HCICGIh5uisDos7mnBSBg78Tq6UGxvaSpJ/tncoDyHxoZbxBNBCFVsLUIU1+u4UanG076DgMMP6qfCiimOIfJHyvBXcuRD/QZK8Cjqh+D1YqhXSmYLZWgf/16r4dJ/FOekbbuv08DsQrJV71p2JbafPEpBCed/wfqBQiuFYT7i+nHRYaSpsI3nf3if6bqpVcySOxqIjk8ZzC3Ttl23VtjzP7QaR0594nGrYyZU3sBJOaB4nN6BTLeKcqkMpn4UNaVpKld9sz4gbA2k/wWcjP79gTJhUUaflxTUeYIIv4Ufp4RVJEQpYnp+BdoPPSHmIYHJd/DTRe0kiKRwzteoBRzPXgasPTR0dlxVKlkd0D8QZ+eJgRNaFFo814DSmh91vTjTYjRmzJe4QYFg3MYkl8zP2QefwBmgvMePu3t7jTe2YWuB54EDIhH13lTknn0b3W8pPXGVwTtmq4KuUSsXYERCBil8PqnYL1w0e/merXgnqH9Usds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IheBXuwxUlM6+ftyC7ksHts+Mlq36O91VyF/MPBvzqZ8oFdf29mgKrdKgQuz?=
 =?us-ascii?Q?SqBLocoR3XAgL6kd5bIRsoB9kA7C0UyJveTSZptX1uji/dadncv4XoWF/oon?=
 =?us-ascii?Q?k+D4VXut2F4/kTOXSnMMEiWhrafWNiDt3Mu3+N0R2LQ38ygyk32+ADJAWJha?=
 =?us-ascii?Q?oFmhlWYTtw+wCe8UzDAX6cmkAihm6rU9VgdWg/iiNLL3OSinLZpvhuCAOvp4?=
 =?us-ascii?Q?ti8H4ot3xggjFfp6wtVuqVon8hS3A+Ae+OONgzEWmD3rFfZT6VUdL5FJl2eI?=
 =?us-ascii?Q?JKb766L4oUaJNe39pdkhv+7vx6ZCe87/lHLiuaUrxZwxnodd7xDRYxNmxw/z?=
 =?us-ascii?Q?v/am03RqNLZ31uQnGbpxMCPELJaVo4HlJ6r5T6e8dgfrfz9jyMVbWJ1HmG2L?=
 =?us-ascii?Q?xua6Mh2gAWTdkULf3rDchs1WP4UAzpB5J1jzJKqZ1Eujqsy6nAmsRBNeXIzT?=
 =?us-ascii?Q?WyDOOMb7xJQ9gI3QqEm+VByH4Rpv2Q8Ra+ti4QiZO13o/nqBVfZMrkcy3uYX?=
 =?us-ascii?Q?xw4SnOuNGgoVxuyPxHSXXF4QqZFxlYMhN2E79IdcaKFWSMOIFiSbiP+5e3uj?=
 =?us-ascii?Q?HHT9MSCCCr4KfCl9kl1nM1At2b6wBOCkV5GwoUhAwtBnv+xLqULjlzS/8hKL?=
 =?us-ascii?Q?D5bXs9mbYY6BU5pLKntpTflp/rLXFYCMpKlcqSD8nN9u2lVxGyXv4dQq0DkM?=
 =?us-ascii?Q?RDVydNekh0kh442vGeIqIx0UkI0i0Jdl3NTkBm0jqCWsca0CS5Tw2NMG5WUR?=
 =?us-ascii?Q?FkFu/ueZsVm1d37kx5LtD4lZ/fAKsCgsNUDoMu9JzgtDQnebR6vmuoOZfJ7v?=
 =?us-ascii?Q?Ak3uSMKBpV2VMgXfXxZGLcooSRmRvDQoBYQYJoznzrcPdJeKIuztAMwPB53m?=
 =?us-ascii?Q?xpsCRj73lN2Rv4ATM1VLlDEWDZ6+SprmXWaIwTD7Euu53aGnB79gN5PijNyo?=
 =?us-ascii?Q?cKZvt5ahzfx0UtOQFlO+xhBTEuPi9z2KodBiidQQ+iF78wRzxFp7cFcfbVBU?=
 =?us-ascii?Q?7T98/Bi/eLZK2J39vvrS/1lastEnBIIpbK0JFlBqsPkPPInRFLzJpsncT5uR?=
 =?us-ascii?Q?xEhcYf9EqXFmf3vduj16CutLjhXvmVyslSRhTqZn779DDwp4vWHQ6rzMSgQI?=
 =?us-ascii?Q?ypc0oi5JYTRsdvzdi4Y3ut4wto2dcEhLXo5CDL9w2X2Ubdy+ESQf2Q0RuuF2?=
 =?us-ascii?Q?XcWe4puU/jLZxgdqZYBgBBuftBlnJByxKLjtjylHWXG6xh+S38SzwvL0WSit?=
 =?us-ascii?Q?TvBaADaz1DpGSCTyE5bdDHMp+v8YOKhx1EVeZbybYA5GEpJXK55xmtNDCee0?=
 =?us-ascii?Q?qUTIeZVpvCmr9Ko7Nq767NGZoZWW7HQIKtI8xkJTxd4HM6seFghzlrbNPOcl?=
 =?us-ascii?Q?gFqRgzeMHSZjMuKMNtS3cCgTnlNG80YwPFVHBB5/VRl42/WAH957qe6J41H+?=
 =?us-ascii?Q?b3ye0Gy4n194VydKVQRvt06EIpdGyYtXcMaGwIMqxxrOWSkPVcbKObbMs8VQ?=
 =?us-ascii?Q?96JSSCCtleDEIq9ncvSzZ8pYrjcHfmZEW//wYeonifuOZ7/smFfcL0nk5d6I?=
 =?us-ascii?Q?etdgDGA9RiumuUmTvAw4CphFPzLa62qdkI6exjjQHW1zwylolNryvwFQXkNa?=
 =?us-ascii?Q?gNaVApm4nd1c7xhTQmjBoD8S2Y7Xt9aoyWe459xaxA7PLnnUvUfJQR5qWdoN?=
 =?us-ascii?Q?4uv/Ku6MiRv5z99JeB88FATgP1veAhlVKEi+UVfNKW+AyFXVG3OwlCDGrJFJ?=
 =?us-ascii?Q?TPw+HwHG4f710QPD3qI+weqRkNveQHNNZ9lqEYq17yTnibkA9TnI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ebd4af-a9f1-4bab-2d07-08defe959626
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:32:35.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QBsXfWGd+yF+791X3nA47BWXAqAAvxF6KKGiTgbG4c+2ucvOuv6lmjFNyg4X2BsboqT0pKM79VBkuEoPTv4uqIvWxMI/U4LJ5ZyOl5mQp4XKHKNGvKaAjZgRdtV2HX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11727

From: Richard Zhu <hongxing.zhu@nxp.com>

Move the PCIe non-prefetchable memory CPU address from 0xe0000000
to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
reserved and safe to use.

Fixes: dbecf38e60d4e ("arm64: dts: imx95: Correct PCIe outbound address space configuration")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 38fc47024841f..0f03b85aaec17 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1948,7 +1948,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -2039,7 +2039,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0xa 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;

base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
-- 
2.34.1

