Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021132.outbound.protection.outlook.com [52.101.65.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0A62DCF4E
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642048; cv=fail; b=EWnogKf2RiS7DuZkggQHj4NjPvtnHJg7HOPewgc/c5j3a0g7sZlfYQIu1LwxVxa0Hk2K/G1j1/Hln7SVaBh0cCLFJ6N0KhHWZwSArAFPqzEtpHBhBAzY+HtDIx4t04KyH+3i7v6rUdbFKBy3S6m+RdpSIu9e+E/BrmKb3ZQp8OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642048; c=relaxed/simple;
	bh=yZofRjOrN5MocMxjWYSk8G+5HmyZakfbtQzip+8g0co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fflV5VSWciNh5vlaIG2UjyUz4+bjfr4bTovPcv6Jniz9VKc3jq7ryICFMzoRjVA6OEIPEaqUpwjDD97ncv01RGzmCKiq81xQ7O9LAciV4k399jH7IxN1BsZ4CUsdMix8Vj4G9pgt7bd/fnXccWQczadIbssHgVj6ef3b8Cjkua4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=nDevaAwp; arc=fail smtp.client-ip=52.101.65.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="nDevaAwp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilpapxMLz2jPUn5rPmTqCS1P6XeMS3zwXYhlbcMsRMaBx89N2BlLD9HIBxNR5SKM0IS7nJvBe03dqsS2ds1/pWDlYtNSRx5wBmFoeH3cQWBcZqPB7i71NAp0h87WUyEU3pC39soLdZ3VCU7C7gPrvV+iBy8hqtN9pckVYkfhMyHg32U971HL0qYjduHKbQG7LWz2+2wePZznp7GoNyr9WTu44t03by9iXgyad4EkWOFxe8iWLY8HeuMjU9m1a5NYH9c8ttTUNpE8k74GTAB3dyQHIISe6/WAkcH/VaI+xDNBxPlLGgsxeDY9go3SwRTcBpWO185lVGrOSBFuqZppOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6yqSN0/mM2ltoei5+TDHLBCx4xKYOhpP7gRGvyQD48=;
 b=KOAJjIHrD1COg+C+g36/QU3NgaHlJNe2qAIuWKQ+QP+8Mmr+e/n3P+Sqs62TzdT/Mt3HE0kH1Z8zTUiVTyZoXoF8n7IlU4+jeRyYZIVLk6i4HfbUxBV8lYTot+G/DLYqGWTZKz4vF6wyFxCx4zgkIEiuF5ZoY+7opdLy2+0BPfFj1ftGHyjOKnbuC7QuB5U+r7wdWlDsyeA5caJHGsYXjp5V1ZKNEj0XEu9YV2BawcBrC7qBJeM0JW5pnP0QP2KvUSUJHjNHofU/B3deO/deqEMKh7ROUJYmVqiw5gvV3DOnIMMwPNL+kjtlNpl5Oum0t6G+GvwlCNeBRUZPZsevtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6yqSN0/mM2ltoei5+TDHLBCx4xKYOhpP7gRGvyQD48=;
 b=nDevaAwpZqz9+snYPv1oOevmN1HtgON1+GlvWgB1zM0J32KUc7rGROzBqERGykBiP6RtvSFv51qY7RMvUo/LpzlTOKh5U89xpDAmlzV+Hc3uTMgPIQamO7jHsyxoiWVywEwRFsmaN3/AkQrYabbqn4pABn+jFzDhH2RTw9kIdbw/WSKnv8vs38oUWZb+CJ+SXhedKJy5TOIDgEBUnlePTK2V9Raer2VXZec2bFI1Mc9NPSrHiPa97dsKc+pj3hUX2XyTfi0sCLh6u2NAEdbpA6ayvYVbca7AJFEhWEQ2hSBZmRKWjbH3nFEwTuwMUyeQ7WKy1CN1JfTcQjnk5Zh1HA==
Received: from DB8P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::31)
 by AM9P195MB1332.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:38a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 28 Oct
 2025 09:00:41 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::f2) by DB8P191CA0021.outlook.office365.com
 (2603:10a6:10:130::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Tue,
 28 Oct 2025 09:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:00:41 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Oct
 2025 10:00:38 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 28 Oct 2025 09:58:11 +0100
Subject: [PATCH v3 4/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: split
 display configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-4-9b98f29a6bb9@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|AM9P195MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf8386c-617b-40dd-eaef-08de160078b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEovMkRzSG1JMk9ib0lVZHVybGtOUkt1dllDRGUxSXJlVlZzYTVYTWpXcnNQ?=
 =?utf-8?B?Q09MYWk2RWtkdFlCcmFETzJaYmsrdXA2RGVrM05MZ2VRdFFxamc5Skk0QmJj?=
 =?utf-8?B?c0RQbkxzY2tlcXNqbyt4M3o1eFZJQXNnaUJvLzZ3dUVWQ1FZdUtyRW1wSStK?=
 =?utf-8?B?ZzhKRjBzL29SWldVcHFQYkphM1czTG5RRStucG1LeTh5VDcxWm5UQkxYZUEy?=
 =?utf-8?B?c2ZiU25VVE9sNXo0VHRUU0lYVG1FemNmNS8ya1l2L1g2MkdXRHB6SE4vejlR?=
 =?utf-8?B?bzQwb0JCL29hY3lxWFdmaGh1S2dqNWJEUWc4VTByRzBFM3RFNm9nSklzZy9n?=
 =?utf-8?B?Ym13TG5wTm9WQ0QzVndFQ21iRmJ1M0MwSjNiMWplZ1hYSmtpWW5JUU05cHlr?=
 =?utf-8?B?OEMva2I1NjE0bEdwejE5bGlxaWg5c2o4cllaMWkrZkhyMEMxZ0RsOW1taGlH?=
 =?utf-8?B?cE0zVWVzdHY5bTYrNHYxZlh1TVlyV1haWGhsb2luR3JYS2haQTZwS095R2hy?=
 =?utf-8?B?MzcxK1lQMlMyVXZHd25VUStpa3RXTHluU3NWQjg5T3ZTMllhZUVlOVUzalhy?=
 =?utf-8?B?TVE2aGNsd24vaWY4OC83UjJJSWliSGtIM2k3THZ6K1B1Ym04MVhMcjVvOFVz?=
 =?utf-8?B?OS8reGFZZ2hZWGwzVnJHTTc0TmhYaE5DWmlJUUgwT2puRHAyYi9yeXBjWitn?=
 =?utf-8?B?NUtRQ2dqbG9waGdwcVM5cmtaNU5BTVVVTXVvTlJNNkswblg5NmtCYnA3dGQ5?=
 =?utf-8?B?UXlzVkNOa2lxTHpzMzFGTGVheCtBMEJPQUtNcHJTRnVrOUxPekhoRTVNUWlv?=
 =?utf-8?B?VnA4RHhYNnJuREQxRDRhSTg5SmQ0TjI0blJ6cFVmQUE2bXl6a01yTFpaNlds?=
 =?utf-8?B?NUF3M2dpMEwvMCt3dGczQlNWa3c0ckcyc2FxL2FRRWpiREQ1NExGUmxseXh2?=
 =?utf-8?B?THphN3NZMUdLUEl5bGJ0eU1DTW9pZ09CQnZ3MVlHWkpDb0g2akprVWNPK3VZ?=
 =?utf-8?B?ZTZQa011ZHo1dFQ2OEhjUlQrSTBtaEoyRkVZSHFpS3o2bUZuUS9SQXFvWGRK?=
 =?utf-8?B?K0plajBvaVVLelorNWRNRXk1TDBic094aDczT2FPVFJaMFZrT2pMQ0pUUTRs?=
 =?utf-8?B?Z0tOT1RnRThhNHo3ZDdWRzYvQ3VEMHhENjd2bE5CMGR6a3VMUTNrSjBCOTZ5?=
 =?utf-8?B?SDVkRm9xdk85NGVCRDFTeDZZMEZ4T05hOCtWMkNSQTZrMDZoR2RzSmw0eWtq?=
 =?utf-8?B?TXhDcWpvZWdnT2xxK3hQeGpzYVZtN3hUNVpSMFJncDcxZjZIaTNIKzl6NkVC?=
 =?utf-8?B?OWJxTDY5NjJKeXFHYmdsVjF4YkJZTnZBajVneGlSQldWelhXWlpjVnZ4bGRo?=
 =?utf-8?B?aHdlMmRCMUV1RFh6cFdOODgvWkVRUW5ZREFjQnR2ZGJOZUxTVThWcGpSTXlk?=
 =?utf-8?B?SnlhOWIzKzBROCtqTWJiWkw5TUczSWM3VjdWZ01KYU4zOTRPdlJjR3RkWndu?=
 =?utf-8?B?R3lNd0ZEMnRqY25zYjlOb3VQTmxsRzZxcUJSWkhOdXBySFQ1cFo3cW9vZzdJ?=
 =?utf-8?B?cjB4Smd3Q2Vyc1hoS3BFLzhHeHdMZDZVNWZVQlp3SURtY0Z6V2JsUWtlUytw?=
 =?utf-8?B?dkx1b2JGT2VwTS9uU2dRMm9yTnpGYjRtS1ZRT3RwWElwRkdpYW1NTXZib29P?=
 =?utf-8?B?b3ZsTDhVZGp6YjFOUTRQUEZycHhQc2tzcXg5TEJZWFp6cTZoN0VJbHBEMW01?=
 =?utf-8?B?QXdXdHkyTDRtZDJDaDhMRmU0Q0F2OW5EdW1UcEtxdzhsY2ZxSjZVajN3RnRO?=
 =?utf-8?B?RWFEc3lKcTE2WEJ3OE9zQWFFRDhhMnRudERWc2dXSGtnbzFnUHZtWk9vbWdK?=
 =?utf-8?B?bnBSQmJnSmxJa2VpSDR3bm1WSCtmK3RSLzVJRFM5YVUwbWFDWEI3SlBsUG1Z?=
 =?utf-8?B?Nng4ak9OT2ZSWHhVWlU0WWJjVHVrQ1hZdHFBeG5rNnRQdzdnZk95M1lvdkhk?=
 =?utf-8?B?amFpeWY5Q1h4ai9rRDJQaEYzZjZKQUNMVTgrWEZOUFhacmZlQi94RDJsYnVv?=
 =?utf-8?B?L2VUUVk3SjhZRXFIbzA0VjRyVmd1ejVFUE9zek9OVTJXU01hdWFDUTljd2d5?=
 =?utf-8?Q?v3TU=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:41.3660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf8386c-617b-40dd-eaef-08de160078b8
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1332

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
index 75676b90829956f79f64adb78bdb8ff2c9524ef1..a577783999df4156523a2f1424e16e9a707e2917 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -136,12 +136,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phg.dtb
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
index 0000000000000000000000000000000000000000..193fa9dc34d4a877fba13b072fedbe7c61018f0a
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
+	brightness-levels = <0 4 8 16 32 64 128 255>;
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
index d08f73da75962e1e2bd1e4a25913a13c3f366323..28e8589f9f951ad79dfcd4d0ca2335fafdc683cd 100644
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
-		brightness-levels = <0 4 8 16 32 64 128 255>;
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

