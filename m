Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD24361DA8
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202439; cv=fail; b=ILR7ho2EtL9zvbqAM7R/KoFuTCvImDoEsnAGDSApGeyWfqezNm72YSFYXRl+j59lysg/p+PrP8bnIrqbThFvvKGorIhXCAWAmud54Obno5Wehsym2R9/GxHbbDHRlL+m/y4qY+tuP/ej98zih/hTSs9eBvU6V10gguGfwkILrkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202439; c=relaxed/simple;
	bh=jurSYSGnhfhdphEdIVn3+JJYGSZIlsTTrpd+T9dZPm4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BkmE++R07m3k3G2acuxveOm8zWF7H4cgiqOlG6klqHp+Rzm5VM1ZPQqDNEf9p7q+o64NztN6w4LKGjeEYjA3sPomlE2rjMAALWkFnC+QqVaJb4MVTI3Uwp/a9qCeIt7Kc94KtIs38AvL2R7/1XKZN6mF9vI3KOSFvOmUhT97Lco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AxwVtuVy; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AxwVtuVy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbAcNtwwBV+K351L0a7n2WqwD8OZZb9RjS5CqhtVZfHfj+Roe1GcStaIIop8yPEE8+W+XgP1axDSy5NgO50V2fVLktA9LgusXTRW3KNu7cltKUY6bddN7JDY4eY+R3o8CmvCJ1NtlEZHSlzUqLjSQXmg4O8jvzK1AsSI0BBD40Gjnb92Vov2hEnGJM/s+mzVNnMIg3c+5FSiBsYjnpVIHNJI7kVnpIhT1ijx74LxCPcLLA4DmBJFkZ5FQBtCQzc2k0POTADFrJCmtsB4y4aufnilCSMO3/YEFA9F7H6PfzieM/n38eqPCSLfnvWQk7p4h4+xkXNIQb3NVjN7Vr8+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y79Xba0DqXA6vXNhm2rspAKjsSdAAv2usfw0YtD2EdQ=;
 b=x9SDPzOqw3q2AjrEblhYMJVfOrJsIskCB2GP5DuYrnWvwmzA3CLoKIgJ5HLqchJDhxfpq5eBQp0SX7T5COLhhkzRVp2h979PE1FE2sszhq9Mxa9qNE9k7jIaPfjAlNPkhutwKrY+bIAxMzOX6SLOVe+7kA/TTvlAmLFjxokNj/Zql/JMsDk5qGHb/W1GX7Mc5dqEggddX84SoMHwCQmNnoGHCee79ZTQhaWFWjWm+JW1aMfPAwG27aDtXs8+tRZ7Zs9H71Ln5I+GcOO9btOycRWlGip5RjK1NE/ExF4u4OShNAlIXAoKdWAa5eeRi0PfwDc9e2SEbHD+842Na/kbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y79Xba0DqXA6vXNhm2rspAKjsSdAAv2usfw0YtD2EdQ=;
 b=AxwVtuVycXlKBQ1veS+EFiHPZK8kNbMG19KyBaKdiQbgZFg+rPqd0il9nGhlXwyOrywZc1D0prQQ8KD7l+T3YHvBNenHdcm51jd4/q0+LnqPGgxbN2Wbhg7hQWrf7/XDY9m2A8OZLca0vsmZyqErRZ1HX2//OQczwzbQJ4B+mt92waAgnSI4qAoMLfqhIY91BjWkrBvsXz0HjPVUoMtSgN+Ee7GfxNANODhbAUI0rcros0ewXcTKXKmoO/lnQOAbvU98I2CjsbbyGqEUYrecGEzTmJylZRs2kyjdRexlSb+1kFEhAxcVK6nxrxPO7tGs1Llg86LxVbUq2HevsT9L9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 07:47:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 07:47:12 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	miquel.raynal@bootlin.com
Subject: [PATCH 1/2] ARM: dts: imx35: remove empty clock-names for nand-controller@bb000000
Date: Fri,  3 Apr 2026 03:46:30 -0400
Message-ID: <20260403074634.774234-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0050.namprd04.prod.outlook.com
 (2603:10b6:806:120::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dae9a3-43bc-4f00-392a-08de91553780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|366016|7416014|1800799024|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rcT+GtvqPKoXhgmB2swJmbD+DVTuqA6kjz7FGnOXiCBaDAihYs2SgVufrFdTbdH7Kt+nhf+X9f7+ElNnUHR2Iit1vhFG4+kKR754JPMDNUJIUOePdGQNwK5NREbj0/EfG956zm/IHAup+fx0gRRFCiZmoO2HIG/e9mfobG3qrjA6OQr+ySAkp1LzjMyJDyyb9031jZiTOkdgmzlkVlyfsXDIfcFrBfQ/nCilwSn636x/PA6IZjVkR0qpdojBuKdb6g6Ajeuvy/l2IUTXa85FOzLLEsl4oTdE7xCQ3vqERpEu85xTDI+Yd7KGNXBx7NrSijPziHB2eBxMyCZtQQlc4aT0O4w7kjHLBJh9FZCQiquC0XAScXcxvriVVwbj5DSToWgO1be7PX1mgZ1+3nspAoX61LJT8GM1JQB52oubJPkS4o9ZLSX3ZGB3fvM4oSqQQ/wJyuoQdfRY1IvFo7v8Js0Kf6FRTrrhWCHVArIiqV3RYSWAKjzmAhWNAJH9y684fvB510X/CZ5+e0+BFogM2T2Gb285UibfnS9vaFhJLC9xBxD4Szl3pB5KE97qAqnc+LqxT1ylp09yKRDthaUVjYwehDe3z44Ex0DWxQm3R3l2CNRmTz6D/8KCNHXJRSv+7UVKLHmCtNfR0TM0dAOm4TpCfHE1LpJ1qzOGMrDDgis+S3DaMTvJsvjLL/+ODnS+Xv578JP7p38IaIDsV/q+S7VYMy+cDeINqMB3QO0ILKhLaYwuigCBPpgxwgZ92yquL9lOYgzQU6c2E8kM/Ne40A4mJGmA3DgWAQYycDKkPc1l+4G6WPCPT+5PlqkHLCk8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(7416014)(1800799024)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OQGMBzhrboDm44uLt6nNT1tTUvJs9mYgTynRNa3y8inzSo5U1pK2jOBiDYdM?=
 =?us-ascii?Q?2MghsMh9g/sFsskVUl3pF8YpwCgTKQoLPiBMwhBekKJXVJX7USGaeghJint7?=
 =?us-ascii?Q?DB2rXc9v0BRSeilKYQZQQM2JVCCJx9xH8XqQSzlFuR4NNgLPus5Tc73XXnXZ?=
 =?us-ascii?Q?Ntjtm3Nnp8HAwoelf6RXX7poJXVrrcLqBz4aHaaN1e3vSqVMZ4x0HGU84e1o?=
 =?us-ascii?Q?iN6Ff6rZz13+1PawJYNIRmcQ8O4MOoL5ZP9PPUlSRRaPixisyDMn5yX7ekz2?=
 =?us-ascii?Q?eNhiuvpaKJgfL2ABXpmwhB53yaBhlT6PzkgGO2fAcE1hKSJHgKYVu6uSAKBU?=
 =?us-ascii?Q?ZphrFI8uMiDB81HgUhn+59iPQ2Wn37EGV8dMCMZZne9hvw2iTIE4RdIXaMMS?=
 =?us-ascii?Q?NpN7DeyTCaNsJyVsZqrpbJCnCQf9ez8lkCWrluRD8eDGwHXFUZsi1CBmYOeK?=
 =?us-ascii?Q?4EuqHI/BsHLw+PD49s71xQwH02ZULyugdJAdndKpLBjghyah/3tmIfTn1wGf?=
 =?us-ascii?Q?gyMJWAObnMMouLIok+eN7xFHyOLouduX1/PVFopJoDrXL/gRGSzIjJW62P0J?=
 =?us-ascii?Q?p0rbacItiNonztPOsKz5oUlT1vgVaYUEZF8bLU8xqDLeFabWP7euvBwsXov2?=
 =?us-ascii?Q?4r/VkLbopIOFQw81jOP7CBJh+rtsOhlt/v/0/UdpiwUmURN8ojnpcGErpT2Y?=
 =?us-ascii?Q?I7iCkfBp0yWSXbgQ5pR6GUBkSQB4PXMEjwSFyJuuQg2x9SlBIFONms3LAqZp?=
 =?us-ascii?Q?/PwkBbVl+a9higEkusDqZ2eEMH3QZm/0zEdQjbyfNxu97Pa43csc4X+J8Pbw?=
 =?us-ascii?Q?puTLFNoKTyiLpE76s3QqUPvAQJlYMQaghlCFZYYPyei+0AwyYdFn+u1GRDIj?=
 =?us-ascii?Q?7sTbdOkfhluA/wzon4PrU7FVBeQLon5UoEvS3WtM90GC+JCIWDLNvY4nFNcT?=
 =?us-ascii?Q?K07+lzTP09Wsv0rtlUK2cWBF2Rz8CcrkKuiIBTXNERi1MhwwQCcbLt84jj3v?=
 =?us-ascii?Q?ZBlaGw0uI+s7h0QFqsDyZft7WqiXBiKepaRDld/axQCnpLFRDhlDDtKNrSBL?=
 =?us-ascii?Q?0djVQt0P5o3t6ye+zKGn1DUmgpbpHJwDjc4zj4C5lpSLzrxeBNURX0nvH4rZ?=
 =?us-ascii?Q?lHnO4+t5yHM997OL8ea5ybmA9iOaUgVxJS4+7enq3/c1abmG8dsfnYQoEQKP?=
 =?us-ascii?Q?ub4k3WHmms2rZaJBwq5hdr5up5zBYp9F+7G83OLjiUFUE/OevaH52yJcGAQJ?=
 =?us-ascii?Q?xe8uaG3TjVxqXI/mNsCFM43shIiRISiu42hX/Ii6CBUjjB+bnysJsHI85PA8?=
 =?us-ascii?Q?d3TGMiqhu2cgOw0QvBiYW4wVS6uhnW44KESQjNFP7CDBMBG8ZB+giPv61Zy8?=
 =?us-ascii?Q?B16e13nxIzn0kTd7gi5JSVNsnV693J7e4HLq5LOE4C7NuG4FqcBLXgptTKY7?=
 =?us-ascii?Q?69qpVZgU3ZQL92hOy9Yd43VvrShclhdaFNGX5htzMoxICOCW5XwBAi7jH5UT?=
 =?us-ascii?Q?tau8IhWZYWYNM/0/BgGB15dzw0TZ7N/P9n8s7xF+XnWjwkgAS+pwj+uS3Ceg?=
 =?us-ascii?Q?kLLM85a9K9pAVUcnq1ucEf+C0Bi878adUTeouve37MQA6EuDAqzIh51ZEUuI?=
 =?us-ascii?Q?SmM4258UvDU2V+I4qdtsZZvi7/zlR6H/QbAvtfFJ4kIYRDrUkpwkvPq8fRb9?=
 =?us-ascii?Q?f4OiRdWabVeSmkd12ghLnpsPIoawuT9nkfS0ArXeUkKVuO5F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dae9a3-43bc-4f00-392a-08de91553780
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 07:47:12.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrShL0pXXiG/qi1JqfESx1Xk2tAMQ3iUNlFjLS3l35zLhA1o9yyZgzR04di86Upa4orRhDISViOqdxG7DvaYTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888

clock-names is empty in nand-controller@bb000000, which is wrong.

Remove it to fix below CHECK_DTBS warings:
  arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx35.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index ab7b646399894..314c4f4845288 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -369,7 +369,6 @@ nfc: nand-controller@bb000000 {
 				compatible = "fsl,imx35-nand", "fsl,imx25-nand";
 				reg = <0xbb000000 0x2000>;
 				clocks = <&clks 29>;
-				clock-names = "";
 				interrupts = <33>;
 				status = "disabled";
 			};
-- 
2.43.0

