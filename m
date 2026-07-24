Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D433B3CC7D6
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880913; cv=fail; b=sjZDAHyQsnP85Cxm0+IM2Ajhmswc65VZhb/4r6h6lVZoP6ROiQLz67ttUIGCauw7sWCXeM1ObMQZUaL2Ua8ZVfiU4gXmMCQpOVO4xnZg5I13Rt5zCdJCxqpi+qJwkY2OSeeOOgcIZS0xZdupX03Td4+6CAmxObrlF+aS9c6nPTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880913; c=relaxed/simple;
	bh=vc+VwJ/OQlxCU+w4cGHOmo3BZmdncY94B3LWEXKkj5s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lE/JWGPPSJV27XBrnXbk2Ul/WosoYTpMI8g6pbviC6uMfY82BmOHSUvhUzMNLzR5m3VdGnJyWtU2FvddVIIoWcMRtw3NN3w46j4nAdrXYTXuh6l3L4Z2T2CVp405pw0++eO1bpceW7mTfF7hNLUaj168N6i4ZCtSM3oD+m8qnyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZzI3BzMe; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZzI3BzMe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXL86Vh8DsMZeyOGYRMhNbqlztii8C3V/33JVfHvF4tHUHR51wvpbZPgINld1dSm7zd26JhC2YL2dVevnlJ9GS3vm4vl3qucHGa7W6t+R9hslHeWlXbEb0BE3oExO8ZfQ0wqYzeJ0Z6XTqcaRuL7MGQMee31hVhBeBowgTA+7efknrWTPTNMjfZe7Ii0ICxC0GWXf8n/AcwAnQCpB1hm34oBElOHrYUKnehfDHDLgetNzAwRxqIF+9w6i2n1C2IiXp1jMzw8D62I/Ku8uP+AKMjNMUdsQ+/3BFy8WjpCKkQ+x4cl8oHTMN5AlJ7LMI4Y+9JTAgny9x9GcWda6gQRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehAWOVkLE6bnRHIxRqk1WdDf0NzligW5a4wLSORiYFw=;
 b=xf0tpLcWocTqmc1XkskacDdZLGOWAD4Culh65AAZ2klqArXxVV8ZvHNjHrm7CZi0e0DzIa+W9bYuhTt1axQEKOI8Tg2+LaHCoKaBd5ygIdaqbVkke8mkW7D1DSyV7IrDBqZ+I8rtvO60/xkA5JNwS2qZT3JJbZyoJGxUJahZ7zbQKa4KFGCCfwVkXaXKwXqSFqDx/jIu870dWZrCtX33+rXpaK+O9f5d5yYhpJKa3WqXb3qMIG3G4mPzLhnEBnMJrPb4VGfj4SVooYerW6N0WCFyw/pQ/iv1SHU311uTdjYZqc+59XEBmTFtzXg7oK1AH0N2owR9wxDhysQ9DJZwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehAWOVkLE6bnRHIxRqk1WdDf0NzligW5a4wLSORiYFw=;
 b=ZzI3BzMe6Ik5CYpUFso/xgNUutnN7uf8klkk5NYcDXcvHMgDcMySBsipsKpbdkDl50AAyiX2XrSF74Gynln5IXtEmEXyfYdQDKSIN5LExKt3RjSK1z0dRLiBPON6wX4leqh8F2LagIp2WpWGCNwUejfHmIj13m2w0o0Soeri3+mvVvecSrCjijhtvn3OXhxMLa/OEE1+sU95TY6Gnf8PXi8mQbxTOCqX0UosIrwku3tUZ32+2cyfDQLv+RTPqKc1vMCO96e3qPm7urUQBQMQQLHU96Jc+Jr+ovJxy0xGhb2x8b5Pwj5Z84hxEn/Z+nYqZ/lyza8yk+Jmgr4iwbwikg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:15:01 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:15:01 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 24 Jul 2026 14:35:11 +0530
Subject: [PATCH v30 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-se-if-v30-3-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
In-Reply-To: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
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
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784883913; l=50025;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=+tDZmv0Aa1A5fmAI6kwroWT7FMYx9SIlMSMxpC/GfS4=;
 b=L3NS/mT4lM8MfJ3CtLQ0xF+5KED+HTk5BGoGNqOUMvSIApOezt47kyGDFAYhwNQ45UCfy5ZxP
 9lBVPHHySGDBdrJNrlaGVgye7UG96tEL70elX6DDtQdyH/NvrUx7K9W
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::9) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b885eb-7286-4e21-59ec-08dee95ba8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|921020|6133799003|56012099006|11063799006|10067099003|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	s3Gq/62O3w20E+f6uH9qXtwJAx9wb3imC1lFwH9GFQqFrMdB2iyE3W0u1mUXiubAT/6vK/8uN0j9xRV18til0GaZ0zXcj898XVk4TEm3uuJ269+uQQZZtjdct6mZDVjv3rQv8c2xV8KILj+VEVoQVdnkFZlvKmdN567GYdgJ9dxJ+kVdrZwSCxElojCm0q0PG82/EPfvDWX0IxPdaK2Tv0fzHhBwHqQWvpvTW0z59cOaMrorwWdeBRkviw+CLZZs08Qrc3bSm5hjfRZh4o777Ia5vELe7QTsFS+lFstmKfZ5C8i63IQEwfSYWmm2A8EykgwoAaVhFzE8GbtR97MvD8w/9DYviBx25L85LVoNTAdWG+bDnrWPFhOWdZK2JymbZb1M3PZ69ujJjE4quvogJ5DtkXK6WYMqIn2Oz6LUsa7uVw4UOdsZFZS30MdrNGtg/7WMsg8dhfSZeTGlGPTx4bbwXFmd2MZhOum875rGAEvCuppdkO1kL9jeOSBinUR3U4n2QI7q/mRQeKMaEt7NOpAttXMCXkuC6aQzlpDF5Xl47SV/ny36ozG8Wc97pJrOsL6Lw3oUK3n030miMVrmkegA80qlmIoNl1Dg8+QAKcmZc2eVLq00l9IVd5vkKfZx97k5Y0nsXfC5Hb6iML57lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(5023799004)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3gxenM4YVBNcFJwaVVoR0tMNldmNklTSnk2TVlRZlFkTXAvQ0VsR2FHN0xW?=
 =?utf-8?B?a2pZU2kvaXgyeWpvZGFlV1hVR3BOWE9QdE5HWHQ0RDFEa0JsK2JZTnE4ZHNl?=
 =?utf-8?B?QzVVY1grUlFxUTJXRk1iNUlLc0NjRHE4NTZMYWJGTnFiVGFwTGJzSXlOSEto?=
 =?utf-8?B?bmhFWFBQcUVHcHpqOG1BNFoxS1V1cHZXZm01UVFFQU1lTVg3WERvQjcyUUEr?=
 =?utf-8?B?WnJDZGFIdi9MVHRzUmRXR2crQnB3MFFqSmZKZnBQL080emR5YWZUMi94eGFz?=
 =?utf-8?B?QWF6V2x0aW5ESm4ycnJJY3NPSk13ZTlobVdxQjU3SjY0T3FlQitVWW50ZWpD?=
 =?utf-8?B?Y1VvY29HZ2oyUElBNmMrbTUyTElmbFJBYk5WL0NrMkVxSTZsQS9uRmF2TFBL?=
 =?utf-8?B?Z3NUSlBpV1JZWnBuVnUwZDdCMWxUbU5oeTUxNHhSY0dCdFQrSTl3QjFPYTQy?=
 =?utf-8?B?SjFNeHNZTERvMmszVEE2cXBMNTk0YlI1QkR3YjJpRFAvNzRldzZ3ZWkvYzQy?=
 =?utf-8?B?N0wvNjJ2WU5JOC82dkhwWS9hNjFPc09FSzNFeURReEVubHFya3pSU1ZFYUtD?=
 =?utf-8?B?ZDhKMmJYVVh0ZUVoSUZFVzlRNjJ2SGxrWElnTnZwZEF1QmtLTWx4clJDc3Jz?=
 =?utf-8?B?WGpEZEN3YkZxYk1Zci8yTlg5T0hrR29haFBOcFFjazRDcTRDNERjWnVIRDdN?=
 =?utf-8?B?b0dGWUVEZUhadTRRUC80dTNXQUYyWkdNWHo0ZE5oUW1hSU9jZ3pEaTZQODlm?=
 =?utf-8?B?S29tdXgycXhwN3ZrMmdDd1lHaGpUNEZtUUs4a05NcVVsanZ1NFZtNXc5bzFZ?=
 =?utf-8?B?U25HTkduWUQyNWJOY1dHQkk1d3h2RHhXbzNTN25QR1JGZU4vYmVKMXZIQTlv?=
 =?utf-8?B?TTNkUmZRTVZKV3lPUXYyeEZtaGNycjFLWVdoZzh5WFk4VldSWEYrK092RWJW?=
 =?utf-8?B?b2xvdlcvS2JabVF5Q25SUnE5WkpnU25IZnY4eGZ5MmRsZkxta2w2bkRCNVN2?=
 =?utf-8?B?NkN3akNWRzhicWVLUGhINmVKbFQ0MlVSWkREU29Pb0UyRDA1TXFGMFVsY2Y4?=
 =?utf-8?B?MU9xUzJnZnQ4cWhmNGNvWjRtSnJMWHQwQ0w2ak5vTHNoU1Q2K29Ka2s2QVJn?=
 =?utf-8?B?aU4vb3BJK0l1c25PRmE0alVnWXhVNW1sa1BKcFNxRTRWaDkrT0RLV0pXaTU4?=
 =?utf-8?B?bGQ5QSttWi92Q2VqMWdKVm9BenNJQVJ0MFhtL0t3WDZvbTdxenRETjkrM0Fs?=
 =?utf-8?B?c3d1Zmh3c0JkbDI4UVVVaWV2VXRlY0twZzZtbU1NdDhtNnBxdm12OWZEOWRm?=
 =?utf-8?B?Mlo2YWFMbGltVWxCaExiTDdiR2dScUpYRlpIcXp3UXpGandJTzMxaFRud0Fm?=
 =?utf-8?B?Z1NQeUI4Y0V1eHR5dUpuY2lqSzF1NTBuYmRoL0ZtZW1VVStESnZoSHdXaHl6?=
 =?utf-8?B?KzUwSnJKMmJxajg5NkhYa0dZNktiMER4RkgrWkR2ZWR6Qm1SZmhVZ0piUVU3?=
 =?utf-8?B?YkQ3M09MOFVQRmpUdFluQWlCWXVQVzllZlJNUHdSL0VmOENDV2FjdlM5dXpv?=
 =?utf-8?B?alBWUE5nRHJQUGlBZVhSK3RUdGRTZFVTTGlTYU0ycXVhdWlNMHNsVUVkK2Ri?=
 =?utf-8?B?RGZDNkRMNUFqS0VXN0NGY3YzbGNkWEl4NXJSSWg1dzFPSy92dnFmNm45dUYy?=
 =?utf-8?B?TFFVcCtDLzZUYXVHSkFGSm5RTG9qODJ4b1R3WFlvc08vVm0zd2J5SlJtMlo4?=
 =?utf-8?B?RUVPVms5UWl1aGVpSHlrcnVYVnI4Uk9nRi85MGRHZ1ZkR3B2Vk5SNFFESkhI?=
 =?utf-8?B?TFp3Ry9jYTNadkdoem9VZ3M3cGdRWVRvaFdWbHliRmNxekQvSitsS1pndmRQ?=
 =?utf-8?B?SHJzbmlQd1pUMzF5QnIva0pHLytZVnEwdzlpSHlSZFFsZS9EY1dnT2hDalBK?=
 =?utf-8?B?TXg2a3ZNQVYyU3NTMWRpUWpRSXpJRU5qNXpFd1hScmkwTURKVkNoTnVRTHZo?=
 =?utf-8?B?Z0owMno4dVJUUUhsTmwyRlZBdGdERTFaQUw4QVNZNXV5RkpLRWc3eHJyUGc5?=
 =?utf-8?B?VG0wbzdIa3dxdEFwM3Z3d0hMMlNnWUlmeGhtTHlyb0RTNFhFdVh0M29UaUpB?=
 =?utf-8?B?UFJhMWVOc0taLzJPWUFrWEY2OE90RU0zY29BYWNPeE5QWUhUUGNmTTQxd2c5?=
 =?utf-8?B?cVkvRUUzQklTNVV4bE5LcGh2dDg2YUs4a0VTWWNoNWljV0Y1NHdybjV3d0Ni?=
 =?utf-8?B?am1FZlorNWt5WUd4ZEE3K3JsaWdUQ0htaVNrMXQycFZJWkhoRWhWbU1jL0N5?=
 =?utf-8?B?eDdJeXRBMmpmSEVEM2dUMzBzN2ZuWER2aWRqNGNsZXZ1S2RzUWE5eGlPUUVZ?=
 =?utf-8?Q?BHTI5qZVrAx3qefDMk0b+VjycRiPhkIuVokV1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b885eb-7286-4e21-59ec-08dee95ba8ab
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:15:01.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVF2mreq/33PrxUzbjSWwAj5RuL+EEJlxPVZcQw0XCA9p8z4lN1GkQufkIdFw89RZ2+8kXqOlW+ORXDz2ykOo0KxP7umEH5/ubxU4m7TlrR3mYsa5bWsILSNKrspnZ/5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

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
Changes from v29 to v30:
This change dispositions all six findings from the Sashiko AI review:
- Five are code fixes (three in se_ctrl.c, two in ele_common.c);
- One is documented as intentional protocol-synchronization behavior.

Addressed (drivers/firmware/imx/se_ctrl.c):
- [High] Incorrect devres registration order (UAF / NULL pointer deref
  in the mailbox RX callback):
  Register se_if_probe_cleanup() before requesting the mailbox channels
  so it runs last during LIFO teardown. Free rx_chan then tx_chan inside
  se_if_probe_cleanup() (RX first, to stop callbacks) before clearing
  drvdata and freeing priv. Dropped the separate if_mbox_free_channel()
  devres action.
- [Medium] priv structure leak on early probe failure paths:
  The cleanup action is now registered before the channel requests, so
  priv is released even if se_if_request_channel() fails early.
- [Medium] soc_device singleton lifecycle tied to the first probed MU
  interface (data race and premature sysfs deletion):
  Decouple the singleton from the first-probed MU interface. Track it in
  var_se_info.soc_dev_regn and release it once at module unload via an
  explicit module_init()/module_exit() pair instead of a devm action on
  priv->dev. Serialize soc_dev registration state under se_var_info_lock;
  se_soc_device_unregister() now takes the lock via guard(mutex).

Addressed (drivers/firmware/imx/ele_common.c):
- [High] Data race on rx_msg_sz in se_if_rx_callback():
  Move the read of the expected response size (exp_rx_msg_sz =
  se_clbk_hdl->rx_msg_sz) to after clbk_rx_lock is acquired, so it can no
  longer be observed stale relative to a concurrent transaction updating
  rx_msg_sz under the lock. This prevents copying truncated or corrupted
  response data.
- [Medium] ele_msg_rcv() reset the timeout after a signal instead of
  accounting for elapsed time:
  For the response-waiter path, compute an absolute deadline_jiffies once
  and derive remaining_jiffies from it on every iteration. After a signal
  falls back to an uninterruptible wait, the wait no longer restarts the
  full timeout; the deadline is honored and -ETIMEDOUT is returned when it
  elapses.

Documented as intentional, no code change (drivers/firmware/imx/ele_common.c):
- [Medium] "Unsafe syscall restart on completed non-idempotent hardware
  operations" in ele_msg_send_rcv():
  This is intentional protocol-synchronization behavior, not a
  re-execution bug. A signal is deliberately not acted on while a firmware
  message exchange is in progress; ele_msg_rcv() defers it until the
  response path completes and the FW/kernel protocol state is synchronized
  again, so Linux and firmware never diverge on message ownership. Only
  after synchronization is the interrupted wait surfaced to userspace via
  -ERESTARTSYS. The command/response ABI must treat this as an interrupted
  operation after synchronization; it is not permission for the kernel
  driver to re-send the command, so the enclave never receives it twice.
  Clarified with an expanded code comment.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com?part=3
---
 drivers/firmware/imx/Kconfig        |  12 +
 drivers/firmware/imx/Makefile       |   2 +
 drivers/firmware/imx/ele_base_msg.c | 277 ++++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h | 100 +++++++
 drivers/firmware/imx/ele_common.c   | 480 ++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/ele_common.h   |  45 ++++
 drivers/firmware/imx/se_ctrl.c      | 507 ++++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      | 112 ++++++++
 include/linux/firmware/imx/se_api.h |  14 +
 9 files changed, 1549 insertions(+)

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
index 000000000000..a2ede9c01691
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
+static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
+				 size_t size)
+{
+	if (priv->mem_pool)
+		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
+	else
+		dma_free_coherent(priv->dev, size, buf, d_addr);
+}
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
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
+
+	tx_msg->data[0] = upper_32_bits(get_info_addr);
+	tx_msg->data[1] = lower_32_bits(get_info_addr);
+	tx_msg->data[2] = sizeof(*s_info);
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
+			       ELE_GET_INFO_RSP_MSG_SZ);
+	if (ret < 0) {
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+		return ret;
+	}
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	if (ret < 0) {
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+		return ret;
+	}
+
+	memcpy(s_info, get_info_data, sizeof(*s_info));
+
+	ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+
+	return ret;
+}
+
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
+{
+	return ele_get_info(priv, (struct ele_dev_info *)data);
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
+int ele_service_swap(struct se_if_priv *priv,
+		     dma_addr_t addr,
+		     u32 addr_size, u16 flag)
+{
+	int ret = 0;
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
+int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
+			dma_addr_t img_addr)
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
index 000000000000..d532c3f49449
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
+	const u8 *__x = (const u8 *)(x); \
+	size_t __sz = (uid_word_sz); \
+	((u64)get_unaligned_le32(__x + (__sz - 1) * sizeof(u32)) << 32) | \
+		get_unaligned_le32(__x); \
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
+int ele_service_swap(struct se_if_priv *priv, dma_addr_t addr,
+		     u32 addr_size, u16 flag);
+int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
+			dma_addr_t img_addr);
+int ele_debug_dump(struct se_if_priv *priv);
+#endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
new file mode 100644
index 000000000000..f9be8b8556ad
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.c
@@ -0,0 +1,480 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+/*
+ * se_update_msg_chksum() - calculate and update message checksum word.
+ * @msg: message buffer.
+ * @msg_len: message length in bytes.
+ *
+ * The message length must be 4-byte aligned. The last word is treated as the
+ * checksum field and is not included in the checksum calculation.
+ *
+ * Return:
+ * 0 on success, negative errno on failure.
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
+			if (time_after_eq(jiffies, deadline_jiffies)) {
+				ret = -ETIMEDOUT;
+				break;
+			}
+			remaining_jiffies = deadline_jiffies - jiffies;
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
+		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
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
+		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
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
+		se_clbk_hdl->rx_msg_sz = min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
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
+			dev_info(dev, "ELE responded (late), recovery FW available.");
+			return;
+		}
+		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
+		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
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
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+			    u8 msg_id, u8 sz, bool is_base_api)
+{
+	struct se_msg_hdr *header = &msg->header;
+	u32 status;
+
+	if (header->tag != priv->if_defs->rsp_tag) {
+		dev_dbg(priv->dev, "MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)",
+			msg_id, header->tag, priv->if_defs->rsp_tag);
+		return -EINVAL;
+	}
+
+	if (header->command != msg_id) {
+		dev_dbg(priv->dev, "MSG Header: Cmd id mismatch. (0x%x != 0x%x)",
+			header->command, msg_id);
+		return -EINVAL;
+	}
+
+	if ((sz % 4) || (header->size != (sz >> 2) &&
+			 !check_hdr_exception_for_sz(priv, header))) {
+		dev_dbg(priv->dev, "MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)",
+			msg_id, header->size, (sz >> 2));
+		return -EINVAL;
+	}
+
+	if (is_base_api && header->ver != priv->if_defs->base_api_ver) {
+		dev_dbg(priv->dev,
+			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->base_api_ver);
+		return -EINVAL;
+	} else if (!is_base_api && header->ver != priv->if_defs->fw_api_ver) {
+		dev_dbg(priv->dev,
+			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->fw_api_ver);
+		return -EINVAL;
+	}
+
+	if (header->size > SE_MU_HDR_WORD_SZ) {
+		status = RES_STATUS(msg->data[0]);
+		if (status != priv->if_defs->success_tag) {
+			dev_dbg(priv->dev, "Command Id[%x], Response Failure = 0x%x",
+				header->command, status);
+			return -EPERM;
+		}
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
+		dev_err(priv->dev, "Failed to export IMEM.");
+		imem->size = 0;
+	} else if (ret > ELE_IMEM_SIZE) {
+		dev_err(priv->dev, "Invalid exported IMEM size %d.", ret);
+		imem->size = 0;
+		ret = -EIO;
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
+		return 0;
+
+	/*
+	 * IMPORT command will restore IMEM from the given
+	 * address, here size is the actual size returned by ELE
+	 * during the export operation
+	 */
+	ret = ele_service_swap(priv, imem->daddr, imem->size, ELE_IMEM_IMPORT);
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
index 000000000000..e9e2f48f4f71
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -0,0 +1,507 @@
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
+	 */
+	if (var_se_info.soc_rev &&
+	    (!se_info->soc_name || var_se_info.soc_dev_regn.soc_dev_registered))
+		return 0;
+
+	err = ele_fetch_soc_info(priv, &data);
+	if (err < 0)
+		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
+
+	s_info = (struct ele_dev_info *)data;
+
+	if (!var_se_info.soc_rev) {
+		var_se_info.soc_rev = s_info->d_info.soc_rev;
+
+		/*
+		 * Only update IMEM state when the load_fw path is active;
+		 * on SoCs without IMEM management (e.g. i.MX93) the field
+		 * is not meaningful.
+		 */
+		if (load_fw->imem_mgmt)
+			load_fw->imem.state = s_info->d_addn_info.imem_state;
+	}
+
+	if (se_info->soc_name && !var_se_info.soc_dev_regn.soc_dev_registered) {
+		err = se_soc_dev_register(priv, var_se_info.soc_rev,
+					  se_info->soc_name, s_info->d_info.uid);
+		if (err < 0)
+			return dev_err_probe(priv->dev, err,
+					     "Failed to register SE SoC device.");
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
+				     "Failed to request %s channel.", name);
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
+	if (priv->rx_chan)
+		mbox_free_channel(priv->rx_chan);
+	if (priv->tx_chan)
+		mbox_free_channel(priv->tx_chan);
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
+	priv->se_mb_cl.knows_txdone	= false;
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
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set 32-bit coherent DMA mask.");
+
+	/*
+	 * Initialize load_fw_lock before registering the misc device.
+	 * A userspace process could open the device and trigger se_load_firmware()
+	 * via IOCTL immediately after misc_register(), so the mutex must be ready
+	 * before the device becomes visible.
+	 */
+	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
+		load_fw = get_load_fw_instance(priv);
+		mutex_init(&load_fw->load_fw_lock);
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
+					     "dmam-alloc-failed: To store encr-IMEM.");
+		load_fw->imem_mgmt = true;
+	}
+
+	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
+		ret = get_se_soc_info(priv, se_info);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
+	}
+
+	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
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
+			dev_warn(dev, "Failure saving IMEM state[0x%x]", ret);
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
+		ret = se_restore_imem_state(priv, &load_fw->imem);
+		if (ret)
+			dev_warn(dev, "Failure restoring IMEM state[0x%x]", ret);
+	}
+
+	return 0;
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
index 000000000000..00ac892997a6
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

