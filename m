Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F183446C8
	for <imx@lists.linux.dev>; Thu, 28 May 2026 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951161; cv=fail; b=fvLqvjWjSsDZK/7UqZaNWic2frI3bfV7B6xd71Gs8eBAT6qCdL0JDknPegBp1i7X/lvMZd0f6lbkjtKnR2P9zHsDMFb+vsmXNq5GK1ovD0Rk3uJPyDwsVuljFU018g6Jf9+0ZkULjSK1kGqEnpqsYPoE3+g7NqbE9gMyAo6+msw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951161; c=relaxed/simple;
	bh=woDi/uZU4UNo6ne001jG94+YF7NnJPY7gM3LZB5V+VY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hx3SbA3WajFOyM7EdjCifJWOjg4s6ZFgmeqYndD8nSjPCOgqnOGrZoNIhgMP+PqjuqRpCgWh1CS4OzWX2n887tjfcdfuNh2DwpMT4L4SvG3PjWmWk4VC5ATvcnsZzwd+FBoBkPNeHzeDIDqRQ12QFWZ6RBJwxen3JLwHh/VKsMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Wx4yEjKy; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Wx4yEjKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTLwQt3IcTMTH8O4J+F57ml7+FXnThuaTzDMYjB9o74WE3GxFW45u8C/tYmLnfJWqBZfENfrIUO2zfmzaoRNhfapgwnc4yC0U6NGNU9R5E86NNWuamlNIRUhLHLhJj/DiaRZ1qDVg0inqyeliPbHblgjNKm2T+4k0Lm5ZF+65TOJkIKpdRYloJwFENg+NHdJgbt3u6j2IX0GnYXAwnlOuU8Q/1BK4MYYwA0/4NthCvxCw5xb8Q0ZndKDkz0cwS/et/4siM7a/FITVD04fR8hTSNVr721EnS5O493Sd7eCZjp5MmpmaKdv5eWgXVdiJiC7fwVggK1BEqvGFEB/oEGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qObcuM4ItGMaZbAEuFq/nYOTBIP4xgtc6m4C2E9eJJ0=;
 b=r+SAJc4VlZN+EXP5ezrDuF90Htg0jGWUGOklrZl8hh5tVoG/MDpEYmGrC49o6PtMGYluDIeN9gOh2IeXR1fDXfixrTGtOGRN5JUuteLQs9qk5DX+OlvWzN7SNvZl49TpC/PUaY1d2B7Vp5/ltugOh7UgsaKpvAtAExy99dYCGg6izWm2M4yM905KWJCbUJcSbknRlOOODeI+VNvDIkgkRqrfXRat1aMaOaaUST4DxDbBWg9IsfIlBJyBXKQOXUdJBx646yki+jCe7sm/EiJbUk3M4GxgAXF0UBDA8eVRNaexNfPjrWAgdi81VkBXkttGPS5/6LPZPAIMMSwl1DLvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qObcuM4ItGMaZbAEuFq/nYOTBIP4xgtc6m4C2E9eJJ0=;
 b=Wx4yEjKy1XpxBqYBnS94Cz/Ru/iiSIw7SdcaqMYmRR4A/w9o333i7tHEQRLArGc9EaZhAQVqhLX+OI3CrJRxvB6BOPvY1nGizmYUzP3nPdhKNzPirV3CXS4trl7ayMrL3LmIj05+gnshZAhCY8PtNT22WcqgaxXER4qedX1ruJ9Y1KP4gNR8yvzA5PV8OhaSaYG88PkJlfEWbn3xq90qBkM0cC8lcOZBCYH45fjIqjTZXqtsy2XsHS/W2a1UPJHmh6sb8BdsFl7FUp+41iACOuziJAxpBf7Q3ZGotsec016czuGMg6r3tnHSq5gdlCrAPN7MnJfb7ncDnpC1xl73Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DUYPR04MB12692.eurprd04.prod.outlook.com (2603:10a6:10:65d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 06:52:37 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 06:52:37 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
Date: Thu, 28 May 2026 08:52:28 +0200
Message-Id: <20260528065228.1300779-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528065228.1300779-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260528065228.1300779-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::7) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DUYPR04MB12692:EE_
X-MS-Office365-Filtering-Correlation-Id: b9373db0-f176-499a-69ce-08debc85b3de
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|7416014|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 gIZuBMEcWsdzCqR0zW8o1T/hyssrstEcScLgFgGWMaLqPaFzV8cVauHi1ZFpg2h4tRvu9rIbC1vDooEPIsKt9AJjYCoyzrrGa0VHMtMzf64aaOLZpFjeuq1Sm3KvQjlM9tpU4bwt8UPKfTxjVtRJ4xfxFiXorpje03f0L3Sgqoz/xgVra/YgcZnLLkE+pJXLcehDq1kUbBhtZ0qTvkL2eEEOfz6VnwKs60OMdDtUbT7M8RX1dkmVKBIAh4IWM3K4XPvZ4N8X1HO4SyXlVincRyOw+dR9EHYThYq1Ebzj0SHNdMCrOVM+hCdpoC8KgYmByjXuQfFV78XMc8K0QNbOzlgdg8BYKW0QCUGTsx+dZEP9/V3PvSl1i/EzKhthO9vX6sKbFgDWQAKlnI7ZtYN8KTr7MHI5YHJOJ9R7MXIRQWYT+D6Zh0eKIEbGdprFvZbWZucgP3M/FmAwYvdJ2PAQGJPZqh/4rsUi5JoZhXROkkjL6qxTDUpmEUZRb9RlKhAacTW6bCg291ZzmH/J4GrsW/FBJkulveXuvYxfnZiMVaJSmdZ9KbCxVqPzkgPMa/LwMGJRkucaRpMzNxSOsA1FgqovyHmiNQrDK+G+eL37Cr/4xerREUWzBaUOGHzrj9utK012LJOAc7D0OMaEiwevXI+57JekJBIcmyVZKcTaNwH+jW44J2FkBp5K8Cpu3p64
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7416014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDlTWlBLRU5jQ3Fwd0lZdzhOOWQwY0E5SkVWdTcvVE9vbFUvcTM0OUpCcmt5?=
 =?utf-8?B?eGl0VHZmNXZXcTNuVG5UdFcrcHBwTVd2SFhIeE9RZVJDQVhVZTJJbkE1NkZT?=
 =?utf-8?B?RExpMjBHa0hqMHZVSjNIanZ4QTRzYmV4ZEh2SVRPcllncEsxeFQrUmFLWTBu?=
 =?utf-8?B?Y3JxYUVUcGdFSXFrNUF2a2ZHaysxMWFxRGtVRXk5OXFXamlJSno2R2YyeE41?=
 =?utf-8?B?NUN6aXU1RHpuT3B5azNJcy9ISE5wQUQ3NTVBbnh3VlBzc1luSERzcG5WdXp3?=
 =?utf-8?B?aGRtblNlRURGSmwxVDhUblB6cHpTODhuRW16M1lQWXFISDFQQiswR2owV2ZN?=
 =?utf-8?B?VmttUU1DTTE5YnY2OTFURS90YXpqV25LcDMwb1VUZHp6ZjJ3UlpsWUlNb2I2?=
 =?utf-8?B?MmlYVVZTUHAyZTNLMlgrVnVCVVVQOTRQSG1hR01STDZzdEdaTDIybzJmMmJM?=
 =?utf-8?B?QlNFRlRlV0xXMzZLOVl4TGhvNUZUdlpYaEM5cHFtN3Z2MmNpSEtVTEFKU3BJ?=
 =?utf-8?B?M3I0ZzRoL0hpQjJVMkd0Y1BNSGgzTEtKeDVmZmlDWWUwZDBVb0RCT1g0WHhw?=
 =?utf-8?B?L3h1cENwTFp4ZkZYeXJpZmpmSmxMNnNRbndlZDdQUFA4cEVIRTBlZk9TajJS?=
 =?utf-8?B?ZUVaSWwzMjlJMktOV3k2NW5ZaENUVjJFdlZyU2N2RURSYW5ZQThHZHZkc3pC?=
 =?utf-8?B?WlRjVUY4NThINDk4aUw3MGZYaEllK2lDbHJYU2J6ZnQrSmxwb0NudElCMnp1?=
 =?utf-8?B?Z1JCdDZhcW56QXlNazRNRVRaT0orYnlHdUljSEJiNlRENWE4YTAzMGh6bTQ3?=
 =?utf-8?B?SmxBSy8vMG1YZkJLTjI2aVFCZlpDcnNDYys1dWNqUzRLdlpOZFB3UGNub1ov?=
 =?utf-8?B?KzRxSWhmTEZNQU5KS0JidTkvSWF4VzhaRXF6a1RaQzBPUzlkczZlSnVtY0pG?=
 =?utf-8?B?NFluR2FWRjJ5bjRQcVA0S3dhaURwd0tyeUVJTXdBQ2czWVh4dlhvYVV2YUNE?=
 =?utf-8?B?cVF6dXFic1Fra0R0RDRmYk4yeUwxNlZScmtEOVF1RDE2ck9PZkxYcDBnZy92?=
 =?utf-8?B?U0w3eWo0Q0pIZ2w3RlZIRHpOOWJGYVNSZVFqWVBwZElaSkoxOFBCeDNCdk93?=
 =?utf-8?B?TEQwT2dVYU5wQ0tTQjZ1eGxJK0NOM3VwdkQ5cUZiNm9NWGlQYkZRSkdGcEoz?=
 =?utf-8?B?RHFTS2RVZGVvSHRraVAveHJJOHVaTGRUVnZFcVAxVjRqZzFGcDJOOFJqc1Jw?=
 =?utf-8?B?Z2ZubGs5bWdhY0p2Qmt6cWlQTTg2YkNFUFZZM0FTT3hCa1dXL3pOeW4rZ2Rz?=
 =?utf-8?B?TWhKQndYUXZwZEZNMkhxMUUwY1NMdkg4UjlIcURZUHlzTkpQSWFtYS9ZcWVh?=
 =?utf-8?B?T2duTFJaaUtsRHhQcFQ0QTZsbDF2TjdKc3ZERWZKOHRteFhYYjFuRlZwNjdP?=
 =?utf-8?B?NSt1Z3JvM0lqY0kyZFFqSXRoK3BFWXR0SS9rQzNYd2dmNmUzd3ZZZXV3ZXo0?=
 =?utf-8?B?aDJnYUZoWERoQ05uL0xlR2kyQ3NHQ1NIbE5FM2ZvU0ZiYXVTd2syOXhjU0M2?=
 =?utf-8?B?NnRKY0RyVnlnaWpJRFdVVHV4WmoxUVVoeE15THlQbktGV0VOWDllMi84YmVt?=
 =?utf-8?B?VmhXdTFzU2NaMXgvZ05PRXNpMVhFQTcveklVR014bU4yZllVK1ZmRzhIRWlu?=
 =?utf-8?B?cGJyWUJNeHNiTGxWNEE5dDkwWHdzekpYS3g3aUtMSjdKeExMSXp3NDdUZFRI?=
 =?utf-8?B?RHhRWlk2OUIzR2Npdys3WjMxMnhZUE5XWk1xWk1Ec3YrdUZuYmc2czJjTXhK?=
 =?utf-8?B?UnlUWmZvTUt5SmhkSUJ3bkprUUZ6bU9wOC9venZSTVQ4QmthS0JKMWVVWlpj?=
 =?utf-8?B?bm8vc3FpZ3daYktidjJCYmRpbzV3OTU5RjlBT00yd1VqanBIVDV6NFFJMzVy?=
 =?utf-8?B?Qk9ENmxuWjR6aWhaVmMzb05ub0xCS3puMDdTTmhCcFhjMVdJNGN1MDhxTUxL?=
 =?utf-8?B?ZW9HeGpKUFovWmZTZExJeGV4d2RVamRaWnNSUmFmMlZ6S1dBeFhab1hIZ3ZL?=
 =?utf-8?B?ZlhpcXlOL3NKdHdqanFOSllibGc4SE0ramJJcEVXclIxMWpGdGlPUzVpdG8z?=
 =?utf-8?B?RkpNaTAwNEpmYi84VmVNOFc2c2l2YjFIdTJVci9zZThvUy9IblRzbVBPWDZm?=
 =?utf-8?B?QStPdHpkSXduV2p1aTlrSkIybkpTam5oSnVtTktjdmtZdUtnMFh4MjNoNkIx?=
 =?utf-8?B?d0paUW9yYzh5ZXFHbHBOQ2NhTkRHMEE2TGJSczhRaFpmRGFxaGV0TEpFQi9I?=
 =?utf-8?B?VjhBcTFNQWk5QWs3cVloNkR5MzZrUGN2K1BwQ0M0NStwNG9ReTJkZFdiVGZH?=
 =?utf-8?Q?ZRZcJLij7U6sGQMr+JcOGOp5ERhjZwTGT30gk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9373db0-f176-499a-69ce-08debc85b3de
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:52:36.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZGNluL/uLH5IaW6H5Ibq3DKvxDeG6l9/t7g0k49Cj7fNavksD8BKPxPjSJYNxUprBFm7RVZoh/7FaDmItXhArnS/fqy7cb1GVPxi/23wSHMHghnN/cWhKKnXybSbshD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12692

Add PWM0 and PWM1 for S32G2 and S32G3 SoCs

Issue: ALBSP-1959
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..9f5f18d54118 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+					  "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..408bf0b40734 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+					 "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+					  "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+					 "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index 803ff4531077..844d2c4fabf7 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
@@ -245,6 +245,70 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	ftm0_pins: ftm0_pins {
+		ftm0_grp0 {
+			pinmux = <0x2912>;
+		};
+
+		ftm0_grp1 {
+			pinmux = <0x122>,
+				 <0xb42>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0_grp2 {
+			pinmux = <0xb13>,
+				 <0xb53>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0_grp3 {
+			pinmux = <0x2904>;
+		};
+
+		ftm0_grp4 {
+			pinmux = <0x2925>;
+		};
+
+		ftm0_grp5 {
+			pinmux = <0x2936>;
+		};
+	};
+
+	ftm1_pins: ftm1_pins {
+		ftm1_grp0 {
+			pinmux = <0x1d3>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1_grp1 {
+			pinmux = <0x29b4>;
+		};
+
+		ftm1_grp2 {
+			pinmux = <0x29c3>;
+		};
+
+		ftm1_grp3 {
+			pinmux = <0x1f4>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1_grp4 {
+			pinmux = <0x202>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1_grp5 {
+			pinmux = <0x29d2>;
+		};
+	};
 };
 
 &can0 {
@@ -304,3 +368,15 @@ &spi5 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&pwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm0_pins>;
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm1_pins>;
+	status = "okay";
+};
-- 
2.34.1

