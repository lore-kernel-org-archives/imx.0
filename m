Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023096.outbound.protection.outlook.com [40.107.162.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DE52820CB
	for <imx@lists.linux.dev>; Tue,  7 Oct 2025 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824788; cv=fail; b=lPytYmylCHGZDYSpc5GQXV1W2h+f+FScW9g2o5bloo5Qb6FOSw2BDqrK+gQKQP9gHwJoqay6BnEdJVkCgikvFsYPW8xDbzqlzbtTCFGwUXtGnhlNGDs9j99J8Mxa/avlDVv+ZzLLgKa+t4VpEFJIL6Aw4lT0RMkvRYLFATMl+6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824788; c=relaxed/simple;
	bh=A5f7eG5Vc8W3fUMBpXMsbVzaSIQD+oNkCAtb1O0hhtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j8J54AkuASI0UWA3sFePydUs/VarYSQIX1PJXt4BD7pRFiFzBqE31LcRIt+vNsxcjGOc9ZjnteywU2vJSJR/pvGTMX+FNe4oo65RmwbAwlBNvOyy7dYJJVHNK5lclKgrAsTX5qCdVBIcr/ZJSShieHXEliTDOCEAwGIQdsCw5/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=TiXF2tYJ; arc=fail smtp.client-ip=40.107.162.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="TiXF2tYJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKMTY0xnXx3dlOFKRRhn2T+Tr+fcmCql+b9MoSuD6jK4/5xPadT2djUeqfqC6L4cD6/oLgL3wFrkRN2JvQH/+Btnx/h4Lht8/9Kdol+O+xZ0gga4H0GqCPOo+vza9pF2PYaCyNiuz0YcwYP+2oYtTaXTnpf5dpQkavTP6Ua71RbXfhpIDkOjjFACh+jAM+zGeNW9NdxUU3R3xp+G4JWm14Cq7MDFsf2rLfrbkTOtFS6HYASvSH5oHhbaFQaltgHi482ymB1J+EuVrzunbGZLaysQIooBloG5RNivf6sVeds8iJnVolWn/TbrEURjuJ354p70Gdq+YRiGj1UnoPjN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZKj4oNonDTvbD/JLwbIUiCkk2Sb55s15U28K8EVUEc=;
 b=ezDDPcPaRqgQgjMsmsJBOhEdeEGsDjHuniLPtyX/qa+JIBSK5uEBgyiVJw7LrDSQfw+DsbiCcibplM1zE6gtk6+ecuENjZlBhqzCwUuOrHhnOkviR+Q/3/RTPfhwaKJjuV8ocYYj8Y0QRPH6jVMvcdyl89x0ujf6LxGNoKkQ7Sbl1z5UDBaAFHwtZx00i0RHyxvk2rp3y5ew8GOf6dn2nkZhmos+Kgz3sVRTT1VXO9gyY2KmsB42J3nJgGs7DKV5NLrIFiVWfPpxlvRwaVZVTJscutl2yT9E3nZ+d2joYn4iRU20eyxZVn4IGk0tvV8/T7iYRknEJFI63KuCe47P5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZKj4oNonDTvbD/JLwbIUiCkk2Sb55s15U28K8EVUEc=;
 b=TiXF2tYJGn0FLpU0VqAWqsz3eCAYAJv6pEvOeKgf+mJlXBNsNxH9r2689vxNaV2ii+fjhX4vacmA2Ivn/DaG2IRDeFZB4ZAYl1bO7bVuBYNXt2J6Ucqok7FoziTzX6tpy8+iGx4XakegHM+TyVBFzI+kSH+lX2P+ak17aAuM8FrQLNd4382suMD1pVMjr1dcavqB+lTP7BAnDecXJQbDi7M/1PGXlkKelqPCR0yibvEBAP6JF77Mwtl57+vtdgkNN7vVfZ4rntseoyRvZAP7SofdzbPbJHbywyJW9pG5JH012Zu1UKv4u7NNF/bNuVN+JgWYMLqq6WwCKoa8YSnLZw==
Received: from DUZP191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::24)
 by VI0P195MB2625.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:12:55 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::4) by DUZP191CA0001.outlook.office365.com
 (2603:10a6:10:4f9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:12:54 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:12:46 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 7 Oct 2025 10:12:29 +0200
Subject: [PATCH v2 4/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: split
 display configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-4-7e5de62c79bf@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|VI0P195MB2625:EE_
X-MS-Office365-Filtering-Correlation-Id: b672a0bc-d17f-474e-1939-08de05795185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUE1eE40eEV3TktDbGFTVi9aQ0FnNDd2Y0NwZjhEUGt3YTdmR2wxWEx4ZUpv?=
 =?utf-8?B?RTBGbWlYNWpkSk15ZW9ZWUtDU29HRzFmOG9XL1M5SlgwZFl3bHgvTVRmWTZR?=
 =?utf-8?B?cHg4ZEtwZ01BUU14VWgra2hpRlNrbkppa3F6S3FiaXJ0bG9IM0l4V0Q5M1lN?=
 =?utf-8?B?TDh5Ky90RUxwVEhwWTZoVW5penpxR01SeHNab3lnS3FwcGhtcVZmUWd5VTRX?=
 =?utf-8?B?bE8wdlRjZnM1RDJBODUya3B1Zjhabk43RnRwSVZ5c0wyNGluQzU1cnJmUkd2?=
 =?utf-8?B?c3JzSEJHcmJjY0VYS1RDWDJZclpWbExva0Z4MnFjY2xGMkxuR09sc1FCR0I4?=
 =?utf-8?B?NFErR0NuUFFCRDBvazhwbC9yYzh4c21QVzlMSnNQMjNQZ3AwZzF2SVBlR3NR?=
 =?utf-8?B?WFZyRUx4SHFzVWw3WGxmOVdmaFJvK0tkSkVOOG56VzVEVHFVWmluWFE2ZHZu?=
 =?utf-8?B?NFZJUXQ2SytrbUhjS2NHelczblRlb2NrUnptRm9hTXM1ZVhpYlZWcmNvMGEz?=
 =?utf-8?B?eHVHcWZka1RVS1lIUmxJa3F4bGpwaGFENC82NWYvNTlGclA4cjh1RUMxcWtU?=
 =?utf-8?B?KytvYVlGWlBsSzJoRWpBY1oxdEgyeG5aRW5JQ21HZ2o0VDFCVWdCZitJdTRE?=
 =?utf-8?B?NUY1Nk9sU0IxRjRLQnBQMG5FQ0tUUGFYaXREdzNzN2pqS3RjVXlQbXRyWFVR?=
 =?utf-8?B?MTlmUnZqc3J4a2VVMUN1YjNSaEF6bmlKWlhIT3diYWRmM2xyY0MvclBXUnFD?=
 =?utf-8?B?RkNMUG5wZ3I5eGtSd2Q3QTVBMVZ5YXJVZ2FIK1F4VDRrWXh3cXNPZ2VseGZm?=
 =?utf-8?B?RGpRVFdKNnRObTdad05qQmdCTTJzZy9QelBwVEJ1Qzl2Rkd5ZW1iR2FEc3RD?=
 =?utf-8?B?a3NBRVkzNGEvaUlBUEhpMW9SOUZ5eThuVlRXR1RBOTRyMm9FU0txZVVQVmV2?=
 =?utf-8?B?cWhOM1ZKdXlPd0JsMXN6NEQ1U00vc2pZR3Y0N3R5cGY4WjhxcEh3TzZUSHBp?=
 =?utf-8?B?WUNTWEovTkNjNkYxZjdvSHZRMTBTL2ZHR1FkM2w1blZ2Q0JnRE5GL3cyd2Zs?=
 =?utf-8?B?UVhMRVNMMXZ5UjhEeURYRWdueVBaZlYzSjluWTFyRlhSaWdOWUUwUnFZM2pE?=
 =?utf-8?B?U0U1VTY2N1ZzejVzQUgrRUdWcHZnVmZRTUlydlVHUVRiWFQ5OW9vQmNDd3NK?=
 =?utf-8?B?M2hzWVhGRGRVOEVoNW1GQWF6anM0RWR2OW1PVDVCTUJDbjdZOFo4TmpsblNw?=
 =?utf-8?B?cG9XWlEzZWxsK1hHSFJCMVBhbzJ2bHkzT0FWZ2l6ZHdTODJIM2dBUEwydFcv?=
 =?utf-8?B?UnNiRUhOT1ZCNE84T2dWSWJ1WmFOekN3UnhmWnRONGJrcFFBWGxZcHhXSGxU?=
 =?utf-8?B?cjFxUTRVWFo5L1RlVVUzZHhUMFQwM2NYaGxkQ1FneEk2ZWU5NE1SRkVIS043?=
 =?utf-8?B?bVJUdGIxOGxkYjBOL01tbCt1RVJvSkM2VmtJVVNVMXppbTBtZDk5NVcyNWcw?=
 =?utf-8?B?WjRNc2RLYWU0ek4walBsazZBeER6T0M2VlI1M0FNaTJwblAyTXpYRXRCZ2x0?=
 =?utf-8?B?b0JpRHlkVWFCa05TMmtxaVc0T1dqSVUvRUJMbjRYRWFLdE9nY1ZHVGNlUXhG?=
 =?utf-8?B?QkVFU2krNThkdlhkYXkrdVFkZEVKZnlzdzkyOVBZS0pYMEIwVTJldmQ4RUNv?=
 =?utf-8?B?NUd1OGNqR0NqWHVjRXdNSkVqQmgxTGh4RUtVeDRPRDdtUkkyR1A3NmhpVUxr?=
 =?utf-8?B?STVZd25QQUdXVXBYeTkvZUFQYjZ1bjZ6OW9zVkxkdFNMKzh0QkkrNFY0RUph?=
 =?utf-8?B?YjdiRHd6QWF5aCtOQkFMOW1rQ2lXOFozK1FIalNERUVFM1hTQUZicHdycW5u?=
 =?utf-8?B?NWJxTDlPM1RUOVlWRjM5eHhyR04wdkg2RHIrVy9YanlYY0U3UmVXZ3VWL1Vw?=
 =?utf-8?B?bkNFK2RLTGIxdVhpSi94NU4xZklWNUgvMnF6c2xRdmJBUThTSGZUbTZ2NHlZ?=
 =?utf-8?B?ejY0WHEvbkVPVTN1VGtOb1dlMWNRS0doa2s5cXF3U3VkNDUwMitsWE1oZUZS?=
 =?utf-8?B?THpLOGpXblk0ZVNCdXJwWHMyMkh1THllZnJlaklGeEVqbVFRTXVFOHRLeHRo?=
 =?utf-8?Q?RjeA=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:12:54.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b672a0bc-d17f-474e-1939-08de05795185
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2625

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

