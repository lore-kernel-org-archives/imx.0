Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E33480DEC
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984872; cv=fail; b=Sy1P4xVIED03YgU3oIseO0QZORlW6az5wghGL6UMuwAy5/9nyfcFiHrTgkOWzaBeOlF/Atep2oKmb/xl8ZG9QQchyDwy/pVxDe7Hgz2FCjmZaFV9CVFRyM+orvXj+OME1mYXk9v4tiOls1GLL0HtjqTWrc8jzqFH1+gcjNPu63Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984872; c=relaxed/simple;
	bh=VkhgPi/sLF83JAiymYQuGxPRD2XRwmcdSs5UOSy0970=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rM3sc00Nc+nk4OEvQfqRhvlVSFb3Hk3XuBFehcCYOe3FIJI01yNWn0Oej8Ls3OJk5KYfIHJlXUFv9CiLPfxuYiP3bNdCkj25f3DqOok/JAX0Akqe74OaBZoyL0gE0jrhSq3CsKS3PLALkwp8gLmi6BhkI9RkJBkib1leQwvZ8sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Yyyn33tx; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HUQaJS9L; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Yyyn33tx";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HUQaJS9L"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6628bn091954220;
	Thu, 2 Jul 2026 04:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kvNt6+vamzbbm5XqI9YhEbYpfw9STTys6jx7hTCfR
	gg=; b=Yyyn33txpTmd32L1JlAyZJPhf71AX89GOjoJjWK5V9pwC7lIF5vEgXmuJ
	vZzkM2bp8vKkdMORYfyjsHB0LP5k766EJ17gpFMmMqTWHSm76Onbbb+ApjxoLkOa
	boyAKrVlClEFjwl2qw0qU530Q/eDwOw47D+PV2+vN0O1NcLVFwm6E0hdVB+LuKBU
	NsHUohvjq5+4XYDlTPdL1l+qYdVDLUoARGgFonNa4auJRAa8eg4K7iEDjzOjS43h
	yX8zPW69ybBU+eP7u6NgcF2M/pSEwR9T/gVtnhELWYR5MgXM+BwnzOtWbBBZyznt
	a7z3qrtSgMBkGjlbv70j84cKe6ANA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn5895x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:34:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfWYjmF9Mb/bJtmb1SdjMYsWTxQ/maqLqVwptLxrQrmqCTtjBZUvyLvEK2SiNeNnO02Ys3Cxt5bnLKF3FMUcSqO+rLPzVQyGhrI4anMhxh0UbezYUCil9VBcxNHv1eCEA12RpxxWIqJ/uShYjX//Ld1EvjtkeY1G1Syo71LQWRmMRwY7j1j8BGOC7jloS1R1obzM5Fms+DiktyXWLlZ+PsTRmbZoFcy3l/W6WBvjkjkW3ac4O+JJZDGW5tYEUBXa932euxXxVHirof4An2gfPG0YfxpiSabjvFyHtXfntvuCMAqq9jSNwZfkmV6fnzFoH8CE8IWBrjsgx+0bHeKUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvNt6+vamzbbm5XqI9YhEbYpfw9STTys6jx7hTCfRgg=;
 b=IcES+tgvbT1ij4y0rSZhfoauHHqCk5grPwGCQpXxoJ2HKBa2rQRsEtlkvATQoNn58TbFPduIsMEp/a93mF/V9qY9XxWzt50HGw4rVfxJEFnXJkmIdf0DvEP48tHBO7ZsCOEvAGC+DUJycZcWRP8S5y12ZHh1KHGFBPdm7gw/O7odZ1JVHuuy83Nc/23iMWgOWMkEigzk2swC0ukXHaB9OdmYEZrps4gvGMK6PFfs3z5bFwWTLDySqRW9QkaWjPWfs4GG7954q6GiUb/keyey2a5k1UFQlG7Q/efQSrJekCRIIC6QB0gDPOpZGICMfb1RDnKv4pQtZoCb1UbfSArRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvNt6+vamzbbm5XqI9YhEbYpfw9STTys6jx7hTCfRgg=;
 b=HUQaJS9LVoT5xVYjlmV1MlhhlvRwaqEIAn2MOrjyeyN6+23gXwU+bA6ZajtDSbS/nXyThCjyEiSz3DmRdhjCXkb0bFzg1PPoG6gtu6F7e9Beu5XPRsSRrG3WFr47H9Gc31YQQODLWoPf+b6EOXMCjJyFJq23f0R+s7oE4v6HuEI=
Received: from SJ0PR05CA0116.namprd05.prod.outlook.com (2603:10b6:a03:334::31)
 by DSVPR10MB997912.namprd10.prod.outlook.com (2603:10b6:8:3bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:34:13 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::3) by SJ0PR05CA0116.outlook.office365.com
 (2603:10b6:a03:334::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 09:34:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:34:12 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:36 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:33:36 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb73611021;
	Thu, 2 Jul 2026 04:33:29 -0500
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
Subject: [PATCH 14/18] arm64: dts: ti: k3-j722s-evm: Add overlay for J7EXPA01EVM Fusion2
Date: Thu, 2 Jul 2026 15:01:19 +0530
Message-ID: <20260702093123.1048575-15-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|DSVPR10MB997912:EE_
X-MS-Office365-Filtering-Correlation-Id: 6592dbc7-b07f-467f-afa7-08ded81d134c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|82310400026|376014|13003099007|3023799007|18002099003|5023799004|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dUUtc1hyVosOPs1+DFYCYrrgrro4Xn8PzLUfBFvSk7cUklUMlYc94CVU/Y2/OU8Snqw2rcnNql+7XPAtmuL6EVAVPZOb26aYBMNFG07+/GoD9yufPBZUelMiiuo+DI4w26y9MGHfHg/HpzxLp9vIexaR3Va5t8fMrsgD42vayHIDpE8FT8ahOdRlAw9tM9242jfWh5yczmbjXLnX1Z0j/AP2ZIeAI03tgzYSyQyzBG9T93RELqIcd/XDUhfI2fx3fWugaldzZ2CGHrxdtQDESTFams59bSkEAgMieL1DI66CIf3jXiX3qsmbTJ1gFmbEe5OBjAqpCe1RyYTcDeMau1CsOuNHzliI+csLSA7Rjpegq89LdBdLFggRS1LUnVFx+Aj1ROhdM1vFwnar27t00VXRJjsTsyW8mhY0dnHkba7D9VyIm+Z0Q4/iq/qJ8aBzgcpFq45EXO4NrDkrOXH/Vizi1xmm+glU2jwFpzkv1LirhTfbMmTxTeQVW0c9jCeGI9+U9DS9T7YmV2zbfpmOvGMfvtT8oALy46rC8h5NBxzCDAxaBGMFUjfda7GEtDgC8oQ7Lru33YCv9OZfujzTGcMOT8hLPygOzzFH5g9dINlEQfmM6N3cZdMWRoJGxalW8FLnpb1XI3MwQx/rd1Vhkw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(82310400026)(376014)(13003099007)(3023799007)(18002099003)(5023799004)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mqWRE0JP8X/A6bj6CiMl5ZJJvko7wgvWxzqaWmCxkdMe+MOZ0VrgevY969Qz9kRvoikBwei69F6BnIeesJv5Kz7Zx/IyZ9b3/Bpen8rI7IjjgvPu5yCWwoXQQXeuqsH9Lji5Z8IyHikeZzKx19XpK0qIL1YOIUhbxU9Uq2dxbq2SQbh57dhcA1e91eDRKPtSv4RW3uUYZoCv46Kq+QwmGv7JYQLkWOZlIjfcYSz1PX7ULrpJGhe5/F6/HVRnMt9h37bNTHcyeLl/NWJSymn74uioOCMtaLK5FQYJuCP2fToCCYTIKCsB8R9gzBzkWN+V8jRCsVd5r1Ux07qXFOeL9Fv/j4fKuPAe4EDdZoDo76/aqro/lLPTS9VkAlgQbeMdcXoa5qGc8ZT1kYANsB6khmmr1ynEE3ihdptgPcXhZTmfn0bVrXEG58/dElW+IyCF
X-Exchange-RoutingPolicyChecked:
	c7vMPNvvH6axZ6Uy1sXcIqS7dOMNGGKuG9idNJ3W4VKKV93jDvAU3T3/s+cqdNYZjXlvIluOlYNaknLuDBlWxIIAGS/Grw/9zDsebeKLEIhfyT4+SbMcWZxwmxSL8sfg/PTPey8A5/IEj+YaoMwzfeVCpfUlrDvtBkduoZpXPmJnEncJLylRichZvzLJVWRTtX9fLbrHwyd8aYDjQcPAxMV8rkzRULnyeVWMGZAnQ0NvT4jisjm++zZq0T7J88bzK6fs9v5cnJe5Wq46S2vw+GdlXSu/xPxqiXK4z/hy4Vy4cMPnUEtlDCqSUoRyFIvkAamTUOb7DNXNBpr9YSwVsw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:34:12.1345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6592dbc7-b07f-467f-afa7-08ded81d134c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997912
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXxWEmYonI5kqJ
 WCz8Hp6uIqcQto4tvMZqzR/6lQ8/Fb5Mv936hi97QPT+pc8km18jV+2taRS0h5Xmek3YaHXeDK4
 Dd6XeRFDpmXzj2KqLOjRjr+Ee+HY4fcKFK5PHC6za3Z1ne+/Jb+Lw3NRzxbOzSYBfJgkQ+B5rI0
 VnyvMXomvtTwVPQ9i4XJX754nf6vBPEjtxHJT9pAWyOBA5pWJCOWhdSv2VUPcYGaYwkbZMAle8u
 ubc4bBsC7knO420hqJ2KCdsp4x/DyzQsw3B5YaR/+l9wu8R2SehTLLJehGN8CcC/QQ9MQFAVYbQ
 2E8Kh5fF1qHxkviCY6UoyQb/duBzOFV80OGRsyReXa+956oomVmQDVvhMPAYtKD8bDIghScBjeN
 gcQ0rbOHHGOXAyyYmG1eIKVLQYUAMWJoZstnaZLwcbTF8X/1QBR/zDzzTP1VX8X5yEP27coEbLP
 7PovAkEQr3BDK4yvoCA==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a463098 cx=c_pps
 a=tl4IwOQKiBOeKWF7Rad3dg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=-ataLAZeJnTW1ooz-NYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX+3ExbkQg5HvE
 Wk0cBN67lPsOzlJ16AOWuZzY84kPPGIC1bNeCt/SyHrl5ZrkJod92jUkPU9woEolxJr+ImomXkD
 5DK84dhRlnoNodWekZpWF2HT4P3Vw5Q=
X-Proofpoint-GUID: uvUgFPgzKAgsYRRhXd1GMo6zuxGReY9f
X-Proofpoint-ORIG-GUID: uvUgFPgzKAgsYRRhXd1GMo6zuxGReY9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

J7EXPA01EVM Fusion2 serial capture expansion board features 3 UB9702
deserializers, each capable of aggregating  data from up to 4x cameras
over the FPDLink-IV interface. Add support for the same on J722S-EVM.

EVM schematics and design files : https://www.ti.com/tool/J7EXPA01EVM

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-j722s-evm-fpdlink-iv-fusion.dtso    | 296 ++++++++++++++++++
 2 files changed, 300 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 7da84197402e..0246f582ca00 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -175,6 +175,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-iv-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-v3link-fusion.dtbo
 
 # Boards with J784s4 SoC
@@ -313,6 +314,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtbo
+k3-j722s-evm-fpdlink-iv-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-fpdlink-iv-fusion.dtbo
 k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
@@ -391,6 +394,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
+	k3-j722s-evm-fpdlink-iv-fusion.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
new file mode 100644
index 000000000000..91bf23345b92
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for FPDLink IV UB9702 Deserializer on J722S
+ * https://www.ti.com/tool/J7EXPA01EVM
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	clk_fusion_25M_fixed: fixed-clock-25M {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&main_pmx0 {
+	csi_expansion_interface_reset: csi-expansion-interface-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x114, PIN_OUTPUT, 7) /* (G26) GPIO0_68 */
+		>;
+	};
+};
+
+&main_gpio0 {
+        pinctrl-names = "default";
+        pinctrl-0 = <&csi_expansion_interface_reset>;
+
+	line68-hog{
+		gpio-hog;
+		gpios = <68 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_EXP_RSTZ";
+	};
+};
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
+			compatible = "ti,ds90ub9702-q1";
+			reg = <0x3d>;
+			clocks = <&clk_fusion_25M_fixed>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			deserializer_0_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0{
+					reg= <0>;
+					status = "disabled";
+				};
+
+				port@1{
+					reg= <1>;
+					status = "disabled";
+				};
+
+				port@2{
+					reg= <2>;
+					status = "disabled";
+				};
+
+				port@3{
+					reg= <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub970_0_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy0>;
+					};
+				};
+
+				port@5{
+					reg= <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_0_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		deser@30 {
+			compatible = "ti,ds90ub9702-q1";
+			reg = <0x30>;
+			clocks = <&clk_fusion_25M_fixed>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			deserializer_1_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0{
+					reg= <0>;
+					status = "disabled";
+				};
+
+				port@1{
+					reg= <1>;
+					status = "disabled";
+				};
+
+				port@2{
+					reg= <2>;
+					status = "disabled";
+				};
+
+				port@3{
+					reg= <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub970_1_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy1>;
+					};
+				};
+
+				port@5{
+					reg= <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_1_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		deser@32 {
+			compatible = "ti,ds90ub9702-q1";
+			reg = <0x32>;
+			clocks = <&clk_fusion_25M_fixed>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x6a 0x6b 0x6c 0x6d 0x6e 0x6f>;
+
+			deserializer_2_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0{
+					reg= <0>;
+					status = "disabled";
+				};
+
+				port@1{
+					reg= <1>;
+					status = "disabled";
+				};
+
+				port@2{
+					reg= <2>;
+					status = "disabled";
+				};
+
+				port@3{
+					reg= <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub970_2_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy2>;
+					};
+				};
+
+				port@5{
+					reg= <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_2_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
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
+				remote-endpoint = <&ds90ub970_0_csi_out>;
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
+				remote-endpoint = <&ds90ub970_1_csi_out>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi2_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy2: endpoint {
+				remote-endpoint = <&ds90ub970_2_csi_out>;
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
+
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
-- 
2.34.1

