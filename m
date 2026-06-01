Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA931A6839
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341538; cv=fail; b=Q7LcU4lmP59zrHGtzNdA0Cy36aREGmTvRAkqU+iR/gQzeR1joX5da5kOWHMcX12mzkJXHv5pbGcV7SB7GGyH2HBYGL8kac451MgtZ/oOc/3ybTPtRX9S/3cyHOhBmW3zLWtX2LHRD3Ew9egcrSYdnlSpV9sqU4QffQOf0HKk270=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341538; c=relaxed/simple;
	bh=hGxy3jxFvI6RhVYkWEmidLdIs4rwCmMqAT//1P0kIZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nt7R5blL6QcmlurHfJB5VRUfBeBjUvHbOdmDf7iluHdco073OknonEXKH/YkBNeCMPjM+KjgDcjd/zBnzfvjSFyANnNuNxaGpInRUq/PhqDS4rUHK+QudAR8UKuCYGckpfcAOWK3Qq/M1Umdq7qvzi3bF++5pjJcO/RZgK7lwLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KPxvC0VY; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KPxvC0VY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDI7+sVhmN75w7BlhUY8Vi8MzFTYzOoaZpgUsoKeNJ6OoypDCzYNBWkRbYAKLsMhPZDc3eBkfy4FLq8/vxcHM1KR7i/Rt8tTNJ7qHFKSRyvP7BKC7bp/qMoRNztlzsK89LCXJDCBzPWQqqnjpy+y/FxpJ5KLONcsYWh7uiQCnH4ZYhbi00SIOTKs584+BOP5u7Z02YVDbOUDcZ/uRWiipzkZ7wIwyVXBHkk/tiutZId6zwwzLCoNS+Lj8bp4gWdOiPel8cE6sMNCfFt3bdxw/VR3KTKCjHepQS4p/IbYYudQUFV87i20BDqUUGEZde7mvtIaA/VuX5NqLCOl6fru4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCtt3XikWPqeSPm8K5b8FqM7md5h66TZC2wLngIwL6g=;
 b=qVkdUt9g7pdq8FoJ2ERdWJtRjyggizF0+WQv8bOaUCsxgjZoa2pI4Ep4pyE18707axqC1y8FAbFlbgUizJY1OGOtab46mjUniXvKmQMb52wzhkKNSQ8MmN1ksWq8sTajmvQy+ZxUTvHp49r0DVmv6P2gN9pTRrrzFgN9byoL6UiDO3t7Ub06c1BaUHw8tqlIueUvMp8zpKoB8gi7ZVKyHp29+1tYwRM9zypB0ChDiKdprOHOxhBTvHctHf7bkuIC5yc2fJKHhCQSIJi8EmQxrZlg4ArWgmdMe+moA71lDOuIpEQw1rGzdnEBQ5YQfbb7TBd3iD+8TEzWZy6AmmiuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCtt3XikWPqeSPm8K5b8FqM7md5h66TZC2wLngIwL6g=;
 b=KPxvC0VYSCmPov9xZjPzlfvhRGGCHFXB2FMThYkFYt9H1m4a8wLYU+QARbeCV/4Oyo4IOo7J5ojUIfn5GB7UhrfQrYxxxVXoBv9I5mpCTmqjOL3T92OufqEtCiajqNTO2ufW36QfzIT3vE+mIM1smbmXcJ09lJdL4+7X4FaCT/lK18A3Q/VctqyP0uHZ7s+kTA5IE9+NakFsJAMRxEvXHr2kexOEHkmE5PImrvDfcVtX8NVCkF4NktaOQ1qCbQwIWF6zW7hg67RkuTiiaV+NNOgzT7h2HccC1A6oKzNQ+pyW2XX7eFJQhn2HmFXCnp3Zam4FQFoyUrqi7d1PEI2Icw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9105.eurprd04.prod.outlook.com (2603:10a6:102:225::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 19:18:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 19:18:53 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Joy Zou <joy.zou@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: imx91-11x11-evk/imx91-9x9-qsb: misc cleanups and improvements
Date: Mon,  1 Jun 2026 15:18:45 -0400
Message-ID: <178034151520.341765.17801970640473394139.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: c93612e8-93da-4808-7d15-08dec0129df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|19092799006|921020|11063799006|3023799007|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eQ5yPv9RU2OsRSE3b+pgm6KrKMRM5JFyk5WYNk1phcsiCx/D+Twax50xIf57GW3LdbG5E4UtJQA0PP5/M/gv223I+XJbLK7MOXWGsjWL7SkbdZuDtKqJ1PCWzhDYZXbUQeUwfDgUaIl2J17Ly8WGhJZ2WjEhpHlql8NFIpKDKYnPS0y0R02cWV40pq4dCcIJzgnYvVUM5NV1KvebZv0hW8TJL9eRKk3GUnVIoeV1oJ+mk3+QjNfXRJQji/AVeSC6HLiBJ2K0g96bpBKcgEztlMEL7gLxwt/BOUaT9jsxhtiwog2iZJX0RiGGxGczB8FK+M5n91iz/wWXUzqQSvSOUbmMQhEng8oyyWCAbcrI5kDXRn5Th/EbixqZC1D4wo5IubxhIbIjvgK8+QgxblQju36JBKf37olQvZLIMB4WoQvCRQLQYNMwrFGL/I/3FpLH6qABfrwKSEm7N48rZg8X31ncmMDwX0H4qF8iFJ5rYi2Z92BiC0WRCTXMAuBD2P9ySa7P9btyg8wltf6vkMJ1zfJ+yDeDINLqk/pVlghajZR0Vwhqaxi5UKsBaPPsOKBXKSozs1YeMGNItqzrjJbByybMWUxzDCIJDZPd+D3Nr9cLUDQ/YGW50+QuW2sUKO/My9qtkhppi9Fg2V37qZVB7rCo8fhJYg6TzsQ7Rtm6dAqUmob5B8a2km9KsOc8gi5ea1wYqVbQel2tryFhg7m500W9VgJOJFta6l1a14jUr2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(19092799006)(921020)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1pOQVUvalNjMlQ0blpaTlRMenJFbUJvdDlOdjJxT0tYTnk4amIxeXZ3YXM0?=
 =?utf-8?B?bDRGT3dUdE9GTExkc3BmbVdvRnJYSUZtTXd0S3UxTHRtMHFjQ2t4OXp0VG13?=
 =?utf-8?B?YWtlMEpiWVZEeVFkL1pUaTVQdDNLcCsrZWhDSUhSMGhSanBaOWowby9jQnRQ?=
 =?utf-8?B?dDBtQzMvM1MxM3pDWmFZVnEzUTROMVZ4ajY3ZWdrL1F6Y3Y4ZHhvVlRXNjdU?=
 =?utf-8?B?UGJIeElmUWFWZTI4cEF6MlFtUlFKME01bDBob3d6VkZBaWpZY1B1Q1hMRkkx?=
 =?utf-8?B?OEFHUEZPTUZlWmw1Q2wwNXZZNE9uSVZ1bU1hNWlKd0JGdDVXT1lOaHRFdFRF?=
 =?utf-8?B?amVWZEZXR2VybkxuZ2JVWVdCc0ZEemhaVEVMNkFmN3IvZ0wzWWVKWTVoUlQ1?=
 =?utf-8?B?dXlQckI3T2lSNE9tM0tMWm5acTdMNjNpNWFjc2dTMUNUNVNDcldYaXJiaDBE?=
 =?utf-8?B?SVhIWFhZeURPUWZCN0g5dTVpenVibzlVdEpZNjlWeklDUE9HZjNvQWsvc2l4?=
 =?utf-8?B?M0o1NXZTV2IySTRNckh1aWI1a3BlUlZXMnZmRFYrUDdONEE3RUpUbVBtaTNt?=
 =?utf-8?B?NVBtMTVJdTJBQ0F2SGcvbWxJU3ZTTEMxU1Rpai90MENJYkt5ak92N0JIVXlt?=
 =?utf-8?B?VEZWc0ttOS90S05sS2xFejhIQWUyVFhhWU1mZzkyc1VrZmdUUG5mZlpGdm00?=
 =?utf-8?B?UXpLdjVOOFJDekM1SVI0OTRyS0Q4dEJ0VldkRlEyODFuM21zTG0wZWlzRnFh?=
 =?utf-8?B?VFhCS3FvZE9ZMTRLcm00QTQreFFJNS9kZTMrNTVyMjgwd1Q2SXp0ZGhxK1Fv?=
 =?utf-8?B?UHJtUDZMTUg4TzR5TmJ4NE8yajEzUFc3TWt6ZHJyWjBGWEZYSnlKR0s2cHNR?=
 =?utf-8?B?d204NFMyMG1xMFBLVTRMSWswTG9KVW9LUUIrbWh3N3R1cVV3cXNXTVp3SWhw?=
 =?utf-8?B?c1Azd0JIemNMM1Qzd1lTb2t1STJQWWh1emppZzZWem1XZTIzS21GMXdMZnl6?=
 =?utf-8?B?eE5OS2RWOEFrelNia2lnOCsxU0dVTTFvUm5ZS2tyUGtla0tHWThrbS8zZTdp?=
 =?utf-8?B?WG5meFJNTEJ2Z25SY01zQ1EvK0xMM0NXeTNNd04rVXI0VjhrZUtFZE5QVWd4?=
 =?utf-8?B?ejVlbXlEVjVJSEkrYlBCOTdWREJncmVrWjlONVJlY3dpQzVZbmQ5cWZjM1dm?=
 =?utf-8?B?c3pQWXlER0RLU2lxbzZNTjg2N2l6TU93djFUcVQraEp2Tk9GaGxvZEVKMXJG?=
 =?utf-8?B?cnMzcElqZEZQMEZxTVFPWW93SUxFYXdOK1NhS3Q1dGd5L1hIYSszUE9HRjBk?=
 =?utf-8?B?ck81SkNjMkpmVXlSejhDb3A3M0ZqTW1qd3l4dmFQV2EzQjJpTElQM2RidHBj?=
 =?utf-8?B?dm9oZmhPZVVyL2hCeUNSbGtzT0hjREhabFVxbHRsYXMxbTV5UE9UVW5JWFht?=
 =?utf-8?B?SW5FdTFUMXFUT1ZVMGFqaUEva1RqZTNwNlYxTEQ0YTZXNkJsWkkrVjZMSGVD?=
 =?utf-8?B?VzFEL0lWU1B4MThGb2cyRTJBMTlUQkEwMmtKNnZ4NGplckpXdDdaMGFUQXpI?=
 =?utf-8?B?aEtIdUpCUXV6QlpzVUNVZlFhaUV2NVlVK3Y1UTlEMmQ2c3ZEeTBMV1FlTU5H?=
 =?utf-8?B?cnd3YW5LblpmVHZOMXJ2anpGY3JBR25mSEVpd3lqYUN6YmUrU2o2d0ZqZlJU?=
 =?utf-8?B?OTBQdUVDaEVhN2xabzkzcFNzbS8zUjdaQ05manhRMUtRc0I4TG56aWpCeXBL?=
 =?utf-8?B?OUZ3K3dmSjFXdE1QdlZIMTc0VlEyOVZRc3FHZ0VKcDlBRFJ6WDJ3SlVEeElS?=
 =?utf-8?B?NXE0V2lNV3VtTUgxNVU4bThtM25WTVRQa0J3MVU1QnB1eURXWGxDNTlJK2dm?=
 =?utf-8?B?USt1amhrWG5sMTF0RkpRcG5RWjN2eisyd3pEaDc3TUJCWW1oZzRydkYvR2Va?=
 =?utf-8?B?SXFhMk1yMjRzREdNMEdNTzFXQm5lVC84aEpGT0dVOFU0L296WUZaYXJwSFNj?=
 =?utf-8?B?b3pCMGJidTJUMXlEUC9HSEtrKytqR1NMS1VvY1pUR05wbVlhN0NFOURCdXdL?=
 =?utf-8?B?NUthWnhkYTU2RzRQUDlPV1hmU3NxYXRoR2RHVHpYZDFXN242anJoZ0ZVYXY4?=
 =?utf-8?B?UHBMdDBuVGN1cVJKck91WlJINllGbDBGelhvTVBFU3dMRjJNTm9seklpYXRn?=
 =?utf-8?B?RVFvR3BoKzM1TkFObFV0WktFN0pmcTYxbkY3WVRHb3pDOU1CT0ExcGRzSGZW?=
 =?utf-8?B?RTQrYjJRWmhqK3JtU0lmallsdWd5SFUxSTI0NW11MW1GM1RFRVBJcWI0RG1D?=
 =?utf-8?B?dFpvc3pNRTRJcHN5VGdCZWx4TDlBZGJUQWhPVmNyN3YyVi9aU3FwWlBmd09n?=
 =?utf-8?Q?3P6ev80YORo2w1R7Z9sHCzjmeBQUzvzU+/fvY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93612e8-93da-4808-7d15-08dec0129df7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:18:53.1115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF2u8N5F02sFBWCbNLKhFYdzb6AHq1MPcwl3vrsZBw9wKamrLzQ6hTfFIVMPn9n0oImkiHmT6pTLDFAAmxttPoPb2SHjicqi+wewQxGXLRbPp0by2HkRgkH1JqTn8A4o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9105

From: Frank Li <Frank.Li@nxp.com>


On Tue, 19 May 2026 19:15:14 +0800, Joy Zou wrote:
> Remove unused clock-frequency property from mdio node for i.MX91 QSB.
> 
> Add watchdog pinctrl configuration for i.MX91 EVK and QSB to support
> external reset output.
> 
> Add Ethernet PHY reset GPIO configuration for i.MX91 EVK and QSB to
> ensure proper PHY initialization.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: imx91-9x9-qsb: remove unused property clock-frequency from mdio node
      commit: 8b09eeeef7648d85e5d6000f13e525bd1dead215
[2/5] arm64: dts: imx91-9x9-qsb: add pinctrl for wdog3 reset
      commit: 4d0aa213f8be3c36cfc16120824bf703a60b3b4c
[3/5] arm64: dts: imx91-11x11-evk: add pinctrl for wdog3 reset
      commit: cb8daa45598ef55b38307b44cf972266930092be
[4/5] arm64: dts: imx91-11x11-evk: add reset gpios for ethernet PHYs
      commit: a396a30648e07645b4306d7813dc1b4c82a03e72
[5/5] arm64: dts: imx91-9x9-qsb: add reset gpios for ethernet PHYs
      commit: f46fd2f936b7606035edb1fc12d24db4066d5fb9

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
