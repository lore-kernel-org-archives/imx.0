Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75493E8C65
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942618; cv=fail; b=uFNPE08gijg0as7XILNPrZHazp9xYD7Gyhoa0E8WOwr9UvlwjpWz9s3VIGdf8mllrVD/OoYYiNfBwtmu97msp5AFU+yHcFj15NYZ6+Y7XMOMnvF4eU8CdWz6brkE3xAviSQkplmLYLIHPcWURtAOEVtbmUUNWi4SA3HG4N+sdVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942618; c=relaxed/simple;
	bh=pzDOSqPeR+qH0rkiYSy+n7lNfevqDNBEUwpwQyHIvGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbErJJSTXeqzXLeJ6h7nSiq0oRxInO7J1vL8Xnwdyfm+lvU02fMqv01603iutkt1vWJz3sKXIU5xrF8MRsvRp655WMGcrZEn1owehqL0mLg8A0XxF/3eUkQ3TtBnokx/Bh8GnDPG0vO0kFyoq1WcyuJDhvQDJZ6wLThePcHUkIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CzWzs4tO; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DILVEbJz; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CzWzs4tO";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DILVEbJz"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9Mdvi3167492;
	Mon, 13 Jul 2026 06:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ag/J32kSez1hqpOlwu6T+Vrf57QGllQY4AyyuHoiP
	HI=; b=CzWzs4tObvSbrGfqBkVijAUV+BqENGixUpGaonqHicB8YtNwnFcUGiEaR
	u0Hk5GRtYIrhBQtVWUM7+kmo5yd9T1L9fH5RK2I0Y4cnT1COI2i3b4hOBTObdefT
	yrhRWIHsuzJIj+RtPgTZl3GfJSSGHDp4KgTpr1OaYdKZVqdDJGVB6S2YTSpECoRL
	t4Rtuk2I7vRRjQuBk8g4oyEI4xUgPWGsAp7UfB1m9YdpGUmYI75OprXTE3N23xbT
	vf3SWqPYqHLfxPzwFPiOCGujS3HaXmf9lhoWa3x/Z2g5VbjrLHYKLf9nrcmS/7hg
	PRkGFKCtubv7c0Zggqamh2nRYZ4jw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcwb60j0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaWT2m/X9XzAi7FfjjTHQOUS4BeCkqPh3d66R6A//biVl5dh8ppxijFhCdKJckH8rw4gUins4Dx2EG/TqxhOydf6EefxiZe1HxIw0RyoIb6/V2JG6gh/NzV/eYK4dtoSktE6G5fs4+SwSFJ4fJii2+yQB029t1yomwHogh0AZEqxlpjsv6FbETdyaq+gYbyU3lmZylD6FNNYjOdNwdBYVmY7gvkn3OE86rZH+pT7mGY4CfDsrylDZYuvZG9GVz1bDcU+ILY6vc5QXrfKVgYo4mOrl+lMCvQGGUpc6ks3F9ANbjEFnUOjk/X2FfxX3YTSSaZK26gZ5U8lR98hwciUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag/J32kSez1hqpOlwu6T+Vrf57QGllQY4AyyuHoiPHI=;
 b=OWNLl4m9p7wF1/DFSKIaic0rX7J3n3b2ffRx+TWEsDKtgZmgs9UiWOFSIH3mCSei/LLlX6TcFD1DB+L4512cVyBtAogWATGDgLkV/usXmPt1LOR2u5ASsJvDOOaztqOY9NplOoCJYiM9a8GhdFvNlmLWU1AY+7+hnQaij0M0LNHSAxYhvo4BAFTcimxOMKB2ifnak/uuxozkeIM+YXb0j1sfCww9Dc1ca1u1Ue8oeSH+RfieCRK93bkq/DLsgyrt9YYJ8xUn2UlP/VUYsAZPwNgw3fECPeeqfEvEG4zjBfbghluMQbXhseri+OsbF0Zgre3GeN7FQJcRdCAIdejCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag/J32kSez1hqpOlwu6T+Vrf57QGllQY4AyyuHoiPHI=;
 b=DILVEbJz4XKpLOwRqVtK1YQmbx2oNDSeAqG/YJ+zOLXuy4ulORgX4uHgzeTjqDlsSj65LnoUn/bMY6tudNtzYTbF+5vy1eH78EXcSezfYbhdQYl246h2v+KJSvD6Vh9YFqXx+ulnprXTzv+B154/5Xr9g6kDHO03lKW9yNDwUj0=
Received: from MW4PR02CA0030.namprd02.prod.outlook.com (2603:10b6:303:16d::18)
 by DM4PR10MB6087.namprd10.prod.outlook.com (2603:10b6:8:bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:36:39 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::4a) by MW4PR02CA0030.outlook.office365.com
 (2603:10b6:303:16d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:36:38 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:38 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:36:38 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQN1471098;
	Mon, 13 Jul 2026 06:36:31 -0500
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
Subject: [PATCH v2 15/18] arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM
Date: Mon, 13 Jul 2026 17:04:20 +0530
Message-ID: <20260713113423.2310443-16-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DM4PR10MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: c179b064-65d9-44da-9174-08dee0d300dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|13003099007|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	qvdIAvjq5Q5O0SEkAEVZqyxQowMJSHysRVTSXHcIzS1lI9BEQHUMtPWLmCVMYxa9MgLGdbsugjKImfiJjhqsK94qVhliA8cO6ZdEvc2Ijm8UqCK3OUlNZ+19muVtNe5ZohelbSgX+SPnJHvnt1koGC0TVcTjVMMiksfGMgT57kSOi1cL3fENHJko7roUusMmeTBkvvcFyJ5pUPR0OF0b6u2SLUQqkH0XEaPStLcJiPzK+7M9t8tnKQV1T9arhjtdEH14/lKHIzAmVoRaJN5pGVrkArLp+pkZVQU12yRiODJkJmYtt3/j1T4H1DeorsDAo7AaxRMxuDfv1VXo5t+VVtU8eg/T2JecJORTXDVQYI9ZVHvfvy1tyoqHLqos+3R9Tkm0SFHn/aZEXNbhFP4qLRp6NW0sEXj+1XH1JHWhB5YkfymEv1t4lVyiTxhGB0Lq5cI91+77wyKikn3lOcjZ4a3LPZ2+GVSB237QGZrD848346wAA/xB8ARWPYr8RBoV4GA4bkhSw7SPT8Jj0lqOxRSUxcLm+oSgg6699zFRQZQQ/86KT2y5e1PXbOn1d2zzeTRI1gFOodFOWpOAcjrzqEBQRwslgOtLfTJsUbEbsMfHT6PMY0BfDSmNDmqFhmkBDAIX96401G+UniON9WY9eQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(13003099007)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jSL1u9y7IFpxOAvPEwCH3Yd8hch0n/iNPHZFI6S1q2wq86CMJbAKiMrcFRacjQS2xdGsid7mOhlD+/ENwQphz4B5gO94gf7IyRWOHktBWL0ymm6Q4ZJkRY8IkIvAXCoSW4bFym2FF3RgDMkdx8tpiRiIMHpjCmyEVzg2oHIMDGUyPEX9QR7iYcqW6nEK0xD8zIFBPRpqf9UnBnlxm5+pxDgK6NMMHi/CBRkw8s1tx4dGcqMFZcz/u7kYbmyUf0dnnXPzjFcSxEJ0qRY42t3AgoIocxT33aM/JDZVXJaDZ3iGFE5cIRbE+Z9457w33zP+8Yl2FUuTimdVoaWXSdMTqAvVR16rJLgFZ1suwjNm/J4HtAMNeBtT31+bVALBehe9cPflwmZOzy3gN23Vw6eEPo525ypKpAOek72C7Nut3xeOKLkSUqPtAZL7cSQSFrB5
X-Exchange-RoutingPolicyChecked:
	qG0ukwyz4FoE5vf+waN5ucRcbPw2fXFTuOvV9M6+YAlDeFTpslI3H5NjsWFgBEQxqpcMdcLSVEg8l6LVThdSUvYZ+xIWf/TnLqYTQJu8ABEvNsBF1dVJI1K8FYpJ/LJm7XgINI/mMuH4CotjVO7bNkqvck2AmMlELQsM506LMI/tkUQfaXzCuGlaPa7mRUVmtH+VAb0g/azFtEcB4DTHVEttBjDpy5c8cqiCjIf064RwNe3aQi9SiZKNbRcgBUeWkvd29M/PpCtfz2s5EjHhIMEdUgEKRpC7ck08EZ5vm+YfswXv562nRDOZH8SVZyDhDbWka+UkjZrALnRm0MIkJg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:36:38.9131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c179b064-65d9-44da-9174-08dee0d300dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6087
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX6CIUGyzQSYBL
 KxKc19/m1ZFI2GH3uJ4pdc4RL/G7sGBcIs8n/pnhEfAQ4SJnr/6r/VcPmW7JHSoIM+m+d1AHsBu
 GPoZHFHWmCSrhysIeFF8K834f2x8LuI=
X-Authority-Analysis: v=2.4 cv=HObz0Itv c=1 sm=1 tr=0 ts=6a54cdce cx=c_pps
 a=OUzJ7+VCHgWt90O9wSvn8w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=5TqWvVLUqzU5pgV9SJAA:9
X-Proofpoint-ORIG-GUID: qsEFTXA55QQyxuhJRNtBLFixsI0bdQrz
X-Proofpoint-GUID: qsEFTXA55QQyxuhJRNtBLFixsI0bdQrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX0ANdkniUd9lb
 ydnl+4qm0ajdYiIGSXtAdjcX2C2PojVkoM/uqNBSuJf9k5nikUEWkdQgmm2LiVZoQxlADD4QbR/
 XquhAxHPT5QFZ9YseYDSgh3ZS+X0iutI/zfxxBItbu5Ch6W6XCLJzcjB3wN9j8lY7urn1xTNqU0
 E9wt+lRaK/j+/EuXDhj/gkKs6aYtILzVkB4t2ftefqA2gszGeSEEUgkbx7CEBOMMghQ6d6feaVp
 LnD8Iu3b/47D5wImpPMeE7AnAurQ10/Y/Tuo8nznoQp98fwHaE+uYIlyhYQ0JGzjkTJXxSd8rgk
 5ECJ2SEbT6FoCp7w2o/GhA568YwcMrZLay6nrbHALBs0kZJXAWowe4GDLiVpQXuhNBWxWqW256V
 j5CkB5mw4lfVvuyf2ZskenL1U7NtwaAbOslfUEartiZL2TN981QYY4gfVF7CjMhQFNkwqjy/NrE
 /U9yMLl4VTpjqEkjSaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

DS90UB954-Q1EVM consists of a DS90UB954 deserializer which aggregates
data from up to 2x cameras over the FPDLink-III interface, and can be
used to connect FPDLink-III based sensors to TI EVMs.

Add an overlay to support it on J721S2-EVM. CSI2RX connectivity on
J784S4 and J742S2 is the same as that of J721S2, hence the same overlay
can be reused.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add missing bus-type property in csi2_phy0 endpoint for cdns_csi2rx0 (sashiko)
- Add missing build targets in Makefile (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h header (sashiko)

 arch/arm64/boot/dts/ti/Makefile               | 10 ++
 .../boot/dts/ti/k3-j721s2-evm-ub954.dtso      | 92 +++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 6b1e15855b97..529d85a0809c 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -185,6 +185,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-ub954.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
@@ -346,6 +347,8 @@ k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
+k3-j721s2-evm-ub954-dtbs := k3-j721s2-evm.dtb \
+	k3-j721s2-evm-ub954.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-usb0-type-a.dtbo
 k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
@@ -360,6 +363,8 @@ k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
+k3-j742s2-evm-ub954-dtbs := k3-j742s2-evm.dtb \
+	k3-j721s2-evm-ub954.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
@@ -370,6 +375,8 @@ k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtbo
+k3-j784s4-evm-ub954-dtbs := k3-j784s4-evm.dtb \
+	k3-j721s2-evm-ub954.dtbo
 k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
@@ -441,6 +448,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
+	k3-j721s2-evm-ub954.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
@@ -448,11 +456,13 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
+	k3-j742s2-evm-ub954.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-fpdlink-iv-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
+	k3-j784s4-evm-ub954.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
new file mode 100644
index 000000000000..3c87d0386496
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for DS90UB954-Q1EVM FPDLink-III deserializer board on J721S2, J784S4 and J742S2 EVM
+ * https://www.ti.com/tool/DS90UB954-Q1EVM
+ *
+ * Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com/
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
+&main_i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub954-q1";
+		reg = <0x3d>;
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25M_fixed>;
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
+			/* CSI-2 TX */
+			port@2 {
+				reg = <2>;
+				ds90ub960_0_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
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
+				data-lanes = <1 2 3 4>;
+				clock-lanes = <0>;
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
-- 
2.34.1

