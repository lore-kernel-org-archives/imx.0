Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8051C2DC788
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642046; cv=fail; b=ibJeIsAxXWOLe6DgvMBpEAkRVXhe67i/7ATh8HITq+8fI9SstYLwx//OXuSjoiFGlG7zb5v5hkqC/FgR3i8dA45ThfmA7j86GRflipXNfEtRznbx61dcWYZNylIpxlHoAL8IZVi6LtUGEBaQtkBDHRavqLaFg6oxEMHNGqfDqKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642046; c=relaxed/simple;
	bh=QNUNCU2pK2bTzbkd6M22QKWOmX7KoO9w6BrufjvZfWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GAEoKIP4yF8v3y1JaCX8zq9aFrhah+eMiH704J6zwA9pJ7HnWOd1vQB/A7Uslsa+2e0Ir+H7RbXBO0rgaWWbCNTkp0HVP9p+kYHvQOev/0P50W0Ofsx6rX4gxWx+DG/XHP6tuj6+GcS1eaTx5NjTd0mJF6mRTJLI89inEjIrHSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=bKAwdtmS; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="bKAwdtmS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V//oNAR9PPBYLylpXieVyFd0jS1EsZznNkyOTKEE6w9rYrZ37x4VuoKJgKe8f5LTK36TRjDoMiha2ynzp0eYCLJL2joFQs5WolRn/1CSvo1rCAIWH6DSqSJ12zj4Mk0mInZv9T9Z+4CmkfAP3eAO5g0Z8B/APHI3R8O670vjTpXaM2EL1n1MGMoNptNp4si31hfhzNdTIY27gQv1Fkyz0whCUU8wmGC6HeYofuRQPlY9ABjGGmTA9ciC9ZtLzDl4fmmYeP1BTuoaAYQLUgcslr4Qbz2BzC7F/LgItB8DMe66KRnt491HupGvqTpnk3vbFDI54zFQ0vT6GSZidKr7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcBNe+2z1xbThniJL0F4a3xWikPpp6mpRwRsK9vJ+Ao=;
 b=XceDU0HO6UKdurjCzWMZabNa0io1vmHv/AzAk2VNOz5gDF6GGLJlPuMUd9GM3eqosAgkMtebPapcnStO3yGLKsjY0eQllTiMq/XJX7zVUgrn+/l+SnYLD6vYpJ7/71KIQzQ4r5OiqDgsy9BWreObpIZCHlkfk08glo4T8AS4OxVR7oAhEaDut0Q0OnPMp6FmqraF0FmG+nd/7lBZJcdijl5bUxNbaqehS+xssL+/E/N3JV9AVMwLcO8+qfbgbPjdVg0FD/xwgMrv59PN7d7nVPD0y7vodPnTnwIMhlrjik4gbGBbNqlW785f6+os03IwCPBpJLuW9qzw8+mT3M/ejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcBNe+2z1xbThniJL0F4a3xWikPpp6mpRwRsK9vJ+Ao=;
 b=bKAwdtmSE8KyMzeKnu0CjCU0k3y8iXu7S2G4N/bMGuc47onPPIL+621aoNG71gMuzUgNzb2H9bjhLFidH8H33eOoPV6h/dAJOPsklbLSxwjnPga/sx6+v3awyEis9fLnUbph9XlBbazwVsi680CepMrKULROxUQihWg9YPruYrHkfvepbECdb9LeRfOlOXrVjeEsmIkP8uYz/J8r4GplNDwvMeO/ONHaGw+l9iwp4E8ry7rOG9+INWyg5BEhXIOgBNsLD/6sjkUemU1U9U0yE2feCpyU0y71I2hiwov3meIjmknfMGA0gNdKoqciCrxf3z/gqmoyHxcyBQ286utUCQ==
Received: from DB8P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::29)
 by PAXP195MB1326.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 09:00:39 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::5c) by DB8P191CA0019.outlook.office365.com
 (2603:10a6:10:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Tue,
 28 Oct 2025 09:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:00:38 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Oct
 2025 10:00:37 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 28 Oct 2025 09:58:08 +0100
Subject: [PATCH v3 1/6] arm64: dts: imx8mm-phyboard-polis: Use
 GPL-2.0-or-later OR MIT
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-1-9b98f29a6bb9@phytec.de>
References: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
In-Reply-To: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|PAXP195MB1326:EE_
X-MS-Office365-Filtering-Correlation-Id: b7910e8a-e14b-4135-c982-08de16007731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE5yU21lWjJFbDlCYUtHR096OExucE4zSEdmYlF2dFRKaVcrK29mQlFnYWt0?=
 =?utf-8?B?eXpzTWJmUVFZVkhIdFUxemcwdVFZYWtZeW5JeGhmNFFlL1Rpd0ZQOVJrelNR?=
 =?utf-8?B?T3BGbGxLbVBZZFhwNzRvdUtHdjlzMlF2TlE0SzNzWm5FdSsrb2J4dGJOS05u?=
 =?utf-8?B?OGZWUExlU2t2UGt2elZudlNNYXZKRDNIV2Y5Vk1mYzZSWmlxNGZYY0MyZDNj?=
 =?utf-8?B?a0QzdEw3bDNrejdOV0QxSUZjN1kzRDRBUGJNakpYZU9Rbzk0aWxNK2RtUWhH?=
 =?utf-8?B?ZUQ3Slo0b01HS1R2djl2OVVqdUhZZG40YUhtTmx5cXZzSGRCcis0Y1lpUXAv?=
 =?utf-8?B?eUZUQmx0Y3l3dk9hNmpZTmdxNmtzc2ZhUllCV2FaSnZEREg4ZWZLM3oyd0NW?=
 =?utf-8?B?WUJpKzlXY3pXbkQ0Mm95ZFFSRksxK3lyalhBL2IwdDQ1WmplcEpuTCtWb1ha?=
 =?utf-8?B?RDl2elhvOFNpWVVuOFdSSkRhcVZIcC9WZWdYM1hmZVpZYWpKczFGTXJoZ2hR?=
 =?utf-8?B?WE1oR3Q2MEh4YUxBbldXRjNyUE1VLzU5cDNWdWVoYjlWYkRJTVFTSGpTSU4w?=
 =?utf-8?B?UGkrY2VQTS9zclMyWjJLUk5NY2c2aGczeVVubVZrOFltUFMzRmhGdExzSWpz?=
 =?utf-8?B?QWYveDNSZ3pCY3BYWkxhTzI0TGFIcmpFTStnQXhPaGQxR0hYQTNTaGM1NFgw?=
 =?utf-8?B?a3Z3bXNnQUZXNkdLbVMveVllMnNxa1BmQlFvS00yay9jMTJyVUtMRGVPSG9W?=
 =?utf-8?B?OFB6QllUTkt1M3ZyZXI4dW8rWXNkTTFoVHhCblRBanROaEpta084RkRBNVQx?=
 =?utf-8?B?ZiswRkIyTmxJU0F4b1d1TVhMZUNSK1AzOVk0NHV0RHpOOVo0MmQrdHl2QTg2?=
 =?utf-8?B?SFBBMzkvS2pUZmtDN3ZmTU5JS0FTV2VmOE54cGhWZmRiZCtuL09kNlpRanBu?=
 =?utf-8?B?OG9jRk8yaklJNnIwT0t4YXZuOE9SUUN6MVY4QVFaV1FnK3lGa2w1V1loSlBT?=
 =?utf-8?B?M0hCTTVGUjlKQjg0czgzUGZQc2o0eEcyelY0OElaQjJhSDdIZDBRb1ZNSDV5?=
 =?utf-8?B?SzhJTkh2VTV3bDJncEszQ3c0VVcwTGNXNWMzNWx2ZzdNRnQ0YXhHYmwvamdM?=
 =?utf-8?B?VzZ1aUxkc1dsM050WHlYYVdqVlozWFVDamJPdXptT29HcGQ1QkZ5MjRCcThi?=
 =?utf-8?B?b09INEpCNy9wd1daV2F6ZlZBU3RmWVVXanFaMlloR2Y3TjBwQ3B2TzBxcXVu?=
 =?utf-8?B?eW01cUVmWnFXTlBQVFFXMFJxRXFONGV1UEdFdXVGUVJ4aEFqRUJvd3UxQUVT?=
 =?utf-8?B?aEZ6eG1IcG12SFlZQ0IrSlk3R2llb2VNRjl4SG9YUU9IdnJBQmIvK3FPQS81?=
 =?utf-8?B?VC9PaE5UVnBiYjg0L0hyWDlWWXJCMkNtTHhMeUI0TDVWL2NoV1ZMSnpBZmww?=
 =?utf-8?B?ckg0RDhSUXRaWmFWN2gwcURKMlJPT3h4RHFDalFhdkNIcXdlMzNUSUdqRDBW?=
 =?utf-8?B?dDcyNUVBbDMrbDkybkx2NVcxOVFVNmxBNEdFd1V3VENQOFpUTEV3Z3kxMFFI?=
 =?utf-8?B?WG9NMnM2REF0eVVpY285aG1pTHdwOHVFZ3pJYUdpc0ZZZkN0bGZjRVdpSWFF?=
 =?utf-8?B?WGhGUC9jeXRYa3RIV1FKZkQ0UEk1UGFtR25MUysvTDBNMXk5cEk0Vjh5ck1z?=
 =?utf-8?B?QjZRaVRVZ2Urenh5VjlXdzNveWM0MGN5bGJPa2dNeUsvQXc0U3BKekwzaG8w?=
 =?utf-8?B?VzNxZXlSc1pWd2tlZjZ4aGFadWhIU1dnUzZJRUZ1UjdSdGRLOWFiRjc4V1E5?=
 =?utf-8?B?bFU0WUIxaC9OZC9qd2JKS3ZCNGZMdTFFWXFlamZwQVp4bmhSdUhHSDVnRmVt?=
 =?utf-8?B?ZlpKRjljVTBpQms3OHg4VWxndlNrMitWazJwU3ozUDJVU0hWRHNnOFl3Wjkv?=
 =?utf-8?B?MENheXY0NVg2RnN0QmFtbTREaTU5RytjYnZTUW9XK2h2V3dHR1B2U0kzVHBs?=
 =?utf-8?B?YWNmenZDblpKNzRJQU01M0dXWlo3RE9GVklxSG9QNmZxcHk1K2VpcTV4TDho?=
 =?utf-8?B?V3ZQcjFVK1hzVWh2MVIxY2ZHS2hxMjg4QUQxZkxkZ3ViZ0ZteFJxeW1EOXU4?=
 =?utf-8?Q?t/ig=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:38.8018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7910e8a-e14b-4135-c982-08de16007731
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1326

Update license and remove individual authorship.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
Acked-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso   | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts          | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi                | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index 79e4c3710ac3f44ca88db9a6059cce986bf1fc3a..00da1eedf73aac1f0e87383ac3d12f21e007c4cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2025 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
index a28f51ece93ba62a7a9991826cca2ec74f704ba2..1059c26990fe6eb0d7acdad4d3386944f46ea99b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2025 PHYTEC Messtechnik GmbH
- * Author: Janine Hagemann <j.hagemann@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 35d8c5ab35472320b6657744c9f7965acab99f49..6043e7d163069398e10fec6dd7842a4fa58552ee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2022 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 921a7f58fd41da0967c03bf07620ca9a84075505..54f724e1774c2c718cddd1ddc7378054f2b2f638 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2022 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 #include "imx8mm.dtsi"

-- 
2.43.0

