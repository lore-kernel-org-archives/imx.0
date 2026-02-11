Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E77E10FD
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770848151; cv=fail; b=VszI8pWB7ywhpVyoqPgK0AAZPFQAjdQC5KVsm5TUPweYxNzZGTnLoXtx2skNkdM/eiEZ3qZ0vBibMF66eTv8Iau7hmoLQbj8Ylg19/YD7hcAlF9NRsh913xZOpPil1873WcYzITEKIY/zilNWbbLCiRQ0QdQqsck8OFIXKUA3Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770848151; c=relaxed/simple;
	bh=O4feTREKB8WAKzfkXVuZQWmbS98dfsPhKnDAQuMag2g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ucplmLJP1f+jPIN3PxIQo3KxMCxml5g7Fcq6TRmemsQWaijl0TfUt3BpMNvhywAY+vxBV8zIOQq3xemsKRtlrIG10c0brWZBm9/r2u3KsY5EXseHaVT3dAQg0+Sx/UNE1vOVlpw9cZlqwJJRR7u0D+WR0Qc1aJiPtmAx01+p9yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fgt1aKQn; arc=fail smtp.client-ip=52.101.69.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fgt1aKQn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLpzBQdBHnPCj8XZGDVjbUakbrvpB2+qbSqIQzMJB9Q4rXjUsT2Wj6Pb9qZ7lPRiTApEySupp+r4/nYiVIxE2GbCQTQuF1/m5lPMXX2uSabB8xdhVah60zx+8R8p9dD85hQmdT5h7p7z5a4pYVS1IvWaajXOSzly7Ojc03SRIhDR0A7+2FcOrVZK4Xl81PzBvQy1/md+5hcsR6yMbSetezgCmkn+6u9K7eD1vVTcO9yqEWZTDU0gDQDQv2fUYv5QHTAc9Wq1VqTZJwcFYEeqoRUZ2QFmSCP4RU8aboyp8GV5dngUv/oD7eAldi1i1CZCGNm3/9zB+zWi8c51ib2DXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxA5ITKgUtHVi4yGf0504csgKtlivItZeQruEeg7tRw=;
 b=tGMyHDjX89jPmC5v6Y/AHm1xQj0kxwsA4vSg2t0g6yqscQdMFe0HrU3mpiMaRNAmoEMsgZO5MEA5TWIpgfJz37sSlESp1KJVxny2cbuCI7nVrLVg4tcw8Stq0zd3vIlsTo27wNEOr+BnJKxmwS0u48BCrYs93VVTEICWJQzYxPpaU6Py6bCHCLlGVjCq+sXCOrIl15uKc4ejHTLJ7oEpRk5/z4W+E/Pqga3yOW8uJ/6c5U4sIjrn3NPgC6Ys6+/WXD20E4upd/wIQ/N6nrxgfygX/tsOCBqaSYzJDVri7jqMqfvDHeMtmE4V7ORFi0i7/uu9piFVR/USrg/tBGgHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxA5ITKgUtHVi4yGf0504csgKtlivItZeQruEeg7tRw=;
 b=fgt1aKQnLFaVSr+xmpMpLigGgOcYIES/I+BIG8A31xVu26va2wm/FZtc4ghIi4WuhLfYyQTEGgjcDPZqG0PD9xgSIi1F0pBq0mwVAa0wwZvBqJp+Wh+asgQUZA07D4vgkf+hGHxFodnaPlxwMEzGzQwkSH6xzjNNqCd0tSDuzRBLcsKALRH40gRF5Gv4xqABENKlUrosvd47WW9vv9MBJbMyH69RJFeBTBlEie+QK7G4ycehKjpwu/LLmbx52TEzZcyQ2JUWVQ5KKHREIFAZyLrZaHKCrRhQP4mk9VC7fqO+2S8Hx/A4OIu3MKeTLHhqJM4saauKdvhN5+VGkCTVCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8193.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 22:15:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 22:15:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: fsl: add compatible string fsl,imx25-aips
Date: Wed, 11 Feb 2026 17:15:25 -0500
Message-ID: <20260211221529.3745404-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: feb04b76-c93b-46b7-877f-08de69bb1a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2j3Zh9VQjgLcI+aptwg0yV/aKFwVdr0/U1idDF7FcnGsU/KeEL6FrDUIfo8q?=
 =?us-ascii?Q?tijj6xxCz44Cx+NdJWnJ11MldJGZlZ4th6uguMVXZtRvUwK/mCkdtW1JPOju?=
 =?us-ascii?Q?KDEcBqTMZwdUkaxFkB4JzQMBxNv1IpaUHRyX0Y3nfoGOC2eHXEZLUVn4ujoZ?=
 =?us-ascii?Q?aLifQ+Lzrfgs/9lXzh9omIqC977LxAEoYEURoxZTh5pmJdK6E+hAIHNMvdtk?=
 =?us-ascii?Q?luEEHn7kbSfbirdCNgPqyUfjTual6Yz4/cY8ylIAXshs7oizRhjuojXuzSnI?=
 =?us-ascii?Q?dTo3+d+QWOOsyuHhYA7GUM/tPeRQDCJD4IwDPSQUOaoXXrF5ERTm+9NIjaX+?=
 =?us-ascii?Q?brwYvi7hbHQ1ZAO72vYZRz2+wn5WOV8f0fgNO8Oeckr16tW6QuKte3HWpb87?=
 =?us-ascii?Q?xkSHUK2pVfvzwUZ74DTDhh6em0V53+dFIjmsng+BPCBXal4miGGn7ZSgdiL4?=
 =?us-ascii?Q?IMrNnKLuXr26H80RN4wYJNL5WTe/tfd14gmFgCem5FN2ayndLlpfwB0/2cMB?=
 =?us-ascii?Q?TCEgp5VtoZkarkXyW4fgZWwnysRj8ye+U735/k8iwVdIbtUGtF0STQnBVJP8?=
 =?us-ascii?Q?NULarSqP3ua2AY5Izpf2/pfT873CKWeXg6Mq/+1S6k1d+pKxy1Zfsi5ArCe0?=
 =?us-ascii?Q?FjzFR8BoSlqxQ8ncciI/2277/cKEspIwMQHBwgGQo8aRNQZqHpF5Mt7JXi8h?=
 =?us-ascii?Q?t5ijcGeil1sZHaF19R5Apjamwa7g2ez+UeKi8v3r1K25BQIt45m9swFhbFvo?=
 =?us-ascii?Q?5zKeupWR5lYK1evVbk2lQYS8PmZDoL8H2WdSCff3AVTTDNh0C7kl2CzrkOVn?=
 =?us-ascii?Q?xrFCquy8J7pVrGq8Jcn0S8kQDqWucS5ihzfFJquMST5BUDLyierWkzgaKhrh?=
 =?us-ascii?Q?LCaHsHFQzbOz6ihT6WPL96FMKDCxo1i/12KDUZVsqLrOZQZblGxn09T8sCdk?=
 =?us-ascii?Q?oFISVCQ0QgjJyhxESZP+AZwhxfNfSTUdYPJL6UA3fyMvbF5Fddlplr+3zPCg?=
 =?us-ascii?Q?M4uFa7t8AQpbnf/etvnvIhfhCa4FboinTlqf0oC6R26iH62zwbguGHHjxm8B?=
 =?us-ascii?Q?hu1hX/RDPFuGIBoMerAp7Jc+u19RQdaiaoE4gZEfhYY3lR44X0qPWHQ9OIFg?=
 =?us-ascii?Q?5/L/MxTYS07vSdzAEcmXfj2pQ2KkT9cRIOO4GeHj0UNc5X2WcWJnIl3+AWMk?=
 =?us-ascii?Q?cnKFKTr7CS4P1AzKhIHdBi/aIeyfkFq2jQBPv4OIozQNxptyLLXXPCmCzbiy?=
 =?us-ascii?Q?p5IglwxbrFmJYWYCzX/aidJHumywG8T9MPnczUBqAXRT973gYiwWJPZXWhdm?=
 =?us-ascii?Q?AI+feZVPgzCkBOM8nHtv2RWl9dluet047Syhtl3twuXEvXsdSXtDxmTrVl81?=
 =?us-ascii?Q?W6+XllXdbloAyLfirKe13WCia5WiUYMkUikFym9WDEdvZaRmJorr+ONT0tUK?=
 =?us-ascii?Q?XaywgkFdIZcBy8nfwbImQeEkncbEuQE3ZJx0S/Yvi/b1beJwCZ2VyxF6kcJO?=
 =?us-ascii?Q?/rdg8/Nb1M2UxdXSVMjWCImch4K599clKZmeXWnLOSHA5bqnRZA3pkuOaIqR?=
 =?us-ascii?Q?lTcnjziFTu5IU2C5NSGdV1W7aGgNg/K/PFgtBsm6RKiEFgDs9UT0yArsaRWK?=
 =?us-ascii?Q?z8lLQuVB9D9158LTHEVih0Uqv17veTK+CR6vynyyOSGt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gsc6+kZj/d7KRJuGVlG+CiOVKNHPDSRU6eoxICxDaRDPmRPJBeP4H2Ry2emL?=
 =?us-ascii?Q?TmHgTMzE778OVXFwxUZ2tUXMFK9NSHi08ijEAMM6e+bn3wYJU9x2Xtl1LLKJ?=
 =?us-ascii?Q?9hIL2Zl3VdsQSdRYvZNIFOzDjY+yp53RPP5MjCVMHaghoBR4Uk0B15YUmj+F?=
 =?us-ascii?Q?1cUTa+gtPGTs/oYPxs5ecs+JFRb2JQRahryo30WNDpSFQHtem4Qb/CcdTVI4?=
 =?us-ascii?Q?5fzdTdWLM1WUEeEYETbKRgRr3knnKGGdVtQfS2fC7IKr2O1jLIOXsdO7v117?=
 =?us-ascii?Q?teNg0E1Z5WfoxOMjPOW315N25fU4BB4+hDqoTzB1IJPjpMeGVNTCAkHNsPDF?=
 =?us-ascii?Q?GyDHunmu033jPpPegk6ixkLLjtfZw1GqSKuftAtSbzgqYyZe9In2r5XRuj2W?=
 =?us-ascii?Q?iA6+g2aha7gcc6J5xNbERcgiMa1AImPiNn11DLaM0JjdTnZGgFqfm9fkhKaC?=
 =?us-ascii?Q?EAPS2xm4omjdw8Umb+VB6TOU9mE/77NfEPYlkGT0NMB7p7MKen1K4PrS71PH?=
 =?us-ascii?Q?QWGYquEEE3fu9M2fDKlvDskSP6wbRK3WjF9u8T5tch/9AOdctrQcr/UINZhl?=
 =?us-ascii?Q?CGyf8kMM3s6mXAaDyT/zTUnYVl+T4T+5eepm7oF+N89ZROZDW5T62rKfBKPu?=
 =?us-ascii?Q?ii6I7HcyhtLKskas7AND1IILC5+tK2NC6n2P5CdF/xEynrXBEBKS00Vrdbh/?=
 =?us-ascii?Q?zHbIwpLOUvj6tw1Lmv4Xj1/rXCwdMTxM/rw4tzMJL7AHKxnnIkXBomd5S2Wa?=
 =?us-ascii?Q?gtK2F3+lc8MAOhMs0kC5kOheBI7I5xHiGCtOkqMGyi9Qkn/WUaHP/w1+J9iK?=
 =?us-ascii?Q?Ek6UmHyaccFb8uYpXpHLswsZ7aaepr8Vq8X1yfFwgO2dQYIUIa2qZyOchabQ?=
 =?us-ascii?Q?5TFARbbSZYdwNorWat/4XO1jq9g33+y1vJA/LhG25FsrI5UfW5lesTNKwvYc?=
 =?us-ascii?Q?U+HbhGZJIx1BDoNHBXdAQP/mHeaUJxF01y46sAKcRuT/rj9Y4uQZjb/+UxLs?=
 =?us-ascii?Q?M1i+7KUn1TQ9JajC37yRM8JxC/WFu0zF/ciJFhCqOaz01s4TLHFYq3lg0VvM?=
 =?us-ascii?Q?olCnD81lX553s6ZYCHQHkksSdUREA2FeLlLPkngzmlMbtRh4d4OVHyo0150v?=
 =?us-ascii?Q?wY9gVsZtUrB3w8D71RxSZi82uNg6uMVz/kD3VT0YG9kp0NfuM98lTEKKdUzR?=
 =?us-ascii?Q?M9Q099CQOleYNOHTQQU/CbAJBTqbhMwzwzplIseshyhjSx8I3+5PGy9TGwkf?=
 =?us-ascii?Q?hJLOxdcjRxgzqELa80GcXtINYVE2VhgDtcQsMdV3VNG37yMJbs9jeAjZA5MM?=
 =?us-ascii?Q?uDyG0uBY7v/prmqw6XOgWRYTu6djlNCd8fXw1ySxDME2GOOrAD6Gn1AzSrty?=
 =?us-ascii?Q?zYECSjFbSgvhPcfslZB2DIotSxvAhGCfw92abfjLxlnLKenV3SdYPWQ4iK2N?=
 =?us-ascii?Q?9meif02U2R0HsB94br+6tpA/nMu27u8nwVZVUags/hyiI94VPU7nvcoq1PEi?=
 =?us-ascii?Q?PRl4zp/84PbssLgdUqIG2015hQFjp8PxVfDyNXI6sThHK8ewc6Tq1AJe9Gj3?=
 =?us-ascii?Q?n/BicbkfLPCjfCdQVgMSEVTbcE9htMe2cHtAtwtK3+8p8GFIeaNzkM4jErLO?=
 =?us-ascii?Q?HyVz5So2Zp7OMmmaqh+mAD688qFUXvsHI0+iA/j11fn3BYbjxMAg/1Wl2g/Y?=
 =?us-ascii?Q?k4ja4Fw8410puUDfHOsJv0PpIAf6Sk9g8vx5+3ImwjQYSvyU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb04b76-c93b-46b7-877f-08de69bb1a81
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 22:15:46.1072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4i7V194sDcLWRxi7Me3gyM5OuN9GtRW2uAqlfIWhkeTVUfL/e9/ORQslNd70bhvRjZRjZ3lu2rFrM/gupppwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8193

Add compatible string fsl,imx25-aips to fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
index 1f515bea39599..6130b048de7b1 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - fsl,imx25-aips
           - fsl,imx51-m4if
           - fsl,imx51-tigerp
           - fsl,imx51-aipstz
-- 
2.43.0

