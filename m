Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56933D9544
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290013; cv=fail; b=gLgVsbDyp8A40A85yedvVFzM4DqpZe1CgoY/5Qe5DZTwhRO6lk8fJB8dSVkq9VEXJ89u9TJ4wwGV4z2/oS9ME35B7X9PO586wj9qEcEUudg1HvmserS1lrNA9WOC39EIZJ5uYm6YMKcHTVfN/RvV4UuytjxEkmHosXgbmvUgzIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290013; c=relaxed/simple;
	bh=IXXxKf48Rci7Em0Yp03cfry3lz2uu76rBe+KYrkNDig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q57LSMbFVW0kAMNpXossUGWqHZc8NFiy5mbS5P09oQYQfyQVT/s/wjx1puBZhzHqjpO3QeNpCGA0M5jV5n0e/xIKFrx5p9rsIEXrox7WMvjMWjISOXORYcpbgyVKRbKe98KS+kZ1GyL34ssKUrbHkSzbQyUTJpbQpy3EjxaFA4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xyv7E4mc; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xyv7E4mc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaaHqH2LC19UMf1mlaoKDv2GZnIh6A7CT65btW0O6dPnuoqnv7eaqX/823+1I6q1cZKr9vlhbnN2XjN2zfr7QugiiAVCpbAhkKlXfvxAkGuOsYrn1X1sE7cuSCno7qXywQEEiBzHEZMLzq7ZXHrAY+SdCROqMNH/uwmQ28FGRy7AZ7zZa58t/9ZgVoAKdG4Uu1TVB3yZrXlg7YeVY/q25yTTu6oeUP5fnv/XorR04I+wia1bVGuPx4braFUPGl+kAZ3789cuNPWigzW1m52OARnpE+R0q2tp8b5gpWo1wWkAdt/HYVn/ichm1if4XxzP/p6O8a76ZHISvT+pIFryMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiJu2skQlEWNiAa16mlqt3/KVHzf5IMcERMD/a+0AhU=;
 b=fqwtXM7w3py6nVz1KLYF3WmoyEjTzVo6AT5RFXUp8Bxoj3EH8JfifVGxKXJT+4OQ39dHQQjaxC8HtYR+GDXOqe1us8Mx+hAE483pyuVlE+eqmVXqA4AhdsL1tE6qn/SKf70NhmwHvVfLr42lb4fRCLrCmBdb2O+1DtMpSH3RSoBkYtIv/WtsNetYUrFo6YY1X9Nb9XhWZekRD60oM1G7mqU9Koz1+L8fw2eEuyZ7Z6U5h8mG3dimLFBKj8d0T+aTsxcxoDDUMuYrQlPa9ngrAtGvtxIWh9sk1xA/SNROwJwfOry9KnP8va5ZGIUULNiPgF21fa+y51eZsj2D25UDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiJu2skQlEWNiAa16mlqt3/KVHzf5IMcERMD/a+0AhU=;
 b=Xyv7E4mcCSYEismaIRw+TxGyhpcMMr5so13ZmYYhBDPz5YSoexIjIs40rQDDouTylgpoAC1IizwS6HZG3/1q/O4aS/5N5ppSkT0ZyIeLKK1yU2LQRjBGqRZxpB2FyjQdaCHBu/lX5ZLWAXs2dtShFUiW/W891A9rlg7sALP0fXySJRk78a1MFElPcllhfeIQusIp0sNhEP3oxx1bV08p5+QuBCNUO9tNmU6M5a/LoUl5XyUM0OUu9Oqj852ks0LkVbyunD+gSYMSCQ1qOOc9xfCRwVOMGb6No8QpQk/mfjq1wWwzGd+0DHAqWxRIIB+kN1TUvBS35YGyN2kmazw3rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:06:48 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:06:48 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 01/11] arm64: dts: lx2160a: explicitly enable serdes_1 node
Date: Fri, 17 Jul 2026 15:06:25 +0300
Message-Id: <20260717120635.2118610-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: f2126478-c706-4692-b11c-08dee3fbe132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9VwY+0ed/Dx3fp5JFMB7nG8CP8xPGVYTKcv1ePBYXKFa3TKa00Y+9TUZbWhhhheTNfvVYPfr6dbCZsEYn92bbUdgGL+8WUfwov/J0ex7aQwxsSHAOZrvBC5dZtEAHxFrK3903gW3Z2FtAHzOOhWxm0ZauGZrxtTYBXs741vK6gzc5JL9r4EI91WUUbijwZi2+XU/zUgCo/WC018vHsLupfSP9N6AnSnKEj96NOfNPwS7hBja471prcENCno/Y3fwXQ35Qb6VFnavFKvH8k/gJ9hiy0AzMuCQiH2MKuH17f4SfzMGJNUcot5G6byK48LRFKnjQ8VpBpLCid+brkXPQtfyQwPuPt6gXzLJzOb2v5C8G5aPdFOZul24xLTxtKOS7vT1EV4ALma8wZihNhfQW7MMy0q9LLVdlBw5J7RB1Xs32FASYIHISq3tFJqdpBkkT8N6p4hsqWuKUNxjlo9fWmU9bjlYaf2o6EZT2pdgkdJLEAR2MhtIzzGeZEhv5Wpu7yH7/2B183l8Z6RQnLmUoZ5/PpzM7KFmm9kxFY+ad+mVhxtxHmbY2oQZ5SVssBvhHK6XrAkGayOF5sIzC8mLzTM/fBzsx+OBaEKmUUOexyzVW8Y44Cuqga1fxfhjmucNh877r1ycmsLuzWxGiwdrkb4HEdNBR/qiQp7Z2UXlXtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U9sPuWADyeG3XLKvFEsVrPTWpFIxqK+/ptn7HkaojwoaicT7IurG9H5hU18R?=
 =?us-ascii?Q?NjiuASJgyZ94EOX9rFXGTmreYbD2r0SqE3wnG1szNiLC7BQC/iplImeGvMG7?=
 =?us-ascii?Q?35vIlMeifioP9KGMFTQWUfMb0AEqU1yaS+qQYRRml6Xhrv3ZAGEzOZAtb+Im?=
 =?us-ascii?Q?xeUq2WlB3mJrdlNbBztqr6OTIaCQWpess+cB2sqFJ5zRYJwLcl/EgABExr0Y?=
 =?us-ascii?Q?zHs0fjKT+sR1eDXhM89PlO/KCp2zT38TodbfZXkTzG+c5nBKdpSCQzBzxqrY?=
 =?us-ascii?Q?8aLjGDAHb3uGaIIhUQfb8CgF87vnxSO0Yq5gZ2hUt3LLzBARKumVon5zZ0i+?=
 =?us-ascii?Q?d8deYGUTEEG+ldK8gJeM1exokIxRQN2bYwvgKhJkvF5ZAVR6X2NaWnlUvG0G?=
 =?us-ascii?Q?6UVUSYpaCMA32reTS4rdZDSYDDEzNIUMaWEZBQvOe8yO4uhEe7RDJTIO5DGn?=
 =?us-ascii?Q?wYTo81Gqed5PTcvqeyiiEHYLmQlEw4h0o/XFfHe9TVvOqxS6f1KKRSNM7MsG?=
 =?us-ascii?Q?G0sTyoov+k1uWOi0sJkJ/wuL2Cw0b+omN6KhAiP1L6nHQu7aVKJoYJM8a570?=
 =?us-ascii?Q?j/KOH/X7KE3DoBZr5i26Z3W08/L+yXDTsU7KE2aQkuxHdM48iQjeiZenYdOu?=
 =?us-ascii?Q?jDAK3YB/z6MTsHud6ffPQSkRsxfVIfCWvIcKA/B4uMOF8CigAke5oZdEFyn9?=
 =?us-ascii?Q?wQOXte3cBUMd9WL5rO5psWiDJz9BO6SG4iEw8NY7nlz+UZpIfhoKLAXOxrTB?=
 =?us-ascii?Q?ZgdRaUYtqBqs7u3tMO0jnGSX5o5lyFEM2nwOrOh+GFNsFPizPJ2wV7tghGEi?=
 =?us-ascii?Q?hLTmW8BwBJ0hBM5MxSVvg2hE1QkLSlJ/8iDVFkzCsnHIj255zvzZKXANvwB7?=
 =?us-ascii?Q?A0D7RrmWn96wsN8P6cDvDV4cYfrgiGJm7cRnAdO5bC2gKmlafyS395nbm40k?=
 =?us-ascii?Q?XlSf6YQESZKrSZ5A8bzHlvI0zL1MCwJarY1nRN58Tq8jQO8jRiPA5yYJf7Cq?=
 =?us-ascii?Q?aG1+eqrxlDouFmWtrsOomJWe4P2WVot6+2sXXRLkODccn16wCrv/dLple8G6?=
 =?us-ascii?Q?SO/pnNfGT4xBrj9LIkiZWEB92i5lnYxzIjvbyoDcB9F+7ip3rPsXb1sNeWF0?=
 =?us-ascii?Q?MA7PUOHyQfwmyMKT0cQQCS7pdYCmut0VBbBZwNbkRzfojk2aI0w90On12xaw?=
 =?us-ascii?Q?R2b/KTtaVp54mB6CFlv+2uxSJ++nIIiRp6lNJS3FsTiA++SkzsatJqXaOjvR?=
 =?us-ascii?Q?kYNE5gTmhPSLFHdzc/QaKTKfdOwD/f0eEguZhqS6DRkfYSBJJq5xPC96HfTD?=
 =?us-ascii?Q?Mijr6ju8QteaWPJ7JGortpUe0z/DvAMqpVI7gaJJObDqZgUKdMHY2SNRCRHC?=
 =?us-ascii?Q?kj669AbV65MQ+5y2Zk4qq52LIhl6NxioxMXovYNU5zlDaB2d6BmtQ3I3Krk6?=
 =?us-ascii?Q?aaDHmoBf5VQ6UojJCIbMtzg5fDxQgXJ2W14cNAQPLP9gJRQl5qGJsjMWBSQp?=
 =?us-ascii?Q?dwDF1L3NGsHfNdP/Gip5q+Boa0Ra17vpv+AmaJTUYQcXhQTC3sQMp+uF3EKS?=
 =?us-ascii?Q?bRCcPtGAjaBjUsvtDDoEcJJAE2nsMApICSrRMEpe+ZPWwoFdZ2tGdeYZE7Jv?=
 =?us-ascii?Q?leoqhF2ajdyYPdyAft6T40wcvUfvbcYIdMpoZjn7D0vuuwH2b/lDfepsEo1D?=
 =?us-ascii?Q?WwlcPWiQ9yjhKRZkIbABIc8zZgwFMxVy6oxTuCNJrbhnyf3FPjt8ycgQS6wX?=
 =?us-ascii?Q?AfyA8YOJHA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2126478-c706-4692-b11c-08dee3fbe132
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:06:48.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhgY0BU99T6GfHmYs2vmvzOIQT8xXdFEyLVoY6xybc04kttRYYwXULiB0Spakmp5YuQ5YMiAF37Mlgp0u6XgNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

Explicitly enable the serdes_1 node in all board DT files. This is
needed in order to be able to change the default status of the node to
"disabled" from the SoC DT file.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- new patch
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts    | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts           | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts      | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 4bc151d721dd..1f946d3a4ec0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -135,6 +135,10 @@ &sata3 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
index d16e27307275..954b9955b1b3 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
@@ -805,6 +805,10 @@ &rgmii_phy1 {
 	status = "disabled";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &serdes_2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 935f421475ac..39b2b04be532 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -325,6 +325,10 @@ &sata3 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 99ee2b1c0f13..df2568ec7f1a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -367,6 +367,10 @@ &pcs_mdio18 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &serdes_2 {
 	status = "okay";
 };
-- 
2.25.1

