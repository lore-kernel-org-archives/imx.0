Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07447D94A
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984746; cv=fail; b=gGpkkCpc4+jcEscktkabZ6I24zDkAMS1eK8NM0tioQsh7SmnJUCYQICkaMMw40Rwb7sHTkG933PGxiisQJbKRUXOPBLmb1Q0Y3dt7TU08NUx64TAp7w3tbYv7eZQv0+cbmjvwTCMZyp46TKEIXAUyGiu2ip8Bac+r9kP7bP+sbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984746; c=relaxed/simple;
	bh=AefNe7MwtNjJ5M4HLm5nE6xgIroADhk+zLYMmkGyIrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6Q7lacoQaTpP00Vbk4PpZIMY75iQzJQ5FlO0iTHGxqoJ0JIhJDufuXSfRsR1+ewfx29GdGzXXxNFPrHYBOCQSJnrvoXOsadIOm3bMpb6iRaJZcGcg5naCmgUOpeP+npPDjpb/7/SITkqFgvZGtTxfHgGgofzzvmwS42W8dK0d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WzFNpMab; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CkFqPrWX; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WzFNpMab";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CkFqPrWX"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6628brZE1954377;
	Thu, 2 Jul 2026 04:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7YdOHSN58WO1B0hifEKfpaI/enmZKdK8l49ui8Ece
	sI=; b=WzFNpMabngNy1iVqdlPGwQSSllUO1kEY2ckriWfWrdUm1pXcE2Aao3ih8
	Kdg8znEQSWMYdQWyNPt5sZUupV3Ow6/iG97yq8HJcb11HSKGxwwlUEH0ebN6UGK4
	G/EfXAf0xm5PqUyCU3LBu1om/AZ0gkWtkNNS4S33lTNS9zhTnxqvTLqIm6DaJQtf
	7rY0MTf7grS474+EdT7f1A3pNL9MQHG+E+lbq3NSvBLFk80ir20KPeP+jN3pHU1o
	fEWArxKW+cY4CH5oS/OcpFDQyTkNA3G6xxl7KAJnfwDIa/e2fQy6/leHOUhvkpFh
	JizSybCpO/d2M4K/dyEqOAaZQobDQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn588uc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:32:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dElAqdV/mQfeFRp2Jt5tZoEDW/jgdrD4XPxIR8403CXlASK95jgmTEg9yX5Dpg6rzCkCxkdBi2vyJ4qnzlUYBPchTdmv+mETRHXCtIY1llvXDK6cEFEHuAci5fk3daiIt9kT2AlMi+vXVziqaXN0T4vD4kt2/8O4poRYt7CtBXPTUrgscF1ZkcgGMzmWgEkTbUCu0AzS99CMyquD8VH72VELigzKReLnRYQJCcwpkV21FiWX2QdZSjLL6hSriGBP5BjoONLCZPlDiNIlPJALK76/ewVpEWMysOUXuo0LbqUS5HXwZoIpSEHckmMKSSub2FbttkcBLVajr8ZaxvM3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YdOHSN58WO1B0hifEKfpaI/enmZKdK8l49ui8EcesI=;
 b=hChjtOJBwvNyCmk2ZidUYg6b9A6JSUyJmoTIlmQ8s/+K4OosGdIL1oe8fsVfpmpies8fLsHmW48oYKXVduOYw6oK5WfmcdpSaPFfzEQjKjcHGamvEk9YGmG7OwIhPl1Z5SSXXpXxOt/jid+lQSOEXE2fKsuXTFoLSN7jG9tZHzE+JnXGUPpqEuwgZKZOwqIM5c9sHlTUBqTQ8CjnJKE7lGt286gbqnkFfgKZOLkM761LNC833M4TlBew1C/i49bYXl3OLXaN+9I7FBx4lY3Y9Ks3mCWn3VkyVLDQE1Y1pcAqpOVebwKMkCC5v7bV9Ooj2ajebPgDzlBVrurzyot2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YdOHSN58WO1B0hifEKfpaI/enmZKdK8l49ui8EcesI=;
 b=CkFqPrWXpxhkQApk/DF2uTgZqSGDhFeoHv6mTQR6DYfYVn+256YtI6nZF/WzUM11KAC9d0xAbgJ6gpnaGrfW3aFkkj+hSdo8SPgb6Cgr1byIsW2hkN+0782d1EeWXTYsniuxd3s7H225nBiY2OhUZbG0b+CmwMTNn395+W+X3n4=
Received: from PH8P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::8)
 by BL3PR10MB6164.namprd10.prod.outlook.com (2603:10b6:208:3bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:32:09 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:510:346:cafe::f) by PH8P221CA0037.outlook.office365.com
 (2603:10b6:510:346::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Thu, 2
 Jul 2026 09:32:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:32:08 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:06 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:32:06 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYau3611021;
	Thu, 2 Jul 2026 04:32:00 -0500
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
Subject: [PATCH 03/18] arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA
Date: Thu, 2 Jul 2026 15:01:08 +0530
Message-ID: <20260702093123.1048575-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|BL3PR10MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: fa671345-460c-42ea-5ae0-08ded81cc9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	x4mY8GOSoyFgQ1Q/sJsA9YTIe5XiPp3FCyZgGXOSeg3jjY2G2cMdNbaBgIcHCBdJWPbNORPYzxd/E6vzT3+U31b0VHqEdWqmcXaBptNKM7HNmiHlAAkWRI7+jH3p9LNC+NT+reR52d6KuDbu6Vsth7P4z8xbm6JEW+0qwIqAZ62RwaGkC/GObG8jOsy+cNu3aj8b2YEzmWqKRfnkhhkcLsasRLtxnia6zS7VOBkVaJeAGsydD161G7ZswgHXpcOqMGcfkRP4MXCCatmpxOLfXVN2OyXLp7pMuL5kcFDHwDnKeqy66MWWtb4J76mCSylYJBEs/rilkI4mGT3GsTxCCDaRuDeb1o2ATWyXeUnV5/sr1F2Z4ZpiP0Er/kD9zgJBN3rztTALDTaeBpgXx3uTBCBg1+hfBpOM+/Ra+eN3WmhZs7zQPLt2AywTwWNt9GnNWW4gPDQnJN+hBC38UGTYqvRME6u6+mZoPivrxgNpGbOLsbt0TJzK6bAi6vmGgzf+neHmQlyIpdQAmhlwRKqU5YRw5v3mEZSJq6MNfYc+CX7EXUkF6jMbZAKGh3gzfW1YRTdJ6wwQ/fVFe+F6fGma4gxXU0gJ6/jbWqB73uTUn80IBHG82uLWsKgvyv4f7/q6RQeUUVEWC4j1mLt5eY1OyQKTw5/l3Fnf6kKT568zWCQ/Pfk1aU35CynpTLxEQvqLnrAr0GXN16227lTQC4AjnA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zfJzWwkWCRLdpAm9nEZA7vFipqF+eE3GbDUccJsETwJSKUs4lhpF5N8PM1WLdMINXcLTDARnkdkTDGWEM7ujC0aPqMQjlTchSQUd0NzXiVE64+9I4q0aAB16pm/OKVowM6pGXd28BCi7d2GGS8cyf+cSQD3rbt/PMmSc/OJQR90MAscfA7Oh3qVPaV5rX3BNsmcbyp/7V1E/KmeM+QXwFrs0/1FKeK6quGjPLXlotE1CMD5VIIRNv2KijabtP/GVrjvMam8tG4VgxZxdmM0YvOi2kvVXFYpS6eYY0LwCLqtuZoE22TbtMfP2yNZbHs/4QrEymR504FKFlMKuxi+fwjNv4FJe9BieXuMbn4P6YcxmaSbURlYnn0oCzDtvAfAcUBTYj/xRwUyp9VtbkBe8n5hivwasI8ET3UyelBLN3daIuC1HT4Yj6N+sMAp1GX8m
X-Exchange-RoutingPolicyChecked:
	dWEzdNEm6c4zRBXfQ9oe9dsoSarz61Z+Y6lU8plPih9qmIiiv4v3PevNdyLseE0M+DDaLosx01Tjj/f33pMwNiepqagdmdhizI1jdf6LsaUFegYc7PsaReDw2r4m/xJo6u/93Syk35YeQa5QOW1vsoBgjjsL2uodrNWXlhXyh3ThT2dXZuQmoMG51WmwV8ZG8rC1SsJdC8v+KWr7nT32HdINE57HnF7rGPb66MsExF8AHGv3das10tfbPsre5MhYqHfflDF8RL4iSvVUi+35+ECnh6fwT3wZNiIETJ8M5rdd7xcE6LP24kAiTvB07Wv48f7H22REIFT5UDVaREsVrA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:08.6756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa671345-460c-42ea-5ae0-08ded81cc9ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXwoOF0+baZ6xw
 Yhq6iQKdqUGmtqgAe8v9MfuRMZZ4q702lqB6OV0TA8zIR8wZShIdAhtvWcXr+5UTbH0XSCCp0gy
 CPTHoWbzUIoP/U2a1J4eCj4B8SmB9tWPB+ScIMYjPSoO0lOnzEYwmzogKLg3IodH3QpPNIoBU6c
 2N2XX1PSiBW6rkMfr2MgGPm9OvkJyLZYCsVW9RF+ZQAj6rPRjVlWzRC6f0thG3TzwGv/JaKsPgX
 xh5/RzLWeB/J/Ja8us3CNnvHu9pf7VkWwGplU5a63c09pIwIuwIdqU/Y487rx6k1Uriox6bbHcu
 /iVHWh691Bz0HP3RAobb9/w4+lwgXKjuKpyl0oDlUREt1tqFMxwBiaytF38tQZZEw+mGLmblEWF
 3ohWMuv9TuMQBc5osQRwqRrQDfmcPL51T5a6NXYl1Qs2Ug4HovXWcGNeVzFqE3u7MBEM6IsTHBQ
 RnYKmcsHp8Olyti28gg==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a46301d cx=c_pps
 a=S19i2aQNi83ZBCZ28RB3Sw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=hgJp_EOl-7JfuhX-_g8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2KPgVGvTD3rX
 sk0tmeQkHvPxcOBK9SL0r+wj0/CtwZVk5if+rw3HcqtCtWYOUaRoSikAW0zDcwI+IdpjKmvsvsl
 WXyfDjZLFpd3fSx8wNnNzbJjDFk+iO8=
X-Proofpoint-GUID: ATKGJjo9q54xxfzKJQy1E1Nv0VDUH09v
X-Proofpoint-ORIG-GUID: ATKGJjo9q54xxfzKJQy1E1Nv0VDUH09v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 5cac119e4292..f4b8713873b1 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1239,8 +1239,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4940 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4940 0>, <&main_bcdma_csi 0 0x4941 0>,
+		       <&main_bcdma_csi 0 0x4942 0>, <&main_bcdma_csi 0 0x4943 0>,
+		       <&main_bcdma_csi 0 0x4944 0>, <&main_bcdma_csi 0 0x4945 0>,
+		       <&main_bcdma_csi 0 0x4946 0>, <&main_bcdma_csi 0 0x4947 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -1295,8 +1298,11 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4960 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4960 0>, <&main_bcdma_csi 0 0x4961 0>,
+		       <&main_bcdma_csi 0 0x4962 0>, <&main_bcdma_csi 0 0x4963 0>,
+		       <&main_bcdma_csi 0 0x4964 0>, <&main_bcdma_csi 0 0x4965 0>,
+		       <&main_bcdma_csi 0 0x4966 0>, <&main_bcdma_csi 0 0x4967 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 39 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

