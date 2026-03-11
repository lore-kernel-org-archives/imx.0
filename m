Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7583B38AD
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216748; cv=fail; b=qvEBqeLT+lccVfMelkb+VTt+F9JsHYTs2xDF9AxU152CH7zJBiSLawAqDM6uuVLOggFAHQuoCfs8vsfwoOeJ2qgmmlTdroK8Rdb6G26c05OPnWwtWsHsH+alTJYcF3FQ1dIRbdZSVqA2n7BBtaKKzyL8fhb9d7SF0iqkSxmpcFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216748; c=relaxed/simple;
	bh=UvHka5wJXgV7+6Xa1KxxjTFfqzME9LZbQoaJ3La+pJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ehSLGqErY8d6xeHvWxqxfpT16/9bsrqATnPqI/aq6Vh0SH18voirzPbzabk/+8kwHKyUcSNxpvM4HyN41NR1nmt+yxWBWYSMbiWX94TPN31NpVzhaPx0f+xyz+xuwv0zRPSuoErn2BTdUZNwqodhbBDCKqa3d+xbb5YykZWDFyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rp4fuK96; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rp4fuK96"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRtAsOnCl43n6NsoddY5Vp+5Qs0xz8wMzk5FR8eDcGNyUosjp4aLnOTD7pRlaYxf4Jai+3ybVcwVXF9xQaQ0G13SDwVX8ceaF9slVNQXIGTN7H4953eb4OwGkAotHCBkngSWu6VH7pH8a9uMBzZ7mUejNZUpSFDkyWbRc1YB9bJLs/VEcTT2lFd17ctKVpPNUJUeF6LgTzTwYxODoUIbw65AAyEdZk80+dEKz6pLC+6wXicP1ID/b77BX911T4g8hdveUy7LRMbjhV43Jon4YyPyJiwADC8pcCiQJunaFVzGK09aowv5/rwVEb8ynuHk9FUbHg9coVS0G0f5ViPI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ti97obELoSCGJ7y2W2BNMgA1v6NMfett3h8Bayh27fU=;
 b=vMhCUqxU2otWmIC1n0sPFWpDzv6xPg6wxg9jr10rTAYzbDGUIijaEsTVqJDHo2czBuMlFz97OTIAoM0cWzUVTAnCG3o52rf5yGWD6B/AwKmriPUrY4m9yoMA3R1oTjKUKUKpslekCdW362FZCBQCkzAl7DW0wRoKF+VOYmoYicq4TmVzwLgew7q1aEZ1rngkPMGvwKoLC23Go7XPyAk8PPMiImY5k5i1txksIrDnAc5MyKAMTJO2vlE1srZza6+JxPVF1h7QK5OwgxMuEW8DvVYUa7cE11L+1mt5QrL2Dz5AOr96TGgWx1sr3PKnjZySQUypFhaTUnhQeE0BCi6XWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ti97obELoSCGJ7y2W2BNMgA1v6NMfett3h8Bayh27fU=;
 b=Rp4fuK96VhaEQyHcLdEHcFAc2yzRvcXWSsbk4ucnNOe+sMbzrgPC0fd5EBlEDbJJRLaXgrQD9s+FQR0c3jwLiYOsWAoTc8jzFPWeSwVHUm5CRCLtPgUzQgT2zY1pZ/9F7Nzp8kZ0x0zYQHHwM6L6MAmbv1VPO6nHhv+JV0ln3i8Jcco6sD3/y4nMR3R3EPQM+ftBquoJQc8EJzLThqpsnNX02kvwCS/VEB23r3z9TcZ9wan7TKzqBI4EVMJPS3P5wH7nit3JK4yIDroaxv/E4K/8ZxfJV/cxBkBXNZ6aNCYZXcu/vdZZl4YjjG5QwPc6iKV1dRjff5ebjK7Hx9JvcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:12:04 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:12:04 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andra-Teodora Ilie <andra.ilie@nxp.com>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v6 4/5] arm64: dts: freescale: Add NXP S32N79 SoC support
Date: Wed, 11 Mar 2026 09:11:53 +0100
Message-ID: <20260311081154.381881-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 46eaf5ce-4113-4d1e-10e6-08de7f45e0f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4OK2Zuf6SIh9OUVYpRX5rp4vm6qETt/OD8FLACWbx+sVe+1mRBBBM0sgE5p8JXU8aEQRV++YKBhwBRrm/K7lXWVSA8WwjQqF4qwNZ+B00zmgfz5YOPxIVArj6Wq2iQA12LtzvTo0/ar4SeWOPdABLkuciE8lC4EvcvTYyOQEWVFo9plQToaAHtO3NPPjc3OgTQFXEM7UUANUJh9aY6ZFMCDC9hxuPlZDXouxUp7/QEh1fLRWtHFJsP5erCBcfadkcpaqHfAS8NZ/2hJHkqbbvZvyMbw/AxlzW6woL6vaADNSp0SgE8EyyvFia9/LOfL99k95405HAkEW1l81UxxDfEIWtNV9alAGzcQB7qRIiWKQTVU94B4GvhiCoe80r32Ljh9k7Wn+QU8Cxp8v0l+lM9w5kZCoez8a7gxQoqXpf9spc2X7uv1rXVoU/73eOihLk//K/YsL1ESVU/tIpNDgNfqSAzqr1L2CqLxYjdME+yvcact34xAbk0Zi5s5y8MYDNATbcLxNkU4A9Dq5wsHmF5XVZqL+uYguyLeLXGOzvkTGxUXYd9M2iNsprbDCmnGU0X6Vm1y2xgX+q2EQR1YQKJFyd+cxogiZRmpfMsR66RDdS3tPqoX1DqaV5Q1JqdMo7abgA2HFBjRhkHUAjYMCAxYQjLaJ6HhO8Ar5luMAd59RIb/N9EuBbA6jQ6AeaDJsgazdqA5eetG92bouxnPA6jTIPh9h5LF+YHKvKPIVuQF0WHA+0pSiwtDqmSYhp997
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmswOG5pTnhrdENScENzbHVSSVYvSUdRUU1PL2IvVU5HNjViSXoxL25UcFQr?=
 =?utf-8?B?ZFliMlNOdW56am1majFUcU44MUl3SGwrakNEY2FMblhRTHlseEpLeUVCcnJk?=
 =?utf-8?B?em9tb0NGRGcrSVY4ZkhFR2xESXFJVm53V0h3WDJtWVZjZVVkQnNTYzY4bHZz?=
 =?utf-8?B?SHRBaVM5OWd6L2VrUHBzK0VCQjRVU2NDYm41R0xIYWJVRStScjh1UFVYazQw?=
 =?utf-8?B?SjFkaXp1L0FrUmdmanVjb0pGd2w5NGU2QUlOTDJNWkRoczhONldva3VVRHNz?=
 =?utf-8?B?MnFtWlUxb0d1V2h4dGJZME1hYlBsVXB2b2VFQ05DMXFBVVhIaktBeXZuU1Zx?=
 =?utf-8?B?c3lWUlIrazFHOVZhMmI5M29jNzVmeTA0MjE3Z3hIa256VVhCTnJFMjFqUFll?=
 =?utf-8?B?R1hXTm1aaFdLeDUvSWZwSk94c21NUXdqTW95dCt1TFVSZUtlSjJqdjE5ZEly?=
 =?utf-8?B?ZzQra0Nudmc4Z0h5bGgrNS9GeE90aC9JeFJrL0dwYTZyb1VId3Arb1d6UHA5?=
 =?utf-8?B?cXM5bjEzODgxNDlMSXpBN2RMaU9zVVQyVDYvQ1RLUTJ2Z0xBYWtvb0NsbkF0?=
 =?utf-8?B?Y1ZNN00zbkdKUndac1hFNGRiYVJYK1Q4dFo2dzVhTW4xcXlIQlFNWlJjdElh?=
 =?utf-8?B?eHFVTmt3bE5RelRDZHYyZFlNazdxcnExY1pPaGQxT1g4TDc1bDY4RkJFTC9o?=
 =?utf-8?B?bmtPMWE0WFhjRUVsTzFWRUljV29JdU5NQWl2Tzd0S2lPSnpGY1g3NXdOQUsx?=
 =?utf-8?B?VW1TY1JSbk1ZdHNlaU1QWE92NGNGczh5QVpHWEFvQnFlUllZQVhIc29YZEpr?=
 =?utf-8?B?VE14WjhnSWR1Sk14RGk0T0ZxZXdVQXZaVnlCd1JzWEcwNm15RmJNRnpTaGVh?=
 =?utf-8?B?b05xR0RrZ05BYzV4UTdJbUE0VFZSNG53TlYzSDRvYkw3TmZzVGdYb1pKRHhW?=
 =?utf-8?B?Y3o4Tng2QWV2RkxJS3FIeGorTFlZWERqaUtSMEh3MTF2V2JoZFNJRUY4eUxz?=
 =?utf-8?B?aDBjYno0S0ttUm5vRXBiMkI3eFVzNkdMSHAzTkxtdDVEZjQ3NmE0M21xdTdI?=
 =?utf-8?B?cHNpcys4T0txVmx6aTFJM0lEaC9qaDBvU1FNRGxOVzNGTS9qRkFRWHdSazhm?=
 =?utf-8?B?VHFybkpmQUhpRm9yU09RWWQzT1ZaSVJhWDRKdGVvUGVRU0VEc1hiQ29OdW8z?=
 =?utf-8?B?MmhZald5eFU4UFZyUWJpeUVMK3pZOUY1L2h3eEhsS2NnM1ozVEMreUx6MGZ4?=
 =?utf-8?B?Y1IvZzFqaE5pSFlGaEtyVHhESTBuU3pvVEcySlNSenJIbE00YkxFZ1RMdWRK?=
 =?utf-8?B?dlgyUlVDU3F6cW1UaVRRTDQ0UFhMWjdxKzRYaGxpSzZUSnE5RTRzTUFzWEhL?=
 =?utf-8?B?TVg1OW9mWStPTnl4OGRBM2h3ajA2UXZGUDNJb3UrRDdhQ253aVlqN2ZxVFVu?=
 =?utf-8?B?bVJ2d0x1Q0NVeWJndmdPaXFqM1lPWXdwYnEyR0M1b2FYaHR6UE90VlFEQnBG?=
 =?utf-8?B?cHFiVFBVM3ZUR1NDTFU2SWc1L2pOUjVPQ1lxSERObGs4dVRYMit3ckFCemJq?=
 =?utf-8?B?UEtuekx0YmZGYTN4eHlmZlc1Qlg0UDhMcHZOaXVnTEFmeXRuTHpBeHFVSTdQ?=
 =?utf-8?B?LzRGRUVEN1kxbWRwbC9UU0FIUkl3M2ZhTlU1dm14bkdvWUphUHF0alFJWmpL?=
 =?utf-8?B?S3NERWoxZDdOSDVROFRSUFhYelFnVFhwVG1iU09zcGlYcm5GbENXU3lOYWQ0?=
 =?utf-8?B?Q3IyUmRhZEVhTmJ0YkVmdHhNemhzYk5nSkZuN2w5UU9hWDV3V0IxeGo2TGJV?=
 =?utf-8?B?STBra2g5UE9FaHlKMk1RSXZCV2QwRW1VK2M5SUxoRFVBRjNuQkh5M1Z0RnFQ?=
 =?utf-8?B?TGh3Z1RFaTNtdDdNcG9XbzZ6cmgvSjdwLzNwSzJJUWNjd3NnbXhLd3JWTElE?=
 =?utf-8?B?NS9RNmZFUzh3Nll4WVJmWXArWDE2WmlNQkJWZ0FUbStsbUZraXp3SlFsRGtm?=
 =?utf-8?B?dmlTMUJoZk5FaFZITVB6dzhrTEw4OHhKR1hkLzFTc1lzekxZNkJuSkdBU1lz?=
 =?utf-8?B?cVVISjYwNXFyWHJjWkR0aEc1ZnYwdHhYR284aEJDYXV1bmtGS1FkRnJxMUIz?=
 =?utf-8?B?K0l6aTRpZ2pxNEFaekpXTmhlc0lVRVUwU0xCRUNpTkpGZmlhcW1sdWNHbzdy?=
 =?utf-8?B?WWprSW1MUzVHTi8vckRYN2RKdVNUNzJQV0IvZ09tWGNtNGVvaGhEakRjQUtX?=
 =?utf-8?B?SzZnTmJOT1BGamEzQm9kTitRSVdrZHFqZmw5SXFUb0w2dWhFWWQzNmd5NC9J?=
 =?utf-8?B?MXJPbkZEL3lvVWdPNDFNM3p1UWlDMmxNVnJYNjNEdzRRNnMxbGE3K0tKcVVi?=
 =?utf-8?Q?M+vaXz4LNf9quqcg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46eaf5ce-4113-4d1e-10e6-08de7f45e0f6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:12:03.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOIwgcsTfD97RbWS4NbwF+2Gr9WDLoZYu3LSF34SeZnv//Ekf1T5CdTfhrhTIj9PpwU2kqHKZQpzVfeOKe4yWIbpkTktAHYIO/IxrAcVres=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add device tree support for the NXP S32N79 automotive SoC [1].

The S32N79 features eight Arm Cortex-A78AE cores organized in four
dual-core clusters, with a three-level cache hierarchy (L1/L2 per core,
L3 per dual-core cluster) and 32GB of DRAM memory. It includes an SMMUv3
for IOMMU functionality.

On S32N79 SoC, peripherals are organized into subsystems, such as:
- CIS (Coherent Interconnect Subsystem)
- COSS (Connectivity Subsystem)
- FSS (Foundation Subsystem)

This initial support includes basic peripherals:
- GICv3, SMMUv3 from CIS Subsystem
- PL011 UARTs and IRQ steering controller from COSS Subsystem
- uSDHC from FSS Subsystem

Clock and Pin multiplexing settings for the chip are managed over SCMI.

[1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32n-vehicle-super-integration-processors:S32N

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Co-developed-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79.dtsi | 362 ++++++++++++++++++++++
 1 file changed, 362 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79.dtsi

diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/dts/freescale/s32n79.dtsi
new file mode 100644
index 000000000000..94ab58783fdc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * NXP S32N79 SoC
+ *
+ * Copyright 2026 NXP
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cis-bus {
+		compatible = "simple-bus";
+		ranges = <0x4f200000 0x0 0x4f200000 0xc00000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gic: interrupt-controller@4f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x4f200000 0x10000>, /* GIC Dist */
+			      <0x4f260000 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			/* GICR (RD_base + SGI_base) */
+			ranges;
+
+			its: msi-controller@4f240000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x4f240000 0x20000>;
+				#msi-cells = <1>;
+				msi-controller;
+			};
+		};
+
+		smmu: iommu@4fc00000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x4fc00000 0x200000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+			#iommu-cells = <1>;
+			dma-coherent;
+			status = "disabled";
+		};
+	};
+
+	coss-bus {
+		compatible = "simple-bus";
+		ranges = <0x4a000000 0x0 0x4a000000 0xff0000>,
+			 <0x4e000000 0x0 0x4e000000 0x1000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		uart0: serial@4a030000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x4a030000 0x1000>;
+			interrupt-parent = <&irqsteer_coss>;
+			interrupts = <264>;
+			clocks = <&clks 0x9a>, <&clks 0x9a>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart5: serial@4a060000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x4a060000 0x1000>;
+			interrupt-parent = <&irqsteer_coss>;
+			interrupts = <269>;
+			clocks = <&clks 0x9a>, <&clks 0x9a>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart6: serial@4aa30000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x4aa30000 0x1000>;
+			interrupt-parent = <&irqsteer_coss>;
+			interrupts = <270>;
+			clocks = <&clks 0x9a>, <&clks 0x9a>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart7: serial@4aa40000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x4aa40000 0x1000>;
+			interrupt-parent = <&irqsteer_coss>;
+			interrupts = <271>;
+			clocks = <&clks 0x9a>, <&clks 0x9a>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		irqsteer_coss: interrupt-controller@4ed00000 {
+			compatible = "nxp,s32n79-irqsteer";
+			reg = <0x4ed00000 0x10000>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x9a>;
+			clock-names = "ipg";
+			fsl,channel = <0>;
+			fsl,num-irqs = <512>;
+			status = "disabled";
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu2>;
+				};
+
+				core1 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&cpu6>;
+				};
+
+				core1 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		l2_0: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-size = <524288>;
+			cache-unified;
+			next-level-cache = <&l3_0>;
+		};
+
+		l2_1: l2-cache1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-size = <524288>;
+			cache-unified;
+			next-level-cache = <&l3_1>;
+		};
+
+		l2_2: l2-cache2 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-size = <524288>;
+			cache-unified;
+			next-level-cache = <&l3_2>;
+		};
+
+		l2_3: l2-cache3 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-size = <524288>;
+			cache-unified;
+			next-level-cache = <&l3_3>;
+		};
+
+		l3_0: l3-cache0 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-size = <1048576>;
+			cache-unified;
+		};
+
+		l3_1: l3-cache1 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-size = <1048576>;
+			cache-unified;
+		};
+
+		l3_2: l3-cache2 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-size = <1048576>;
+			cache-unified;
+		};
+
+		l3_3: l3-cache3 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-size = <1048576>;
+			cache-unified;
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x100>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu2: cpu@10000 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x10000>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_1>;
+		};
+
+		cpu3: cpu@10100 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x10100>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_1>;
+		};
+
+		cpu4: cpu@20000 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x20000>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_2>;
+		};
+
+		cpu5: cpu@20100 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x20100>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_2>;
+		};
+
+		cpu6: cpu@30000 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x30000>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_3>;
+		};
+
+		cpu7: cpu@30100 {
+			compatible = "arm,cortex-a78ae";
+			reg = <0x30100>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_3>;
+		};
+	};
+
+	firmware {
+		psci {
+			compatible = "arm,psci-1.0";
+			method = "smc";
+		};
+
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			shmem = <&scmi_shbuf>;
+			arm,smc-id = <0xc20000fe>;
+			status = "okay";
+
+			clks: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
+	fss-bus {
+		compatible = "simple-bus";
+		ranges = <0x5b490000 0x0 0x5b490000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		usdhc0: mmc@5b490000 {
+			compatible = "nxp,s32n79-usdhc";
+			reg = <0x5b490000 0x1000>;
+			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x58>, <&clks 0x50>, <&clks 0x5f>;
+			clock-names = "ipg", "ahb", "per";
+			bus-width = <8>;
+			status = "disabled";
+		};
+	};
+
+	pmu: pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer: timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.43.0

