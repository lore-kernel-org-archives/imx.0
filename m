Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19212D7DDF
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555034; cv=fail; b=bQSOQqWpeSG0o5b1+M+NWDpjob9ntlN5ueuA/rcgbLjAHv0xi0V7CcES+wemH5dtFuVD5k0QEWNAqTf+MbhqihFnRbqhm1UcUXwQENslNmEj+zm/qO5dcbLvRC3rWM2lBTyHldtmFJ/YaXV8DMN3/pTEWb/FQLr1wNFl16nIe78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555034; c=relaxed/simple;
	bh=nEUWuJfz8h+XuKHimyqpmW9aC8sbMb4pZObqVC6n11k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CEZPKjvqMAsYz3uAoe4oEbgO20JA1RcKXUXxEUSEXkITAKCdze1eo4WEojl9pRgrBlMsw23KQX+XxYFRlZ13PPdK8dFlL2iJJTSb8z4xudsqdkAPwGSQOlKb31TEPDq5ofoaT/p84gPnWsway2ffhUOY5EZYVcJPiurBOykpqhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=OpoJsVaf; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="OpoJsVaf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3lp1BJvutF9cQfr3ru3zznEAWIrIl51ktj41MOx5dc6F09/3aVwRdM3bqq2T4FDU0og01YMFnB9+QvhKZ/xeJAlKegYhtL+S+ZqV4Sexwr03I4qY8fs40ErlqnWvrF5LqddIAE6+f8U+inuGbAdntPzRQ6z0+BbNma0ryMl3mUU7LS+gwJnep5cCPCJZWZO51EkrCNhlLhD4P5vIzUOc4SlmS72cSgGcv/2y3t4eJ5VTvcJxqJA5srFS7HQRqI6vekQkHZpYe66tEnBg0XUg24Tx5HoIMeVY2o98WdXLwzBT8Bte6rYfHIOmBOtttUVsUMQOCeNVzAfjAn356Ybdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDABDkSwpunIdkRyqxG4Q7jtF8dAxzQIhAzsw4Vcg+Q=;
 b=NQuCM1KdFHivXH3tVaRTxMFZTfW9obO1HBTWS7vuzJFN92U6+iN8lF0jd95IVb6zcRgq2UATA4XPemXrIa/SizEYbFlTaJfwIm1vz57w6UKgHHrzNef6vDEtzyGBIsQQJoozC680vEz92JCqyDtpoc1lPfIOUFQnWslM+tJr1D9480TCfYaVnOwsxTFQ4qn2l9j8o23M34kfg11yhI1BxgYSPk2u1Yqi+q07a0yHPyKuP/2LovvK7F1f+vPDU0xy1yid8GOLkVHvJF+QjoXsPqjY23eEJiZZjSsdrP/ojg9CFJuE7/oAGLH3RU0zAxzu0tsUzRgVKsNTlBHQ2M55hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDABDkSwpunIdkRyqxG4Q7jtF8dAxzQIhAzsw4Vcg+Q=;
 b=OpoJsVafkVO3niIKvIL6ZX+29WHS2bD5ChOJMUNm0xThjZc+iuAgGK9cw6RD/OrsIFAtB/8BfNjTa44AyuVZQAGsC5WBYRHXai6MXDgbOVR40742ao2n88JJ4Jv4sEPtIhvsA9661DISg8bjuTZjSXyjdHrlu3ihKwdyTHaZO9Q=
Received: from AS4P189CA0037.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::8)
 by AS1PR06MB8489.eurprd06.prod.outlook.com (2603:10a6:20b:4df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Fri, 16 Jan
 2026 09:17:08 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::1f) by AS4P189CA0037.outlook.office365.com
 (2603:10a6:20b:5dd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 09:17:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:08 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 10:17:06 +0100
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
Subject: [PATCH V2 2/2] i2c: imx: add abort path for invalid block length
Date: Fri, 16 Jan 2026 09:17:04 +0000
Message-ID: <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 09:17:06.0418 (UTC) FILETIME=[E265DD20:01DC86C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|AS1PR06MB8489:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 66c67833-4eaf-4fa6-8167-08de54e005e0
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0qGxe3ByczYjU/M7Q2mvLURbhZKgLl50lq1/l/2rYBW+tgFr8WgIGEvggeSh?=
 =?us-ascii?Q?1CvVe6nQptUHEP2rfBeCgCkynsFiPFzF/8xWG5WBTxdr9wf4p9VWAgXDUcPU?=
 =?us-ascii?Q?VRfIZIvYEo7bdTY7mbl6nao1mz0B8OFILjS1V4u/ndVYwe9UXUBU6jDOURM5?=
 =?us-ascii?Q?edFUVFmlMrBmYK8aIB+3FiQBSghohueEQHetWnHHH+TKlXw+Q20JbjUw5i+I?=
 =?us-ascii?Q?TSDU5R9jyO5q1KPzCe6AZRCBkABxd9zO0f8H1FsDZnFUV6UD9Mr3hpX5E7Ry?=
 =?us-ascii?Q?5qXLROW+lfhgW1sEfRAP/2DhSqk3chpaPxyap0L3Cgwlm0/qmRj7Y0qgCpPI?=
 =?us-ascii?Q?sWO3XP/Zxf2C88ixVzHMA8cp4TrG7K3z6jNX1RbBTsbRH6Qe1Uk5N4x1c8Ya?=
 =?us-ascii?Q?XQEcOJKoNq2yM8OovMwq2BmCB8LflHegR8ryoKhoR9rg67Kc+76Jt66dHrTg?=
 =?us-ascii?Q?T6kHmmOdZJmaFoT6ZzFi2w82V+wui/B/5SH5JZmZ7ph/QvNkdyu8hARP7ttm?=
 =?us-ascii?Q?N9TeMehutGI1ZIXoGOEyGG3I0BrxKOV+V40mHL862Q3S0/V/QSQJV7aYnOd6?=
 =?us-ascii?Q?vizrUkqHTinWh7Ebr6m4AE60A6AxjZNmqamVrjotbqcz98Xh6dcaq4X0D85l?=
 =?us-ascii?Q?Nsa9jnVFlUayNDWEbZFNbvA4XmAcCuvnnB4PaweBrJpMRnmnIwc0SWvXBgv/?=
 =?us-ascii?Q?EhOFIywsqX8ithMvY1tNq/82DUkuaOYTrGINw3O2MJSZu8a1f9512Ym9Ltrj?=
 =?us-ascii?Q?dkIHpTvxSNd1dgTszSrRcQYGsNu6h2rBBOjsdzG+qdRGqn85ZvvUfwVShy5k?=
 =?us-ascii?Q?XjKRiqx9rnr7gJEot2p1un9GlVFYOQrNrp6N93hTsXhzoUt41SSatAsp0Fr7?=
 =?us-ascii?Q?f08r0x+W5h7EyKjJFhqgeTc+2TTE14FLBP1vwlC1k/+zVXqNp9M8PnFgcNOH?=
 =?us-ascii?Q?haM5tcCYdvgH9uq9JlJ+08jg40fbN2m7s+9x+glRJu2UbkLNTfNnorcDWvbF?=
 =?us-ascii?Q?/hpEOagTxozZqlkm1zAqv/HoPKMONj6QlhWxcXGDpU33pv0GM3SuwhqU3Oxg?=
 =?us-ascii?Q?o82ESiSyFPHiI/HIz+bFRtr9EXsPNgurE01vQMWXWskwLUW+qcstUcq728+5?=
 =?us-ascii?Q?DBWScW1bZlhRUnyU0OLnqZLNMklOM9RP8Xe/JgfzaGRBzK9U/JMqAbSIXu8A?=
 =?us-ascii?Q?61LmUoYXoE8JYN5QdT9vWxJLXa82hXLVXOCeYosxW2QVECt8M7HvigM1lvJw?=
 =?us-ascii?Q?xdGJTMGCtZaM8PWW9Y8X0TTQ1HuzKvG3+391PDLqw79gT7QEzWHl32d/j6iZ?=
 =?us-ascii?Q?6/6tjSxK9NxJWTCWCm+j+HbVcE6kejGmdczjB58Fjv+N2EYRdU4z3JfuF59u?=
 =?us-ascii?Q?2fq/tJFsynx2Twvwa8fL/Krxi5NHedxwSdrFO7vGzvXxOW5cB7gHKaankoMl?=
 =?us-ascii?Q?ZEeAyffQk0Za9Vj+P/oxR++xdvGs1UquAmug/Q6pmP0TCFN45iS/3ZFrsZyA?=
 =?us-ascii?Q?9b77cs6rOrLrev9Bh4YEjNBatCAvDV1TOlYLcv8Y++NOY3oeN5ZZ4dHV8T8T?=
 =?us-ascii?Q?Wh5Zm2lWhkVDYMFaPofNo/ka8tpIZx0Bo9Mv8kTpQRborGCEt7RksRJjtk2v?=
 =?us-ascii?Q?38GHUCyBIdtyLZ06cHHl5+QOYotkNiwyH/E0IigIiZ+89IS4CRJTXm0abm4g?=
 =?us-ascii?Q?uJpCsMUWCI5QBWsBMrsZs8aEKck=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:08.0847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c67833-4eaf-4fa6-8167-08de54e005e0
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR06MB8489

When a block read returns an invalid length (0 or >I2C_SMBUS_BLOCK_MAX),
the current implementation leaves the bus hanging with SDA held low,
blocking all further I2C communication on the bus.

Add a dedicated IMX_I2C_STATE_READ_BLOCK_DATA_ABORT state and ISR
handler to properly terminate the transfer when an invalid block length
is detected:
  - Set TXAK and receive the next byte with NACK
  - On the following interrupt, generate a Stop condition
  - Read and discard the final byte
  - Report -EPROTO to the caller

This ensures the bus is released correctly and allows other devices on
the bus to continue operating normally.

Tested on i.MX 8M Plus with continuous block read operations.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 55 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 85f554044cf1..71457dbffb7a 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -233,6 +233,7 @@ enum imx_i2c_state {
 	IMX_I2C_STATE_READ_CONTINUE,
 	IMX_I2C_STATE_READ_BLOCK_DATA,
 	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+	IMX_I2C_STATE_READ_BLOCK_DATA_ABORT
 };
 
 struct imx_i2c_struct {
@@ -1054,14 +1055,60 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 }
 
+static inline void i2c_imx_isr_read_block_data_abort(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+	if (i2c_imx->is_lastmsg) {
+		/*
+		 * Last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * Before the last byte is read, a Stop signal must be generated.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		if (!(temp & I2CR_MSTA))
+			i2c_imx->stopped = 1;
+		temp &= ~(I2CR_MSTA | I2CR_MTX);
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		wake_up(&i2c_imx->queue);
+	} else {
+		/*
+		 * Next-to-last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * For a master receiver to terminate a data transfer, it must
+		 * inform the slave transmitter by not acknowledging the last
+		 * data byte. This is done by setting the transmit acknowledge
+		 * bit (I2C_I2CR[TXAK]) before reading the next-to-last byte.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->is_lastmsg = true;
+	}
+}
+
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
 {
 	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 
 	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
 		i2c_imx->isr_result = -EPROTO;
-		i2c_imx->state = IMX_I2C_STATE_FAILED;
-		wake_up(&i2c_imx->queue);
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA_ABORT;
+		i2c_imx->is_lastmsg = false;
+		return;
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
@@ -1107,6 +1154,10 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
+	case IMX_I2C_STATE_READ_BLOCK_DATA_ABORT:
+		i2c_imx_isr_read_block_data_abort(i2c_imx);
+		break;
+
 	case IMX_I2C_STATE_WRITE:
 		if (i2c_imx_isr_write(i2c_imx))
 			break;
-- 
2.43.0

