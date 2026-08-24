Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109EB3515F3
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538149; cv=fail; b=oyaJJat3rhfJZK90AnY2QnL4cwzu/Ozo3CxKG2Akb3t3sYQOMdsoGIecIlI1z01uCsZpzY4mHH7PGAPQqWOE0g8BJx3LGkjlDe1sOsI8VjtPhiuN/GrSXA46CgOdYKtnxXQuFPNPfsZNCPxkKYgyOtaoiSILYt6t3J2CrwTD/tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538149; c=relaxed/simple;
	bh=zI70II1M1BF+NNZ5qzqbVmbmy7RKPFsfFym5v9LznPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C5A2s+v3USXxX3s3NQLbpTNfIVnJtSX5ZP0y5o1cokntWb4Sai7X7TjKb3vPunWaolQX/v9Ydf4BAvC/cAwxokh5wrFM8l0DlVC7wmtwdhpgFJbIX9LgEaW5VNFfr/LYNo/h/QP4Jvj+gqEDMnJldUBwEZc1+gSIFzMNtheN3F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G+jq96aV; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G+jq96aV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeqAjZZdfgx2Vg1Inu6LsqBroly5AYcZyj+JaP0LXWgS+93H9GAOilQp3AKcRLVbHplKSRDN5qVFMAnpgW08k1t8iZOLdOsSJWyWcLpZ5TU4DxctioPd7vQONjctFUd3+MWXxuQm+Q7jQdVlc9SAGwWaws4gAth3caLiMycUlR+dHhHYeiDbpqotcmBY1LRaON+FZpubXMEIDjO8N0x8y3EyQryEarfFnW3gnWy+CdZMqIVuJKUK6TIpVTx50+YBkIg68TtEm3TSmXmGpGpjnoOo0GuTk8Q6u7gnp7oXfW2K84+Zozlp0qSRAfh7Kc5WaiYj8BMkDQ+kld/qNBE25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVaLNPDSPrhxnMV7ppCP2m7BAQyoSp+M4j2OCDPXdyE=;
 b=xbV+/chJ1H+BMyncxOuKl2fkPZysUiUO7uXE4MjNskFS+FEwW+29x8uNwNOlrFa6l3tO+RFK93oTrIfmsoNzScPObs0cgFymo+8mcFuot4sXaT7+MGL5PQPZjmU9l7QxShjJvvkaFSP4gkjOJIUDVg1KD91X4Y68aXFVf8KBCxmyRuOZvUngf4d1wKs1gqSgiPIlbM9ZLdht1TABYzkJQIPgOiLRzokhbU8zTNPw3S1AFr5dnrmXO2wkHEHTs6hCdEMkXC+yr8pbl3S8L8aUQA/HBaU9w8q4qVEJD/Ff+Tq2J7G1oibiPIWlGLZ7uSRiA7lSnSKpiTkOqupIzApvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVaLNPDSPrhxnMV7ppCP2m7BAQyoSp+M4j2OCDPXdyE=;
 b=G+jq96aVdU6yDpGg1n4WLXWn0el2qSee8b6CFZIRJYR5hJsU3WKcMESzcDJqHbPPXzR9sbmSnj7oAHYzOL+RtxeuGsaAEeGsDgiip+Us4I8OnNzmDuLcnAgdgloy/tj0Xd5K6AyZXUKiNfFGvIll7lwco5pa4kOczRq0flrOYQmUQwOD/EaDFxxo6D7HI/CdaQZ+JyA4kKy7O5QarO65whuFmdxnG8j1vXrlKVe+Yu9zB3mGGQ0k0ggk8yrterSGDx9O0sVsxJv23c0ePMJfeHkY5KHRwpmRDcmyfNznaFLW1BY5C/T/tDlvSWUwKHTDQ/DywjyVqY8WYk8oOS7wHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:22:25 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:22:25 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/17] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
Date: Mon, 24 Aug 2026 11:20:20 +0900
Message-ID: <20260824022020.2812810-18-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0196.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::6) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: ed202db5-3ded-48c6-9fee-08df0186897c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|3023799007|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OEtQmzEFd9XhH426OwQO/KRJ4rMT9GVRjv1MuuJDiI826vKfukkVkJn7TrESSkbaDOFDTs02mrbbifwdf5yBAdVpNBX7RrqK+JQGlZI+289ld8UR+juERXD9K/B9gfMPsIO+l+Cph+Ger3Q1GJmWKEHislMWZGMOXwrCs+jQLGwcWUmjMaW8Wg6VfEJqkhFnkgtg1mdtWC+mASqRPMm9e+YJ4qNVZt7/wAwwC49Hpqy8DGiBK2qB5fw1H2oWFncGrjvLVEVxYH9xUn480Rf87qSh8E//NhEP9I9DhxarJZZpA1J8IGlZDu6pJ0FkkDO2v7bid0m5AVmIQNqslfItqoIP28IjfaSCjeGjgctPv9l/TOejozUYc3zs9GJnmgbtamwLvBKsjWRAD4nlCCgtGta22J3Cf0xuNCJQQi/+GgsJ8fpQrSnzDD141yZ3a4U4dRAI6Hni2glI7LKBK/mQKAcvJY+pMBQK/7Gqwmx2QTmmnrONMKai+cz2OIxiiIZAuTWbbydlYlP0EukaUvEsCuPflsgUynOJ95NNshcuqlq0fgme5OQABFNECw2mL/wnLeiAxdEA5WF/yKI5yqvvLDkLEbpwrM0rDnQ5ZPH+Wf4YhiU6fKZJYTmjR9ko198EnrcbOB+3u/NbjrTO+3D+8aPqd8BFs84ZRlpgpsA+4uc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F8PpdjYnAaBDjWttGULGDz+q2PUdMZQyOuUyFEJ5Bk27Jcngs/33P7Oienmo?=
 =?us-ascii?Q?KjM2t6+P+zwKYpSbABWfXneZUYy4/aiwgXATEiR+WP+Ow1T0Bb3+5y9MwleP?=
 =?us-ascii?Q?dPpGJR0f1Ad2xIlsLupqywWC9AGR3b/jOF2cVDM12Sg0sFqT/TCZDiqw0awu?=
 =?us-ascii?Q?BmnGLFWdDQdWJn/e+eGkj35534PODFoBiC1Ai7pM4a7wmdBZzqH9gugWaHgD?=
 =?us-ascii?Q?Bo/bscjjVwergULW4V9JL0GvntyRAgTE0ABFXIXeCvBI8yrPM/oqK7DYe1Cs?=
 =?us-ascii?Q?2t163X0n8o2p7ujvYuccdZNWL1pwWUYuAjjuRB3A2TyPqoPpzg3YqN0LFHCt?=
 =?us-ascii?Q?df3JywNyqwuL+9i5F4hg4yLJjz6mKlTUHNIUTjQ3XJAR1NOGFTVl0Rg0qNGE?=
 =?us-ascii?Q?XKIY512DqV56Y/92EdaQSmkEgvYjS5Ii42Ff/Zvr3EhJ2/oCDnAG5V6+WOzj?=
 =?us-ascii?Q?byqUvjXjuadQxsUZFVGrcfq8N8KSwdt+R6UOl5h8FaG6iwfTgBigaXX3nioa?=
 =?us-ascii?Q?KgVl3lzPoh73bsnpTvVi8eWejK405VYxyQLhYmCx0u48negvdsHj+8k5pLJ6?=
 =?us-ascii?Q?67ftGasz2VjWef9OeN81yiImrxih4mvX6qQxTsSObYlBX4pWw6ntybJuNZPa?=
 =?us-ascii?Q?fOvlHmf/tqbbYJ7aQwGWVYCKRpJvzzR1WpLn9PyS/7c4WVH1r73f73nhJDqN?=
 =?us-ascii?Q?zp/Mf2sD9lLVDkRy2NDB4KBixB4QjxJcQclCpxxTHe5bpO2sBtkkPQMzXUi9?=
 =?us-ascii?Q?2vUtmsGOWe1aWD/8Sw9zXqyE0CEd4F6BsG61zWzcPn5/NhzFIac8W7bQl4Ur?=
 =?us-ascii?Q?yASWAXeZSs0z+eJrxXo9RhKAtkEMm3JqSob47GFbBW2g20ujRzX59/2yqd+P?=
 =?us-ascii?Q?M9ldb/aCkaAtsFkQwKcuo8drm1hMwgJFosHb6ZgeoOyLvvWwq0ifIQicMpaT?=
 =?us-ascii?Q?+C4jcK6MeV8RJn3r1aZ2zdOoGfTJ/CuM8oneYnhLT4ZgnRij8RfjBSl3IWKw?=
 =?us-ascii?Q?nfTHqhocdpN5IYVH3m+OTnVUv3gxhIXniH/KZGrz3a9B/39d1LdX8AiX3d3N?=
 =?us-ascii?Q?xTyesU4822H0xzRmVK2zzYeHvHExTQOxMD+of2FXlrmC1mLSkCFr0PBwll1P?=
 =?us-ascii?Q?N+euzuZ0hmMs80wojxlgtEl7ZTRPQFI973eqlR2G6aQsmWmQSqmpfl1nldcZ?=
 =?us-ascii?Q?8KyRqvK9ZQoW+lfCt3ostduzQyaUgb68OlPWSNYn4Fwu5x8YhBvTI4VWLVIX?=
 =?us-ascii?Q?94dvUrloILGflbm1XRDcnd0mrVOugSuqUoF6Aw6fSdfyuFRMaqNKm5I+w9i+?=
 =?us-ascii?Q?sA0PBKm0xG3FQrqXM8ZSzwUy/TGTGcwxUQriiZxjS55SClwA2JRiFA3z5xk6?=
 =?us-ascii?Q?/Lfs4zx6tyaEckU5bja6PJztObXH+pGpW6vIIhFfqJjV66PGFskSk8yHqKWy?=
 =?us-ascii?Q?ZtjyTHA4Y97c9aOXSMy0XC5J4bERrreV28xCsJl+jZgP/CLkxEC/X69XVeDr?=
 =?us-ascii?Q?tFmxpLpisacFd4WwcUrzuHYUKkykG+sMNUinAFhJle81JWB+yxW3F2dyi5Hm?=
 =?us-ascii?Q?yHQ2qQ+TCmXveAAv/z/MOnyZrnCN7FPSDn4pfZjylWa3kq2jMZezoSzYaHs2?=
 =?us-ascii?Q?ZUI9BdWj6bwZmEEloplRe2OmLn2oMXFxXwNHqe6Kk8oRBcfcH8c1GcjSCK5e?=
 =?us-ascii?Q?5UfbEKmgtocMR9Q9QnW8rXjnTzQKT0vjfc46Pp2HFmjITzoop4eVaoZIIa9S?=
 =?us-ascii?Q?rsSukjZ0v4x5U8bajNZr/lZKymEUsUkaXQqWj1alSIJixsygDHQJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed202db5-3ded-48c6-9fee-08df0186897c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:22:25.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOpmW7+Wail5FLD4BAXjRT19VgGNl+JNmuVp/hXoRFINjhnwKJEKBDRHX0H/xwmf4di1KST0VxwfaiVglGrANO18TUb/JuSR8O0BVAB5EPnDYEBy2ONVzPeSqjodZyNa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

From: Chancel Liu <chancel.liu@nxp.com>

Add a common DT overlay to support MQS sound cards on i.MX9 platforms.
MQS output pins are often shared with other devices, so the overlay
routes SAI1 to MQS1 and disables the conflicting device and sound card.

Attach the board amplifier as an aux device and add the DAPM routing
from the MQS outputs to the amplifier inputs.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile      | 12 +++++
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso | 57 +++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..6e9e3226a693 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -613,6 +613,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
+imx91-11x11-evk-mqs-dtbs += imx91-11x11-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
 imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
@@ -645,6 +647,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 
 imx93-11x11-evk-dy1212w-4856-dtbs += imx93-11x11-evk.dtb imx93-11x11-evk-dy1212w-4856.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-dy1212w-4856.dtb
+imx93-11x11-evk-mqs-dtbs += imx93-11x11-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-mqs.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
@@ -652,6 +656,8 @@ imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
@@ -703,6 +709,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
 
 imx943-evk-sdwifi-dtbs := imx943-evk.dtb imx943-evk-sdwifi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
+imx943-evk-mqs-dtbs += imx943-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
@@ -734,6 +742,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
+imx95-15x15-evk-mqs-dtbs += imx95-15x15-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-mqs.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
@@ -742,6 +752,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
+imx952-evk-mqs-dtbs += imx952-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-mqs.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx9-mqs.dtso b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
new file mode 100644
index 000000000000..bdb251299e52
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		aux-devs = <&amp_mqs1>;
+		label = "mqs-audio";
+		links = <&sai1_port1>;
+		routing = "MQS AMP INL", "MQS_L",
+			  "MQS AMP INR", "MQS_R";
+	};
+};
+
+&mqs1_conflict_card {
+	status = "disabled";
+};
+
+&mqs1_conflict_dev {
+	status = "disabled";
+};
+
+&mqs1 {
+	status = "okay";
+
+	port {
+		mqs1_endpoint: endpoint {
+			remote-endpoint = <&sai1_endpoint1>;
+		};
+	};
+};
+
+&sai1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			playback-only;
+
+			sai1_endpoint1: endpoint {
+				dai-format = "left_j";
+				bitclock-master;
+				frame-master;
+				mclk-fs = <512>;
+				system-clock-direction-out;
+				remote-endpoint = <&mqs1_endpoint>;
+			};
+		};
+	};
+};
-- 
2.50.1

