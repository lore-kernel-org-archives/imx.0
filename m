Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359F35BDB7
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562358; cv=fail; b=SvaK1I5utNat6dKhm0GZyjoT8owi75Jw46tpxXRt6yNIuIj3cAhhVserr3JBWc8weITxVHmWpJmtvPaoPIqu3wAhw4+gbqevxjPASwrq/Aeog2VhyAT2g2B2NQuxrt+mv7xexl7uhelGKb0SPB6cbbdOFE1kb+zW7TdxYAmu7k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562358; c=relaxed/simple;
	bh=TAIvC/WflG1OcoYL7QyCpXyWtKuMUyFFBTuZsx2ZcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMN5b2qAJ1hCrPCK6CLWfviz6Pc5epP6gw8wMN4l96STs83v5Hp1Jyd2JE6Y61T3iiHqq7aUVsLtXJuR5Z4uE0G5FKQYGoobxXpQGeEzSpz3ct1c27wEhxkDASjLWVAtPPQ95oXYPzUD2zaPSoe2Rz8wNuGTsVBFVXiNPf08iaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=1iiW07/L; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="1iiW07/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPvFhwd4t1J3rBw24goQ2AMd2XBdgI5M8acSb1PmK6T00F0Jhl/4c7gNnFQ/8qTZHcoiM8H5epOSFH/SvKrcLth1KcxH+hlpSeN+C9SqmB+WVfaBZrbqxEtwuPo3PEGgGnHcjHEsmWdPAoOF3FJ9aHZ1bYfJBJZkq5sBGPgPURLmrKd/2eTnmHXbqWK6xIpmqixLZQRAwmOXkIuGV4mhmXaEMmIC2PaskqrOt1UzOfp1AoE3V0cY3JVLgSzonoV4AI9JGdF+uL1HF3nb39JL4mpHF/71aEXjImZIc1tNw12cn99CfzPgnl7ZLc0lDN/1hNBPtO8OyJ7NaM7szDvINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glJXnym83efT86ah5wXNGNLQmzqfk5MnqExx5kngV+0=;
 b=fxeaqrnO0WSW5RdOl9DIzVM910mSraXmdwQn0aGN9GXnc0f0/nzCOFAP+6/vzdMMbQKtcEEY/IY8HSK3BqMOXruLayuf3TGiN8AIM9K/B5GSRxy5cHP455GeY+XWflIoTtjPYJ2nrDhYbEE8pmII61QxNJ5uXl/XFTkdJan/chYhYzE4TSH+m/f2lyRD8ffD0JAuUQcoGuicm9fVrlIknG3csE4DmBp00vRDka+KPA/+eBDw+KwC89xacgAv7yFvnoEFCI+wIE8k3c1tJkq/9/IaZ/LUMdSpdcc7+W4APXuQWCrct5eg3+i8AStcIYz7zIkOvwNGcN9x1/AhKHwmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glJXnym83efT86ah5wXNGNLQmzqfk5MnqExx5kngV+0=;
 b=1iiW07/Lrf7aUwRJwAHxnQRH1zKq5nzJGxfvou8z6p1YBY8pXZNnGh0+uzJpLN5LfiR2+WDaW9FfgVjpF30uaXx+vIIlJA1Ijdv18GI/VyWS22o9BWE0dqUsd0deDYy6UqbE3VCjcuGSUlXoj/NbkH0YaV0ytfdq7j8bUiPZ+BI=
Received: from AM0P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::12)
 by AM8PR06MB7793.eurprd06.prod.outlook.com (2603:10a6:20b:369::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:19:10 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::c7) by AM0P190CA0002.outlook.office365.com
 (2603:10a6:208:190::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 11:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:10 +0000
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
Subject: [PATCH V3 1/2] i2c: imx: preserve error state in block data length handler
Date: Fri, 16 Jan 2026 11:19:05 +0000
Message-ID: <20260116111906.3413346-2-Qing-wu.Li@leica-geosystems.com.cn>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AE:EE_|AM8PR06MB7793:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8fc425f9-5caa-452b-55e7-08de54f11231
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TbJOkBqnIqiPo8tNJLZgsbNVmXCeKzfpxpRVxSrNrDfNBy8oyuwZviH5SCIp?=
 =?us-ascii?Q?F3jzAdnliCQQkWhHBOLZGtnmaUg3OyALM3uoJPt73uQpebaeTJsrHFF/0pnT?=
 =?us-ascii?Q?6NCGPdWOTJTyeHznNScbX31kkoQl+OHMTuKBB2QxH4nHCFnnMDCKa25UD8u+?=
 =?us-ascii?Q?Sk/IJOTNILRNXGkIwRRx5+VcYSHZZOd2VZZk+Y6+3AWm0vtiFxAN2+LYxuvp?=
 =?us-ascii?Q?lFPFpG0nTFyWwyK8q9LDyrvUAqsV/yzc+ffiMPV0ehnOjjDunLg4Alw5VzxC?=
 =?us-ascii?Q?eydpoMbzZKds1oO8uoJL/v0TDzidwquZIGw4CLlZ8IUNZweEV6uTnopF9jcb?=
 =?us-ascii?Q?wxdXtt3hwMlM+dBcaNHehDo8Ti78VdAwT5BS4TiId+nobSwEX4q99IN0+r4h?=
 =?us-ascii?Q?YhdUqLkXqNeJGbLP9+o1nfTr1BnSLwhzbKkIL6CvBb/VbIvqa5cZ7rMoPgYz?=
 =?us-ascii?Q?wrMJ0dIFHDdnw4eV6dEW6gT3qUHG6SAh30Vd5TbFMlwrGUuk6W5VK9U8CyWk?=
 =?us-ascii?Q?7WZPZYj0knJqdSPoy9694/gY0P+RRYIT/fACHPzFHpZ0CaP5FsZ2xa2Ke7Si?=
 =?us-ascii?Q?gDTM08RyhV73OkAloj85fIkkuOA6t+pHZnM7eM5AOK+bpt3eYgksABpGzh4N?=
 =?us-ascii?Q?eA8+0YijUHTL+UvM+1mlAnPZAtcqUszpRpvYkV8+o+wWZ1WplTmmzZhV1RR0?=
 =?us-ascii?Q?gltX0IzyTjCe1EvSibQEyKEToKHF5jUjNRQA6gZspXADyLOLGDB5UQTmaNLy?=
 =?us-ascii?Q?F2rPpj9m7y38XwUG+CUck527X4HYMtHTxmeFArCDcVyefPlAVIBtieBlJogI?=
 =?us-ascii?Q?NmE7OkdS3UjnnEeuBTkzkHejhk239HkG1j65u1FJAuteHtzPAyiDWppfKTNk?=
 =?us-ascii?Q?yg+C47YBsQY72owoIZw3xs/JMYWpUKvPJxUmGPn5+pwd2TRBE+ndb2Owd7xa?=
 =?us-ascii?Q?UhGcTZC8G1OHSF+LwwGT+wSOZsqDPt3ucjmjeVTsMGWgFSJmipyXWtansl1B?=
 =?us-ascii?Q?roiQDzxI8+6v9rgEAsRDl/LyGXK8tozHLnQxnpVPuK3kXE6oUhvBlDR0xNOG?=
 =?us-ascii?Q?N4HMAWRcLv87DVOhEZTmUDS7JvXBv7rQ39TEsWv0w0temopr0NqhLnVU0m8s?=
 =?us-ascii?Q?PLCJz6oqaisPZ6tyjt3dWRa4p0ZHO81Tv78UC6pkKElpwqw8j32gYsicLWpt?=
 =?us-ascii?Q?7k0oeT9EKoorTwpMqYybPLnYlqtJrSWJWLoQgcQwbBnABL2cNBiLhsDrk/6x?=
 =?us-ascii?Q?eV64Q+vzxrXQ6n9zf7wNcN5uAjB+RPbFcBfNZW7Sz43W006wNLS+TaNhqLeL?=
 =?us-ascii?Q?069YZ8Q18wTu6XGlSMZqrA1U8Wy+MYTOwmyjf0NBBD8Gj0jywAe4er1UA5NZ?=
 =?us-ascii?Q?VeYVsgO+hYyVMKowApJXtYg7xD1uOcoFgkGXuAVmkMNMdrYQRka1lvOjC0/g?=
 =?us-ascii?Q?7Y9CT5NmlpuRoXWe8g6CqTpHdgiYkGmIYatxgVSY1nTIUdypEwyBcWdX3tRP?=
 =?us-ascii?Q?EPjwIpOt4bFSVJaDsz3U4AvUYazvBur7/5twBmeY3t8QJqyC15U9p/i97DJZ?=
 =?us-ascii?Q?hIgv/0seV+PsRGguI/sMHjFFYtxqm4mPBCcyLaZlKsixXEJhRgksBt7yScbn?=
 =?us-ascii?Q?RF3AkY16YT5yyi9fjtQ10bv75f4hekeM0pa0K5Y/wnADgP3rvR7J78CR5nSR?=
 =?us-ascii?Q?2Ugvj2lmtyffjD09nCJGCgJBXF0=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:10.1916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc425f9-5caa-452b-55e7-08de54f11231
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7793

When a block read returns an invalid length, zero or >I2C_SMBUS_BLOCK_MAX,
the length handler sets the state to IMX_I2C_STATE_FAILED. However,
i2c_imx_master_isr() unconditionally overwrites this with
IMX_I2C_STATE_READ_CONTINUE, causing an endless read loop that overruns
buffers and crashes the system.

Guard the state transition to preserve error states set by the length
handler.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 205cc132fdec..05ba41144648 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1102,7 +1102,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0

