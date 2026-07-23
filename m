Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B0649690C
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811399; cv=fail; b=N6mOb1yjdzWs4HQ4MUnS8YfKkUKPhEJmCzgORLDWBWmmTfK99iNPX9aL5XE3DWZA+4vGSinArTIquySX4P64DCHY76Gnn0+URDfXLWhzF48EjmoVnH+XvTP3IGKubtpaWgviHsfQ+0bkOEybP+h4zo64I8z49x3XOHCwL4DxxuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811399; c=relaxed/simple;
	bh=RnSvz1yL4t8Gth1D0ed0xyKnOZpCZ4y/9q+SGa7vGms=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=E4yW/jLRoG2w0JNiQh+8CdXV9Cjb0c3qCJqt3J8Qk614xcVI7f9lAn2gQn3DUTJAaBqL+LWnVkaEFLOpEi01D9P/RMfikf12X48VKry/4HSUONz5AImMj6PS4Tz9+vFJ/ywhF5feq1CPJZyCMgDiGCyVFJCIey7v5Pnk00+v3JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LZTwYFX9; arc=fail smtp.client-ip=52.101.70.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LZTwYFX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQnxS21SZ2g/Q6ghwiYZp4Kil2BzquXsMg7shotujIx0qYsm83OPOi36dbOPPEkiDU2wNDbymNrzdDR4ehNCZOn5P/lcVgFuefXTRBs7S+51j9yrbxkhNCEMeZUbMaiHbavMsOdXQBxgMJ4W3oB8I+pzWQwz9aoMW2Ryd9bvsiDrLsUpVL6eNZl5Rq7Kmd5KnaDX2h7/wCUWNkjwxTe9brzhVJ+zI/mTxkD4NqEwdvLiEghGDNhy5u786r/rffGlHEzdTDym22jBgVpVRw3lLD5uS7JsPvIrKfhXOvXf5Ou8b4FihdnMQ2FToue61kmj5oOXxrgHlcZ1VmX/o0tF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E94jyqysr2OD9t7/1JRlxPhMV4SQMT2NhJpB/oiQ3cs=;
 b=lRrHXiSxhn5cEeTcz9QtBVkPTG23h3AQjGWNT7fvMBGBJINp48bB6OrL6qCEWOSNOcipewV+Ka65PJWq6wvdXi0CscB+jKtLzudmQyXz4SAkQ1ZOBTeSGNg8/0mfzPt3Dji0bEE47kmmx9G7HvkUY+fY6lYBz8YIHfNVxD+l0Ks8ckbxH3j1rBbIkfnN6vFHO8IypRhN6ZcTKjUmHMN2lT6erv7FrS0dqZrB+8Xwz+E0ErNmQSyfUJ5gsU957Tv65ugAVGsBaS74dZKtWIIxgViwuWMuGy5FcOGicjkDRdDN9I6DpPzZelZ8ML68nLRCMLbitAIHnG7WSeCxo5T16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E94jyqysr2OD9t7/1JRlxPhMV4SQMT2NhJpB/oiQ3cs=;
 b=LZTwYFX9l0S5uri7v944ISDbCIt/H2cEQzOTXAmhp0ZurWZLze2Js7ElilrdQrL8Cnwf5ge23rkyScRVfGDh8QK59UgfG1qtZGYknOVOZw/o+YFWGKe3gUDBEOHWbTM/HxitIc9Rmh47tVUqkD3kE2MjD4iqJ7F18obNkIezB4x6a/z7eocSkqMksLrlUTnjQoRaTAcfqrzZaJIRsKvVrpFifP4JcoEL9e+szVx9UWyVyziCGD+TNzub3H8OrjL3W3hnpSED5apf4p5jxyWx+73QubpjeqhNJfbTScaXV9waMo6iWarhdf7zkA5UOajN1fS25Jv041WpsJnKdpB5hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11446.eurprd04.prod.outlook.com (2603:10a6:150:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 12:56:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 12:56:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/4] arm64: dts: freescale: Add remoteproc support for
 i.MX EVKs
Date: Thu, 23 Jul 2026 21:00:02 +0800
Message-Id: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIQYmoC/3WNyw6CMBBFf4XM2jGlpgVd8R+GhX0gY0LbtEgwp
 P9uwbXLk5x77gbJRrIJbtUG0S6UyLsC/FSBHh/uaZFMYeCMS9bUAmlaMYboNZo5odRNO7RcCj5
 coWxCtAOtR+/e/zi91cvqeY/sxkhp9vFzHC717v1rLzUyNIwr0V60YI3q3BrO2k/Q55y/2Je5A
 7oAAAA=
X-Change-ID: 20260715-imx-rproc-dts-6c78f82652f9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Biwen Li <biwen.li@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0320.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11446:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d66bb0-3b96-42f0-edfc-08dee8b9d1ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O0zcaRzw916gkGbe3tuy3nVQ4f+kTDznb97fSxbn3eVTT55TpS2DBlyo/1MDCxOvvefOgQB8ulhgi5gIAxdezA/4xISWVVuaJ1elvTFU0fBW0Or3BAfqry6PlgHgO0jL3eGgce3J6Z70G8RH3SmPoGjRH7RZSHWFhDNs/6K5pxjLTCU30Hqa6lTbQT8uTn1Rw31WtX1BEsU/3l2AFLbCF7iAN/hYrGMhmSduU6F18kRt3ou6b8xRttZhN3H/lcgr4CTPzKIBPrQ2MT7t1zy1C8ePUsx2LwBuAv99ehTYMU6yp8wscZz72bMPp8RqprW9yVqW/NzP2gsjxyxgc5lGPYgYtVd0TfeAxJi5xTFLN4jBPt7WZolbYjdQraOfXyDK5GuqLAsEHbrWa5Z2M+eB+4AwOQ9zMXWuBg2V9LUsexMP+KFDQtqd14K/T1/MqiNvH+dBOW/vuqvMJHBqrCXBthMEE6uz/byDLx2vGcv7O1jMBo9xsB6keVv/roFDd6FTF0faK22ZoLj7aQug/1344rosGB1B1KkQZDXxKsMQJfI3x50y2riHA3vlu8ZLDuG76zXTg9yasTHXXt6s2r6W8It85qLR5QE18NTZXptfDw7yH/nGmT7kFDTGhe2XEEfm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFpvOUJJMWNkeXU5c1ZwOGQvejc3WTJuR1MyTTd2bzA5dlJWZkx1RFFtOExh?=
 =?utf-8?B?WFo4dTViL1d2MHJKUm5ZanFYQWQ2Vys4ZllIY1B5WDRqTDVINnpVNDBKZ3V4?=
 =?utf-8?B?VWtvdlZHL3Mrbm43Z2ExWmZTaG1LR0NXWXRUOXdvdVRoTGhuZDZqdnV0MVR3?=
 =?utf-8?B?US9aY3lCdVB3OUxsbUlmTk9RakFTd3ZZOStZeU9DK040WWN0RFR0YW9uWFhq?=
 =?utf-8?B?MlNkWEpmaXpYSWVsRitkalI0UGt0dXlWNGhXMWM2enprTVhFQ09PbGI1YnZY?=
 =?utf-8?B?eUVIQVdQK1ZjcmRIemxoaEZCdWZLUnBDWC96M3F1QVRvQkJqVDA3TFJoQ211?=
 =?utf-8?B?Zjh4L29VNUVwODVLVXlKdkpwRmdZeUpZakRESU0xK3FoZmk3Q1F6cUpyMzI5?=
 =?utf-8?B?ekt1TjVsNTVrK09nMnZ2ME96c0p6UlAzSjJ5ZzJRUjNHYSt2ZE5Nbk9ZejhF?=
 =?utf-8?B?dmt6ZXMwemxJVEEvcjU4UkNvcElSTUZpd3hXNEE2emlNSVJHN1lQYTJxd3RT?=
 =?utf-8?B?REpPbUtJRnRtd3N1UTZkc3QvUjIxRVhkdzVQTGFKLzN5dExqSlpUdHhlSXhU?=
 =?utf-8?B?emgybnJXbDVkQ0E3bHh6TmJtVGtudm1MMDh4WlNBSzBIM0dHTFRYZ1BvMjdI?=
 =?utf-8?B?V1NTbCtPWmlNenZZOHRSdHZJNnhKdHNZNVowQlRtTXU2ZEI5UUthN2VrSzkz?=
 =?utf-8?B?UWpVc1RlOGppU2tCb1dBQ3VJR1NlVFl6aFNacEdlczY5T0ZpVFVzUFRWSVRs?=
 =?utf-8?B?eFBJRXg5NjJmWlpGNmRCTGVVL3EvakZ1NzQ4UHFVLzZ3bWdXRlFYNm5QWkZU?=
 =?utf-8?B?UW5sbUlmYkQ1dlZrNS9xcHptTGlMVjRBRk5HRGRkUDg3TFJZTzk3azB0dGl1?=
 =?utf-8?B?dG83U3pCQlh4QWlmdVE4Y2E0Q2xHa1BNVEE4V1lXTFI3WTJPdGE1TWJIbEUz?=
 =?utf-8?B?WGpwS0x0SStYem9sNkZEOW4zS3J5KzRMR3BUWTJ1MFVxdTc1VGg1dlZYM2Fx?=
 =?utf-8?B?QUZOMVlnRXhyMEpLMDFSMlgzbG9iSVMraU8vSTN2RFpnVTJSUGRNTVJBSmJv?=
 =?utf-8?B?cnBWaDk2Y0hNUzFqL1kzQVQvMEhjd0NRWG1tZDlORjhKVENKMHBlRkd3N0tV?=
 =?utf-8?B?SStpcnJER09iL1EvYXA2VnhBdldhL0dKQThDOFdIaTA1eTUrUHJWQUZIRnAz?=
 =?utf-8?B?dTRoMkkvcVNETWJ6WjV4Y3dXY2czVGNjNTNjZGZ3VWNqYWZ0bFNXK1BydVFo?=
 =?utf-8?B?d3NVVlJMYXVXUTFIZjJIaTlITlJUM2FJYjUybm9SMlE5RGUyMjArcXZ3N2Q1?=
 =?utf-8?B?Vzc3bVJiRXlIZjY1THNIeGJWTVFvdUIvUHBiWHBaQnlJdU9NT0oxVWhkd242?=
 =?utf-8?B?b0Vhd3RtSW9YWTVpeXNRbVpBV25MejlOZTM2Y1dYZWVZL25kVFN1c1JlaE9r?=
 =?utf-8?B?ZmVRWlNHZTYrTEIzQ21tV3U0SlVMcUZCamJQaHZKdXBEdDk5dmJ4UGVNa283?=
 =?utf-8?B?cWJwYmRCRDdFdnZTaHY2Mk1ucVFEelBlS1QvTDdyRGliM1g1VG5IS3puZmdE?=
 =?utf-8?B?WFU0dkt6dXo1c0hsSk9vbThST21HVDNhVGswWGZTRjFKVnV0RVZVQTZCbTF4?=
 =?utf-8?B?dmpCZ1VwOWZLejNYL2pLOC9yWk5DazViOEY4dHR0M2s2c0dqVTN6TFNMV01W?=
 =?utf-8?B?VlF3WVM4SmF3TExuak5sTlY0dW5RWVRVbmhQQ1VEbXlOQm5LbjAvRzZXakVz?=
 =?utf-8?B?TUlpUjd0STY0YWpRM3FEOFNlSkQ3dndtZFdyM1YxaDU5ajFDZU1sOENzTEtD?=
 =?utf-8?B?Z1FrYWs5RW5rYmNTNkx1UGVSMDZUSkErVzlSZVN4V09lQllHU0J3M21OckNz?=
 =?utf-8?B?dEo2aEU1bkdRZldSdFU0ZHkrM0tvTytlc21tdzI2ajNmbithdnp2Q2YrVWZw?=
 =?utf-8?B?WjJHaUJ4dGI0V1kyaFhsQm5mdFFPRWtBRjJLWDgvRk9pSDBEMnhCUDdOZFZV?=
 =?utf-8?B?Rzcyb0Evb0VSTk9ldlJIQlNHSXo3Z3Z0RFBqajlkUU0ySnVvVi9WMDdtOFNr?=
 =?utf-8?B?WmF3enl2bHh0SlBBUVJMSlczWGxwSDltaEJPbjE2NGl1MlNTMENTZUlJOVlt?=
 =?utf-8?B?WTZhMVlDTXZtRkR5WkxwYlljVXFoc2lnemIzNjM0S05Tb2sySXpGMGhtOXFT?=
 =?utf-8?B?TDNrMFN1Ry82YVhYS0FDd202U1JTTFhPaVovN3haSHFJb1MzbzB3NGFwT2Rl?=
 =?utf-8?B?SWRKeDJ2dVRxL255L0p3MW84clRpQnkwOU5pSWdhbHl0Qk51V2xyRyttSElE?=
 =?utf-8?B?Qm5NVWJUMG5MN2ZIOWhHUmhZbzQvUWMra05odk8vMGd6MUh4TW0yWnpWZXdE?=
 =?utf-8?Q?tPvUtROWVqYPSBMvOgdlWkv6ieNasKkno6mgS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d66bb0-3b96-42f0-edfc-08dee8b9d1ef
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:56:32.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOxL83o6NO6AsAoqbb40ouyYeAFwEYBBVktLeThypLjBeoWFbVQmqQIRdQxVWsqaAyJP6XbkZrSzwYDGrVqyXJ7w6wIm1wjV8LrLRO0Xeg5tdeLbs4femvQDdBP/Duh3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11446

This series adds remoteproc node and reserved memory regions for the
i.MX95, i.MX952 and i.MX943 EVK boards.

- Patch 1 adds CM7 support for imx95-19x19-evk
- Patch 2 adds CM7 support for imx952-evk
- Patch 3 adds CM7-0, CM7-1 and CM33S support for imx943-evk
- Patch 4, update resource table address for i.MX8ULP-EVK

Each patch defines the remoteproc device node with mailbox channels
and the associated reserved memory regions (firmware memory, virtio
vring buffers, resource tables and shared DMA pools).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Change to vdev0buffer in patch 1 for i.MX95
- Link to v1: https://patch.msgid.link/20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com

---
Biwen Li (1):
      arm64: dts: imx8ulp-evk: Update rpmsg resource table address

Peng Fan (3):
      arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes
      arm64: dts: imx952-evk: Add CM7 node and related memory nodes
      arm64: dts: imx943-evk: Add CM7 and CM33S nodes

 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     |   4 +-
 arch/arm64/boot/dts/freescale/imx943-evk.dts      | 135 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  46 ++++++++
 arch/arm64/boot/dts/freescale/imx952-evk.dts      |  50 ++++++++
 4 files changed, 233 insertions(+), 2 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-imx-rproc-dts-6c78f82652f9

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

