Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97841A912
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135982; cv=fail; b=RxzqtL1j/V46pZyqsAWJgptw2bc3DiSzD5JLFlMDiWVU+tCnuQVv3g/STJzFwvMQQnOwKFOyQOx82Fnb/fEegJp7BfxH2nRRihNUCiiStoEG6vCM1n62uyUfFiCvHNx6eED3B1ykquZjddXm/0bHJoIl8ZuD/8ZfQwK3OnUaN18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135982; c=relaxed/simple;
	bh=/mgTzGXPHu22529BqYM9Xm1nMHhDHlXJW9uJQeUaNgU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jrtVqrqlAYXlPvMdHlZN0/YTJRRTpW+FmnzOnI4O/oEr21M/42BP5oEmlOCpHyInxHXx94qTS2wTVflonEGnF/BSLcNOuN1jAUS8c6pW4RIEMFzTfMKP8qMX3DEaF89yq6W1zja+xFvaVkXTW6jh8W+qQNKRQdl2pe7oQ1EAiLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xaKp2CV9; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xaKp2CV9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRa1YIdnMXNtjqCE/U/v9aWqnMT7BTbmig2OUxqWmzFP/LLArtG90S+OO9HMNGYhBFvWGPlUxi9qNUawAYNM41A05hmhx1Ut3omY2aKJJGvrqetnAipzGVJ5SwJcUHbx0QNx8ADO5rjlEagn96LLg7E2zFvjqXtvHkmP8n9qoADsr9aNEfIbf5vL5HjpaMkRHKw4DrPB7Hw8h1kxDWMQ1T4W/uenpHQRzhc+sUxZVVtiS4rDCZXRXin3F/PqmBLxIDekiHazBqOUhV4x6sBjUwtq0TIW+iajRztABjYh8npUJ1vrTQOC3AgrancmYY3IOVOh4pHtSIReqIK5gJBfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlXzZW1N8xkD+J0l/01jwGJZfq7OrMj5+fCFPm5dZo8=;
 b=phntibwbbcjOO58to4AGopQVI0syOP5stkqJ0WCOoQAx6jXKaDceYQGEGeVkCd13Ki86wWIfmIx+EsPNgSS/jI10QF3XPuFeVYEIEfrLR91bZlclz4N+PORDD6LR6I+K+x+5W8cUsVCGWLZ7EuQdYESA4m5+nln7YOzcrsFYCMd/J07L6Q6kZfGup43hnCfLY8gw4T8Wh45MDcsQn1jikRjm5V1G3PqRd7rIKjHPBKt29FxxWOVbUFlYXRm99Rn+37SJ7AkkYGf8tZXKQum9EQS23vyU5q5mLzDVYaIHHWH4diAfTo9ewaGAWEGpL91PJITAGgoHLU2RYB7WtxJRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlXzZW1N8xkD+J0l/01jwGJZfq7OrMj5+fCFPm5dZo8=;
 b=xaKp2CV9fkuNZNr70Z092Z4JDk/G6BMcgECFqIAIhxkR2DSj4EStf3Xet5gXYtFH+q69Bz82OgYmH8rtdUCpd4OB1uFnPyFpnFEMTqa5s8iuecO+ZobjBOmncQBb3FcYSVVh3Bs3Ij0IyM1hj48L4CPHWYix2S5G9WAAPjIahX4hjDG8NE//8Nu5TNNFxazVq18eBCZJyo8e563h1UO5esoNWPEKyuYxatRjxfCI30qlUJ3Dg6INaubu9fGBBPbckHBYd/mXMQhWUd2s4i2IrpBFo2MwodAyVNwdk+V+jo0oRiZikhh2IFcY4UMPrnI9hfBMbg5+YyCzkmuKWV/GWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10509.eurprd04.prod.outlook.com (2603:10a6:800:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 17:19:34 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 17:19:34 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 15 Jul 2026 23:39:11 +0530
Subject: [PATCH v27 5/7] firmware: drivers: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-se-if-v27-5-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
In-Reply-To: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784138954; l=62760;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=DXKl5qC+iy+OYzPfHGZV6GP0mMg7jKFwiiCGXBYG6/Y=;
 b=d3w6K0SkQ8plF4ptZgtDkdnthEn0t6thUGHtis4ytpjhzBvQy8kVvqLfT4/g3XKoh9lNhy9ei
 xgHCug0zAJ4Ag7e8mBXuT/Zr/3qeh2CDWNHNCZ1wPOsqucIPQ9D2yFV
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ae4c7c-74e4-478c-88ed-08dee2953d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|13003099007|10067099003|921020|3023799007|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hTk8pfztrKxgLu+zW3gtTRaxVAzsPdPNSqQYz7W+dw4ExU2gQUiaHcy783bWnL8BvmLcVIgUZKXXe8UdYIWeB8LbHzXAVl0lBNzSRkch8szRiZrX+JEinmry4m/h0WOgZuZINlYukRg2z60zrkFFE6xMJlqnpuCGhLYLeX9Pd0sU01QGIYdn9pnURAtKW4JzVl/+rCdWd4g4JOi6BukDn1GGzs8o1SkYZG6SSnHSMLjs+PxChO1JgFfYFJrRNx4wayWdjzOXN2AHayNxjEvcbnq9HUSlM8hKaGtkokR14DR6hdWQIDX+4bZdAFDqFC+oJPqphqILwPtXUxyoq5ZrHuN7c1PkD1jO/8AAUM2aamYYlKX8Y9m/iBCvOk4AvW19MGQDuattjEcqJQulsPgtCeWtxKgQA5NGXSPnL1wsaTVWNCLj9/si/iqjZdlxsja9uMXsJQuXchtvS3HJfVCMQ2ejzgL96mwgPDa8mMMM2uwXKd5qKwuXEzz/vibepjGHzwNS/mYUZmqoeTTxYUMUObhn8rg1f/kKK9ULdcIbMSe/SOsZeYkehlUCIOYPMs4lxqNSm77G3pQ4pTpqP6mL+5I1bSpB8ZCBrrl5LHXxYMf3XdkRTZpv/Mc0Qi1XY6+2uWYzkXHJvYSsKUt+oYwuXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(13003099007)(10067099003)(921020)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJGZmJFa0lrUUtFbXZJdXFYT2VRTXZiS0MzbUtDSEg0K0tvNHdVUVlocUNP?=
 =?utf-8?B?OURrZ1lDVU4ybjFpdmhOTkZvQnpoOGcxOWQ5cDhaSDFrVjJlQ2c1SnI4WmRQ?=
 =?utf-8?B?M29Pa3BwS3YwZlVMS2ViNWRvVGZ0QnhoSE12Y2FSckRSTm5JNWxVcVEyanNr?=
 =?utf-8?B?L29EZHQwbWhLK0VjQXNMWmNGQzRITUdQVGVKWG85R1dpdUkzWVZENXBYM1Av?=
 =?utf-8?B?LzN0VTZXVnlham5pNDZSdDg1T0F4Z0s1QWQ2d1RBMnpmR3o3cFY2TjEyTEtl?=
 =?utf-8?B?eXhmSU9LdlpBMVJHankvT3A1RllpQkdRbEhjdURRaUN5UzRUZnBneUtDK09T?=
 =?utf-8?B?Vm51Zm5HVkJVdml4SHFGZEcwWk1KUGl6RTQ3Z1Z0d3NjeUtBYlorelg5OTYr?=
 =?utf-8?B?bUliMVpjS05qVnJUNTMyb1dkSnBzbStZWS9TTE1wbi9zbzdPQ0xaUVorTmdE?=
 =?utf-8?B?TStCZnpSREJ4dkordnlDSzA2NWxubWU3Yk1SUjZzWkQ4Q2dEYmtUTGlValQx?=
 =?utf-8?B?V0phTGRXa1Z5T0NsNUs5YlhEenhzL1hCTVBOUDhuQUFVdkplN01lZkhGRkdp?=
 =?utf-8?B?blQ4R1ZOem1DcjljYjJCZXcrMHFmTkJOaXRmMkhQM1BwdTVtNmZSamxZQnh5?=
 =?utf-8?B?Sk1QSWlZSmdiY3REU05oQzlMci90MVE5YjJUVWJ3UGVDeVNodzhZZjRhMkY1?=
 =?utf-8?B?U3V3c0hRc0RtT3ZZeXhMZ0QyelRtMWdOUUZZb2gyUXJSSmRuMVZKVVl5Rlpt?=
 =?utf-8?B?SG5lOVF1MnFsYXJpMXRNK29LTDJnL1RTTHpGY0FsU1JIa0Ftd1UvdGJHeFdX?=
 =?utf-8?B?NFZvNHN3M2tEWHVWRU1DUXM0Vis4SFpXL1JWbml0UkZyVmpKNGFNR3B2Zk9m?=
 =?utf-8?B?c2JMVW9QL01lVGVVY25xY0tnTjQ5c3IxOEc1eGUrZXJrdkxDUGl0MnVwT01S?=
 =?utf-8?B?OXU4SDdscGpaNkZ5eUllbjBCMWlFYXNabElIZVVaZ211aDhLaVlGOTEyUzZ6?=
 =?utf-8?B?MmI0LzE4L1l4ODhtNmlsN1YrWXdvdmFkY0xCNHIwdGpISXJIZmlKUW1pbDh6?=
 =?utf-8?B?QUFlemhGNUQzelEvb3NhWTVGV3VuK1NGRVZlOGxVcmpWRU0vaUdaT3VYV0pE?=
 =?utf-8?B?ZkNaMFVtSWVFbmlPenNadk9jV1NGMHRib1NNUGdxQ0xCbmc4Z2o2QTVSS2Zx?=
 =?utf-8?B?UUJSK0xsNXdhQ0JQRkdDakRuN2dCTXFML3VvSEJZRHRUc1pBNDZTS2oyQkdG?=
 =?utf-8?B?dXhnSkxvM1c2RHNlM0k3RktvQ256VlEwT0UzL05yK01wZDlwY1pQdXJTamZk?=
 =?utf-8?B?YTRJTUdXVk05Y2VVSXR1aE1UVnhhZE1TQ2MzbEtKK3JhbFpla3JCTUZSaWtj?=
 =?utf-8?B?Z1pIQzI2MUNJdmxMZHVjNU8vYithdjc5TWgrL3NYY0NTRnlFOEJpWVBRUkpI?=
 =?utf-8?B?a0Jna3hwTSsySklTWUNxTkZqbzRuN0k3OEh6WjhqN2NpVlRMTSsveWlzNG5Z?=
 =?utf-8?B?bFpXQVB1Tk5CVG1EUkFNOWFGWjhmTjJjY040WFR6ZUpSVWtzRnlIcnFGN0t0?=
 =?utf-8?B?N1lFR1pqQnpubGtsc2J6c05jUkJEaDcrU1VUVC9UbDN6TTZRbEhQMkttZDlN?=
 =?utf-8?B?Qjc1SkdjNFA5L0RWR0xLQVE4NWJrTlhyUWFWajZrRkpYZnhBTnZnajVXbTNm?=
 =?utf-8?B?dE5XVTZKT1RRVGpOL1hqRHdBZmFnTU41K2N1ZEN5cEZEdlJ5cEVqbGQxL3Rh?=
 =?utf-8?B?bG83cFdlak9CM0h1ZTkrMkkxSXlOWUN0N2U1Rkg0UWs4b09kenhyM2RXWndn?=
 =?utf-8?B?YnBKSUtQN3p5c0JqYVMxN2VTcUd6emJOVy9DV3MwUHpKMm9xUTNSU2pveGNl?=
 =?utf-8?B?emJDYzl1cDYxa1orUHFONnRUamUzaE8yc05zZkpDU3J0S0ppdG9JRUF6VVNl?=
 =?utf-8?B?eGNlY2hLTEZ6RkIyaTFZNHRBZlNtZVdsTFppZlhKMU5HZDNxckxxKzRCSFQw?=
 =?utf-8?B?YmJmdStZVWJGZ0luRVZsMlZqalVXcExmMVozYTY2OE1iaGJ6VytSRVkremRR?=
 =?utf-8?B?MDZrUWxGckR6TGxrZGpGa2pBdXRKZ1ZudkdpZjdhM1JRYzlsb1A4MFNFK2FG?=
 =?utf-8?B?YWZaWE9DOS9KU0pXM2VRdmo3aHFTL2NPV3cwbVlSSlpOTHRBNlZzR3BtUlRE?=
 =?utf-8?B?Q2tRWTJyWGFzMERWSXJ6enZaNVJQR2svdXpuZWw0VEZJMUJyVU9TMEttQkN0?=
 =?utf-8?B?WGtXRUxUazh6aHZFNEdvSExPMVFpZnBsRkRjZEI0OEJ4U3A3ZlFIMHVKUm5a?=
 =?utf-8?B?WGR6ZzFQQVRFdHNtMUpBUUJ1OGcwaXZLMmo2ditaTXFyVThqQmhKT3RnNi8w?=
 =?utf-8?Q?6eLZdNWKRpS5lyfsuSxWndeXD6RveqHMsPFVZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ae4c7c-74e4-478c-88ed-08dee2953d87
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:19:34.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfW7PLxG7V8darICqSqOrYGwhbHljt+3lFf5um5KYoEpJvcbchgrG1k+gj1SXDq465nKxOpJ0Lgc7U7bomiOSGJBaH2nWE+xWXK4Ml7ykD+gTb571JPE+dXl7tivlAA4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10509

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Following checks are performed on the incoming msg-header,
to block exchanging invalid arbitrary commands:
- maximum allowed words,
- check if command-tag & response-tag are valid
- version,
- command id validation check, to allow limited base-line API(s)
  and restrict following:
  - exchanging power management commands.
  - reset requests.
  - BBSM configuration requests.
  - re-initializing the FW.
  - RNG init
  - CAAM resource release management
  - SE's internal memory management.
from user-space.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
Changes from v26 to v27

Fix issues reported by Sashiko while reviewing patch 5/7:
---------------------------------------------------------
1. Critical: allocated DMA address for encrypted IMEM buffer discarded
   Status: Fixed.
   The IMEM buffer stores dma_addr_t daddr, and save/restore uses imem->daddr.

2. High: command receiver contexts bypass response timeout
   Status: Fixed.
   Timeout classification is now based on the callback handle used for the wait,
   not file/device context identity.

3. High: dlink_dev_ctx() frees command receiver rx_msg without lock
   Status: Fixed.
   dlink_dev_ctx() now clears command-receiver callback state under
   cmd_receiver_clbk_hdl.clbk_rx_lock and frees the old rx_msg after
   dropping the lock.

4. High: missing kref_init() in init_device_context()
   Status: Fixed.
   The v27 changelog states init_device_context() now calls
   kref_init(&dev_ctx->refcount)

5. High: unbind/remove hangs when userspace is blocked in read()
   Status: Fixed.
   The read path no longer holds dev_ctx->fops_lock across the
   blocking ele_msg_rcv() wait, allowing teardown to acquire
   fops_lock and clean the context.

6. High: DMA memory freed while firmware may still process timed-out transaction
   Status: Fixed.
   fw_busy now tracks the exact timed-out dev_ctx via priv->fw_busy_dev_ctx.
   Cleanup skips freeing coherent DMA only for that context.
   Late response handling uses work, and teardown calls cancel_work_sync()
   plus se_clear_fw_busy().

7. High: concurrent ioctls can trigger multiple firmware authentications
   Status: Fixed.
   Firmware load state is serialized using load_fw->load_fw_lock.

8. High: get_se_soc_id() type confusion leaks pointer bits
   Status: Fixed.
   get_se_soc_id() now treats device_get_match_data() as struct se_if_node * and
   reads if_node->se_info->soc_id.

9. High: early mailbox send failure leaves dangling shared response waiter
   Status: Fixed.
   ele_msg_send_rcv() now clears response waiter state under clbk_rx_lock
   on mailbox send failure.

10. High: invalid dma_to_phys() on coherent DMA address
    Status: Fixed.
    Firmware authentication and IMEM service-swap paths use dma_addr_t end-to-end.
    dma_to_phys() was removed from this path.

11. Medium: UAPI ioctl structs use variable-sized pointers/types
    Status: Fixed.
    The UAPI ioctl structures now use fixed-width __u64 for user pointers and
    __u32 for sizes. Kernel code uses u64_to_user_ptr(), and
    .compat_ioctl = compat_ptr_ioctl is registered.

12. Medium: unbounded user size passed to memdup_user()
    Status: Fixed.
    MAX_ALLOWED_TX_MSG_SZ is introduced and user-provided TX/write
    sizes are validated before memdup_user().

13. Pre-existing high: misdirected signal handling in ele_msg_rcv()
    Status: Fixed / design-controlled.
    Deferred signal handling is tied to the response-wait callback handle
    instead of blindly modifying priv->waiting_rsp_clbk_hdl from unrelated
    wait paths. Command receiver daemon waits are kept separate from
    synchronous response waits.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260629-imx-se-if-v26-0-146446285744@nxp.com?part=5
---
 Documentation/ABI/testing/se-cdev   |   44 ++
 drivers/firmware/imx/Makefile       |    2 +-
 drivers/firmware/imx/ele_base_msg.c |   28 +
 drivers/firmware/imx/ele_base_msg.h |   19 +
 drivers/firmware/imx/ele_common.c   |   85 ++-
 drivers/firmware/imx/ele_common.h   |    6 +
 drivers/firmware/imx/ele_fw_api.c   |   57 ++
 drivers/firmware/imx/ele_fw_api.h   |   18 +
 drivers/firmware/imx/se_ctrl.c      | 1178 ++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |   67 +-
 include/uapi/linux/se_ioctl.h       |   97 +++
 11 files changed, 1571 insertions(+), 30 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..c6b8e16bda78
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,44 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		Mar 2025
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git,
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 4412b15846b1..3f41131a0fdc 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -4,5 +4,5 @@ obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
 obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
-sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o
+sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o ele_fw_api.o
 obj-${CONFIG_IMX_SEC_ENCLAVE}	+= sec_enclave.o
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index fcd2bcaeefc8..28674dc9365f 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -15,6 +15,34 @@
 
 #define FW_DBG_DUMP_FIXED_STR		"ELE"
 
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header)
+{
+	switch (header->command) {
+	case ELE_PING_REQ: return 0;
+	case ELE_DEBUG_DUMP_REQ: return 0;
+	case ELE_OEM_AUTH_CONTAINER_REQ: return 0;
+	case ELE_OEM_VERIFY_IMAGE_REQ: return 0;
+	case ELE_OEM_REL_CONTAINER_REQ: return 0;
+	case ELE_FW_LIFE_CYCLE_REQ: return 0;
+	case ELE_READ_FUSE_REQ: return 0;
+	case ELE_GET_FW_VERS_REQ: return 0;
+	case ELE_RETURN_LIFE_CYCLE_REQ: return 0;
+	case ELE_GET_EVENT_REQ: return 0;
+	case ELE_COMMIT_REQ: return 0;
+	case ELE_GEN_KEY_BLOB_REQ: return 0;
+	case ELE_GET_FW_STATUS_REQ: return 0;
+	case ELE_XIP_DECRYPT_REQ: return 0;
+	case ELE_WRITE_FUSE: return 0;
+	case ELE_GET_INFO_REQ: return 0;
+	case ELE_DEV_ATTEST_REQ: return 0;
+	case ELE_WRITE_SHADOW_FUSE_REQ: return 0;
+	case ELE_READ_SHADOW_FUSE_REQ: return 0;
+	default:
+		return -EACCES;
+	}
+}
+
 int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 {
 	dma_addr_t get_info_addr = 0;
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 4c3699543e87..238465a4eccd 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -15,6 +15,23 @@
 
 #define ELE_NONE_VAL			0x0
 
+#define ELE_OEM_AUTH_CONTAINER_REQ	0x87
+#define ELE_OEM_VERIFY_IMAGE_REQ	0x88
+#define ELE_OEM_REL_CONTAINER_REQ	0x89
+#define ELE_FW_LIFE_CYCLE_REQ		0x95
+#define ELE_READ_FUSE_REQ		0x97
+#define ELE_GET_FW_VERS_REQ		0x9d
+#define ELE_RETURN_LIFE_CYCLE_REQ	0xa0
+#define ELE_GET_EVENT_REQ		0xa2
+#define ELE_COMMIT_REQ			0xa8
+#define ELE_GEN_KEY_BLOB_REQ		0xaf
+#define ELE_GET_FW_STATUS_REQ		0xc5
+#define ELE_XIP_DECRYPT_REQ		0xc6
+#define ELE_WRITE_FUSE                  0xd6
+#define ELE_DEV_ATTEST_REQ              0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
+#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
@@ -95,4 +112,6 @@ int ele_service_swap(struct se_if_priv *priv, dma_addr_t addr,
 int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 			dma_addr_t img_addr);
 int ele_debug_dump(struct se_if_priv *priv);
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header);
 #endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 955b7409ff9f..7deff38c4613 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -5,6 +5,27 @@
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
+#include "ele_fw_api.h"
+#include "se_ctrl.h"
+
+int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	if (!header->size || header->size > MAX_WORD_SIZE)
+		return -EINVAL;
+
+	if (header->tag != priv->if_defs->cmd_tag &&
+	    header->tag != priv->if_defs->rsp_tag)
+		return -EINVAL;
+
+	if (header->ver == priv->if_defs->base_api_ver)
+		return ele_uapi_allowed_base_cmd(priv, header);
+	else if (header->ver == priv->if_defs->fw_api_ver)
+		return ele_uapi_allowed_fw_cmd(dev_ctx, header);
+
+	return -EINVAL;
+}
 
 /*
  * se_get_msg_chksum() - to calculate checksum word by word.
@@ -42,16 +63,50 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
+static void se_mark_fw_busy(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->fw_busy_lock, flags);
+	if (!priv->fw_busy_dev_ctx) {
+		kref_get(&dev_ctx->refcount);
+		priv->fw_busy_dev_ctx = dev_ctx;
+		atomic_set(&priv->fw_busy, 1);
+	}
+	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
+}
+
+void set_se_rcv_msg_timeout(struct se_if_device_ctx *dev_ctx, u32 timeout_ms)
+{
+	dev_ctx->rcv_msg_timeout_jiffies = msecs_to_jiffies(timeout_ms);
+}
+
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	struct se_if_priv *priv = dev_ctx->priv;
+	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
+	unsigned long deadline_jiffies;
 	unsigned long flags;
 	int ret;
 
-	remaining_jiffies = MAX_SCHEDULE_TIMEOUT;
+	remaining_jiffies = dev_ctx->rcv_msg_timeout_jiffies;
+	if (se_clbk_hdl == &priv->waiting_rsp_clbk_hdl) {
+		is_rsp_wait_with_timeout = true;
+		deadline_jiffies = jiffies + remaining_jiffies;
+	}
+
 	do {
+		if (is_rsp_wait_with_timeout) {
+			if (time_after_eq(jiffies, deadline_jiffies)) {
+				ret = -ETIMEDOUT;
+				break;
+			}
+			remaining_jiffies = deadline_jiffies - jiffies;
+		}
+
 		if (wait_uninterruptible)
 			ret = wait_for_completion_timeout(&se_clbk_hdl->done,
 							  remaining_jiffies);
@@ -67,6 +122,9 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			 * synchronized state.
 			 */
 			if (READ_ONCE(priv->waiting_rsp_clbk_hdl.dev_ctx)) {
+				if (!is_rsp_wait_with_timeout)
+					return ret;
+
 				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
 				wait_uninterruptible = true;
 				continue;
@@ -91,7 +149,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 			se_clbk_hdl->rx_msg = NULL;
 			if (!completion_done(&se_clbk_hdl->done))
-				atomic_set(&priv->fw_busy, 1);
+				se_mark_fw_busy(dev_ctx);
 
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			ret = -ETIMEDOUT;
@@ -206,6 +264,7 @@ static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
+	bool schedule_fw_busy_work = false;
 	struct device *dev = mbox_cl->dev;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
@@ -284,9 +343,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (!se_clbk_hdl->rx_msg) {
-			/* Close circuit breaker on spinlock race */
-			atomic_set(&priv->fw_busy, 0);
+			if (atomic_read(&priv->fw_busy))
+				schedule_fw_busy_work = true;
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+			if (schedule_fw_busy_work)
+				schedule_work(&priv->fw_busy_work);
+
 			dev_info(dev, "ELE responded (late), recovery FW available.");
 			return;
 		}
@@ -327,31 +390,31 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 	u32 status;
 
 	if (header->tag != priv->if_defs->rsp_tag) {
-		dev_err(priv->dev, "MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)",
+		dev_dbg(priv->dev, "MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)",
 			msg_id, header->tag, priv->if_defs->rsp_tag);
 		return -EINVAL;
 	}
 
 	if (header->command != msg_id) {
-		dev_err(priv->dev, "MSG Header: Cmd id mismatch. (0x%x != 0x%x)",
+		dev_dbg(priv->dev, "MSG Header: Cmd id mismatch. (0x%x != 0x%x)",
 			header->command, msg_id);
 		return -EINVAL;
 	}
 
 	if ((sz % 4) || (header->size != (sz >> 2) &&
 			 !check_hdr_exception_for_sz(priv, header))) {
-		dev_err(priv->dev, "MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)",
+		dev_dbg(priv->dev, "MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)",
 			msg_id, header->size, (sz >> 2));
 		return -EINVAL;
 	}
 
 	if (is_base_api && header->ver != priv->if_defs->base_api_ver) {
-		dev_err(priv->dev,
+		dev_dbg(priv->dev,
 			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x != 0x%x)",
 			msg_id, header->ver, priv->if_defs->base_api_ver);
 		return -EINVAL;
 	} else if (!is_base_api && header->ver != priv->if_defs->fw_api_ver) {
-		dev_err(priv->dev,
+		dev_dbg(priv->dev,
 			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x != 0x%x)",
 			msg_id, header->ver, priv->if_defs->fw_api_ver);
 		return -EINVAL;
@@ -359,7 +422,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 
 	status = RES_STATUS(msg->data[0]);
 	if (status != priv->if_defs->success_tag) {
-		dev_err(priv->dev, "Command Id[%x], Response Failure = 0x%x",
+		dev_dbg(priv->dev, "Command Id[%x], Response Failure = 0x%x",
 			header->command, status);
 		return -EPERM;
 	}
@@ -420,7 +483,7 @@ int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
 	 * restore imem state.
 	 */
 	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
-		return -EIO;
+		return 0;
 
 	/*
 	 * IMPORT command will restore IMEM from the given
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 6c419e5c4404..228ca900d32c 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -12,6 +12,11 @@
 
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
+#define MAX_WORD_SIZE			0x20
+#define SE_RCV_MSG_DEFAULT_TIMEOUT	5000
+#define SE_RCV_MSG_LONG_TIMEOUT		5000000
+
+void set_se_rcv_msg_timeout(struct se_if_device_ctx *dev_ctx, u32 val);
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
@@ -40,4 +45,5 @@ int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
+int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header);
 #endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
new file mode 100644
index 000000000000..4f0f2cb53857
--- /dev/null
+++ b/drivers/firmware/imx/ele_fw_api.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "se_ctrl.h"
+#include "ele_fw_api.h"
+
+static bool se_cmd_receiver_allowed_cmd(u8 cmd)
+{
+	switch (cmd) {
+	case ELE_SESSION_CLOSE_REQ:
+	case ELE_STORAGE_CLOSE_REQ:
+	case ELE_STORAGE_MASTER_IMPORT_REQ:
+		return true;
+	default:
+		return false;
+	}
+}
+
+int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	bool is_cmd_receiver = false;
+
+	scoped_guard(mutex, &priv->modify_lock)
+		if (dev_ctx == priv->cmd_receiver_clbk_hdl.dev_ctx)
+			is_cmd_receiver = true;
+
+	if (header->tag == priv->if_defs->cmd_tag) {
+		if (is_cmd_receiver && !se_cmd_receiver_allowed_cmd(header->command))
+			return -EOPNOTSUPP;
+	}
+
+	if (header->tag == priv->if_defs->rsp_tag && !is_cmd_receiver)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
+{
+	if (header->command == ELE_STORAGE_OPEN_REQ) {
+		int rc = 0;
+
+		rc = set_dev_ctx_as_command_receiver(dev_ctx);
+		if (rc)
+			dev_err(dev_ctx->priv->dev,
+				"Failed to register %s as CMD-Receiver: %d\n",
+				dev_ctx->devname, rc);
+	}
+	if (header->command == ELE_STORAGE_CLOSE_REQ) {
+		scoped_guard(mutex, &dev_ctx->priv->modify_lock)
+			unset_dev_ctx_as_command_receiver(dev_ctx);
+	}
+}
+
diff --git a/drivers/firmware/imx/ele_fw_api.h b/drivers/firmware/imx/ele_fw_api.h
new file mode 100644
index 000000000000..e017359b5053
--- /dev/null
+++ b/drivers/firmware/imx/ele_fw_api.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2026 NXP
+ */
+
+#ifndef ELE_FW_API_H
+#define ELE_FW_API_H
+#include "se_ctrl.h"
+
+#define ELE_SESSION_OPEN_REQ            0x10u
+#define ELE_SESSION_CLOSE_REQ           0x11u
+#define ELE_STORAGE_OPEN_REQ            0xE0u
+#define ELE_STORAGE_CLOSE_REQ           0xE1u
+#define ELE_STORAGE_MASTER_IMPORT_REQ   0xE2u
+
+int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header);
+void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header);
+#endif /* ELE_FW_API_H */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 25f9cd5441f9..fb82df5c58d5 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -4,10 +4,10 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
-#include <linux/dma-direct.h>
 #include <linux/dma-mapping.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -16,6 +16,7 @@
 #include <linux/genalloc.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kref.h>
 #include <linux/miscdevice.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -25,22 +26,21 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
+#include "ele_fw_api.h"
 #include "se_ctrl.h"
 
+/* Maximum response buffer size in bytes for debug-dump replies. */
+#define MAX_ALLOWED_RX_MSG_SZ		ELE_DEBUG_DUMP_RSP_SZ
+#define MAX_ALLOWED_TX_MSG_SZ		SZ_4K
+
 #define MAX_SOC_INFO_DATA_SZ		256
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
 
-#define SE_TYPE_STR_DBG			"dbg"
-#define SE_TYPE_STR_HSM			"hsm"
-
-#define SE_TYPE_ID_DBG			0x1
-
-#define SE_TYPE_ID_HSM			0x2
-
 struct se_var_info {
 	u16 soc_rev;
 };
@@ -120,6 +120,13 @@ char *get_se_if_name(u8 se_if_id)
 	return NULL;
 }
 
+static u32 get_se_soc_id(struct se_if_priv *priv)
+{
+	const struct se_if_node *if_node = device_get_match_data(priv->dev);
+
+	return if_node->se_info->soc_id;
+}
+
 static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
 {
 	return &priv->load_fw;
@@ -197,11 +204,234 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
+{
+	const struct firmware *fw = NULL;
+	dma_addr_t se_fw_dma_addr;
+	u8 *se_fw_buf;
+	int ret;
+
+	if (!se_img_file_to_load) {
+		dev_err(priv->dev, "FW image is not provided.");
+		return -EINVAL;
+	}
+	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
+	if (ret)
+		return ret;
+
+	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
+
+	/* allocate buffer to store the SE FW */
+	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size, &se_fw_dma_addr, GFP_KERNEL);
+	if (!se_fw_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	memcpy(se_fw_buf, fw->data, fw->size);
+	ret = ele_fw_authenticate(priv, se_fw_dma_addr, se_fw_dma_addr);
+	if (ret < 0) {
+		dev_err(priv->dev,
+			"Error %pe: Authenticate & load SE firmware %s.",
+			ERR_PTR(ret), se_img_file_to_load);
+		ret = -EPERM;
+	}
+	dma_free_coherent(priv->dev, fw->size, se_fw_buf, se_fw_dma_addr);
+exit:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int se_load_firmware(struct se_if_priv *priv)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	int ret = 0;
+
+	guard(mutex)(&load_fw->load_fw_lock);
+	if (!load_fw->is_fw_tobe_loaded)
+		return 0;
+
+	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
+		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
+		if (ret) {
+			dev_err(priv->dev, "Failed to load boot firmware.");
+			return -EPERM;
+		}
+	}
+
+	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
+	if (ret) {
+		dev_err(priv->dev, "Failed to load runtime firmware.");
+		return -EPERM;
+	}
+
+	load_fw->is_fw_tobe_loaded = false;
+
+	return ret;
+}
+
+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	/*
+	 * Allocate some memory for data exchanges with S40x.
+	 * This will be used for data not requiring secure memory.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr =
+			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					   GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* Free non-secure shared buffer. */
+	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+			  se_shared_mem_mgmt->non_secure_mem.ptr,
+			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+/* Need to copy the output data to user-device context.
+ */
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+			dev_dbg(priv->dev, "Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+						   b_desc->shared_buf_ptr,
+						   b_desc->size)) {
+				dev_err(priv->dev, "Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
+		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
+			if (b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static struct se_buf_desc *add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+						      struct se_ioctl_setup_iobuf *io,
+						      struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc = NULL;
+
+	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);
+	if (!b_desc)
+		return ERR_PTR(-ENOMEM);
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = u64_to_user_ptr(io->user_buf);
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return b_desc;
+}
+
+static void se_if_open_gate_release(struct kref *kref)
+{
+	struct se_if_open_gate *gate =
+		container_of(kref, struct se_if_open_gate, refcount);
+
+	kfree(gate);
+}
+
+static bool se_if_open_gate_get(struct se_if_open_gate *gate)
+{
+	if (!gate)
+		return false;
+
+	return kref_get_unless_zero(&gate->refcount);
+}
+
+static void se_if_open_gate_put(struct se_if_open_gate *gate)
+{
+	if (gate)
+		kref_put(&gate->refcount, se_if_open_gate_release);
+}
+
 static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
-				    struct se_if_device_ctx **new_dev_ctx)
+				    struct se_if_device_ctx **new_dev_ctx,
+				    const struct file_operations *se_if_fops)
 {
 	const char *err_str = "Failed to allocate memory";
 	struct se_if_device_ctx *dev_ctx;
+	struct se_if_open_gate *gate = NULL;
 	int ret = -ENOMEM;
 
 	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
@@ -215,18 +445,865 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx->devname)
 		goto exit;
 
+	mutex_init(&dev_ctx->fops_lock);
+
 	dev_ctx->priv = priv;
+	kref_init(&dev_ctx->refcount);
+	dev_ctx->cleanup_done = false;
 	*new_dev_ctx = dev_ctx;
+	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_DEFAULT_TIMEOUT);
+
+	gate = kzalloc_obj(*gate, GFP_KERNEL);
+	if (!gate)
+		goto exit;
+
+	mutex_init(&gate->lock);
+	kref_init(&gate->refcount);    /* device-owned reference */
+	gate->priv = priv;
+	gate->dying = false;
+	priv->open_gate = gate;
+
+	/*
+	 * The miscdevice storage is now owned by the open gate object.
+	 * priv->priv_dev_ctx still keeps a pointer to that miscdevice.
+	 */
+	dev_ctx->miscdev = &gate->miscdev;
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret) {
+		err_str = "Failed to register misc device.";
+		goto exit;
+	}
 
 	return ret;
 exit:
 	*new_dev_ctx = NULL;
-
+	if (gate) {
+		priv->open_gate = NULL;
+		se_if_open_gate_put(gate);
+	}
 	kfree(dev_ctx->devname);
 	kfree(dev_ctx);
 	return dev_err_probe(priv->dev, ret, "%s", err_str);
 }
 
+static void se_if_priv_release(struct kref *kref)
+{
+	struct se_if_priv *priv = container_of(kref, struct se_if_priv, refcount);
+
+	/* Free priv_dev_ctx if it exists */
+	if (priv->priv_dev_ctx) {
+		/*
+		 * miscdev storage belongs to open_gate, not directly to
+		 * priv_dev_ctx. The gate should already have been detached
+		 * from priv during teardown.
+		 */
+
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+		priv->priv_dev_ctx = NULL;
+	}
+
+	/*
+	 * Be defensive: if teardown did not already drop the device-owned
+	 * gate reference for some reason, release it here.
+	 */
+	if (priv->open_gate) {
+		se_if_open_gate_put(priv->open_gate);
+		priv->open_gate = NULL;
+	}
+
+	/* Free any remaining resources that weren't devm-managed */
+	kfree(priv);
+}
+
+static void se_if_dev_ctx_release(struct kref *kref)
+{
+	struct se_if_device_ctx *dev_ctx =
+		container_of(kref, struct se_if_device_ctx, refcount);
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	kfree(dev_ctx);
+
+	/* drop the priv reference owned by this device context */
+	kref_put(&priv->refcount, se_if_priv_release);
+}
+
+static void se_clear_fw_busy(struct se_if_priv *priv)
+{
+	struct se_if_device_ctx *dev_ctx = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->fw_busy_lock, flags);
+	dev_ctx = priv->fw_busy_dev_ctx;
+	priv->fw_busy_dev_ctx = NULL;
+	atomic_set(&priv->fw_busy, 0);
+	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
+
+	if (!dev_ctx)
+		return;
+
+	scoped_guard(mutex, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			cleanup_se_shared_mem(dev_ctx);
+	}
+
+	kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+}
+
+void unset_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_api_msg *old_rx_msg = NULL;
+	struct se_clbk_handle *se_clbk_hdl;
+	unsigned long flags;
+
+	lockdep_assert_held(&priv->modify_lock);
+	se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+
+	if (se_clbk_hdl->dev_ctx == dev_ctx) {
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		old_rx_msg = se_clbk_hdl->rx_msg;
+		se_clbk_hdl->dev_ctx = NULL;
+		se_clbk_hdl->rx_msg = NULL;
+		se_clbk_hdl->rx_msg_sz = 0;
+		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+		kfree(old_rx_msg);
+		complete_all(&se_clbk_hdl->done);
+	}
+}
+
+int set_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_api_msg *new_rx_msg = NULL;
+	struct se_clbk_handle *se_clbk_hdl;
+	unsigned long flags;
+
+	se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+	guard(mutex)(&priv->modify_lock);
+	if (se_clbk_hdl->dev_ctx == dev_ctx)
+		return 0;
+
+	if (se_clbk_hdl->dev_ctx)
+		return -EBUSY;
+
+	if (!se_clbk_hdl->rx_msg) {
+		new_rx_msg = kzalloc(MAX_NVM_MSG_LEN, GFP_KERNEL);
+		if (!new_rx_msg)
+			return -ENOMEM;
+	}
+	spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+	if (new_rx_msg)
+		se_clbk_hdl->rx_msg = new_rx_msg;
+	reinit_completion(&se_clbk_hdl->done);
+	se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
+	se_clbk_hdl->dev_ctx = dev_ctx;
+	dev_ctx->rcv_msg_timeout_jiffies = MAX_SCHEDULE_TIMEOUT;
+	spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+	return 0;
+}
+
+static void dlink_dev_ctx(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	unset_dev_ctx_as_command_receiver(dev_ctx);
+
+	if (!list_empty(&dev_ctx->link)) {
+		list_del_init(&dev_ctx->link);
+		priv->active_devctx_count--;
+	}
+}
+
+static bool se_is_fw_busy_ctx(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	unsigned long flags;
+	bool match;
+
+	spin_lock_irqsave(&priv->fw_busy_lock, flags);
+	match = priv->fw_busy_dev_ctx == dev_ctx;
+	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
+
+	return match;
+}
+
+static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
+{
+	scoped_guard(mutex, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			goto exit;
+
+		/*
+		 * fw_busy is caused by one timed-out synchronous transaction. Only that
+		 * transaction's dev_ctx may still have coherent memory referenced by FW.
+		 * Do not skip cleanup for unrelated contexts while fw_busy is set.
+		 */
+		if (se_is_fw_busy_ctx(dev_ctx))
+			dev_warn(dev_ctx->priv->dev,
+				 "%s: deferring shared memory cleanup while FW is busy\n",
+				 dev_ctx->devname);
+		else
+			cleanup_se_shared_mem(dev_ctx);
+
+		kfree(dev_ctx->devname);
+		dev_ctx->devname = NULL;
+		dev_ctx->cleanup_done = true;
+	}
+exit:
+	if (is_fclose)
+		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+}
+
+static void dlink_n_cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	if (is_fclose) {
+		scoped_guard(mutex, &priv->modify_lock)
+			dlink_dev_ctx(dev_ctx);
+	}
+
+	cleanup_dev_ctx(dev_ctx, is_fclose);
+}
+
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			       struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
+	kref_init(&dev_ctx->refcount);
+	dev_ctx->priv = priv;
+	dev_ctx->cleanup_done = false;
+	INIT_LIST_HEAD(&dev_ctx->link);
+	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_LONG_TIMEOUT);
+	*new_dev_ctx = dev_ctx;
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0) {
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+		*new_dev_ctx = NULL;
+
+		return ret;
+	}
+
+	/* Take a reference to priv for this device context */
+	kref_get(&priv->refcount);
+
+	scoped_guard(mutex, &priv->modify_lock) {
+		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+		priv->active_devctx_count++;
+	}
+
+	return ret;
+}
+
+static int se_ioctl_cmd_snd_rcv_cleanup(struct se_if_device_ctx *dev_ctx, void __user *uarg,
+					struct se_ioctl_cmd_snd_rcv_rsp_info *cmd_snd_rcv_rsp_info)
+{
+	/* shared memory is allocated before this IOCTL */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (cmd_snd_rcv_rsp_info->rx_buf_sz &&
+	    copy_to_user(uarg, cmd_snd_rcv_rsp_info, sizeof(*cmd_snd_rcv_rsp_info))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info to user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    void __user *uarg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
+	struct se_if_priv *priv = dev_ctx->priv;
+	int rsp_status_err = 0;
+	int cleanup_err = 0;
+	int err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, uarg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EFAULT;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ ||
+	    cmd_snd_rcv_rsp_info.tx_buf_sz > MAX_ALLOWED_TX_MSG_SZ) {
+		dev_err(priv->dev, "%s: User buffer too small/large(%d < %d)",
+			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ ? SE_MU_HDR_SZ :
+								MAX_ALLOWED_TX_MSG_SZ);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -ENOSPC;
+	}
+
+	struct se_api_msg *tx_msg __free(kfree) =
+		memdup_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.tx_buf),
+			    cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	err = se_chk_tx_msg_hdr(dev_ctx, &tx_msg->header);
+	if (err) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	if (cmd_snd_rcv_rsp_info.rx_buf_sz < sizeof(struct se_msg_hdr) ||
+	    cmd_snd_rcv_rsp_info.rx_buf_sz > MAX_ALLOWED_RX_MSG_SZ) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EINVAL;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EINVAL;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
+			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+			return -EPERM;
+		}
+	}
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -ENOMEM;
+	}
+
+	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+
+		return err;
+	}
+
+	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
+		"message received, start transmit to user");
+
+	rsp_status_err =
+		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
+					cmd_snd_rcv_rsp_info.rx_buf_sz,
+					tx_msg->header.ver == priv->if_defs->base_api_ver);
+
+	if (!rsp_status_err) {
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0) {
+			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+			return err;
+		}
+	}
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.rx_buf), rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	cleanup_err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+
+	if (cleanup_err && !err)
+		err = cleanup_err;
+
+	if (!err && !rsp_status_err)
+		fw_api_specific_ops(dev_ctx, &tx_msg->header);
+
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				void __user *uarg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_ioctl_get_if_info if_info;
+	struct se_if_node *if_node;
+	int err = 0;
+
+	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = 0;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
+		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
+		if_info.did);
+
+	if (copy_to_user(uarg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+static void rollback_shared_mem_pos(struct se_if_device_ctx *dev_ctx, u32 length)
+{
+	struct se_shared_mem *shared_mem = NULL;
+
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	if (WARN_ON_ONCE(length > shared_mem->pos)) {
+		shared_mem->pos = 0;
+		return;
+	}
+
+	shared_mem->pos -= length;
+}
+
+static int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
+			       u32 *length, dma_addr_t *ele_dma_addr, void **ptr)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	size_t aligned_len = 0;
+	u32 pos;
+
+	aligned_len = round_up((size_t)*length, 8);
+	if (aligned_len < *length) {
+		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
+			dev_ctx->devname);
+		return -EINVAL;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %zd, max_size= %d, curr_pos = %d",
+		dev_ctx->devname, aligned_len, shared_mem->size,
+		shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+	    aligned_len > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
+			dev_ctx->devname);
+		return -ENOMEM;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += aligned_len;
+	*ele_dma_addr = (u64)shared_mem->dma_addr + pos;
+	*ptr = shared_mem->ptr + pos;
+	*length = aligned_len;
+
+	memset(shared_mem->ptr + pos, 0, aligned_len);
+
+	return 0;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					void __user *uarg)
+{
+	struct se_ioctl_setup_iobuf io = {0};
+	struct se_buf_desc *b_desc = NULL;
+	void *dma_buf_ptr = NULL;
+	dma_addr_t ele_dma_addr;
+	u32 aligned_len = 0;
+	int err = 0;
+
+	if (copy_from_user(&io, uarg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
+		u64_to_user_ptr(io.user_buf), io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	aligned_len = io.length;
+	err = get_shared_mem_slot(dev_ctx, &aligned_len, &ele_dma_addr, &dma_buf_ptr);
+	if (err)
+		return err;
+
+	io.ele_addr = ele_dma_addr;
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(dma_buf_ptr, u64_to_user_ptr(io.user_buf),
+				   io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory.",
+				dev_ctx->devname);
+			err = -EFAULT;
+			goto rollback;
+		}
+	}
+
+	b_desc = add_b_desc_to_pending_list(dma_buf_ptr, &io, dev_ctx);
+	if (IS_ERR(b_desc)) {
+		err = PTR_ERR(b_desc);
+		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+		goto rollback;
+	}
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user(uarg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto rollback;
+	}
+	return err;
+
+rollback:
+	if (!IS_ERR_OR_NULL(b_desc)) {
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	if (dma_buf_ptr && aligned_len) {
+		memset(dma_buf_ptr, 0, aligned_len);
+		rollback_shared_mem_pos(dev_ctx, aligned_len);
+	}
+
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx,
+					    void __user *uarg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = copy_to_user(uarg, (u8 *)(&soc_info), sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
+			return -EINVAL;
+
+		if (size < SE_MU_HDR_SZ || size > MAX_ALLOWED_TX_MSG_SZ) {
+			dev_err(priv->dev, "%s: User buffer too small/large(%zu < %d)",
+				dev_ctx->devname, size,
+				size < SE_MU_HDR_SZ ? SE_MU_HDR_SZ :
+								MAX_ALLOWED_TX_MSG_SZ);
+			return -ENOSPC;
+		}
+
+		struct se_api_msg *tx_msg __free(kfree) = memdup_user(buf, size);
+		if (IS_ERR(tx_msg))
+			return PTR_ERR(tx_msg);
+
+		err = se_chk_tx_msg_hdr(dev_ctx, &tx_msg->header);
+		if (err)
+			return err;
+
+		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     tx_msg, size, false);
+
+		err = ele_msg_send(dev_ctx, tx_msg, size);
+
+		return err;
+	}
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
+			       loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	unsigned long flags;
+	size_t copy_len;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done) {
+			priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			return -ENODEV;
+		}
+
+		priv = dev_ctx->priv;
+
+		dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			return -EINVAL;
+		}
+	}
+
+	err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+	if (err < 0) {
+		if (err != -ERESTARTSYS)
+			dev_err(priv->dev,
+				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
+				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
+		goto exit;
+	}
+
+	spin_lock_irqsave(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+	if (priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx ||
+	    !priv->cmd_receiver_clbk_hdl.rx_msg ||
+	    !priv->cmd_receiver_clbk_hdl.rx_msg_sz) {
+		spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+		err = -ENODEV;
+		goto exit;
+	}
+	spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+			     priv->cmd_receiver_clbk_hdl.rx_msg,
+			     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
+			     false);
+
+	copy_len = min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
+
+	if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len))
+		err = -EFAULT;
+	else
+		err = copy_len;
+
+exit:
+	priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	return err;
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp)
+{
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_open_gate *gate;
+	struct se_if_device_ctx *misc_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	struct se_if_priv *priv;
+	int err = 0;
+
+	gate = container_of(miscdev, struct se_if_open_gate, miscdev);
+
+	if (!se_if_open_gate_get(gate))
+		return -ENODEV;
+
+	if (mutex_lock_interruptible(&gate->lock)) {
+		se_if_open_gate_put(gate);
+		return -EBUSY;
+	}
+
+	if (gate->dying || !gate->priv ||
+	    !kref_get_unless_zero(&gate->priv->refcount)) {
+		err = -ENODEV;
+		goto out_unlock_gate;
+	}
+
+	priv = gate->priv;
+	mutex_unlock(&gate->lock);
+
+	misc_dev_ctx = priv->priv_dev_ctx;
+
+	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock)) {
+		err = -EBUSY;
+		goto out_put_priv;
+	}
+
+	if (misc_dev_ctx->cleanup_done) {
+		err = -ENODEV;
+		goto out_unlock_misc;
+	}
+
+	priv->dev_ctx_mono_count++;
+	err = init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);
+	if (err) {
+		dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
+		goto out_unlock_misc;
+	}
+
+	fp->private_data = dev_ctx;
+
+out_unlock_misc:
+	mutex_unlock(&misc_dev_ctx->fops_lock);
+out_put_priv:
+	kref_put(&priv->refcount, se_if_priv_release);
+	se_if_open_gate_put(gate);
+	return err;
+out_unlock_gate:
+	mutex_unlock(&gate->lock);
+	se_if_open_gate_put(gate);
+	return err;
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+
+	dlink_n_cleanup_dev_ctx(dev_ctx, true);
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */
+static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	void __user *uarg = (void __user *)arg;
+	long err;
+
+	/* Prevent race during change of device context */
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		switch (cmd) {
+		case SE_IOCTL_ENABLE_CMD_RCV: {
+			err = set_dev_ctx_as_command_receiver(dev_ctx);
+			if (err)
+				dev_err(priv->dev, "Failed to register %s as CMD-Receiver: %ld\n",
+					dev_ctx->devname, err);
+		break;
+		}
+		case SE_IOCTL_GET_MU_INFO:
+			err = se_ioctl_get_mu_info(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_SETUP_IOBUF:
+			err = se_ioctl_setup_iobuf_handler(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_GET_SOC_INFO:
+			err = se_ioctl_get_se_soc_info_handler(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_CMD_SEND_RCV_RSP:
+			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, uarg);
+			break;
+		default:
+			err = -ENOTTY;
+			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
+				dev_ctx->devname, cmd);
+		}
+	}
+
+	return err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.compat_ioctl   = compat_ptr_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -257,6 +1334,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 static void se_if_probe_cleanup(void *plat_dev)
 {
 	struct platform_device *pdev = plat_dev;
+	struct se_if_device_ctx *dev_ctx;
 	struct device *dev = &pdev->dev;
 	struct se_if_priv *priv;
 
@@ -264,6 +1342,61 @@ static void se_if_probe_cleanup(void *plat_dev)
 	if (!priv)
 		return;
 
+	/*
+	 * Mark the private device context as cleanup_done first.
+	 * This prevents new device contexts from being created in open().
+	 */
+	if (priv->priv_dev_ctx) {
+		scoped_guard(mutex, &priv->modify_lock)
+			priv->priv_dev_ctx->cleanup_done = true;
+
+		if (priv->open_gate) {
+			scoped_guard(mutex, &priv->open_gate->lock) {
+				priv->open_gate->dying = true;
+				priv->open_gate->priv = NULL;
+			}
+		}
+
+		if (priv->priv_dev_ctx->miscdev)
+			misc_deregister(priv->priv_dev_ctx->miscdev);
+	}
+
+	while (true) {
+		dev_ctx = NULL;
+
+		scoped_guard(mutex, &priv->modify_lock) {
+			if (list_empty(&priv->dev_ctx_list))
+				goto out_done;
+
+			dev_ctx = list_first_entry(&priv->dev_ctx_list,
+						   struct se_if_device_ctx, link);
+
+			/* pin this context so close() cannot free it under us */
+			kref_get(&dev_ctx->refcount);
+			dlink_dev_ctx(dev_ctx);
+		}
+
+		/*
+		 * Local cleanup outside the global lock avoids ABBA deadlock
+		 * with paths that already take dev_ctx->fops_lock first.
+		 */
+		cleanup_dev_ctx(dev_ctx, false);
+		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+	}
+out_done:
+
+	cancel_work_sync(&priv->fw_busy_work);
+	/*
+	 * A timed-out synchronous command may have retained a dev_ctx through
+	 * priv->fw_busy_dev_ctx even after the fd was closed and the context was
+	 * removed from dev_ctx_list. If no late response arrived, release that
+	 * retained context during driver teardown.
+	 *
+	 * se_clear_fw_busy() is idempotent and internally checks
+	 * priv->fw_busy_dev_ctx under fw_busy_lock.
+	 */
+	se_clear_fw_busy(priv);
+
 	/*
 	 * In se_if_request_channel(), passed the clean-up functional
 	 * pointer reference as action to devm_add_action_or_reset().
@@ -284,12 +1417,16 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
-	if (priv->priv_dev_ctx) {
-		kfree(priv->priv_dev_ctx->devname);
-		kfree(priv->priv_dev_ctx);
-		priv->priv_dev_ctx = NULL;
-	}
-	kfree(priv);
+	/* Drop the initial reference - priv will be freed when last fd closes */
+	kref_put(&priv->refcount, se_if_priv_release);
+}
+
+static void se_fw_busy_work(struct work_struct *work)
+{
+	struct se_if_priv *priv =
+		container_of(work, struct se_if_priv, fw_busy_work);
+
+	se_clear_fw_busy(priv);
 }
 
 static int se_if_probe(struct platform_device *pdev)
@@ -312,15 +1449,22 @@ static int se_if_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->dev = dev;
+	kref_init(&priv->refcount);
 	priv->if_defs = &if_node->if_defs;
 	dev_set_drvdata(dev, priv);
 
 	mutex_init(&priv->se_if_cmd_lock);
+	mutex_init(&priv->modify_lock);
 	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
 	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
 	atomic_set(&priv->fw_busy, 0);
+	spin_lock_init(&priv->fw_busy_lock);
+	priv->fw_busy_dev_ctx = NULL;
+	INIT_WORK(&priv->fw_busy_work, se_fw_busy_work);
+
 	init_completion(&priv->waiting_rsp_clbk_hdl.done);
 	init_completion(&priv->cmd_receiver_clbk_hdl.done);
+	INIT_LIST_HEAD(&priv->dev_ctx_list);
 
 	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
 	if (ret)
@@ -355,7 +1499,7 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 355d38684b1b..abfd77eecb72 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -8,17 +8,28 @@
 
 #include <linux/bitfield.h>
 #include <linux/miscdevice.h>
-#include <linux/semaphore.h>
 #include <linux/mailbox_client.h>
+#include <linux/semaphore.h>
+#include <linux/workqueue.h>
 
 #define MAX_FW_LOAD_RETRIES		50
 #define SE_MSG_WORD_SZ			0x4
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
 
+struct se_if_open_gate {
+	struct miscdevice miscdev;
+	struct se_if_priv *priv;
+	/* to lock to update the structure */
+	struct mutex lock;
+	struct kref refcount;
+	bool dying;
+};
+
 struct se_clbk_handle {
 	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
@@ -45,10 +56,43 @@ struct se_imem_buf {
 	u32 state;
 };
 
+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem non_secure_mem;
+};
+
 /* Private struct for each char device instance. */
 struct se_if_device_ctx {
 	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
 	const char *devname;
+	bool cleanup_done;
+	unsigned long rcv_msg_timeout_jiffies;
+
+	/* process one file operation at a time. */
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
+
+	/* Add reference counting */
+	struct kref refcount;
 };
 
 /* Header of the messages exchange with the EdgeLock Enclave */
@@ -112,9 +156,30 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+	/*
+	 * Serialise the fw_busy_dev_ctx and fw_busy state updates between the
+	 * timeout path, late-response callback/work, and teardown.
+	 */
+	spinlock_t fw_busy_lock;
+	struct se_if_device_ctx *fw_busy_dev_ctx;
+	struct work_struct fw_busy_work;
 
 	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+
+	/* prevent modifying priv member variable in parallel. */
+	struct mutex modify_lock;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
+
+	/* Add reference counting */
+	struct kref refcount;
+
+	/* stable gate used by .open() */
+	struct se_if_open_gate *open_gate;
 };
 
 char *get_se_if_name(u8 se_if_id);
+void unset_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx);
+int set_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx);
 #endif
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..ea14cec05020
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	__u64 user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u64 tx_buf;
+	__u32 tx_buf_sz;
+	__u64 rx_buf;
+	__u32 rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, struct se_ioctl_cmd_snd_rcv_rsp_info)
+#endif

-- 
2.43.0

