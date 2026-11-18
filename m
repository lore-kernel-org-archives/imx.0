Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999168;
	b=pXQMYKdbRdAJVH2QalvT4aydoLAtqeXNO6oKZy9P/YqiZGHnGJXvsY8sHG7tOCFKAKSQ
	 M61EcdY47wZuNaLDS0IKwM4IITtu/83HqbzsHatX+sueXE7SsZn+hSeL4AejCYXAXdqsi
	 wr0GKWWbwjS/CXUEikkHU93Kn0SV08O3rZKacMJKKum4wzYnHhlNp7xDKQHK7rwdes6e6
	 p2qDspnqnokeZmxW0qfDmnr3suoC9HFFuFjGq/YTDrTtwxlblsiqg5oMvcubrq0dDbj1s
	 eXrSTqL9VnVCkkKZCbfHoqYtIeJ0GmchigQZFa/hDHRyatVykEXgxBLt9wNcEPEhf1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999168;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=q/WHeFAnSrfqnBVadbFI/Flt1XMD0leQD6vZBgePXEI=;
	b=hFsGWIc4upnD0JaWfypDj65ZnGY0XGNduSywkWuC7Kr4O/46xREv9k6RIR8V7VSwRjBU
	 tPjq3CKHTSlzxDfqnUY8jUSSW5IhRXk2uYquQT9rpiMWaX59jSw68aPiSiTXfmoH0Ehuu
	 f6Ej25Enf/pu7Ixv1F+NGeYIFB1cdPNweO3kJsa/fsSiaJ278Zi9vd1B0Phzwb9RGpw2X
	 x7ejAtk+24w+ghW/qUfrtx0WdRk6tfrdfQ2Tt8Jvynxvt5rIl2fXLRAuBOrBHbErbcm5B
	 QtYtZZwC9HR10XL69EBTLOKT+XRhNY1sjTGfaAus8uod8w7OdSRBKvyRqctfGlf7QNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kontron.de;
	spf=pass smtp.mailfrom=kontron.de;
	dkim=pass header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=hjn50alu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.99
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021099.outbound.protection.outlook.com [40.107.130.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760DE606A32F
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760DE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=hjn50alu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWFmVX6Uceuou7ZmlkjZf7g3dDuIJwHzvfu5HEWSXOMYd2VsRWUAwAOJiT9gd0HrFa+hqIuPDxj09Z6c7r7PuxWU2thxr4xf31/IR2BO8SrFgkl+Yp4Y81bOi8HioberErPUOyjkwNX4CjHJvQt+Q11e0Hc6ASpPNkrmOEizdPAa4KfXua8qab7rJlnb4OwsMqum+GYKUcOqfk3rPSrau3Ucfx75vuKY98/aeScywd5b7WpgLUSmosh+Y8Vhn2Qyt6n5FCkCtaQdudHCCbxYlsCgVtBZ0BxmETVLgLBE0eam7iTUrEkdNoe+UC504HalIN+CJDQugnfjgLtzFACKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/WHeFAnSrfqnBVadbFI/Flt1XMD0leQD6vZBgePXEI=;
 b=TbG/M5pCKrDtaM2ETrOblqjVrVKaKBz82PRkqkpkTV14ny8ewCrJJkDWvsMCflC4abYPNGd2TL7WSUaKDG0LKHuoo0IgQagN3LwTtDESgEcnbZkrow/52qbNdGPxdAqJ789j91kk8dCCLCdZLmdNyMT+Uz0F3/vPu81ZamGjrvL1C+XFaaGmnUHBtZG3tb7OvqoII0JHzM5HJCU0v34eaeiZGZ9Ojv6/5U1YCZArxlWefQQMJZY/DvlqAzXA+I4zVOvT69TBoyNbBQqsGhays0MCc206BFhH7FV0uI/duAFAObbwqtLzvkXWkAcqMVxyLDukf/Eq4Idwn25BwjAURQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/WHeFAnSrfqnBVadbFI/Flt1XMD0leQD6vZBgePXEI=;
 b=hjn50aluvuqLEmdcn/6ovMKoRnXuHU+otD6kbacjMaoyCRznKZUMP2YHY7ZaMwTXLujWCiIL0HnVEXXsefvfMlZinbYXNKLKrTcsLMHTPvotkejWiaeUWnvM6WhVJDyfuLKKumx0wjF2bOTywhmAaYyHYK21QKciIZWYV3ZpJDkU9QG2+Bt+68R9EXcEAW3uxY9xSn2vSUGJalFMMUrzSEaGu+3ma7lxf5VqYFRV7PFi1I+3YjgNHDVp+C8puF6o8uveF74NSi5aBmGG9J6D8+2JbFN6cw+FDcjc+Y5DbbLL/suTWXaSHBNjfBXMPebuRaGH9jy/wIy8rboGYhghPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by VI3PR10MB177098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:378::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 10:52:41 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 10:52:41 +0000
Message-ID: <dd940fd7-7950-4074-be80-5bf129a57772@kontron.de>
Date: Wed, 18 Nov 2026 11:52:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/4] net: enetc: add i.MX952 NETC v4.6 support
To: xiaoning.wang@oss.nxp.com, netdev@vger.kernel.org
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Clark Wang <xiaoning.wang@nxp.com>
References: <20261104092217.1730351-1-xiaoning.wang@oss.nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20261104092217.1730351-1-xiaoning.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::12) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|VI3PR10MB177098:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c496be-34e8-4b76-555f-08df456211a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|11063799006|56012099006|10067099003|261022113327099003;
X-Microsoft-Antispam-Message-Info:
	fde6oRCs1dw8WDG+dWyLsWy77vE2+hcD0AJWCdVC3sAEAoPerkberzQ08WXK2ohtjVIlSypjAha5XkisO8oOL25tH9/wI0hyQ+qMzdIX9X4W5S3z7lqtFvYfDOS4naArmO+fhI7icWV4UIAcNKgR2NP1Eh1YpQO7aPNhIag+DTdDs87N+9nT6urSFYUEQcA7lGHc2KWC3pCM2XWhMIuCtc5JasBTCxiKjVgKI9eE6gIyf78NxIJz0rAe0lfZIcHzxxaV13q8pdsW/OJ+4E4SrTlfvykinmLKEk33qLSEPTZoE5IUMN+/FAgWdt2WdZYV+c5hQq2xBKjhRuppHiz2HZKCtN7MYSJVpMjl+ZywmdHP6+xshFsJ1I6aXgedx+iLLR2AvEtxqSJWRtGidXU67Ro7xEMe9f35DggVftETM6l4nC+AlIXv/BaptP4zOBmsDARLKn3hRN4VvzQFlSPtzVCIuxtQzBY9yCOgMDWTV3MHs7qTSwICila8eCxzHhfTbUdFrIsQs2jP6koGb4U2PZA0Sg03GNxemw5E9DKOzesuFLxtIaRFBn21Yc9zhMLUQyOsaQdHDEtUDw3eyBcPUEgO5iGrgd3iryWC0TOsin28K+ZAeI5ghQvY0MXo+EbEDiXP8Jx8yCwgDPvhBLgn5kY1nQngwBUO8ZYeg/f1VRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261022113327099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXl1QW44WkM1aFovRlJkMXZ5L3M5d3N4SzBDTStnRUNKemlGZWRqcU53dXZL?=
 =?utf-8?B?bXdacjRiNjZ5a3hpMzMwUkNLdnFHT1pjczFzV1ZsMUljYy9sRFZSV3VxUVRh?=
 =?utf-8?B?bCtVMnhsUWZ5eVpIRTlMWU9JNXZHSjBjQVB3QTlKN244MGFPdXovb004dk9I?=
 =?utf-8?B?d25BeEdPMDd2eUsrVXJUYXBRekFsL2EzMmhZL1dQdldNMElzODlYVzdqeVRl?=
 =?utf-8?B?SUp5YjZDRmFUWUUyYmRmQWNIZkZ3UGxnd2tGZUxDV0owcWlkWDFDWlFFTTF5?=
 =?utf-8?B?cGV2WjlCcXFUaWRhcGx3bmsrTVlnRWZGUVNqNmQydHBiamlpVllpTFd2bjdY?=
 =?utf-8?B?bjlqakVxdjFvNE5ISzJpMFlMcDhnOXZnOGJwQjYzSnlNcS9hS3pzblQrWGpl?=
 =?utf-8?B?OFVOL2hzVThnOWV1eC9iVG5RWEkrM0svdFN3M2N4WnpCclNiS3picktJMVVV?=
 =?utf-8?B?NzNxT1Bpa0JTSFdIb0toTCt3dmlXUk5Md3BuaFZHRUxRTkg4WldoR3pDbHVM?=
 =?utf-8?B?dHRQUFVkNktVaXJWL21ZaDBLcHlDclJKajRCOFVvNkxqVTJCRE1yMnFsbHli?=
 =?utf-8?B?S3liSUJwdExZN0QvWER2aG5ZV2xvOFhBbTd5NTRCZE9zZXdjeDhmeTM0QzBR?=
 =?utf-8?B?cVhGbVE3dFpGM29QY3I4TzdoRndYcVhvZFVFOHBzcU9VSTVUZm1WWTlOOFR3?=
 =?utf-8?B?cHltdGg5a0h3NnVsVEtmTVNMOXBnOGZoV2hXTmlsSmNxVHRaaC9yOVR3d3RV?=
 =?utf-8?B?VEx0L1Jna05STm1qSU9hSEl2Y1JyeUpMQ3pGbmMxcDFZZ1hXYU9TR1MvcGxl?=
 =?utf-8?B?dDVaeVdvTy8wdDZwa1J3NmtUWHFVREJEU0pqN2R4c2FoNE1oUlNnNXMyRFR2?=
 =?utf-8?B?Skl4YnF5cnV0QzBTZGtteTVyYThWZm1ISWgxWDVTTzdRVGRuY0hocHF5SUNk?=
 =?utf-8?B?SkVsSUZmc013NUpZVXNCY00wUTdHbGs2blRTRm1zcjdqSE83Z0dJY3pkc1p2?=
 =?utf-8?B?Z0M3bE4rd1dVMk5CbkgrU0V5akVxbHpQVml6ZUlnc3dIbUtoZmdaMzdBWmNS?=
 =?utf-8?B?N2JnZTJEbE9zZ0plZlEwemgxRVg5RXlIZEpGcjQyTlIwWVdQWk1JUFdxMWdw?=
 =?utf-8?B?SnNLSUR1OElFREQvNWJPZWs0OU0yOS9YbnRJd0NKNDgrakZQNWp3dSswWjRm?=
 =?utf-8?B?M01LYUl3RmcrTHd0eUNhSmN0dkNoNEpsOGxyUFpVUGxCLzdwQlZUdXJRdVVN?=
 =?utf-8?B?SWpSWDNERloydEZHTWlDOE1WTkt5eEtCQXVIdVN6SEJWOGROc3dYMWFkYWhI?=
 =?utf-8?B?L29Dek44VDNmV1RTRE5UZXBkbjZRRlplUTJJdDFlU3RLSlY5bFpaVXQwSTZL?=
 =?utf-8?B?SHFKUDZpeGVTdkd3aVp1MkFxaVE1Nk5sdndkbnZPWC9PdEVvSkVuN2ZHRTYz?=
 =?utf-8?B?K2VMcm56TE50ZG5EZFBOb0JmVElpcWp6a2lnQjlaUEQrVVNmUVZzUlh4RWpQ?=
 =?utf-8?B?T1JLb1Y2ODJXMUJCLzdsdmpPL0FXblpUa1F4Q3NIdXUyZVJsVmU4ck9mbUFM?=
 =?utf-8?B?N2NDQUJ2QUxwdC9id2llMU5oTTByMWprR1Brc2hZZWhJcGRNMDdVMVNteEpN?=
 =?utf-8?B?VFluZ3pHM3FsTnhMT25SOFMzNXlRNUxiaUNLcHovUlVoNTJwYjk4SDlkQm03?=
 =?utf-8?B?OVkwU3FPVC8xOFdCTGN3SnZJak54YUxxRk56UElpVFBPeTZGOStlS0tFTGgx?=
 =?utf-8?B?YnBJUkVTU0pESTR3MmVlRTZPVWVZZVJNZFNlMDhTWHRPKzBVYjczc0FnZUhj?=
 =?utf-8?B?Um8xTVp5SzhVRHptSlorQ3pKZ2ozVEZVVms2OXhteGRTdnFRRklTQ0dWbDJs?=
 =?utf-8?B?RmZHN1h1TkNlNTZDRTdxZHA4N1NSak1NYVdzeENmVDJzZmI1akQ3Z1RseVpj?=
 =?utf-8?B?b0p4U2UyOVdzWkZCN3A3alpYMTYrNGtuSUU5YXhlcDlRdDZlSkE3Z05RU0NJ?=
 =?utf-8?B?ZHlsNGJkeWRVU1R4YTMxMlFHelNSd1hOZ2E0OXZ0alp3NjUzVEtTeTUvUHBV?=
 =?utf-8?B?RXcvaW03QVRmYW11VU9Uc2xQeFh6ZXVGSkllZ1cvUUp1M05IcGRIVlZRZFpU?=
 =?utf-8?B?OCsvL3BxTmxtZGY5SDRMM3RIR3NKK2lLQzZLajJ4ZW0zWmZpMkhhOVdTV0JX?=
 =?utf-8?B?YnpZNEtiN0Q1TlQ2UDdYMmNvTU96cmszdUtXVncrWi9ScXBvWkJIbmQ2amll?=
 =?utf-8?B?VWVyS0FJQk10UlA0NTlvc1RQSjR2ZFRTTTNPSU1hVkNQVDJxbEhpWS9JclIy?=
 =?utf-8?B?eXRMdjV5MGIyZkQxSVhocngwVmxsa3hhSVJLQ2FlcytxbXFTbGU1RG9mWDVa?=
 =?utf-8?Q?s0Wz/UvJbsoyEww0=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c496be-34e8-4b76-555f-08df456211a6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:52:41.7295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLURPbnzu/095jym3fdKHMJCObJxLJ9i/YVWqehICEQy6HncoYcXWDZOqK5U0AwCT092KoZPsiWll9eOa7AZdLBkh8TX+cQ84U+WdjnERO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR10MB177098

On 04.11.26 10:22, xiaoning.wang@oss.nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> This series adds Ethernet support for the NXP i.MX952, whose NETC is
> revision 4.6. Its NETC integration differs from i.MX95 and i.MX94 in
> the following ways:
>  - there are two standalone ENETCs and no switch: ENETC 0 on PCIe bus 0
>    (RMII/RGMII) and ENETC 1 on PCIe bus 1 (RMII/RGMII/SGMII), plus a
>    single IEEE 1588 timer;
>  - the NETC system clock is 133 MHz instead of 333 MHz;
>  - the reset value of the ENETC 0 Tx byte credit registers is too small
>    for jumbo frames.
> 
> The DTS patch set will be sent separately after this series is applied.
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
