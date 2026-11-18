Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013016;
	b=JcIOAXKmaGBTLtowfDzhtQ7jFkbM2XSVZsHcCXjl7EpNA1Cqn/1Z4vC3XUsmzJYL+M99
	 grYlAAE3UlZZljIgJWBbuQ4ki0P6oYaVt24QzNESR1wdpESBXh22t6aD+hLBYNDBx9mEw
	 Ioqk2+ZWLznEK3oSMYp3FMtNAQ5OSdUPrS7Uc+MQgnkj5pX1/zq7VtT6qUnZX1qSCtx4n
	 pEcnXOuhBtJPHZtfyoIlJoOHkOlpJdazQf1kq8oX5mTM1J2uXtaGXO7vxu8u4xsHrFUMB
	 cUa2+Mr0QU+UPzW9Zz6/sYw8yRqPwiFoITUxvkq+nVM70AfcIDzMBRqQucz5B89oeeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ud3LUPWviqrkNe/6Y9W998nhZrksDrjzieWE/+DBwl8=;
	b=gfb4M5owBpnWc4Qrof/rcyiMWZb93h78UOU10Zl6a6tZ6ZQyVAmmYeWf6zBH6P07Jeq5
	 B8v5KPlKurxWKKifQ9/XLQefOr5+FeWaEEtnNiscxzHviIzTDqNXfm+3rXl+WkTLrHlwr
	 chGrn9NQFjwSGY9UX1Cb5Z+scsvrH7fvfaBK+AMh3UxIx4eTqdCHNiJMwpSg8uvq1/0sx
	 O3mtQqxWEzDYaEjQPNJ4WHQK4O7Tt03R6+s713JduLUyj3HAG9lA+B32jG/c7TRz+5ldT
	 V6/+wMkxyZkUrxqb8pIyR2cZ+1NDHXNz6Fu6/zgG2kZmSA0mtBQ6O6iTOixsLq9npXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kontron.de;
	spf=pass smtp.mailfrom=kontron.de;
	dkim=pass header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=QOJwJpdh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.94
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023094.outbound.protection.outlook.com [40.107.159.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629A606A31C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 14:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4629A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=QOJwJpdh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XirDRV+zZM4YIgDfU42eTiX1tKMiAekMT5Je82Ff6NWg4C8cFrI2zEdZCAVJBcTbJy585U96d+g7V6OlTqZY0C+458K2Ew9/cJV6ObQyJnEvGA4u3Uh2OcykvNGHtU9HxB06BON44907XQ8Tx6/1gsKbea/KntUlfa1wGUWXwWfJlEDfgGZ4nXzAgEpjDbVwv5L32YbianenK28VrXPTYc6rym2kIaGl96PAgWS5dzBXhWeK7sXYJ7hQQ1DzhC69yckANksRCmD+quveVuRP8uSHi8/q8WW5gsiFLgJqmfB/vW/lTG1qp6GQ0pL2sWA/PQPv9PeLUdQz6vbdhJB2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud3LUPWviqrkNe/6Y9W998nhZrksDrjzieWE/+DBwl8=;
 b=U86h/Wc9oPLhVMwUp7EgClSQ2zH8cXdV0Sm2YjmRJ3+cETDaEWUuZ6c2ADCZk+hnEO751V+fnoroEslRGPdJQ1xLd28c1RZ9YWeiBq7cyCvMeuTwaQ20VeVdxxSK0jNu/mITbNDCpY70q/ZKfCpS9pP2JZcxwDNyBaysllrbdy5TD9L0uHZUVKtyTivhxcMJsOK3sTdn/R6f16DaAkiDdCin5UGcbHPfm3o35vAs0pcAgrC1AfhSQqfOCCja/uC+ewvouaFFU+SkKsouHnZww73SzJCdPdEoRAk96yey/cJALd0/OmRnlJ6aU5Cttr2yEDFdoBSyqEFWGWg5woPrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud3LUPWviqrkNe/6Y9W998nhZrksDrjzieWE/+DBwl8=;
 b=QOJwJpdhCD2UbLggq0oA5PrpvltPVSiIjgsH9W4glS8Tbbk7l0ozOjuJ5mLxNMRWfDFO8MPmVC4BPG/pyvCJ5mbxuZ8pq0pjUnac83TS7THUw0RCEVsQWASjipjzRlBURGZfrr6pszqF3BpgH7xbYy7e+NfQ2pAOWEryiv+yuLNP8G3cfhpCvc1viVe2LoBDax4CLgqjHp6W4yrv0cj4HIL22k+Oq2/NAXhrMM2/QDVGp9I7eG2fwZzCnfNQZG9XYndOndDUrMCkVGi9ghGerIUf99upWVB9kEllUCDhamwD5htZNybfocEeogeqwW6Kv9RLwxYmmtX67tIX/a/BWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PA1PR10MB9385.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Wed, 18 Nov
 2026 14:43:29 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 14:43:29 +0000
Message-ID: <3acc652b-d2e2-4a18-b70a-2656b309d798@kontron.de>
Date: Wed, 18 Nov 2026 15:43:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Frank Li <Frank.li@oss.nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 pankaj.gupta@oss.nxp.com
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
 <aqqqDnOMmlfqit6u@SMW015318>
 <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
 <180d2335-e328-48a4-b376-a90464279027@kontron.de>
Content-Language: en-US, de-DE
In-Reply-To: <180d2335-e328-48a4-b376-a90464279027@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PA1PR10MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ac1683-2708-4e6e-4690-08df45824fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|261026140227099003|261022105027099003|261026121527099003|4143699003|11063799006|56012099006|10067099003|261009223027099003|261021135927099003|261022075727099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x5KB99ir7SnITgR9ViZwjqfspHicvH0tofO2STxmX7RtibfvYi/fG7GqZOAEjoDWSTlsxU1NUQKyJxvGkzS/1cfc1yhrjxpg4wid/ajrNVo5+19a3085vHZKwP3Fodz9xrwAK9Nu4FFntfvxiFLGI1mIfn6kqzNRavVa7Pz2a2SQY12Xu+y5PWeekT1iQ5qkGS7MudmLcyUAOAEKYySVMKUQqQXZ3bGDMTwojZR7Gdvxwv9zfRzJmi8jCnZ7zDU90E+y/4UkLTDrpxWgxZEbXjrr6/ZXJJTYWbVwHdLATnHtoEwWi3aZvbE/Vj8KinBq6I1esfEZarz+VIgVmA+D7rPG8m2OVedRWZJ7G+UoPdmd5/t68ivKrvbU18VMaiZaA+6gWihGZgIKjPtzxRihQGI7ezAXdvuvGg8GizNbuH8JmCPG0PVvovXVNVJR7jOdf/aaBTk+vpZ12BP8l4flQKGKEZhZbdO4FEMUzF1UB1nGGFDXzTqbW7ub0W3RXyzkIpcRzVDzG5XoJIdhKVEA8aakVGUXHUlhVF5QJCj+aeG3ULO+RaD2+r2bkqZ0LtyCM1pZ76CS0wFWFREPJ0AJR0/MZJ7Wy0ogmJe5NRIJ6/YpkZL3KgZ10IoHzXe2+D/Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(261026140227099003)(261022105027099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(10067099003)(261009223027099003)(261021135927099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDF0c0FITWNkc0trTzJCbG92QVg0TjFJVEJFODNvZUdZTnR1RERoK2dXTXZY?=
 =?utf-8?B?MlBUcHMzY3BPTitsMWEwSDB1T3BFOWdGV1FhZ0VNYmY1WVA5dmJoSGtrUjVz?=
 =?utf-8?B?dzNtNzhvQUdQTEN1ZEp5MmVoYjlQa2szRHhiYzFBTCt4MWZidDJ1RkYzeXor?=
 =?utf-8?B?WnZFb0lhVW1xaW8reGo0cmVSblN2RlF6T1Y1VDFDODdYZUdjcndsYjlBUWNB?=
 =?utf-8?B?cFV5dC9GRWlUZWJSdlhPeGkxdnVtdVlQVW13L3dDQTkrSHIydE1yR3QrZWtv?=
 =?utf-8?B?Zk9US0JHUnB3QlhHdVUxdExoMHNMNnVrdGdDNG43M2pYSkZqR1Y3S2Z1eXRq?=
 =?utf-8?B?cE5tQlNvekEwSzVRMVBZblZUQW1HenNRb0hmSHV2ZVB6TmNtOHhGVmZPaHB2?=
 =?utf-8?B?MkNEVlpoQTdBNDI5S05BOXlIditCTHljZFFkL1hKa3BGcjNwNERjcm1QcGsy?=
 =?utf-8?B?YlZhZjZVVU9hTnZxcHNKQ05OMUtBZCtEWkc4QlJkaHBrOGd3Mk9GU3dSbVRx?=
 =?utf-8?B?aHIwd1pXU0hNTWROeHBnUU5yUTlnT1pIUEJmRUUvS0xodlBwTjQwejRYb1hp?=
 =?utf-8?B?bkVjc2xUMWlkMDNIcE5TeXVyY1hSdXpMdmdZZXNJdW9DUnc5cTg3YVBpV0Vh?=
 =?utf-8?B?QnF5UEJMQVdzZTk4amdqbXpGOFRJMTRhTzhVUHJzNW9tUmVreEZiWTdGenVq?=
 =?utf-8?B?QUVRMGZhVSt3VXhpWTJ0VW5oRGJvdU1UbU5SREprQXJmYkdZWWVlWUVOSVBv?=
 =?utf-8?B?b3B4eXhKc1F0c3hwbW9hUVVZUnVVbUtZTzJLTVAvSUdJTGRMRUlhSm1oVnRl?=
 =?utf-8?B?VXViLytaakFmSG9BT1QrdTA5cU56cXVwNTNuT25WamVBVVpTblJucHpCUE1j?=
 =?utf-8?B?QUR2aExvbUpLR2Jya0VEbmJwNDF5SUZTTCtsT1ZVR2tkOXVHNmNucGNvdS9D?=
 =?utf-8?B?aEhoZ3FERCtkd2FQcmI5ZEMxUU5halpGc3J4eHZMQjM2dFhiK0ZmVU5SV0Zq?=
 =?utf-8?B?L0RCcUdVVGl4QWsyVG1jbDV1M0g4V09OVHkxRlhvS2FiZ2ZFY0NZaStNZVJs?=
 =?utf-8?B?NENiS1p6WjdTNHIxWFFJeU9lMkxCbnZvYXZINUpLeWh1Y1NvUzh2SE0zMXlh?=
 =?utf-8?B?ZXFwZkpJUHJaYlBFU3NFUUxYNGUxRW1yY0V1WGgzVm9xcGtNV2FGVFQwNDhW?=
 =?utf-8?B?SjBvSTd5cUd4N0p5MlhnSlVzd2FwVFJvMG9PQngxSWpQUmtadmNEV05FWEFI?=
 =?utf-8?B?OG42bERsbXNEN1hSeXpBNmZWbUpFem9TaHFRam9UNEd1MEZhZS9taENTejV0?=
 =?utf-8?B?TEVPTFFJbVZsall3MnF6QjVHeGtYSDFVV0VlR0JTVlJiaEFVcmVCMU9lN2hS?=
 =?utf-8?B?V0pSK3JrRHcvelhyc3BYVnQ3ZHltNlNuVkhMWUlYUFVVbmVYdkF6MnFJeExy?=
 =?utf-8?B?L1lyMHc2MGF1d29QYmcrM0ZMU0lHZktSdnYrMEtiaVVuYzZ5TDl0eUpMWEsv?=
 =?utf-8?B?TDFvYzdDZ1RlZTdFV3JoRVpWWldmQ2xqZ1JJV1lWa3o5NmZJQjJQVFRQY2cx?=
 =?utf-8?B?Q1ZUakNjaVBrYXRLRW0xRkVoQXpLczhESXhNTXQ0TWpNcUw5eHlhRGFEYnJs?=
 =?utf-8?B?WnQ1cmdCYkJFSWpkVTFDOE0xb1pLMDVQdGh0YktYQ2tUOGpBMWpZaTdMQ0RD?=
 =?utf-8?B?dGlXcUFrTk1IdUk1ZUw2UmhCT1VDTUp0STdDNEIxQzdEQnVzU2M4RFBzc01l?=
 =?utf-8?B?VUJwRWlvTGhKMk9mRndObk9KNnBONk1tN2pGay90cmkxaVRQYjI3RlhJTVM4?=
 =?utf-8?B?TEJzTkcydDI3QUxHVmp1eWlpdi82Y05VMjVEM1poS1VQNXZzK013eUY2bVVN?=
 =?utf-8?B?UVlVL0dEOXNLUURINldWVFVWUGc3amt2VXRoYmxBckpFV3RYR2ZpRmtBNnI5?=
 =?utf-8?B?RXEwT0dJR0YyTTc1cCtlZmwwTjY1M3MrSUE4Rkd5TjQ1YVlpYjBOVVpMdDlT?=
 =?utf-8?B?Y09SeDh2YXZiV0xOTmdmTXJsYnNTTU1NaVdhSHZ6Z3RnMFR5aXlYZkxNTXU4?=
 =?utf-8?B?RzA2TG53TktKVExCbGt0ZUlEUWEvdlZRM0tvZWJVWS9TeG01aFdFQ1NyRGhn?=
 =?utf-8?B?bGE3OFFjSG13ZXRkbXpzYXNOc3N3MlJWcTdtcXp5VEpxM1FRUk11czdIVkN6?=
 =?utf-8?B?NTdncE1MY24yN1J1d2htU0FXMUY0Q0ExWktkL29OTlVWVDREb0Z0YkJPV29R?=
 =?utf-8?B?M0xXbEljQzdLS2VtMnU4Rm5VdXBNbm95ZnFqUitSYmVWTk9UVDBmeVBuOVFt?=
 =?utf-8?B?OENoZlpySDRsT2t2QkRXdEVHYWl0dHlieDlIRFl4VGF5RXJEWmRUczRtRm1T?=
 =?utf-8?Q?BHBZKwfR8SqxMpqA=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ac1683-2708-4e6e-4690-08df45824fa2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:43:29.6168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BB//Y3QV7hoeNPAvbTGk/R2R3s5cWgPa7ma9Sndl+Chv4yGycC8CElS0gHL1Vm+0aXHdTEQxi4CTTcQPhrA4ZaeHaobdJsTVcY4k2j/7uvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9385

On 18.11.26 13:46, Frieder Schrempf wrote:
> +Cc: Peng
> 
> Hi NXP developers,
> 
> On 05.10.26 16:28, Frieder Schrempf wrote:
>> On 16.09.26 16:39, Frank Li wrote:
>>> On Wed, Sep 16, 2026 at 03:16:13PM +0200, Arnd Bergmann wrote:
>>>> On Mon, Sep 14, 2026, at 21:40, pankaj.gupta@oss.nxp.com wrote:
>>>>> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>>>>>
>>>>> Adds the driver for communication interface to secure-enclave, that
>>>>> enables exchanging messages with NXP secure enclave HW IP(s)
>>>>> like EdgeLock Enclave, from:
>>>>> - User-Space Applications via character driver.
>>>>>
>>>>> ABI documentation for the NXP secure-enclave driver.
>>>>
>>>> I just saw this in linux-next, where it has caused a build failure
>>>> for a missing include of linux/slab.h. I hadn't see the series
>>>> before (even though it is a v51, which seems crazy), but I am
>>>
>>> It is in linux-next about v37, but build bot find many problems, I dropped
>>> it and request to fix it. And sashiko is online recently and also find many
>>> risk. I request to clean up it, and local AI environment have difference
>>> with sashiko, so bump to v51.
>>>
>>> I put to linux-next again to make sure that pass all build test.
>>>
>>> Other two problems, need more time to check whole review history. reply
>>> you later.
>>
>> So this is still in linux-next, but was not sent in the pull request for
>> 7.4. It's rather confusing to me that maintainers add stuff to
>> linux-next for build-testing and then leave it there, neither removing
>> it, nor continuing the mainlining process.
>>
>> Frank, what is the plan?
>>
>> I'm currently rebasing my work for the NVMEM driver onto linux-next, but
>> as there have been so many iterations and this whole thing took so long,
>> I want to make sure that this is not another dead end where I'm wasting
>> my time on.
> 
> I need to ping here, again. What is the plan at NXP to move on with
> this? This is blocking multiple features that depend on ELE firmware
> support for i.MX9 and similar platforms from being upstreamed.
To be more constructive, here is a proposal: let's get the
kernel-internal part of this series merged first (patch 2-4, DT patches
6-7, doc patch 1 reduced to kernel side). I currently don't see any
objections or issues with those.

This would unblock drivers using the in-kernel API, such as the NVMEM
driver and this is also the part I already tested when working on [1].

The somewhat more controversial uAPI in patch 5 can then be further
discussed until there is a consensus on it.

Arnd, Frank, would that work for you?

Pankaj, can you prepare such a reduced series?

[1]
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de/
