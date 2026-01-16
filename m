Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81233EB00
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555034; cv=fail; b=sInzdmZx8kynIuKhn6tEi56ANRg6soFWxpb99ULuMK0S4jMRflpt8+ht2QLsIoOcUsWgjFWbuZKwbdps6bGiZ8Co1PisIdLQYDYNENrHaTunJRP+wfTYLs7Chmp+dzM9+mXtGQ+cpSWBGzd94iNLOmWuOUER0AWWdqftfCifa28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555034; c=relaxed/simple;
	bh=OaoxgJjSLRqgJNkEF4ebw1iRQI7uXBg45B1D3VW5r6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2J/zezTVtFFmM/71yThBlYfW2rjNZWoe0/yOxg2pi8G+LoMKMyfpxuG4dDvoolgP9cvfh2Cu7iHO4UlUFmct4b6KAOR/0eRIStz99v4R/WSZgzK6vtVuIIRJLJVyeMnyCi4OWeMbK+2AwRHvW0SLac+DJ0mDOM4N3SWQPlvn0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=UrpBxp3h; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="UrpBxp3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gB07sh+E3xUWXgqbA0ITGd/46ElEo+W1We+UljFKKq0+k06nWY+B5/XaO6NG80VJyUwPgQj5Oo3FW+7L0Rwt0wUl+3jnEOxG9etkwMvdPfjEK/ZIbQRELCRM2Ijwy9ozoLRcccZ0SpWKyRl9YmQ5umXhKrfnc6qjMNFEVLAzXijjZDVBUwljXWZn8IWXGmb+WiJay0zYfjtZxR4GvriLI+MaP6c9WuOB/9JuDe7K3XLTW/K1Tuf8XQGEQdJG6KKJcvyynj/hdhRhCD+T5Xy6fONUxZCWA21Rt9N1e6ymVVq+GJ4c3t+ZlB7kZLDcjUrXH82FjecAnpXWyCew8bhWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPT97ZO92JF5iijb60KQS1ccCmcahHfYT0GR4HzkkRc=;
 b=GI+sgiBhZD4AnnElRr2N5fHgfZfNtaHwKLxh2rIaVa8pUuCbFYNnAkHkm7TE8dE87zpRHOv5opjPZsNVi+Dj965gBEcEhFGqawgxJHLaVm/FcAzgfsI8WH+qrKCCaoaFD+YJ2Q9lqy/32cLyXog/ni2i4jzpobqIJkkfCHsqsHcAA/lal8gQ/NsUP68VlLvRnzTx+CIcdSj/KYIHcGAw/oAcx7n7zgr9HOqOAmc7ueNEcO8ie1lOW9mUqzBH1LzNvPsUaGWLxchRueYFDB7cvopG53AeNRjNSBPbR1hucexhQLSUFOavHntV/tT78EEWpaDdxI6emuKAJyt/QFbT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPT97ZO92JF5iijb60KQS1ccCmcahHfYT0GR4HzkkRc=;
 b=UrpBxp3hbsnrK6DxeOjW0KEhUPV+HBI/ewWUW0vqepuf6cCLXGjLNqOEgFGLouZBTTqtU2XO7rUwZz1hYOmlNP4jHYTtSZcAp1qvKYgTkziwPr6U/pJw+KtzasKCwgc/LwMMrGliMJXr+RQddlUp0VnWsOCfrkH34/vGzcuAHXk=
Received: from AS4P189CA0031.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::11)
 by GVXPR06MB9654.eurprd06.prod.outlook.com (2603:10a6:150:1e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 09:17:07 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::dd) by AS4P189CA0031.outlook.office365.com
 (2603:10a6:20b:5dd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 09:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:07 +0000
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
Subject: [PATCH V2 1/2] i2c: imx: preserve error state in block data length handler
Date: Fri, 16 Jan 2026 09:17:03 +0000
Message-ID: <20260116091704.3399142-2-Qing-wu.Li@leica-geosystems.com.cn>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|GVXPR06MB9654:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4afb912b-9a55-45d9-225f-08de54e0057e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KnwpAg6IJpJYZWYVsH533F6sV+7AW+CnqmQXPqTaVOl9Uc2y5zBwHtzDWM9W?=
 =?us-ascii?Q?EMIwsuWi7ysZVhQ7zaLETgpBvxfA8ib/oHyMWTLQ5mJs3odu4qtgt0DPtGRn?=
 =?us-ascii?Q?5honvQBGAcdhKH+UZDxikjRU2vjPXFmEdqRYxShQFcFi6iWOHhSFAhx0rVwx?=
 =?us-ascii?Q?S9h8geGSSf7ZgzG5XEQw2kb5hP/cqWsxzEFWMNoXy/YAstTBf0F8Of0QeCt7?=
 =?us-ascii?Q?QmWvnh/LRh93Tg1JnuTWCwsq+en7eo/7SF2+0pCyHaUd3jbA8JHjyyQcGflS?=
 =?us-ascii?Q?26eqo3Zwb5SSuWrdgev78BSBOIyBWWA2NEj9LLJ/5NxGvRQx8h+rs24ojmSy?=
 =?us-ascii?Q?T4oyabqoXYfR0m38EfAPYIPyh5iHGLN8wAIMqBrvtGZr29guzHHI21Oz5NSK?=
 =?us-ascii?Q?ofRPqLEzKTNaXqZe+kgUl6UmYq64HZA1EkmdJ/T9MYXPfdYW7z68WueWUnmi?=
 =?us-ascii?Q?mTCv8XL4LydIwyGWZUMZ2KxHy6AGtQSvU59CPt+h3tesTzOCHw1Bg2DL6p8Z?=
 =?us-ascii?Q?aSHwy8lyHoq40hAwRu2MKmObppkpRHc21tN5E6vYgPodWnppOfSQemF7KC3j?=
 =?us-ascii?Q?8+1U5qOHLHisjO/yF3AZzjb6tauwb0LQiYrDkoKIX7dREuII8+/ghmHY9rmW?=
 =?us-ascii?Q?zQgEghH5ir/a5DX+YpC9+ByBbfkfBegYcr1orFZjJoYVLKmkqKf14R069GAI?=
 =?us-ascii?Q?Bn1GAVLUx4dBZLMK1aKFXSuoE3NfLrrSez30FpVCnlFJEPvmmIJiABGLw8VQ?=
 =?us-ascii?Q?2ZWUz+SyQ84XoWX94aNDdC/JK0Nj0cXsw0fmtSi/xmjO28jeZPFSgGE/fnro?=
 =?us-ascii?Q?7XyDUUhJUSrneX4I0G65XpF2QPYkqEbZoghr4X8kWiXSXk+xuD4jJhdHcBMx?=
 =?us-ascii?Q?0H+4srYia6spRE51EDIIFSsNg+Tzf9TkniXjZOgfls+yigXTRQly7VcKsaV9?=
 =?us-ascii?Q?HMXMfKBkk+UCU3fIB066+p0NCKgVz4DS51GynkcxYvWSSacJqLLBMjLZL/h+?=
 =?us-ascii?Q?1OBk0T8dsFIdSM8gqf15jdnOFmaKTsdAdco7ea5MSH8tFyxwlgzKuwrfA4nJ?=
 =?us-ascii?Q?RIqst172niGYEWI0OGb7eSo1rS6TJqlH7venN1oS/yMNiHe/ZzsZ/EQXgZyZ?=
 =?us-ascii?Q?mJ25RfaILGEnT4PWMYIMlQcH90qqQNRlRDtKZZaz4ko1ZY/mDQ7rRB7JxF7r?=
 =?us-ascii?Q?ME0ZtEU8mpFGEcAIY1R2eaOMGLR+H7S2xafPun5XqEdnVTIPiUxJDlN3bkK0?=
 =?us-ascii?Q?902BVOm3iDP4TzkSLGNJivHnsA5z5JU3PeOZOXctjPK/7MLK3NKMMHVLeE9S?=
 =?us-ascii?Q?FL67us+QuSBwqMf1e9WDAJf8qgJMpYLyVYWNsh08kxMZzzUp6oBaGTk+iNOg?=
 =?us-ascii?Q?PpNRGtK8Rv75rIP+TvRGp/jKcTARS8s0Jw56kXg7oHMUyIOubcsv6ut27GxV?=
 =?us-ascii?Q?yOkPciUiAxdRAWneCE/vsB55e0x1qTCQT7Hxgi5TstyGuumT0V/mqp5ldvmE?=
 =?us-ascii?Q?8/tnw33yrgzCxz7jHK1QVR34STNKUA4FiNJm5oD2yWZa5j88DfsGvoqYOVDa?=
 =?us-ascii?Q?ffOcRL9rRK/8Duzl0HG/dCe9RIXyFG1RtHNjKxgr1h1eejX34mkXsQgpNvJM?=
 =?us-ascii?Q?A0tePKVuAEql7xRRwbtwaWxL8dgsgZo6YjSlQnif4uBniZ7fMeO0lW8EkBGt?=
 =?us-ascii?Q?JkY9yUt116lL7yUrq/afBVfMviQ=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:07.4393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afb912b-9a55-45d9-225f-08de54e0057e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9654

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
index dcce882f3eba..85f554044cf1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1103,7 +1103,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0

