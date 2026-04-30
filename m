Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995BC3FE364
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538537; cv=fail; b=pqIgVf2JhjG/75tvKrrcsUSlbf+r4Kibz1ezC0MLE0OMcgw1zlh4SFfWgCNJYSI3YzwFx4tBlco5CrLoTjtr391PmIbzppujreBflWnxbZS9Vb/V+7OaQa9hdzBgGSIL/qfcx2F/+ht/8i23ifgDTHOiJH1y3/L3JyGSHKRk8GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538537; c=relaxed/simple;
	bh=tXoCoI8EI5o1MsEo6Hd4uWMbCQD9UT8vucZPVEF31/k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=morGmOtsUSyTE4cVTYtpkCLkTNUmtsUw4eW+UIZvTgOATbjsbNbBNr8wVmoM5rWgNUZ7vKb4kMB5NYS2vga9sQlaL6aKEozxO5bAolsze3CqEatQkUdG7z2COlq1QpZ+nap/E9gFLZwJMKJnUKLOFLl5C5/clOLDFMDK+IVe5Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=agbZ5KnR; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="agbZ5KnR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR2bplxrSC+YbiG7GrSaet8MiP7SaFxr1zOV/sU/VI5TaxRNERJ596dVVAa/r1dD0LHZjxTlAfxEf4KkoD2Qm0cxm5MsX0LX/tQc3vvfCpi9OjHmyauBkbcCqWGbvWlWoADA1BRsGwUUoScl8K/3WpwaBfYuQHXqZyecXcgCiqv4DD6yuJEM3g9hXyQ4NpTCTWNEm8fSUXtZPyULQO8MrbNM5NFva/QDazATuuvWGkVtyQBL6elot+hezSPG35X0DBEa4rTKvv5f/ndpRytvMmQ7sq7QLSai9eLE6Glv8PUbhfLIFHid0FMGd9EY6Nt46yHn0fgPPlKcst4OtCuMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FVn5Qch88c6hBeYwY+SvyUQLZmTEH/+cKQYWpfANPI=;
 b=ipPgYFHuJBO9iTpqUciybDW00Xon2vcBNPAe3trpYK6tw2qeKMFDvq60Vl06F2HAbz7mCLUd8ny6Qaz8eKEzA20WGB4h62AxiHMNdFhtLZI7dvSKnaT5EBZrCpkeRDz5e0vWvH4OAW/cPMjMBNE5/jFENLaHpaE5W6CPWsmkAP/3bTkJx+6rzQ4TGWyeO5sk1/TYKposznfsuH8zROjoMPyRGETNJBoIabCAbEKDZGB+lBx/+AYhslelr8vSTh3RDa0vYiwnaGQhRkBGzpBHrqawm7Y1sb27/vgyCmZKNbhPg39T/SyKTzQ+PUZIGqv3iC5SpARHI4zYf6UigjAeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FVn5Qch88c6hBeYwY+SvyUQLZmTEH/+cKQYWpfANPI=;
 b=agbZ5KnRfVsndu658MkO7eSnW51SQCUkzTIeDAcduCfZQRXKdGoJtJsOkeyyBZh1PrnHv0j9Ss5Jr/xKPRjtZQLB50E1z2hzCv/1Elt3VJcrpW0UE1V1arNHPp8ITHxMnA8aM1sLU4nTsZWfGO3yhglTadBSB1A4Bn3jX23cPZjwSlPJNOOSDhT1KMqGaExpTtp0Np/ctoui8kwXxU5HlgCcNV6I/F4eYtlgD1aq8FMaHPfP+dhoRgdfM69pqLA7TJpnJv2ErtGzP690xReDCupI1zCA6ONjjiW9X9ddnBTJSlCeCyBC6BJHUnkQ4Ib1JLoMig+rKWNv7Z3TDfkAOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB7864.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 30 Apr
 2026 08:42:10 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 08:42:10 +0000
Message-ID: <54662a45-34d2-41c6-aaea-e88cf1d00159@oss.nxp.com>
Date: Thu, 30 Apr 2026 11:45:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 4/5] arm64: dts: imx93: Cortex-A Core remoteproc
 device node
To: Jiafei Pan <jiafei.pan@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
 <20260428090819.17761-5-Jiafei.Pan@nxp.com>
 <b7e93b01-39aa-4a9f-9927-6c634a6c727c@kernel.org>
 <AM9PR04MB8196E13EA80CA4319EA17E828A352@AM9PR04MB8196.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <AM9PR04MB8196E13EA80CA4319EA17E828A352@AM9PR04MB8196.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 339defd5-0d66-40d6-cf5d-08dea6945e37
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	1sraUFw6djTF9PdaHSNQ54W9jDHLtRG6mYz3ywIH2hqSCDugHoo6ecEoJPwMQc0j6RELQrGoDDQkLp1fD8Lx+s+RCi9rvXXhTgKqFfOJk8Y/0dJ+YKao4lIGzsfEecGayA/sM6By88w8UCZ28yoDGp3Qreanzd9Y6HpYRmhsSi+LgqS8lZMEAYaaodJGTKorhUFRXIeRG8vzzIFPNV9Yyte/DOLNFkIrxA38FmG+LW6LBTljMI7OiOAJMfZ262+eFkyqyMN+KrDvdPqkfBawMDSzZYy3ZU41S8DFeRbK6MCecY48GHIK/228FftRcBVZINUCs0jwD/35Af2eXO5plAyY8iU1E1UFqHlHWtFsJUQl6NJLTF6NQ10QV9AOJonEW7R5X7aOIRKGY8nyH0QMYawsA+lKDqPbaxWjVTpVFQuy/ftyTKaU+yDx90Imy40rfU7ZFPbT8s213OvM2XSJfjDZYChtsrgIV8Dn6myLtG7dcZ1oFIivXoSf5nSsqniAq1zYfBYnNcKOa852Rm68Da/forglXla07qJstzNvsu4RXuzrSezgVG53rMCOEV2hk/JHPAsKBJWE6KWb+oXWVcY9iRDDmaQj9KWZER2B75yfoe6wu64sAZK8s/Sx+cPgjrxs4JDVwDC1YOtwYlihBGf/QGyKRc6ty25PTNxjb1Mfza/5SqQTNmLecyBoY1FRO91giBFxDyEfeEHIml6tkPhBlaLsOaFQlqFvX2UxLei8sy+3eseryaUXO9f0AcztDRu1Oa3D+gNaTYR6dVWpTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzNkREpjcW0wbmFBdXV5WCtSaGdiS1J6SXkzc21Mak5WaDBxK1M1T2hwT3p5?=
 =?utf-8?B?dlJ5UVlsbTQxRUVnOU40NVB0TFNIbStSNU9rb1cxNjZRdlAwbks4azVDcExn?=
 =?utf-8?B?NVJFeGJ4M3JoMDR1aFlZVCtUUEwwYk9rV0h4dFBJblBRb3R4OUNjUmhqU0Y3?=
 =?utf-8?B?WDg2REJucHJDeE5OblFYdEo5bmErclVDN2k5OXNrQnNsS2pJZlZUeGJ0UXJV?=
 =?utf-8?B?VlJETjljSlZvRW1iZVV2MnVNaW81ZVMxY2ZhUjJNekNoYXcxTkI3OVRuUnV2?=
 =?utf-8?B?UzZia0NQb0E1VGFZM21SUTM0S0xLOVJ5b2hhQWs3cTloRjgxZ2RmM3hOa28z?=
 =?utf-8?B?Q08vZWswQUhHTkRmQlVIcWx5aUJKZ1FEcnBrSmhqaExJYXl5Z1dNTm1TWkJE?=
 =?utf-8?B?REVyTXZtZUtMSHZDSk1jS1VPK2ZvRlJTWVNnTzloeE92eHFlemVFSkZtODI1?=
 =?utf-8?B?OGF4ZUFac3hmRVZjRS81Q2xHNkRnZDFPUU5sRmhVUGhuZzFZZmJodStIalFn?=
 =?utf-8?B?S1BxWWt1eVgvdXU4SzVGdSswYVZ1djBIT01JM2xzTStvTHlTVi9JYzhSWEFJ?=
 =?utf-8?B?bmkyQzkrZlp5b0pUdUxoUU5MdjZrNGhiVTZDYjlQaFFEdUxDVmROYzRSbUNy?=
 =?utf-8?B?dWw1Qkw1c3NBRmNXVkJ2dllaYlloUEJSOC9JVGxZUDlQb0VTRlBTNXFUZTZI?=
 =?utf-8?B?d2dzZ0FoM3p5MUJjV3RnYTdGSnhyT3RmNzNUUzUvUjNTZnNEblFmdkN0cDh0?=
 =?utf-8?B?RXV4VGtvUUxZNnlKMnQwa0hVdkpGNHdSZ1VrNll4M3dja2s1eXRrTHRGN3JO?=
 =?utf-8?B?ai9SUDBGTU5heU1hTndRVmthb3VabFl1V0UySTBmUlk2YURISkdVdFZFWUla?=
 =?utf-8?B?RFJkZ1h2eXpRRzBUa0ZRYmZ6RTk2MjFqTkd0MXBtYVVNYmViTVhpMnlQQU0x?=
 =?utf-8?B?aDYxTk9xS3hWZ2ttcDVCQmd6WXFFR1ZnUlMwdFU0VUZLZmU5SEZJbHlLZmJ1?=
 =?utf-8?B?T2tuMldBQ1lZQjhOQlVmKzZUSTNlTkhBdnFqSzhRQWRlaFZUOWxaNmtGMWJR?=
 =?utf-8?B?bGxLUXc4TmkzN1pHREtXYkZSdkd6K2pxRElDdXRIUDNVSHJEYkg2WXZ6LytL?=
 =?utf-8?B?WUxxU20zZDN5M0N0cUdZZEJ6dFA4NXdvZ0ZyY1ZXNlJEditHN2orRkNzcnFy?=
 =?utf-8?B?T2xvbzlLaHJWN3RqdEI2MlpLTW40ZGxHZ05mVE9yRjk3QXdnRnRaSVJZQWRE?=
 =?utf-8?B?M2hFTHJGR2hLU0duajAyVVJTNG5xc0ZsTkVQbkwwVU5CblRwazFsTzBGMytG?=
 =?utf-8?B?SEtUN2ptd1p3RkJMOXB4aDFJZEJGQ256N3FUdVVSbGkwQ3lnclljZTFkUlBv?=
 =?utf-8?B?NlQ1N0VWazRJQUJMSWpBS29DT2o0QmZXQ2w1ZFpNbVJiKzdzNG9yZno4Rm9J?=
 =?utf-8?B?NElGTi9oZFNrTjJhdmx2VjlxSW1Ha3BHbkRvRlpQUTNReGpNTjJrR3NkcEl1?=
 =?utf-8?B?TTlBSXJWeHNwSy9DamExU2pwL1ZabHA0MjNHOUdwc2V1eEdyY0RFOVZwKy9H?=
 =?utf-8?B?SnVrczUrNEwvVG9iQitEbm1sQ1ZKaER1TlN0cDd6YTBXdFhTYllkNE1wL2lj?=
 =?utf-8?B?QVp2YkU0all2ZVpxSk8xWTVBY1Z4SXdWbnlYZGQ2SE5BNlZiaHpPWGJTdkk1?=
 =?utf-8?B?QWdwUWpZL3ZCWEdVMks4TVppN0FWZXhhTkw5dDdyMnA0dGhUUEVtVDFqYUpE?=
 =?utf-8?B?Sm8yZldCWUQxQnZVMjZXMWlrb0ZhTFI5NHQvTmNQYk5SbDZtVEZUbVU4Zm1K?=
 =?utf-8?B?YStKcXdIQjFCVjhxVFhNWkNZclA0NmFQSjZxVUNnWmZseDJGRkhqK0J1WTEy?=
 =?utf-8?B?RTRjQkFxUmU0Qy9Lc2FHOW9kVDgyVDk4QTBKQndkdTdxaUYwTkVyaXM4Tzgz?=
 =?utf-8?B?MUlJL3p6bkNhWnIxVGQ3U2x2UGVGMHBIRkxuUWtZSHViMUozNk8yYlVJcUlZ?=
 =?utf-8?B?WmZJSGh0alpSZ0c4WWhpRnJkbHUwMFprRCttT01UNXNRR3FBWk9SdlhNblB4?=
 =?utf-8?B?OVBPa0UyaFVLSU1PbkxEZjZocU01WmZIRFNZcnhrNFFYRW9uME1qZXlZeG9x?=
 =?utf-8?B?aUNoRDRoNVFINDZrNkxlLzVYeTBmUzI1K01XU0Z3YnI2eXZ3UGFGdStSaTN5?=
 =?utf-8?B?MWtQNHBBTHRNUGJNanhtN2NJTUUrOEFOamllS0lKVmRzYzV2bCtKM0cvQWY0?=
 =?utf-8?B?ejV0RzJvQm1NQUdtenZIbVI5ZmJjRWZpcVFIYndaMVVENCt5NHd6Vm9FRkxp?=
 =?utf-8?B?ODBPS3FlNFdoUStOWVFwSVBQQWlZL0kxdGxFMEhyM25MWjFVNit0UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339defd5-0d66-40d6-cf5d-08dea6945e37
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 08:42:10.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpDxXDMaUk8fEQkVIUHjWB4fPjHBcig4VWbkQudZbB610F8bYzR9lNzSDaYur1XYxKQG6kkhQ+INYw7Qp+SMhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7864

On 4/30/26 09:51, Jiafei Pan wrote:
>> On 28/04/2026 11:08, Jiafei Pan wrote:
>>> +     init-on-array = <IMX93_CLK_LPUART2_GATE>; };
>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
>>> b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
>>> new file mode 100644
>>> index 000000000000..9d9a60404d2b
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
>>
>> Heh? A DTSI file for one device node?
>>
>> This looks a lot like downstream approach.
> Use a dtsi file which could be leveraged by multiple boards, otherwise what's your suggestion? Thanks.
> 

It is just one simple dts node, put it everywhere you need it don't bother including a dtsi file for it.
