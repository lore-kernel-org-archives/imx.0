Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023137.outbound.protection.outlook.com [40.107.159.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45E8285C83
	for <imx@lists.linux.dev>; Tue,  7 Oct 2025 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824781; cv=fail; b=UVnt9BPB4YSSFX+DihZjmSlbWAwAgRnJFd7NfiJobZRzUkX22Lrqeyx8kPN4nPQIbrVvqSs2M/Pdoxv+F1xCCR8hCZ5vMtw4FfJUgbeGn/CIzsklljOLcMavS4eX/SL4wkSPyKRsde3uXj7QMo3uTltw5brMIUSGnj9lRtfzbgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824781; c=relaxed/simple;
	bh=f2So0OXAJpsNeswuSGvhM3p6LufK3jVq90avWT3TkzA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=oeGvOXbE/qcL5o6NgCtNquyG8HjnsuwjBma7u8gf6QBucU4cjFIunpAHCQ4f/BPE6UJ75YBx16ij2oT/uqXugCAiuFwY0YeS3OTmopWPYfDVc1inxt7TFJdXM8ycGfk+5oIBnK7kEKZdBTScayvPAwgNMGhUE3S6YvKH1XoqGpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=rk/O8Kmp; arc=fail smtp.client-ip=40.107.159.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="rk/O8Kmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0sHiZSgus3l5Nc5tB+3Uny8SCEoHOTnFy1Grww3hfaY9dUJ4e+d4yx1+Tsp7wumN9N3yHBjlU6WFTwV404Z8yqCTJUwk1SLaH+h4CTGz1NxHCY5Qc72/NyWCL3/uwA/XnvuKqKlmAJ8CZwm8KR/5CHbuoLcD7ZiZcGAVlOh/DAjevX7NmmG3boRCnwjrN54oj78di9ffiVKONDhHwhw+1xyXh/vO7YNGanQA6WhTsH4w8+E/GcgTx89rPStp6qZvRJ/7YhxFiQ0zQ2bMtW70nvwkEABifdPxbWXY73h2GlCHNUW0g5QbXBaGu0xaL+Tpf1CkAnrdQntAicH9wop4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWrBzm0GKYh+q6DL6eAot7So3NzaxBdb5jW586GGzpA=;
 b=AsKxAVAX749F4NkdyFcv6UoYIk1bguZyLKz0O/EJlXOBvSK7xh/0N0H0lOD0tZQjsmnEOAiU+RIvUdnJzchjQ5wNhsRQij1m7z6RbcxB6B+j+2jFJ+k/btg+wrjUG2723OtlhpgWDpPZxQ+3YbecPu1wvilc/C7lslNSXzaDBNkWq3/ZMsPZT3Dg1PY98/CHfT56AC6N3LBkBYTVKRg2ogEEZ5CqDPlDGYxv1Nw3pAq4KZrDiJ6quw/TKvqbCLjg/v0Ln/tGBAGAgklqUk5DS32Z985GclENO4L6K7JRWnmoDcsEz5UikOS18ITk8bUdKDQIWYO/2V+ymchQc0odvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWrBzm0GKYh+q6DL6eAot7So3NzaxBdb5jW586GGzpA=;
 b=rk/O8KmpmVfLJ2EjQ7we3AJeNxhKwSowmcgXfY//Pr4ov7vJVprjmhWKEb8y0nK8TX/OuivFyQjaXxl0+rfMWL8GItr3jWe0H703iYDM+jA4V1zj5J2NhLe6TOTm0w7FisU4Lao4eIr5IVccvW+TPVGjTaXW1z7hLuQp1G2TPd8f64fRzTk9lZG8ihri4sWEpnQG63zFsAvemW6dqcM/0M2LtrvRBq1DXlagY7XkBTAv0n/s3+5/Eq9IX8fdyHFJP6gCntqi1J07+rwUrKwh8hUVtVM9EkB0AjH57mTyrOlcy7HNVwfa+haL+eEQpgdGkIFnUP5XkEaIzoJtQ5vtpQ==
Received: from DUZP191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::9) by
 PAXP195MB1277.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Tue, 7 Oct 2025 08:12:45 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::6b) by DUZP191CA0011.outlook.office365.com
 (2603:10a6:10:4f9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:12:45 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:12:44 +0200
From: Jan Remmet <j.remmet@phytec.de>
Subject: [PATCH v2 0/6] arm64: dts: imx8mm-phyboard-polis: cleanup and
 additional display
Date: Tue, 7 Oct 2025 10:12:25 +0200
Message-ID: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnL5GgC/6WOXQqDMBCEryJ57pZNRIh96j2KSEzWugU1JOIP4
 t2b2t6gj9/AzDe7iBSYorhluwg0c+RxSKAumbCdGZ4E7BILharAUhWwsIcXBOp7msB320QWHEE
 TPfer7iHXKGtPDZgZJNYLT11trMISqJWopTLKaSfSvg/U8nq6H1XijuM0hu28MstP+rPm+Id1l
 oDgCoe5tU1rjbx/61dHojqO4w1rdoFvAgEAAA==
X-Change-ID: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-ef10812a2d8d
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|PAXP195MB1277:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4ddac9-e6a1-46c8-1c8d-08de05794bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXJsaXA4Q2NoaCtGdnFFZVhGZmVvRVIwUmMzbFhIeWJmSkZPdGxsSnZSWi9O?=
 =?utf-8?B?Y3czOEVUVXVza29GTktPSXB2bFlLUXJDdTFZZzcybW1DT1dXRE9JdlR5VDBO?=
 =?utf-8?B?bTdhSEdZTnJLNi90TUgxNXVHTzN2cm9zYlkyTXc5NzYwTkRvUHpNbWRqNDFq?=
 =?utf-8?B?TjFRc2pLYUZRVElMUzl6R2tBVThJWE9IZzV6S2RwUHpGT3B1dkUwRVllaVVO?=
 =?utf-8?B?cFhLYWNRb2ZUZmJqcWd4OXBkL2N2MXIxaFowU3hOeENmU0ZxZ3l3Y24rSmxo?=
 =?utf-8?B?a05HTXFZcTJuL3lxTjczRWxsbnBaWjFKYkFsTHByRTErSldaMGkySTB4clkv?=
 =?utf-8?B?R1UwVGcvcG5IdHcyQzVrekoxY21yK2Fmc0NxRXdKNFpNWkRtVVNxZTJIc055?=
 =?utf-8?B?UEZWcStkNW5YV1ZuTmJ3UFZxcGJja0JEM3dUTDNaS2tJN3JHY0RtWUx4dHR6?=
 =?utf-8?B?Zlp1Sk4zdHpuUUxwSzdxNmZmUjhMSWp6ai9SUGgxRS9qVnREaFFodWlsRWJB?=
 =?utf-8?B?Y3RzcjdnM2tZbmJyVWRSMmJwbzg0Wk1uc3NHakhaMkNCQXRackRnU2pFK2tW?=
 =?utf-8?B?Uk5Yblllc3BHNTNDajhEZHNWRGF1L29DbTBKSG9SY1c2dmtiblNLSTFqd1F1?=
 =?utf-8?B?bytVeUE2TlVLdnNId0U1dFErZlB3WDcvaGRVL0gvNHJsMS9sUEI1N3hoTkNO?=
 =?utf-8?B?ZlVJc2F1dFhCc3pJRFltUUR2UWk2Q0hoS3NFQTJ6ejVyQ1YvTFovb0dlUXp0?=
 =?utf-8?B?NlNMaVlKWmNnRzVDc1ZRMDR3QnYrWWZPNkFXVndOVmIzVFZDT0Z3QUlYdjJQ?=
 =?utf-8?B?Z1NFcHZnRlF1dVM1ejgrM29tWjlpR3J2M1JNcU1OSW9lajZBRTlpQk5sRmRu?=
 =?utf-8?B?ck9DNmtIRm1CTGhkVURvdXg0bnFKWWZpQkN0endBSEN1elhXSlhlOU5CQkxn?=
 =?utf-8?B?MU43RTNXV1V3ME0rQ1JQWU4rZXR5akNvRTFYUlhHVEFTSkFGSmpOWWM3SlA3?=
 =?utf-8?B?TVY4YUhua0luaEdTS1JBanoyS3AyWm1rMCt3enhGRU5HVEUxQkpiQXNiQ1Fm?=
 =?utf-8?B?bTVCZFdDVy90SVFxcTBvc0tWN3FCeDhGdXJPTW1OWjU4UWpySitncDRMekNR?=
 =?utf-8?B?Yy9WaUswQnlFSFVQMTZEeWhzcEl5VFpNZlA2dkV0ZzBhRzBCVVBsTGZkNjJo?=
 =?utf-8?B?YVNKbTMvdkJ5NkxyWks5Z2VLeTYzY3VWVmorQzU1bzZ0ekkrQjgyQzdoLzAx?=
 =?utf-8?B?QWpselNYTk9XeHA4dlBNYXBRNmxqTTJDckN2U0hCTXhBUzMwTkdtRzE0cFVv?=
 =?utf-8?B?ekdOUXZyYXNpMng2dUc1czJoVGl5VHYxN3dVcElEL2JpWEdscjJBOVVOdVYy?=
 =?utf-8?B?WVR2SUdPWVptNkVBSlRYb1k0MktPWGtaR2czTjNmekRpbkV4Z3JkbjJCVDNq?=
 =?utf-8?B?cDkvMmhESzBtWTdiek1FaUp1RHROcFU3dEhIN2krU0JEU0NuUS94ZkFPb05B?=
 =?utf-8?B?UVNsMFgzL1hVblVnbXUzMGJ4cm03Q2VabmhBd3RUY1hwNkxSYUpRZ0Y0QWQ2?=
 =?utf-8?B?cVJaVGduSVg3RWI4aXcxSWZlNnYzM2FXV1YxeXk1cmR5MUhhMDdKZXV2UHll?=
 =?utf-8?B?QmFQTWFlb0VNWWthRTB4UG9IWTN3UmsycFMzZG1DODc2WXlUVVIyVkFFZ1Yv?=
 =?utf-8?B?eXZVTEx2RnJ4eTZ0T01xMmhrREVGTlJOSE9VcWZKQWpmSTJES0RacUNnRUF0?=
 =?utf-8?B?SHgyNnFnTFRpUDUzTmhyejl5ZU9Dc0hhUG1jMUZRWFVIV3h5cUZCeS9PV2Q5?=
 =?utf-8?B?eHl1NkdPSnFocHFRQnZGV1RyNzZOSHZJRmNGZFcxRjJ4eVFNaUhZdjB5U1I2?=
 =?utf-8?B?V0U1Z2cwRzAyUE9DdGRnSmphQmtZV2VVR25wSmlVd1owcEoyd2NTcXpxeGto?=
 =?utf-8?B?TTlhSHZOTWR4SnZSN3VtbVVIeWZCUmx4a3FkdmRIcGREMmQzcWJWUCtxdHZv?=
 =?utf-8?B?eVp6WWZ6Q1lPYytGbVZpMnpEWkx6UTBvUlVHKytYMERBMisvMDVLUGhzR3NC?=
 =?utf-8?Q?3dTgKB?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:12:45.5681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4ddac9-e6a1-46c8-1c8d-08de05794bf0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1277

This patch stacks rework the handling of the peb-av-10 daughterboard.
Update license.
Move mipi bridge configuration to som.
Allow peb-av-10 as audio only overlay.
Add two display overlays for ETML1010G3DRA and PH128800T00.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Changes in v2:
- add Signed-off-by to patch6
- Link to v1: https://lore.kernel.org/r/20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de

---
Jan Remmet (5):
      arm64: dts: imx8mm-phyboard-polis: Use GPL-2.0-or-later OR MIT
      arm64: dts: imx8mm-phyboard-polis: move mipi bridge to som
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: reorder properties to match dts coding style
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: split display configuration
      arm64: dts: imx8mm-phyboard-polis-peb-av-10-ph128800t006

Teresa Remmet (1):
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix audio codec reset pin ctl

 arch/arm64/boot/dts/freescale/Makefile             |   6 +
 ...8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso |  44 ++++
 ...x8mm-phyboard-polis-peb-av-10-ph128800t006.dtso |  44 ++++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtsi | 189 +++++++++++++++++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 234 +--------------------
 .../imx8mm-phyboard-polis-peb-eval-01.dtso         |   3 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   3 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |  28 ++-
 8 files changed, 313 insertions(+), 238 deletions(-)
---
base-commit: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
change-id: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-ef10812a2d8d

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>

