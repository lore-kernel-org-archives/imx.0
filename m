Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCB73FC5B7
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290036; cv=fail; b=gqIG1UfZGwicChs7sbqhJfJFvrKPQyCXWLp5OZRCs4LInKWC7V5csmXQ21rlAy93zdarbR/XA4Ij6K925Dj6/ESBKKWHtk6jiT1rsC6PkSvHD0Ky6OEhSXf3RohEWI2MFdDn16oqQ8ynyD8+ICRw8PzChu+VFfgnC+ZzIpw8y60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290036; c=relaxed/simple;
	bh=7bldLNcRbUb7ZsyusEXPGXCTdgXpIxKAOzmjo8+R6Hg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PhallxH5p95wQ/UfvGRMVJzSa2oMXg2z2AGRfaXmonaBgHF33jTPwE4xADAmiTPvkO3+iIWiux+fhZ9pJu7i2d0f6F6JtroDx9GQSv0Gg/qZBagXz5dEpTNZ+eA33YaiGoE2FtCQGQyKsTncGju3hKSASD2ovipqSl2po6FQNA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gm0R5ax8; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gm0R5ax8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpQaSJBqhZU0Wm8vHH8SQ5EMP7t8D2/nEtzrCO/UWGsBOwRrXDD1HrXOa5NnQl+vI+PVMGTiIUpoEhhYUHzx6flrulgXHlCHuTLvo7rkLog9//koAc5nMTduPNyN72Z/p/Bnuec3MpsWd582dJQLxBXwIlgM1qfRVNuG/VaKJfYXnEEiG7yuv8kXXQAno8O2PMXZNBYiyYVUkoo7Xp9lGotLqobEtJlItHH9ZOADHHarEkvg4y0pS3cVOVYMvcwpplu8baSaJy6TciLn4BheZjgtdT/M3q54ucjy1eCC4hGZiGv1Ik2Q8HVii3i4yVO4BnSPslaVfq0zR+4F39KxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5jpvmAQ+TrUxcA8ZskIlDBh97VCdRXyeTsSd9MSlCg=;
 b=buQWYBvRUbvMpXMKZNjv5IybQBtrHLK0pN8Z94G+y4EJpyPTPUuL6ffxMCP9/CICCuwXRpEjUBvv7JCW3QfU7BDg86xiL8Kr1LdlyzLMX+SKwG2G+w+Pnq8M7vure9UbRjd25KI9LyqMTG8VGq0xpqjZfigwJ8rNy/scT/GDvYimK6HH12DRDpzCfN+He5+6sgug/jOg0uVmMu7kfO+1Er/0Svwjau7YFiX+3y87OoU/hCxwZUd8IAQ2XMVtdDUfbosV+2Sm+KyvSxutVOA8ZRlh8e/X/ZItNLR71GnH59bGmEb3gwqKxtrHSCzTu8FdEH0J9c7tuu8AdOkd6NzJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5jpvmAQ+TrUxcA8ZskIlDBh97VCdRXyeTsSd9MSlCg=;
 b=Gm0R5ax8C80P9QqcbTo1Puqit//ZFiycpcSINa33ulLx723PbCPPNslCWUAep5AtYnDf/ZBsGILfPFGI23bOAufrkBqn+MaWaNeGzeD8557WcV6gdsStIcoCgwO49b12QVNC+7INxlhQj0LW1QkCPG22UtrHpXI3kndF+PNieKlF/XY4uFX2Yticpp5e8i+veYAu9xLETI0lyZcjdUB6JTd6PLQhwXq+ZtvbB5jqA69ujHNfa4ujuAVZBMRQ55Rvo2O2j9/tPg2p6/ZN5s8r8CDL2dXmrDkcjfozXx7CP7JRLjlV/LBZGynDP1kiw1KUPknV47P5z00mua4rz4LoWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by GV2PR04MB11863.eurprd04.prod.outlook.com
 (2603:10a6:150:2f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 12:07:10 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:07:10 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 10/11] arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks
Date: Fri, 17 Jul 2026 15:06:34 +0300
Message-Id: <20260717120635.2118610-11-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::16) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|GV2PR04MB11863:EE_
X-MS-Office365-Filtering-Correlation-Id: bbad9de4-d95e-434f-0f94-08dee3fbee2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tW6Q3hdhE4dbQVohigwsbMx0meoTBj/hlde1yeweH4I5VaSInMVRXGOPIVKig3aX8nKRXirqiLbMzGgMxZPWNu6pdaob5Wusc6KxZVprFAIIZGnoCeyMNL3Uzo4QAPRN00xPXlHaWqo+uy7KPzm3FNJ2kVcYNe83zVCo/g9tBo5qtfSkbAb54nlkM4FpQcULRpXx6qG+zElf7l2OGcN/g9UU/MNdyvNo91eWt+yQun5yo06TX2yYxPzjGIYo+mBFG5Ukp7Lp+W/5Bto9dvPceSDTBII1QVX8mBMX1CK2dFZUsLzR5AcMzDzIaqxC83CAAewLXz6thfZa0LyJE1SR8LiBAsbc4AzgI54r8T5xicG/jwj/zWIzcVVfY6zfUk2aQAN/ea0J+6klw5sdiFIq+3QwCecSm8ouJS5tT6I2mzDUUokfmYsZk4bWTpDceeBjEkhft9ui9RKjZ4tlpzKmahdxlunH2sdX0LN2szulzj81XHlthdE42W5hC4z1XhJnnweAHslwqJ7BZfq+zWbNEK3xuyoQOal3oyAZpBc7Hm75mt85lnrC1LJEGVhy/SI0Kv+nRH4ahWazgeDTxl2TCln2yQP9+HW9Rs6ou4ZlHX+vw5t9q0OGV3/TBvM415s8tqRz68d4nXVQejeNOrGCVOQdIjeOAFq/nXT9EfGnqrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DyBmCHv43ubv3JuTkoUWE6VXEPhb2fjN7uT6NA8/IfKPTTtJ+RElr/4Qps9f?=
 =?us-ascii?Q?wqB4DItin04fNIf1yP2tjAL2tfPs4OgNCgV7/B52ePZf8Fn4Y+BWs2NsWaoV?=
 =?us-ascii?Q?SupANOpoNVTC4e+GQF8jrQTYr4CEUMc1q8cOlo6ojtg8hYJbnFLQ0PT38HYP?=
 =?us-ascii?Q?0w2Rg7h8QeMGsHPxicVc60Dxn0KOBNK4K14OgNMkggSnDDH+Sx2uLQ0FHUvB?=
 =?us-ascii?Q?EqQfO9ZtqnYMDQ3m8G9MGJncGWecq3fpeFJ1D69wpyxNuvBfjLHC0WYt3yJX?=
 =?us-ascii?Q?GWz2RqKa2QnbY/YKIvBAnAxKWsW9tu7vLO/73U0Q4s2SeBcnvTKLL5lplGRm?=
 =?us-ascii?Q?otQz3auwaeVxOfQPKSgzS1OuQ2RAnLnbaTCF2NXbu69qtM+eTghTwza8X1A9?=
 =?us-ascii?Q?gGi+61bjSjV1X7MFrXKEWyX/7jdwzjpdYI2pgGunKxYcPsiTtYm5p8nbvgth?=
 =?us-ascii?Q?tzg8bS7VXVU5L3mfHJnxFvwHZvD562mjcdjUWGKo9cS2fv8Ix9en+YTIMa3N?=
 =?us-ascii?Q?DB2E+PPCZvZkt3Aai2v9F22OR/ZJ88d3eJyB1xZdu7g7JUhYwZrfPgIa2i99?=
 =?us-ascii?Q?gec6HRWzbaP+41oHf9H20prsGFfRJkFYJhwVlAtaCzhHE0H1pB6OaDUjzsRS?=
 =?us-ascii?Q?hRkCufNQdByFqZm8aOgzm9Qy4NC7d015DxDIWu6t+UUUMI8l+yeUpynOhipX?=
 =?us-ascii?Q?KuZ1mRoBp6DIgokmG6TkTTGjEyR0uNAD32vVJ7T4TU5TCroxG+ZP5c5h4xgb?=
 =?us-ascii?Q?vUm9wHUOn/8tB+UWFnBDc3DILCjHtmcy6+vvatJ9sZkwZW2xnWRIvRCJft1g?=
 =?us-ascii?Q?lJUMKfScXwCR537jdRDdxB4jKxlRcDAKATvVi+qTsceBSl2PcytFcbV5RyHe?=
 =?us-ascii?Q?UBjtPk4PCKu7co33kR0fKqKu/bNnfwGpLUBhxSaCYC9kkiudV4kecnS3i9iW?=
 =?us-ascii?Q?RnlP6m7bQ+1k6g4rqB08eMT+VAEMiZeJEO/KcNm/Vbe9f9WV7aoXXnpjHF44?=
 =?us-ascii?Q?QcLAMznmJwbPRMsrdKqcoT2SqqBDHI8vzfwrKJ9A2MLlqC8VM2Z6cHXBYRXV?=
 =?us-ascii?Q?XxO/55t9J7+M/BY9ZInuaZk+lsWqf8q3nmsQFNllQrQTgD5EXeBVUhhXREOR?=
 =?us-ascii?Q?BONqhpC5Gkv+0+yLZPuLAvnrIDCAlW0ew3k4LMILq6ovPNJNXYMFzQq9et9Y?=
 =?us-ascii?Q?sSqk7v35tdhZASzqNZG4FzIFVI0kbihNHw3QtF7QAjcW82FZgjV/uU1BkvBM?=
 =?us-ascii?Q?5YHTcqHIpx5MCwNdXJrETa6gh4V/pCFLJH3Fm4ZJKz1abIPYX37RA5Q4Vv9J?=
 =?us-ascii?Q?9TnWH9R+dBacERe8sdYJSrUA+4aPBn64yN/oD9Hn3aIqKWnennEGk4KdP/dp?=
 =?us-ascii?Q?5stSMnDWzUtsrK9aNKD7K6GyTq8Q2gdqYdRKwxIBKuj//3+/E0D+AtCqtGE6?=
 =?us-ascii?Q?8CzCZvIJdIXOLCDiEauUIyyQuCcZI4uMQKni4vq/zgOivjKASe6Rg5EXtGhO?=
 =?us-ascii?Q?57ECplhBKOomGZfBo0a6Jl1Q+m7vCvyihIbIhuOFirSrUDbMcQVSI+EptKY0?=
 =?us-ascii?Q?DWbbwTz6I1atvglJocuVYZcIPVXDsQ+p/pwHNRdBM+3Z+uELR9OjnO/4ptl1?=
 =?us-ascii?Q?Yq2almXvUapRFwmYiO6Rt7/Su0ohl3iI+s2uVeg1cpr1oKTovfAArsqMBiNa?=
 =?us-ascii?Q?cTTrN1mJHvHpv2kFGdZnV37cgDG8oBCyd68YlCVa7H8e1WqybnUO4jK9mrpB?=
 =?us-ascii?Q?YnjkopOqZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbad9de4-d95e-434f-0f94-08dee3fbee2b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:07:10.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGZ1InGWdLl79CLWBQvpbrv7Zngzttb2dsqftzAscRJ38nT+WANCEUGIczHDZGQ65l4COpo6QyYAA9QRUhWhCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11863

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS208xA SoC. The nodes are left disabled at the SoC level; board
DTs will enable them once there are consumers.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- None

Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 6073e426774a..cc1a64e63ed5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -280,6 +280,104 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls2088a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls2088a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls2080a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.25.1

