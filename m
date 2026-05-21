Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340425B0B0
	for <imx@lists.linux.dev>; Thu, 21 May 2026 19:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390977; cv=fail; b=E3Zc0i2dACylpAXGkfmWZxjJA6N/p8b1+Y0FYe2sMAZMSsGNf5+fvBDPe4WVMCqOForPX6ivZ5vjAJemE7tBaZeFQJbgUCv/WXl2bIaxEncA8qLwebRWYCVZvh9FPwnSkKrOACXrXKbKw+H1HYpL+435pH4gSgG4hZIyHxjgfPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390977; c=relaxed/simple;
	bh=Dsw8rODhY3/1wZr4ffJwJCDrmOnOGX+7Phh7CbeaQb8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kltBYFj56tWFAQiSnMdf+HVX3fNurfXzh9CKSLD8jzXgKGoO/FuBEtu8MdmM6a629Syhv/G+Di1na+LAd5ITB71lhkgwOS5YOIi7LYG5KRVZDv+YyQh825s2MdWfsn+xSpwYssr8FromEblGPaA+qK8ovEugnxlkym5LWwLf020=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m0dTdfCP; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m0dTdfCP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h77Jiqs9ILrN015FnxiVJwOw7uKtQjLBZENcUvsp4nCjxuugFQJgZlUDDCcxdM+2XrEpJE7rpWb6KXM/072EPXAW+NYOmUzAvS1HZ0a8HBCna2CRWg5IG2LBUNcE76SQfasGtowuJG+ZL+VmlwTXaXlbDdEsWQpEL4qT4BrTmifAQOpvBQZq704n3XCGh5c3FEuAsT0391wuiTF9yYHqKeOAOUmOkM6FIbEQjYjqPBFDnGnevwzZVDItmPtrpEgT+au6lNCsXmHCRBLeS4C5Ons2n8pvjL3RbMNz2/ti6t399aNUXEYVvrL2Mblxjuodv4c8tR0sc5aEfkPQGAd7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8/Gr6kqDpyy5lUWGiMAie9m8N11sZqiZBRsf8cPW+4=;
 b=KKq7dgcXRvgXSd61msSHbMqPeVm0UD9u/OwjGlTTfikQeFs+vEeZRD14VDANSlmELvRdsRICPdEEEnfY1DFJoxSJ2P8RoYIZkrji44EQct9yjbtVGA49WtVYRJsF1Rjk5C5ey/Ko/qRXLs0uHyKil7e0XhJS4waHFthPI3jaFwVmDS60r1/iqZngbOywn3XJdJGZeKl/K6gPb7/SImNYh8jUIdR6weG+bQFjmG5ZDXLASsAXvmvxcmmK6wPgjPc18cu/VFIEKV3xYJbElIDB6Dj9wfynb/bsXULhvzGv2Aj/D7gOj2ZdAWBODfv4DDvxZQMuQQXe2UZ3h8IqeHG+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8/Gr6kqDpyy5lUWGiMAie9m8N11sZqiZBRsf8cPW+4=;
 b=m0dTdfCPeCC+HEh2jhxI+JNMa9d7jdlej03PXIiBJ1ClpFTaGokMv0npFj/BU7kZgA/dk3ghN4ivv+pl4ThV+7VMAgYkRmbak4DChDcGFWM/Tl6Uk/qxHHwCLksygkQcZptfxrUsvOhP/eGN78PuQz4EMUQ+rBDJ23B+kc3K6MZQJ5FkJ9ykFMcuPQLt2EuIGgf3aiuy0+px7s06em/BbYpSuWCqiYDnJRxaoXcsbZLQx7Ao07oJT1kaPNy6GNa7hxTy8xJxeYYXp3QZdFqW71/QUW/dm6lYfW7igQgcH2hRuChvpO8J2JxwUt4QqOZxMGX6n6JC5Pbs3vm54t5Zgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:16:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:16:04 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 21 May 2026 15:15:41 -0400
Subject: [PATCH v2 3/6] ARM: dts: imx: Add bus-type for ov5642/ov5640
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-imx25_dts_simple_warning_2-v2-3-c6557df516a9@nxp.com>
References: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
In-Reply-To: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779390945; l=1666;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+BiaALwFCYbuu2/9Vkn4lJnA87YHPQhYWKenAz8FUU4=;
 b=hcjljAi4obnPA2jsMlyw3fRBMniJ0uWqzuOhKPJ1vc6Y4qQy2hz615fKOAmTvl56TBbyvCRDt
 yf8ji1QJlo7AvSYP4cE3jsH4ZkTGaeKHkn/C80YE4vXb7EviOxunlq6
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:805:ca::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d8d964-5aec-4a57-b897-08deb76d66e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vb3vmMasZj3nNBIu97UR8th8FNbI8bUe4FbEyH3CdbQ8x+8jw0fsjdP/OJxqKyIkkWzHeVNyo6zxsJC4aNWb9cy/F4SWuz2ejgBPeXSh7VB5u96RvdyMz+nBA2p2aJh0TwB/T8dd7O/s4Ta/Qfb7cF9xmfeivQddcVXEyUPITILjXb3d+12Q61OTwlOp7ddLqICgIeMO1M6rees0BcewS8A5oFvNVRDpSVA4heYUjsXSjKpRJQzxMs9nB5ScJ3wqAsfsjcMTYTSo+ksRep810IRyiTpAJy6yro41FwhLfFL8OktI3pXM0Vq5aGhMBps3pPMucVs8c40xOjs4IrWJmi2kulNYGoTQDRB9Zqqv3wvwewvWlzpZZF7p4hQRYJKwAMX+VePhOX2MMjUXPSHUCWRnrMrsVgzT84fS/MAOm4lWilqTRV1gfibrX5OdMLUI7D9HK/V/3Z7VtTuGWrQ86ZmQVoyTY1E306RVbVp8Y6vaTKYsAZwA5bXQUsKk2t7TwIH/6B+gyxQjxyL4Bs/R+JKNFglSc16eHMNgkWG/mLDbxzq0PYudwoVgz5IcnDiIt3RfgK7GomU4il8vCWpHo1TZX3JHg5ammlovRe4ha7Q4ZWDBI+XGmAd0ctKiloRU3N9dPsAhl/1xXxv/Ba51D9u8pQOf/3xPj1c6Xr+f+ChDOMHI5vGdGvXyEEuIk6un
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGowd21vYW0xMS9QYVM4aUdvS0JpK05qYi9HMWVSenQyTG50WmRzOVV0UEt4?=
 =?utf-8?B?TmI4TmxxaURaRlY4SEt4MEt0UXZuNzA1b0pVMlZjck0yUENGMFFGd2dMOFZN?=
 =?utf-8?B?ZlFKSmJmS1JjcXJxVEtmU1ZVc1dzYnRtL1E4enRBbHZ4Y01mUWVHWkJpWVd2?=
 =?utf-8?B?WFFEeG9UWHRKQk5VSk02MFlCclZYRThEcSs3WW5DVGhLYWFsRGFNN2VWZEtY?=
 =?utf-8?B?S1poQU1GaFhGWHo4MXUwaEd4Y0FxLytJMXp3b0dHakc3SEJFR2dVZ3dISjBY?=
 =?utf-8?B?RWJjWnlCbmJ4RUNNM1QvNXF2ZklBN0NyejVwbnoyNDJBMTVqWWt6ME5jejMx?=
 =?utf-8?B?ZGxCQ2gwK0R0TkJyVC9PNkxhSmdXdFpNeEtFU3pvMVNPemsxV3NjQkx5VnFj?=
 =?utf-8?B?cnFOS01rQkhoNmU3S3cwcUFyWjB3RFJnY21PUFpXK1RyNkcxL0hTWkZzT09O?=
 =?utf-8?B?eitaOVV4emJiREJNMXd4RDIwd1UxeStUNTNpTmR6K0ZVRHVoQ2RYZEZrSWp3?=
 =?utf-8?B?Q3M4c04wYnNiTVFPdy9BN25wVUQrUHZ1Mk1EMHBmcFpoazF4bE9adHhqeWNq?=
 =?utf-8?B?YVU1R3l4MEdIaXpFK3h0eGFsWVdJaDl6cGNtckFxQSs3WUNvdGVTU1h1K3d2?=
 =?utf-8?B?THdHbTJXQnhNL1dzeEk3dVJRWTNrUDdXNGx3aUg4dHVpRWptKzFNdmZHQmhR?=
 =?utf-8?B?cGlNb0szYjlkNUczbG0zVlhqSUMzMlJ6SS9FSGtOYzNoQW5nYnZteXpkdjB1?=
 =?utf-8?B?VHdEaWlSV3pINWdPRFIrQnFPd2dueFpkYjJsZnBzNGcwNlRnZE1FMWpvZ3pv?=
 =?utf-8?B?MkdWUVdmeHhuK2FVV3YyeTdFcGl3eUFLUmhsMUhGcENONkFEdlRSS0hYZG5V?=
 =?utf-8?B?ZFFldmIzT2VjYTdFZDhVMTN3TEgzSS9SaGExbFVCUkpkTWNxR0xUK1JNWUVx?=
 =?utf-8?B?QmJ3WndMZ2dTWjUyV3pBN3pWUzNwK0V3RmE2cmdNaVRTeGQrVmV5eWFsT1Uy?=
 =?utf-8?B?SVl3ZVNIeG05SkZDN1Q1WU1OTXcwbE4yRk9ySVlpQ1oyMVFQMFdaQk11YUVm?=
 =?utf-8?B?WjlUZ1pXRG9ROVFFVXVqMkNWL1lNOVh4VmdSNzg4K3plR3psdzFzZkRzdHBr?=
 =?utf-8?B?Z3NEU0FEdGJFY0VJNi9sUjNQeVdiMzhBTk5iNDg4M2hYNE5XUW1oNmFBeWxV?=
 =?utf-8?B?NU02WkhDSkp4bk5Gdk9vTm9uYkxJbmcwdDE0UXBvV0p1b3lBRERDSEs3a1lK?=
 =?utf-8?B?SWFiT01RMVN1aUY2TzMveGFHU3lFNnltTGZvUEs1dlVJSTdCK0lWWkJqUHhQ?=
 =?utf-8?B?cUVlY1lEZmFIUE5PTXB6UWNtZ1orSXdEdEdUTVc2NC8zNmlpbFRrek02Sjda?=
 =?utf-8?B?WTFadUxlNmdIeElZOWtyMFQwNXIwR0IraDRlUWtWRC95T1VBblpOaExQZDc4?=
 =?utf-8?B?TFBaUkEwWFRKeG8vVXJhT0xuZVlSMFFaYWFObGlWV1F6RkhHNUh0amM2QTNq?=
 =?utf-8?B?MWQ4MlV1TTgvckJKTVNsamJuaGJHQTd4VDN2Q3BFTnkzS3MyM0RLRksvK2pR?=
 =?utf-8?B?bjArRVZSM2lOazVzeWtrOEhVcW5uRmttVzlLQ3pDSlF2QVZiLzlzTDVoOXQy?=
 =?utf-8?B?UnRHTWZleVhyeEtCMWphMXVZd3lrUzBwYmpNMjBIVmgrQ3MxU1lsQ0ZBM1ln?=
 =?utf-8?B?NWVxQnFQUUYwZHAzUnZNblV4R293bkV2YnI2VGJpRE9pWmlpSGlXaDZUS2Z1?=
 =?utf-8?B?UXZrQmc1aEI5RStiZ1RMeDdCWGhQQldkbS9adDU0Y2dOcGxCM3NNSHNoY3pF?=
 =?utf-8?B?MmJ6Rmx5bzRSRFpNd3lpZ1FoYXIvdDlUOXN6ZXJDb2NSVkt2R01IUjI5eG1G?=
 =?utf-8?B?TVVEUFB4VDU5RFpBM3F1TU1vQnZLWUhoRmlkbndPNmhBR0VMWTlLaVRFZ3ZE?=
 =?utf-8?B?ZXZRTDVaaUJaMit0NUlDQWd5VC9xdlc0b1BWRFhSQjJGcVRFZGpxcHFEbVI2?=
 =?utf-8?B?bTFQbXJ0bHN4NVV5NFg5RmdmWmpZMHErazFDQ0x0RVR4SlRVYldoQUNrS3lK?=
 =?utf-8?B?SVM2M0svSlVIc0lZdm9KM2w2UmJLVmhnWllqMThIQU9EbmZOMHdCODdkZ2w5?=
 =?utf-8?B?cDJmSWs0VEhnZy9DRi9lVU1mNlg0KzZQVkNqSEFlSVlkS1JaS0VDUHNRSlc4?=
 =?utf-8?B?ZlFZbFBZbGN3NXhVNnFmTWIwbFh0eGxicW1uVDlva096MVNrYm4xR1VTNGQz?=
 =?utf-8?B?V0xGU2NkaS9EcGUrS1pwWU4xSVVtZkF1blF3dmtEbWdjR2sxUHFENUZ6clM0?=
 =?utf-8?B?a01MaWdFV0UrK3lmWGI0YVFJWHVmREVUV0hiRm13ZmdnWmVHUllkZXdPRS9K?=
 =?utf-8?Q?iHiqgPuGbe7kjCfY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d8d964-5aec-4a57-b897-08deb76d66e4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:16:03.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgKlD3uYfy5PYylKfFYmuiCbBedJKcZ/7xxjWcJVu2Wuj461EVPR+ZZG/wGCCViGluzmqKaT1YG21o2XOqWzCzTGacRLlZiBpWgElyUWmolRHCugptdXaE166XrIHEqD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

From: Frank Li <Frank.Li@nxp.com>

Add bus-type (MEDIA_BUS_TYPE_PARALLEL) for ov5642/ov5640. i.MX53 and
i.MX6UL only supports parallel csi interface. Fix below CHECK_DTBS
warnings:
  arm/boot/dts/nxp/imx/imx53-smd.dtb: ov5642@3c (ovti,ov5642): port:endpoint: 'bus-type' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts         | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index a1e19f9709b2c..8c02731c7ba9d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include "imx53.dtsi"
 
 / {
@@ -314,6 +315,7 @@ camera: ov5642@3c {
 		port {
 			ov5642_to_ipu_csi0: endpoint {
 				remote-endpoint = <&ipu_csi0_from_parallel_sensor>;
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 				bus-width = <8>;
 				hsync-active = <1>;
 				vsync-active = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index 3d147b160ecf1..32afe4130e211 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -217,6 +217,7 @@ camera@3c {
 		port {
 			ov5640_to_parallel: endpoint {
 				remote-endpoint = <&parallel_from_ov5640>;
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 				bus-width = <8>;
 				data-shift = <2>; /* lines 9:2 are used */
 				hsync-active = <0>;

-- 
2.43.0

