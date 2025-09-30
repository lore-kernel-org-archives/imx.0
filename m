Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021136.outbound.protection.outlook.com [52.101.70.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1829E101
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214895; cv=fail; b=bhlbNEj/2ZI086rBZWdn8QptOXFlXcgrKz9EeC/o9aYExzQpN7YZh8wc7vQkosCUefB9b9A/D66ZosLRSGJEnxyPIPTasEdrOmdLJEocv6iXYqjUpYQNjqOC8TacgskesNSKVqJK0zbcCOJmMQLp6TsOyuu48nqQM9yx7tblSlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214895; c=relaxed/simple;
	bh=phNdSOy44HTILMKgoFU4S/oEUsUZk7w/MIBEB0GMrus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WUsFjSmeNRwm3314hQaHd4zZliTppKjHv69Y4L875Trz3URYSsjmDxnrYr5KwsdqC5yQJ4PDrPAWiEUwMJA2l37Hb/ZuA7vOr+VpKIkgXEbXEfaNm0Q8ndXPHHSSLIsSxPbwYwC3Z8gtny9UsdSmhAVakgJc4Hlqsxghsd6SCn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=VNfMMJyI; arc=fail smtp.client-ip=52.101.70.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="VNfMMJyI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fo9Rh1CfM2PYnE+M/zI51pT+0zQCIcd2zuUiB93L0WxiSpyQtP58k70NzNECtNqrBSUCEUvDJ3AIIzyTUekJdjrFgmpZ2gd7YyLonTackd5uqGT16f2YnqiDztTl9xZa7/vF7NQOq0KJGfywH4CfgrknE6YWJ/71M2KgQTUdguCGCKky38u7/s9MrrJ8nwMlxbFW0aQ4HHMALyvIzabcb9ZqYXfUQQbwtlWdTjhHinu6aDTMubbSM0qwmgoYmTUxN+whFmokEii0+Q0SBYWNI4FEezF6Gkbzk3OKpbcY6FZnVKUx7//zoKi7tc7AesAPe2iG0xDeyUvUv9kTgBIBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfI310tEwUyZm4hWHMYEnpR6cAGvgmd2e7JW98ae+mM=;
 b=YA7OKbPOInCpGibBAgnoPAxwd+UP//ujZKMxBTW00r7TOKXaRzdPD5uplp61IS2SBLsWX9sGD7qo2m40q+/2HyW6FbFqP0xRwyOw/Q6SS2LiIdsanCemSMKedeH9e0gWbAp+U6/lHNBaFFrBVqEQrdtQJuZpVaoKzaJidlhgsoctVRgXppLBYLg47cJMcfLfLjq+OopNsCxQnEA+r7hdo8nDYUQuWsrgvBWwccgxMlLExB1hC1BLQTnUHEPQVqPeI2BeYIehij/ixTtV7hvrxIDHBhJ7jYb3SLjdGACFAEytQSnDZuRAY+qlzfnKk/Z+nONcmyY4Qu5KWBF5yiKB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfI310tEwUyZm4hWHMYEnpR6cAGvgmd2e7JW98ae+mM=;
 b=VNfMMJyI6N17S3hwIyYIk8XP86WF4lbIVnus2ziAxnhCpW4CZ2FkqetxKuJxwFh+bUvIk4dxZ55370vSVMnB6Ui+Ue8XiAmBzTbNx9boY3GWZRWuMSXBzeG2s7cEeyZ93VVnd+Rl69hjdHQ+1U0zg4yTPzv41YRs0SMCzX9722E8fzKZ2+t7gjKPJe4CWyFrBCAp2HvufEgKAypQG7YEDhR0YqgejCTJ1fsUn3au+uIhRlhG7UWdl1o66FYODjPvbxmaljCWyS+/gD54pJgGZOJhTCPzQJrgmW2/QMFyOSJNUX5k/v0CkkSLoosgwDsGNuK7M0PRai1wXaP2znhhCw==
Received: from AM8P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::11)
 by GVXP195MB2588.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:48:06 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::a7) by AM8P189CA0006.outlook.office365.com
 (2603:10a6:20b:218::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 06:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 06:48:05 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 08:48:04 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 30 Sep 2025 08:47:48 +0200
Subject: [PATCH 5/6] arm64: dts:
 imx8mm-phyboard-polis-peb-av-10-ph128800t006
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-5-d5d03ccbfca1@phytec.de>
References: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
In-Reply-To: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|GVXP195MB2588:EE_
X-MS-Office365-Filtering-Correlation-Id: 21721e99-8e4a-4ad1-3ea4-08ddffed4f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDlSU3ZQSjlSSkpZWk5ZUC9XOGVuR0xEN0Vyak8zd3h4S045bEUvWGtKM0Yr?=
 =?utf-8?B?bE04QzJIbGRraWpRbjVUcVVETkZmLzd1aGJPZDljUTFOME9kZnpWTHgvM3Nm?=
 =?utf-8?B?Nk42eDFPR3h0WldkM3VtZUt3dE0rZmwxNEVWSXFGZUlIOGFXTjNETDc1WHpB?=
 =?utf-8?B?Y2dIWklBblV0TkdHdEVlVTlWcDZxeVpQRDZGK0wzb0poMW1nM2dhc1drMERH?=
 =?utf-8?B?V2R5NndRV0ZlTS9oRmhoaitEbUpQSGhQLy9SUTV1bVF6enJyTS9IcHB3STR5?=
 =?utf-8?B?MThsZ0lWbTFsMHVxTDJZM04wMGlvRDdFSit4UTFyZ0lSWStCdFRqdHp5VjZP?=
 =?utf-8?B?VEFWSnVNTllYbVFuNGdzNFBENEhta3BSUE5oTkUxOUVQTEdNYkF3NWhBQkZj?=
 =?utf-8?B?VVI4ZDhpMkJmQ0I5SjRrRC9xM1NqQURWMCs2Mnl5bTNjK3VlSkE2K2g5MmxH?=
 =?utf-8?B?T1pCSE95bTVIcFRZV0Y4cUZWWk5EcDdxSGZnV285N0VwT1JheTUwSTNhYmM3?=
 =?utf-8?B?a2sxZXpYREY1VHJQWVR3b2l3UC9ERmg4b0NCYXBFOThkMEM3eFNwalhYYklU?=
 =?utf-8?B?U0V0UENIZmNYL0owT2ZGSC9mMnA4RW9lZ0RFa3Q1b3lmYnpPeTltYVdJUXh6?=
 =?utf-8?B?ZkNLb2h1N1N6aTVZZlFEa1MrL05OeGZuQ3Y0LzhNQmdQNHhZUmNsZUxyb09k?=
 =?utf-8?B?WDVZZTllTmhkTTBrVk9MdVNYbTV0blFVYmN0RnhBUTFic2NDUFc2YjRabFlo?=
 =?utf-8?B?WnZjZklrUGIyUytpcTZwUEg3V3NtSXcwMWlyWnV3b25tMkRlaWl5Q2FzR0hz?=
 =?utf-8?B?ZEkvbEJKL29PT2FzWVRPS0FBU3doTkNVajFZTDlqaVZOb0FwVm5RWEZiL2lr?=
 =?utf-8?B?bmtLR0ZtVUJldTBTdjlneU1HeU4rdmhFbXYxaVJkMEh6YkhxR285SU1QL2JF?=
 =?utf-8?B?VmZsVE0ybURzTWhVU1lBbDdjMU1aMzVVKys4RHdSWGtYT0JuclJ6eldWakVv?=
 =?utf-8?B?NFVuenViSVRsMFh6STVuZU91bklZZFVkQ1FDbG1WNG05TFRvRTVVem9Gamoz?=
 =?utf-8?B?c0FFUUh6L2V0SStlR2VwUFdPdlpmM0VXM240MlUyblk0ejFwUTYwNUlqWHFj?=
 =?utf-8?B?dDJMUkZJRnBaT1hWckVQQjh0N05vcEszb0NUTE1qRHhXdjdkcU5WeTNHNHlJ?=
 =?utf-8?B?dU9NamRybitkUkdKVlcxaXh5TEt0SkIrOStGazZxWE5YZklZVTdxbWNMeTFX?=
 =?utf-8?B?OWZudU5PQW9MVkY5aWpMSFBPdTB0WGF2YllCNERnNkVVcm9rTWliR3ZTZDRO?=
 =?utf-8?B?SHdNVUdRWXdSTWlieU1RZTFERllOd1pJNHYyc0pxRVBGemhrYWxmamVhbWE4?=
 =?utf-8?B?bmI3YkhMZXRsQnBQaWI5SFVoQ3JZZEp4QlJxcEdBM3l1Vk5CaDAxTGdOeTIw?=
 =?utf-8?B?RTNFcDg0LzhlbXg5cDNBbVpHR1RxUTkvcXVmZXFJSTV1UFFpZFB3SWlkVGR0?=
 =?utf-8?B?NDk5VlN2MFErSHFYeFd1N2I1SWhvSHhoOXEzZWQ5b0dSeXlzOWdJbTlBV2ZR?=
 =?utf-8?B?dkMrUnJocm9rdlc1WThaZlU2MzdoNTJmM3NOUEM2eFBEM3l4NzFTd1c3SVpD?=
 =?utf-8?B?RWNiMEhiSHMycVFUak1pdnJPT3pUeWdJaFZhclI2bFhmN3F2ZzJYWUh1dGh2?=
 =?utf-8?B?aU43WkhhSmFCWmxlV3M5M2FvakxYOVBOLzY2ZzR4WXZIT3BheWE0bXlWa2VD?=
 =?utf-8?B?dzgrYzlWUTREMUVMTzlhWThkTG0rTk85Y0R3eFMrY1c1d1VzS2NxalpZZ25t?=
 =?utf-8?B?b2wzd3k5bFBFQnh4U2FQbkI3U2JYUzBTYWgrUmJHNXMwMDdTbEs5L08zZm5o?=
 =?utf-8?B?MGRVeElXT21tbytpblhpd08rTVY1WkE0OU5QdlhzdUNIVnNUR1NvUXNZd1dO?=
 =?utf-8?B?U1pVMmVxVzE3cUV3d2hEb09ObG9lQjBkUHRXMW1pNUw0ZEVLUnBxbmw2VFN1?=
 =?utf-8?B?SnM4MEFELzF1Mm5qU1A4c25lRDF4K2w4V3lxQzVjVkdjSVk0UkdBMHB0SnUw?=
 =?utf-8?B?OUcrZWVIbDNGRlpRZW1qSjZPNC9vVk5lTUJOd3pwcjg2bE8xNTF6aWdPWTYz?=
 =?utf-8?Q?ZT9E=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:48:05.9724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21721e99-8e4a-4ad1-3ea4-08ddffed4f5a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB2588

Add support for powertip,ph128800t006-zhc01 connected via peb-av-10

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 ...x8mm-phyboard-polis-peb-av-10-ph128800t006.dtso | 44 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 98fac7e718c06c4e860ec8c9db72ceff72268232..a5b96c6d52b5fa6ef816421a6fe527dba28017e4 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -136,6 +136,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
 imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
 imx8mm-phyboard-polis-peb-av-10-etml1010g3dra-dtbs += imx8mm-phyboard-polis-rdk.dtb \
 	imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtbo
+imx8mm-phyboard-polis-peb-av-10-ph128800t006-dtbs += imx8mm-phyboard-polis-rdk.dtb \
+	imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtbo
 imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
 imx8mm-phycore-no-eth-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-no-eth.dtbo
 imx8mm-phycore-no-spiflash-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-no-spiflash.dtbo
@@ -143,6 +145,7 @@ imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-rpmsg.
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-no-spiflash.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3019564f47fa86d0abb2f3fbe91644b06c99cc6f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mm-phyboard-polis-peb-av-10.dtsi"
+
+&backlight {
+	brightness-levels= <0 4 8 16 32 64 128 255>;
+	default-brightness-level = <6>;
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+	pwms = <&pwm4 0 50000 0>;
+	status = "okay";
+};
+
+&bridge_out {
+	ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
+	ti,lvds-vod-swing-data-microvolt = <200000 600000>;
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	status = "okay";
+};
+
+&panel {
+	compatible = "powertip,ph128800t006-zhc01";
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&sn65dsi83 {
+	status = "okay";
+};

-- 
2.43.0

