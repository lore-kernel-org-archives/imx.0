Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7BB3128B6
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555035; cv=fail; b=n/adMGJhdxwfuljucoQgzVm6Z5LEg65sKRrviOQTSbOZXhjSoSAmjxdszmiv9l+XV7KabqTgtUadFUbbuAZKF6HOz6phN8ZpE98D1x0raTEV5xUHiUsBEj6NHx6DwgbbiGOOqhG7N/mvGYtS12skWg4dB7jVZgcvPabH9mPC3Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555035; c=relaxed/simple;
	bh=zenxyCnrk2PkVimw63TYeDFyU5E/XODwKaV/Rk6O6wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pzJQuZ4XTFysohgzn6+fm6NWQpr8Nc/vNarAMORnZX8enhe+37o8NJE7+aGi6GeXthmnQR/fHPEUKaH4al14r4xdKO4c16rkZZ3alTQ/I3yMNSfF1rfSWF95hxZAo6mXlV/RWDj9Jx/TAJdhsA2XtWRGdrHDCS6I7Z2gxtUwUyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=1Dz9CtEi; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="1Dz9CtEi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMqPudI6O4HMWv/zaO/NndgS/ax7qYp/odleQpzhFvKIuIbUn4sWiu8eMZxr9UT0a1FkcNIca1n9bb7zv0af48+NWAzUR7/khsEGygzU72EGU3coLKcOP1SYOJZaX0+kDhx1n1KhDtcWamOLsJJ0k/UuxLjAvXNhfZ6ZlBHmF3i4rlEzLGIijPjNnqR1h8L/5+3fo8Q2NW9Ksds9GyBVNTyKY9Io78s70XxY+qcnpJdhu+/xGXyAw56JFQKoHzIF5Qnrm4YJ273+/gNSsUvEFdkzsXjSL+h+X/H5nwR+U/qKezKzdcWbKljFFfsDcVxV9cEqtbD5xaU0vyFLHEHGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvOLKgBt0iIkqmp00gos0etEo79aDgCs4FvkScVEjIQ=;
 b=wR+WTvUTEj+jMU5zItpo09s91PXqAXvTgTtp3NgSRyUAAuHdGTF2Pr4Kj29tzDJXriYOYLGbWW11i+8Qr5A8tTQuN2km65y2RUwW/ijH9rI3gGMdK9tBkIVMU5X2moiWtwj8KYSPtHU0vWwpn1wzSpfOvwykCHySqkfIbwjzBvre8o3z0uXuJusUueSO0OEFMrgS+BXxpqCaMVnSupnqTrgRxF5mIrd1XfGiHK6UEeIybiMUBxTm0yHvfVd6oHf9+K5PhL212KWJSXOuLp1H/mM4Yl/5KkgZ6O6UJJmjemXqSmx7zWg+30jhizoMfPyDt3ANZS/bnv2Gd6VxJexOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvOLKgBt0iIkqmp00gos0etEo79aDgCs4FvkScVEjIQ=;
 b=1Dz9CtEiPvUXqH/Je0XMKHcVPKLPO5pO6rQXa6TjsLtr5XznKwbHn85+OUBO/LyvMou/5mpPBkK++JJ0EZTn7Rc5aPvXPZyGK9ybXBmbdDOQn2tkr0YcABBLfjIme8cH/MKhU5fH/v6qK3ZUPji5p4OFj7UPV+dDxLC4foHW5uY=
Received: from AS4P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::6)
 by GVUPR06MB10753.eurprd06.prod.outlook.com (2603:10a6:150:32d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 09:17:07 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::8f) by AS4P189CA0033.outlook.office365.com
 (2603:10a6:20b:5dd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 09:17:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:06 +0000
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
Subject: [PATCH V2 0/2] i2c: imx: Fix block read handling for invalid length
Date: Fri, 16 Jan 2026 09:17:02 +0000
Message-ID: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 09:17:06.0386 (UTC) FILETIME=[E260FB20:01DC86C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|GVUPR06MB10753:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 46448750-2b2e-4401-f4b2-08de54e004f8
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pBr2kiPCr1j9f76wVTBMwSP06a0lJDpZWGHIMdlZAwmyu5wD4qog0YeMO0JF?=
 =?us-ascii?Q?N/6VuWqO78tfiSpJdO2L90PdALhq69t0EuqHMIMLbwrNlUKu7j8BlSZP1gQT?=
 =?us-ascii?Q?I8xbKwn8eF1fe7a2nAE3u8DmcMAWZS7fez1JWQc0K+Mw9yUpYgj89R+qKdHf?=
 =?us-ascii?Q?tnvogL5MIlK4KxP5ywPkMkDujoCfYtfCRRaQREtJUSAMH1W7F45SMUh0tlgl?=
 =?us-ascii?Q?9qzWTgxJY2j7pXsh1/jMjKmd1rChBfjuKXRIZBGA9ZGcl1GHcJjjMRm5TKUT?=
 =?us-ascii?Q?gNurNhH2jYFa0CW/iKHPJPqtuBPx6CKzzcjl1csOtsSHBGl0UGJLxMZzLtyw?=
 =?us-ascii?Q?5B7T/s0l1qAWssPRHvjpBSioB72uDCc6Kh5OIViXogq7aN3IXMAj5BV4WJnH?=
 =?us-ascii?Q?XGgu2GCL6+FtHbMIIaSOje3wWvALfrKDyqS1jKaRBL7RRLSvSr3nddz8Hatf?=
 =?us-ascii?Q?4LlbJiJaec3iNLtWQxYV2QuzfXJxciz6tnK0/ecFhCw+hV6zN01MaZXR2eN4?=
 =?us-ascii?Q?rfiQikyp7bZNClDjOAYhoashF4g9yOjxyK3VpDMbCJhecovtPLMWDUQUfZ4R?=
 =?us-ascii?Q?AfkEtf+MxXWFysAipvNRFoF/O/ilqs3AGaeRpBZpXbKjZ3TNVADBqoaEHvdI?=
 =?us-ascii?Q?AAadz0T8mJkHbnb6DvtLEM8AJc/6VCP1OtjKIn4pIy+inYCxlI44Q4K9Acz7?=
 =?us-ascii?Q?QiISK/n8gDSVKAGsjBnNI8mm74l7W1Ti4v4gfGIsurv0c+bw5sD1XX7bPkNM?=
 =?us-ascii?Q?DYkEK8Boc71RUI62ZHqPmcf41stgCR4GUMYswIvait5ynVAopUo0esL0YsFV?=
 =?us-ascii?Q?AanqEZzX9l69LayaGFIqLnjJBhV1SiJ4WMEwQWdaapeEEDNgaKPUaumJgM5W?=
 =?us-ascii?Q?etuNSl01StgfU5Sj/qWsX7RdF1DPsX3REj1jTXEzYnt1E3L4UiI95nUgPRZE?=
 =?us-ascii?Q?ohZxqHQJGg55gpvUpzZDkGe8KfYU+tkP3o7f4v9NImFj207dSojKpkgVVrWB?=
 =?us-ascii?Q?+wSF4CifemZadXJvRVemCMgw1q5pxu/4yhs4X1W/e3cAux7NBbpJI24IElGY?=
 =?us-ascii?Q?QaPy1MoERr0nNnyWFlRnPrEbcJSJ9/y2QGOmq9v0G7yN6dvBV+DPGOhRirTU?=
 =?us-ascii?Q?mAcIp7cx/ssw1NGC0D7VL3R4zlFpsWBZN5IYHJl77dL2QJ/gXvEZMjzdSDwN?=
 =?us-ascii?Q?lw2qzPIb461U/f9NEytZkcYmu/qVo1PYcXilyvS20g3L1sWuVyyoE+2GzTAV?=
 =?us-ascii?Q?EeNiu2ril3TbVplDsaY4w612OFsRsaB9xXRltONu9lx1PL6GDr4TGY+TzPyw?=
 =?us-ascii?Q?LWm+FxAUUmIp6F3hySIVZKxVXWC5kozKHeFpd9VSLRzi7+DcivxhpioIDvMi?=
 =?us-ascii?Q?wZoAGnihJfJp7UPnkLoL0lkBDLnecjFmQoUj7xytGskvQyRl5KY44ccpqkF3?=
 =?us-ascii?Q?dHaU+jtSlk22ckbVzAUhs+4iaZn1nApDPjaowu1CAcf9oq/qQ1MR3z9KGGiG?=
 =?us-ascii?Q?atWvNc/ijetEPCIBbv91JGBDCGB5MNDOT5hQR+trEn7FMmEHqUb4cqBx9X+z?=
 =?us-ascii?Q?gl9YkoPJXTObUi8JHdqNUif06yJkKKdH2VyBtWwE5xK3u3udCqs7UjQjmva2?=
 =?us-ascii?Q?3Hi5Dii3QCj/LUSygdZCf3ZdV4EJLFobDJy3mAkfTo+SVXAPx5BRpo7GTs6D?=
 =?us-ascii?Q?pDZ6EAdK+5eaVY5pUJi6M9eozpA=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:06.5661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46448750-2b2e-4401-f4b2-08de54e004f8
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR06MB10753

This series fixes a crash and bus lockup when SMBus block read operations
encounter invalid length values (zero or greater than I2C_SMBUS_BLOCK_MAX).

Both patches have been tested on i.MX 8M Plus with continuous block read
operations from battery and keyboard devices sharing the same I2C bus.

Changes in v2:
  - Split into two patches for clearer separation of concerns
  - Add detailed comments with reference manual citations
  - Implement abort handling in a dedicated ISR state and handler function
  - Remove modifications to i2c_imx_stop() to avoid affecting normal stop

LI Qingwu (2):
  i2c: imx: preserve error state in block data length handler
  i2c: imx: add abort path for invalid block length

 drivers/i2c/busses/i2c-imx.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

-- 
2.43.0

