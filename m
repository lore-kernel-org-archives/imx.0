Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A1472798
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118597; cv=fail; b=KUZzs0UNvYzeRx0cWBXBhl+LpI3WYYMwPXH2PRF6gD2fHy7VqgPTFa9nzfDbfAxpLhCEFLo3rkeASe100MOaikgWDbVYs/C3A/eC4lVYSpG9NsqNhiM02CKPDxdYq5XmuJyVs/MagLUNHq3uK/N3rHYagWofDllRnERdPGY+7Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118597; c=relaxed/simple;
	bh=0T+R+SDohZ0EmDtc0HBoFGZD7Xt4UAvUBXzqDMYgpnk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=LlKgo+UzUJDfnGNCIoma4U3RNdXBqk9YKqiNNQD13C78heAHs/iU7s0Po+6/nPkqkV82CBzARvA72Vdu/lxHsJ3ATu9C9LZKHvHpSXQz/sv/sYPFMhYoWvJY68jNX0euFPDhsNncrT52r/ktlhMa7FN5sOhjvXxIt5Xt1lppAU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vX71NPHz; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vX71NPHz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QolGSICJi8c9wJW9fvyejUH/Z3zDZI1UFDrJGwsrRj1QiknhwvXcZWWucTDqQyY3J0Nv11Q8i1bvnh3+FwUnJvTBE3oG/qLxmSUBASg9sq13zIz95fpvIr8ujGpX6kZg8Xb3q64fD3hYUA2ejHm7djnV1mqg4KL0r79T7wUoiIX49j+e7wvKaR11BApx3vvmOT46la1VBwOFMVgHFswwKzN7KXI9YvbXfenKISij9x5xF3at1c00b4ApFalkNbAuBUPXnmzA7o1xCmkebK6R4apmiCn6Z5dKXHi1nZ/TlM4c8TTwwe4+pPyqSyaZaT7K+8cmqQ1/aaT7vOG7r2xSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96Xpo8+rrDwia4SzfY+jswgNFo4lyD6nhltdWVrex9Y=;
 b=o6rbk2zPLkS02jS2vNBiCIHxtz1EtVf3T85ZUSyqhQrq1G6eFRfK0eY3++tnzv15wbpppNFfSShIV+i+BiwZB3ZVEEJmnR7rx3CeHYbaQxT3EgcphQtVjyjnnJ/bUQRLCunEG/jUh0YiZufssTYjWZKMpNhVRWup7HzFUjIUMj5ElSlXMkvZjzc0J0sOu5jIXUNrpCQhJHBWtzr9ZIXiqmdEXhvobknn86UIpDdZCGBncgZoug6vCI6clPoylBkP0nQHbEWN+jLkxC1YHaQ1d4fMr2NV4eFhNuIyc8vsE9OrYNWMv0+qlhg6hfsuV7QZ6lHlHy+MC96NFDzpLMNT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96Xpo8+rrDwia4SzfY+jswgNFo4lyD6nhltdWVrex9Y=;
 b=vX71NPHz1VZwNAtafMH2BViFRxUjCZG5/Noy8sbbMaun9Fph8xu0sYF9PZu6tz9IQqzjeOZIz24J7EDy2AqO+vv159HqCx047wz5vXA2QNCKupbG5vGhZBO9jGElS81X6s6BPEm4qPre3fVd/0dScfvjwR6uTJq1bvOS37/Lmsh8CW5tmYazyOfu26ImtfZJA3HOzSpi+PXHmuzQ4rjVP5Chmv9fSLjQ66VEXFAsiU1FnAlpYy1JYYe82QwagirqUvnuug7uiF7hbasGU1IwpZkKFLviLfnwNSm4vMP8Bclw2B6foF5IGIQ5b/1fiwdHv2rKejyeHIiGuI0YZi4wZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:29:51 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:29:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/9] arm64: dts: imx8ulp: Device tree updates for i.MX 8ULP
 EVK boards
Date: Wed, 15 Jul 2026 20:33:01 +0800
Message-Id: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP19V2oC/yXMTQ5AMBBA4avIrDWhiVJXEQt0yoi/dBCJ9O6K5
 bd47wZGR8hQRjc4PIlpXQLSOIJuaJYeBZlgkIlUSZ5mguarOKZNmJ2F0la3VsvCSAuh2Bxaur5
 bVf/mox2x298FeP8AF1KJtG8AAAA=
X-Change-ID: 20260715-imx8ulp-dts-69f9bf928d2f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>, 
 Wei Fang <wei.fang@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5ead42-fb9f-40fa-0056-08dee26cc490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	2x5COk02ws+gncXWD6VbSgQHNvEP/pVm04PXCB4ZPKmpdcC5PHabU6rcSlDs8tlArRnJoR4DS14NUI+dvx1FaKT6UKilzwVVhjqg+8W3lTh9WtBHCp0M9jbS4ExHVkpuEaAgsQHEKMbLObcqA4KVfEwgBc0pppVfcHtKjWB8k9UJVJ7rAvsi+rA+tTnYsQpk94BYvFSXK87yHDIMqnurhBd5fujZJb27KRRfO2hexhGjmsWRmhogDpjDl9VrmbX2Dugo042eY+JnJ/Dq/+LYPGAWK+Sz2hTCNlbAuBHFQWyhvPLZ39lf1+hn2AVNtndIN6iNdb7yG4bFV5KsEZGVdP6VBqjnsl5QegLfT2OEjyuBcmn6J/WS6LvE6gNKlnILobbrsFwXW+2SsnJv48FzcA7Kw5X9jSSOUAnPhwUl2nadc+2zZHQrZ1/EKVcjEvNvz8QTCFBBYcevTPkMwFXU4sB7p35PzfCjFUqwYUh6MUwicq6DRmKYPo3RPnpZKzRcHb8DAHeXubxw9u3oZpzxY4Lu0Ew1x9zDKbXxBnHZDFBuKtdj0Yhsn1WytvcmVgEXkUkYSKxSvtPlWjXiY4SgE9ssB7/aMNbnuTc6a4lTaTajqzDPbfjucF5J8ecPt49wDyoNKyFMprJiQ9CL7OU/ir69n04onst0ukYFdcZEq8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGxnMlg5Y0ZBWlpGWmExVzlXUDgvOWk0TnpaOVV5dlhoMWRRbXVjSkxtL3hO?=
 =?utf-8?B?VVVmN2h6aUF6QlFKT1h2M09ZajFpUk1iS1h4bGpVN3ZVeGgrWFg5T1BYcklJ?=
 =?utf-8?B?V2NiMmN6a2d4bkZ5VWFoWUM0cTU3aEV3Si84UERmNGRGMi90cSt5eENNQnNh?=
 =?utf-8?B?UDcreDhBZE5qQkMrMjRPVnI2M3A5Q2ZBTGpKSW5wRUlWOFVHUmdUY1dDRXdu?=
 =?utf-8?B?Y0hXK0R0SytaVEp0aGk3TlJHcVdGdjgxclVzMVNvYWYzT0RETHNnSGxhVkVs?=
 =?utf-8?B?MGZHQ0wyMUhvQnBxZFQ4MzI4d1NHM2JXUythQklnbS9KbVpsWVpldmNYc09L?=
 =?utf-8?B?RFJWUkdSYkQ4OURKUUVUR0ZjbHZsaU9xSUpzYVljdkxjT09qMFZkc2x5ajJH?=
 =?utf-8?B?ejB5Zi9VdHRNVnlheUQrZUxGZlJSelAvdUpiT1VpVmVTZFFuYWZCMnlNTE1T?=
 =?utf-8?B?MWk1bVNlaUFzeDRVcy9oS2JDY3ZMM3RVbVhrY3A2d1N1a0xBV29oSkpNaFVQ?=
 =?utf-8?B?Mjl6RWhvaHRsZ0wzQ2FYemFkNUE4QkJyQ2VQbjFDUkdKSTF1Z3FsVVJHVVZG?=
 =?utf-8?B?YjZnVnBVWkthVDNkSWplR1RWVWdnNVBEZUFOcE1UTytSckJJcXkrckEzNWx3?=
 =?utf-8?B?aWp6Mlp1aytlMWtGY093ek9iRUdURjVRWG5VUXdWUjRXa1Q1NFJnU2FwWk40?=
 =?utf-8?B?RkVRWXB4Z0MwWTlsYzFCWVlaYXA5Y3FJTVpVQmphVGVrTVFhVGszb3E0Uzg5?=
 =?utf-8?B?Y0g1RFBzZWNvL3hjREd1Ry9ieWVxYnArOHUrdVZMTGRMUytvWmphbGRDaTdF?=
 =?utf-8?B?Z2t1bGlheHRPRDk3L2dEQlZiVFRvYnhONmVOY3F1dlRzcVQ0MUwwYlEzSU5l?=
 =?utf-8?B?aVFMd0xoSVdET1luV1lKRTlacDZvUXJVMWRuV0NmYmYxeVowSXZsbk4yc09h?=
 =?utf-8?B?bXhIVWttODNnMlN0cjR3T0ZxTnArSzlHL3JGOFczYjJyc05HckQydUo4aEJu?=
 =?utf-8?B?ZGh4YmpsbENLb3AwbDQ0VTRCWGk0Q3M0bWFhSFpYMUkvKytFcUV4akNiaXVq?=
 =?utf-8?B?NlFCOHVEekRLblp1MlBDWFpwY2RkTzFrRFBqTzZwcGs4eWRZMzJod1h6dHFu?=
 =?utf-8?B?elF1RkJXQkpEcGhxUWVTUXVicEtXaGJqbWp4TTdJT0V2MDFIaTRvTG1HcDVP?=
 =?utf-8?B?cWhKeHZGdmFwSUdDbkpmaWtWUXpyRmFUSU5OZHltZTZtellnYmlqQ0VVM0VX?=
 =?utf-8?B?WG1wMkFqVGNzRFFjVTR2MkdUQ0RXVThjVjg3Q1k5dmxnaERBNVJMZlNld3ZZ?=
 =?utf-8?B?c21pK000SjlaTFkrWURiWGtUTmRpV3RUbTcrbldsaExVc0lLOE1rcnJKaUZD?=
 =?utf-8?B?VzZEMkwySkdjS2ZtUlZZVHpQdzVpUzJsT1B3MVhzaGhhc0ZjUU43a3drWVJm?=
 =?utf-8?B?dFE0NForZ2laQ01hcFVFbThoSDhjTjl1QmNNb3ZJOG5IVzIzNUZ0QjNyOTFz?=
 =?utf-8?B?emFibWlqL3NtT2JxbGpleGRGay85TEJHdnZiTWxoT2JRaFBPVmJTbUF3a2l6?=
 =?utf-8?B?em5vUGNNSXU3b2JCV0FzdWJScDcyU1dHeFR5YzZ0MXJCOU50WW9GT1drSUtp?=
 =?utf-8?B?NFdEZnZ4OStzZzJxZW9CZWVsaW9yOEo4MDUxSDhxdDRJNzNrU2JyYnB2cm9a?=
 =?utf-8?B?SVh6OXpsRlJiQVU3TjdzaHUxbzZhRHRRK3NUQjFoMGtHZTRxVm8xNEp2dlVk?=
 =?utf-8?B?RndOMmZOanJHck5PRkVOMnZLN2s5MFY5MC8wYmVvTTlqYllrMkJwdkVRemZI?=
 =?utf-8?B?Z1ZCVkEyYzlHcXltUEVPY0xhRGFnNW5xWCtETUtSUWhnRDQyQUdsa2o5Rkhl?=
 =?utf-8?B?TlpZdVhxcFUxMkxiWm8rbUJGcGVNRURBK3hPY3RCVnpMVHFkOWpJZjc5VU5V?=
 =?utf-8?B?T1FrZkV2N05ZWG00SjY1eHRQNERhNWJ5YXd6c05xNzRma2J5TzVvVjMydGdW?=
 =?utf-8?B?alFZYlVOdEh3YzkzNnlpK3h0MW8xSVh6U3RPZmF1QU1paE1FbjJJKzk3RXJm?=
 =?utf-8?B?MUdjSHdUNndxYTR2a25uRFprdnJyYmFzaHFoUUxRdE0rMHNDSllQQWxMV29u?=
 =?utf-8?B?YXVUN1RmVDBUSWRHclRjaGRoVjR0U1FRa01YU3lmQWxSY2htRzkvbHhqMUl0?=
 =?utf-8?B?OG5EaTFxbzJDNWNZcThTb2hQN1FyY2tJT3FvNEtjZFJJdkJDdnV1SWhYanZU?=
 =?utf-8?B?SXd0eWErZmlKc09FT1FJZlQwNkd0bjh0VVlBTm1jd0VNVURwNlQvaGhCYUpj?=
 =?utf-8?B?eXkrVjlDN1FQRExsUHR0UEhtaWc2SHhFY29DdWVuUzVmVzlYYUpCUHRlNU02?=
 =?utf-8?Q?t5L3ZvjhlTNI+2zJdoOSXacV1jREbFAKJg8cc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5ead42-fb9f-40fa-0056-08dee26cc490
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:29:51.8389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWV86WWAQvPnLwE1L3htHBqWreOTHyzeTW/3pRe2X8iR4dtzAYa3kSUIr8JllJkZ66/WEBWzMC73yqBFhtLAVKG1dxJM36uKBlgaSgEw7f8mr7o9LWCOSjZSBPiXeJsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684

A collection of device tree fixes and additions for the i.MX 8ULP SoC
and its EVK boards:

SoC-level (imx8ulp.dtsi):
- Add DMA channel properties to LPI2C, LPUART and LPSPI nodes and
  replace hardcoded eDMA direction flags with FSL_EDMA_RX /
  FSL_EDMA_MULTI_FIFO macros for SAI and SPDIF nodes.
- Add the I3C2 controller node (Silvaco IP).
- Correct the SRAM node base address and size to cover the full 64 KB
  SSRAM P2 partition instead of only the last 4 KB.
- Add assigned-clock properties to LPUART4-7 so the clock framework
  configures the input clock automatically during probe.

Board-level (imx8ulp-evk.dts):
- Add a gpio-keys node for the power-on button (PTF31).
- Enable LPUART6 with flow control for NXP 88W8987 Bluetooth.
- Enable LPUART7 for the FT4232 PortD serial on proto1B boards.
- Reduce ENET pad drive strength and slew rate on PTE14-17/22/23 to
  fix signal overshoot.

Board-level (imx8ulp-9x9-evk.dts):
- Rename the model string from "EVK9" to "9x9 EVK" to follow the
  i.MX die-size naming convention.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (6):
      arm64: dts: imx8ulp: Add DMA channel properties and use eDMA flag macros
      arm64: dts: imx8ulp: Add I3C2 controller node
      arm64: dts: imx8ulp: Correct SRAM node address and size to cover full SSRAM P2
      arm64: dts: imx8ulp: Add assigned clock properties for LPUART nodes
      arm64: dts: imx8ulp-evk: Add gpio-keys node for power button
      arm64: dts: imx8ulp-9x9-evk: Rename model string to reflect die size

Sherry Sun (2):
      arm64: dts: imx8ulp-evk: Enable LPUART6 for Bluetooth
      arm64: dts: imx8ulp-evk: Enable LPUART7

Wei Fang (1):
      arm64: dts: imx8ulp-evk: Change the values of some PCRs of ENET

 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 37 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     | 67 +++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi        | 64 +++++++++++++++++++---
 3 files changed, 154 insertions(+), 14 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-imx8ulp-dts-69f9bf928d2f

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

