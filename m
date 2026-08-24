Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E8837C909
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592820; cv=fail; b=dnc6vFMonTAa57Z693FInhLxUnk9qWaeIQ6UZPU1qq9bULYY4rfcZCBnKdaNfY0fT2WHosi1HCThN+V4as2atK1cQGKwAmY31+y2mHPubQj06+i9B8b8ageuD2TUzgEn5I0Q/eh377OvQXGu5snDblqXRT9/KYIxoWfNi6y0/G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592820; c=relaxed/simple;
	bh=9MARxi6pfkVINi0ZbxBkAD46DKhhVx4Q4soRhsCKfnI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=drtdO0MffHNQWuoLEhYcDSVdsM/2IHlWFEtVYMEozUmIqu6l6DU/OrtwMA+ekDu1Yq7Pies77ePXQsx73kJUgnKknElPF2f7fuZTbWthA+Ll8ujmPPiWxgaQMDdkGFmh3u11S2GAWZuGQ8CbngsR5MWl5GlQEzKC6R+hrN5a5RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W4Gjrkf7; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W4Gjrkf7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPsQ9i83m2B8lH02r+FB9oB3FAsnGJuqif8Ihll8Z7csvkkLehSXJKhLDApskTzdc76hDFubpbApjvASlmghnra8JUIvyey47YlnyF8/fCmZ0X+o1WJNoudzJIKzfpLyyjqS1q8IiqDmDt+PhDwcxyY12lIhlbbjQByejEfb+rTeuMKf5M5Vj6aF2oH2vlCv/uyZUiWlb8FsRjXAWgaG77sq0S+jB4U1B9Pcl/V0JSk9ERWGu+oMbOtfXHCpiyVvqqTYvUa3AP5Yuy6z0IE/X60l5RJ3wyNlCAg5l5dH5Kzl5Oc3PRsUVzoKeZcBitvmkhLQp/tIUGpRaRVOm1BkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAspjATTyaBUO0B4TGiC5FsjdLrNkGp7xImnXkvExxw=;
 b=xfmLFSOrvIx2LUV+pvU6NZZOXpaAb3nmqgze1l1+d19VpXja8TbrKJWki7KY4WeRh3SMvOhKTv8wv+C31BtnYa2dfl60hy+kVvIqgefpoGnz9lgSyvU+JT4RCSmmn+hBz4UKZ4KNcnTrWubNe/+mCRvW3c6hHbzRU/o5VIuoBki3wc9nfEcqPIJ4RIu7bxnquBIYt3rRY2BxHWAU8V097CoiQXYjFo/4qnH+Hn8erZttchhESZQkV4b9u++gf4VZoGk/wlrgLh7O39IWdT2UBr8wl8gpjPKt4XjrsdYyzCwB2856exJNTrSqyQcEd1POrw+tBT6iK/qyx28OvTR4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAspjATTyaBUO0B4TGiC5FsjdLrNkGp7xImnXkvExxw=;
 b=W4Gjrkf7pkTiFxFdk2IjKhPj0omjeONTUkkTpGmwGyxNniIv/5oHan20zOk8pn8deG/RZwNcgeotdHB759yZiDw1uhY7l2xO7uWucnq1eAHMEVDkf4mF/8byeLd7qlDOF91oYQmKymqF1GzvA8ZInUJDrgD9sQz0STgZJns3+mANjX6eIwJUegYE1IRBlp/t7Vj9AarzrS4Abr7mcrbOJKezZ1LsnLvUgs2WoRR/Yl0EMR8ZWEk855ihohCMwPx0ywM48Kt0UeLdImKPuCGQKCkSSpsWHpat1qRuLGlMzvjEXw5nc/vIz+5KxqTqRPUSK53d+DparuEDDZd2C+VMQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMBPR04MB084187.eurprd04.prod.outlook.com (2603:10a6:20b:7de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 17:33:31 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 17:33:31 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 25 Aug 2026 04:33:35 +0530
Subject: [PATCH v42 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-imx-se-if-v42-3-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
In-Reply-To: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787612614; l=54989;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ie9xZZmqNAes4zVwodHwjwYSKmGgjL+4TJKBGoBgR+g=;
 b=3I4m2MzuZbFVpgZtbbmzKS69Op2VbXTH3guRPlcQwfCwDC/Y0pBQgZSKn0P428w0M88MTNqzM
 CeBn9PsM74FBBukNLNnyp0fCvzISVxgj99kUoIQQPj2pMBb57GMYAuU
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:4:297::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMBPR04MB084187:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca31e88-060e-48ae-a600-08df0205d0ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|23010399003|366016|921020|6133799003|3023799007|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SWR1NoisW6U1GT5P0AcMzqwCa8ZogrODTMZ5PNXnCLgRtkBKvLHPQUFpAAOUpH6iSMSRXEQGn+sTFSuCd2WiU4ZhLzdueL7Y34SkgIx6udPGGg/qiGoeqRfpghZIKWyV4uxPrvUKqIi3gCOBYw3SUeR4faOarXNQEaei3I2Iry5ZD2rhJN6IWpwuR6bGyMQReKTyMdQII1CCbnMa15NOHY//ywp569P+2i/9prcj5jHJpMCIvQmUXMr0FjD8KxLHh6gbOFI+afmvCsS0fj13ON6dcaKWTXZ7JPHWJsd2MKjp7faFdmbtWMY8nD3A5oPelt4FYTUREvy5gbKlDf95DdC1KDvuTfrm15dvFFEN3FR+X6Ktn4TDuctR16E7BftYZKKrhgadap7BXkfWs7Wv4r3AV51FmHzPkVcFQtv6wM89ff9V7mAj6uMDpuG3tTEqaSoSnbJ2PSONAidXx9zUqqqbjYKKJr/BG0NLqkxKbmzizJcbYav9ZWjzigmwiVFKDArDQiVAXqe2Q1ANMD0VxMwUemg4o4YLwd2tlMt58fSG+fTmD6COav3cnsoWrTYIhnarPllJwXUNmdAIDgAEafZ9VBhzGJk6yj8FxBNPEhEwCv0SAK3QuVHvQ3eXczrNqMhOyQW9KKxlE7kWo3RIuRCkSC8jrHUp9WMyaduuIyoZbH4XSxqn0r8YTX/hmnmcEC2mGL8oY3dz/+kWRETIBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(23010399003)(366016)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVcwQkVXODdGK3ZEMVFVcllueFZZWU9TSDdNaEQ1azlHMXozY01CWHhYQW44?=
 =?utf-8?B?cTN6cDlxdXUrUmtVS01pTSt2RmlmY0F5RTVXSXQ4TGtrbVVLSjBYZzQ1UGd3?=
 =?utf-8?B?SEx1emhWR1Zkd1k4TCtRU1ZqcFhZRGxmRnRONmNLTkQza1ArRkwvcmR6T0VS?=
 =?utf-8?B?cUhLQnpzdUlUT1QxKzVwMDZJWHZLQ3dDSzcwTUxHV0MrL1ZoWHRsaEgvTjZt?=
 =?utf-8?B?S2taNmZhNEI5Tm1ZQzAzZFhicG5NNVFLbHlsVDdYYno1K1JlZ21qQTliN0Ra?=
 =?utf-8?B?VG4zTGYrckRJNng0OXhWZS9PN0RBRTRYcXdpMGJ4V0FkUjVSeStIS292cUdV?=
 =?utf-8?B?dDRIZUM4QnAzcmpsMzFsU3N2aXZ4OE1kRFZoYzNZSTJVS0d0UUhKd1UrZWVl?=
 =?utf-8?B?bmdjQ0FrUjZiN2Q3TmozdXlreTdyQ2VpSTV2MDE2emdjcEtqUFVNdm4rcVU2?=
 =?utf-8?B?UmVmNUtVd2JnVFBncUJMZXlJNzlZZGtEMFVJQlh3U2xDYU51RVgzVWdhQVl1?=
 =?utf-8?B?eWs1NXJYbklySUtRQlBwUnJycHFFNEU2WGljc1dBcE9lV3NKMEtycWtWaW5z?=
 =?utf-8?B?cGRNT3Z1cUFJdWF1emlLQ085SUR3bDBydVRwTUxHUUxiN0szVXBCMUtIRGNE?=
 =?utf-8?B?eFpITDh0SS8zU01TbWpyc2dLRmtkTDNjK1RHOXdMUjFTdzF6dE5XWUkxbVN6?=
 =?utf-8?B?Nkdtak9hV3A4cWFyYjJHRnJDUVVlWE1OQkZ2Q1ZNbjFvSUpWM2xGb25UU2k5?=
 =?utf-8?B?V2hVd0tQRlpXNzZTdHBXWml4QnlBQkN4NW00Z1hDRzJFdVZybzFLZGNCeGln?=
 =?utf-8?B?dlFRMFlwWTh0cmlxZHhkdkVJc2hmNEhQWTBFdlo3amtmNGxJSnBMZTkzc0Nv?=
 =?utf-8?B?TXNHamJQWEQrUFNXZ1pKWVFvU1ZTZUUrWWVBSERnckdoUGJMZkluZTMrZm9L?=
 =?utf-8?B?d1R0eGxPNjd2VHJ3OFFOUzNDa2xvRGJ4NU9vTjJ5MWNmZjNBTm4yMWVxT0hM?=
 =?utf-8?B?dUJtem9Fa3U3dmFTdDBYZmRHdkhZY0NXOWRjTkVTeDlUazQvNE9KNmJJcXEr?=
 =?utf-8?B?dDIxeVpVYlk0OWorUFhlOE9UQUF5SFFTUFJOWk84ZWhSWEZuVWtWRUo5ci8x?=
 =?utf-8?B?bG94RExqWnMxL01pWE01c2dESFp2RjFjS2FkTGpOT0FYbU9WZnp3TVhLR2VR?=
 =?utf-8?B?a2hYNnBMVW83Nk9obDRiWE9NWnRJUUtqVDZsUWh2UDZ6MlRzV0docFZEdXRl?=
 =?utf-8?B?SVZHUmVwRmJpeWQzaW01d1BVNnFxdTlraGFhS0tSMUcwQ2x6RXZsbFpueFRD?=
 =?utf-8?B?NjRiSGRuMHRvTUxXUFlWclpQdCtVemRmZ2pFeVVJOTd2cnlQUDNmUVJJVDhF?=
 =?utf-8?B?N3N0QmtRakM4cHNUeUZuOVNSSzU4eStBU0pGWExiak1xTi9Dak16SVk3Nis0?=
 =?utf-8?B?K2pYd1gvQzVhMUI2Mkgva28yb1pGUEs0djIxSUZXdjNackNqbkZwazNweGVS?=
 =?utf-8?B?OENGYXM5U2plMXBlVEd4d2V4OUkvTllXYkdrMExvSnczYWxlaXRaWUR4bE1K?=
 =?utf-8?B?eC9uNzg2cFdkQzRKMEl2eGdnK0U4b1BkSUJOVy9WNWVPMmxvNzhBL2o1WTc5?=
 =?utf-8?B?dE5mNDlYZ1MxMjE3ZEE5Z2tubGtwT0RNMXNjYTVTbG1zNG5ISWRVNHVWZmhH?=
 =?utf-8?B?QmM5QUpOT0xYVXN5Wnk2Y1ZscUM1S3daTE5NNk5IMzgxRFJHS2ZpNzUzbEhz?=
 =?utf-8?B?SjFEeHlTY2cyRzBYV3dIR0hjOURvQWNNcitNT0l3dGh1M1FrWDl2L01oQVNQ?=
 =?utf-8?B?T1FMWi8zSVA3SG5LQ0FnMS9jMkw5NzhUTndFb0ZmVlVPOERMM0FQZm4wTGFo?=
 =?utf-8?B?OUE1a2dhQXFxdlIwYk9PR2JQYkZZVkJheFQvQ2JVeE1TWkxpR2c3anJQNURJ?=
 =?utf-8?B?OHExczM5cGlBYS9JZ2VVRHVBTmNuYmYyZmo0RHFXLzJjZWtWVERaWGY5U3lF?=
 =?utf-8?B?c202eEszRlN1Z3I4R1ViZEl5bndXMEVsZUY3cjdDdHRDWVhUNENFbHhpQUdC?=
 =?utf-8?B?UFd0Q1lVejBOdXFLQzUwU2kybFhlVzd0eHM4djdKSUMrNStzcm9WUGtCM0dB?=
 =?utf-8?B?VFE2VnNyaTRQQjFOSmlnWS9JY2hmaE9ubWVxbllHZmxqWUJoa0lmWDBuWmZk?=
 =?utf-8?B?VElRMERmQjhJbERzY253NnVNU0VBSFdXd0U4enlxL0JUWExCTDlaWDRaOTZX?=
 =?utf-8?B?SjJQSm5jY1c5dmFGQXdnQ2NiY2NjVmV5S3RrMk9QWlNVUDRsejVybGZuK05w?=
 =?utf-8?B?WWY4cXNYUjQzOG1DUU13ZkVTNFJpTjkvQW8rVFNNTzMxcHhPRFJkQ3AvaExO?=
 =?utf-8?Q?D29ceLG9E5YDgd1lyY2/6Ym8SQ0jeSLusbssl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca31e88-060e-48ae-a600-08df0205d0ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 17:33:31.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVYx4QBpbt8ZmyAih0T9EnF1/GdnvXNuwtshM2Fli0+qGrv4qcQTjXQBd5bs+ZaC3NvX8YpVEuopU4kdpmAHIaXbWpCxWfHeS9/pr2+jByDFy8gJIUwlH9KbMKQOVCRM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB084187

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
---
Changes from v41 to v42:

- Moved `devm_mutex_init` calls after `devm_add_action_or_reset`.
---
 drivers/firmware/imx/Kconfig        |  12 +
 drivers/firmware/imx/Makefile       |   2 +
 drivers/firmware/imx/ele_base_msg.c | 336 +++++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h | 100 ++++++
 drivers/firmware/imx/ele_common.c   | 588 ++++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/ele_common.h   |  45 +++
 drivers/firmware/imx/se_ctrl.c      | 520 +++++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      | 112 +++++++
 include/linux/firmware/imx/se_api.h |  14 +
 9 files changed, 1729 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 127ad752acf8..93ac339800e2 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -55,3 +55,15 @@ config IMX_SCMI_MISC_DRV
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
+	    Unit.
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
index 000000000000..a9a0fc16a553
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -0,0 +1,336 @@
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
+static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
+				 size_t size)
+{
+	if (priv->mem_pool)
+		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
+	else
+		dma_free_coherent(priv->dev, size, buf, d_addr);
+}
+
+/**
+ * ele_get_info() - retrieve SoC and firmware information from the ELE.
+ * @priv: pointer to the SE interface private data.
+ * @s_info: output buffer; filled with device info on success.
+ *
+ * Allocates a DMA-coherent bounce buffer (from the gen_pool if available,
+ * otherwise from the DMA API), sends an ELE_GET_INFO_REQ command, and copies
+ * the result into @s_info.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
+{
+	dma_addr_t get_info_addr = 0;
+	void *get_info_data = NULL;
+	u32 get_info_len;
+	int ret;
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
+	get_info_len = ELE_GET_INFO_BUFF_SZ;
+	if (priv->mem_pool)
+		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
+						   get_info_len,
+						   &get_info_addr);
+	else
+		get_info_data = dma_alloc_coherent(priv->dev,
+						   get_info_len,
+						   &get_info_addr,
+						   GFP_KERNEL);
+	if (!get_info_data) {
+		dev_err(priv->dev,
+			"%s: Failed to allocate get_info_addr.\n", __func__);
+		return -ENOMEM;
+	}
+
+	/* gen_pool_dma_alloc() does not zero the buffer. */
+	memset(get_info_data, 0, get_info_len);
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
+
+	tx_msg->data[0] = upper_32_bits(get_info_addr);
+	tx_msg->data[1] = lower_32_bits(get_info_addr);
+	tx_msg->data[2] = sizeof(*s_info);
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
+			       ELE_GET_INFO_RSP_MSG_SZ);
+	if (ret < 0) {
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
+		return ret;
+	}
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	if (ret < 0) {
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
+		return ret;
+	}
+
+	memcpy(s_info, get_info_data, sizeof(*s_info));
+
+	ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
+
+	return ret;
+}
+
+/**
+ * ele_fetch_soc_info() - wrapper around ele_get_info() for generic callers.
+ * @priv: pointer to the SE interface private data.
+ * @data: output buffer of at least sizeof(struct ele_dev_info) bytes.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
+{
+	return ele_get_info(priv, (struct ele_dev_info *)data);
+}
+
+/**
+ * ele_ping() - send a ping command to the secure enclave.
+ * @priv: pointer to the SE interface private data.
+ *
+ * Verifies that the secure enclave is alive and responsive.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ele_ping(struct se_if_priv *priv)
+{
+	int ret;
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
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
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
+/**
+ * ele_service_swap() - issue an ELE service-swap (IMEM export/import) command.
+ * @priv: pointer to the SE interface private data.
+ * @addr: DMA address of the IMEM buffer; must fit in 32 bits.
+ * @addr_size: size of the buffer at @addr in bytes.
+ * @flag: ELE_IMEM_EXPORT or ELE_IMEM_IMPORT.
+ *
+ * Return: exported size in bytes (ELE_IMEM_EXPORT), 0 (ELE_IMEM_IMPORT),
+ * or negative errno on failure.
+ */
+int ele_service_swap(struct se_if_priv *priv,
+		     dma_addr_t addr,
+		     u32 addr_size, u16 flag)
+{
+	int ret;
+
+	if (!priv)
+		return -EINVAL;
+
+	if (upper_32_bits(addr)) {
+		dev_err(priv->dev,
+			"ELE service-swap address exceeds 32-bit range: %pad\n",
+			&addr);
+		return -ERANGE;
+	}
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
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+
+	tx_msg->data[0] = flag;
+	tx_msg->data[1] = addr_size;
+	tx_msg->data[2] = ELE_NONE_VAL;
+	tx_msg->data[3] = lower_32_bits(addr);
+	ret = se_update_msg_chksum((u32 *)&tx_msg[0], ELE_SERVICE_SWAP_REQ_MSG_SZ);
+	if (ret)
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
+/**
+ * ele_fw_authenticate() - authenticate a firmware container via the ELE.
+ * @priv: pointer to the SE interface private data.
+ * @contnr_addr: DMA address of the firmware container; must fit in 32 bits.
+ * @img_addr: DMA address of the firmware image; must fit in 32 bits.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
+			dma_addr_t img_addr)
+{
+	int ret;
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
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
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
+/**
+ * ele_debug_dump() - retrieve and log the ELE debug dump buffer.
+ * @priv: pointer to the SE interface private data.
+ *
+ * Repeatedly issues ELE_DEBUG_DUMP_REQ commands and logs the responses via
+ * dev_info() until no more data is available or the maximum packet count is
+ * reached.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ele_debug_dump(struct se_if_priv *priv)
+{
+	bool keep_logging;
+	int msg_ex_cnt;
+	int ret;
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
+	se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
+			    ELE_DEBUG_DUMP_REQ_SZ, true);
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
+			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.\n", ret);
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
+			dev_info(priv->dev, "%s%02x_%02x: 0x%08x 0x%08x\n",
+				 FW_DBG_DUMP_FIXED_STR, msg_ex_cnt, i,
+				 rx_msg->data[i + 1], rx_msg->data[i + 2]);
+
+		msg_ex_cnt++;
+	} while (keep_logging);
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
new file mode 100644
index 000000000000..02525d5e2873
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -0,0 +1,100 @@
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
+#include <linux/unaligned.h>
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include "se_ctrl.h"
+
+#define ELE_NONE_VAL			0x0
+#define ELE_MAX_DBG_DMP_PKT		50
+
+#define ELE_PING_REQ			0x01
+#define ELE_PING_REQ_SZ			0x04
+#define ELE_PING_RSP_SZ			0x08
+
+#define ELE_FW_AUTH_REQ			0x02
+#define ELE_FW_AUTH_REQ_SZ		0x10
+#define ELE_FW_AUTH_RSP_MSG_SZ		0x08
+
+#define ELE_DEBUG_DUMP_REQ		0x21
+#define ELE_DEBUG_DUMP_REQ_SZ		0x4
+#define ELE_DEBUG_DUMP_RSP_SZ		0x5c
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
+#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) ({\
+	const u8 *__x = (const u8 *)(x); \
+	size_t __sz = (uid_word_sz); \
+	((u64)get_unaligned_le32(__x + (__sz - 1) * sizeof(u32)) << 32) | \
+		get_unaligned_le32(__x); \
+	})
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info);
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data);
+int ele_ping(struct se_if_priv *priv);
+int ele_service_swap(struct se_if_priv *priv, dma_addr_t addr,
+		     u32 addr_size, u16 flag);
+int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
+			dma_addr_t img_addr);
+int ele_debug_dump(struct se_if_priv *priv);
+#endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
new file mode 100644
index 000000000000..74cdac45231c
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+/**
+ * se_update_msg_chksum() - calculate and update message checksum word.
+ * @msg: message buffer.
+ * @msg_len: message length in bytes.
+ *
+ * The message length must be 4-byte aligned. The last word is treated as the
+ * checksum field and is not included in the checksum calculation.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int se_update_msg_chksum(u32 *msg, u32 msg_len)
+{
+	u32 nb_words;
+	u32 chksum = 0;
+	u32 i;
+
+	if (!msg)
+		return -EINVAL;
+
+	if (msg_len % SE_MSG_WORD_SZ) {
+		pr_err("Msg-len is not 4-byte aligned.\n");
+		return -EINVAL;
+	}
+
+	nb_words = msg_len / sizeof(*msg);
+	if (nb_words < 5)
+		return -EINVAL;
+
+	/* Last word is the checksum word, so skip it. */
+	nb_words--;
+
+	for (i = 0; i < nb_words; i++)
+		chksum ^= msg[i];
+
+	msg[nb_words] = chksum;
+
+	return 0;
+}
+
+/**
+ * ele_msg_rcv() - wait for a response from the secure enclave.
+ * @priv: pointer to the SE interface private data.
+ * @se_clbk_hdl: callback handle whose completion will be signaled when the
+ *               response arrives.
+ *
+ * Blocks until the firmware delivers a response into the buffer registered
+ * in @se_clbk_hdl, or until the per-interface timeout expires.  When waiting
+ * on the response path a deadline is enforced; on timeout the firmware-busy
+ * circuit breaker is armed to prevent further transactions until the delayed
+ * response arrives and clears it.
+ *
+ * Return: number of bytes received on success, negative errno on error
+ * (e.g. -ETIMEDOUT, -ERESTARTSYS).
+ */
+int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+{
+	bool is_rsp_wait_with_timeout = false;
+	bool wait_uninterruptible = false;
+	unsigned long remaining_jiffies;
+	unsigned long deadline_jiffies;
+	unsigned long flags;
+	int ret;
+
+	remaining_jiffies = msecs_to_jiffies(SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
+	if (se_clbk_hdl == &priv->waiting_rsp_clbk_hdl) {
+		is_rsp_wait_with_timeout = true;
+		deadline_jiffies = jiffies + remaining_jiffies;
+	}
+
+	do {
+		if (is_rsp_wait_with_timeout) {
+			unsigned long now = jiffies;
+
+			if (time_after_eq(now, deadline_jiffies)) {
+				/* Deadline hit: fence hung FW, like the ret==0 path. */
+				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+				se_clbk_hdl->rx_msg = NULL;
+				if (!completion_done(&se_clbk_hdl->done))
+					atomic_set(&priv->fw_busy, 1);
+				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+				ret = -ETIMEDOUT;
+				break;
+			}
+			remaining_jiffies = deadline_jiffies - now;
+		}
+
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
+			if (is_rsp_wait_with_timeout &&
+			    READ_ONCE(se_clbk_hdl->rx_msg)) {
+				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
+				wait_uninterruptible = true;
+				continue;
+			}
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
+				"Fatal Error: SE interface %s0, hangs indefinitely.\n",
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
+/**
+ * ele_msg_send() - send a message to the secure enclave over the mailbox.
+ * @priv: pointer to the SE interface private data.
+ * @tx_msg: buffer containing the message to send.
+ * @tx_msg_sz: size of @tx_msg in bytes; must match the size field in the
+ *             message header.
+ *
+ * Copies the message into the MU TX registers via the mailbox framework.
+ * The MU controller does not retain the caller's buffer after this call
+ * returns, so the caller may free @tx_msg immediately on success.
+ *
+ * Return: @tx_msg_sz on success, negative errno on error.
+ */
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
+			"User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
+			*(u32 *)header, header->size << 2, tx_msg_sz);
+		return -EINVAL;
+	}
+
+	/*
+	 * The i.MX MU mailbox controller copies the payload words into MU
+	 * registers synchronously from its send path. It does not retain the
+	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
+	 * the caller-owned buffer may be released after a successful send.
+	 */
+	err = mbox_send_message(priv->tx_chan, tx_msg);
+	if (err < 0) {
+		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		return err;
+	}
+
+	return tx_msg_sz;
+}
+
+static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
+	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
+	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+}
+
+/**
+ * ele_msg_send_rcv() - send a command and wait for the response.
+ * @priv: pointer to the SE interface private data.
+ * @tx_msg: buffer containing the command message to send.
+ * @tx_msg_sz: size of @tx_msg in bytes.
+ * @rx_msg: caller-provided buffer to receive the response into.
+ * @exp_rx_msg_sz: expected response size in bytes.
+ *
+ * Holds the SE command lock for the duration of the exchange to prevent
+ * concurrent transactions.  Signals are deferred until the protocol
+ * resynchronizes; -ERESTARTSYS is returned to the caller after a clean
+ * response is received if a signal arrived during the wait.
+ *
+ * Return: number of bytes received on success, negative errno on error.
+ */
+int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+		     void *rx_msg, int exp_rx_msg_sz)
+{
+	unsigned long flags;
+	int err;
+
+	guard(mutex)(&priv->se_if_cmd_lock);
+
+	if (atomic_read(&priv->fw_busy)) {
+		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		return -EBUSY;
+	}
+	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
+	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
+	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
+	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+
+	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	if (err < 0) {
+		ele_msg_send_rcv_cleanup(priv);
+		return err;
+	}
+
+	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+
+	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
+		/*
+		 * Signal was deferred until the FW/kernel protocol resynchronized.
+		 * On success report -ERESTARTSYS for the interrupted wait; the
+		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
+		 */
+		if (err > 0)
+			err = -ERESTARTSYS;
+		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
+		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+	}
+
+	ele_msg_send_rcv_cleanup(priv);
+
+	return err;
+}
+
+static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
+				       struct se_msg_hdr *header)
+{
+	/*
+	 * List of API headers that can accept a variable length response buffer.
+	 */
+	if (header->command == ELE_DEBUG_DUMP_REQ &&
+	    header->ver == priv->if_defs->base_api_ver &&
+	    header->size >= 2 && header->size <= (ELE_DEBUG_DUMP_RSP_SZ / 4))
+		return true;
+
+	return false;
+}
+
+/**
+ * se_if_rx_callback() - mailbox RX callback for secure enclave messages.
+ * @mbox_cl: mailbox client registered for this SE interface.
+ * @msg: pointer to the received message buffer; may be NULL or an ERR_PTR.
+ *
+ * Dispatches the incoming message to either the command receiver (cmd_tag)
+ * or the synchronous response waiter (rsp_tag).  Called from mailbox IRQ
+ * context; must not sleep.
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
+	if (!priv)
+		return;
+
+	/* The function can be called with NULL msg */
+	if (IS_ERR_OR_NULL(msg)) {
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
+		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.\n",
+			*(u32 *)header);
+
+		/*
+		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
+		 * as the NVM command are initiated by FW.
+		 * Size is revealed as part of this call function.
+		 */
+
+		if (rx_msg_sz > MAX_NVM_MSG_LEN)
+			sz_mismatch = true;
+
+		/*
+		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
+		 */
+		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, MAX_NVM_MSG_LEN);
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
+		u32 exp_rx_msg_sz;
+
+		/*
+		 * rx_msg and rx_msg_sz are owned by the sender under clbk_rx_lock.
+		 * Read both under the lock: drop a late response instead of copying
+		 * into freed memory, and avoid a stale size. A late response also
+		 * closes the firmware-busy circuit breaker.
+		 */
+		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (!se_clbk_hdl->rx_msg) {
+			/* Close circuit breaker on spinlock race */
+			atomic_set(&priv->fw_busy, 0);
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			dev_info(dev, "ELE responded (late), recovery FW available.\n");
+			return;
+		}
+		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
+		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.\n",
+			*(u32 *)header);
+
+		/*
+		 * For rsp_tag traffic, the sender provides the expected response
+		 * buffer size. If firmware returns a different size, clamp the copy
+		 * length to the caller's buffer capacity before memcpy() and report the
+		 * mismatch after dropping the spinlock.
+		 */
+		if (rx_msg_sz != exp_rx_msg_sz && !exception_for_sz_mismatch)
+			sz_mismatch = true;
+
+		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
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
+/**
+ * se_val_rsp_hdr_n_status() - validate a response message header and status.
+ * @priv: pointer to the SE interface private data.
+ * @msg: response message buffer to validate.
+ * @msg_id: expected command identifier.
+ * @sz: expected message size in bytes.
+ * @is_base_api: true if the base API version should be checked, false for the
+ *               firmware API version.
+ *
+ * Checks that the response tag, command id, size, API version, and status
+ * word all match the expected values.
+ *
+ * Return: 0 on success, -EINVAL if any header field mismatches, -EPERM if
+ * the firmware status indicates a command failure.
+ */
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+			    u8 msg_id, u8 sz, bool is_base_api)
+{
+	struct se_msg_hdr *header = &msg->header;
+	u32 status;
+
+	if (header->tag != priv->if_defs->rsp_tag) {
+		dev_dbg(priv->dev, "MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)\n",
+			msg_id, header->tag, priv->if_defs->rsp_tag);
+		return -EINVAL;
+	}
+
+	if (header->command != msg_id) {
+		dev_dbg(priv->dev, "MSG Header: Cmd id mismatch. (0x%x != 0x%x)\n",
+			header->command, msg_id);
+		return -EINVAL;
+	}
+
+	if ((sz % 4) || (header->size != (sz >> 2) &&
+			 !check_hdr_exception_for_sz(priv, header))) {
+		dev_dbg(priv->dev, "MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)\n",
+			msg_id, header->size, (sz >> 2));
+		return -EINVAL;
+	}
+
+	if (is_base_api && header->ver != priv->if_defs->base_api_ver) {
+		dev_dbg(priv->dev,
+			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x != 0x%x)\n",
+			msg_id, header->ver, priv->if_defs->base_api_ver);
+		return -EINVAL;
+	} else if (!is_base_api && header->ver != priv->if_defs->fw_api_ver) {
+		dev_dbg(priv->dev,
+			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x != 0x%x)\n",
+			msg_id, header->ver, priv->if_defs->fw_api_ver);
+		return -EINVAL;
+	}
+
+	if (header->size > SE_MU_HDR_WORD_SZ) {
+		status = RES_STATUS(msg->data[0]);
+		if (status != priv->if_defs->success_tag) {
+			dev_dbg(priv->dev, "Command Id[%x], Response Failure = 0x%x\n",
+				header->command, status);
+			return -EPERM;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * se_save_imem_state() - export and save the encrypted IMEM state.
+ * @priv: pointer to the SE interface private data.
+ * @imem: IMEM buffer descriptor; @imem->daddr must point to a DMA-coherent
+ *        buffer of at least ELE_IMEM_SIZE bytes.
+ *
+ * Issues an ELE_IMEM_EXPORT service-swap command to save the current IMEM
+ * content into the pre-allocated DMA buffer.  Intended to be called during
+ * system suspend.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
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
+		return 0;
+
+	/*
+	 * EXPORT command will save encrypted IMEM to given address,
+	 * so later in resume, IMEM can be restored from the given
+	 * address.
+	 *
+	 * Size must be at least 64 kB.
+	 */
+	ret = ele_service_swap(priv, imem->daddr, ELE_IMEM_SIZE, ELE_IMEM_EXPORT);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to export IMEM.\n");
+		imem->size = 0;
+	} else if (ret > ELE_IMEM_SIZE) {
+		dev_err(priv->dev, "Invalid exported IMEM size %d.\n", ret);
+		imem->size = 0;
+		ret = -EIO;
+	} else {
+		dev_dbg(priv->dev,
+			"Exported %d bytes of encrypted IMEM.\n",
+			ret);
+		imem->size = ret;
+	}
+
+	return ret > 0 ? 0 : ret;
+}
+
+/**
+ * se_restore_imem_state() - restore the encrypted IMEM state after resume.
+ * @priv: pointer to the SE interface private data.
+ * @imem: IMEM buffer descriptor populated by a prior se_save_imem_state()
+ *        call; @imem->size must be non-zero.
+ *
+ * Issues an ELE_IMEM_IMPORT service-swap command to restore IMEM from the
+ * saved DMA buffer, then verifies that the enclave reports
+ * ELE_IMEM_STATE_OK.  Intended to be called during system resume.
+ *
+ * Return: 0 on success, -EIO if IMEM state is not OK after import, or
+ * another negative errno on communication failure.
+ */
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info;
+	int ret;
+
+	/* get info from ELE */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.\n");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	/* Check for the imem-state and imem-size before continue to
+	 * restore imem state.
+	 */
+	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
+		return 0;
+
+	/*
+	 * IMPORT command will restore IMEM from the given
+	 * address, here size is the actual size returned by ELE
+	 * during the export operation
+	 */
+	ret = ele_service_swap(priv, imem->daddr, imem->size, ELE_IMEM_IMPORT);
+	if (ret) {
+		dev_err(priv->dev, "Failed to import IMEM\n");
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
+		dev_err(priv->dev, "Failed to get info from ELE.\n");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_OK) {
+		dev_dbg(priv->dev, "Successfully restored IMEM.\n");
+	} else {
+		dev_err(priv->dev, "Failed to restore IMEM: state=0x%02x, expected 0x%02x.\n",
+			s_info.d_addn_info.imem_state, ELE_IMEM_STATE_OK);
+		/*
+		 * ele_get_info() succeeded (ret == 0) but the IMEM state
+		 * reported by the hardware is not ELE_IMEM_STATE_OK. Return
+		 * -EIO so the PM subsystem knows the enclave is non-functional
+		 * after resume, instead of silently continuing with bad state.
+		 */
+		ret = -EIO;
+	}
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
new file mode 100644
index 000000000000..7bf2febefc45
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
+#define SE_RCV_MSG_DEFAULT_TIMEOUT_MS	3000
+
+#define ELE_SUCCESS_IND			0xD6
+
+#define IMX_ELE_FW_DIR                 "imx/ele/"
+
+int se_update_msg_chksum(u32 *msg, u32 msg_len);
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
+static inline void se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
+				       u8 cmd, u32 len, bool is_base_api)
+{
+	hdr->tag = priv->if_defs->cmd_tag;
+	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
+	hdr->command = cmd;
+	hdr->size = len >> 2;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+#endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
new file mode 100644
index 000000000000..9e3f81a9a272
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -0,0 +1,520 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/firmware.h>
+#include <linux/firmware/imx/se_api.h>
+#include <linux/genalloc.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
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
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+
+#define SE_TYPE_ID_DBG			0x1
+
+#define SE_TYPE_ID_HSM			0x2
+
+struct se_soc_dev_regn {
+	bool soc_dev_registered;
+	struct soc_device *soc_dev;
+	struct soc_device_attribute *soc_dev_attr;
+};
+
+struct se_var_info {
+	u16 soc_rev;
+	struct se_soc_dev_regn soc_dev_regn;
+	/* To serialize populating common SoC level info. */
+	struct mutex se_var_info_lock;
+};
+
+/* contains fixed information */
+struct se_soc_info {
+	const u16 soc_id;
+	const char *soc_name;
+	const struct se_fw_img_name se_fw_img_nm;
+	bool imem_state_mgmt;
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
+static struct se_var_info var_se_info = {
+	.soc_rev = 0,
+	.se_var_info_lock = __MUTEX_INITIALIZER(var_se_info.se_var_info_lock)
+};
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
+	.imem_state_mgmt = true,
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
+	{ .compatible = "fsl,imx8ulp-se-ele-hsm", .data = &imx8ulp_se_ele_hsm },
+	{ .compatible = "fsl,imx93-se-ele-hsm", .data = &imx93_se_ele_hsm },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, se_match);
+
+/**
+ * get_se_if_name() - return a human-readable string for a SE interface type.
+ * @se_if_id: SE interface type identifier (e.g. SE_TYPE_ID_HSM).
+ *
+ * Return: pointer to a constant string naming the interface type, or "unknown"
+ * if @se_if_id does not match any known type.
+ */
+char *get_se_if_name(u8 se_if_id)
+{
+	switch (se_if_id) {
+	case SE_TYPE_ID_DBG: return SE_TYPE_STR_DBG;
+	case SE_TYPE_ID_HSM: return SE_TYPE_STR_HSM;
+	}
+
+	return "unknown";
+}
+
+static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
+{
+	return &priv->load_fw;
+}
+
+static void se_soc_device_unregister(struct se_soc_dev_regn *soc_dev_regn)
+{
+	guard(mutex)(&var_se_info.se_var_info_lock);
+
+	if (soc_dev_regn->soc_dev) {
+		soc_device_unregister(soc_dev_regn->soc_dev);
+		soc_dev_regn->soc_dev = NULL;
+	}
+
+	if (soc_dev_regn->soc_dev_attr) {
+		/*
+		 * revision and serial_number are the only kasprintf()-allocated
+		 * strings. machine points into the DT, and soc_id/family are
+		 * constants, so they must not be freed.
+		 */
+		kfree(soc_dev_regn->soc_dev_attr->revision);
+		kfree(soc_dev_regn->soc_dev_attr->serial_number);
+		kfree(soc_dev_regn->soc_dev_attr);
+		soc_dev_regn->soc_dev_attr = NULL;
+	}
+
+	soc_dev_regn->soc_dev_registered = false;
+}
+
+/*
+ * Build and register a soc_device entry for this SoC. Separated from
+ * get_se_soc_info() so that the firmware-fetch path and the sysfs
+ * registration path can be reasoned about independently.
+ */
+static int se_soc_dev_register(struct se_if_priv *priv, u16 soc_rev,
+			       const char *soc_name, const u8 *uid)
+{
+	struct soc_device_attribute *attr;
+	struct soc_device *sdev;
+	int err;
+
+	if (!soc_rev || !soc_name || !uid)
+		return -EINVAL;
+
+	attr = kzalloc_obj(*attr, GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, soc_rev))
+		attr->revision = kasprintf(GFP_KERNEL, "%x.%x",
+					   FIELD_GET(DEV_GETINFO_MAJ_VER_MASK, soc_rev),
+					   FIELD_GET(DEV_GETINFO_MIN_VER_MASK, soc_rev));
+	else
+		attr->revision = kasprintf(GFP_KERNEL, "%x",
+					   FIELD_GET(DEV_GETINFO_MAJ_VER_MASK, soc_rev));
+
+	if (!attr->revision) {
+		err = -ENOMEM;
+		goto err_free_attr;
+	}
+
+	attr->soc_id = soc_name;
+
+	err = of_property_read_string(of_root, "model", &attr->machine);
+	if (err) {
+		err = -EINVAL;
+		goto err_free_rev;
+	}
+
+	attr->family = "Freescale i.MX";
+
+	attr->serial_number = kasprintf(GFP_KERNEL, "%016llX",
+					GET_SERIAL_NUM_FROM_UID(uid, MAX_UID_SIZE >> 2));
+	if (!attr->serial_number) {
+		err = -ENOMEM;
+		goto err_free_rev;
+	}
+
+	sdev = soc_device_register(attr);
+	if (IS_ERR(sdev)) {
+		err = PTR_ERR(sdev);
+		goto err_free_serial;
+	}
+
+	/*
+	 * Publish the singleton. Freed once, at module unload, by
+	 * se_soc_device_unregister(). Caller holds se_var_info_lock.
+	 */
+	var_se_info.soc_dev_regn.soc_dev = sdev;
+	var_se_info.soc_dev_regn.soc_dev_attr = attr;
+
+	/* Mark registration complete so get_se_soc_info() skips this path on retry. */
+	var_se_info.soc_dev_regn.soc_dev_registered = true;
+
+	return 0;
+
+err_free_serial:
+	kfree(attr->serial_number);
+err_free_rev:
+	kfree(attr->revision);
+err_free_attr:
+	kfree(attr);
+
+	return err;
+}
+
+static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	u8 data[MAX_SOC_INFO_DATA_SZ];
+	struct ele_dev_info *s_info;
+	int err;
+
+	guard(mutex)(&var_se_info.se_var_info_lock);
+
+	/*
+	 * Early exit: both objectives already complete, nothing to do.
+	 * Do not exit early when imem_mgmt is active: load_fw is per-probe
+	 * (embedded in priv) and starts zeroed on every probe, so imem.state
+	 * must be refreshed from firmware on each probe even when soc_rev is
+	 * already cached in the module-lifetime var_se_info.
+	 */
+	if (var_se_info.soc_rev &&
+	    (!se_info->soc_name || var_se_info.soc_dev_regn.soc_dev_registered) &&
+	    !load_fw->imem_mgmt)
+		return 0;
+
+	err = ele_fetch_soc_info(priv, &data);
+	if (err < 0)
+		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.\n");
+
+	s_info = (struct ele_dev_info *)data;
+
+	if (!var_se_info.soc_rev)
+		var_se_info.soc_rev = s_info->d_info.soc_rev;
+
+	/*
+	 * imem.state is per-probe state (lives in priv->load_fw which is
+	 * zeroed on every probe). Update it unconditionally whenever the
+	 * IMEM management path is active, regardless of whether soc_rev was
+	 * already cached from a previous probe or a sibling interface.
+	 */
+	if (load_fw->imem_mgmt)
+		load_fw->imem.state = s_info->d_addn_info.imem_state;
+
+	if (se_info->soc_name && !var_se_info.soc_dev_regn.soc_dev_registered) {
+		err = se_soc_dev_register(priv, var_se_info.soc_rev,
+					  se_info->soc_name, s_info->d_info.uid);
+		if (err < 0)
+			return dev_err_probe(priv->dev, err,
+					     "Failed to register SE SoC device.\n");
+	}
+
+	return 0;
+}
+
+static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
+				 struct mbox_client *cl, const char *name)
+{
+	struct mbox_chan *t_chan;
+
+	t_chan = mbox_request_channel_byname(cl, name);
+	if (IS_ERR(t_chan))
+		return dev_err_probe(dev, PTR_ERR(t_chan),
+				     "Failed to request %s channel.\n", name);
+
+	*chan = t_chan;
+
+	return 0;
+}
+
+static void se_if_probe_cleanup(void *plat_dev)
+{
+	struct platform_device *pdev = plat_dev;
+	struct device *dev = &pdev->dev;
+	struct se_if_priv *priv;
+
+	priv = dev_get_drvdata(dev);
+	if (!priv)
+		return;
+
+	if (priv->rx_chan)
+		mbox_free_channel(priv->rx_chan);
+	if (priv->tx_chan)
+		mbox_free_channel(priv->tx_chan);
+
+	/*
+	 * Being device managed buffer, no need to free the buffer allocated
+	 * in se probe to store encrypted IMEM.
+	 */
+
+	/*
+	 * No need to check, if reserved memory is allocated
+	 * before calling for its release. Or clearing the
+	 * un-set bit.
+	 */
+	of_reserved_mem_device_release(dev);
+
+	dev_set_drvdata(dev, NULL);
+
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
+	ret = devm_mutex_init(dev, &priv->se_if_cmd_lock);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to init mutex: priv se_if_cmd_lock.\n");
+	/* Mailbox client configuration */
+	priv->se_mb_cl.dev		= dev;
+	priv->se_mb_cl.tx_block		= false;
+	priv->se_mb_cl.knows_txdone	= false;
+	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+
+	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, "tx");
+	if (ret)
+		return ret;
+
+	ret = se_if_request_channel(dev, &priv->rx_chan, &priv->se_mb_cl, "rx");
+	if (ret)
+		return ret;
+
+	if (if_node->pool_name) {
+		priv->mem_pool = of_gen_pool_get(dev->of_node, if_node->pool_name, 0);
+		if (!priv->mem_pool)
+			return dev_err_probe(dev, -ENOMEM,
+					     "Unable to get sram pool = %s.\n",
+					     if_node->pool_name);
+	}
+
+	if (if_node->reserved_dma_ranges) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to init reserved memory region.\n");
+	}
+
+	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+
+	/*
+	 * Initialize load_fw_lock before registering the misc device.
+	 * A userspace process could open the device and trigger se_load_firmware()
+	 * via IOCTL immediately after misc_register(), so the mutex must be ready
+	 * before the device becomes visible.
+	 */
+	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
+		load_fw = get_load_fw_instance(priv);
+		ret = devm_mutex_init(dev, &load_fw->load_fw_lock);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to init mutex: load_fw_lock.\n");
+		load_fw->se_fw_img_nm = &se_info->se_fw_img_nm;
+		load_fw->is_fw_tobe_loaded = true;
+	}
+
+	/* By default, there is no pending FW to be loaded.*/
+	if (se_info->imem_state_mgmt) {
+		load_fw = get_load_fw_instance(priv);
+
+		/* allocate buffer where SE store encrypted IMEM */
+		load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
+							&load_fw->imem.daddr,
+							GFP_KERNEL);
+		if (!load_fw->imem.buf)
+			return dev_err_probe(dev, -ENOMEM,
+					     "dmam-alloc-failed: To store encr-IMEM.\n");
+		load_fw->imem_mgmt = true;
+	}
+
+	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
+		ret = get_se_soc_info(priv, se_info);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.\n");
+	}
+
+	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.\n",
+		 get_se_if_name(priv->if_defs->se_if_type));
+
+	return ret;
+}
+
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
+			dev_err(dev, "Failure saving IMEM state[0x%x]\n", ret);
+	}
+
+	return ret;
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
+		ret = se_restore_imem_state(priv, &load_fw->imem);
+		if (ret)
+			dev_err(dev, "Failure restoring IMEM state[0x%x]\n", ret);
+	}
+
+	return ret;
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(se_pm, se_suspend, se_resume);
+
+static struct platform_driver se_driver = {
+	.driver = {
+		.name = "fsl-se",
+		.of_match_table = se_match,
+		.pm = pm_sleep_ptr(&se_pm),
+	},
+	.probe = se_if_probe,
+};
+
+static int __init se_init(void)
+{
+	return platform_driver_register(&se_driver);
+}
+module_init(se_init);
+
+static void __exit se_exit(void)
+{
+	platform_driver_unregister(&se_driver);
+
+	/*
+	 * The soc_device is a module-scoped singleton that outlives any single
+	 * MU interface bind/unbind. Release it here, once, after every interface
+	 * has been unbound, so its lifetime is tied to the module rather than to
+	 * the first-probed interface.
+	 */
+	se_soc_device_unregister(&var_se_info.soc_dev_regn);
+}
+module_exit(se_exit);
+
+MODULE_AUTHOR("Pankaj Gupta <pankaj.gupta@nxp.com>");
+MODULE_DESCRIPTION("iMX Secure Enclave Driver.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
new file mode 100644
index 000000000000..54b2a262a2c3
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2026 NXP
+ */
+
+#ifndef SE_CTRL_H
+#define SE_CTRL_H
+
+#include <linux/bitfield.h>
+#include <linux/miscdevice.h>
+#include <linux/mailbox_client.h>
+#include <linux/semaphore.h>
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
+	dma_addr_t daddr;
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
+#define SE_MU_HDR_SZ		4
+#define SE_MU_HDR_WORD_SZ	1
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
+struct se_fw_img_name {
+	const char *prim_fw_nm_in_rfs;
+	const char *seco_fw_nm_in_rfs;
+};
+
+struct se_fw_load_info {
+	const struct se_fw_img_name *se_fw_img_nm;
+	bool is_fw_tobe_loaded;
+	bool imem_mgmt;
+	struct se_imem_buf imem;
+	/* to serialize the fw load state */
+	struct mutex load_fw_lock;
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
+	struct se_fw_load_info load_fw;
+
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

