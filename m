Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0F27735
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897312; cv=fail; b=EtuBKUaSXZ7GgNwZ03D1ex//4jdQr5/+BaP1iCZN7pG/UlepI6zNYI5F3oKrGr5IBBZ/CY3cTJy8eoA2TVxFMCMJ3YhMqEeTM5tGHTKY5vqkmFZHtkZaDGtZNcky4grjekTlffvvz6htWs9CqhxxBlXYWGDBkD4VtBJti5aWtxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897312; c=relaxed/simple;
	bh=icR2E8FbBfsN7x+qCCN5FPHXMVUyngDO+5esRg0KiBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GwMXo+lsmYVTR91eZj5QuWtiy6wMAUaJ7j8OO7gxAdUAM6YGUq09CJZyoFw/4kNhhb/R94127FoLohRJs7/V1zAde/nKBYX11wf220Vjv3Vs7+p2/A1rNQ8aIn0lZtK3lx+zKQYNcY+pGXZz5RFz8Px+KUOKkU3tOe+uesJQT6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GAe8Dy2r; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GAe8Dy2r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sock62ZA1e2eBP+nyDso5TSd6Ig0IJh4V7BivQuHxf9zk52knQo9N2YcA3j4VFIzYl5bubCykeYkm4Kx8Yf0V13rf8tJZhLN6LIjrxm9kBcSDuB59vdmUPGdhTK1CkYFIEVCe6ZBntS24DOMqZTQOxqvFJyMHgDt7bMJipjFBjOG+BNSfU+GQ3gdYLCJxEsytBtcfMhES4rpwxbuqBIRlLAMFgWI4HFhstYr3RIOOoo3qADcyk7Vrrq6UJJT6IlMK4fvkh85eMvPGxGQxRgzUqGxAYdkeNi/57jG75Z+6jLa5Xg5TZSHflL+XWfpV3K47atj6GIcOi0DKBkpKIf+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtWoIT4YVaRDVdW+Z0Ss2cG3TV8KQkNe1Va+BnV0oa0=;
 b=j6dbZFApb3h8+ChHySmXgtJMsj8aEXLHyhqKjXvqFhSMZ68FGuzPf4aEzRJbLv09zfoT4sdF7zU0uo836oxyXvrLfAfP62OnMHRGXRt+5aYuTDGxNLgiGtrgFw5H8Hi3MFHDWYEokRWy8l5HqB6IsG9xBVdd9+IvXC3hRykdDmsSHkDuIiqPGg5fVVw8YxdmpppjzYJCAYiLBabhUFHGVpTUI9robIc9TLwuwZEd3AQffmmUc8A5ojQ68vTBC9qv5UBwO/ZvJS6qPAPGuEyI3uDIuZqlm5CBqj5vKTTQZsHVFyD6p76J+TpN2j2loEJmH1IMOoKs4A9jWgtr4Ces/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtWoIT4YVaRDVdW+Z0Ss2cG3TV8KQkNe1Va+BnV0oa0=;
 b=GAe8Dy2ruw82WP+7F4f3A0r04WglqciKHEwlIvTYGXKHF6GSVGevJ2bOT1nTRGcgfTng3nUNLNs8HVDJf01KESi9kmO46zGBQ+GMScRmkI8T1scssi2QYvV2AcJXBxjq+eEFxfJd31+aG5q8Ht9TvgZI7Yif38RAaW5zwePM6+XA/OjHWPJCUoUYTyAyacCYTva9N4/2NnuKDG7zwLbVDn/NDOAIUjavFY59spB/MueNtsWcvNiC6DY6NImhMvaKqQqVIbC7EG21ED9C78ri6OAKpHrprvFOb8a8OJglmsFyGa5143BIcsYqT3O1lJ/uogDruGvfNakn+SBsvms93A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9698.eurprd04.prod.outlook.com (2603:10a6:20b:481::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 03:28:27 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 03:28:27 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] phy: fsl-imx8mq-usb: improve some tuning parameters
Date: Tue, 29 Apr 2025 11:30:08 +0800
Message-Id: <20250429033009.2388291-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429033009.2388291-1-xu.yang_2@nxp.com>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: 408cd265-8f8f-401e-c61d-08dd86cde75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pEtxAs8Fna3osyvOUizBllifUN1cdcXddpOYGLskA0EXyQU9BfZzN44MzPnj?=
 =?us-ascii?Q?zcNC2FrL6Qqk3MIqeFD0jrppm4bcCbSZIDfSzRqe+gH/PX0Oy0BqhpI7jDSj?=
 =?us-ascii?Q?Dj+1U2jX0p8yb5/SMKLODx5wgMyaFljo5JGV1SQymPeKTTpSdGCakgkNIq9b?=
 =?us-ascii?Q?upOge7ICV9FFy6gNDvxHx/vG3K0eU3Scgnpx+fowhZWZ+tgJGnWdENijzGEm?=
 =?us-ascii?Q?hCm7JDO47+FFdOllotgTNSBVfM8igHWufulE7x4i7tlz63N1AwtP72o7Y64P?=
 =?us-ascii?Q?SplxZrEpeaInN48yTNnhGuRXzJSpJAUz0S7x5w/HxF59nThbIqez0anrsO+O?=
 =?us-ascii?Q?cBfOsbI1eTZqzzxi/ymeoC5TkKhGBiPaJiId3luS+az8XlsQ+pE5k62w/AbJ?=
 =?us-ascii?Q?44o7DGOId2Mb0Yg9KzMVEmAuKFiqPp6SiYKpxQvf4uWbl+wf6MkSxdFVOZN3?=
 =?us-ascii?Q?EZ5NJ7QgxGl9ZKdB5mIJAyaa3YY9JCkcX8VWYveWJFER2oz0UnCSTb2J3NEr?=
 =?us-ascii?Q?D2YApvWxubfWH0PpQcJ/gN2Nc9x6KZRrevQAYss8L+Uwr/IbKtluU2A4IjTH?=
 =?us-ascii?Q?ejwGXGci4a/S8Ou7JfLGRntW+r2t14LwwPWzIlqTA09L6jnr1ow3Kp9X44LU?=
 =?us-ascii?Q?AH5dv9bebxEoWf2z9zj5O4aublXPc2jul8Q9Wz+7knFFzEdTvEDHZJfwQOvM?=
 =?us-ascii?Q?5awDPJ5j1CkG5NCkTzHp4tx1LSAjZuj9crOAzlyxeXPXjyBLCFhhLekkUQb3?=
 =?us-ascii?Q?PVrXC9cGRASJVe33p95gH2AkjVDoH/m50O4LifhDG0ZHh5yd6R+zL4LXOniv?=
 =?us-ascii?Q?41QqDbLqVvtR0VZ7UJT8IdokkiLbKsrM6w/7DonsT0SoS7aGpOuBSmmM3yMG?=
 =?us-ascii?Q?tJ5IQFDYlPseq020LD01oMj1E7/mr9kZmC0/QWIDVTw21uMciUGy8nhhYj5a?=
 =?us-ascii?Q?xbPY92plOtstJ/IBqmipFko21LbD+f6x1CJQevTaL+ANOQ01vNBSxcApWdW4?=
 =?us-ascii?Q?Csg0vIGIFAbWGYAmqiem7lISk8N2UbporO5tGwpvPe+heFhq+PYY6WKJPJq8?=
 =?us-ascii?Q?bsZxmrDez3ZCLJ0zKQcWg6CY1t8vnIONhbtRBkgIMSv0zodlpam1NFDfVkxi?=
 =?us-ascii?Q?wCMsBlAxzlheOIgF0+ZkFLnSQg8oSohkRiIfEd9Dnq7rOFV9QIk9ZzcBetRi?=
 =?us-ascii?Q?dh4bg9YSeYDiqOoSeRyrrBT5Icfh/BiD33Y42sarlgUPkoJXtI5R+9IpP5ys?=
 =?us-ascii?Q?ez4uvwIvgb1pwonk/UeAd2pDl4Dq2xvEYLk6YmGq01zGNwdNLpCOqJgXa4gf?=
 =?us-ascii?Q?I65Py4BZ0Rh8yXl/e+dGqbUEmBISxaQ3vjUJ3Tt3GmjP5X1XM7EXTp0XdXQa?=
 =?us-ascii?Q?rwXodHodURfWiPfGM1501WriI30/z+s6hs/mhPHvPETzEqJ1QkJQL5153vnW?=
 =?us-ascii?Q?7shcEyEi55/5PgG/cCgT6vGSUR8AvUt6Lnv8Gyd5nQ0RcHIWy2YKRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?088yTYNgbvMDQVNKc47/F5ZUvOTzqPANC+fqxha6vTRRh5zMhEZ+GTk4IU+m?=
 =?us-ascii?Q?mc1UIHxGaCc/yvM48C67fEyxAl8ky31c32vcldRZbc9C/Sgjut/xiL2AdUGs?=
 =?us-ascii?Q?WeGOgmHPiH7AmkS0DrQdsVuLPxqUDYcoPMfCncTXlXuQ5yhBI3+C6vsocluh?=
 =?us-ascii?Q?mv092bmHIy3/mPsQKHH0nZwEpXRELVgKMK83aLTLrMaUwre/vlRXE2L8QK2w?=
 =?us-ascii?Q?W+k71DLXv6ocM9BKhr/sWgLNoCDFA9T5xrNk5LvsKPM4rSv/3JL6rqTvOK5y?=
 =?us-ascii?Q?A2xWGiZFp6OxeEbpcuVX3130AIuoag54mQ4fiTWsWnIy+h1ZjFQaDl83XMfq?=
 =?us-ascii?Q?Q6RN+RyJNkgBaPnueH6l9ZTjyrDFsSu37vwkMdqxbkbLnCwwvI6/UNXYpfij?=
 =?us-ascii?Q?y6PrrbMS0x5XxOuivHiwmgsq5vcqUCxGZ5J7h0TWP2k2TVv34vB02V71Jy5P?=
 =?us-ascii?Q?Pp1zyw7+fPt5GHbjjFvXraEC9dnqpCcVkNkzkEBnBX7ImnW+X/tQBB5sOtFe?=
 =?us-ascii?Q?Tk/9VamOs7chKp+LF7tR8lk3taDebQw4G5ALZXXjrx64X70g87w2jrBvZFI7?=
 =?us-ascii?Q?Surz965tyg4Bgidvvqlf+jCajx39TSlkgNdNy3jL/H6Vmg8axz3mfdUyfX2C?=
 =?us-ascii?Q?J0T4clZvZMnW3HRp7EGEA+nJSW/Eqg0F7lVmkcu4b9a7HMHZKEi6Tnm5Ov5/?=
 =?us-ascii?Q?1UFoPfUaDmF0e1oUHm1wDiFaAVIvmLL4wnjw+gxE/nAAnPMGyjUfyghbJTzF?=
 =?us-ascii?Q?fnMd8jlwynt86R6SWBseC9IWd3VaK653DlasopeqRkgZXIU+t64YLzr6Uhiy?=
 =?us-ascii?Q?bNO+5I9WebDO/ZLR93BdXqU96RCSywo7tXbDQSSpdHY58Ca0PSnw0CAA2JxV?=
 =?us-ascii?Q?3WCu6iNdJ1fYaAG5wVY3UAiGETzZrzK9wMOJ3RGXtzuxmZMLdiAGf8UQSw0V?=
 =?us-ascii?Q?h9V601pjInS+jzD7XvxUuqmwKTl1YhPGmoqpyWJ6Kgn44iuS65C9SkHcC8K8?=
 =?us-ascii?Q?rIY6XO4obserX6N5xcBJ8z5x2YN55vMykFytOTqhp7sRCdxAXCso/sIeVG6+?=
 =?us-ascii?Q?b7emZGOJUHNfejgJt9t+zJkQajBjDREs1Tu4L6u3fZGwrVvh8NOLrUJeh2uz?=
 =?us-ascii?Q?NZf/WLcYt544NosjtosLMaXHNd1VQqWmoNLcm9UuznSw5VIL3Xi5uTRGQksf?=
 =?us-ascii?Q?A8T81UsxG3jT5NoodDPzeyHjBSPtKbQw3U77koF/gd9+qNG3945AF20snTeg?=
 =?us-ascii?Q?A/BKFpr8LA4ee6MNbK2N6SlAYz2jPVMqjF+fpEtBBJbgVVPCDQpple4aJK/Z?=
 =?us-ascii?Q?aPpgRVg7u7AHzl1jew2Tt4qfT0Qs0Hk++4EaQg1w9HgnDsB9+Bd6VqOUEI0Z?=
 =?us-ascii?Q?QRPnFSOOHZcHFO/jnx/Xgvgr+zY1HHF9JCuoQoDjVN4ADA/AONYMpXqi4MZO?=
 =?us-ascii?Q?iXPyOUd+7RlcsGCcFz8XFa27z+8l3ANl0WhNcv7EuVTu2J+IDWNIjjKM9fmu?=
 =?us-ascii?Q?QuUel+sJhLjuE0ngroKfEZyBLke6OOSpyi90dR0YTB0rFdjZyRPlDVaLdgOd?=
 =?us-ascii?Q?uXEsDX+b+Y+jz3nplKYNv9veA6BUIY35lk6fwwqn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 408cd265-8f8f-401e-c61d-08dd86cde75f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 03:28:27.2175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6TzPjmC1mmtH7+ue7SHELtz5W9xyPabnzJilsqLWJH5mpWm73TX4Gp2G2y37G7Q233+e0hhfL78b1uYBAhQgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9698

Since device tree support negative number, this will improve some
parameter parsing functions to handle negative number which is
corresponding to the original value of register description.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - split out imx95 part to another patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 55 +++++++++++-----------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index a974ef94de9a..6c564b608539 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -113,11 +113,11 @@ struct imx8mq_usb_phy {
 	struct tca_blk *tca;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
-	u32 tx_vref_tune;
-	u32 tx_rise_tune;
+	s32 tx_vref_tune;
+	s32 tx_rise_tune;
 	u32 tx_preemp_amp_tune;
 	u32 tx_vboost_level;
-	u32 comp_dis_tune;
+	s32 comp_dis_tune;
 };
 
 
@@ -286,24 +286,24 @@ static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
 	tca_blk_put_typec_switch(tca->sw);
 }
 
-static u32 phy_tx_vref_tune_from_property(u32 percent)
+static u32 phy_tx_vref_tune_from_property(s32 percent)
 {
-	percent = clamp(percent, 94U, 124U);
+	percent = clamp(percent, -6, 24);
 
-	return DIV_ROUND_CLOSEST(percent - 94U, 2);
+	return DIV_ROUND_CLOSEST(percent + 6, 2);
 }
 
-static u32 phy_tx_rise_tune_from_property(u32 percent)
+static u32 phy_tx_rise_tune_from_property(s32 percent)
 {
 	switch (percent) {
-	case 0 ... 98:
+	case -3:
 		return 3;
-	case 99:
+	case -1:
 		return 2;
-	case 100 ... 101:
-		return 1;
-	default:
+	case 3:
 		return 0;
+	default:
+		return 1;
 	}
 }
 
@@ -317,12 +317,12 @@ static u32 phy_tx_preemp_amp_tune_from_property(u32 microamp)
 static u32 phy_tx_vboost_level_from_property(u32 microvolt)
 {
 	switch (microvolt) {
-	case 0 ... 960:
-		return 0;
-	case 961 ... 1160:
-		return 2;
-	default:
+	case 1156:
+		return 5;
+	case 844:
 		return 3;
+	default:
+		return 4;
 	}
 }
 
@@ -331,27 +331,28 @@ static u32 phy_pcs_tx_deemph_3p5db_from_property(u32 decibel)
 	return min(decibel, 36U);
 }
 
-static u32 phy_comp_dis_tune_from_property(u32 percent)
+static u32 phy_comp_dis_tune_from_property(s32 percent)
 {
 	switch (percent) {
-	case 0 ... 92:
+	case -9:
 		return 0;
-	case 93 ... 95:
+	case -6:
 		return 1;
-	case 96 ... 97:
+	case -3:
 		return 2;
-	case 98 ... 102:
-		return 3;
-	case 103 ... 105:
+	case 4:
 		return 4;
-	case 106 ... 109:
+	case 7:
 		return 5;
-	case 110 ... 113:
+	case 11:
 		return 6;
-	default:
+	case 15:
 		return 7;
+	default:
+		return 3;
 	}
 }
+
 static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 {
 	percent = min(percent, 100U);
-- 
2.34.1

