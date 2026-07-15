Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D2A42BC34
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099230; cv=fail; b=YsxZoH8RtJ3qzoGGL5lPq0ymMTIOgWnfZJg6Z2u/BjKaEHigok8jr7qFTK+cDPWtIbTIB6iyCY1Vsw4KpnPSh30OF4I407u5Lno0HlvoeafQHPwK7gdXaHVcHEzYm/TcIt/o+LCPQU97Ny3F4YHnUWvmV4ZDBb0OWZRTEWHOsi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099230; c=relaxed/simple;
	bh=CP1jebttCZbcv25iwOkQnSS3s9enCjA8qwJE6pIRhhc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KXGQ0Jj3NVaQUYOacRgg/d8ps3qCCBADt5EemIDMT9KaBHLcVXn4mk6HTN3bOlvJ2SHwQt4hoFLMXrAuE8CsrWE6gsw0VEgNLpTDejbgjiUiipDeaIiVW3wadpMafRejxyjoYIbZZuQ1IPoPCGq7q72DO/7iP/ARWRMUsMYd1lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u8ZKU7X9; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u8ZKU7X9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZKmM3JjW0YyP5ZIMT0HRS2h5SBJ6pCTBkrSMEFH8fQu4FUjJ6dORDgbKNLQeALfeUQF4LNNkkDRedX6TGZX/1nILQKvudylnRiQ4VsgnL0fv+WXJhBONY02kNidatWUnVZdyd6TsD0LF45xnRb0ms1Y2vGQi8yiLcQyMzaUzFKz0EmlT5O6v6zAZq/TYyAlOn5o1WtOIMcwat4uKfPDrQJbXuTd8eLi+sT1mKzS3ntUHEsudhhUWZyXqNedGGudDRQS+4+7DWY1bUeBkVynL+ABoE1j7Gs1c1OMN8zpJAra62qh3C3ACSs2phJdy019jKIvwFveMcBT10DsMLgUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSXRXXjerYQypy39ddJL2lldZmR4+yFXgdSnZ4r8uq0=;
 b=vVhZOPF/RjC1Nq9GegywhfV894pyhh3sNJgvbhdAnm+RFIHHR/PeuYLH6GpgMYd43vqTKeLZP52sQbcoCoKDTfc5UReYevhypmEoYreiitQH0D3O5euO6U/zMVMawZ+Oqt+aDAWG+KK3fV7OMRr35syFOfczN8/gpgs4oZdD6MojRsXZk4yQIJ3VRdGP6Uh648Z2W4rh2vbxbLOz+iPa2PUMtJSv3L+n+4dw9KG6fpR6i/3aaFIvik76d+/ffWT5VNQdBPo90iDjC9oU8H95h/+IP81oYh2rMcIQAiv3vNaKhxu4p3DlZ4Z8QKLfmmb2uE0qVXt3xQ1nxrDur98bdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSXRXXjerYQypy39ddJL2lldZmR4+yFXgdSnZ4r8uq0=;
 b=u8ZKU7X9WOPrICoYAhA1HcTQzKfJW4w2eEX/XtR37RaCio4SsaxZLXjLiq8iUNoWsYTqPkA0w2PdN6XPH0au4sBBTEjjI8TU++iTT3aauV0yOTRjMS7Jkv2ZNDuoitn9lB+ScKSwUfuCMK6o1A6SamOgxgLE7B8Vi8UKAFXBe2v1PJcz6alcR62/Hfkw2N/RZp6xfzIZ9VZIUHi7bv7znxH+vesKXC0ENOiNC3ExS2r+3zHQskahyIBtegHFWCZhwThaD7NLw/Kf6ycJjLH0rAfIoI3LSn1IigHros0N3upIwBkkkqvyKvb6mYYYa0qgVdzIixd9oJzH0uJqkt3BDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 07:07:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 07:07:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add remoteproc support for i.MX
 EVKs
Date: Wed, 15 Jul 2026 15:10:36 +0800
Message-Id: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwyV2oC/yXMywqEMAxA0V+RrCegBevjV2QWWlON4INERSj+u
 3VmeRb3BlASJoU6CSB0svK6RGSfBNzYLgMh99FgUmPTIsuR5wtlk9VhvytaV5S+NDY3voLYbEK
 er9+v+f6tRzeR298J3PcDXxqrpnEAAAA=
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
X-ClientProxiedBy: MA5PR01CA0206.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 04fbca1b-563e-40b7-8af4-08dee23fad6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	SMzkvubIsjeD03X07KzDegxj5MRjAbDxChYbkI0y5CkqIcYh09c+XKm/s5WX7G/Yj/DWh/WNb8sjo2DcT3Dxi48R+lhQkM8VCwVn3zfNcUJQS/dvZ2Yh3yzxJGQ0RIc6ccIIw/a8XahrAsmdby20DyzLZLbetU9CtZHHTGfZI+Trkmp5xjOqzZNhd1GcX14VppW35aDPEFFi+ZV0K92aXRxMARfoAJKkDQJ35ABYRw//GeJBzY3iiQ/Zb04T2Az4cGkkxNaFYY6QqLrH/RaxfL8CuDVUcZwt2p6fuamVOAX5ndofMiHuj6nkdwFuMs/hVqoKfjy22Ob5TjpWlaGH3zWrVbhWr/rfKQx6V4FcPTNE2K3fXrlmoN+S6/EDdw2q6srlWlKW7Yi1kQGvEgjhj6WXIgGNdfXz9DbH2ESbf8mw/FbsI9fYexExf+nefO7qbnWJ0TVy9URQVsNeaIEK/DGJHYBxuSTMXKwTxcDnrs50qf6g15NIkd+w3ofINhwm6fvxwLhemOCAdWulYoD6hfwkDDute1qBFpapVMN9pTGYedbahIqLDch4WvgQyraF0JVKQivEryAEJzVRHkar/YmUFuB1hU4QJgjHYJ+OnovFGAiZwAfEUylCsQX03RK5f6IzNRh9O5+eaVfwGgp5ITu4YkVWTKBGb7A27koApO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1Q4K3l6aU1yMEtycnlZdXFOVlJwWVdOYzBmVTFHbGtHRzRHK1g4TGZKMDRO?=
 =?utf-8?B?d25zYVNWNlc0WEZpWUtyVVRYYUMwRTBkKy9iSm1DSDlieVJQYVlwK3dWOE84?=
 =?utf-8?B?eWphVm10aE5yTUlCUkR5QXJNcTczUmpDR0RFS2w2L0J4NDlVK2luZmZPSTBE?=
 =?utf-8?B?cnpFYk43RTVteXFCcXJLUmZDdkhRaWhVMGttTHRjWUlrc3FvN3ZvdUdhOWZD?=
 =?utf-8?B?ME8yREhGa0xzTjN3aDVLOFY2aUwvQUk0LzJuaEM3NFhYNVFWbVd0R3BtcE1W?=
 =?utf-8?B?QnFKU2djMUNJdFNhVVoxZHAzTE00U1RGY2xvdGxUUmh6VEVtekFONWRtNlg0?=
 =?utf-8?B?d0RzSVpReHVaQlFrdXBXODQrSEcvS1ZGR3gyM2wzc0ltejRES2MwdWZyM01m?=
 =?utf-8?B?SWdmMHZFSUt1bFpuNXNDdDNpMVRadmV5Q01XTEptTVZWRDVXYmxaN1M3YTFk?=
 =?utf-8?B?OEZiWWlLMlJPS2pMbVZHRys0eXpDZC8ycjBpZlRnWVU2S1lpUkdsL2RiMzJt?=
 =?utf-8?B?Z0Y2cVAvRFg3c2JLWHRNamoxY3pvRURoMFBEdHZCSXpEVFh0VTF6d1F5bXkz?=
 =?utf-8?B?bHI4ajA1Z04vSWE4Z3pZdlAraEw0dkEyNStRbjJNcmFybnRqRWg4WVMydzY1?=
 =?utf-8?B?MVVIYWljTWhSVjdoSzRrUzZFZGlPcFk2RzkyU1NjSC9jZHA4dklIMy84ZkJN?=
 =?utf-8?B?ZHNhdUlnV0RYNVZYZVdWL3IxbFc4dGJSK3RIa0M2aFJOMDNwV2N1cWYyOHFD?=
 =?utf-8?B?VERIVE4vUDFLQjNwTnYxTThBSkxlSTB6NXpBZXUvc0hqK1VNb3p3NFpORUpw?=
 =?utf-8?B?ZTRRYjJVV0JuYUVXUXNHeDFJVUtkMk9EMkNxaVRuM01OMUwyVmluRkRSb0dj?=
 =?utf-8?B?dTlNLzBSSEI2WXRMbUxwOER3WXhSK1B2eDNmMHVleUovSlBuTDJlN25GVXJx?=
 =?utf-8?B?QVc5bzBoNHpSY1NkZktXdkkvWXg0VlBPSTNHeXU4UmNUc2E4S1o1L1R6dVQy?=
 =?utf-8?B?bmZWV1NlRTdnWi9BUE9jQTNwWW9GK1FlUlUva0Q5QVhxbzlLcUJJOVBEREZ1?=
 =?utf-8?B?YW9PQVYzcVBrQXVFSzlmcTJIWTV0bkUzRjhYU0l0S3A3cUdqbUE1MmpFMzEy?=
 =?utf-8?B?TEhyREJ2V2JIcHpYelFvUThnb3VPSlVQMytvUjByTFpwZXVtMWpFK3FoYXpK?=
 =?utf-8?B?MllyUDlVenBlRGdNdXl0ZDFkSFNmNDJIaXNlRTJRMHBwM1c2YWpvdHNNaGQx?=
 =?utf-8?B?UDhSNzE4SkF6Sko5VnVGSDlWYUpYUzhrUmJURlNVdGNMMnRXOWpieG9LT29L?=
 =?utf-8?B?RHZ1U3hHcXVxUnB5RmoxZm9iMGdseVh3TmJTaVFOb3VKUnFHSUE0Wnl4TWlC?=
 =?utf-8?B?K2lENHNjQXRrVUlrNks0OWRMUUoveHNrcFMyNEdIWVYwVmExMzhSOURLdkY3?=
 =?utf-8?B?V2VlV3NHM3NKNkplcVV3cWdQUnVXK3FMSCtkMDRvSkcyZVFma1FIdUZFYUZr?=
 =?utf-8?B?aXB0SkJIMEpJYlBKZklwV2ZLMHBJYzdmNG16YVV5WkJSbkh6NE1saEdMWTdP?=
 =?utf-8?B?bk1LSG1ZRFl6d0dGdllhVCtDeS9BN29jQU1OTFJVQldaZU40SC9pOFJKcDRY?=
 =?utf-8?B?SVZ1T0w3ZndKRVFPWElIb1cxSlhHd1VBbnBzRVZJQTQvNW96MTB2bnZhSU1a?=
 =?utf-8?B?cVl4N3VGaGFHZ2Q1eTQyL1QzNjFvbTFuWlMwdkZDZHpNZGpWTE1lQ0pnUGdR?=
 =?utf-8?B?SlhDU3pHemUxTmNWV1RNWk5XcjBMNjZaVEc3Q056WTNHUUpBSnhuSnNDdmYv?=
 =?utf-8?B?UndMWHZZU01rV0taSEhLZit3U3BwYzhRRlBCS0F3UUdhK0RmaTRTbkRRUmtZ?=
 =?utf-8?B?S2Q4cXdsTmI2UWdjYXZiMWFBZ1dWWDIrYWV2d1FmTzltR0RhckI5dFZIU0ZW?=
 =?utf-8?B?bWk5K3JQTENjdjVGYTdjOWl2RkJxUHBaUkp2bWRwZ0Q5MFdBcm1ZZ2ExdTVu?=
 =?utf-8?B?TXJFN3BVUkd6U3RYeWhiSVBjODMxZUxuQXZmdlVmMjRhb0lkbTMvZnRNOHlz?=
 =?utf-8?B?SlU1NVR4ckJ3YWR1VkpmUndUWC9lR0tsdHV4NDluemM1ZjVyVUNKUzJSSHBx?=
 =?utf-8?B?Vzlnb2lFTGtpK0F5VjE5SEJXTjM2dGlsRWl6NkxCZ21KV3pCdWk0a3lsL1Zw?=
 =?utf-8?B?U3R1OEdvci9kblVoVmJrNE56TG5yNnBnQnllUDRIVFN3bHZWVzc0QVU4dXNu?=
 =?utf-8?B?MzkxazZ6aEpOMngxUW04K3crT3p3NU5ucGI0WWV2dmFqOXZ4YXlqeFhWcm9S?=
 =?utf-8?B?SHJMUmxGTnF6azg0YU9ab1NwOWlEQWt4UWEra0pQem1UVExtKzVOT2dPd0tV?=
 =?utf-8?Q?F0X5n7nDZDhsCLa0JvufeG0DaGDgZVW5YjM5C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fbca1b-563e-40b7-8af4-08dee23fad6e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:07:06.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YDjYuxioyRj+UPyK+cn1AIkXOpDOLC9ufPcm5dAtND+tgVN/jJJ/NcprhEmfmpNdx3DJc2zkMjj3CYXXTIFvnBKBIZ7Yv6Sbs0rVaP9Aoex8JWd7nt1pNYAQlHnKgp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

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

