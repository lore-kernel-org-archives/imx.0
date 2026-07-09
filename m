Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4E3A16AB
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 20:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783628998; cv=fail; b=N1+34PNSrZrvD5a9MUYAcI/nMk7fr1FyOauHyudOnIkb0MYch9O+TVlrngHlF/ChdHu6lRk2Q2At3eXuL8Is/NBCfIn9ajo46UXjOPGr0cqxY6/Pb2zUHaYvu6sVfHRBM4f5Bxacg3Y3UV6BVB2ZIASafGXlraVhZj44Sk1mqLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783628998; c=relaxed/simple;
	bh=74m/F6wlHA0zQaHaha4quZrGPqMtR8vEZE9eDrtavSQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Y8r1NsFYx98SEnt6J9wJXZM6dhNBcjhHFJDa1Zs/o2pS3wOrX1CO7Zeg7RxUTOjioQOWM7VmmTbQ3gv6W+MU0iGL0OT4S1sLxzZ0ovf5Qd5r8IcrZC+PXPpDtelJqRPhPXBruRPTx4FPwBT8BOtFalgO1/h4/7EINtEJzuAjJ1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L/IKHd/l; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L/IKHd/l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZG1dYKLKtGNEZuHzwlqFTQIogE3GKYzYiV+Sl6nAbLNuP5pSTK48i32R22o6HMhsaX/B1HcUcNYHVTT4g+NSQ2P/mqe4r0rw+3dYmlmF5dIax8h2y+wjqk0gNQmc1iDYNLSsN2wWX/kpbl0JvCStjnZTO9v+6P9ja+AlvdVfARCo2JoW1sGafiuFO2+HkHzZrjtG+8GTsrYkzPlGQcz1lodJHhk1JE51A2LQz819+z3xsGa0M8VQsbS/14oHNieXlENqeQp9FObzWSho3NELir/UBxneoihoUu2JjppCcnscZ38IIq5AndwssH0wPY+0uqAa/h57GrzEMXnXfCKE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/DWIjUhhLryFkb1gmSDF7p9ux6CXlZXy79Hsf+JYpQ=;
 b=Cchl8GFPcMR3ku3wj+za/33d183253dWJFtIl3aRSfRVcqPTb+syut4NCv309f1rKHO2iIcdKauWkryth2oEoSW8Q9tV84aXss6HY2h9tEpYJDCdeDmoeB73jQCVaeZe9CI7R8iW7zIUh9GTYOvZlNYK9VEV5G0KSoGtucouV5rRIL/um7pzZtILb0v0Jm5zm4R8davCwgXVKuKS9r2dRYQMj62IFiO7KJFNXIwYU94REXMCoFVBwmXuT+LtMGLSghjdnUgJHxnQmJ1yKvPmeecKPvrK1d841fskm/6jRBskwhhv7oBhUzBLrhGs3n83/5ILPopYcYVKGhZ8ngLbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/DWIjUhhLryFkb1gmSDF7p9ux6CXlZXy79Hsf+JYpQ=;
 b=L/IKHd/lx5h2RfZnrHy3D/7V1Djxah4VY0wcC/8YyWu5PzD8WP3rxbumZ9Tu04Pztv5B9Mh91C++4pFyWoNlyVv6/OEXh1PfS6lzwTbNpMoBoK/1YPLyeV02sb2p+SCPmgd7ToAmNXTc81wUOp94QuYeeUhNgrLoKhUKs0yNysdZ5gN9Ufoc6M9F1+TcShscKCE1u7ypb2/fve5IGgvLagxykdKfXBvfSdJeUvMFChaQRtan9XoXrdm/Ny8FoSoKXQVrjZc8vMt7hy/wHNgiR99UF9UkQ4xEq4IFTLaX5ISRGMfqOzciWtjXO6mo7TIFFAIu+6hfA+fQ7jfz9oOmJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11886.eurprd04.prod.outlook.com (2603:10a6:102:517::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 20:29:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 20:29:50 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v2 0/4] arm64: dts: imx8qm: collect some small update and
 fixes
Date: Thu, 09 Jul 2026 16:29:42 -0400
Message-Id: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYEUGoC/2WNTQ7CIBgFr9J8azGACMZV72EaU35qMSmtgKSm4
 e5CXbqcZN68DYLx1gS4Nht4k2ywsytADw2osXcPg6wuDBRTjgXm6DXddQwIsxNnXDIuzhKKvHg
 z2HUP3bofh7d8GhXruhqjDXH2n/0pker9RRNBGBFGiOjZZZBatm5djmqeoMs5fwEkAVtLrAAAA
 A==
X-Change-ID: 20260706-qm_dts-043646b4675b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783628984; l=1010;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=74m/F6wlHA0zQaHaha4quZrGPqMtR8vEZE9eDrtavSQ=;
 b=XboCHA7gmrLYSJzYvHilQog01OSAh/PH2iNerkLRtjJT6GM558QsGTiuS4u3u2mT49QElpodW
 yT6SzPfxzDICCAm35elPR4o2/NqYuBb9+3JEZkLtMEfnEHuDVY10peo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11886:EE_
X-MS-Office365-Filtering-Correlation-Id: b307fcf5-a9df-44a3-d61b-08deddf8d321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|7416014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	d6+lvTJxeze7vQtANu14yFh2FtoUZrfo6DN+Hlwb49PeHZWsSB0P2xETJUMlk6zkcZeoqdZbzSseZom/m9J3GweRiiY5Fj4hWzU745yuxJWYxaznM9VGSMxGm6Ix8VXZPr4DFvmOTwAws5PxKSphQJ2dnr8l7pBza+/S3GisZ19dYdGFsopRVIEILULI76MX3sfINgzw8EeAKT/IvxnqaREq0kOa7MSXyN6RvCXKYEF5+MlDmL1Ajejl02n9FqnQpi5LVZyxvf1HJ8pP8p5Pd7igQxgF/i9STENZqIIHQtasJN3HWnso+qsKwvHa0NgphaIcvYyW9uIr8QUCpIxtPe7bvF51YmHBkINaRek5xaP2efN07lXcQBtJOXvI4PjnxTAEKfK/wMx+10Jc2MLZ7Oq5qeO139iQoElLor2g/c08kNkeufjvyS+68wjZyPz5C59GbXVVTdFQklWETJ1dEv4LjVM7mvV+10plNH15yHMue49J/0jWlXI35kEVwU+URURrlAFKKx9kBkuKAd0hrNUIM8YG4LRz0eCQVBZ/zOiFQ7dEA57hZs0O3RrmRitcIg5CbeLSmWMfdEWpN0EXggodNiGTLIYtz+QGujxIPMLKzuTvV2pHxrV8mYmLxrGD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(7416014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N08vdHdGSUQ4WEQwNHUyQjY4TU9hcnU5d3BzRzREM0tzcHhxSzM1MHcwOU1Q?=
 =?utf-8?B?TUNUc0craW1xR3J1SnF2Q2IxdWJFWkwzbHAremlBMjJlRUtIMTFvbDFCT3dU?=
 =?utf-8?B?VlZLV20zOHJhNHkzM29mcGxwTGhndEJLZzlxZFd4U0F2N3kvVXUwVG5OUC9M?=
 =?utf-8?B?SUpxZGtteXhWNWtxYXNabDBpUWhOR3Zsbmd0RDJhaUxXMFRXTzJHNTNwMDRP?=
 =?utf-8?B?SWdmWS8wc2sxQjBmMW5IZ3gxM2RqbmZwU0lsT0ozMnZHSlpkamlsY2d0T1lz?=
 =?utf-8?B?dnRsVm0zU3dmaUlYdFAxOHYyY1h4NmlVZEs3ZzdVanBCeDdaWldINjV1V1hO?=
 =?utf-8?B?c1BWV1RiSnZCTnNhUDIxdFduZU0vYVFhY2xueGxpY0lrREQ4SWh2bDNuM3dF?=
 =?utf-8?B?R0JUdXFvYWVCeXpmK1d3RitVT0UzUk82cjhkUTZNSWQzck1TSVkyY0h5dnh0?=
 =?utf-8?B?ZDQ2MXMveS9HM2E1Tk9ZbVpRWHFVblE1VXluV2xGMTB6K1VVN2FNbTE3ZERr?=
 =?utf-8?B?L1JiNngzNEZYNnNHSlZLSGs5VC9NZE4zTlFQaERNUldmRTN2K0YwVlFDUDZD?=
 =?utf-8?B?OGRIdEs0cTVERld2RTNudmFZNUQ1VzlOTjZkL3R4c09CeDRQcS9EVzNLYVYx?=
 =?utf-8?B?alF3MFJra3A0Q2YxQVJnSDFkditsVXFQQVJoeHZjUjQ3LzdXcDhJKzBwVWR5?=
 =?utf-8?B?c3dJbDI0dW1xSm1BNzlPNEJ1c2EvY0JlVVI1VWJ6SUIxVkt5ZkdxK3FpQUVE?=
 =?utf-8?B?VElkWUdNREF4L2g4RWw1YzdLYzNqSlN4T1Zhd3ZBMy9RdmF0T3B0ZlRnWHVt?=
 =?utf-8?B?RDU0N1IwVjJnTXFXL0d6eVZHTUJOMk1sMzBOcjNEN0psaENnSWdIdUpkY0VT?=
 =?utf-8?B?blRGWmFnb05OYnFlb2xNR3F1VlJNUmNyTmRVK1IxWlgreUFrSTgydExzd2R4?=
 =?utf-8?B?dlhFdDAwWWdoZ3BhRmRIaUl1dUtITEprU3NGemNzQXNKcEE3TllnNUV2b2tE?=
 =?utf-8?B?Sm5xRjJubVBUSjNHOU4yK1JydTBkUHBLRzgxdjEvNUpab3I4bFJ3NmtMWFdZ?=
 =?utf-8?B?Y3lTbGpIWWw3RXJ1Y3lFeTE3Q1N3VE1yR1NmVitxVEJDZHA5Q09UMnc5aG9P?=
 =?utf-8?B?UkRmbzhZam5iSm1tRTh1TUJMK1Y0b09KdExiR3BCcGFvZFNvK3ViM1JLRWZr?=
 =?utf-8?B?YzBOZXJPbm1iSHhBWjFFUk1adW9BUVhWWE0xV2lvRm9odDBEdERsblBsYnF3?=
 =?utf-8?B?T2prUUZQRzlPZEJWRCtlaG9DdG4yMC9ZR0dXMXl5a25rOWR1TkVsa0t1Kzdp?=
 =?utf-8?B?dm40MmRWa25FNXp5TGFBemRaM2dENDRucjFlYmVHT2ZSOE4rU3IvUUJTazdq?=
 =?utf-8?B?UWF3UlkrdzBmWllEL0hwamRGUFRmOHVuTGlORWcrTktvdWJhTkFjN3h0cHIx?=
 =?utf-8?B?NTd5T3M0MDM5aGhFQ2xWQkF2S2VsbnQ1MnU1RkdTS2M4dGVFY0Q0ampZMGJ6?=
 =?utf-8?B?enA0L3AvbVJOMDdOQnVlSlpOODl4RDA0c2Ewbyt0RVUrSUl2NHJYemxRanV3?=
 =?utf-8?B?b3JoU0l5YStlNktXVlF5RnMxTExjcXBtM2tqR1paTkFsQ1A2UzVQRkdiVUJt?=
 =?utf-8?B?RkJRbzJZVzl5NUdMeUhMdmtGSlVtNjNndG1RaE16VjdTYmFRUzNFVE9iWm84?=
 =?utf-8?B?MjhoSHVVQ1lCQzNLS3huUXJTR1FDL1F2Kzg0ci9FZVpCUXJSRStaV2QvYitM?=
 =?utf-8?B?eVhlZm1LeE5kSnVLSS9zUVZwVklBQ29uY2hRR21SRFFrcGQyQnFWNXplc0dE?=
 =?utf-8?B?WGpNYnkxOGR3VlZCeVAzQURZeHA5VHltRmJVdmdOOHh0eHRlMm9JWVorYWtY?=
 =?utf-8?B?Q1ZxSFFsSEZkR2FkNmVXOFk0amhsYlQzM0R6N3pkMjFpaHpyVHAzMU5QWk5Z?=
 =?utf-8?B?KzZpNXZQelRoanQ4dS9SR3NzZ1JES1NMSWtYWlF0V1ZsYjYyWUc4VVZ5K0I5?=
 =?utf-8?B?RzYyZkdyS1ZNMi9DZUFHZEVnNE9JTTlJMUZ0NVAzRFpDMnMrckpzQ25Sb3FK?=
 =?utf-8?B?WGxVcmN3eUEvR0NObjhGUkZiRDhla2lDWmRiVDlpM29QMm1kbzRwZGRCdE1Y?=
 =?utf-8?B?ekJJQzhBVXFoS29ncjhHb3pSWGZuZVBoNjhoZFU4WkNoWUVBUVdYMG9PWVdz?=
 =?utf-8?B?NXlGUkNVdlpFMzMvQlVpMDRKeVZsMWhCdzExY1FTdTlRYWUybXBCMFZsTWJL?=
 =?utf-8?B?dUhRNFg1a2lCUURPbFVmODdCTVlyY0tqQmlsdTZvelZ5YzBXTnFSUU9aM090?=
 =?utf-8?B?dnlqZndtQVhGUzV3Nkw1UHBTVHlWT3JONXYwQ1M1ekdobVBINUFESE9MSUlu?=
 =?utf-8?Q?mwmYGY5rUv7bkOEDaFktnS9aALw3frjfeslAx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b307fcf5-a9df-44a3-d61b-08deddf8d321
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:29:49.9845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uh8fRXA7qidxtvbX4x2m4kAHe7nv9xHy4GqbQpcqb4FCyb9FNX+HPOjWgcKvBhDOG7fdOZ8sHyiQOC+lmKNFuZFXQsxyQJyn2lHcEgaZyLaB1s5E13fH9p2hIHECAQ6F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11886

Collect some small update and fixes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- remove two sashiko found issue
  1. remove power-domain-names
  2. remove mu6
- Link to v1: https://patch.msgid.link/20260706-qm_dts-v1-0-14117a48fbdb@nxp.com

---
Frank Li (4):
      arm64: dts: imx8qm-ss-dma: add lpuart4 node
      arm64: dts: imx8qm-ss-audio: add spdif1 node
      arm64: dts: imx8qm-ss-lsio: add lsio mu8 and mu8b
      arm64: dts: imx8-ss-audio: Fix LPCG clock indices for ASRC0

 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |  8 ++---
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 38 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   | 15 +++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  | 21 ++++++++++++
 4 files changed, 78 insertions(+), 4 deletions(-)
---
base-commit: 31bd73273b9bf03a3fe32227b417f00d4a94c6ac
change-id: 20260706-qm_dts-043646b4675b

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

