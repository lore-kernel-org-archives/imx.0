Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E03EA957
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942584; cv=fail; b=X+1vPJ2WkFx5lHOuS58I8O0AXTNWzYF4bLm+7sPZJ4IoGaT8QiAsJ7BLK+xY5tJxq8CQtRaxSVFl7UAdqpExIFIFeFjdk1c0pkzxlT19J78ANxz7geG3SvzlfefhrqrgTabuna+U+ZpPXsgcSX0x8ogenbFGukLvLgQVlUosVks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942584; c=relaxed/simple;
	bh=FnqXYVhYOYm7GhF1YM7m+xhSJlbddzS3ChzYGFeIZjc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3B6wfqTehrvavHLsmVvX6uHHUclbvojgraILgjbMwGVhC4xLO/Hlf1vkkt6NiRNEE1zRCGXrlxhDW306i+HWPyHMddkiLrx3dr/X8cQ3eXmNLDSYbqaJCVXZE5AAny70OpUAK8D0ohLL7SCEKIBfqwi7X+kvTRCoOlQkppe4F4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iWcB2i6C; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dQevLtKV; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iWcB2i6C";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dQevLtKV"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBBWPP2051401;
	Mon, 13 Jul 2026 06:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IFA0vWD7aS7vUQGxbd+0pooGF4Niu4prZ8gsJhC8J
	l0=; b=iWcB2i6CVQRUdmMiDSh7m+fz3Zfdzj0edxTqokGVEHCX8B1VfyVil6+OG
	cYU2oN5KQOHFtf7xi/JHRxxkxkSrH6PrIDG4kaBr5dChyhWfNhlKGw1xUnVInGsT
	CizGtJxeoxeBYNFmQatayOZAnqdktDd3Bg5THSdXanxLs/yRgsGHx7zWcrNvlunG
	r9XyMLins497NXtih/xNEoWwmmwUea1boSq8b5aciunNPpJuAYUNWaM+3jaELaEA
	iHohBzm7+6RVQHgMdxNgTcdDxmcoj7pDLAX3dO8HWrMHrnL7i3ZB5ykXOrUWpzPZ
	+4btBGOuE6TBQnrbCKAux6xFuOvqA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fcxx6g38p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHvd2G21CXfmGBvs1FLz0BTZU5k+fAOC4i1TJ0g/Vo5zrbE/CcxNFcLNjBbpcrltPCt6ZZ9pGg/n51rQNg4M4BF187pMPO0NsBKRgEV9VK2vcGklPYWbHHzqE2Fxm2SHtgRNtOkw2V4Iti+cPtKEg0kgD2QBXl3oqBiRO6qr/hwyydXH4OOI0TRaizqXIRKyKgnj1uBa/aBEQNSMP3ogIggD2egDRgFRjbyUFcVjpl7ivH3STfM/4jDt1YOihaRW8FyAWX6qr8/QVYLNld/ID5PlQXbwJMWisPjCcBTWrCfHXD5Vfs5Bqhhg6DMATI+N+7J7aO0ayvIu06A750GvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFA0vWD7aS7vUQGxbd+0pooGF4Niu4prZ8gsJhC8Jl0=;
 b=SQuMHwqk7FhuQ6erBL2G1og0bgmbBGziv1HhvBPOPofZKajTCWuiR2Pcvxl1DdV8RMygL21LUKEZBHJm7Bp3QJmTJzqkYKmI7VJLwvhn61GEV3Brq5WuwqPO7xzDMsd4SWnUVokydQCKCDHvvCXpC+aYVYvmwBsriocKNZvfJdfUytcdnipmk6qu9SkTTWHWJzC6cRAmDl6hLOLaDPYakVnyP9afwVL3MNNLd5GYg8PG9i7c4WT12DSOVxR8RABedPEScZ80jfmr2GpNSHcBkARl6zwESAt65XMisvv4oonTlhb2XUBlzUJ61U7jTzKqF1ueMkiaLArBOhDUaPrqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFA0vWD7aS7vUQGxbd+0pooGF4Niu4prZ8gsJhC8Jl0=;
 b=dQevLtKVxtQUKXRhjkMzTYVi0Acb5XQkqN9t1IZLC2xbT5L2xeRxpqDebJ3d0d8AZ0R7N2B9cJl89P6JUbpFdIJpIeZ4u+No9iBjw7OTMtEFJVxrJBo5IUIKxMZZ7+y0/zt8Nup/b+KHPuENsaPHFa5S84rcItE9X/lN4rGhHWw=
Received: from MN0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:208:52f::12)
 by MN7PR10MB510955.namprd10.prod.outlook.com (2603:10b6:208:5f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:36:06 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::2b) by MN0PR03CA0005.outlook.office365.com
 (2603:10b6:208:52f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:36:05 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:04 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:36:04 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQJ1471098;
	Mon, 13 Jul 2026 06:35:57 -0500
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
Subject: [PATCH v2 11/18] arm64: dts: ti: k3-am68-sk: Add overlay for dual Arducam V3link fusion
Date: Mon, 13 Jul 2026 17:04:16 +0530
Message-ID: <20260713113423.2310443-12-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|MN7PR10MB510955:EE_
X-MS-Office365-Filtering-Correlation-Id: 47fcb90e-1b61-4ccf-737e-08dee0d2ecaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|7416014|22082099003|18002099003|13003099007|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	DwbctplyeRZDo7n25tBwsz0WdfvD3k6Ar6tdJ7BokGpveAdO9ZjZvtYumx2U4g88VWUxUOIq2wo0Q/5h64NP758EcCjCXxhoB/IwYAd2ItdFGyp0dPU07GsB5WbQmsgSEaF6kaicHJCpUDXsaa+fyhCEswoOCvzgH6dOisQPt4Z6f6OYxLjzQ6QtOFUtEBIEv95U5tTRcA6fy3uH1ps2L7FRP3FAbOQ1D3+M6ZbkU1dtrIhJD8wzQPIkZKYHUq8e3B7H57pTqZX7NBo/kvKEQI04uNm7vfcbBYmE1vZw+/NFyB8cCOpm4iCYcwWon24t36emsQom4d6SgdU0/cdgaO0B2GIgrpIPWEscBwTcWeoISuMlgWSjCWxnsa7wt65usXdycOlZxojoluINXlOKvnui0xuwrow/f7E8txPb5NwNvATCNjFLZqn6ofMjC6/lePz9Z5/5/GE0+6cK9NmQ4fXhScMZzb8mY4ZK4LigIL7iJBgeXMUUK3aiVxx5t9pKWqe8HQhkqGhh0wMnfLGfDuz7H4Bas/iF0fA8tTUT0IeQvCX1pYbkJQuU2KKR2fwTOHJcO1ytFe/NhC6Q2niDJTmdImWIeXnqZLU0LO3XCqS2Ka7RLet484KUYKnrzfKsjqXmGTOrfPI8V7RnxsqpJw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(7416014)(22082099003)(18002099003)(13003099007)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oDz+yz391vQQPHQQJqfxAYChqYhilqnZ7biQ9xwXLfInVA3K/US964HY3Ixph3CXQ8omc0eST5K35MqXFGhyRrovnQkA+EhQj+H9YxEm4JOHzz3pSr2ZwO8aZA6xw9G1rHRPeHmJIkdNgrAso8OJWjfVWnCo4KqyOOWD2uGyV8Z/fcIGdAx5PgSPnhoPXd/S0sgudZNkm16sBoIj5ND3X5SW4mv+EiuHOH4ug29B6XeqRv0An8C0D40yfL6OpR+l4WwYplQCfryJq88BYfQA2RrnjhbOI7idSY2LcEnl4m3/hw92BeKnPLiKjhqYqvRvUTaiwxrufABSqxf6nxUj7pl9P7gEER519LZxvqKLsrxriZqj2HVTMofUosCDsXc7HnfJ8eRBufwKN6xFdGoVbMHIc2KRaKaXfpd4UFqxzi7C+VE/z6n+SFpd1TDZhQ/r
X-Exchange-RoutingPolicyChecked:
	mO9JMWm2o0vT7fu+GkDYcSRuFPmapz6BiI6DOmN5bjX9/8fY4SN2QdZ2v/qgcXtw72/oa0Hgz3j4W7WiNVGWzimtSOnEeAiqcagengAiyirStPQ251mhuAGzfxzwpZrl96N3Ds7ZQqc2lThzM/bL5LM3ViIYaSS/6OWNtbVNLsuFcXKBsrHoGmQ1y71xMGQg9lsifDmGhuMmkR6C2PJqulxlsEjI8swSSKrD7Jwpsa3VhcA6q3N2U8ZY0y7jFsLbLeyVTWd0v6zsCu7T3rJmKl3rXBFLd2k8bMXml+XqRyJhoTTofA+tuIh+d4/B7LUVSafWHjMi9JkVge6mOlLoXQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:36:05.0612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fcb90e-1b61-4ccf-737e-08dee0d2ecaf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB510955
X-Proofpoint-ORIG-GUID: xIZ9JwyxQAFw-ojNLJqtNr7YyKGaK_vo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX/AhHt8g6tC8R
 9N0pcSwXFtFsk9y9RzUuGS2e2VFNXTt7kXo+hGUR9qd8q1auEyBWO8giqPY5/0Y4mgrGVzmfYSn
 +eYOF0GCp97LtzOIl7o2Nvf+ST65PQ4=
X-Proofpoint-GUID: xIZ9JwyxQAFw-ojNLJqtNr7YyKGaK_vo
X-Authority-Analysis: v=2.4 cv=S7npBosP c=1 sm=1 tr=0 ts=6a54cda9 cx=c_pps
 a=KmUIp0grITFNz0c0ipdWMg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8 a=Me3zt4t8hVSPujjKYl0A:9
 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX15328EM8C91E
 mHNrVbTqjubE5HZqmsLRydRF99PQuD0gyEG5BY82OcgYzTyryWp6o0+gkDCs//m42Qa7oz6l/cw
 bvjgwuiNLaaYzi9gdz4zqkzPfNN3uN7W4Q2pf4wn3PTvlQ+7t8G6fhPZWJCji/JYeAZc4Yo+2wi
 2fj7SFvS5tmQgr3f2x9WIZPBwsW9g+m7jgmiUtpCPaQdsBiGDJFHiHEqCdxqkjX3rJUK/Ww5QLs
 56KcXifZ6pS3o3umuffvf8ojyF9yph1iSlbbSXyKYEfBkFplthgi5VVi67w69pxLmTfrB3c94rN
 grsJGJABlTNmKdHaGBEcFuK6GFwtNIYV8R8VP3Y8eSWU523bZVa8dFHgcqXL3KFht1/WCzHX4G/
 USl3LY1TXwD1CGvt0hdh4M1IMEPwMGYhq6bZ9q8hXyBNEATCCOdwM4WpVtd7zWTxyrK65mpQnT9
 UbFtVXigb6ed2gOx57g==
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

Arducam's V3Link mini fusion board [1] has a single DS90UB960
deserializer which can aggregate input from up to 4x V3Link (and
FPD-Link III) based cameras over a single 22-pin FFC (4-lane) CSI-2
connector. Add an overlay supporting two such boards, each connected to
one of the two CSI RX inputs on AM68-SK.

The same overlay can be reused on AM69-SK and J721E-SK.

[1] https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.pdf

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h and pinctrl.h headers (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../boot/dts/ti/k3-am68-sk-v3link-fusion.dtso | 200 ++++++++++++++++++
 2 files changed, 210 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 1d876abb0585..fdd94cb7667e 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -178,6 +178,7 @@ k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
         k3-am68-phyboard-izar-peb-av-15.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-v3link-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
@@ -312,12 +313,16 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
 k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
+k3-am68-sk-v3link-fusion-dtbs := k3-am68-sk-base-board.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
+k3-am69-sk-v3link-fusion-dtbs := k3-am69-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
@@ -332,6 +337,8 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
+k3-j721e-sk-v3link-fusion-dtbs := k3-j721e-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -410,9 +417,11 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am68-sk-fpdlink-fusion.dtb \
+	k3-am68-sk-v3link-fusion.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
+	k3-am69-sk-v3link-fusion.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
@@ -420,6 +429,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
+	k3-j721e-sk-v3link-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso b/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
new file mode 100644
index 000000000000..b293deede638
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Arducam V3Link UC-A09 board
+ * https://www.arducam.com/fpd-link-3-cameras/
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
+&csi_mux {
+	idle-state = <1>;
+};
+
+&cam0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@30 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x30>;
+
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25M_fixed>;
+
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
+};
+
+&cam1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@30 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x30>;
+
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25M_fixed>;
+
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
+				reg= <1>;
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
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
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
+				bus-type = <4>; /* CSI2 DPHY. */
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

