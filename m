Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245BDDA9
	for <imx@lists.linux.dev>; Tue, 20 May 2025 12:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743800; cv=fail; b=bOkZzO4NAK7kbXL7VBgBnqDCQWCwv2vDY7j7hnfm4vlwM9rik3Csb8nxmkvOZA0iZ1jiX0MJevhhlphGUBrSRKj0rrTQSe1afQAFKS2jkz2YXRfpWlmnbRVuzR5CEs2y1gqq2m/PR8w7XZQz9QZcxTSHbg23Mua12CMJm4rUFbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743800; c=relaxed/simple;
	bh=zlzAlyeLGOhN5f7KCfu5bW+ENlu+aCRmHZNtxXl/h10=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qQDMNnDE23jZ5tFdl7EyIG/QjEKGcBOeVkEPYpwudeAyVyLLeIJ6kg2Bk59xUMVe6Rg/hU5zuojD5AXOcP/tsqeWTO/bnzktDLTtArymG2G27LPphdq6/OnOuc3rOkbaCTjcJC3K+NzTvWJ89v1GUY0oYcNP1LHKOQw7r0ZEObQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=Iqd+m/Qs; arc=fail smtp.client-ip=40.107.22.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="Iqd+m/Qs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceCmehlIGIN/xdsi1LUl97INWpKc75rMof7c4+fra6wH0DHDf9D5amcV3F7waedVQTyZdi/ifHbEeTDCE6OPtXB2RLf67RWcFI8TK+8ZE22VlFA/drz0rXJLXFesP9UcyLWLJBIFj6OpiqF4oPcOVk37w23fkDYBy/WPbr4LCKX7m+CvblJ/j6EacZkP6Xo3Ll35PwleUl7QrTyLw04rdW1Ed/fy7QyrewaW/c0KsFqjcRczq/84jvKyWIJmWbbcYvaZR14CuOIqNJioj5WJDT+Y9q0SSGUwqknOG/gU8QQPb5BIlF2Anrxw5OEUWr2DRnRUrnWQ6UH8HgAgJxF4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxurCwMuEKIGoYXTWrOi91D71CqokKrlhNK1pPhzgKc=;
 b=O8onhOqFejpulPpYToW506Jiuy5ytS8LMuZV33zNCIRIRk+Knf1j2VtI05+jBySrZYzCSzL3RNQA6NmqCL2At0Lns6PFDwEXot64R5r1x+l2yYGAKZ2r4/dxxXS5H26lfYmOfUMlUXL7eIcza1LMoVg3CdL08M0a/eHydB5hB/s5jVTx6mXeqUtEADY7MeZGER1yRHeSjYPN617XoULno0cM4N08rQbaJZDiWsHJm2VW47cdK0Ru0OVBOofqDBdi15n42RVqktDDYHPBiR1L61f7ZcE+T2Ujr15Kambo2/dMstY2H+yQ3LD1Ier9cAZKpbFZ4tfP7uPvmhS2tI1cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxurCwMuEKIGoYXTWrOi91D71CqokKrlhNK1pPhzgKc=;
 b=Iqd+m/QstM+bAu8Zy+8Z0XTMTEQb/GgrnZErzRHOLPP61IBnuIkcxnhD0G5PzclP9i1RYkN3p707J+4LQTCxfgglS/8RsUpqcUnPBeBY4oqKF8S11BfakMBt8CrEVGYLf2EIgnQkDrhNcP4fW2b5CsvH71uiK5uaHln4kSYJCZg=
Received: from DU2PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:10:232::33)
 by PA2PR06MB9315.eurprd06.prod.outlook.com (2603:10a6:102:410::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 20 May
 2025 12:23:12 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::c5) by DU2PR04CA0088.outlook.office365.com
 (2603:10a6:10:232::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Tue,
 20 May 2025 12:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 12:23:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 20 May 2025 14:23:12 +0200
From: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	stefan.eichenberger@toradex.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org (open list:FREESCALE IMX I2C DRIVER),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Subject: [PATCH] i2c: imx: fix emulated smbus block read
Date: Tue, 20 May 2025 14:22:52 +0200
Message-Id: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 May 2025 12:23:12.0237 (UTC) FILETIME=[F430E1D0:01DBC981]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|PA2PR06MB9315:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59ef60fc-a461-4153-f4ac-08dd979916df
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iPDsSg3hj+ZOC6TfG1h3UOj1YqhcOvmYvHuoq0rfP71Vtwz+n145Nnd06DVU?=
 =?us-ascii?Q?55q+2BG7e/M7shbS/IGXERTA8N/utzJopwrpbsUPX1GRB1ZJEWEmljbvaZMB?=
 =?us-ascii?Q?q+rrUHasq74Lo5Gpp2lm/upYI7DtrOM6tGu+XX9eqftQup9MfIG8nk7HlqVH?=
 =?us-ascii?Q?MNB0Qhz77Q3xGKXWYZwHZzYEKRGQIbGv0ob2rHTwxRXWOTGOr57Xlb0an6Bi?=
 =?us-ascii?Q?FwKmyvJFljSAOLlZd8PWJCLsIuupfsd0Z9M+iX928mY7Jd/UX56Fp9fbFYV1?=
 =?us-ascii?Q?tjwvmLCkh2d2m0D6OL3ybTSwTss5nZEIK6JnqnRAWe8NMk9t1TIc9guOTCim?=
 =?us-ascii?Q?EJuq2J/8BcVBasT1WnILhP8Hj+LnDQVrL8Dr4Wcp6wizZNz/N8UfIt8RELuj?=
 =?us-ascii?Q?jbqbZEMr5uDkjRO6cd1R/1jSaiI7ZU3eyeK1aL3NTy1EZtCz4L51onNU1oJS?=
 =?us-ascii?Q?70z9wm2SMoAdW9fE4kl4XG0vxr0b4zw31BaJ8rR0xCy7dZREK9/dcJwtw1Tz?=
 =?us-ascii?Q?5KchokODdaJrvALmrqCHIlWrnOtWzHjSLgpuddNXrFbHD4NUxqy+zDUgCLTQ?=
 =?us-ascii?Q?k1G1GHR5pizVaG1BuOpBBvMPFxZp0uKRHitND80b3EE+1tL5m7WfTSotIK/2?=
 =?us-ascii?Q?4q4rCKCGBo4o/mHuyAkCjMTy6wd3P+TGh1pT3YbWDXLzLbZa+SXG2y1waBge?=
 =?us-ascii?Q?2ROnXwcQY0zeMRRmHmbXrkh4gOOV1KHyjkZFwb+Go8NWBbtRTqyOipQGi9OL?=
 =?us-ascii?Q?7/6f1jVvUYs7TGDeHzZ/h99SqembkR1+q0pgcRMxHAfCq6PgocRn9tXyMtdS?=
 =?us-ascii?Q?dKJeE+uIiAcl7YkJFyZ4lSaZItx9Ez6K87gcnswD1ETB3T83kviim/AjsMqI?=
 =?us-ascii?Q?mNY7Rk5LWmseSr451/Indmg7zjCbWQDf/4ZlPuDqou80dGZtOFLw9iQ9cbxM?=
 =?us-ascii?Q?oas4zk6JNugcJWbdxLwBxpYH0I5An5/WAu6jvbE7UO2yTH7LxIZfoXr24fNF?=
 =?us-ascii?Q?/70wHFYMKmKWGF2R9Ckk+X9bcXgQtLSsTawOqB/IUYTdt/+8LvM7LtPObWpA?=
 =?us-ascii?Q?EzfA48HVLyD7TCmCfRau4kZEqcaymBuB1fLAH6iSoLhCNBtEw6c7CiXIHbsd?=
 =?us-ascii?Q?jlrvN0UruzRR+kyl61l9trimBqIfkGWE1UbmYkgzTfWS16cyJAokNClHXQOc?=
 =?us-ascii?Q?ssxH6/TozM7syBlYRbqg9LYlfgkHE2lrrhmzonSBh6p07BhJpvuZvxb4YVCS?=
 =?us-ascii?Q?Q+kDtryPwRf8CFTDs0mX2Gs/xb4YNt8Lu5SdyhRv4OJq+1AeYTs1oD/cLe/c?=
 =?us-ascii?Q?c1z/9iaycb5SMMFs0xlWXp0YoUc96odS0WYL99Lu20zEYz7NbfDYTVI+gCQP?=
 =?us-ascii?Q?YOGx1O7p2NwX/+t6H7CTtX+S2RKXQDn84g3/4C2ZbkK6vU3+Dr6ubeGc7UZB?=
 =?us-ascii?Q?SiUGU5TLzoQjWiBVIZrse28EsB4vRRwV6hwk/146AsQuJ4xRVli6Qw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 12:23:12.5396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ef60fc-a461-4153-f4ac-08dd979916df
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9315

Acknowledge the byte count submitted by the target.
When I2C_SMBUS_BLOCK_DATA read operation is executed by
i2c_smbus_xfer_emulated(), the length of the second (read) message is set
to 1. Length of the block is supposed to be obtained from the target by the
underlying bus driver.
The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
after reading the first byte (i.e., byte count) while processing such
message (as defined in Section 6.5.7 of System Management Bus
Specification [1]). Without this acknowledge, the target does not submit
subsequent bytes and the controller only reads 0xff's.

In addition, store the length of block data obtained from the target in
the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
byte of actual data is erroneously interpreted as length of the data
block.

[1] https://smbus.org/specs/SMBus_3_3_20240512.pdf

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ee0d25b498cb..4bf550a3b98d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1008,7 +1008,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
 	/* setup bus to read data */
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp &= ~I2CR_MTX;
-	if (i2c_imx->msg->len - 1)
+	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
 		temp &= ~I2CR_TXAK;
 
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
@@ -1063,6 +1063,7 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 		wake_up(&i2c_imx->queue);
 	}
 	i2c_imx->msg->len += len;
+	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
-- 
2.34.1

