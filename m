Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B8836166C
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562361; cv=fail; b=AiISxZ/Hep1A21vvCaUQUeyO/5/dUt7qI5mI58Pqng8R7VwvM5Z92gEHaCwrJJm2LEpBd9fROtcHXTPkijFfZGcPW64oubNPKkGOwgfRYer17upk9ehU4+hmEPHAp+PQMPpXgN/FArVdyOttnvag1Rw7HY6Tc0eo8SmwkKO0Hoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562361; c=relaxed/simple;
	bh=NXqk3egmaKMX+VSxfoySzVwWXt/FyJL1AZRS+3kbhR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l72rTi/kF+yYhzgewZw4F3pwqBn4OYJJcZ/URzQI5ieIqTbU3ofDHr4AksoeGJyRHWrW9iKe3lEVn94pt7E3btQfbw/naL5/fo7yiolmjW8b7rzq6s2zufK+5xPi2wftTvZmE3rEozoKwFu4IO/ICUupX7Rp3caV4K3lzHVI8jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=Zf2EATU0; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="Zf2EATU0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIur8QDSX5fDVk4fPhui/3VqLvUQJGjEwAtyFsMezXj0hrkP6q+IqHIVxE92ZwEdJnRK3gt6rc9BZZjUawWoOePYYFkGeRomwDGwVYGUEtuvYz/Jikwft8+Q5OjHfMHn1sdqOjuir8GbnSvIWchPzKWqtaIia8/OkphmNWI2x2v7IT2V2QsJnyKypubgVS5CbOjrPxHMppYUl0WfyGcBNxw4ATui/lro5pvXIpU1XxP0i4p4po5oIDvY22GUFkH1w83AqlXipnHUUZ2o00wh0M30Y/tQ9Y9yI7i8DeDm26l4LZBp3a/CNcgJp7lN7Y7sL56od3Vf8M0AwcYOL2dRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko8zW2QcX5C+Au+BA6LOsombT6GjVQNsNcD3Ant5Sa4=;
 b=zNrFFC8jyiUWIqqFQGafM19Ya+QgNg68rde+cW++2imxJPIdc2WgfTfEUzavgOC8ul/UbaDBSxUnTB78p2LWSQPmUM29VhpNHWNdfFX1kvwjWMD97Zpn23vmJE7EuD2/cb0C2G5Sc/tNhM2y7oE/aM5DvmNw4qXhmaZJI9L1OvOHZ/iXALD2YFBuSUukKrGS6rNy8OX1gnAW6JzoHDgIb5/RWKPR+g/Q/hnRRACUh1nKMzpfUQMu56A5bQvn4Bu+emANhos0GbmepnsmcMzNKTcCu34rDTbmvk5A5XZAl+dRw7ricaDrJKS0H0wKuoKdzbbOw8pKNQpliHL1F5IMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko8zW2QcX5C+Au+BA6LOsombT6GjVQNsNcD3Ant5Sa4=;
 b=Zf2EATU0IpDApRD72znQdopMZXtIU5PSngh1zmJU8EW68sreJjQWSA6kAx2xm2NE1grbLJqc5D56AbyCRFDIVYCcgILTnzBdsEZN52xf1/FOnQLJL7XOrus9N7zbIzo+nN0KEqH2vE1iE0yttNbtzBso0JACilZ1WRDnQ5r6mjU=
Received: from AM0P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::13)
 by PAXPR06MB8531.eurprd06.prod.outlook.com (2603:10a6:102:2b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:19:11 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::3e) by AM0P190CA0003.outlook.office365.com
 (2603:10a6:208:190::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 11:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:11 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 12:19:09 +0100
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
Subject: [PATCH V3 2/2] i2c: imx: add abort path for invalid block length
Date: Fri, 16 Jan 2026 11:19:06 +0000
Message-ID: <20260116111906.3413346-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0572 (UTC) FILETIME=[EF567C40:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AE:EE_|PAXPR06MB8531:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6bc4837-b661-487d-8fe5-08de54f112b8
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0JwuPiAyrjRE1ZrWH1UCS0S/5kIsv4y01hLwaBp57V4xAEfpqmyymajk2Pd3?=
 =?us-ascii?Q?m4rE+yuI2u5Jo2L+pFRP3M/qiRvMJa5n0DR0xTQ1QiGvo+O7sVUOtfrLJwS0?=
 =?us-ascii?Q?Gr5Pg+a/9ythaUbpMQRDQTSfJvpFEC55ITzhepk4uOvM7SoLSEqEB0HUZQc0?=
 =?us-ascii?Q?Ukg456XYeG9f06G3OQaBb8sjnLYAnoG/8+2K+xAW4mHxbvO8ehQGpdPjfT2H?=
 =?us-ascii?Q?RfUDUaWSKHxM3h/LByZr91bvVxIMOJPsENk5DrToekNpkMFyH/BLSiXvuM2Z?=
 =?us-ascii?Q?9XCbloZ8KUJMJMo5lpxdVv8CoF0rkeiLMfq6rnRvBVsrxTQzzN7RD2v7Ya8F?=
 =?us-ascii?Q?e5XpwPmFOGWf0vWnlHfxWjSU+PxUpMGWWIxNa7yzSt7DxgTWs6Tufh6wGzlr?=
 =?us-ascii?Q?daKs5fTrZRzBT5uKG7n+1ZRIheI+FlDoF6rl1tF91CVeAkexgwJwSYsp7geU?=
 =?us-ascii?Q?kwWrik2K+WNHokI/mQLKWK7/YPUexyOEZyfqeLtlWeur18gFcPJibwQJXtei?=
 =?us-ascii?Q?doSVSRmoiRRcvOk7og7hYnzalP4Kuxl7aAWcGwnf6V/cqTIV4sDLMglDHKaW?=
 =?us-ascii?Q?07hjkUtoMgPE/gH+FZFNZV+4AJtIZ8PD7zZbCnTG4bKur2f88byyAWgGTFGH?=
 =?us-ascii?Q?j6fN5QoPuc+AYgDj4OwYVe2OrAcGnX9JkAREE0vIg+cCbqhMGEffDlJLcvVd?=
 =?us-ascii?Q?3iRZ4r5bLp8pNhBD3ITSUUuRGkM/sdpElJwIbrkpWAZgNIxy7xeGczpLCFLj?=
 =?us-ascii?Q?oN8tBvzvMF5bzhqkVDBDlvuRY1nAJKIIPNxK0VqFzApP4y0m29Gii/0ptAl8?=
 =?us-ascii?Q?gZVh84Lm90Tki7hhn2dULj5aPKCO0W2+tiIIQrt4uAqBObHdnrJwexPExoq7?=
 =?us-ascii?Q?sBTNfJ2VnGNQjILZIT1JINZnQ08+jdXGNwly78fsfzHg75ft1Ld+L/eCbUB6?=
 =?us-ascii?Q?2m9bFif/W7D3dgFJbdbPGL7OogltISwxPPRYPzP5O9mSV4poPVoUH1EagzA4?=
 =?us-ascii?Q?ElAUopJEtdMbBMkCux+6+g39cx9VY4TzIDCzjR40tZ7xnthclfD+iRkDt6Fr?=
 =?us-ascii?Q?NRGazYaPsJ+jVaMpjw05QvGSY9sQpv3UtAs6Yji3xh1oYxIfGFLnR2rIOq3P?=
 =?us-ascii?Q?9ZaMzRI0kqjcEV8t9y6lQpNk/lVAaN1LiUCA0BpS21Rd5kW2oGc5guaxKwbG?=
 =?us-ascii?Q?nHm5JORAdqtcxiONhLneSUx1h0OrpAQreFy33dUpqM6q6Nlic9fbaEIRaUbA?=
 =?us-ascii?Q?270XPf23be7PeLgNoLUp1B/MhZFxFUuLzy1WnsE94a218UteriRN2b/EFVSw?=
 =?us-ascii?Q?xbasUVPo7YMF8vfjx5TRFrqw6VWMbF9BM6UcPUIR+kDWNE7eTSTEtRe+gadf?=
 =?us-ascii?Q?M2/tQ0LOsslg3hz6FyZYoWHt7B6jwVIW5FiyOwgLqi6Zxi0HsQVonJmDL29t?=
 =?us-ascii?Q?Pjr0jzdRGvVIMMjdpDA7AToFmR+A1tFAP3jdI8WUFoQanhCodbZ0N4Tyn2pz?=
 =?us-ascii?Q?swSk85QtCXOlRU8n814T+m5uqFL+7By26U63dE/yrC4s6U7s53oitkTbyvxL?=
 =?us-ascii?Q?rSj3Zce6rDNJyZxLu9FyVidQvOxiFHXoafgMD/XK/R7lTJ5tSR1wu1RNSGoU?=
 =?us-ascii?Q?IMFWBDPd1HybH1f6gXXZnZcLRRyb+9FSOErerhMzua6dyWxzC8gd5OqSp6xv?=
 =?us-ascii?Q?A0y2vpJAUQ7o6M7hrhl3L4D7CEs=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:11.0782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bc4837-b661-487d-8fe5-08de54f112b8
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8531

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
index 05ba41144648..d3fbc2df7f04 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -232,6 +232,7 @@ enum imx_i2c_state {
 	IMX_I2C_STATE_READ_CONTINUE,
 	IMX_I2C_STATE_READ_BLOCK_DATA,
 	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+	IMX_I2C_STATE_READ_BLOCK_DATA_ABORT,
 };
 
 struct imx_i2c_struct {
@@ -1053,14 +1054,60 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
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
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: Figure 17-5.
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
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: Figure 17-5.
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
@@ -1106,6 +1153,10 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
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

