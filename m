Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8744838D
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115042; cv=fail; b=Udaw/jQzD0emwT45dgrMQzKEVAxUUhALBiMJlT4EriSA898o1Du93bUZRAQaspfk5eYdFO/nltrKxqL+vEv82jTCthBcrJuw1PE88wrBbjKfCxSadRJkKW8EXhxlDI/Eko9x/xEk6vcv2M7fzaUJLcI5d79ePzHHpPnizgjsJsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115042; c=relaxed/simple;
	bh=azmXnEnHaasnJBWWnoXG86pQPc4dU6t/bYNVYQUPz+k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CdaNss5aGB1LQlFV76XaGEQlYsKamWC67OsE8Lo97BgOtkLWaa4/P2b+/VCVG63BlLpD7ksIvPL17yOnyDC/UuFRM/DYN8mJ2TItF43A6js6440v2355r67PS68WxV/20/tVSBVfZSyTPHIoluxMVzHZ1PSD5mHCs0/JHs6Nhgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nqLJ0+qF; arc=fail smtp.client-ip=52.101.65.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nqLJ0+qF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StmdfENLOzIlHTeayu0rcPJib9qGHwXlClAPkgu1bUorLtqP14cJbVtXxVwxc3UEPXpQG9R5wIFaB8JcFmNUHNBAnAtPFHfuL8JOcBNN0JHqguGeUCFs1rAyCBrKFNVPA94NdX+lbGleSSl1HNAdLjIbtBIuG5vzy+Ff8a42hQWL7RWQEqoW/wPXmQfD7N/woiwINjwlJmczM8lp2JCp+Z2mFN/vev1+juyZYxzsoNqFNkCXHLxvbgJXXd11FRzhfsRAOEAv1vxrGaE0IG38Ho0PHP4FegSEb0mHtPpVSOIL6EThlhHuZJO9rB2krDF8uubUlPALeyYnRzcoyO1RQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gXnDG69B7+Zt55NOUU+ptWVYpALYDgIbq/Gfu2LDSQ=;
 b=RXbMjdw6w2uVrlDQ66XNoIrX0UuuIIkopnAUhPt5X0bqXf0SJHh3hz+fWsmvg5qpR93vQ0I1YYkJLwxIiGbhkmM79uLRbzJE8M4JTXrFRL6+M+YVJW7qu8Pk0m8ZF4vL2I5tk/F6uNquzjyqXSMU1EmfxYzkyw/oD59Kdg8Ai4mS+iHH3VSmcOR43aH+5uVhJmldVmTTVVwpR5h3pzrTBto/zgkBrr9dnH8ZSzbkXluMF8gf11cAod6AAW6nKwEKT21hIQPiyKSTYQY2OTiQKqmwSTlnmjqikcT+ekeCzjNZ4CeFlr11WvYfXsZ6gd5dh126GaBpVExYFul8NMPT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gXnDG69B7+Zt55NOUU+ptWVYpALYDgIbq/Gfu2LDSQ=;
 b=nqLJ0+qFCqxgNKqa5l5tWLP7KXRhhJzXnM8ssglARihhwX4o9shP0pNPnltc9bdfMuys+ONk9xIU9yTkyseAKtLAmjfVu10cgC/VDJK4HEXRXnAwNPIOid5IlQGGcqleKAMJWhfqU/IlDj7lYtTgCI6MA35vndHl5/ailI1dRCRJORk9M+0t1B913wt59kAlOOTWNEJR4zRow3YUGwdXIdSXmEumtjM9badypvmv0lZ92cyy+21eugfv+324cjwi1jNyOVyaq8YV9caofRzD4fFFulm/V1sbQgCzqT8LttZWl9CVxxbiamOmzUP6GTml6ZxB2Uk0DAYL+LEGUbmMTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 11:30:37 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 11:30:37 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 15 Jul 2026 19:33:57 +0800
Subject: [PATCH v6 2/6] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8mp-usb-phy-improvement-v6-2-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784115243; l=951;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=DZ/pfgytFfjVcHg/HfTEcSllkEEcnL66EZCkKvKp8Gg=;
 b=IqU4ygzoC0mfOZ+MQFvO7UdToGCffR5Hd/dsViH2aEkpAd34Ue6SAzG19+8c0s2XB71sZbL4v
 SD03HWnt5KfCQ75ozUE/aArOFbs2AZh7HIy5mZzI/SdrVoapLHgXzrV
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI3PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::11) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e931c4-0a09-4fdd-87dd-08dee2647daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|10067099003|56012099006|18002099003|22082099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	jUr9peI0A6J1ixqxGon9e+KJ0mE/3C52oyxx73JW8VXorZ9vff1JUsbKlw5k4p7idLIPNINZjsP6LvtADWFt6t1/5Zl9J1UNjt/ZCCDaCBYz+eOXWti4c0UMb5M+RWtPlCKlm5OEfnyHs6xVO4aLsD7lXW0eiJ4ikRpfmi+dWDsJEEtw8OTQUtLPopAdwN9JwHOSoEwl404TDcZ+Uxz4t7msFnOmSwhoag+WvIOlhOJEfeSR+SrLAnJ8EyULYsYB0MaDX4r7zBEE9ewXg0DpVHVTEjFomQJzu15swo6WWWuVuSKW9JcdALysZG/GbPgSXsa2KQkIY/GPOOv0ynsQ/M0XUo6zx1n0ExDxuFNq5siivvQt2441Vat0z7t6Ya4Di4i0914/xxhszHl5MAPtnwLnrEAY9srY/gckP3hyf5rgHlGbPO7r/x6o20kVIFR0787zKI6l/ZAltNc3N92yacq3X7wjgtoWwNgl1ag37pVeVW98cdYw1P7+UfRNQNM8iS2zC8ZLrMe5/SEuR9yz3hd0uxLii2oq0y5SWguZfdG50QNDC9kRp/Cu42WJYMA3wkQoEg+pICrW/Wj3K7TZo5aqAqIy0a3IzAc0YsuZeIUt9hXnCSAGJ04uIEG02jsLenZgVddXV2jo/3hXPHX+VIxLx0MgShF14Ii7LbmivsU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUkzYkRTM3dTWlZUU2Y2V00raDh3T3pHTC80WUtTNTJrR01TZ2JzeVJVcUZV?=
 =?utf-8?B?YUhIM0JiL2thRUV1OU0vdmw3ZTlaRy9BaVE4RUw4Ymk3M2pzcitDbGxkK2xa?=
 =?utf-8?B?ZVZIUzVQdVVjWmNEME5XSnR6TEhRdkJ1NGhmVTh6aHJOWTNab3BPT0JrbWpz?=
 =?utf-8?B?MnZsdzExWS9lOWtKQ09hbnZlNEFXUmRLNTkrK0JTZW5JbnliREFia3Q3d1Uw?=
 =?utf-8?B?d2w4NzhsTm9NU3dacTRTZlpTVlpvandnbFJtMXFYbnhXR0w1cGVZTnRERjV6?=
 =?utf-8?B?UnhJMlpyb3hiVWhhTkFybWo3bmZrRUFGbFNXMlA2QnI4MjErODNrYU8vc1VW?=
 =?utf-8?B?MGJWMWNQMkR0L2UxTkVRb1pDQkY0cy91NGFRbkhzZHdHWStETWlPdDQwa0JZ?=
 =?utf-8?B?ZGdCbUVhQi8vMnA3S282c2gwczR3RWhrU2p3VmJPNDRnTWk5cFo0NDFzZHc0?=
 =?utf-8?B?dGkyM3F5RFNzY3R3VTl4aW9iMTlnN2Z4SHE4bHNPZHRFMDZ2d3hlQWhZTmpY?=
 =?utf-8?B?RXYxR2drUUFJcmo4cW1ySkY0cjBrbkVJVVpGd21oM0tVbWdpck8ydDNyK2p5?=
 =?utf-8?B?VEtoRVVWMjBMTExJNHhnVWZKNXV1WHlIZ2JySFFuRGdsNzFCSk5iY0trR1Vj?=
 =?utf-8?B?VUhaQVZiVTdYY3dkakdyalp5a3FEelhFekpHSVdPNEU3ejN3QkI4RFBOalNI?=
 =?utf-8?B?c3pHek1uaXN5SGljOXdRNFNqNkxZWFkxZ2NWTU1XWmhKVU1MUEVNQk5tYkpT?=
 =?utf-8?B?N3doblNBS1c0cWtRWjlCako1RDFoLy9LWWlBY2lMdTBHejBqTUFJc1ZKdkdl?=
 =?utf-8?B?MVRWQVBkSDZ5dmRMNlRqRmtEZkZRbmp5UkV4Y2crVDVsb3JzY0x1c29VWTI0?=
 =?utf-8?B?NUROUVlvbjJTL2JUa0RReUQyWVY4bTFYenFkOTJIMkJOSUloYThNTGV5cGJz?=
 =?utf-8?B?aUVhRk00K0E5WGxhMFpobWk0VE5ETUlQWU9FSEZXd0I5KzA2RDgxcTlVcTQr?=
 =?utf-8?B?Vm9OVlBMMERwbzVQSlRGa05PVnFIRFBBeGFIUFBQUXJGcHZKaVc0ai9Ga0Vu?=
 =?utf-8?B?bW5FVFVOUXFCb2NhOWxvaGptUXV5a1IvNTJ3SERpWld0aWMzamZsT3dkWmoz?=
 =?utf-8?B?NFhXQVM3L1crRzFsbGkramJENDJxR2Y2RkVXazA4MEk5Tk9rYVRPT0Q5RFpj?=
 =?utf-8?B?S01RYklLcU0xaG1wdFdwd2pHbVhjZ0ZudERBV2hSOG0rd1F2ZTFNMUF0VkFI?=
 =?utf-8?B?UDBwOFpLdVdsQXZ5QjZubTNwV1MyVFFUcENXczQ4SWJQOUllWVJhUy9RYW9C?=
 =?utf-8?B?Q3o1SXdYR2x1UnJlNVZTNVI4Y01UMmR0ZTFiOCt6QUpzZXBma3hrSi9oN3Aw?=
 =?utf-8?B?dUFwUUhjcFBUeGFnSThhVXlLSTArMDFWN0xrZmxXemJvWGU1Qjh2TTN5Nndu?=
 =?utf-8?B?R2wzLzlvLzFHTGZ1Skp1SzY3MlJ1dmxwc05GcDNoYmN3UURFWFk0Q3UxRmFG?=
 =?utf-8?B?bWNJT0RzUEhQUUYwMjhodVNoS1dFcGo5WkFtYTQzOWFrb05PZExDR0x6VVov?=
 =?utf-8?B?TCtNb081YlgwRlZnSnZKM1RXUGlCNFQ2SUxRb3lNaEFhVnhCSW5qRmlvS3hG?=
 =?utf-8?B?czA5TWJSRFlnWTJDVkRBZytOR0FPcVhHNWF0RGdHMXNEdGY0Yks1amIvdWUr?=
 =?utf-8?B?VnIyTmtJa2ZYWXBRbWRERjI5NTdkRm9XL1ZIT21MTFFVYjJNM20xSWErMHph?=
 =?utf-8?B?RjdwNFdKcGhaMG5PbVBFMHlKWCswbHNZaXVUaVpxNGU1NDAzTStMNFIyY2lV?=
 =?utf-8?B?M0ZTVk0vZzduSVRYZVlSeEp0YmZ1WERBWTA5MVQ2dGI4d1UvQUJON1padloz?=
 =?utf-8?B?NDMyUU9KK29wVEpwbUhrSHRyZjUvMmx5c0lELzkwaUxhcllrMTlxdjBVTW5l?=
 =?utf-8?B?bk0vRDhPSmdYeTRaKzh6ZGlwTHRpTDFoVVFpOG9XNkR2RlhVVDJraVJKVC8y?=
 =?utf-8?B?Smtzc3MybzJWeDBJd1VaeitqenNrcStXdC9Na2l5QXRjZ1FwblVvbllOVjB0?=
 =?utf-8?B?SWxnWHg1RlFWeklMUUgzSDZ2R3JKclhnbkpGaGlpSzl4YmpxRGtFeU9MRW5j?=
 =?utf-8?B?N3ZrNjFiWktRNGs4aTZsY2pDTEt3d2pVL2hNT1FwQUlxZ1lDSzcrWml6S0g1?=
 =?utf-8?B?dC9lWXoxNE1BSHI2VHZMbVZvU3hzSHMwWlNWMG5HMVlSS0hKeEZsZ1JiaFAy?=
 =?utf-8?B?T3l2Qm5qMnJPd2NGY1RzWndSY0piZ215bVZDNWdTbklzY0VCdkVJUGI5YjMy?=
 =?utf-8?B?SUNTaG53WVRnYUlQSUVWajBQZitZdGUzOGtYaTBYa1QvN3VsQUhBeHV4Smdq?=
 =?utf-8?Q?EFR0b+sJRZgLsNi7ltH3dIVphfSxVpeSd6D5A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e931c4-0a09-4fdd-87dd-08dee2647daf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:30:36.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShHdHLlVaB6+7AW5iEw09rsy5Hw5Ep4swYpuW5Tcf1QItnBCgmMOcFgynG4WWJ9zw5PCza8SaU7YMQfpclmC41uKHQsJ5XhqpcEgTj/qELwXyW+3wHXVkTi5v5FPzRc9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

From: Xu Yang <xu.yang_2@nxp.com>

Set PHY wakeup capable because this PHY supports remote wakeup function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - no changes
Changes in v5:
 - no changes
Changes in v4:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 9a33c06d6fc3..3a5788c609e1 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 

-- 
2.34.1

