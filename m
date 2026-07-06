Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10752D780C
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 21:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374745; cv=fail; b=lmP+92ithyAM8klHE/I2OrvX01nTWKuyjRn4/XTyF1pUvMhXUQKYOfPDtQt18gBIbGMa4nlUuTByq2mJWRuBOe8Iq4kXtessuRCLwwR7HT8itzFBoF4lenq8JY4y8xTz8dZzj1uAys7aSPqafwdYY67Xab2RLCLIJt7hzM8IN80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374745; c=relaxed/simple;
	bh=cKnk0PLeoUnGgt/DmsB3l4ZlN/Lsbc+6CHMza/Fe+FE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=UlEJBjeQjo/H/twSw4HPANsmC39MB7fLjdE1RsPa+VL4VZmBZPImLvWK7JXslMu50qFqZ0qxHA0DLoYMZ8j/SIwNlBkMdX92g36002vzf+/PI1IQwXQ7i68/Sztmjx31S0ClTIRfycYM6H+f2GekFS9l/DG5qGFIueljI490kgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YgdkOtP5; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YgdkOtP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGQklnRCo2nAsF6Tf8j461KpbhXOvFtMgFkQTi9tP2zCimrig3n4Bme9wN8dmLvq89m/c0FwCC5SD/msIeNTkm7rO+lzCCFjr4n0FQAgDwp5R0Lr2dfUQjphNF4ctafkAJijoWa4prz8L3cgA5YF7mc8ru7UKd5BC735uXlifQjfUG6S9dzvOecs8gwRgZrU1spugLZSd9mHDoserASoYzAThxGNDIeNnPHMT1YRiiDVziPiuAALvBnDCpYdPDrK9ujOiUAIT1+/7uevJerVsxrZTmsbuGQh2pAgblehw5TuZ3qnJYg8iXXkehfRLNwEUOQS5eBwLRLpH8DjqhfoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJipImgU3Ut37HRG99kLqqX4E5oQ5cdKR1I6GWWgnvw=;
 b=ejXjWenWWcRIVA3dHWo0HMOLs1poDtiKQhJtD0Ze6ad+8XhUujVDGKziKG0nyQMjdpX5cDpzrbZcCagDm6QnVUSv8t52kqiiG8xPsUcRNesrXxvXy0GM0yaF0ug8RhR/wugpMpFrPIFHiH1rR0yTS99PVpxHIW8ZmyktGjqdx4QdOf6m/yC3u+vd7OxmGSOoqd1cceb+HgTyfxW2yGmCUfXTtzte/GBDl0j41F1lzNWmZRftOWf8MSq2nBpImPTl2pjbYzO/5uHGbJcsWCAO2p4CgpsFN6DQd4PWxh3VYO9FBeSJtenftK5OWca9b5nlbYJvZDgmljerMPSxl+vhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJipImgU3Ut37HRG99kLqqX4E5oQ5cdKR1I6GWWgnvw=;
 b=YgdkOtP5RSHU//CCvMcfTyq0uKL7bSAsVKq+nNEFe4l7oI5AvARemsYQYsCNdZ0M65C31owiN1dMG1tyK8vfMMiRcE+BC6ZplQWh9DeNmr0b99YP3SHZP8VMfWT9l9RJEZTbyhvWzN8fcx4/NNxwEjzwWTLhJpL/i/Qk7R+gM4lqX6iOd1q3APNRrjfmfQ+LDXPmuF74Q5jU3xjRGxIsbi/ErCh2cuZ0YfQ5kCG44ZxaEAIkhhk1H33P37ZX+dvfwdTAMT5A5iMFlfS36wxkTYObc0fEzUn/2/0gKwEDUANeHqyZPEByTVkf2vpde9uoBCg84J0EoLp8B/L0yMx/vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU6PR04MB11230.eurprd04.prod.outlook.com (2603:10a6:10:5c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 21:52:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 21:52:20 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/4] arm64: dts: imx8qm: collect some small update and
 fixes
Date: Mon, 06 Jul 2026 17:52:07 -0400
Message-Id: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgjTGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMz3cLc+JSSYl0DE2MzE7MkEzNz0yQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0A7GixnGoAAAA=
X-Change-ID: 20260706-qm_dts-043646b4675b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374735; l=823;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cKnk0PLeoUnGgt/DmsB3l4ZlN/Lsbc+6CHMza/Fe+FE=;
 b=d0kYOmjp/94kQTTG59TotXMmt/DKTWQ0TVE9RD8LEPLldvOBTb+iIuud+NKGnZgFRtNa74xN0
 jJcCSdSBIurD8aESGeYw5+ybry9JL5e7zfpvgPwRbJ9d2nFia42tf/R
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:806:d3::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU6PR04MB11230:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f62dd4-5318-4325-a612-08dedba8daad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	cJ65zlFGRoX+0TNCQZKcmmUQ5sRMTbK+b32vfgPeTq8pwgSQmm0m43uNcZwMx9bP90RlbJ8AWGmlK+WRxN9mORa1uJ6MuBsP24YdLkjGGEf8s+NYTWYvAww4/wIaNWsQYicBrYwljU3rgZDQtai35C7vGplw777vwTAJ2VMeHob9aTHZxOvTWpXUohGww6k8q+0yQgUXhRJ/TR5cPN4bNyumFLVLd1qWdNNJaUttl5863qUFVOfb0wrywpFygXsUdSRZG5X7kZXWGXK39guvxWiAR8i5QX7xiiijnxujAmaUPRtlSLByQqwKKG2n9KWt0Ebn4I+RtG6o21HRAfNSZ6bXalVwrKqMwvS8qb8kVSiwmO0F8KQtxtscm8KTlCPsHwJwu2TRPB0o+hDsToCVkRVMW08ptpAAIVDN8wVZeIS2dI6+Eit93ra2xuqdMk5Wa88hd+rAMl5D3vsH9alfdUUoU5UuUWdJT8iXdeFUZDYEURQoxz8Ujm2Ww+hDpFGyYDNVtbz0U8jpTlcjohvjfSc/86nwvbAzMGu03z7PkMZqNibIIwXXLbLZ0QVP9FEMVjhs9BAFDUu2ZRskHYDfenK5Ss52mUNrHrWFGUcvhhx9tYdHS8mV5JgI14Y2705anKj8HPa/95IeL9TWQh6GRZzxpuWISHocRQtN6Xd0q6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzRSalI4K2x2Zkt1MWFqa0FEVlpyUEtjOFpGVmZvWFJZMnFKd0dIWU1aSnZl?=
 =?utf-8?B?WGJKUVdmOTBUVnVZaWVLdnZoTXJKSTEwWVdNdUlTUkFyRlVHWnpHM3BseW1Z?=
 =?utf-8?B?aDFGNzA2dGY2ZFh1NmpldlRJaGo0OGhpWUpTanpwdVF2bmlMdGQ4cVFiTnZk?=
 =?utf-8?B?UEdoVDVoOHRJMEJSaWFVTXppK3B6cGt4VVB5UVdSOHMzb1NJdU9lSkdBSnRq?=
 =?utf-8?B?L21TQmN3OHNzeWgyakkrZ0FKa2VzTGNsRmNGeHhFZHEwbGNCcXM3aDF6U1R3?=
 =?utf-8?B?elFxWjF6bW5EQ2VNSi9ET3d5SCtWbjlhR3JMemk2TFlMcUxBTElJdzVwZ2Nw?=
 =?utf-8?B?ODJBY3lZQmZ3V3RQRU9ST0JGNG1SaWI5dWZzVnY1dkZ2eGFnL3ZpM1ljMTdn?=
 =?utf-8?B?dTZSQTR1cklsdERYNnJkTmszaUZBQ1c4OWpNUlhLd21BaUIrQ0tQSnB4eGU3?=
 =?utf-8?B?dkJCV2s2T1YrcmxORktoWFVxY3NDNEc1VzNTSjJPY3o5YjRNYTMxN0RzUHBp?=
 =?utf-8?B?YTBnVFQ0ZFZjUmIvdmN0Q1YzdGpNbFAwZVVPa0R5V2RIeitBMnR1Wk5rTk0x?=
 =?utf-8?B?TnVaWCt0aUtNZWJTR1AvRC9MemRoU2pHaDhRRDRrSno0bjNrZExBd1A4eThS?=
 =?utf-8?B?MFJTdWc1R0NkT1FsajZ6YmlWVXB0T3ZFMXBaYTZ1enBpOWNJdHdFUktCV3I2?=
 =?utf-8?B?K2J2TnNXaG9PeWs5VzllWU13MkJ2UnQvV3NLcmFmZ2VQVDlvMGdQU2xPbHcw?=
 =?utf-8?B?dVJraGExUzBlZEkzMUVCMGZ6M2NIT0dtK0VPM0ZPQnlhbVd1RndQaktCdnZK?=
 =?utf-8?B?M01HaWhvd0toWm9rNVhYRFEzbzJXUHpZQ3AwVlhEc2loK1FyQk5RcXNUbDlM?=
 =?utf-8?B?c0JWbWlXMEk2MnJhbkhuTkZ4NDBmL09CZzlkRjltSDFRYXdlSVUvZkhsV0tK?=
 =?utf-8?B?cnZ5VGh3cGlJWlJrZmVwZGM5LzBsN3g4eklTMzNiQjV0TElMTHZjZTV2TDV5?=
 =?utf-8?B?MzdFblB1WDJSMFRSQUxIWW1IeHdoc0l4UXoyT3NrUUNXZVlMQzdWcHdlUFdP?=
 =?utf-8?B?a0FHRUxiSXZJMVNmTGdRS1Ewb1JpWHpQZlp1em9HODk0Uk0zSEthTGkwK2lu?=
 =?utf-8?B?b1hnZFZIdEtpREVzbUs5MnBIZ1hUZWFTK0cyZnpjYTlrMHVjcXAyNEp2cjU4?=
 =?utf-8?B?Q2xqWm5lbEF2dkpJZDFIdWQyNjhrcGEwTnU5YTBtaVJoc2RGeFQ4Y2ZUTXk5?=
 =?utf-8?B?ZjBiSUFxbStBSDgwZU1aMkxrWnZ5RE5NNzE3VmtaMnE4blZ2U2FEditJVXpa?=
 =?utf-8?B?U3ZLNS8yMEo5eUJzeExqSzRsei9WNkdQQTdBdVE3QXYvMjBTdVFWYWxPNUJi?=
 =?utf-8?B?UWsreVpRVTlQbTVjMk92NThRVzNhK3dBOGlVU3dDS01RdCs3MVQ0S0VLLzQw?=
 =?utf-8?B?TC9aU29FQ2dLUVlNdW54ck9sRkxpUVpkdDhUU2dLVWZIMnlKaTNWVW5WcHZi?=
 =?utf-8?B?RWsvWUFDQSs4SmhQMklHSURlU3hYL3hJMWVVZVd4Q1VrYkNCRm94dGRENk5w?=
 =?utf-8?B?c0JhWjlKL3pydnB6aTRaNGRPZjNqUzZsTm5hdStvOEc3SG1wcWpGeFM0TXlH?=
 =?utf-8?B?dWZ3V1B4MzFHaktTWk9WbXhoQWI0VHBjdGRaWFk3NCtzN2NUTWwvLzBFK2cx?=
 =?utf-8?B?dTJ4b0NmcjBPS3NzTGx6Tk5iS25aK01BQ2xQSk42ZTkrREdWZ2dVV3lBNkFT?=
 =?utf-8?B?SWhVUGdabE51K3AxMEtVYmx3c05IK0hTamh0RUhNcjNqTnRWdzV1ekVwWm5F?=
 =?utf-8?B?UDkrWjNjNzJCb0Mrbkk0ZVQyakFWdUVGVmZpS3dLcTAvMUF2NlBoR1lxNkJx?=
 =?utf-8?B?UTlWWDVCeWliN1B1WHV4RTBuZ1NjK1VYTzBBSzFheGh1dlBXd2N1OHc3QWgw?=
 =?utf-8?B?STBsRkowZ1ZtSkd0Y0tqNkVoSG5RWUlJRnFJSU0ySGEvaTBOSTZWeC9BRDlj?=
 =?utf-8?B?TnhPb1IxL3dJc2t1bU1jNWhzRWo3UmJuaTBwZXcvRW5DdUtFV0c2UU91QTEr?=
 =?utf-8?B?bkowcXA1V3phdlZJWjNMZjVOMTRsbmlTNzFiQXpZcUlYTmE5bk14UTNUbkVv?=
 =?utf-8?B?emdHejFJMjREdHZQZUxQak0wb3pEL2hnNis2N0JPajhYMm8rWTEvMDgxT05V?=
 =?utf-8?B?eWJCellYejc5R0dEclBHUjBUTmNUemxodVg5YkE3Tk5FRnY3a0RIWm5wZDVZ?=
 =?utf-8?B?bWR4emxFR1pJYjlLcGZySTJqWnJnR1pYanJ1RFlVdDN0REZJRkdOUUVRakE0?=
 =?utf-8?B?S1NNeW1mT2V3S2MzMmtiNFp1eHVwNlhwaGdlN1o2RzNiY1lUMkY0RlJuV3RM?=
 =?utf-8?Q?UhyAMQpfjgGFA4AVdtGboOPPu7LEN8Bz3Xu0Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f62dd4-5318-4325-a612-08dedba8daad
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:52:20.5580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNQsZbigwE8sXJpu5UPliy3X7Va71GwmPPVUzkXZYm8XssbE6mg0UA20K2I85JteabsVQ5GsFUsEB7FxvDIXZ22uZ+ymo6OtaYTgmt1eatliH+2ypZu8vaTUrcPNDPa9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11230

Collect some small update and fixes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (4):
      arm64: dts: imx8qm-ss-dma: add lpuart4 node
      arm64: dts: imx8qm-ss-audio: add spdif1 node
      arm64: dts: imx8qm-ss-lsio: add lsio mu6,8,8b
      arm64: dts: imx8-ss-audio: Fix LPCG clock indices for ASRC0

 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |  8 ++---
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 38 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   | 16 +++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  | 29 +++++++++++++++++
 4 files changed, 87 insertions(+), 4 deletions(-)
---
base-commit: 31bd73273b9bf03a3fe32227b417f00d4a94c6ac
change-id: 20260706-qm_dts-043646b4675b

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

