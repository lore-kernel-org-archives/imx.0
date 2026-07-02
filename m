Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790E47CC7F
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984732; cv=fail; b=IWN9vgnpBuKIkEhXPj3B9DGhohSIgU5UzzbocB7L6I4cNeZooTuomwDqWg8aTauR3iK5kwmn5oRlMt/iWw0Q7sxNqu/7HGzNi9zRH9QfQZwvjfyLOMwsOC1vJpus7Rt/knIr8F0I7g5wrtzKDm1a2rYWmcbW25BcDmDdQEv5gHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984732; c=relaxed/simple;
	bh=yokJhcsCnHQOJ3qQcEBIkNr74YxYVao9DKzuJArScGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dH1+i3SxjEeqqKIiAPUI+G3C+CS7uiQvydA0LqcPDVUyY/BtBW3AUJ1igAcyIlL1JYQ8hs1Q67ZTh423zpmevqBKSpS8bs4jtalnEAVmR8oLuO0jiY0ncOeCHrE3V6Zl1dvrG29rcVdupIOsN6+Y0ioeZzz0+yQQwif1rBx6uDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TIJ/Xhd+; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UVPb2m/j; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TIJ/Xhd+";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UVPb2m/j"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6628bmMn1954209;
	Thu, 2 Jul 2026 04:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SBseymnSJoK+d4hkQwAtonAY/12QBIWhVRAYaPsDu
	s0=; b=TIJ/Xhd+B5KG87nqJNIw1R81yK1JRR/XQIAnHIauf1pzysckMX0wGVGpZ
	edjBB4wS19R3FFKjWS4JmKf/tISjjJKmxtKiVkYaXZ7RiGl32zQOfzaIIoR4ZHLh
	eFTmkghutomzePdUq3EmGNtsvCpKXf2G1WntmgyYLKfl8sfE5g3h5tckx0fRhxUC
	m3hpg8sMjuMbOfj/klmfoZNyVqUc01Qu89oNp/D/EWBkXYoR3ie6ROm5WKxMJoqa
	vU32gfnLm4ZtUAE9ijXXupfMEfq6Zji6EmHsoMPyGbrUNTooauzOaQJaF07HElR+
	3lS1pcKu/TAVjPWSw0BR0PrwXjqqA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn588sn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:31:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGrD10A4821Jg3lSyqUafjX+SybaCjrRdo6oDepFNh5AksPrNc1Y5C/B/umG+DJQMqn/hS1L2jhGP+w6wDdK+SAUYh4SLLz6tEXfqs8StqXja63ZvMl1k8+zChgNyL8O6uYGCM6Cun3Zrjw4XYCJW68DuBsGWHbt12Ep7PxfbFQtvRwT7IumVf9b+eMTzkJSaUPpbus19Xput+WFk4wWcGgqKiBbz6Rx+4CFqjwQOakgqOUb7a+WywXsrj14oIQHCbrznYtuHcrmxgQID8MdzrQO3CU5LOD2V2qspmoS3Yulikojxk64DcqbYWGCfMCeVJ5O1nnObMV5aU4dyCqALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBseymnSJoK+d4hkQwAtonAY/12QBIWhVRAYaPsDus0=;
 b=QZu3KZTnzoTLTgYIMqnTmlReZCFkvX8R5ZjgYXRSM6q/hqx+iyIMg9rQZ7CCJ3nMnxJpaN1K2uXpOUK5v+YIJm+78TrkXXwkWGTc3m2AQTmOEvLMxrGS9b5wJfZ25Wel6+EoDiiyASvXiDoX8GVK/l/4nNXJA2BzlRd7c7wmXKI0ZGsGIjbBwB7M5ECjWthKArtxJoImvPVdKMq7VC0RmnhRRXJqVLcMp0hYJJq6s0ciGWh+V8iemUIyMDqvhPuYdrOIMD6TozsKOTx1woy3JzfkGCCmai8rlYHjjn58C+/iyLH+10iySw/62u+BUqau8N+oXAGjJu2lkGacwdp1sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBseymnSJoK+d4hkQwAtonAY/12QBIWhVRAYaPsDus0=;
 b=UVPb2m/jME8uEsAVUQaBifVFqLwZyDKLGWUNDVI6wdyWkrb18myMxO2aW8fiT0Fi4Y/Avq4bW8yKXcMxhvpYMpYMbElnrRdalWFe30NirfqposKV4ngMkuex7XzuCVbzJHBcYC8NcCrrGziODhlW+l4uVIyYhMAJ4XiFHtj+1Hg=
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by IA3PR10MB8042.namprd10.prod.outlook.com (2603:10b6:208:50c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:31:51 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::91) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Thu, 2 Jul 2026 09:31:51 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:31:50 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:31:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:31:49 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYas3611021;
	Thu, 2 Jul 2026 04:31:43 -0500
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
Subject: [PATCH 01/18] arm64: dts: ti: k3-{j721e/j721s2}-main: Fix indentation in CSI2RX node
Date: Thu, 2 Jul 2026 15:01:06 +0530
Message-ID: <20260702093123.1048575-2-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|IA3PR10MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: f65570c6-30c1-430f-a0f8-08ded81cbf58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mM46J3lQlPzT2cuLUHJvMGoh8/iRpY149Bqj39LzPErH+LO3ijtsgZ1kpY/Wu/CXMa7T0MB5THV5Ddv6TAQAMIPxre0A/VrhSYgy988LUURXZbP4+MP3H6wP66xPFC4OugbtePlq+M+qtrzoNy9tAfyQairM3dnsqJvnBBrIfopFFbPhTF/xrM4R2Pk1krBAfKs9rnBrXUR7UPDRu3jwLvzSuJaL5zej4aL4fRbBJA6YHRcZdr9Gh6rGeuxq1odb/k4qdkMxzzRHDEBPdps3OW8sI9Py5WlIqQszq/2smvoWhPEN3hQz6+OvLG4gpZZ0iamhIzNtHWs1qIPp07w3E+nXDQzbxm3Wpnbz+djoNRezm9PW49R8LshuRvUAx1ZmUd7x5h/R9GtsQ2hr+Sb2JkNFwhWKsqaimQNQNbODmKSgIOm1x+sO2bRA2Hw0VfGjH1jBqFnepPi1lG2pAcbJV5ugaUu7WNB0eD5S+FHnEx7KlF5Mws2Ak+5/npiLhVTgbz1AblML8ojRWNiys7DEH0Pgi8Bd/diq6ZTM8mVwiffhfFq/yDOamDkm4eqoLVOuR/8Az4O6QYpqXYR6hcG4hEPqXYKmBaF3voG3sCloxxc8Grng5WYvffhb2SIQ2GJCuCvDhDKcw5n02oE84v39815KP7mJG+ZC6TjL67voq1QhGhuYglsw79hSlX872Ab+wXeF782gOFOt165JoSCTcA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FpUWVv1iu/7JKD+KTNqRwBgZ9nJ28fuXisCDlH1at5/QQ9+Ml0KnLCeB0zhzlfRR8icb8zQz0Q4PBgMXshh2H2bin6gS8ZdQ6gUUQDcauVedKQZG2slfsRRcmQpJz/yPs8l+9wke2HhWfmMLJ9ceMrJ5UqSU925Zoff8ezRSO/wO6l3DQZEw2YrD9NbsDZA44bvj4cyHILgrne2+mUB1VzTpSx/a5QFNRAFiTrvVH1YaNPafV8F+kIKDqHcy9MrcErbyFH/TECgCu43YoJd556jvZwi0qsdhz85cmwjYVeImA5nMeIl5npVutiDYg9vEFW6eMP9Z2Gm99qN1z0Gur7QyYIP/wke68wMLs5h0peiqjpPM35EqAqzzSoWnJEv/Ce9bdv46WJUN2y+/Ms+qDQAAkyBLrd1PDZmAHXlokfmcKbCRIvsEcMY5+Y90QV4b
X-Exchange-RoutingPolicyChecked:
	W4adO4JA1UqevVv71WxqOiSkF8pQJ7OVZb5QKW0nPq56dRoXE6FaKrbsDohITFejYyySyZqjkXhkb8WCQaJOQZ0dViuWvncvgMqIX+z3RmD04vyJE2FoMjpud2E8djBPCdj3G1YOCg3nRIIBX+oUPm6O55QUAXAqA8OlrbfQvAVakoEdzkLe3XGWUHuGh2wxQWwRRHWMNVsDEwrTx2aH9khp52nmOZrIcfwsp6gO91I90+JVwmrLqpcX4x2tBogNihzlfz723lOUnnweZYdq7TzVFRh0HagYD82+h9QGJftFvJLb6vmLlttGWWvlO9axTmYn01pU6NsIMHJw9N/R4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:31:51.2879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f65570c6-30c1-430f-a0f8-08ded81cbf58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8042
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX3buH5R00ZOwR
 FysAA60XAthV8SgHiJluLKiBZEhwKtGTsUh5A5FPXooVSH4VChKg3G6FF1KdY7CrC/zX+OiW7Hl
 YaCaKK5sbXhl7i5oIExipPh6AwTfdO5pShMfz1qyfvdulzHKoGpgCUNvvjXCs0tBwnjvAgiN2Ly
 jGiJQHSn6gISZ/4c/Jwvy4AQprlY3nVU0yHaaZI/qVf/koYH1WiGZW20lteRUtZZH5EwNbpV1w0
 x4XmO5W3j2+/YTH8VBXk2ydqooVkwdhE7zdWPV0BN7U7fydtVMV1e1JfgnwoJt9oMNhNkYOwcRn
 u5EomlSLple2y4xA0psyuVbJbv9QaxXPChTK/MfGxLbHMy0YmYE21Lz3V85nP4ISdbSkAV0qfbq
 Qn/XHJkyk5NkAE/CLstpylkoj483RJeLFzgGO/O8fY0cs25cc/b4HWbvcCemj1kjcxMLaPxDud5
 4IeoITJ3zyMfdOtg6Bw==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a46300a cx=c_pps
 a=F30aWN9Bm7kNfdI93JtEUg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=e96LkNGndUTIoZmP6FEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXxDbNTqcWTKyh
 kp7K5dIk5b/K88syikVp6aRwQHEHvIr/E65pxVVPCp5idbkfPEXXHi342DGkaIcxfGi/78d3b5U
 JQXw31K8FeA7q+rMurE/61lKL7BsOAU=
X-Proofpoint-GUID: jzJOGIl_HkDFkXCM84-6b2wrvM6UrmlR
X-Proofpoint-ORIG-GUID: jzJOGIl_HkDFkXCM84-6b2wrvM6UrmlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

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

