Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A82FFDE1
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216724; cv=fail; b=fCUG4DOBh6fs/rEPH6mlbz++j/GqUB1Xt38PH9Q75X0IE2BjziaTbXlOpP/PQV2ps50hcoEoU6UbB78LCLi9VmXeqA+KJOYCbme17DCGOW3O6fLOVwmq1DX2sjTF2ojA1PE99RTl26MjJjbRNam9D707dfesUrGJF9HvoXp637s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216724; c=relaxed/simple;
	bh=usAm0HqjKnCwAMOxRKC42zazCIYz8rA3F2pSB/mbljI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OphpSn3l3bo5WRSUitMBNu94f7HUVnv0ObWd6LyQznbhSdb2asWBg3jWiV+jOOvSJ9yyBDLK2yF+Rrq5BRUHB5Ngjs1MJQr9A/hN0SQGHhTSrWsqTZsgiAKon8ZJD4yIytZOanaoZ59tu2DPjlJtsEAc2t6dG+4IugOxorqPjz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uyFf5KQS; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uyFf5KQS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2NGGVpSeOPn7cxEMbZv80J0WczD+kIcLGmfZjCXB1JMr0sY6TDx/FJuN+HL7RNnuZXTcM9jHVlADm+X+LbYid5SrgFOfPbKJKURAje0QcB9r5JoMjQgumZuusuF01oyYsHCzS8sJOOy7+UC7dS/8YdLuBHiAgY6NBfYX52aomWA7H3P1XqNAc2tcUzpn71Dn/753SbgDkwVN2jN/X4Dq2hhxZD/YlczKbmYaA2qeprKSuunBuSbkpf4TuUKBOciZeCoamCDDkqpdSXdLMj2/kgzvM0u21AT/Ikd+4QjqC9xFro/mvVBJ6qaE2Af614SD9LyuVRa7amTYPqHjRXPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da2J5w8UaAmadoNP1yO9Dy/lCtuI9ahbMzaA3Zcck6g=;
 b=ZNkQwfVjcZJR9jTld5J17AtDiS5Df/08Kwl5tyFZpgqw/R4zkiITuUHr9OXipAfI0lA2dkcMBSobo8PbAcsgg7XI4853Y+pNQiNCUlBKCIKy5tGs6+4UbXeOrjUfyOE4UYUGvXAatIYOV1zIymoHSSPxlfHSG7X3rNfDRfNfQ18Q1mri0TyWR+VzJTXYX3NiMUyGNVS57OJEr+KQLCBI591Pszz07gIXeawy9APzXHpLItaoDkWbEcCEditp+H4EgZEvI0W6Tr0vmIJIFQ96qNBBCBdPcC9h53YVxEUm+Lo76JeRF+cUlQ6Pw56w4kzK6NYGI7UG0OQKu5EZWMsGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da2J5w8UaAmadoNP1yO9Dy/lCtuI9ahbMzaA3Zcck6g=;
 b=uyFf5KQSah757+zyGlgyLdRykAl/fj7gaVRt5ORuSlM8VLgthPE/FcTY9eLINw41OomYKqZio5YoZvdJ04zqUKmEEo+JDBlV0m9H4LG99i1ghzYk8I1rCQL1WRP+UjlsW0WcdeeozhjXyZBuorliiWmT7gl0/BOUGVHWtiA1EB5nW6Nh1U5KPsAqGKGPpLrKBuOiOVmxngd9P981Jgx854Ld2Ht1+jMMddhzIHPW4dVLyh3fnB2L3M9AmZEYRvRPMh+IGYyzE0k8okmfHBJ0nn0XOE5GYlDpfh19K5w7hzWEAsGOfUX8Wy1GHgb+RieqdQHdaTJI/TNmJyihnB2B1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:11:57 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:11:57 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v6 0/5] arm64: Add initial support for NXP S32N79 SoC
Date: Wed, 11 Mar 2026 09:11:49 +0100
Message-ID: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 306f71d4-9f5d-405d-3f8a-08de7f45dd03
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fLA+GdWR2ypL+jWGi+quJlJOXf+74sPeBfiOH3vMpS2Y5m4duwqic0osc7jeVojcAP4NhyLyYvOEIk+tb+DrHUXOpLuIbgA/fvt5efv5lzGJ24k0+geb+xieYZ5C0BN6xptOVGZNmsqYtih0meRTY7hbx58ZA0w7AusTEM8YAH8OBFr6TT0jcLN7X1ZrdDmEm2SioDb+J5gbLFRDAkPGqxmXf3YwIsv91Q9v/yHwCPudUCG+su6YYlRBi9Dl2AhV3LiOWsVCqjMG/MVWlWeYuTtSvn8IAey5S5YX6a3muHXfBO4heedS61qmAiuIIfmJlbKFP1VhKiR7+nlKB+y5Zm7sG6tSDSx/Q9q2UKm6O+jUUqBRZH7Nng+3+LuQG3MjxcSbLN4LFtz7Ci3wBPninBtOzoKU/iSJggOdWYYbMCjnakca1m5RRfx4jr9n38+xOuJkH8Knb/auwgqq/qAe4IOKk0EP4P3MSZF94SBJhAzFYB16ft9M6R+8WGA0ZLKcCqg4Rv78RhHVk32DhpEMgpVA7rggmEhPSWPem27iknbvP0fVmfEapiL1P72qj68ryntSmgdBYCoCvxPjnji8eUY/sHzHbi9n6V04ZjRk/ck4B5FrADFqvARkuoTIcskcCI+UGUTmjh1XC83AlovIpSpROqBF7EgbGFAvubOKWN0xMtfvjbAdNOVITqy89IvG1Q2YCmXkoxJ0Fa5VCG2LQrsL0MolR4jJIa+thOgASWpcTP7aIN+t1m1JJasXwjBY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzdpNzl5dDFWa0QyOE54aVVCdVpKYTVCVENkV2xOZDAwMitXcUxQeW1Bdngr?=
 =?utf-8?B?dGUrbDUyL1dOZjFnU3VSRmpHd2hINVJRY1dJWlFvamtqTmVqQVFmcDAvYmpt?=
 =?utf-8?B?a1kycXl0bEtaTjYrdDlHcnJSenZtR2l6T0U3d2pzTi96bkxsdytnOERjSTRy?=
 =?utf-8?B?MEpITU5uZ0N0WWZCbmZYOENKUjdaYlBZUlN0SndmWW1pRXNZTXIyVnBOUDg5?=
 =?utf-8?B?MkhTbWpZSG53bG8vaVlFT0xpSlVUdlhjUkF2Z2xNL1B4N1UvNFFsZEVtNHMy?=
 =?utf-8?B?bVE1emluVmo1SWR6aEc1bVBPaEtDdUJpMHF0NlJkbzJMaGRHa0dqQ2VWSEpt?=
 =?utf-8?B?cVBnK1JaVWpkTVdJREp2TDdSLyt5aGFyc2dVZG9FSm8wVjUrQ0JXS3d3SndG?=
 =?utf-8?B?QUlvNWRvblVCWWR2eU1SY3JPWGpvaDMzckZWQ0V5Qm1YV1VJa2xsQmtLNy85?=
 =?utf-8?B?cWNaNGdmaW9iK0pqcHFGek5FYTU3MVRRZjFYWHErclkxRkt2dEJRaWptd1Vw?=
 =?utf-8?B?YW5paHlTUVd0YjMrRGhLang3aVRjekVYV2RiTWErT3Bha0tGbWZCSFR5K3hL?=
 =?utf-8?B?OGlVYjRFL2haWUxocWRlTy9jYk40cFUyYzMzRzIxU1hqTzZOMk5Ya0RIZ1Ru?=
 =?utf-8?B?ZFpZOHpCUTRQaVlOOCtYTzhRYUNmbTUxY1VXYm9LWXhVc0c5anZwWHN0dkNM?=
 =?utf-8?B?YUNGZW1FUDFvdVVFTmp4VnVsZkZyTkZEMVIzNkFyUnUyVkx1bVljd1JFZk1m?=
 =?utf-8?B?SWJ1Znc2MjJLYitkd1BidW5KUGhpKzRjeFUyUDllMXRTOTFiQ1lhMW5SdGpw?=
 =?utf-8?B?N0xOeXQ4eXFad2VZS3I5TU5KWDNCYW9Za3FZY0xPRGhSc0Z6aXdwYzBuT0tV?=
 =?utf-8?B?dGFVaTFaVjVGM0Q1YU5DVmVyYXNLYldMQmlQazNFcGlZWVkyNEdjbkRjQlNC?=
 =?utf-8?B?b01TS0MwZURueWZrNWdCR2N0WG1mdnl4bGxDVXFUeVYwS0Y4QVBUZGVhSnR4?=
 =?utf-8?B?WCtVWVg2YWVoMFFuVmw2VE1ucTE0UitIZjhpSTFEZWxlWHFIMWxPSUt6bzgx?=
 =?utf-8?B?OVc5azA0anZYMThwRVRNSjhUUFRaUEU1eEhTWU05OUtQY05BdE1ZTkl0U2w0?=
 =?utf-8?B?UFBjNnAxNmVTTWFXWU9XdTN3ZVUxRW5CTFQvWW9NSkk5eU5kMFR1QW1kT3F1?=
 =?utf-8?B?Tmc4bitMRUtMRzdDQnFndlAvbUh3Z2ZraHJ0NHpxUzJ1ZkFSQjB1U3NGTGpR?=
 =?utf-8?B?d1d5OHc0aTc2UUlhTXdtWVQyVnRnZ0RHWGxoazgwNUlkaFd5RVJQb20xVGZx?=
 =?utf-8?B?dmhyUDRuMHBsOEl2Qjd6a3Joc0dHZnR1NTJiNjNYbENiWDNFNHFobUVIZWNu?=
 =?utf-8?B?RWJneExPem5nSFNkRCtMQWt2a3N3cVpXandQcXNCbnIvWUNueDAxcElxL3c5?=
 =?utf-8?B?cFlJZ3hrNHF2NXR0dHNrcGhGbHliZFlnMjh1V1dPYXBhQWIxd1lrbnFkRXNh?=
 =?utf-8?B?VkhOTGkvbFZtcVI4OWNHRTM4K1F5bERpekNnaEpjbjN5K3Y2RWd6WStpb2Nu?=
 =?utf-8?B?WXQydlhkaGoyWm1wOUNDZG00d3crbXB3ZDNPeXZISVVtUVAweUwrY2U2Q2Mv?=
 =?utf-8?B?ZXFhWjBOUjBwWjhsdnptOVhUMExuUTUvUlJndExEVWU0dHJkdERTMkoxVXZM?=
 =?utf-8?B?cHcyRHo0aklJaitSRWRwY2VyQldmRHV1aTZkcWZDVCtOV09TckxSWkMxNDhs?=
 =?utf-8?B?bzAzd3dkR3g3UFNlUXJXZmVZM1pHVnBWcG45R1BvOFZIZjRmMkUySTUzWHZY?=
 =?utf-8?B?emhoclNJZHFYam4zMjdmc2lZd3BkbVZRY1BjVTBHaXJWZ1VkWjJOaFVPelBV?=
 =?utf-8?B?bVhzWkpZeTUyUVpOa1dXN3FNWFFVZ2dDMlVxREFrUlFYcFJlZlBUOVdkMGUy?=
 =?utf-8?B?S0QvMnUvQXdDT3NQNWpHUG1kcEx5SHJaMU4wdnlKdUQ5NFBwQThFQUhVWmNi?=
 =?utf-8?B?RVN1SSs0MGpjQngvTWJORTMrSDh2NStudkZDTEF0MGhHRkxwbFVHTy9icW1w?=
 =?utf-8?B?MkNkRlJNRTVxcFNzSklWZVNpeWdiWDZmTCtkMHErRHlWaS9GcHhlZkVSWmJN?=
 =?utf-8?B?LzF0b0xkdE1zd2hTVnRxalI2V2VLcDJPMm9jMUVaeXdvMUhmQVBoblU2Tkxh?=
 =?utf-8?B?U1ZXRGh4TmlpbDczK0RieUdSQjNPaGFvK1hTeDNzQ3liTS94VWpKM1RkSzdT?=
 =?utf-8?B?NXBmb2t2TkpPcmE3MkpkeVo0S0pOZXhFbFI4U1BKZ0tPZnlGYUsybk50UWJq?=
 =?utf-8?B?MFFNcTNvZDdSNXEzenBvV0tBNVpoeW1qTjVwczJkamI5SGhLbU5PL2w3SU5M?=
 =?utf-8?Q?YzJt6+AAe0BJSyOI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306f71d4-9f5d-405d-3f8a-08de7f45dd03
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:11:57.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ6pk3dTx4ePXtsb9zZtCkDLIS9kibhgid/VEVprdwcz6Q/m7FtvqG+7NCVabbmJdgsnbNy2D00ejjkSyKUYkFTrqsNS6edtg6XPj/C9TJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This series introduces initial device tree support for the NXP S32N79
automotive SoC and its Reference Design Board (RDB).

The S32N79 is an automotive-grade system-on-chip featuring eight Arm
Cortex-A78AE cores organized in four dual-core clusters. It is designed
for high-performance networking and gateway applications vehicle
architectures [1]

Hardware features included in this initial support:
- 8x Arm Cortex-A78AE cores (4 clusters of 2 cores each)
- 32GB DRAM Memory. 28GB are usable and 4GB are reserved for ECC logic
- Three-level cache hierarchy (L1/L2 per core, L3 per cluster)
- GICv3 interrupt controller with ITS
- SMMUv3 for IOMMU support
- Generic Timer
- IRQ steering controller
- PL011 UART controllers
- uSDHC controller

This series also includes the necessary driver updates:
- sdhci-esdhc-imx: Add S32N79 uSDHC controller support
- irq-imx-irqsteer: Add S32N79 IRQ steering support
- irqchip Kconfig: Add ARCH_S32 dependency for IMX_IRQSTEER

Future patches will add support for additional peripherals such as
networking controllers, PCIe, and other IP blocks.

[1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32n-vehicle-super-integration-processors:S32N

v6 -> v5
- Patches 2 and 4 from v5 have been applied, hence dropped from this series
- Removed redundant zero initialization in imx_data struct

v5 -> v4
- Squashed irqsteer 'Kconfig' changes with the actual driver updates.
- Fixed tabular layout in the irq-imx-irqsteer driver
- Added received 'Reviewed-by' and 'Acked-by' tags from V4.

v4 -> v3
- Added missing Signed-of-by's from one commit removed in v3 by mistake

v3 -> v2
- Split S32N79 SoC dtsi into separate standalone commit
- Renamed a memory node in the S32N79 board dts
- Fixed IRQ STEER DT-Bindings support for S32N79 addition
- Updated S32N79 usdhc driver support commit message

v2 -> v1
- added driver changes required for S32N79 uSDHC support
- added driver changes required for S32N79 IRQ_STEER support
- updated commit message for uSDHC dt-bindings
- implemented fixes for 'dt-format' tool findings on newly added S32N79 dts files

Ciprian Marian Costea (5):
  dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
  dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB board
  irqchip/imx-irqsteer: add NXP S32N79 support
  arm64: dts: freescale: Add NXP S32N79 SoC support
  arm64: dts: freescale: Add NXP S32N79-RDB board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../interrupt-controller/fsl,irqsteer.yaml    |   4 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  70 ++++
 arch/arm64/boot/dts/freescale/s32n79.dtsi     | 362 ++++++++++++++++++
 drivers/irqchip/Kconfig                       |   6 +-
 drivers/irqchip/irq-imx-irqsteer.c            |  53 ++-
 7 files changed, 485 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79.dtsi

-- 
2.43.0

