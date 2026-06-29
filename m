Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E063D3B47DD
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716672; cv=fail; b=u8kyiXUV4pJRLNg7XxDxdu2OQLxE9rMPG8DZ0M14dq8rq4whxxbLeiIEAxNYBinGinHSW2FLy2/96NsEHMUNQqU8Qq35YRwJtxRCUBRlhqRjSEkB3Ylh8agYJvjFKrK4ypg52IJtlDUemZwOs+grWIflC+zEfOqwIThZFy43Ol4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716672; c=relaxed/simple;
	bh=9GwwCEAn+SZnwZg7DOj3xmFnb50ahKLAgaQK1C2QkwE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WiZbdd7yDhHRPCmPRaLbUAsmADW2EmlEG9HdqXodbUH76unD76Or1G6ZrxR5jMJSOXjNPeI6Em5o7+L7KJx/4nbP7yhxWDcBChMdtxICLQODKco8AlH2g2w7QzAxAQVMvtRrUwrV2/AVQgmvD4U7WwIBWRLuv1bzOx2Kv+6iqfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GPvlmx5e; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GPvlmx5e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbqBmHT2nU53Ra/ONjDwIKYAUApoK3eG1g9f3yFgYdzY5J0VeGSAewwjEXC9+GDl9BfPg/Q7/O1WKq04ILFEBty8TQXEiHnm6WfnCL+Dkz8BIbgkKos8+Q/bHbdygDtJsNtPc7zyACBCp10WBbEUBViAds/Zy9TTOBS3LcYtG1uaZhSJbYhcJV55QT4+RCjjjJCmzt5emFRdWpfgRZgiHClhgboC5Wy3aONjPWCHN7aBrQTzJYufVSi9NWB/xcMVl08P0yEF9hxzGbnWqM9Mlanx4MqLuB1s1qemJeZWkTjAEAE5b8xKiYTdotdGEIYjSPe9h+rDd1Wt8WDWtNcVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGBbs0zmrBUANC14CLMuOhV63ThbzgJZSjJBX2fm0Gk=;
 b=P2EAigaSsyD6/+W7dP1mubFlb6KV0KFxIAEjOPwYT4y3Pp+/1a3jMKHbXPDziMcyYR4kUzPYQ7s8ERlIiUoRq/w38iU073OMeHtJF6Kh9bucXFR0kjpohtX7JsrG8cHeh2jvPdkaczwKAY52zE79idijFNUNK04EfDWkGlLy6Gs2MetPU64cIlXUv30BAxUxZXcq6kdacOYl0JBm9JPK6e5wIl2ZzrANdb5PFDAbdp/zz1o2zCzVcesLgvnQ0LimlJN6LMSL0fq54WNq92tyJ4W4SOFWN8Xs/uxmyZ7/XC+MO9ftFAIG/D6+8jpFBNTlSrXq5/wZcFAxJU+3eg1rFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGBbs0zmrBUANC14CLMuOhV63ThbzgJZSjJBX2fm0Gk=;
 b=GPvlmx5e7EdFAPXSWd/paC1Mm1C+WAk2LRH9Xvqjm3pTuQw+iLXuP5F27eUomCRr70DCHtFE0G2ad1+wzn5gX7dTyRt8YuzAYMs3b2/9Zagit8vMPxUQzhfms+RO2vm7bJvDrgwFcptVTsFeteb/ZX/+GTYwwoj690ZgQowc+Kei2XNTnFAovu+epuEZdZncJKIDx+Q+NSf99WMKAQMqrxK81ivgZZji0mhppesT8JnGnzLqSBD8k0F5+M9+vd+5JYkTK8bHFclrKbIb2N3VXiBDtsnodcxAq3gKfgQZgHKoliqIOKIIcjonC3Xbc5MWNj85ZBM9I9M46zNiA7LGqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:04:25 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0159.013; Mon, 29 Jun 2026
 07:04:25 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 29 Jun 2026 17:51:59 +0530
Subject: [PATCH v26 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-imx-se-if-v26-3-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
In-Reply-To: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 kernel test robot <lkp@intel.com>, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782735844; l=44779;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=w/EoH5Z6lgoaqzv25Z5ozMXWUqop63tulNYHzPF+JX4=;
 b=o/yEEvBDV1p8hSiaOMQ6YXNJXjAs2OQwgydNB4uSUYKdIhhwHm5LwlJ5U8aMxK3hQ4SdBENwC
 MrVHggSk+NpDHylxbZTTZhx7+I+G/NtfCwcQ4yFsLQs/lj8tN470FL1
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI3PR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:4:297::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b31d96a-6ae1-432c-6265-08ded5aca752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|6133799003|11063799006|22082099003|18002099003|3023799007|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	LtkcazvGneOAUdNgH2+5Jdw+a7pkoT+TGWvqfMGs+boIYZVMYMiAA0+Y9IWUWeCNTRSwiz4fAhgJvlloNMaWuXXbskjJDK70zAB8xN7D2aXLQfZB7HFAclATAU9Sga/QUlkw4GoAqExIKy/+fIMAa4ja5BYSNyJsOprLgiqcY6LmbyPZ5i/B+loi1uuZQU6jJ9Bi3slhUbLNbCM21y2Q/sPewjkmCEPknyd6PIwCzrixf0mT0kluOGPuZ7NktgVqMUg1fI9Sk+YX9wN6CJnSP0W4yfcRGZEDtfTjCKFsmcsSVO7bAuw1BjuKlTTvXArghVMd1/cslNwki5vUKVzcIrLVXe/JrT1PsA3Hhl49OcsYVAl/QSrN1/72YRpudOdYRxz93m9pDpE9XTVKtkyNprNfvqzKJZlYPyG5g9gvv9xH/KMxr/9UmMy3L5zDtEUYtFU9pvnV5qnDMD7rAbUD38GmVIJYS29PDPB4QmChzdWu08oEp6y+gO7K/cI20DjUbrLYsa7ROSdutEGJmqSYI3uAkDVf/badK058GCN4P/2k8juG1N1XyELHEsqaI3gmfPGQygCPqvy+Mieu3vvVWdRqj0j/63m/e7QkMv/baPLq6gFuUtFCN/1kMdXtCpX8lSWfiMpGv+P3p7cQe+ykmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(6133799003)(11063799006)(22082099003)(18002099003)(3023799007)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVI2VTFRNjdLUmVzWjFENVNURlFFVGhnR0ZWTTEvS1NwWkgxbmZyZ3Vrblpz?=
 =?utf-8?B?dGJmS01LZE54bVVHTWd6SmluUE9qeGpIMm5VeTU2YzNtRnY2WjJaeTZvUCtS?=
 =?utf-8?B?V2NzODV4aTN2RnlScU9qV1BQY2ZGY3Q5cEVpa1pwRVhuMTdmeFd1ZS8yMzBI?=
 =?utf-8?B?bUJ5Um9jWmtWYjZHMlZiRlhFZ25UMGFCczJOUVJIU2xWS2NvN0pUeFk1WUJ6?=
 =?utf-8?B?OWpjejVramNHYThmM2xyTEI3ZTlKM2hJVmVRRERhb29kQVJsU1pIY2xrdldO?=
 =?utf-8?B?cW9hdk5NbVlDSkhWdm50ZGVLaEpoem1ITTc3STJsUzkrWXhQSGhRbjNvWTQv?=
 =?utf-8?B?V0FobkRJQWhWTm1yeUFSR2VhaWR0dlFUQ0hyVjNzMXN6em9MNk9JNzN6MTJt?=
 =?utf-8?B?a1lWT3FFNjJBNXZKUmdoNWtFWUlnTXZRaTkvSXd4U3NSbzN1VVBjTXFiRXhR?=
 =?utf-8?B?YkgwQ01scmNqNitLemJVVmFUczgycFVHd214c0I0M3lPRkUvNnhYRDk4S2p6?=
 =?utf-8?B?NlVKeUZKQWFmUzdSUkxJM2ptL29BOWk0Z2RWd09LR3hlOUFHMUFEM1BYaEdy?=
 =?utf-8?B?RHp0dmw2ck83UlBGZHRBNFZ1Z0NXM1AvdFhYQUNHbE5tT0NnK0d6NjRkR2t0?=
 =?utf-8?B?K200Wjc4aHpWcCtITVdQZlB0ZXBORDhrazR0QzNwVWZURUdCKzJnajhzTnN0?=
 =?utf-8?B?N3NFdk1ZRGx2K3J3MVRNVDF3ZlpKVFE3bHZWYUxFUmVqeEVkM25oYzVpcHpF?=
 =?utf-8?B?OFVqSlIzZUFSalptVlBZTHk5bzlKMlIySVpWMUU2aWxGbTNYL3NmWE5mamdX?=
 =?utf-8?B?b1I0aDA1dytzbVFhRWFDTUNWNC9hMGVzcGFVNlQ3SnRxYzFtaFNPMXdBTDUv?=
 =?utf-8?B?YTFMeExZNzF2ZkpkMVlteWJHZmpHWmdjUThJRU5zemxUbzNPVjNoamFwZm9v?=
 =?utf-8?B?ZU9XUHprUVFMMmtJSGlWUHBBTUR0bTE3d2V5a2lwMGpSTllTVzM3UUltaG5L?=
 =?utf-8?B?em9VczhOZnJldWsyazFYWWpiNjZ6SlBNTFBacXRjV0cyK2dvdlFkb1pzUDJW?=
 =?utf-8?B?bWg0azlLcWYzMEZZMkJML1Z2emlYdm5oSXRHSFdiZXJPeFdQWSt5OEgvTU5G?=
 =?utf-8?B?dUlNWXdWZk1NTUMvVjNuUnYvQTdFYTJnSHcxWUJRTkhRSGpQU2hib2dJTXAx?=
 =?utf-8?B?RDhkU056V1cvb2xTMlJuOW9McG1KZHhDaHBVMzB5eGVJSmJxaFFhMnpGRTZX?=
 =?utf-8?B?c0VuUGZDUDFHMTNkcERnRm5ObWNETFNWWFpBcW1zYjlqQmVUOHBmVFgvcWVz?=
 =?utf-8?B?QWxqSmdNZDlYNlhFdjAzdkh2Z2FwRThQcW0zRlI5N0dRQUYzNW56MitLN0Rk?=
 =?utf-8?B?SFdSa0Y1YUx2OG9mVUwwZTJZZmFaSFFKanJDZWNJNGU4RTV2VXBZL3J1Zm1t?=
 =?utf-8?B?YkpZYjRid0lYWklBOGpQQmZLaW42M3NteGJlSHZoZGtUV1NyOGRmMUpodWpK?=
 =?utf-8?B?R29JLzNPcWhXZWV6dTN0aWpYRTAyeTVpNHppeFJKRXhtRnh5dm1qNCtmSWZk?=
 =?utf-8?B?eFlwbzhZWVVpbG0vZnN6SkdHeXZ2T0tjRXlJUkRSQzRvZ0wrU00xYjd1V1RQ?=
 =?utf-8?B?UFBQUHpVSW1kTWtVeSt2VXd4bmRBQmpxU2RZMDlmMGdoQ1gzbGRMaHdJdjl4?=
 =?utf-8?B?aHUvK2ptcGJXcC9HWkVnTXQzVTVxUFJEcEZYSkJwUjNIU1JYSXFlZ0h6L3kw?=
 =?utf-8?B?T2tNUzR6NUxaY0hQdmFPV0cxL25TUEt1ZS9Zd2FxbEx1aE1UdmNxeVNWQTlt?=
 =?utf-8?B?WXhFdEJOM1dVS3lVUUl3UHVEMnY2dkwvV0RnNlJXQ0JXMzlIWFRqQWNteTJ5?=
 =?utf-8?B?dkRUaU9qblBWQ2QwM0ZmejhwRlBTRzhMRjZlMTJNZDBtS0pqeUFZYW5RTk5C?=
 =?utf-8?B?VHB0cE5JU0tWNzkwYUQ3S0k2Z0JqUjA4NEF5ODN3d1NWakc2SlI4Uk9vSjhL?=
 =?utf-8?B?bnlnR3J5WHpsZzhZYVM3QUNSeFdLWnlSSjlxMDUySmJwWFlvVjNDMmVqem1T?=
 =?utf-8?B?QVVTTTBIYXZTT3J5NjRJMWNzWXFyZlcvekxzbWxSZk1UQ2hSWjl1eW1xSTBq?=
 =?utf-8?B?RGdRcTRJY1hGRTRoZEVUOVpoTW5wZ3dCK1NMdFAzMTRaRDFFTGdjSFRMamlu?=
 =?utf-8?B?Z0NqSHlRckJZZjErVDNWRGxpRU9VVEU2UFBJSWZqVnQwOStIUGdRQmc4ZmhG?=
 =?utf-8?B?VjJBYUd5elh5U1NxTkZ2aFREbzlzYTJGZVdXRjJwRmJuWGlsSDQzSndwejF3?=
 =?utf-8?B?MzkxeXVGNFo5QW1lU1dLSi9MMnIyWEQ3T1VIZmZjS3I2alVBWFhreDdXQnNE?=
 =?utf-8?Q?qGfBGNckU6Xt2/gtZhZHj6jE2BdyW2A5rxoPL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b31d96a-6ae1-432c-6265-08ded5aca752
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:04:25.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJyAqiL2nKvV9a2c/Q/LkT28PCoegZdYuFr3AlDZlMeC+InsL6Dzjb8ZczqKdcKDEOT+zhFRAR35UmUIdLlFcWEMmhBXpZVcB/OSwI7cLX8KwZfkVr7lFTk0ONbElceB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add MU-based communication interface for secure enclave.

NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
embedded in the SoC to support the features like HSM, SHE & V2X, using
message based communication interface.

The secure enclave FW communicates with Linux over single or multiple
dedicated messaging unit(MU) based interface(s).
Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.

For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
world - Linux(one or more) and OPTEE-OS (one or more).

Other dependent kernel drivers will be:
- NVMEM: that supports non-volatile devices like EFUSES,
         managed by NXP's secure-enclave.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes v25 to v26:

1. imx: depend on MAILBOX for EdgeLock Enclave driver

The EdgeLock Enclave driver uses mailbox core APIs such as
mbox_request_channel_byname(), mbox_free_channel(), and
mbox_send_message(). The current Kconfig allows the driver to be built
with COMPILE_TEST even when MAILBOX is disabled, which leads to linker
failures from unresolved mailbox symbols.

Require MAILBOX explicitly so COMPILE_TEST builds still include the
mailbox core when this driver is selected.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605270101.2FFpzoFg-lkp@intel.com/

2. ele_common: harden response waiter timeout handling

The synchronous command/response path stores the caller-owned response
buffer in waiting_rsp_clbk_hdl.rx_msg until se_if_rx_callback() copies
the firmware response and completes the waiter.

That breaks down when the response wait times out: the caller can return
and free the response buffer while a delayed firmware response is still
in flight. If the callback later copies into the stale rx_msg pointer,
it can corrupt freed memory.

Fix this by protecting the response-waiter buffer handoff with a
dedicated spinlock. On timeout, clear waiting_rsp_clbk_hdl.rx_msg under
that lock before returning. In the RX callback, check rx_msg under the
same lock and drop late rsp_tag messages instead of copying into a stale
buffer. Use a small "firmware busy" circuit breaker to reject new
command/response transactions after timeout until the delayed response is
observed.

Also avoid a livelock in ele_msg_rcv(): if a signal interrupts the wait
after a command has already been sent, record the interruption and
continue waiting non-interruptibly for the remaining timeout budget.
This preserves firmware/kernel synchronization while avoiding an
infinite loop of repeated -ERESTARTSYS returns.

The main lifetime fix applies to the synchronous response-waiter path
(waiting_rsp_clbk_hdl / rsp_tag). The command-receiver path is also
hardened with basic state validation and bounded copy handling.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@nxp.com?part=1

3. se_ctrl: Move priv to explicit lifetime management.

Allocating priv via devm, will lead to UAF while teardown with active
misc devices & dev_ctx.
---
 drivers/firmware/imx/Kconfig        |  13 ++
 drivers/firmware/imx/Makefile       |   2 +
 drivers/firmware/imx/ele_base_msg.c | 277 +++++++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h |  98 ++++++++
 drivers/firmware/imx/ele_common.c   | 435 ++++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/ele_common.h   |  45 ++++
 drivers/firmware/imx/se_ctrl.c      | 418 ++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  95 ++++++++
 include/linux/firmware/imx/se_api.h |  14 ++
 9 files changed, 1397 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 127ad752acf8..e3cb7f965e70 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
 	  core that could provide misc functions such as board control.
 
 	  This driver can also be built as a module.
+
+config IMX_SEC_ENCLAVE
+	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
+	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST)
+	select FW_LOADER
+	default m if ARCH_MXC
+
+	help
+	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
+	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
+	    like base, HSM, V2X & SHE using the SAB protocol via the shared Messaging
+	    Unit. This driver exposes these interfaces via a set of file descriptors
+	    allowing to configure shared memory, send and receive messages.
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 3bbaffa6e347..4412b15846b1 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
 obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
+sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o
+obj-${CONFIG_IMX_SEC_ENCLAVE}	+= sec_enclave.o
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
new file mode 100644
index 000000000000..54d79c3d75af
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/types.h>
+
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/genalloc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+#define FW_DBG_DUMP_FIXED_STR		"ELE"
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
+{
+	dma_addr_t get_info_addr = 0;
+	u32 *get_info_data = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	memset(s_info, 0x0, sizeof(*s_info));
+
+	struct se_api_msg *tx_msg __free(kfree) =
+		kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(ELE_GET_INFO_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	if (priv->mem_pool)
+		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr);
+	else
+		get_info_data = dma_alloc_coherent(priv->dev,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr,
+						   GFP_KERNEL);
+	if (!get_info_data) {
+		dev_err(priv->dev,
+			"%s: Failed to allocate get_info_addr.", __func__);
+		return -ENOMEM;
+	}
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
+				  true);
+	if (ret)
+		goto exit;
+
+	tx_msg->data[0] = upper_32_bits(get_info_addr);
+	tx_msg->data[1] = lower_32_bits(get_info_addr);
+	tx_msg->data[2] = sizeof(*s_info);
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
+			       ELE_GET_INFO_RSP_MSG_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	if (ret < 0)
+		goto exit;
+
+	memcpy(s_info, get_info_data, sizeof(*s_info));
+exit:
+	if (priv->mem_pool)
+		gen_pool_free(priv->mem_pool, (unsigned long)get_info_data,
+			      ELE_GET_INFO_BUFF_SZ);
+	else
+		dma_free_coherent(priv->dev, ELE_GET_INFO_BUFF_SZ,
+				  get_info_data, get_info_addr);
+
+	return ret;
+}
+
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
+{
+	return ele_get_info(priv, data);
+}
+
+int ele_ping(struct se_if_priv *priv)
+{
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	struct se_api_msg *tx_msg __free(kfree) = kzalloc(ELE_PING_REQ_SZ,
+							  GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) = kzalloc(ELE_PING_RSP_SZ,
+							  GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+	if (ret) {
+		dev_err(priv->dev, "Error: se_fill_cmd_msg_hdr failed.");
+		return ret;
+	}
+
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
+			       ELE_PING_RSP_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+				      ELE_PING_RSP_SZ, true);
+
+	return ret;
+}
+
+int ele_service_swap(struct se_if_priv *priv,
+		     phys_addr_t addr,
+		     u32 addr_size, u16 flag)
+{
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	struct se_api_msg *tx_msg __free(kfree)	=
+		kzalloc(ELE_SERVICE_SWAP_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(ELE_SERVICE_SWAP_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_SERVICE_SWAP_REQ,
+				  ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = flag;
+	tx_msg->data[1] = addr_size;
+	tx_msg->data[2] = ELE_NONE_VAL;
+	tx_msg->data[3] = lower_32_bits(addr);
+	tx_msg->data[4] = se_get_msg_chksum((u32 *)&tx_msg[0],
+					    ELE_SERVICE_SWAP_REQ_MSG_SZ);
+	if (!tx_msg->data[4])
+		return -EINVAL;
+
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
+	if (ret)
+		return ret;
+
+	if (flag == ELE_IMEM_EXPORT)
+		ret = rx_msg->data[1];
+	else
+		ret = 0;
+
+	return ret;
+}
+
+int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
+			phys_addr_t img_addr)
+{
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	if (upper_32_bits(contnr_addr) || upper_32_bits(img_addr)) {
+		dev_err(priv->dev, "Wrong address: %pap %pap\n", &contnr_addr, &img_addr);
+		return -EINVAL;
+	}
+
+	struct se_api_msg *tx_msg __free(kfree)	=
+		kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(ELE_FW_AUTH_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = lower_32_bits(contnr_addr);
+	tx_msg->data[1] = 0;
+	tx_msg->data[2] = lower_32_bits(img_addr);
+
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+			       ELE_FW_AUTH_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+				      ELE_FW_AUTH_RSP_MSG_SZ, true);
+
+	return ret;
+}
+
+int ele_debug_dump(struct se_if_priv *priv)
+{
+	bool keep_logging;
+	int msg_ex_cnt;
+	int ret = 0;
+	int i;
+
+	if (!priv)
+		return -EINVAL;
+
+	struct se_api_msg *tx_msg __free(kfree) = kzalloc(ELE_DEBUG_DUMP_REQ_SZ,
+							  GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree)	= kzalloc(ELE_DEBUG_DUMP_RSP_SZ,
+							  GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
+				  ELE_DEBUG_DUMP_REQ_SZ, true);
+	if (ret)
+		return ret;
+
+	msg_ex_cnt = 0;
+	do {
+		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
+
+		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
+		if (ret < 0)
+			return ret;
+
+		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
+					      ELE_DEBUG_DUMP_RSP_SZ, true);
+		if (ret) {
+			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.", ret);
+			break;
+		}
+		keep_logging = (rx_msg->header.size >= (ELE_DEBUG_DUMP_RSP_SZ >> 2) &&
+				msg_ex_cnt < ELE_MAX_DBG_DMP_PKT);
+
+		rx_msg->header.size -= 2;
+
+		if (rx_msg->header.size > 2)
+			rx_msg->header.size--;
+
+		for (i = 0; i < rx_msg->header.size; i += 2)
+			dev_info(priv->dev, "%s%02x_%02x: 0x%08x 0x%08x",
+				 FW_DBG_DUMP_FIXED_STR,	msg_ex_cnt, i,
+				 rx_msg->data[i + 1], rx_msg->data[i + 2]);
+
+		msg_ex_cnt++;
+	} while (keep_logging);
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
new file mode 100644
index 000000000000..74f87f57d96b
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ *
+ * Header file for the EdgeLock Enclave Base API(s).
+ */
+
+#ifndef ELE_BASE_MSG_H
+#define ELE_BASE_MSG_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include "se_ctrl.h"
+
+#define ELE_NONE_VAL			0x0
+
+#define ELE_GET_INFO_REQ		0xda
+#define ELE_GET_INFO_REQ_MSG_SZ		0x10
+#define ELE_GET_INFO_RSP_MSG_SZ		0x08
+
+#define MAX_UID_SIZE                     (16)
+#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
+#define DEV_GETINFO_FW_SHA_SZ            (32)
+#define DEV_GETINFO_OEM_SRKH_SZ          (64)
+#define DEV_GETINFO_MIN_VER_MASK	0xff
+#define DEV_GETINFO_MAJ_VER_MASK	0xff00
+#define ELE_DEV_INFO_EXTRA_SZ		0x60
+
+struct dev_info {
+	u8  cmd;
+	u8  ver;
+	u16 length;
+	u16 soc_id;
+	u16 soc_rev;
+	u16 lmda_val;
+	u8  ssm_state;
+	u8  dev_atts_api_ver;
+	u8  uid[MAX_UID_SIZE];
+	u8  sha_rom_patch[DEV_GETINFO_ROM_PATCH_SHA_SZ];
+	u8  sha_fw[DEV_GETINFO_FW_SHA_SZ];
+};
+
+struct dev_addn_info {
+	u8  oem_srkh[DEV_GETINFO_OEM_SRKH_SZ];
+	u8  trng_state;
+	u8  csal_state;
+	u8  imem_state;
+	u8  reserved2;
+};
+
+struct ele_dev_info {
+	struct dev_info d_info;
+	struct dev_addn_info d_addn_info;
+};
+
+#define ELE_GET_INFO_BUFF_SZ		(sizeof(struct ele_dev_info) \
+						+ ELE_DEV_INFO_EXTRA_SZ)
+
+#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) ({\
+	const u32 *__x = (const u32 *)(x); \
+	size_t __sz = (uid_word_sz); \
+	((u64)__x[__sz - 1] << 32) | __x[0]; \
+	})
+
+#define ELE_MAX_DBG_DMP_PKT		50
+#define ELE_DEBUG_DUMP_REQ		0x21
+#define ELE_DEBUG_DUMP_REQ_SZ		0x4
+#define ELE_DEBUG_DUMP_RSP_SZ		0x5c
+
+#define ELE_PING_REQ			0x01
+#define ELE_PING_REQ_SZ			0x04
+#define ELE_PING_RSP_SZ			0x08
+
+#define ELE_SERVICE_SWAP_REQ		0xdf
+#define ELE_SERVICE_SWAP_REQ_MSG_SZ	0x18
+#define ELE_SERVICE_SWAP_RSP_MSG_SZ	0x0c
+#define ELE_IMEM_SIZE			0x10000
+#define ELE_IMEM_STATE_OK		0xca
+#define ELE_IMEM_STATE_BAD		0xfe
+#define ELE_IMEM_STATE_WORD		0x27
+#define ELE_IMEM_STATE_MASK		0x00ff0000
+#define ELE_IMEM_EXPORT			0x1
+#define ELE_IMEM_IMPORT			0x2
+
+#define ELE_FW_AUTH_REQ			0x02
+#define ELE_FW_AUTH_REQ_SZ		0x10
+#define ELE_FW_AUTH_RSP_MSG_SZ		0x08
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info);
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data);
+int ele_ping(struct se_if_priv *priv);
+int ele_service_swap(struct se_if_priv *priv, phys_addr_t addr,
+		     u32 addr_size, u16 flag);
+int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
+			phys_addr_t img_addr);
+int ele_debug_dump(struct se_if_priv *priv);
+#endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
new file mode 100644
index 000000000000..ba606f4e8be8
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.c
@@ -0,0 +1,435 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+/*
+ * se_get_msg_chksum() - to calculate checksum word by word.
+ *
+ * @msg : reference to the input msg-data.
+ * @msg_len : reference to the input msg-data length in bytes.
+ *            Includes extra 4 bytes (or 1 words) chksum.
+ *
+ * This function returns the checksum calculated by ORing word by word.
+ *
+ * Return:
+ *  0: if the input length is not 4 byte aligned, or num of words < 5.
+ *  chksum: calculated word by word.
+ */
+u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
+{
+	u32 nb_words = msg_len / (u32)sizeof(u32);
+	u32 chksum = 0;
+	u32 i;
+
+	if (nb_words < 5)
+		return chksum;
+
+	if (msg_len % SE_MSG_WORD_SZ) {
+		pr_err("Msg-len is not 4-byte aligned.");
+		return chksum;
+	}
+
+	/* nb_words include one checksum word, so skip it. */
+	nb_words--;
+
+	for (i = 0; i < nb_words; i++)
+		chksum ^= *(msg + i);
+
+	return chksum;
+}
+
+int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+{
+	bool wait_uninterruptible = false;
+	unsigned long remaining_jiffies;
+	unsigned long flags;
+	int ret;
+
+	remaining_jiffies = MAX_SCHEDULE_TIMEOUT;
+	do {
+		if (wait_uninterruptible)
+			ret = wait_for_completion_timeout(&se_clbk_hdl->done,
+							  remaining_jiffies);
+		else
+			ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
+									remaining_jiffies);
+		if (ret == -ERESTARTSYS) {
+			/*
+			 * Record that a signal was observed, then continue waiting non-
+			 * interruptibly until the response arrives or the timeout
+			 * expires. The caller can surface the interruption to userspace
+			 * after the protocol transaction is brought back to a
+			 * synchronized state.
+			 */
+			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
+				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+				wait_uninterruptible = true;
+				continue;
+			}
+			ret = -EINTR;
+			break;
+		}
+
+		if (ret == 0) {
+			/*
+			 * The response buffer belongs to the caller of ele_msg_send_rcv()
+			 * and may be freed as soon as this function returns. Clear rx_msg
+			 * under clbk_rx_lock so that a late se_if_rx_callback() can
+			 * observe that the waiter has timed out and must not copy into
+			 * the stale buffer.
+			 *
+			 * If the completion has not yet been signaled, mark the firmware
+			 * path busy. This acts as a circuit breaker: reject new
+			 * command/response transactions until the delayed response
+			 * arrives and the callback closes the breaker.
+			 */
+
+			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+			se_clbk_hdl->rx_msg = NULL;
+			if (!completion_done(&se_clbk_hdl->done))
+				atomic_set(&priv->fw_busy, 1);
+
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			ret = -ETIMEDOUT;
+			dev_err(priv->dev,
+				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
+				get_se_if_name(priv->if_defs->se_if_type));
+			break;
+		}
+		ret = se_clbk_hdl->rx_msg_sz;
+		break;
+	} while (ret < 0);
+
+	return ret;
+}
+
+int ele_msg_send(struct se_if_priv *priv,
+		 void *tx_msg,
+		 int tx_msg_sz)
+{
+	struct se_msg_hdr *header = tx_msg;
+	int err;
+
+	/*
+	 * Check that the size passed as argument matches the size
+	 * carried in the message.
+	 */
+	if (header->size << 2 != tx_msg_sz) {
+		dev_err(priv->dev,
+			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			*(u32 *)header, header->size << 2, tx_msg_sz);
+		return -EINVAL;
+	}
+
+	err = mbox_send_message(priv->tx_chan, tx_msg);
+	if (err < 0) {
+		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		return err;
+	}
+
+	return tx_msg_sz;
+}
+
+/* API used for send/receive blocking call. */
+int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+		     void *rx_msg, int exp_rx_msg_sz)
+{
+	int err;
+
+	guard(mutex)(&priv->se_if_cmd_lock);
+
+	if (atomic_read(&priv->fw_busy)) {
+		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		return -EBUSY;
+	}
+	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
+	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
+	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+
+	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	if (err < 0)
+		return err;
+
+	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+
+	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
+		err = -EINTR;
+		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
+		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+	}
+	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
+
+	return err;
+}
+
+static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
+				       struct se_msg_hdr *header)
+{
+	/*
+	 * List of API(s) header that can be accepte variable length
+	 * response buffer.
+	 */
+	if (header->command == ELE_DEBUG_DUMP_REQ &&
+	    header->ver == priv->if_defs->base_api_ver &&
+	    header->size >= 2 && header->size <= (ELE_DEBUG_DUMP_RSP_SZ / 4))
+		return true;
+
+	return false;
+}
+
+/*
+ * Callback called by mailbox FW, when data is received.
+ */
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
+{
+	struct se_clbk_handle *se_clbk_hdl;
+	struct device *dev = mbox_cl->dev;
+	struct se_msg_hdr *header;
+	bool sz_mismatch = false;
+	struct se_if_priv *priv;
+	unsigned long flags;
+	u32 rx_msg_sz;
+
+	priv = dev_get_drvdata(dev);
+
+	/* The function can be called with NULL msg */
+	if (!msg) {
+		dev_err(dev, "Message is invalid\n");
+		return;
+	}
+
+	header = msg;
+	rx_msg_sz = header->size << 2;
+
+	/* Incoming command: wake up the receiver if any. */
+	if (header->tag == priv->if_defs->cmd_tag) {
+		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (!se_clbk_hdl->rx_msg) {
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			dev_warn(dev, "No command receiver registered for message: %.8x\n",
+				 *((u32 *)header));
+			return;
+		}
+
+		/*
+		 * cmd_tag messages are delivered only to the explicitly registered
+		 * command receiver. Unlike the synchronous response waiter path, the
+		 * command receiver uses a dedicated long-lived buffer installed by
+		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
+		 * breaker handling used for rsp_tag messages.
+		 */
+		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
+			*(u32 *)header);
+
+		/*
+		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
+		 * as the NVM command are initiated by FW.
+		 * Size is revealed as part of this call function.
+		 */
+
+		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
+			/* Store the response buffer maxsize in local variable.*/
+			rx_msg_sz = MAX_NVM_MSG_LEN;
+			sz_mismatch = true;
+		}
+
+		se_clbk_hdl->rx_msg_sz = rx_msg_sz;
+		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
+		complete(&se_clbk_hdl->done);
+		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (sz_mismatch)
+			dev_err(dev,
+				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *)header,
+				(header->size << 2), rx_msg_sz);
+	} else if (header->tag == priv->if_defs->rsp_tag) {
+		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
+		u32 exp_rx_msg_sz = 0;
+
+		/*
+		 * waiting_rsp_clbk_hdl.rx_msg is owned by the synchronous sender in
+		 * ele_msg_send_rcv(). After timeout or error, that path clears rx_msg
+		 * under clbk_rx_lock before returning to its caller, which may then free
+		 * the buffer. Check rx_msg under the same lock here so a delayed response
+		 * can be detected and dropped instead of copying into freed memory.
+		 *
+		 * A late response also closes the firmware-busy circuit breaker, allowing
+		 * future command/response transactions to proceed again.
+		 */
+		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
+		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (!se_clbk_hdl->rx_msg) {
+			/* Close circuit breaker on spinlock race */
+			atomic_set(&priv->fw_busy, 0);
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			dev_info(dev, "ELE responded (late), recovery FW available.");
+			return;
+		}
+		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
+			*(u32 *)header);
+
+		/*
+		 * For rsp_tag traffic, the sender provides the expected response
+		 * buffer size. If firmware returns a different size, clamp the copy
+		 * length to the caller's buffer capacity before memcpy() and report the
+		 * mismatch after dropping the spinlock.
+		 */
+		if (rx_msg_sz != exp_rx_msg_sz) {
+			if (!exception_for_sz_mismatch)
+				sz_mismatch = true;
+
+			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		}
+		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
+		complete(&se_clbk_hdl->done);
+		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+		if (sz_mismatch)
+			dev_err(dev,
+				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *)header,
+				(header->size << 2), exp_rx_msg_sz);
+	} else {
+		dev_err(dev, "Failed to select a device for message: %.8x\n",
+			*((u32 *)header));
+	}
+}
+
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+			    u8 msg_id, u8 sz, bool is_base_api)
+{
+	struct se_msg_hdr *header = &msg->header;
+	u32 status;
+
+	if (header->tag != priv->if_defs->rsp_tag) {
+		dev_err(priv->dev, "MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)",
+			msg_id, header->tag, priv->if_defs->rsp_tag);
+		return -EINVAL;
+	}
+
+	if (header->command != msg_id) {
+		dev_err(priv->dev, "MSG Header: Cmd id mismatch. (0x%x != 0x%x)",
+			header->command, msg_id);
+		return -EINVAL;
+	}
+
+	if ((sz % 4) || (header->size != (sz >> 2) &&
+			 !check_hdr_exception_for_sz(priv, header))) {
+		dev_err(priv->dev, "MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)",
+			msg_id, header->size, (sz >> 2));
+		return -EINVAL;
+	}
+
+	if (is_base_api && header->ver != priv->if_defs->base_api_ver) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->base_api_ver);
+		return -EINVAL;
+	} else if (!is_base_api && header->ver != priv->if_defs->fw_api_ver) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->fw_api_ver);
+		return -EINVAL;
+	}
+
+	status = RES_STATUS(msg->data[0]);
+	if (status != priv->if_defs->success_tag) {
+		dev_err(priv->dev, "Command Id[%x], Response Failure = 0x%x",
+			header->command, status);
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info = {0};
+	int ret;
+
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.\n");
+		return ret;
+	}
+
+	/* Check for the imem-state before continue to save imem state. */
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_BAD)
+		return -EIO;
+
+	/*
+	 * EXPORT command will save encrypted IMEM to given address,
+	 * so later in resume, IMEM can be restored from the given
+	 * address.
+	 *
+	 * Size must be at least 64 kB.
+	 */
+	ret = ele_service_swap(priv, imem->phyaddr, ELE_IMEM_SIZE, ELE_IMEM_EXPORT);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to export IMEM.");
+		imem->size = 0;
+	} else {
+		dev_dbg(priv->dev,
+			"Exported %d bytes of encrypted IMEM.",
+			ret);
+		imem->size = ret;
+	}
+
+	return ret > 0 ? 0 : ret;
+}
+
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info;
+	int ret;
+
+	/* get info from ELE */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	/* Check for the imem-state and imem-size before continue to
+	 * restore imem state.
+	 */
+	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
+		return -EIO;
+
+	/*
+	 * IMPORT command will restore IMEM from the given
+	 * address, here size is the actual size returned by ELE
+	 * during the export operation
+	 */
+	ret = ele_service_swap(priv, imem->phyaddr, imem->size, ELE_IMEM_IMPORT);
+	if (ret) {
+		dev_err(priv->dev, "Failed to import IMEM");
+		return ret;
+	}
+
+	/*
+	 * After importing IMEM, check if IMEM state is equal to 0xCA
+	 * to ensure IMEM is fully loaded and
+	 * ELE functionality can be used.
+	 */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_OK)
+		dev_dbg(priv->dev, "Successfully restored IMEM.");
+	else
+		dev_err(priv->dev, "Failed to restore IMEM.");
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
new file mode 100644
index 000000000000..96e987ef6f88
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __ELE_COMMON_H__
+#define __ELE_COMMON_H__
+
+#include "se_ctrl.h"
+
+#define ELE_SUCCESS_IND			0xD6
+
+#define IMX_ELE_FW_DIR                 "imx/ele/"
+
+u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
+
+int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+
+int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+
+int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+		     void *rx_msg, int exp_rx_msg_sz);
+
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
+
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+			    u8 msg_id, u8 sz, bool is_base_api);
+
+/* Fill a command message header with a given command ID and length in bytes. */
+static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
+				      u8 cmd, u32 len, bool is_base_api)
+{
+	hdr->tag = priv->if_defs->cmd_tag;
+	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
+	hdr->command = cmd;
+	hdr->size = len >> 2;
+
+	return 0;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+#endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
new file mode 100644
index 000000000000..9a2c3c611146
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-direct.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/firmware.h>
+#include <linux/firmware/imx/se_api.h>
+#include <linux/genalloc.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+#include "se_ctrl.h"
+
+#define MAX_SOC_INFO_DATA_SZ		256
+#define MBOX_TX_NAME			"tx"
+#define MBOX_RX_NAME			"rx"
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+
+#define SE_TYPE_ID_DBG			0x1
+
+#define SE_TYPE_ID_HSM			0x2
+
+struct se_fw_img_name {
+	const u8 *prim_fw_nm_in_rfs;
+	const u8 *seco_fw_nm_in_rfs;
+};
+
+struct se_fw_load_info {
+	const struct se_fw_img_name *se_fw_img_nm;
+	bool is_fw_tobe_loaded;
+	bool imem_mgmt;
+	struct se_imem_buf imem;
+};
+
+struct se_var_info {
+	u16 soc_rev;
+	struct se_fw_load_info load_fw;
+};
+
+/* contains fixed information */
+struct se_soc_info {
+	const u16 soc_id;
+	const char *soc_name;
+	const struct se_fw_img_name se_fw_img_nm;
+};
+
+struct se_if_node {
+	struct se_soc_info *se_info;
+	u8 *pool_name;
+	bool reserved_dma_ranges;
+	struct se_if_defines if_defs;
+};
+
+/* common for all the SoC. */
+static struct se_var_info var_se_info;
+
+static struct se_soc_info se_imx8ulp_info = {
+	.soc_id = SOC_ID_OF_IMX8ULP,
+	.soc_name = "i.MX8ULP",
+	.se_fw_img_nm = {
+		.prim_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2-ahab-container.img",
+		.seco_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2ext-ahab-container.img",
+	},
+};
+
+static struct se_if_node imx8ulp_se_ele_hsm = {
+	.se_info = &se_imx8ulp_info,
+	.pool_name = "sram",
+	.reserved_dma_ranges = true,
+	.if_defs = {
+		.se_if_type = SE_TYPE_ID_HSM,
+		.cmd_tag = 0x17,
+		.rsp_tag = 0xe1,
+		.success_tag = ELE_SUCCESS_IND,
+		.base_api_ver = MESSAGING_VERSION_6,
+		.fw_api_ver = MESSAGING_VERSION_7,
+	},
+};
+
+static struct se_soc_info se_imx93_info = {
+	.soc_id = SOC_ID_OF_IMX93,
+};
+
+static struct se_if_node imx93_se_ele_hsm = {
+	.se_info = &se_imx93_info,
+	.reserved_dma_ranges = true,
+	.if_defs = {
+		.se_if_type = SE_TYPE_ID_HSM,
+		.cmd_tag = 0x17,
+		.rsp_tag = 0xe1,
+		.success_tag = ELE_SUCCESS_IND,
+		.base_api_ver = MESSAGING_VERSION_6,
+		.fw_api_ver = MESSAGING_VERSION_7,
+	},
+};
+
+static const struct of_device_id se_match[] = {
+	{ .compatible = "fsl,imx8ulp-se-ele-hsm", .data = &imx8ulp_se_ele_hsm},
+	{ .compatible = "fsl,imx93-se-ele-hsm", .data = &imx93_se_ele_hsm},
+	{},
+};
+
+char *get_se_if_name(u8 se_if_id)
+{
+	switch (se_if_id) {
+	case SE_TYPE_ID_DBG: return SE_TYPE_STR_DBG;
+	case SE_TYPE_ID_HSM: return SE_TYPE_STR_HSM;
+	}
+
+	return NULL;
+}
+
+static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
+{
+	return &var_se_info.load_fw;
+}
+
+static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	struct soc_device_attribute *attr;
+	u8 data[MAX_SOC_INFO_DATA_SZ];
+	struct ele_dev_info *s_info;
+	struct soc_device *sdev;
+	int err = 0;
+
+	/*
+	 * This function should be called once.
+	 * Check if the se_soc_rev is zero to continue.
+	 */
+	if (var_se_info.soc_rev)
+		return err;
+
+	err = ele_fetch_soc_info(priv, &data);
+	if (err < 0)
+		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
+	s_info = (void *)data;
+	var_se_info.soc_rev = s_info->d_info.soc_rev;
+	load_fw->imem.state = s_info->d_addn_info.imem_state;
+
+	if (!se_info->soc_name)
+		return 0;
+
+	attr = devm_kzalloc(priv->dev, sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
+						FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
+							  var_se_info.soc_rev),
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
+							  var_se_info.soc_rev));
+	else
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x",
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
+							  var_se_info.soc_rev));
+
+	attr->soc_id = se_info->soc_name;
+
+	err = of_property_read_string(of_root, "model", &attr->machine);
+	if (err)
+		return -EINVAL;
+
+	attr->family = "Freescale i.MX";
+
+	attr->serial_number = devm_kasprintf(priv->dev,
+					     GFP_KERNEL, "%016llX",
+					     GET_SERIAL_NUM_FROM_UID(s_info->d_info.uid,
+								     MAX_UID_SIZE >> 2));
+
+	sdev = soc_device_register(attr);
+	if (IS_ERR(sdev))
+		return PTR_ERR(sdev);
+
+	return 0;
+}
+
+/* interface for managed res to free a mailbox channel */
+static void if_mbox_free_channel(void *mbox_chan)
+{
+	mbox_free_channel(mbox_chan);
+}
+
+static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
+				 struct mbox_client *cl, const char *name)
+{
+	struct mbox_chan *t_chan;
+	int ret = 0;
+
+	t_chan = mbox_request_channel_byname(cl, name);
+	if (IS_ERR(t_chan))
+		return dev_err_probe(dev, PTR_ERR(t_chan),
+				     "Failed to request %s channel.", name);
+
+	ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
+	if (ret)
+		return dev_err_probe(dev, -EPERM,
+				     "Failed to add-action for removal of mbox: %s.",
+				     name);
+	*chan = t_chan;
+
+	return ret;
+}
+
+static void se_if_probe_cleanup(void *plat_dev)
+{
+	struct platform_device *pdev = plat_dev;
+	struct se_fw_load_info *load_fw;
+	struct device *dev = &pdev->dev;
+	struct se_if_priv *priv;
+
+	priv = dev_get_drvdata(dev);
+	if (!priv)
+		return;
+
+	load_fw = get_load_fw_instance(priv);
+
+	/*
+	 * In se_if_request_channel(), passed the clean-up functional
+	 * pointer reference as action to devm_add_action_or_reset().
+	 * No need to free the mbox channels here.
+	 */
+
+	/*
+	 * free the buffer in se remove, previously allocated
+	 * in se probe to store encrypted IMEM
+	 */
+	if (load_fw && load_fw->imem.buf) {
+		dmam_free_coherent(dev, ELE_IMEM_SIZE, load_fw->imem.buf,
+				   load_fw->imem.phyaddr);
+		load_fw->imem.buf = NULL;
+	}
+
+	/*
+	 * No need to check, if reserved memory is allocated
+	 * before calling for its release. Or clearing the
+	 * un-set bit.
+	 */
+	of_reserved_mem_device_release(dev);
+	dev_set_drvdata(dev, NULL);
+	kfree(priv);
+}
+
+static int se_if_probe(struct platform_device *pdev)
+{
+	const struct se_soc_info *se_info;
+	const struct se_if_node *if_node;
+	struct se_fw_load_info *load_fw;
+	struct device *dev = &pdev->dev;
+	struct se_if_priv *priv;
+	dma_addr_t imem_dma_addr;
+	int ret;
+
+	if_node = device_get_match_data(dev);
+	if (!if_node)
+		return -EINVAL;
+
+	se_info = if_node->se_info;
+
+	priv = kzalloc_obj(*priv, GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->if_defs = &if_node->if_defs;
+	dev_set_drvdata(dev, priv);
+
+	mutex_init(&priv->se_if_cmd_lock);
+	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
+	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
+	atomic_set(&priv->fw_busy, 0);
+	init_completion(&priv->waiting_rsp_clbk_hdl.done);
+	init_completion(&priv->cmd_receiver_clbk_hdl.done);
+
+	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
+	if (ret)
+		return ret;
+
+	/* Mailbox client configuration */
+	priv->se_mb_cl.dev		= dev;
+	priv->se_mb_cl.tx_block		= false;
+	priv->se_mb_cl.knows_txdone	= true;
+	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+
+	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
+	if (ret)
+		return ret;
+
+	ret = se_if_request_channel(dev, &priv->rx_chan, &priv->se_mb_cl, MBOX_RX_NAME);
+	if (ret)
+		return ret;
+
+	if (if_node->pool_name) {
+		priv->mem_pool = of_gen_pool_get(dev->of_node, if_node->pool_name, 0);
+		if (!priv->mem_pool)
+			return dev_err_probe(dev, -ENOMEM,
+					     "Unable to get sram pool = %s.",
+					     if_node->pool_name);
+	}
+
+	if (if_node->reserved_dma_ranges) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					    "Failed to init reserved memory region.");
+	}
+
+	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
+		ret = get_se_soc_info(priv, se_info);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
+	}
+
+	/* By default, there is no pending FW to be loaded.*/
+	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
+		load_fw = get_load_fw_instance(priv);
+		load_fw->se_fw_img_nm = &se_info->se_fw_img_nm;
+		load_fw->is_fw_tobe_loaded = true;
+
+		if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs) {
+			/* allocate buffer where SE store encrypted IMEM */
+			imem_dma_addr = phys_to_dma(priv->dev, load_fw->imem.phyaddr);
+			load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
+								&imem_dma_addr, GFP_KERNEL);
+			if (!load_fw->imem.buf)
+				return dev_err_probe(dev, -ENOMEM,
+						     "dmam-alloc-failed: To store encr-IMEM.");
+			load_fw->imem_mgmt = true;
+		}
+	}
+	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
+		 get_se_if_name(priv->if_defs->se_if_type));
+
+	return ret;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int se_suspend(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+	int ret = 0;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt) {
+		ret = se_save_imem_state(priv, &load_fw->imem);
+		if (ret)
+			dev_err(dev, "Failure saving IMEM state[0x%x]", ret);
+	}
+
+	return 0;
+}
+
+static int se_resume(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+	int ret = 0;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt) {
+		se_restore_imem_state(priv, &load_fw->imem);
+		if (ret)
+			dev_err(dev, "Failure restoring IMEM state[0x%x]", ret);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops se_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(se_suspend, se_resume)
+};
+
+#define SE_PM_OPS	(&se_pm)
+#else
+#define SE_PM_OPS	NULL
+#endif
+
+static struct platform_driver se_driver = {
+	.driver = {
+		.name = "fsl-se",
+		.of_match_table = se_match,
+		.pm = SE_PM_OPS,
+	},
+	.probe = se_if_probe,
+};
+MODULE_DEVICE_TABLE(of, se_match);
+
+module_platform_driver(se_driver);
+MODULE_AUTHOR("Pankaj Gupta <pankaj.gupta@nxp.com>");
+MODULE_DESCRIPTION("iMX Secure Enclave Driver.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
new file mode 100644
index 000000000000..ef834a845e30
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2026 NXP
+ */
+
+#ifndef SE_MU_H
+#define SE_MU_H
+
+#include <linux/bitfield.h>
+#include <linux/miscdevice.h>
+#include <linux/semaphore.h>
+#include <linux/mailbox_client.h>
+
+#define MAX_FW_LOAD_RETRIES		50
+#define SE_MSG_WORD_SZ			0x4
+
+#define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_NVM_MSG_LEN			(256)
+#define MESSAGING_VERSION_6		0x6
+#define MESSAGING_VERSION_7		0x7
+
+struct se_clbk_handle {
+	struct completion done;
+	bool signal_rcvd;
+	u32 rx_msg_sz;
+	/*
+	 * Assignment of the rx_msg buffer to held till the
+	 * received content as part callback function, is copied.
+	 */
+	struct se_api_msg *rx_msg;
+	/*
+	 * Serialise the timeout path in ele_msg_rcv() against
+	 * se_if_rx_callback() so that the callback can never
+	 * memcpy into a buffer that the timeout path has already
+	 * freed.
+	 */
+	spinlock_t clbk_rx_lock;
+};
+
+struct se_imem_buf {
+	u8 *buf;
+	phys_addr_t phyaddr;
+	u32 size;
+	u32 state;
+};
+
+/* Header of the messages exchange with the EdgeLock Enclave */
+struct se_msg_hdr {
+	u8 ver;
+	u8 size;
+	u8 command;
+	u8 tag;
+}  __packed;
+
+#define SE_MU_HDR_SZ	4
+
+struct se_api_msg {
+	struct se_msg_hdr header;
+	u32 data[];
+};
+
+struct se_if_defines {
+	const u8 se_if_type;
+	u8 cmd_tag;
+	u8 rsp_tag;
+	u8 success_tag;
+	u8 base_api_ver;
+	u8 fw_api_ver;
+};
+
+struct se_if_priv {
+	struct device *dev;
+
+	struct se_clbk_handle cmd_receiver_clbk_hdl;
+	/*
+	 * Update to the waiting_rsp_dev, to be protected
+	 * under se_if_cmd_lock.
+	 */
+	struct se_clbk_handle waiting_rsp_clbk_hdl;
+	/*
+	 * prevent new command to be sent on the se interface while previous
+	 * command is still processing. (response is awaited)
+	 */
+	struct mutex se_if_cmd_lock;
+
+	struct mbox_client se_mb_cl;
+	struct mbox_chan *tx_chan, *rx_chan;
+
+	struct gen_pool *mem_pool;
+	const struct se_if_defines *if_defs;
+	atomic_t fw_busy;
+};
+
+char *get_se_if_name(u8 se_if_id);
+#endif
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
new file mode 100644
index 000000000000..b1c4c9115d7b
--- /dev/null
+++ b/include/linux/firmware/imx/se_api.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __SE_API_H__
+#define __SE_API_H__
+
+#include <linux/types.h>
+
+#define SOC_ID_OF_IMX8ULP		0x084d
+#define SOC_ID_OF_IMX93			0x9300
+
+#endif /* __SE_API_H__ */

-- 
2.43.0

