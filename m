Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F5382F16
	for <imx@lists.linux.dev>; Thu, 28 May 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957142; cv=fail; b=AKbwuCIU9cHhxZR3AcKfVWY62Fc0s79Nsd1Zeeo16tGLBt7pkExmnCr19GC0gqgAgepQ6Kp9pj67nBM6kW1QUsAe5/Do9HzjoxKzniPB/Gsza5IyyX/dh/LKbIrzYeLPNYVunf5L/O6VL0L0O2wlUiX07mTUPYkak5wgecn5xcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957142; c=relaxed/simple;
	bh=Nl9DTMLJ3kdwYZqrLyKgF3vfXGSGy/4uCOH3WadPAiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SJ0F7vGJ8Q3Q/SphH3hsqgML1eVbVH47DcH40x0Tq5iWyy1FbKmZeX7zw7SUNgdMAxmEF2KT5RWhNebFmpfO/XVxAi9casRNMhSUU8VlYObvBUDWPhFEoC+FpdhZnVnhmnzY7SSiYYWpK4ctS2TElknmcxTmnmeSh1dABUiaMEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UgpDmQq6; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UgpDmQq6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4HP/PSVxgsJGzmikQysqGg74TueXQnrQ7qsxacA2gCbupqtvSA37l2xwqPyUGHhggl4kfhZxXCBM59s4fbadiIjWC0AJzdWmZ9rS9mI+CNIFxlW92EcazC2QLfKt3tH5mG3/vgIXmE34nSz9q0H0ccMcJnTsl5EGdSOtyWgHl9tjDOmtvIik8nGAr6YN7dTAxHw1qmUK5up8mJ8wvazEeFl1utcjWwi3ymJNQ65tvfymm6y0aGv+fNKWJ/msVt2gKqGWbIAA+zHw9YCZWHuEU4z6dWm4Lv9FDSeLIo7sidhnxzevHb8MZJpfNmicEfRJdpJoKI/wMCR5ttPic2h/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCkwknrRCHvnCEyl0yd1jQZDPpu0SFq0NhWSHOgP32w=;
 b=TWSE9cMRo0upgvZwMX3W3K/XEHYlPZEKF5DE2br5KyrlpwwwzpOE3CVGeBnjXzgDKHLghDOCjv/bG4YVD40PX3Nnhxigodbuzh8J+ZG97aQScx+fe+gYVaZh+zbeDdMUWdt5q+NAU3FzWC4QXrU+Hs4ECkuwo4x5kBHM/Sv6gloGIqIES/9FKjeXygW0C9zKS/5M9xL9NCQfyAzGd6NdOlS4KIFS2TjuUxe9x2MOE8+jQ3Qb6FZk3x5V5bcF+eoq+3RAbMh8nNroJgeeiC+sKB2GSHJxbMTuCcF8JqVeVxpeMJOp+nqDZliet0zUnwFRb1ZdJE3XEUsTA2WenbJkAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCkwknrRCHvnCEyl0yd1jQZDPpu0SFq0NhWSHOgP32w=;
 b=UgpDmQq6jWBJJtXn8C3fGzW/eWw+81zoth9ROovWdacOvz4+ZIBa23nlq1LJuCzzcm6lnpIxHe75idR/alv96WWToYU0zEOcYvJ1xDmUeKvfOeu/UTh2s/+0x7lgYGLWt80hX34iy7VzCKIZqIjOk0kajMJtklKlnGJ9xK1/oIYpgilhEp+p5gdnV3UFiyYw9Pln+40IFGuH8tYpsMkJAFIxST2wmDBjkDB04Vn/Uu3c5hOAIGwg3KK6VzZKV/VWXnot/RI77kpwJ+lgJ7LiSkiZ+hFmQsaVRAxCTN1KY5bHn3XDFpc5ylD+qWLbzblE4bdH55IMtrt4M1o6jXnJeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Thu, 28 May
 2026 08:32:16 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 08:32:15 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v2 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
Date: Thu, 28 May 2026 10:32:13 +0200
Message-Id: <20260528083213.1399401-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528083213.1399401-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260528083213.1399401-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::11) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 74405300-c2db-432c-f2a4-08debc939f97
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
 JdPjFje2Yf5aMaEFLMTUuGvU2TvxWg4GloDmGEZeXNyNf/auoi1ZblJWRJ+M8wd33+NOzFxJAUka+JECS+DNkerHR6PvkXGGQ2kjTW1sRST9QQl8ECIY+aaxkpPR9m6B+t2dkKwhC7q30Kj5JQvdrpnUkirdY4UG1rFVGahWhoHMPH6vbFaQdPyiq5xP+I+NEhtkXIhkYjB9PWZIl7iFe9nenAAeov3ZqtfZW79ymUKd48vQYS0ZYUMtMYPg24e6ouHEpjT457AlDrzu8Zk/aLoN5cy4jqXUW3xuxmmMsZMYNLmLGLzFtbwtIpnzH09vklVKdKv6HtPNh3lBdXORT9nlW2KoTX3OySCN3MdrJJY7TDFvHh+yDNognzEduRtPJdzYXvEBkrclFSIGQLK6C0Q98IopWAtdaH74Ql3G1RO+YtTAOAetg3A6IW26TS5yZmcNudHQcc3OtgOIUeVIE+gTxuYRO0nAXgWF/KAEZGTJ6vXYhBAyevb6/IaY5r/HvPFtyw4Y6sIMX4t4yN7ZGk+oXzerg5X4kBWH2OnpVba7CtA8qcz/TGvKRrhhPnPHPJcy0JmZTV0ui5IIlq385xd2PbvW2TuMcHGnBo/2rSyewBnzQRg8L2Educ7+qfucQ6cxvjX7g+vAzTIy/WC2PZ5yiYTBlgNh450KT4Y50Mp61xdbiQ7O3DkB/vBfA77i
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MEZMa2QyKzFpclFxekNnQzRITHU0KzVJUENlYkF1MWVsTm8zMkUzS0xwazBY?=
 =?utf-8?B?VlJRME1kVkZncVBBUlFWR3dabHdEbkRETUlHUVhsdWxub3JsYm1NdDBOSURo?=
 =?utf-8?B?R3ZVVmVFV0FTcWc5Ylh2TlN3M3U2RG13b2lmNUd4YzFBVlJNSGJoMHVWWWJ5?=
 =?utf-8?B?YW9Pakp1YStTa2UzTUI1STFxblR6dkpHWFQ0ZnZHVFR5cnBrSmNaQmhmeDI2?=
 =?utf-8?B?eFhacms4UnVRaFBsaG4wSDJhaDJxK0RWdzFjTERGQ2J4Y29weWxUR1VtR1lZ?=
 =?utf-8?B?WjZTdm1VT1F3NVFwVXNKTHRuOVNVcDZSaTUwMHhZMmtyK2R5K3ZtaXJzemlG?=
 =?utf-8?B?MXJ3K2ExVjYzWUNvdjVESjdEV1FuczBFdEwrc1ZnVmFpWEdPTUt3VENScFB2?=
 =?utf-8?B?VXllZTNGYjZHdzNBdTBEWDlZRjAzZUU3eEhSNzZMaDB4QzlwaEVuUlNualhy?=
 =?utf-8?B?MStTYi9TcDlUL0tEc2JKZVc2U2F0WHNRTkpvWDZuaUhET0tRZTVBTXU5ZFU0?=
 =?utf-8?B?bGs4bEpHQVdBQ2ZQOXZtYlhNcG9hNWtLaExqVnlEcmU2UzRPK21yQ0pDS1RI?=
 =?utf-8?B?dlgzaHhjWTRrZDBKYURHWTRIVzFyZVpRQS9sWFhUS3NzQ2hGTGRYSGZmaEsy?=
 =?utf-8?B?cnI2c0loOGRwUERKZ1k2d2x5N29EbWlWOThuZDE2NEQ5bFc1QkdibXBCMm91?=
 =?utf-8?B?YmRFcjRWMCtQZmg5RUtpaDZyU1FOR3dvS2UrczRMbCtyc0YvVEFUTmtsbjhM?=
 =?utf-8?B?SkpSSjZtQXBGTGV5cXNlcnJ2RFBkWTBWbWl2dStDRU9RWlNHNW84L0F3UUF2?=
 =?utf-8?B?TEdXdWo0WXMxTHdweEVBVG9URDVBU2o0NWxSQktLUWRnd1U0dTkyMlU4RXo1?=
 =?utf-8?B?alJnUlBzeWNDSytmbXpZOEdoOTBleXRYVHYrK0JaVzU4YnRKRFc5K3BYYzBJ?=
 =?utf-8?B?ck9SSUhBSHdnNEFkL1Y4T3R6aTl1MXVVUkJUaEpDZ1JrVmU0UWdSR1pIMGlP?=
 =?utf-8?B?UldaMVJZbldhVjhPUmIyUUM1L0oxdkhaQW5Rc3JINVBwbFpjREtsQlRRWGlK?=
 =?utf-8?B?cU01TUpDYnZuVHBtaWdUeFZLWEROaWJEd0xzTG02VGllbU1Ba1NuMW1Qakdh?=
 =?utf-8?B?WHU4ODl6ODRxeGpPTXZEUGtPSkZjV0dPSXFXVHZuWkxCVUtEOTUwdEZhRTQx?=
 =?utf-8?B?ZGI4QWt3aTBqVWhvMWNWenJsTHBKN2dPTlY0bEJyU1c4YzZmNlF0cDBPcXJO?=
 =?utf-8?B?K21PTFBHelk0QVRwTG1HMWFVOWVXUzQ2djZKajZ4c3RNd0ZqRVRpSWVWSUVP?=
 =?utf-8?B?SStyN2NXNnBYQUNPY29jRXMwYjROOVNyTDFrdHQyNnV6QkZYbWlNZ3lPYXZt?=
 =?utf-8?B?eHZWa2ViR21PcFNqNlJUc1lFalFrbGlML0F0amMxdzVVR2pseGJzVm5NZ012?=
 =?utf-8?B?dlJLbkZIdHNKUFQ1QStBVmJvR1J4c2RRSjlQNG5sQlZFZkloVmQzU2F4WlJj?=
 =?utf-8?B?TFlEaVRnS0lORFhkaWRreTIzVEVycXByalJRdTY2OStTcjNMNUg4aHZaVU4z?=
 =?utf-8?B?TVVaNUtyRXlaMVNHQkc1MWM1RlZ1OWZxT0tJNTB5bmZiZlBQdFJGenJQcXUv?=
 =?utf-8?B?b041VWprbzMvdUFCMStIM25JOXZkS2NUTklqUk5zVHY4M2EyRE1ZUmlleGlI?=
 =?utf-8?B?aEZVbGxCa1VvaHRjd1A5eVpJR1RML1ZYbHcvYjI2cTNueW1IUHJzaVlRWmJm?=
 =?utf-8?B?Um95ZW9iMjV4ZU0rb1VjWlg5MElZTjNqQlh0cmxaOWFQYTZyME9STGlkRkt3?=
 =?utf-8?B?aWQwZE5sZlVobzJWV202OXl3VWs1U3JZaXVKcW03aEk4VG95dFJoRENEUTgw?=
 =?utf-8?B?RU1RUnpBb3ExUEJFZXJ2UUNuS2JDMGF4dnBEUkdtODdIN05HdzVGT2N2dVJN?=
 =?utf-8?B?MURjNTMzS2NrNzZmazk3RENoRUZsTnVQbHlsNnAxWHBoREJubFZMYmtHbTNu?=
 =?utf-8?B?dW9wYlM2NG93NTZjZnVFZnhRSWtyMmt2YWRWZVNkdXdxTTRGT1pBV2pmeDhX?=
 =?utf-8?B?aStGVG1IeW80dkFGNzg1dVdLSDNER3N1R3g2TVZjUExneE5qRFd2NUdXbjdQ?=
 =?utf-8?B?QUNrSThlVXJrTVVvRXg0MnhySThNcHNraG1aOHhDaHVaSWhrWThiUXRUYWZK?=
 =?utf-8?B?akNvYmZpQWRycFVITm9DaWNKcDR0M2pCK0IvMy9FRnpDV3JBUHN0aFc2OXRR?=
 =?utf-8?B?ZG9CQW9hc3hUTEZ1QkMxeUhvTmZ3TjVYM3VQd1Q1VlZzRmhmNys4NGhSODVr?=
 =?utf-8?B?a016cS9QZDVvRk9KVTRPWXpOQjhadnFBeDkzQUlZZ0E1c3prMDZGWm5HTEEr?=
 =?utf-8?Q?nqyz2x0uFlu5vd7o8kXv3nhdGTc83p8aa4edK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74405300-c2db-432c-f2a4-08debc939f97
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:32:15.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NS8QaZhVHCmnVc3liFkB2H9cOyIz/3PCeIQPgKUMLG11Ah++wZmpv6kA7TeoIaeSr2I8cGQAV8GzPzmflh590mR/kYYrFK4Vdgkc/QJPhXqtslySbNISolmfmkYa0x4N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8616

Add PWM0 and PWM1 for S32G2 and S32G3 SoCs

Issue: ALBSP-1959
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..907cf74e61f3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..a4a9e21d1361 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+				     "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+				     "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index 803ff4531077..be7b645afa2d 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
@@ -245,6 +245,70 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	ftm0_pins: ftm0-pins {
+		ftm0-grp0 {
+			pinmux = <0x2912>;
+		};
+
+		ftm0-grp1 {
+			pinmux = <0x122>,
+				 <0xb42>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0-grp2 {
+			pinmux = <0xb13>,
+				 <0xb53>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0-grp3 {
+			pinmux = <0x2904>;
+		};
+
+		ftm0-grp4 {
+			pinmux = <0x2925>;
+		};
+
+		ftm0-grp5 {
+			pinmux = <0x2936>;
+		};
+	};
+
+	ftm1_pins: ftm1-pins {
+		ftm1-grp0 {
+			pinmux = <0x1d3>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp1 {
+			pinmux = <0x29b4>;
+		};
+
+		ftm1-grp2 {
+			pinmux = <0x29c3>;
+		};
+
+		ftm1-grp3 {
+			pinmux = <0x1f4>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp4 {
+			pinmux = <0x202>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp5 {
+			pinmux = <0x29d2>;
+		};
+	};
 };
 
 &can0 {
@@ -293,6 +357,18 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm0_pins>;
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm1_pins>;
+	status = "okay";
+};
+
 &spi1 {
 	pinctrl-0 = <&dspi1_pins>;
 	pinctrl-names = "default";
-- 
2.34.1

