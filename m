Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A937F005
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202442; cv=fail; b=INLzvo+UxopKQVO/RXQGccLdQ9Hb9gCSl5ScAOZ3pcc6SdjzOdeylL0vl6tYwUFQ7bJ5v39l54DmbPUwVdoXEjg64jpFtiq2Y6wxPXVKosbDjRMU3oWQeaNrfUUa6KXAzafy52NXBzxRjRfPyqtrsb7Hv9psQNC5ZP8EA0oKMSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202442; c=relaxed/simple;
	bh=0LWUqOYF0/kS6opakZCdHjFoHjuGIHo/OawQZR8QizU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Duz8q4dYz8XhjGhtMHXZsqUfTHU3LUc0T1FybzitRa648QWKVLueeol6VlXxFcX0XCZ60XAMJX9u+pTN9rO3oEp35Rsp7UlojXpEaqAtBnx3ECcZuolOAzNbit2mE3TqqEjEjiBh4puaNlHdbswA/IjAqmKt3vvz9OkDXOuWnos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DBFsQ38D; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DBFsQ38D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2TxWYwqOBx3wgiUMFthzp0ETj5JV7pw6IR7BFRHM+7Q8/lTGmDzxIqLRex8wc5ILYtR/ow/P9D7DibC+nliNcEJphTnHhY3eBn//3+at6AziZSghFS8p7AGNm6e6mcJ9mFcG2+iH5oaFbB9AfHBslzOMW4+l1ok/TSrEoJdwLsLnl/furp5k09jB8N2TajL45gpk/cORenv2ngEDzDZ+rUt8yAyLGVAL0q+w0kb8fR2/8PP6/vnjbobBUUfE4vCxbpt9oiL30yA2Ppb1U4Ap7NeNyEfCUEOmhHKbMVnYeKEbrRoYRO9idZXdvckYatosbHkuAEpY0GhcfpdJngALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBGbjxYV0sYclcobKYt4j8IEqZdoXizaAIvA0xo1df8=;
 b=HqgIM15Bt5RWc0IOHmW83goxX7nASAsLXfMj5PHoHadccteE6Gs5Kdsuew0rWDLS+iUo9v74mh7sj6xAW9PTkygjJRvNXY688kwrDj+oay8hKIjGsKpdJN/bl5d+fFpemvDnxFmkTwELXA/MqolzQ5z/nH45BtTMnph533Gf6SQhTpXCOYKwqozuAdmd+Rf4vkp1f40bQiOFc+8Usuq+u9ux7wrkQ39ZI2YMuOT8fWBBZJr/ghRyKQUzzvt2LYsIymhWqznOt6yD5rj+5iEV227jWhD/jfLNjd0kmhmoBVnG6bjypQHZUuTp+8YWyxNrum/z0MIZ+A+FDljV2yYO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBGbjxYV0sYclcobKYt4j8IEqZdoXizaAIvA0xo1df8=;
 b=DBFsQ38DgRu5P/cY5i0TZA/bHO1HkXpUm08XZH6/Kd4h0khU8eVoVDMl81l0CYpjl39/uKjFbf08BxmchCHhFFCNVO4LjirC7S+IUenJaGJwrN6/kJj2+mZeoa+2KD4gY/h/4A41CA5EkpZCgKjw0KNQ4zz8gxAa+SNUbtZI0MKDj4Kr7Y7e44v7+K6FAQjO4lMUowmLBEsY9Rp4dEkTDnUKylki9mRF2c6da1SEcEaK449gXLDF4PaeS4J9MCfLDg0ToQZEvQjKGQXtdc4mrzgY0cEilLiXTV82Ud6CJ1j3gj6STzCMH8A1CJcVkdykMt1pHLeZACqB+gxarc7ayw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 07:47:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 07:47:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	miquel.raynal@bootlin.com
Subject: [PATCH 2/2] ARM: dts: imx25: remove empty clock-names for nand-controller@bb000000
Date: Fri,  3 Apr 2026 03:46:31 -0400
Message-ID: <20260403074634.774234-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403074634.774234-1-Frank.Li@nxp.com>
References: <20260403074634.774234-1-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c4af9313-f276-4a54-ca38-08de915539ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|366016|7416014|1800799024|921020|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jsFoX1KsuwE7XZOyLk/XdL2GoLgnWnx/4ohIUSDm5f/TpI/8w3j/hHFLHgdDipoYd9f7Zk7tRxb1IhIP7mEPE88toR4sX4HWC+ojx1/BbvxCJH+VafzwmHRFkZ653M+TN+EkT0rUXJv7APCF4DXBu0KM8KVu26cs7U+pIv/9WH3mXZIrb6e1OUHhzvSG/K4Y2UEWqS+kTyDZ9sR/DZtariy7qXkkukXYltThnhBWJ9zCNmzmoqQ11zVEO1FhRluYwLCY63FFd17IsK/zDgVyVDQSFmVpRZ9ZhSo3J9VzmcLgDXb01H35kId/KzIxYQT61Fs+2PiO/SzT69ioPGOIeSIdIPHyXkzPXkALRnnWgszgm+8+aWzYVu+XSAkWsn9mtKjcLCtTTZ8r9CrcYE//1l8UE/HJ7Z9JKUWFZUtQIaaycouBRaVK1dft3WMghBlkH8nFeGN4YAKf+lLUF0SXxj5rGPIX51HzCLn3nDK0Cs8oWFhpCpAfJFrpppoB7NQ1GX2BlrmTQaNCHGUM40d6vTTTjlexl9y57DEO9NFEud4j/PIR+T0o8enWz5enqJe6LaocdsbAfV+pjz2aqN7rzrh5yo2WQQxpdPeXD2TAUNumOWhVSvxVxZ0NEpshGLMwwVQhCLsXaSnTnNJd1iutU2924WJmJdNr6Hxx2bTCEz2wy6DIGmmAOnMmPUqVgXzuLKTQizdzpWtxzuQuOhHnHSR1gMFtOTsTXwHDshwXIEY6HwInhDnq8p3OaDEXR+rVFB64HmwB3grbOpLxe29KQ9o8R+9HTKvhnyZqw3WHGc0szTA5BJBw4jYswBjqof9U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(7416014)(1800799024)(921020)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwrjUMwvTr3s6FGZrmGuSb6L68gwVXVmNVtWOKZnsGHCWnQAi3D+okb1EANM?=
 =?us-ascii?Q?mut8vySUpLfNpSwAcJbl8k5juZwyk3CSAq6DZx9DGQ2Y/LlrQVAE/eaGnlJy?=
 =?us-ascii?Q?LJ0GEApyZF95GZ+OltDuGgKc4gpuqf4SGMIWRq/APimK1Wy1T1+P0rcKKOi1?=
 =?us-ascii?Q?PiD+WdSHjaV45fDZj0ev+Mc/svo5zuRSkJ2dPlVbm6fgm1bX/oKvrPPNsh+v?=
 =?us-ascii?Q?oUM2oU6optp2yY0LaxCdzlAqPosLVvq8RzVDzojkN06jP1J8NogPLg+udpcM?=
 =?us-ascii?Q?AiR+Lare9mYQ0bMF8lBL1u9UatD3WG/DA1dQ3fE+kxEiqmf+jL0OcwwfxdVJ?=
 =?us-ascii?Q?r6I/jvmIiozuKO2es7886zlP6+nO22AcxFNd7htHxk7caSCLxdk7hK7xf8GJ?=
 =?us-ascii?Q?bI1uWRRofz2iNktAM0N/PVm7VJ3bufqk/rwbC1GB5OaavVI0AARVIzAxHELL?=
 =?us-ascii?Q?gGWTtzUY1h2/8VJ4q7SSeZVIF0x9L0Phla0RJXmHN03Ijqisy+0ccTI+0MwA?=
 =?us-ascii?Q?4bePMwcOV6nV8txDKEgsdm6VIKoF4Pguxu10CvF2Okr1xqJEUzwjJRI2JC5e?=
 =?us-ascii?Q?96/u5mYJiIoZP+cuZbcxghJJZKD/RQs2x5hD0PBf5ywCvi5aJ+sJPxBSj5Dk?=
 =?us-ascii?Q?y19kPG0MzusjyvM7XwR7HpsJQSZnsvNnC03u90FWSrZ5IH0gmK7f38kWUNvk?=
 =?us-ascii?Q?lZ53XYlDUmNJbWTbjgh2JuyqbO8XdrKjDs2C56FtyS6ZoaWzrMnjhlhOkjqB?=
 =?us-ascii?Q?S7GwGwrm2PaUc3RslHq6Cl38oYKfIZw+RN6haN9U99M7jNMgGLBBKCcToyU8?=
 =?us-ascii?Q?BrvQ2xIYhpSAlc6kSFIKo8yj6/X2fp0Z8v1K0r3vFWxClS4fVzc4xK2CADKo?=
 =?us-ascii?Q?cNwPNNO1Z1Wn3AgY1D1+21g76Y5n6q2r1YWhD8viBe7vCmFBwQOTQC1K8Hh7?=
 =?us-ascii?Q?8bT4SsNvcJjTp1YlpY+0TlZ9Xc9U45i0DVARLhLubToN7hGghq6RmzSYa0fZ?=
 =?us-ascii?Q?isLItRJc2y8onVdkDuqTQDfVBM969iIrF/kig6p71ksqelrxBV5xLNnOsqXa?=
 =?us-ascii?Q?oS37ZN453lP3aZtwoHBaq8I/E1cRPZhnZQOVl30hLwZ4HzKhcNSG1ESUofXr?=
 =?us-ascii?Q?seAl2FPgiLH9qtvuS8sWA6jnyiVwMj+kgYMSI/4kiuLrlL+dgx92zo1xDsz7?=
 =?us-ascii?Q?368QMhAIBpxJGich5VUpNnrdpdV3gKtR0gq8IKUElQw5Icn9lx5oQmftm/eY?=
 =?us-ascii?Q?Uv8r7lOIpMHPzveQs7ydKMdGrnAPFN/hjiL4+4vFGAN9Ow/PqCnhu5xjX00t?=
 =?us-ascii?Q?lgXXC34WiAIEzjgrCMlAUhR5Jh/yvQLeu7uyjmMVP+8HLXyvI5Zhb8fI7n6J?=
 =?us-ascii?Q?4iaj75Hk/wuA35z4tWhZDE03rYvi8qK8K1lUWb/Odq29Kg9uwlNHihB5beHZ?=
 =?us-ascii?Q?AlJQtRIvCxw8+HL/vxR33us8P6SchewK/Qm/XDGC5Ygx1Z2uq41wy1fI+z4/?=
 =?us-ascii?Q?z8soRxD8Xi6k/0nFmzgP9Zq6ORE1kGLfg8XwbTeDL6jm1V0B2zBCQUCnoZOk?=
 =?us-ascii?Q?QEOCOMqpxHnOmOUBri/Mall11rLSm3RE5MDDJHIAS1+wqenqfRlhiNY3zr2e?=
 =?us-ascii?Q?9nPH/jSF0LnxwTF+GhsDFBCGwYnDFtiExBm8MLcbg2Zt6JUIvJTaIUQgbCxW?=
 =?us-ascii?Q?YulZsHLBU9IMwb0U+dPJrqyWHFjGzP95W+wEXzxxRiDDb6FA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4af9313-f276-4a54-ca38-08de915539ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 07:47:16.1862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PDC/OriKhTFX1pi62UvnS7fiWG7I3qW0Wuq+sx93wj+58rtEJK1V36YjGNens2VvCmpcjpKH6HO4j2Ik9ylCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888

clock-names is empty in nand-controller@bb000000, which is wrong.

Remove it to fix below CHECK_DTBS warings:
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx25.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
index 94dbcef63b8cd..160533b037940 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
@@ -618,7 +618,6 @@ nfc: nand-controller@bb000000 {
 				compatible = "fsl,imx25-nand";
 				reg = <0xbb000000 0x2000>;
 				clocks = <&clks 50>;
-				clock-names = "";
 				interrupts = <33>;
 				status = "disabled";
 			};
-- 
2.43.0

