Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3AA34C121
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510013; cv=fail; b=u5kcDraV//PkI67PsRKrz1Ej1ruQt0+CidbjvyaZMk9lbUY14ThNwDrLOn80msEnwHIOL9yBNOznXamAiOV1eVbIoAxiHt29Gd9J1vRzB9jVweCP6L253WuhZjIwRo0qj+V9o4vADjV58ezlMwJZOWAP+WDBO5dt//ww3sgB7XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510013; c=relaxed/simple;
	bh=9TJN1qOymIfDCBHcsNzgUaXTj6dWt9tUUmiQ8P6E7VQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ixRYmkM8LajSHYM4+RCgZQ3wV5kKXQx+wMMxytDj+2HUP28I79JHn0wxylvx0UmxlnX4hecZQtyQGF2Xd9fPmVi4ziOYg6690c0pqrJhajLiSDNdPIGqYznFWSpkXuJO3db+6+IHBQsnBJ5gWodQ767h6LhReaBFANwrBeBpJ+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZZafZssm; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZZafZssm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7PAdBycBoRfh1CGWBcT/ur7sKHqCkV1sFpeWU51SmPk+cz8i025Z4nWI46RhzRp5TRjbkCCT6fcZ1UAMkAo6x5zC0kko1izz65uoEyxv2YSQbiCDTDTk3qpg3wYC7TBB8M26BvqUVM2AAjGhMWyalTIk/5jDu9o7czE/80zRPyoBWCoWd/jZjkq8Ukjmj2mVlnNLBbKoglLsNegPPel37NDS4wNt4zDGobrSDSBA3elqXHBkU8/afejrYDm0Bge1SHEgz0tKvS1moSPJ2D3wLiAMuu96sFo13KW+gNQPgkwqIJHQlUStHj7ONBsqHGm5Dav7LZKAOLGhlc7k2av9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhIVWUoh+PZfIFXyeQoAiRi5zdtUoRd9J9cEJuyogqM=;
 b=lrClyXs2VZ2Fm6WhEzIS/O821QgRl+x6v9cn5rROWYkQmsPgi4PExuyhp33FhIhJt3FmRq/gPAOG5KTZR3Y5i8K3zSeDiDqdQ1uRHs03xhnGFj1kcxP7U+gME2s6hSLDQGaVIDSYOaXhlwPBUSaZb2A9qg727KF5nHvPCLd/IlnY1rRo3TE8pKYdvtTzbaDPExkTvvzjUcgxbYcceKiv2BVABU3U4yoI4cN6jgzMI29y/n3iC1/9Y+nh6QzPvM3aMUqtKuYm0AHXDxcHMS+ow23W3hacRoQoFT5wncB4dsjF6yL3LMdsbu5K5gVXOd+CXC93Y2zBVEq9e0ZACsIiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhIVWUoh+PZfIFXyeQoAiRi5zdtUoRd9J9cEJuyogqM=;
 b=ZZafZssm1aCEofg/DH3ypAUVzyrEqKlwntAhX4Y019DRHm8JbHGKus65nmSe/Xf2JOpc5T4wXsOeSvJisr0ScGtx4QlPo7HOPigZwgZ37D7xOElzM3bw8y0DKH6UXrA6j1pBq2jGp9TadGbizjsMKG4CT9WcY21nOvMV+raY8kk4mgcUbYYN+/t7eAJt1RcZoYB4wYBWmew0mcSoheIe+LpF79zPJAnouo9jJ9M8nEjpEqjwGLCB3SbihC+Eswbl6jsZOVG+Uuj30zsrbTYPTDa80oNTzNyNcP5AwQ3QADsaqCGPr7Go7Hf29+tI2D8uPRsUIpeDsl0v7wB4MHbMNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6778.eurprd04.prod.outlook.com (2603:10a6:10:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:26:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:26:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:05 +0800
Subject: [PATCH v2 01/12] arm64: dts: imx8mp-debix-model-a: Correct PAD
 settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-1-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f59638-3405-4650-0656-08de8b08fcf0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 T/MB6llZheI878EKkrGcG3sA7GvBgyISjeQUX11enehzhJAmTh1v92+Q5VzXSTe2d81w6peYkyIOTHgCrnHIH9pFY0ilrjEIwzZxtGqLskvKMP/OfAhE96Kc+U4hoVtZfD0dDMUpL6S+IJV1UIPzzDU9VRb5VwbmCHzKIC9HhSl9F9veQ/p35M3vtUYe9QK6k+FF4TmvXLzKW/DujRc3MCwoZH6Z8GZxGKiYl68UDtsnPjMjKIVtmQWJuQkSxYEos48mKW+oyAXbBL+eXWjvBi7cLPY/peeYvr80CVvnczBjzUHBzjYZyfDX74+fbTBiydEgYTiG1By9nX1CMeRa9x+eUa8dtSIK6XRB+1bG4n48AZT541qTrexuYTiE4+DmlJZL/Lec4E3O7riXbgtdpiYnVedHbh64KjOc0FmKfD0FcjxqGTcMIKiHgcosrNqi1hOWRjuX3Xj/JoRVtuRIdIXHjjiG4u0GyO0f6t6J5Z9Dt8YxaJkTWRyoG8OMBUDaBTJZN9IchWdkJeeacIGugFK/yjZAQI8fNBwQKEm1mCyIxvutVVtSciq6qMML8QN9kNfLZXdksbKGyFqrwJBCItqN1PuoWZcZhJiwLAmQI7n2geuqhNQAewIxFXXUTKkaMgdpiSAZQHFJUr7LZ0WH4pkySflGsMrNFT/M8dvGayasBjKraOyWA4+UwGXVz2ezurNe5zEQL5+f07r+1FaBm+spPiX636sL9JIJhIhxjfKhd/TibjuDJ4p9s2ElK8L/LUkorr/Zzewyh5uXyKfJ3oBkdd2TkIy8r0TyBMz6WMgJYz4st0/HbEc3K6xMV/sk
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y0J4UU96SDFxaGVwZnhybmJ4djIwc2p5Y1F6RDlKOFZxTUlWSWFKcndvZ0NX?=
 =?utf-8?B?bEV1OEpqbTZ3bjhMb2MvWTc5dzI5ZE9SWUdDTjVqaEZsM3NzMUs3cGFyaUgv?=
 =?utf-8?B?RWR3c3pMTDJCRGJWSXRkQk0rdEVCSFplZERNbzIvaytyc2wyK3RMbzA1aDBi?=
 =?utf-8?B?MGFzQU5SdU96MnQxRXhScGhOUDR0VEorTlRKbEZOR3ZGOHdpUVBDNWI0OUpQ?=
 =?utf-8?B?Lzd2M2Q3OU5PQXJ6ZGxYY29kL0lUYXZmQXYvdHlLZXhOb3dMaEprM1RGTWZp?=
 =?utf-8?B?YUVGbnl5WWJqRWVyYXlKZTgrTFNnUDlUMXNxU1VuNmsycHAzQTNXRUNZQkQx?=
 =?utf-8?B?aGRma2tCK0w5R3h1TFZ6cStKc1RtUkhYb3pvUCtja2FRZzBFZUFMd0ZxWW5F?=
 =?utf-8?B?VkdCN3ZTalVPWlkrYm03NFN1VFdLbm9mWEpxSDZQbmttNG9WYmd4cFlxWFZs?=
 =?utf-8?B?SnRkVnJtMXlaZkRFaE05VGcxbi9XUHJaVHZ1TFNFYk9hbnRTT0N1WU4zRVY1?=
 =?utf-8?B?VjFZNG9iY0VqVjRXWFNWUDhiNnNFN2YzWG82aE1IemVEVDkyc2ZxcnE4YXpa?=
 =?utf-8?B?UzdqOG5FZEovZjZ2K3RaQ1p3V1dzQk1Da05OSnl6NThKSFNWMFh4amFTTVFD?=
 =?utf-8?B?OTNBem9EbVAvZkRjdmtUdytXbkpzU1czN1R2ekpiaXNvakZjdlg2NGlKTmlS?=
 =?utf-8?B?RSt3azR4R1d6ZG5Ca2Y1L2FPSS8veDc2dVNPbGp6WEQ2WVZrVUNqa2tYaGs1?=
 =?utf-8?B?OEVzZkJqajZsTlRUd2x1dUdOMjMybHhwellYOXVLT2oyK3BObWI2RGJpUk5s?=
 =?utf-8?B?Z05mK2J4aUt6OWxVUmV1THphVXV5a0tLa1c4Z3FJUmZtWkErbTBraHI5T2px?=
 =?utf-8?B?MEVXZyt6T21uT3A1YlNTcVhQZTNpRHhUaFJYMnQvZlUwYlZERzc5UnJMdzlp?=
 =?utf-8?B?cTBIRWd0eFQ3MVAyUlVXVDE5UjVlZ1d2TDBTaVptVkM2dnFwanNGY3lWMnBG?=
 =?utf-8?B?MEhuem5nWmloQ0h6ditvUkFmRjk1QUpXNXBXUGVZVk12SXA1MXBvSS95YUtk?=
 =?utf-8?B?blYyTUo2WXFIRTlyZnhKaUJqbjdkQ3pXczhadXRrZW52T04xdHhzNDJ4OUVS?=
 =?utf-8?B?bEQ1MTAwMXBlRFNNY2lTemttUmV4QXJEVHR4U256Q004SDVJcHFCMHlpS1Bz?=
 =?utf-8?B?M09RK3Z2R2poZlVsVG44QTJ1NGlVNEkxN3QxNkxESXQ4S3ZxWUF1ZVVrZERn?=
 =?utf-8?B?clR2NkJrL1YrbW50MXg4M3prRGtEMUwrUTl0bTNXdi9QcDIyeXpnVWZqci95?=
 =?utf-8?B?RWRZOThTcTJDQURYREpDTHhmK1d2ZWpHY2ZtQi9rOU9JalBKaTRjaHI0WFpC?=
 =?utf-8?B?VkRSZ3NmWnd0cFN1cDA0d3B0NEdIT0JGVTUzVlpudHV1MlhjdUtwR3crVStL?=
 =?utf-8?B?Tnd5eWpJWnJwR0Vlc2htOU4zMjNRMi96bVRjUkZiZU1Lb1BwNFM3QmpBM2xs?=
 =?utf-8?B?cG1GNXFwSnRlWjloUGhEZFh1enNuWTU4dzkxSWlYcWVXUk9WemJzYmdjQTFE?=
 =?utf-8?B?ME01WE02NXNNbE5NUTZmaVBXWWxTQ0h4SjRQbkxtcEFsRVNyS2Fxemx2OVFR?=
 =?utf-8?B?VGFpeDRCWWIxZlEwY01DRklRQ1FMdEswNmF4VU5tZ3NqZGN2TURudlhiNVhU?=
 =?utf-8?B?WHhkWlBsZ3VGZnV2N0NZREl4UVdCN2p6L1BVQzJ3ZmpZdlN3dkMvVGVZMzRq?=
 =?utf-8?B?L2VxcFVSMUZSQURWa0JjdEVPWk5XK1ZwcXVRRFJwVVRBOWd4QWY4YnJQSlVw?=
 =?utf-8?B?alJsRlZ6MGVlZzM0U2crcHdtcSsvN1Vka2RlMFE3VzZBRm5TMUhpc3N4VnlB?=
 =?utf-8?B?S3orcEloVjZWZHZGTzN6bTVpS3hCZ2F5NG1XTkR6SU0wVTZYSGIvTE15aHJ4?=
 =?utf-8?B?NzVKZFhSSEZEY3FUQlFxZU1scGdudnpQQnFTRXRHSWg4ZnJCb0czYjh3TThs?=
 =?utf-8?B?VmV2Vk4rME5aT29qSW9QT1VhUEVwci9iOHlpd3piTk1CV3JmV1hsN29DUG9n?=
 =?utf-8?B?Syt0TGZGTWNwR21UWUJUdW5zUFVWRUpwTWIzYXdWcmlTWHFHT3UvN0QwbmhX?=
 =?utf-8?B?V3lkS0JiZ0kvS0dubmxvQTlsa1BtOFNVUmRlMkU5M25LaHBPdVh5bDBkemRS?=
 =?utf-8?B?bWg0SzJpYWtNRmF0a01ibjAvRFhBaGFJOE4zY0lrendBYWRBaE1QNFZFY2wz?=
 =?utf-8?B?QjE1NlMxMmcxZVpPd2QvQ3hkZ0d2dTI4RHZZSkwyczRZLzRPOHZzR3FlYWNu?=
 =?utf-8?B?M1ZPRGRDT2M1ei9hcnFXL3BHaTEyV0lsa1FPMTBlOVFtV1Y5eXp3dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f59638-3405-4650-0656-08de8b08fcf0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:26:25.5740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r11ptBAUKztemV5ilE5sPTRrUMJFY/JQm7ZQm9P8Uo7HXW2lzVxRzcttTEiDA4ja7QoeM8SXlnIlQIMmagV+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6778

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there is interrupt storm for i.MX8MP DEBIX Model A. Per schematic, there
is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
PUE and PU together to make pull up work properly.

Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix Model A Board")
Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 9422beee30b29c5a551b08476c80fbff96af3439..201cf7f5eb0ea0d6aa60c4fefffc5d0052224d08 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x1c0
 		>;
 	};
 

-- 
2.37.1

