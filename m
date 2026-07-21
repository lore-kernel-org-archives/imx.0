Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F54ADD80
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630036; cv=fail; b=QPePnOFiKaEW7PN0f9lppSdcI27vtSd/arxfjXQeCRjYQKzPObNsIbjiepOw6tLWvX8GbedNvcH5l5JdqXtGxl8PX5Bc/1IuxWnk/zpBySf+pieaDZ42t2jqwfZxARrtylNlok0A9lIZ+uYJIkJXNuuJEbRrv3JnlG/mAfDEfrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630036; c=relaxed/simple;
	bh=uCviy0XZ+t5bQnos0VkdcfR72F9dHsUaNhvtlJFCq58=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PKXM7W8OzrQd4QPkEt0fgHo2+GRvRBiHR3OCYoF7Or197MEfMUoY4EAixXfpw9F/eLLCY/ejcCxNGW0tWK9cEVr+9RePCOKfOUsDIYrn4wb3IYOllpP83TF2TNk5AiX5V5c9wkr0LYfG/fCIwuxVjeUIUiw9XlC7ZF//ta+T4C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xEIgd/Tu; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xEIgd/Tu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru2uTz07PMZtYRa6/o2HhxvL0i/OsupnFmLAs5u1V5xZbAY0wFB4dwZaDDhDNd9tBLz9VgrbYblGO4LkhT4pGFyrRurLcTuO0TM4vUF0iKhs03S/lp/n7sFc6JRx2ejKMkMNVRHv/GAFcmgqT8ZKp0kUb7Sol89Wp+sYM+laDn/pV2887pYiQqWIDnujHZtAupwTCjuf1rw1ZgHXozL6b0YRb6GLPsbg/982ezyfdcfTKk2LVB9ZFcUZ1NmuMus3ensQioNPFJPCsRgbQLkOSo9BZX2t0R95XgIFLmtIga6QqXSHtps4zGVvrhQqq5WZL3yLNEPcWWw7KvdiNYRiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hl3r3AoeOhE3WkRDF9pjT/YlltVT2pGZMJTZx80NCsc=;
 b=N3CRcclqR8wkutekrBKdUK1PgUzs5dMfsAWrcBo9+Aopu7ypuqGYoss4tx4CC6/jcfNr0m0KH+ZVHFW0PVyKuyXI7OKiLi3anPSoqrJz0XO7FxtRPhlT6/hpAN9xNqniONcbHTtLKQAd55UnpvHgVVPeSYoEAtSox2KlZhLtSDVAsrVJMZ4DEXJyJT5UZGoHvacQQPBGKGQk7ZLl14L3elLpzCsxnJ00dA5/4wq2IpWEaLSTnXpR7OlZEUlKaWQEtdveFFfnef74A8ltGAZQRXGx68TYzSkFJLitfLT69UN0+JA0D2wNOmj2TbiTMTtoVBRjldxuN1DjIR1vTNR9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hl3r3AoeOhE3WkRDF9pjT/YlltVT2pGZMJTZx80NCsc=;
 b=xEIgd/TuGVYj3ANUkHhEDj74X+CvZ748YE3ccNHq03q9PMz63N2AqYOS0gqTtVc49grYbaHxOSj7o2CR9w4xDcW94XOOz3TBfbssqHNqc/h47F1p7MSU5PhM4H5DCJCX8XPJuKgbrcb52JvVVm4gCxo2ltTFiEM5TYKW31oDglT5t1TpeEyrgU72J8VGADdkfNNwXbXIBuinCh8EGwzZD10pXIRVnu+yOCViShCsI2SPs0AdR+iI/R3Vf6Ax+p1o/QN8v47YukO40omOdK2q4bfTirbGJzDoHcCcO+Dk4e8NsLApyrrnQnslmkxw/UQSLN7xZznBbYa2H5LlZchbMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:33:44 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:44 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 21 Jul 2026 16:53:36 +0530
Subject: [PATCH v29 5/7] firmware: drivers: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-imx-se-if-v29-5-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
In-Reply-To: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=69414;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=VW+Eg2IgsYVib3bciE1JgKi0oIuitL4mTC9aC5G1Hpc=;
 b=LufyVz1WtzrZgrsrl3T4vVJFWss5cSHwA+1tgp7hEzOGuaw86XLtUsHtsZAkHWL9XjZkbHO7K
 R/IIpY1+YGrC3o9h15cv+9/4eA1Ske0Cp9ZB+XwkjrRRYx0CDobNk6d
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: KU0P306CA0055.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:28::17) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e18e97d-100c-46c7-234d-08dee71389cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|3023799007|6133799003|10067099003|11063799006|56012099006|13003099007|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y4U0FAYmEZSv8/b5es9dqDl8QjyoreSCNSlgy7UhQozFT0CzeATbzayB7l7fl5zel8jujhBgaMTunx+CnkwvCMo1M8smdeLu1erPYLgzOkmmLKz1eH2VHpAKe2wgc2eDUavH44hdJf+CHWsHQzILNiqp6vjvHIk8U0jN/3vJBIyY3CN/GdGXt9ShMClwreDJpY2txEvl7MNNpZdLrvARiqRFDRs89LN/vJ5W1t0zD7QRHxmO3SRzUxTFxpA4d3aNdeHyst65NE8K5MNkiWwyUbmqRtJpahIs+BFI06D7M7Vi5m8pBi/XBBWMK7J7JMnPNWuZmhvUfourtenNe8pCeNm19p5VMHQ5K4wd5zgfX5nKt9wQwPI6cW2K8PoO7MzA+hmOnh6COOSsXAHOhfaUm1NWrjTCqg6Nidp202TdHqf4rfW5e/X/itrKvW+zRg7myP8VLBgoIdGLAIn7T7dBHXGgaDNs7b9I5BbkxHLNVTWQTKfXeFQ+2nAAjSRuZhh/L9WnlAoz8MNRyvWZOrKuhQnGscb3FydPfHBBWGvvTpGj8G49mgkAUhriagheGH8BbOzuxDs4X8UsRfnl7wpxysjUa1+wx2njcxMYEDDstH3o2i6qy1EbpQGLPHXoQeqPv0tQsCaAA14QtH91syL0yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(13003099007)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajUwR3g3TkwycU5OYUMreVdaMUd1YUp3MEhHNGtMa2M0TGtRYldXSncwQ2hP?=
 =?utf-8?B?aDhOR3N6elpITnN2SjdWTk4vYmNxVGVKU2VubnNmQVB4VkdpVXI0ZjljYytz?=
 =?utf-8?B?VDhSbmhPb2hxdmVRLzd1RGFwVk1KSE1FR2VVNmhUcndKclR6UVNQaTNIY1hU?=
 =?utf-8?B?cmpNUTlvUHdlZlVTd1VsYlRKTTJkcVkzc3J3K2dDSFdvRVRpUTJWS2ExU2RX?=
 =?utf-8?B?ekVMMkYzTlJlaCtFdHJRNmtQaFIxSFRyeVFtN3BObkdRc0R6T1BodGVOL0dH?=
 =?utf-8?B?RHdiUWxzQ1ZQSjNxT3RPekVZaVJjU1VaejRKRE4zWnlXaEQ5eSsvWWhXNW9t?=
 =?utf-8?B?dkdKMUVZRkxXQmRndDBmRFVsbXhTMjlEbzVDRm1PUGpTdUNHWndyaTI2NERT?=
 =?utf-8?B?aCtDKzUwMFo1dlVlQ3lhSkw3NGV5RlBDM0JmLzc2OGgwdnlEZnQ0Z2VOR2hz?=
 =?utf-8?B?SmkwMlZPYkVGb1hKZHI4emo4d083MHllaytPYTUxODJQZE9mOXIxeXZSOFZE?=
 =?utf-8?B?aEZxbTBaZ1daQU81bGNHT1RqMlhGckRWSkZuMVlaU1o5czVoS1VwSDMrcFZK?=
 =?utf-8?B?bmFoSEZGdVNsQlFvRmd5U0FtZ1p2SEo4Z0tHR3BqcWlEcXgrMDhPM3kva2NZ?=
 =?utf-8?B?bVZSK0xCL3FRYXliTGE2NGNtTXQ4VE0yUFl6ZGpvRTNCbmlBWHZXaTFsSkla?=
 =?utf-8?B?TEgybHZsM2ttNnJxNEFKc0RXc0owY1ppL2t5SXhYclBpZ052YmlER0F6bnRX?=
 =?utf-8?B?dkprbG5wMUY0aXBuR3NodEc4V1piRW0vODVtdVJSd1lmZ1hndGROTVZtcVNC?=
 =?utf-8?B?UEhOOWhycEdIV2ZxL3RTQ3kvK1BQT1RlM1kzS2ZFV2NtUk9ENGZBR3AyMjRQ?=
 =?utf-8?B?bUdDWFVHMHdCa1NFd2ZlS1JtUTZRS3hzNjdnWmVoTERaVlpla3BhUmlJTE9D?=
 =?utf-8?B?Znd3MXp6NGY0dWFhc1JKUzdTNUVNQk9YVThyNnk5V3NnaVp3YjFZYS9UUzZm?=
 =?utf-8?B?eFoyYUZvcjNIVnZ0QmNUaVVyTWhOMnNlMkgvajZpOFBBbDNVaHhYVmtZTU1j?=
 =?utf-8?B?ayttQzhyUGdtbjB4ZWQ4TDg5YzNyQ2pXSUJWMWlWSXlhMldMUTlDVG5GU1o5?=
 =?utf-8?B?UFNEYzFUenBGZk5lWE5jc1R0akxFLzB6M3NCRXZnVWxCYXFIRVJGdHhjRzB0?=
 =?utf-8?B?eXJjbnQvbGxxSUtJM213dVY4ZEpsT2laS3dPdVFRU2FmTUlPRFhKelJLNUpY?=
 =?utf-8?B?ZEx2VkJNMHJTdTJqcnQweEVQUDUzdFQ3NVl0TytJbzFFWmJhU1RFbUpGMGtC?=
 =?utf-8?B?bjd1VThzeXNJZHBOM3JnNTUwTmhRRVZUZUsyNEROT0I5MWw0MGhSY04zQVNm?=
 =?utf-8?B?Tm4rdkN3ejhtV0t5V2ppUzgrWWF4WnFHNUtiMlFSMGxpam02REVkaDdZd1lT?=
 =?utf-8?B?Y3VIWjhpUU9NNlVhSUFHN1FPMWU5VzJ4QXFPYTZFWHRzQkc0SWt1OXNHYndx?=
 =?utf-8?B?cEp1akxFazArTlpxRXQvQVA4bFc2dStSTGVLcTZ0SjB2bWFxQXBYRHQ3ZjNJ?=
 =?utf-8?B?NkJ1dk9YWDVRZVNhRTQxSFlJdmtYSnNGamd4WU1EVmEzNVN6a3NpUXR6WTJ2?=
 =?utf-8?B?VU13WW1jSEhTVnhyZ3lZZnVhZ1FKenVOeUsxOW15SWdCUmVJMU10R1docjNV?=
 =?utf-8?B?NTI0TEFTTCsrZkdDWlVwcVVnTHU3UUhlNTNvNGxPRTV2RG13dmNXV0loSVJP?=
 =?utf-8?B?WlJ1NS9xUE0rZC9wR2hSNmdBNWdHVi9QNnRydE5xMkpxNmtFZ0IxdmZnTndx?=
 =?utf-8?B?bjJaQldTN051dHI1OVcrejFFaTNETlMzRHdvdnh6RjhsRFVlQVVkYWhlOGtB?=
 =?utf-8?B?UG9hRDk5VTFZZkplSXdwTTF1dkZvNG5abFVyOThpd0lTdFVpNVd5Wm02Ti80?=
 =?utf-8?B?ZGVpTGRuUFJDbUY0MFJqb0NvdFN6QTloZ2RtQnJGYXhzR2pRQnNRQWRaTG1V?=
 =?utf-8?B?VEZjNFlQd00zMFBsa1JvL3RnLzlkK1BYQy9CWWh6Y3l0WEE3SldFT3laeXNS?=
 =?utf-8?B?TVIyNjhRSGFIVHNac0hhTUJCSzJBRlFrQ1pkQkIvLzNjWnZWTlNWVlZhQVAy?=
 =?utf-8?B?NnJnUzFGNkdVWlM2Z1Z4cWNNY0FtSnY3TmsvakxRLzQxVEkzUWt0cUJuY3ND?=
 =?utf-8?B?RGxMUEhVM0QrZmxxOXQ1OGJqR0NxTG9HaE5jVXRZdzFNeGZxRFA4VFdBalhi?=
 =?utf-8?B?RWtzT3JJOURkbGpidWZhdlZJaGFVZVQ4cGh3OFd3dndkTjNSSVg5UnYzYmly?=
 =?utf-8?B?c2tiSnhUT2REVHRLQXRNVXh5K3NNVTlteUlHRWpHZWFtTmtNb2FQeWpQL2Vy?=
 =?utf-8?Q?GJjn7Z2mlQcD7fdpAkI/m+sjvHNU3GUe40d8L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e18e97d-100c-46c7-234d-08dee71389cd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:44.0143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbAX3SKgdZ3z51mnHR3/iOes2ULzSLwhBarxIY+2URgGOMsGcf8sqbgFGZvNtvuB1wjNaWkv4UHEW0/25zDMXOtfhcQvl9owY9h7xN666q+xeTxuyb0QJ2KbF0DxNMM5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

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
Changes from v28 to v29: Fix for sashiko AI bot reported issues:

- Fix ele_get_info() mem_pool path by initializing get_info_len before
  gen_pool_dma_alloc() and checking allocation failure before using the
  returned buffer.

- Add a probe-time comment for ELE_GET_INFO timeout cleanup. The SRAM buffer is
  used only during probe, and a timeout means the secure-enclave interface is
  considered unsynchronized and probe fails.

- Serialize internal priv_dev_ctx shared-memory allocation by taking
  priv_dev_ctx->fops_lock in ele_get_info() and load_firmware().

- Move load_firmware() to use priv_dev_ctx shared memory instead of a temporary
  dma_alloc_coherent() buffer, and skip shared-memory cleanup while priv_dev_ctx
  is marked fw_busy.

- Fix init_misc_device_context() error handling so gate allocation failure sets
  ret = -ENOMEM and releases previously allocated shared memory before freeing
  the device context.

- Release priv_dev_ctx resources through cleanup_dev_ctx() before freeing
  priv_dev_ctx during priv release.

- Guard cleanup_se_shared_mem() against being called before coherent shared
  memory was allocated.

- Fix se_if_fops_read() initialization by assigning priv before first use.

- Avoid modifying command-receiver rx_msg_sz when read() is called from a
  non-command-receiver context.

- Rework se_if_fops_read() to reacquire fops_lock after ele_msg_rcv() returns
  before accessing shared-memory lists or command-receiver state.

- Snapshot the command-receiver rx_msg under clbk_rx_lock and hold modify_lock
  while copying it to userspace, preventing concurrent command-receiver teardown
  from freeing the buffer.

- Clear command-receiver rx_msg_sz under clbk_rx_lock only after consuming the
  message.

- Keep shared-memory cleanup in the read path under fops_lock.

- Mark priv_dev_ctx cleanup_done under fops_lock during probe cleanup so open()
  cannot create a new context after teardown starts.

- Register se_if_probe_cleanup after mailbox channel requests so devres LIFO
  ordering runs misc-device cleanup before mailbox channel release.

- Initialize firmware-load state before exposing the misc device to userspace.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com?part=5
---
 Documentation/ABI/testing/se-cdev   |   44 ++
 drivers/firmware/imx/Makefile       |    2 +-
 drivers/firmware/imx/ele_base_msg.c |   78 ++-
 drivers/firmware/imx/ele_base_msg.h |   19 +
 drivers/firmware/imx/ele_common.c   |   92 ++-
 drivers/firmware/imx/ele_common.h   |    5 +
 drivers/firmware/imx/ele_fw_api.c   |   57 ++
 drivers/firmware/imx/ele_fw_api.h   |   18 +
 drivers/firmware/imx/se_ctrl.c      | 1270 ++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |   74 +-
 include/uapi/linux/se_ioctl.h       |   97 +++
 11 files changed, 1704 insertions(+), 52 deletions(-)

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
index 524ebc0f697e..28b835f2880f 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -15,24 +15,65 @@
 
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
+	/*
+	 * The SRAM buffer is used only for the internal ELE_GET_INFO command during
+	 * probe. A timeout here means the secure-enclave firmware did not complete the
+	 * probe-time information exchange within the driver timeout window. The buffer
+	 * is released during probe error handling.
+	 *
+	 * The ELE_GET_INFO timeout is intentionally large enough to cover normal
+	 * firmware response latency. If the firmware responds after this timeout, the
+	 * interface is already considered unsynchronized and probe fails. There is no
+	 * later userspace-visible reuse of this probe-time transaction state.
+	 */
 	if (priv->mem_pool)
 		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
-	else
-		dma_free_coherent(priv->dev, size, buf, d_addr);
+	else if (!se_is_fw_busy_ctx(priv->priv_dev_ctx))
+		se_dev_ctx_shared_mem_cleanup(priv->priv_dev_ctx);
 }
 
 int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 {
 	dma_addr_t get_info_addr = 0;
-	u32 *get_info_data = NULL;
+	void *get_info_data = NULL;
+	u32 get_info_len;
 	int ret = 0;
 
 	if (!priv)
 		return -EINVAL;
 
+	guard(mutex)(&priv->priv_dev_ctx->fops_lock);
 	memset(s_info, 0x0, sizeof(*s_info));
 
 	struct se_api_msg *tx_msg __free(kfree) =
@@ -45,19 +86,24 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	if (priv->mem_pool)
+	if (priv->mem_pool) {
+		get_info_len = ELE_GET_INFO_BUFF_SZ;
 		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
 						   ELE_GET_INFO_BUFF_SZ,
 						   &get_info_addr);
-	else
-		get_info_data = dma_alloc_coherent(priv->dev,
-						   ELE_GET_INFO_BUFF_SZ,
-						   &get_info_addr,
-						   GFP_KERNEL);
-	if (!get_info_data) {
-		dev_err(priv->dev,
-			"%s: Failed to allocate get_info_addr.", __func__);
-		return -ENOMEM;
+		if (!get_info_data) {
+			dev_err(priv->dev, "Failed to alloc from gen_pool.\n");
+			return -ENOMEM;
+		}
+	} else {
+		get_info_len = ELE_GET_INFO_BUFF_SZ;
+		ret = get_shared_mem_slot(priv->priv_dev_ctx,
+					  &get_info_len, &get_info_addr,
+					  &get_info_data);
+		if (ret) {
+			dev_err(priv->dev, "Failed to allocate buffer.\n");
+			return -ENOMEM;
+		}
 	}
 
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
@@ -70,20 +116,20 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
 			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
-		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
 	}
 
 	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
 				      ELE_GET_INFO_RSP_MSG_SZ, true);
 	if (ret < 0) {
-		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
 	}
 
 	memcpy(s_info, get_info_data, sizeof(*s_info));
 
-	ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+	ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 
 	return ret;
 }
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
index a350e83a274a..fbb6e584341a 100644
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
@@ -46,16 +67,50 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
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
+	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
+	unsigned long deadline_jiffies;
 	unsigned long flags;
 	int ret;
 
-	remaining_jiffies = msecs_to_jiffies(SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
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
@@ -70,7 +125,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			 * after the protocol transaction is brought back to a
 			 * synchronized state.
 			 */
-			if (se_clbk_hdl == &priv->waiting_rsp_clbk_hdl &&
+			if (is_rsp_wait_with_timeout &&
 			    READ_ONCE(se_clbk_hdl->rx_msg)) {
 				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
 				wait_uninterruptible = true;
@@ -96,7 +151,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 			se_clbk_hdl->rx_msg = NULL;
 			if (!completion_done(&se_clbk_hdl->done))
-				atomic_set(&priv->fw_busy, 1);
+				se_mark_fw_busy(dev_ctx);
 
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			ret = -ETIMEDOUT;
@@ -226,6 +281,7 @@ static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
+	bool schedule_fw_busy_work = false;
 	struct device *dev = mbox_cl->dev;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
@@ -305,9 +361,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
@@ -349,41 +409,43 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
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
 	}
 
-	status = RES_STATUS(msg->data[0]);
-	if (status != priv->if_defs->success_tag) {
-		dev_err(priv->dev, "Command Id[%x], Response Failure = 0x%x",
-			header->command, status);
-		return -EPERM;
+	if (header->size > SE_MU_HDR_WORD_SZ) {
+		status = RES_STATUS(msg->data[0]);
+		if (status != priv->if_defs->success_tag) {
+			dev_dbg(priv->dev, "Command Id[%x], Response Failure = 0x%x",
+				header->command, status);
+			return -EPERM;
+		}
 	}
 
 	return 0;
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
index cd4d27dd98ce..3c14964830a6 100644
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
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -24,22 +25,21 @@
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
 	bool soc_dev_registered;
@@ -128,6 +128,13 @@ char *get_se_if_name(u8 se_if_id)
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
@@ -243,11 +250,269 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
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
+	/* Guard against being called before shared memory was ever allocated
+	 * (e.g. probe failure before dma_alloc_coherent succeeded).
+	 */
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return;
+
+	/*
+	 * Free any se_buf_desc items that were never consumed (e.g. when the
+	 * fd is closed while pending I/O buffers are still listed). This must
+	 * happen before the DMA backing memory is released to avoid a leak.
+	 */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
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
+/* Forward declaration needed by se_if_priv_release(). */
+static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose);
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
@@ -261,18 +526,909 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx->devname)
 		goto exit;
 
+	mutex_init(&dev_ctx->fops_lock);
+
 	dev_ctx->priv = priv;
+	kref_init(&dev_ctx->refcount);
+	dev_ctx->cleanup_done = false;
 	*new_dev_ctx = dev_ctx;
+	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
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
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret) {
+		err_str = "Failed to register misc device.";
+		goto exit;
+	}
 
 	return 0;
 exit:
 	*new_dev_ctx = NULL;
-
+	if (gate) {
+		priv->open_gate = NULL;
+		se_if_open_gate_put(gate);
+	}
+	cleanup_se_shared_mem(dev_ctx);
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
+		cleanup_dev_ctx(priv->priv_dev_ctx, false);
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
+				cleanup_se_shared_mem(dev_ctx);
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
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
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
+	struct se_api_msg *rx_msg_snap = NULL;
+	struct se_if_priv *priv;
+	unsigned long flags;
+	size_t copy_len;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
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
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -ERESTARTSYS;
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
+		rx_msg_snap = priv->cmd_receiver_clbk_hdl.rx_msg;
+		copy_len = min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
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
@@ -303,6 +1459,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 static void se_if_probe_cleanup(void *plat_dev)
 {
 	struct platform_device *pdev = plat_dev;
+	struct se_if_device_ctx *dev_ctx;
 	struct device *dev = &pdev->dev;
 	struct se_if_priv *priv;
 
@@ -310,6 +1467,67 @@ static void se_if_probe_cleanup(void *plat_dev)
 	if (!priv)
 		return;
 
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
+	/*
+	 * A timed-out synchronous command may have retained a dev_ctx through
+	 * priv->fw_busy_dev_ctx even after the fd was closed and the context was
+	 * removed from dev_ctx_list. If no late response arrived, release that
+	 * retained context during driver teardown.
+	 *
+	 * se_clear_fw_busy() is idempotent and internally checks
+	 * priv->fw_busy_dev_ctx under fw_busy_lock.
+	 */
+	complete_all(&priv->waiting_rsp_clbk_hdl.done);
+	se_clear_fw_busy(priv);
+	cancel_work_sync(&priv->fw_busy_work);
+
 	/*
 	 * In se_if_request_channel(), passed the clean-up functional
 	 * pointer reference as action to devm_add_action_or_reset().
@@ -330,12 +1548,16 @@ static void se_if_probe_cleanup(void *plat_dev)
 
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
@@ -358,15 +1580,22 @@ static int se_if_probe(struct platform_device *pdev)
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
 
 	/* Mailbox client configuration */
 	priv->se_mb_cl.dev		= dev;
@@ -382,6 +1611,12 @@ static int se_if_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Register the cleanup action AFTER the mailbox channels so that
+	 * devres LIFO ordering guarantees se_if_probe_cleanup() runs before
+	 * the channels are freed. This prevents userspace from issuing
+	 * write/IOCTL on an already-freed mbox channel during teardown.
+	 */
 	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
 	if (ret)
 		return ret;
@@ -418,13 +1653,12 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->is_fw_tobe_loaded = true;
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
 				     ret);
 
-	/* By default, there is no pending FW to be loaded.*/
 	if (se_info->imem_state_mgmt) {
 		load_fw = get_load_fw_instance(priv);
 
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index e02dbd90eeb9..af7738ad76cd 100644
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
@@ -59,7 +103,8 @@ struct se_msg_hdr {
 	u8 tag;
 }  __packed;
 
-#define SE_MU_HDR_SZ	4
+#define SE_MU_HDR_SZ		4
+#define SE_MU_HDR_WORD_SZ	1
 
 struct se_api_msg {
 	struct se_msg_hdr header;
@@ -112,9 +157,34 @@ struct se_if_priv {
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
+bool se_is_fw_busy_ctx(struct se_if_device_ctx *dev_ctx);
+void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx);
+int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
+			u32 *length, dma_addr_t *ele_dma_addr, void **ptr);
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

