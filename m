Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D1355808
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802070; cv=fail; b=UaCmUe6uZLxopookjXEajY4YmiQEIVvZywg2EHm3b8JhvZsCbqWv61Hq9PFsiT324oudcpnyqIrVjVQOPAa90cDQpQ2hqZzd+wrAbXtfyvy0/8Mu1gbI8U4hL70IOTzxE37owN3chmsQtWUo5ghEupKuSj/21ynzpssaMdfc3jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802070; c=relaxed/simple;
	bh=ol3hvwp9V3W2QusRhkK+E3n8H29JeMxJNQJ3VPkK5l4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BcNarC3A8tFKib0nc76q2ptpZIr4UCwYDyyQWPAX8i+7hX7bAjZ4sZ4qK6TFktNGwsTbrIr153/dNzeDhXybGujLJAi46V7pYBfukiWNKoICuVNsSrDDeCOHSqpTs+W7vQw8EkfrkmAFjumBCTREC8EL1bdmJVSABq9gaK8EWzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fSmMl7Uk; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fSmMl7Uk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFnWEPS1s8x4uGvbZzsX6nJgdGm/kRl0gzMhTUNM8Pwm/lKIcKAfpoNkztRfM5cnB2RaipALII5QWByPMd7EvPJC/vgqUjbr0FI3KCKtEUvNgzDOhgSfkw0lPoxkXwJ76cFiteMlgJYY70KJFmhQWfpyUmK7QJZuOH9DZ5akOhAvW5Ho6OJXd1wchIbuk/5XVUQ1RwvdJMZRCGaKpFazxUIlulQcb8gQ2+o6BTLSgMl0tw8vXkLe4QGN0x06yT08aZCU9gU7UF3M6ITrM+hmji5CnFXZTZGtYsQli0hR2iHgIkTzdEekEIK+VTPjqlcA5DEeitIdVDONmpdV7igiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0B3TqSjfM1rKWL+GzYH0YxvCoEe4Z+lcOjVtVdYW+c=;
 b=bEYrG6/Dlj5e9pv9lsQt/PY8+GP8NXR9KUt0FFwaZgNKZ6yQrUZlrGY3xC/6TYRN+gtVzlH3QLi+woFRCpQb2urKvKKFXtFxnEjjfDbIR80Kwse5Lf8lsaCMGYv7+rQYPmLfBTn+NH/wi0j2sx8WTL01qR01w9PQTkcIltBWGiBUmLhdW9o1rZYlRgK3q1DKEnUocSTjATjNS4zIkxasbXqNBZDOsVH+E0X4NflWbCQx98gUy7pLBCrodzNvqgjmReSdzftvOq/xtZ7AHlDvexcMNmiZbcyBQhztwSKMntv1oTtcvHwGxQIoAnUDGV/jUhvQYwR1dkEsG0+CrgMKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0B3TqSjfM1rKWL+GzYH0YxvCoEe4Z+lcOjVtVdYW+c=;
 b=fSmMl7Ukh6uJm9B9YDTCTvC5TPoM5V1l+GTfqsomJFqE501zVk1oNYzDmUTSVVNzgbIkYcUTGnzpcJH3/hvMW0LkGYBBjTozwuQy0R+2dxW7ao5HDgL1nWwfm0+rE5NOKBx8mcZGeLeI6OT1k6C23AbiJpzmPmKEwxajo0u5ORuFkjR41sXC+FkCF3iZp7jOjXOI2csbDBQPDLq2YF8s8TpRt55QzxosztE5OIYlBKEAj7wAe0gkQ4ocatnXBXWwSD8CVnGSzRjd+4a06Szj1k34bIi9Ske9gXUdXdWipA6CQ8YAdVJRwgVCm0ShSEsO2IBj7Tfcfj/ZUe60VcS2yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV2PR04MB12020.eurprd04.prod.outlook.com (2603:10a6:150:304::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:27:46 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9564.016; Wed, 11 Feb 2026
 09:27:46 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Wed, 11 Feb 2026 17:28:24 +0800
Subject: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GV2PR04MB12020:EE_
X-MS-Office365-Filtering-Correlation-Id: 550d84ba-fe70-4f48-3b75-08de694fd07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1FJc3FpeTU5QTBGWFFLelJ6Q0ZQYy9jRXhURC9uamNoSWRvUXFFbHd2QnMv?=
 =?utf-8?B?RW02R1RtSklRYUVURkp6NG9SeTBwWWR5REV2UVM4TnBaNjFraW1ITnlWRVcr?=
 =?utf-8?B?NDJaeVRkUFpESXA0UE9ubHRkb2ZsTHFGYlZqZCt4NThGZFJPS251aHZQdGZt?=
 =?utf-8?B?dXB3V2lzU0hyb1BKWjlUQXVCRHFJcjlwcUJ2S21NRVNvR3hxUXIxb084M0dm?=
 =?utf-8?B?eVNZNXVPMDRKTVhaait1M2lLTjltOTVId2V5OG1iQ0hzc0FlK0oxZ0orakRD?=
 =?utf-8?B?ZC9pS3p3YXplYWpGYVNZRFRuUWpHUWIxcHRUM0YwTXVGNU5RcG9XZmNGOE90?=
 =?utf-8?B?aTFDNmo1dDZET3JMNUp1d1h1WmdFaHdoVzZDMFdSZUdVY1VHc2VjNzlobXds?=
 =?utf-8?B?d0x6RFVDemQwNmNiY2FsUmlOckZIc3dnTDVoNFN1cVR5aUpiVnpmRnJpY3lr?=
 =?utf-8?B?NEJnZ0lsUWh6Z3BFaVFhZklRSWNBQlFDbDNaQXltenZEVWNJYXRWdjZaLzY0?=
 =?utf-8?B?a2dMWllrNVFtZVJMa3Y0Vko0UkdvZGZOdGhvQ1JPZFBESExZZXhhK21JTnh6?=
 =?utf-8?B?eThPNmUrWjZMeEtXWFZNY202MmswU3MyU1VzK0x0UENrMjVRYmZ0dWkzbEZo?=
 =?utf-8?B?SGNIbnBzSTd6YzVrdkRaOVRRVkllZkZ1MVFPNWozVmVPWE9qWXF3dGFZVENB?=
 =?utf-8?B?UDd0Q0xRaVY3L2NOTXIrSCtpTzlpU2k0MTJ1NjQ4MEtZWmZ3Z3dSanF3WDA2?=
 =?utf-8?B?eWk2bVduSWZEQlM5ZWZZU2ZucFN1Nm4vczFydm1NQTFqM1lYak92c3I3Q0N4?=
 =?utf-8?B?VURPaDBhNHFNUjBISWxaU0QveU5sU2J6bWt3TnBET0YxM3JMbi9mYWo3V3Y2?=
 =?utf-8?B?OHFSQy9FQXk1d2pKS01hT1VRbWZ1N0dFV0FjMlM1RzdlQ3BRVWxHOU44MXYw?=
 =?utf-8?B?UUZ3SXN4eXVkWDA4UENHY2s0WDFscW5SMXd0dUJQN3p6QkFFMkh1U2ZybEdI?=
 =?utf-8?B?a1JnOVdtMGI2dFFJdzgxZUNqQlJKcUkwRXNmN1FwVFpBcS92UWlxamwrNnJa?=
 =?utf-8?B?NVVjZWlnUnJoaFhrYVVhYkhOLzllR0VOY24ybTY3RDFFT2ZKRnhrYmlLTXRl?=
 =?utf-8?B?VEYvNGNoQmFMa1B0K3IyYWMwNkdoUFJPTVNhQU84Z3doZEdoVnJiSHpFbThP?=
 =?utf-8?B?NStmdjA4M2ZuTmkxYWtZWG5XMEcxMFdCcWJEVldaZGFQOTJLSlhZbzJacTQ5?=
 =?utf-8?B?VXpaZVdnZ2k2OFdVRkxXZlJuRTgvMXBPUHBCdnZhS0lURFVoTU9wRlRjYjZx?=
 =?utf-8?B?amJNWW1vZnd0SW9JNDRuaVNBVk5CVldaTWpibU1xbUVJd0t4UDJsTlNIOUxE?=
 =?utf-8?B?aDF1ckpmdEwyTk13aEh1MGFlQlBYcUdZcngyWVpoWTJKOFJvUGVtLzRlZ05D?=
 =?utf-8?B?T2FoWUxTOUZKMVI0SzVZbE9FaVpDVko3QkdtdDlEWW9ISDJtc1ZxMGZod0NR?=
 =?utf-8?B?dFVVWCtBOGNhOWJYVEVqRTRMK0hDLzF1bXVQaFRZYlZxQnRWRmxOdlhBbDQ3?=
 =?utf-8?B?Z20rQ2pkYWdDOGFQMGp6VVVHWXl6VngxUU84eGpFR2t6YWNsVlVpOU1SQ1Vu?=
 =?utf-8?B?R0pSb0NwY0dLN1E2YXd0VlNpNXUwRFVGYjZMV3RpTFBCTko1RElwcnUvdWl4?=
 =?utf-8?B?QnJNN2UxWm1EcDZzZTJhTDk5a0NqalhRYS9KdVY1V2xCODh4dDlQOFROY3Y3?=
 =?utf-8?B?VVBXYm9icFlyRVFkclZYQTJzZGdNTzYwUmlObkFoUDhjK3MzYlg2YnF3WkZp?=
 =?utf-8?B?OUhnSVNzM3NJZ2RJZ1pjLzNhY1ZyUEFaSWtjQnBzVnZnRDJvaWM3TmlCdkJN?=
 =?utf-8?B?S1phWlpzOWtwNlpiMzRIaXVpR1FWNU45UFBOSVlaWjlrc0RtNVoxS29Rclla?=
 =?utf-8?B?cGRmaFJNV2R0Z0srcE1vNU9ia0dsRWkzQzUycFJiWEo3eU5WLzJNUDM3dDB4?=
 =?utf-8?B?NHV0aE4wbDVKTHl6YVVPVC9mZW1jZnhwcDdvWTQzOUtTQnpib3FCT1NrMENX?=
 =?utf-8?B?QXlPRDZYekxkRGxYZERqL29PK01BZmpQQ1BYSE92SjRWUUZzMDVVaVhDbFBj?=
 =?utf-8?B?UC9ucUIvUkF6dkk4aTlSdWthOEVSNmc0SCtWNmx2Q2RIdkNVL3BxS3Y3V2Yy?=
 =?utf-8?Q?ThNVDmD0BbNVBmqA9IqvzjKO1/u4ATdiBvSax8T+8Tme?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U29VcUFGQk5EdkdHbk85N0RYYWNWdzBNTjc4ZnphZmtGRndBUWJsSEp1bmhV?=
 =?utf-8?B?NjAvbU13d0pkQ2FmTHhFUnB2NVFDUmdwSVNlOGpJektlNDJVcWtSQnpVdGdm?=
 =?utf-8?B?S2M3TExQeWc1UDJEdkpXSUNYNVNOOWNCZjVCREhMdjAyNWtpdTFZRVFlcTJk?=
 =?utf-8?B?S0V1WktoVngzOFdsNU5NaEhkRzNOU1dnN1FsMFJGRGF4K3lBY0dMQVlXd0Jr?=
 =?utf-8?B?bzRsZzkyZGlJbklHZkFRRVB0SDFCT2xSQlBhMnFvbXFvd1ZiMllBM0VVb2xa?=
 =?utf-8?B?eUI0N3FvY0RZTVVJR2xyQnFQZjJ0UkF4bW9rQzNhak4rd1U5WEVsOVM1clcv?=
 =?utf-8?B?SHNFc3cwZFpCM0Zvc2pPcU5qc1Z1S1hxajIxeUhsMWpCbUF3L1pPVFBRdjZ0?=
 =?utf-8?B?RGdXL2dGNi9vTFpPUVE4bG0rdTliS3EycjhqYkJFVllHcFM0blhoR1V4TEFy?=
 =?utf-8?B?S2pVL0gvNkZUN3krK1oyQzBSQitrdGlLOHNmdkZRckJydXJJWVEzSmc4d1dT?=
 =?utf-8?B?djlORkhTa1Z3NWlQdnBheWVGbUI2RnFwc0lqbTExMWdiZStsK1l2bm1UTEFn?=
 =?utf-8?B?dUU0RXFlVHZRcE4va0hiTDV4UUtFYUV2MjJHakl2NVhTQ2cwZXJkcDc0V0tV?=
 =?utf-8?B?RUdOUWJIWVo2bnF0OXNBSko1bDBheHpjOXdnWk5pcCt5YjBJcXByV1N6aCt3?=
 =?utf-8?B?YW9jaXF3MEovWmFqRzRDK1o5ekVPLytPY1E3ejQ0RWd1MHlmbjRGZXZLZ3dD?=
 =?utf-8?B?UktQZEhMNDUrZ2hIcDNieWFtS1I1NGo2NDcvcDlTWnBRbEMzNnRRTDBDREVU?=
 =?utf-8?B?eVY5SVFiT25WVUN0eXYxVzEwWjBrWU9vcExyMkFzUHVMZHhYc0hPdDZvaW1y?=
 =?utf-8?B?Y1I1TlBkNmpwQnhNV2pBZ1luSUM3UjZ4dWxCWkpkbTVXZG44M3JSaWtPTU9S?=
 =?utf-8?B?VlJIY0dJOXlyOUNvUmV6K1BjRGtuMlhqZVdXNW8vWXVmcTBSdHY3bGVMUXlV?=
 =?utf-8?B?S0dUVUlMWit6UTFSc3BiQ1dVcVV1eDBSbFkyd2ZXQTJ1SW9mWHdpd0VGUllZ?=
 =?utf-8?B?WmtMTTZIajJQZk04c1UrcEV6aS9pZkc5dG5pU01HUWRPYVJFMmNzT3FLa3h6?=
 =?utf-8?B?ZzMybWp4TEhRU1hxZU1XdGZrcTZ0WkF4ZGFXakxMdzdMTW43WkNlV3VlNmU5?=
 =?utf-8?B?VHd1czkxMnBvSHVyREJyc0NtUWdIbW90SjRrWWdhSEFYaXNYdjZMUFNzMEZM?=
 =?utf-8?B?UUJwRlBuV3prbW9zWDliYU5oR3RMd1JnYWZqL0hrNXNhNHlaY3ZBcGI1YzBR?=
 =?utf-8?B?NFNva3JZNWFvL05UWm5PenlHdFpncy9oUnN1eXFRYXAwNGwxd3IyQVZhN1A4?=
 =?utf-8?B?cmc2TFVoTTVPNDBXazhwTmhVZ0ZTbjhXRjI1WXlGeFREcGc0aGlQUzEyeHBx?=
 =?utf-8?B?T3FXaDRCcG45eXBNa1N2RU5NT3dQSzRQTVRpZkd2RnM0YVNhd3hwWTBlQ2xL?=
 =?utf-8?B?a21MeFpxbDFTSzZpZXJHN0hQakQwM0R2aWdUVFJDbllsQkVDT3pqSU1wNzFX?=
 =?utf-8?B?OHN5andoeE40d0IyTFlvWlVuL3JBTmc1UlBXenRIZHlNVU1hdEQrYVBqdC9Q?=
 =?utf-8?B?b1dBWWZaVjI1V1ZzaXFGRVhnT1RSTlhyemVUN3RNZzFWTy96dUVuMEpxNS9r?=
 =?utf-8?B?OGhFb1A1VmRBQi9tSUdvRC9IMVc4MlFPbUQ5dkxtYkhCTHZpVjNHMTZOTENu?=
 =?utf-8?B?NFFweEpWbDcyamtYcUNYUHNMdmc0eWpONGVtNkxBVlFzYjlSYU5qMEcrckhl?=
 =?utf-8?B?a0pVS01RQjR0T09zNzVIYU5JcnN0aGVUcEk4ZVlJQTlZbzZWMFVNbmFRS1Bl?=
 =?utf-8?B?eHZpazRlVzFHb0tPdk5tOVF6VDFHVzhDeHZnN2VKeklmVXZkU2VVR1ZzaVRE?=
 =?utf-8?B?a1RyUklmL3ZtT0c2R1g0c0lnZk1CVVZTaWRUbDZJUWJKYUxRamJ1b1dSVldT?=
 =?utf-8?B?c1FjN3FXbFhDcllEWjlFMTlHbUJHR2xIcDhwYWszV016d1AybEFpOUlRQXdu?=
 =?utf-8?B?M05uWWVBVUc5cmpDTnoxbU9IKzgyUFU5QndNVTNRc0pJd0dSQ2l6dkF6bU5K?=
 =?utf-8?B?ZTVQdFVxRFVrZzZaTVNsci9QcGRGT2N0U0Z5WUlCSWV0RmhES2FMKzRpakhN?=
 =?utf-8?B?bjJtdUtvcWpNdFNIdjh0dyttTnVhUnZ4VFVhUlVrUzlnaEdhMCtBay82TDl3?=
 =?utf-8?B?K3Jway9PYmlITHZwSnN1Z3BEVHVsK3gyY1lEQ2pBOXFuSnM4Z0lxeXlEeWh0?=
 =?utf-8?Q?KurItv2MG3IxrhCRZm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550d84ba-fe70-4f48-3b75-08de694fd07c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:27:45.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeNwTFEEPN8zy3k5eLu+dKnT5R269pogDZ5ywBSYiHXO+0gH/0GGqgEpWG5F52LW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12020

Add documentation for the dma-channel-mask property in the fsl-edma
binding. This property uses an inverted bit definition: bit value 0
indicates the channel is available, while bit value 1 indicates
unavailable.

That was already used widely for i.MX8, i.MX9. Correcting the definition
will break backward compatibility. This reversal only impacts the eDMA
dts node and driver, and doesn't impact DMA consumer. Therefore,
keep the inverted definition.

Also add a note at the top of the binding to highlight this inverted
definition to prevent confusion.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 Documentation/devicetree/bindings/dma/fsl,edma.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index fa4248e2f1b9cecd00f1535744bfe6d9ecdba613..f609038e35ae1836b89c5b4d8a095b15a882fb87 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -12,6 +12,9 @@ description: |
   DMAMUX0 and DMAMUX1, specific DMA request source can only be multiplexed
   by any channel of certain group, DMAMUX0 or DMAMUX1, but not both.
 
+  This binding has an inverted dma-channel-mask definition compared to
+  the common DMA binding for historical reasons.
+
 maintainers:
   - Peng Fan <peng.fan@nxp.com>
 
@@ -95,6 +98,12 @@ properties:
       eDMA are implemented in big endian mode, otherwise in little mode.
     type: boolean
 
+  dma-channel-mask:
+    description: |
+      Bitmask of available DMA channels (inverted definition).
+      Bit semantics: 0 means channel available, 1 means channel unavailable
+    default: 0
+
 required:
   - "#dma-cells"
   - compatible

-- 
2.37.1

