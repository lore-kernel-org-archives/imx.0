Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B42D7DE4
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770356956; cv=fail; b=b5Jz5TNfGfriUN3R9k/YB4aYSK+7jPoNxXHy/4k+1MNsIny53SeUHKi4HC+pgwBsKH0XJAE8xAJ++0jALJrmfvRp0+8oojrJjjk2onF4mdbCZSXBAkY4CLYpw9molqMLWl3kXXA9WaN3hYT+3QSoww/21N05D1Cuifmp3fhyRmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770356956; c=relaxed/simple;
	bh=y6x4RswetNjGhgUdHpd2HygJz5FPLcO5ju8DWPGOX+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F0I9j/0vn4+uA+RYlIe2fodw9MNQ9oNTMPIFJLveYL5UdiRGDq3I4EHmwuDE6NMbXpJUxCDSS6XTKhfNu5FDNIuUURPnfaERRoBZNr+lfq4Gt6leKEtYCJu8+pUo8DX1TTWMLD5/Z3ES9IQ/+LLSojiNL2PFEKT4NtghIAUeAk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RHNqoKgh; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RHNqoKgh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl4V62cbBOtzb1iSVkO24EvlZA+6iuFVkfpXh53dpO9Eh0LDhuzd1iaq/GVMbPLRXnuBxW7In8FHKjxDetuhxlOGUdEZdROiF5R74UrY/NsDagHkuoX1Y1OVHinXcSunzVGTL2FHyQpgbYGyxJR8xjS2ST4QndwsJNOgSS5DJDAWBKE4MP49IPG+U94unJT//SpRVnISoj/F3R14M3rKTrQW4XtcbSqxbLzEWkUEGl17djsr3wk9Gq8U/rcB9pHihFYT8czDghvLa1x9OPTcslSTseogn1FCU196EyXhe/209pgNp3blMGUf8bLCBjuaAFDgtiFzW89gcLDHtU2KZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRGAUrUTVLzw9e6TEEU4mkYe/JQiEZYxAldZSisdKsE=;
 b=cxDfJnBcFPCAe/HlL6sg2pqt3WJce2DkLNZva48Rm+Wjzwd6DOiqgn5tQJexOMOg4Y4cheDaqQhdiaK//GrKrwcYMVSAXY93DNwrgjcX6WnkBR07VcpYgrmQXHWRwLACuheHIm+UTkuF+xscnDUANWVflQLCAAQWAs5jbykIF1AUs+LZmbZ1ATzuPd59Kmq2EdCWBpoPXddsRQpp4ZvDe57Nco3bhB8xls4wUZof91OENJAFyIktK1/8ziGL4hVcs6Bc2C212K3EjxBOROIydwxr594UFRGb1VKSoJ0Alhn0pJ3DOZL2GeOgncbU38nrYisRv6nbZCM1ZUtGKNrdUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRGAUrUTVLzw9e6TEEU4mkYe/JQiEZYxAldZSisdKsE=;
 b=RHNqoKghR55yWRQ0Hw5fKT7FXuCysTTz+A7yE/dNEnlsmUjEFOV94f8a8OYo3gvWYCaTxJfisn2+wsEUA58YabiCqRAHBwioJlD9GRnkm4oPGdesHRK7xP3jd0aJSRHlP4AsbyHxnqqkyffu3e095mlLNexfY/MQNy0+Tp1B4cHx03fbYlIUFtNSDdPgr9g3qXLQ+HhHGKJ7sjCl3AIPkMlV+QM2TyqyCv8FDxFDg5z2+ISNo9Pab6zB3F3b/NO5b/EKcZC9uadTAV1KGuLo+SLDAmTYoJywrIwys0jmshGr6EiiqzhWPx3DN9+z2yT34aAUHIU/IbLz8fie01BEGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:49:13 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:49:13 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 2/3] arm64: dts: imx943: add pcie1 and pcie1-ep supports
Date: Fri,  6 Feb 2026 13:50:06 +0800
Message-Id: <20260206055007.3995679-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
References: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb2360c-5e0d-40a2-4e33-08de6543752f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5cR4ZawQS4ZS8kfV/OalXADkXW//hXJaubdQdYvWOvMJ6N84DFytFJy7yrRj?=
 =?us-ascii?Q?w++4qY4OUjQYavyngnnSUoE36c4lY12K+w8qm4QXpWqDbPB+zF3QIgIYSaFI?=
 =?us-ascii?Q?vjrJ9J1nZTJFCoSXmnM7zg9A2HjUurtaeniWdkSztFNJZlVtbB3L/Rp02RRe?=
 =?us-ascii?Q?wPR/Z7c6MPZkbSWVTx44mNVUGZonMoAsQwZwFJqQDA4PW+fwpl3cKeollllP?=
 =?us-ascii?Q?i9cM2k3qB0cB+nC5q5Rqwgg7YXlsqYWezxZXExGydld4QjNnflx++SWpDbC/?=
 =?us-ascii?Q?h2atAlvqLbua9AspLoqa5v5egoIMfTGmsKhSk8fAlXu9j3laAk9OkbL6Wazl?=
 =?us-ascii?Q?xWy6q+/8renvDuwQUAfzIWmAOjP5deHi6zvkwJyRV9SO6QeOgHybu1QM53Tq?=
 =?us-ascii?Q?J7o6+ELiq/e+6NmwLNBIi5SqKxWauYvG251uvM22T+2lYqf5Em/wTH1IZC5j?=
 =?us-ascii?Q?ZJbRiX/cJLDI4HnSM1wfwcMYzCaede411YFHATOjPvcD644koIvCmJJ2u6y3?=
 =?us-ascii?Q?kE21oD2OwL9c+MEf7E5jDXqlP+aTIibIwd6/C6+N6st8w7cpo56XtIdPGWP4?=
 =?us-ascii?Q?9ohEMmsNOjBNyoHwEbeQ97WvjQIkATUfHL2dUmRwlqnaytJuaPc7Hnzs6m9M?=
 =?us-ascii?Q?Q3InEalPaHA6T8eMPrMrrhigom8Sbehs3dwmaN220H4VMgcr4XQrK4V1zoOb?=
 =?us-ascii?Q?zz2S3dzpA2a3OMIX4AqRpdEG5gNrQxb+wQkTSM8YfkFQpno16Iqu0GiDw+LC?=
 =?us-ascii?Q?E9LwuEtQ8KNEDNtIi1Gr7YjQ8Hvb/wZLRs7140A+uh1SJY7cOLpxAWSHN8WK?=
 =?us-ascii?Q?DaQsjl6V8Otv6X2kBLlmxes7a3wSrTby6aKn7LVXGgud2549Yf0voLHzSfnQ?=
 =?us-ascii?Q?q+ZrURGq4bz++mACe0Qa0cWhvD2M9ojbSv2acSZT1der+hLaahFA8ZPUy/U8?=
 =?us-ascii?Q?fmpwJoMTVuqEu8MIyyq1nQUec+rktoKFPSLj1BenhJJsQ5MIv5rbocaF2Edx?=
 =?us-ascii?Q?76Amb4uF0QFQGNQS65vwB48ffUcUcvYJ8IecdSXOBtLmZ2Ql5mSHmANFQxub?=
 =?us-ascii?Q?eITbPei0KsyD2yIlLrbWYG74D/UA9GYBzSUWInc0+nHoSA9X2nV8P9kdL+rO?=
 =?us-ascii?Q?+pEx7x3AwbjCazF+fLZo+iYLnyRwy9aU3nBTdI/MLuIEndZP9iZmOj+CnpY3?=
 =?us-ascii?Q?Fl3ww3YPHijEGpKq9Y2xegxAB2ImOvItH5Fg1IwvnEzgSC2K1s8jjmcE7MAm?=
 =?us-ascii?Q?f86dbBGlmCrj54KHIQ/1JQ3TTBal5Rfm/faRwN6nYovBkN1jtpt9aG9DTZ85?=
 =?us-ascii?Q?Qt/07p1GfKDT1I4wCSA0RQeeXUnWML2J9fw6eENMpRot+rVl3txppwhqFlSe?=
 =?us-ascii?Q?P7crG1Thor6rKK4gyh72MuuW6WjMDW+xjIjiVtuIaKR10fCQJy+u4KqNq/zu?=
 =?us-ascii?Q?AdLrZJ/YeHyZxkihmNGs6VPTPtfQyk9p5yrLF7Htgu9bgnt5n45ijoaoRbzQ?=
 =?us-ascii?Q?tmOMHc/9Xloe5IgZm3sa8G/D2obyujCYmD72U18zZ56Rgipy9pRDF05f2E0E?=
 =?us-ascii?Q?Jp3I1JWBhAaK70j8L6X5AES4sh421aTVtglR6o2GKRBbVXIpEDHC15EF8Agu?=
 =?us-ascii?Q?1USUPQbwRpGlyltSrT6/ZHA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tnEnJKHNQWTiK3HHFe/gbrM0H5DoehVzebOZeTdA3WbTKJ8GqHTj0VxLp3oF?=
 =?us-ascii?Q?BVjplyuqwP+w8jVEQrVhyHFO/S8gewCX7o9a95Ti+m+HfM4pVy7ba++LXgmA?=
 =?us-ascii?Q?QBz8qCgocnw694tH8KE5NptIkTJPUdIZyCrP1sJvjJZKW2Mfam8BsPFLyQb0?=
 =?us-ascii?Q?3bskmWqvzzaoQWtpl/bxHECs9Y+S2TTUc+7lyUfoNxvhQtFA8yUdsBsfZXOs?=
 =?us-ascii?Q?RsdvErm4le7WyqV1kJKx/Hgf2V37Ze8c+nT6tmLuvafPw4O8oQLlZGiKxuSH?=
 =?us-ascii?Q?L4WIDDrdgfZv1ntFbKiy+JT8RjrTWW2iydhjwdmEBg5SHu5y8oZ79Vvqighb?=
 =?us-ascii?Q?KD4YV9J4j/ds0PKdvZDRPJDbhId9kU9FAotKLF5yvcTmj4LatqaJjXZoXD/K?=
 =?us-ascii?Q?03XXKGsBfVBGvXK102zZDlUrzudgOw/iAfSt9nkRgDnIEDKvQPqoY64gYr8A?=
 =?us-ascii?Q?AmWDzvMhUX2+jRmUlfpMehUSig1Bz0MmxBIIiok6wVEJoJEKXCC4/1nZC/ga?=
 =?us-ascii?Q?15cyv/jSEkf71Qd+NbqiMkW0Elz/SZHHUg1/zFkMeBqNxNT5POBG3vCWPXQ6?=
 =?us-ascii?Q?q4kH1l7W+b+wbn3C2FmZDYAA40FOjh1dFjHlFfr2ZTd+Kthpb3NgAB9TYDGd?=
 =?us-ascii?Q?lJK1ZUuUVBjPGtZ9AJQqlpceuP81Lbica1np/MZOxC+2h3+WJmPvp2Sl/JMz?=
 =?us-ascii?Q?orD27L5CaBnKmeCXsHPqyNsp/NsB8VeBm9DDMbs3q7xnbas7ba53ttrY2FSZ?=
 =?us-ascii?Q?LOcCckQBODDlXH9Ts1G2EJiK9yl+uZePUHydz6X56+R7LXasqKCtb+Rh6y+K?=
 =?us-ascii?Q?DrigOvCagKBZoU82mKqIeRkUPGJyuDRpA5X98FsxxfCUu0fVi6anQtfZV60K?=
 =?us-ascii?Q?3Mm4qMLMGY1PZ9m7AhEAocTqzAjfs5P0S7uPcasJBrKvZWVljJp6KV+CglIx?=
 =?us-ascii?Q?7zS6x8u4+vIxjJ/ovvz8xFql4AqxuBKkXAGGsmRfsgs2SsYML6urRJ0vCrv8?=
 =?us-ascii?Q?iq1pT+lGXltInZRnC7gZTCN/bvluvaJT5MlngyQgGzhwrkPRBLj9VYbiLEjx?=
 =?us-ascii?Q?1JaQPj7oNjr0ouVv96hR7RFN0ykfrvqRl+XyjeO2IuZogwzzdzlR4cqeiB0H?=
 =?us-ascii?Q?SOhwOWgF3njjAeHT4DHJl36H3ZT+ox1+GDdkxUVKKFJ8+leoZOCUSK3l48At?=
 =?us-ascii?Q?VzYxiFim0HOJ38I4tH8CFruOV9PoXFE0bmuHlI7kGHJ+gYMupGmq3ADVdmef?=
 =?us-ascii?Q?E54fmsHOHNgXgLl7EAZi0HdndG5iRk/q/GHEy941vQnmoDnPS5Ewspz4ZGvm?=
 =?us-ascii?Q?CtFee6RKvEyPIIKWOnlrE9qyqpvJTgJTi0Giq9V5mmH3QFRZZtIpw2vtta35?=
 =?us-ascii?Q?bdLPCMCvVPqB80w58qCsxKX4eKzlUEDj/AYM+rDusPgrBFXwDSSZvz+8+M2Q?=
 =?us-ascii?Q?S9VHu3QHzgqczMzoYEztnu32euhrn/zZNRVl0MGJDq4kE31amryCsz7lYBTp?=
 =?us-ascii?Q?imSJIO1kDAZ6w8CPqgH0D5g16owCNlT1p/9k9bB23kGmHaWnZ41/X9oxwOZr?=
 =?us-ascii?Q?4eUkHVnQFhdBLLuuzTLZHzoZw4/azx57s/Hh3PnIhpP7SxZERcU8X7RIgWqG?=
 =?us-ascii?Q?Q4srkJviooPrY/nk5XvPEjRuCNnHQ8lRijHi4yCQ5tdW0vHy4hmV0i9OX2CL?=
 =?us-ascii?Q?ZPGx9U9tFiROAeLIAmu23kXa1nFtllujKmjUfelmJEfSHiG4U3OQaWNmJm4Q?=
 =?us-ascii?Q?8ealRdnUpw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb2360c-5e0d-40a2-4e33-08de6543752f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:49:13.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YHmiwiNnX5ScAoj2MZP1mU/6uAzBre5lFvOjDAWfv6qV4W2lnZ6lgdp8IZyUeJvxI3XXZY1p+LRsmF0dszAUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803

Add pcie1 and pcie1-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 76 +++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e877..0df9d24cf985d 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -145,4 +145,80 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	soc {
+		pcie1: pcie@4c380000 {
+			compatible = "fsl,imx95-pcie";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <8 0x80100000 0 0xfe00000>,
+			      <0 0x4c3e0000 0 0x10000>,
+			      <0 0x4c3c0000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
+				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			msi-map = <0x0 &its 0x98 0x1>,
+				  <0x100 &its 0x99 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "pme", "intr";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
+			status = "disabled";
+		};
+
+		pcie1_ep: pcie-ep@4c380000 {
+			compatible = "fsl,imx95-pcie-ep";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <0 0x4c3e0000 0 0x1000>,
+			      <0 0x4c3a0000 0 0x1000>,
+			      <0 0x4c3c0000 0 0x4000>,
+			      <0 0x4c3f0000 0 0x10000>,
+			      <0xa 0 1 0>;
+			reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x98 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.37.1

