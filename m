Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FE41F151C
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533473; cv=fail; b=qxAxKVcbYrPD4RjtKc8bfqY9VnB21KSKmTvixrXgJlygd9rnrDj7o9WSeSC84q5aqzB/Y4ijWz5LQTG8FxRsSCpINSFUMsCzh/3sGI3OKiIoL3AejCA88u+yswnlAX00mwlLQOeISyoA++EFiumkKt1upQJbpkp1Edz473bUuPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533473; c=relaxed/simple;
	bh=RprRdsZjkV9bbQMEBs0uOHVZcQw86uelba4ZhdRAgK0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=s/Azk25yM3tF/iBm3XmTCbSma1+2im7dDbTXYNy3DT8SWKEwSfgiP5AH7h6ZNVzg+ITzlCXrSySrGPjzl6mlUk9AcZduoJtoU5xOAYlWMxOvw7O+QLIUcJsQOfK3FswHheSjH5AIWgX9ptYLqi62gfR8ibd/x8xVGoFhCbpSjW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cniuj6il; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cniuj6il"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7teNpAR0Vq3/l7+VjUVCfB2qSVrZfAxJdKR8d5uh/d91uZpzgLusmaJ75np5gNFIohKTRSW6Iq3vu3w5GDSQXvCKU8Io8OHhtHDLjjO5om4vEtlMv6mAKpXfpDSZSirDeSUwrBPTZZ78iKCpCF8+dzV9uBqYHEgVYld8vQORgffDwwVWArdA9nuoOO6TwbVqpjT9OP0qQG4v9R5ExP89dQCLLBJOJk5llUnqEfBRzgYDmb+/Hk0Mw7eIVz/gDtVhaiaTkjYn8S9gFW3/7vyn9+6e0T57XTFh9dws4ofiT1z+vDHjMzBMp6m4GaIEYuAbiglRAjh5JMFRyqvNNV5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKRgMFjehQGmS0U2ulBi9AG/VxY0hZip1Hi9YmjUw6Y=;
 b=Wr/SPdxi7e+6QCmJe1bSOLNnsPHSDiNHdLQIwGgJKOITE1VikflgltjggjBFLvh0Fk2/+UAog1aDl+y+/dnJSogD/HdwuRsXChMKRG/3Gn6EdCk6PIiRNdDpMrD09I6NODupR4wlzlgw+ybMib4QLwlpedq7oiYygBq2E99/59efet7iwLDHnJdLe30usu7bTiYqQ5N2m4OipQE9e/FCgnBMa69eb1SBoiZZaAnH7h27D/Q/uI2bKKh/U01aQ9S9fqGFpubNZhCbTgq+p3LUIgM2495z5nukHuhNtg3rb+92BVZzobXNL1VfZ4vL4g7DAxyTrK/x1CQsoyThhSaKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKRgMFjehQGmS0U2ulBi9AG/VxY0hZip1Hi9YmjUw6Y=;
 b=cniuj6ilt5Vdj2DO4EXLmHdKBVOuxUTwRWi95A6bPuj5tXDaWKG3/MUr2ltCrX4e8YT8P4n/S9lD6D/Ss2tVosDcnXNvgcfOW4gbHv2Opd8mbuHqRPujbZyfwrEBCvMJlaIvlfBacPpr4JmEvmiIkvrmjV03X3vtKXJ/fUOukP20ZCAzpAq6xWgv6BNtG3IWkpaZ3pCfpM3mJAiKK0TVl+VUNmO92KvcqIMnt2Oi79aa67zde2Oz2jrbQbovMO8Qi9fb3/KZ3kbOAYvrMO5oere1op/J+43V6taPpiwCRCvIeomPds13y9QYhCwNSbidhFDKONpqe0i3YD1orF1XlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:57:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:57:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] arm64: dts: freescale: Use phys to replace
 xceiver-supply
Date: Fri, 12 Dec 2025 17:57:18 +0800
Message-Id: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7mO2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mj3czcCkvd5MQ83YKMSl1jI4tkIwML08S0ZHMloJaCotS0zAqwcdG
 xtbUAJ8FbpF4AAAA=
X-Change-ID: 20251212-imx9-can-phy-328c2085afc7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 0241d788-c1ee-4eb6-c8ce-08de3964e73c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVJnOXhWcFo2OHdxcEJ1R2w3clRRZHVvM0xFMEl1cDNIY0lmdjNrS3VPSDlt?=
 =?utf-8?B?WXRva2tBR1RFdUVRZ29Ibk04OGM0cnZHbHVBdU9ES0EzeWdKTTdabVFHdjZk?=
 =?utf-8?B?TWtuYWltc2ltYzhXN3VuYkxyZkxvckVGY05GaGdUV2RIUjFqTHlQV29Fci9Y?=
 =?utf-8?B?ODVDNS9FOS9zWFZHNXUyS3hySDlCNEdLZlhmd0d3VlAvYlptQTdlTVBZTWJi?=
 =?utf-8?B?Y001eG1JQllPNGw1bVdEODRSbHdYMHM5dmlHQ2tlSEF4WVNDWmNwdndJMnFS?=
 =?utf-8?B?TGRueU1VWGk4YzFaeE1UZmVnM0hLSmcxbHI4R1RjVThDNzFLQmovK3BpYkY4?=
 =?utf-8?B?L1pCbWdoOWRmUm5oZW1iQ0d1SkgzYXB4MTdhSktVclBCOXZrREJBaXp4cC9j?=
 =?utf-8?B?ZmhGeVptb0F6Y3VZSkY0NG1mOERFNzhjZE5RbzRHMGxXaE5vMFB5U0RVRmYy?=
 =?utf-8?B?RkNrK1Q5VEUvTTZkV0MzVzV3c1NrcnhBTjByN3VHYTk1c1ZuMncvMGtWRit1?=
 =?utf-8?B?M0Vuc3dmT0hyV0t5ZS9kL1RLTk5GRVYycTVsYXc3WWJSSWc2MWVQVEIzOS8r?=
 =?utf-8?B?R1ZMdFFVTjJYNU05KzJLeEJNaGpZb2JUL08rcmhzcmtvWlk0WFoxa0ZVSHBM?=
 =?utf-8?B?S0tENThUNDladVZ0amFnRTRZRGtxLzVGc0tmVFpvcDJYVXNlNUtQUjY2WUJr?=
 =?utf-8?B?eDZ5WDNFTWVKeEhtbWFyaXNqZ2taUmpsNzl0Z2d1Tm95WVVtbHJJdVhUWkhZ?=
 =?utf-8?B?QjMyVkt1em1IV2Fsa2ROSTNwYXRiMFo5ek5RbGJ6VU9wdDVmYVhVRThxRXhL?=
 =?utf-8?B?REZlREZDa0w2WDNNYlFld2F1ZkVBTFkwZzF1aVlEY2dyZ29WMUFmTEJFd3JD?=
 =?utf-8?B?UU5PZzVaS21YOU1OSnl5aDA5cGVobGxmb0R6NGZ6RzFvWHRmUG1PMnhlK1RH?=
 =?utf-8?B?enlqelFTbzdaRno2WE9GSHBOOXBJb2I0OGxDMmMvWnZHRWllMnU2bW9nMC9Z?=
 =?utf-8?B?bHUrR1VNdnhZNVdyQmhXNjVCV2h0V2pMRzROZkw4U3prd3g0UW0vNUplKzZH?=
 =?utf-8?B?VDFZZGhpRmptdHRWVkpJZkdvaWRCTkREWW55aCtMbmk0N2xubFo1OVdOY2ll?=
 =?utf-8?B?cXRBc0ZXVEQzaVNSUy9LbDBKZXhqVDBDQVh6My9kMklJZGwyMm5ZSmJmdm40?=
 =?utf-8?B?eDhyVms0U1VNcC8xYWFqTnZJeWhrbEtRMVh3S1czYjJHaUsxdktnY0szVGEy?=
 =?utf-8?B?a0tyZ2Y0YjNYemRvRGdteGtTYVRJVXVNRDBnZDJDRWl3S0o3N0x2elJhZ2Ja?=
 =?utf-8?B?U3QrWU1XM2dYMnNqUGlRN1lnSlF0MWFkeEJCN01YamxmTGZ1djU4MkRMWDhj?=
 =?utf-8?B?L3hEWDhjZ2dwTXNiOXY0MmFiVDZnWFZKaTYwbzhYTjZ0RWZCQXJqdzUyMFdZ?=
 =?utf-8?B?b1lDYW9wU3VXWFdTcXBIaDBBMVY5bVN0aFczSnFTYmUyOWFjdEFFNGF6Z1px?=
 =?utf-8?B?TGhxYWZpZ0hzaTJGWUNTTDJvQ1lwaS9ieVZRZldlTDBRd3M4MTBqdm83clNJ?=
 =?utf-8?B?c0gzVGNObm5maEpPeW0zb0UzQzlNR09QdCtaVUliaXRjcXBBOEZ5WVduaTNm?=
 =?utf-8?B?a0dYbmJmS2s4NmQyQkd1WGdRclFHL2pTNjBOOVNxS0RMaGxTaVJ1cE5nNnBm?=
 =?utf-8?B?a0xBbTdlZWRaUmtHRm1PSmRjZWVkd0tWTnpXRVBxVnZXV2ZoVjdENndXcytN?=
 =?utf-8?B?RXQwSEZpanJ5NFBTcjdIQXNaUm9CRUErOXNDSDU1TjdDL1dveVFwSmtwUlJB?=
 =?utf-8?B?NFlLU01XbHc3SWRlL1lkQXJ4RDducHlYVlFVcnZZNmFyeERvRTllWE55YUc0?=
 =?utf-8?B?WHhKZEF6K1ZkUWM3dHB6eUpDeXdFYmR5M1czYVdBOUIyQ3NzRi9sbWtWOGdN?=
 =?utf-8?B?ZWxKcVRUbjNEWHNETjA1OWRna005ZXZSQUFyZVlGdmlGcG5XWjQxTlcxeWdq?=
 =?utf-8?B?ZnAzS3hZOVdmeHByRVJZOWhhK2MrTDVxdFhxLzZvQ25aRjN4VVBtZHNQMnZD?=
 =?utf-8?Q?qt5+Uv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3ZUTGZVVGlrWU1QVkpGbVdlOUFFaGlqS0ZRUXFINGQ3WDJ1Q1Zyd29lU1RY?=
 =?utf-8?B?bVVjYVd2UGs5WEV3Z3lGQmwzZU1YemVoWGJLcUY0YVA4dDREMkJ2YW5KRi9t?=
 =?utf-8?B?ZkprcjVuUWZVSzd6TXFmWnpLd2haZmNKTkN4eUF0SHllbkFPalp2UC95Nmsz?=
 =?utf-8?B?ZVJFVXNWQVoxVjM0aTBodDFqRExiY0ZUeXlGTlQ5Z1owa25nY0tvVFV6N3JZ?=
 =?utf-8?B?K256cHdReVhRTWZUL3I4TnpnM0paRnB2OW9rTnJrUFU1N0VQY1dmZmIxQTRI?=
 =?utf-8?B?OXRZTDhxVUpROUtjSnZ5cFNGSHBYOHRCd0Jsb2YvaFRjU0lUZ29vdkVqK3M1?=
 =?utf-8?B?cWFqaWc5Rk84QTdCaGJQM1VadlpYYjRubWhldjgxM3ZRbk5scVY2eDczNGlv?=
 =?utf-8?B?aENCSHgwbXBYYUhoNjhndExHVmd6KzVJOWQ3bTBaVnNxYytMRHhxclFZUy9K?=
 =?utf-8?B?dVN4WkpuYlV4azdiUDVBN0lyOUlUd3dlQ0RKWjRDWDFZOTQ2eTIzVUdDZURl?=
 =?utf-8?B?RkZJS0hxWlZma1o0VmVFTTlQVTlUR1lDMmsyemI5NUNUVjE0UlQ3NzZ1azN5?=
 =?utf-8?B?Q2I2MFFJcWMzVFN0SUFNKzhiWU83TTlyN0lCU1dwc0E5ckhFTWpWMFo3cFJW?=
 =?utf-8?B?Qi93MmtrN052QjFFdE0xUktzbVQ0ZDhFUEJEZHZscHV6eEdQVmpPdWMzK210?=
 =?utf-8?B?Ty8vM0ZGVjVCa0xKalYxaE5heGQweVZIazNOVnRnd3VCT09OQnVqbjdiWlBU?=
 =?utf-8?B?WFYxRzJaK3NkYUdnSUdZV1VxTUxpVS85dlM0bzlPc0cwZjhHd0hRNEpuNm5a?=
 =?utf-8?B?UzRRa0p1djRVRlQ3QWpXaXhJNllIWVFZT0Z3cXFzQ1RVMlRSdGFYYWFhU2w2?=
 =?utf-8?B?R0kzZXNhMTJwU09ocmYzL1VqWm5oSEoyWFYrNTl5dWNBQmIwL0xPcnAzNDU0?=
 =?utf-8?B?R0N6Q29ZMTZMbFdVclRtYkc1bHB2YXBQQW5NV0JVK2REL0YzakVBTUpvZGZv?=
 =?utf-8?B?VERBbU1VNjhKWnFnZ1ZCWnR0RFVjNVB3aDhIc1FvR3NYWHFPWGlBMGFrZVEv?=
 =?utf-8?B?cjVTNlF0NWlIZHF1WjJQOXIwYm13OEREQ09rQ210MVc2Z1JUQW5BYnFKTUhu?=
 =?utf-8?B?NXdBMjdDK3NkYnBMNzB4MWt2clRiTHdiRDBDbnM4T0JQNGtyYkNqbUFyVWhu?=
 =?utf-8?B?b3hoYVh0MUcrL0VJL2ViN1ZSc0luTW9STlZzeC9pcE5paUhIN1I2Qm1UYTR0?=
 =?utf-8?B?aTRWK0FUaVlObTNwd1grdGkwUmxObUNMbDd0R0lpZDVnZmpFTVllcUlyME01?=
 =?utf-8?B?NGJTSmJvT0tFR3BXRUVUbHpPYmd3aDE5U0xlMU51Nm5ncTR0cW1yTFNCYzht?=
 =?utf-8?B?Ym1BbzROL3Z0R0JnWDd6RnQ1cjhhSkpJekxzWkczeE14ZGNndXJ2VHlYRVQr?=
 =?utf-8?B?cXNsOTB6TExmbE1LNWdWTTg0MWp6SThucHdoL0FPYmtuVmFaZ2RRT3g0QW5q?=
 =?utf-8?B?QW5ZTVdNalRieXYwVHU4bG9aam5tVGljOWlIWEV5RTRoc3FEUnFNdzlUNTVQ?=
 =?utf-8?B?N0E4ZFoxQ0VWc3JvTGNsOE44Y21ydUxvbXRVbG5aeTV0R3BPdG9JRjJTd0Ru?=
 =?utf-8?B?cWZJSWxjaGxVY3VNallOZDNKOTdFUUVsZC9aelNITWp6Ny9jT2hMY3BoZkZ0?=
 =?utf-8?B?Vk1zM05NMG1UVDdwR2VVY2lwMU9LeDVQNW1TbW8yVkRGaGFTa0hHVEQ5Q1Nv?=
 =?utf-8?B?enNVTHQ2Vnk4ZDY1Z0JzSGQ5ZGhHUmZkVlBYdG53cGU1Nlp3RTQrWDBnM0dW?=
 =?utf-8?B?Tm5YVWtTVlFtMktXdUJsOEg2TUsyVG53TWxGbllyUmtxbnZJalV1TGgvajJH?=
 =?utf-8?B?azhxV2NPeFZNamxZTkllNExyNGhoOXpBc2NwanorUGU2V0tUSzYyWWs4d1No?=
 =?utf-8?B?b0UxdnhjZzlOYW1nbkQxRi9TNmVUS29HY25IdUExU2E5L3AyNDdHL1g2TFdp?=
 =?utf-8?B?Y2hybGRrU1E5SkVwM3l2RkoweCs5enNrZjZmREl6VDRDT0VFaVJlN0NBOFpC?=
 =?utf-8?B?MUc2bU9NaWN2ckRxaWRzRGcxZlBIWTZScXpESFR1aVpEQWZ5cTBBZndNS0JU?=
 =?utf-8?Q?uyz1pZV0yTVCo5unwGYoW8jgs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0241d788-c1ee-4eb6-c8ce-08de3964e73c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:57:47.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltT5eRS3Wreq36m81NkkpAWm7s4VgkbNxTo+EckTCmvn9lAhl1TOVPQGCYMZli+DsKLsH+o1kknSWCTzH2bDaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975

This is a pick up of patch 6-8 from [1].

The drivers changes have been picked in 6.18, just resend the dts changes.

[1]https://lore.kernel.org/linux-phy/20251001-can-v7-0-fad29efc3884@nxp.com/

There are still some other device trees not converted to use phys,
those will be converted later.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      arm64: dts: imx95-15x15-evk: Use phys to replace xceiver-supply
      arm64: dts: imx8mp-evk: Use phys to replace xceiver-supply
      arm64: dts: imx93-11x11-evk: Use phys to replace xceiver-supply

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts      | 43 +++++++----------------
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 17 +++++----
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 13 ++++---
 3 files changed, 27 insertions(+), 46 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251212-imx9-can-phy-328c2085afc7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

