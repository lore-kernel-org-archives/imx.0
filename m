Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFB33CCFA8
	for <imx@lists.linux.dev>; Tue,  5 May 2026 19:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009558; cv=fail; b=cDlCLGS8SWfDK3+xKkmdAITNaTeH9PvOXhykpu1PtCN50qSSG0LVtZeGFvAJTc8Uvv6Ol4v5GFWAiibBjA4UbAsGTBZHS9oqoY/AJrsPg8gCgp3gd/17qa/ZBPs77BmYzf0ChYXEDfwRhraiOHxZ07o5GuQL01XkPvpAB9QoP54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009558; c=relaxed/simple;
	bh=nxzs4yAOe51vBhKSr2sNZ/qpXNRbV6RtG1shK9Ty1XQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=nZ2vX5lpezPKOtRmsLTW8aDUjro+NjJZtuYigefgeWHxLK1q6alq67XrVLVWvOrgckDU5S+5xbGGMC0wlOBXaisLhJCpdC5PYZbOPR2R09ygva/apdCD4MG1lt2lrZJUOcx6zjFJ1avt3TVYEsLt1OIcVn1M7BGXZrujFv544Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V2UI+JAL; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V2UI+JAL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atGKN1nBG0IHeE0atLXONZ7aF+vYzi10+5IlqwrlEJAncrMN7L2tsd3BeEGnUO4mC0AHteNuwBBG1wZfhpePnveTfzLL/vSqLtVypQ434lA+3sVkFlQg0yHUJJOCeaTbrxs7tADX9PJZGeEOVAYFFuuMQ9HqsCBbtVaBFM9QKQGD4gwej6otS2BVuXo3HwSbk/ccQEh5pq+rQxtG51Ge32awuRoQEgxu1Gpl49dbslqRmvwWW3QsTxEVHK4oUUOv5QdSqppZMxtzVVsQZd2srXZ9folXRfOmxXCNTfWl35AbyHvCoLVqBBOhdhQhmUUfwpNhSFbOmXUlZZIRKnmVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oUY67IJiin/mHITFSQ1KDBs/CLo9FUInbC15addJg0=;
 b=fFrzxqZGaOXCBV1NPAdjM9OZGtC77UwdfOzvV9Eq9HBtuOvqYRlVVHcKSlp5tqU/KQ6US4wksHEEJP665prvWBM9f99xKvkZQ9BLQ6wfa2UKF0H0zLJurzESevKwRCdBQgOiJj+Q3Y1h29coA61yaZ44Uv8q3NhPuy8VXS55cVZHFNudpTV5GEMszLNQndri2QOgO7Lx06QfisKo7IujMRVXRoFZa3Hr+T0l1JRJ9nU4D696fqftpov9buhUf8A8KU5Sd++nT6f+aATDzmrxWejjTOx4Ha38HVcy5a+AvATtqLUWAa/wSXZZcw7Pu6JdPqDyLT7Bc4ETvHg00TZ59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oUY67IJiin/mHITFSQ1KDBs/CLo9FUInbC15addJg0=;
 b=V2UI+JALDg9Qylo5TeuMiHC4R7mus/WeMdqdo8Qh1fGCxErtxBu7qfUteNNMbtoGboMi5naQoLPSm/AFNxfKKuU79rH2qs6SHI2q7TRf1HxEdardzeun2nUO2Rl/G54NvCvnZNx8gUWUhDhUCMl/yWgC3vze9dtKlmSyRBgddWAYUqv2RI61xTS+y/4053f+SW2shUY0QoPZxWNcJgg5PkJl30lL6IpAWK3EIbpda2mkV6tWzER33Y34VNhKA7NNsxdCvhHNsZTx/pTvMiL52BJKo+liOD8dOxvL2eUpMhAJfV57NU+KsXWuBaprtNoNNDSnR4ZZIOsYgOtSaC+Ekg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11506.eurprd04.prod.outlook.com (2603:10a6:102:4df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:32:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:32:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260403-imx8m-ldo5-v2-0-53bb33d6b810@nxp.com>
References: <20260403-imx8m-ldo5-v2-0-53bb33d6b810@nxp.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: imx8m-kontron: Revert reading
 SD_VSEL signal
Message-Id: <177800955050.1963472.14289764089481808918.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:32:30 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH8PR15CA0019.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11506:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5afeec-1b51-4c7f-07d7-08deaadd0dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	jisLdSAyMAOvcDQ/H89VVptnV4tBUg/6991PblnSvuiBAtbB0dcSvqkROm4tgbTkbnJYkz06h6pw5Ftr601LMJ9PB1K4+z9XSETMBj5eirtXOP5UgctawbrBjk84mRTEsvZ2/2roAL53Hdm6wXK6DdERUi84SGPUb1oy1za5QQE4gIGVnGMhmiULFMyuIpHFkNbYFUKWL7/xiEHK0YSK2lMkKRB99jpFb66kldPSogBb6f6Ynxz70Gi4qKweScG4ZvP/V4GdNShavSPHRBCs5EN1fU3RAuEaDMddOOwy8hHUzfV1XTMD8upLe224Trk8N5goKVrLRu/g1TnINLdTx32IbRH68NfzqHC6r2sTxHpkxTRbtiFxUU/n9eelOjEOQBrIHMYlcMNmSBFfwVUDKUipWN2gXM1o4QjIeRq3a+nhFOfmRRdWtL4WuBuACQ5B/Wq0OyOJI5FmFnq9mdVPaorT52w02VLzfafluTXEri7yivIguT7Yp3bjYmOFk1zVU/9aHHGEDekqqDt5zog8O9uUILVeeF8MiNzPBfH9ref3BQ1lk6ZYSDnP/jDzYlAZ+03ag7mMqy8YLkXLIXKEVCXSOcQIKvdHoF8MgN7ax3vY8yo33p+bOksgqB/CvlmasUVH1kLTOB+O/RhhoIXD2uMmvCBFJh/YhIDGv0VTmutuf9EgQLxyzN4TE9dGSvkRK+oNPT1P5SYMjY01qUZbBVRJUyfuX/8zk68YnCeX8JsoI82NcR20DmyEyOF++R3K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1dWQ2lta2hyWmhhZzFtUWI3NlZoM2NtaDR3MHFoQ3ZFUVMvU1VvMkE0dFlZ?=
 =?utf-8?B?bGpUb2JqdERZYkJkWWhNRVlDNU5sRWZTSnp5bWpWZGFHY1BWK2VHaTdFazRp?=
 =?utf-8?B?d1JtK2NxSmRkZXJHeWljejVIb0kvd3lUaHE4dnBNSi8xRzJOU280MjZTNTd4?=
 =?utf-8?B?cTVlQ3FJa1h2bHAvTVp4UmNpV2s3WUx4MWFjVkViY3VXdlkvenBLczc1U0Ur?=
 =?utf-8?B?OGtGYWdSZE53Qk11TE93WVVaSVZwa2dKT0R2OW9aTkpUWk03TmdQQWRqMU9B?=
 =?utf-8?B?NG5HeFpaVlRYY1FadHZSOTlHaGpHdXV4RGhkcmc1eE52UnJhbHN4cXJCN25G?=
 =?utf-8?B?RGoyUUpHdlI4OVh4N25mZ2FYUjJ1V1FvSUdud2pZcS9EWjRCMlZtVjBYcEtI?=
 =?utf-8?B?cWd0NFhQM09WckVZeXZjZE56d0xyVWV3VFBLM29XT1VGeFY0TVpJZGJxQWZk?=
 =?utf-8?B?RjFFWTkyWnByV1o2VVBVT1VmOUhYQnVhM0g4ZE9hUlBHcXB2TDEwZzROTGVT?=
 =?utf-8?B?cmZudytuZUpoRXA5eXY1YmR1ZERhcm16TzJTWkdWaU03TTF3RC91UDVqNWFP?=
 =?utf-8?B?ajVENHZ0QVl5eTRnUlRTY2FYdThNaHdsUGx6aXdRak96czlDR2QzUWxacHdD?=
 =?utf-8?B?bHNCcytnN0xycjBVdUk4RFYyNW05RmZCSzBuak54SUZtL05RYjZHU3VGTGll?=
 =?utf-8?B?RG8vaU9vMk9jZHFUaTRVWVFKVU9rc3o3Q2pPNU1KUzhQQisvdExZYXdMQ096?=
 =?utf-8?B?WUpDTFRIbUZ6VGtBVjZLcHQ1NTc1WnhCcUtRZHJHa3ZtRzNnL0FBZWtDSDMz?=
 =?utf-8?B?TUpZKzE2RUxPbFJOa1QyVXljQWFZOG1YdVF3YWdZeHpybWdMVVNZakpDa1ds?=
 =?utf-8?B?b01oSStqVkdCanRpZnNobXo0cWN5U1R1eGdKQlBuamRHMyt3TksxRjR0bWJD?=
 =?utf-8?B?M25EMjZUVzhOWXJTTUxuQnpVYzljQ3ZxeFQrM2M0NTc4MnMxWlZaYmFENk4w?=
 =?utf-8?B?c283bjBHZWx3clYybXhVaHdBR2M1MXZCZExwdFVmR1h5ZkJCb1RtUHV0b1FK?=
 =?utf-8?B?Nm9BQjcybWpXTE9Sb2dPRHQxSDZicU9uUFQ5NVhwbGIrcG1UelBjQlplanNr?=
 =?utf-8?B?RGQxSE1mVUhqUjF4WUJleFRpQWFMRnZDbkgrcVdNWUp0eTdPeUgrSi9zd1Q2?=
 =?utf-8?B?VGVta0pkbWRxekJ2K0tPdkdJVW16YXAyZnl6dWszUm5EUnozRFFMQTdueGZN?=
 =?utf-8?B?ZlVkeEp0T1ZiOFRqTHVIT29XQTNFQllZcTRUSWFkbnh5cWcyOWxaT2J3L0dB?=
 =?utf-8?B?VEk3WFFncXFEbkhVWXF0S3RINm5TVFEwTjlUZm11WDJFdWNha09GblYrU0Fi?=
 =?utf-8?B?NGFLdDJXNWVHa2NzNE01aWhJRytuSyt3MSt1NGhSYXFPZm05Z0VIUzdSOWk4?=
 =?utf-8?B?M2ovaTJCUDJMcVFBdDZ3a25uNlIzNmIwZUQxeU1XM2pWVVVGVk0xN2VDdkhi?=
 =?utf-8?B?TnUzZHBiZ2h6RktDSW0wa3o1amozNVVRSUFraTZzZ1dyeDBzMmY4OHZ5anBN?=
 =?utf-8?B?NjIvZGd2dHpoSFlyK283aDBPWG1mSkxaVEQvZWNFVVRTYm5lbnd1VGs0TVpU?=
 =?utf-8?B?aHN4a05OanN3ODVGdXdMNVVmZzdHanZ4SGlMYm1PK01GSkZYUVpNaU5vcU4y?=
 =?utf-8?B?Z2pSS0szV05IK2lORFBTZ1BTZjlsTWljYWlvcWV3RUhXTnZMdUtFWElGM2FV?=
 =?utf-8?B?QnVMc0FkRlEwVklzSnJIUWxKQUh1SzFZMjZyWXp4NnAyd3d0MHBIVHVzekp3?=
 =?utf-8?B?RW0yVHFqNWRIaGN6KzFuRUNYTVRXZXhCYVhjbjFuZ2dvZkZVNE01QlVKRERk?=
 =?utf-8?B?Z3dJc2lGOWJFRUtQQ1VPQnVtMEJLY3FlTmtmaGhyR1hDOGNTcEtoN0tMQ3BH?=
 =?utf-8?B?VjdXMzQrRzdWLzhFVTU2QTFTWjAyMWRaZ01ybGs2c3Nyd0tOd1o5c2daTUxn?=
 =?utf-8?B?aU5VTWJCWXdmUXlRbXdaRTNmTjVNeDB4czdQMDM3Ly9nZy90cnB5cEp5bVM3?=
 =?utf-8?B?eUhyTHJHaHV0Q3h0cU1GdnpkSlFyeXlrTEJsNU1kbUw1NGlpQnplSDVmbnJ3?=
 =?utf-8?B?U0JQd1dlK3IrdEg3cFN3Y3lCdkZkaFRKM2JBK09jYUp0SW9aM1MxcU9aRGd1?=
 =?utf-8?B?MW9ja3N2aG93cENqR2VxV2VYWGJiMFdIVGxSaWRPL3lZa2JCN2NJMjlOQWk2?=
 =?utf-8?B?QWNaR3VhaUpSQy8xZHBOVnVLQjVtZ3VwUjYyTUtUSnJTaElWQzd4Y1phNUIv?=
 =?utf-8?Q?VUyGOccuaVwTYNCuig?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5afeec-1b51-4c7f-07d7-08deaadd0dea
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:32:33.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzlVQXZ8+S8GK8PZNC+Glj2RC8jCmdMLfuQPxLT2I8hmEO/NvhIBqrOUu6LX3jLpilEZTILjxlTbeFxEhq5XpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11506


On Fri, 03 Apr 2026 17:57:00 +0800, Peng Fan (OSS) wrote:
> V2:
>  Add Fixes tag
>  For the regulator patch listed below, directly reverting it is not a good
>  idea, I will work a new fix patch for it. The regulator fix patch
>  is orthogonal with this patchset.
> 
> When MUX is configured as SDHC VSELECT, enabling SION is not able
> to read back the SD_VSEL value. SION is used for force input path,
> not to redirect the PAD value to GPIO(the other mux).
> 
> [...]

Applied, thanks!

[1/2] Revert "arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal"
      commit: aa907ee010e396c0c0d31d60495ace6e531ceec9
[2/2] Revert "arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal"
      commit: 22465a195af370ed6311be3adee479fb7c683685

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

