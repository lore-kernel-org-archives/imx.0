Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202E340DA6
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942510; cv=fail; b=KiipWMa0VD4nvUi2xXgzebJeYBu6sKG7kK9kxm6WyXti6CWaTc08ThlVQGZE2DcgLbnrRs2ow+/lvi4uRwvSa+KVPfbRg/9nmKFCJcuRzLQKI2gZHi9gG2igFLcIV4vv1utoWKhJB5b/sFWwwQTaPHPe/OhJQezISP7BYQFZ1A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942510; c=relaxed/simple;
	bh=cLb59/guxQWFm6Gbub1grdHF5g83HWkV2aRWDyhdJOY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DFJ0FrF9s6vsa7cQha9O5Q3ON7Znv841WvodUjg1aLv9PKrYWIeYf+YbTPkkuzVQDaGG3HYKI+/KPOXOHwMzhSl6vGJ/ShiQmChK0FmsbLcN5UmhCsKFtgwc2A+YpH31hVtDKf5xO6UloTtvbyqDsBJrUpnnv8qqDPTMNh/zJrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TWsUS9RZ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jokRL8IJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TWsUS9RZ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jokRL8IJ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBAcBI3381673;
	Mon, 13 Jul 2026 06:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=echINyj1JV3ZLCDF+qTzOD/RxIRygLZ38EhNFhWG1
	PE=; b=TWsUS9RZf+sT6SjwcFM7mA/I5zP7UKat0UcfOs6MXBDpCvLDw6MYbctzB
	RwdFlJSF1ZT/i3Z9VLk/xKR5RA4M+vVlVGuVg0Kug7NUYZk+K1DUl9fUsLKkyhh7
	N10TtQEtbJsKmdxHOEXa1m/X6PgitAOI8ls2/wikKkBgvnpoBMOue5qrKt9WHzmW
	lHWc+wT9jfGIw8c3nqCF1MffVvDo0D0nJwmtV8JxLi31ithbMhh0YcCblbu0n8Mc
	y8rsoUCMBZJITHhpQLa4lqj1lqk+L2oYa2mIXRssz5VaKMX1rUh1QMyta2fK4gHj
	EUaYIO4il316DXANWDXuXgDFn8FEQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtg39r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:34:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6XWYVY5k+0E8OvJKxN51Me8aowOjDaHPWpvQeNJ8wCq3BVvlPFI+1daiaUx6QTry9YJnialOHQ2mhaI0f0gtJJaohicGkXl1QgLFpDOOQ9/jCBcUKp+81nwoWK9Pejx6NltdmJWlHnMfHNAtMys668tSOoHLSs/wHJU3TMbvN2mnjC92PHfTCvTlKaCNsuH/7JLMHqd5r82zHtCvmDVLNosod8W/QSzECG8EfH0hU9J4bAmAWrBmF+mOBrld6o3vdiY4k8CzATmnhOowX1pWQT2fdu1nhCJAGEUKUl01VdwwXoU7uYShIIA8bAFGVEXp8ZzGI23Y5OBFYGweP1wyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=echINyj1JV3ZLCDF+qTzOD/RxIRygLZ38EhNFhWG1PE=;
 b=JFMDB+bPOxgxypkuotnR8iXKCyYMmhTsyLHCFYYQ5o20mQuNlgZgvPbza/ADZ0m0fT2cM9mnSGWF3wZB9oeQCtvgpTqYRykpyTWr7qteuD/FWe9U5YR2IqZy9hHa4NDQ5T9DOMz13V/tyDjJFVpzLM0QhQfHp7Ch632/aKOiEV8KaOxkftIFht2bqSJ63l03/0IX6fXPlFvEknoZpKLzruYlCQlL2Xfgv4R1VF9MNJSHq3IHzpxkmtJcbe1CpRB2fZCleRt5gMx5S1DQMTHnGpkkiKu5JtcBQ4Gwf6bPv+lH6lb06Bnx2qzMC3qcOvex5yNNwtD1IdygZuBACfjrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=echINyj1JV3ZLCDF+qTzOD/RxIRygLZ38EhNFhWG1PE=;
 b=jokRL8IJaTfSzEaFKj8lC2xo1ifQwTFcGhFpJArxPYqseOvEUVSSdNfxG0FhD+K9xHB++oWSeVc9qx6nt38r4gw5yVxvTqv2XLYblgA8cyXlxRNXqlO89LFF8ZYs/+ejhP9PXLItzrG66UK2sJNm7YVl496wdMWON2E8oFTZzvY=
Received: from SJ0PR03CA0173.namprd03.prod.outlook.com (2603:10b6:a03:338::28)
 by BL3PR10MB6091.namprd10.prod.outlook.com (2603:10b6:208:3b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:34:53 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::59) by SJ0PR03CA0173.outlook.office365.com
 (2603:10b6:a03:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:34:52 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:34:51 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:34:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:34:51 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQA1471098;
	Mon, 13 Jul 2026 06:34:44 -0500
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
Subject: [PATCH v2 02/18] arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA
Date: Mon, 13 Jul 2026 17:04:07 +0530
Message-ID: <20260713113423.2310443-3-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|BL3PR10MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: d487214a-82e3-4a30-2286-08dee0d2c131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|82310400026|1800799024|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ytOSMzozqb/NdS0AlgXn/7PqZK2FN6k4GSvDpp8w8o0Tj9djbbZWS/zCLQ9ViJpEFcr6cJd9hmaNvuxEH7iOw9rAgJVI06bJfU1rbzGkc1xCJBHQ0tWsjhDVaEaGBojgsflf7d0KE1iX4CtJh7LNF5Yxi83Gi7he1HkY913fr3ICDac95njb62yNDlF83OxNxOE+0ZIQkW7vo5I9y4DwY9yYUv6NzR3npHmkgAmTxpjnqKnR7so0fq+zwp2fdWLEHSzLt5xBXcW+AcLo5rknleIC2d5pYf6K7ByiMWuHgD0R2QDBM31R788CeQ3G0jReWIpW8vZa3ym+9xqzercDLz3FJl3jMRYgcwHpvaqb0gXF9fsVN6VCpLBjG/MRBBHNiwvQGHgTRWLoklwpmoSIVQGJkOvy9M401fQFuMTlGgMiNM81BguwDe/FdF+AHKOO6wfuEZIhfCc8ErWy2crs468nPVcsfLuoH1zNL98F/UdF4vgDS5SPDzouhJ8faPoqC6sKGVhH9FNXedSJP4n/dRRFbuaJd+0CNaxstiQ7mVeejYfQvqkPGc0zCFZpME3kjjTcdX77q4MNcCf+ZQ3FqpnWuyiNOC959TWiOv7bDwSiMVoEuukERpOshqVkLFT/UTfAORYBcslqo9Q2ISupmd5nszzeG0avy2FbZjgQdwg7T8TBqKx0C58b3VpJwya6ywv/BJS1zznzn5bVJYAHsw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w5orakwTslViVl7J7nzE3dYKveG5VzwKeXEmiyVpPg7UEwxe98RMH16D5nILXbGLPGX++oL+lRRcOkIoKS9PFNMZVNHmvPNWEvY3Z9j56bSoPBlSUPVThuuLvdC+PNW3bUExRsnqI0gFAco1Bq28TxM9H10GFZAl0oHah3Ca1yNT8mYwwBA/vz230AedcYnNSIuSMTlIZn4czrkf7DR2zPwPoLQADVLckur32HezXN6JyasSknNXy5QJphR0WqQ+RvTkInHZC7qMW5nofSR8BmzGnvPBXawz+2XNR/i2lz8G8nXDQWUZeCqPrv7dIXB0hxmyLxk/70d+9xWLYj4m/5biqdvTWD3oQCEzWwpZDBSiAVNRzuud6fpPoifG9+y+RHw1kUZoi1lbfhnpwl/anLtzyxokNQNiZVyCP1heNwGI/A+dcApwvnb8f5h6FDTL
X-Exchange-RoutingPolicyChecked:
	KvjX6zHS61XnjGxPsLBBE8RdPKhVNUw/MU5FpKRO7YbKM+psKct6mlNaujSs8tzXJtitkPgT57UKYvEN3hU0IiXGJJUlqvpxJaBNw8FfP1WH3szQHEmTRZEoS+zKHaZbrvSJEq99ZH5bEPrpEflq8q72++OHvURDV9Zlh+MXAquz4sxM9sKUHj0Th4BWyBtTDDPjQvgjZSdoGVmOVNQ7FZtTAJEY4a/eam8L8dCQ56YpoXzTI1/A2e2FL9u6xalIpF1zF9gwd6zL1NtA+79CwXalrjsKGf0hpaglObWqty0dsr0mRcyxrz6KkqTbWLQW6Co9XbqtYI8IBWIbpWEhWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:34:52.0800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d487214a-82e3-4a30-2286-08dee0d2c131
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6091
X-Proofpoint-ORIG-GUID: 7KwGxbMAmy3mJyMfAptFVFSMTM-rc93k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMCBTYWx0ZWRfXyeW2+Fgn8JdX
 C7pkoAFFJU7kV6vqA3zksAOmMAn6t6qUQBV/s9kRb92K474QIXofirbeXnYR6wYVS5Fu5Y98yrD
 RHACnkAeiHKkR4eIuHAbntE1rU8KbiSfwRVgzop3eX96Tc9M05/37KAkRWb0pMUwgFNEEYzDfCd
 ywcTtE5i4sewvQyp4lMe5Fbimz9zd4UYdhTwVziKdAg4sLZUMckJB4aL6KF50IHA/Vkl57d0WoN
 0vMDbTBST/vUDxr2tdQKTGsUWmHemNyZkGiGAMtskhe3qiWu+js1z5GxHcYszXhAAVzTIa08p2o
 zVJgBOf7hmJi3EyjwNHfTwzkDgk05OdmpBG1/803P9rLczl7a87eacqpZwm8FgMHktZmvRWceof
 HfPP9h1bNxtRUTXoGDs8CPe6mzpXyZsSt8oahYT/V+2udpvJ7GQQQRywSIRgruHV1pxe3w+UWnR
 z2VOlBgSNzABo5gj/6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMCBTYWx0ZWRfX9lR71YILI7o8
 eJsr+yc68iwLpCDDPtfHrxqAob8+4j1Ib5eIFacToRl80K0zVJD9pNBbn33T0xaf+wEDkhODDMr
 PuduxOmbo2eTHUJ6Oh8CUWuww7Oo1Qk=
X-Proofpoint-GUID: 7KwGxbMAmy3mJyMfAptFVFSMTM-rc93k
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a54cd60 cx=c_pps
 a=T1Jff0mhgTaaoho+8HaPfw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=lWlUmI80TkwTl8jqF04A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130120

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 5a8414fc5751..b1988437f52d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -600,8 +600,14 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_udmap 0x4940>;
-		dma-names = "rx0";
+		dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>, <&main_udmap 0x4942>,
+		       <&main_udmap 0x4943>, <&main_udmap 0x4944>, <&main_udmap 0x4945>,
+		       <&main_udmap 0x4946>, <&main_udmap 0x4947>, <&main_udmap 0x4948>,
+		       <&main_udmap 0x4949>, <&main_udmap 0x494a>, <&main_udmap 0x494b>,
+		       <&main_udmap 0x494c>, <&main_udmap 0x494d>, <&main_udmap 0x494e>,
+		       <&main_udmap 0x494f>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
 		power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -656,8 +662,14 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_udmap 0x4960>;
-		dma-names = "rx0";
+		dmas = <&main_udmap 0x4960>, <&main_udmap 0x4961>, <&main_udmap 0x4962>,
+		       <&main_udmap 0x4963>, <&main_udmap 0x4964>, <&main_udmap 0x4965>,
+		       <&main_udmap 0x4966>, <&main_udmap 0x4967>, <&main_udmap 0x4968>,
+		       <&main_udmap 0x4969>, <&main_udmap 0x496a>, <&main_udmap 0x496b>,
+		       <&main_udmap 0x496c>, <&main_udmap 0x496d>, <&main_udmap 0x496e>,
+		       <&main_udmap 0x496f>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
 		power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

