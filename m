Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD6648033E
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984887; cv=fail; b=SPuGe8hSrxigY5JpJtY2Doi5da7Y7EpjdFZp8TQSrcmaLyJ9CXQuJF0ITge93tLRdH0q4/BPciqs0cnPanc93ofS6da5A/HMe5gli1JXcsQqodmwPm1DlQYxoy2I5Ot37cnejWFpq+eqodReKVwtvVi4cLHOBHdaOvBUTV8M3+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984887; c=relaxed/simple;
	bh=rIfYNEKEIvKS5EOf098yk/qJNxAY8k2tJ/iZiguCWGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRuWOngWeKTe+Zm4pLhlgGjnHKI2doYy/T6VYzkpc4zpKhczIf2+UrNlcsYM7W+QmKlMZfftNZ9i8woGFob1oJjDWDcB8NXwPVa5psjKcnBLLd1zY2NLGJ58JwRjUQtrV2Kbr5iykz8eLfBRTuqQUCCyjfGL9M3NextjFHAIqps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XleBH9iV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VaPiFk9C; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XleBH9iV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VaPiFk9C"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6626XlNk659076;
	Thu, 2 Jul 2026 04:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=B1E3GJvKDCgl4KuMMLS4C81zHOCnERMQmJjN9N8TN
	P0=; b=XleBH9iVvenC5Urw/yF4ssRGLWS5mYqJ9QZXjAY51SxHZO/GhbiPLkXJo
	30kYj2ERBrDKDmApvrKwLalp5WYbI+a4j8VkODaT0uU1G2ChQHvIW/oDGdnivL75
	QeRyJzNCQtLXmX+4MzoyVt/Yoho2M/AAW4QiTQCMmu1fB13MktqY3Wwhns6RBdZb
	0y/zkxYEKg9p+Sk6/rKZdXIC/B27vlgtjnTg9BWRGoXqRFXuj5AfhRMoL21jNW3Z
	MYzftakKXg9Oa5DWY9l86AFZBHUfKMWAn1HCm84eJ5LXvI4d7fmkgpcVd2SBdxBo
	+bBq/Eodz21T06o44s1LynTYaccNA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240y8cx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:34:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tz1l2mNCVCOpR1XC8eUxKYO6yFjlpvv7HbUV/BHm4QBZOopnQ79LrYTkNonGd9r/wwA8xuaZRib4hCxNkMyLv5fyW1Gp5X5QHCmR7SXlHRr8Px1JAgS6CUvskGRdCCYCtsCTBH9Xt+h8ECUkd9t6wLZdG6hEkyegQqly9jh77qxujNJQBFzhNYMLQNUj4G0cBimMeeP4r2DaAfxVmIUz44DbU5/vc0yltaBnY9llQM3CZ+OAtQktu7R0Y1niwZdvlxy6u3gsFnHrsrDxeGAW0nGDgTnoF7ZN9v1wjHUX4vsI03M+igU9jDTAZMOF+ucFIVgsBftrb/2T9sf+2pBKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1E3GJvKDCgl4KuMMLS4C81zHOCnERMQmJjN9N8TNP0=;
 b=bqJZVdJL8BB41V8BUIBdBQwzjehmJp+5jvTNV5t8CMz1MfuGiW7lMvOvuqTsD56xyo+T2qPIJqugeMVcsL6kkmLOc/IE8juUqtYc2SVyxEZGn22OzstHb5nsE49BKlaStMdMEwh6JYNBsRUnrOlqyEL/058ZNVvl1ycVmFG9TAqWEqA7kZdQZkIz15iRwmobpjpoLlfykdA5r1ILSVicxS+N+1vaR/Q1lEUW5QoqQKASRL/xgC6gYHe+McekgDd3Hr2WkvFLOmVPKBlmTfLgaWmI0pwfX3ODYERAJzSaVJFV/vYRzKkZWNT/Z7TFnU09qDe7jA9VQVPOF2atWJH2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1E3GJvKDCgl4KuMMLS4C81zHOCnERMQmJjN9N8TNP0=;
 b=VaPiFk9CBryc3TurQocN+T30MzAJUrTEjc5xT/84P1CBbHtVYKECJ0k2+En2Z9Bn105a8OgHnp+SX1JegwF+CjviUqv8M0GdcKB29cNF+FrN2q0UFBAn4cTZn/rNktxC1hIFZmRU4+F0r56a9rI9yd3j0cOyBZYGJ8e69QrKTEs=
Received: from SJ0PR03CA0240.namprd03.prod.outlook.com (2603:10b6:a03:39f::35)
 by IA1PR10MB6195.namprd10.prod.outlook.com (2603:10b6:208:3a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 09:34:24 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::a0) by SJ0PR03CA0240.outlook.office365.com
 (2603:10b6:a03:39f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:34:22 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:52 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:33:52 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb93611021;
	Thu, 2 Jul 2026 04:33:45 -0500
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
Subject: [PATCH 16/18] arm64: dts: ti: k3-j721e: Add overlay for DS90UB954-Q1EVM
Date: Thu, 2 Jul 2026 15:01:21 +0530
Message-ID: <20260702093123.1048575-17-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|IA1PR10MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: eb412843-d1af-432b-8cd5-08ded81d194c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|23010399003|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	tLJWcgPa3fjkW5wrA6b/Qq7n9vBH3Ae/RhqR8eKAHZvViEekzjluWCQxqaKmtjFDs1/NDmY5jQ6sG7DmQ9s2NewkuX7QC3TPgGOrfJg+mg2kThCLcbV5a8N1NpRJwbH8lFdBKxunzO7IOElIGIT1P36PyWSi8nIR2bFZ1Isp40mwRf1aD8car/UdbLbMFFOQ1Yy+Q6qmPAjU8larnCdu3z7MyOMFPKlNkXJ7/VIRXAjxDsulHrYpCu84YAU5ykgwVw4fOy5ahBbFb2LXip0RO3ne3jUOnMUeWsY2NnJTN1JRX+KkVowwSxSswmpMp6QMe5VV27JKuDRGr/DeMjIxDv6i8eSPIFJWsYs1xPw57nPvx5AfoSx2rdaZoeh1ycnBK3SmgzU0cNCwCX28OnLOfKMClqVRFxo0deTk3zd2YYGJWZn7v7ROnbmSCr52AkEbwMGucZKxNj/eNAAicFslTUaUIZEM9okVv7cHCY1SQSHNojV+FI9lcxcsFO6ueYOwm9cXl9j+cf830SjoxsCh3CM4Eim7JidWtbPMlDPpLku4M9gok+kkllT31eAaU6n2AjjL4eyRPO0hkxd0X+3mRgBtlryYineWSd+lo0s5aSQerohpxQsfZmQhKlM+9sl66PVfCdzK0b/2GRx1tWohAA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(23010399003)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KKwXWPm/hqyzzReFjZnlp2mMku5GxzwZjs1lcXjielKM4KAAgu+HbJBFInKpfV3aE6D/ldDOxw3lkNV67IztieEwlmkrwDT4m/qqk9X32wMo8sNvZpPZchpdrU0Re/vjXuH7asMxSbVIO9+NH+np538o8IK/7cf2IgQdiQ0gZtVpxIIvJ6FTU7M+aZrZszgxcwuE0OM9azkwvMU+ZaquXabkO+35d0WEfiebUPKYrV94SyiZNTU85Gfm3RQpj8Ely6DcCSXqLBFBOwG2NIvAvakGUAZjux//N5co7ZdQq9kY3y/sSoxHmlMQg24NAdC2Kaqmf3REeK0scbBycyAD5T7KvVmRx9yCdRRh9Mt5doqpCbz2ysXFYF8SupbjdP+cwgU1osbCMfOu3XL3pD/0wIG9ZdS+WXE2ROzPpmsCR1OGKHSktIs5IG4qbajaaRHk
X-Exchange-RoutingPolicyChecked:
	sZ6qQdPeVabB7HT/XYNvSByNPXw2PvXNpQeYNVs0YM58LVa7ahEoEpKprism6x0wtbSy3CshWlMvcEzgXmfOhEolIL/SgPfzrI8ysHh/0nfEgd/EJ5LENyXzhUs6wx/6b8RLiKdz/aqxt9KlTkVEMSyJhv/jMfYEDTcvmlkmPLTlLOxLlqO63MoY69v3R0NCtMN8zfi7HkNwBgEE+xfiajDDOsk6jMcmGBk1MLUlCK20sYskI6ZCiGiawNiAxaIPh8qo+axwnNMLPZWArfZTk8EUNQrTbGzsV1ElsKJd+V90RDLGFAvWKw0qOGiZwYZrooygXFquSgshhlIyQJcdcw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:34:22.1950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb412843-d1af-432b-8cd5-08ded81d194c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6195
X-Proofpoint-GUID: gyGYm7ke89iKN3hk2gA0vwtRNLjRVEca
X-Proofpoint-ORIG-GUID: gyGYm7ke89iKN3hk2gA0vwtRNLjRVEca
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXxFO2hROUieES
 mDBdfe1f6IaVq99L+gBMTfW0bwIzEIPxyhptU2U3ucGwEiNAaitxpjd2gYXGMqMQnZP/lRnYzTn
 tyYSEWkYUztbO4Ii6sJU5g0VCeRKTwE=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a4630a4 cx=c_pps
 a=O5ql0vl6PVxeYGQXc+vjrA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=wb0ZgZgsLJO2NsATMoAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX7l5OHGpjYU2V
 0xbqkxqoNK2AmPRRo2/WpkUlNj/udI9+WyEbDasAnFXf95MjsB/b3kEc8Bq7Y5pCKCO0/+QLN3v
 lJpEdMQZrXMNmDgB+US9VNFWbL3hG5sNetx//BwcIG4Fa8wNmnixlnJEKuAug8sY4Xw3+cuoh3k
 nISECxk9haYN3dcHCxtThkMpyqgt63F5N/rXwWM3aJBLhuAOv/tdTyTLs5wSPrNFbEuO/kSZ7cI
 dZlk1dk2Ai+PHDXJG40oCzjxFHb4pou6mSJLnx+ww47JIv/D4S7+pmSfhnHfG827FvOqh53Z5bD
 /to9q81V3AS3lBmqPz/VuLtEgPk4TUBVSOcmzcHmnAMrh278bA8EBs72YNo2F+Mo0aLdOFsDAlW
 IbcRDGMcqzOH38Q+fYIo3TKSoqbXimu4stO4iO7e81pDYnFDbLZ2JsRoroX0xdlPzMh60sYliey
 8OVMAcr73NiJa6ob5vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

DS90UB954-Q1EVM consists of a DS90UB954 deserializer which aggregates
data from up to 2x cameras over the FPDLink-III interface, and can be
used to connect FPDLink-III based sensors to TI EVMs.

Add an overlay to support it on J721E-EVM.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  4 +
 .../arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso | 93 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 3eb0304e89ef..386fc77e4c49 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -146,6 +146,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-ub954.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-fpdlink-fusion.dtbo
@@ -297,6 +298,8 @@ k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie0-ep.dtbo
 k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
+k3-j721e-evm-ub954-dtbs := k3-j721e-common-proc-board.dtb \
+	k3-j721e-evm-ub954.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
@@ -388,6 +391,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
+	k3-j721e-evm-ub954.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
new file mode 100644
index 000000000000..4e24ee86cddb
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for DS90UB954-Q1EVM FPDLink-III deserializer board on J721E EVM
+ * https://www.ti.com/tool/DS90UB954-Q1EVM
+ *
+ * Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
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
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
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

