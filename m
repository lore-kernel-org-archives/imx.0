Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013027.outbound.protection.outlook.com [52.101.83.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5356D35B133
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 21:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763155857; cv=fail; b=NTsBC8zsYTWe6O6/07voDOmsAHe24f06YkMPfrwP/hJNu2Fu/0Vdpy3ICRzfS2k4ng92ib7vPQ+SmddAeLw+snTDVxgB9FfeMH9XumFcDbvGJcBDSX/JA0p9tg3Fh5I/EkdqF668RwUkzyxIX5CNwxxCiLdg44wp2zYNw+/ykPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763155857; c=relaxed/simple;
	bh=TsTxhy7FXcDKRznA+Yh8nE8IG6kWzFDZPd3aTZgGpoc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WDqOAEk0yV+FVB2u/XmAQEC7Dyoqnaysq6g5keFwQFfsBkV/8K5YoFR7g6hZrU2jGxrGBHHCbqn9HtdA35SpKFRyccQJaLV3wdtPmuHMmc+hs4c2Q3uynGXjt5VapJ04voB9I87aY3gSjBuM62VwnHfvMlBd8ds6rafPdhjgCiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IqUEwdTK; arc=fail smtp.client-ip=52.101.83.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IqUEwdTK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhGnvQsByKKR7alunpMD3ajPJeu7muJ/8Z2K1kqPv1fG9JqPERnjC1DBmqtL8LGonJYsb0Lp02jASGRgI9PQ7899XABdZct5Hm7ttPtWL9R7iBSu4jjbVkH5ZiKVqoadESaRpnFMo8zx754xQmeiT14sVoQX1cL2q1IvCgjWFTkjNsR73rs0Ry8se/RxX+We6MxJgR6ijblPZAF2H57lyKUihRuub4xI2NL3Q+T+sZsyL5RxMSpm9gUZMtz0eFf8h1H7nWv+8nHA56tNMLL63dLRzjA++AcVaTuUQV3cQ92yS6mpj39zLiBCn5CdlbsEckJ2xPBIFrK4n03lVRWsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qae19mpWBSsTmbfN0/rO3KZ+SJzyXe47EkM6nAV+1M=;
 b=kEksgfz0+XVPLpACMw4XODhgDXoiDiRjSy+hXAUMk8etplqmnNmG101XAE47BC8EeIydUGM8ek9qi8h/5tEBghz39k8iWvbzX3q/+qjN0RwPAT3wBELQ5DUMCTAXEmcoaefI3XzaTHmgQvLPU1yMjRIRCX+LB/EKN2WT3MCdxSrvORog/3ctPTj1h9dAtxMIo+V8MS2haYZpL9RYlxYj1y+NgwPsEhREoSg+Tvkw9qEU7jc9RutwrqHO4jnhgKdX2671wKN3SRpTsbTqsq7oH7ks/MR/STEKi2veJE3onJ3gM7qxoJLpPF5XBOOGuVROwdDvDqUOZOQ+tgykK7krhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qae19mpWBSsTmbfN0/rO3KZ+SJzyXe47EkM6nAV+1M=;
 b=IqUEwdTK5iHdave8rpmVzR7XJGEPcMIVhVnAB2WBqf0j7Pf86YGy/DslfLLXKOwEL51/Yj1SFidSjO51CHa2JEdZPWlLaLiu3G8ppe89gudQeyCbKYpe4yAV4GdA13hV41BmO4ZzfLI4CZjeC5MmpweNdhP2G0azIy8YHBTNQ+5cnPxBlNB5R4jxwHOxwwFSclAeH7zo27q86hTP/UYhAVoA0ydGJr6QTdxKsZ09na4+7ybgEJSze64PkYUnm5pSKSc8TAShGhvzNjsB+v0iTg+tO2jconUd1zselF1B2nBy80GG9bmCSy5sqNrPsB9H+ZqeWsTBlSmxjEuJefme+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU2PR04MB8776.eurprd04.prod.outlook.com (2603:10a6:10:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 21:30:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 21:30:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: mfd: Convert dlg,da9052-i2c.txt to yaml format
Date: Fri, 14 Nov 2025 16:30:36 -0500
Message-Id: <20251114213037.1211907-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0009.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::8) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU2PR04MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eaccafd-e15a-4dc6-59a3-08de23c51595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ms6RRt00CsBEHW6olrkpONBgJTHyrZwtWB9jgQK9+x+A9PuSJyeuJMe4DBLZ?=
 =?us-ascii?Q?mszfW/jOML/36++/oFh0ljNbLfcnlyRgWaUh5i0USj5thA18QrRjgmedkrWJ?=
 =?us-ascii?Q?WSdLfq76uViiWb7o6waS+wYp94HZmUrgYUPkYp8Ta/JdOEOVBCVi0Ol4MjHn?=
 =?us-ascii?Q?nKXvBDTfyMj34E8QqDiTcv+/2B/JJrw3XjVvFwFY85G6Th5O2Y0lEZBAsznh?=
 =?us-ascii?Q?A3wuzURKxasuM6UShQ5AjrgMK100mE83enLn/M3n4ZaCIiOg+Z54m4TtH31r?=
 =?us-ascii?Q?hzY+5UBGG4qne1aL4G5eGegLeApK69Tji6+BlhpPC9AFRMhzNP1TPjULOp4T?=
 =?us-ascii?Q?/TjrDnKQBJp4tt+qGGI34thvtBtDwd4MWVQs1GVKpSG5adJ+BInGPt3hHX3d?=
 =?us-ascii?Q?ip4qcafkVYcPqfbXbvNtV5zLrlou5pQ7kJWI1iW8qOnWzGs+nuObskbPiTLR?=
 =?us-ascii?Q?7B2hLky/YF34RIudYQbin5XVgprB/+diCUJk9j40DC+qMCkdLx4n456arxVA?=
 =?us-ascii?Q?wielcuZPGDkzWz9S+0ebT9UbOYRhgHKM2yFP9TajCkLNiRmE/OIZ33NcZmML?=
 =?us-ascii?Q?pmX/zp+szvMBf57GEY6nOnV+c70T3QxMa6rFBfmeWQfuBsOARf8oOHOQMLzJ?=
 =?us-ascii?Q?LQACVZ9VRXyBjVqYLFN0iTA81m23eiHUbdUjnCjQf/0Cv1KHyDf2q+NMToHh?=
 =?us-ascii?Q?AhaM9aMmsnOw0F+D7H3ItZ2CDW+N5cEh5HxguMaWGqWHn/ifyWWcvZw5YBPT?=
 =?us-ascii?Q?j77bkI79VDrrbtN0XtNmy63Sx7lGidiB/taixE6ffqB3mvLQWSb/yg6X5nVm?=
 =?us-ascii?Q?8xHzeOSZ+ZCjLeBFjywTfqlyTBGAkvgOv441taAA7kkh4FPiVrfzNZVB0vmS?=
 =?us-ascii?Q?OI5lDKt//ZN0c/zpUIX/QjNyiPyDXyvVipklpJLC+njtJTaewHbrw4IGlKmZ?=
 =?us-ascii?Q?r94ZSozi+wmMb1i1I4Wx8DivMDxfgiI3Qe47EWWWmRlf4VKOBKgqJFD9P9r3?=
 =?us-ascii?Q?fuATg6TP1Qbn/EZriFSo1LOpnyI82noeHVx18fwxrpqH77+WwJBtL7+EtMcx?=
 =?us-ascii?Q?zkm1x+B0pJKGnQnqlvuQUV2ugGkmlEzA1WbEpANcAKdfDGcLL6MbVzM2lMqd?=
 =?us-ascii?Q?zrHUrOSmtgC6gp47NaoG4oh7VME/X+FIjvwM1BVIisJZGIGpnuqqUeHz9+Es?=
 =?us-ascii?Q?GjtfSXGK+1LITPSmxfkpPbgiPwuuPyrxFvN7wv2LtmWQfrHt0Hr8T+XyOh4U?=
 =?us-ascii?Q?TnrMHiaCkaJOdjNkgzmgVL4yepZ2YUYsCw/JkOHkX9Jp/spFvTX4yVwvoaYT?=
 =?us-ascii?Q?iJUeO7lwyQysBxdMxo/Pc+lCAZyQwQplE1Y2utvE45AEdfyaVfkqwU4WtH78?=
 =?us-ascii?Q?LIemNM/rOY5NtcDOk8hrRB9xQSPWSLWOlRcOM0N34YghK6f3oiUjyapu2DTV?=
 =?us-ascii?Q?5wYLg9KMXcyLZim3KIeG3Zn1irR2CUr1fUtP7MPSQ3A24eAsqvBXjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JfUFKG4jz5pAWUqPSHnYeEMED3s67FXdbeCSSKj0+Z/9SRiX4wCCNIo6reqQ?=
 =?us-ascii?Q?GhujATkaCyCBJTvVmHbOTHD1NqUW95I9nDjIWShv7on4uZgumdq86FZkeJMZ?=
 =?us-ascii?Q?4fzwfnBPeX3DOAHZqF/Omu0gnD+VvBvc0O5ZwNlkunVcz2UtD5lPNVCvwK4q?=
 =?us-ascii?Q?Bz4vNSqidkw8k5qimsB23IpCopPD1EkbbtKEfSbUgUKEnjyXdq6wPERz/oee?=
 =?us-ascii?Q?+I02J5YcXYuMf4Gu1dl9Vk7Zv75e0Qs87JQjK7RUkl5x5JMkXWqyV1MSeBoJ?=
 =?us-ascii?Q?Ml97x6BG+U/4EcZsC/V9ItrViJOlPSDTKgpxC9DmWfyWyyE6UpqRxycYaVm1?=
 =?us-ascii?Q?LZhLQzkXr1gBSr6uN6bYlkgmq61pb4M8Opib61bLKESznz5xjuLvWH8XDo7w?=
 =?us-ascii?Q?hs49qlPB9VL1xnx1ezTnFcIZsV6XCgTc+vLCHGipLHJcO2o4Q6+6F5fUVOjO?=
 =?us-ascii?Q?1lpzzJQhmfPDInZq0o1HQAiPLb1zyJdR6hLfvy48ACyG5oD0i3B7Pl58HvEf?=
 =?us-ascii?Q?30+i5PafL2ZBWq+Ixtw0pO437VK8nNH6ct69Ig4zTJVGN/Bp9KtqbkMPb9+H?=
 =?us-ascii?Q?wFx6UdwpL0NeKwr0nXG2O9jlA2K1xA1tj1+n1PnaZlAT1qp11hI5KQPzrac1?=
 =?us-ascii?Q?wCN/MU3ofeZp9IrdkmTgFoMT7V/8pOLpvoheb3Ha1/FVSykra8Hf5NRUlsJF?=
 =?us-ascii?Q?jpgDUqOD9f6+4bHdZ8j4Pm9RzuRUG1jGewmDt+VjAi+NkaC6ZkhLGhodYbp3?=
 =?us-ascii?Q?Rh/e37axVv9ruYGDQiX+FBH40SZDReuBOW+wKZ1XRaB1XxkD99HfQfqbLUDi?=
 =?us-ascii?Q?o7hBjxC0YPXQ/znT7VJ8X5Bu+s+wJ73jKlqSt2gDlBIF+EDzSU4DQQXKHU3l?=
 =?us-ascii?Q?KWhDWyl0Z8lwQmrn9DlhRP7eDHn0kf+eYX2Pfb7QW5kpanB8jHxxCDed3WjG?=
 =?us-ascii?Q?lRkHKmrDupwSWedga/cyQuZdH9nV+a+IPaAf6ZZmYUPr8Y1v9n1UiP00XP6G?=
 =?us-ascii?Q?ZPgezcbXohn6U5f3gnYfvEn0vxrZ6Gy2/LAsK8TPzv/SD+gvg3kysSkN9TTc?=
 =?us-ascii?Q?13lWrb/guDpOpDtIOJQwgeEUVdartPcvHGZpHrh5xHOonfZGkJeg3bOqukzQ?=
 =?us-ascii?Q?aXo3LFUS/xK+/7mfDyspoq9T6PXKP818Hd8KxiAA3N6desO2ERU+ckO1RygO?=
 =?us-ascii?Q?78qgs9g7W1h8CeHW8gpDzKJSu8MabV737K9q+LfTYO//t3VTCIxXb5EP1lBQ?=
 =?us-ascii?Q?vYgQtQNG+XLQ5fVasX1ymx8lKBKs3JsxE3EjDWgaumSCPMq16j9nxSygyKgv?=
 =?us-ascii?Q?gV5kxgx1xK8/1Yj2VJn3buec6uuRehpa+W2eqcQq4GelKK6nAEDgDQxPNfaR?=
 =?us-ascii?Q?LzY+JOpju7w4Hx16f6pKVrD7iEFa+Nceq8+vHKdM2QRcgK+N7cNHX9RjvJz7?=
 =?us-ascii?Q?rG09Q6W4MUaiCAlEhhCJ/yuVeTa3bUSc/uWXg5b9pLNjp/YkP0vw+lJn7nR4?=
 =?us-ascii?Q?+034yEUL8jUEL0B7FcC+mBxn632U9Mf6wJNE1wwDRvDj0ewHHD9Vpj9XdwwY?=
 =?us-ascii?Q?jbwWxz6sXEe0ZECNTP/JkTi863aqMFwfLpa7chB8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaccafd-e15a-4dc6-59a3-08de23c51595
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 21:30:51.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9ZZFASr/gqHfVKSihfSnIBvbVUJIViJE4A1ciPqQt9qB1lvu4d36jAjYfREQvjAtbVAHTGSWV4iY2mFAWvzTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8776

Convert dlg,da9052-i2c.txt to yaml format.
Additional changes:
- compatible string fallback to dlg,da9052 to align existing dts files.
- Add interrupts property.
- Add ref to /schemas/spi/spi-peripheral-props.yaml#
- Add dlg,da9053bc.

Remove dlg,da9053 from trivial-devices.yaml.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- dont' fallback to dlg,da9052
---
 .../devicetree/bindings/mfd/da9052-i2c.txt    | 67 --------------
 .../devicetree/bindings/mfd/dlg,da9052.yaml   | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9052-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9052.yaml

diff --git a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
deleted file mode 100644
index 07c69c0c6624c..0000000000000
--- a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-* Dialog DA9052/53 Power Management Integrated Circuit (PMIC)
-
-Required properties:
-- compatible : Should be "dlg,da9052", "dlg,da9053-aa",
-			 "dlg,da9053-ab", or "dlg,da9053-bb"
-
-Optional properties:
-- dlg,tsi-as-adc : Boolean, if set the X+, X-, Y+, Y- touchscreen
-                    input lines are used as general purpose analogue
-					input.
-- tsiref-supply: Phandle to the regulator, which provides the reference
-                 voltage for the TSIREF pin. Must be provided when the
-			     touchscreen pins are used for ADC purposes.
-
-Sub-nodes:
-- regulators : Contain the regulator nodes. The DA9052/53 regulators are
-  bound using their names as listed below:
-
-    buck1     : regulator BUCK CORE
-    buck2     : regulator BUCK PRO
-    buck3     : regulator BUCK MEM
-    buck4     : regulator BUCK PERI
-    ldo1      : regulator LDO1
-    ldo2      : regulator LDO2
-    ldo3      : regulator LDO3
-    ldo4      : regulator LDO4
-    ldo5      : regulator LDO5
-    ldo6      : regulator LDO6
-    ldo7      : regulator LDO7
-    ldo8      : regulator LDO8
-    ldo9      : regulator LDO9
-    ldo10     : regulator LDO10
-
-  The bindings details of individual regulator device can be found in:
-  Documentation/devicetree/bindings/regulator/regulator.txt
-
-Examples:
-
-i2c@63fc8000 { /* I2C1 */
-
-	pmic: dialog@48 {
-		compatible = "dlg,da9053-aa";
-		reg = <0x48>;
-
-		regulators {
-			buck1 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <2075000>;
-			};
-
-			buck2 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <2075000>;
-			};
-
-			buck3 {
-				regulator-min-microvolt = <925000>;
-				regulator-max-microvolt = <2500000>;
-			};
-
-			buck4 {
-				regulator-min-microvolt = <925000>;
-				regulator-max-microvolt = <2500000>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
new file mode 100644
index 0000000000000..1103a8cc5cea4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9052/53 Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - dlg,da9053-aa
+          - dlg,da9053-ab
+          - dlg,da9053-bb
+          - dlg,da9053-bc
+          - dlg,da9052
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dlg,tsi-as-adc:
+    type: boolean
+    description:
+      if set the X+, X-, Y+, Y- touchscreen input lines are used as general
+      purpose analogue input.
+
+  tsiref-supply:
+    description: The reference voltage for the TSIREF pin.
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^(ldo([1-9]|10)|buck[1-4])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@48 {
+            compatible = "dlg,da9053-aa";
+            reg = <0x48>;
+
+            regulators {
+                buck1 {
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2075000>;
+                };
+
+                buck2 {
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2075000>;
+                };
+
+                buck3 {
+                    regulator-min-microvolt = <925000>;
+                    regulator-max-microvolt = <2500000>;
+                };
+
+                buck4 {
+                    regulator-min-microvolt = <925000>;
+                    regulator-max-microvolt = <2500000>;
+                };
+            };
+        };
+    };
-- 
2.34.1

