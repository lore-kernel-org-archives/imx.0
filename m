Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D59313287
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765531007; cv=fail; b=UpxaGsZ9vlklO3CcYU73gLLiFibO09cGTmeGUa85sC9vAZ5WuwWdU+r1x5oOOqUYz1AkTp2sRfiTSqYaOi4tw4vcw9XqVRMbO3tDA+W/5C4nfcK1AztHU2/scKYKe07MF8y7/261XwjM+FevbRZQvqUJzqZU1pl6s5YH/BA/tFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765531007; c=relaxed/simple;
	bh=GE4fVZYDP0A5Ug+8jRyJ91OSGe0s0w31LeNhX+KGhXg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=R51h7O1Kwl2tjdUjPxz7tFYFMxzzfWRDGuJWvQDloHpALsPMMlcEAkJwQiQGXbr4VTCyvYImfC5gvlwXK5ab9Q+xOxBbq9NVIeSSwcfGaKFDsEVi52sRcQoZdJTHYjVbN9djyqX/OfET9s9wdoLMXWs+pz/MzaWrOuJkv7/w9UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R/YMxTsf; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R/YMxTsf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKTyZeVNl6RDkyU64abLQHkWvEEY4SOMseTfYt8Uga5wb8prXzWCE9jikx5PGYhFvDiHyphooq6JbjNrB+mJCY66CFqDmBWLWHR0KOXX9d0xsRHeSf8xitbb8wkRfV+iKWJyTJik+S0eIKGEqI+rTqDA+PJ10H68lQN4TdWM+f9zyryYt/vqGzedU9/ipQkZdWM4RUhd8ETbEXdzLV9x0m6o1OWpiwr80TF+b9aBerc93ANTPURgkWMSnItAzxbT/n79efSUIjEftqlhu7dQPUIg2vavPEAhiaa790VKdkSbHoQ0u+qLGyLNk/I+FQWWlNj3SAQyLRZlK2Eoz0Ijbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ypk0kZ3USrF9EUOy9p0+g4vcKyXLasWW9izk0tx2PE=;
 b=ZZhuNRr6CEfUR6m03mfQ2Oblcol7SYOFHJlNKsX/+Pvruy9I3P+raiZTJ2mJnEVFcoUCwZG8RK9przFTub7BsbRxwGxYTTYOfL0gPqzvAD8fOnkpmelT+UvKkuKZSqdIPu4Tzwzypsbx9QHmA2ZYjSw6HM1XVhxGorFsy+/4g384jrCVD6+v2ERBASDCIQTI6PWqnYhuyEsReIUzwmz72VXfTl5PEdW+4wvqO+LsbaNa0pqS1rbfoUe08hHZLabHTrYL2FsKMeJY/vwPWBJKbB0KRZb643YfCUdQejAJsvBRVCGWIHHEZsUhgoCF9KGuq1+/tHOzt7afjLc6PtSeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ypk0kZ3USrF9EUOy9p0+g4vcKyXLasWW9izk0tx2PE=;
 b=R/YMxTsft1cmkJM3yR+H99A2RE1COATxbK9tmdd6ND0vFevJyhxu3qTYcJ8I/VOQY0tQfxddTuAcWIFpAb17R5XsDsFGoDZ6txxckIFwBAWzjedVF8AsVh6suFYYHECZaild1Lo8Trij6MNhu4j7XKnIvkqZETsfoI2s4+hp/QL0FZEngeG5YVTubhDkKU1IMrlu5dYvDaOArzHCjfev9fUG8bPpde3CNT0q/iswxcCqKCxGExDyR+TrqJfHMsbBWxtwz7aq/m9JjNZYooTpiZ+iinRo9Xg1m5lL7QW4xiORt9CEbCBXZcNjZkG9gWHiGL4EDsvu0LlFxRX4YE7S8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:16:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:16:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Dec 2025 17:16:10 +0800
Subject: [PATCH 4/4] arm64: dts: imx91-11x11-evk: Add gpio4 alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx91-dts-v1-4-2bb3c13762dd@nxp.com>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
In-Reply-To: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: d8637017-07fb-41bd-5d1d-08de395f29aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDdhS0J5MkpiVU8zYjBHWTNIWkdCUFNTWkx1cWNKeFErY0lNTjVUY203NERH?=
 =?utf-8?B?NDZGWmZ3bGl3K3hwZjBZU0VTVVZqaDZlRXZSNmdaZW1YN2dBUmYzNmx3MGhB?=
 =?utf-8?B?VFpaRGd4bzlVUVNSMm9tVnQvcERMcDZSd1FhT28xVVMzb1ZsSDBsU2hjNkpW?=
 =?utf-8?B?eGp5QlVVaUkxSHlXTUUyV05FWlIyUDNwbUFHZlpMUy9ZckFJRW5HZDF0NTZu?=
 =?utf-8?B?enRJRDVoNmUwRUxubXdJQTkwdDlkRFVra044Q0s0dDZhSUxnRnVGcEhnekFo?=
 =?utf-8?B?OCsvOUd4SGdvSWJ3NUlYL215ZEI2QWdnZFpOSDBhYVBTMjAwd2Jkb1VVcEhE?=
 =?utf-8?B?dWhLaTNaMkZtcVVqbmxzV3JXRDd3VTZMUGlHMGhCYXEwb0FFTGhtZVlhaWty?=
 =?utf-8?B?R3RzUXF0RmszRlJIMlp2WUtOV0pLOWdKY2lxdzJRTjEzaFptQmQvL094SGNo?=
 =?utf-8?B?Zi9kZHE5MncxcWZWbkNiWHVJcGU3K2M2aDlGaXBMQ25ZOERiWGhTSUdBSW9K?=
 =?utf-8?B?N3UyQStRMDVPMHZyYlZWdXg1bWFMaWVWOHFLU2o4bEMyaGt5eUY0R2VFWExQ?=
 =?utf-8?B?UTNPM05HalY5QjBvamdwOHdkY3RuMkFyYnN5N0s1NTRyd21qZC9iV3hLeW9W?=
 =?utf-8?B?QkJEcGZHWE5COHd4WUE0K1JSNm5ENjlFRkNQSURvaXpLZXVkV29GYjF5V2Ex?=
 =?utf-8?B?a2d0UDcybXlBSUw4Z3BqWDJ4K0NYNHJ6UFY2UW1FU05XbW1NTnE0TWw0WU93?=
 =?utf-8?B?U3ppVE4zd01UaS9JWk4wMTRrcWRPR2E1Z2JTL0F6ZGZaaG8rVW1VNEFoN29T?=
 =?utf-8?B?dGdxSStlR0N4WEIzcmxrTVNUZXE5L1RHZGVEVTdWN3FVdVV1TVBpLzJmdUp3?=
 =?utf-8?B?ZVQ1MEQwK0RDR05tUnlzRXlFRzhqV2cwSXc5ejlLWWNhTnc3cHFTY0VLSHhD?=
 =?utf-8?B?RXNzMkhsYUhsQlZWK2VKY3dsNTFzY3l6d1ZwdkVxejFJcmlveFNvNDMwTU9s?=
 =?utf-8?B?NXYzMVlPbVhNQWFrcVV5NkdqNDh4a2h3b3ExSlRhczdpOU1BS1hXeEovWXFQ?=
 =?utf-8?B?MmRIK25LUm9kV1FtUDI0Y3pqbXNnQXN4ZEdSSTZIUXFJazg1cFVEdHhWdEhx?=
 =?utf-8?B?amQ1SlBGa0tzZmZTMlp0OUREZnI4UkZRc2NKTE1BTURnM1N1czJ2ZXA3aldY?=
 =?utf-8?B?WTVZZGZxYXd5d1Zad0hHVFo4aXkyZit5bm45ejNzZS90OFdMUTdQcHFNckZT?=
 =?utf-8?B?RWFNYU1qcDhvK2hWV1NETDhkV1UrRzNrOVlLVk04emJxajd2UUtRQlM1aC9V?=
 =?utf-8?B?cmxZemRVQzAzbFVtd0dSNWtacERtNnBxcFdRKy9maFZqbFpqRnhzZUFUMmp0?=
 =?utf-8?B?MHA4a2t2UnNid2ZpK3N6aTAzWlhNdXBCMVpycU5objZIQTl4aDFtcTU1ajdD?=
 =?utf-8?B?WWpaenV0ODFOTm1UL1Nxc1poOGcrM1BPQ09wS2RiWExYSVZOWkYrNldUM2N2?=
 =?utf-8?B?U3BHTjBwZzRsWm5LUmh6bmFMMExmRWE0ZisrcVYzSXAraks4alp0a1Y5Z1ZJ?=
 =?utf-8?B?Z3BaeGhUUmJwazdkYmJWK1RFeFBJZ1c3WldQRVZPQ3pXeFVJaTBXMzlLNDJH?=
 =?utf-8?B?Sit3TjBlVFVaelRvWVpBS3ZkTFQweTU0NEFoL3BkcFNaZC91ZlFwZVpFZnJI?=
 =?utf-8?B?cjgvYzhBZENBK2RpL1QvNXZteW41OVdWOGV5WnkyRVdRSTFidktqcXZWV0VL?=
 =?utf-8?B?WkFSRE13blBwN1BLSThQaFJVei9OdFppQ0lzTE5hQm9OUFFQTmk2VTN1RWE3?=
 =?utf-8?B?LzhvWkdsOEQ4R1V4djQ4Vkx6cFEybWJTS21xalJYSGFRWTRjbUV0NWUwMlBl?=
 =?utf-8?B?cEJKd2hSRzFkN1lrZ3BRZlpMMVptR1NDa0MwM2JEUlpkV1NPZWs0ZkYvVHJ1?=
 =?utf-8?B?dlhhUnhqcUw0Z0E0aHhWTnlBSi9RN3JtYkdYRmhhVjZRZ2JWRmtDMFM0T1J6?=
 =?utf-8?B?MEQwaUgrQjBSSE84S25GN2U0dTlNMU1jSVo2NlRZcGFHOWNVRlhDemp2eWhL?=
 =?utf-8?Q?NhS+yt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlBnUVQvcHpUWmw5bmNGYTJkb0kyenppbTFSN2JEZWdWcU53NFlmSG9qSExo?=
 =?utf-8?B?MGFORXhrWXN6M1hWcGpQRnJSSWFobXJCRll1R3lhMVV2WktjL3M2TDYzblNM?=
 =?utf-8?B?RkpPRk5hNkVsZElWWWdLTC96dFR6RmdkcmVGT0NJRVRjbFdUai9FcTUvVVVn?=
 =?utf-8?B?dTMwdXczU1hCUDcyeTZWRDYzU0F3Ui9pVHpnTjhhSXJ0OUx1QzY4a3BWWlRs?=
 =?utf-8?B?ZW5zSVZZOHhhcVZTa3V0OXRFaUQwd0d2RkVGT0MxRUVVamY1YWE4V1Z0RHVT?=
 =?utf-8?B?MUFIa1JiVXNaMHJFblFteE9zSnpjY0p3czJHc3pzK0ZUZGVRODNBZEsrUGFh?=
 =?utf-8?B?MkRBZGx6ek5WeWhTcHRPazVlY1BXQTVCc2lQNE1yTFNJSkxXdU1FRllKZ1Vi?=
 =?utf-8?B?b2lDZXdFTFRBTVEvY3B5M3BEWFZHNU5td01XTmRjVDVRSEV6alIwbU5UQmtt?=
 =?utf-8?B?cEZzUGtvSTVFYVZNYzdWa1VwSUk3aFM3akNScmQrK0I5TEpOOExycUg4QXEr?=
 =?utf-8?B?QXgram0yZHNsdzhvMzJ2WWh2MERyaEl6QldTbWxuQ1dKWXJXYTc3LzB2cHRr?=
 =?utf-8?B?OW0zS29wbkpzUDk5bDh2TDdWUW0xSFA0clF1N3paSzZsb0J5Q3AvN2tqL1pB?=
 =?utf-8?B?eGJ6K3JZaWtUSndEL2t4eWNNTUJib3p5N3JDdFFOb0czL0xzalhtY0Z5ellP?=
 =?utf-8?B?TzR4MGhqU3VndVJaaU9lbVpPdnpsTThIVGhVNm1mbGxOUTJDZGFEaXpBQlNz?=
 =?utf-8?B?R253NUhkdVpXVXhiMEVKa3NmM1MwSWFnZlR2c1EvcTk4bmdCYnlaM0Y4NTF4?=
 =?utf-8?B?aTliN1RBMk00T2FmenE5ejhDUmJHV0UxcDE1VWVMblMrTGRDb0xYOWFxMFBL?=
 =?utf-8?B?RDJlT2JRTnBGV21jZHlrWExzanUyNEJiTzdoUmNDbWhzd0JsZXN6Q0M2cCtT?=
 =?utf-8?B?UUdOVGM5ZkNCREhSSXNXdW0zWlEzMy9yNGVyQkp0M1FFRXJSYlFqWjdmWEFp?=
 =?utf-8?B?K0xGNXQzY2FnWUQ5OTdPUlZ2TTYyaGY1dVFZWkRGUkNrZkNTWUx0Q1phT3FI?=
 =?utf-8?B?UzVBaUh0SDVoMlFxVENFaUdSNWdDQWZqN0p0NDBEVWVONGdrT2plMlBqRi8z?=
 =?utf-8?B?ak45UDFUNWdIVUlvcmVualhZWHRmUHBvV1p4cVJtRGhKTFBYNFJWbTI2RkpJ?=
 =?utf-8?B?ZXhLOTZrNGphY1g1UzYyUjNDYnYwWm8yV3ZFYTlXaWZSSTR0VXZWZTlTZ2VU?=
 =?utf-8?B?d2ROckRKNUVaNkluS1dVVWNDZHFsVW00QTRkMjE0ajBINTliUnR4c2cvS3VQ?=
 =?utf-8?B?a2FEWUlCazk2SGxDUSt6aXB2ZUR4UWcvaG9mSUZSdjNZdHBCMVhYdlFLYUJI?=
 =?utf-8?B?andhUHBQQWg2UXBCbjVxU2JMRHpOYXA2R0tYZ1N5YTEwZW1RcmJWUHlFbVZN?=
 =?utf-8?B?T1N1TW9CMkFUL016OUpTcTFUWlNSR3VZMjBLc3hORktmQ3RyQks0YVRZZnZ2?=
 =?utf-8?B?MkN4b3poUHNlU0NyVm5PNzY0Mjdwb09nazdINXVON3Bkd3lBRVUxa05xckYx?=
 =?utf-8?B?OHZqaHUzbkdEQTRUZXJwNWVDZkZsYnFSK1haVHBQZzNDdCtpZWhjUXk0OGdl?=
 =?utf-8?B?QUJ5QzM4WlZyNmJrSFBPbW5xbGR3M1BSdzBGMjB1MDA5TlBNUEFTQ0NJZjU4?=
 =?utf-8?B?dzB1bHVFVVExTDY4NXN5bXpFQXNsQ0xZUTFYditlTjRSam1aenRPUEg2NUwr?=
 =?utf-8?B?dmcrdmJ3TGNwbmlDMWEybVdFdnhQNFFxc05YSXQwQzhLNCtpNDdWZ1Uyd3Jh?=
 =?utf-8?B?bTRDZmV2SG1KTmlRTlpGd0ZqOW1TMU1Oa1ZXcG9rcStqdjVVUnV0a2dZTmNW?=
 =?utf-8?B?bU1jdUNNNVNjYytoRXNNSzUwWHhDU1lJUCsvNkVhVS93RGdmL0thZjJZMmhv?=
 =?utf-8?B?MUpuN0tETTVNR3FIUk9lYmtoK1ByM21GR3RwMnBLcjY0Tk5GTXZla3RTdVBu?=
 =?utf-8?B?Sis0NnZsV1hES21RbFRrWTY3QWlOcVgxcWdxTjdqS2FPOUllS2dtZ2J0SjRy?=
 =?utf-8?B?TCtLTWNMaGJDeFIyckd1M09qeFJGUnByTEZ4cGpoTzA5Y3BQL2t6ZkpaM0g3?=
 =?utf-8?Q?021QcRaTkvzEPGX3Mz39KZnqD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8637017-07fb-41bd-5d1d-08de395f29aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:41.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7xZIId8ZsHYr6DlOfCvV/I2CV2sBNvWVhJYnCIo0WHbXd5O2k7sWv1B8DtngfaK/L6lN0ShZeMgs6P2CWTjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

From: Peng Fan <peng.fan@nxp.com>

gpio4 is default enabled in imx91-93-common.dtsi, so add the alias for
gpio4.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index aca78768dbd4bf30d9d6ae4a1cc37a29256d8f97..a2cad45432b3a8e34e365530da8edf3a89503f22 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -18,6 +18,7 @@ aliases {
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;
+		gpio3 = &gpio4;
 		i2c0 = &lpi2c1;
 		i2c1 = &lpi2c2;
 		i2c2 = &lpi2c3;

-- 
2.37.1

