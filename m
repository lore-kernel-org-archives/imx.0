Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6E247B434
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984860; cv=fail; b=ulD0hm6zo1bS9x04/fGATWtXLai9RZxUNsQyL+O40dlq2aJNM6NuostxFh0HkGOYvS/u49Vaf4UuZ9tS1f62iibBydqCbQMZY/kPYbPmOWm4l5veHGnYDXk2ZnaCMQgHkLT4SrHAB98Zlena8jydENw6ClxbizhDqJ9D2MM1uZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984860; c=relaxed/simple;
	bh=+pcGuJddID4KulJVQwHQpr/ksqwqa5j2YLi0miiRZDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgCPF//ynAI87afKDgKzhmaOZe3r8ZER4cRAxPdnf7al+iDKCIICLZxQdXoNzmGUl3udPrwhV5mfvo7MhH6YmX88nZB/1iV+TsSW7b1LfkDhGOT9AP/VhK6pXi78ZduDN39CWstk1WVZ2qZQGX3Y0Dy7fjRLA1+EioaAz9lsVN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iG0aHLR6; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=usmZNtDK; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iG0aHLR6";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="usmZNtDK"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6628bitJ1954103;
	Thu, 2 Jul 2026 04:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CqJWtimazQdKSjZtZExOJJrInhy2rnb0z8vBul+is
	Ys=; b=iG0aHLR6OVpm5uNi0SBRwq4RUyDpFqCBvn41gP3YHerdBnPeFhV2UF8y5
	e2HzYtyzAYO+kVhBlACOs4PCgt8pXd1+ALGSfRXu8I2Eh0PHEqiYtbk9DzgqSlI3
	r/tcc2eqxdEgvRUCA3PqjCNHOwJOFlHM3HjysK5CJhlF/6oIgRTlN+PGWF69i8RX
	R3x5HzB7qBF33Eol7EGwqa0WfxXTWPCCKWLUeRCJULO7A8BTcM9DrFvPSevGojeO
	6dmkTTw+Re3Xi/1MrfYpZLx1iLDRqMcIFUbTxalcTqTgD1g9SrPxB51Oe9cVpXeQ
	+dNdBs3g89SZ5tptfZfnC/QFA5f/Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn5894g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:34:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8nLRUmDuxQEkV9++GzESvIUtAsE/nHFea4MsMGEIXYDeLEZLVYnSMpIik/VTpdts30IzwQ6DZseNF2oCh3GDNBD7OMGMuCXVwk6u64jB1M6tlMu4sId+ArFdJ2aAo+MrmU2HjUqGwCOLnnD5ZVIKn2/nGkPZVheK/otL8YEnwuVd0eMn17uY7TFV6Qcbz6eSkwt7ad0BT746rp7yvdtTT3pVGqz5xtqTRGDu8crfbvbRikP6XXIWlWh759I4OCI4SbRIZ7oozb0SjlLgS8d87m8zQ+IZ2YRKgZWgfRVRIh+OTRAvyjKaUV0mnbsdmulMPydCu9/qKTvy2f44HYobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqJWtimazQdKSjZtZExOJJrInhy2rnb0z8vBul+isYs=;
 b=CoTfN6UDa3GcRb5/h2igoJsRtY6//I++VDdvLnRFl+ZmY7/pfLDrVOZbEmZYJFP76ooSm3pBke7MYDQg7p69x+SrTIqGX/uvWf8aObgZbaJ9t8cVjgoItLfo26N+n8Cgyj+3NqjJVHeh2H1N2jc4YXf8ZPOZC1tk0CBWntp5RYCVv1FCaWVEDXv7M+CDYeEn1k8TNZR2yANf5v4jesSVoILQsDbesOPf0nPocJtzRMt2L45wNx3IqQRvkguw4gii7+fns8zWI+2pJ8AWljli6WUnjFr5z5hlR4Agt42hleZLz18cscnyskG0RVViuYXNksebQBsPd5dNS/SPH0THqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqJWtimazQdKSjZtZExOJJrInhy2rnb0z8vBul+isYs=;
 b=usmZNtDKQ8Pq8aomOVcXaWwBXR5R5ZkcjnCDQOvgFm3ut0AaPSG8SxQGzZjNlEg5IYoEJxUIdyu3VUmudBNtemVuzGg4Irc2jRfRp0Vp0o67fdmyjzP4s8Y341KMLh1jd0QhQNHPkkWRNrHfJ0GwXf8Ei9mJAS8oz7+W4v0q8is=
Received: from SJ2P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::13)
 by CY8PR10MB6852.namprd10.prod.outlook.com (2603:10b6:930:84::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:34:00 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::78) by SJ2P220CA0007.outlook.office365.com
 (2603:10b6:a03:5da::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:34:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:33:59 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:44 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:33:44 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb83611021;
	Thu, 2 Jul 2026 04:33:37 -0500
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
Subject: [PATCH 15/18] arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM
Date: Thu, 2 Jul 2026 15:01:20 +0530
Message-ID: <20260702093123.1048575-16-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|CY8PR10MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: bba0ed1b-d4b0-4792-e2b3-08ded81d0bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|22082099003|18002099003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	u6gVObOnHxnr6FLfGaeNjJAuvCL+utwV2Z+nE6CKFkZ5rOz5+Y7HpQFm7Uf8DjEZCISMYmqM36z5T/NwPxrX8jd98CkzDLc1zDwbowmzeztDEfhrhPJwhJNJl9QoouodJRLo8yQWWhZn7dGAbnUcVS3BkUJ4UW2AOWZWF9v845+NAvHMWXoArX/o0j6gV1ETawmilNlV99p0634DzknDMPeY5Yt0qq97XwsvkQMvFfovCdCCd0evrWu7pqA1tq42S87/wBgfvShU1hyH0S3fs4m938LtyZL6iCWEEzF9WaY20n5fh01ss41TxSaeRk/TI072pOegwJ6K8pLQirgcpcmxJXtEL1VOtwB5vkEfj+icnJQDVuiBeci/dSucI9ahoxlNDn+cELbEOvxWd2UzJh1FWVMHfzBsneOLny2BqAtdH8Vea3TTxm7CmB256kqFzyT7O7bHcrHkrGjO79auzt1vleqMjG7awISy9ITVl7auUOi0KbhWgBYaD9pOO8V6uGOFqk7C6rmcqwHuOz4SldXVgQvxZghdM1vNUH13xZtm4KAjL4GGXDPKs/a69OY3Fwv2ctufYb71hP9WSSbImcIN91ZVSWYCJRXfZCM9oHKXxRZeMwjmQHNzPcnBJA/TE9yOL0LUj1ATwT81jU2V3g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(22082099003)(18002099003)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DOXkA7WEgG3WHsr5s/5GZBjR4U3ySZjGfsuyqMnOdmRZcH8atF/lv9hE0+0RLDWhAoNZyeL2xmxcfOvYjVub25PBwLo9dhWELVW8D5pm/5/7n2iVCB6erRB2AwaW+aCYsA701JuOl6bheUen1wg8rbMdReIHqTbH3mKOiQe/rxvmLgSdIuzTmABE5XyTrcha+uEqViXm0c1NzMdXweC4n+smGC9jsOdgVrAdslqbGQHfFxSUYTGXlhmrsmmE9A00sNnrGNfUbWaWz6CQJV0TP1ldFschwlLKbbUtcKe1DKMzX7raoQw67vS+J1FfNSAqufKj8ZdkrPtopzDn8ogwGG5h8Y+kGGrI9hY7WJffePvBSKSKJgMMEt78qhjdLHRSNQPNbZR7uZAY3l8L0itD8dtfHXxScCiNPE79d0jwJtugAfYBqmBfnqjIHjMjiM3M
X-Exchange-RoutingPolicyChecked:
	D3yg8QdU4yzjjGM02mjQnrzq8fUYgym7OjXVnyVmiUYkvfjFZ+YAC5yX+T3rK4SDxkufFaORxHGGSbLBXScUxHRzdGhcHT9WbDHjZL7k7BhTgFapixBMl3xPOX+xowC4JzJdWZMsSX+oCslbr2/6pRlgrCl/OW9rVbwQ7QBrR7YFQZSNaUv6C9s6+dBwo2ebWayjB2cLXd3fKGYqqatSXV/Wu371OX3QevZ+JixG7lqhNjZDZZvWYTDfus55ftXKucCx2FmmCcesaagEDWyu32wAoQlDdSyQ4Oc/tWqJ7Gnz9GT9d/zc1oEsVWTS3iV/ulnCeeKgEjMlqatY7+9ACg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:33:59.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba0ed1b-d4b0-4792-e2b3-08ded81d0bbf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6852
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX4z9LudfG2dV6
 +RhtGFDlQN0GddLcFLTh+/m1Z8WZARN66Y6OBm6HZuJ+lMtk+ESx3tW2VJodafyWxJooxvs3fkm
 XZdEdBByMDQ+W+JfQIm57PYpfS4cAysso55Gvzychwhsgn6avxnteExe15XwZNYU42Vx+UswC0N
 YBHlGOL06qkxCYJpghRESkLBuZy8QuJpm5ADUvH5DCwkpBSqriIZBbzupGRf6rpg1faaATuVz2J
 G8LPAo8r7egbTuHGGtg/iAWrNFHyJXoiKdobTF8cPJwHrv7jAYIhLpfj0Wlv9DkTl6N9PseGmM3
 B6oQTsKSJn0H4rK2V/wko7ig36VTaKSCJAIsIymHOKnYobk0jLvQ02/RQCXnW2XnJWM8FOJrl0z
 +QXfjzoZr+y6plrusCbMm25AzEriKeJNFSAkZKr6za8a4LnIqUX2zTOFMjDV+DMxQ8hRhb1yKL+
 nfLL4j3i0y2o9TdG1kg==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a46308d cx=c_pps
 a=msEVGK6UkFBbvU8JCjtEeQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=ee1V57Af093g6ZpKQswA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2Zky6P5FKSAv
 pwI/F/s7Ab0pjktbrQZ8NNqG5HnBXpF9y6mn7+eAjuLg/M7T0e03+RtO+sTd1AZ34s0bPrtOuGN
 B9ZkqlLlcgClOia2Ltl7HXWdXlOtbDY=
X-Proofpoint-GUID: C6KATKmB-yu0AtI5k03RORuXXyrOTjj9
X-Proofpoint-ORIG-GUID: C6KATKmB-yu0AtI5k03RORuXXyrOTjj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

DS90UB954-Q1EVM consists of a DS90UB954 deserializer which aggregates
data from up to 2x cameras over the FPDLink-III interface, and can be
used to connect FPDLink-III based sensors to TI EVMs.

Add an overlay to support it on J721S2-EVM.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  4 +
 .../boot/dts/ti/k3-j721s2-evm-ub954.dtso      | 93 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 0246f582ca00..3eb0304e89ef 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-ub954.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
@@ -306,6 +307,8 @@ k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
+k3-j721s2-evm-ub954-dtbs := k3-j721s2-evm.dtb \
+	k3-j721s2-evm-ub954.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-usb0-type-a.dtbo
 k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
@@ -390,6 +393,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
+	k3-j721s2-evm-ub954.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
new file mode 100644
index 000000000000..6b058da0ad4b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for DS90UB954-Q1EVM FPDLink-III deserializer board on J721S2 and J784S4 EVM
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

