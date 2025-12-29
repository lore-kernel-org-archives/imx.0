Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A980A1DFD96
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766996286; cv=fail; b=kV3zSswQISqTL6wBCljeYlGlZW5Rno+zKDaYcMXhJp20jqTydpZBnPYHWOogfG18kOShah91WpPAc5Z/WwANkDPCBpK7AlRtt76+2ShDgnEfm6OmkiPipmhyCK/7xp1lQdfn079jK6Xa5+V8BIzcrgF4u45ymeDemf7xvfzHxlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766996286; c=relaxed/simple;
	bh=owDlthlgpBQmDi70KMRR4YLl3yBiJXJJRI3dalSrVbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wsz6hxGQ3ioK0i1XolQvkW5dgQIZMtZ/jnDFX2Gk1MsNN46VV6v/GYFHSJqi5Y++CUvhdT8KvGq5V6jsU5gvgCSMZ1W9WikMGvaNPYpznY4XzqVwTr6u+9EhsUctsmT0IoA6nET0d/fZFg669MGLf0SK5vcGNmCUvJKcjOLh22Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=jOtQuIh1; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="jOtQuIh1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDwRSggVM+FuA71DtsJiqZaEN185xjHQxQbUzjAEAlEKwRe4SslgCRwm218XqPjwdYwd+De4Wtd6VUYW3h5q6tqvc4y9q90eAoJhhq5SjIEQt0lRbLabIT43MdXJB9srhAsyfof0wxKQ3TdOsD5UgYU/ftz6exwi0wX5x/ek0oAtWYtDjV2boJ9ZxvkcoYUGwYrmNnxBiof1g8DBprmoxU5hqV2PpFlHQmQGsJCgGR+IXCTqgePwk0PYmDOnlsmYZe0fIlktIvxCJtseqtpf3/bUy54JYWH4Ak8nqjXpAYwj+Kgnd8zzxw9T79FSAQNPZkFvGEOmXIh7rijnAagmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/I6RRUjm9il6mjPH1XUvwoEPmNbJiY+iUUsgWRezhY=;
 b=mHo/AoDJvCDAa7R635tlh0f5IKOeJIcsQ7+aEr5ItYPEkSudsO+hNdRSZRXz+wrdBzs15X7KtuxxYO4V62k8VvZioEkCEGrLHTAzM7cCIuh8J4Z9ZJMU7XlowBaEd/hQ6CNAPEOZd/7o26yB81xg1FDKW9CvjdMahD6iHLTcA/z9bpeB+1kz6y0KtgyFt6sGpNMdYwgt9B+kVxgNrPrKCUUPCaSHitVaCjdu1XiLaAXPdI11tVTMBr/kWX35ZWeaSjYrmfg9al1f6/9rG4FgiyyKbn8j8rWE3smqSA7Mo2KW+viD0iiIEFQWumV1LGvXD/i7EFsAJu4xyKeCVZguJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/I6RRUjm9il6mjPH1XUvwoEPmNbJiY+iUUsgWRezhY=;
 b=jOtQuIh1hwMTHQoz3MsQXjV/1Wwt8s/6D6ZdDIun2Chc9w/5X6BhPr3aAlkHPL1e1hV048enZglc2zysmdUfOinDrKeAW/IfUKZwxzdNsQUa9+bEWP4yu3t3rRBBmEltWvtQQ5R+KgmpQXa1/BgnIRvWNRHR1m1MD6ckTxf1r7I=
Received: from DU2PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:10:234::22)
 by DB8PR06MB6475.eurprd06.prod.outlook.com (2603:10a6:10:124::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 08:17:57 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::58) by DU2PR04CA0047.outlook.office365.com
 (2603:10a6:10:234::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 08:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 08:17:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 29 Dec 2025 09:17:56 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Subject: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Date: Mon, 29 Dec 2025 08:16:29 +0000
Message-ID: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Dec 2025 08:17:56.0436 (UTC) FILETIME=[A3021940:01DC789B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61E:EE_|DB8PR06MB6475:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 85a5e0f6-a9bd-49e4-ce1c-08de46b2c5ba
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VpIwedULyB3K+3aqX7uBz9WO6KSqMPB9s9QqLVlMco4P6JjVCpctpmM7SQAj?=
 =?us-ascii?Q?W3gdsVxn2SCPRklDKcvAVR+CZ96Gy9/b9uAjQuMZ8RbGtxjvHbViacEkyNUJ?=
 =?us-ascii?Q?u5pzp0gNSBEwSdv2Js9lZauEBxerYEkv93u0wwKeLinV9SZw4T6qHKx5WFCP?=
 =?us-ascii?Q?3j6e8y7vRVjQT/c74My03HtnjPoDaVJB0FeZaXSJHvMzb6AkNQApIb565Xeq?=
 =?us-ascii?Q?wSfgQlNsd7hKvWVmV1d4xa/1FjcuP/JH1JvmckAOeS0ArhSHlmuAtNCPSHxL?=
 =?us-ascii?Q?DIE9aYxfSfV6T/ztqAxJsFcUQcwKgu5k/0JJIhgStW4iEWZ30YWGsMKAJ3KV?=
 =?us-ascii?Q?GGL1UIyzmGF62yldLTNAemrbP6CH7hV3VdPrdoNHXLowtqtGQ2wnJtqAAt2W?=
 =?us-ascii?Q?tusi0i5UzoqEd9aJiQeviFvI3J1qQOS7GYdNThg1GkaqINnz3F2lOFabnJa+?=
 =?us-ascii?Q?HfrUaJSAhvgjoX/VioZgEiHAMnkeEfcmG1p4gYNzgHn7HrtHI3beaV0d0DdI?=
 =?us-ascii?Q?7cTjBISNu0nzJHzkmy5V6/P5J1C5NF7uGvO1B506P1e4dc7MxiqpIs8QIeON?=
 =?us-ascii?Q?1mfUbmk/3SwOGX1xYHA79hI1DSHF2N26RQqG7f+aPSe02Uw3xIQH8kssUTAF?=
 =?us-ascii?Q?4bZk+OdKnRKqK21L83QquxGpddczANMrQeUj2PHluShnir/Ro5m0cnljpkuW?=
 =?us-ascii?Q?kMN7zIQeFMpzUKuMT8nBS8WHuUGJANJfLSmUIkVA/Z+7BGP49fyOJGzgvNG3?=
 =?us-ascii?Q?n0EF9Vu4Dfs0zqiyHqmzcfM7Yv9PZuOVuKWpStIyHeENmaGriskUoP+fu++m?=
 =?us-ascii?Q?zANQap5ZbROI0eJCR191PcVTdyAqfJ5MIf2ypr3xczgiQsCi52+jLvP/7suh?=
 =?us-ascii?Q?FooJdH8o71LpGSTgqBI1uA0FLf7z3GzMgvW4ZcxJwVsgoIxQQtekq8/jiEy/?=
 =?us-ascii?Q?8C7f0Aof0nu9JVOb0mkew0h8vpDzH222qt7ZnwTyqyUSOfVesf3RyoXLkZ6U?=
 =?us-ascii?Q?G5C52IQ0XtCrwpI+H2uaQFZDegoYY3VUwBHDBQtuoQBNZYKXGluUUK7bkYQ8?=
 =?us-ascii?Q?wjAIvLUzFTAScpjRI/wDiDrDk1avVU0kZ2dA6fWxmJo5V4tfIoLwhbvr14es?=
 =?us-ascii?Q?+5KbJwI44n0bD7XFK9Qs8h/BfwEeid/mVTfNhchrx0ZsPlzNI18E40uvkzHB?=
 =?us-ascii?Q?bKjZChCL7n2aS0ljomHv4X6DYsYOyVe/7neS0ql6IHxmaXbao/2El+FOpkje?=
 =?us-ascii?Q?A6zTtcRAOTYpy8GBN6t3uLESJuHbQHekH3A2xa3WV6gezYCyE+hK9VvI6dFz?=
 =?us-ascii?Q?lmh+DVRQvZtAVSK9EP7iKGFnpTzAO+kNPn9IRpUvcvyliGGJWnRPgabbLagJ?=
 =?us-ascii?Q?jJoFENn/Wr18evBXcuU6nuHJaov/bwlVP10KRkPjGiVeA/LPcivdibb1ROts?=
 =?us-ascii?Q?DbgW28k6Pm+hzyiYlO705j/uHJeDXa08FSpVjVxuUGKzkX1uWVdhOjduTHcv?=
 =?us-ascii?Q?hzBxk8D5lp9gk4UFa1dtrSPmlH7vV7wUxxXQVsEgXwkwCZKGRH+n5ZamvQ79?=
 =?us-ascii?Q?zDH1Vg3ennTUptxOggO4oBPQMeqPhSEAjSFp6JOR?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 08:17:56.8032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a5e0f6-a9bd-49e4-ce1c-08de46b2c5ba
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6475

SMBus block read transfers encode the payload length in the first data
byte. When this first byte is zero, there is no payload and the
transaction should terminate immediately.

On i.MX, if the first byte of an SMBus block read is zero, the driver
unconditionally overwrites the state with IMX_I2C_STATE_READ_CONTINUE.
This causes the state machine to enter an endless read loop, eventually
overrunning internal buffers and leading to a crash.

At the same time, the controller remains in master receive mode and
never generates a proper STOP condition, leaving the I2C bus permanently
busy and preventing any further transfers on the bus.

Fix this by handling the zero-length case explicitly: when the first
byte is zero, ensure that a clean STOP is generated. In this situation
the controller is in master receive mode, so it must be switched to
master transmit mode before stopping. This is done by draining the
pending received byte from I2DR, setting I2CR_MTX to enter transmit
mode, waiting briefly for the mode change, and then proceeding with the
normal STOP sequence.

This change has been tested on i.MX 8M Plus platform.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index dcce882f3eba..f40deecf0f66 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 		if (!(temp & I2CR_MSTA))
 			i2c_imx->stopped = 1;
+		if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
+			(void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+			temp |= I2CR_MTX;
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+			if (atomic)
+				udelay(25);
+			else
+				usleep_range(25, 50);
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		}
 		temp &= ~(I2CR_MSTA | I2CR_MTX);
 		if (i2c_imx->dma)
 			temp &= ~I2CR_DMAEN;
@@ -1103,7 +1113,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0

