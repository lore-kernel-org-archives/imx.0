Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1D219FC
	for <imx@lists.linux.dev>; Sun,  1 Feb 2026 01:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769908778; cv=fail; b=qS369dKgsRl4ZV36v3VMDApovBxynCKxMDmVzH6y3WJT2evcTH5+lwYfRAJGt/QStdfwXi0ndyVd0A7fRlRTZGdE6ohaXhMsHWtcRGGwFoxoc1df1ie6ABoPfTGRIAEt9q3lQajgB26rwceXHcgMm9fh8Q3V0A+xmJ9SnaM4nZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769908778; c=relaxed/simple;
	bh=d8WIVzGWkf3X7pwbhKHyoqcL1BayJdXVD1uxEgVJEdU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FeoEY0Lk6uGnPixDBA0Z2Tz0U/PUnBUP5gfGCIZoKypeAxyrSYcc/P2M3lPaxkd4G9dXqIyk+2M8i0ZB+9VItAnGcqG1Spp1sDh+D4bN+MZydtK004e3pV7je+XUaERsLmQALM39ahVkaXXix+Cf1d/BBIWlK2nmy4owXV2Soh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QrJ14N0c; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QrJ14N0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/8Pc3TBpEaMSNZG56mkB+62UoiyFhvCNBN2lCdnX1kUg8TC9HMtmZrUSYnt9FKytyoNPpFx30BtyhJ9R8ifgWOC0/Wp0Ca37htGvdyvaFhGoDYdMP9hb+gVFyA0uCb38eN+DJNm5/qVpyuXkAXygB6mOAbHZRnT5iZ1M7p4k35E9O47Y42DzMhAF+nI68W4XEH53jySLV8Vq/ZDdfrA+xznYJ8sKBTWmsYOMvUExwVIA3M3AiDO6OqP4awBoKjsS8YoRIgfC4wRsBA/rydOZBVyGeDbAMGalxV3Ytky89EopjIGYxOxnYM2kMdW08x4CGACfemr6PEjW5LCJ2l2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y9Un6y1MZbosE5WvWnO03hSQaD2yIRHxVKRZ1jkkPk=;
 b=uiwKyIv2p+52YW6dLvF6IvydG9ACHO/zz/Cu2inY7a68ZOjO/Xes1Cz8UELJTdaMwbxHR7IObzvFkirtwO+XnM+g3ZhYPVEdme4cPxRSPFqD0WDuan2T3JVGd33jrK5lVlQF/M+6BP7Oi4emfGlcHJaCpg3tiyoF3jRKhKBAPvPda9kJCtjlAT8eCJP0cBBQX7/FcYKRg6SUIDz5pug8Xr9DXj/nqTbHueUgmagKZfOMyyFdcRDQkhiUutfnZiAXp0gFL43l+cwcmn28/A8DS0tNqVPdoLfs0DNcRWjkRfxq7Dnui/BflSPJftdj1XYuwYAi6fxrr4H3YB6k5QL+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y9Un6y1MZbosE5WvWnO03hSQaD2yIRHxVKRZ1jkkPk=;
 b=QrJ14N0cSQ+L+hLpFa+jO3Wzzv26mHTjgDuvksWHkK5N5g0bQxXhdeDj+n1U8m0rOpCt4nX2M2pHzihoKZqnYuLZvC7e3mhKUlQP4uQ1xxXRNcTjyPmxyBCtpGlWi3tQfUcqeVHkmP5GBS0iGEtiPW5WyzbsfL/rxtyq7r7U6TSYkXvHSmxNnsU9kZiz/VLohUJSnU0vucgYw6JIwJLTsajWeEU3tKhL398+aHdnV8HYLCecWQf/Rh/TFTAeQqBji7YPe5788dYQebDSlfnF4jf4rCOQTqxSFyVWoJi0uHoaXk9zryvv9Bs1GnmuUt3v7eUj+PCM0TU3vuL4UPHl6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Sun, 1 Feb
 2026 01:19:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Sun, 1 Feb 2026
 01:19:31 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: soc: imx: add fsl,aips and fsl,emi compatible strings
Date: Sat, 31 Jan 2026 20:19:13 -0500
Message-Id: <20260201011913.2419626-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: e2145db0-2348-46c0-f500-08de612ff380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LTnGuk/By0bjenMxMC9C46Zz+5HiCq4i26aaQXgzWR7emN8wUk2ZxzICojem?=
 =?us-ascii?Q?QGoJt8oWlsx6VW6pv/tnCm3ZfDhm0E3xG6SeLsXMXyw+RXyC7Xqj1a1Q4mmC?=
 =?us-ascii?Q?RX9XAy2q1KNbhp2Nes+7oCVPpv8Dpu1iieT60NGBFvwFMNurJS+/3/vbJsUv?=
 =?us-ascii?Q?RoHJrA6dsOxkXKi8ktQ33LijPe8gXSNQDPBC46JtwwkGd4bvo+ZfElzGaB98?=
 =?us-ascii?Q?y6eLWAObQnOPX582HTd8TY+khdut5pPHo7c/r1XQl6wsU/XaWt/rfwMAKsdr?=
 =?us-ascii?Q?hTDocYFKvGfXSRLSwbWirdEwmsnkf/vtmWshNh2SoTg0p1eqphz1lfG01cXA?=
 =?us-ascii?Q?bIwkYcam5bVFvccRmrrFsr+reVy2XhadkQtJ60KrFFe14ckw0oURtRZpE0QZ?=
 =?us-ascii?Q?wkb5yW3kKjKa0G2QzDNmdR4R0dWkHdhQ7wmu9tTVUmDpXNugfJhydyfRBygZ?=
 =?us-ascii?Q?SDjPaXj1qQ0ekxivAGe88rD7kdcsfCO6wzStA3b1XG0IWSbs0c2Q9JFDjOza?=
 =?us-ascii?Q?HycOy3wSZNT+kvMvxRT1PJSAbM2914WrCyqL0ir7xIKJPSBe4ptBF6IA3p1i?=
 =?us-ascii?Q?Id54r6zMCedaDpZs/MqFEWfYNGlnvVa+vI3mGpqj2Mkm0GNQxSEqhb6zADRU?=
 =?us-ascii?Q?gYFuhDacyUOYH3V/VxMmF996sO8XkSdLjnJmxv/2U/yPZFGCRyM5qaxegeT/?=
 =?us-ascii?Q?aW0U2FerkOZNqKXnj8UYz56WKKDJ/4IVdrGTfBvY8ZEv0TDGJWsnQ7aoH6Cd?=
 =?us-ascii?Q?B7rAo/IyXIxn7OxFmEwFkra2m1o6qdIT1S7LjhuTSp97zToigArMu3pycD0v?=
 =?us-ascii?Q?wb4QeOCD5wd1FlMHntK023wnH82ufjyaVjzF+606i+DKNWccyVPsdOeVofKK?=
 =?us-ascii?Q?NCf2wxjXpceWxMlyPo042w8eo2sAUgw7N2dRU5POwvoqWUm6Wp95jbzD2KgG?=
 =?us-ascii?Q?TRb3y8UE9Wzhienjj+o4XPeLVixZjGgXs4kSC9HORMXjN6XTz9MmVYOVo9bc?=
 =?us-ascii?Q?JxjowWVfMxpzuvMegHd2likUBDenmhqobp3cTdrsF2ddz/ReCgugB6MGsxCR?=
 =?us-ascii?Q?U7+F9o1wqX98Wf4mh68E/8RMw8PWnaMW8tsjWWUR3n9hQbwkgj4wA0h9Lc9U?=
 =?us-ascii?Q?4yXYHNi10f4Wqdh+EaxYmEdSZaAhMiTo29eRWRX97teFVGoKyf2XrQxiOJhz?=
 =?us-ascii?Q?ZKunbaPE2GD9MkjsoaSF5iFDTFPg/KZ3TuD/80kesdHyB8biWsLvIVdL6fEG?=
 =?us-ascii?Q?F13bJbGccdNISBhPvhlDPVZQR06cMBLVgloJPMIS1vXFfGE8xSlCC7qTyQUg?=
 =?us-ascii?Q?uBFovFfWJr5Qb1NUtrUHg/FBwhIo/2u4pylulC58InAXhx8Yz2+dTtW+yC0j?=
 =?us-ascii?Q?69seB5bMfY/g1AUuqa1xJIo+0wZzNxh06HkokjoTUuRcoWCPK17wo99CeNGt?=
 =?us-ascii?Q?Fdmq5Gygq5FP19+j5UFpTq3eq3MTq6Ma9XYY0xndcO95LwSBP2KF/2wsnMqD?=
 =?us-ascii?Q?GJ3Cb8bEY+gQOQ93YwQdsBg6EBudJG5XxLB9KHbYcFNBQmixqUv4i3MZeRtd?=
 =?us-ascii?Q?F0XsuKoGfkif/l8+boKquWOPkskOVZGSd6Rnr+K2ODDT71LV7KJ5wVni+0xr?=
 =?us-ascii?Q?xSNwb34EaI33acR5pTbjIdw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cyTI2wLu2PUfe1GlXcePYp+6Hs9Ru623QgjB3Oxp4iMwv3FVzJSRlJsrgKL6?=
 =?us-ascii?Q?qG0Wj98mvLdJoQtkXSYxeA3Lhe+ErPF2zhmaVw3iliu4mST9XUrR9Paz26vQ?=
 =?us-ascii?Q?tY8woq8O0Q02ua6dGS+1BKBudLoN1pieCVBqkb9cSpE8gJSJ9VSpCWgdXPCi?=
 =?us-ascii?Q?kWhVwrI+e75126eYY3OkzkDRGcXDZsODOqUQ+KpZZqxgEuQ4HvE9Xz5xXya4?=
 =?us-ascii?Q?IAu50rKwFLV4MECOWNqGkhhNOn91daT9IqExzv65SuHCzgvcAXwVATRd/ubx?=
 =?us-ascii?Q?TeAvVgW6+kpQAgJ+43xJSJtojXWy65TOtWPdinkdviorGkKMt+sVGBopX/no?=
 =?us-ascii?Q?Rx19mycWZtcYnwx26BOpS69HJpPjtsPiMfc0OkeoE9OE8F0Uujyunn0Fj3hT?=
 =?us-ascii?Q?UdVbILaf89Js1C8+N/jZ9Snv56ZcFlwiDB+JDi2nOTtT2O0DzX9puUUU6Z+Y?=
 =?us-ascii?Q?k/bAIq3k+R7+knHAuuokONGQ7QXz/qjm0Ya+3iZV1oTmFLNTa4yeusiMVZL3?=
 =?us-ascii?Q?cey8c/w04KBq/SjMxfK+zL+3MYJV6U8K3QJKknuh0nK57wKasD5NZ1NSd8xI?=
 =?us-ascii?Q?sPTGj/697r5WLJe2hGp7zSC+VFkFLMx6YqUvZ0xpNpyWjlzSflcUzBGA6L0z?=
 =?us-ascii?Q?kxxPI9krfT5sVbxM4+X/dTLw5EU9IlSRRdEbjcUx5mLsoHxXqiuWFx9UB5zP?=
 =?us-ascii?Q?ZtZLOXrmsg9zlfrQLHQq7Xozw6+zRN9X6sqWMlW0zePgSQxdzQ/1FxsxCxGz?=
 =?us-ascii?Q?qFc1L6nBLGUJVg8i/H02XtTINNCVu6ud+H0ETU7hCTRhy9ry7WgpXLPl+E6/?=
 =?us-ascii?Q?TMWKwhSzUJ2YUSu6Tajn/v9qOWEAyPza0mLlGn106BFBfBAJYPR00yy/IWWt?=
 =?us-ascii?Q?CMzlKsKYZ1oEUojKxibD5iXj25t8x371EH+nQ2ukXNI3PT7vqLFYjtiVCv2E?=
 =?us-ascii?Q?+r4UYoLMgevL4wNhqtZlW+W62LqVISjrBy4HCkEAkfiGzREN9qqIMX8/GixC?=
 =?us-ascii?Q?nsEjrUQ4WazBAvzCINEwdikbYIcqO5+3j4NOYfII799Q7E2PRO+v5c6x4nNZ?=
 =?us-ascii?Q?65qIOW5Yohb7Tos4lNivID6JFHiIGuxc7vPZDDARfh7UnJ+h1wXOAC6Z/nzz?=
 =?us-ascii?Q?k396MC6ru5fefYG7QjS26MM8KfFpCEJVc7C4hT/ynDoIFVVT78Ph0zbLyTxb?=
 =?us-ascii?Q?mIIjC2XBZD1TmXkW8Vt9XmQT/YNhCAx2qbDWKG6ozoHGUnPk9tW7CDsVXahH?=
 =?us-ascii?Q?NbIaB/HC5Ci69O7HcfnqDVSFel8/+DgD1Zq4ln0kt9QvPHwYpeY6wIsnLu9E?=
 =?us-ascii?Q?TqsC0YLccOVulLsSt7J1DAlRymsyzcekJiFyzFDJ8Wrwz7jzhT5/PjwGCwdH?=
 =?us-ascii?Q?V7HXlnZVbgRYnCMsOTkDoWTMlamIa7e99Gibtl2pSlZ4HDiQ0PwOwwcElKUa?=
 =?us-ascii?Q?virDurpd5iD8K2k1pVMWrDLf6/MB4defMhoREPWovsI5//jpHWPaLSDTGlD4?=
 =?us-ascii?Q?7n4eSSGSsLGyyDt/aFniMyS/47hJDvIJYilgAXM/Q7HwSY/gTXrpZMCcGEEa?=
 =?us-ascii?Q?T0muNPjGCugWR0rzQjwLM1ahwalVFBixovXjDk3f5efNJp7aEIDyD633Z28B?=
 =?us-ascii?Q?I9dX31DuxKJmShig97lXvAtpYf2kxikHgRRVXZTk51hA7fUicW3sUWFK8FAz?=
 =?us-ascii?Q?+exotJo57YpsvLoANhcXS7cxzNETH8YQUFJJkkgn1fuARFSB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2145db0-2348-46c0-f500-08de612ff380
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 01:19:31.3947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IrpVuY8bkWNU+6gnuujh/3PKCTEpGJIzV3Iuy449DBQ/g53m8rovd3UIXMYjmlmJbDbK4G5cTkJdP06e/YHOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037

Add the fsl,aips and fsl,emi compatible strings for legacy i.MX3 SoCs
(over 15 years old).

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/bus/fsl,spba-bus.yaml      | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
index d42dbb0bbc2ea..00bbde203f598 100644
--- a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
@@ -19,21 +19,29 @@ description: |
   the SDMA can access.  There are no special clocks for the bus, because
   the SDMA controller itself has its interrupt and clock assignments.
 
+  EMI (External Memory Interface) for legacy i.MX35.
+
 select:
   properties:
     compatible:
       contains:
-        const: fsl,spba-bus
+        enum:
+          - fsl,aips
+          - fsl,emi
+          - fsl,spba-bus
   required:
     - compatible
 
 properties:
   $nodename:
-    pattern: "^spba-bus(@[0-9a-f]+)?$"
+    pattern: "^((spba|emi)-bus|bus)(@[0-9a-f]+)?$"
 
   compatible:
     items:
-      - const: fsl,spba-bus
+      - enum:
+          - fsl,aips
+          - fsl,emi
+          - fsl,spba-bus
       - const: simple-bus
 
   '#address-cells':
-- 
2.34.1

