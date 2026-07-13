Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29D3381E8F
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942505; cv=fail; b=psF29CLhFmjDnc5pj6I2F4rP1V/V+18GJ/FTKiLtnanWtof+LrqHUYVpuJBarXkkfER5fEb+4TPmpp2v5885r2lfyWuZYARiHN32wZTlgF05kmrrxr7/0b4DlfsBUFwjmdWsYueiBb5flhGVN2GyDUb0XQx0bKFQ959V6AbTq10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942505; c=relaxed/simple;
	bh=Xe7kQ96zFAfyiQCh2suaznCtN9LghlKOzCXFHnNGn14=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i0okQK0QaYu265I50FNlnaswUi7Uoj+iOCyPmICGaden6O2N+DRH86cog2Kb5OrjUd3QwHJZ+jtxBC+/PNZWLUND6MzScAGucGzFR9ay1pwLMrOxo91osx5gJmzRAAu6Z5zuyRN6KBigXejK3YwMfVBwhrRbfgeONCymBJEyAxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=G0nzLgPl; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wamzdUX+; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="G0nzLgPl";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wamzdUX+"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9MeSI3167588;
	Mon, 13 Jul 2026 06:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=YT2vQXZ4cLn79
	L0nfl1PAKPwxrpoiz8h2hXqen9njFw=; b=G0nzLgPlN4/SEuqjRqNZMwCz46M8H
	oDg9lm4x9Q1/IBPD3Zt5dV93WlvcMRdRlMnUmkVGOKYtawcowGQM0ZnOn+TRxbeB
	69bWXWJu/84nknrYtC+04mp4ig2fSMzOTU11mZOn0dTlHruoKczWaHs9/fvjPQMF
	6WzYPxgiY4njnZ60nJXGQGh0BoQ0pNTRusiPgnhzzFmNH6KdNrvGkuoSBeJ2TG14
	D+FTYpoqNHL8bJWqxr0g20q1iCrBZW2pSpNZhItXy5bpSlmllxlXxY7AMftiGNCQ
	ZUD/B9i9GnDYZl+THrzJRmyVu42+xZT5lqEC3izegN40HjvW8evTP+0gQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcwb60hs2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:34:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPOr+Xppp1nNUxJIr0kupsVeSgCKck//+4lsTO4Za+w3XdZVhPXt0qRUukHzNgHqjbhuU0+YnnBukbVFLs/oKnYl/D6jYOAiV3gdE8knn1WirROfpZzhgfInkD8Pf6/lNa82kAeon6xD1WFzst2hBsbQ0PXTwsm2d9HKlI+9NuNcfHLzVj8nFGGqffpPQIEhQVqtL4NYq1TFybcUtOYkfjRFb/YDmNMLYwCGIlG3i2nFbQa1ysCV63tu5bey+o84uPGDc9oV6GtGHGr6wKyBE96qsraq+w4z1cp1p71FEZ3rPH0DmT7Lse64JPVERvtH/kTw7htrmYtwhOpDppjxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT2vQXZ4cLn79L0nfl1PAKPwxrpoiz8h2hXqen9njFw=;
 b=C/1PWRY+mcQHq6UvfZ9FNkV34LLgX6Zf5V+GU4dQNTlGaijNdmcrBWF0kWFWz/hCy7DurStNi2RgvC0uA1MWBJJP2vKXCRzaoiQ5vuiO2iKVysIcw/S/I1ezoMuVxWCBSZiStVFelZVq/9Q5zQz2wskmxYS+m6fcZ3pKWj8zN8UJlfn+MGiQoE2atgcfRtiCPpB/5Ki+jd/xdgUSV42DoCIgaWhherR8GnP28BaEiX2XirdgbtEpvI4LhEZrc2EZXqQEMPDSZH4LFr7inOx10DHG2uSriguslkhnqCK64jaag+Uu4hUhxOH87TW1HvrS2n6wzUL6Zp3zYaav1F0PvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT2vQXZ4cLn79L0nfl1PAKPwxrpoiz8h2hXqen9njFw=;
 b=wamzdUX+yWjzjsxWecWogE6mVTd0MYDTt9dCP5Le8KQEzzcvj0El5SU0nbXsXUEpDte+PuuA18t7qq+Y4zUUmS8jb9w+3eNfJds5XeVzoa/QuuJVqGr3DXVJKz8ARUVXikW0Qg6ruygpgETSeWKPCaPvlXwk17bmU+kEVRtdwRU=
Received: from BN9PR03CA0514.namprd03.prod.outlook.com (2603:10b6:408:131::9)
 by DS0PR10MB6149.namprd10.prod.outlook.com (2603:10b6:8:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:34:42 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::67) by BN9PR03CA0514.outlook.office365.com
 (2603:10b6:408:131::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:34:40 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:34:35 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:34:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:34:35 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQ81471098;
	Mon, 13 Jul 2026 06:34:29 -0500
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
Subject: [PATCH v2 00/18] Add DT support for CSI2RX multi-stream
Date: Mon, 13 Jul 2026 17:04:05 +0530
Message-ID: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DS0PR10MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ecd018-90c9-45b7-4951-08dee0d2ba40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|13003099007|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gmefam7qI5T8ue/WZPmFuEV1BdcAnEv2/tld6EXKSi0v3x7NjU5uWGq6a+nMO4U3pq2HD+Gw3TG+oBVe20NCmv7cskcDEiqPXhc9YorXlKdKxbMMcmhPIKKyKa9L4WV7JXAzOcM4E3g2V6wngJfxK9RbKLWrsbGn42VcqNIVzVOEdgVItj8rWqDBtfqsof5ssqbh5M/Ko0FXQjij2Yb0b2nwR3o67ViL9kbz5EGDNVhg4YM1ScCss/T4iGXh51ZM4L8P2tU2OVxMC/V4tHRSgJMZ3p4Vi/qfrT/mTLrvA0b+tJ9yr2Jh/bZ2J/VceML5ig7ktjN0KbchFK6lgviD3Tfz5ekILCYSspmyhb5zuI9K7xtZpcEj8RTU8rioVUvexP0jJH+d+yqGdNpJX1G9BTSqJ5SNI5jEWwBYc2fNH64DnX1G4Q0HSvjibdSlvQpYhLdfI/THfBLYtKIyrkDTFCDWqG8bjPKT3jK2568yBAfzp4JBcVaQ5lCzDy8yRT86N/0oy7i7S3QU0NY0VfyRfP8twiS+h3daMTaBJVBOfer8INlhVeblFES8EZ/SPYTIAKkMP+1HlF3cVTIqlzuh4FBfXoA/Cf2hIkS1BbK22OibDiYFisLzLFwJAYNagVrTiE2S1cXOd18BcPEr8I7n2WFVlQ58W5DxJdvzwQeCVJMaBOaqSrZPVqyRcG1/dKgjfL/WWvvxpmhIp95YvxuhnQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(13003099007)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GZkDKk7vBrbB2czlP653twj9McMlC1L9Gj1WD3ozgB2uI9Qg4raLKyDKxPrfS/+OuB+zA8bb2CwLdouQ7cqnxSwhrYNIpSMAdAUhk9N6HO+NfBjdgYy+3zO1UiVLdQlCwoYGujtRA9z/jNjapXIXIE7CKv5JAtQSHz4AyPe+jtdAdalWSjrfhFpO9BJA5YR2vJuhCh3M3kdNd8dmAlMzoOP9fkuU7zBOuxPsqqwhgGSSYbWmuTTblglYcCfhrdK7ev+jO2CPN5+FR7a/TEsniHnXfayiy5L+s9dIxZcaDGYHYz6ie2nG2u3nix8gXh8ssDYcyMwAgiN8T6bwkj7lyNdbthnXF+w3/iQL4wTYhQhKH79efrzC4bMG3Vu5/1JEURXvmiYzNqQxyL0g0nBKbyFrRIps3RcsjsFOmn3z9YzD99fGL1wfObJb/gbb66sQ
X-Exchange-RoutingPolicyChecked:
	qh8m9/h7ANFTXTII4DBAhhp2AMvYMauUKA/4qNEA6RAxKsF/Xr7C0E69t9d5D7dIaNIpq4fNNCkZrZqg6F7hivAIH3EbstSaGLSOJcYK1Ym13+bHQS1vATzqJvN/GosZvm3n6tVu5giaGnuQYnuw0B32sZovMgQ0HV+13BiZSFkXyysglKR4/ztxTs1gKgcW/AQqej0UQNr5SRYpmQknE3+vIaHOnB0KOgbzEuiFo6jQRh73BdCjIxucgTAhtLoPQ07pl21EtVqL6BeyFnrMWqMnkAr90N1JAdKUhZ/q+yFL1tjQDkPLLaTi86Y//uc6rlaFfhwLjaiKVPAJyJ0bJQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:34:40.4628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ecd018-90c9-45b7-4951-08dee0d2ba40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6149
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMCBTYWx0ZWRfX/atxOCdLHlJw
 N2WyhtOrZ9/X6BE/au2cJROw6TvnFlEtDYdirkZYa+8BgizBy/1LuATRU++0GavUe8m1Yln0k3H
 mYEivFsRWg421q43c2ToLmAu59fBLD0=
X-Authority-Analysis: v=2.4 cv=HObz0Itv c=1 sm=1 tr=0 ts=6a54cd58 cx=c_pps
 a=77xC+Ur06DlS1dgCSNUwhA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=ahRiOtByQLOieAtbN_QA:9
X-Proofpoint-ORIG-GUID: uXJ5MvIZZd51JJqcaCtlrhJDMtLXm5rr
X-Proofpoint-GUID: uXJ5MvIZZd51JJqcaCtlrhJDMtLXm5rr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMCBTYWx0ZWRfXw9qjHnCXKYq9
 h78Gee1l1t5RzWSkGeLR+C0log8kUJwEyE7AG9/1TI0T6yQUMuYPsuSaeqindBjwPNzKfwS12Bc
 ug+Xm2Z3ae5VMOFh+OAhBx+JLqn6ohYE+EfyoM5CmHmF6prb3+v1p4Y1lLvpX0Q0HP5j10TKfo8
 CFXfjKp6gDKOJTVYPJ2wBfE6c9B7yZD8wlo44+zrMIYqAGTNFNVryC+22VKjaCZ2x9aXMaOpcff
 6l3m2p02NWAwIlmudMFx2Oa9ZETuORnmXGdgAsorgfab/g0wcdFWVhSby4Y6vtvw5bSNQIAbzn6
 FThP2EnoDyA8T82eEWELwtCFgyXWwNeIQhoWmCCjJhfE1AfMB7tJjOiai3A2ffnTdP2R6AtCSvC
 fyRbmwk2VD6GJp2KgIQcLqMH6F1gXoCTtYSiur9l4h406ZTDeV0Dq8XEVd3ouT5END0ewC5SXBZ
 b8JtjJhAKWIrTZXsZIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130120

Support for multi-stream in j721e-csi2rx.c driver was merged last cycle[0].
This series adds the corresponding device tree support.

Patch 1 is a cleanup fixing indentation in the existing CSI2RX nodes.

The next few patches i.e. (Patch 2 to Patch 6) add the additional DMA
channels required for CSI2RX multi-stream capture.

Multi-stream capture uses a SERDES pair based on the FPD-Link or
V3Link protocol. The serializer takes the input from a camera sensor
and converts it to the FPD-Link standard, while the deserializer
aggregates streams from multiple serializers and sends them over the
CSI-2 RX interface. Each CSI2RX instance therefore indirectly receives
input from multiple sensors.

The remaining patches add overlays for various deserializer boards,
and for the UB953 serializer with the IMX219 sensor. Also enabling
DS90UB960 deserializer and DS90UB953 serializer drivers in the
arm64 defconfig.

Changelog:
Changes in v2:
- Add missing bus-type property in csi2_phy endpoints in overlays (sashiko)
- Add missing build targets in Makefile for some overlays (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions in overlays (sashiko)
- Remove unused gpio.h header in overlays (sashiko)
- Don't replacing generic V3Link fusion board DTB targets instead append new build
  targets for v3link + IMX219 (sashiko) (Patch 17)
- Add status = "okay" property in port 0 of deserializer ports (sashiko) (patch 17)
- Add port-specific suffixes to avoid naming collisions (sashiko) (patch 17)
- Add reason in the commit message on why we want the DS90UB960 deserializer and DS90UB953
  serializer drivers to be enabled in defconfig (Krzysztof) (Patch 18)
- Rebase on top of linux-next (20260709)

Link to v1: https://lore.kernel.org/all/20260702093123.1048575-1-y-abhilashchandra@ti.com/

Testlogs:
J721E + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/18b5b81157fa67ab71f711f5b2cdc0a5
J721S2 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/0b8f3617ce7620961d533edfd7c51be0
J784S4 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/7791f3b224f6df34824ae418b9bd9963
AM68 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/29c1c9793939633926b1db3fe058a629

J721E + DS90UB954-Q1EVM: http://gist.github.com/Yemike-Abhilash-Chandra/6d2e1f3f0cafd0eec7eb65061ebe221a
J721S2 + DS90UB954-Q1EVM: https://gist.github.com/Yemike-Abhilash-Chandra/a145ae81e7946cdc1c600cb377d3ad44

J784S4 + J7EXPA01EVM Fusion2: https://gist.github.com/Yemike-Abhilash-Chandra/8d7f06881d5435bfa5d9bdbfb209bc38

AM68 + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/2c607145ba80e3554320042b29af9985
J722S + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/b1fc2e2e8f15372f1379afe5c23668f5

(grep for "ds90ub960" for the deserializer logs and "ds90ub953" for the serializer.
 grep for "running tests" to see the actual test pattern genertaion capture logs from
 the sensor over the SERDES)

dtbs_check: make CONFIG_OF_ALL_DTBS=y dtstree=arch/arm64/boot/dts/ti dtbs_check gives no errors

Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/CSI_MT_DT_V4

[0]: https://lore.kernel.org/all/20260520120022.539913-1-r-donadkar@ti.com/

Jianzhong Xu (1):
  arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer

Vaishnav Achath (13):
  arm64: dts: ti: k3-{j721e/j721s2}-main: Fix indentation in CSI2RX node
  arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels
    for CSI2RX DMA
  arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j722s-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter
    board
  arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter
    board
  arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application
    daughter board
  arm64: dts: ti: k3-j722s-evm: Add overlay for fusion application
    daughter board
  arm64: dts: ti: k3-am68-sk: Add overlay for dual Arducam V3link fusion
  arm64: dts: ti: k3-j722s-evm: Add overlay for dual Arducam V3link
    fusion
  arm64: dts: ti: k3-j784s4-evm: Add overlay for J7EXPA01EVM Fusion2

Yemike Abhilash Chandra (4):
  arm64: dts: ti: k3-j722s-evm: Add overlay for J7EXPA01EVM Fusion2
  arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM
  arm64: dts: ti: k3-j721e: Add overlay for DS90UB954-Q1EVM
  arm64: defconfig: Enable DS90UB960 deserializer and DS90UB953
    serializer

 arch/arm64/boot/dts/ti/Makefile               |  83 +++++
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    |   6 +-
 .../boot/dts/ti/k3-am68-sk-v3link-fusion.dtso | 200 ++++++++++++
 .../boot/dts/ti/k3-j721e-evm-fusion.dtso      | 190 +++++++++++
 .../arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso |  92 ++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  24 +-
 .../dts/ti/k3-j721e-sk-fpdlink-fusion.dtso    | 190 +++++++++++
 .../boot/dts/ti/k3-j721s2-evm-fusion.dtso     | 190 +++++++++++
 .../boot/dts/ti/k3-j721s2-evm-ub954.dtso      |  92 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  22 +-
 .../dts/ti/k3-j722s-evm-fpdlink-fusion.dtso   | 196 ++++++++++++
 .../ti/k3-j722s-evm-fpdlink-iv-fusion.dtso    | 299 ++++++++++++++++++
 .../dts/ti/k3-j722s-evm-v3link-fusion.dtso    | 213 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     |  15 +-
 .../ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso   | 282 +++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  21 +-
 .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 128 ++++++++
 arch/arm64/configs/defconfig                  |   2 +
 18 files changed, 2217 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso

-- 
2.34.1

