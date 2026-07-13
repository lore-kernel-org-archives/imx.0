Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2665388881
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942561; cv=fail; b=B3EJSHi2nTNMeRVgdZhQuH3iWbmdibnljroyzy0udWsFxsFY/4//RWK0PWgQpzs2Ctck5ylxxJgjn0Gv2hUfijL2KES4GhUVEcI9daoeFpOi6W9WtQ+my+5mvZSNIf/yZiWjIusAhYxgaGszQibv1QLLeHnbLp8332SQlEm8AWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942561; c=relaxed/simple;
	bh=yokJhcsCnHQOJ3qQcEBIkNr74YxYVao9DKzuJArScGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxQeap8kZc3Db3K5D19PsDzYUkRcl1W/qK0kKeYx8K5wU1AffwHeGSCB9J9O5TWr+8tgcrEOPNpuFIH2F6Ec/ThqYNF9RCtC1eBVFdNW5tv2lqJykhV07UREAA9WImtC8nv4/5dtGDgCYrJDEZQotxH2xX3sjHivmgQM3OSMD+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=onU7DQR1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tNCpA1N1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="onU7DQR1";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tNCpA1N1"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBAcBN3381673;
	Mon, 13 Jul 2026 06:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SBseymnSJoK+d4hkQwAtonAY/12QBIWhVRAYaPsDu
	s0=; b=onU7DQR1UGJgRS9aLX+H4BOS8cE0UY5DEzMbXcicpwKdV9M8fV6IuaQ0d
	gj5fr8A8D9ZJ+LOxcD8Jp+CuvrJbCQ7cmMnvRuxZzOGjYXZRHThzVB+HtO0QW4lJ
	KH/5HPYdMkO4XreUwPtdPiOwMC+gZn4817CUpMYTzl3tZZcVoFUoi6ssBI0wn0AE
	Cy4RvzWE6sHxBrrwFP+Z4/Yhzu1ImNEKMoVMpHIyRFzbeI79JIDGh3/jiwhhW9OR
	q5tSdvPOgOHvVKINeDuUiR38U0GRZuW9YBWbdUGSTKuCJys47DE+W/qA0LgE7R56
	yq9bgwwxr3Sps+Ywd0RQs7Me/e40g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtg3cq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:35:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZLxnoCdBHhmfjoE7o6Ga/3bS88mulvX8FScUiKbAWEXuc7QqLbQtrfGltGQNfcMLEQ5b+6LVAIr4/I8qUqATpExIr/Dv2W/ez55NEvqPaUaCW+H4R6BuEGBgby4ZpwkIYEYd4lBlUHbiDln4DJATJx+Y+upFfsVYqm4nfEVLRx7c5d5sV6OewWDUC1/JoRhm/rQT2x4rk+AxW87lI9hH1X8umbMRYuoHDy+gyKDUp3Udd2fZh3RrZOw2FfITgpVOxWZO7htWIjjT3Ho17vDSg6U+yDviWlOLHF7yzJ9uG7xAdvrid506TrXXWg0MK1mWRhHYpfjnrPVpk8nEFch9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBseymnSJoK+d4hkQwAtonAY/12QBIWhVRAYaPsDus0=;
 b=qog4xNd6uQ3XtYJV80F8DirgKE7OCyfAIdl8r3+JLahuENNr6jnpNVxZm+Ld6oGbUp7yRseJQ/cgQ5mSD0pXvWPGt3uOTEnG1LlHHnyzzE4BamgnDKLzOTwFASSjFbLAz9aN8e9xKbxaFtZmOL0yQz+S1acgIgwHJAHVxf4h3fCIDfR2aAr4Wk4/Mv+UTh3JX0l3j28S+UI5jv5f+I4PBRm0hG+mNJ4IOvTfBC9sq+0CvAmX8Z2skwXR2076KsTB14SY0DTJjr9y5ZpWyWoMFa9XxbJuJOtw1N+KCImnwsllIBngueSPNKvr/FvFaE6otuB0RyjYhGd1EVoBpQSuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBseymnSJoK+d4hkQwAtonAY/12QBIWhVRAYaPsDus0=;
 b=tNCpA1N1vnqHuOQvud9IkJs+1R46eNDAAfbgTSYcPtvBmg5n/4c51FLy8g4ObUHa9ZKtTc4B55VnLdeBK6f/joibYWHlIehdJFOeKd4XnOEqo2ySDeVZyaCp9y6n6eWnGBDe+U6HfX0VtaSwykMJKHf3BArznMgvzAXvGXcV+Dg=
Received: from SJ0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:33a::21)
 by DM4PR10MB6279.namprd10.prod.outlook.com (2603:10b6:8:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:34:45 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::1a) by SJ0PR03CA0016.outlook.office365.com
 (2603:10b6:a03:33a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:34:44 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:34:43 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:34:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:34:43 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQ91471098;
	Mon, 13 Jul 2026 06:34:37 -0500
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
Subject: [PATCH v2 01/18] arm64: dts: ti: k3-{j721e/j721s2}-main: Fix indentation in CSI2RX node
Date: Mon, 13 Jul 2026 17:04:06 +0530
Message-ID: <20260713113423.2310443-2-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|DM4PR10MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: a781eda2-b229-45d1-7d17-08dee0d2bcbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oWaTattZPCRHKpt0IJ3fdc1PdcIZFisbxyPjqqxeqP0iwpr6Je2FIcf+I4V966QOoB3gIpY87izB6DYwnaPu6V/Sly77apM7PBCw9dBDxb1r10wSNZBtk87TXCzmccWOKADAmjpUXVbYcIXT5OvmNNIEhc/ZttQEVdPdkJzDT5fXl6kJKbFQ+fbbak3xV9B+OJlSY3Slc5lNDkjySyaMEn41UCarfi9PQz1U/aI1Whd2w9ZmxeK68FsxhSv++q2Mm53+tZ625CCfpU7S5cri+/8zSwKc2obxCozpQAH+qQS4STnHAgjT0vyPF2pIeAcFu54EXOY8Vd5IlEIF/bBd40+F+EXn0fV6m3zAqKSamorL1Jn1vsXMcLpB73c4JsFMqdR82o8+fyqT6SBdyJBRJY3RulidgoiVauTWmUViHyKr14V1nFPTMkakKjTpNEPqJWzNPMqkWlbeLXa7TvZhrgJaUdEBh/lNZwDlanhUfLN9WBBHVOdIS0dI9SxRvqZ6wAeQttCTmtxQZNCi7D+yprwwQ/LfCWJ1xYXjWfGSwEQ/l8oQ4dQrxAWPAWqP/WxJKva6XTDanzE7HdIWVDU8hv0zBlLXo/I279+N19q7EeGiwU4+OxOcl1W1ArDy1R1AjDAfX8QHN43NsixhLl712cAkqoQDurTdwzl0iroQW48Ev3VSa8JOvyTtk4hDhCGr0kZnDC0uZadnlvjD/QLJ3w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GSqSpVB//m/LyPdei1I6O1zgsUPqweyuB5v22G27IXoDuIeLymjKB8PDGCb8gjRWtKWVg6/FWzrsaa8xVRV3hMn39M4PY/2u2b1AsH2YVWdIidTTb4dfx8SDii2K8x9eBwvtGXH75iWOZWCwgjodnIjGMmidfONmAS/G8bMseCGSj00Pqju669BLVyeQzlHqAJmyoNSFJkaGRjBRcQImktqG2iJb8jZRFeQ6ICiMAQ24BkBk6YqokSt20a+k9KBJCCQORJkjyW3gkMh8K3bz4l76HJZ/sM+noLvRTdKiYs6fq1rQXkhNy2qU3czPqmTT8tHlExDhP5r/70eGwON1rhJGTdpRyrhYjAITHk86wGMDo/+OAzS9v2W605H7Qkffm0zvJIIVTiHvqfAIfl6fj54Pp22OTPOUT5/cNk3boZsD7YyBrGv8oWEDmqAxnHC6
X-Exchange-RoutingPolicyChecked:
	VM5BRU2pIsjb7C3jNgrJCVXVUIp+8aiQhQ1YgATv9FK1ZqnQaHhN3PBi7fv9+Hu+DUZUPBEn8wfYvAF0hydPtNtbGTqjrG7aD4NvUqPSJBVRHb4EgE8pafZOj4KbzaNQ+LUdAwyb0C1JvplU6k6brDXuarhyEAjbZaQF8iivbiMzkf6lG6R2VRpVGpqqGaM0FdiINoivpCw8ZSxVsRba2P7BUd7vUEMPAeYraCkHn7u74W0RY7QP8Bplk0PmVztrloRCJV8kY+co5tCxx14jhfJL1bIIth0k1WYLb+VUy5+ZwPa/3X2Z1w2GsrZeADCALXc7p9IBYor9SlJ2HtTRWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:34:44.6230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a781eda2-b229-45d1-7d17-08dee0d2bcbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6279
X-Proofpoint-ORIG-GUID: Q-Up0pOv3zyisBPDPE6YnALz_emCTIdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX6am6K8WgZEuQ
 YSS51lTJlWSkoP8q13F2LeQqc34Tchw3ADQFsJy7mz7jiI1N9trH4Ue6lbVMPzDynCbFFB2DvUF
 yp1PQEto3S2PRmnBIcyeaiHalyu/isGALwQ4GtuHlWFZTL2xjMUc42ZN6vT/NtDK3szuFiC9n9P
 HBn+ZcVVm7L1ixQEwlq3LeUib2LYEei98omkYNS84Ej14dUtlEWtEdQ0DYuSdDUd9bdtmwyBNGv
 nAPZEv31hRrEwim98osJwMMeCDZDqy1fV7qKQv13vZ7YuKF1JMOzs3JefMrgYL/uWJasqa4JlcI
 77tloLwuPWxrQZK0edIGvPLq4btED6HvH8/HBRYT52KhIVkoT7rXme7RKCKaqtBtIy7xP6C6lgY
 vG8dY54pCAsTP1SBgKvYdiwloWvMdMWcM5WyKIPmyuiwfAcsbWdVlKWSUm7nL2wQ5g/b9ORIwRT
 oR7FiqGlXeVxtaXaBZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX21xxyNmbXxEi
 N0hpba+P/gfkZgsqrekPPsnTnBjeNFHohB5Rucft+f6AsH+MyO8aRO9vhyHw/TgLiWb/dXgT9xW
 ho+gsLicww23TWzAxbwbcnEBOj6CEtE=
X-Proofpoint-GUID: Q-Up0pOv3zyisBPDPE6YnALz_emCTIdZ
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a54cd95 cx=c_pps
 a=7AyV/nWbqbi5qqSn9KuTSQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=e96LkNGndUTIoZmP6FEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

Fix a few minor indentation errors in the cdns csi2rx clocks and
clock-names properties.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi  | 4 ++--
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index d5fd30a01032..5a8414fc5751 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -612,9 +612,9 @@ cdns_csi2rx0: csi-bridge@4504000 {
 				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
-				<&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
+				 <&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
 			phys = <&dphy0>;
 			phy-names = "dphy";
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf..5cac119e4292 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1251,9 +1251,9 @@ cdns_csi2rx0: csi-bridge@4504000 {
 				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 38 3>,
-				<&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
+				 <&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
 			phys = <&dphy0>;
 			phy-names = "dphy";
 
@@ -1307,9 +1307,9 @@ cdns_csi2rx1: csi-bridge@4514000 {
 				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 39 3>,
-				<&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
+				 <&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
 			phys = <&dphy1>;
 			phy-names = "dphy";
 
-- 
2.34.1

