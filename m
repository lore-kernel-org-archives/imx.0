Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021082.outbound.protection.outlook.com [52.101.70.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6E287502
	for <imx@lists.linux.dev>; Tue,  7 Oct 2025 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824786; cv=fail; b=Zb4ELprquYifzGRYkMYmH5Egl+D9RIwAqYQQBuOcxy/MOSsBK9DbPYQfzJjXzoo5GBtRyqrhVRaxjQmunHrcykanC9oIKzeOQIn056Ou4qlWC9c7t/6EMI7UH1iHWxSsbg4CRStm6M8cQPqe5N/+wlKCBFjEMygXNFn3qfGvjGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824786; c=relaxed/simple;
	bh=phNdSOy44HTILMKgoFU4S/oEUsUZk7w/MIBEB0GMrus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BsLiovbgKi6L/eSQgwHLtbmFbLaVNzOuFIQ5evgcW3NVvUn9gSvgC7jZ6egXK13ffn6lHRPsQky5uyv8oD78ssnX++dFhS9g3FFBFD+KTHSlCwslPo+ySiAoHImB3G7Wkyz9xTY6cEe+pep1v/Yfof3OFd1E/mCEhzWR6cPEMhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=k5jxDh3Y; arc=fail smtp.client-ip=52.101.70.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="k5jxDh3Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5EZz0fZicyvEiLQtyWaU9OBtvaxAg9h6JEO/QUqDcmXCTK/wzpTMFS+5ZRMCHe5tkBUhbivM0C0HfIftWIYiv4p3LlGBtzK/MD0txNBZa1AD9hR7ZuNbfhBg08JJeLQzm5CFov3mUV/mZV5G6dDY7PaLjsP5mmxMR3F5QbxB1s5Q1gjXHE31s22rj3eIkZvUUMD4R60o/77qQnNnv6TXcsRnSVtmMVkrIGSH/elhq7PB/NSobDvSoD8zvJSOLNV8SuIT0mFvg2f+FCmDPuar+YTw0cr3O04aXw5b3x8W+nR8fgWOARq8SA4t5JkKhptuWXTovRrzkSQL3aQa41xRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfI310tEwUyZm4hWHMYEnpR6cAGvgmd2e7JW98ae+mM=;
 b=bTFu2EXJnXEX2wkpV+JffU0E3EO2xZEE8OQ+HnfMewB6xcsAsfn2Lku5FjohOrhUG2Me0wEvDDY0lqha93CcPo0viwyCu+Zzow9pXprc1VMuGfroQN8TuP66dr60I8ctD5gNUcVbjz0H8FXeZ1sYIs9sh7A2InFR42svSFALW9TLEUjG7TQRDOMilvz0oelhyYFNyFa7GmKtD0SyJgIOHY2E1BPFm5Gx6/FXsVWmE2Qd1rk8vY02rz7zeW7T6NSJ6s5CdnZuwzeoG32/eQfBhrmB/Hae61jFVrHelNVjoKz7jZdKCg2Epd57CJBioDZOs48GTyDVVWWS/LZ67wPYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfI310tEwUyZm4hWHMYEnpR6cAGvgmd2e7JW98ae+mM=;
 b=k5jxDh3YNq5k8wnj/OuY/0tqtwIUqiLKsLPStU+DgwTxrvUqwyANNr+CsFS+kpo5UgPBRkAWMiFnz7r1LVwzrIoLFQVRacwC0TplC0FfwfhqsyV8OD7wwcUNrPsQKWznFk5nWx0Orr5TTCqgTcbEH8DFfw7ltC94FMQrZC8VtyvcOjFhinPKnYaIGNz73vzUu41wHOyvnhlGS2FCSz6oEznp8en1PusNDEg244IydpuYWQqMy0BYJsDgaM8bFiVzHry1qtt3JxSZwVllP9rUKsLflK92Pp8h0ekHLEl3dVBnJ09m9nBUNfcex0JJ3lWjIPHMv5y9KUjWtTWUtXZDMw==
Received: from DUZP191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::28)
 by DB4P195MB1970.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:12:55 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::ee) by DUZP191CA0017.outlook.office365.com
 (2603:10a6:10:4f9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:12:55 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:12:46 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 7 Oct 2025 10:12:30 +0200
Subject: [PATCH v2 5/6] arm64: dts:
 imx8mm-phyboard-polis-peb-av-10-ph128800t006
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-5-7e5de62c79bf@phytec.de>
References: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
In-Reply-To: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|DB4P195MB1970:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c3853b-4431-4c7f-be8b-08de057951fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZG1MbHZwOWxpSVZ4NDdRME1YUG9jU01DaTcyWTM3REp0c3hTWUR6UjhwRDVS?=
 =?utf-8?B?Q0gzWGMxdFpJTkxlcFh1dFFFdU5yNlhjdmJSbDJpbHJBdnVwTTltaThLWkdR?=
 =?utf-8?B?c3NYOVpJOWtZUk9YRTZnR2NMbUlWdVVhalB2OXV5OXQ0b2c0dUlPVFJNb0R4?=
 =?utf-8?B?OHNRUFFuUnJHNHZ2UnA2Z1BEWVJkY1JjTkYzWnhmOStkc2dvcy9wTWNVcnA5?=
 =?utf-8?B?VFV3TVVJeHB3cDNvR3ozaGgyNnR1cjBzdHRqKzFqRUo3Z1E1anBmL1ZDdWFs?=
 =?utf-8?B?SWdnQUgvQWloZm1Sa2lZS3NoNlIxNk5pYVhhYWR1L0VSbUJrU3VuR3JhTFZi?=
 =?utf-8?B?OGpBLzBkalRCNHN0dXJYOWVoemNJQ25RV3JOR2s4ZGZsNnQvdVVsL1ByMjMv?=
 =?utf-8?B?VW1IWFNvbVlQMDRrTVRaVUR5Z2xGMGhHUkswTnB2bG5lWTlhWjErMmZnVWw4?=
 =?utf-8?B?UUZBV1NobTl6NTZ2TWhzUkxGcnFPM2NTZms0djNOZ1FjS0tTVVNYR3daUXRH?=
 =?utf-8?B?Z1ZJbGErdWhJUStZeW5tRHlNeWZ4emphNjB3OGpaS3hKNXJHTWNiMk1qRFpD?=
 =?utf-8?B?Ry9hM0N1Qlh6T2hXV1d5bFpOdURZMHRNL1VadzZsZ1pzTVAyK2wwT1Bsazky?=
 =?utf-8?B?WHhrMHVCNDVveU9Ob2w1YXNXU1UzaE52OUU0YXlTYkJRRlAvTmZMOS82VVd6?=
 =?utf-8?B?azFuRDFMWGdIM096RUFrL29xM3pqQ2h6VkNWdURCeUJmRzY1VEFvREpxUkZm?=
 =?utf-8?B?Wnp6Ukdud3E2K2doMmE1TXhBWW1BSTF3aGhBeHFNSUtJc0NUWGdma3loZFRP?=
 =?utf-8?B?R2d0bkNqeUpUZ1V2UUJBZ1VnZEJYejdoai9lMFpUSFZyc0IvTGNFVmQvUjZk?=
 =?utf-8?B?QVI0ZXVPd3B1b0VMVmFoa0lGcXhlYjF1ZGFrMmwvMFhsQXJMc3N0Y2pZdCtK?=
 =?utf-8?B?M1ZrYTY3a2IzU1BIVFU2dVRIWFRZNUVtc0JVV29WSU5xZDhFNHBvdi9WSnJD?=
 =?utf-8?B?UGNOdkxVQk9UbFRHa29yMGtKRmY0d2lJZ2dIajdZYmJMMWNQSnVlTFlEWWZV?=
 =?utf-8?B?aHM0Y3pjQmhzb0ZCM2dvY3dRdGFTUklXQlVPODNKdzRub1N0QnZQdU1FMVhI?=
 =?utf-8?B?YWFVcVI1dkpqRDlocDdoNGRVZ0ZxZFVNSkoxN0RnU0NOcTB1b2VNcGJQM09q?=
 =?utf-8?B?SEF2cmM2RjFRTTZwZzl1eUtWbUJPYVpKRXNrOVFiUWYzQlcrRFdJaE9QbFIr?=
 =?utf-8?B?Zmo4eFdoV2phdTZoU3pvUzdDZ1pIY3oxalVsYTFaVFhlTmpHczNQQUxneFlD?=
 =?utf-8?B?dTBwb1NZN0hkemFwdzA5ZjZjQjY3WFpKTTk3enRvd2pQVFdXT1Z3VXJVMnc4?=
 =?utf-8?B?Y1R0dDR0VDE4ZS9xT0hFd2ZtN0ZremJ4ZHBJK3MxODRvRDFrK2s2ZlR5aXdD?=
 =?utf-8?B?bW5FZC9FOTkrOVB0TGlqVGgvcVEwaUJ1NUJFZ01meVpkOXAzS2djYitzS2Rs?=
 =?utf-8?B?SlcvT2lta2NvTC8rUzErVVprSDVCQnkxTUZlTEZlYVQxL0Rxei9sOWZ1RGFo?=
 =?utf-8?B?ejlwRWpUeWx4OUJVRXdPOUFydGxidm1jUk5TUExveEowVUQ1UlhWQWtmVmZn?=
 =?utf-8?B?ZlFtOXVMU1BhOHJVS3ZGaGRKKzY0Y3ZSKzJTUUlBYlJPTkcwZytYSDNucWVk?=
 =?utf-8?B?dHFNQW5NM0FKT3d0YTBRYXkwWE9Ha0pWbmtXajFnVHhTUjBWekpUR2F4VVM2?=
 =?utf-8?B?aWQ3SmNsMTVNMU1nbzNMWUxJdnA4WGF3bWRldXhzNUtya0VkSytaVHBvY0VK?=
 =?utf-8?B?UWY0ZDFsVTVCa1VHR0tsWndKNDNmT2RhdmhkVCtMcDVUT2R3ck8waXRyVm12?=
 =?utf-8?B?L1Y1cHZEdVcvSGRPYmFlYWVYamlEdUo1SzNlKzcrVlp1WXlsZUJnbkh5aDlR?=
 =?utf-8?B?eHVJQmFBSyszNjkwOHZnUGNxMTVhU2o5R0loTmZHYnpaMkJ2Z01mdEVFRHdw?=
 =?utf-8?B?d1dZY2xNMnpzdDl0Tm4zVUI2UUtKTnFCWW51cXBQV2pVUXI3R0dLUTI3dWpO?=
 =?utf-8?B?MS81cUVNejRoMWlUR3hUbFBjcXIxa0kxNFRUamllKzhMV2NaQUxNU2Nua3JG?=
 =?utf-8?Q?dEJM=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:12:55.7098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c3853b-4431-4c7f-be8b-08de057951fb
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB1970

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

