Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B13E8C65
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942615; cv=fail; b=XJpnYGStygJDJHIK2OEOn/pj9iP+i2hW6Uu5oq/54A47TlvApzGv2cD3ShFofXWWRLBmpdP2VFwtfnFFdj4t/vbieUy4zb9QA6w3lSeh0u9bCWK2kxwiOiEHwnCjEecU2da2dE2yOa2zqyfxIGpqjiyx/0ZA+dXGji9zV6hSeBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942615; c=relaxed/simple;
	bh=rIEZFM6l8Nkzcoj60bB083bgMxFgLGOiJatcGHVAxoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gaGkFrJb7mXJl3haJn8YVXq8/q+XjxkH7x4vjD9+kbAfVVF4omviNdr1XAi8eEWiTHgDy4kYxr0nU1prxDzoTFUf0yhM+P6LCyx1xCLSfrHgyWJPdOO0A7OGIql9N2caVcX2SnS5L5bTiEqnTzlRIIsX2nLxrei3oZ29K1EiLk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Y25+icGD; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BKW+miBr; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Y25+icGD";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BKW+miBr"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBBvoW3407717;
	Mon, 13 Jul 2026 06:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IVylw/G7t6byyZk9cLzmULEzzG9lq/7eBBYZMbJjx
	LI=; b=Y25+icGD+bhd7qEEpjEY3BFuZkfercTEno897IlLf93wGccE10AdpyUGT
	G0jcU9OuQ7RuuTVlbKm8VZe1QX6dLxcpadetqTWnkNFd5ej67Zxt7EIVL7TqEgtB
	v7ZW1tmhg7HesheBZfDDzUbhNPOEl365/iD02yXROWdsaf+VbDbZ5DuYVO6noZTR
	Oz4Rmz5pis//CparZrf/sd13EJ9ZzNZ9gAa287B2RbrRBEZ5oz9eUv5AuAhV0OlG
	Fgw93MLXBtUq2QVsNvoSAGq6SyWHx5gQUFXNRa/qKjhzjkwrHK9fx8GQTnU7yA44
	LcqvYdcaWQcO9+5DikcRyCCSkVi5w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fcxxeg3c7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVoGSnCk3/V/xFQZbzUIAL+huYS54s8CGJYjnnrRjQF+8ZYRb9nAiQ0cf29UQXtxHqWIhFg7VH2ik3tEq7wqkb9kFlfz6xWaUUCvXTldYsjPhbDc0H/dRTK1DpwA1xcXx7kcU++NvayL+OvpGwJpL9uJi9rX98DtWgd0GvFRRJIyVwD6RDW2m0j2wPaHfqGmi/GyG7GVp+ZnQQOE1SxT8dDrZTVuVurBwTLQ8AONzaS150Ka54aeDlSodqIch0OEbykfvd2xFxcu49ZopmzFs8b+oNNtG6KNn0eKDHIK8MYe4fb/nN6pzgjFaGfv+HY2WkZvUfiTA70djAUgodZ4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVylw/G7t6byyZk9cLzmULEzzG9lq/7eBBYZMbJjxLI=;
 b=PYY+QeE0gIKm49YAnuZVZNnDhhKgZalqGk+uQn2pqKe8U8nqTuyJMp4nL+EILrm5hgHFHxF+4KpQwJlmfviLbWS/4cSBhVhbvBQ0TiUKncmMYg4vIpVHC+2MOdfq7VzajViieXEdY0ZojFfcfi+54kimwcP+TZe9AD0R8YyBXuoM+BADWtZNDgvYySyWUDtE8CHlgKb9cGXgvWJY49rxNqqsHYo7p42H9zBoyeq5/DLQmDpwEAzLLFs77Sa0tG5v03ZoI3GT7Nk3con+asV8lsyy9i7iGktd2XiHl9MC0VU51FHsiOPyXkJH3mA5MLqcGyqqSf09axQY3j2LvG0oIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVylw/G7t6byyZk9cLzmULEzzG9lq/7eBBYZMbJjxLI=;
 b=BKW+miBrfGsYiRUtkE9ykhQ4M6/J0CNnSDVyk86ZzQ2qcw5Slgus/+05L+GKLaRkf1wL66PlPzoOpBJbyaDo/jAsx70YSefgiCbOZhpmlxyGvvVw+Iqr423zA1GY4lVtbS2of5ESD6GSmcIbaYKiHPNTQga1uQSLyS9835PTyoI=
Received: from SJ0PR05CA0077.namprd05.prod.outlook.com (2603:10b6:a03:332::22)
 by PH8PR10MB6598.namprd10.prod.outlook.com (2603:10b6:510:225::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:36:23 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::6c) by SJ0PR05CA0077.outlook.office365.com
 (2603:10b6:a03:332::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.5 via Frontend Transport; Mon, 13
 Jul 2026 11:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:36:22 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:21 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:36:21 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQL1471098;
	Mon, 13 Jul 2026 06:36:14 -0500
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
Subject: [PATCH v2 13/18] arm64: dts: ti: k3-j784s4-evm: Add overlay for J7EXPA01EVM Fusion2
Date: Mon, 13 Jul 2026 17:04:18 +0530
Message-ID: <20260713113423.2310443-14-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|PH8PR10MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 3692131d-bc94-4a17-26be-08dee0d2f73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|13003099007|22082099003|18002099003|3023799007|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	TJN+lofn1dujticJ32N0FXVAxTekxmc7QPWoukzV65FIVrYGwVmcmHOjoIbHxv0/jSyWg6yJRjnousWSBb0amE6JHBbS7bisJ0Dg2s8jmUj9GnYimiD/CCd7poGApe5Yq8VZyRVmG1xH4+uMTChaWtyAr1JxAgxz+1EH35CNbYe4jcf/RwaZ8Sz7AkKtZfBMg2Aausn1orQgXgv90SWY1Zdt1PmHc7tLo78D/ZNydbwu+7iqIakOMnf1tjfmT3IKcVgkI9JWMrU21i5R5yzUGWp6MMpcnciHZJy2hCn39vaM3Yad3ERW5KBjlBE81FEcdvu6YhjmFrhou5heqGBUM1oU2HEj6T+9UqBg42U2fegDEWnKg0fyjvrOgccpJgxAIEXgVKGPkAEuNPOlOS3Bd0X5KSuo9ISdcF+eJaWq6pN2tLNpSBaUATUWWpR18WwlGH8l8MhRFDtDQnu4qMelEVwX6ZyJMPuRTaLeKvW4XTjfluvuniyr8gmxCgbL2NIOYecqyHIQXLnB//mvaxwVAuVRtA/g8OzwJbKSHwA+D9lEGquq1Ea/zF+I/NnUPwndJ7sxkz6GGOgGw+jo53wwmnPWuTskEqFxN1Dh8VFmlw6BQuXi0eJU7W7s/yPywzJsNitlLuh17gPeuS88PDzJ5g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(13003099007)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+mXGy80/Sy8oSVWysgQ0iRm4V4/I0f5P6ti/p1Yw+UcCp0MIRaK+i7xO66Qw+tp/T2AogQ8qiu4opYQYq+SPnIPAaIy00lhNfW9hnAsKkQedVrLct30y1YxoTqLFFVc2bZapPiI4iqhARvS6H3gKW95YjsYLAMFHBIpFBKgOiGlvx90d6V17gXRfdDaMMgWuYbLNfY9bjfkaS9KMCi/p7EhK8kQAG8lg2b/qUo+f6o3OWLikdzV0CfF7wROVRRZzXNfXc5GnK8E2pPOZr4lE2Yr8oGne05mCFN9/2FzwOzx7Jco5VqR6gYSRZpJ7PABHCRedB4bcq6hYl2dgEthq3Jtv+38nVK6/+sqQ1RiQ6EKEa9NboW452o8wvyogtAF+ismFb8MMEHfchZL8y5zW92ijF7bprcBU6t69J6/2XeKBc6wRdzUrEs1vAa17NUUs
X-Exchange-RoutingPolicyChecked:
	cZ0tc1vZwU2GUbyCA3Bm5JJRN8zPSjbwn8332FHSLuaFDcWHT9H1M/Arkj5sH+OJKMkAI/dqeDeFRDl+gDMbHpVqbuA7L29u3GIstFXKt/bXuiJQStzIJrEgvjRnvDz3jFsral4TD8Edz4iyDMqYkaXQS2+zAGwTyWlFgQIvLH1148wvIrGwryrqSZ7WuSYi2/7PR8pXuUM9sLXO940bW0Hi2AsbVcFX+V8v7lzB1LJV+a73/tRiYzCZhRamcve8bsA/Prl/LiVyIgvr34eH3mxlqFYxw6Am/0BRODhRWDtpzUZU0HaTA95KxrcHaLDVxCdTl1KP8knBG9laO2n7tQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:36:22.7625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3692131d-bc94-4a17-26be-08dee0d2f73d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX1bY5S1dw2Dwl
 eciFi38MlvLWM+JqTL9jcVc44ihynRjjO70PRIr+rTkqCRHD+qC8rnUm1soAq3u8kaAXIfrm7KR
 GHmCV4zyNwjF2qe7oCdnB6aHIi0Khm63fLTpYYzR12ng6qMmduGqCjDvmwiV8ptDCKH7V28JNjD
 0shDtdHvj1AmlTB36sSSm0RJQUUQ+LO0GXdcaRONSSYBvZe7VnvgKASwVVd0apKpL5LRscmmYPc
 Q1L64tBmADD7Os04BqMqP830UoZXWgC7iRmDZ24wBA2srlOg8ybzkr31l9CNcG/n8LWMhe03jzm
 9fh8GXHngIAcaU2ONNUp1vMNm6qq1F88g346wzxg7RdQhyBn+JwaoOIWEv3mJiQYJAJLOWXumcq
 cW/aaogepLvnWZ8DJ8EKT3rkwbDZ+dF91fRXPTQsdZFjoXtX9dGgUu2PbXXqkbdXC/oEGS4HfIM
 QKp/rlodKNmX8CRp6bw==
X-Proofpoint-GUID: cyXhLAV8RyxgTuEzat-M_kTHHwOAkbKx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX+D+aiZK20ai/
 bLEhxBAnxzGwfKXywm9Y4QdLVpe633tOZ1rG2kaOn8FkTl+dL7ryG2Vjjhn3muPivjgaP6BSGy1
 QEnndZkUb00bNCClBguO/LHmkjXRv3g=
X-Proofpoint-ORIG-GUID: cyXhLAV8RyxgTuEzat-M_kTHHwOAkbKx
X-Authority-Analysis: v=2.4 cv=Frk1OWrq c=1 sm=1 tr=0 ts=6a54cdc8 cx=c_pps
 a=uvnHr/yu0CVMxYA77rd9og==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=I3gn05AaVm_Ch417H9oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

J7EXPA01EVM Fusion2 serial capture expansion board features 3 UB9702
deserializers, each capable of aggregating data from up to 4x cameras
over the FPDLink-IV interface. Add support for the same on J784S4-EVM.

EVM schematics and design files : https://www.ti.com/tool/J7EXPA01EVM

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso   | 282 ++++++++++++++++++
 2 files changed, 286 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a9ee359f2604..2dc4f9043258 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -201,6 +201,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-fpdlink-iv-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
@@ -360,6 +361,8 @@ k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
+k3-j784s4-evm-fpdlink-iv-fusion-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-evm-fpdlink-iv-fusion.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -443,6 +446,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
+	k3-j784s4-evm-fpdlink-iv-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
new file mode 100644
index 000000000000..0f95d19ebd17
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for FPDLink IV UB9702 Deserializer on J784S4 EVM
+ * https://www.ti.com/tool/J7EXPA01EVM
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
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
+&exp5 {
+	p0-hog{
+		gpio-hog;
+		gpios = <0 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_EXP_RSTZ";
+	};
+};
+
+&main_i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
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
+				ds90ub970_0_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
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
+
+	deser@30 {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x30>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
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
+				ds90ub970_1_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
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
+
+	deser@32 {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x32>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x6a 0x6b 0x6c 0x6d 0x6e 0x6f>;
+
+		deserializer_2_ports: ports {
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
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub970_2_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy2>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_2_links: links {
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
+				remote-endpoint = <&ds90ub970_0_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+
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
+				bus-type = <4>; /* CSI2 DPHY */
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
+				bus-type = <4>; /* CSI2 DPHY */
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
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
-- 
2.34.1

