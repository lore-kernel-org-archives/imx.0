Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00733C8C72
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536927; cv=fail; b=SaIjKpb+KbVZuPnRk30udJh44Y5W4mEnuX8L4cA/rfuC0zQMSHXKLHvhgEtGDdTcTH9WqbIsogaOBelTvJwHE5/xAisPd3bYLNLkTy8Rgg2BUPqkyT1HlyXawpZHT1XGxZxtEBIl8pEIkC77TfJ7h8LMNirQnwrRF3dkk0Y2D8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536927; c=relaxed/simple;
	bh=4YRLwLRu2qDMdgqQqfzep/T1R8eQeV317f3Wjxkik6Q=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fsOfHWqLDEHAEGlOpMdFHc+n7RFkH9qQup1+9245h2xZoHVc/Bc6bb/r6s5E18E1hctw08GXfcjG2C7bb3w9FPME/nzx6s049ElRpNBZeaFwIOpZl8WZOCgxj6/xuAe2WdRg5z6YB/SvcVgjcYj/bg8RYGXzz6rUq4XTJPqwOdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G+vynQyd; arc=fail smtp.client-ip=52.101.72.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G+vynQyd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=batoUB1KpdRvwIthZLC0OS3ICNbzeI6vNmY8Lh7wWf0uOecd54cFYJ+eaPzt7xlbmUrHAWWthMpV65dgc0iHzpzfzSjpUoq1KXaplljQJfe1nfSWYZpQ4yulCIlJCzRv58Bdi8wE07+/fvdS+6gE0NLFi8ssDIp+m9liTGRZnfbT4mtRwv4hBzQw6C+S17M/zrf90E9EHaoG6Np4mkOW3vEkFOmOGaLB/PYbcm49OBV2YCsjAM3Jb1JpUBNYEW3dohkpGhmDCyFEqK8GuQWhwTJdyqvLUEZXqvCws5h6kQKA6oFsbZxviQbCz8knBCYYtQZUsRDHcqfE10XBEirl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flLPD8hs0dX8sc7DNhipbvmcE8yBTRdkYNaEYIfiY1I=;
 b=KHEQkYeQzQhj9boeRq6MgIrJwX5cmKvb2EnUQ/6jHR6MumIS4H68/q5vsfRFtNPWIkjuVK1So9mHzfQ2/GnNsn9pwGIC2OXtYA2lxSbMgsSL9+72wGDTTF85tZyFeii986TeNVwM3h1mjp/no35kkrjKRiV8QT3YtDYc1SNzKUTCvjK5aYQD85dnQeE1WDsAP5+g64S5Shi0od4quEj8ysxVyBA+AU/9gukwniy0ddNQXt0Neq1Frbsr7gk01WFmXuTdT5qtEwzaaVlIF2sXvPCJ7hQTrBYxTuzFJ7j4ruIATuuUulF3hQUCUFebHbT86vTss5jiT3FTAmjHE+8Mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flLPD8hs0dX8sc7DNhipbvmcE8yBTRdkYNaEYIfiY1I=;
 b=G+vynQydb/4O6MyN4BRTkeA4iz2aqLfKGc1ZksXWSkV1zibpaoGrtB7aOH1JMIwMxHENlttGEWSGQOlvkuPLO/35mDva7353/EPMotaOiUG697ZRETz/XkNd2cpxRZBTYgQqQ6+drg1rwWFCN+Zpnq76qChsaB7hJ98ygnYevwx28tw552vVsy5g76JdrECHCkaPzXQ6gs7nd5YzVCEA6l6mBOyLYI8iPXqvVWMlVODhg6PByO1pDAZJEpaP9Tsntp8WaqCe+MYF7F6KfKIQnaq/RLT3DQYs9y2AOQHr/Xh02zQSJ0rvk+Zm0L4nzAbfK5mrTyMFzlpBik13B3Hv1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12130.eurprd04.prod.outlook.com (2603:10a6:10:645::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 18:55:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 18:55:20 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/2] ARM: dts: ls: cleanup fpga related CHECK_DTBS warning
Date: Wed, 08 Jul 2026 14:55:12 -0400
Message-Id: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGdTmoC/yXMQQ5AMBCF4avIrDWpEsVVxIJ2MCJIB5FI765Yf
 sn/3g2MjpChim5weBLTugQkcQRmbJcBBdlgUFLlUstCzCz6bWiFxiI3JtPKpiWEenPY0/U91c1
 vProJzf7OwfsHUMtZZGsAAAA=
X-Change-ID: 20260708-ls-fpga-7e86cc472d39
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, vladimir.oltean@nxp.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783536915; l=639;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4YRLwLRu2qDMdgqQqfzep/T1R8eQeV317f3Wjxkik6Q=;
 b=MMazA7ALhmws4dM5U7o1MHZVbZ+4S9NZfOicQc15C+Kz9wilgRF8Su4Q0GduMGYISS2KUl/0F
 lGIattoMFuWDI0gUMNP710qE7ySl7N942nZoAo6804x/fS/DLQItI0z
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12130:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7b64d0-5ae0-46c9-9353-08dedd227571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|366016|23010399003|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D+vri+QiwVNhCekWTF7/eCfUR0iUAYvUfzDisHE7irwcOLXH/e2NCjrpE8eMmb/3FCebQWJ7SGqfkBW/h1cCgH2RzhinE7DDwOW9eJqYhQJN3CqfyU+OyRyYvUeoJIupbQX1AHwwR6KEkary3kBdYP3khqDcwCcVNACja4+QkKAggpqh3psKCSJLVHJOy2Bl6YQdOLsmRzrO1leIGK5Mg3Zu/F6HcgRJNnWh7S/uiKWGNp6SQBWuIBgPqV2P2bQl7YDCzWe8Jsp0+k0J44QtNP3e1xhxguarDINlIVKDl9vyT9xPH+PN+MBHT1GRZ6AIZeaFDPKYkXazNkVjD1yQHEOnlmyiMnSs16xzO+lCvDBHItWvlhM73ucqgRe/UDjhE7k/YLbf1d3KsxU8zkb0uaW04IToBI22KUV+7OHqdFRLMIVv3RlOBjgztcWllGsdatZpoItJ5ILdvR29cAtkUPv7+qS1XWhQnS6bA7Mxij+3OCKEVHlgMzhOF5tSuluAbDKEW632oGQLEgt7+qQpTk1ABVLqn75OZqefC/XOWGfncodrjVgu47uWf/mIlwxdRPZ1hHDdUdy1/yk7ZWObbX8mv7qsci1QinTMOudkqJJSZS4cCs/27A9BQfXq0lmZtF6N43AX2ZJcBtuJEXv8F2QBn9iXOq2PpG0h3gApVrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(366016)(23010399003)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmoxdEtrT05XVG5IOXhrMllVRXdGaUhRNkQydHp6amIxV2tpdnVkbmduNnhM?=
 =?utf-8?B?azlQbVVTaUM0WjFkUDJDckMvRUhWam13VmRhcm9ONHg3WTRjeXQ3OGZkNW00?=
 =?utf-8?B?U1FqdmZRaEJpaXZPRDBrZFFYNytHc2I4NFJEdk1WRjBZMjVRcWZoR1duVkR6?=
 =?utf-8?B?VlFDMmlvVE9qdFdhV3Z3QmxTKzJpZzFQdDhaT1JOYUNzdGh2cUF1RFZYdWFJ?=
 =?utf-8?B?M3BkbjR0b2laYmJia0QzSHdZRkxRQVo3bTNUU01CSXorUXJnWDFpUk5TRC9x?=
 =?utf-8?B?ZXoxQWhPQ0pwVjFLd09DNnJFS3krWmtjTXRnYm9VdXdEMlVJd1h4TXljaEgz?=
 =?utf-8?B?TlYzaFcyZjhIc3JlelFTYkdHTGJXZVM3THJnaVF6WHcrQ2huY2lGdVFKM00v?=
 =?utf-8?B?akdrRk9yc2RkejdVaUp3ZnduVzZlckZxMW5IY29sVlpPT1JXZVUxbUFrcUJi?=
 =?utf-8?B?KzY2TzFUSWdvSS80ME9meFpteTVnWERZcmEyMW9pN0hEUGFNOEYwVVZpeDlr?=
 =?utf-8?B?S2FHK1ZYMm5aalYxUTEyWUxON2llczcycTFuKzBQMGVDUzFkejdnL2dTWGpO?=
 =?utf-8?B?dGl4NDAzWld5QlJ2OWxLVXh2UHZZSk1IMU55b241STBGVzh1eUZnazJpd3R3?=
 =?utf-8?B?amN3UXc0YVVqMXc5Smt1OFgvU3NGakc0ckNkKzdpdG0vRnFNb0lBTW14TGpM?=
 =?utf-8?B?YUFxRWtMRXN6THlha1BoVDRWOVVoaEx5L20vTzQ1emlQSWNtdC9TOTFkejBK?=
 =?utf-8?B?WGx1cHJmS1pvdDZ2ZzlvQVZpK1NzaGwxZ0dqSG56R1FsME9yNGNqai9hYmZz?=
 =?utf-8?B?YTU1Q2F3bVlEUzV4cTVvN2JxSnZmTHpnbk43cWZtVXZNVE51ZnZVUWZQbFhY?=
 =?utf-8?B?a1o0a2RXVkJpNlRibG10YUt4cndNZmxQeUthTkFPRjdKZmkraEE2ZWhHcjhx?=
 =?utf-8?B?R2ZvQ0tsS1BxNVBwS3ZDcnNMWnErS0xTalR3RHBRditJbzBubFNtUTlxKzJl?=
 =?utf-8?B?MERuVjRVTzhBbHp6WHFCNlB2aVY0UUVPM3U0U3V3V1lMaHhReHR4RnZUOElP?=
 =?utf-8?B?RG9peXJoNkZCV2M1M1ltYmlNeWtEYXBGN1dHM0hLOE5ud0RDNThCaDNMbDRG?=
 =?utf-8?B?N2Nta3lSU1RQMHNwSEZ0ejl0ZnFTUStKcFBPU2NLNExXOHZDTzFBdzJZZlhs?=
 =?utf-8?B?TGFydmpMWWNCQkNKYTE0d3BrMk9FcFdTanpENHdNcUFEVHhNa2V4aTNZWkw4?=
 =?utf-8?B?TmhsNVhidFpENUJQMnlwSWxFRk9UODhvMktVNythL08yNFdhbEppUSt5ei9F?=
 =?utf-8?B?c29tcC8vK0xaZFZydGcwaFo5V0NwcnpOMmVnemJVTVZVQ1R0M1BMM01WdW5v?=
 =?utf-8?B?RFR6eGl1OC82Q1hVTnFaVlZmWURDelNYMXExQUdPakNCSWxTRWswcGFRVmwr?=
 =?utf-8?B?cTl3SU9IektyaEFhWWRwWWRwVGlwTWduVjdUOUJyenR1b0FYK041OGM5ZFQ4?=
 =?utf-8?B?YnJHTHJhTk5NOW8xc2VXRHVRKytGblNpck02YkJrZ1NyTS85V2VndGJDMVRZ?=
 =?utf-8?B?WXk3NU95SVgyU2ZBS0xoSjAxRVREb0hGUWpwOE1pUUdYRGhUQ1oyWkZBTFp1?=
 =?utf-8?B?a1dVTFlrS21lY2lnSTcrcXg1NXF3RjFEWDlSU2hmclAyTU1USFlnR1FYdEVD?=
 =?utf-8?B?K1BKejNGcVJEUXhjd1pZWXNORWgyRXJlTWZORkp1d2RLMC94Q29udnAwSmJr?=
 =?utf-8?B?NUQvQU0vQ0NTRFYzR284Y2wyYW5pcm1hdEhJWit4dVJKcGl1a2k4NnU4NnZu?=
 =?utf-8?B?WGw5eFRpOERyc1JDcEFXL0ZDa2lKNGRaUncrYXhyVVVmVWpDN0FzYWptN2Ni?=
 =?utf-8?B?eHh3UDVVVmZIU1VLTWpYRjlqOE5qTnRqa2d1MDRqWWZCdXgzVFhpQTAwUGlR?=
 =?utf-8?B?TWZnbkc4cUxwVExFU3VuN1NYenRKY0VFbWhHdEtwNUpYalRDdENqUUZNRGl4?=
 =?utf-8?B?WlllZ01UaGFjbW82ZTZTQUhBeUxRVDJrclpBN1FBNktVYkpGK1lRSUN6dEFx?=
 =?utf-8?B?clNBdTdxWUlidUhTQzYyT2JNY01LUXhkOHNIMzdlemQzVVllMVdaNTFuWDRB?=
 =?utf-8?B?YXJqVkw0RGZ3cWpPczQrbjhnRU42NTdDeVJ0TXpwektML1FWd2pwTExXZ1pL?=
 =?utf-8?B?VWVFZ1lqWTJpUHpOUmxvY3BWb3ZwTDRhSm94dkRGNkhSM3QxS1dZMG81eEJ2?=
 =?utf-8?B?TjlsZW01WGRSUk1UOUJreWlqVHlVbk11SDNrWkt2RXllYjgvblZZYjhWYUVI?=
 =?utf-8?B?djU2QUg2NitsdUZYNVRPNU5oaWo0eGMybFZUMSt2NjJGT2U4ajYvckdHeXpX?=
 =?utf-8?Q?uTDZQGGay6oE0DuITkJLHiU9LGKTf09ecFSpb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7b64d0-5ae0-46c9-9353-08dedd227571
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:55:20.3899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AB+WDjK3wL2XynGpsD16df5a1e/2JbdUs80n13MoTTP5RlqGbeW6gq1BlGMtiuCb++QY34lfkaZcDV/9So5p5QoMR0m9GlUnneMBp7YkQ7e27MtjWLYEWQ5qxMDc3zW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12130

Cleanup oneboard fpga related CHECK_DTBS warning.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      dt-bindings: fsl,fpga-qixis: Add fsl,ls1021aqds-fpga compatible string
      ARM: dts: ls1021a-qds: add compatible string "fsl,ls1021aqds-fpga" for on boards FPGA chip

 Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml | 1 +
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts                    | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260708-ls-fpga-7e86cc472d39

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

