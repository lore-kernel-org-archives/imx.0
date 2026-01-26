Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193E34D912
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451306; cv=fail; b=E7a/9PWwvAxvUfOFJGcNf6nv8UqFY0048idJhMZoCgapUefhKdKXoC4zoqOK0Meg7+g9l6a4pGmgAg2Yr1S+iWxaJCJ4SVKMp7CwFl6eQPUOoqvNML3M1fV3aQRY7THhKPjI6jnOtqPW0NWTgMuhw9+AxSV5kott05pi3x/AbCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451306; c=relaxed/simple;
	bh=eIgDAnKqqSWEx6TluwPC0Ph7qFMUJjBAPx31W8XtEg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZVYqswR43scuFdihHL1jlCau3I19WinrmsfnnCNQqHxFqscOWG0pmCqOtJk8P25bbL/7+qvkqpIk3uxyRlGde30Gi/R13ZuOJURDlCbtR/vxDmaXXsVAM2/WvYdGjqTQ0hR5TaoDnhp26FsSWWKCBDIkYfoSGDBCPBRilWH4xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bYPmFq1N; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bYPmFq1N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpO6/x2voboRhBBbf274AQVZwF0hYIZyJlJy/eHOpbhwl5OHi2acCBag1msa2hTGKuYgRvJoqxBL196IN+LkbMEbAgZ/1XtjGQOj26kL0tj9pt1Rui7vILZ29vBQKw6SMeJLW8rujFkaOjBJOpp71Z/uAeveslOBEA5rMg5nNNySdAjOdRXwVIX/3bwm8hHh25HbBaJZlZ6xFhX3SdZ3adkXLX1dAWSfNwDhneo2tGK/MlPCHeNQoNQDs0lL9GPz8doeLpXguTNjWzQa2yyugL0AnGTRnOsNP5m7LhHuxp66Wq2nfpw+UoXNeNsBiOZt2c18L96k81cTlCbpQIggpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAFAcZJgTfC2fiG+5RDbNIiC4Wu001zlBAC9ToN1JEI=;
 b=DNLmFm+195TWPw7xNvJVGH4+VCqbaX1RSWBt2QOG+2N55N38euntG7RCCctgdH9/8tAtA5GLuW/VqL0S0zXnBHz5TgPILxhGOn3TdcsvUryevrykt5SN6FkUAZwZQz2EC1gMjZSR+53FgFd2e677gTC9XyxHYHABtltog4whTreRs/ZGDgKrLVSeqZGfD6QYSDuUvuZxNy4DN7h+YJlIgHYWkT5VsFYlTVfQQrHWXW1j3VVDV3GESj2yV6D7cmNHCyLzOfuPXeg8ZFF/9kZAu8DDc558OZPE5/IgdjBBdcemrolCMrsMfFBenN0tZgJVRh5cQ/ESbSFNh72Un2JlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAFAcZJgTfC2fiG+5RDbNIiC4Wu001zlBAC9ToN1JEI=;
 b=bYPmFq1N4gHLHfKlzcaE1nRRol8CdGgnkxScmNwN89aYVKDM0fSqMqbnAiHHC01SD+z3R1sML+/FljYKdyalLhUIYfgeLW8wU080CMaQUGhn4Q1PvBKkK5/ARhTZIrcP2IsQagLVmGQrEMWmHaEs7ul5Ti9n20LH/wHX4FPw0x+cVhClAzYl2Mv5KihRYPxkbOlRmp6golGAy+ZHuTop7nsiGWQG0t8l15BNYNhAqrPUNbUZof1+oViZSIURyWy238mpYO1AIEBo681F0Zjwo0ABrgXMR6wfrwMMSus0TIlZZW1xtPzlC2yidarUrD5cGA2bWbhuETaC36VNMIAp+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA6PR04MB11716.eurprd04.prod.outlook.com (2603:10a6:102:520::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 18:15:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 18:15:03 +0000
Date: Mon, 26 Jan 2026 13:14:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock
 frequency
Message-ID: <aXevH8e+9qLhWO7D@lizhi-Precision-Tower-5810>
References: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
X-ClientProxiedBy: PH0PR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:510:e::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA6PR04MB11716:EE_
X-MS-Office365-Filtering-Correlation-Id: fa62bceb-308f-46ff-3ae8-08de5d06d383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk9waXVQOGZ2QVFzajBJTnVadnhpM3lEUzd0SDY2bkZidFJXeWFkMDd2alZM?=
 =?utf-8?B?MEVMOTNQUm0wT1dMSkhTMm5WNHp3SkxCM3lCdEUrSkh2TmgrZTA4UE5zR3dL?=
 =?utf-8?B?WWczZkF4QzkvSlFhQU9qTXdibWtNQlluS0VDajQ0UmVFSkpGVW9ia2p5NUNH?=
 =?utf-8?B?QnlNd1NYbG9TYXVXWlN5ZmF4TWh5Y2k3SXE4OFhyOU82aHN5aFE5bFhPM2k5?=
 =?utf-8?B?YnhjK2lEL0l1SUtLM25JZCs5b3JuVDUxOUpnSFhKNTR4ZkNCOFRhMEkzUDNa?=
 =?utf-8?B?RHJLWkxZSnkvUXBuemY1YVdQVWdBQ2FrTzFqTTk0b21VZzVCZ25LMXFvSjVD?=
 =?utf-8?B?QmlmVWY0THJoUVBFeklIalY3Rld3RTd5ZytBdEc0SjlCNXhzdytHTFM0ZTdw?=
 =?utf-8?B?RDJSVWpIc1NLeDRIUEk3WnJ0anpwRWtIR1VOKzk0N3JyNnJVNHM1R0pKOWR0?=
 =?utf-8?B?ZlcvUDI1Z09Za2dSTzhld0xzZzc1MzR4aHdRZE56aCtCcGo2bXpqQWo1R0hi?=
 =?utf-8?B?Mk8rUmsvQjRSR1ppeFg5MmY0NnpvRzRUWVNBOEpxSUFOU2hrandWbkdUZkdI?=
 =?utf-8?B?NkNObUVuNitDUDBzbU1haiszbGRpbDZNSzU2UTB3cmJvNE9aaHQ3SkZ1eXB3?=
 =?utf-8?B?TmpWMEYxeDBDSEM4R0Y1NU5jRHo2LzMrenU3TVU0QU8yOW1tZWJtc0xJTHp2?=
 =?utf-8?B?cDlKcTNmTEdYQ0pYRWk4TzRsZjI5VlZGc0dQUG5LR0xLcjBoYWZWQmNxeW45?=
 =?utf-8?B?NDdhV3VlTk5PdlBmWDdCUG1yZVNVUnlMUTZUQXhJVDVMRlpxNDJ6ZUJMd3BN?=
 =?utf-8?B?cUFEWTZxWGptZ3BFR0xQOWk0NFBvbG84UllKYko4TTdLRkJFZ0l4alErUnJI?=
 =?utf-8?B?cUU0SHA3OTNodDhETHdGVmduVEQ2cDJjVWt5V0tVMEFQcktzSll3SnVUcmk3?=
 =?utf-8?B?K2xxMk10QWtEMjVVRUxXaG9NS3BUQjlZQkFoMGVIMmVwTHZ1N1Vkc2Iyay9T?=
 =?utf-8?B?bVFORk44KzI5YitIWldGdkdjU3NBbDgyVFdVbU9QVFlIRXFUczlrOGhWR25D?=
 =?utf-8?B?eFl6eEJxMW5ycFA3UWNHQW4rYmRCLy9Td1ZxMSsrNGtEczhPTWVTb2ovNG1v?=
 =?utf-8?B?L2J5cHpLOWpsWmo0S1piZm1mOXgvTzVSTm9zUkd3VXN4b0JTQ1BhajVKWldz?=
 =?utf-8?B?Qko3NmtQQUhRbk4rK3p4RFVQckRFMkNVWDJuV2ZKbWdjWGt5cFNJYkQxYWZP?=
 =?utf-8?B?TWI3VnZDemNwaUhWQ3pDVjZEYlhJMkdKa3lvMHhOVFhDV0JRb3FWZ051S25N?=
 =?utf-8?B?d2ZJdVZUU043c1JsN2JWZHJWb2tOMmR1M3ZhVk5UUm1wVmdHYkNXTDNtUVdR?=
 =?utf-8?B?L09jMzIvcFZqOUxCWUxFM3I3eXpIVnEySG95bVVmVGRNcUxFYm9PVlVsYWRj?=
 =?utf-8?B?Y1lpMU9ILy8zQWFFNXBuYlNndFh4d2ZNNytzazV2Z3RydzdCS0JOejVrRW1N?=
 =?utf-8?B?NGQ1aG4rYVhmRjY3ZUpLMFpwdXp2ZUMzcXhLdjE4TnF3Z1V6cUxHdkdUc01E?=
 =?utf-8?B?VW96SDhqRG42d1pCLytia0xTeEk2M3NjR0pXbWYyU1I1dWRyeUpzMDJTQ21v?=
 =?utf-8?B?a0J4MXo2K2RId0doOGdWRndOR2Z2SFNGQjJsQ2kzaUc0SForS3VUdVhOU05t?=
 =?utf-8?B?TEF4c3lycVRTUkt5V09KTDQyWndWSHpTaW12b3Y3SmdmZGJVR2tFTGZnR2kx?=
 =?utf-8?B?bGFLYnZwNnJzRnNKd251aWUxSUt2Vk9lZmpzbmVub3pMN2xjUE81Ym1tMHpa?=
 =?utf-8?B?RGhBK0xWNE1sK3Q3S3BqQS9UTkdSUGl6bS9uMzBhK0oxclpVQ2R6S1VGUjNa?=
 =?utf-8?B?Q1B1V2V1eUplMnJCQlovL29HQ3BTcmtNNThNWHRvWG5DREtJenNHYnpmUkpo?=
 =?utf-8?B?VnVFclNWSjU5YWdtNHp0elpPMnZxVmhYeVo3emx4cFJyVndpdjVNZ1dTa09o?=
 =?utf-8?B?THE4RUY1Q2gyVWFuMzhQcjFGcjRKL1NXM1RWZTJYb09jNnJ5ekZXdjB3UTRE?=
 =?utf-8?B?MzlHRWkybEsrWmRPMEMzclhzczl6YXVNQjdMdnJCYnFCVXY4Q24rQldnUXdz?=
 =?utf-8?B?UnFtUy9zNE05MS9jTjFRNnRMMkRYbGs3ek9EYTZVazEvYURwZ2F0NDRiaWhm?=
 =?utf-8?Q?y6WpOH52pIsH4LBmy+64ADk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VndXNXdNcDYvOUJqRllKM0R4TXhRRFRmRFZpbWhSYTl2dWcraDhEbittSTJR?=
 =?utf-8?B?SjZpYVFyQTZ5czZZbnc2OERoV09OUW4wbENBMGowOHJYTGdla2xyM3NRVVZ2?=
 =?utf-8?B?T1ZQdDRiS29SRzR4Y09QRTN3RjZGZmt5Z1o2WE1QWDZ3dUJtUVJESHpNTGYw?=
 =?utf-8?B?UUcvVUZVVE5idjZKRzAxTDNJbE4xZmFHMFY4MDRpNWkwYUNlbGNXa2c2amdY?=
 =?utf-8?B?Nm9UWUVzTC9ERyt6M09VdDBWeS9LVkpVOEdRdlVMYklBem1aTVAyVzlMdnJE?=
 =?utf-8?B?MHhYNkpUTXFUMW93dm93dmdNLzYyNHZJd09qbC9pSmtnOUxSMCtyQ1dJMXVZ?=
 =?utf-8?B?eUViWnpWQmxHd3F1TVRTL0tQTCtXSDNlYlZxVlpmRzFEQVV6ZGNQd2JmbnNZ?=
 =?utf-8?B?SlNTOU1lVDhqTVBQdUpDMlAycDlRS0YvWTMzQUMwRGZsUVdsMXZGRVhCdFlC?=
 =?utf-8?B?d0hEbW1FNVFJVkxUN0ZLTTcxak5lSTB5Mk5xZmhNaDBDQzFlb0hoclp3UFky?=
 =?utf-8?B?R0czanY2bldXR3UzMXlFTUVYTzJZMUNhVm4zT1FFR0tNL1FXb2V2ekVvWWFa?=
 =?utf-8?B?dVZXM1VJR3FFdzNGR2JwYjVldUtyRUhVYStHem1EUVJOVUJWbVVIbE9CRVYv?=
 =?utf-8?B?ZWdKSy9PeWo0dWFGdlJxdURqakIvYWN3WTZhUWJTYUJYWGVUTEVtcUpFd1Z5?=
 =?utf-8?B?OXRHRXVLc2dPeFBSMC9HaTFycFdtZG1jTlJ0TmhsdmpLQlNSbHgyb2V3SmhT?=
 =?utf-8?B?SUZDenl4QjUyTTN1dklPM0RJMHdjWWJ0TjdJekZvRW5TUmlrY2JOd3E5SFdv?=
 =?utf-8?B?VnJiUnhwMXBwL0xZb1MwMHY2azlCZ3pxTW1NVnBLU2ZqVXlaWkg0bWVZSk4y?=
 =?utf-8?B?OUZXZ050Z1orQ1Z1VEx1RktMa2puK3VHKzQwVnBUbE1VS0NoOVhmbll4L215?=
 =?utf-8?B?V2w4b1Y3MHFJLzMydEduQm5XaUhKRlVKM0UzOTVHV2VhOERzMTUveFhnMG1U?=
 =?utf-8?B?QnZOb3NvUXlkbGpqdmVadjNqSFM1WlpQMk1pNURlekZXZTIyNVRaMzQza0g1?=
 =?utf-8?B?WnhLSi9xWUJ1VGx2QkloSnhtQXQyVW5YRTUxU0NwVWJiSlpTK0NxeldZWEVX?=
 =?utf-8?B?SDhBa1pOUWl6M3VndTBBL2V1QnJtQlJQTVk1QmQ3Y05yNU5aUkJ2RFdvNHBS?=
 =?utf-8?B?dGlwOGorWnJZTkwwbmNtazVmUUt6UlRlbUgzbzI0WVFIcVBkWGNwQkxDMXZ2?=
 =?utf-8?B?RUVOZTJ4b0tZSzRQcUJMOXppWGc2bWZWdlFDZ2JoZndJcmpDSWJYcldTd0Nq?=
 =?utf-8?B?QnBXSzVkZkxOYzJGMUU2b3g5WVEzb0YrbThQS1l4djRmVkxWSS9IV0VYeWlQ?=
 =?utf-8?B?TTJLVkVQMGRRaUhleXplOXZiRjdBSEFJazNxYzYzNVFjTCt2YUtCUit2SzMx?=
 =?utf-8?B?RUlrTGs5Sm1NQ0FtUlR2YnVZTkp2SlEzdFhtYnd4WEZXK2tDTC9HRkg2eVNm?=
 =?utf-8?B?U3QwRlNXdnJIcy9xd2djWFdOdEVJUkFzbU1PeWhnbVYxMEg0NUgyUkthR1VT?=
 =?utf-8?B?dnFOMkdLdjNDRDJjUklKbHJ3TnZkdG9OZzUwdHZoRnJKZzhoYkR0bGdyZlhy?=
 =?utf-8?B?bFMvMnd3Z2VMTlkzaS9SR1hpOGNVRU9tcG9zRk52SWZIYmVUSDJ2QnZXZ2VB?=
 =?utf-8?B?dEdHSWRnUTVOZENWWFpqNDlwMFdzR0s3VVdLSmx2V1NLRVExN0RqQUJnZ1pW?=
 =?utf-8?B?d2dYUUIwQXE1OU9pWEtFcDliVEtaRHlhaXZzWFVEVEpVbHdUcGNCQ0E4Ukl2?=
 =?utf-8?B?ajdleitFSVdXTlhNdGtCK0NLQ2ZmNzhzTllFQytMYUdqODlXWmN5Y0VYMGNS?=
 =?utf-8?B?NlZ5QWh5amh4dzhYcVc0cFFQOC9YUWh3MTJWV05hRFdSMWRiQUJkYVF0bjh6?=
 =?utf-8?B?enJ2NHlHT2ZRbGR5YzZrdm0xS1F2WTNYVE80aFJVcVNCZ3lHMFdvaGFsczJr?=
 =?utf-8?B?Z2hmSGtkRGhzaWxlRGd4eTI1aG9OdEo5NS9MK0kyUjVHeE1CMHdrZVd2b1FJ?=
 =?utf-8?B?QWFCcDdBME5qdzErUnl5ZGcxM2dvWkhYQmxHQnhkdTBUN1dPOUpOYWpqVk12?=
 =?utf-8?B?THdxSUd2ekdTV3NVazlPVHlHcy9DWE9iMHFESzVpZ1ExbGRqZ2YwYyttV2R5?=
 =?utf-8?B?c0gvWGV4SVlGd0dUWTBhMlpJQ1Y5SUZteWEyTWhWZUVLVHpUNEJxZWZuQmNV?=
 =?utf-8?B?blUvU3dlWXF1QWl6a3MyTys4c2RGeGIzclZ1cUY5cW5uS2JBY3RjR1VoOTVD?=
 =?utf-8?Q?1RgFKgANeQD/tswkpd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa62bceb-308f-46ff-3ae8-08de5d06d383
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:15:03.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxb/hTQt3VMQVnjOCIuWJcOOmzlTJr9Elmuo742gk8XChmXUrBNRaVgp2mnaJsdipCXvuMVDRxhKXyo5Y506AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11716

On Sat, Jan 24, 2026 at 02:55:48PM +0100, Sebastian Krzyszkowiak wrote:
> According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> frequency is 400MHz.

I checked datasheet

Nominal mode—the maximum
GPU frequency supported in
this mode is 800 MHz.

Does difference grade (industry vs consumer) impact max frequency?

Frank
>
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 607962f807be..6a25e219832c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1632,7 +1632,7 @@ gpu: gpu@38000000 {
>  			                         <&clk IMX8MQ_GPU_PLL_OUT>,
>  			                         <&clk IMX8MQ_GPU_PLL>;
>  			assigned-clock-rates = <800000000>, <800000000>,
> -			                       <800000000>, <800000000>, <0>;
> +			                       <800000000>, <400000000>, <0>;
>  			power-domains = <&pgc_gpu>;
>  		};
>
>
> ---
> base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> change-id: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
>
> Best regards,
> --
> Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
>
