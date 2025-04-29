Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80BA19EED3
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 03:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897316; cv=fail; b=X6Pk+tiMoWMOvtM8DU/3mRfWmM4xzv+x+ZsYEaqliAAPaPuCkABW7LggCLQCj1HDeJnC/aT8iNqigmeHld5bzn3h6NBlYEV5nyVKQd1AGoxyKNbrywg64OfYiXJLOcqrfECTkgjqdyZKf0gyPNg5ZDFj4wbCA0UORoCHWdNoDJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897316; c=relaxed/simple;
	bh=a5oqROXCUswLRoYB3cFC3TUoCCcVNepbpgxskIBVEP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZRczcgdstX6TCkbzxpicvG605IPFLRbN2Gh9nKOVIa2IW4ySmTnhCMshzgTLdWc592zU7iWaVfAv/GDLZotKPBDvXyQ9Qez7SLJ9u7YTsCSVFnnZlD0MoWGjOUwb1wt0wW0gJipUpRJSV8WAmIS//nf2h3cNMBE8i1phsZCW+TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ib/Owhc4; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ib/Owhc4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a72V5Og42kiSWqOk/hFCB1vRr/zBRWDVL7TfY2jRiP2un5Lns8mGxDBkr3dmev5e7OELiAsXzr0rxibvi2UKpdH29LCtewaCVN+iIEn+dwLCXUwgq3EjIb5UuwbZNEeaj/GhjWq3fBNp/wbeRUiKsG3uKPptw6BzslnKSeYsNDH7LXV6D1+Rx+qaWa+itl6bJJgeJhpzMuEUZleTGestg19GKg8wE+whr2fnp+KCbzRKuSLbkWvenfA33wQa5OfHTj9Keso5mgvBeiybSUGIGeoeTldm8APiB03ua/hYGr79dFlOCoeT7ZQruryOzMSv73zpPnWWMF59RVAETTQ7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6mCcPPQDWGc31QdR67W+5PA58nscpi1Co0IQl/Znjc=;
 b=R8gAu+pkZvg3i6eqAjc/nc4Wd+AdOOiqQ0RR3PEQNco7yGMByOF04cKgRY+rXuL4P08+b2nCXs9yS9exTaemXgKYWC3wvQZowxJyt+52dIkMNQy6W59roLJRd20u6ONdnUZ1HbCOIRMBePRnpuIS+0YacylwqRgZBwNCZLXzI/pffPB5jTRyw19cwjUqxUo5B3/TnNjpWAgTeBsB9VJzZriFSLhJtT0jkxjC1JVlNc2Tf0IIw6pZ/kCzkCjbIcLIkYIjR+7//sJkohK6zqzuBrBKO4lVc/XIZ3Cb8XsKk6yhiueRoVprzcBRmwbhKwObl7yzCQllT6EeQ8RdBsREVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6mCcPPQDWGc31QdR67W+5PA58nscpi1Co0IQl/Znjc=;
 b=ib/Owhc4b34zh4gmSKjokoSP7cSOEvSMVR64SkV4CvDmzwu1doGWMqDVNH9Ut7GV/KXoXJdnq73ZRqRUNAl6ev1Ofou3b6a9NSg3xETBTx9Eg1l2fY/mAKIeWGpxanTQHulSce5JVKJx4lfyQwGzeAq4JLglehdD0aJJKyCeGFjcy+Xjrqx8I89kbOU7mXeQPf3TnXd5ApboLtkdsoome6Iu1bUa8dobNU8MzQEMoboHEKkMF3VJ/yo6BbsMgVLNPJqu/FkP9tOwVM4elMTKv4IZJXRBPQ3Aa+4SCoovVu7f56kVkMVEWLG7nPJY3yBVtZknQOzb4ZDUBb0mtjUhyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9698.eurprd04.prod.outlook.com (2603:10a6:20b:481::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 03:28:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 03:28:32 +0000
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
Subject: [PATCH v2 3/3] phy: fsl-imx8mq-usb: add i.MX95 tuning support
Date: Tue, 29 Apr 2025 11:30:09 +0800
Message-Id: <20250429033009.2388291-3-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f63fc0f7-8a5f-4c0b-dc86-08dd86cdea8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1jm1dW6cB+YID9odNzRSFSBFcP3RBjgX1paRCL4wqJL+4cmAgGIZhqar/AXE?=
 =?us-ascii?Q?HWPJiS4QeRcsvqtKQEy33aB5QSrDnFd79bPiNAnqbXrku+K/MoJy6HU3lQx6?=
 =?us-ascii?Q?dSset0djCAgEzfHrtsny28sUTlKTnKPUjf6dM0GaulGl9gp2oJE0UdzYMYU7?=
 =?us-ascii?Q?DaluRkPeEyyh1y7lN3xXQl4tSKGkyIgl9ZGJeVyBfaAB7PC7TpT1bOPDeUCq?=
 =?us-ascii?Q?Zzw3zb2W4dyB1ielZ5zLiFlXZn9QMv8lxYJwtfPDJaJWkYy7MnW1bjmVLDbh?=
 =?us-ascii?Q?cYhcHKBX30ATuZzEW4DktRI0lOX5HA+vALqFkBaEwa9o0oovUJlFF4H6g4ve?=
 =?us-ascii?Q?mr1W20EfwdW5sS3ec+NXSjLNPS+UtWk4uYtqtID279ZlWsYO5H6rRQ4MADKE?=
 =?us-ascii?Q?zOz0lUa3EsdmjjvyJmE+RY+xo2jjjuX2mHoCvsm3A2wCq17YF7lQWxFi4HzN?=
 =?us-ascii?Q?EXo7auuu9O6Qv2Znh8kEPeInjVkvF4XBUmHyldpqSZaV36S1UsXArEGHx2PX?=
 =?us-ascii?Q?1Uxno9FDczHGCQHOyXY0bE69jxKhXPXc81LOu8e0jY+4df8ESuPTqhHx5WH4?=
 =?us-ascii?Q?aL8PM70vlbq6IqHb9trUp/kzDAUyqioXRNO/bkwBvLME3tKQWJzL7skBiw83?=
 =?us-ascii?Q?uZyyqg8tIF39ST2MGMbc91DoIY2wVM5wGSUIWvpm57Ms1sLi2PnWmyfwBFqE?=
 =?us-ascii?Q?yuYDcg1jrwHz4Lvkcb17+gxeXTtE8/IEluPnToGJezo09dwgYghQRzsG5DnC?=
 =?us-ascii?Q?oYrRkg9hmVVm93HeGgS8rwydHySoVq5ZweUddDrMQ9bmSc75vPq701pzGxWe?=
 =?us-ascii?Q?X8ruqsom53V0by8GUPZSCODu0VqCPryfOlmxhmxE9sXMYFP3+OB26gpjwkW2?=
 =?us-ascii?Q?0+bon4oFlUGzJhxUrzZ0WZHDeGR4enhmALlEBwinNqb4+abH4/rk6y/Z+sSH?=
 =?us-ascii?Q?WhmJO+clEVvcRxrX3yCvKQFgb/9DsKbm9q3a6MlzQ6wmieSaQV934dL+0XoG?=
 =?us-ascii?Q?9lcGJ+TC4PGuBswR/GvJpxOr0yj8mK079DL37BJ9FRRiZbxmI9KbhCgI7rzF?=
 =?us-ascii?Q?w7uMDfT4KvGjpLEIQUKCSLWzIzySAtCBDDtOaZsr8wKNUUy4m2qRLXGx4KnF?=
 =?us-ascii?Q?cR6BEGpE5Ee4bWNMRcwR/0n78Jk3iu5JII0CNFNs9WRk0LbGPz5cQZhYiXZq?=
 =?us-ascii?Q?xLDUFJS7sPemYdbCzP96mjQBrKHPMqu2pRX7En7M92IXcHQaTE4YSgRwI+B4?=
 =?us-ascii?Q?Fc1bD5FT3QQmqG6HG4vB4v46xW+P5d+9Pqu1RSh+4TIZHPSTbz+Dzx5RxuUU?=
 =?us-ascii?Q?dxXWgxvaQRE3RIctU1QFgcctoRPZPTpdVMK49l1oNW9EwsjMIlEFhHVnMZOt?=
 =?us-ascii?Q?89AMWQI2vVu+LZmfGRiVt9lzS1ndo47briTicNgfyslc2RSdenkh7tEjRZ53?=
 =?us-ascii?Q?4h8gI2nnnhDwjNd3rNj/qANZpPcDM1qiXC1h/dDhPYqoOQ0bSx5YlA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EOm30LvhtaKOqXvhw5fiPz+C+RdAIz/UbiiqkW3nrIPXQJbn0YAiDYaedIp1?=
 =?us-ascii?Q?Q3Q+J0WO0+ZyMEJXr8xB0zW+ZTLtqNcQ30SrZW/Tx5CuWaBqx1zrPDTMZ8at?=
 =?us-ascii?Q?VeRUSATl5vcaXHHnKMakuTq+l+1s/ShboYYVmLdfMwKU2Xx+1TakDzYM2wdg?=
 =?us-ascii?Q?tRp9MRpCX47R7WO09J/iGQqV/wyoRhazsnkJtpyqVK9iFESLphEWm46QdDhg?=
 =?us-ascii?Q?BGkOBpa2BsS7UpNJInLQwJZbSP9ghCO8XYj5GsJiz4rSj5H4z4aOYYjEcfRf?=
 =?us-ascii?Q?z0cUwSWZLuT4Ylxy0nw6mT3jSkS9zVYiUN+wYLmUee+0BTNvCrwX0bByDWrO?=
 =?us-ascii?Q?oov+5hq3Q8PojL3/GOzoov1iLXai9f4sqHqBUWZPI+r2oOk/ssiPhHfB2yqa?=
 =?us-ascii?Q?bKUbjjy+azEuR+x4FGBpQGaFGnQMnp38nGflhtxk+gOIv37yMvf20d5TqDvV?=
 =?us-ascii?Q?OgJLRlL+4uxUmbuMdv0p5iZWPwlT/07CeGsgu0BwKJDyfT0ppOsuRA/JY+6r?=
 =?us-ascii?Q?l7vjDlKi0go64mm4OxmBpiVC1SixZ7oDpA3kn2YvJhqdJHjOmSQDSL0NebQ+?=
 =?us-ascii?Q?Rzo2DFD92b8A0nYXm561HXMPmx4ld5x0PiQh4aHd94vIQztSt/MkxJgdPO3c?=
 =?us-ascii?Q?UnwadaqxqtUcYUbvzWJAL5VSZHF39DA0VNfy+KingEHsKP5/3x8UQS2gbHBx?=
 =?us-ascii?Q?omwPoN/RKZ0rxYBVB4Mm9jOedG3Hrts5SeedZ2Isn/V/scm1gfua2+cA4FFO?=
 =?us-ascii?Q?a8LxOMCELfiIg/NcvZs5fHf/lgRT84WlNIPzk4a+hRdguPn4y3k8Q4amrmx3?=
 =?us-ascii?Q?oAc+c1c8kJOfGuqEr/ZyYY4D6C1R2CgPogAYuhkmpcEtq6uYaXYUE/oU2bc/?=
 =?us-ascii?Q?nGRxlu3+KSS/bxYdywSZAu3Rrr/iHAw5ZfPp/2DihSNt0/YfLqW2ITVHRt7d?=
 =?us-ascii?Q?aCKZO3GytqZvtbx2J3BfSUoiqinFzz7TeCVxGyvHHW782hkl9eEcLPKWqN5u?=
 =?us-ascii?Q?qLa1CJEsM1aswVMt9d/FrQefYQnfMpWjRYMuCfcBFL36NHqP7Vt5rCKGiccY?=
 =?us-ascii?Q?Mpd4FhiZ8SRkiIYh0wa32VbKXZH4fOXV/kIYkz9nPnINO+JESAFT5nrOmyqB?=
 =?us-ascii?Q?c06VsDaUAye4A3yb1OUPl5bVo1IJs6wbpsS7Gwh+Oefqsjf5T8cuPoNX/H2/?=
 =?us-ascii?Q?xk4SYjP8hXixFrQJu2/RU7CIwg2sXHktibeIwPAQS2w4HggtJytTPB/3gOc7?=
 =?us-ascii?Q?y5YrjGcsmz42Jxkvgx71MkfoCxyb5OoXfbEMlqe3QZPbI3GQ7IZpgKjhC6Gl?=
 =?us-ascii?Q?P6Y22YhIo8grit8oMXitlAMctJv1T4EiukiSfE4jMTtbyJ21pPF3kw2sZb1B?=
 =?us-ascii?Q?IUDcsvJQVDjUug705fOC7ufl21tjOZEa/dM4XoFVZIrS0mnqQvcV3cv2tXYs?=
 =?us-ascii?Q?FTHLBadnpmBxJ70Mo3CK+EGrFizUZlRZWTH395rs4GCJmjpcrVdGHmpNldZ+?=
 =?us-ascii?Q?XxGsf9EpYjPlM/z2aQcucgDn5EktPGDexd9M/qYka4XMZXjNVH4rcwzqxoFT?=
 =?us-ascii?Q?pO+C+KoHsjBvx1ymloyTrJsEXI3bAv8mnFd6LMUQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63fc0f7-8a5f-4c0b-dc86-08dd86cdea8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 03:28:32.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/Ra3pTP5J+L0zfb0E6inT5+XTmSlnNXpAJHIXiVmobQd7T/JIXwPvh70ZfFLQwybtFfIf7CR49zQN8uxpvXrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9698

The i.MX8MP and i.MX95 USB3 PHY have different tuning parameter for same
tuning field, this will add i.MX95 tuning support.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 6c564b608539..59b9b4704b03 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -293,6 +293,13 @@ static u32 phy_tx_vref_tune_from_property(s32 percent)
 	return DIV_ROUND_CLOSEST(percent + 6, 2);
 }
 
+static u32 imx95_phy_tx_vref_tune_from_property(s32 percent)
+{
+	percent = clamp(percent, -1000, 875);
+
+	return DIV_ROUND_CLOSEST(percent + 1000, 125);
+}
+
 static u32 phy_tx_rise_tune_from_property(s32 percent)
 {
 	switch (percent) {
@@ -307,6 +314,20 @@ static u32 phy_tx_rise_tune_from_property(s32 percent)
 	}
 }
 
+static u32 imx95_phy_tx_rise_tune_from_property(s32 percent)
+{
+	switch (percent) {
+	case -10:
+		return 3;
+	case 15:
+		return 1;
+	case 20:
+		return 0;
+	default:
+		return 2;
+	}
+}
+
 static u32 phy_tx_preemp_amp_tune_from_property(u32 microamp)
 {
 	microamp = min(microamp, 1800U);
@@ -353,6 +374,13 @@ static u32 phy_comp_dis_tune_from_property(s32 percent)
 	}
 }
 
+static u32 imx95_phy_comp_dis_tune_from_property(s32 percent)
+{
+	percent = clamp(percent, -60, 45);
+
+	return DIV_ROUND_CLOSEST(percent + 60, 15);
+}
+
 static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 {
 	percent = min(percent, 100U);
@@ -363,10 +391,17 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 {
 	struct device *dev = imx_phy->phy->dev.parent;
+	bool is_imx95 = false;
+
+	if (device_is_compatible(dev, "fsl,imx95-usb-phy"))
+		is_imx95 = true;
 
 	if (device_property_read_u32(dev, "fsl,phy-tx-vref-tune-percent",
 				     &imx_phy->tx_vref_tune))
 		imx_phy->tx_vref_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->tx_vref_tune =
+			imx95_phy_tx_vref_tune_from_property(imx_phy->tx_vref_tune);
 	else
 		imx_phy->tx_vref_tune =
 			phy_tx_vref_tune_from_property(imx_phy->tx_vref_tune);
@@ -374,6 +409,9 @@ static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 	if (device_property_read_u32(dev, "fsl,phy-tx-rise-tune-percent",
 				     &imx_phy->tx_rise_tune))
 		imx_phy->tx_rise_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->tx_rise_tune =
+			imx95_phy_tx_rise_tune_from_property(imx_phy->tx_rise_tune);
 	else
 		imx_phy->tx_rise_tune =
 			phy_tx_rise_tune_from_property(imx_phy->tx_rise_tune);
@@ -395,6 +433,9 @@ static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 	if (device_property_read_u32(dev, "fsl,phy-comp-dis-tune-percent",
 				     &imx_phy->comp_dis_tune))
 		imx_phy->comp_dis_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->comp_dis_tune =
+			imx95_phy_comp_dis_tune_from_property(imx_phy->comp_dis_tune);
 	else
 		imx_phy->comp_dis_tune =
 			phy_comp_dis_tune_from_property(imx_phy->comp_dis_tune);
-- 
2.34.1

