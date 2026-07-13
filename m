Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940143EA957
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942607; cv=fail; b=EqWPFZON97UwGF2BsdBpQ5YUgLrxLqONDSTYi4D7SrVd9WI6pQ2wlp7QjbQqUU+CfM6QtF2/F5ipUC1QwBRmR9ZHbxtpXGOaH/VxRhECoezyHWH0lIbea+A0mh3I1JBJ9zvdzhgx9myOZPnBLRHtGQNhTKG3VEkl5K5B3x4OJ6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942607; c=relaxed/simple;
	bh=covXvDhayatOf4t0KO9AdMEY3j7jvb8uf6gmh9dKp5g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hy+ROsGLiNakIbnjUlRQr1ZpiFCB9MwpKB0lkaUOUsYg08NH2VGVV/QmwQvvke8HYWEwI4yt2YH0QmOIP5nOez5WGP1smdQBhmH845P1+ko4yWzMSBc+/7VWhTOi2ry4aZun3xYumm5yuVfkN9di+9VD8SPmknY7M9LvdiB1SkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=huvmElWW; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LYrGcSg5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="huvmElWW";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LYrGcSg5"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBAcDb3381672;
	Mon, 13 Jul 2026 06:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=e6G3XsaSSMYOB5ecNhCRADhzqWdwdr0s7ey6KwqHL
	1E=; b=huvmElWW7svimkJ72vG44N9ZYFl+ywcNNNYlWZuRcXDYh57HFYKE5lhZo
	wZVTAv/te0L7CfKoeJMmlDTux22CMovyIPH05NJDQvWFXVHP7ozNQ4ooWNS9iZTp
	UQY68kOrt+4rdjwKbJcQRhXg21Iy5IkC+OE26NSgSUv/beHfWF+iV695NdtnFjzU
	BEDNdrI6i97oFbo95SVoqVNoQOPP8Io4aktqD3S9eMzr4UQC/eIXfVgfIu99Kkfg
	RGJQru4rWpBWKBdk9iQOZq/bhk2EkAmxHxXL0CY0EyZ0Q39dm5ir8k5jRKIJeqKh
	K6vIUU1eMhBAT0yOYyqVBZ4SbzAaw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtg3fs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j47Vjo1nUOe29DXgDfFfasAXtwYntb9GnXTH+g588CaTSSBAI7iSNe2ZJhORc39Nrm8u8n06qrxwO30q60Pf21PwJmDdgEAlsddX5OJ3NrrMi7FHjHtCsGefGH/K3NIAz9b63sqSe1Xkcds51kqTtElE7syWk/GNf3IPuBCbvnUain8T5Z9e/IaP8+e0Amk6LCGytC66+kzifCu1Qwkg+4GCUn3mCoOm4mtr0P25b+qWR6lMvW2n/PvUvx66f/xJwMRkw4IyqyRDP59M+B0HMSepw81cEAQYmptP6fD9CWJX/BPgX7OW3PVAu17kf5Rf5i0xnLdXht6uuqPpIH2mWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6G3XsaSSMYOB5ecNhCRADhzqWdwdr0s7ey6KwqHL1E=;
 b=umzTrVkamTXBsbeJ1H9xtYG5qvLp3XfJDoo+UPuF2l45wgrjGYPG/JF1UaWr2kGJGlTGtE6n0Wd0KgroIOnDeLOtefbmZ8NbjxtQgdfFyKY9k/ex0lXJ+SpHXRLkvw15nGiNnipRoFm/D0uD1RBmIymSEpOMg9UZp57302jYgQVX7XmGCs89M/BoOC/mvMq1Xxx8NvNXQcf8DfqiV2vMbvZdfP1uMfhllgjfn3LYPkUuMrDm4a65qBSHjaMpPJQsy+3yimhRFbkzR6fOd/o6kbEshgc+4LG2WYSmUFtFXorOVpeBoWkcBEHA1Ub//sL6Le1hVLXlqzbRqJBfKzdxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6G3XsaSSMYOB5ecNhCRADhzqWdwdr0s7ey6KwqHL1E=;
 b=LYrGcSg553a8KB9U8FrxtF2zBnFaS7ryE8EVa1Bzi42hkxOv+79pBhwepwtRdoeKneT8LxrSgR4s/fq04HjeImTsLcNykf27JKtnxOKT7B+deVTgB3ELL7fKId+koQWzmkyNxyHyefWC0Xc2yn4svczoc+PGhyFz3HyOzYiyb40=
Received: from BL1PR13CA0288.namprd13.prod.outlook.com (2603:10b6:208:2bc::23)
 by CO1PR10MB4722.namprd10.prod.outlook.com (2603:10b6:303:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:36:32 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::6c) by BL1PR13CA0288.outlook.office365.com
 (2603:10b6:208:2bc::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 11:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:36:30 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:30 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:36:29 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQM1471098;
	Mon, 13 Jul 2026 06:36:22 -0500
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
Subject: [PATCH v2 14/18] arm64: dts: ti: k3-j722s-evm: Add overlay for J7EXPA01EVM Fusion2
Date: Mon, 13 Jul 2026 17:04:19 +0530
Message-ID: <20260713113423.2310443-15-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|CO1PR10MB4722:EE_
X-MS-Office365-Filtering-Correlation-Id: d9542390-eaae-4a5f-87c2-08dee0d2fbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|13003099007|6133799003|56012099006|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kqgYRg2bC+pm/5XB1x7fY1kBl8GUEYlkknsOSE2Y287D/lU11MLaAcXrZRUakvAm20VT9hIH9kuEQ+JMZVOjUg00HNwHginZ90uv2hR9v/EPGFQIO3+TDKcvRHkJbFz7t+k2zlmBm2/Viqu4AxPFS1r8jkwnzBz8bATT7K8xdIOmrorHUSF7zEMFeUUc9164g2hs/GvZsgdW2lukG8vj31rI9P5eslQhtzDxxDahZU5xz/r7W02xYMIh3z6M3l9ddpiYwzw7acld6Dpv57G38JO8WxAS9Nd6jiPl4CaGgidDTm8QLyXChpy736eLn8Z1DUGAhz0+l86+f879364hjrM25w+cdBVOJfsFl2A+DKU46cAiiP80y5HYkhEJjrFLD4s77ZhoVvpeHFIRGIoI2/qBBWtbvKID0YYh99c/lz+7bMZfu22arljIXDQ2yVIT133kc0bkl4fpCoFAbiImfKNbd+mB0D0SpQaFQCLoyqcW9TY136vipQoa5ZGsqv/sBCjdHFHL/qapamkWU82G7n4k2UZax0BzXCr2yawOWuTI+8WOH7l4YD11+jeJt17h1r32NY3hhzjdlGp4J0BgWN4gJPCuuJb4TjUgHLWX59zq/4EIp1aULICUmiGPvuFRgA02znR9j6+9Pg2dIGAd1A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(13003099007)(6133799003)(56012099006)(5023799004)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4ZOBFzbxetJkOaJqekm9n//kyRxyn4bUc5njWwWZs04ma83DG78PoCDAivagdTSd4h76RZYhsyVrN7t6Vba+fuZXEKzPtLmhPWnXbDtnUt8L07hfe9lJJCjq9KvYUTw9iR7lT2mOKRJreXvIYMaLTR/blYuu90ETG5xjIyo6cegnJ1HYdQ0WpQeX5Y3azga+g4cHLoFv4EtozDuj/DXndnX08x8MAJ4phVLDpwvWFeKa+ojUfg4LxZYG4gWrydLd2myeANCaAVeFCVLm2FvkBIAg0J98X9E0P83YKyrpDCCKACR0C5zZgu2DNnFd5x9lzORiDlfQizSPGA6z20DZ2/Bfxvznt7Depau+MwcCGMEQ8GvxuZ3gC2DyNts+RuFClj8/DSpiGhr3rzymHuWTzXj8/V537yy51FXjAAgglx/72SgCekz0WhV9jaRKdZoU
X-Exchange-RoutingPolicyChecked:
	Wi8QYNs2iMH57SnC8QZsV8ywF5NjQrqzEz0L4b9UN3WFM6iD1mgd+z24k06zBT5sct5BjDwS8Ho7Ie7wlTT3mMpJZAl/NtXUZMzQidOAGySk/ze36QLXHjcdvqpe8psMJHsr2WUKf6wfpMMiaha/j+CsRUXXHJkAAQkD+QFncQXl8WLWkG0B8MW3Sur7twFdLaZzMXvJUCLoVCL1SQEhWB83gJOUxiee6qoY3+7FLHcNG4kp4c+ytdVBKL/sMNl/2fw7L/43uJ9K9+N9giLpIjdO+XDNl+5QFiP1vs23WryeVd37OHWuybCU58pvZTEG2TbVsTPDbOnH/LrVHejA9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:36:30.4494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9542390-eaae-4a5f-87c2-08dee0d2fbd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4722
X-Proofpoint-ORIG-GUID: NbPHkMbh_b1GNFmK5gSGG1aEIrN5ciUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX7cQpZF6Xjl+o
 eXL2SDudC2yXcyZXEhJrzQE22rispNwF/EbpsgqCo9uvTBghYTo2jvdBQPJW5GqAGYX7Whr1Q29
 /bAvM1QdWgGlOLtjSdeWfQiWKZm5fIijd1rSQ36Bi59gLDZ8CTZ4prcDfl9lUE1n3wTn9iiflXj
 eS128HWFG7yCyrS2dcUxc9D/zXP7UgHy7aVSDCBkbiPF3KwwbwEPIJ4GNu+Z9hfVg3S8NMeGqiU
 V/ODbva+/1KkxXK8STwKJDpydTW6M4ivbIzyq0AOleRXtgf844H8V17PcrnjQ1DIDlAM2qNy8V8
 sIRFiVkuHgAWiB/dMzPE3FnkRF+Ktlebb9YTZpvwT+iI7vvZikd1pr20CErvSZG0g1poCi12Z9Z
 9EG0w8k1GpKb+JHP9y0LZfGrCU1bkwYHDkkMNmNZUNtSCDQ8Z8x1c9lhMT3TMQ1eY8RTp9Cz7Gc
 Y6jD3yhwkYVrRuYOhRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX5Ylmpo20cYcR
 2MFOc6BdBwuJJJWQfuCrdNptNzlTvDeCiPh6L1sBp6GhiiRYJRjBk03eEfcN0aUArjbXcUwL3Cc
 9ZkL2hk0+NLyf+lzS6mEvTTVoqQPmzs=
X-Proofpoint-GUID: NbPHkMbh_b1GNFmK5gSGG1aEIrN5ciUe
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a54cdc3 cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=-ataLAZeJnTW1ooz-NYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130121

J7EXPA01EVM Fusion2 serial capture expansion board features 3 UB9702
deserializers, each capable of aggregating  data from up to 4x cameras
over the FPDLink-IV interface. Add support for the same on J722S-EVM.

EVM schematics and design files : https://www.ti.com/tool/J7EXPA01EVM

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add missing bus-type property in csi2_phy endpoints (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-j722s-evm-fpdlink-iv-fusion.dtso    | 299 ++++++++++++++++++
 2 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 2dc4f9043258..6b1e15855b97 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -193,6 +193,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-iv-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-v3link-fusion.dtbo
 
 # Boards with J784s4 SoC
@@ -353,6 +354,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtbo
+k3-j722s-evm-fpdlink-iv-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-fpdlink-iv-fusion.dtbo
 k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
@@ -442,6 +445,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
+	k3-j722s-evm-fpdlink-iv-fusion.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
new file mode 100644
index 000000000000..ed8fdfa65005
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
@@ -0,0 +1,299 @@
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
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
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
+				port@5 {
+					reg = <5>;
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
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
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
+				port@5 {
+					reg = <5>;
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
+				remote-endpoint = <&ds90ub970_1_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY. */
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

