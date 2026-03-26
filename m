Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573934D4DC
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510112; cv=fail; b=D5ezCOaEe5Mwi48K7aFdgrDbf1HnMWmNQkZjvzw3hjgSTf49njMKoQOsATYFqDwOAmZsxuL62TlJC+c6+v+ACLFRSlDnSFXk5PiTQ1ZbznqV2XbVI4ySw2iZQaatP9kE/SrVTAwMmQWrnLY6NvPbyoOnlNbZN0cIK35y9wEFir8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510112; c=relaxed/simple;
	bh=KrvQv7J1MwxMhDgjjRcbPCWOg9779OE2eiTHZOlKp58=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=itemiauhqIu59a/SYVp2O9hGAYF80w4dJKJOFNFgtAX03ujY2nPNo5McCef+I89zZMq8PdYVuReR4c8lbWhuwtDgZmciL5V3FRFPHfCMMay5vz+UDKvPtDs8a915ALW+WCFiDlV//8uq7syqCPwNFZ4kukaYoAs5xWk4OBkRAyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r2RwFlZX; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r2RwFlZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCLQ5GnCXnMhB537Bitkuyoh5D++AWixEUMIGkChdwJN1lKRnay1ZDWgo5HbR+F07zqsKkcUSvHmuvg2puqyJhyQL47rWoKs2FDx/5fmrp/saZ6KgQmckldj/aYgXklMzl+P9OTFXteVUGv6jhtQRzR6rsSBXdeOm4kQDhOPJoUU77QJ1ooe4aS5nTkx3/ujglKNP7XaAdUhOypF5qRt4rlhgu5gthHX8qFbdDyZ4noCCrSQYzqt5GYcs+CRaXjSet3mnRkd67yDK/iD5qEDvJ3m8VLOoo4FMQ5MFVz+Zrs11pgHtvJyRFHCyjshHbulJ7VKJNHbKeSss9nnxUY4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfWNdTzLa7yKkRp8dTEMmMurXvr8jpXm1V0HzThjuB0=;
 b=eZ94VZOWz5nMuTdAw4cWQw6z7HePVlXBPzoN0nTIn2ayKTWc0d8ix3UPUQaB3lCD9ABVjcCOFZw6APZrr4QrCi5HZtVa6QY/PNVJW1xg9+W5V5JQhH0e2i4vx42KYHB2y5Io/yGj/ykzHd/WHzrfO7zvrE1tHdpwgVW4l+rz3RDrpiXLLlULLRcQq2hPG0yqYuAY2oEuBjrKGXIrjp5m6jlRFFUSAAb0gmPd3FUZMD0Sc04PZy1YaQZTTwGMcOotJVBi358r9+20ZUjvhq1ds8+t8vFP2XloR5oCXezHewKasUj3Li8+rX+NaMUxRyrtGMpH10MHorz9vn+gSV6AwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfWNdTzLa7yKkRp8dTEMmMurXvr8jpXm1V0HzThjuB0=;
 b=r2RwFlZX5H1qErezqPJfbzzU9diA/9Yga7MEW64EByLkBRgP2vW7QZbDku6CLqzanPlMe72tT4hD4SJcLhfrGABBPJYgiApCfrhI9msB7YglcXI3Nw+qV5yX9bz/eFAQ2KVG9PLRohKqs+/5sL1NGTsdL34RxR0CIcHxF69QnP2MUtQSeCRwI3btwkSbeBWf7l8m0VgFvXu8TiJpuUw8hi6EkjRCerrdJXuYF56PyZJ/3HvEyCaw4tg3l9L54mLYFtGlBqLema4I1mFI2MGWuDVnvgTL9qvYF84PGw8YlXM1mkZnohFoO2gZ7Vin9tbqP31IEcfLmDtrfSOaByp0jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB9209.eurprd04.prod.outlook.com (2603:10a6:10:2f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:28:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:27:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:15 +0800
Subject: [PATCH v2 11/12] arm64: dts: imx8mp-dhcom-som: Correct PAD
 settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-11-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: a0317925-f60e-4592-1f39-08de8b09342e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|921020|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 /voo6gE5YhuF6GvDOWs7QZtvlMNReVlfVClwqeYcuCOruoSGVUcNmgUP0AtZ55Z1+nkCRTXi7PPX148DSgjPQnxhADzbycKvBzVk6H/tGKgoLYmlqx2Ylqmv8dleM4JL0424StoY12dzkoi516cQub8uYs7fj+cE3J8WmwWJ6zJpIgNnNnrfhmvSmB0rTyuTCOpdDHJK42I/f04unIvyISYjY+1D2sVrZSx8MvMN8cFOkMviF7NNMmrj87G405eWrTPN52M2zVUkX4BM0k/Q7c+6PxJFGfka1w6tsPnLmtKKjA5hyVCnJ1HMpN8RNjg7JajkgVDUkscReCzIEIB7lBNgeVH8Y7q/3ob4YPFP28cilqTdN84pSZJRot8GQg8mZzgYocM4LQysAR38FTDLmy288UqOHIDWY68Ff3WPLzE/r2xlcDJSDdqBct4KPoN6Le9UytvwBRh+r5+Rhfk6bFWA5eAt74g0Q78udy7RAUU/XE6G7oaGknYQVDiVJ7XHZsNS3KMQDniqE45kIGOu31iNHvMHc1MkDxxlLIcgkIsDmPVBT+mqzCtA9ToLV/wHgvZzzAyQ/eMaUByD19kZ4dwnoy0bVCscocL6GDZNeZmc06RqLWX5rmquO5pptr2qbqQjuGvhXkzzLAfGC4VozI2Vvyegj4GQvhl5d0Z/EnfWKDHhjTNRdy8A8bAlV8Q5BZOXnsAOBcJH8yvYAdwyFU8u9yqB4O2s6pGOOyKj+voxJzhGIv0nAPoQ5YXfcC1Ui5jL5AWP9a64T74KZa/ujQLzp+rFWb6CT1HGet5S0cBBQ0w2bOVsluNoI1fnE20b
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QU40WTFKSFRUM1FETEw1bjRCMDdVR3Y1bzdlUkpSR2NDblJtUGlqREJUWnpU?=
 =?utf-8?B?amhhd0N1azZVeElXbkk0RExPUkJJOFNkSDg4UUVvVk9MSEhURGQySlFRQW4x?=
 =?utf-8?B?SDJDVE5YVE9uVTZ2UmlNVkttQWd6R3lScnNFNTFnR2VrcU1QaEZGUTRLNmJQ?=
 =?utf-8?B?bzRIUi9iWmVUamdESXlocmdwQlFlb29HWkRyNzhXSlpQa09KeXVCeUFaby9G?=
 =?utf-8?B?UlZkRG1EYWxTNG8ranBjOVFwU1YzaytTOWp2VzJSK05qMVRrcCtwSDZtaWV3?=
 =?utf-8?B?aktWTXpTWHkrcFZHMUtrZ2FTbjJ1STAxQzBEaUovalR3ZDhUUElkTi9yUHQr?=
 =?utf-8?B?RG5rNGJ0d25rc0NlMlFTT0FzUHNPcHR0T2Eyei9pZzVRdFNXa2xyeFkvb1pW?=
 =?utf-8?B?QS9IbVlpcis2Q09vUm81eFVYYllaTllDZGN3YkJCUy8rSEpaOU44ak45Tk9U?=
 =?utf-8?B?bDA2dlJ2OStBUFFzUEgwYjBaUGZEWHplYWxPME5QVHVJUk5WeEdjSkVPaU10?=
 =?utf-8?B?MjFYcnRyTkZBY3BmcEx4WkdycjkyNDREUG9TcHEwR1lLVkVmOWxsQk5vSGx3?=
 =?utf-8?B?c3pDZFhjL3VLZnFQaXpnUGlNdW1zVzZLMFdVbWZOUzNjaWNRS2w1NkJ2bHo5?=
 =?utf-8?B?S1A5eXp1TFl6cG1XOHN1YjFRTDFhSWV3cFZsRElXbUlGY1JuK1BDbk00Zkcv?=
 =?utf-8?B?bGhhUzVvRWxxODRqUHJtaUxValJlK3VNOWJsbDU3dzdYbXNXS0FZeTNYQ1JU?=
 =?utf-8?B?aXRxd2UwaHRzaHdKWGUwTWUvZFVEcVZMVjkyMUVHVlBwbllNNklzSWNKRFdq?=
 =?utf-8?B?T3M3em95QnlORHZCMEFnQzVIVFJ0MU9VeldYYWJNa2lCcnYyRHUyRGs0OVN2?=
 =?utf-8?B?bk5WNjFNQThROU1wcnRwVExpdCtEYTZ6RGlvZnNrMnRLNmpxWWZwWkVMVHJH?=
 =?utf-8?B?cjNLbGN5UEpERExLaDF0U0Y5MU5oRzhoRCtVWG5mYXQ1L0JldVU2SmNLOVNH?=
 =?utf-8?B?RlkzSXdzQUNaWThBeVlaVERsdnBHOUdPbGNwY09RdzVOQXlQRmd6cDZDT1lv?=
 =?utf-8?B?Q0F5ek93U252VEUrY1Y0QU5HR1RWMEF1RTBCQUdXTW40bFZTT2E5UWlmMkZo?=
 =?utf-8?B?REhseEF4WERIaDRycTdGYjkzc3dCZU4vUUs2c3VRMWttalhDZytEN3V1SHNv?=
 =?utf-8?B?MDFhaSs0MTV5MWZ0cTJyWEFjMExabGR6Tk5qZlFKanNPMkx4Z2pNWXc3UEtu?=
 =?utf-8?B?eGdwSG5ZM3ZaNHJqQ2xLdTh5eURwOWtpRk1XenZrTWpaZ3Q4NG1Ra2dJd3ZL?=
 =?utf-8?B?SUEwN1hHTVBVM0w5MkRWSnRKRjdLMXJVU2xldExwK3Y0WlpjU3QxWGJYUis3?=
 =?utf-8?B?U29JNThCN01qVlhZN3lLWGFlcGVQVlkwblJ0NnpUMFB0dlRycUJ2UVhlUi9E?=
 =?utf-8?B?T0lLU3VaYUgxQTBwSHpUSWthcDErWk1Ock0xSWVIVmsyeWV6dUpTU2l3ZjRu?=
 =?utf-8?B?NUdmbTBQYnd6VHhtMEkzTnp1eWRxeXZ2QlZkdmJ6eVNUWmRtTDR4UTE1V1JT?=
 =?utf-8?B?SkhYSE5sWXk1QURzbFk0SWZ4NnI0YVh4bXBPOUV4VlpLTW1NZkhNRUU5NVZr?=
 =?utf-8?B?Z1NCNjllcTY0bUgwZ3VXbE80YXNOQXNqeDUyOFZPTjhZUGdYQXdBZW9sKzBC?=
 =?utf-8?B?cnY5dDFCRFNKN0hVbS8zUUovY2x3NkhiYjBuOUwyK1VuWVMrSUhRL21YM0U3?=
 =?utf-8?B?M2Zzd1o2YVhRU3dqVmFCVGQxa1puZ05yUEZ0b0dXTVFlZE1BZDdWTjhYdUFu?=
 =?utf-8?B?clg0UGxYQmkwaXBkRXZKN2ZPOENTSWx3TTF5UWRpUStqVm5lcGNKaWhmRzRT?=
 =?utf-8?B?TzVTSXZLdU5xMWxEU0xqYzJrdVNpb2dFamxPcmQwSzhUdDdrRnFRNStBQVNJ?=
 =?utf-8?B?TDQ1S2UvREFlUnNKU2psaVZOUHBaSW9pYkpCcmdVSnVRWnEweGZEWDc2UjZO?=
 =?utf-8?B?QnlWRWtnNjJHVlp2S21pUDEranRiRUJtWlJmTkc4RjdpaW5ZSzJIa2xqQ2VM?=
 =?utf-8?B?WHpGMTRGSTg1dG10WTcvYXg0SWx3OVdMUE5ndU1uMWJuTFVDOFR6UzRoZFNT?=
 =?utf-8?B?T1F3SHc5d1YrUzMySmdNZzhsSjBseTBMdFRsRDJSQVRHTkZJSnlhVjZCbW5t?=
 =?utf-8?B?VFREWVJIbi9Jc3BMcit6eTQyRXphZUwvSThxeU1xVkN6a05LRmlNbndmRXZF?=
 =?utf-8?B?Nko5dlZlK0tmdGw1eHNQdm5SL2VrNFY4Z1NiVkw3TnFlbm0yZUNsRmR6RjlR?=
 =?utf-8?B?UlgrMy9PSHZNUlFuUXNVQUhlT2w4SXVEZUMyU2hsdTNSTkJJaGwxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0317925-f60e-4592-1f39-08de8b09342e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:58.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qqayU4w8775P5GQhpSVFkpshFS5AKGoZgmPOVasHwkKWEta/yUWWvPnNgGBXRnZmS9crv+WNkfou3N3OfmqGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9209

From: Peng Fan <peng.fan@nxp.com>

PMIC_nINT is low level triggered, but the current PAD settings is
PE=0,PUE=0,FSEL_1_FAST_SLEW_RATE=1,SION=1. So PAD needs to be configured
as PULL UP with PULL Enable, no need SION. Correct it.

Fixes: 8d6712695bc8e ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index f8303b7e2bd22b9529d5f3063894d1cdd5556d59..0a6a60670f762f1400653d1e7d0f4c0fcaf6bcd4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -989,7 +989,7 @@ MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20		0x22
 	pinctrl_pmic: dhcom-pmic-grp {
 		fsl,pins = <
 			/* PMIC_nINT */
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40000090
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 

-- 
2.37.1

