Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1547CC81
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984819; cv=fail; b=gqYMcV2dKBVsJ6bvtH+pgIwjrN09qQW1ehsQDrMzqNK+8xonNcBKD7D71cTjpcTypm6p3MkQzhAUB+f4dM3whN2XQbppNNrKmUrr2+mtaLfsdP2q8BCl8t4chKaMRRvAzChdVekWTTXwvh0VIjbnkgLZppvKfN1g0bKqPeermv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984819; c=relaxed/simple;
	bh=eW8G3ZoKa1TRtepxYXoXfGDbS5FsmcsaFLr3T2nGwSs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kfZc7IquMQfKh5Gyp/rFHwjGnU98Ke6ObIWuwh75Q91dIpY0I+op+XDRYRrZHxPBIzY1EBR6bTNml0N5eljlTaAI/9oORJyWufF2SmxarooK5hE5zDSjex2EYtyZQyJlukag0GlwG/MnT8v4NA/18HuGAY03M07Dw8Gt+fHSsKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fTL5++DL; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Pl47fUx0; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fTL5++DL";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pl47fUx0"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628cq6t1285399;
	Thu, 2 Jul 2026 04:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QsEGcJUkcERFucWpPa4rVp8lL2pWH5gVAn0/q28Rl
	mQ=; b=fTL5++DL5EDRJoIqExDFdcnw9eTuGpVa4sU74pd+YpTa9ZujBh0fCeQZy
	U7Lwg18cyjgwUrqgMO1b/wWSXSEoptxPYP+5itxdJ9Msb02lO4WgUkYyFVcH5S6X
	L+eZ9EvYTxkBMgKzeu3bAoKVm2LCDJLkEJWtoEYZTfBilSNO8nsE9v1yGf79TECY
	MQ76NSatR+O/wD0DlWZ987awV7lk/Y2QZkf/sVlgeAIjp50/76q3MOfWAtFTEU3P
	RFOycMa2+HzwRsyI/o5M0GiRl67wC2t/SbCLMQNTVlmHBd0uCwhTR9uSROxVSegi
	IZEj0wNqDr3xpIK/7MI4rNcxbKFmQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvyhtdg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:33:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMOoxjhxvqNHZ6tOX37WUav37L2H74wOY1nGoLdZo6mcTxMs3GKftSS8axb2MM3GXb2JgRg1+g+hS8m3G4/vlFIr5KAOsp/3ESiH5BAWzTc2tWJhlBAsmc7KVegMm845VQ8OzRR1B1x1mx6rMjs8a6JAkAR6sOqjw4w3q8/2nP2VLtP4vyMJcUXH39bSyQnvAECqfI8TZmGVrlrQtW/FubzhcU5bzNvXOYNjgUth6o+ISpzNvNFdaYuI2+5H9ycKeNteF8mxEd936QlfYf+24kxjxCKLTDswVeakyuEdJMMMGLKpIIeYtqy4aIQIuFvfk2kQ/19UPE1/ccoNnWQ0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsEGcJUkcERFucWpPa4rVp8lL2pWH5gVAn0/q28RlmQ=;
 b=r7QIFZUAsalVx3nUYPvKpN5G5h+9JVRTOvAGrC+j7I+3U/6ynoF+tCWo8Ne13dVYvTPCyD6PmIWEDMZdeLwUQTMM7A49WZ/0dciocGGRle/r14vaq9Y7kh6UrZPzkaipzgLstwncLHcrPD32dh0IW+7L/8UCZcJVwP5YcC7+v+M8ybEppWVZgtyb6CX41UliqD5sSM4q9GM2eEf0sCGuPYO/mQoo7+Wmm8ne+vNvk0Hcgjs7V5RzXnYdOEwjEjFhODONOF7F74p2jFK1rkppoTj5i1CXWNQhHphDpWIncdnuOWFrwe0n+n6shc0vAD1jfqUDGU0SiWhMHEaF3m9Peg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsEGcJUkcERFucWpPa4rVp8lL2pWH5gVAn0/q28RlmQ=;
 b=Pl47fUx0iuUA6vSl+HlFIW1Y4LdJ/Xhezdr6pKAD6w5KmNr5rl8Y5Gn3BMYktVExR+oaX4eHclgGFRgbgFnOpEvzT8saaZhllcmCpM7IGEGvOFTbIZi+jlxkn7EuBX7qyD9KJO3izwb7vKiER/FG/sGDXOuuLWc8Ola+eoCrTfE=
Received: from BY3PR10CA0026.namprd10.prod.outlook.com (2603:10b6:a03:255::31)
 by IA3PR10MB8614.namprd10.prod.outlook.com (2603:10b6:208:57f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:33:16 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::55) by BY3PR10CA0026.outlook.office365.com
 (2603:10b6:a03:255::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:33:15 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:12 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:33:11 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb43611021;
	Thu, 2 Jul 2026 04:33:05 -0500
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
Subject: [PATCH 11/18] arm64: dts: ti: k3-am68-sk: Add overlay for dual Arducam V3link fusion
Date: Thu, 2 Jul 2026 15:01:16 +0530
Message-ID: <20260702093123.1048575-12-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|IA3PR10MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: dddacf96-0c02-415a-8c6f-08ded81cf196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|1800799024|36860700016|13003099007|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CeRFFAM8WMV3gVxBT3dSW9hrl+rgOYXBZAcor8iERbN9QAIujaGQzvNKkTnNHDg5fQoQVRq01octQbaCym3m3lznYaEw0ai9aWVOx7yY/NoqEnaSQnSehKAdYNAs3LDahbNAucR/Eq8QgKfFJzI8/WPEe1ZIP9CYRgfeJD9fSDMeBiz+BBvTx4wvZiTkf9DJGOR+W/WGoYRQ0ILVJPMTkGB6TIOakVzjoI3XwJWbdN1YHL1AYZ5T5n7p1MLVOzHlxB9VxADn2TPqB0Q1obC1KwaH7/2hbt910K9v60mWwLxB7xHsfUpmoawAveEB3X0xt4BUvLehuo0COJ+Um3FHSkK+6vLFaBSg0mut4ICtYK/bHG6SGiGaNkto8ceCXnBF3seh2/gGp2fUWUuyqkwX7n7b1N+Vm1Pn+j7C7tBqwozCiPCGH0yap5XuTWEnzqsetZoQP5rXokPrvF1NSIMWqDEIFMFc/meYEM/a7exvXEm4S8kOKM4g1mj03pAQENoe83UkMymXiWQJkR2GEzlJwl6t74d1DbIJoAkFF0UCqAA2bkfCLPXvDF8MSU05fIfLNNuIegUDE9E514LnOZu05Hcn7D+dW26Gr8aTNjdwa04yfRFNBL2OvtSduGW5NMDoRao/katuh7XRQD2wdMOjNw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(13003099007)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TcE6CD6Pl7rWS2S3DyIwul1MYsl8Z3z+ngxsewct5VDOeySsU8A6Nq8iBSKIFrfULcZcdHseiz4Gr5aSQ1h09DIm4x7Ecdh3q3Zi+fGdQRdEQh/vQ+adjtjE7SAaOQ48BK7CdhedDNqOCnp4SwJ2cLruAW4rjngV7FKedzzI1bx91t++71OkKV5203vfa5lqwQnOgMKKpeDXS7NyrYxiJpe3NIUoIZKpz6WBRktDEOkCfhHQSGslZNWArGxk+GEBFHgHk+PKnmZcWPoRjyQA6RcL5X0EQ/4IlvHr5y4VY1n9hYreyq+QOzAtZ0qTzm2bRE0NtcnJ++Ek8pUbzBEAfz12J6fTRloWlvEVwf/cBn0djr1qpuYcBlYh3ZOX+quS/tg8DuLW4jDPgkDwWlGDNgIQGiq1crO3TQwffFlcG2CTUQMf6dq3Oe6xAT+HfbX0
X-Exchange-RoutingPolicyChecked:
	JKx0dsG/FKdrX3bc2J8pB8UjYGmzji7EazNkDwmZdVtd7U2QBwzbcEPmA08M/+DctRX1gf7soXHcHEOyw/YRtBmV1YHf+O+Zc8eMxD5AezUXwMcvLJjQwVvkn17hBfCdpsiSqPpeKrlsrJkon+WIthkipZ0ifFtNVmj2HwhDE/v0WaX2Ey7R3JOguyfSgm5fWfsEyn9UIO2GpElAfX1dVhZPb0WRB2LfM2wGEyGwBU0oFQ9vT4o2NMdhGt5R3N23XAm3luP1gpP36NP+rq71NyvpXsY6ifuwAAdXUp5/Kh7qlWV6zYeRlH0pMJbozwnVaQVhlsP7kkMFY/fcTYqnpw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:33:15.5808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dddacf96-0c02-415a-8c6f-08ded81cf196
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8614
X-Proofpoint-ORIG-GUID: kybzQ6IfasNtrEq2d-bdYsyZYmqdeP_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX6FGKeJmcaNvZ
 +YUUYeqD3ASjPGY1dc6PxFmJ7kECpp0tQELi/EY2t47CSUY6dqXtwZvK3ZRakOlNVQazAKjGpkA
 4CAY02AwQG0YK5aGsaDdJ5grsS2LMpKvGLclP4VgnSnj/olU6jve1FZctO6G18KeMCUxnxBP+ge
 4pNMsphoCkJZsHNQ1VkDbuqxBt/JmpvzalXZhtzw4podeubQZDNUZLbheu0BHkc+QH2tgi6S1qa
 2C36i9OaEVUNiSKWEhl4zaC4/GiS4THTQoyeCaOvsSC2OAhbdVax+i+I2XwckDDkiM18p/q1grj
 SzO9dxOkXA5nFPRia8ZphFmcy/22l5vfOGuLXp/s/zk4I4HQR32tfFhoncYKC+69+fuZ5CnP3a0
 54IhqVvIlbgYm+hgm7EcMQpqdxqfzWgt7F69eBUil8UwSmn0fSRnjtaQkXlexddR3rMVmHp+QPq
 aYG0DrePP6N5EM9S68w==
X-Proofpoint-GUID: kybzQ6IfasNtrEq2d-bdYsyZYmqdeP_2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2GIL8f3p8PhE
 6FhbGUCwyK++R/ruVmQ2xHsNnUk2zLSVaG+uT+NY9RDmgJI2VeCtbUK4o2pUVjFXSTZ38yGdLNO
 1pDKvthuqStRnMxP7+laVXeLBzPbp6c=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a463060 cx=c_pps
 a=VQ1tsm+IcWX+DCGDUvrerQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8
 a=iomoXT1V-VCqHUgW514A:9 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

Arducam's V3Link mini fusion board [1] has a single DS90UB960
deserializer which can aggregate input from up to 4x V3Link (and
FPD-Link III) based cameras over a single 22-pin FFC (4-lane) CSI-2
connector. Add an overlay supporting two such boards, each connected to
one of the two CSI RX inputs on AM68-SK.

The same overlay can be reused on AM69-SK and J721E-SK.

[1] https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.pdf

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../boot/dts/ti/k3-am68-sk-v3link-fusion.dtso | 204 ++++++++++++++++++
 2 files changed, 214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index cb16eb9039aa..b14c9a8c94b9 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -160,6 +160,7 @@ k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
         k3-am68-phyboard-izar-peb-av-15.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-v3link-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
@@ -272,12 +273,16 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
 k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
+k3-am68-sk-v3link-fusion-dtbs := k3-am68-sk-base-board.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
+k3-am69-sk-v3link-fusion-dtbs := k3-am69-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
@@ -292,6 +297,8 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
+k3-j721e-sk-v3link-fusion-dtbs := k3-j721e-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -359,9 +366,11 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am68-sk-fpdlink-fusion.dtb \
+	k3-am68-sk-v3link-fusion.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
+	k3-am69-sk-v3link-fusion.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
@@ -369,6 +378,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
+	k3-j721e-sk-v3link-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso b/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
new file mode 100644
index 000000000000..cfbf59c45782
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Arducam V3Link UC-A09 board
+ * https://www.arducam.com/fpd-link-3-cameras/
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
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
+&csi_mux {
+	idle-state = <1>;
+};
+
+&cam0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@30 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x30>;
+
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25M_fixed>;
+
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
+				ds90ub960_0_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
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
+&cam1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@30 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x30>;
+
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25M_fixed>;
+
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
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
+				ds90ub960_1_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
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

