Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686DC390229
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732835; cv=fail; b=VqVH1V3+ZduIwOWJLHXIIpOBsJfgXb2Mv4e9KDniZ3q9RnRMcHr1W2P+YRFvn8kBFoI98UZib9PLGiMRPI6g/YQL4jrlU9B1EJgsJFGkLdNsRe8pTqRxJAugm5wd5Qt5r2kO3Yv/NTXIaG4Upr6vl7KJDryjmpOca6TI3n/yl9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732835; c=relaxed/simple;
	bh=4d5aZ2XibV0CQ+HnXML3tPGuyhb3aGSN68IgkiYi41Q=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZhwJ+vkIL3gdnblOQN/d4tDbIBkUoM5s4QnAWqEA7/6S/w7VsvDzEpwRs9WA7/v4zzBP7U3RTZStnx9b1xs0TEIKJZbtIsy0xtNBN3NXkUoDnkJUwM1+LNly3n0XW7S5A7w24VSWI9Xpb2OofxpJPaxxqdobjYaeTYCiUz6LqcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IC4pVOqp; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IC4pVOqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDu1j6qM4l7mTAaSTtsQ+aRIPFp5drJVcQePyNa0IwcxtlsH7rSSsVqU4YvkQp3v5WuamnscXoqH6lYdkY8KP0orGdYS+958uc8AFpSSowo951Z6UzFLuCh4U4vx2ba9FrWQbOI/AfqdTrlSXkwKYWi/IAPpw3JZsHbaz9qADZmbdKv6rslSOLE93udSDPhpcZVh6csUIx4vkZP26ZUGVw46r9vojLULrjo1Y4HkFm8O/I8gI2yji7/Or3lByVsJ6wflL4fk3PkUz4iBZBZ0MBjAp+MXw0o+If0D70tGSLLoGLkkJNsINtkQKvLlWCG0RTa/VYVF2YVT6SNJ7OlYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d5aZ2XibV0CQ+HnXML3tPGuyhb3aGSN68IgkiYi41Q=;
 b=C3hKVunyanSWTtGbDffZ/mfy2IKytLTAaPbQDg7rMNM+jnmvKaQv8rxkLv15f9XhGiC6237SRHyV2hu/oqLgsKiuOvLXUzwdgTj6h+3K6s3Xbtr0O7vSQ5Erte1GoWf5pP7P4jeJecAnPf5LEV4uT9DV+eAkPaojBmWwN98r4mLf7NXTCF73nyinf7XSXtSb5IZ/PkV3je91N7DgjhPE0faFdedlQJmC8lMkYYCVPeEmurKFkhboyW1oygGyanJSxIEXrsk3aQSzB+qgrnDcE+JNbAcfez6mU3aFfcG/MHAvRojomLPwxjfM9T4XbkuDcArZpyWf7MUDb5QoO1T81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d5aZ2XibV0CQ+HnXML3tPGuyhb3aGSN68IgkiYi41Q=;
 b=IC4pVOqpSmDUSMjbefHilzD1uA/uDLR0jDx4mIro+Ok1ua7y2N6CfSOWvh0K7BFWLp2TklxExRDOxdYdpmo6nprcdkKHDTAqyFnxu63WtQ8iMuovDqbRyXnzhAe5Fq5kCxrPOnHKBy8YIyXW+y5+D51vm9wxRkB1QlJtdc4+sBxEvbAyL8UcmpJacdVqXeA6qLcgBxj7hYSykZPKXRt7CTiL2EJ+UzDsl7QHKdCIKD1GTESMxVOdkM6lCDfAuPrnKKk260gNSHyJzhHC0/n0P2t+yVVcH8pndPilnIC1aEha8NIiPNW7WtoPWp7f8UpjmoaUDh6i4E6EoSsor8b/MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV4PR04MB11851.eurprd04.prod.outlook.com (2603:10a6:150:2d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 07:33:20 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 07:33:36 +0000
Message-ID: <8e3f6df0-9d93-4e17-8db5-1dc96999006e@oss.nxp.com>
Date: Tue, 17 Mar 2026 09:36:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for
 IOMUXC_SAI2_TXC__GPIO4_IO25
To: Marek Vasut <marek.vasut@mailbox.org>,
 Eduard Bostina <egbostina@gmail.com>, daniel.baluta@nxp.com,
 simona.toaca@nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260309181524.39423-1-egbostina@gmail.com>
 <2313c717-1729-48a2-8fc7-63b68ce0a0e6@mailbox.org>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <2313c717-1729-48a2-8fc7-63b68ce0a0e6@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV4PR04MB11851:EE_
X-MS-Office365-Filtering-Correlation-Id: e131a1e4-4a5d-4cf3-dcf2-08de83f77ff3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|366016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	f0krDu8GDLvtoaeVpFrL5oU2KqJ8NIhreYw0cQF5JaeGQAWFwPpG9epx64+qUrGMEPIOXij7S+RGBvaJhvwpxw8ZP0SZO5HppBWeCogyTo5bh4V1TVP6Sktr76nIqHZXosY3WX+NM2SPTWPllMYYZx6HNSbzmdAIebljb3Kz+H5c8dcFqfI5Q6P2ndFiXm7+BZ+45s53gsnpS7GMIrB74x+ScquTtJ5jt3MkT7NTdcqkyD2crWQuq0oBcZ3FSqNtwjyTbE2iZTLWB50NDTQ8EhLj3is7wif80nTNWrH2sfHsMw73oQbZURyksEJuLNP8NYSBzrZf4C0rAnH+l9MbgjwYih/nCaGcIq3fq8ogC8uhshxevecq2MwHhxHrYEKAcRvWOuwn0eJafhLl4xdcZpy2nqmHpW7I4njQmit6UR8LAnxPaYszsRGed1HqEjSeXdBMGDrJGDSdrg25nrai+FRGMOjNy4H9AVO2QJluDZKSbtVWf9vSHgF/O2t15e7sLRcyEv4chh1tGyedGZgBGJ8F3sVVDSC01LX1WMePyRxouNJfZ/Sk3IVaYrFqsGtxPdANh8jTRMvnTghOaU3C0igiPZ5oXcBDiDqz6rMlZd49rgc1U+3KrnYwsWzQ05okWsw4q9yaWIjdq/jJGoxySTNOuFYt3iNIac0/H3rfyUYLuRTeGr/2385z5ku8PSK9WZlvwVY/EyWieAMrUl1UxK40DS8Efi6eEC+ORGyrkfMS4sCt/hs3lg+IOdA1rt07/yZKFA25eAsh71hIZmx4uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(366016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmU3Z3VqRDZXbS9XWmJTL1JlWnF4OE80TkliSkZzdHczQmFMRXFoZVF0WFFq?=
 =?utf-8?B?TjFtNHlCUFF6bkNyZzE5YVRFU3Jycm0zNnA0ZjdadlYwNHJzckVxNXlxM0sv?=
 =?utf-8?B?WUNmUkM3dHRQTk5lMVBlMmtpZUFTOCtzNEtZaklQYkdxSnphUDE0dkY1REEr?=
 =?utf-8?B?R0RTYWI2eTRhSzNQbis2TlcvYmtJVGl5YXJvb25lZ004ZkhNVWJJaGlUWDhj?=
 =?utf-8?B?NCtxZVFHRUVTRXowWVRBeTc3SHU0RXZPYTBYSnNWb2ttTHdwdmJWT1ZOVndp?=
 =?utf-8?B?MUh5bkhPWE01NmN6TDR0TXFDbjczNC91RTRGeU5pVk1nZzNtdENHZlBEeWs1?=
 =?utf-8?B?eEZpemQxYUxKaW9kOHJxY1dLczFqSmFNNTJGRytNcjN5Z3FxY1NtZlYycDFr?=
 =?utf-8?B?Sm1sZmhEOVowdHc4ek1qZGtpempxUEVCZzdMK2dCVUswSytuaWZKTUNrTFJl?=
 =?utf-8?B?YTZGWVo5L2NQLy83MVVXRkoyTXVaWjdlWjgzZGZkMFdRQUkvbEM3OCtBWndQ?=
 =?utf-8?B?RG1zT1R5d2FsT3hIeE9jbGVUS2o5WlRMRnFXREdzWElnVHM3VzYzUEZWak1i?=
 =?utf-8?B?VjFabVIyb0w3Y0xudWRWNmRndVp2NzlBeWRkajF1NGpXc09IbXVIMjh3MUNR?=
 =?utf-8?B?Y0x6Wm42WjB2RWcrenhMRll3NHVqZ043WnRSajBMODBPWFJ2UTV4SFFIV3lv?=
 =?utf-8?B?ZHltSFcrSUxVbXJiZm1vVUpZZlpRWTdKemJOUGdFNE9QTWhuUzhOSlpFdll2?=
 =?utf-8?B?UmhOY2NYblBXZFlNemtmRk5qZXJXU1lyMXJKaURmV0wvN1RQWk9kTFQvdEE1?=
 =?utf-8?B?L2FHcmlqcUpTbnVzOXJ5YUpOVkVRSFJld0NnL1BlNDFLWE9ueTJKNGtPUkVW?=
 =?utf-8?B?SGljZWdxZFZ1MnNBV25scGYva20zTWpkVk9EblhRazZHVFZ4SlJCTEd3blRC?=
 =?utf-8?B?WUdvdG1EaEpWdzJQdU1rRzNDUkZzVEtQMXljTVc5ZnZoVG1BclJucFE3bFJP?=
 =?utf-8?B?NUliWFlQV1o0M2x5RHZZRzRvSjVWdUxhYThkSUhscHcyNnlPSk9rZmRpckk5?=
 =?utf-8?B?Y1lEZWwyeW5OMFF2aHo0ZnBMbG5yTERVZkM4cUxFY0FzUi9tUXBFMFdZU2Yz?=
 =?utf-8?B?M2dMcXRjN1ZURjdIVXdSV29qdHFyNndlcDBLUCs4Um80cEFrWXZtdDhSOVoy?=
 =?utf-8?B?SjZudXRuMUhoTW1VcitiblYwOXVjTW5EK3pXUFJZck1CMG9Ya0tlSXhUSWtr?=
 =?utf-8?B?dUg2VnhMZVJWaU1sOVdhS09MbUE1YmF5ZjV2VDBmM2Y1WkdKL2UzTDhvcWNN?=
 =?utf-8?B?YngveDR4cEh3NWk5VUFQWTFLa1p3Y2ErSmVKZ0FoNHRnc09SQVJ6THdQSmFy?=
 =?utf-8?B?Yy85UHRmUG9QcnoxdzV5K2EwemVTRERjZ3FBTzgwdkhmU2Z0Z1ZGb3ZBMTRH?=
 =?utf-8?B?Y3FjQVo1MTJVRFR5RTJVYkcyVENWWlhzcmI1WS9VditvQXlIWHIzZGdWTDdU?=
 =?utf-8?B?eFhxZnhGK1J5clkrZUVsejM3SW1wUWM4VjMveUp5Y3NXak5UMmVaVVZLc211?=
 =?utf-8?B?R21CQXZST2pBUHRVSVd5TVdBbHN2ckhFZTZHbTEwOXZSUnk1OWJ5eGhTNGEr?=
 =?utf-8?B?cmgwU3VqMXlkVkNFbnZVa3FMYk8wQ3FUSGRLaFRiUUd1bzk0ZUsyeHpWU091?=
 =?utf-8?B?bG83MEJDMUJrOGxFYWRUMjc5cWRMY1NrdFk4MHVkdmxJR3J4TnYwb1lOUy9j?=
 =?utf-8?B?T3ZCdEV0cWNxT3R5N2xqN1hwL29pRlp2Rjg4U3ZJRUFlNTU5VTFndXlxQUVB?=
 =?utf-8?B?TVhZTjhvNWd6U2VpamtGSEVVOXJTTkIvdTdXSkViWmdxLzNzcVVGM1lOeCtR?=
 =?utf-8?B?aE1UcG5QVE9jK25Qa0lGbjNZbzVuZEpBWEtxdkdzZmpoTm81eE5FR0NoWE1R?=
 =?utf-8?B?U2o4SWMrT0NTemVidnRIeDlaYm1ScUtGQXIvbUtSVXMxajNhK3VmZk9GYUM0?=
 =?utf-8?B?MGxuWFh6QmxvTytSRG0xMlE0d2NJVVRWWmY1c1AvOCsrWm5OQVZoV3V0K3JF?=
 =?utf-8?B?THgxMW1NZ1NQWHlHcm9ZSk9HRW95OVExZ0pHY1BXZjNFaTJ0Wm5PV1g2Nk1l?=
 =?utf-8?B?M3J3MWx5VDUwZVQ3Sjh2R3hvTktjTUtaWWlnOE5IcGZKN2kzUS8vT2FJY2ky?=
 =?utf-8?B?Ump4bEVvTlZYaDgyQ3dIZ1lwL0ZScFMweVptcW9pdFo5dGpnaGxBdHhERUlV?=
 =?utf-8?B?UFpNekhwaVhacGFGZ0ZYZldqNHpBZjBlUnFudmhXMlo3ZFJuYTg2T2gwL0RO?=
 =?utf-8?B?YjRQMkorUkNwTVVLSG5raGhjbEJMaVJrUmdxVC82dm5Wb25lVDFhZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e131a1e4-4a5d-4cf3-dcf2-08de83f77ff3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:33:36.1718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oEZbElxMnNWatD90jDD8tM8B+sGMvXVSWLrKZDJT17BwomzeS8E5y89bGcM9iJ3rx4HdKYFEgeiFBF2khaz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11851

On 3/13/26 18:44, Marek Vasut wrote:
> On 3/9/26 7:15 PM, Eduard Bostina wrote:
>> Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
>> raw value is written in this register. This makes the code not obvious
>> to read and modify. 


[..]

>>       pinctrl_ptn5150: ptn5150grp {
>>               fsl,pins = <
>> -                     MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25               0x40000000
>> +                     MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25               MX8MP_SION
> Isn't the SION bit at the same bit offset at least since iMX5x ? Maybe
> the MX8MP_* prefix isn't necessary ?
>
Hi Marek,

I think this can be factored out once we finish moving all the configs to symbolic macros.

