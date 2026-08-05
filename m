Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BE3E5EC4
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916481; cv=fail; b=SfovMBABYc2tJrSULasBDRgkuVmIggkGhs+5l3H/+a33VXgqOI12zf32m28cFjSFQYN45z4iPqiMKxXCNGa8vMuqCo7wEoI/zKYO7NJoJdXzcg0TP7rLXr7UJAWPJiNTQisg7Z4HIWDrGMmy01/ci6QcsVPpVBGURQXwoPS8WUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916481; c=relaxed/simple;
	bh=v0JAPDcflE5/9z3XqPTQtzgKeQJrO/Ams3lH0hMXeR4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VfOLP+vZeV350eVReW+YShmhsywBYRdCLl7q3foUV1oK3yn5+50TmFxkypdV42upVHgYbEgPBd9LwIhd5/US6RZYlrF5w4/I4fpxxZN5fLR43kCMMPnhOFVkLXNcZL4mEQRn15fX59bXh0CMgMW3dEwvS+h/HxsWyVoAnOV3xeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hw2BQabb; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hw2BQabb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn6qkt7IeQwKOwJtXgA1NV7KV3jIEUZylBX9rGhJ4NF3CTLc1RzGjSQ9Y821Oyqiyw1LJfHwVqSAUYeOxo9Lqva35NfBqnoyQnY9PoQhClsxmSh496EPkk3MQ7XfNlfHLPLUhTaQ8V+NmMVOzaib5BWxD029Blg82V26wy7HhklC3eAPZlh4sNsi1ujzAjRajy8LUd001YvSwEXbwJ/XzhHZECndC041/GyP1gkgDIl+rtbORH31YwSrTp8pxsWS0/QAl8ERZRWIYwZ19rYCoSFi1n+OU1qOKd8PLCZooHVU71Q2IBWMf2gA2+ueOPIiqPVBHlGWbKQM9q9iQvFNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Gp06YaUnQ2rmcoNzH2q27VUDJpRPPTrFnAVy8NQj58=;
 b=IGLh13TLyH8EMe7ur9WoPdJVv1kCixj6KB52zLkaisNSGOleQR8MvVbOsaVm1iWqwIx8trQD9s9Sglca1/2LcD08bWczBLFUD3OIjzeooGAee+2/Io6BzpheRzY5DzWVIaA+7WVaKv7xZ+l7p9t2mncxVyBgdl26LflfS8mO+gxCfLF7CvZhVp9IBng1gM4fcDRpcax/caxu1+LJ6shQNiwB/UJPBHUuz0jrjffAWpmZ9rRZbgyPBYv8xrdseGm/dXv7ee8uoT05CLxy785aibSoQwJy7OEgADvTxsBS6XHm2E80ScXIMcq7AWvzGJcWMluiDOwe7HdQuIRYdeshBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Gp06YaUnQ2rmcoNzH2q27VUDJpRPPTrFnAVy8NQj58=;
 b=hw2BQabbDi5CdrJweB2/4naaaXm7Fu0ueKugyb9W9YRt0wbYBCviIceYHxD0x3LlcUzjPTfsfVrapvZPVLAD8nRsfneOv6neLgIIioR3uAmRgkGb6+F31I9LhA3oqWRFRcu6S+0LejrUroRfNuCEJIc4OmKYfAceEvtwIKiAy21Y4+T7BXPcFwXua/zwiNXzLnGKDQuWIhtxk2NcqsfOJejfueiGEUy0uc6Enu2f2sSLp4b0BDRWgb5zQ57AcKkbuM4+4P/9oJWMmo0kMdj8+u0QVEpR8a5Lzlnm40jKqwdeY3mmavsg7K2pg6vIiVZv6NPYDCW/hXasFRqdUX9Q0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI0PR04MB10687.eurprd04.prod.outlook.com (2603:10a6:800:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 07:54:29 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:54:29 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 14:14:51 +0530
Subject: [PATCH v33 5/7] firmware: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v33-5-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
In-Reply-To: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785919487; l=90899;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=CE4W6cUMd45VfqSJ0Xsgu+5M138NCgNdmotDthzhwgg=;
 b=67YSVkp4AL8EdrI6YEysMj7FHMhpJIlT5iQk+IGlzOMzEOQYkrnn6zOWth1yiBDQlUF6mz5Xk
 IXuY1wP0K4JAt0huZnGBDilwP1Zs6pI5VpqCoZxVURKky7T9Cd9ruQB
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0226.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::11) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI0PR04MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8ff010-dd06-4f76-3f8b-08def2c6c6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|921020|7136999003|13003099007|6133799003|22082099003|18002099003|11062099010|3023799007|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	LKimxduWrd8s8GAVHnuyp3xdiZdiOC/cMgcMGutqRtEqtO94es8EXG9C9vtyPYiDNcgFR5oDZNwbdLx5Y4dLJRVUdHlakFAdIom982Mf6Z+oznpUcBj3AYm4vStcOfMpR1vnsLkepyaL4AKjgeZCkgYUMSZup9EwPo4DJ0SXXOeyGahppA4lCjtgjPIbsJZIVAEAGc8ic6K3riLXehjXVBom4OOw30tnSPJV3TdT6J5142Ye+ZKMDgrkl4xeNzQe3MGy7ChETMnd36cDFZ7Cq7AwIxk9miRCHbj/iT2jdcE5FdHgfTO8hsivQFetV4lNz3CHdakBsjUxqktw9uiI8yVenSY1gVxFM0s4EmTBFMSwOTXr0MiFthPewpQzoaBTwEgHO1/im/vNKg0EGyma/Ua497BJY+p96KgrHWyydRQwymRdvpMxSk2SCycF7CXpeNuO21zwLmpPGvlkq6k6CO+IJXXjfE7oTTJJI8KlcdUZECR/aJzzSKJE+n0FnX0fNI5JKLQIO9+0J1TYMaLTxNZuslyYns+BUOOuD9n05mz8c+3L1WxD06atoeOtiEqaU4r5pZRF8SzPeTmzGoDLId9AvlCIFVxUhOlLAvmqjHdHKyie/Aie3mFLChfNgaL5GOHWBHj+nWauHy/49KWXqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(7136999003)(13003099007)(6133799003)(22082099003)(18002099003)(11062099010)(3023799007)(5023799004)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnlEWnNSZnRpdHMwZ2J6OTdwdnlkVEViWVRNNTFCVjVZbGkxek5kQUFBaTdX?=
 =?utf-8?B?a3RFV2pCcUNHcXJzaGhGbWVIRjdJalJDZmlXMExCUkU5MHFKeEFtNm1ETjFH?=
 =?utf-8?B?SjBaaEcycitrNDhaUU1ZcFR2cTdveFpteUhhdTJpUU9UaVhybGJ5cGpzNlA0?=
 =?utf-8?B?aGFkbDluWThyaWFvUWR3cTlMOGp5eUxWb20vdzhDMzBHZFRDb1JYM1c4WmhK?=
 =?utf-8?B?TEhOWHJndUs2YzhsTjhlQk9YdzFqdmQ0WndZVDQxZG5SQlVCNDlVOGJxSFkw?=
 =?utf-8?B?QTZwcUE1RC9qTkhsLzExMmVDWEh3cHZ0QXF2YVc5d0kvdENrQXdYeDVnTWJU?=
 =?utf-8?B?dHRZWVJwQnBtM2p5cTJldkpSd2Yva1NCYXBDckl0ZGVhUnREa0JENHBML2Jk?=
 =?utf-8?B?WU8rMXFra0JMRDJIN3BBYmV3WVFtQlZsc0NJSWJEWElGY3R0WUUrL2hYNzVL?=
 =?utf-8?B?VGtycENXeGNSdVlEL3FoYldjUnJ2RWc5b2hacDFuVlZZeUZOWStFUFh2VlBa?=
 =?utf-8?B?Z0l1RjA5MFJZOFZ3ZFRwWXQxWS96ZUlkWXEvRExkOHRqWnNvYVNYR3J1bjNO?=
 =?utf-8?B?THhZQ2h6ejRNc29DTHNML0xJbDVMOXN0dXpXaWdRelErdHp2S01UNkhtQmpa?=
 =?utf-8?B?NWdpdElpQjE0dllCREJPcWNyZnY2TSs4cCsxbGg0ZDJoVGRNdExZR3lKTTJl?=
 =?utf-8?B?NS9RVGZTZDROWEk1WGRkeUFCd0F6bWlyVkxiR1FEZzlHZHRNUjA4blFjUjM2?=
 =?utf-8?B?blo5SGVLMUJMR243bWNvT0VDc3h4MEdMMjJnYlZSQVg4STZOd3plSjM1UDlz?=
 =?utf-8?B?YkNGbWxJb0dyd2xNOGxSWHExMnVCZ21ldFRZcHNQNDdRQW1WU0ErVERSOGxC?=
 =?utf-8?B?bUttellrYk5wVFBFcDFyUVhtek8vZ1NRbzM5dmFTV1I0akJta3lWS3NaUURR?=
 =?utf-8?B?aXlYN3oxYmVVMFcxc09uNzk0VE1WV0ZzWmJFZXE3NnZRbU9ZVjNkRTEyS1U2?=
 =?utf-8?B?TnoxOVMrRHpmTUJ2eG1OaGVaVDhrTHI0U0h0djlYSC81NUxpMFhtenh1SGdr?=
 =?utf-8?B?RVFQSytieXFJc3BCa2Q2VU9XTWFXcTR5NktzSUhOUXpTQlhXMnRQWWREdjBW?=
 =?utf-8?B?N1BrdENpSXlHb0J0d2pVNWJxN1JGTzNrRVljMWJNR3VnbWM4ZVE0V0lzYm10?=
 =?utf-8?B?SlE0YkRCYmltVmx4S2VGSVlRY2Z6NWxDZzRUT1M3eHdZZGtRZUwxeEtVRm1n?=
 =?utf-8?B?MThVOGN5VGpUYmFkcWp2VVgxZ0dvUi80ZkhUaXdySi93eW12Y3hSd09LMTlR?=
 =?utf-8?B?cXBCb0U5WlZvRkFuci9mUFQyTzdNZTZmTUlwQXBpb3dCRFJnWjRrR1VvOVRD?=
 =?utf-8?B?Mk9pSHFGZ1BRcC9abnNnQkxlUG9jWDdXZWYzRnVkNU4xb2o3czAvQlJyYW1l?=
 =?utf-8?B?UGQrT21jbnJtYlkxSFA2UWF3dVpCbjdFazI2SDIwRW4xc1RyZ2ROZUJjbkFx?=
 =?utf-8?B?V1FwTWl3TGg5eDJydERkS0JjUkFsSVV3YXhUcDQvWlVLQnkvOTEwbVdpWlB6?=
 =?utf-8?B?Y3I0d1B4ellWYld3bldPQzd6MkJvUjJXRklVbVRHbDBlTUFaSDI3Ry84VWN4?=
 =?utf-8?B?dm9salRZdmZsN3p0VGx5QUh3b2V0dE8vVENtRk14c3pCbTZxZnhqaW5lWlR1?=
 =?utf-8?B?dkRSVGtVcjZuUHVSakxDNWZ1VDdXM3dqNU1ZZ1FDWGc1anJGMUNNUGRXTjBI?=
 =?utf-8?B?QUszbGlCQm1RYlVEQ1EwcXdQcURkc3UweFJrdUdJeTVnMW5ocW56NWxocCtl?=
 =?utf-8?B?b3NJNHZpTTNaTEU3YjE5Z0FYeFJZeUozelFtTVZlbEFhRHR1YWkzb0pQelpP?=
 =?utf-8?B?Vm9DRVBIK0R2Uk5zNDl5ME1QdTRDMWJJS0Vla09ZL1Z6Mm5heExmQUlTMVlo?=
 =?utf-8?B?NDRvZlNlWUdwOG9NVG9pRHhobVYwWVNjSFhkQ25PT2tmQit6c3JPb0NWRmlD?=
 =?utf-8?B?NDQwNWllMmptdkhNU21VN0NhTXNBYmlDRWRQMXVoMkp3ODlxRXlNMFdOSFdJ?=
 =?utf-8?B?cTVSbFRzYVBYczNwbk9ROUQ0Q0xNZmZ1RVFNTm92aFRXYXB1ay9FYnhhR2hE?=
 =?utf-8?B?OUhMUXlpWlo4Yit6Y3pUYTRRdFZtbjcvTXp1VjF1SGpwaDBrREJCS1J2SXZ3?=
 =?utf-8?B?cnVMWTl4R3BtSmVWcVJjWnQ2TUZqSXNBUVlMUlQ5eDRpSy9uSUduT0NQMnJS?=
 =?utf-8?B?VXVrdXZmSXdJem15M09ZS3dTMWNIZFNNVjJTeHc5cS8yeDVBZmlrTHhLZ1Vi?=
 =?utf-8?B?Ulp4WFJxMzJhOEVqcmFtV3pBY2RsSGR3b2R4TlFhUGhoWDZkVGtZUkNRdFhE?=
 =?utf-8?Q?MdliGf3sGdoE4ZU7A/uTfJPYQsSvk/hRt3tNd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8ff010-dd06-4f76-3f8b-08def2c6c6c9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:54:29.2092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCmZFcCbefoKMHXcBcgHp9vgBVjEkGBHoGJwdDQ4ojflRcLO1eQC6zxOsj7R9fmXSB6/aAEEpTuMLWAIk3uE4eNJfdZoGQGkMS/bq3CmeafuVc+UfO+o9yuv6FRJfNOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10687

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
Changes from v32 to v33:
Sashiko AI comment disposition (5/7, 8 comments; 5 fixed, 3 no-change):

- [High] 32/64-bit ABI mismatch in struct se_ioctl_cmd_snd_rcv_rsp_info:
  FIXED. The members were ordered __u64 tx_buf, __u32 tx_buf_sz, __u64
  rx_buf, __u32 rx_buf_sz, so the second __u64 (rx_buf) forced 4 bytes of
  implicit padding after tx_buf_sz. That padding makes the struct size
  (and therefore the _IOWR() size baked into SE_IOCTL_CMD_SEND_RCV_RSP)
  differ between 32- and 64-bit userspace. The two __u64 members are now
  placed first, followed by the two __u32 members, giving a naturally
  packed, padding-free layout that is identical for 32- and 64-bit
  callers.

- [High] fops write/read/ioctl/open returned -EBUSY when the interruptible
  mutex acquisition was aborted by a signal: FIXED. scoped_cond_guard(
  mutex_intr, ...) and mutex_lock_interruptible() abort with an
  interrupted-wait status when a signal is pending, but the handlers
  translated that into -EBUSY, which userspace cannot distinguish from a
  genuinely contended device and which defeats automatic syscall restart.
  The interrupted-acquire paths in se_if_fops_write(), se_if_fops_read(),
  se_if_fops_open() (both the gate->lock and priv_dev_ctx->fops_lock
  acquisitions) and se_ioctl() now return -ERESTARTSYS, so the kernel
  restarts the syscall or reports -EINTR per the caller's SA_RESTART
  disposition. The three remaining -EBUSY returns (command receiver
  already registered, and the two firmware-busy circuit-breaker checks)
  are genuine non-signal conditions and are intentionally left unchanged.

- [High] se_if_fops_read() could strand an already-consumed response when
  the fops_lock reacquire after the wait was interrupted: FIXED. The read
  path drops fops_lock while waiting for the firmware response and then
  reacquired it with mutex_lock_interruptible(), returning -ERESTARTSYS on
  a pending signal. By that point the message had already been received
  and committed, so aborting on a signal discarded a completed response
  that could not be re-fetched. The reacquire now uses an uninterruptible
  mutex_lock(); the wait itself stays interruptible, and the cleanup_done
  re-check under fops_lock is preserved.

- [High] TOCTOU / lost-wakeup between ele_msg_send_rcv() and
  se_if_probe_cleanup(): FIXED. ele_msg_send_rcv() checks going_away and
  arms the response completion under se_if_cmd_lock, but teardown set
  going_away and called complete_all() outside that lock. A thread parked
  on se_if_cmd_lock could therefore arm the completion after the teardown
  wakeup had already fired, then block for the full timeout while unbind
  waited on that thread's fops_lock. se_if_probe_cleanup() now sets
  going_away and calls complete_all() while holding se_if_cmd_lock, making
  teardown and the arming path mutually exclusive so the wakeup can no
  longer be lost. As part of tear-down, close-session & close-storage msg
  is sent to FW using priv_dev_ctx, to keep FW in sync.

- [High] NULL-pointer dereference on the init_misc_device_context() error
  path: FIXED. dev_ctx->priv was assigned only after the kasprintf() that
  builds devname, but the kasprintf() failure path jumps to a cleanup that
  calls cleanup_se_shared_mem(), which dereferences dev_ctx->priv->mem_pool.
  If kasprintf() failed, priv was still NULL and cleanup dereferenced NULL.
  The dev_ctx->priv = priv assignment is moved to immediately after the
  allocation succeeds, before any goto to the error path.

- [High] Unbounded per-open DMA allocation (device-context exhaustion):
  NO-CHANGE. Each open() reserves a MAX_DATA_SIZE_PER_USER (128 KB) buffer
  via dma_alloc_coherent(), but on these platforms the device is bound to
  a fixed no-map reserved DMA pool (the ele_reserved "shared-dma-pool"
  region attached with of_reserved_mem_device_init() in probe).
  Allocations are served exclusively from that bounded pool and cannot
  exhaust general system memory; once the pool is full dma_alloc_coherent()
  returns NULL, init_se_shared_mem() returns -ENOMEM and open() fails
  gracefully. The bounded pool together with the per-process RLIMIT_NOFILE
  is the real, self-adjusting limit, so no artificial open-count cap is
  added. No code change.

- [High] SE_IOCTL_CMD_SEND_RCV_RSP reports -EINTR for a successful but
  signal-interrupted transaction: NO-CHANGE. This is the intended Ctrl+C
  behaviour. The underlying firmware command is not idempotent and must
  not be silently re-issued, so once the wait is interrupted the
  deferred-signal path resynchronises the protocol and ele_msg_send_rcv()
  reports -ERESTARTSYS, which the handler surfaces as -EINTR to the
  interrupted application. Reporting plain success here would hide the
  interruption from the caller. No code change.

- [High] Use-after-free of the open gate / priv between open() and unbind:
  NO-CHANGE (false positive). misc_open() and misc_deregister() are
  serialised by misc_mtx, and the open path takes a reference on the stable
  se_if_open_gate with kref_get_unless_zero() and re-validates
  gate->dying / gate->priv under gate->lock before use, so it can never
  operate on a torn-down gate. No code change.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260121-imx-se-if-v32-0-c5222df51cc2@nxp.com?part=5
---
 Documentation/ABI/testing/se-cdev   |   44 +
 drivers/firmware/imx/Makefile       |    2 +-
 drivers/firmware/imx/ele_base_msg.c |   84 +-
 drivers/firmware/imx/ele_base_msg.h |   19 +
 drivers/firmware/imx/ele_common.c   |  100 ++-
 drivers/firmware/imx/ele_common.h   |    5 +
 drivers/firmware/imx/ele_fw_api.c   |  192 +++++
 drivers/firmware/imx/ele_fw_api.h   |   29 +
 drivers/firmware/imx/se_ctrl.c      | 1595 ++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |   83 ++
 include/uapi/linux/se_ioctl.h       |   97 +++
 11 files changed, 2201 insertions(+), 49 deletions(-)

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
index b70e3ef88a16..2da8817af092 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -15,13 +15,57 @@
 
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
 static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
 				 size_t size)
 {
-	if (priv->mem_pool)
-		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
-	else
-		dma_free_coherent(priv->dev, size, buf, d_addr);
+	/* For the case when priv->mem_pool != NULL:
+	 *
+	 *   If this probe-time transaction timed out, the firmware may
+	 *   still write into the SRAM buffer after this function returns.
+	 *   Do not release it back to the pool while the firmware-busy
+	 *   circuit breaker still marks this context as owning an
+	 *   outstanding transaction. The buffer is reclaimed with the
+	 *   device on unbind; leaking this fixed-size probe buffer is
+	 *   preferable to letting the firmware corrupt reused pool memory.
+	 *   This mirrors the guard already applied on the shared-memory
+	 *   cleanup path below.
+	 */
+
+	if (priv->mem_pool) {
+		if (se_is_fw_busy_ctx(priv->priv_dev_ctx))
+			return;
+		se_cleanup_mem_pool_buf(priv->priv_dev_ctx, true);
+	} else {
+		se_dev_ctx_shared_mem_cleanup(priv->priv_dev_ctx);
+	}
 }
 
 int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
@@ -34,6 +78,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	if (!priv)
 		return -EINVAL;
 
+	guard(mutex)(&priv->priv_dev_ctx->fops_lock);
 	memset(s_info, 0x0, sizeof(*s_info));
 
 	struct se_api_msg *tx_msg __free(kfree) =
@@ -47,24 +92,23 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		return -ENOMEM;
 
 	get_info_len = ELE_GET_INFO_BUFF_SZ;
-	if (priv->mem_pool)
-		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
-						   get_info_len,
-						   &get_info_addr);
-	else
-		get_info_data = dma_alloc_coherent(priv->dev,
-						   get_info_len,
-						   &get_info_addr,
-						   GFP_KERNEL);
-	if (!get_info_data) {
-		dev_err(priv->dev,
-			"%s: Failed to allocate get_info_addr.", __func__);
-		return -ENOMEM;
+	if (priv->mem_pool) {
+		ret = se_get_mem_pool_buf(priv->priv_dev_ctx, &get_info_data,
+					  &get_info_addr, get_info_len);
+		if (ret) {
+			dev_err(priv->dev, "Failed[0x%x] to alloc from gen_pool.\n", ret);
+			return -ENOMEM;
+		}
+	} else {
+		ret = get_shared_mem_slot(priv->priv_dev_ctx,
+					  &get_info_len, &get_info_addr,
+					  &get_info_data);
+		if (ret) {
+			dev_err(priv->dev, "Failed to allocate buffer.\n");
+			return -ENOMEM;
+		}
 	}
 
-	/* gen_pool_dma_alloc() does not zero the buffer. */
-	memset(get_info_data, 0, get_info_len);
-
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
 
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index d532c3f49449..475074580dd7 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -16,6 +16,23 @@
 
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
@@ -97,4 +114,6 @@ int ele_service_swap(struct se_if_priv *priv, dma_addr_t addr,
 int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 			dma_addr_t img_addr);
 int ele_debug_dump(struct se_if_priv *priv);
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header);
 #endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 707fb69431ba..e475d76d6cf3 100644
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
  * se_update_msg_chksum() - calculate and update message checksum word.
@@ -46,6 +67,25 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 	return 0;
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
@@ -56,10 +96,20 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 	unsigned long flags;
 	int ret;
 
-	remaining_jiffies = msecs_to_jiffies(SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
+	remaining_jiffies = dev_ctx->rcv_msg_timeout_jiffies;
 	if (se_clbk_hdl == &priv->waiting_rsp_clbk_hdl) {
 		is_rsp_wait_with_timeout = true;
 		deadline_jiffies = jiffies + remaining_jiffies;
+
+		/*
+		 * Internal kernel transactions run on priv_dev_ctx (probe
+		 * get_info/ping, FW auth, PM IMEM swap). They are not tied to a
+		 * restartable syscall, so wait uninterruptibly: PM freezer fake
+		 * signals must not abort them with -ERESTARTSYS. Userspace
+		 * waiters stay interruptible via the deferred-signal path below.
+		 */
+		if (se_clbk_hdl->dev_ctx == priv->priv_dev_ctx)
+			wait_uninterruptible = true;
 	}
 
 	do {
@@ -71,7 +121,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 				se_clbk_hdl->rx_msg = NULL;
 				if (!completion_done(&se_clbk_hdl->done))
-					atomic_set(&priv->fw_busy, 1);
+					se_mark_fw_busy(dev_ctx);
 				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 				ret = -ETIMEDOUT;
 				break;
@@ -119,7 +169,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 			se_clbk_hdl->rx_msg = NULL;
 			if (!completion_done(&se_clbk_hdl->done))
-				atomic_set(&priv->fw_busy, 1);
+				se_mark_fw_busy(dev_ctx);
 
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			ret = -ETIMEDOUT;
@@ -128,6 +178,26 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 				get_se_if_name(priv->if_defs->se_if_type));
 			break;
 		}
+
+		/*
+		 * A positive wait return normally means firmware delivered a
+		 * response. During teardown, se_if_probe_cleanup() forces this
+		 * wait to return via complete_all() without any real response.
+		 * If that happens the firmware may still be executing and could
+		 * DMA into the shared buffer later. Treat it as a failed
+		 * transaction and arm the circuit breaker so the shared memory
+		 * is quarantined (not freed) instead of being reclaimed while
+		 * the enclave might still write to it.
+		 */
+		if (is_rsp_wait_with_timeout && atomic_read(&priv->going_away)) {
+			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+			se_clbk_hdl->rx_msg = NULL;
+			se_mark_fw_busy(dev_ctx);
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			ret = -ENODEV;
+			break;
+		}
+
 		ret = se_clbk_hdl->rx_msg_sz;
 		break;
 	} while (ret < 0);
@@ -190,10 +260,23 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	/*
+	 * Teardown has begun: do not arm a new transaction. A thread that was
+	 * blocked on se_if_cmd_lock while se_if_probe_cleanup() ran its
+	 * complete_all() would otherwise miss that wake-up, re-arm the
+	 * completion below and wait the full timeout, while unbind blocks
+	 * indefinitely on this thread's fops_lock. Bail out instead.
+	 */
+	if (atomic_read(&priv->going_away) &&
+	    (dev_ctx != priv->priv_dev_ctx ||
+	    !is_msg_xchng_for_tdown(tx_msg)))
+		return -ENODEV;
+
 	if (atomic_read(&priv->fw_busy)) {
 		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
+
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
@@ -248,6 +331,7 @@ static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
+	bool schedule_fw_busy_work = false;
 	struct device *dev = mbox_cl->dev;
 	const char *devname = NULL;
 	struct se_msg_hdr *header;
@@ -325,9 +409,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
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
@@ -398,7 +486,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 		return -EINVAL;
 	}
 
-	if (header->size > SE_MU_HDR_WORD_SZ) {
+	if (header->size > SE_MU_HDR_WORD_SZ && (sz >> 2) > SE_MU_HDR_WORD_SZ) {
 		status = RES_STATUS(msg->data[0]);
 		if (status != priv->if_defs->success_tag) {
 			dev_dbg(priv->dev, "Command Id[%x], Response Failure = 0x%x",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 07e6b6a1bafa..b63a3fbf087a 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -9,11 +9,15 @@
 #include "se_ctrl.h"
 
 #define SE_RCV_MSG_DEFAULT_TIMEOUT_MS	3000
+#define SE_RCV_MSG_LONG_TIMEOUT_MS	5000000
 
 #define ELE_SUCCESS_IND			0xD6
 
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
+#define MAX_WORD_SIZE			0x20
+
+void set_se_rcv_msg_timeout(struct se_if_device_ctx *dev_ctx, u32 val);
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
@@ -42,4 +46,5 @@ int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
+int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header);
 #endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
new file mode 100644
index 000000000000..0e51ab011023
--- /dev/null
+++ b/drivers/firmware/imx/ele_fw_api.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "se_ctrl.h"
+#include "ele_common.h"
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
+	int ret = 0;
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
+	switch (header->command) {
+	case ELE_SESSION_CLOSE_REQ:
+		/* Might be cleared as part of tear down. */
+		ret = dev_ctx->sess_hdl ? 0 : -ENXIO;
+		break;
+	case ELE_STORAGE_CLOSE_REQ:
+		/* Might be cleared as part of tear down. */
+		ret = dev_ctx->strg_hdl ? 0 : -ENXIO;
+		break;
+	}
+
+	return ret;
+}
+
+void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api_msg *rx_msg)
+{
+	struct se_msg_hdr *header = &rx_msg->header;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	switch (header->command) {
+	case ELE_SESSION_OPEN_REQ:
+		dev_ctx->sess_hdl = rx_msg->data[1];
+		break;
+	case ELE_SESSION_CLOSE_REQ:
+		dev_ctx->sess_hdl = 0;
+		break;
+	case ELE_STORAGE_CLOSE_REQ:
+		scoped_guard(mutex, &priv->modify_lock)
+			unset_dev_ctx_as_command_receiver(dev_ctx);
+		dev_ctx->strg_hdl = 0;
+		break;
+	case ELE_STORAGE_OPEN_REQ: {
+		int rc = 0;
+
+		rc = set_dev_ctx_as_command_receiver(dev_ctx);
+		if (rc) {
+			dev_err(priv->dev,
+				"Failed to register %s as CMD-Receiver: %d\n",
+				dev_ctx->devname, rc);
+			break;
+		}
+		dev_ctx->strg_hdl = rx_msg->data[1];
+		break;
+	}
+	default:
+		dev_dbg(priv->dev, "%s: Unknown command = 0x%x.",
+			dev_ctx->devname, header->command);
+	}
+}
+
+/*
+ * Return true when tx_msg is one of the close requests the driver issues
+ * from its own teardown path (session/storage close). ele_msg_send_rcv()
+ * uses this to let those close messages through even after going_away is
+ * set, so the kernel can still resynchronise session/storage state with FW.
+ */
+bool is_msg_xchng_for_tdown(void *tx_msg)
+{
+	struct se_msg_hdr *header = &((struct se_api_msg *)tx_msg)->header;
+
+	return (header->command == ELE_SESSION_CLOSE_REQ ||
+		header->command == ELE_STORAGE_CLOSE_REQ);
+}
+
+int se_close_session(struct se_if_priv *priv, u32 session_hdl)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret;
+
+	if (!priv || !priv->priv_dev_ctx) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	tx_msg = kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
+	if (!rx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_SESSION_CLOSE_REQ, ELE_SESSION_CLOSE_REQ_SZ, true);
+
+	tx_msg->data[0] = session_hdl;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
+			       tx_msg,
+			       ELE_SESSION_CLOSE_REQ_SZ,
+			       rx_msg,
+			       ELE_SESSION_CLOSE_RSP_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_SESSION_CLOSE_REQ,
+				      ELE_SESSION_CLOSE_RSP_SZ,
+				      false);
+exit:
+	return ret;
+}
+
+int se_close_storage(struct se_if_priv *priv, u32 storage_hdl)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret;
+
+	if (!priv || !priv->priv_dev_ctx) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	tx_msg = kzalloc(ELE_STORAGE_CLOSE_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(ELE_STORAGE_CLOSE_RSP_SZ, GFP_KERNEL);
+	if (!rx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_STORAGE_CLOSE_REQ, ELE_STORAGE_CLOSE_REQ_SZ, true);
+
+	tx_msg->data[0] = storage_hdl;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
+			       tx_msg,
+			       ELE_STORAGE_CLOSE_REQ_SZ,
+			       rx_msg,
+			       ELE_STORAGE_CLOSE_RSP_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_STORAGE_CLOSE_REQ,
+				      ELE_STORAGE_CLOSE_RSP_SZ,
+				      false);
+exit:
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_fw_api.h b/drivers/firmware/imx/ele_fw_api.h
new file mode 100644
index 000000000000..c84fd583ad20
--- /dev/null
+++ b/drivers/firmware/imx/ele_fw_api.h
@@ -0,0 +1,29 @@
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
+
+#define ELE_SESSION_CLOSE_REQ_SZ	0x08u
+#define ELE_SESSION_CLOSE_RSP_SZ	0x08u
+#define ELE_SESSION_CLOSE_REQ           0x11u
+
+#define ELE_STORAGE_OPEN_REQ            0xE0u
+
+#define ELE_STORAGE_CLOSE_REQ_SZ	0x08u
+#define ELE_STORAGE_CLOSE_RSP_SZ	0x08u
+#define ELE_STORAGE_CLOSE_REQ           0xE1u
+
+#define ELE_STORAGE_MASTER_IMPORT_REQ   0xE2u
+
+int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header);
+void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api_msg *rx_msg);
+bool is_msg_xchng_for_tdown(void *tx_msg);
+int se_close_session(struct se_if_priv *priv, u32 session_hdl);
+int se_close_storage(struct se_if_priv *priv, u32 storage_hdl);
+#endif /* ELE_FW_API_H */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index a8974eef190b..500905486c01 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
@@ -15,6 +16,7 @@
 #include <linux/genalloc.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kref.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -23,22 +25,21 @@
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
 struct se_soc_dev_regn {
 	bool soc_dev_registered;
 	struct soc_device *soc_dev;
@@ -133,6 +134,13 @@ char *get_se_if_name(u8 se_if_id)
 	return "unknown";
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
@@ -284,11 +292,319 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
+{
+	const struct firmware *fw = NULL;
+	dma_addr_t se_fw_dma_addr;
+	u32 se_fw_buf_len;
+	void *se_fw_buf;
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
+	if (fw->size > U32_MAX) {
+		ret = -EFBIG;
+		release_firmware(fw);
+		return ret;
+	}
+	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
+
+	/*
+	 * Serialize access to priv_dev_ctx shared memory to prevent pos
+	 * corruption if two driver-internal callers run concurrently (e.g.
+	 * ele_get_info() racing with load_firmware()).
+	 */
+	scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock) {
+		se_fw_buf_len = fw->size;
+		ret = get_shared_mem_slot(priv->priv_dev_ctx,
+					  &se_fw_buf_len, &se_fw_dma_addr,
+					  &se_fw_buf);
+		if (ret) {
+			dev_err(priv->dev, "Failed to allocate firmware shared buffer: %d\n",
+				ret);
+			release_firmware(fw);
+			return ret;
+		}
+
+		memcpy(se_fw_buf, fw->data, fw->size);
+		ret = ele_fw_authenticate(priv, se_fw_dma_addr, se_fw_dma_addr);
+		if (ret < 0) {
+			dev_err(priv->dev,
+				"Error %pe: Authenticate & load SE firmware %s.",
+				ERR_PTR(ret), se_img_file_to_load);
+			ret = -EPERM;
+		}
+		if (!se_is_fw_busy_ctx(priv->priv_dev_ctx))
+			se_dev_ctx_shared_mem_cleanup(priv->priv_dev_ctx);
+	}
+
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
+	if (priv->mem_pool)
+		INIT_LIST_HEAD(&se_shared_mem_mgmt->mem_pool_buf_list);
+
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
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx, bool reclaim)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	bool free_dma_buf;
+
+	/*
+	 * mem_pool_buf_list is only initialised for interfaces that own a
+	 * gen_pool (priv->mem_pool != NULL). On interfaces without a pool
+	 * (e.g. imx93, which has no pool_name) the list head is left
+	 * zero-filled, so se_cleanup_mem_pool_buf() must not walk it here or
+	 * list_for_each_entry_safe() would dereference a NULL head and panic
+	 * the kernel on close/teardown. Skip the pool cleanup entirely when
+	 * there is no pool; there is nothing to reclaim in that case.
+	 */
+	if (priv->mem_pool)
+		se_cleanup_mem_pool_buf(dev_ctx, reclaim);
+
+	/* Guard against being called before shared memory was ever allocated
+	 * (e.g. probe failure before dma_alloc_coherent succeeded).
+	 */
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return;
+
+	/*
+	 * Decide whether the DMA buffer can be released before touching the
+	 * pending lists. se_dev_ctx_shared_mem_cleanup() resets
+	 * non_secure_mem.pos, so the "nothing staged" test must be sampled
+	 * here first. When reclaim is false the buffer is released only if no
+	 * data is still staged for the firmware; otherwise the enclave may
+	 * still be DMA-ing into it and the buffer is deliberately leaked to
+	 * avoid a DMA-after-free.
+	 */
+	free_dma_buf = reclaim || !se_shared_mem_mgmt->non_secure_mem.pos;
+
+	/*
+	 * Free any se_buf_desc items that were never consumed (e.g. when the
+	 * fd is closed while pending I/O buffers are still listed). This must
+	 * happen before the DMA backing memory is released to avoid a leak.
+	 */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (free_dma_buf) {
+		dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+				  se_shared_mem_mgmt->non_secure_mem.ptr,
+				  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+	}
+
+	/*
+	 * Drop the host-side tracking unconditionally. On the reclaim path the
+	 * buffer has been freed. On the deliberate-leak path the buffer is
+	 * abandoned on purpose, so clearing the pointer here guarantees a later
+	 * cleanup pass (e.g. se_if_priv_release()) cannot double-free it.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
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
+void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	bool is_fw_busy_dev_ctx;
+	int i;
+
+	/*
+	 * If this context is the one that caused a firmware timeout the shared
+	 * DMA buffers may still be actively read/written by the firmware.
+	 */
+	is_fw_busy_dev_ctx = se_is_fw_busy_ctx(dev_ctx);
+
+	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
+		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
+			if (!is_fw_busy_dev_ctx && b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+
+	/*
+	 * Keep non_secure_mem.pos non-zero while this context still owns an
+	 * outstanding firmware transaction. A non-zero pos is the marker that
+	 * data is still staged for the enclave, which cleanup_se_shared_mem()
+	 * uses to decide the buffer must be leaked rather than freed. Resetting
+	 * it here would let a later teardown pass free a buffer the enclave may
+	 * still be DMA-ing into.
+	 */
+	if (!is_fw_busy_dev_ctx)
+		se_shared_mem_mgmt->non_secure_mem.pos = 0;
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
+/*
+ * Distinct lockdep class for the internal priv_dev_ctx fops_lock. Taking it
+ * while an open context's fops_lock is held (for example a firmware load
+ * triggered from an ioctl) is valid hierarchical locking, but shares the same
+ * class as the per-open fops_lock and would otherwise be misreported as
+ * recursive locking by lockdep.
+ */
+static struct lock_class_key se_priv_ctx_fops_key;
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
@@ -296,19 +612,57 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx)
 		return ret;
 
+	dev_ctx->priv = priv;
 	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
 				     get_se_if_name(priv->if_defs->se_if_type),
 				     ch_id);
 	if (!dev_ctx->devname)
 		goto exit;
 
-	dev_ctx->priv = priv;
+	mutex_init(&dev_ctx->fops_lock);
+	lockdep_set_class(&dev_ctx->fops_lock, &se_priv_ctx_fops_key);
+
+	kref_init(&dev_ctx->refcount);
+	dev_ctx->cleanup_done = false;
 	*new_dev_ctx = dev_ctx;
+	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0)
+		goto exit;
+
+	gate = kzalloc_obj(*gate, GFP_KERNEL);
+	if (!gate) {
+		ret = -ENOMEM;
+		goto exit;
+	}
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
 
 	return 0;
 exit:
 	*new_dev_ctx = NULL;
 
+	if (gate) {
+		priv->open_gate = NULL;
+		se_if_open_gate_put(gate);
+	}
+	cleanup_se_shared_mem(dev_ctx, true);
 	kfree(dev_ctx->devname);
 	kfree(dev_ctx);
 	return dev_err_probe(priv->dev, ret, "%s", err_str);
@@ -329,9 +683,25 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 	return 0;
 }
 
+/*
+ * Forward declarations. se_if_probe_cleanup() and se_if_probe() are kept
+ * together as the teardown/probe pair, but several helpers, the file
+ * operations table and the firmware-busy work handler they reference are
+ * defined further down in this file.
+ */
+static void dlink_dev_ctx(struct se_if_device_ctx *dev_ctx);
+static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose);
+static void se_clear_fw_busy(struct se_if_priv *priv);
+static void se_if_dev_ctx_release(struct kref *kref);
+static void se_if_priv_release(struct kref *kref);
+static int se_if_misc_register(struct se_if_priv *priv);
+static void se_fw_busy_work(struct work_struct *work);
+static const struct file_operations se_if_fops;
+
 static void se_if_probe_cleanup(void *plat_dev)
 {
 	struct platform_device *pdev = plat_dev;
+	struct se_if_device_ctx *dev_ctx;
 	struct device *dev = &pdev->dev;
 	struct se_if_priv *priv;
 
@@ -339,31 +709,116 @@ static void se_if_probe_cleanup(void *plat_dev)
 	if (!priv)
 		return;
 
+	scoped_guard(mutex, &priv->se_if_cmd_lock) {
+		/*
+		 * Announce teardown before doing anything else. ele_msg_send_rcv()
+		 * checks going_away under se_if_cmd_lock and bails out instead of
+		 * arming a new transaction, and ele_msg_rcv() uses it to tell a
+		 * teardown-forced completion apart from a genuine firmware response.
+		 * This must be set before the complete_all() below so those checks
+		 * are not dead code.
+		 */
+		atomic_set(&priv->going_away, 1);
+		/*
+		 * Wake any ioctl thread blocked in ele_msg_rcv() before iterating the
+		 * device-context list. That waiter sleeps on this completion while
+		 * holding its dev_ctx->fops_lock, and cleanup_dev_ctx() below also
+		 * takes dev_ctx->fops_lock. Completing first lets the waiter make
+		 * progress and drop fops_lock, avoiding an unbind hang.
+		 */
+		complete_all(&priv->waiting_rsp_clbk_hdl.done);
+	}
+
+	/*
+	 * Mark the private device context as cleanup_done first.
+	 * This prevents new device contexts from being created in open().
+	 */
+	if (priv->priv_dev_ctx) {
+		/*
+		 * Mark cleanup_done under fops_lock so that se_if_fops_open(),
+		 * which checks cleanup_done while holding fops_lock, cannot
+		 * race past this and add a new device context after teardown.
+		 */
+		scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock)
+			priv->priv_dev_ctx->cleanup_done = true;
+
+		if (priv->open_gate) {
+			scoped_guard(mutex, &priv->open_gate->lock) {
+				priv->open_gate->dying = true;
+				priv->open_gate->priv = NULL;
+			}
+		}
+
+		/*
+		 * misc_register() is deferred to the end of probe, so the
+		 * device may have a miscdev set up but never registered if
+		 * probe failed before se_if_misc_register(). Only deregister
+		 * when registration actually succeeded.
+		 */
+		if (priv->open_gate && priv->open_gate->registered &&
+		    priv->priv_dev_ctx->miscdev)
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
+	/*
+	 * Free the rx mailbox channel before cancelling fw_busy_work.
+	 * se_if_rx_callback() runs from the rx channel and can schedule
+	 * fw_busy_work when a late response arrives. If the channel were still
+	 * live after cancel_work_sync(), a callback could re-arm the work and
+	 * later dereference priv after it has been freed. Releasing the rx
+	 * channel first guarantees no further callbacks, so the subsequent
+	 * cancel_work_sync() is final.
+	 */
 	if (priv->rx_chan)
 		mbox_free_channel(priv->rx_chan);
 	if (priv->tx_chan)
 		mbox_free_channel(priv->tx_chan);
 
 	/*
-	 * Being device managed buffer, no need to free the buffer allocated
-	 * in se probe to store encrypted IMEM.
+	 * A timed-out synchronous command may have retained a dev_ctx through
+	 * priv->fw_busy_dev_ctx even after the fd was closed and the context was
+	 * removed from dev_ctx_list. If no late response arrived, release that
+	 * retained context during driver teardown.
+	 *
+	 * se_clear_fw_busy() is idempotent and internally checks
+	 * priv->fw_busy_dev_ctx under fw_busy_lock.
 	 */
+	se_clear_fw_busy(priv);
+	cancel_work_sync(&priv->fw_busy_work);
 
 	/*
-	 * No need to check, if reserved memory is allocated
-	 * before calling for its release. Or clearing the
-	 * un-set bit.
+	 * Being device managed buffer, no need to free the buffer allocated
+	 * in se probe to store encrypted IMEM.
 	 */
-	of_reserved_mem_device_release(dev);
 
 	dev_set_drvdata(dev, NULL);
 
-	if (priv->priv_dev_ctx) {
-		kfree(priv->priv_dev_ctx->devname);
-		kfree(priv->priv_dev_ctx);
-	}
-
-	kfree(priv);
+	/* Drop the initial reference - priv will be freed when last fd closes */
+	kref_put(&priv->refcount, se_if_priv_release);
 }
 
 static int se_if_probe(struct platform_device *pdev)
@@ -386,15 +841,30 @@ static int se_if_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->dev = dev;
+	/*
+	 * Pin the parent device for the lifetime of priv. A file descriptor may
+	 * stay open after the device is unbound; close() then still passes
+	 * priv->dev to dma_free_coherent()/dev_warn(). Without this reference
+	 * the struct device could be freed while priv->dev still points at it,
+	 * so the reference is dropped in se_if_priv_release() via put_device().
+	 */
+	get_device(priv->dev);
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
@@ -460,7 +930,7 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
@@ -472,12 +942,1093 @@ static int se_if_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
 	}
 
+	/*
+	 * All probe-time initialization is complete; expose the
+	 * interface to userspace last so that an open()/ioctl cannot
+	 * race against a not-yet-initialized device.
+	 */
+	ret = se_if_misc_register(priv);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
 		 get_se_if_name(priv->if_defs->se_if_type));
 
 	return ret;
 }
 
+/*
+ * Expose the interface to userspace. Deferred until the end of probe so
+ * the device node only becomes openable after SoC info has been fetched
+ * and, on SoCs with IMEM management, the encrypted-IMEM buffer has been
+ * allocated. This prevents userspace from opening the node and issuing
+ * commands against a partially initialized interface.
+ */
+static int se_if_misc_register(struct se_if_priv *priv)
+{
+	int ret;
+
+	ret = misc_register(priv->priv_dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to register misc device.");
+
+	priv->open_gate->registered = true;
+
+	return 0;
+}
+
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
+		 *
+		 * Reclaim the internal context's shared memory directly here
+		 * instead of through cleanup_dev_ctx(). Teardown already set
+		 * cleanup_done on priv_dev_ctx, so cleanup_dev_ctx() would
+		 * short-circuit and leak the host descriptors and the coherent
+		 * buffer. By this point the device is fully unbound; if this
+		 * context ever armed the firmware-busy breaker, se_clear_fw_busy()
+		 * has already run with reclaim=false and freed the host
+		 * descriptors, emptied the pool list and cleared
+		 * non_secure_mem.ptr. A reclaim=true pass here is therefore both
+		 * safe and idempotent: it releases the buffers for a normal
+		 * context and is a no-op for the abandoned firmware-busy one.
+		 */
+		scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock)
+			cleanup_se_shared_mem(priv->priv_dev_ctx, true);
+
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+		priv->priv_dev_ctx = NULL;
+	}
+	/*
+	 * No need to check, if reserved memory is allocated
+	 * before calling for its release. Or clearing the
+	 * un-set bit.
+	 */
+	of_reserved_mem_device_release(priv->dev);
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
+	/*
+	 * Drop the reference on priv->dev taken in se_if_probe(). The device was
+	 * pinned so that a file descriptor closed after device unbind can still
+	 * safely pass priv->dev to dma_free_coherent()/dev_warn().
+	 */
+	put_device(priv->dev);
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
+	/*
+	 * The circuit breaker is cleared from two places, which need opposite
+	 * memory-reclaim policies:
+	 *
+	 *   1. se_fw_busy_work(): a late firmware response actually arrived.
+	 *      going_away is not set and the enclave has finished with the
+	 *      buffer, so a full reclaim (reclaim=true) is safe. Only do this
+	 *      once the owning fd has been closed (cleanup_done); while the fd
+	 *      is still open the buffer belongs to that context and is released
+	 *      on its normal close path.
+	 *
+	 *   2. se_if_probe_cleanup(): teardown. going_away is set and no
+	 *      response has been confirmed, so the enclave may still be
+	 *      DMA-writing into the shared buffer. Freeing it here would be a
+	 *      DMA-after-free. Pass reclaim=false so cleanup_se_shared_mem()
+	 *      frees only the host-side descriptors and deliberately leaks the
+	 *      DMA buffer that the enclave might still touch.
+	 */
+	scoped_guard(mutex, &dev_ctx->fops_lock) {
+		if (atomic_read(&priv->going_away)) {
+			/*
+			 * Fatal, but deliberately non-panic: the enclave is
+			 * unresponsive at unbind with a transaction still in
+			 * flight. Both the coherent staging buffer and any
+			 * gen_pool buffers this context owns are abandoned
+			 * (host descriptors freed, DMA-visible memory leaked)
+			 * to avoid a DMA-after-free while the enclave may still
+			 * be writing. Emit one headline error here rather than
+			 * per-buffer so the count of faulted contexts is clear.
+			 * Do not use WARN/BUG: this path is recoverable and
+			 * panic_on_warn kernels must not be brought down by it.
+			 */
+			dev_err(priv->dev,
+				"%s: FATAL: enclave stuck at unbind, DMA leaked.\n",
+				dev_ctx->devname);
+			cleanup_se_shared_mem(dev_ctx, false);
+		} else if (dev_ctx->cleanup_done) {
+			cleanup_se_shared_mem(dev_ctx, true);
+		}
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
+
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
+bool se_is_fw_busy_ctx(struct se_if_device_ctx *dev_ctx)
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
+	bool already_done;
+
+	scoped_guard(mutex, &dev_ctx->fops_lock) {
+		already_done = dev_ctx->cleanup_done;
+		if (!already_done) {
+			/*
+			 * Ask FW to drop this context's session and storage so
+			 * the kernel and FW stay in sync. Done here, under this
+			 * context's fops_lock only (not the global modify_lock),
+			 * because both close requests block on a firmware
+			 * round-trip; issuing them while modify_lock was held
+			 * would stall every other context for the FW timeout.
+			 *
+			 * Skip the round-trips once the FW path is marked busy.
+			 * fw_busy is armed when a synchronous transaction times
+			 * out; while it is set ele_msg_send_rcv() rejects further
+			 * commands with -EBUSY without waiting. It is only cleared
+			 * by se_clear_fw_busy(), which during unbind runs once
+			 * after this loop (or earlier from fw_busy_work only if a
+			 * genuine late FW response arrives). On a hung FW no late
+			 * response comes, so the breaker stays set for the rest of
+			 * the loop and the remaining closes would just return
+			 * -EBUSY and log spurious "failed to close" errors. Skip
+			 * them and emit a single warning instead.
+			 */
+			if (atomic_read(&dev_ctx->priv->fw_busy)) {
+				if (dev_ctx->strg_hdl || dev_ctx->sess_hdl)
+					dev_warn(dev_ctx->priv->dev,
+						 "%s: skipping session/storage close, FW is busy\n",
+						 dev_ctx->devname);
+			} else {
+				if (dev_ctx->strg_hdl && se_close_storage(dev_ctx->priv,
+									  dev_ctx->strg_hdl))
+					dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
+				if (dev_ctx->sess_hdl && se_close_session(dev_ctx->priv,
+									  dev_ctx->sess_hdl))
+					dev_err(dev_ctx->priv->dev, "failed to close session.\n");
+			}
+			/*
+			 * fw_busy is caused by one timed-out synchronous transaction.
+			 * Only that transaction's dev_ctx may still have coherent
+			 * memory referenced by FW. Do not skip cleanup for unrelated
+			 * contexts while fw_busy is set.
+			 */
+			if (se_is_fw_busy_ctx(dev_ctx))
+				dev_warn(dev_ctx->priv->dev,
+					 "%s: deferring shared memory cleanup while FW is busy\n",
+					 dev_ctx->devname);
+			else
+				cleanup_se_shared_mem(dev_ctx, true);
+
+			kfree(dev_ctx->devname);
+			dev_ctx->devname = NULL;
+			dev_ctx->cleanup_done = true;
+		}
+	}
+
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
+	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_LONG_TIMEOUT_MS);
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
+	if (cmd_snd_rcv_rsp_info.rx_buf_sz < SE_MU_HDR_SZ ||
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
+		/*
+		 * -ERESTARTSYS here means the wait was interrupted by a signal
+		 * after the command had already been handed to (and possibly
+		 * executed by) the firmware. Returning -ERESTARTSYS lets the VFS
+		 * transparently restart the ioctl, which would re-run the command
+		 * with the just cleaned-up (zeroed) shared input buffers. Report
+		 * -EINTR instead so the syscall is not auto-restarted; userspace
+		 * can decide whether to reissue it.
+		 */
+		if (err == -ERESTARTSYS)
+			err = -EINTR;
+
+		return err;
+	}
+
+	/*
+	 * ele_msg_send_rcv() returns a positive received-message size on
+	 * success. Returning that raw size as the ioctl result would make a
+	 * successful transaction look like a positive (non-zero) return value
+	 * to userspace. Record the actual received size in rx_buf_sz for the
+	 * response copied back to userspace, then normalise err to 0 so the
+	 * ioctl reports plain success; the firmware status is conveyed to
+	 * userspace inside the response buffer itself.
+	 */
+	cmd_snd_rcv_rsp_info.rx_buf_sz = err;
+	err = 0;
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
+		fw_api_specific_ops(dev_ctx, rx_msg);
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
+int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
+			u32 *length, dma_addr_t *ele_dma_addr, void **ptr)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	bool is_fw_busy_dev_ctx;
+	size_t aligned_len = 0;
+	u32 pos;
+
+	/*
+	 * If this context is the one that caused a firmware timeout the shared
+	 * DMA buffers may still be actively read/written by the firmware.
+	 */
+	is_fw_busy_dev_ctx = se_is_fw_busy_ctx(dev_ctx);
+	if (is_fw_busy_dev_ctx)
+		return -EBUSY;
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
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			return -EINVAL;
+		}
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
+	u8 rx_msg_snap[MAX_NVM_MSG_LEN];
+	struct se_if_priv *priv;
+	unsigned long flags;
+	size_t copy_len;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
+		priv = dev_ctx->priv;
+
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		mutex_lock(&priv->modify_lock);
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			mutex_unlock(&priv->modify_lock);
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			return -EINVAL;
+		}
+		mutex_unlock(&priv->modify_lock);
+	}
+
+	err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+	if (err < 0) {
+		if (err != -ERESTARTSYS)
+			dev_err(priv->dev,
+				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
+				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
+		return err;
+	}
+
+	/*
+	 * Reacquire fops_lock before touching any dev_ctx state (pending lists,
+	 * rx_msg) after the blocking wait. fops_lock was dropped before calling
+	 * ele_msg_rcv(). If cleanup_dev_ctx() ran concurrently it could have
+	 * freed the DMA buffers and the pending lists, leading to UAF and list
+	 * corruption. Re-checking cleanup_done under fops_lock prevents that.
+	 */
+	mutex_lock(&dev_ctx->fops_lock);
+
+	if (dev_ctx->cleanup_done) {
+		mutex_unlock(&dev_ctx->fops_lock);
+		return -ENODEV;
+	}
+
+	/*
+	 * Snapshot rx_msg pointer under clbk_rx_lock before releasing it.
+	 * unset_dev_ctx_as_command_receiver() can acquire the lock, NULL out
+	 * rx_msg, and free the buffer at any time after the unlock; using a
+	 * stale pointer from the shared field after the unlock is a UAF.
+	 */
+	scoped_guard(mutex, &priv->modify_lock) {
+		spin_lock_irqsave(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+		if (priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx ||
+		    !priv->cmd_receiver_clbk_hdl.rx_msg ||
+		    !priv->cmd_receiver_clbk_hdl.rx_msg_sz) {
+			spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+			mutex_unlock(&dev_ctx->fops_lock);
+			return -ENODEV;
+		}
+		/* Taking snapshot is enough for the one common pre-allocated buffer. */
+		copy_len = min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
+		memcpy(rx_msg_snap, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len);
+		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+		spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+
+		/* We may need to copy the output data to user before
+		 * delivering the completion message.
+		 */
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0) {
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			mutex_unlock(&dev_ctx->fops_lock);
+			return err;
+		}
+		/* Copy data from the buffer using the snapshot taken under the lock. */
+		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     rx_msg_snap, copy_len, false);
+
+		err = copy_len;
+		if (copy_to_user(buf, rx_msg_snap, copy_len))
+			err = -EFAULT;
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+		mutex_unlock(&dev_ctx->fops_lock);
+	}
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
+		return -ERESTARTSYS;
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
+		err = -ERESTARTSYS;
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
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
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
+int se_get_mem_pool_buf(struct se_if_device_ctx *dev_ctx, void **buf,
+			dma_addr_t *daddr, u32 len)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc = NULL;
+
+	lockdep_assert_held(&dev_ctx->fops_lock);
+
+	if (se_is_fw_busy_ctx(dev_ctx))
+		return -EBUSY;
+
+	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);
+	if (!b_desc)
+		return -ENOMEM;
+
+	/*
+	 * gen_pool is internally thread-safe, so contexts may allocate
+	 * concurrently. The buffer is tracked on this context's own
+	 * mem_pool_buf_list and released on its cleanup path.
+	 */
+	*buf = gen_pool_dma_alloc(priv->mem_pool, len, daddr);
+	if (!*buf) {
+		dev_err(priv->dev, "Failed to alloc from gen_pool.\n");
+		kfree(b_desc);
+		return -ENOMEM;
+	}
+
+	/* gen_pool_dma_alloc() does not zero the buffer. */
+	memset(*buf, 0, len);
+	b_desc->shared_buf_ptr = *buf;
+	b_desc->size = len;
+
+	list_add_tail(&b_desc->link, &se_shared_mem_mgmt->mem_pool_buf_list);
+
+	return 0;
+}
+
+void se_cleanup_mem_pool_buf(struct se_if_device_ctx *dev_ctx, bool reclaim)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+
+	/*
+	 * Free only the buffers this context allocated. A context that never
+	 * used the pool has an empty list, so this is a no-op for it.
+	 *
+	 * Unlike the coherent staging buffer, the pool path needs no
+	 * "nothing staged" (pos) gate on the reclaim=false leg. Pool buffers
+	 * are ephemeral, per-transaction allocations: se_get_mem_pool_buf()
+	 * refuses to allocate once the context is fw_busy, ele_msg_send_rcv()
+	 * refuses to start a new command while fw_busy, and the success path
+	 * frees the whole list via se_cleanup_mem_pool_buf(reclaim=true)
+	 * before returning. se_if_cmd_lock serialises synchronous commands, so
+	 * at most one transaction is outstanding. The only way to reach here
+	 * with reclaim=false and a non-empty list is the single fw_busy
+	 * context still owning the buffer(s) from the one timed-out
+	 * transaction. Those buffers are exactly the in-flight ones the
+	 * enclave may still be DMA-ing into, so leaving them on the list (no
+	 * gen_pool_free) deliberately leaks them to avoid a DMA-after-free -
+	 * there are no already-consumed pool buffers to reclaim on this leg.
+	 */
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->mem_pool_buf_list, link) {
+		if (reclaim)
+			gen_pool_free(priv->mem_pool,
+				      (unsigned long)b_desc->shared_buf_ptr,
+				      b_desc->size);
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+}
+
+static void se_fw_busy_work(struct work_struct *work)
+{
+	struct se_if_priv *priv =
+		container_of(work, struct se_if_priv, fw_busy_work);
+
+	se_clear_fw_busy(priv);
+}
+
 static int se_suspend(struct device *dev)
 {
 	struct se_if_priv *priv = dev_get_drvdata(dev);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index dd4a1ea7e35a..c0a8ffb7b572 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -10,15 +10,28 @@
 #include <linux/miscdevice.h>
 #include <linux/mailbox_client.h>
 #include <linux/semaphore.h>
+#include <linux/workqueue.h>
 
 #define MAX_FW_LOAD_RETRIES		50
 #define SE_MSG_WORD_SZ			0x4
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(128 * 1024)
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
+	/* set once misc_register() has succeeded (deferred to probe end) */
+	bool registered;
+};
+
 struct se_clbk_handle {
 	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
@@ -45,10 +58,46 @@ struct se_imem_buf {
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
+	struct list_head mem_pool_buf_list;
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
+	u32 sess_hdl;
+	u32 strg_hdl;
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
@@ -113,9 +162,43 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+	/*
+	 * Set once teardown begins. New synchronous transactions are rejected
+	 * and a teardown-forced completion is not mistaken for a real firmware
+	 * response.
+	 */
+	atomic_t going_away;
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
+bool se_is_fw_busy_ctx(struct se_if_device_ctx *dev_ctx);
+void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx);
+int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
+			u32 *length, dma_addr_t *ele_dma_addr, void **ptr);
+int se_get_mem_pool_buf(struct se_if_device_ctx *dev_ctx, void **buf,
+			dma_addr_t *daddr, u32 len);
+void se_cleanup_mem_pool_buf(struct se_if_device_ctx *dev_ctx, bool reclaim);
 #endif
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..6302ff66034f
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
+	__u64 rx_buf;
+	__u32 tx_buf_sz;
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

