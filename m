Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360434A341B
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911519; cv=fail; b=CEEshOCNGU0EFIg3bBMz5SRjLCDeUlLIagKslRXPGExvOZBp9rLLMJq9qrCFnKtSwoLodU36MqUUkFt8pOz+AzEVwj2BGsF5aKslKk0qPj9DkjqBfTjtTj9FTyncA2MHXZtn3rZsJ4Xny9WyNkZA03D4LUYK8HXGnavv+XNkI9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911519; c=relaxed/simple;
	bh=9hoTnOlRDL7V3FeCGdbHldkx+6FNO1VcaRe8pXGEGnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Px2XqjrU1WJNL1oSTKczaf/9wsY61givZnKeq+/US9FX9mwuZ+KHgQXApt9/T4zGLhqAC2JB7B+RW8CgRcZvHlrvNjTyz7y2b4g3pwz17aAnVMIlP3vVa0Bj8bbwO9H39HAZErR2LUD4znxfsvnrGMB/QtMYYIEALUBsJekAVYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G4FDXUKX; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G4FDXUKX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es88qCoWfMQedP6vRQGI+NB3gn7YcBF2EcMTyxrRvnKWJiTOACq+/a15ArHeXCXIwZW7Vw/nYAeuJMLVL/Rn3E2bvb0tov03xMZkSM/PKcJzqbBOvPpUEymi2BsLXf8O6sVQFl3hVL8E9EsScxNCE7WpBcqBlZ/C+97XcCslUkeLpzdUC9hPQwXBdtHGh3tGOD79rvjaC8hyaiAx8c3bKhb0OsFUUH7tLRjmWBZSU6eBOQoZuMB9RiBdHquBamviq6CuX/w7EtkyXEPiRFrgAuvp1V3PQ7FCSoymo8W3SEJORNZZhlmwBmkHYm9IPcd3BgzLiDTFQio00rRonlvLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7ShsEg/HwDPIWbOOQkmyl//eqi4gSSSKJj3rCnsZYk=;
 b=iYUoiNFPcEQxjT6R2PVDzvSmWKxy4VMx82J2jjva63U7o5FAQEhaESrHBoHMSL4So2bp/ngWP+KlrqFTXFnhVHCwYe2jpTfG5Ch6/H+nO3Bhkt8Jp9y5pl63VCrquD+IDgXaPihbc12GfeSQD8MfRcNkFRdykkta9CR9NSidZoz72hr7PXOEk3WSRKdzjKAVhiX1rYWENWGO2SEdXR8ImU12w7wox1PV6BPIjzlfgrl5IkSBDNp6+yUIAR2bRvOloZZkWrPhyBubIsg+aWRxUJ02CvfNSqltFiyi3erj+ylqaXGs4ynBbNPQwfI0Re/YD2mV13EwEmPfORrYHgxl0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7ShsEg/HwDPIWbOOQkmyl//eqi4gSSSKJj3rCnsZYk=;
 b=G4FDXUKXomK1cQ3bIJEgK/1JI7PGn31j8tJ6Nzojb9TNOCpdMzfwVNuyS9kh1dUG0L1OXaq4EE8V18ZHJhaCiYZNJO7GIZPCWj99+vn3c3KeqricihxN6kgRuUIIuC4nh+NoLB61GjjYZXuf7r31S/XoIRvF357rec+KMTz2+mN2NbruFSfwLZ4d7iIGSxLcb3eEYrCRJPl+4g9mptnAT2gJ1gGqAuwR3SPQyj3tA+tS+KHw7+ISJXKQyEv9oyP1SCPt4cEeJvgzCOzZ9gsQ2YiNxlkVcXHRm9qypWDa6Ou7s8hgmiBZ5ErIxfqbNffN8JKVq+yXoFFsfKUeh80m3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AS5PR04MB10059.eurprd04.prod.outlook.com
 (2603:10a6:20b:680::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:11:49 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:49 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/5] arm64: dts: ls1028a: describe the Lynx 10G SerDes
Date: Wed,  1 Jul 2026 16:11:34 +0300
Message-Id: <20260701131137.940145-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::27) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AS5PR04MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: b347d808-8dd4-40c1-219b-08ded7724f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0r3QlPAo2E2wAhq+9y0eOhAO3dfLHxNq/MEMObO94vq3zqvQ+UCMbyBdHxxfCZNmHBUt69vCx8KeHmyaT7WPKWTg/0BgcTCXY1delaTEEfutXzAXIg0UoXHYdlGR/oQuTF/gaEja3zyvg7ccog/q0RAFo9f6wzq2YJ1lQKHVSYQcI2843ppsFBkwOOyHm9o0zvisngIGWLxeexpIW5LUsbLH+a5vXkJZzyxLBMjLylPeM/fB5ZcM9e5GtF+88YM8bowxzRgM/qivyyFMs+CQF/gvTEy97nlAQiTxCFMW+HxbxY2a+vhTGLn0q+QVRp/DhkkIQTEtzvh0Vm9LOk9DHD4oVaxzCiSxNqfywGoQCZG++UXTiu261zJ7gHbRwCdbp74iJXxiVTqfTBNfinkPsP/wqFK6MdkV6bGWnWXamrdlNqUUxbEE4PvsxcYvGIfiBHCjdUNIJ6yfLEE5VI3+WYphybK7GCF1UQpO3MgOtU6GFqYEfuNeJNCLmw8NhLFHD8DVBNNnQgsyE9vqQXKlf6XqxoiTzwAv5bmFQs0dm/x6lhv7nQPnaJQ8tHb59ZjmWGaBSiEvGIz4FZ0IasDP8W1/CzqOQh+C6QR2Yt4zfMMULOZkBkQg7bMemmU3xPLSNNPxqWYkIkF/32Lo4/1NXBlOmDRJVHZdHD6K6ZoCSTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VkDXOouMDvlxI7XDkotEIuUs1A+OB2zD/gEDBum/Yhe4CWc6rCmmbn+0HvsE?=
 =?us-ascii?Q?L1xt/6TU5jQ99P+syf4sEPbYqvJv6gNGMHNYI6aL0Prg0oNpl73j1rnENWU+?=
 =?us-ascii?Q?AeZCB9bIZjuW8cvP+fILTlidn7w1eB6sy+fR+I9xdFES/nJTE2Gu1m8NG1tu?=
 =?us-ascii?Q?e4yP18TCEr/lN3nvCjU7PFN92dFFaiEfED/AQouUrNzcNYrBGGcBh9aMVj7P?=
 =?us-ascii?Q?Cf+ZcRgPFBKpnFpkKDzob+GgcRvzqU8mABthfDLR8PFwYZwSAQqXTAx0JGP1?=
 =?us-ascii?Q?5kTIjQbrNGMVTayFZ1YnpKrpnWj1c6JxBEpvherrka5ZjVuEzDSp3a1IUcTn?=
 =?us-ascii?Q?/A39DyxVbL7E1FNADkOGo1bmjVjsTaW7Ic8NPg4SZsYM+hFZNELRYYc+vfBk?=
 =?us-ascii?Q?ucFXdKG/a/nAHBGLDfzdFJNUjKYcsiu0+rXRO+n6DbRVAvE6e7MH2gBaSzIj?=
 =?us-ascii?Q?UCOVc4n3mZDl7bEbBpbJZl7VIiTpYFpoJu31L0y2KYHAbuC2w+jwCWBKLaRo?=
 =?us-ascii?Q?itqFRqv24g132KRxASV0kdcfdBzrNlDpSEkteQNDxbQN+1m1dQ/ElOoeVyoe?=
 =?us-ascii?Q?ouxq2c9n71ueuppmukO4kFNyxax2y/Zm0ItL5PUtGyhjR7/Gc3yYiEhgGQvO?=
 =?us-ascii?Q?BploHGjV78wyUWle0/HAKkm2jO6aidJnax6kXGnzeg2bkrcS8m3AiaBG5e9D?=
 =?us-ascii?Q?iAuS4zHCliORZ7R9tClUIyJ1JbVW3y99ZW7n/CP2v37gREdQ9N3/gsQyMn+4?=
 =?us-ascii?Q?j2hZNvKUHqbYtGLe5XO5uiTIQoR/7npv46Z3eUdNyzFqOmNRQ1w7v2Vj/9Hs?=
 =?us-ascii?Q?g1jd1ypFdNt8Ki1XG+jzIe1rgRg7VoTeH66hIPp/gglern2SYsy5aQScqVNC?=
 =?us-ascii?Q?Ar7ofriK+Cxp2H1Q9or7ggF7QFw3xBsYuyq/RKRGznNRBpy3+aJHTFjVKTpp?=
 =?us-ascii?Q?V/BbuPVlkQ+9fmyVQtjOfHOjlYsnL+zdHUoV+7hzqN8o0R1Az/jcaNetSs9m?=
 =?us-ascii?Q?yZrLlC7wlXnceOUcfidI5kQrc8e/mJJb//IGVVbHxbJpCz1L+Z0VHRbuzNao?=
 =?us-ascii?Q?MtBtmeiV5j7GGnrQedaqzphJN0YLXDnmr4zCN0tl9qDwftP+hcQJUSUXd6cb?=
 =?us-ascii?Q?8uYnU7RDEUmXe0Af8qNaAhK4qkd+nvR/UDAENzkSGxjBPaTPxILqF3hoTXA0?=
 =?us-ascii?Q?8SrMG3OIIjzM1TZkBSl1pXdq9jWJVhiL9n9IhO3Pduz/fIAWFKtwdIyOTA5R?=
 =?us-ascii?Q?8JeW8tGIquUfNB/cVqxWFU5fNspZqc1+19dA3+YPsq6ZJxAj08A+r/k98yxZ?=
 =?us-ascii?Q?LPae6Z63VWIcohAYJCCGEEjKAD2gjBlaKPuHtY2CPIL7z9WxoeFWyU3oXpAG?=
 =?us-ascii?Q?rPcCaxKQtksFfOOREEjaT/ayBi8msMLbIcaXdKV9iQVyuEct16d1PUr+VdbP?=
 =?us-ascii?Q?Yvdqhtm7iFTAJzBBbbrQZC1CIiAV0E6JsJLq1uTF/B2W9DZnS7AN5eXzOGdM?=
 =?us-ascii?Q?oqWALmkxVIP6rLXTlRdXzDUmrFFoDDOyt0nxkBwwVWO7tI/4dsNU9wNNFeWO?=
 =?us-ascii?Q?BxSifuh2sNb/6m5IC5UPxOhXAbDKN41d/y1QMBW/ocDccXg/zTGspWMxuRY7?=
 =?us-ascii?Q?VXK7qHRP6eqnVUXXZyOJskYMx3TJyb9TWC5U0g9+Oc7+QUoUgTN0gSEsgmHE?=
 =?us-ascii?Q?3IbVjybeusGVOfbUznvwaA0XgGgfGIf0AWxir/A4UKpLNM+RLRxGGqbgVG6w?=
 =?us-ascii?Q?0PPYoZX+4Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b347d808-8dd4-40c1-219b-08ded7724f83
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:49.4292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pqyr1QaM+F3XN2cDqY2FTMAiF38qGhTIL2uFVsOwlvqBISLwfFysSlbup19CPJFOFRjDCl7CTI3LZJ5sT35NSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the Lynx 10G SerDes block and its 4 SerDes lanes found on the
LS1028A SoC. The node is left disabled at the SoC level; board DTs will
be expected to enable it once the consumer Ethernet nodes use it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index f4ba3d16ab86..ef62968590fa 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -250,6 +250,35 @@ ls1028a_uid: unique-id@1c {
 			};
 		};
 
+		serdes: phy@1ea0000 {
+			compatible = "fsl,ls1028a-serdes";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		scfg: syscon@1fc0000 {
 			compatible = "fsl,ls1028a-scfg", "syscon";
 			reg = <0x0 0x1fc0000 0x0 0x10000>;
-- 
2.25.1

