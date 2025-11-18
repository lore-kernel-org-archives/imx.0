Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E91630EF76
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763454592; cv=fail; b=h8xB2PLKxpIUFMsxnX4+vYyNDZ/dnzn0tNSQm5EhaxJiwXd7ncq5HOJk9Zs+a8U3cm+CYoOzrhbgwXCx3YaiYktpDCIvsT8HLwnaCElvqf5MJjQP7XtzD6MbYVqN7VmWtH1VMU923ZyNN6rnqA6YRp+2+g1EN6Sz4mV02YFK8F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763454592; c=relaxed/simple;
	bh=LPIFGXZbRwmtTYRyZD49EzLuau7szDu3OhX61yiyDeQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AogswYcBxUxPUu55yTz2w8BZWlCOavk0zN7JLA66mknVC7oVQK5S9N9r2GlzIn8z5MFYAzPaZ9njCSWArP/Ka1z6m1mTd+V7iOhedIHlV10LRBmq3EidWXohh0n3d+s50NNic0k3SgndWhhinFfaBhYZqFx17KDMQG1dI1u2RXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W0TvOSMR; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W0TvOSMR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGbfxZC9fUEAwGJivtFRQQKClgDWK18EwXStXqtd7O856KZRBuKLH/EutgeHbxCeyr1OWTb9G3GJYU5WACPyG/c51eIoX05vJdhHdRVCAF13dezRv+k2OwEN6Q3b5Eif2NUoU9UW+38lHYmxf+imEXTgBk+OO7F/8k1XwV+ZkYThVRbZ3UKYbBrXuLDKsEw9X66cGV79aCnfZiTioIG8qSGp/lLlrJ9MUtNYHM5i0n42CQw1OJFyVSdBuXYCLqKvwRjeyX8+4f8K9jLNdGVv5GMYRvrMCoydYsQS7REvyXaIgB5DknReHs5B+1Ew0R7ks36h+5t522dAr18p8tWoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khMFE1730E4hg/f5rmtQAiD723vZpWkUji+0v5NQsGU=;
 b=DRdwqv0xQsue2ufTPOsg/MkVn7skstjB8txfYvns+m4rWJW+45Z7yrO/DA5RarGGmWAS9MtZ04mEMj1apveiATzbfYKjuLLAOTz2Rai7NPy/bWXcXhtyzBX2djaSYAtK3F0FIN0Sp5XJXjGMTwTrxS8ouS5vMGGujTPwh2TJ5fZggZwtyPfl06Pyzzw5ZM+jmAclU3MUs0Ibt4FPPe3LuGGIu7bK8jKKyKE5vkErQYXzApPxWT8QB8H3mmz40QEbwNQ90RrmnylqdJWNrL9QP3/I/JiKj9t5D3yhSqCE1stPQKYgO8mDmPisi8wee6/dGhZjJAa0m2lTw/IGJrBwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khMFE1730E4hg/f5rmtQAiD723vZpWkUji+0v5NQsGU=;
 b=W0TvOSMR6rknsrvTbk8lF1Dx6YR1sb5PYjqdfKZOFxx6u+6xK/bSY+CCyP8h3vGnqDJAokWPiw+jz/xiNnW+tqkPWWiMRiz+GeXpvZTbvbsKq/Trnu1NOH3A24LZHRo6oq7nyz/UOimy9ZFN+HtsF4tCnasAxeo4pEUPXFePpQ6kpm3HJkjyOeerVwF1BaPRw/ML2gttKU2I/e0o66QRZuNkgQmn7U7fxQa7akYmb55ZwTPLCGHbvGXduzflJ0NEHclYsSft0qGXKMCAJOzi3Rs0MR0iplWn7E6Yc12t5kBWZPTCJsii6gbKyksc/yaZYN4EWr9gSbE7iI+Vc2GqPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS5PR04MB11468.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 08:29:46 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 08:29:46 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 18 Nov 2025 16:30:18 +0800
Subject: [PATCH 2/2] arm64: dts: add off-on-delay-us for usdhc2 regulator
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-imx8qm-v1-2-63e226ffe512@nxp.com>
References: <20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com>
In-Reply-To: <20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763454631; l=1132;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=LPIFGXZbRwmtTYRyZD49EzLuau7szDu3OhX61yiyDeQ=;
 b=UC25JaRIn/g2dwl3hphIZMkVsh6siq+QZnhzt7xWzic+cIlmq9TdgZPozYBqAD8UWuQT2Jxl2
 hlhBrTrmoJaBUkFMHeaT4SuVee2VnoDK8MaSX8eHxpvZ34adYdFfHKZ
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS5PR04MB11468:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c60d738-1b3c-4535-6b99-08de267ca16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVhnZFBHYzN1TzdCSHMvMlkvbk1rNFlSeG5BRUVzNlpSQnNyUTYvMkNKY2N0?=
 =?utf-8?B?eTNRVitraURRV1RydmZKOWtLWkZseVJzaW9wQnIvVWY3aGJpWWtXVjMrcTk2?=
 =?utf-8?B?cks0eVpxRUdIaGlJMFNDdHQ3dklhUzRsdjRVSW5DWkJhOXZSVzUxQ3J1M2w2?=
 =?utf-8?B?UGZrVmM5TzFhckxpMGJiK0VCOVJ3M2t6djBxMzFwazFWYW5EMytCN0ZwUVJX?=
 =?utf-8?B?eTZZSkdib2ZUNC9GYjB2VDlsVHhiSG56SEczOVo0Z2NadUVscXVmSklRV3Mw?=
 =?utf-8?B?eHIvMnovWHlEOWdyK1VWejRCRWhHR3kva1NiSzYvekNMZGJlckxXaWRINFUx?=
 =?utf-8?B?czVMOWxWTXZNNDRudm5ROGZpRzZBZmRSQkVoVjdyVkpKVVVUZ1BsYWRxYTNr?=
 =?utf-8?B?aFBvMEJnbFZuaFY0M0hYNmlXSzhDbkJiNFVYeUoyOGplbi9oTXNocm9XbnVy?=
 =?utf-8?B?MXpMVldyRDZ3ZWlFSXZJdnRJWjBtdXV6blRpYWJ2WnNLSUI5aWFnNUJldTVk?=
 =?utf-8?B?S25MV0wwZkFEaVBoOTlTZ285Y29JNHFkOFhOemlXSVVsSGduNUgraU9reklj?=
 =?utf-8?B?aHRER0JaMmROaWttb3k2ZDErNTF2OEdlOHovU0xIZE50UnNqbFpRZThKd3FY?=
 =?utf-8?B?SWpFMmhvUElpYmd5YzE0L1VMQktacUd3YjFzc1E3Y1JMQXFwTHFraSt4cWY4?=
 =?utf-8?B?enlmOEttR2YrRlh5N0NPMGsyVDNmOVZUbldTdXJSNzJhdnE0aFJtNFBuSEVm?=
 =?utf-8?B?Q1dGVEtzWlE0clZNR2U2Rnd0UExZR2p6TVEwMEZzWCtFYXFlWTlPR0FITnZG?=
 =?utf-8?B?MmdBTzdwbml5eHNaQkhOZ0dPMzdjNzFNc29jNmRadUI4eGRIemp3TU5ROVlm?=
 =?utf-8?B?aDFJRVJkWHFFVTdYZmZBc1JuMndwc25GK3lra3NZczJycHZCSzdtVTBGazN5?=
 =?utf-8?B?K2FLMmlDKzhqaDRYRGYwa3QxaTVpQTgzTVVJck42dXNhRkcrT2R1anRFeDJO?=
 =?utf-8?B?QTA3ZGtNemtMSHN0Q1JzbUhWc3RZYzl0dWF2VFRnTjBVSXY5S1M2Zk5MTmtm?=
 =?utf-8?B?UC9iTkpVb2d3Q3RlQ0U3NlpjcWFzd0dxMTROaHprcnBaRzRmeE9mZGdzR0FI?=
 =?utf-8?B?K1VXelIvbVZXeFlWOUlLMTUzRk92SUcxSW1lUHJVdVhQNmFXcUNyYVFiY1FV?=
 =?utf-8?B?N08xTWNtU1NkUFBmRUhiSUcwcXhYTUtRYnZucFpnZUtNTW5DMkkvMXNoS0cz?=
 =?utf-8?B?REo2R2N4SGh3cDJlODRiNGh5aml1TmVsQ1JQQmZZTXpWZHhyNVpheHRvOFZR?=
 =?utf-8?B?UUdYbEVxUGJQQ0dHM0Irelltb1RxeGxWZmEvQjN5YnFBdVhyNkM0MmI5UEVk?=
 =?utf-8?B?eXRZaXdxMldzMFpqYi9FUjdYSUx6S3pyUDltL2lGMHRycWh5Q3FlKzVBSkdw?=
 =?utf-8?B?T3JjYTlTNzBBZ1hYdVpxOHFvVVpBbVpldFAybFNvTUJoTk51cnpZd0ZYYUFu?=
 =?utf-8?B?Sk1rUUNwQ1Y0ejRvK0NsZFdNOG4vTzE0dyt0YUdQcnVyOWRzbE01b05RWWFM?=
 =?utf-8?B?Z1dSNmhsVDRZclV6RmJUb1Z1QzJ0MW1GcEV6aGRiTzlPNG5aeTRiU29jeTRj?=
 =?utf-8?B?YU5EVk03UWNZSXVDL1lTVTdSVDRhS2tHY29qdVV0OUF3Uys5alRvWVVXNUJo?=
 =?utf-8?B?aXd2YUhRZE5EY1p2dVJVa0x0Ni93bTYzdHVseXFVNHdXdGhiVXJkSEpuNmlO?=
 =?utf-8?B?R0lNZTZ5QXJ5ZDg2eTVJUlVDMEdTSlFZbmxNblFJZGpMNHduNTRkZmZmUWVJ?=
 =?utf-8?B?dkdIMWx6RXZ1TUZ2amYxNEhlYXpFaEJHODVVK000amRxMlVvbFhYaXdlM0hT?=
 =?utf-8?B?WU1hR21FU0NPKzMxbDV6WElKTG5DMkliZWNiSWJIK3djbU1iRXR2ZFZtKzdL?=
 =?utf-8?B?ZDZCWmZSSG5PN0xJckI3YzZiREtpZ0VGYjZwRGxQV3BEWVZzNkVVVzdncm1M?=
 =?utf-8?B?NktOR2lrVDJjSDBUWTNNVnZIZFpjUHRLTXVRZ2RxRUJzZnNMM0JTeGhTeVpy?=
 =?utf-8?Q?QIfFr7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDIrZUkyaWRSVVRvMlZtWGRJNEswbmdNZ09SRVU5ZWhFd1UvZm1uNTNkWC9U?=
 =?utf-8?B?aHk2TWpyU2RBM2RTVVpPUzBOMEtuVVZqZnIyQXRxZVIvU3VrVWxXb3ZUVEUz?=
 =?utf-8?B?RUlXSnQ3Tkc3SmZ2YmVFNXRBRVhaSks1NFNTL2tVaTFWc3Zxa0VkekhBNjJS?=
 =?utf-8?B?ZU1KMjdEdGF5em9SeGhxQXJ0RGpjUFJOaXV3Uk9WbWtNUGMvME8zOSs5cC9Q?=
 =?utf-8?B?ZUVFVG92V1c1TlQ4MEFNclUva3I1dFBTbHNpWDJsOEZVNEtTd3AwdXVMWmM0?=
 =?utf-8?B?QW1ROXBaQjlJZnpXZTlYTEVLWlpMTVhRU0d0TXdTTi83VlpaVUVIVHBVNEV1?=
 =?utf-8?B?a0src1lhN2JYcnRGTVliak1aUERUbFlkK1pNRUZBYVFPRDViSFRiT1Y5eHIv?=
 =?utf-8?B?WDBYVno0SzR1ZzAyQVFmSWJSK2JZZUJYUmMyZkY4TGYyaWh1WjhiSjVwalpY?=
 =?utf-8?B?aWVacE1FVXJIR1hRRVhjSVZyTThZRHhMRHJzSnVmZUdOUTd5WUdmdy8ySTgz?=
 =?utf-8?B?QS9mSE9iWE9RVmMrTjJBSEhPQWowNVkzcVVmb0luQTdQS2EzT0NOQ2EzYisw?=
 =?utf-8?B?VlFpQ0VyWHNHUHF6N2lDWWpEYW1tZU16QlQzVC9xUXBmRzFwN0dIR0w4WHdu?=
 =?utf-8?B?dHlHYmZHalB0UUsxcUE3V3NTL3Q2Z2VMNXRmMGovdTBzcFVOVG9la3luWUpV?=
 =?utf-8?B?ZExlVXgrQ2pHK1hEWmtoSzF5Z3lVeHl2bVF1RTc3dWU3OGw3SkRBUU1laXdP?=
 =?utf-8?B?TFdhMHJLd2NVM1Avcko1Vjh4aG1sRENUM3hqY01BaEFUMVl4Q0lUUWY2ajNR?=
 =?utf-8?B?bXZIMDJxaEtrU3AyMUpJY05Hdk5MT2xSTER2ajBCZEt2R29WNlI1Z0tDdmtO?=
 =?utf-8?B?TWYzZDVaN0FYVXFPdGVxN0VEN1Urd0duOFprK2dQZlNGcGhGR2duK0tmTUpM?=
 =?utf-8?B?WEZBN2tCaExsNkVFVXAwaXl2YXpLcThDMDlaRTNRbDBXa1ozY1owcWhGelNB?=
 =?utf-8?B?T1hMVW9Db1BPdE5jcGR1ZVhieGpiUVZJd0Rkb3dTV2FkQ1Q1K2R0dCs1MEVo?=
 =?utf-8?B?S3M2OWMrZkNQQnZPVGQyOGZ1N3BUTjNDWUUwYzErK1NqU1Z6OTQ0OFY2cnM4?=
 =?utf-8?B?ZTFIc1Bna0FjYTFYQ0dudUtwT0VPbUtxZUx6MFhmT3AvUDdoQ1Zna29iV1NP?=
 =?utf-8?B?UThqdDVTSjhOSjlod3h0NHRWUWJ6M010VU50ckdVYXArY2FaNlBmSkhDbEE3?=
 =?utf-8?B?ZXlvbW1tNHJSY3dObUJxTExFUXJUZ3hwMDB6WFpwQUcwUFl0VGlWOEdJWnlF?=
 =?utf-8?B?K2E2UTFJRXFVVVhpSWZHbldFcDRFNitoazFLRDFGSDdzTlBLY3Iyczh0LzVv?=
 =?utf-8?B?NThydUtjYWtoZHlkRWN3S2c1ZCtGR3ZsK2E0VlBFRUpqdDZKeUtuRDF0U2J5?=
 =?utf-8?B?bGJ4Y3YvVjBSaXkzNXB6eEFsd0FUaFVYTm5ZNnIxMDhWeTFmT1ZTVjc3RmFB?=
 =?utf-8?B?VXFES3JYc1ozTmE4dkhnR0NiZG9nTmZtWEdJMUpvWVp6VkJnZjZJWk5OUGZz?=
 =?utf-8?B?TzJ2REhqUTBRYncxZVN5MGJwRUJQN2FjLzlUYVFNZXBLNTBmV2V1YVNyMHhO?=
 =?utf-8?B?bjBvWEhpTHZ1c0lUZE9rVzdUMGhHR2F4cTh2SDVRV09BTmFGZEd5Wm4vVzl3?=
 =?utf-8?B?WXFodVlrOWNpQ3J4VitTREZ0aUdaRUdwdEdQbUlNTDZLTkQxdjdhS3loSTlh?=
 =?utf-8?B?OWlmenFCMnlsSjNwendaN1dIY1dvMEthN1JkM3daMHlyNGlMV0ZuRXdtajR0?=
 =?utf-8?B?ZGFLNUpQcHBsZmdvVEgxbVY5MDBQdVF6Yk1FZ1ZKRDVZY2lOZExIL3lrbkdY?=
 =?utf-8?B?WnFucW41bkVRZ2ZMNkkyOTg0Z1hzM3B4N3M1VnN1UEN6TzhzYWxodng3ZFVN?=
 =?utf-8?B?VUlENk1yc3hEUnZqSTVlTUhUQTk0RGpOTzdIWmhUT1YvbmEwN01jZDNERzRw?=
 =?utf-8?B?bDlUaHJvOFR6dGpjK0h1NDJjWUFkK05xOTZxbGpPVWhzTDlBN1FRUzltaWxx?=
 =?utf-8?B?TFU3NE1sTTZYSDdlbWIrQ1VDNkdscFg2aFZOb3hlQjh0RTlrY3ZsaGloWmtT?=
 =?utf-8?Q?xEFzgQcwfcoy3H0/IWN8EDZzw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c60d738-1b3c-4535-6b99-08de267ca16b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:29:46.5282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcELIDJYfoXwVDtdvUcUTt3SWk2ZtrqLHfv/YxLDFB5gstkN87ZaDr2swnqOkjVOH7wfoatqSOglOdthZBvEDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11468

For SD card, according to the spec requirement, for sd card power reset
operation, it need sd card supply voltage to be lower than 0.5v and keep
over 1ms, otherwise, next time power back the sd card supply voltage to
3.3v, sd card can't support SD3.0 mode again.

To match such requirement on imx8qm-mek board, add 4.8ms delay between
sd power off and power on.

Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 667ba2fea8678215c611dc0ca19e8fbc397f9273..f1b0563d3a09044dda30627a62de5707b53f021a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -263,6 +263,7 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
 		regulator-max-microvolt = <3000000>;
 		gpio = <&lsio_gpio4 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		off-on-delay-us = <4800>;
 	};
 
 	reg_audio: regulator-audio {

-- 
2.34.1

