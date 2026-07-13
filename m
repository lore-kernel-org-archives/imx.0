Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0C3E5A2B
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942624; cv=fail; b=IMDlFcUHE3IwUIjd3gN7IHN9Q/GX/5Nv6BTAiBAzbwxOwUI8o8UIezXyOlHp5PHOqitS8eD4e25UPv0FeR6ksXLcQLrR8nDGWupu7XI3o36vuphCXQUk+rdihHo/8hw9yMT3S30WowvUFfaIjLfXiaJl84YNOxHTsNMwg9cRMxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942624; c=relaxed/simple;
	bh=Z1wZFk8JtVP6O58IG03i32xRuyzT3VQDqJvuH7GYRAA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NOTE0vVQEpPetVcaT0v2FcmMRk4GYofHuf8YfkMO7B+G4IQmpP8fIHR5a2xH9w71tmLNNdQIMyRXdVpUKEhOQGvSA87rq4iIxaq1hh1qNev1TNbGc3G5eyx5OymouYV+3ujGqI/g+NdAoRa2SkVLw2WwxxsklvRab6B4ppLuNmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CD34dlwK; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dz31k+iE; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CD34dlwK";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dz31k+iE"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBCA7C3408071;
	Mon, 13 Jul 2026 06:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=imbnJFHyQV4O8j4EygcYNLRbc2FIC3Nj6ryCkzTtj
	oY=; b=CD34dlwKweNYGz4XyCKxAXFgovH6RJkxoTZCiIv2/QVuraG4s9bXaVk+B
	ErtqLUnJ6I/8DhxqRp8r55dSrdFiyhp6dXKVcb7tkEqEDvMumgDl2bA+w+f5rT43
	apEA4/U0yAgIHpIEJhhCFFqCqsmZGRUNUv5X+/6i55HTDQDKzH9ivUbsot8iy85G
	LPikq04336RwoGTfRDS6C9XObySSNXNhNUH/cBmHM1g2bfu0OGmYWcgUSzqlumS9
	OeONsZUx5WqCqL+jvROaOXT8CxGhENXr7Pn56ShrKCuTHfbKubpK28RcW8izmbK1
	UkQJwpOQazgdQ17Gc/VE2R+GGwV/w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fcxxeg3f0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsYXjxl2StNLeLbXF4IpbojTbWY4k+tHYV0NUcapBLoXa3Df3WSP4IMR3vhmdYgnMHLhgHdiJ0rlfom2p/f4tOLKwhLveKN6oPyawgH0+m3aw58hGtUUxBQRWnZiWAqADAxzzZmmcb1iUNUOzcldGvtklpT/xsV2CNMXeXvEwVRbocF6W5/k+IElVCIydJ+X03fYMrg+mVZEI89Xbc2ZXyqCkWq/tbg0iW/iDFs9FoKwvlBujnFYg0Z2H7lm+DOZeIOS2RyAFkCIz9Itp9R1/weY5Alrw6ePsuDX1axWgGvghEySMgaXZCfy+8Xjm3neJjAHXcUMeV0c04XvORGGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imbnJFHyQV4O8j4EygcYNLRbc2FIC3Nj6ryCkzTtjoY=;
 b=SGiTpkqBwMSdedJtkOVGA1kxO2IsaIvfREX4M0Sl/hWMPVZSgSrEBnzS91Rp+Zi0vxyB66SdPGIfJ3qr3EVl8UqGHGig3XY2LdNvzZB8tWVf9mzU3yCliUXSyDTazb2e/begtsOHcmATAfpWbWsu/6n7NKBCMJzONEewZQCqpVHTIK2I5gOgKvuYmU+MBRdBzxA3FTXBEuGE/YgXmeJ7/MoWS2/UN56cb6WK23/3WqoGA79C6a5Oxypz54WkM45LK97WNlg0Jx5ebfWvE/1PN1vD9N8TkvKdpuakIkLUAiL3l6Yyic/wBEgeUZ4Zmb1ISTEREChcZlv2NihhTNaBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imbnJFHyQV4O8j4EygcYNLRbc2FIC3Nj6ryCkzTtjoY=;
 b=dz31k+iEi/T1aTLimakp4q00rcEQcOQgYgTG5wRWCvAyvGcdRto9YsY+fqgy5fHHxqI8l6v7c9Gdp2HtNhe7fOTXZROyc4tCklH+efmJ6evskFj2Tveim93pfeF0rTphpqrN9sJJ15SU7y9oNfKfg3VlhOfNf7XP/yh/T9KvJ2k=
Received: from BL1PR13CA0106.namprd13.prod.outlook.com (2603:10b6:208:2b9::21)
 by BLAPR10MB5043.namprd10.prod.outlook.com (2603:10b6:208:332::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:36:49 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::52) by BL1PR13CA0106.outlook.office365.com
 (2603:10b6:208:2b9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 11:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:36:47 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:46 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:36:46 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQO1471098;
	Mon, 13 Jul 2026 06:36:39 -0500
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
Subject: [PATCH v2 16/18] arm64: dts: ti: k3-j721e: Add overlay for DS90UB954-Q1EVM
Date: Mon, 13 Jul 2026 17:04:21 +0530
Message-ID: <20260713113423.2310443-17-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|BLAPR10MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: d2eb8d06-6958-4b04-6b35-08dee0d305ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|7416014|36860700016|22082099003|18002099003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	om3YLQS5p3nN8SldXcACEVbilkmc9sm3V4Z6/lOiNoUqvnf8GlJmGm+2OZWL17vkW1Mlh1S/bHaz7c7pwetl97NiOpcsX7dpajUhYPIB+xIyFaHD6ZnwGyWygqNYtOrtlnCtDdf9bYXuzQyfmX57bGN35+s3Hx3pa4B3rBF2aO3iMySHrhP9FwRog4Bxl1GJHKNMSg3pJhphCn4qUlxGa263muiQPm7bTKqMf1dPt5bitpLhplT+evsirUEhjJ2lz4mkefUH+Xd6IwC0ji/3Ask0IuwO/j1InHl9G1sAyhAF7tnOQ+noQB8eTwlJObq3MtCGEVA7eXuI4fRgYrpzPLq7hcbpakN2z6LG5vkv2Dk65FHiW5JP2IoyEFXwwoqz38UfClkj6sJ31mf2BYCazuapNuVNIDhskKUzkfYxmNtYaLD4LDXILzOMB62IWCnMDltlewZgOYUVEs8dUpFk+ODzKyyjd5YU8/5pssf4VwNWswRvrSPkeQoBz6VXZ/2jP9BThc5jHnDgt5TvYQo8ixDiZge67EfjrM1zmOlihyFlbt/BAHabCG3UUQAiAXzvwk1vk1Gc7FjRagQ8uc/KikES9xXnWI0K09cGw7b/AzDXoWb7T4sS/aU90+Tz3YpR5tE6WUH066cVcIQTLDOI1w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(7416014)(36860700016)(22082099003)(18002099003)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+F4tjgewBcK1zxkbRbAVWEUPg9HG2WofEry+DzeUsNpTZcG+Y2bIepJql2bPX1w++MXclKtRXoY0/ovK4aEMzWp7fw3PV0PBB4R5AQ/bJuziiLsyi124zqQanwjqeU1G2Pbv8IEEnt/G5eeGRk38LCLQv0V6xttP8C+Ke5iBfQZab9sWv2RugGIHSWC6/cwhGaKjUP8lhXfUv+xPysO3mVCzslEBnyrg5c0F9zMWl9LdJzpw4aS3pnVHib6c1xqBkznj8mE5znxzQJATM5d9R+vJ6FlVe8kCbz8eVW3WutKmji8OFtELP7/1UKaDdlDz6R33y4+X5uMo5ua4vJIJI6buiKFGf7T66UGnSakeNUqzAx31HKY8i/UeZInnsGjOSRphhUWhYfzzudK4ooJKRhmeYac4Gzqdl6RYGpHD4XzJjeSio/+sV8UTrn3RHoqT
X-Exchange-RoutingPolicyChecked:
	EaFYWplie7kaNZ8AEdaUL7VWn2PZotA8MoIkzeDhZUI0ds912DEVQnIJROhoXp5Hz4VAGJJ36ris2zGBrqdw6w8bJar6Eo6cbK9j4Kyh722qDCCGymLfU+ubwZhZYxSodxZEyK4x8m8Z7Ke6Ds3rE50hdSPKZmpUi7yyDtkFtmOMQEwRkBmKmjlBPwrktL4l2Q9IunfffIu3OzMrejDEKrqGjLA5h5XnCRaUlCBJmPO1nE2zdUJUpKWxbSUQIig2/TURK6a7iWwGMKoYQFaopSwwMO0K7/seJF5vTeJL03iIl5f+Y7kb2wortqiikF/R6TX0OsAzw/F58+7OH2lZ3g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:36:47.4148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2eb8d06-6958-4b04-6b35-08dee0d305ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5043
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX1UHjVOzTyj4y
 voGJ9tLU6O0vlnwPH3qxGziv8LOnJmRhVNsi6t8vkWI+gjjk+Vs7zxb0y+z5pg017d7c2KPX2k+
 aGi6Ds6gzAB6n9C+IernyCJKmW4xOrVyKGJRieBV6PwL0WLSEOsDHj6Jp1SKWZDJp2M5FKn7HtT
 I0hjSA1Zxb4M8NSaE3ALnbSwcEigvttOO/mByBkAuHcIeFTsKh5tXvut7olPCgFOneIcbuvkgOX
 P82nAi9byvftgEohVbHjy2eDwOCD9BL2BiIP6FdMC0W7KcNjQGqeQJ678J42RZhUq4HQyyV3kqP
 QRW1QrS1lZ2TuNslnsuZ0t9+T6QHN5hve3Wn8Z9R8nDfJodXw6u9iK7WR+pxcXe8qxBWFePc0nA
 v4oQdWmq0ML22wRb3YcmWj+4YzkrC4RRiAcE8RHqo1n7l7iBZp+9HaISBlkAOOMZPScjIYF6O4E
 ZycK7cZxTE/riJ+qlaw==
X-Proofpoint-GUID: faXMoS6u3WfjGyT13V_Jne9tb0Mpv_JU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX6Dr90CSZtdpS
 t3xWdig/jjsLQTqM72NREjvNlK2qkuMX+nid4Zjn9vtvs8kaX507eFyrdkuNt+CyUT0ahyPLTh/
 zjSGQ0vhtXyKVtFhchoKVfPxsAY6aek=
X-Proofpoint-ORIG-GUID: faXMoS6u3WfjGyT13V_Jne9tb0Mpv_JU
X-Authority-Analysis: v=2.4 cv=Frk1OWrq c=1 sm=1 tr=0 ts=6a54cdd3 cx=c_pps
 a=mDGR2lWCdzQo6q5c8Yz5oA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=G971rGdnW_bq5gYpRO4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

DS90UB954-Q1EVM consists of a DS90UB954 deserializer which aggregates
data from up to 2x cameras over the FPDLink-III interface, and can be
used to connect FPDLink-III based sensors to TI EVMs.

Add an overlay to support it on J721E-EVM.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add missing bus-type property in csi2_phy0 endpoint for cdns_csi2rx0 (sashiko)
- Add missing build targets in Makefile (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h header (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |  4 +
 .../arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso | 92 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 529d85a0809c..c47c96ab5735 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -164,6 +164,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-ub954.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-fpdlink-fusion.dtbo
@@ -337,6 +338,8 @@ k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie0-ep.dtbo
 k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
+k3-j721e-evm-ub954-dtbs := k3-j721e-common-proc-board.dtb \
+	k3-j721e-evm-ub954.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
@@ -443,6 +446,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
+	k3-j721e-evm-ub954.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
new file mode 100644
index 000000000000..30b7bd90bb2b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
@@ -0,0 +1,92 @@
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
+				bus-type = <4>; /* CSI2 DPHY. */
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

