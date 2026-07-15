Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED61472768
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118637; cv=fail; b=O93dzlX8um97OODDcT0H6l4BY8m2YhtFmUPzBaTBoTa5kKjotJP/DSEGLDMd2IjwfY3PmsZrti6paBA5WSxDMDqUtu8nxW2JJv6of173Pi3lyhqh4GxDYoln4mI2HM5AWWAJaG6fvZvA7+Gy4R09/Bby+EFV05NP0wyo0fy4oj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118637; c=relaxed/simple;
	bh=FTBGcYJSmbBCMCcBw56dHbr+rSEUElTI1YEKz0h4yQ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JKTSJn8qjn1fKF4fBQrix8LXN4Nwn7aZhpmVlPI0X3lELnuktCRYhpDJNn5zqz+j70qZ060opJ44TukIeUImpyZLj/lGYjii+bMgYWbFuwftIpN5V5cXH1zG4P92+vw5Fzhn/3fEbgep8NhrszFV8nixDriufYnSEf8XAo6Seh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NZmT5woB; arc=fail smtp.client-ip=52.101.84.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NZmT5woB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiFb7rup8/AVS+VrYBdTgJza+PO7wGnK30EqUmanW4/EJ0tSt5mM8SgndGnlVSjYFVBQzgtN+uKGJiIbVEeXIprBTLHksFH0i7LeZRzQnni2Kvh75xUVnZwkkLO70BZ4vyREc/iKviwtWYzL/YRrG7Iwads32jcn7/laivScPox3MfSw118np6QZKyOS0F768gsJTZCh1+bPpdFU+1aWtuhjPEyTDw+IAdGoi3nKWUYVwLBnhvAep0fB/I+Odmt2N6cEsauW9GOhC8VpcaB4jKA4Z2SYB1BPLWLqHv2YMOJfe8TpL92Ch8lEDEN6G+WhNeZ/YqJ3+4WkaKaXFEE2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ukk7lztpvkNQM11wb0HULISMmhw9DEPhs8gPomaWz8=;
 b=Jy49ZNdCIM7wcsAyj6U/9iwjssOquDzt7f778JcXlrEiqZEjvCw0bSSn11Zexj6ukQ8e4N5uTQZhIqE6BHLI9XKqzYgl7TL7lIG3+fAaJ1VvrlI1TgeRZq4I9Q1iKT8MOIM9Dx0p++xJIs2Mx3sUUgQehbg4oe5IbKhiIXaoDViEUsP5Rb31MSTynd6VQUdhiMfiSelnCRsjDw/E+tL2KN0smrT3IvHcVVT4x1Nd8sWlIFQABwjHFHnw/Mkn4ni/PiEcljBtIwBTbffrNE+rJfBLaiPFIg+M1sBN0aSlixG6UIDCMX50EN/x9DIK4KdwN0drLQz/rPErTMUzql6Aqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ukk7lztpvkNQM11wb0HULISMmhw9DEPhs8gPomaWz8=;
 b=NZmT5woB0ErJSgF98+8WWmPXo3J7aDAxLVQr8f2TfF+H43H8f2pa/WA8qDn38f8CiT2Rlses2/9NPQcTJyeMBL0E5v2sAs9XFrmq4m639FxD45j6ClHjlm2Cjr1v+cJtgc0el2n/+HivKGUxv1SsuNBEKfAEfFT4ToNqvP0MYQdtFYOUSRl+veqAlFPgG7V6Sk18s0QhbqEwfbaS/BDGa2UbPSc1oq130okeQMNrFi4sF8ua80Qs3pxNVEenU0dWFinRh+2QoBAQj46NwWatPbeh2F2M3v/GHxfjlqnoxglojYhef7dmAL7sd3h0HorBFQf5Tt/rtTii2Z6kHIB7gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB12133.eurprd04.prod.outlook.com (2603:10a6:800:313::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 12:30:33 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:08 +0800
Subject: [PATCH 7/9] arm64: dts: imx8ulp-evk: Enable LPUART7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-7-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB12133:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d53736-06e9-493b-d023-08dee26cdd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5t6lAhu6Un0XUU2cBe5NizGg1FLJmhOwYVBfw+pJLeJq9h0r//nJCXuCJbMVEWcRJtbY7zLxAum4UjlTB80lS1rAtaQ4gWMS3hE1aEnBW1Jh3JPnqzOVAG5D32PK1madPVf/B8iOXdehbWjMndJw2ttT7g0GDO24nFwdZ9Ki5Wl24XWHdaRbUCP8GpBGLrBeC37EfRQGuU2wgSNgSiybVOS/ADCK2mGwOT8YD1dmOygJnUyywLiYiKp5LYlUlwadwSz0Cx8EHA7stf/vwm2AjjvIjJcBMvU5JOIJLY1i2m1Ass/gxTxbbFXYI2+NsTiBmN+tkq4J8dri7zcZdhLn+GdNLD12JIFNYTKAhcaVHjTG1eW0m2PGryuIHjlLa4iMimrv+H5QMRqaARboWd5O37Ba04186vCJYIlcXhadiK3GmfqC0bmucO2B3J5ANXv05YhzISeDcxNEQIfx+ruzxzV80iQV/BgCiOBzZWoRySiggmwCQuQrsLU04mnLeGboA/enYTqyNBtuzkChXVH/iHKUlq9vdkF2FRBsZxsXAsM03+GVe2ziof7u4RB2Lasc8Bv9hK40Qmelwm2vmOBUu8a0EiWk6Zm4zLytbMzT/j+Z6tPNYX4UPyu46xSmev/HHNfgXe/FHzyzyoY+terwVAS4Wp/c/Q68Kvy7WF4UVB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFFDeU1OVkEvVmgza0xCM0tGS3czTy95bGk4VUNwZ3ZvOVo3Uk1ucGs5K3Vq?=
 =?utf-8?B?Z3VVNkJHLzh4dlBIRG5jRGc5bWNiR2RXdzRlckF4aXpjS1d0VzdoTzdwOTBh?=
 =?utf-8?B?eUJBY0ZBc0dpTGMwdXZrZ2tETUdYMUs4ODd4cmkrcmdBSEt1R2xndVV5QXpy?=
 =?utf-8?B?S2NxWGhVVmtnMnk3ZGpSYTBUTnpNSm0vRTl0elA4eStlVGdTdTRza3NwQUVS?=
 =?utf-8?B?N21HRUZza2lELzREUGQ1SWtlYi83UHI1SVluRHQ5clIzYUpOcUtSNFN6M3pY?=
 =?utf-8?B?d2srUTIrV3lvNWlrYUhBZlZPYlM1QklmS1p1NytJamZKZW9ZYk9GbjEzbmRS?=
 =?utf-8?B?aGo4c0E0QitYc1J6UkdmaUUyRjU2SjBNb3NVUTFPM2RvTi83RUg5bU9sUG1Y?=
 =?utf-8?B?VkNGdm1aRnZzbnMvajRIcFA1cUgvc2F3bEVmb1cwemhBQkpndVNqM2NSV0lK?=
 =?utf-8?B?QmluRHJuOTRQU0V0ZlMrNXF4ajZIQkV5M3FOb3dWYkJYMW55eDhkMnRLeUZr?=
 =?utf-8?B?S1FVY29yN2tPb2ZoOVIyZ3BhV0IxUWtydE9MYlQyZFNseG1ldVFuVHVpSElk?=
 =?utf-8?B?S2l4QVlQRVBpMnlLc1E4QWRSL3c2L3VxNnBHS1F5VXIzVHNlZCs0eGV1bHYr?=
 =?utf-8?B?cFFxQzlEd1JqbWF1TU50RzZwRThia1RBU1dVeVdRVllFd2JCNjFaY1ZnVHhw?=
 =?utf-8?B?MURtOGtOV0NzOTY3MHkzbTNjNktnU0pSMzBSRTIrcWR1VTFVMzFodC9Wa3Fw?=
 =?utf-8?B?dG5CR05jSlMreVV1R1NXSGsvZTJaYWtreEthRjVTcXJ6TzNrVEZveCtmV2Ro?=
 =?utf-8?B?UjBFaEdJbnl1SkJNZVlGelFzNTFpdnV1N3RMb0o4enNXYys2bGdmRDNPTHFH?=
 =?utf-8?B?WmkrNDJOeFE4RHRtY01WVXZPaUdJRk5wR2kxcVpNSEl5Q3d4WlF4OCt5YjdZ?=
 =?utf-8?B?ci83OS92aER6Yk5UN0tzSHF3TWo5c1ZuMGxMdDlRamkzRTRXVnA2Qllqekpz?=
 =?utf-8?B?dWxYNkpvQVBXdGNmeFJIRnNpd3JTZ1E3Y1lncjc0cHQ0MXpoTERvenUvc0Rn?=
 =?utf-8?B?bzMvUytSVmNjU0Vtc0tpZjV5ejZidUdacUZWUWtNWkxlOGtGNUxJbTVmOXlL?=
 =?utf-8?B?bVV2YlRUaVpCYWRBVHZBMVlQaXNUMUFXckR5U3hnb0FUYUZueDJPMXhuUXJs?=
 =?utf-8?B?RWlDeTB1WDN2MkN6WG56aHhORUMvMzNDMzFjUkhhdWxUNEZjOWRlMktBazIx?=
 =?utf-8?B?TnBTZ0RjdzBJUS95WFNBK3A2bnM5NHRsOWxiRjhtRWpRRlUzZmxBUkVWaW1u?=
 =?utf-8?B?L1RPNWE1U0RhL3A0cnUyZVFlYi9GdUdtWkNONEoxbTNyODZaQ0UwUis0MlNX?=
 =?utf-8?B?SGpZOEsyUDg0Rm9PRUtrQ1pTbVVtdzViZ2V2eGxRU1hyOEtqNEg3WUVjanZP?=
 =?utf-8?B?Sit2UFR4Mk9CNDBTSDBhYitGVnREckpxOG03ZG9aOVVmWmRGL1N4NTNEekxh?=
 =?utf-8?B?bFI3WVBNNTBMeWx3MEJ4aGt6S09MNGZ6RzhiM1lwZTRHaEZVbjkySFZ2MWta?=
 =?utf-8?B?eVJ4WGlBaFNiRGNxQ1YwTDQ5YlVLYjhuY0JtMGcwWEdnM2daRmMwcG9qY1VK?=
 =?utf-8?B?Y1k2WVlSemRGakJaQm1VaXk1STBCZWR6V1RPZUFNSDQxeHRUekE0elZSVVkr?=
 =?utf-8?B?UEhsbkJCSmgra0p5RDYvN0kyOXl0QUdXS0pKRmk0ek1kZUJjaDc1RHhHaGVD?=
 =?utf-8?B?SzBBRUZCVHhwNXlIb0EyUW9vbUJKdXV2cHltOFVOOE9FeHlvRSt6UUFlN09S?=
 =?utf-8?B?bXlGd0FVMFF5bGF5S3pXdnByTmpiZ2Y5aE54cVNyLzdRYm42LzdCcG1GSTlz?=
 =?utf-8?B?OUdLaWlXd0lDT3lIaXh6a2xMSHU3cDVMbEsybWI4TmxWTWRVOXN3dmVLVXho?=
 =?utf-8?B?Y0JJa0FxRmVZZjhhNllLNEdNT3JNelZ4aXFzRE0rSk1Od3cxc2pWTkFIaFk5?=
 =?utf-8?B?TDRpZGFTdTUvRm9RM2Z3UFhMeFh5MXRKUlY3YVZLZ3M1K2Q3QTdZRGRGWFBN?=
 =?utf-8?B?UDEvOFFTNkV1SGdYYXhubEFnVms1ckdmUjZ1algrT3Vrc2dsKzVHb05IYWww?=
 =?utf-8?B?bUFvUlJyREF1YVZWTEZKSUQrQUk3WW9OaUUyOGNXcUtUOWpBZUdRQStRUERT?=
 =?utf-8?B?TCtnVEZtWVUvYnJ5ZS9oZnl6U3FsMWFVWUwzNThkUzF1VGs3b0xPZU53M2tu?=
 =?utf-8?B?UG80dlRGSm5LREJFQUlvZVlWbGNOdjdoaUZzZEhHcHdZWUNXeSs2bGZ6ODFo?=
 =?utf-8?B?N2NPc2psSGtqbGRRMUo1MUNDVWZYZ0R3eWY4SGxuUXFiWGlLQVU0S0dBdnlM?=
 =?utf-8?Q?Ra/sWOZxdcYk8HMYWvctFF0T6+Jt5GyoPujve?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d53736-06e9-493b-d023-08dee26cdd12
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:32.9268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV3rZCAmQ/frtBhT0Z8ak7G6MVqc2Prlx0zhiPRomA+I5gkVUjWuj1KhSByIzikxb6rpPYOOmIOJahLtXzHl3fRAeOKuWqubLYBPlmVV76WaxhPKat2m5pXP6pzvBscc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12133

From: Sherry Sun <sherry.sun@nxp.com>

The i.MX 8ULP EVK proto1B revision routes LPUART7 TX/RX to the FT4232
PortD connector (J25/J26 pins 2-3). Enable the port by default so the
additional serial console is available out of the box.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 66e99cd24040f..938ead54ff50c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -179,6 +179,14 @@ bluetooth {
 	};
 };
 
+&lpuart7 {
+	/* FT4232 PortD: need to connect J25/J26 2-3 */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpuart7>;
+	pinctrl-1 = <&pinctrl_lpuart7>;
+	status = "okay";
+};
+
 &lpi2c7 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -370,6 +378,13 @@ MX8ULP_PAD_PTE8__LPUART6_CTS_B	0x3
 		>;
 	};
 
+	pinctrl_lpuart7: lpuart7grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF22__LPUART7_TX	0x3
+			MX8ULP_PAD_PTF23__LPUART7_RX	0x3
+		>;
+	};
+
 	pinctrl_lpi2c7: lpi2c7grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTE12__LPI2C7_SCL	0x20

-- 
2.34.1

