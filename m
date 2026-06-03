Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F637CD33
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464869; cv=fail; b=jO8HZEl8beMTKz9tjg9DM1DFiJbD1vwzBKL4xm4ce1fgsWQSCwdmXVoib9XbQyDWCCCgenGz2W0Ct+QeCbUvUAh8JhKS+T8eA6QKCXnObbu8SWQaChFlnGV4ZjZ6il4hGN62UzxYgpi8NEnJhPd+2wmZ1zCOPjNomEmaycdp6DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464869; c=relaxed/simple;
	bh=YXsFyJsvM3tZ4tlLtnPzmotPrkSK5kNlAzpQYrBakk8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=okbssft5wSFhctUznAx1xWxz7ul2U1X/piVJq0+x8/M8iTsTj2isVvx+n5FQrz71vvj2ktHQBCoQVtuEIFFNKaNUEGYku4GkiS6c+yO+EKGyvcDr3S/M+AU64Ao5V2oopE1eM07Z7HBGaeiGk0hIuLgGNHkPTi9/bbZtokTwdRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KI0PXPHJ; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KI0PXPHJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTh39KJFUN8XB25EGl/KhVfPUC2ojNKrLLPPDiW198Ub/HTwLjH+eaPr/t4fqelD8TTo35c7q7FbfZElwrLtRwQNSNtpMvEyQGbrlUxqjzTUDLKXkxl7Yey7OCjK2Aivo4pi+ud8coqFVb/LZ/RZaSxQcPXjyPD4WUdzaFl0i38ffL4Zmztoev34Gjqrn2exML19YkLnY/gT6dKj8UX4CKnKJkyfOMGdThMV6jllUV9pspiZoFqV7ACcEZ11iBhR4T3DSJu23KxTnXoR/8MdUlx3sDZgFKQ5ZIaGooHpL894liRoMihAFG7voFuHvxvEo1pZVpt+1JLpluoVBsvwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UivgvCCqccs/5kdWJnU9L8m4eX+264iU6Fg5Te36S2c=;
 b=O6XlPXkKP25kBLIoYrGAJWKwJh6TUxo0aDtTZmTRUgCJe3Vo77TX9nKDnT/xeRJ1auyRyeNQAzRyQe1RxbbEGl5LKbimDtUuQDn8MRwM07sSizTn7RqIX/i+w/+sJPBcGUuMTHHus0esNgvknKs/kqG03KHxyMOtBf3SSLi46H5TPPMhQ1DgmEgDyzQQNbiJvdSMcPQX1fjk4nR7gqRpmxLlCRkJDtPa7Dzz6zl08E816zHq/YpDbCkl3kcth+FdmLZJhOdEooIQVPQpe7GtdcJOSdNK5QgiQoG4r+QBP71DQ376XOZ5TUdUGcwS9ktlOy/fPKAmsEh8ktLC7yvKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UivgvCCqccs/5kdWJnU9L8m4eX+264iU6Fg5Te36S2c=;
 b=KI0PXPHJcSOehurYefh5ooiwmoua8Zjz9UOlN215JYdUGGI+9n80psiKATcIXL/lmZO5xu4Q8rprDKwSszH4wkDaWD+dsQ2zwU/iUig7iN8UDBsXj5mlgPz92i3j27tj1wjeqdMcrolcdlXkUBl+D4SWHuSqxxh83U7z/O3lIIk4CWpS+EwnqjfZqpElsvRD1JyozlQtDob+giRBKsvZRQsRv0J50JRbLGkY504cJlhkg7LGW3eNFnCg/YzMDqqvwjd024LRpWajvyJ3tvR2ZIjYylAQs1VtVSFKqZhLygzWEMQd4MyrsI8S8UkTSwljoJGrl5mMRGrc6Wq0XemWKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:34:24 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:34:24 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 03 Jun 2026 13:37:15 +0800
Subject: [PATCH v3 2/5] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-imx8mp-usb-phy-improvement-v3-2-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780465041; l=816;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=gmaRyDvzZ1FJnRyPBnMJ9+F5cb0r2KeZpK2ckmm9rEA=;
 b=EiVQAemeZIRRB3sMHviTpZcX3yWMROBuj7ZKFSmQxi8fg5qxAzigBdEhIQpfpbWOFZjwDwRFi
 QyHNVQlIhKOD/LkQIMvejIBIq/iPlzWvCmyyRudcgP+RBRrSO6vDLtS
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d442e37-906f-4156-e979-08dec131c583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|18002099003|22082099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	zN6B4BuI/DV7z/0SRvA17gJOb+swJYkm391pA1ktEbbLCGAZqQGFmzrk5gjb2H3gGTIVImLdnPIc8oCIHqg4rWyJzzhK3NiyATIRysH1jTIs5TKU0ZDIhae2GKbefuZ7D3K0kT19tnFBMdURtMz1OgujOmBxxEcw9kmHiQIZRc6+acIAQXVQ0YXSGvZgIDe3YK8AJuEtUG5DqH/G3YWwYgF2SFoZkVFSJDtXGp1o5Oh0YOUhYppntbJ2te9xi7wwnnTLtxsNwJoum4jATtCQ4pnzPnDGUgAJBY/470pP+3t2VsQfxiqPrkawl0KoEXfl+163tt4NFb9wFNX94Up5JlkDz0xeA2tZDGGEwci7itxY+zRPvNVOEyPZQTwd1NEKeLlFs44bjYmkv2TU5K/1ifi8WfwLAELQd3h/CnZsIEghp+Ux1+Yrs9F8Y+YNKELDfoPzvQJyRHpUgrRg86nh35DQoGt8T9FnpPLMJrFvOyFLXGFjy4Inie8rT9XTbv9XczvaaUnPIbMHiuP0v0N6/KlVkM4kVRY1ZAjKNMACvD7x0NXLJeN5GBFHiQGv9lTmxzVld4JVILE4xYzSPM8tIha0aMnr6PVghiaWBQKu5VuX8VJEsPW+AyXSlnx6IKXjwPDPHdfdmt3mj5kkinHzXKX4TDRfMizZKcrVf0c+U14ODS++CuzHGw0icebeKPXt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M08ySWhxc1hzd3NvVXBRTlhsZHJaY1YyQlYvNVg1a3FxeXp3R0pPMnprZENN?=
 =?utf-8?B?QjgvMUIvMXhhRlJIYTJBRnErNy9zRDBIZ3hoMStmNkNYMEtUTnpCKzR6aExF?=
 =?utf-8?B?eTNKNXBoa1E4dHNzVWVNbUI1TUdobVhROUFCUFRIbUY4cVhPSTJ5SDdPaEps?=
 =?utf-8?B?dThvNmhKc2hvVGd3MHlBaFdyQTBvQ1JFeXJINmJoWEVFVFdreG5uMVhVZ0Q4?=
 =?utf-8?B?bnlBQ0xxbFppRDZUT0NvU0RMTUJaSUJScThSbEpzMkkwS0tONE53Qy93cnZJ?=
 =?utf-8?B?UzRUV3dYdWtLMllkZlVNNk1CaFUxTk4rK0JUSGJrYzNPT0I2TmIvRk9vc05k?=
 =?utf-8?B?ZTh0RzVkQlZlMFltNHNlQWpNQmFGODVFamE3MEZ4aTkyUnJ5WnEyQ2NiaVVk?=
 =?utf-8?B?OVBBWFpFOU1HSVFsR3BaLzBBbzNUY09GbmU2QU1yZXdxakhta3oxMXFkekUr?=
 =?utf-8?B?VzkzelhkNERiUmJuK2ZjYXhJbG5WSVVQMStKa0FaanZ0a2VrU0lnK04zdVBZ?=
 =?utf-8?B?MlRkalhDOEx2TjhEN3dKVWQzY2lUL2I4MUY0bXlzcWZldVBqMDdjTGRXOEF0?=
 =?utf-8?B?cTdFK0NkNkI2T3U0OFBjakVWcnprVGtWbVR1a0hhNGRJZ1hnRUpTa2l5ZCtt?=
 =?utf-8?B?UnAyNTVlNTM0MEhkU3NRSDBGczQxSC9KOFlvYTdmbVFEY09yalhwckQwdVZU?=
 =?utf-8?B?NmptZjdQWDI2TldoUThXdUYxWWhxLzJUc2x0ZmZ2YXRSVUJaVHRSMVVuY1RY?=
 =?utf-8?B?VTc1a1JoZjA1RlpBS1VoU2dnbHR2QjRQWlRQL0F5RnRmM2tzRUJ3dTBjVnE3?=
 =?utf-8?B?MmtPT1poREpJVzFYaXBHMnBNTW52NWVpU2RFT01kSVJPcllMTjVMbE5QZ2ZS?=
 =?utf-8?B?a0p2dkN0SmRvWmcyV2RicXNOVEplZmRlc0pUQ0oreUhEVDQyMFJVckhFUCt2?=
 =?utf-8?B?MDRrT21WZmlINCtGS2Joamwyc2EwM2lBVk54N0NTMGV3RXU2aW95WXltN0ZE?=
 =?utf-8?B?dGVIcWVrNzBCQ1RQYzdIaGM3aXRCVGlDYkU5UVB2ZW5OYjd3NndCM3JUSFZX?=
 =?utf-8?B?Nm1GOTFkeTNDa1prSGFmWGR6dFFwNGk4dWY5WDBmZTBlSmFXVzM2V2pNaTVm?=
 =?utf-8?B?ZEJpbUYrR2tMQlVCTURDb29UaldSdjMyMUllVVZxaUF4MVIvcDlldHp3aXVv?=
 =?utf-8?B?aU0zcmp5Z3NIenpEQitwdFpaMlloR200RHV4b0M5WUdMQ3VDaVhGK3UyNXVL?=
 =?utf-8?B?MUZBdUM1c29URFhvbm4xN1ZDUEdSb0dKOHdZUnBvSmpRbURFU0F3S2VZaUpV?=
 =?utf-8?B?Z2lCOGxBaHRIQUNmZkJGU0xnLzJ0UjQra3NnVlhGL2o4Z1ZGYStaVzJrMFZr?=
 =?utf-8?B?T2oxVkY2WUJNMHFlUTZ4M05HTkNsbnhtOUJJWEZMaDB2cXhVNExpenUwYVY0?=
 =?utf-8?B?aXpvcjd2RGdSeG9JYjNHbHJibmlGUXo5TkRMSG9LdGxLdEpGeE9YMFZ3NDBO?=
 =?utf-8?B?NExpQ1UvcHNkYVd2NU00ZlpMNXlUVUExcUVYeFZlVklDUFRnVUFsbVMwb01m?=
 =?utf-8?B?VUpsdHZZN3didC85K0JLc2FCeTQwWEsyMldNZldiUUFNckw1cW9qRnQ1OXNU?=
 =?utf-8?B?SVhMdDFHZUlZTmFIajVhVEhJbWJXUHBRZitoVUFyaVdxdXNUamNMd3VNeVlG?=
 =?utf-8?B?WlN6YnZ6bWc5TzMwU2dSQTVHVlQxaGsxcjgvQmxxTVJPeUY4dkhwTmF4VStN?=
 =?utf-8?B?WlBoUGlWVzdpZDAvdEFqN1NnYUxwZ1NDbm9JMDJCekFWdlB0RnZtNTdVRlA2?=
 =?utf-8?B?NUxxOGtxV3RTeDIvdXArVS95SWNlK1IrWGRCNzUrTEJyWUV4U2FNcUw1NXJ6?=
 =?utf-8?B?UkFCNmpiOTQwb2NIMkYxdng4aUNxd2VVYlBKandHVGJKYjF1Yy9zRm9mck02?=
 =?utf-8?B?YkNlV2pWb1I1dE9tQmlHdisrUjdkTWppUHdTcCs0SDk4ekhOanRiLzNxSE8v?=
 =?utf-8?B?K0Z6K3dESGRNYWpwOUc5MURqczNqb0JvOGZRYUNWVWJqVytRbU14NUxicmRa?=
 =?utf-8?B?RVF1K1hiUTFMWGdzVjdzcEVla1NKaFdyWEF3bkxDQ0s3enRqeVZOMUt3Q1RT?=
 =?utf-8?B?L1Z2aG9idVhTdTZpajl3YVNUY3pNOE5OZ3RaZHNaWEdxYStvQnRKMjZtTmJH?=
 =?utf-8?B?ZEh0ZGl5NDdmMDJZT2VscFN5R2NKaGJQeTFWSnZlckZyYkhQZjB3QzNzRlhH?=
 =?utf-8?B?c0ZSeFVEMU1ManRhbEZkZGJzdFR6dS9CVE5vVFptT3FGNVZvdCtNdW42ZFpx?=
 =?utf-8?B?SEM3OS9tTEJDeFQ3bjFqbW1CVVVDTFowcVBkWWNCcitEZVIzSGljM0xQNnRG?=
 =?utf-8?Q?NV2tIomaNoeJRpK/PReC9uyEJvd16y1sQAX+j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d442e37-906f-4156-e979-08dec131c583
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:34:24.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrZaixBMspTJYsUJywWePaS7YB+0Lo6s8LakB01MOogVhHjCr7S8kAlFR+8Bxmd2a6MMUyuPDtODSVveLRy69vjArYEfHBXz1sM1cIdFzw+NGqSQyoT12utgIlC+cmVb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150

From: Xu Yang <xu.yang_2@nxp.com>

Set PHY wakeup capable because this PHY supports remote wakeup function.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 88b804b2c982..591ddf346061 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 

-- 
2.34.1

