Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7E3E5A2B
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942554; cv=fail; b=JMXDYS6XPbprwTb1T3TiELJBAkyh0RufYYuEoqxd5d2FS2uXXiULISzoAnTYi9u2fo3ZorytUxvK+YDJYzv3w33HDOX1MwCawAIZKYxGNABEEi/F3E1wU0WHH8BQg6p1O3oSja233OIJrGi0tPbVdNwd0aU74ybniH43EDjvK3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942554; c=relaxed/simple;
	bh=5zi8h/ltScSBk366hzKB5HkACXSgFH/saT2gWsnXxFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Isokz/T18c9pPeTrATmv0X5JlD7X7w/WH02RAH+0HCtX5+spXFWALblbQikenrzKaePa0k5fxFaQRGUND7nS9FEYC7QBm94FfNqQ9B9s1SPxn/BA5zHj5CCrUC7Y4dD/f864h+bpUoj49hB4PCjexdLidBpeCBD5OV8BSvPuiYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=o6il3gIo; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fKwkiPTt; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="o6il3gIo";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fKwkiPTt"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBAiPS3382119;
	Mon, 13 Jul 2026 06:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qev3ElrSN6jr4ks+6/dm5HylQXDfVnK4RxMNHfoyT
	AM=; b=o6il3gIoPBdx4r2I7KOmhISZhJcxl7dRc1bF6XwjXkhLAbD5sI9e5oDM4
	Xc9eK+bA/xVbg+6xsPkX+iAxITX6gngagmiwShmdKbbsVGiNTw62EieWUW8rGBVP
	VYz8dYg5hmC19P2MnqFpFPahW01QrW1XF0/F6f6sIBn4Ama8gSk9YchiPdlGl/dN
	nlUskro8yDMJod0cfdLUAgNxzSIfMgotAfDLT9WpBV7hkflkk+uM6m6NFec994mJ
	uU3huLFMkqOS1d0ZsEHHal4ZcDh1wW051RmqkPtUf/WlPuZREpVorJ2JC1zCbqBR
	lHz6UaKNuR0YQOMAZqMXU052NKBfQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtg3c6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:35:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suaTp31dgeBaizAX5DzEUOPAG+LAxvGL5eO2IO6SZgFBN2MGY1Pay4+M/6yptHLBWDxLnBPQ/hKqed+09jglTwFSM1Z97k0pDZ9/CUrHTupUamNU+RcijaQJWBRlsOwNqgBD0HTrHKbadOozBQYlNJ4d1dQMJzImcPhG4XBKr19PxDrq6JYYgtG59uQS3NzuyxFg3qUTSDFsDlYSlylVRzSRVVke2e2a4X+twSq/KIFdtk+pE3fH1i4wELMu3yZRlpm4+LtO4HkAXbSWk3vcL4w+eP0HBkykdUG0mzQR/Ovvt3n/RRnAxPsD6zlrs2v+dQF1c4m29qm9MyHUDpiPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qev3ElrSN6jr4ks+6/dm5HylQXDfVnK4RxMNHfoyTAM=;
 b=Stnc52Smc/AmPLi5qWuLG2vN6IEJm47i3EW7Rk5fTnjG/VmevEhfFdg2t2gvuiNZVekaGF71kF/3Umetc9yTORFjhDZxiRrSqwgXrR4YDB+i5HTlgyGWgkVENBHYwXzANDtHUoSe3TtZmCZXYfaPIk0a1uVdIx9sEGCOtE6EkPIl26pwGHSBahEDnUZpDPNVgDSuo2wAjoZMtYJbygnNsEsPWwRWMWgyvtoLPZIv1ggUdhUaYjNpS85GBi/R0WmwnWLe+2lx8VQm+8eAbTt7xapFTNZ5E1WoUwaw6IYSO/40Mhe8B6fl1Pg/U6Dd1mrxUIM32a8v3/2qmvhLrbGSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qev3ElrSN6jr4ks+6/dm5HylQXDfVnK4RxMNHfoyTAM=;
 b=fKwkiPTtyYkh+Zo7WfVJhDT/Ff4fl3fBLLqQCfRu1CnbZ71eh+VV/xHW0PzJGxUCK+qSKJCzFj7MK5Nhi6LoS2RNMv5sgOdYVRRbyMPaN00LCxO3/jaQeOofh/7fBnaPOe2aRznhQ2p6PmPELFLpyAlFvdi0j9G4GPenSshbu4k=
Received: from BY3PR05CA0021.namprd05.prod.outlook.com (2603:10b6:a03:254::26)
 by SA3PR10MB7095.namprd10.prod.outlook.com (2603:10b6:806:31e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:35:32 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::a0) by BY3PR05CA0021.outlook.office365.com
 (2603:10b6:a03:254::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 11:35:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Mon, 13 Jul 2026 11:35:32 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:32 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:35:31 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQF1471098;
	Mon, 13 Jul 2026 06:35:25 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v2 07/18] arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter board
Date: Mon, 13 Jul 2026 17:04:12 +0530
Message-ID: <20260713113423.2310443-8-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SA3PR10MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4ba44e-d7a2-43a6-1bfe-08dee0d2d957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|13003099007|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	yfFse3xWfs78GzDTwWCf5iYiLq+Ch2w+6tAVDCnPdCAX65/ypEJkpRv1AES05aXXEY33kWX4GUYVaVhT7FrLlnGFLyYYKx0te00G5F/o72YJ/Ru6aGEGT4B1fU6GC7qvbEnLArYeNr7/66m0DSZEJo9whXnJv7ZHO3kqgYpnX1qEyZE5ByPn56NsNHD9K1X1A+/F4UX6a8VA8kvL0c7pVOQygTzQIawLk6HVugg1m2aDtmuWvtqjb5nZuIayDCxCvgxKf4aiBhwiOYGGYJLpDj29qR+UrwGY2ysdB+UeXCBbpR4dgvO1Jl+IJHGP6Cbc7fuRKDqNRIuJ2ZUOyzcfUS/D1ls2F2klfNf22ZG/6vuLIWIqJDcwnZxe1Rv7Mmi3+Epz53zhpjyTUq0ANwcepeOwYxMOipG6L8nKM8hwPWavVw1KY2y0PRpHXu5MjGf6quD1xGyCGGU9JyeNryKFSAQCa5Aa/6qeCIngZMN/8k46tT+r/o8xG4BQLhlkGwOSJYYr83QNtc0z8yzeFCar8kFxywKU+eAcx5Jpv2bG35ng48XY4FMG3fHGX6G80MPPquUx4kfX58oN0LzFBi/j+MDtmkuwazFzD/wrZO+HA0CIIQS2D26eSQx4TqO/gqZyKAka2hh15ieZDA9Air0nAA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(13003099007)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YTXIQfYiP4PoR+UQBLvxA0gos2yTy9L/CjvQGsd/0wCg0xp9GLyGgV+kiemAtfb0ErZUIVdUvShUL08biQboik2gw/4OG7RyhDptsf4WuzjqoG4bvvZ92oyXf3NK3a+kFSO2/a6xe7f3LXNncidTzv1VTvtEtkpBwylt3SgZaJX02RyYMnypKEZA22iJTTAroMPofhg4UPVesShUo6z72/6lsOLvuCNwKAW2BnGiayXR3mvrLThvhhFlZjp2tjG0F1JfgCLgP5KXr0jwnCPJVKlnagOYy73I59XLQwSuQm+mLyN5n9N0ZmFyOiyz5g4YnTNckmYwxrYk/G0KLm9aiwHuzrGsGP9bSsvK9rJQhBJ95nflVuA/Zub8EI2r91yT8Gc0IstTUYr99zxGlDV5r/+rr3LeV2w2Gku+xBG4EG1+qniogEKUBgOl8EVeXeEI
X-Exchange-RoutingPolicyChecked:
	TizhWGY8EjmMW4+uHEUkaqkW/XgFVGNmk3JbngJ/Cv6l6HvswdA1+6nyXknjf2RF27+thGDNLGhHzNmrmvWA8gC6eZIJ3mA2Md0tUOADFyT9oGimXVMzWqglXulu4/4MKlnxAEFtR/PECFtSoEd+7j22G9CRjIMlhlz0L9Lso/ZI/26H1OuKw/yzLQbKcnlhZQAXGEZyyFaI2JZS01KiiM2eICG8nTYnBdFIQrOhVnwbnqOJzyyPlw7yha1Y1Odzcm5EtaZftOxqRVs51lcQ9FVHoOEb6ShmF037cScuQB+6WqmD8up6wKEGyptZr3afN7mz/Uc73a+1UTPfqH3iTw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:32.6056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4ba44e-d7a2-43a6-1bfe-08dee0d2d957
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7095
X-Proofpoint-ORIG-GUID: PHzrz_gFWnX2JbNsJcPNf5hpuZEZxE6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX1igg0Fq9ZLgT
 sB8z3yZEWpX7roU2QUMxQKwIy+4oYcDVxjpXSeF+E1y3ZV+Dggndnn7J2ahB0+QTbZldZniKGs/
 BHQ7ZXmpddD7EDxIdltB6lExp59iZHNwFzNdJlGX8bag+87tnS5NvedlYAKIOhVUex2IlRYFIrx
 Dj+2qOcH8xlI6lprICtpEZsw3AxqAL22OUScY71Ay0l3w23DGrxnZ/6pPDTdnpUfzENn8zdhCIx
 GEMGG8e16ScVhnGhMcMy3MuVTk2m62NMbMu5muiiEdU4MEJwuFbxG8tfZzommRZZexCnV9FP0oY
 CLEzWhNIuQnxSKAGQAqwEw7pX0wreUHxUjjmA74JFw/9hpHOmX+yaju3VNqtmLWky3ZA9xtaPmL
 R0FqrkCR8+bmHdg0Y1Camjqrfoop7m3Ud6njFUO4nogtXx7aYWWRfriykwNybVP23HtuVRhmC4L
 2nv8LDZspf7tsTI5lxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX2tUnkkxgqN4b
 IXIz8CH5Yqdxp8B0PDPe3AHoWCVjHTlpH90qGARWPDBUMXl5eHIk0Fg3IdJrsnxQh6J4BYABKFu
 rPmusUnrRdWwipupT53/plbHgQuUlJM=
X-Proofpoint-GUID: PHzrz_gFWnX2JbNsJcPNf5hpuZEZxE6p
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a54cd8b cx=c_pps
 a=E0F994Awt23I4DNeuEdoUA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8
 a=-YxOWtE20_IEF9aCIYUA:9 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721E.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add missing bus-type property in csi2_phy0 endpoint for cdns_csi2rx0 (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h header (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721e-evm-fusion.dtso      | 190 ++++++++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..350a8b5ad275 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -159,6 +159,7 @@ k3-j721e-evm-gesi-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-gesi-exp-b
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
@@ -314,6 +315,8 @@ k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-common-proc-board-infotainment.dtbo
+k3-j721e-evm-fpdlink-fusion-dtbs := k3-j721e-evm.dtb \
+	k3-j721e-evm-fusion.dtbo
 k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie0-ep.dtbo
 k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
@@ -393,6 +396,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
+	k3-j721e-evm-fpdlink-fusion.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
new file mode 100644
index 000000000000..c9d8d8718891
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721E EVM
+ * https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk_fusion_25M_fixed: fixed-clock-25M {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+
+&main_i2c6 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_0_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@36 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x36>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_1_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy0: endpoint {
+				remote-endpoint = <&ds90ub960_0_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy1: endpoint {
+				remote-endpoint = <&ds90ub960_1_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
-- 
2.34.1

