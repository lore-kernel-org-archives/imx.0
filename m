Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF585480DDB
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984853; cv=fail; b=HCUjAQeHfD7MTiGeB4JwDYcThuETcHjyE3l4plzJFuiHrNPQiUpKWbCCEwUXK+KUgpgvnSPeA5K9k//MLlrrJupyl3z+9Jrhs8PfajheV5fMnnD9Paynq6HzwojhZ84wrZGCMiv0Q5Plnw5ET6Uv0heKpoFgYxJo4sk0OMe3rCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984853; c=relaxed/simple;
	bh=dA4Imh3ZwUrd64T5CFMCtZwutXsdxDqsMOsTI4fpf88=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qRkSgaIk8L/lqweuOC+dV552/HpYREW/k2mJIcEGsO1hMZ1zmkBFDqj3uka3oxxB3z0CqPaDUqlTnjUowKyXFVBPaCqfp4ty6QMIQDKVtKietzA1bkreZlKIG9mifkUGRy2ueKWzufKJ1JPltcMkoNBChKw0pYmjCxz/xm33gVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OnN8jAof; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jh4z2A3I; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OnN8jAof";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jh4z2A3I"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628946v1285453;
	Thu, 2 Jul 2026 04:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iOFClDEXH1R4Y82PmmVoqfG/Hd3QSRchtbJzeZR/C
	hU=; b=OnN8jAofnN42E+jNZP8lUuIO4Dfk4ILK2JxRfsMjVPKX27zWxKUYKE5zx
	O4cyE20MqFB3bp51fMQ5kGzTVkuC3/p2YlJRqhus6gRO+nVB1fGQlaIUgh0OmLRS
	XpDaAGNrHH8c4kbiNidkKBG8HguYPGSNecBWoXt3msErV5beyWcocbTahgV3W+IB
	VlZ9wxVw7nawaf2D6Git0+7ZpUZgHLHLd8iso64eDP0ty+sZW8WSmdqNHk1JcF5F
	hJLCGXVGoKqQcmJnvJOx7JvnXyFjtt3ekkdi8uIMqmjdSu8KOVAo1tCeNQVX7gQJ
	sFSpW21xfPrNcAk70GnNhZjFc6kMQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvyhtfr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:33:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfJ0l8QZjJXqYwjlPgbAcyw4PjEHVh8Qo302jTL+ZNd8/dAEifUC4uRcfFCvjM3NuWrbaonRzEJZDLx2rqGseBpAO6xGnnt5JizdWFIbpPXrK5thSDAEwGPG0jNgjN7VIJ8zEPXErpdD25YTIkVoFCXn1e+qcjq74yHC16cwlyh6FUdDhjDeEK3PyOMVEQ+5g+gHWz3G8VCTMDKpO+AGaJ/lsqBcz3Rpa5Wkew853ae4+x1CitvPv5tNu9eNBIuGkIK3lFV6dGFB2cli5sCiirIGFPa9tFd4Wo+lG46wkzqTvzKMjlEGCCZFOFXO6178NJae4lE2LohsEk1lodbRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOFClDEXH1R4Y82PmmVoqfG/Hd3QSRchtbJzeZR/ChU=;
 b=dOSSErsopy8HnSMkDQcAY8YXXKyjAfP330DaZJYXv3rcQv/ZloorkgZg+xTrXJG8LNNc7PUSDYJZMVaX5isChl40VLyL4SbqYUZox+4UA/nvnXJQXfe8nnKWG/6m9xz/A4TOb2TTgvikbXyNMx0EhcB1dNgLQax8/s8O/4dhGGzW7ffvl+bCAxz9FIJAk4j4fD/MX/YezAn7fB6FoBG1kzp8jUv+cpUi2uoSHkiR8tEFCuvfPw0Sm6dbE+dLSY7iysQHV/6xSiuDgdKRNJBp0zntDWoy6NXSfz9DOUAURZE9ib7AquQDggT/M7vU0vnuG0mqbOGE5rbn9YJjiSnCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOFClDEXH1R4Y82PmmVoqfG/Hd3QSRchtbJzeZR/ChU=;
 b=jh4z2A3IHL2AAtY6B/rZgenCrgyhItbW6e7E1ZptSXhXX7SSF8Hp1OuGpRZremi9J7Do8f5QlFEVONRifWWzBxbc73yKCJQQbs6hXcVr3MocVlQesQ7WlxrQzTYR/8JOQuVFor/WdrtxZD5oCxgO0sgt1Ap5a4nykKnT0/DPTRA=
Received: from SJ2P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::17)
 by PH3PPF34C504C55.namprd10.prod.outlook.com (2603:10b6:518:1::793) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:33:45 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::83) by SJ2P220CA0005.outlook.office365.com
 (2603:10b6:a03:5da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:33:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:33:45 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:20 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:33:20 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb53611021;
	Thu, 2 Jul 2026 04:33:13 -0500
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
Subject: [PATCH 12/18] arm64: dts: ti: k3-j722s-evm: Add overlay for dual Arducam V3link fusion
Date: Thu, 2 Jul 2026 15:01:17 +0530
Message-ID: <20260702093123.1048575-13-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|PH3PPF34C504C55:EE_
X-MS-Office365-Filtering-Correlation-Id: f7456ab0-8ecc-42d7-a853-08ded81d032b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|18002099003|22082099003|13003099007|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	KwvCeVpnxAz+uCKBxCDWhu7G3lFLiwrEujWlcX8EBzhIEKROBuu8Cf4WcbgLGABQmMNUi8qQc8rQM7NXlJop/k9ZkwfCTuSkGgioR57kHV/3o9yrPFrofUDNVBRSI5iUvkUrTSFqT1PY3nIkTk3UNt8iNEpZWeD8EGA0cPOnbOb+IA6XfRwDeGB9vNzqtG9y0WL8ZGlU/wOPkX+rVfhwWUwX+/XZ3+/lnDPRHs3eVA4iKDmGF1tu+HsyKEByrAODyMu9RtwrzyZjUiz4QQfOvLeq63wZPrJN3CUSBSIkABeD1EBqNSQoTdc2G7jPUIYZ0Sw8i/uG+5R8Cxmwy1ihSx/WI6HyAnXJ5tmg04HFHCVPzwGJlYyrmL7zzGVHMcBqd5FGNCJs7XyxqD34Q/gC6KwXEziGxVpbgBrjPdQc0JTOogJ5gJk7a6miRkzu2/fJg9gjmAhk9OxnVa21c5x+qih+k1P1hCwGbzggmRyCblwqbVH4fLwVzyDn4wuYID+yyg7OD93DnDdDBY4+EbmM8odZfD1WyCkhksjaZph0aJLAjrxkxxIVBNE0LneFLagTpFByP4RjGfS3oGD3fgYF2VmAlO9fPbsP82eBvcmTBHV8bzG6K8ZIaYVJmzuBczg0MtBS2BCst00dHd83ylXSJQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(13003099007)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y66n3VmEV7VdxcS4OIlHd2pV+83GkzUTLwsBvfHAEBRpm0URRPhIw0kr9QLws3uUnDvW8dCFb0UmovVaQifz3EEm4nG9Tk9YSGweCU+BL3UZPLrpWdU7fk9JIcLhpgvvAUjV6ySylnupS8ocbPkEvJjkv8sr+IcxCsqRg00hIRIwQ5QYD6mWFPW0sYoCxAMErGeGElsH6Nm1+weNcASsdgrvHmE1Ovzj7ShHRoIxtwxbDD50tYvFpVm7wiVhQ5C0w05YxYGLyea2eyfZ6vOVkJBYwqDqhGn6CxVzx5qpsQP9hiKbVrVKYEkFEBajq5prUVpDYopAjJPTjG55krDl8N5/eOdhOIh2T2RyUFFZlqrU0YK2pMH6SgjJBABnYgWoD+7n0gUSdjUUtnputIo/q7gMRITjujxrr/ctELSF/MCBNfizA24U4oEMWqa/kFoc
X-Exchange-RoutingPolicyChecked:
	mLwa8Tq3jNylQ1imEIoqJT0Jg8Vzss6wECslimymYYgfoEICa0lQ2r1VPLjEOx59jJJ8OiN5vJC41CI/mk7GZEvOGPnOrBgCTZLWRU8vTa/7SJzwHVvmvW3gwMVGX13ffe+FG+5Bfd0nYlpueYspGy7Aey/Yc6Y5ZnYvCCV5zjOdjst0vmKXY8zEssRvrJ8hWX0mtuC2/jhp2VHPLKRQ7rjuKujQst7lyDk8s7UIPcAVXyTlbLaZa24gpsfS9uyA4Not1P2+nigFtKXuU4YX1czDULNA+GWUma7NFPOHQmEcDAoHYSSBnlvn/9VA/i3jHvcnRQCPiQNhF3wt4OHZ+Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:33:45.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7456ab0-8ecc-42d7-a853-08ded81d032b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF34C504C55
X-Proofpoint-ORIG-GUID: C3L2YnC19PGDTJdBfx8AbvJ74p4Jsc0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX4PMzS7QoVRHL
 TqbPpwDVYMiqorA0/5xCm6tiguJ2R3vPgVFule++He4kBTUrhpsZpcxEESYNu/AANzIDQT3JWUP
 HVLaLxntr4puixqAG9OTMBm64o0JQZPGUcScJh8jO0DkM40OMOSugJRSu5lNI15AzSBubIUJKTt
 jr3SY63EE3bdtVC43JBcMSDkUUtnm7m0fYb94tgu9OroIpAs/wMi1cSp4NPF1Tn54NtTmWovCCa
 w1rxecefjYKX/d9mUYvcuwuKlmDfMlGpJavMaTsnZFWApKkLaoGWzs+YpV1azeuw38jrijmHDiS
 NHTW/YxzhuINI3CEaVq/XpJlEuNrzDUA+inpMcibSi7vpAE+urFdIMQT98SvfDFp4fvep8yskuP
 QDKsuo0kWAWZGp9Qu8JK3rVbzgmNeZAiPQS2f764oLT6ly3/LHeV2f61TMl2LM8ReFCWct4VTTm
 tBJeUtbJXYdBswIoakQ==
X-Proofpoint-GUID: C3L2YnC19PGDTJdBfx8AbvJ74p4Jsc0y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXzVrVFHxoMOAi
 dkKVc1tmA4/3twqGqf0lOOi1xvLiv6B9Um5HRkc7nHwTW2Zm3b2BoApigFL4JZZiNdmHGH7C9qS
 VOlmiXW3EeK9fSZH6r+Hc0x/PwY8mpQ=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a463081 cx=c_pps
 a=5RlqQmsqPSmFSsyCuDtDZA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8 a=-FmVnSUr7buL2lXpRBQA:9
 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

Arducam's V3Link mini fusion board [1] has a single DS90UB960
deserializer which can aggregate input from up to 4x V3Link (and
FPD-Link III) based cameras over a single 22-pin FFC (4-lane) CSI-2
connector. Add an overlay supporting two such boards, each connected to
one of the two CSI RX inputs on J722S.

[1] https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.pdf

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-j722s-evm-v3link-fusion.dtso    | 213 ++++++++++++++++++
 2 files changed, 217 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b14c9a8c94b9..0741f9c16034 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -175,6 +175,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-v3link-fusion.dtbo
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
@@ -311,6 +312,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtbo
+k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
@@ -385,6 +388,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
+	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
new file mode 100644
index 000000000000..c5baf35c0ac6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Arducam V3Link UC-A09 board
+ * https://www.arducam.com/fpd-link-3-cameras/
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
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
+&csi01_mux {
+	idle-state = <1>;
+};
+
+&csi23_mux {
+	idle-state = <1>;
+};
+
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* CAM0 I2C */
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		deser@30 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x30>;
+
+			clock-names = "refclk";
+			clocks = <&clk_fusion_25M_fixed>;
+
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			deserializer_0_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0{
+				reg= <0>;
+				status = "disabled";
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
+					ds90ub960_0_csi_out: endpoint {
+						data-lanes = <1 2 3 4>;
+						clock-lanes = <0>;
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
+	};
+
+	/* CAM1 I2C */
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		deser@30 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x30>;
+
+			clock-names = "refclk";
+			clocks = <&clk_fusion_25M_fixed>;
+
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			deserializer_1_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0{
+				reg= <0>;
+				status = "disabled";
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
+					ds90ub960_1_csi_out: endpoint {
+						data-lanes = <1 2 3 4>;
+						clock-lanes = <0>;
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

