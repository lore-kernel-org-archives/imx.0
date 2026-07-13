Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79893E5A2B
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942576; cv=fail; b=JdYGnXa/8uIk0hINxab5Kqeg1RDxrLPVzirmsc+6FAYtBFZkNdbSRVfYYLPXtWs75KohMWd00SkFpibKJtB3FJ18cFirp6loFU3pYtsAvFYOCXeH9aQ5QLsqgFoL5uBCRqGmqW6lvfq9wqoUsfx3GilxYEMkicsa6SWn27oTjzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942576; c=relaxed/simple;
	bh=P2LeNKLnh09Go0gFv7hiVmobf1FI5lrVK4MiLkeLvZc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOqSRCntSDh8864VUUcr7pP4LCypGUrJekjljqCdRUOzlp9DuLVl6o1m3KsFmUJUIOyNqMcJTKzXflJjWW3PozFYi7cO4wY3yud2/MxP0HnqIrBAKV6+7sN2MiIIS2I0mrmZiZT9X4Fr3izzc/x/koKWYfDWArWL6vkMao9yRbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nC5tycDW; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QPIMy8Xg; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nC5tycDW";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QPIMy8Xg"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBAeJr3381792;
	Mon, 13 Jul 2026 06:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hfsCF5m7kBDonhzlfJdxIbs5fXK0KxCr4e5vg2yFe
	xA=; b=nC5tycDWHYcSslI0ZZuEZbI9bk0U0pADZCgk1RiwF54WAi2EdZoclL+K4
	iAppsggKOovCTpc4eEUkuvGhgep2mfttQxJOBDlYbuhs2CE77ZbI/PR/oLmZeNqg
	kPd2j/GBLvYMQmIeV0TzgfvxjazdyZdh50jF+SAPK8dms653LV81iBCmnTycCZF7
	eVuG8ee52FcM0CxuRdFk05Fm3QsR2TsDiXEcd1solSWKqCtyduZ3H9dekydvDwTE
	ZYGEjIzjoMkWf985BhWWcl/th/+3qFhHRVtzzZwFb063baSTL3AOqXaLFpTiVrsF
	LDErnHbPsByosutjiZP1coZDLWyCw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012019.outbound.protection.outlook.com [40.93.195.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtg3dm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bma0BI3DfS8X0iB0dL8KjcL0B/70+PnHPTsDoYgmku4Y4hTPByikizqWlPF42X7X31ff06u3AoviivHNxudZrThlztqcEhIPgAe9FpnHk2NHrRlbv3eiB6VzW/OTddESHDf/Y68AiYrAwxFV0mA6b5TwU9wlC4Y1V7VK2lr1G0X+BvTNFJvDly3Xx38f/QbgZPOIWLUqVbzhfUL8GU9klv5b8p/NLyt2wD2cETBQ5l8I3ki7Nqr5YI4LH34fOVEkFPya2kET1sl40RzkXPej3/lIfsVe54g3S06B8aAa3EKY8W6h9+VQRi5Bt98AcrDVYqh5Hlq2vFq4DulNOPVMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfsCF5m7kBDonhzlfJdxIbs5fXK0KxCr4e5vg2yFexA=;
 b=O822a/Gbw/c2OZdzk4NJTDqJxxEGVp31O19C0rZ+g5qW77vyA5vpm9Zr0vOMyo/+LFKWIkFRgvKlUP5oRFQw34zp4Gm2e8aXyn0boKFu5R3Pu7se4T0T9NDZQ+BkiK/e+0GE5opriocNDEB3YrJleACbtYSzyOi7ieeFNdNAEHUoWllXXhebu1yQuHGK2rqieiCpWrGxaBrwzFWyZOc88OHH6E+TgqqLrR0D1pzGxqJD87/rOglzernkOGo4DCbZgiGaSs65W4zZnztZf1WuTh98vJ9EsIoiu5sqIeeF7sWpDJTXf3d50L9D+AsI5aXQZufPgmKD4d7J5wd2lZE03Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfsCF5m7kBDonhzlfJdxIbs5fXK0KxCr4e5vg2yFexA=;
 b=QPIMy8XgOpsXmX7tK3/tDsd7FLKZbGfvc+X9h0q6CESHCbj/YN2QE6JtK7upVIK6/tPSfjcyA2iIuTFK5r18WJOf/hJlgujGNvf0OZEmWNPHl+dbUrvtw8QepQpEncuxbx16t4m+pb9zR+TpL9tVtdD0d+AolwGo7xnC7DJBHbA=
Received: from MN2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:208:239::19)
 by SJ0PR10MB5670.namprd10.prod.outlook.com (2603:10b6:a03:3ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:35:59 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::2e) by MN2PR08CA0014.outlook.office365.com
 (2603:10b6:208:239::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:35:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:35:57 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:56 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:35:55 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQI1471098;
	Mon, 13 Jul 2026 06:35:49 -0500
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
Subject: [PATCH v2 10/18] arm64: dts: ti: k3-j722s-evm: Add overlay for fusion application daughter board
Date: Mon, 13 Jul 2026 17:04:15 +0530
Message-ID: <20260713113423.2310443-11-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SJ0PR10MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 81129215-5ad3-4535-8408-08dee0d2e7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|7416014|36860700016|22082099003|18002099003|3023799007|13003099007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	IKIVHTNL20rfG+W7xJp3ZasbbwGUk4UCHr9lk+A8l1Rkb339y4ryiNiOjn4FftETAcfJLK9uqNDSQgreCqhBQUGVkm24zbgkDLsFWTW4iVeNVDKtS/iLwvi/hlilb/YdgKCv8Cza2EXL+UuRM9Okse6NXi/W/W2QrvUge4qC57GbS1LWEV6OvYEfQrzpd0dWVVrmLpPfdupLa7J1lOJg5hlRqRT1orAh0NhR2i1MCLaybIcr21Y57zTkH40qjLp5GkE2569RXKttXdPq60F/zL6sphkM81kIDOR0pBLpDlolltANKuvikLrI/oBB8hkxms63W6HjMt/jhbXZxVZN1uvTHG9TPHY3RHp0WXbVV1ErG1MKSKcO64WuNjDzN010pibERgjBkdglb+murUDlijrerw9mWkUzsV86MyJVUVemoY2wX2O3bsFTqov817/dJ5hhd6CP9HsUqX/Vn43YvkOsMuON//2Yjw9et/GhY13ZU64brZI7JYsBPg78DjBeVc3NDCwHPbebFgUXSAi10DuftX2Setg6TSu/1LxUGA2PtHKBXvAYenonPUSihrMZtUoPRz+lkDSsK2DZPI8PkQYZWa8cg35U0ehUwLLHeM/F6b8el3FJD9ePkH9SQYH53Kxan+p4ed5hi5P3vZQpJQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(7416014)(36860700016)(22082099003)(18002099003)(3023799007)(13003099007)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ZZzsxqliSyyJgm5RXiMkzZgKA63rx6yKdcZl6ib96Ss6kTXVfUB00BbbEK4HQEiMy2bzAcuhtis9hw9ms30G6XQf7KSzqbhSU/GS1gxG9uoAZgwJZkq89rUpQqlnmcOxPLNtoUPpgujgHdOdlMa1tB6V5ljXHZpCBF/vHzhIzWyEdiTV4Z8QDTbbSPgmtsBPaKZt2nJGqdkw9nZu+roY2vrhSeb3fckqw3WB3pI5hKRV0Tm0cLm0g29W8Fg6DW42KsFJi5op86PQ0h7SnVQ44O+z56hN82wZQx7tjqm2q9urSMfs8tNKbv61OTVlhpY+976begj4e9aGOxxLHydbREWunywlvUX0BU7s6E/qg70nMkZ9rx386XZbNVY6VyRn2EuLlUmu9jU0oJzvQCYBpXfFN/3nIK85db7SoaqUxTy0sHsIaAYgbMBRqvGKLuh
X-Exchange-RoutingPolicyChecked:
	e4y9Dz47WU1lekHhj7jNXARR2vWsEMTZProM6Tc2phEMZGjtNuZcfactQG3OpnTwsJ4Ps0LB82UDKffC/hhJe+5GcTsY29tzNglrvxGyetFPr5UwiqK2AJQVYFslyfAnyrgW7mD5YYysFDVF76z5tfAsppA+I9Un2FklVp8ZCFFresC9j87HUSg0IiW0EL6tUKKdmW9qgkUYKhxThwQdWHCjBw7NECoVta9nA/ucDO9U/P4GGieYAqbB7ZMTK0PJHFbGdjoC5+sxKwatjzo3DF0qTmbY4R94Y5hrDu0JpXwhdOiAgIirogwdc6cSY24At6BPJiUK+1K0UOL9DxMP2A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:57.1967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81129215-5ad3-4535-8408-08dee0d2e7fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5670
X-Proofpoint-ORIG-GUID: VlH2lK9gPgl89dQ3YsxuenVYBI7G0Cmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX7hwnAHw3Ykx8
 wwEUV/MyZzBI5WeRS1DI8vv7uzWCGfYmvaJnifnZVzHofRO792U7HwjOP54s8w4p2p3k8EJltpO
 l7GGVhhPb0dP9i52kuQWSnYidxq1mk50ZAYFccMerFZnIGTvxjqLEDrLIGOowgMrFV0ZmCiHW1P
 E6xTpF/N1smaCA37JRaxHb2umWStRIayvRHRqnXpNtHXgNrHvBB6QY5h5Gf8bc0tK0M8AVjH24c
 rkNuK1UeYJzsE401SCUblTkAW/VvPak/SqsnMkGMeeDbWh66fxmbb1gJCB3Ivmi3YsAiBjpNHem
 U9zu6d8izRlt5vPkyY5xwRri6EUKrnTMmV+u0dfUR0i5xVbj1xcvNyDCalFyLy08JhBBXxiKmPO
 79/9aTqDKmGYD2K94p8Vn0TQC4eRSoK+t6pOgByu4GRUOKqat+0hmfQ0zcTrbpx/kfK1MyyuwEC
 aHYg+EV7WhskawBwWLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX1Xu52PnaO3i7
 +m6sETSDCCSrFPHSTuvnn8KoleEBkSzft4O5v9W3ycFTwNz8xxFdIfwKa3nfjunxQlCTpUYDZ0E
 /OMxHzajf8a5kRFnRTJ41gD2yWgj5Zo=
X-Proofpoint-GUID: VlH2lK9gPgl89dQ3YsxuenVYBI7G0Cmy
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a54cda5 cx=c_pps
 a=7Di9vct5tcmjM1itADynpg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8 a=TGpi6PWOAPTeldDlRC4A:9
 a=spcmYsBHvreeK_59bKkA:22
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
ports on J722S EVM.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add missing bus-type property in both csi2_phy endpoints (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h header (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-j722s-evm-fpdlink-fusion.dtso   | 196 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 804f041ba408..1d876abb0585 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -191,6 +191,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
@@ -341,6 +342,8 @@ k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-fpdlink-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
@@ -422,6 +425,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
+	k3-j722s-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
new file mode 100644
index 000000000000..3b2601443290
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J722S EVM
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
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		deser@3d {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x3d>;
+			clocks = <&clk_fusion_25M_fixed>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			ds90ub960_0_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_0_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			ds90ub960_0_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		deser@36 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x36>;
+			clocks = <&clk_fusion_25M_fixed>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			ds90ub960_1_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_1_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy1>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			ds90ub960_1_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
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

