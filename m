Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B4A3A9D9A
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909409; cv=fail; b=ecEJkmiipyaZcsWZe56/fDmJKVIE4OqE+jDScZTISVtXyWCYd2HN2GZNPLymro9jMweunISZSICN1J7/pjCxn1YcyF9bBOOfvc9I7HFK4uRL2EKho1GUJpTLIVfjE72GXuC3U00d/3+2wkzJUoq/cLjB9mAa9TPaGfq1xgbDq08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909409; c=relaxed/simple;
	bh=x1U1hlJAd3fkmLjup7eCUwQ+roe9o4nd6bINwFQLJEk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dm1L5zKIR3ztAxYp7hfu2Z5aUlaG3KOuk/FApqT0yQkqqE8JvO4DS5BXgcLNQ8YeVQ6viECMIf6gJ6tGNeI7+MokDpnWCBxy7YCzUZqDXSIUeowK3VY2EwdptOdrJO/ABkmzJaujzOuMINMrHUzMW3rcRUXrZvPm1I3camiqes0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oYOxm5lY; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oYOxm5lY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DniwQUVw939dP2oXZyW8B2N2DucbNHszlJKjPJU14zVEvMgFsV2clUlFKv+TFaLzCQxhf08Xpa9YIdGnJ64Z8gsyS4nWaa9xXnROttOJD2kAGXwEkQLRP1FO293jgLA2PkYxPvClJP2NGW07OIiudxdT7XLWCziuWvZN+Sgk/2dsbuszOtrI+mUAJoC4Nav4hr4Y95ouWLU472KrkQEonlJhbZymzuhwXsYEtZP5bAFFaCsHS4ByinSweGicU9iIM/sYMcOmtWez9FoaM/cGovjNogWsn3WCb9P11sqbtiuFuQkbrERjwMzg+VKFA1fRdN/13twiCwFsYM4DjW6waA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDVdOjmj4OcZNqpvZdf/XcWH79s7bJ6ZKXDzR3SWYiQ=;
 b=PpgwEUgo3xnZRv+FU+nsPufAU4SlpZCnMpHGfASUr6MBLZF7jYUPONBRY7603znl2/wuv0rEyfXnBVEMj3SmHWxJ6H866kN5Ba7AHcAlI0d/9K10TmXj1CWy9H+lA9MIFwPs5Ebmm7KFY13QfkG8JxkOCQh6zKjB6aVK21+Y29y+KXASX66v3Z4HhJ9PnujyJPgGU7QBs7OCHqo5M4IQY4mFV6+kXyWQOyNBgENunjgiTn3CZKJnKzwWWLDgrou596Snd4uYQtNUbKKEmXzMYpPGUMWas+aJmFGQM4aghc1zJLYkmpCYT7NgRXyJzuIKYZ5LZQNpYGI1FzrMvb2k6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDVdOjmj4OcZNqpvZdf/XcWH79s7bJ6ZKXDzR3SWYiQ=;
 b=oYOxm5lY29qsj19HMPfnsQRHONu3RwPhwoS90zYnzFRPtgb73tTkB7+BOekomtsPo5CyZ3fydl3IYK4P5EbJCm1/kuMefuF6phqX45aEb4VHhIB8yGX/9MJBviStXatAqaXa13xM+o+F3GpLGBsiODGyFOZET4uuham7WtZe8S1olEUmaO7XNlcnJQIopeFstpkZJuGsUcjFHkni+1IR9jShCJEjlngLosbcxoPwppLgHi4/LyqAte/vOUi8bmwEcLAcExrBHiDWvWoQodVl7WPaVmQCNvx8GLKFRP04wj1vp1CjWGlpmREySFvivb82UY8cnUf0LXuuCqn1AwRikQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AMBPR04MB11786.eurprd04.prod.outlook.com (2603:10a6:20b:6ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 09:03:25 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 09:03:25 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 08 Jun 2026 17:04:24 +0800
Subject: [PATCH v2 3/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS
 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-imx93-ldb-v2-3-1b1fe621bfda@nxp.com>
References: <20260608-imx93-ldb-v2-0-1b1fe621bfda@nxp.com>
In-Reply-To: <20260608-imx93-ldb-v2-0-1b1fe621bfda@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0278.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::9) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AMBPR04MB11786:EE_
X-MS-Office365-Filtering-Correlation-Id: d98a6272-d3e5-4812-2575-08dec53ccc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hKLDrfYBPcNCGq2bfM+howBkZhNll6u5Q2jkquGpHWBHQIbUpduKIvY/i/xfGN6kAq2+CmMN4rIbzPAwnPI7U6lQdKzJkYGkrIFC22bdGitfqxJCFlqJavj5kYIrqnyDYcSJz7ojPqfBps8imwsgAYfD0t3MP1Z9wcBvyiKyL8LAZiMO4VYRpLsH3GjhkrBwo/TtRaWCf9C//7PAcmaifkDNPodYfdPI+wp5pElYiTQD9BkKMK4sVM1sBSHvuq1kEO5Rkkcsnhbh4IiJWmaiMUpJib3N1m/+l50nJYlSzkLIx3tosxgj+daXQfJgGJjiWTD2nJRcDTEgoRjS4UigGP74KjGtW1hXZzIzQ8HMjh7vx+d3u5xSgVCuma5Y/z/3Qj98wbwnj1+ocgPnKRtPBzT+FEugcJNSXkapQjqEZ93C5ICzaDX9ul90SBTm7tGtYapYc+oicEOIqJaZ4Zc4uTJfa3sxNMAhRra4dyliPzO4K41ijLSnSt5zZvhFyPeGDqzRehQqMUN+FDjuuUmGjjPXQcvQiVHXdYo0MZiR5BIa7oW8ui1MCYCZpDEr+lGF4RVDbYn4q+gAl2w1Yftbu6e8sCsyPOfQcqR4ksguG9T9RLdxzol5P1ObjI+UBLPYiAMtGzyFNFNkheYEGhEApSfceJovHrjfHwfMzVa8bJiTwIzagyVA36xJsbctvRY7/INahbxgmU8OnkDRI1eV7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk54aXlLcUpGUHVzT2VEc0FnR0h6dEFUZ2VGNm9LK1VyWHZkajUzK2pnV2Jz?=
 =?utf-8?B?WjYxeEwxMS9jcFdqU3BqY3diY0ZHNnkrb1JmdkZQditjcmtnUEJvZEhsaVNR?=
 =?utf-8?B?T1dsYU1IcHRIOU45Y1RWK3dHaG9MUGsxZWhIRnNTT0llcW5tZnRZdWozNExG?=
 =?utf-8?B?eVFCZUI1RUszQ3pXelNheVFZYlBhTFpWVytzTlNVMGk0Z3hVQy84b0lGTnhk?=
 =?utf-8?B?WFBRMHRUb3VIREN3T1NDNFZPdTE5cEdSUTYwRHlaVUl5dEJaSTl1VEFaZ1I1?=
 =?utf-8?B?aDJBbkkrMVZYMU1IK0JHTGZWQXFCckE1QzB4TlZLUUNhRy9HR3BVNFFTRTdv?=
 =?utf-8?B?RDI4UjVmckY3TWx2UUJpOHdQWS9wcWJwS2h4MVVFMmNnc1VjakhvVzJ3NEhI?=
 =?utf-8?B?N1gzdlN0YS9oaU0yWU0rclpFRE5zS0I0ODFyR0NLYjV6QTFTcUxnZ2pTVlhW?=
 =?utf-8?B?TzBrZVhiVDlmNUtHM09wc2MzdHdIb3ZYNHpTcjlDZC9wckRna28vb3dMTXIx?=
 =?utf-8?B?WUdmR2Vtc1ZEWktFN2hjclVZUkRJYkpaL1MxakJrMVZXTUVxeHRzTldadjg5?=
 =?utf-8?B?ZlljdXk0ZmhTMFU3UFBGWWtMQlVMa2ZPRVo2NW5QaXl6M1NwZ1JqVG5hWGhM?=
 =?utf-8?B?c1lpMVdBUXdLMjJaTmU2YVBpUFplMmFYbzA4Q1cxU3gxL01EWXA1S05SbkFS?=
 =?utf-8?B?cmpVQUpxZXR1TUg5bFB6MDFuWkpRY1locEtCMGo3VUkySXBNSlUwZ2Q0VHdT?=
 =?utf-8?B?Q3Z5UlRQYTJCa2VIZDJUeVZFeEt4OUs4bVVybElpOFRSUGIrMFROSlBlb0Zt?=
 =?utf-8?B?Q2t0b1VkQnFNTE9DR2dicXFkOVR3aGZKTTNpcXg4ZHRHenFYMEoyZnNsYzlt?=
 =?utf-8?B?WHJvRmdWaFdvbHhvcnJkZlpqaHplWUhWbUpwTSt4K0VZTUdOdWN5ZUs5NThM?=
 =?utf-8?B?bVVTcTAvcGpXemNLQWpKQXY2ZFVPOFEvVmNYZSsrRUNORTB0cHE2UmRrK1Ni?=
 =?utf-8?B?SXgyM3loWTFKK2dlNUJzR1g5b0l0UGNWc1BmUGp1VVB2UnNQZU4ySGc0UDRp?=
 =?utf-8?B?OXhpY012VEFsazQwdyt6WW81VnAxVFp5czVwVlZBcGg1N3ZmNHZPZnE1cWZ3?=
 =?utf-8?B?cXM0MWdQbUhFTFA3dnpGRitJemdxMmQxUGtBY1FGWjdyanlXU01YdUdHazNQ?=
 =?utf-8?B?ZjN4V3RWUyszdHZJaS9RMHpwUEZNcFRzMTF1bUNyVFVqYUZWWGxWMVE1d1BC?=
 =?utf-8?B?VzRYZHlCb3hhQ3NJUGxnd3BaK2dzUzd6QTJud3RmSWp3L1JxaGtoWDUzSms3?=
 =?utf-8?B?bUNkS1FKM2pmb0dieS9pNlpWNXd5OFRMbUpHb2FleGRTcUV1OHNBSVQ0ZGFp?=
 =?utf-8?B?aXlJMlA5NlV6MlBYZ1RhYWNWbmQ4QlF4RFFYMENjMEdBKzJkbkhwNWN3MHNC?=
 =?utf-8?B?QlJRd2VtbmQrSU05TUVQNGFESW4wcU4vSXBzdlA1cThUQkRzK292anEzd0sv?=
 =?utf-8?B?VzMraUpRSVhnbDhvT0dzM3REbGxZaEtQbjhGTGFCdjZzNldiN2hjK1NRR2pK?=
 =?utf-8?B?aS9vem4vZU02anVhQTlXY0laeE9STEptQUZHemlVZXpsM0RvakJIR0F0VU10?=
 =?utf-8?B?c0FWUTRLYXE4Uy93VzU4TktldktCQm1VcFRSZHhFTlV1Q2IyVmlRUXVzREkw?=
 =?utf-8?B?ZTVybzVpd1BzWnRYWDRSV2tFNTlOcWMvbVA1bkNObWJyVXUzY3JlRTJ6YzJP?=
 =?utf-8?B?NWhwT2dYTGlpUHFLaEsyUDU5RmJEckVOTXhKQkRnd1JrVWVJY0RRNnpCQ2gv?=
 =?utf-8?B?eXdoMGpWL0dQZm5QejdHUkxWTVFudllYb2lzR0FjU1kxRlNrYWVaZG95YjRn?=
 =?utf-8?B?YnpnbHhSZXJGUHdrY2ZGZXZJYTZsZTQwN1VmY3VUM0Z3dlpZazQxUCt3Yndt?=
 =?utf-8?B?ckJZSTdJa25odmlZeUFVU2pRYmZuNGdncGlzb0lXTlFaVm53K09iVFh2N2tZ?=
 =?utf-8?B?a3ZONHdWZDNXQ3dBVnhZcjF6SjAydVV1VFlmd2pvekhxM2xBWS9BUlBlK0NW?=
 =?utf-8?B?SE9QUlpVMHNETncxREZkZHBveG5rZ2xvSU5WcStMM1dpM0RKdzJzT2xxVUtS?=
 =?utf-8?B?QVJ4bVF6K2ZvUXlSZ3k5ZW5HMkRzMUZGdVI2d1Q4TzFDZUIyc0o1djJtdWJB?=
 =?utf-8?B?VUh5eFh5ZWE0WDhkWjJYUDhVZTNiL1FndXRNQWpQWHdZYWpiYlpDQlM0Qm5t?=
 =?utf-8?B?QzRGN0NYcmdaNVZKUmZLTTdhbjlRRlQ5TUxRMERUZEhLdTVjUnowK1d1YzNY?=
 =?utf-8?B?eFNESk40QWZJWjUyYlNDWTkyYnpUL1hDUjFqaVcrOFQzVFJGVnJQUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98a6272-d3e5-4812-2575-08dec53ccc51
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:03:25.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbk9wkBcj/tglMHAOUQK63qZYkeGyjeRYFM1jQpN//AXc2T/pE+t6wgICsCSAxqTHh74Me2f5SXR5HZsGNIedA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11786

DY1212W-4856 [1] is a 12.1" (WXGA) TFT LCD panel with LVDS interface.
The panel's 40-pin connector allows it to be directly connected to
i.MX93 11x11 EVK board.

Link: https://www.nxp.com/design/design-center/development-boards-and-designs/dy1212w-4856-tft-lcd-panel-with-lvds-interface:DY1212W-4856 [1]
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    | 81 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8ddaab127ab9..dbe27d757c86 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -588,6 +588,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-tianma-tm050rdh03.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
+
+imx93-11x11-evk-dy1212w-4856-dtbs += imx93-11x11-evk.dtb imx93-11x11-evk-dy1212w-4856.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-dy1212w-4856.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
 imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
new file mode 100644
index 000000000000..35f7c5699e3a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx93-clock.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "boe,ev121wxm-n10-1850";
+		backlight = <&backlight_lvds>;
+		power-supply = <&buck4>;
+
+		panel-timing {
+			/*
+			 * Set clock frequency to 71142858Hz to accommodate
+			 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate
+			 * table.
+			 */
+			clock-frequency = <71142858>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <48>;
+			hback-porch = <80>;
+			hsync-len = <32>;
+			vfront-porch = <3>;
+			vback-porch = <14>;
+			vsync-len = <6>;
+		};
+
+		port {
+			panel_lvds_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_in>;
+			};
+		};
+	};
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+			  <&clk IMX93_CLK_MEDIA_APB>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+			  <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <&clk IMX93_CLK_VIDEO_PLL>;
+	/*
+	 * Set IMX93_CLK_MEDIA_DISP_PIX rate to 71142858Hz to accommodate
+	 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate table.
+	 */
+	assigned-clock-rates = <400000000>, <133333333>, <71142858>, <498000000>;
+	status = "okay";
+};

-- 
2.43.0

