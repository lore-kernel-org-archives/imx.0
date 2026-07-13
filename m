Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1D388881
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942553; cv=fail; b=TkRSGU9nAE5cUULlqAxcbvqQKEVfrUmvDZVg/+V80mTmk1CMyPverOn8kY0s1ybRsWJLkvuUlIO8oonIuMI18EFp45q271bEV+TKzt9U+mOfGiCxlcLWe0JrhkkCoIltKqhsAfA2i/Ouo2xZOg2cPlWuUO/OqOL1dkAek8aGTws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942553; c=relaxed/simple;
	bh=c+X/x2mRfc/V+yC4tmF6MBjwJwTIp1ZKM0mJ8BdzmKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fq5PBOZ4LJAUMdyUT/Is1qtc7dBogiNxFhHUhPdFgwmTBELv4WombW/SLcvZReajgmbSKVuYLKr1HucLe2M4oqhU8kjVw2pRul3IfkhVoSRhzQ6N8kDLdmUKbmmZay/h8YtQBZaIK4kB1AtbWK+MPEPbgsXbredzHEiBdJd5bTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PyHQuc7k; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kwaYeDq2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PyHQuc7k";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kwaYeDq2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBBUPq2051293;
	Mon, 13 Jul 2026 06:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ISg1GkIWkVlVPq92tZmsxYsLBqdq206Kew1El1g5H
	ls=; b=PyHQuc7kyZou1ZCof7E31uSYs5ciUylydiDhDe3urQjHEJukBlB0ryCIF
	nLAKYXvXkdEtwf9lrH8g5g3OCGbwrwcLejXFVdQ8J4Y7zO8HPoIy8LDQF0MjGWwc
	NOYF3ml8bsjTUGNb1ENx+VMoBkJH4gSRDArJpG9xfykAZidGpaLGwVDNJDFXIdUL
	qRVp5yDQhDJsakJ5MNaRXOI/8de2wnaymZp3Won+lGC0yHadVqFXENrzOC/AsAuI
	Zb/XuWvFQ9tOaLAfBCRI3qqRXKHMaHY5Kugyx0fOWyL8GhZYQ6bnyhaf2O98nwXD
	ITHQkMHiNEJ4SNTM1R0COaX4FOHDA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011043.outbound.protection.outlook.com [52.101.57.43])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fcxx6g35p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:35:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmOfAdFmW84OhIjN1c/aLQj1di7KmnH8QmfB6hZ8C8u8VlC1UqZOz+eA2iz8VCMN693yVih7scoQHzzBOZmV8bnRWiY0A8QDOboxwVYUP3xmWI3jfZFrigcPno4uuEH7XxNALD302RgBBLgR09Q21JHFxkcLg1yebdp3scrmjFlnyp6hsjOWLlMDXb3+anA6dc+ppGsTjDfZErhK5NS0ro4/1HjLmxnlZBsz2IkpbtbTN/RvFcEytLyyOBAcTcAIIj9Q2qhO6riAqrmXjGKDGPGMaRVm1unHcDcOGXKWf9EFtVCL0sTO0YNSoLrwR5XHUDKmiLdXsCmiH5la93gKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISg1GkIWkVlVPq92tZmsxYsLBqdq206Kew1El1g5Hls=;
 b=dAFStQA6BjfpqanefDHkYG5I9r4hRWLSfQFu5RZ5BhTlFzYsRcFVIzrpvJloCUHPQDsE9DsvmLjsTS/SB5x4HQm5uJIq7PiZrhs7dk8DqUfZQNPxZS/1nR4GnKR2w95z8FoT+B1kPj0pDTI57PG93odsrxoo9W0A4+D3W0SEZuQcpz6pfw6LrDvusUe629aAG/lK1Ju7SpekXGqjn7sGKKBwbfGb76HzKv4M/YFYP7wd/ZmS3XYYs3XWovt7ha+KBjly2r3EzDydD0+DwMHcq8OCpqQVJ0dpLids3jn2s4MB9V+UP9pkAbGUUsaJpxJ+pSdOVOFglsXFr2l4iBf6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISg1GkIWkVlVPq92tZmsxYsLBqdq206Kew1El1g5Hls=;
 b=kwaYeDq2KIqQ2gMFwW6wberdtT2TcM7RWJQsdZhHJqwU/bf6v+G2Kk5v9EQtB0Ja3psfqwMC4TBFSkleoBd0mYT6OeF/rEYcpfvSJEZ3nYT3NcGMGrhWxyfRAnWQ9Yvnf2rMtIIwnws1X0nsokReNPsKLqDB1gWo1FVRuUVt83Q=
Received: from MW4PR02CA0012.namprd02.prod.outlook.com (2603:10b6:303:16d::35)
 by IA0PR10MB7157.namprd10.prod.outlook.com (2603:10b6:208:400::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:35:31 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::45) by MW4PR02CA0012.outlook.office365.com
 (2603:10b6:303:16d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:35:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:35:31 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:24 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:35:24 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQE1471098;
	Mon, 13 Jul 2026 06:35:17 -0500
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
Subject: [PATCH v2 06/18] arm64: dts: ti: k3-j722s-main: Add multiple channels for CSI2RX DMA
Date: Mon, 13 Jul 2026 17:04:11 +0530
Message-ID: <20260713113423.2310443-7-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|IA0PR10MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b4057c-57a7-42cb-354e-08dee0d2d891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dYBk4a9ZN3b+zxh4fcRml0kFYNZmXusrFync7smUkyB4J1czyCmIUYJ3SrSAo2hdmf1O0uu3n3yhNHn3OsQitviAU+HRr9WQ6xG52yg998SArKVhmKajNdhkY7HrMfowB3QpOZD99VXOyKJ4hAdNDmDpFA1u1IgdFmL3tNFChVU9ncDT438j0MxYIiJ7yWlwhytpB21qEyh1Hi5tI3BQbGscJwLd874WWuiIW9hTpii0HrS6JXYkITlPfg2gUfw5vZXlxZhUWD+kI0tQF1mdbVyt7WvJvsZEYK1/ap99bTWPxHEVW2lG9deRQqdqbDhT4djSS5e2s5T0rcQwSLc//Xx2kQCLaJMM3rd3Rhi2m+msJALAnGjfdjEkueUihevn2FyW82X7C8yCaf3kp3yiaeAFUomMYemUI2j0SMOKzFJKevjTOifcK7x8c135Pr5+HhYcqaQNR+j/VrrBS642Oqg/ixSFvmon0jsZTcnOX97kyDX7sfw6aRm99yWf0RZvR5UquGhVfBCzcghY7GdMncrE0hlKVeUfy98Pb/LfaZwV58TMdWil3paIZFNDuwdbuo5hQI8Qlvcsw8q8yLYkGYjXsd+kfB8yOM+FFQO3M5Y/qkzDM1LKyXQ/ueYIUFeogNkUG5sfEYcuOVbuF9LO2cuTDx3T9c8+T5EWPsTrelCugHjjVSQ8lFhLGY8kYMvo2TJiNdIoXvrQvi3TC1WNZQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JNBUUKTMGu/qxwPaLpecdruKNHjFs+7Uqr/lXHZteMwpKnzXn1QnREK7I5ctEzM/458rEapmNH7nzu5IZsyVhVPj/876Trj6QkVN+XcryR/Chwiygy2YTt8Ktoh7ml07PxgFaGIWOyBMdJoYvJSAMTmt8jJzI7GvRIKKfotEd2/lwYSWN2V75aw5IH1J/GOOE9pDXULoaIwPAcTzplIM5Ge0B7DFsK5EaYqLv1OokL0cayZSqegne6hpVUVUySkRigOUVejCJRox+OFArYQH4Ugw1O3ngNZEUv8uWuZ+YMVmZnEf/JDEXaiv/DrCz8cY7H5iv3b/o7NyWVYGInR4bMQYz8G4gxP670cBpfbtRKiQEMfECmYM5QfjYNBe0VjJTT5B9g6drOxIWtTGVbAtirJHXonP4bu1xoTgjqRnbcEX1oaJJLzFsZUCJMmmmwPq
X-Exchange-RoutingPolicyChecked:
	kHYHThQc78SuljhFvLebsYNNLfySFltxygwpHHXS1HB6bl2eo+R5teWrc9hn5AhpwJL/H2sGonG7mriiLsaw6oNXJxt4LSojFFLDUmrCjBNzMkWzDAD6sIA485AnFWy21ZjfRGSaWTI8FLt+cgXwleuph8h+Vpd/tFToUhq3t7RQQR4clsSRxR/t8FlQmvpSzXXivt/81JbooRcvFNIc45/8SOCI49QS0MQBz+QqjPJB8ROkwO++BbXpmX/KUeBXNwp1b8uj3GyOMjpa6DjTKGez+6JZRGMvvXoFqvZX0GBx/H+xfFBhEVPLsh+C+cGoM6YMNvO9OcVpLGj2Jm5miA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:31.3093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b4057c-57a7-42cb-354e-08dee0d2d891
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7157
X-Proofpoint-ORIG-GUID: aHI-9Iv8fmbnfGzX2n9LplqiPu3SnA04
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfXwWyYAyZAbRcL
 UHljbv3DhtFj2tU/GN1F4wApzZH0pM8zgmGY/SqawfYcQKeoGUZQIXUP1HXGm/pmV28pnkldZJ5
 3VXckfSqjEM02Y7TPWfSUeZFpB3Q5Os=
X-Proofpoint-GUID: aHI-9Iv8fmbnfGzX2n9LplqiPu3SnA04
X-Authority-Analysis: v=2.4 cv=S7npBosP c=1 sm=1 tr=0 ts=6a54cd88 cx=c_pps
 a=OVDEU4yRZFO0l3mlJ/t01g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=hgJp_EOl-7JfuhX-_g8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX0ATWA1M5K6kh
 +D3c7V39DRiADcpLTo1PnL0TZgsk0B40Q3u15BUnBHFbZIX3u9WnhqPEI3jN7N3+oV/3lX9Lt5H
 ohIrH2jE/PnUYRSN8RyObjy64/ajyZ0pHEce2pJ06LsFeve0CKKiDympl3RAQsBDbK+eILpYTRu
 gtv5CKtNrsZwTToutAhvPyqRbTz717hBVi47rDXuzM4km7lbEHRii8jB1vcpt8JDrwPqbpA9ZrF
 feh3sWCI6CB7IBe8FNDzYdllL8uYfeX9eqoR8TiAedJb8hZzs50BZtPZL9jGGef13WILa9x114G
 XwQaJQxsN/52Gbtf+5HXsCzphAvkXVA8EPqiagoilL44pOwREHUGLo7SXG+aGJpFSXP5828Ym8K
 Jl5gbUcwHiv+Uk7uRkqUXxsUKpDYg7HHF4NfZS28AVZM5YMA0kho5tUgdp8IpZK5yUFZiJPjNk/
 0rtSWHvulwpUK9Hg60w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts,
Add additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 5a5b9a1bfd9e..199c8652bcde 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -173,8 +173,9 @@ ti_csi2rx1: ticsi2rx@30122000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5100 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5100 0>, <&main_bcdma_csi 0 0x5101 0>,
+		       <&main_bcdma_csi 0 0x5102 0>, <&main_bcdma_csi 0 0x5103 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		power-domains = <&k3_pds 247 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -230,8 +231,9 @@ ti_csi2rx2: ticsi2rx@30142000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		power-domains = <&k3_pds 248 TI_SCI_PD_EXCLUSIVE>;
-		dmas = <&main_bcdma_csi 0 0x5200 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5200 0>, <&main_bcdma_csi 0 0x5201 0>,
+		       <&main_bcdma_csi 0 0x5202 0>, <&main_bcdma_csi 0 0x5203 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		status = "disabled";
 
 		cdns_csi2rx2: csi-bridge@30141000 {
@@ -285,8 +287,9 @@ ti_csi2rx3: ticsi2rx@30162000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5300 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5300 0>, <&main_bcdma_csi 0 0x5301 0>,
+		       <&main_bcdma_csi 0 0x5302 0>, <&main_bcdma_csi 0 0x5303 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

