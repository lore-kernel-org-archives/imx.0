Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB55312821
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530980; cv=fail; b=VfMTJ7PAEGfvS2Y2EmMwds/hR8khs82JS8ZIVXt1ZRGha0/0lPHrM0CqRh1aZ+B3CS618r5xYUoh25H5ZyTQcio5tqL05GvsAYAnPMex9euYPZUvlMCcMDRKITM233f9p5JwIwKMP1v/EHwryCJ4XVcMPmCxf+GzeoOYUEAYv70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530980; c=relaxed/simple;
	bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D7yENCHD1LmgJESXp1MTDM1BEw/JY2qLpZEFTc8E5w+lXdEjEK9kMLuJaVOq18Ll1B3RJejB25qbiBr1QQZk2xZUnbdn0lHSDd4RMNPuH2WKJhdZ5TkIlXtOz6e+EkrV0EsJFZFiuYQLgm08/KmEZzYezkByGwmHiOKOO/wtHvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y2cPb8m3; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y2cPb8m3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffb3meXnVEQkc6IgHYnC0VRNXb7OcyD5akJgiAmDCCx+fRpxz7DQGNvlJQKa8LxxjBhzlDz8RaJ2u/vqSEPTml/2toZ4Q9drUcDKG1NohxFmIAbrd+syk2FCZjhvglD6/hfmhsS+VEkaQtfey2QYCa9w7C/bdCybdWWazDgQqMzunoMruScZcQ6JV4z/hDJQb/tK1hAuSYiqcc1GGZ37NjIWFBd+Xz4qT4K94XbNncmNvgHsLVw4uuTCllERzwoIj4L7M4D6LCwdLtOnkT5kNyV1zcPIqdxHQODiqIC4hQIiqsNVyvKHfJqPQPFOvsbyskkLEuuWfins50X1uixc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=A8GiLDi3AGCn7hoUIez+KU/gjEHUoZLKjwD7Uz0H9Vd70eooSlmdRAlt5G8w92dtzTVRiHhzUQz2HcWfaeo5AWrZKQ0FmtviwVvWhVGcBsLG4wMznfPVbmYvq91R7sFA2LJxb3ARnoAFSRRu/6BC9hQurCsyzc/uZ1fpF2R56FalpZ5PK7Y19n8/Shjc4huUx6s4hL4hio1XP+hHIQidLTHYnwqbSzlqxjTPMuhvMQp0fzYn4qL0Ov2QnWoUYne8P3XxBoIRa6CXIp+QNE+8cnWy03TzImfb7uqXZS+ST/6i6OodPYuKvKZIqLCC7YLlgR/d9ytZrTOQiO0yVl9okw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=Y2cPb8m3AMOLXaMYHBlT1PbFIhFkH1oH71kXH7pzECMP8zLI8x9uKGZtG2+uDc1j595xY/t35quhpYD3OeeF8Lp7Ee0eyYFHcQw/HDELDtkUx9AEbXJUiWgf9WQ7rI+4z3sVdi0gFBwoENNIerAmeBGNDqQEWw7UiCdGZy6kPV5M9SlsXT5IhH0ZAUXz3HDYaPeVEbOTyPaq9MwpJbzIQIu6toooU33p7IUdYfTf7xoBo079eVlSw3NAHb4TEZpzCn8mXlFL7IRp6ArhXLn7JxzcmDtqZBGkhqBe0hQtmYs0WWnX29wVZ44Zprs2Lotr3l9dqkYMsuouFPmSrBLXZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:16:12 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:16:12 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 12 Dec 2025 14:44:17 +0530
Subject: [PATCH v21 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx-se-if-v21-6-ee7d6052d848@nxp.com>
References: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
In-Reply-To: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765530894; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
 b=ehRcaYJx1fuTiHTYD9pq0/+ZrsGemGENhlX7t4ghOTGFKR4V9gJYY891RVedzv1frX0epHloN
 D4CSg0BHQyKBER4MLz6RkQCUmh1kCHgMvS4jytsRyuJmvWqfGKMWJdM
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d74a7c-d69b-48bf-9d6b-08de395f1850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wlk1VTdiWjZjUllpZTg1UHU4QzkvOC9ZYmlVUHFFVGk3VDRQdXRZa0prb2pK?=
 =?utf-8?B?eURaeXZraWJMY0RValpWdGZaa3l3V00rZ2x6blhVVzdWeWtVUkk2b2wvTHNQ?=
 =?utf-8?B?NEZGN2xGa094Y1FMb2JHZi8wSzZkQWF1VDFvNk1IdE9UWk9JRjVwb3ZmbnZ6?=
 =?utf-8?B?ZStuL0ZmcWxnYkRYUm9zell4TWJOemxDblpBY0tPZHdBSk16Z3dhM0NxRjdG?=
 =?utf-8?B?MllQUXhMWXJSeHZ1alJXYjI3V2dPRzVvS1M1U0FlMCsrMUlTMUtnM1cvTXRF?=
 =?utf-8?B?U0pVcGYvVnRzYUxhaGNLaEErZHJFSkR2L2JwaXVOTDRlQU9qakZIcHhvVGh1?=
 =?utf-8?B?azV4NnBjS2ZrNUJUUCtQaFpJa0J1R1J5R0VzdExjWjh6ZEt6T2NzdGRuQ1BH?=
 =?utf-8?B?amdtT1hoaVJhT3lJR2Z4M1dlcE1uSllLcW9TK3BXOUV4c1BSOUZQQithbXJp?=
 =?utf-8?B?MENDYXVVZUVQSUdhbUhvWTNRRHRuZzZUVk1SRmtmT1N1UUFvd1FONmdqTEtn?=
 =?utf-8?B?dk56WkZoSUdjUUhlTU4xVG5vQmlIZjVqQTFJcTBNSnRwb2w0M2hiNU1jNm5p?=
 =?utf-8?B?ajRzY1hGQ09XcURyZUJnVW4rdEVGNTMwK2Z5MmxEVG1HbVhidWVlOUV4L1Ry?=
 =?utf-8?B?NmYwMUJqZGU0Q2N4QldMTk45U3VhNXJjbGFsb2xYUXdoTE9jZ1ozak9QUE9N?=
 =?utf-8?B?SmNaa0lxQnpRTlcyUHI4T0cwY0RnLzNVMmdrLytsOHhacGFyMEM4a2s1VDVX?=
 =?utf-8?B?S01GMmVnNExmSXRoK1JMZG1UNGdBQVJXUXV5dEhZY0xnU0hEUDNTcHpNcmdW?=
 =?utf-8?B?UGlvZ0QzczE3QVNzMnVxQ2ZkdnlGTWJFYnBEbnY4YTJCVTNEM2RzMVU2byt3?=
 =?utf-8?B?SmtHL1RlaTVNakZEUER6elYrQXNIdi9Zd1J2djlxbFFuUnFEWUNRcm45azNk?=
 =?utf-8?B?dFh1a0I0YlEvVHVkbDVDUnh5bVBZYUZSTS91b09lWnZXQTBqUnlyRmtDZDB4?=
 =?utf-8?B?b3dWYTMzVjYwK2RRa2M1eUR3Q1hiK09JS1BNVjl2OTFKdStkTnRTTnBUekRs?=
 =?utf-8?B?VzZzbzlZWEFFSUk3d3J3blRkZEVjdzJSRXo4Ym5PUHdOZjVvQ09Qbjc1Nmts?=
 =?utf-8?B?K21EMGVlZUNoaXZUbE00N0swMzBCbmZDR21XNVozUFp3TWRCVm5UMGxnUW1t?=
 =?utf-8?B?bndleHBHb0MwSUpqY2FCeDRHTExtNFVTVi9rQnVFNUxIaVNjc1NCdWRoNktq?=
 =?utf-8?B?VkluWmVVYUNodUwxdU1IOW9RbUw2MWRvYVVkSFVYeUgwRFNTd3FoSDFieEh5?=
 =?utf-8?B?K2kvTkhMa0o4UUUvWThJcm95dU14cklOdnFDRTlHQnZxRDVERFRzR0piT2lZ?=
 =?utf-8?B?NEFEQVJ4bGY2d0hjYzE0U2tLUW1IT2hxQWJjVmUzekV6ZkxKZXJudjBrNDJH?=
 =?utf-8?B?VWFJbDVhSExqbTIyQm5jcVpiVXFVUjhWS2ZCa2E1aVBYRDlMakZ2L0gyQldz?=
 =?utf-8?B?S1UxUjdqMjNTbVVFZ1BYRmRyOXAwa2w5bGpjd2hhaVVBbURtazZRQkkwTWEy?=
 =?utf-8?B?SnVRcDEwbzBMMGJKNUxOTWZmZ3pXV29vQWxKaVdoVVBYUG1IRFdOdW5ydExo?=
 =?utf-8?B?bFlzOGU5aVdoR0pVUUhTOXpacjc5VVE3S2N4WkpaVCtnQ0hzUktKUEtvL0RH?=
 =?utf-8?B?WXFiVTlrb2VLaTU1VjFhTFFwbWNpbFlyNno3RlQzaHdjNGYzU0ZETitndnFx?=
 =?utf-8?B?aVVMN25hVldIUlhuNnF3U0k0bVQ0alpMYW9zdVFxR0VjeFNSZmZ0c0NicjFa?=
 =?utf-8?B?R1pUdERVRGdvVjZQd2YrME9rRk9Db21GMU92VXhsUElveGlOSFk2TWMra0I1?=
 =?utf-8?B?MU1xcWJ5ckN2dEdrVFdPQ0RUK1hJTC9zME8xa1krV3VDY2JsTkJTSWs3cHo3?=
 =?utf-8?B?OTJHREFtdjZacVlRNlpmZTN5bVFTbjZJelpMOXJCbjFubThVNzZsQWdOZldp?=
 =?utf-8?B?Q0tFc0UveDFPTitSaEQrL2xSZGxFaTZLczFmL3o1TkVlYlZrUFdLblFla0I2?=
 =?utf-8?Q?i1GI4q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnZybGUxQkplL0VzcU5ZYjVVZHI4TWF0WkRrR2tkQ1VDdkpOZTFjZ2VjSldq?=
 =?utf-8?B?R2xnZC85SEJLYllZWFRvNUJ2S0gwQ2dDMy9uMzFFNXdRODN3VDNxTWdJc2Rn?=
 =?utf-8?B?TjU2aWt2YzNKb1RHSm11TVpZKzQ5eEdKTkd6U0xvMVRRUGlrL1Bhek9FSDRq?=
 =?utf-8?B?dVZWcU51WDdCaEhHcHNuVjF6SGtnSVdYZzdjQVdmL0MzM3N5QmY3K1ZYSGdJ?=
 =?utf-8?B?SUc2OSt1aUIrdjNNb2kyQS9zT1loRWE0RTRqVklPZ2psSWplMk5Qd0VSREJw?=
 =?utf-8?B?VWFyc08rZ29TTXpNTWhDNXJLQ2ZTSzAzRzlFUGNjcldHaGxQYVh1QzgxQUhZ?=
 =?utf-8?B?aDg4TWNQdHI1MHgrbmg4SWVLQVRxeVVCeUljdWsyVVlkbTh4dnNIOGdrZEUv?=
 =?utf-8?B?RGk5MmcrSSt3elpYQUhqTitnSnNQdDh3NG9QLzB6NlY0RCtWNGlEem1oSVJO?=
 =?utf-8?B?aUpwSlhQRkRmTkVKSUNBdU05Y2RsRUt3YTJtWjV3cldqMnJsb0ZwSGIxZ3Jp?=
 =?utf-8?B?WDAzSmJqMENIUjNwVU1XRnkvQlp4VDVDM2w5TXpyWlQ1ck10WjhKVDRyVE5h?=
 =?utf-8?B?a2FabVBxaTdmUjg0U0FWdlpodWJHLzNTUGFqQ1dzcVYwTFpoelhMQmVPUThr?=
 =?utf-8?B?WU8yTnZrbXB2R2x1ZldtcE1yVlpXUWJGeXBCcFVJYm9VZ0gvTGNJY2xHMlZi?=
 =?utf-8?B?YThxSzN0dkk5VmU3SURuOUdJSXB0ZGF3ZzhHT2EzajUyRkxWRXdjSmlhRVNR?=
 =?utf-8?B?ZXJxQzFkVHVTVGhxSjBsckh2b0IwVDQ4NXMyS3UrUmRONFNET0M0dlV5NU93?=
 =?utf-8?B?YjRkRmRzOXFpV0lYTWVFOHhxbjIzbitPWDhxRGNLWk00VEFWVThNZGhwOUNV?=
 =?utf-8?B?R3UwQy9EYlN0RGxRblR6b1pMVjd1QWZMcFR1YytRcFNBeGY3TmlHU2VRa3FO?=
 =?utf-8?B?bWx5cXZDajdHTEtDYU9TTDZMN3V3clUyNnRtTnBtRW4zTE5TUjJwclM1QkUw?=
 =?utf-8?B?Y3o2VFhsZ2N3TDFJdzQwR1F5U0R0WUJ2L3RQWERtYVJzdThnVFdxbjdxdHlL?=
 =?utf-8?B?VVhHQnZsbVBlODU4NFcrTG5NbzNvM1pZdldxdTVqbzhtQmF5UXliVmJZR3BT?=
 =?utf-8?B?N241TXdZN0hkVktMQkQ5MEkwUnJCVGptUk1DSHFZNjdWc2F5b0tIUyt0S2pG?=
 =?utf-8?B?RFhQc2pEVHJESlBYUzdzaFF5dnpRcS9ORjRsUmtra2xwWHBGVnhjSjZVQkMr?=
 =?utf-8?B?Rlh4Mks4TlNNQlpuSUFraFB3bGV2aEZlTzZsQ21sTkxlbE9uNFZMVDljaTBj?=
 =?utf-8?B?dit2c1JTMnk3WEgyaXZtUjl6cU8yM3BKOWcwdXpDODFxazBkQXllQ3dKdHdM?=
 =?utf-8?B?TnVwYlliTENzTFFwekc1UzdZZnBSV2VuOGV4MFRhTjFtb0xWbWpRNXFFVmZN?=
 =?utf-8?B?L0dsbkRoTUtpMkZ4L0V1WWF4N1lhVmN5cFhYSzFqSkNDY1k3RDRjNytCMlhv?=
 =?utf-8?B?MnpEeS9TSFFKTXJndTJGYzc0TnBSS0tSdHkraXpHU0NUdHNTYkpxdDFxWDBM?=
 =?utf-8?B?U1ZuQnFuTjBPdjlZVlB1MTNOcEc4d2laN1c0eDQrbnBOdk5BOW1UdG1VanpV?=
 =?utf-8?B?ZnE5dXRRL20yY2g4R2Y2Vy9tWStHRkZWQTRhUFJId1hQZksyNmc5OUsyaXhR?=
 =?utf-8?B?U01kMnptMVpKWnlpTWRFcTVwMUNQSWZXclp5K2FoZG1nUjd3L2ZCNDlweHlU?=
 =?utf-8?B?aDhGdjRqOGJnZHJlc2Z3MnFRZkdsNzhFWDl5dk5IbThkT0hVUkVqeWRSMG9p?=
 =?utf-8?B?ZnhSVjQ2OVBhSXVUMWk1NTJEMXJSTkdmTEJFUzdtSEJEOUdmdlA1bTlILzMv?=
 =?utf-8?B?dWtDclI0dEpPN2F1c1grSXBxVFY3cGlnREFvdC95ZFMraW1qeXhQZmVqWFdQ?=
 =?utf-8?B?emMveXZKRUc3R0Y5UzJaOWtWM3VoM2poMHhsWEFrT3c3RVpHN2QyWHR3WU1I?=
 =?utf-8?B?MmZiRTNxRXN6aytoek1qdTBYbHdaVWx1WG5pWEhhSzRoa3BuUWMvQkx4c3dN?=
 =?utf-8?B?S1M1NzlWdGZGeHA2QmZwb0NnQ2pYV3B6Q3Y1UUlDb2kvOG9pOG01NUM1OEI5?=
 =?utf-8?Q?iTEY9Yzgd7vBqyoLvtnakvKxC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d74a7c-d69b-48bf-9d6b-08de395f1850
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:12.7341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FwFFiJI01H0bk6y1ytTghKwBicpAyuARCKTdDcmVBkzTVkKMBoN4fhdPncPMTAKN20AYIHLjthOJ9ob1zH7yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..10a4779dd24c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

