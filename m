Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85818E02B
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336355; cv=fail; b=K34Fg9tE5VaAR26hpgS44aP4VntiBsSZrJmQ4+XdegjBR8nVhIz8NfytIqQY2aQevfCo7eIJgICb47gyt8dHHtP07Le7Q2vxQTR/jYmOCtXRfviPliJs20MGo7lgT1TOWrCGLDl84CR3WgYVJ0mnK6NpK3d749pIBvgSjwaNMCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336355; c=relaxed/simple;
	bh=D2lG7+a7e2ecb4Ul0tmwJg3rwrpSFCForaErR6QtQJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fHqkXZ4CebrQHL99MxfmmfhFHZZg1l3qkfQdqqnM80xqwWPMY/zsxDgh5+4Km8dgNFTa70xlhq+Wjl2FJ5pSNa83BCWbfPI3c8lbLK5yU22VGbSkaCKPtrC3v5gAqu2E+awG9AWcWsi44la5q8XECaJ8ess4JJsaOUpvjm5lpAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jPtLg5cn; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jPtLg5cn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9mWcYJ2Jyq3mJOhQjpjg9a1JtzUiMd5EC1KIQ90VJjm+5QgYcg9MBU4zEkXcbZLBvE2pLlFvtBmBmGUgooneMjX9b/vWkFi7JIloMb1oEjVqG15xAmMlB2lv+GnfKvyNlnbFLzleXJdjxGWvv67bDUKb20uzrA04/IgLD/C4Qr7PoWmaVWT4n0u3s4HtizVHpFYjkVf1/ugOZ1BbrwTkPiFF0tm9LMykIAB5+xymTomIBtSNKOmakY6VbSaZdplyHdkEBbIT7x22ejBxm2+RYklzm+H8WG7yByoDf3e7xR/T9o15KbN4NbbyYVqvrn1cfkJ/M4X4p3KoE6P6qz8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC1Nl/JED+gx328csZ04CPcgiv3ExL9jcEftUQW7p2Y=;
 b=C2QwN4Zht0r6eRAxnK6mfPOHFx0uEg9hDKNO2lKNxQafeWuIpTn6dBxnSGKDXUDrmeg1TyQZuTGZTq1SjuNo1yaeMzTIfP/jAKMlGKWe33eMYFOMzFn5aFL6ZkXqO8fpBVgMTyc/evKBHE+hCbfPuP/1uNWCp2uEmGnGTneKBKV4JgXoJ9OvTn+sud8lgAKoEcbkxHH/QkJlSjKHZryerLYoN6fR7tFlBVs619F7FvQ7MlP3oUj9uRo2slb1WT2WiDJJZyIqlskE00FxQWfUybwLjlREUYyzODgksviQlrFDzAVZZZe19CBJETrOs9PXqTmtfoLCydmIcLppl8Bi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC1Nl/JED+gx328csZ04CPcgiv3ExL9jcEftUQW7p2Y=;
 b=jPtLg5cnefc4IBAKMamuv6ridu/0WTMuXDbCA2lNKIlBEROUt4164glbdk6sxb8YFhzAgURuM/2Grn9J4l9e7ge/2XrwbNLYiR4Ucm+Hxg62KfJMW9NOpfYrxQG7A7nNFoe3Ef/qk98DUtFJYDaqnlX0o7sqWRk+9DOt+mGlAh7Bs5ISOvX2Q5zrOLpMhhWG7eAa/YrmuoOpcOp6SvUCcv4gfC/FwZ57jb2TNO3jWOirJgcBYggQxl11bV6TgzK8hxyLdByY6lMXSl37OcCY3eCOKomxs905sQiTq7EjJUb5Lygq+9tkDvHg1If4HtP2NwxpYx8Vbsye5abPXBN3EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 26 Sep
 2024 07:39:11 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 07:39:05 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] arm64: dts: imx8qxp: change usbphy1 compatible
Date: Thu, 26 Sep 2024 15:39:50 +0800
Message-Id: <20240926073951.783869-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926073951.783869-1-xu.yang_2@nxp.com>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: a791d330-bf2f-4c78-861c-08dcddfe4c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3dkIanwEwwa4HqJIWpP+rAEW9yEJhC3tE5N4VlPxrWGaf8aK7Zh5/2NNt2Le?=
 =?us-ascii?Q?NXNGx7VJo15+xBdNJXbANEH5rx2LT9OpAQxNJjrE36Tn+q1GLn2ERrbukJxE?=
 =?us-ascii?Q?hy1zuZH+akD/TGPDUHGY3PkOfJLwXBZJnv3h0mq5Aor8tchaeHuVDKcsXii/?=
 =?us-ascii?Q?hyusmwRcli78T6Jcf0svywQPnTyIs3ll5Butds2AFyuGG10yXSFZ2LEfDBXl?=
 =?us-ascii?Q?LsH/0Ztq51owDQ9WcC+By5F+FxvmqvgqVvCom5x4+sOCsK6ooVC9Kn0wOaSr?=
 =?us-ascii?Q?WffXWjHpCt4x8U37KgaU1tj/9PRSx9I+1S1ih8Mjs5FFJDdKNt8q4j2xoOxr?=
 =?us-ascii?Q?IbJycHDRUle/Svw8NHCSQ43mXfHUEh+JApAobqvTn364M6qQ1mJ8CYXlhFEs?=
 =?us-ascii?Q?JVe/1bnUiIaqOMFkJDPEOBk7u6r6AbRcMLkuzDRHmtybXUBw5htm6oEfohTD?=
 =?us-ascii?Q?cQQ0/6+ZfkPTpFBkAbhZz1hxiwAgOjmSp1esww6eO3ggA/+jBUwYzpdZAAb1?=
 =?us-ascii?Q?q4xuTgZOD8zXwbSwroBGUCXLqDVyXxsN78CZKY0bD1U5Uk1E/VuXn4IQFYcs?=
 =?us-ascii?Q?Df5F0gQZNn39UalEvADBrx0e0vOmzZfcU4NdcNHDwZVly4IcVQ63220LOlX1?=
 =?us-ascii?Q?odcLi1UU17SSPFTKsz8uL2s+OlqMwsWFiJI1vHG7wB+cGKJmjuhNUx7CT8cy?=
 =?us-ascii?Q?URW68S0Dsos05rKfpd/EU/Mlgbml5cTjDfC3W11u1Oug5kU4pgqczdinEp+F?=
 =?us-ascii?Q?crjhhkLdEHgv9+3MoEX9olMRJVjNUmQQGnT79f2CZvgkmRsg3uoe6HXa+9Hn?=
 =?us-ascii?Q?XKqrUa162q1gHL9rXANOrr4h+awAFBAX9+7uVSyXf8OjTmoe2lvZoLyyMm+j?=
 =?us-ascii?Q?sye5nh7RBFV7e5PhcFaHMA2DOPFBvrqMn+hERxREZDGWK1/HvRA6rdaWi3x1?=
 =?us-ascii?Q?uu/duJj0b9cPo7TQyslwkZsZNFcDayZ44MAjATPivSFrM9Ys24MjKwxG7FJk?=
 =?us-ascii?Q?VIr/lI/24wKst9NyYABc2vl/LgSLUJ58GwD8SQbBwOZ5SskeS7gbIe1CDejZ?=
 =?us-ascii?Q?unfbW0zaDX058K/9+u5RLZHZk2KEgtIuZqHHt50T7ux3bLZ3mmVctjGeDJTj?=
 =?us-ascii?Q?xQXi5kuyQtzxlAxQvCW0xsbkMZUatvI3yVQeR5309HIn8wfxMeFKSZfxKowh?=
 =?us-ascii?Q?WKsST3dZ9MpLK+sciRm4uGTsgDCWmIE+kynSQLJbWP/xAQEUwXNEY/4qKFlJ?=
 =?us-ascii?Q?c93dm4NHQ35Mm8fXShbJdIyz3mCV24fxZ5LyW2/W86syGcxyU5qjLXnETQvp?=
 =?us-ascii?Q?qXPThC4pHqGHRcw5pQDoCwjgYNDZ/fiTu0ZvyariS2c9ig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sgSXCTRpEDi7DRL5nSoTd7RQY5gbLPUAWeQIymAQcRUCbofhtRQI9eWfPrb+?=
 =?us-ascii?Q?0H9h8ktugimtSty7AVuYnWxscZK1NceswpQwzUNkZydLWhKkaiREQTqjZbO3?=
 =?us-ascii?Q?d8x1xKsQGu3zYGvs9VHT1AGijhTV1rZOYtx+SYuhIw3NjD0OV82DzLFNJ01v?=
 =?us-ascii?Q?lPk6qs/di2G3MiXBY6SRBxpf5kfmsQixF0h4sI51lKIHMFilQtPmCdmYhJJZ?=
 =?us-ascii?Q?cazRfEcveSJrkrXnui80h6xgsMKKunHhgNZju8frUe1JpNLwjrW7Ac7/CuQf?=
 =?us-ascii?Q?XaTJlhJvXFu/AUZothnx7dhf+W9YQNpP4rTIQWTpjQPN4HA6HBLi7TjG4Wva?=
 =?us-ascii?Q?o0U8NZrqLwUbL38OpGtiNuRVQ9BbvDK1GaeZjKjPz8KGJ2LLzmZdlPzoc9qf?=
 =?us-ascii?Q?Y/dcjJWB9+8UXH8gE7I2QWQfgeC0qL6Ci5+U665dhU+lsOgPCD4m/stpafwZ?=
 =?us-ascii?Q?PNVHxJqCJvEXooVPBvagAqG+h/wh4udA+zEcYUFsngPhJth4VziDbMy0B9PF?=
 =?us-ascii?Q?czpJiYXuHwIv5OUCbSlWWIr/eI94AZu2jNXzQ3Qk5tFQVCgMIkgzuPY8fP7G?=
 =?us-ascii?Q?s9frGazItym3n2K9r9DwqXEra+CNEKnsTlFqw3M3moBCodMAS9XOoU1NW4c7?=
 =?us-ascii?Q?kiGIO6DCEinwHIeaDFzo5i7/0eTu4VhIkzgLnu/5YAMhqgKhArMKt9Oge7P7?=
 =?us-ascii?Q?UWEpdddOKN5My5WNzCn0yLuhgdReLqsRkS55FhdM2jnndr+qnpyRlA7Jlps9?=
 =?us-ascii?Q?c6wZPo6ZkRmc7QmByhZM8N+Xco6S9Co1c0QKR4TmAiDH3boBZhFJpbfT2xRY?=
 =?us-ascii?Q?s5GKFRMh5vPCas7oDmJBjp0uZVTb17lRtRt9uXqrdPgc7GE6+WNUq/Laqj6t?=
 =?us-ascii?Q?preMDSaLwY3/lSibjBi8a3AeFfjxVxmPzd4XW4wM9bagtHWpvJFyOhUaLseo?=
 =?us-ascii?Q?yoLYGU+AIc2lDjRJuktEBwHCabhJGgBATzlXuYDqH+EVfb2HsO195R3J2siZ?=
 =?us-ascii?Q?zhYxeRDxMYQ8ySGo0/METLan4idWCZG9GfHV+vJa36tSq/LB51I81jLvCsjx?=
 =?us-ascii?Q?LWoglpBQjN01irig6os0PuW/hB4BfuW8AbyS/UWJniBj3DN0JTftjOwRC1p/?=
 =?us-ascii?Q?R8KkBLMACEhwsjMOtLrrVtpuHnTM/3GX8ZB8VfgLBJWraEyPycVIt/ePo5//?=
 =?us-ascii?Q?3+n+goT3NWx1DelIep9amhmuqFfBiJiyKGlOYFba4is5yXuih/Ml8WXNidkK?=
 =?us-ascii?Q?ZN54oOzlFejodrV7Psbm1ZPC8XyUrTMzbco9PBASe/VZrmXO61y8lZnoI0tV?=
 =?us-ascii?Q?tA0BmFeo+ToxibvtgfyONWHsN3UhaNA19GqOEjY4FUIXl4vuKxQTenvYSKqQ?=
 =?us-ascii?Q?7NrAby3WxEo9MCjHUACOZZW7vR2m+joTtCsrOoXf7zRsdZfkkyzaj/X41w84?=
 =?us-ascii?Q?ZGkGVcGhPGiZG8ch/wh394vkpUHy+X2l9T6WDK/dD52V/ZfrHw3dchgbuYB6?=
 =?us-ascii?Q?w4U+lrBe5dCHCE2JDKzEyEfr+aCdKXRfGDfZKDdNMqnG7BzyCRR3audJ7Sc9?=
 =?us-ascii?Q?NKn1W9oFtJDLrskCrHlCM+YSEpw0zP0kpe1ejE8L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a791d330-bf2f-4c78-861c-08dcddfe4c23
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 07:39:05.1309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qe3VGCn7T4diaS9QU7/iIQLJV8TUs91fdFCKC8YZL+8GOCeZJr+dTcnzxNGRrWO1pbD0kcBGyoZM3+P6iI7tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763

Make fsl,imx8qxp-usbphy compatible with fsl,imx7ulp-usbphy to fix below
warning:

/home/nxf75279/work/linux-next/arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: usbphy@5b100000: 'nxp,sim' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
index 46da21af3702..4eb48ad48745 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
@@ -4,6 +4,10 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&usbphy1 {
+	compatible = "fsl,imx8qxp-usbphy", "fsl,imx7ulp-usbphy";
+};
+
 &usdhc1 {
 	compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
 };
-- 
2.34.1

