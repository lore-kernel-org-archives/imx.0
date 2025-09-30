Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021113.outbound.protection.outlook.com [52.101.65.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900032BCF75
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214891; cv=fail; b=f/dRp0XXe6wslJ63S5u/AuUqel7gLtCMoWK7hK4gUgQiOr72G6C1jv49dJpDcVSOjDkpLtv5ILCUfDaMR/Ru9xONFu6nu42qJnt8nD7s5Q5CV5iI2G67gFf1tPmsPuPFvARcYgDpXWdYY6ftVre0KpeT4XGtjYKuCPhxlcqK+eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214891; c=relaxed/simple;
	bh=30ulWcX41lQn0NPihhFx55M+nHQFYtcClrkp3+uLavY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Z5O0M9UBvVZYzjXjZ50IcyC+WcwnrK4M8TTvfFU5zR3sDLhmGDrwqJ2cZltzIa/a+kjiIN0TC2jANGKbx0bp966fKZI3xY4qcL8akdTwO1m08An1ZTDURDn+FFv0EMBJEP3FOhy9RxtougoyVmppGg2fEX3oEXLBaHBMvnm8E/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=AQ/wszkk; arc=fail smtp.client-ip=52.101.65.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="AQ/wszkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoUZhL2kPubtGlr92R9pWDLPk9ECRjZ6ozJPfg1l0lZDpK1npQw7wZYW6LZ7lKlkHpt5c2mx3gUeUtPK8tup3O+kM5XG1wNsfCIH2kdqt2tLwd+VYOZZc7LTCOwAe4P3xIOrh/0pUUnxUd0f/bGJyPQWB/7krpzDDajSztJlYzQH6rrh2ECjoAOQSveoIhadJhdGt4dBeyAa7CbK1qq4KX6GHyGzeXjpEOfv+zsXrYOoX8nEjzRc2frd5V4dZ0gmLEp08PRBYG+hAc5DOSIzO5TZtUssbU+v84MhLb1qs68adNN3aBHryJ5pqZUqaMQMi2ItzKlt8WySOgh/aiNGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/2X9jjg1BUyyGKt6cYrctPfsGUYfEv8nQjSyxhg/18=;
 b=QRMa5uLb7xZ/2dl5m28LCIZ65OhzdMbzpI0+OIgZwRcKnpjQ2Y5PyF6W8n2iPPzx8FCulR4I2J+rotFs0sAq3/qCcQHQdJtN3ISASqfr6VHj0IzNCn0u5M7YmVKOzOSP5mJi2/4nWdIs90h6nJkPXZzE5lTSHWkihySzH9N5nPPDnpPPe80I0VOyVtSdzhMX/93YaC2+0BlmcaapM15dw9idJsj21Z2Lruxr7hwtzpW3IZJIT2ZUM2fvIww0MOQ8agOptCn+oMc+AlJYZt15k0mNbhJ8OagWPu9arp1L+aLKvHU/V9LqM6fP8Iie/nTmsrocwJfxzv0cL94y47Io5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/2X9jjg1BUyyGKt6cYrctPfsGUYfEv8nQjSyxhg/18=;
 b=AQ/wszkkmK3ZUQBhVSumogDTiWARRjQtDWddeCY7HRReH4/I2FjiUDUXzccTuhnN4PJ+VWVojKTuycTzsu9duRj/BMoAuE9oLnxZu95l7JrtAXb/zR/YJSfNvfI+IyAb9XcpbNJ/kMT/m06E0lIrRKxZ8alTFn4fqE6NH4lRSvLDWb/UCzKrU1zc3Ot0rhBvcRXgaktTsWK1HnxpcDzvGRt94UnLzCwKXl4QUzDAbGlDZdO3q8uV55GmePSAjjQjhCGRIT/sp/i+y+r2k0KOcsWjkVG4R286l009RwgDyM1Rni3bGax3vxcndVp1lRZhvhKGpiUU1HAWqKNHnVi8pw==
Received: from AM8P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::12)
 by VI2P195MB2957.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:48:04 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::ee) by AM8P189CA0007.outlook.office365.com
 (2603:10a6:20b:218::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 06:48:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 06:48:03 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 08:48:03 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 30 Sep 2025 08:47:44 +0200
Subject: [PATCH 1/6] arm64: dts: imx8mm-phyboard-polis: Use
 GPL-2.0-or-later OR MIT
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-1-d5d03ccbfca1@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|VI2P195MB2957:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f0e821-21ff-403b-0c6b-08ddffed4e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3ZOTkk3VmV3UUN6NjV1Uzg3S1IxNlVUTmhicm45TVNERGIzcWttenQ5TVY3?=
 =?utf-8?B?cHg1a3JwVnBEdFdldm5lRTQvODNMckZLZVFyQlVobzRpVUNsZHA0VUw5bXQ2?=
 =?utf-8?B?TGdOd2RCb29LR3RIcXViYjVkcTE3ZVZIbW0yTDlDQWlzRnpuSUVrZkcyNWpK?=
 =?utf-8?B?dGhRQ0VaaWNjTEtOY0kxMGdlVnR5S0tXVUNEc3BiVUtQR3ZQSGFQeVN3eld0?=
 =?utf-8?B?ODlxeXRoT1Byd3NTcUY4WkFqRFpDeGFSVjBvTGl0bVprR3ZrYmdyZDZjYkxl?=
 =?utf-8?B?OUExTE5UUE5jYmZ5SWtrYUYxNDlNSUdZNXI3b040Z0V5b3JoS2M3bGtXWFNx?=
 =?utf-8?B?T2NJdkZlcEV2QnYrenMrU2xBZ2ZGQ09iV0F1eEJvSGRDaFZjbVEvSjRjOGFo?=
 =?utf-8?B?YnlKWjBaQ0ZCMUtTMElPTEpSVmRIMkpBQjd4SnFLSFdMcDF1SkNxaTM1RzJq?=
 =?utf-8?B?QmtoVTkyc0JicEk3R2xyc2hYbVFabW15ZlVNZENJUjFoN1JVbm5BVTBhTkh2?=
 =?utf-8?B?NU0wWU1jRWIyVk5ILzhGdkxTT0gvcjRZMEUxNUIwZS9KWkFkWXhXLzI2L29m?=
 =?utf-8?B?eFA5T21WbXhpNUh4WndKUUxVZS84WTNmK3R3dEE4Yy9KRG1LVkcrbDBNMnRy?=
 =?utf-8?B?bnp6a3lpRXgwc2xKMUR6MFF5TFpoSVBrYWEyeG85c0tJRFc4Z0tWYjEzUUhL?=
 =?utf-8?B?dFdOUkVIWnhSVUlOM0dacHNSM0xJTzJGZlN6bVZNemJpSmdRSDFDQ1g1SGpv?=
 =?utf-8?B?T2IwSWxaSjZlKzVvNmdZU2J5Ulp1VUlCcTN3N3dqK2duMTk3ZVF2eWdtUlRz?=
 =?utf-8?B?blhqZU45ZEo5MmRrTXk3Qk1ZdmxFblU2NTIrVnFKWnYvSkV6QTBsTmhzT0RQ?=
 =?utf-8?B?L2J3dGJTdVpkQmRzRitPWnRtOC9kQVQvcUVnMnJZNUJaQWlTTkhoOWlpYlZM?=
 =?utf-8?B?czZ1Wk56VUFNTk9VLzBMTVFyRWhvWmRyN2NTNnZublB4ZkVtU1lnT0RqU3JD?=
 =?utf-8?B?ZExCLzdxL1A3R2hCTWtURmJOT3JzWGh6ekllTkQ2Qzl1UXNiRzNTdG5HVGlK?=
 =?utf-8?B?UzZrak9iQ2JZNG8rQVJlZEFjandDQ0MrUlpna245dW1xMTZHOXFvaXdEeEp0?=
 =?utf-8?B?NnBJL3ZlMmFOSENWWnk3N0YwdzQ3dE1nNkhFNFZEdms4R0crMERmVnNWMXN0?=
 =?utf-8?B?LzhBREpJM0l0M2lZREZaZnd2VGkyQmQ1d2lndGJNd2s1WExsTWpjdEFyYjFD?=
 =?utf-8?B?Z2NwTG03WGxsdmJiKzE1NWxxNzN3S2ZkYUUvYmpkcURHY2RxUTdZS0ZIRjdX?=
 =?utf-8?B?WGtqVjVXZ2ZLYmVPRUxjTHdQdUQ1Myt2Nm43clZmaTZ3TDhGMno3NnY4UVEv?=
 =?utf-8?B?VEVoNHZxcm9nNFZvRGZ0VWVRZSs0K0doUi83dGZPMkVMRDVSLzFRR01hRzRS?=
 =?utf-8?B?Y1ZpQVFHd21zSm8xL2lGRW01dmZUdnRrMDdNbTJva0VRY2lJWURxVERrUFZK?=
 =?utf-8?B?MnFIbnlaNUVoK3l5b09FdlNlaWl4MVdKUUx6aU5zb2lrRVluc3ZFd1puZ2F2?=
 =?utf-8?B?QUJUNGtjYU1HQnNaU1JWRnZJY20zTCs2TFc3Ym5lOHAzY3JzQjI0ZHo4TDVr?=
 =?utf-8?B?YTN3dkdVWWRGWndhVnh4alJ2Yk5BUzA3bmhhUXpRSVpQbGh5dDd6T0tmMkdW?=
 =?utf-8?B?RE9yOVMwblF6Rjh0OUxGOWxSV053MCtEMS9JTVZ0ajJUcFlHTFA4ZWNGOEFH?=
 =?utf-8?B?WGl4ZG4zUnRVTWRyNnhxa0JUVTIwd3lqNlJkQ0NiRk1YM1F6TmNqNndYdFdu?=
 =?utf-8?B?Y3Q5YXpNS2swRXludUVoUlBlcTBhVThjQmhjenBYYk9Fc2c3UGYxSUF5Qit4?=
 =?utf-8?B?RzliaUNpNGtFeFB3RzM4QWozZzNCNUloQm01aVlMdkxNYU9mRXZqOU1KWkZC?=
 =?utf-8?B?Y1lJRXNJbDJVeGhHeGszSEc5SGh3bndYRGtEOWl6SkNVZ3dISnNiTjlzbDVG?=
 =?utf-8?B?Ums4cVlGTDBpWUhnMUtaS0NDaldmQkladXIvaXUzR1ExRSsxMFdRRitXSUFq?=
 =?utf-8?B?K3RGUVVNL1FoZWZvMmhsV2V1NCswMGE2UEFVRVdyZ2xvQlI2endkb2lCUWNp?=
 =?utf-8?Q?woyE=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:48:03.9325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f0e821-21ff-403b-0c6b-08ddffed4e23
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P195MB2957

Update license and remove individual authorship.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso   | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts          | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi                | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index e5ca5a664b61e20e9c30c9e5ca01a6ae6da57596..5955d48e19ad0035038ea4ad7838b3e09d10b2ec 100644
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
index be470cfb03d75de7d6d3fbb1add65c71fbe8f286..ccbfd697376968e49057f102571a0f06cb19e702 100644
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
index 672baba4c8d0527f2de002d49aa96d30a6ae2373..1c472e9012c3ad3445fc0b17e0393a9c0e243329 100644
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

