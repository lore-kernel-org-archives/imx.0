Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108AB369984
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562357; cv=fail; b=oqMifZFmoXACDBcb5gJ9bRqXXpxWdjemx3naC+MlWlt5bUg2UlaJhX1fH+nDWqVNGbAN7Ec5TuYrUq1J3AKjohcAM3SR0U1N3a44dJ6x7LYRr3UNtv7kdGBPR1k7PT0GuFP4WKvVUkysghO3w/CuzZPfwy+RkhMyl2qzak/R44U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562357; c=relaxed/simple;
	bh=XRdV4fuk3okZuGsQRCrbEsVAQ8dVphVOSnN3t8lrnys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dFrqitEFsCG13yAgdkWKq3uAiS+Tm089g2yrXOtkVgpVpFpd9ZnhagmVySq6+tzRB3OP+dP/jJ1yddqbk7OnkMAnku1s5tG9zfhfZ9+Y66c4NrQvoIkfhqKbra/7qz/hpMJBDYlgR99Z+qvvJbJtUykmCYMTxg//AIMw+QFJfNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=dINjtcW7; arc=fail smtp.client-ip=40.107.159.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="dINjtcW7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izttycINlth+Ss3c5D5MdTSTXD9/3+gO8MxHa4aCqLC5uH2+lxJlXxB5ugF8D/5q7XvoVqRFzSZiauKQTm5vSSIqyNWtNznL/sb2Zf9+8uXTrh6vsybzJ+cMSHAWgoG0yszfrnn2gbp659dSq+p/FHJ4np1Swj3JrnVy0dsIZwE7Ak6ua4Vv3Bn6Ridzy/6pzGh8fq8sbyGDU9NrRJoau4dv1f4Daw8dIBg4l1W+utLxZGtRc5oWmCLN0j2kyHP73GyO3rMnV5DywNbbkpT0BuCoPKI9R7dzq6pjkUnvR8PKzXBpZiCLHfUZuBAOHYhB+f5CZ/CoM25Kq4CJBAILXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6hi2Ng57jOgja0NHfG8qsfVJKsfUIfcFnUYxfdNiuA=;
 b=s805yd3TK/O+xN9A+XCU74RqpqXNKXnTBCbn5QfL4MQnYqE//w0gEQW5widk4Vx9lmiX1hRtpUm9VYqU41ghiODI6/GhzZNcLeDnIjWbbENPih/XIy2+o5gbv+eMcBIRUzBniar8f/mzYfuxWerQ1ca6sDhCXj1diU5JvMxIWU/VGDR19/NDezmsXhWyEWldL06PNWfR51FXGPe/MhqEi+jO5ggrEQbrttanG6gHHQcrUE7zO2oSX5cqpLIw0ZHcdrg2x7JXk2CZFnbg3/ojpoeGXOfDXXdclzxKpizk1rjQeLFTO5sM7CFNblxposCB45dxc9FFbth9FeLpx4HCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6hi2Ng57jOgja0NHfG8qsfVJKsfUIfcFnUYxfdNiuA=;
 b=dINjtcW7MOA9xBOw0SofEPLzyYXcpOOTAwvXBJnjF4PenD3UUDjqhnm1VaK6yRC2SGV0NcGqWqWGQxeFJJl2FDfuxXV6pcwtNjXYJAGQmWhRyRDlh2qeLGaLIy/lAWl4mGBsvtps6WzrWEexlYB2K+X/uB4RtOPNMk9DT/DXwx0=
Received: from AM0P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::12)
 by AS5PR06MB9039.eurprd06.prod.outlook.com (2603:10a6:20b:680::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
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
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:09 +0000
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
Subject: [PATCH V3 0/2] i2c: imx: Fix block read handling for invalid length
Date: Fri, 16 Jan 2026 11:19:04 +0000
Message-ID: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0541 (UTC) FILETIME=[EF51C150:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AE:EE_|AS5PR06MB9039:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a20ccb2d-00d1-4511-c17c-08de54f111f0
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9lWbYa/8RKg98KtNra4f6WjDYMkcKE9G+hXPJP+HRBE0p6V/sKQDTmU522PR?=
 =?us-ascii?Q?PO4QlARJW/a5BvGCVkPL/X1qeiix0ituvps+GTkeM7cg8Tk0rYSOzNyT9QxN?=
 =?us-ascii?Q?HStgIRblG0L2A1u5lhDtGylEEhnlAF9nLu6hRqzZJJMwx+Lbakeel/deHy+5?=
 =?us-ascii?Q?jeoUyqAak064Vy/AJlE7MdinTBCr3sdkS3UjKKx54+FoNucPJSUOUgdj9ppb?=
 =?us-ascii?Q?RYLCp4GgQkaxPKmZSCumQUs7rLjHnB5Hp7SRyntDAqxyDbEEdx1/vf+NaM7L?=
 =?us-ascii?Q?G1bSDN7upVzDwy6yTBwyRTtaXmJdJ1P3aAYKys+zm8lkNfsMdUqwprQjn5hh?=
 =?us-ascii?Q?F9A0eiO/wlzd3/oyIuufU7xWyLHeueO8WX5y6g2Xcwu1OYGuSJJJJ6kP0L13?=
 =?us-ascii?Q?JX8aa+ETaMAD+/9xwRJEV/oiMRmfudpBWWpj9XIAFX4115QSXUfnFuqkPm7w?=
 =?us-ascii?Q?i+dENBxdKbLgocQUwjxaZnCKebZL73ZBKK2hcyfFjsYoZWL3442leyetlCVF?=
 =?us-ascii?Q?FzXFnDdILaoY+QRZ82FLskhMU24r320M43FhEBQ+oLFW1l3PpJEsh5UcsJJN?=
 =?us-ascii?Q?oE/gPbxF65DWNqCXmGg22x5apuD0jptNq7v5XK3UeASKhe6c4dB+xY5C6p8t?=
 =?us-ascii?Q?jq6ZhN3+TsO2Pg5n8FyAgcHh0mXiR1F3eUdt0cKEYtWzInIs7eA0tZ4oAups?=
 =?us-ascii?Q?Z59VwHphxcUh1hv2dcycDkr/r20mB0YGa+NMVnRYYaMMLwSfHouxpH9S9Scf?=
 =?us-ascii?Q?btMSE8QmXlyyW+LjS8HptSRXhXbr5yHGK3KqpeyIKB41+PPPkhRJbxGs28W+?=
 =?us-ascii?Q?NrbQtqOoICtjyTgScZZuc2DEbZCHMDRFCw2ylc6v+kDc4Rld6DbN6+ELhOiB?=
 =?us-ascii?Q?wej8f8IawezZIiIR9D8fx/7B8XGJEe/SqJsCH4Gjb7/oGuVSuRSWz6nRszQJ?=
 =?us-ascii?Q?61xAkCKNt7XpQH5dQd+K5zptsfOh4Vn/yECXeomfS1B2XoVfBwIBPQHrAhaa?=
 =?us-ascii?Q?hKpxBfh5vhg4TGWeej6gBJ1WtMyoiSgmcIEl8+D62caBsS8KE/wNxqFR4gvd?=
 =?us-ascii?Q?mQxJz3t5QFv47vJPl+/EvTB8HMSA8gQIcfQm4oAPwjP1Vm+5ICbkW18nJUeF?=
 =?us-ascii?Q?hHYJG9s+32yxkS1ouxzt2dCkNqRgo1Tf/CQMjJSd5u+i5L+vzj+O34C7I7Hy?=
 =?us-ascii?Q?SNtPzX1nzZIlO0Ef2sHinq6fb3mu5kO4AIZDN0eIarjsatIhxAx1RYEVSO0N?=
 =?us-ascii?Q?4dEIDKtMRyyaUJTdWMRyGkz6TK/jxzsnPSpqINBvNXFjapCAm9tqw7/OU7uz?=
 =?us-ascii?Q?11PkRNWlKiwVq9iDjfUdjAqqjEUVSW/IFa+FASWKnLJGMFetPOzT0fqK0FSa?=
 =?us-ascii?Q?7tmvEORXOna0QeFdEshzel5pGEepFwFeL6NnPPtGFMWDWOE2gp3kfYWPleyC?=
 =?us-ascii?Q?zbv480WyyWgWcRnD8wh7CuS1l5duzSdcLgTBuG5xpg0r4NB/5gajQglV2Hns?=
 =?us-ascii?Q?0LLwTrXCzo34ImtooKiv9wNT7y7hjZd90qYfEe7y+B3e65bi61lkZRziUBuG?=
 =?us-ascii?Q?1vg6NGQId3icXrHzZ3MZ7YbW/gLe6fp3GkGdlMWiajz1yiSPWfQtiCPAPed2?=
 =?us-ascii?Q?cafVct10CrjTbhyHnCYQEGMjOvsiaKj2ZP4b3pHuXlc2d26mEhxPFzQXw17D?=
 =?us-ascii?Q?zquc9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:09.7676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20ccb2d-00d1-4511-c17c-08de54f111f0
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB9039

This series fixes a crash and bus lockup when SMBus block read operations
encounter invalid length values (zero or greater than I2C_SMBUS_BLOCK_MAX).

Both patches have been tested on i.MX 8M Plus with continuous block read
operations from battery and keyboard devices sharing the same I2C bus.

Changes in v3:
  - Add trailing comma to IMX_I2C_STATE_READ_BLOCK_DATA_ABORT enum
  - Clean up reference manual citations

LI Qingwu (2):
  i2c: imx: preserve error state in block data length handler
  i2c: imx: add abort path for invalid block length

 drivers/i2c/busses/i2c-imx.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

-- 
2.43.0

