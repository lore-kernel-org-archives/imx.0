Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EEE37C107
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210142; cv=fail; b=Gk0o5Zm36c9y6aiHDrCKIYGJVgoLJ8SwtNy2RBP7/dYtFtff4OUQReXiCNVJlT7CbXO2SYFuJOUpMVIzeo1WsAxb52UTjSQY8EqN6p0JgycWbA25U4iTgBYJ/oZBiIT61g07xpPp5qUTd+/2ftk67z1VCUgptdbeypcOJtaPKGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210142; c=relaxed/simple;
	bh=vuekdbCiDRNzUsbPXrKfzOgdhDoTUbbsgXoaKpSNvWI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JtnvIfGVj41HXl9BUcTFxTn2/vFXSUwpMcr4L8rub+Cg19Xx6DyOiFPaU8SaQfbiCRgSsC7BKlYaChIAYKon8/HZB6k2fbGROJuZamU6dYetvp2aSfyauYmJZGLMHZvnqKTeqxgd4H6t7JwnzzIZUY0hmPLXJ4hxqhEgM30fRTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NnWit+2t; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NnWit+2t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhiD+yGugUlFwM3bankCLVI2oBSjKkPiucDg67dgDU403708o0d/K9BfeY6TA00m/cyEz2sD0nzYoqQI/vDRHCYln+g7BJXbFLbG3Pf+59+WIMJGnWyTILHXW0SoXP9U5b8/3golG1n/DFpujdG6FzL9hl2E3RQnT/zYqwTE/8o5ZUG+ku+0cFw1NX70RsCi9CguzvYxaERNgczlezG+4u3LgjNgymkSiRvKI3J/hn4bTv1z6Tp8HlaRH6JumTVvDBrbbKzhm4ny5vK51IN9hwTrjXye/D16K0yMDwp8XpF9fq3x8tRoEzBQ83fPwb/GkXVKv6YBdqS90gqwp6Li6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhHop+SVFk5m12A4NvW1DwL+iQcbtuQ5cwLF6/MExK4=;
 b=XGu1piH2SgOw86IhEQ0LDkM4IB3IYej5Iy7wpmOAZsT4KU3az9Yg/xBN9Av4gQIVoXdkaDgEwYprTAs02n1Lj5VyRjrqQu7b370KmFYQvztKcwGTy2OzyT5cJnnP5/ZSSDXNz/MhiAaXbVfkECgFlFsfSPuIN1Ue/ArlPInBvxryCt4z7a4VB37GZd+2p87ITdR+vb1TcPJnkatVcHR9KQ+MRXVHs5L7DjNtnzgfNjdgMdVGkuHpUO1bqjaFULVbx7mAwhwhsRrrsf9HRSpW9qAASFGOYJGtoIMrLUDBZnGmrF7F3rtA94HOSKX7l7iz43Ps1V3ewERAH6SZoq90Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhHop+SVFk5m12A4NvW1DwL+iQcbtuQ5cwLF6/MExK4=;
 b=NnWit+2tTUmyzRmsb+6c84Im7GyOEo9fVfjfPMlaywTfp5EucKv+2fbY2MrORW8pT3FVZvkLaYcXpI+ooUqeErXgVoJPOV+pIxdacqhoc4N/6DwzVksrTp3TXDoYk69jT6knVM4Gg20rMOQm6vtnAehfDep9ZjFMVeScAKn8Gtuz9FkYp2++noKfSUWzzshgwX3YugmOtTlmiFLY3MmBswUkZG6138DFQdq8Vsx0BNLz8pKFPwJFz1DeVDrX1PCjxtbolnDZJVJ24B4mwZI/Wi4lJ82WaoGXeayrIoIOrUJTZp05HzEugT69FmPmVAkHedJjMEeIYyWGsb0DQ910Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11972.eurprd04.prod.outlook.com (2603:10a6:150:2e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 3 Apr
 2026 09:55:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 3 Apr 2026
 09:55:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/2] arm64: dts: imx8m-kontron: Revert reading SD_VSEL
 signal
Date: Fri, 03 Apr 2026 17:57:00 +0800
Message-Id: <20260403-imx8m-ldo5-v2-0-53bb33d6b810@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyOz2kC/03MQQ7CIBCF4as0sxYzA0paV97DdFEo2kkEGjCkp
 undxbpx+b/kfStkl9hluDQrJFc4cww15KEBOw3h4QSPtUGi1KhkJ9gvrRfPMZ5Fh07pDrWWpKA
 e5uTuvOzYra89cX7F9N7tQt/1x5yQ/plCAgUZsqRaMoMZr2GZjzZ66Ldt+wA6xABzogAAAA==
X-Change-ID: 20260329-imx8m-ldo5-90e369066213
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV4PR04MB11972:EE_
X-MS-Office365-Filtering-Correlation-Id: 7786653f-4d14-4650-70da-08de916724b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|19092799006|52116014|376014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	t01lXdreVeAb2w6CMl8od5IKz2bpY1/5pGPEpzfIu4hT+yslxqU9tblZlzt0QX0YJevWn9WXn1LXhZLpPzEmpLfhsOi1u8Yhb+YvEG5joZmXBKa2efaBewResVXhrLJdXwisD5QJAlgoapZcxK5BSOT8nP5jRwQObwyno2r8jDQJIu61HGoqFSu5eWuH4+rW0fqUiLtXuBtEGXbQ1IaslaQKdkJ5nOD0PWxH258LxkD25CZ8ngboYF6m1KKFN7XRuQanmRwGorus7WVdxhcNjIqCQ9B3dQdc3fwTLrR8Du4Vm98sw1kGJ/zb3nj2AXH0Q3S9h3o/KIkSKOR1LsBd2l1uKR+9Kii4xBMX81bf2xLK2e4XencqVzZAhi+vndN8zIgIaaO8x0scglTZ/rgjJnajS+T3KZlLfwcI4x0+aKhYnbcXhRHk+vKoGdD3630DWrNvtMV9/ziY8hB5ZvW71CHsjD62GK1pUTZYGlU1tJBmOlU+blHno1plL/ZbsqcK9cELlF3JU2BQo2hXlmMcf8yeDyYu2DyeuFwI6z+VBTkesxz2R8OHAJqzZPN3FDVvJBBOnhLOTLMNVU/r+08d0ZARJJWYBwcgQZGytsyGu3f3Nc5tKMgb0Ed8+nNn/sOTOP83dxUkOeNaxJc1VBruZPIBEn1CYn4dA1HW+Wh/TPE7s9UFdGIomj6PD8Pz/nFwiEAUU1NKogQNk01It6RTt50QINh0d8Ui2WIStIW14guW7Kksq8mNE8gpeaQ+B3k1PWNA7JBUocZADX7ihhvrsgzX9cPkyXTMuZACo97yryA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(19092799006)(52116014)(376014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE5LNE9BZ01EcDhHRGtMa3ByUHg0ZDBzVktlMzMvbjJTYXNSWm5vNG5HTFow?=
 =?utf-8?B?cTVCeUpDd0tyWTU1WHQzMmc0bkkwcE91L201MHM3YUJYWlJNbEQwcGtjV2RZ?=
 =?utf-8?B?bWd2YVJJNmdsNXArUGE2V1lwcHowUWhweWxmYWhWUXBRQWRpdWtnUmRCdkdh?=
 =?utf-8?B?K3BFOUhSd201bGY1cmp0YVl6U3NuODdaU2hTdUlBWjlnRFhLVGQrYlFydkIw?=
 =?utf-8?B?NmVJN0ZvL083UGVVTHFlWW9wbUZITWdEVWhPdjUva1BUaGlSL3VTZ1VMaEgz?=
 =?utf-8?B?OXdERHBDczh6ZytHbW1TQUtWYW42M01RNnMyOGZnM3dyamJlMVRwNjdWZERP?=
 =?utf-8?B?Yjc4STFYOW9CMzdGZ1NFWXRvc2dFQ1BkclJXR1Y3SWdCZTBibmloRGt6OXZ6?=
 =?utf-8?B?VGs0aTNoTGVQaU9tODhDZEMvY09kVjRWcXlZdTI0VURPMWV1dEVyckFIMUtI?=
 =?utf-8?B?OWZFSmZpeUtQWTk2YmlZc2s2VXprdDdaNG5ib0FmMVZWK1Z6cTMzV0wvSy9G?=
 =?utf-8?B?K2hjK3lxZURjeEg2Y2p3VzZzMXNhd1lUR1czZDRCVDBJQjd5RmcwdkpWZUlI?=
 =?utf-8?B?WkFBYXY2dnZURFFVWFo5aWhPMUtMcTNjZmlPaDdwTDNTOHlNdjVTL21keUJO?=
 =?utf-8?B?MzIwTUF4ZllqY1NPR0U3NWo3L0x6U01VU3pPempBNEFqN0dkTmMvdW1Id3p2?=
 =?utf-8?B?ZC9hTjZDZmVFMFdFMG9pYVZNa0xkVWJXakdHRzdrWVFob3dWdzNkZWpMNjd4?=
 =?utf-8?B?QmZzbERPZFpaLyszcThuTzdaWDRCNWVCdWYzM3g4WEY3bWdzVTFvY1RMRVF0?=
 =?utf-8?B?L3RCdG9IZkQ1QzFaaWRPTkRKcnFRTWVIYlZDaUxxMDhnUzk5V2xaMEtLc3FD?=
 =?utf-8?B?WGhkei9PWTJTWmxBcWpLRmJ5Z3RweGg5bFgvdGkySkRXTlAzZG9IRi9qK2py?=
 =?utf-8?B?S2l0eEhSSmlwV2NKZ2djMFp6Yy84a0hmUlNldkM0YldkWWM4a0Z2azFCWC9N?=
 =?utf-8?B?QzBMU3diWWwxM0U1M2hjNWt6WHFlQ3JTR0hxZk01VmZQNG1DaFd2cFErNXoy?=
 =?utf-8?B?YmJRdnhPbU5jTkhhQ0J3aTJ3aUxKblZqTUo4OUJpY1RsMC9wUjdFeG5ZZDVR?=
 =?utf-8?B?bzEzeG9BZGVERC9vbWlIYU16OEZpdWFyb29kSVNvM3JYbzFZOWRyaEtzR3gy?=
 =?utf-8?B?eG9GVS9JbE1WK3dmZHkzdFpKMDI4Q3NaWXo3WVdpb252WmpEekh5UGQxK205?=
 =?utf-8?B?SlpZemUrVDY3YUZaWld0RFByRmRzL291TWRIWFdLY3ZtVTBmY2V3UmRaVDk5?=
 =?utf-8?B?anVDMWpTeUdTZXVQR1d6QVZHbWMyMVY0S3hybURpZXFBUVNVdm43SnBnVmVI?=
 =?utf-8?B?UEZWVkx4c0FWV1hWdUJJK2ROdkNNY0hqT3M5ZHdvSzRJRFlHUmdESWR0Tit4?=
 =?utf-8?B?M0ZKR3JXeEF1WkhhaU5Nb25TTHhWVUk0RU5BWnFUa1NkZmhHbWhVbFdNWERm?=
 =?utf-8?B?WFd3WFBKU0RrdW9NWHo4em9yRGlxdDlDWHdwYXdkMnNoU2tSZ25meURiRFRx?=
 =?utf-8?B?QVU0VGpWZjdKRmEzbktaNFdKczJmenAyYm1WT3BBZk9nT1o3Z29taFVsNENh?=
 =?utf-8?B?SDZEUXdZd29XTmRZS0IvSDRmUnlFbyt5em53aHh1ZC83K3lUWERmTDNYWGw2?=
 =?utf-8?B?eTdMbDA5M2pHSWMrSWJMVW1wVHVaa0JJbTJzOXFZS29zdENNT0JFR1NkcUxE?=
 =?utf-8?B?VTQ1NkR4OU4rV0ZHcWZDY2JSTlg1WmNhM1pQV1F0bWFNejVyazVFTkNscUsx?=
 =?utf-8?B?Z1B1VEwreFA1UW10TEtHVWcvTW1TVkJtbkZkTHd1YkxCbWhlbWtlRXVxVFhF?=
 =?utf-8?B?Wng1UGNIZVJ1MXJLRU5rYWJQbUdkTldUVGtSOWZJczFrajdvOGhqOXJ2eXFF?=
 =?utf-8?B?eGlRMzcya2pVc2cweG5oT284TWZFS1hOODBHY0JpbDJDS1ZVN2VjRFd4ZTAz?=
 =?utf-8?B?d0ZTNUpRbmhBcVJKSkF1UjNCUlM4QVRGNm1lMDhnVngxL1QwYXcyZUx4NDl0?=
 =?utf-8?B?NFVQMHFjeDdRNSs1WExpbkhmTHByZ2w4dXB6aTU4bUI2TUpZNmYvTy9nWW1r?=
 =?utf-8?B?Tmh6QUcxMlVCVmc0bEdCUUlsQmE5dUNMUnNzSHlFb1cwK3FZcCtCMEUwREpQ?=
 =?utf-8?B?Myt2by8vdlViY1oxTFF2UmMxbVkyL25kM052dGJqVzdac1ROVStPZDBmdlNY?=
 =?utf-8?B?cXVpcVlCVUtQeU5NUHRUQnB6OHh1R3h5SmZ0WW1ZeEFGanRvaVJXNlBnOVRP?=
 =?utf-8?B?aU4razZaSFpjSmd1ZlU5ckVoQTg5M3E5NzYrMzVOR2RRMXZoa0l1dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7786653f-4d14-4650-70da-08de916724b0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 09:55:31.8760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n71z31oeSMYVc0GQhFObBN/LCkx59CGiLDaAyx9/Gj9hl7IlkFFj1sVHWXxahb0+HlffrSBckeyh5pV/6StSuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11972

V2:
 Add Fixes tag
 For the regulator patch listed below, directly reverting it is not a good
 idea, I will work a new fix patch for it. The regulator fix patch
 is orthogonal with this patchset.

When MUX is configured as SDHC VSELECT, enabling SION is not able
to read back the SD_VSEL value. SION is used for force input path,
not to redirect the PAD value to GPIO(the other mux).

This has been confirmed by reading i.MX8MP RTL. we have not check
i.MX8MM RTL, but it should be same.

Not sure whether need to add Fixes commit for the patches, just revert
patches.

For the U-Boot support, either drop vqmmc-supply or switch to use gpio
control to replace vselect control.

And below patch should also be revisited.
commit 3ce6f4f943ddd9edc03e450a2a0d89cb025b165b
Author: Frieder Schrempf <frieder.schrempf@kontron.de>
Date:   Wed Dec 18 16:27:27 2024 +0100

    regulator: pca9450: Fix control register for LDO5

To supporting read back signal, need the MUX set as GPIO and support
in/out, not set mux as VSELECT.

TBH: I have not test setting MUX as GPIO, anyway we need to fix DT.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Add Fixes tag
- For the regulator patch listed below, directly reverting it is not a good
  idea, I will work a new fix patch for it. The regulator fix patch
  is orthogonal with this patchset.
- Link to v1: https://lore.kernel.org/r/20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com

---
Peng Fan (2):
      Revert "arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal"
      Revert "arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal"

 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts     | 10 +++-------
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi |  7 +++----
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  7 +++----
 3 files changed, 9 insertions(+), 15 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260329-imx8m-ldo5-90e369066213

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

