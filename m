Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD936C0AB
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336532; cv=fail; b=aNDacezyFfxo3xVrqn+6wyUMYBosxoCatmNU8kMwGeN8jLnzkHqLK1AlvEpUN6KixQUCZL0/VkE/iNPaD6VPZOvMxS1QrO67kmsPppgFPJQLdspVMeez45Ok2gmiuBxiI+/UKxvSLtO1H4C5+JoFScwPdNpgg4bOJ71hlKnYkEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336532; c=relaxed/simple;
	bh=MYQ6uZ/TjWD2Wz260KBvWi8Uq5/n3V1Hpicp2zr3BZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ubAEXiXvf5+ZmMecXbY9uGUWpF4UkhgeDOx//QS6wQVQxIDFFzO3Ocg5ZAb81WC46u5SRWEKPL53jSBlJEo/+u8lJ6B+Ax05b+50pFv8BSkvlEkN8x8WJI3A6i4E4b8fVNx1gxTMyCKm4zMgOT8DrXWpI5dtS1j9U0QHVlXkMC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=KHHV64Iq; arc=fail smtp.client-ip=40.107.208.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="KHHV64Iq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZWUF3U71QsCT8vLnF8Ax8c0Ms6PmI/C0g2INHYPR++ss8aMRfGdxxwz4h4K6+MthJjfeEiq2LdIGrrsGYzvDU1aUsk0CrleJuTW1f7ugNyVQ8d2WCiOCkkdGToGNC4JZvacClC1YOT3cd544JMjjDGQQV/bjxQrM1hLt5GsfdIUXYLlVHxdfoK5DeioJDXFHhe4vmCw0ELmBGKQzIKY+0uMaCY2hCzJNCcu6RYRKiNQEk1ffuG/EZ+oozfpae7kSyJCBnH1PuS5tCgvGpId5wRWyYX3KutH0AHjLFqTW5oIOCxOvParP0vPWpwNF20EpNty29DF+08xdBaeQvRwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A++JfBe8vXG4S/9R2JRv4Dun9P+yhFOqjiFmM7cf2o=;
 b=VwOE+aOJWPKl/ZGoP/sHbOV4W0ArbtnRPAvZqkfhj3NPXfoZAKJoDkgdtENWZhsf3T7C5rhL8zsuAb9qYwflqB20EIeCTblUuCY6X8AWQBUUdlbH2VLShWkSCxo1eNY8fuBKTJ6Dm3/9YsLg4upunFk0vjG1LAB4VCSWnMTsQmQTnXGjk12tFmwgj0ZnEJNqPJOp9SylZB56QNQHhb/xHv6EYWocH3eUbIF8h4B7H9qZvvxONht8/7YDQ0YQAYWQ0Psh73cl8Of0BBAV3dzrs9e4gqy/ht34cBoC8aLrwlRzax0Cy2+n3W+EESrbq+jh+fhnd2I3YWvKASgMOhRupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A++JfBe8vXG4S/9R2JRv4Dun9P+yhFOqjiFmM7cf2o=;
 b=KHHV64IqX9PHLGn27NEi+6hgtirRM2tFpLeH6J1uIUQnQnOnv75/EvjKMHUTu11zBt6hAFkLmLBDtPsAtWET41Jjpqgbh0mUgvue5iGTrTr8Cfm+OheHELgAztqhpPt3Z1ruX2f0dVDEczGRxuhV1LeTGkgORPxzOB7W22SCpBKDAHZm996CyoTBf6uDrsQRGXFSU1E+tDYrL4UGksH4HuaXNkbOO9BW/f+G4UzHKY7WEnxFBdLVxFimBMrw7fkT8hHNvwRDVL1zKXJ2vUyvGfi6KOj8tXIhOSkAUY/8kLCBeDaSp7v3MoMyCjxxtRLXyRB/uz9qejeYKBS/k8YTfQ==
Received: from SJ0PR13CA0067.namprd13.prod.outlook.com (2603:10b6:a03:2c4::12)
 by SJ0PR22MB3065.namprd22.prod.outlook.com (2603:10b6:a03:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:55:29 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::91) by SJ0PR13CA0067.outlook.office365.com
 (2603:10b6:a03:2c4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:28 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 90085E8F41;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/5] ARM: dts: imx: {bx50v3,b850v3}: Update device trees
Date: Tue, 17 Feb 2026 15:55:15 +0200
Message-ID: <20260217135521.65742-1-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SJ0PR22MB3065:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c024c802-18cb-4810-16fd-08de6e2c3559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/rKf753TPAlBEX9f+cy4O/YERG2H/25l/ogFhIAI4p+bEQO5l9ugqMPcVwTN?=
 =?us-ascii?Q?jz9T37PZB8TPWQzNwYDwYUw6fd+OMFNJCrcIYxU7rE0TsR/EpJOw3L4QFNC0?=
 =?us-ascii?Q?sr4AZr9CqFXSKKjYy/ssIKny5JP+q7vSUMPh+yEiwxHpH2Q4JguJlfu0YQ+c?=
 =?us-ascii?Q?S0WOdh18Z1ZUuAWHQl1euuo6Uxwm+kaM6UHemwomf+A+iz/tSYMTrgNuZ4cN?=
 =?us-ascii?Q?zHXKX296Yny8MVpNm74C0+VYj95mvB0v9Cm7TGYZlV8V2IFUf7kBO5WznWd1?=
 =?us-ascii?Q?Ehqa33uI89DY+Qw8xN4enAlNmovjUp99/VtF8zdrLno+EKPNoedZf1+rtq3/?=
 =?us-ascii?Q?H2ZoCzqwP96+ZhiPmTF86XXejijfqpSntRE+Oa1LqLMidtomu183dggae7Kt?=
 =?us-ascii?Q?qkP6RO1Vl14ubqaKe8Mdd8aJT4MTMFPEFJOmvI64JzpifQVsULDA2yH+tPnW?=
 =?us-ascii?Q?TmaNp3f5Xmn1iBus4TLZ4MKedbIFohzzSRJ/JjSBp9PG2VM8QRq4tRWB35Sg?=
 =?us-ascii?Q?wg43zfvHzNoN9I1ipLwKWui4aHltbcp2yO8buAZ/RJaCe4uL39g0I0b8+RZE?=
 =?us-ascii?Q?1MDkZiCl7QIvck68IGq3mBwXtLHeHjqJAJaltdLRe8cqVWN6KfnZIKaff8l/?=
 =?us-ascii?Q?XevyQgHYwW3qLyKqc4ZH0GJ0ec6nqBgwZ8lbRRSSYM9TYsEjJRzfngPsIKk1?=
 =?us-ascii?Q?CAkFNQRh8b48SrdA2He6IWBSsdiHmA3dF9n59eI7CZLuYwkndD04xzgJxgJq?=
 =?us-ascii?Q?T/N0fMQv5BeY6rm9D/TblLZ7rqNqnJk+8WWwAtwhIyjtbSjLl/NFStRhOuEn?=
 =?us-ascii?Q?Dq9QnIrAUD8XR5rREii1kpEBVzmO2NwQVChhpMddEcYJ01AXPQvanRA21HyD?=
 =?us-ascii?Q?hajmThouPYomOCAdJeKYcn0KU3XtHoZf60s2JrVKd1TRIlKemcLrFZcGEBxn?=
 =?us-ascii?Q?q2t/Tk0awFJnR8OKoEhn4XtMq9zSBFgpfeI14IPsd01MbuggDKDbY8qiyfnv?=
 =?us-ascii?Q?JIcs7mI3JUCzgXEPCWAiBnnKwI4PoFb+nB1UqFjJv6+h49xSi3e4cIjQ4wcl?=
 =?us-ascii?Q?PCmyr4UlIIXyz/IguEnkZoAQFc2YvU906HxOLq0eUf11xafMt9tVyb3RymEr?=
 =?us-ascii?Q?KJA0rgT1Fe/zMkOilYxDgjRjGe/FvgYYbQHT6ehu/z/LpZyIoELtXUbamD2Q?=
 =?us-ascii?Q?LTBjnq9jMpSH8nJsDitCX4bNrjH9ih4yt0WsvThH9rWOrmad4wnWNDfjrZYu?=
 =?us-ascii?Q?oRd3zZMjNKWSkEcUPmrLlgQiOlXkV/n+fpWve+lvL1UyIBBNQKcaQFrmDMFP?=
 =?us-ascii?Q?57CuJNBC3VP7baGVR5109U7cPQAyosALk6rfq1DOnFBssDHJIO1e8AwO8jew?=
 =?us-ascii?Q?NOWVvaB1+mXGyGeDZ+lUXOo6b/eWwdL0QeDOuKTxkQIO/G5mEc1pTB4srKxh?=
 =?us-ascii?Q?xb7pVd3GlOupXXXnc8E87o3edozf5eVun5AUv3srZM53xZcC/bTPk/niGeir?=
 =?us-ascii?Q?PT6c/2pIZtxcz/EoA3Vcgm0hBXG969utWqUHp/0N72AT7bSER01X4fq7grM7?=
 =?us-ascii?Q?DyFsUQn3dBzjZ07Qk3Lf6jS3IR09lhT84kW6Rwo0Moth0rEjW61r4X1u+8XP?=
 =?us-ascii?Q?rzTLwiunej5W5e4NbDmn15DeJSbKo13/p7ehsAomAs7gevlzzcnpD6wTaCzh?=
 =?us-ascii?Q?nghKMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lP9zyRP1I2gztLQM5CyawQwK3SFeC9OHUqhKrLSc+OMxPoDqWp7372KbFrMOjuwpeZ7TJKvUjw31DSSCdlVpG4UT0DS2DqUMc4saxzkxVnCxmE5Jhi4r7hG509vnzF9m+dbBakTZtXnj2nK3hSIFcQwjhZTRpQQjf1ki76H4jxSQJTM17Au2PAD4e+V4alib8W6xuKlMCxOOyjE5njmYkuZavndI/GmSz6Ymhdwh2jFU9k+O+V6g/YZSilyG0c3WDZ+xbGlkqJMwgS/kPkefcKlupx/iYLkUIujROrOGtkG0O1Sv2koqCTFU9WlqeXrZ+xVE9iybxOdMRAQeT9UHf1WrHiwRlwxuHaU3T8WGE4H+PYgBTXhFHVWjkKnDJ41CGU1SdMEUgjXuLGDGVU9lOpQB7s94tD3pLMb6Q/6aphJZwYypHFXlvtuy3tnpzHQ2
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:28.3407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c024c802-18cb-4810-16fd-08de6e2c3559
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB3065

Configure PHY speed and mode.
Configure b850v3 gpio4 line name.
Disable b850v3 usdhc4 interface.

Changes since v1:
- Clarify the exact warning message in patch 2
- Add patch 3 to order reference modififcations correctly
- Correct the ordering of reference modification in patch 4

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
Ian Ray (5):
  ARM: dts: imx: bx50v3: Configure switch PHY max-speed
  ARM: dts: imx: bx50v3: Configure phy-mode
  ARM: dts: imx: b850v3: Use alphabetical sorting
  ARM: dts: imx: b850v3: Define GPIO line names
  ARM: dts: imx: b850v3: Disable usdhc4

 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts  | 53 ++++++++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi |  4 ++
 4 files changed, 41 insertions(+), 18 deletions(-)

-- 
2.49.0

