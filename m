Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E730F7EA
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321323; cv=fail; b=q0ThA48vDB/wdoIpa0od/YDchGcYv8xD/LYYvWQUIZa9mzpGeINcziYOm4Kjcw070jp+FZdyQbFMCLotMctsO0GmkterJhKGHtc9pXES44+z3yyjSOhDhjuizI7X0nkoeg10ANBPTTaDplQKsM90VtAMdWazV3HUYeMPkpnxgA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321323; c=relaxed/simple;
	bh=b78CwHG+k6sd+aqhwJ+iWPvvknkrnC/y5rbXaQ0pYUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HIgUwmbqouUvtd59EpJ3Duv7M7+Yh+aqcAnMs/INWGrxwzn16W/SnZ9wGzNYyx3jNxjIXlSGRCeTnsnjDgzqKiWqFszZEyXIMnIaWHS4SAMxch9zPlDHfB9vcrdqWmD299wlwB2NxrQwiSfJWH3u55wZK0hBMezW7pZR/dqkBNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Ai/lld2V; arc=fail smtp.client-ip=52.101.62.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Ai/lld2V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjb9PYBzSyt+GVwd8NSef7FX+7YU7wUOCJR5zp4CQsKncM8GSUhPeWToubEdvhdmet+ajrbNlyuGBIltPBfw6vQcMVwa4FhvnOd8xQ7nBOAwILYP8HDEUM56pAFk2lmfnASNPHDMmWOLtZ/26vVVc2HELriCA1xG8ERAT53A54FHCooCQSQ05oqhOIHnMnugB/qArIIlzWzwxgS89zuy74IP1pSyd7mm07RSx46oQ+QqruGfr3GvP+QSUGqIyHf/QYJaWMbPqXDe6kyo6QJpmEGxMsUY8x4IILcGn0DbjYljNK7yHKCIYPyYsRHMqPk+oeMp3aajJxZxvuBWERIS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyTEry+J1Aou4t3VEoH0UTk3tieHRzgKydfD3ybVZME=;
 b=slx7LXClrussT38AMg9taHYXbq+zmLW3l5JpXVj+Vtpig5M4BdtdhK0M1Yj1FF0a2sn88Ms9H2cQWugZI3bhh0O0rgnwHCI73dd2Qw/MdH+AEnnQREXPo4Y0LvVkvsPJFan3eRn8vIEmKFSUom7VoMcCoRXbhRdxAwdGDSJA+t04LtHMlU2x2gJmSkz3j0a/ri9afXrDW6TY80koQIpTO8/Ob6nyzUCMqRibiAlGOX2Wy0O/GORtZkSstyTn0NSBHOxu6/bI2J7Vn5n68nPERJbEyh5uOevRLf8yjBOZ8RK+EM6mmXCBCTeyOhLeLO1hhjEy8xhp3kd1pFj9iXDeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyTEry+J1Aou4t3VEoH0UTk3tieHRzgKydfD3ybVZME=;
 b=Ai/lld2VDYZMfYq9PMPoD7Gajx+7hEi/MuRT1UuxB6SvQIvOM7ewAZpwf/TtGkItIhXWeFvAqNoAP1pVczWYEfPplysmczWzzHJZFKPkutGU3tcvA6TSw6yumMW+wGGqVoew22FrJIdQP8QcO/jUT2Fq7V8fo7AT6Fu3zihSVpuHYWVKkKFToyZ0k1MKGiCITUKoI56jBGRRP/zHumG4rGwELANs25ISPCnd2IpL6QU6vHi8MtDT+PzQjyKLtFz6NMul+pjFHKFrgqESAsYmP50vnN5A3Y3DmRWd0fGpiEVTdRd6q/0emdnOuSypu3FkepriXKhL3m7LpHbrlz6+7Q==
Received: from CY8PR10CA0044.namprd10.prod.outlook.com (2603:10b6:930:4b::7)
 by SJ2PR22MB4459.namprd22.prod.outlook.com (2603:10b6:a03:565::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 09:41:58 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:4b:cafe::de) by CY8PR10CA0044.outlook.office365.com
 (2603:10b6:930:4b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 09:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:41:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 31A39E8F41;
	Tue, 17 Feb 2026 11:41:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Date: Tue, 17 Feb 2026 11:41:52 +0200
Message-ID: <20260217094152.19958-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SJ2PR22MB4459:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: adb2e0be-8d76-4550-3bef-08de6e08cb3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v8CMKPv5SXkWyj2t76yCzQYlJ2/CahQlSbPsS7VMHqkjIBmz1mbHkpX3lEJ1?=
 =?us-ascii?Q?3qSo1IpFQ7c/8kxK/ocn2zxacimNqCJp+6TCIUf9J2SlpM/0me1wXLObex5a?=
 =?us-ascii?Q?3rRIXt7dd0syfL8dkfx+OzhX2SASkwRHYQztRuwp//LONpZ0SlFa2RchhTYz?=
 =?us-ascii?Q?mnlfQXi3DjmnMDMWeAsgt9QGsJxZPvEZPIF0sZuRYSqGfcbRmOFdCP6kiRHB?=
 =?us-ascii?Q?69rsfwRtx+a/zNow/Lbmw//v9O2XajcwP9Yg1OfdMvNpjbCX/3NGgX9Fcef4?=
 =?us-ascii?Q?gF03y3wuw0ldwbsWjU7/3khv3+9gmvdoKVAmV5ndWzdqfhA5eoB+j08MzLWs?=
 =?us-ascii?Q?SCts5A1BhK09D+ArSQ/UouGia40ksJV2INT2DQs0GIzJD37FZ4tFqHi61zcH?=
 =?us-ascii?Q?7KOXd+EgfymDvtO0x+x5hB5wl4aOn8HC3Z2AhaQyu2LAnAycBl50n8z+xKWx?=
 =?us-ascii?Q?KYprWnGIloYkSg2ge2hAOFfnJSNR3MEZ3xx6bPq/lvfSVyEcG85oMLCUQMig?=
 =?us-ascii?Q?DcgiSZEBLQEU3pz/yCnoJ2A2ZUriFj12eR+KSOfKmyhTluFzmRfVEDLEEDIm?=
 =?us-ascii?Q?X/ybUVvMflXUPBw/22rMRUUwjA6wkKv/cyfT4xv4jYQswFmNk4YHHYmafgtA?=
 =?us-ascii?Q?afb+4CBTkjJSqhdpnr0NnMksapTVhb7p42EtfFhYwD33dS2UA70BJ8ZGgEEQ?=
 =?us-ascii?Q?knCPl2yZUJMyOVeuEubeju3FiPVS4/EQ6bWy3p/Q3fCOOcEBkd3ZT80FYZW3?=
 =?us-ascii?Q?A3dOEntuPdcqZ3uJXQZyF3kaor3hQNbXLV1T9VF1vPek6lkTMigG4TBvW0Vb?=
 =?us-ascii?Q?idyVdqD3A01QFQhdG+b8fMCiOF4eXQhVEMdNMgJtS20RnlrqcjYYEfeR855X?=
 =?us-ascii?Q?YnwIyyBBUzS5Ani49d4cp/K1/Xtq2jkCRORukD6VO/JnbPlHTl7zfsrbHe3M?=
 =?us-ascii?Q?PU2BonQLLaPTIRxs/cHkza8XNpVa9NGYhwQi0efZTUvksB9FoczD8tKQDfEm?=
 =?us-ascii?Q?gRGmpHtF5o9YLSxj91lurR+dWdS+lhTPmDAf9NAXXw7mlR6nm7h+EHqYcUcW?=
 =?us-ascii?Q?LZr35Gz7kOgTMZgy5noWZoTAZYnq1Zgxrl3xdT3VufCHOvC02PVxBKof1Ooz?=
 =?us-ascii?Q?s3BBnU6nn4NZ/BA1zNW8naeKFQNoqwoKo9E1dkslCh/gwJ9FSaRIS8aNuzjk?=
 =?us-ascii?Q?e+AGCpyc5bG6dAHwGRNm/hhhBq+I0T/wF8+ouGt5qNBCkPYqo8mduA3cWnkF?=
 =?us-ascii?Q?9Mz10rf+1TkgY5IuYlIXBycJ5C24nsSrofqEQLVme3wwFXaAEdKRQIhQJWUs?=
 =?us-ascii?Q?oDwT45kxTfuhyfIIlqgL4D+5Ww8kN1R5Qc/hld2QBUaaClfb7EbrS4xqkYU2?=
 =?us-ascii?Q?ORBGQCKtr8y4l+GFHd6zgEqFfgPwTOdBI2oKicShFnCZ/CL2lsBxVbhI322E?=
 =?us-ascii?Q?WnZS9b7ZqKShfTZWLEw+hYY701byizfkO6Ba3GPuVMPqTr1gAQQ5LBzVyAUZ?=
 =?us-ascii?Q?6cgHwujDL1DAie76q/Jv82iwEylxPhLh6Wx66RUDODuHQtUGPuJDjPKKOspz?=
 =?us-ascii?Q?bwJBwdDPJrQORu+t+nNfBaaADxwfu9gGVg4akgNKzJ5dwEl50mggFTWD0gQJ?=
 =?us-ascii?Q?CIipqCi0B87FlsTcYfRGuxvGs8bOZR81uYIxUeLzK6VgG3buzVZ0SZyRA+Ac?=
 =?us-ascii?Q?a/fsJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q86zKU3j2l+sE9208QEzvhEV4I7Ea/NDnheBmpiqVvRmxSkRjec7HjRGewMciOUv33kmr56a2jCoXUlQnUygB2dhdglxVNTPhRpuQj7+y6XPNQz/5/4BQ00DL83IFJWV/ZH4e9kGH8NC1HgsC269C7euEz6/UmZntyKrOgyQ5NSjHGDLcoAFUFPNAX3fZkAyjS5RGM7XMbVziCZgdveo/eRx6ywGmNtGJMEKlFlgu59e2mQtI5d1robcvyMoKeOgQdnW0IsEXVXFsPHe5bcMV5YWV8BfrUzecZ2RIqqzJVysU7GBIAXFKiSDGeHJywpgaaXSgHQZKJFaPXQNHm/nmP/F18HoDeI7Coi99fdo+/tnIaOyXSPbqH/XGNjWVoMThcL9Dx0iZNL15XrirwCnesWddwqQoF8Yvq2CWqTmrHDs4sw4DWP6e0hBBG0ZnFv2
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:41:58.0182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adb2e0be-8d76-4550-3bef-08de6e08cb3f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB4459

The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 drivers/clk/imx/clk-pll14xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 36d0e80b55b8..84279cf9f12b 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
 
 static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
 	PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
+	PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
 	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
 	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
 	PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
-- 
2.49.0

