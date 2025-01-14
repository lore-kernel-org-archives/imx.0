Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2069.outbound.protection.outlook.com [40.107.241.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE1120C48B
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877426; cv=fail; b=ujRc9Ck1MRoKEE3MA/4WCV8fVt7gb6JB8a0TYpXBXbZWmzqDQ8AmPUlK8/ziueZ7nhiStBuY+XFYSennPtRzZy92WxsF7iGe5nbZlbm16FrvWpfYqEtUrp2xRbwrmagbeuTunYxQnuYu7ZgM3yp7zlmeDV4o94cyx/5fmG5BYZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877426; c=relaxed/simple;
	bh=qfgItOyqzuepFmEsNBFI9XvjYnk9twmtZ41P2MP7xfk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GN0zWI6iGa/vDOxng2BH/qtjldX7wWCCJqViUuD3WnXHmrP70XiA2obAmsftY3HNPA1JHid1tNg4LEJh149WcQCFfXgNbNwcnHXjZk3EuQjUN/PJ/jgymO8LmkAXDLceVrzzRKX4GiJLz+Y4J2cRNFwoXOXFRbkHDb3Be2YTWZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d1kFETd1; arc=fail smtp.client-ip=40.107.241.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d1kFETd1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdWSb0DOiJ/FIrIXAJacM0WcBU/LhIJlGJz0iUhbadB4ZggsgKOmTd6f1qMiB3BmRL0Og0WdhjwlEKNa9t/v1S8HRekHBVNQfcKY1dstQ5kOdk1FzGSRjp6jMAwxF4WHWq4H+lEjDMk8cGDt+VWAh3gbJgTUqUbsO0F523IwX1aXPQLe3OML0mNDvUW3S3VEPSXG6E2PwpkcKfoP2fdN2Fgj46s3uJdsjFKD7/PlH5HsbrHgEYhs1n5XDupDxOpEkrA2usWhRotbk2x3AerWvVmUqjC8A9g31KTFfN46Y7csDJVBL74kokZnoYounuJFmV34uR3ABsf2m+CoinxC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4561eCv0m3Q25Z57TohIfrA7QeBvqFK6U6vyg2cYiM=;
 b=UYwAiYIsAjptb3AzEz+gKe/Or4XyJUGD8mS2hmkDZYn5PsWq4py1SkK+MeFc2qtrlLdM5uDfmi+ydkHs+/YOYPkvMs0sl9F399AjvRUkfo07AV1NMCgtFSCNO9xCmTi8TTbb6v9+uJVKVyZqeX3GgKlRKUCcogu4YgOES0iB4dfV6+SQbjsW6tMNwR0tFzBazE6dz4iCsxj5BGc9n0uLO3Yz0ziXWVscj/DgUYFtRzKM+uvO6gQon1OiHI/zdPdqY2MUsJ6CIQPmq0bjThiiwfy1fKCsfyerdHjEDcxaZ2IzFz/gHbuAf6DHDRb2oV16b4bQFmGAmZmU3YcKs4DhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4561eCv0m3Q25Z57TohIfrA7QeBvqFK6U6vyg2cYiM=;
 b=d1kFETd18xlbFIRlbqKfL1xdrq1xtUzJOB2vfWcPmNQlBv9pglcQi7gMmNEkecF/ehP2WKA+2t4kwRvHNCdErpHwad5sNfq7QWw3lR+5qYLZlzDDh/gl2V+eGxQIZS1993OTT6W+VYXSItHZPk+cB9FkxsC87Ye2i/oW3ZnZDYX/2mHVmeb0k6pzks+lNJjYNbAZVDvH4BgZLQPlrt+Z94cNMltt/mpwgZJqNHhGlmWLFprP8O/ifYzxj5hvNJZFIX/jgiV6gYmanc0S70Qo/ntRU0YQTzDHk1iOl2mc7xhooyGWjRfS9pRv8bMsNqH7hidsdTMUyAANsWiwq5dznA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10396.eurprd04.prod.outlook.com (2603:10a6:150:1c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:57:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:57:00 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 14 Jan 2025 12:56:27 -0500
Subject: [PATCH v2 4/4] arm64: dts: imx95: Add imx95-15x15-evk support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-imx95_15x15-v2-4-2457483bc99d@nxp.com>
References: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
In-Reply-To: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736877404; l=29270;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=qfgItOyqzuepFmEsNBFI9XvjYnk9twmtZ41P2MP7xfk=;
 b=uED7kcqk7grgH0vDVwt3M8RV64WYAIIDWiig0DQ3xDtWCVsZJGFRJk5YaVELFuJNvSpboOM/K
 hoiWikUqDstBV3OV2QnBwqZzkzyFI6nIQunr13Jxo38OxKdePrS0DC7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d500ac-942b-4828-a094-08dd34c4d828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2k1aDNldWtScnh5TzZxdUcveHg0bmVGS2daL1hNSVJhV1RxZkZRVjBQMlIr?=
 =?utf-8?B?R1Zza2xodXZOUk5oaHMrbWRJejNTMUNWa09hVUwxcS9Da05tMUFCQmhQV1Nz?=
 =?utf-8?B?ZUN3WXBITit6WFU3d284L0NsNVlQTzQ0ZFYvenlpUXVNOVEvUVk4b0FwaE9L?=
 =?utf-8?B?aTkxbzlyR2dORFFhOWxsbE10aFF5UlJaY1NOY1VJUzF4NG80NllwTHljc0dz?=
 =?utf-8?B?NDJmQ1BYby80Z1Nuc2JiMnEzVXV2UnJWMVRQNWEzM3VJaFFvZElqV1Npd25M?=
 =?utf-8?B?eWhmcmpkZVpXYk9PSnExaHYya1FXQXFWQVNOditxc1pCM29oSm1BR2VaUDhX?=
 =?utf-8?B?Q29ZOG16Lzkyc3ZKYXBKUXdvYkVlTU9xUGxXSWZQY28rLzBoSzltK0tQY1Ez?=
 =?utf-8?B?OVQ2MWd5ZWZZTERZZjdyR2lmSkhjcUZlZUJMZTZxZkRWV1o5VkkvVkM4eXVE?=
 =?utf-8?B?alI5alhLSDIvT2psSnk5TXptZW1hM0N4ZmZUQW0xeEZhWEh0eldvMVd5bUpI?=
 =?utf-8?B?cmh2WkRkK0M4bWJIdHZHSmcxenp1eFBuQjVKbWx5aVJicFFtNkpJRy81YVpX?=
 =?utf-8?B?bVpJTm5iUXQ5TE03U1Facmg2RjZoQ1g3NTdzN002Zkl4VHU4SlpQZExUVWl1?=
 =?utf-8?B?V0Fnc0hkUnRmbnNMZU1zKzJMK00vK1NpMVhLUUFNNzdHOURUdStlM1V5T2pM?=
 =?utf-8?B?VHhrc1YzcHo2S1k1Z0UveW9BMFlIcGEzcWphSTc2amNFMVZUU2toSWlaQXpx?=
 =?utf-8?B?UTI3YkpzNkVyNTlLdUpvVTVYSENUYlBIWGhDUFNLWmRGRTh0Mk0vRmg0ZDlS?=
 =?utf-8?B?ZWFiUmFLcWw1Q2s2YWRvK1A2U0ZQaEFWNW0zd1ViVDc5Ui9BYVZVM1AzVjg4?=
 =?utf-8?B?WkZSUGxST1JGYVdINk1udHd1R1FwNHkzdXBxdEZZam9ZMHI4YWVOcVdkdlJR?=
 =?utf-8?B?NitkNVRNVEh4NlpBOS9GUkVhOW1uOXBvL0Urc0h4K1QxcHVmdGk4OHhFRGI5?=
 =?utf-8?B?RHhsVjllTkg5cC8xNFFEeUg0eDlPUHFSTk5pVGRzNjBRMU9KN09la2ZGbnRh?=
 =?utf-8?B?NFpPbzZqeFlyVWo0MlZYak9nb2IyR3crekMxS3NnYk00Y2oybWRLSDJXV2Za?=
 =?utf-8?B?bjdhcGpUbHVqaEl6czFXY210NXBrOGdwRVNLMjBtU2E1eGVsd3Z0Z3N2dE1V?=
 =?utf-8?B?TVRCZCtVZTJ3RU05UU5UTDFvUnhGQ0kwQUNCK0NiU0ZHZHBJZ2QzM3d3ZUFU?=
 =?utf-8?B?K3FTSUphTVlkSmNRM2dKSExtS200VC80cFN6dUhzbWVUWkxLNWdJcDlMRWpE?=
 =?utf-8?B?a2VIbVFMS3JoRXhNejVYV1hDS1RFU1dSUWhGQk1Oa21EV281d3psL3BJQlpM?=
 =?utf-8?B?eUFNOXIxS0x5S1Y1RzUwRmliOEcrVCtWUWZMK2dFQlRKZDRPS3JCVzI5QkRK?=
 =?utf-8?B?dUxWMnJ6cUtVNmhYc0d3WDhtNGtKaGVjREdBOVNRU0ZxMk8yTm9ZTjVYSXlS?=
 =?utf-8?B?STZwbjN3Z3J2emFwaGFRMHZCU0gxRTI4QkxXYllSaGlBNzdyT25GSUFrL3lx?=
 =?utf-8?B?bGFrT0lZYUZiR1JoWnk0OFFDb1VyRERObU9KeENQNmd5VVQ3Q0dNTGRQVWlJ?=
 =?utf-8?B?Ni9NejkxbVFkcTdvYTIvY2F3M25GSFFwVjdCbGFGOEF4alhoS0NsU1FjOVhC?=
 =?utf-8?B?MXpoNkZEdXlmaVg3cURSMjYwaDB3aXA5TFhmUWtadFM0L1dPbHpyMGxBTzdy?=
 =?utf-8?B?Wlc4TkNhcCtXOEVNWVdvRWxEZGk0b240ZXFTQ1pKV2l3WjNOMldqM1V6aUM3?=
 =?utf-8?B?WmxVRDVZdnMzNS9aMkFlNzR4eHBaTXBYczRNRTZMbGJVVUVTT3A2QjJmaTk5?=
 =?utf-8?B?OTVsWEgxWW1mT0ZOS3oyQnU2clJYMlBiNmdkdWRkdkdHQ0RESERXWnZHVHgx?=
 =?utf-8?Q?ZanBWqG8/GBYjM1m8jhjsfEFvUrV7h6I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXdJRU10K2R5K1UxenZLWFNhaUFqcjF6cHl4ZEZ0elBYMlZjOWpmWk5uanhr?=
 =?utf-8?B?OEY4RXc2QUJyZ1BUUFRoanFMK3Fvak5GRmR4VkpmcjQ1UmpxWGF1NFBQdWwv?=
 =?utf-8?B?aGdqZytpT1pmemhkVkd4NllWUStMMG02d3l1Skh0d3dkOE5xYThQbFpQTWlZ?=
 =?utf-8?B?eFNlV1Nzd21sdExxS1BrdEliNUFRVXNZck9PNlVPN2hZZStQYWFPQkJDcWdu?=
 =?utf-8?B?bDBSSW1MdzNld1JoR1ZPb3lLazhtUWI2cW9nVlB4NTN6WmhHMzcvUkx3S3VD?=
 =?utf-8?B?T0UvcWFTamNsMm1uUWF6aWk1dWNUVHNVUktWdUFIQktBWnBnSHA2T1JUbjFM?=
 =?utf-8?B?RVRnY1RHMWIwdUx0aE5oRTNzZHJsT0ozSXdteGZBQzFtK3FQSnZjTk9kRzVJ?=
 =?utf-8?B?dTR2WlZQK0ErcEd6VG13NkVTb0V1eUlNaW15eWJ6ay9NM0tlRWxRdmxNeGZn?=
 =?utf-8?B?OG1mSURxc1B4OGZleXRTT0NoK1VpdGo1cVZPNVhQL21LZi9MMExvN1pzZjdX?=
 =?utf-8?B?K2RKSlNMMXdNR1cyem1iVG9KRitHa0VURlNoYko4bUhSYjQ4QUY5eHJmdkxR?=
 =?utf-8?B?U2hZeHJsUm55T09YS0FUNGN4OCt0UzY5UmJRS1REVW1VNVlSU08xNDhmY1BQ?=
 =?utf-8?B?MEZzSDFVUE9wTDB5MDdFaU1yZEhhWHZMK2dvWXVwSnRIM0J3S3RlaUpnOHUr?=
 =?utf-8?B?dFJpUlJzWFJqYkdXS2RnMkQ0NXZGT2RaTGFYTG15QUFxeUEzZmdEN0ljU0NS?=
 =?utf-8?B?Z2NSdm1yWlZYWVA3UzhEdW5pUjRqNTFiblhvbW9RTldpWTFmcVhIU2FBU20w?=
 =?utf-8?B?b0ZmN011L1N2Yk04UkhjWDBzNmVwN09tQ24zZk5hK0I1UU5GdTgzV2YwSUJY?=
 =?utf-8?B?OFZsMjVhRVd6TUlsdDgwR05tOGJkeWxpdkR4ZU92eHJoSnZ1SXVkWlIxS25G?=
 =?utf-8?B?TTJwUGxTNVVtTHVxek43RDZlSHVsd1RFbDlxd2VsQWlOczF3NUZZWEk0N0hX?=
 =?utf-8?B?blNIQkRUUHNweTVBM0ZQK3dVcDhTYk9Ma1FqVWtacWx4MURYUmlsK1d6S00z?=
 =?utf-8?B?MmhnT1FMZU5TZ3F4QW85N3htNDhSeGRnOTZqQkwxQ3JxOENEa2R1Y2YzU0dW?=
 =?utf-8?B?QXRtTmQ4SkFSbThuQ1BwTFdpRGU1UytKbThSWjRWU0h2QkpPcGVRandNQVF6?=
 =?utf-8?B?dDZHaXhyUWl2YitUNWtYWkJxaXpodGJRdG9COElFb1NON1hOOG52VUlYemVz?=
 =?utf-8?B?WlpzMEtGT1F5UlBCb3JpZG1mRHdsRnZML1ZmbVh0cUgrQVFFajlyWXZ3VjFN?=
 =?utf-8?B?K1BXS2RJaFU3dTNWc2ZobVpaVjlYNGpTY21jVjE2L1NBWnlVQUtETXFSeW9z?=
 =?utf-8?B?enYzYU9PYXRLZE90ekwvOXJrellXaE16WlhpK0NkMEdpYjVIYXRZSkhWYjQ1?=
 =?utf-8?B?bnRHTGxwN1dvV01XcGkxWmo5OTlLZmo3am9BdG5XbVMzVDlFV3ZBNENoSlY2?=
 =?utf-8?B?bHpQNmFJeER6RjdJVG1OS3ltMEtvcVpZYkVPZlJjWkQrTXVFb01BK2ZYTVJ1?=
 =?utf-8?B?QzU0bXY3QitXcHoxckxjb1FPNytSQzJkd05YWWhnWDNHSFlTOTBsYXVMYVl1?=
 =?utf-8?B?QjN6bVk2Z3BMa21rcXpWUnRJYTVUTkN5ZVRyQ01xSzZjdURpQ2lGVGtaUTVv?=
 =?utf-8?B?L0xEend3bDhWR1MrT0srOGJjc3plK2VBeVowOE9jbkxKa3pnZVh6SnVKMXYz?=
 =?utf-8?B?Y3p0d1NKM1lxKzZ6KzYxdUZLMDhwS25HOEZQQjVTQzB5NjAxZkdBTld2ZkFH?=
 =?utf-8?B?a21rZ2J4QjlOei8rV1JnZndOV0t0S3VMWGxoWld3UWpTbGJ2WEI3WHBGVXAy?=
 =?utf-8?B?OGowV3RFcmVTci8vMkJaRVIxbDh0REErb285YU9RNUpJN2gvRzlMSzgxcHo1?=
 =?utf-8?B?aU9IVVdRaWozUnlrSTVzTnhzN2V2ZStzdjA1NEFSaFRiY1dPSGFwL05XYTlX?=
 =?utf-8?B?d2w2QVBxS2dFOFVyalB4U3M1KzdBY3g2Q09SeXVMMzRYRndQMGVITkRPckEy?=
 =?utf-8?B?M012OWxJNDl1VkZIbDU5MlBKYThqa2FFM3dzZDJMV1FPbWxFZ2lMOGcwRi9l?=
 =?utf-8?Q?lv4DO1U5WsVdV3de2FH+5Bjre?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d500ac-942b-4828-a094-08dd34c4d828
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:57:00.2238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /35czqZTGn14Ve/sSRg/SiQdp54MrfbRq6Cmv/Psdt1ISrXDtFZ0abe/gblnDF0pq1adugTfiQMG2SVP+CRmtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10396

Add imx95-15x15-evk support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile            |    1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1064 +++++++++++++++++++++
 2 files changed, 1065 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7a..a2fd3a32e351e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -281,6 +281,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
new file mode 100644
index 0000000000000..eebfd64141403
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -0,0 +1,1064 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/i3c/i3c.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95.dtsi"
+
+#define FALLING_EDGE		BIT(0)
+#define RISING_EDGE		BIT(1)
+
+#define BRD_SM_CTRL_SD3_WAKE		0x8000
+#define BRD_SM_CTRL_PCIE1_WAKE		0x8001
+#define BRD_SM_CTRL_BT_WAKE		0x8002
+#define BRD_SM_CTRL_PCIE2_WAKE		0x8003
+#define BRD_SM_CTRL_BUTTON		0x8004
+
+/ {
+	compatible = "fsl,imx95-15x15-evk", "fsl,imx95";
+	model = "NXP i.MX95 15X15 board";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+		serial0 = &lpuart1;
+	};
+
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		stdout-path = &lpuart1;
+	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-levels = <64 128 192 255>;
+		pwms = <&tpm6 0 4000000 PWM_POLARITY_INVERTED>;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "+V1.8_SW";
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "vref_1v8";
+	};
+
+	reg_audio_pwr: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "audio-pwr";
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_audio_switch1: regulator-audio-switch1 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "audio-switch1";
+		gpio = <&pcal6524 0 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_can2_stby: regulator-can2-stby {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "can2-stby";
+		gpio = <&pcal6524 14 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "M.2-power";
+		gpio = <&pcal6524 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "WLAN_EN";
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+	};
+
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "USB_VBUS";
+		gpio = <&pcal6524 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vcc_12v: regulator-vcc-12v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "VCC_12V";
+		gpio = <&pcal6524 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7F000000>;
+			reusable;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+
+		vpu_boot: vpu_boot@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&btcpu>;
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,name = "bt-sco-audio";
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+
+		btcpu: simple-audio-card,cpu {
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+			sound-dai = <&sai1>;
+		};
+	};
+
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "micfil hifi";
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		audio-codec = <&wm8962>;
+		audio-cpu = <&sai3>;
+		audio-routing = "Headphone Jack", "HPOUTL", "Headphone Jack", "HPOUTR",
+				"Ext Spk", "SPKOUTL", "Ext Spk", "SPKOUTR", "AMIC", "MICBIAS",
+				"IN3R", "AMIC", "IN1R", "AMIC";
+		hp-det-gpio = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+		model = "wm8962-audio";
+		pinctrl-0 = <&pinctrl_hp>;
+		pinctrl-names = "default";
+	};
+
+	sound-xcvr {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-audio-xcvr";
+
+		pri-dai-link {
+			link-name = "XCVR PCM";
+
+			cpu {
+				sound-dai = <&xcvr>;
+			};
+		};
+	};
+
+	usdhc3_pwrseq: usdhc3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	};
+
+	memory@80000000 {
+		reg = <0x0 0x80000000 0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&enetc_port0 {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&enetc_port1 {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-names = "default";
+	xceiver-supply = <&reg_can2_stby>;
+	status = "okay";
+};
+
+&i3c2 {
+	pinctrl-0 = <&pinctrl_i3c2>;
+	pinctrl-names = "default";
+	i2c-scl-hz = <400000>;
+	status = "okay";
+
+	pca9570: gpio@24 {
+		compatible = "nxp,pca9570";
+		reg = <0x24 0 (I2C_FILTER)>;
+
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "OUT1", "OUT2", "OUT3", "OUT4";
+	};
+};
+
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	wm8962: codec@1a {
+		compatible = "wlf,wm8962";
+		reg = <0x1a>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		AVDD-supply = <&reg_audio_pwr>;
+		CPVDD-supply = <&reg_audio_pwr>;
+		DBVDD-supply = <&reg_audio_pwr>;
+		DCVDD-supply = <&reg_audio_pwr>;
+		gpio-cfg = <
+			0x0000
+			0x0000
+			0x0000
+			0x0000
+			0x0000
+			0x0000
+		>;
+		MICVDD-supply = <&reg_audio_pwr>;
+		PLLVDD-supply = <&reg_audio_pwr>;
+		SPKVDD1-supply = <&reg_audio_pwr>;
+		SPKVDD2-supply = <&reg_audio_pwr>;
+	};
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio5>;
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9632: led-controller@62 {
+		compatible = "nxp,pca9632";
+		reg = <0x62>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		nxp,inverted-out;
+
+		led_backlight0: led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_BACKLIGHT;
+			function-enumerator = <0>;
+		};
+
+		led_backlight1: led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_BACKLIGHT;
+			function-enumerator = <1>;
+		};
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpi2c6 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c6>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpuart5 {
+	pinctrl-0 = <&pinctrl_uart5>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&micfil {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_PDM>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>, <393216000>, <361267200>, <49152000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mu7 {
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		reg = <1>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&pcal6524 4 GPIO_ACTIVE_LOW>;
+		realtek,clkout-disable;
+	};
+
+	ethphy1: ethernet-phy@2 {
+		reg = <2>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&pcal6524 5 GPIO_ACTIVE_LOW>;
+		realtek,clkout-disable;
+	};
+};
+
+&netc_timer {
+	status = "okay";
+};
+
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_m2_pwr>;
+	status = "okay";
+};
+
+&netc_bus0 {
+	msi-map = <0x00 &its 0x60 0x1>,	//ENETC0 PF
+		  <0x10 &its 0x61 0x1>, //ENETC0 VF0
+		  <0x20 &its 0x62 0x1>, //ENETC0 VF1
+		  <0x40 &its 0x63 0x1>, //ENETC1 PF
+		  <0x50 &its 0x65 0x1>, //ENETC1 VF0
+		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
+		  <0x80 &its 0x64 0x1>, //ENETC2 PF
+		  <0xc0 &its 0x67 0x1>;
+};
+
+&sai1 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>, <393216000>, <361267200>, <12288000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sai3 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>, <393216000>, <361267200>, <12288000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x57e
+			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x57e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x57e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x57e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x57e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e
+			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO25__CAN2_TX				0x39e
+			IMX95_PAD_GPIO_IO27__CAN2_RX				0x39e
+		>;
+	};
+
+	pinctrl_hp: hpgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO21__GPIO2_IO_BIT21			0x31e
+		>;
+	};
+
+	pinctrl_i3c2: i3c2grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__I3C2_SCL				0x40000186
+			IMX95_PAD_ENET1_MDIO__I3C2_SDA				0x40000186
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL		0x40000b9e
+			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
+			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO30__LPI2C4_SDA				0x40000b9e
+			IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c6: lpi2c6grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO02__LPI2C6_SDA				0x40000b9e
+			IMX95_PAD_GPIO_IO03__LPI2C6_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_mipi_dsi_csi: mipidsigrp {
+		fsl,pins = <
+			IMX95_PAD_XSPI1_DATA6__GPIO5_IO_BIT6			0x31e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
+		>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x40000b1e
+			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13			0x31e
+		>;
+	};
+
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_PDM_CLK				0x31e
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_PDM_BIT_STREAM_BIT0	0x31e
+		>;
+	};
+
+	pinctrl_ptn5110: ptn5110grp {
+		fsl,pins = <
+			IMX95_PAD_XSPI1_SS1_B__GPIO5_IO_BIT11			0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_SAI1_RX_DATA_BIT0	0x31e
+			IMX95_PAD_SAI1_TXC__AONMIX_TOP_SAI1_TX_BCLK		0x31e
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_SAI1_TX_SYNC		0x31e
+			IMX95_PAD_SAI1_TXD0__AONMIX_TOP_SAI1_TX_DATA_BIT0	0x31e
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_SAI2_RX_BCLK		0x31e
+			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_SAI2_RX_SYNC		0x31e
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_SAI2_RX_DATA_BIT0	0x31e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_SAI2_RX_DATA_BIT1	0x31e
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_SAI2_TX_BCLK		0x31e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_SAI2_TX_SYNC	0x31e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_BIT0	0x31e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_SAI2_TX_DATA_BIT1	0x31e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_SAI2_TX_DATA_BIT2	0x31e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_SAI2_TX_DATA_BIT3	0x31e
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK		0x31e
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO17__SAI3_MCLK				0x31e
+			IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK			0x31e
+			IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC			0x31e
+			IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0			0x31e
+			IMX95_PAD_GPIO_IO19__SAI3_TX_DATA_BIT0			0x31e
+		>;
+	};
+
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO22__SPDIF_IN				0x3fe
+			IMX95_PAD_GPIO_IO23__SPDIF_OUT				0x3fe
+		>;
+	};
+
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			IMX95_PAD_CCM_CLKO2__GPIO3_IO_BIT27			0x51e
+		>;
+	};
+
+	pinctrl_tpm6: tpm6grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO08__TPM6_CH0				0x51e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			IMX95_PAD_DAP_TDI__LPUART5_RX				0x31e
+			IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x15fe
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x13fe
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x13fe
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x13fe
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x13fe
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x13fe
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK				0x158e
+			IMX95_PAD_SD3_CMD__USDHC3_CMD				0x138e
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
+		fsl,pins = <
+			IMX95_PAD_XSPI1_SCLK__GPIO5_IO_BIT9			0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK				0x158e
+			IMX95_PAD_SD3_CMD__USDHC3_CMD				0x138e
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK				0x15fe
+			IMX95_PAD_SD3_CMD__USDHC3_CMD				0x13fe
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0			0x13fe
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1			0x13fe
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2			0x13fe
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3			0x13fe
+		>;
+	};
+};
+
+&scmi_misc {
+	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1>,
+		       <BRD_SM_CTRL_PCIE1_WAKE		1>,
+		       <BRD_SM_CTRL_BT_WAKE		1>,
+		       <BRD_SM_CTRL_PCIE2_WAKE		1>,
+		       <BRD_SM_CTRL_BUTTON		1>;
+};
+
+&thermal_zones {
+	a55-thermal {
+		cooling-maps {
+			map1 {
+				cooling-device = <&fan0 0 1>;
+				trip = <&atrip2>;
+			};
+
+			map2 {
+				cooling-device = <&fan0 1 2>;
+				trip = <&atrip3>;
+			};
+
+			map3 {
+				cooling-device = <&fan0 2 3>;
+				trip = <&atrip4>;
+			};
+		};
+
+		trips {
+			atrip2: trip2 {
+				hysteresis = <2000>;
+				temperature = <55000>;
+				type = "active";
+			};
+
+			atrip3: trip3 {
+				hysteresis = <2000>;
+				temperature = <65000>;
+				type = "active";
+			};
+
+			atrip4: trip4 {
+				hysteresis = <2000>;
+				temperature = <75000>;
+				type = "active";
+			};
+		};
+	};
+
+	pf09-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 2>;
+
+		trips {
+			pf09_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf09_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53arm-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 4>;
+
+		cooling-maps {
+			map0 {
+				cooling-device = <&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				trip = <&pf5301_alert>;
+			};
+		};
+
+		trips {
+			pf5301_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5301_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53soc-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 3>;
+
+		trips {
+			pf5302_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5302_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&tpm6 {
+	pinctrl-0 = <&pinctrl_tpm6>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	fsl,tuning-step = <1>;
+	status = "okay";
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,cd-gpio-wakeup-disable;
+	fsl,tuning-step = <1>;
+	status = "okay";
+};
+
+&usdhc3 {
+	bus-width = <4>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	wakeup-source;
+	status = "okay";
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&xcvr {
+	clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
+		 <&scmi_clk IMX95_CLK_SPDIF>,
+		 <&dummy>,
+		 <&scmi_clk IMX95_CLK_AUDIOXCVR>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "ipg", "phy", "spba", "pll_ipg", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SPDIF>,
+			  <&scmi_clk IMX95_CLK_AUDIOXCVR>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+				 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <12288000>, <0>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_spdif>;
+	pinctrl-names = "default";
+	status = "okay";
+};

-- 
2.34.1

