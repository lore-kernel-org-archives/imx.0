Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023120.outbound.protection.outlook.com [40.107.162.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE882BCF45
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 06:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214894; cv=fail; b=iyIdwCJqjH1+VaFCMp/DtcFCrxaVhWmeLv9FCEsDYcfVpxZaKmEl0WIW1FnAFYBHEcwkZNEH1Yvcs67Adikh9YM5bXtheegA93MzjCV6+ySa60Nl0Po5hcZzZKGlfVDhkVZFby11+5DTM99ZsCRbf1Y5D9VPkJQMBiIER+nu0Co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214894; c=relaxed/simple;
	bh=A5f7eG5Vc8W3fUMBpXMsbVzaSIQD+oNkCAtb1O0hhtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g633OrT4tj4bsfUR5kxitYyIcIHE6MOvosTy/+KerqcFSAwp/NAazcdsxQPmLJBHm1pQyApwhtdnqSPF5DlH60c9LmXu0e97LIKdhr/Zqhc3CEE7ZgeaH1AHvga9+xLM92O3wQ2BIoQIIWuTNDEAWDEX4ij0mTVixQRWngarCjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=XN0lJyja; arc=fail smtp.client-ip=40.107.162.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="XN0lJyja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzPmea+vEfXAvg0WvWEs5SYrBVHeGZLIelZIu8J59QnaHe0SX7zrnMneSlfbXtTpBGok8bzlQ66nkqNNZhimuiN0tFlBa2MUSzHWjT6EZTzvcjBktoy7WI/dtS9fZlrxHW4fMkTmlhKchT12YA8PLwl/E9c/UyoPd+YZfpVH8Suvqx76xB+UgRvGZfQDkMnLhXidF2PfaiQj2EcYNtHRh4QbC07/PbUfmeHOXekQ96ECOG/jMV4kdbW1JMOvItkdxe+OVmz8l6NGWjOHGd4SyNluMzTMgCIvaADxOOA2I1F/u9AkGv6RUVQfuS6v1w2l5OcvAJNkbsRBQYLlQWWm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZKj4oNonDTvbD/JLwbIUiCkk2Sb55s15U28K8EVUEc=;
 b=tUC9E59S8vuCpK8o+APbq094efZo0my6TiIeaILQ0ts18LsYorQcvJiEael7NLjn5EK9fqnV7foCMN8LUrrFSs0OGEtO/FfWNDdVlo+tGumVF9caWIabwbjsbIJBmh922bR0J58Oo7nEnNZsba103nGIFAtlnRa+S5tEEPPnWkb/wMTDBU7c9TJO9VGVrkhR3TIY/Fe8sjQGE9SXNMhXyO9VBZ5oVaHCEIZz0s4hLW+AFfrmH/1Ko8zaJb3nglfSOfpCyjr2/auWPQVQ343nlOBbIoxBchdHDX/XGRPOiFKV2/ivzgx/BznPnSJVQ3fHBXx6pX3sUrVufnQ58SBzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZKj4oNonDTvbD/JLwbIUiCkk2Sb55s15U28K8EVUEc=;
 b=XN0lJyjaxWJuVfU6O3aZ+kpEb256CshVToUa4I/pa7KKTqdb6x6PVjjdaso0Q0pIqzBksyhyK3YguD+0bJLiwqm7ozPVh+m3LO4SjP8uoQuXa9Fz1Qe0daHcOIbfCLqCof0duhajxOB54uKi+QnHEefk4m+Dfu9sucFLXLYNocXusjXQly0OD+EcDtcblYzrN29fGt5KUSXe/0LcDzvS/4lZeCBFfqu9jH3MI5vD+wPl6OK2sltELPOYhNE7AEdUGoShqBmh3TudTQw7TF4h183MzRca3VOWrUSofYPD+firpSxRfm3BUWQ6zKlOzznX2t6Khq81sPkNojNuONPFpA==
Received: from AM8P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::35)
 by AM9P195MB1249.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:48:05 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::24) by AM8P189CA0030.outlook.office365.com
 (2603:10a6:20b:218::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 06:48:05 +0000
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
Date: Tue, 30 Sep 2025 08:47:47 +0200
Subject: [PATCH 4/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: split
 display configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-4-d5d03ccbfca1@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|AM9P195MB1249:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4585ba-8ac4-49c4-d75b-08ddffed4eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEZhK1hIY040WWNOM00xNXN2cDIvR2ZNY3BUN0x5ME1Ob3ZFb1FoT0lONEtP?=
 =?utf-8?B?eEtQZEhXSmx4ZU5SdnRNRjlKS0RjSlduMmkzUjAvczFoMm1EeGhOcnpFZmRN?=
 =?utf-8?B?N0ZZaU1NK2RuTDk0WTBsUlZUWUNlRlZFYnNSMnRJWTFyRUp6WWk4d00wN1hi?=
 =?utf-8?B?cG1FbXlQZFVWb2o0Q2JIZlBxeDBXU2VVUStGYmFjdGl1YlVGTHgxSUJCNzJF?=
 =?utf-8?B?cTZWMDVKSnVBVmpOUnJNakUxZ3UzclNZNElIMTAzZU9wNUE5eWd5MzI4bTdZ?=
 =?utf-8?B?bVdpSTJ4ZzhXUjBFVWJKK2NnQ3d1bjByMkVXM25MREZuTjdpbTl4QWphdXVL?=
 =?utf-8?B?d0FiMGM0WEU1OUQ1dW1wdUszYXJHUWpjMSs3czk4b0JiZEkzcy81WldpL1Ns?=
 =?utf-8?B?WEJJN1JqL0xqZ1VmVjYzb0cxb21MNzE3Y2dWdUExY0QvZkQ1L2E5emtpRzhY?=
 =?utf-8?B?MXIvYUIyTHNLOFEyVkZZQlpXQmVBZWZ6SWY0Q0JNZWpEeDBIVEFwbVlQL21m?=
 =?utf-8?B?elJJOU02QWl0aDBrUGhNSEdnUTlLVUlKL1IvQ3JlV2ZsRzNaU0k1dk9TM1N2?=
 =?utf-8?B?Y21NbEtxM09qMkZpbTBxMGl4MjJtVktFNncwQnlidlVXM0RiRWlockJsaE81?=
 =?utf-8?B?YXl0bmhld2hxellJMWNiWHNVYWJqQlpuS3BPM1JFN09GaVNPRkYyRWV3dU90?=
 =?utf-8?B?SE5tT3F6Y0cxVXZWV3JncWxSWWk3SVEvbUhad2NqUUtub3BKUTdJTVkvd3Nx?=
 =?utf-8?B?anhnQ1V6RXozYU9MMU8zaTlYQ2dVK1ZReVIyeThqWnI0Ti9veGFidUxUdWlF?=
 =?utf-8?B?ZmZrd3RGSEUyWmVqdGRGKzdYYVlQaVEyc0tpSjdWZkpOaWpkVjl0TlFwQk1k?=
 =?utf-8?B?VHFvcmdZeHRVamNka2ROY3Jha2t6NXRPcUVOaUtKYzFFbUo1T0FSZEdzNU1k?=
 =?utf-8?B?dXhOanAyZ1hGditIaXMySmh1VzRObFA5ODBoNlZWa1BETldVYkFoL2xBMFRF?=
 =?utf-8?B?aHFlY05IdmN6NUJCSWFjTW5PSWpIS2JNeGFGb1NBTFFPblJmNGJnbUlTVkhU?=
 =?utf-8?B?SVFlQjZMU2VTcVZJTitFZFExRCtHSHRsZXAwNmJDNys0NERUY3hsMUhmTitT?=
 =?utf-8?B?M2tyT0pNbjFIUHM4dXc3T1ZlSmhHQnVFZW01Yi85WHJpUjcvR2lpTWg0Nmo1?=
 =?utf-8?B?SFV2YWdhSjJTWDZHbENDUytnSFd1NXpuUlBDZEtnM25kbldYQVpDamxoZXh5?=
 =?utf-8?B?WUhDOExjZGtlR3FCbHIzc09SZUUzby9kLzVhdlAzaDdvc1ViNHlJdHFCcmhV?=
 =?utf-8?B?dVJQdHNyaGpUcnlpaEYzMnltb2g3aDQwTnBndVptaWd4RGpSdmdTTDgyOHFD?=
 =?utf-8?B?eGtPMkR3MGZEMjRyRmV5SW1vNlZYTTN3V3FMNyt0c1R6VDc5LzF1aHBKeVB4?=
 =?utf-8?B?U2lzdlpjaUE5aUc0TzVRK3N6QkFLYlM0cjh5YmZqZ0pWNUM1MlhhcnRlYmdy?=
 =?utf-8?B?WVhlbndzYXhnNkV0TWozUU1lSk9DWkRtTXE4S2ZRa3loWGp4OXNyYjhyMUhE?=
 =?utf-8?B?VUZVMkgrTUZML1BtUGoyQTN1cTBiR25zdTdnQWNxMWU1cHNaMGlLSFAzRUt5?=
 =?utf-8?B?UmplNElzOVhaYkJrZWxLQUlEN3duNFpQeE81RmFWYlV2cTNuK050WGllalJq?=
 =?utf-8?B?UUdtWjdiMXlJYVhwVWJzbDZuNVZWRDRyazZTbDAzRUZDK2xubU5aajladHFh?=
 =?utf-8?B?VTA2VDU5aFV2eGgyOXJoMWg5Rlo3WFFocG9iUHRmOHhYeXVDZ0pjaVdCUmRh?=
 =?utf-8?B?cXlXbk4vd3BrczErTStidUZGOE1CYmZtMU5KKysxVnRQT0JObTFGamQ4cHpL?=
 =?utf-8?B?RHhPVTZqakEveFVwNGhoMytnZWRYU1oxSUJMRVZ1WUh1SWpvWDhGNTNncjBs?=
 =?utf-8?B?OFFUZmMxNGxQSjdrSWJBa3ByUnc0S2dhMFNSQTE4VEc2RCtZdlV4WjJTSUNy?=
 =?utf-8?B?dUlURVFmVHlsczlFNW5uYW1BZldQd2tYVUVHcE1SU2tma3VGOWJNM3RqR2hp?=
 =?utf-8?B?dHViRms0MldUdHZtR3VLbzhlRnRYeXdGUE1sbEVXR3dUNFljbGpYaXBVc1JH?=
 =?utf-8?Q?Pc9E=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:48:05.2689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4585ba-8ac4-49c4-d75b-08ddffed4eee
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1249

The PEB-AV-10 board can be used with different displays or in audio-only
mode.
Split the device tree overlays to reflect these use cases. To use the
board with the EDT ETML1010G3DRA display, the overlay
imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtbo must now be used
instead of imx8mm-phyboard-polis-peb-av-10.dtbo.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 ...8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso |  44 +++++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtsi | 189 +++++++++++++++++++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 203 +--------------------
 4 files changed, 237 insertions(+), 202 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23535ed47631ca8f9db65bec5c07b6a7a7e36525..98fac7e718c06c4e860ec8c9db72ceff72268232 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -134,12 +134,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
 
 imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
+imx8mm-phyboard-polis-peb-av-10-etml1010g3dra-dtbs += imx8mm-phyboard-polis-rdk.dtb \
+	imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtbo
 imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
 imx8mm-phycore-no-eth-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-no-eth.dtbo
 imx8mm-phycore-no-spiflash-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-no-spiflash.dtbo
 imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-rpmsg.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-no-spiflash.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..189818eb8316c655be3731d0a675970499eac31e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
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
+	compatible = "edt,etml1010g3dra";
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..3d4ffeecb8dd8e6f7a68eeafba761534fae9deb4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mm-pinfunc.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcd>;
+		power-supply = <&reg_vdd_3v3_s>;
+		status = "disabled";
+	};
+
+	panel: panel {
+		backlight = <&backlight>;
+		power-supply = <&reg_vcc_3v3>;
+		status = "disabled";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+
+	reg_sound_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8_Audio";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_sound_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_Analog";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	sound-peb-av-10 {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "snd-peb-av-10";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,widgets =
+			"Line", "Line In",
+			"Speaker", "Speaker",
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Speaker", "SPOP",
+			"Speaker", "SPOM",
+			"Headphone Jack", "HPLOUT",
+			"Headphone Jack", "HPROUT",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In",
+			"MIC3R", "Microphone Jack",
+			"Microphone Jack", "Mic Bias";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai5>;
+		};
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+			clocks = <&clk IMX8MM_CLK_SAI5>;
+		};
+	};
+};
+
+&bridge_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	codec: codec@18 {
+		compatible = "ti,tlv320aic3007";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tlv320>;
+		#sound-dai-cells = <0>;
+		reg = <0x18>;
+		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
+		ai3x-gpio-func = <0xd 0x0>;
+		ai3x-micbias-vg = <2>;
+		AVDD-supply = <&reg_sound_3v3>;
+		IOVDD-supply = <&reg_sound_3v3>;
+		DRVDD-supply = <&reg_sound_3v3>;
+		DVDD-supply = <&reg_sound_1v8>;
+	};
+
+	eeprom@57 {
+		compatible = "atmel,24c32";
+		pagesize = <32>;
+		reg = <0x57>;
+		vcc-supply = <&reg_vdd_3v3_s>;
+	};
+
+	eeprom@5f {
+		compatible = "atmel,24c32";
+		pagesize = <32>;
+		reg = <0x5f>;
+		size = <32>;
+		vcc-supply = <&reg_vdd_3v3_s>;
+	};
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+};
+
+&sai5 {
+	assigned-clocks = <&clk IMX8MM_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL2_OUT>;
+	assigned-clock-rates = <11289600>;
+	clocks = <&clk IMX8MM_CLK_SAI5_IPG>, <&clk IMX8MM_CLK_DUMMY>,
+		<&clk IMX8MM_CLK_SAI5_ROOT>, <&clk IMX8MM_CLK_DUMMY>,
+		<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_AUDIO_PLL1_OUT>,
+		<&clk IMX8MM_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
+			"pll11k";
+	fsl,sai-mclk-direction-output;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+&iomuxc {
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL          0x400001c2
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA          0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18        0x1e2
+			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19        0x1e2
+		>;
+	};
+	pinctrl_lcd: lcd0grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x12
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_MCLK_PWM4_OUT		0x12
+		>;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK        0xd6
+			MX8MM_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0    0xd6
+			MX8MM_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC     0xd6
+			MX8MM_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK     0xd6
+			MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0    0xd6
+		>;
+	};
+
+	pinctrl_tlv320: tlv320grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x16
+			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20        0x16
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index 74547642a34aadc60ace9a9cd2ddea37877d6aeb..28e8589f9f951ad79dfcd4d0ca2335fafdc683cd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -6,205 +6,4 @@
 /dts-v1/;
 /plugin/;
 
-#include <dt-bindings/clock/imx8mm-clock.h>
-#include <dt-bindings/gpio/gpio.h>
-#include "imx8mm-pinfunc.h"
-
-&{/} {
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		brightness-levels= <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
-		pinctrl-0 = <&pinctrl_lcd>;
-		pinctrl-names = "default";
-		power-supply = <&reg_vdd_3v3_s>;
-		pwms = <&pwm4 0 50000 0>;
-	};
-
-	panel {
-		compatible = "edt,etml1010g3dra";
-		backlight = <&backlight>;
-		power-supply = <&reg_vcc_3v3>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&bridge_out>;
-			};
-		};
-	};
-
-	reg_vcc_1v8_audio: regulator-1v8 {
-		compatible = "regulator-fixed";
-		regulator-max-microvolt = <1800000>;
-		regulator-min-microvolt = <1800000>;
-		regulator-name = "VCC_1V8_Audio";
-	};
-
-	reg_vcc_3v3_analog: regulator-3v3 {
-		compatible = "regulator-fixed";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "VCC_3V3_Analog";
-	};
-
-	sound-peb-av-10 {
-		compatible = "simple-audio-card";
-		simple-audio-card,bitclock-master = <&dailink_master>;
-		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&dailink_master>;
-		simple-audio-card,mclk-fs = <32>;
-		simple-audio-card,name = "snd-peb-av-10";
-		simple-audio-card,widgets =
-			"Line", "Line In",
-			"Speaker", "Speaker",
-			"Microphone", "Microphone Jack",
-			"Headphone", "Headphone Jack";
-		simple-audio-card,routing =
-			"Speaker", "SPOP",
-			"Speaker", "SPOM",
-			"Headphone Jack", "HPLOUT",
-			"Headphone Jack", "HPROUT",
-			"LINE1L", "Line In",
-			"LINE1R", "Line In",
-			"MIC3R", "Microphone Jack",
-			"Microphone Jack", "Mic Bias";
-
-		simple-audio-card,cpu {
-			sound-dai = <&sai5>;
-		};
-
-		dailink_master: simple-audio-card,codec {
-			sound-dai = <&codec>;
-			clocks = <&clk IMX8MM_CLK_SAI5>;
-		};
-	};
-};
-
-&bridge_out {
-	remote-endpoint = <&panel_in>;
-	ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
-	ti,lvds-vod-swing-data-microvolt = <200000 600000>;
-};
-
-&i2c3 {
-	clock-frequency = <400000>;
-	pinctrl-0 = <&pinctrl_i2c3>;
-	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	pinctrl-names = "default", "gpio";
-	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "okay";
-
-	codec: codec@18 {
-		compatible = "ti,tlv320aic3007";
-		pinctrl-0 = <&pinctrl_tlv320>;
-		pinctrl-names = "default";
-		#sound-dai-cells = <0>;
-		reg = <0x18>;
-		ai3x-gpio-func = <0xd 0x0>;
-		ai3x-micbias-vg = <2>;
-		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
-		AVDD-supply = <&reg_vcc_3v3_analog>;
-		DRVDD-supply = <&reg_vcc_3v3_analog>;
-		DVDD-supply = <&reg_vcc_1v8_audio>;
-		IOVDD-supply = <&reg_vcc_3v3_analog>;
-	};
-
-	eeprom@57 {
-		compatible = "atmel,24c32";
-		pagesize = <32>;
-		reg = <0x57>;
-		vcc-supply = <&reg_vdd_3v3_s>;
-	};
-
-	eeprom@5f {
-		compatible = "atmel,24c32";
-		pagesize = <32>;
-		reg = <0x5f>;
-		size = <32>;
-		vcc-supply = <&reg_vdd_3v3_s>;
-	};
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&mipi_dsi {
-	status = "okay";
-};
-
-&pwm4 {
-	pinctrl-0 = <&pinctrl_pwm4>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&sai5 {
-	assigned-clocks = <&clk IMX8MM_CLK_SAI5>;
-	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL2_OUT>;
-	assigned-clock-rates = <11289600>;
-	clocks = <&clk IMX8MM_CLK_SAI5_IPG>, <&clk IMX8MM_CLK_DUMMY>,
-		<&clk IMX8MM_CLK_SAI5_ROOT>, <&clk IMX8MM_CLK_DUMMY>,
-		<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_AUDIO_PLL1_OUT>,
-		<&clk IMX8MM_AUDIO_PLL2_OUT>;
-	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
-			"pll11k";
-	fsl,sai-mclk-direction-output;
-	pinctrl-0 = <&pinctrl_sai5>;
-	pinctrl-names = "default";
-	#sound-dai-cells = <0>;
-	status = "okay";
-};
-
-&sn65dsi83 {
-	status = "okay";
-};
-
-&iomuxc {
-
-	pinctrl_i2c3: i2c3grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL          0x400001c2
-			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA          0x400001c2
-		>;
-	};
-
-	pinctrl_i2c3_gpio: i2c3gpiogrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18        0x1e2
-			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19        0x1e2
-		>;
-	};
-	pinctrl_lcd: lcd0grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x12
-		>;
-	};
-
-	pinctrl_pwm4: pwm4grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_MCLK_PWM4_OUT		0x12
-		>;
-	};
-
-	pinctrl_sai5: sai5grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK        0xd6
-			MX8MM_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0    0xd6
-			MX8MM_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK     0xd6
-			MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0    0xd6
-		>;
-	};
-
-	pinctrl_tlv320: tlv320grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x16
-			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20        0x16
-		>;
-	};
-};
+#include "imx8mm-phyboard-polis-peb-av-10.dtsi"

-- 
2.43.0

