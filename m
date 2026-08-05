Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4D47FAF2
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945512; cv=fail; b=lZzD0hb88oRAg8FBh0z2i9L7DdvlC//yIdvesIGunPyvbs87VFXJ/WCGLx9d5SKLrJXKBmp+VGTVrYRAU+B3ww9TY7zy4HjsE5fYXU8ZwpF7C8gFL56l7ccjllBFe9hhwqat0LEmIDE15JnhaTud8VBGvWOsyxxyxxKo7t53kcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945512; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hF8GhUu2k3jJmc0vFCVQe1ibYrdmIBN7V/vF2/ZQxDFuiSM4j0N3xmmF2D/S3uMqNs9R4Txtm1ihqJ9pVDlFgF8Xvi8gW6cWy/PhruwAHtDuUTovs/XHP1NNN5HQKMs7Rxnc9KOSsrONEQHiswzwB0l6qQfJvP/VFJjq0Dw1v2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mGDSdvP6; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mGDSdvP6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daY+T+C4EMSA5GCjMsIREbHjcirBTjoTQSxED5kpTgyFsZtXmuoqo8fp9mGy+tqJTI7xxcHNdutkjHmsdatVl7w+1l7j2xgHpTaNSwW0YiOB5Yl8pheH4bLQ+7lQkW5nYeRHD98QFVlBW5SIvZAw2Mcrs2lr3k2gmrHujeAmZmqFFjT1ZJcJcmLwRV5F0QOlJa5pTvjZ2Fi16SlDbYYVhO2TmHn53AAgiXNXQCSMejDshUx5ojZYxEogh//Dt2BqhvQanAPc7FaSi3nrXyr+Y4Cn6/7aYxbnECWAX9oTe8aNKiLUnjmVdqpOLY1VHsm8PihyICXn2dx8Z5ZCMUwSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=Tmg3qY1Lh0mWGnroUVYJFIrAPa+deKGr3/ZG2FpLoZ61llhjDfsreEyF7Xi38yp05cXGYBU3MWZOBYYroX7I0nAwC+WpvxjueoPdO1Scxgdd7gBNtpwpxhZuzgmyPYxC7b9KQ2+n9LnpqxkakNNrYK9KqKK5SNZCAWu53oeusQ8Lf9oz/4uXzD2WXYaUSVQwqYpd1ltiSKuTA5fgwqH+60Utb8GE6BO4UjBb/CFqx5hH5ZptEGuwRZNgmxXglJJ63I0utix8ACNYygiN6D3N8WHVMpi1bt513v+IGLeOrkO1kM9wxrVZgRJl+oabOzgf7iNWDGKlvNi4i1D3DIwSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=mGDSdvP6fVMCbyr7UaNrQyPiAuBLTEIU3YbgNdtdGq9JV7Qimfrlv57h3b+whyyjv3F6rc5NEtVm8NH+tpUp1Qosb/hNBHeNwJQ8u9rmTanI47YJWlP+gslWzFJew2AJt+XVoaDOr9DWDkRSjr0eM7C5TUf/2mqmWODVII23XRjuKnQYz975rGu6fnmQocdoEY47r64+w74yTfXhF1GF7PmOZzAYMFk5dNI/EtThaWU1gHqyqJUXi/LIw2miGchkkP35QgxOEpFtyI55hzGeRtTrIDgXZkR35KM/EHjLop23IU2JeS2pdbV/1JMqkYkKBHwIAkmS8XHtk/Dfc027wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 15:58:24 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 15:58:24 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 22:18:31 +0530
Subject: [PATCH v34 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v34-1-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
In-Reply-To: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785948512; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=IOgdcxuIJA9uQt+B6h1V4MnYBX5n4r6MJJwp0zmoVH02UD8CZYHhN5AvUTV+sM7MylvfHBs/f
 gPNl5SG7hIoDWCsm4Pb0fxXwYM3Sn5ytSTcADcpkXjphdLFwTvOXttz
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d227623-72ba-4fbc-48fd-08def30a5bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|921020|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+Pucn/YIdKzr+9Uk9n21epGDbhqvt69F+o0li5CXDnj8SC67g9nPIB1AzAy7g1sAmBiHD+1E6go2FpKLbDvxRgkERYMuTodkHxfLNshX6DhYvctMETdMRGeWthfYfBQ1FXuXf2o7UlTBwZMZDBmUkZUHQOrFD/ir5cRnRYwUk3i359rb+pxTrCkq8azRSLaECpYKn+Zd/TL4L1AmUsI9WKe1xFKR+AQFD5sFT3bDJt2id+O6S0q1BPEDZkAHHIZN6jgGDdnyN7vZ+ZpxHm2S3sNRJs6/uIxoX4sWMljPvcBuooWpyDimyZCxKwWIZi1xEgDFOael5BHj1TYsG6y/UD41qpuh5Ci+L1qH3kswr3PzClqLnY7QLcrDvGh6qRU23Uu+cbvB4Ijt8dkSSOLLc6cgvsjPPiHm8xP7O8GZ4Btrh7rh8aVhF1rOkoDjuB5SmfGe6P4xR7vIgPsNB7y/f8Y61R/w7T5ozvXxtPpW3K8HWSsw6dOHZs24aUfXtW6Bj1tKZHhCTos501VNQRnr/vWl2efnIB+Ptlq6Rifx7AnqlDbuj0+7SoQtMse2OryCqqIM4BDwHUrvxhJe3zUQzroPyKbm1/ViuLemfuY1Ds46L/MvBSYCSnDJVBCpclSSILfLIJ1mEW9C/PJ+hqWKSPZF8qKDHJ8mjvCDDJsuuzdj9vqLHZeio4YoJOKxBDz1bk+sg34JBBdls1olfIO7ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFU0cnRYRVdwM0diZEtIN2lqa1JUMmZmelp0elplaXZqWDl3WlNXeXhGYTFa?=
 =?utf-8?B?SHk1OTdhNXE0Y3NZV2IzckdVM3lHd08xeENZdURYQThJRmtUMy9oZ09Rc1lS?=
 =?utf-8?B?Ty9vck5jZHlnVnF5OFNPb3dGbjEvY05wQ1d6QU1ZOU5KVTlKdGVNMFNhUGVa?=
 =?utf-8?B?VUlQQ1N1YXpQeHZZMXUyZU5XdGJ6T0kvczVRWUNUQThCdFF0M3hCamkwd0tQ?=
 =?utf-8?B?YlY4aHE4ZFFKcW1wOGdjSnNWeDJSbURhZ0NDcHg0Zyt5YmErcW96RUNpR2N2?=
 =?utf-8?B?c1BsMktMbnlYUjROaGlhUml3MHR2anY2eGl5R05OYktOZ0J1OGx3b1RCYkNj?=
 =?utf-8?B?em1QeENsZ2gyRVN0TEN2bExhS0RodmFxQzVYd1FxK29ERHA5YjMrUVB2cHRz?=
 =?utf-8?B?amR2Y1VJMUlVdFhMVmsyNWlWYzN1aG9NV2R2NXcxZm1lM1RueUNUbEZaNEZS?=
 =?utf-8?B?dG5jd2x0VTdnRE8zbkVHUXFaMXkxeVhOOS9zVnZmVDM4UXF1aTVzWWVLVDZG?=
 =?utf-8?B?emFzeTRIQ25nOEFQekZoS2FHMjB5T3phcWJiMDRJRFgvSFFIVDFqODRTb3ZN?=
 =?utf-8?B?eXNWR0xvb2YrQ09Pa2xRZGo1NlZhOVI1RHV3T1R5UExVV1J3azZhTURUbWo4?=
 =?utf-8?B?Z1B1SWw2a29SZkk3b3VmZ2svcnVOc2JtKytFWllTMkNQVTRnRHpHS0VvZkFl?=
 =?utf-8?B?VzFYMVNuajV0ZEppUFdBTStGTEo0L1pOZTRrYmRyMEJwT2VIWnNneVAvOHdn?=
 =?utf-8?B?QTA0NGR2d3F4NDEydnMrblNoN29HQ2tqQVgyWHJJLy9VZnJieElzbmpyYndP?=
 =?utf-8?B?Vkl3TnFBVFB5NkxDaG4zRERoTnVPandtSFExUkRCaUhxNmZ2L2NDY2ZkRFVJ?=
 =?utf-8?B?cXp0NnpYOGVybm1mMCtBdEhBeTlNcnZaSDkrSkswZzNETHk0aGRPTnVsVkw3?=
 =?utf-8?B?M0Q4bmdyOTMxc1Jnay9EOHNYMklkYTNaR2hYQUgrODV3eHJtTW4rRVlGMFNK?=
 =?utf-8?B?TVIyQS9xRVRSWEQyTHkya1pMV0U1ZE5Oa09NaFZqQVJVK1BRN2V0Wk1BbERx?=
 =?utf-8?B?VjFMa2RQUTBWNHpXTGNJdDhWZ2V2ZFhMemFKdEZ2cFJGVjFpWnIraXIwOGMw?=
 =?utf-8?B?amRQNlZ4R3RuU2NKZXF0Tk9vZDVTaW9zcDcvSkdIWFdLUFUxZjI2VEVWdTJ0?=
 =?utf-8?B?NjZ4UE1VeXhpai9LYnd2OWlNb05sMFhpVVcvbXcva1BHR09MZXZ1UnhZRDQ4?=
 =?utf-8?B?Q3FyWjBRdy9ZVnBieWtjUGlDM2ZDRTRQWXNNeER3S2lHbEJaNFRhRmtBUEJw?=
 =?utf-8?B?OVNxMlR1Q01EclJwdnBsVjhsWnFXYVpud0lmVk1XbWZPUE5oemJ5bHhEYnJh?=
 =?utf-8?B?RDh3NmU0RTh2RDNIL3RMZWN3cHprS0dvWEpObldoNmFRQTB5ZVM4YW81WXIz?=
 =?utf-8?B?M1d6WlRtWE0vYVhMWTF2Y1o5QUp6TDBEM0NjQ2Y2YkhIZGpOclB4eCs4OGNw?=
 =?utf-8?B?d0k1TTREazZPejdSSnIvRW9CY0czOTJQdmlSbVptSXRUdEQzMFNuQlEyRnMw?=
 =?utf-8?B?b01YaUNzL2ZOcmxKd2Q0RFVxbTVVam1mYU55QVhXcFR3SzZ6cGh5RlNuZnhO?=
 =?utf-8?B?NWlBZkpHN1pMSUxUbm9qRVlodHZGNUtaSUJRNmQrUVZhQVFqNC9UUXZmMk94?=
 =?utf-8?B?TW1IeHRvcHcvMHJCem81TmN6MVZaTUd6M0lvSkgvb2xrT0VwUEJHREhKb25v?=
 =?utf-8?B?bW5jWE45eE5PdkFBQlVkTUF0Z2tScGJrWWx4UzJMZ1hoak12RnJNZjZDT3E4?=
 =?utf-8?B?Zk9kWVJ4KzVtL2Y4Z0NOcWs0QVg3UCtlcGJIUUIyVE5VckZsY29NdHlCd1hr?=
 =?utf-8?B?dkNTT25kdnNJSms1Y3M1UVVOdU41c1owZHA2emNqelpVVGRlVGV2Q0pZdTNO?=
 =?utf-8?B?bDdiZEJ0dE1JN3ZtRTBseSs5ak9JQUtOQUFoVGxEMk5jTHpTWG5ESXByUXly?=
 =?utf-8?B?M09YT21YTUlUdzhXY2N6MXBXeFoxNUt6bktlOFFyQ3ZuQ3M0dmlVYnZscHdm?=
 =?utf-8?B?VUc1R28xMS9iVnRuWDI3RUo2VU43NktaSVlxUGJoUUNPb2hkcFVLTjhwdFlE?=
 =?utf-8?B?L0VCTHl1SlAxc21NT1N2RXFMQ0NPRnhsTEZmYWl3SWUzc2hGTit2SFZzRWNX?=
 =?utf-8?B?ZVdxV2lqVGs0dE8zc3lBYjF6K1R1b3VKVlkxanJtQjFtc2RkKy9zTkk5OUo5?=
 =?utf-8?B?ODAyWUxLTisvazd3K1JjVjNyTDllZitXKzVTaWZrMzJ5bHJKaUx0bmdxZEU1?=
 =?utf-8?B?b3krMkJjT0JVL05SZXI0dGNBVXBycGh6eFFkdkxnbmhJczNKdzhvcElYaG16?=
 =?utf-8?Q?s/H8SWzLui4r1FTVXmxI7BbRa/Vz+T72zv3oO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d227623-72ba-4fbc-48fd-08def30a5bde
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:58:24.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l68hLq4MZnbskujXmfdWeLnuzt0k3NmE8XtcvFh8h4Bu+mhNx53ZAD4naaf6Ktx4LH5dujFK51e7F/a7ClzEKEOwm9SMDTKOxKUwB72durRvUaTRHidkgkk4sLUrAiWi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

