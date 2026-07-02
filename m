Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECC47CC78
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984779; cv=fail; b=KJzOL/NiJGvDhDKvOh+bXsjaVErioIcv6A0R6W0WOTEPiyTQQm7YbmRE0EBwJEu4eYcAGuRcS2Z5BDFQpWFfnirA+H3Rulmoe9LjGdRtGRMedBQu5mZDddwi8zFblbuoa6CbEfgp6sCPXWaEK5vQv2W4KUIzrJbHehHlqXgO0w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984779; c=relaxed/simple;
	bh=ZpBss+pcf0r7vPXvuxTLd/Qr+2V/kWfdxk8QL17aYcA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQlkozpcxo6X+hkcaqysz8vLwG9+8SkBJA863QdkWtjtqJI/qqO6YcxINpuA+8R7zmBNoRY50cFmcR/bolyavdltdImKQ/Mub6FLiklaFbivi1KWXxDpmjdooJGFf5kX18ILkp3akgjB7uD0hpkyAvah1BCzWnqDhSMdSJo0bhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qn63MZw5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CqAs1Iyd; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qn63MZw5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CqAs1Iyd"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6626ddSj659212;
	Thu, 2 Jul 2026 04:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4rQdfaJ8huEbOxDkj+uNil9KlD+CcToMsB5sMgbxa
	aE=; b=qn63MZw5gP+Rl1DGCgGj2GCj8p8tTz+8zmVzMg2YBzUkbxHeXkwJEsepg
	FbpOdIpm7pDbGmieSJgkCc8R1nt9FJpmbSYFgpgkcq1HSRZlpSAT5lEEXb115zSx
	rl0aRV2Z9gO42HeAZLfx02eYSlpre5pfuXn3BDVquAXvV4uD0AUNacQQ/k+1ZD3V
	lsjrpmTQCi4kvPAAM25NJdXzItwLEOntiTRqKOYpkBaRk5hlD60I6CGSf2kCAuMD
	6U+DdfccYVaeu9ArrdFH7Hg6dZrDRUKBFO3BGKOjz/NHr92g5VNBpWDBieb6LbUG
	j+6/tFv+debmTgM1Hks/goONG++pQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010055.outbound.protection.outlook.com [52.101.56.55])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240y85x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:32:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBBWe1VXjqbtkmEHOEW+WASWnyeg3coVtvznWljMTgfHSUPwb2aGhbk1HqU6S3tBXgp7qvJ4r8xMgk3io/96ptuDYlElLu7VVrhuuBGTM2O2RtdDDUyaajRKYb8YqKW8M1q60EPGHvwEYknu1bqp7sFD8Y9f56GJbWPAmdIv07+1ESjOKLvV1PDygkXmyIXATqzGGH/7Uxb9sngGYA1tisQa5Lbn22ioOtDmMT5m+QLMpXgzSoqli9iNQkP6mKD4wehebyUSDKw3/zhZS8yYjnpH9NbleEEOMnmcX+aVRUurvzI68lvN9RMQAH0ADpPX7+N4CZQ+U5ZWY2OlmfVDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rQdfaJ8huEbOxDkj+uNil9KlD+CcToMsB5sMgbxaaE=;
 b=wtblCYTtz6K4s8Ccf0Lt+QdGesT8dwp4clknp5AtSpG9Kh3XfM/CsRCI1j9BrRApiB/4dSOigx46kFT5h6XKmxV02bvAueCEsecKxN5r5TAmVppJSV9HbZm8CD1OksxQdu5c01wVaTxJiKXr8q3B6ICxM9/G86V9+5usYbsFUUEs3mZSQDUzGsyk0q00ZfM+ofXs04IkfW1d4oTGEBFQrh5nbw8yWJpvU71QGpbTsW+iSEzbxCYCH2WIRpSzDWiTtLBJcmkxZZwyNBmQbuv5cQBhINXFGcXDhERpxjZyS2ZCEKSaFfSIZqeiMhZQJeqeB81Z+9mSQ47shKOgj3v4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rQdfaJ8huEbOxDkj+uNil9KlD+CcToMsB5sMgbxaaE=;
 b=CqAs1Iydcea480C6B9C4qnNScuLSO2U9S0HGxTB3MirlWcHAfEWf8uGeWVYXipbAUMpqd5lQWljyE9BbBGf69DbwZ/EUDH0DMTVUrDgvlaSborcHhVLsGFS87a8+R4vt6aoNJBHF6LdIsDgXhP0NBIwI6lf3vShIe6WqMdWU030=
Received: from SA1PR02CA0003.namprd02.prod.outlook.com (2603:10b6:806:2cf::9)
 by DS0PR10MB7221.namprd10.prod.outlook.com (2603:10b6:8:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:32:40 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::a9) by SA1PR02CA0003.outlook.office365.com
 (2603:10b6:806:2cf::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:32:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:32:40 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:39 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:32:39 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb03611021;
	Thu, 2 Jul 2026 04:32:32 -0500
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
Subject: [PATCH 07/18] arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter board
Date: Thu, 2 Jul 2026 15:01:12 +0530
Message-ID: <20260702093123.1048575-8-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|DS0PR10MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: a962c150-c7bd-4ad5-866f-08ded81cdc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|36860700016|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	IpplyiklTkoZOw/PZp8tdE3UDptp6VRWPq+UxswFbOwm0BUQHe3V92+Y2uQe2GOjTd7lTf707m55k9CDp8CeaP8YqfN6nv9Fsy9tuw0G7vn3xb6cTt7RAtX6U1bNWGEy7l0ZEaL3BYxH2JPerp6gVyQEww3PxjihboOF4s+Xw79EoZ9oDooTksTgnc/R2vAkLNBr6wE7CpPfO+wPIifbZn7jXzJhAJn6p8FTjQNTx45pkO3FVjRXIr/38Sozblg2TQoK1kE2EspHmLmiZI8uvU+sfcWiSnmwpQusROOhEKqWmKRlZktMCi7wHy4HyY55vXeEjbk+OwRUmDWpjoSKfeRnf1jNmKw49S1SGZedx7ZE9yNphBYhEwJz7L371oIFMmtgdXHag7gteQij5w/mAbGquT3LigqGRQygw+c1WXTCH23+xkMiRU2BQHgQEasQNB/6ZbSIA3bhksTYty3Ek5Vqn+kURDRRvMw9o6nGfJZEPgpCrG5q8Bv9BS8+4lzLpORL+9CoJN6IruBkDIZa4Xv9RK3Lh/UbU7wD+kqR7X+ATvWLzM13shvt1QTtrLzej6mScbWj1SlCDyWsJS7pGKGaKqrC/R5aR+XdxP+KKZ8W9AIf/7flUnlHVRONxfzxDEaiP58OojKr8kqxZICYJA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zhOHzacCIOv6ckQeggM32BoQBJ9Kc9clY7EiFnJu9oQZq7sTbRkLyCHLsm+7VE7YCjQgrAgqoZHQr4HtqZnKYvhfFtN+IPXSrM2LK4lnx4YyPIkvtirc/SX0BAHSmuXVPZuERkPITY21rehmiWBTeMnotdlmHl+30xXB5Jx2CW/Ly35OJw/dEAzl3jcsmnBi2Ux6L18cjYXmEq7WoZfTKAiBoAC9buPS2HDpBU7soZWZ5kYshLemcmqxW+T6qXAIsif+TFCsLmPPNPC1YypH4pajIBmge/glJ4B73hRV5MiApOAB+/gLGKIHcDsQjRnhUheHpNYEAsLZu3//MHJMs6cSGKGAKBhxr5ihLaFeNwXIrViI1KjYenbyZNBq5zbjITtso3NK3p57KZFCZ6FCCH/wYUDdvCx2Wly+GZYqlc+sriSIQLpf/ahMzG5o/i2l
X-Exchange-RoutingPolicyChecked:
	KZRZbdFUzMkt1bqLVCb0eAmUMthonxUFNOMYnDb63KRV76C2X2ZuYzeD0C7LGJc7DEKfmNe+aNeyk32d7Wrw2oOUoKLWOMz+O2yBtnfZ8GlP1ewR9EDmCt2Qzh2ts+MIglpKCbjBxkS2MAHMe1Ge+XA83iq0S3VBEJW6kcnk5eY2kKkApynEIRzIPZOYZn9JMSgOImj6gYM/kT3i03alGXZxbUoimzqi8IGxTeIa7ngXyd/GV4bL7ES5eL9ofGGY3HP+tv0+30EzB8a99PxXE//xofWPeb200asyEuCkVVPHaXc2ITMb02FGRL3ANHmYdJi31NUcv7SXS2xOFMD0Sg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:40.3444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a962c150-c7bd-4ad5-866f-08ded81cdc8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7221
X-Proofpoint-GUID: xZScoBFAwGPtTZcYp-HFGVjj7MnkJpqb
X-Proofpoint-ORIG-GUID: xZScoBFAwGPtTZcYp-HFGVjj7MnkJpqb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXyubwVRyAEbkG
 y4cWli8X/tU6fsWiFam6mqqzdvA5Eub0g6Q/hzQk1m7+GMvQee5p6JvaOuvMxPlkFuRDPI3qIcL
 LUXWsH8jr6QB8V6HZgUdYG5zLUrjprg=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a46303c cx=c_pps
 a=Ess5LnjAiV6zB+80YbJDlg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8
 a=7gAdcGXbCpeyZ2MACgcA:9 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXwwygCcMtH3i0
 EVIoL2mnPW5mR4eWSCUzhCf8my8OZ9oo8Ndi+vXZ0IJ+7Fx+HvCyH6N3otkYtFXXx576PLxRV3E
 dyxK7B3/8rDY1I7oWkLJdLOdzi2mrbyCZC2aD51q0k1dNW+PO07aPsYoYEgMuFCaRljx5coy+zj
 7rXzY7Oh7XxOmSYY3kXfoNBP5oTRktZzqxi8lUNT19CphK1i8UbSupinZ1aRO0t0YKiHBGZ3JRK
 JxL4RrpAzYKgsvarb5JdJi0KzriTcxDZksyOC9jCq7jWta+muWquuo0kh9/bQ2ykLWNR/xjsnJg
 FoKMaTBYpM9pucU1NC7klxD9d0oHkd6vbOMkIaPnX0s+YbbLw7lZRgt9GVWkCdcoJD1yegPUhcv
 txy47BmUequ9rpI/VoLlTH6OP9n4sqYV/b/HUGmjVdKX3PRBQRlY0QUZ8/WY4H2amFJci63htUe
 FylN0iKNU1cqvV2VL6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721E.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721e-evm-fusion.dtso      | 191 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 21db60cd19de..7e2ed5c94e79 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -141,6 +141,7 @@ k3-j721e-evm-gesi-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-gesi-exp-b
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
@@ -274,6 +275,8 @@ k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-common-proc-board-infotainment.dtbo
+k3-j721e-evm-fpdlink-fusion-dtbs := k3-j721e-evm.dtb \
+	k3-j721e-evm-fusion.dtbo
 k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie0-ep.dtbo
 k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
@@ -344,6 +347,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
+	k3-j721e-evm-fpdlink-fusion.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
new file mode 100644
index 000000000000..0df2e48a4089
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721E EVM
+ * https://svtronics.com/portfolio/evm577pfusion-v1-0-fusion/
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
+
+&main_i2c6 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
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
+
+	deser@36 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x36>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
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
+				remote-endpoint = <&ds90ub960_1_csi_out>;
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

