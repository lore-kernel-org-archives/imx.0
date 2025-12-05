Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022087.outbound.protection.outlook.com [52.101.66.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD58A3242AD
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927264; cv=fail; b=jhJzlNUEFy6Vv4QiQGj/Rvn4HLbC0HKX90fBlojJnTLWNiN8AV2P+A9WgT5r0usY3b2jDhXyPSf0FmLUVZcXXz+xjaurykY8Pa3cc+F/+GsojvU2nxJq4MmGGYR1cnPiBMLDDlNQ+NiVdiVr4qHdVn5OEpf7mboPHsjoaaxM3fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927264; c=relaxed/simple;
	bh=y+r6L0OoISBG8vkZ9E57Io8BmY5PoB99oGfu5Sjqyro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BiObmZU4OWXN7lfPmHfaBwwhaIPZP9akP9rxKnwG4eECXifS9bOPxYPHuD5xocjP5BJPQZQpofSbcPnFi7EgF+cwB/Z9ZQGTu2MH4w2iKlrklzfaRF/y1FlFhC23EHo2eipmhKPmGF6XS8ydTcXiFr8P55vbe1ZH954e//txQjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=O52mVdb1; arc=fail smtp.client-ip=52.101.66.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="O52mVdb1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSomBJso/BB/LnMvnMnCBwAi3P9hNNSrLGeGSuOmC0omQErQsuxYXmJgpKGhd3tHSfWpM0GXIo9ZOTlJdaxXdLz1vdlpSKquJhaD6gIrPBkT10oi+9xq/PsVtbATHHACmbDw8H+FHVl8LgAVZdx+yotP4V4ur3GWQ5yJIrWSMPvBBXaqm6u2zB3sR37RvBYixOKTlfLiZvA0yIWVBWB2P0EiZ0C0jn3SDcfdy8kPFWUVtEw8IKbvroJoOtrg2Ku2ZHVFvuT9sqL0ph4dZjjpxm6JzGhhTC8AS27+BS48Nt7mNT8Ei9S0Fx53BkPyoBKFsxmrqKMjv+JQcKePwURtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mr1h2U4hyy5YyE4+QTF8atgHRlNCTpBFLnFB3XRcY5U=;
 b=WhyCKdUDziSaZZ9eX2DCxmEz7wVAgdnYa/mfkXMnXhA8wyWWWSt0f1O91cH65XKP+muTxpDfhjNVsPSX/d7gbYH3BVOLsidLVbN5nPP3ZuAKt90BK/FgYuqb8jFwKvvA4+n2rz2WVD2Qn43Rl7tTWI+JxpslVee1daISTFQ6Hf/kGec1YCByOAQnKGuH5ZmZAleBEIeWkAXWij7pphLC7bBG40X5AtmJqnxowysgBchCFONt/FaTo7unS24GXmociNpSD4OqgICCDm4HzR9UA/w9JdDSUnneBVVO906Mon1qxie/1IFJImX+3qoCZrTUUknqBIoxFZqu+XqzTNLfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mr1h2U4hyy5YyE4+QTF8atgHRlNCTpBFLnFB3XRcY5U=;
 b=O52mVdb1bObcHTXDXnhQEJArORjfAqi2MUvIXSc3c2cJEsoC7cIwY69LxiSxgGLWb0p/zqrfdniqLk7jWxzXeBWKRw132O3Gir/cms7z2wmB/1vMbwBbKo5fDQMDKObH7v5BQ1+WLAzZ4UM2bbIgC9q0zKpzBUqbwAUXHLbmQ8vEuDtAG71xNRrzeC9D9a1MvCJE+upDEscxOZR2Gf6I19dK5lnmWg179CDKsCs3OeYOZowshYoMeWV2FBjFycRjIKZCK5IzzlPYvCJGHcZRWIQS6xpRCfBmxv5pj13ssRov62NqC7VEzInY8l8zJro9iNWDU47jHEnPKo1T2o2v/g==
Received: from DU7P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::26)
 by DU4P195MB3182.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:627::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 09:34:03 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::3d) by DU7P191CA0016.outlook.office365.com
 (2603:10a6:10:54e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 09:34:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 09:34:03 +0000
Received: from llp-moog.phytec.de (172.25.32.61) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 5 Dec
 2025 10:34:01 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 5 Dec 2025 10:33:28 +0100
Subject: [PATCH v2 4/4] arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-05
 expansion board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-imx8mp-dts-additions-v2-4-d4db54fbadd0@phytec.de>
References: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
In-Reply-To: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764927240; l=6049;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=y+r6L0OoISBG8vkZ9E57Io8BmY5PoB99oGfu5Sjqyro=;
 b=WB3r9Qb8BTdjuRHfT9gFEQVoTiuK3wCYhjbfjuDMCCZGmzhjI+O7yxlrj2S5aafduce74botm
 Cx9jfe/cjIJDM6KY7Epx9s7mXWvCMQKDljwYWi0CXlxaOYj49I+ZQKy
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|DU4P195MB3182:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8bfb05-f49b-49ba-402b-08de33e16d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEkwdXVkSEpYdnUyLzcyR1NKUFJpQVVlQVlrbjlobHFQL1hIMlpJU3lJazY0?=
 =?utf-8?B?VCtnSDkra0VCZ2VuK3N1MTJUTFFNenE3V1E0Nyt4dmpoWDdpb0t5KzQ5YXFT?=
 =?utf-8?B?dzR4Y0JleTZETTNURTNaUU1xSndUamtNOUJmT3dXMDVURHZZaTUyUmozRlB3?=
 =?utf-8?B?SzNlRGV5MENtV2xXMXB0ZlJxTU83YVY2aXhuaXBNd0xyVU4wbGpSR2luQnRZ?=
 =?utf-8?B?S1NoSzVOMjlRaDJDanFDNmNEN01jdy9DSCsvc3RZQW1TbUVGOHNGNjBrUkFJ?=
 =?utf-8?B?c0tINiswdmtNMlFQcmFOclF3U3VKMVVxZmVaeExkMkFoTlhGQm1TelRFQkRv?=
 =?utf-8?B?WlkwOVNOUlRoWU1sYXNETGF3VWxvY3ltdHNDbkVRRnhJKzVlaFN3NEo2anVm?=
 =?utf-8?B?SllJYURreFMwWEpVckowNUQ1cU4yREJlaDluT1JkK1NqVlZsNXB0cWZtdkpJ?=
 =?utf-8?B?R2tzUzRXYUhJU0xURG9UOGt0djJKZ2xiTFZZcllHSWNjcXVSMG05YTVocmRp?=
 =?utf-8?B?UWtBWmFac2VjbDhpcEFTZE5iOFpzTkhnZVJzMWI2RXh0L1JjcTdKdXQzY2Vj?=
 =?utf-8?B?TmZtTThvZzVHK3BDUXlMU01JSEhkK2N6N1RCMEVZbkE4UU02dmwwUWh2L0R4?=
 =?utf-8?B?R3lvVm4zNlVzU0o2MlJwczBnNlBBQXNKdWNneWRnWjd1OU1aVjArTUxwUDV1?=
 =?utf-8?B?U2NXa0ZTQ203RkI4bVNKMzRiNlVMODY1aDFSbEdoRk5SOEhLbUFwOTBnSzds?=
 =?utf-8?B?bzRNZ090dklMNXhmMFptZTFyY2g5eTh2YlI3WXV6MGxoa093bmZBKzNlalFI?=
 =?utf-8?B?aXJ6YkROaC9lb0ZNQnh1Mit3Q0UyWDZnbExJZTBGMXBoMEt2c0xRakhTRmNR?=
 =?utf-8?B?YWtRWE1vK05SNkhBanJPUDhkRWxOMzV0d2NLdUR5QTJKM0dZV3JQSWVuVDU1?=
 =?utf-8?B?Z2dOVnJmQkZET3cyaVNRUnFIcjhLTldDUWdYRWVDc21PQW4wVFp2Y0FLUkVk?=
 =?utf-8?B?ZnBwMTN0ai9wekJNcFFaSDBJREJhQUJmNEpUelpIODVnNEdXdnlFZ2ZUbENl?=
 =?utf-8?B?eGt3ZUVkYit1Mk5MM2h4RFo0bHRpU1VkOGE1dHVXQlRHSGFyMThFRWczcWx0?=
 =?utf-8?B?MkF3M2NaUlFZL2VvVDRLOG1NYVQxTXhtV0Jxa3B5ekVRN3h6OGQ2N2I1akpR?=
 =?utf-8?B?ajRPTjhIYnMyamFYanBuNXZtTXcvdHZuME1EdnN5WHFVV2ZoMmJNN0I3b3Jp?=
 =?utf-8?B?aXMxb202dVpGamxVK2h2UXlKQ0w4TXBmUGk4NjR5aVVFYkVBMlIxeXQ1YjYr?=
 =?utf-8?B?VXJwbzY5bUI1SW91bWFSekpNclpZaGtFT0R5NTZaVmlIMU1DUGF6YmcyZTNa?=
 =?utf-8?B?N0x5TlpYNmxOd2poQVhHS3VDTjQxMlFOcU0rU2NFaUF5RStMK1dJSURKVGNS?=
 =?utf-8?B?d3ZHbDZPLzhqOWsrYUhJRFpOZHFpVy9ZS054NmJ6bFlYQzF3Tk1hV3ZCT2tG?=
 =?utf-8?B?NjRSU2dpMjRhSEt1MVFpeHYrRzZhWTUzLzhjbFhHTm9qdS8wSndtVnEyVXMy?=
 =?utf-8?B?azI4bVVneGZNNzVSM2JOaE9QQ3EyQ1B5VkJYaDhxaCszSWxNNHAzNWpsVEVL?=
 =?utf-8?B?b2k3YU9KYjUvajBBNmtlaDk4ZzdEYkduMzFLdWhhVURxSjdIWitMYzNQR1Uv?=
 =?utf-8?B?NGdQbHNQaEFMcXFQRDIrRGhRK2p1dDVvZ21oUm4rcnVkeU5CaXBnRjZnVnJu?=
 =?utf-8?B?NUthWGVKemNpdnlLRUdJNDB4MlN0NFJNaXNUczlyMjA5Wk1BTmU2L2l5aDV2?=
 =?utf-8?B?NkhqNHh6dHBvclpWbER0NzFRNk8rTmFrWTVjazI5R3M5OXNjY0JaY3pQN1B4?=
 =?utf-8?B?NVBWUzJ4bGsyUmljdXFYb2duWW55SExmUGY3ZDJQdVlFOU4vb1BSaXk3RGlC?=
 =?utf-8?B?RVd6U2FneFhSUFB0RGFIMTE2WVRGRlVlZFdWTFl2eGNseUxBWHlHdnF0TU1J?=
 =?utf-8?B?RHk3K0xDZDJrMTN2T2Z2WUFSMEp5UUpCRXgyTU5HaUpJZ0MwVXZ5aHdzMVNi?=
 =?utf-8?B?ZUpEb1R2aXRBcDZuTEs5WWJkM01icWY1WEVpeXgxeGlOdzQzWTBXRnc4K3Zo?=
 =?utf-8?Q?K7Ak=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:34:03.1280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8bfb05-f49b-49ba-402b-08de33e16d90
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P195MB3182

PEB-WLBT-05 is an expansion board that provides WIFI and Bluetooth
functionality. It features the Ezurio Sterling LWB module [1].
Add missing regulator to baseboard dts.

[1] https://www.ezurio.com/wireless-modules/wifi-modules-bluetooth/sterling-lwb-24-ghz-wifi-4-bt-51-module

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 .../imx8mp-phyboard-pollux-peb-wlbt-05.dtso        | 108 +++++++++++++++++++++
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   7 ++
 3 files changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..20b5f97671ddc5462493f3c90bda64d06476ca72 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -243,12 +243,15 @@ imx8mp-phyboard-pollux-peb-av-10-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk
 imx8mp-phyboard-pollux-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
 	imx8mp-phyboard-pollux-ph128800t006.dtbo
 imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
+imx8mp-phyboard-pollux-wlbt-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
+	imx8mp-phyboard-pollux-peb-wlbt-05.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-wlbt.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-prt8ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-05.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-05.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..0e98f4d942716e57f5bc1567924460b618eb0930
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-05.dtso
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	wlbt_clock: clock-32768 {
+		compatible = "fixed-clock";
+		clock-accuracy = <20000>;
+		clock-frequency = <32768>;
+		clock-output-names = "WIFIBT_SLOW_CLK";
+		#clock-cells = <0>;
+	};
+
+	usdhc1_pwrseq: pwr-seq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <250>;
+		reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_RESET_B__UART3_DCE_RTS	0x140	/* RTS */
+			MX8MP_IOMUXC_SD1_STROBE__UART3_DCE_CTS	0x140	/* CTS */
+			MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX	0x140	/* RX */
+			MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX	0x140	/* TX */
+		>;
+	};
+
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x106	/* BT_DEV_WAKE_EXP */
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x106	/* BT_REG_ON_EXP */
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09	0x106	/* BT_HOST_WAKE_EXP */
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190	/* SDIO_CLK */
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0	/* SDIO_CMD */
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0	/* SDIO_D0 */
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0	/* SDIO_D1 */
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0	/* SDIO_D2 */
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0	/* SDIO_D3 */
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x106	/* WL_REG_ON_EXP */
+		>;
+	};
+};
+
+&uart3 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		pinctrl-0 = <&pinctrl_bluetooth>;
+		pinctrl-names = "default";
+		clock-names = "lpo";
+		clocks = <&wlbt_clock>;
+		device-wakeup-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 9 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_vcc_3v3_sw>;
+		vddio-supply = <&reg_vcc_1v8_exp_con>;
+	};
+};
+
+&usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	max-frequency = <50000000>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	non-removable;
+	vmmc-supply = <&reg_vcc_3v3_sw>;
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+		pinctrl-0 = <&pinctrl_wifi>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 7d34b820e3213a3832c5be47444d4e9c636a6202..90ec73068a6deb71554b62be951f3010a4e8c5c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -119,6 +119,13 @@ reg_vcc_3v3_sw: regulator-vcc-3v3-sw {
 		regulator-max-microvolt = <3300000>;
 	};
 
+	reg_vcc_1v8_exp_con: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC_1V8_EXP_CON";
+	};
+
 	thermal-zones {
 		soc-thermal {
 			trips {

-- 
2.43.0

