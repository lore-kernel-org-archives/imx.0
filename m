Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795447105;
	b=ymQOntJgH5ha5WG+NEaWPAj8arHJ+oOX0SrkgU07BbqnVKOdXgzqXFIQy+afDT885UVq
	 G7wntShgZoJHH+QCXo+y/5WMZ9fNimJsTXWHzPbgdaBIH2ohnApLCUWC0YA3goXxkzrY5
	 e4YKlc/BAElOnbcljb4W+wkjMttY1Ci4X9bfNNGes5zp45I7j41HvYFqz07LM7AUFXyzB
	 2Pm2fBvHiGcLnlBjQWVK7UBbnMEuOjgoUnADNCunBuq57V7I/M2N+H6cR16EtAD8ZFrj+
	 k/JMvJzQ3h4GKi9z2OUutkLM68tTJfx8DwfHH27NXNqH9jB27q+swob/uqnU7Ek7rZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447105;
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
	bh=tnpD6mmS184YF+qaqQnhmmweavbBdfDLT8BDD3zugvM=;
	b=fmmPPL6rE+X1Q76/ahaAPtawwJ7QGsGHCOxurVW6+wvdDOHdWZBX6qTab0xT/gtc88OR
	 LF5gaFJMgpmgMvlQ/kSHz2IM7mTXAI0m0gbQgJy0mPEd8AlAt0B40mGv5Ots8VaRJs9Uu
	 yS+8j0f8/DeZkuoTTFy/EzptEKpyxUuSb3D+OzIuMk+NCpXvEAo4VhVhwgttTfMcVqShr
	 yGoq2wr1f35nz/f5+kXa391q540VrNO4ractzxIV84NN6YUFphWFehIDRbFRZ+L2nRZFV
	 Q/fo+IfWUsKjzfb2wa78yzn1d5ZUa/4N6J+N1PnIxcYVuHbq7xnwxL/kQjngKRfclAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IgFzhOkX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.143
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020143.outbound.protection.outlook.com [52.101.84.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F7606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 15:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550F7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IgFzhOkX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuUvgYuQWM91paLTaH9zU5VTtlHyHttrw/iFUs7F3ezrdcfR49TKo1NDKXGhiFuXpUdxmJpGdsLQJRC3tS0amD8kfYo/f0JRos/mTt9K5lQoFhp3q4ASa2h36qKZ0NnVztydPuWlt3JNtqg1SJ3OJdZbLzwudUr9i9cZnx7NIQiZAQh5GTDxw74pro7m0w7+lfvM8zODaRbV0VfYoFZyDO2G/rVzBbmSuB8f2i5lZ79wQVafaVmvRBpy380rNeWKzO+cp6hk2QHKKT6g1D2l65FHllR+SDdvDAkfDjw04KeqrU3plThwbTSHXdGowt+elH7nBtLYXu3T/apum6ek7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnpD6mmS184YF+qaqQnhmmweavbBdfDLT8BDD3zugvM=;
 b=E2fmwXUaumkuI/nuGH3HjIOzCe4aYQaWr43UvwlAaPB4fxrTr1LDLeJs4RXYzIuUrEg8yBZ6JOr6HmiN7M7qycIj0/AO4s7eBjp5pZShD998vy7YOynGs69PTbhGFR1FnTPqIWl6vnu98oSn1lT8qhciKlorm38mrbocf8sNecfzYc8zU1aohiJ5zBHmrCYGLaai4HxTZ8OSsK9hlM9D0JanVeyxlMOjNVlmCcFRsaamKYTDXGgG+OrM0M9+0HcmvNJhHNLCRbyuB7+bXv8T6TyfFoVInI+wBDPEQNGpBAqmrNdwZyDpriJfMJrM+q45TDtoJX8LDDrlrwYseo5n0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnpD6mmS184YF+qaqQnhmmweavbBdfDLT8BDD3zugvM=;
 b=IgFzhOkXkDHm79IU1tZLehVUc4NZsha+oJRnpToMkLvcFkhZUtXd4oxOLyqFt+WGiK/eLF4Ho6GZmxalGaD0xu2ySjmj5hK6SZFSMoHWsAsbwfvNP6kyhiLhpze7ptFWyihFyKAxfoRtTQbBfbHI36X4Px5LsE2USPdDNZVaXioXa8Ld7gQ+X9+bodeV0E6NyMeREojc0fj3PrNwucZvb22po5KTN0YJTd5N+kYK61xiY1ewZn/hiZAq7PkPdD4mGSKz6rQkRkhYEag7ePzu51F8lqF/CRwYuvywVUg1XAuzV++2GkkJExMyt/i5YOm5Lr8fHmkRekKtnhSUW0EPZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::10)
 by AMCP195MB976614.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:784::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 15:18:21 +0000
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894]) by VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 15:18:21 +0000
Message-ID: <dcb6b43a-2315-4cb5-bb4a-5b060c1803be@phytec.de>
Date: Mon, 23 Nov 2026 16:18:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: Add phyFLEX-Libra i.MX 8M Plus FPSC
To: Yannic Moog <y.moog@phytec.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Christian Hemp <C.Hemp@phytec.de>, Jan Remmet <j.remmet@phytec.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-2-4adcf8b4d373@phytec.de>
Content-Language: en-US
From: Benjamin Hahn <B.Hahn@phytec.de>
In-Reply-To: <20261116-imx8mp-phyflex-v1-2-4adcf8b4d373@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::15) To VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:159::10)
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
X-MS-TrafficTypeDiagnostic: VI1P195MB0623:EE_|AMCP195MB976614:EE_
X-MS-Office365-Filtering-Correlation-Id: 62299421-47f6-4a99-bac3-08df49750253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006|261009223027099003|4143699003|261026121527099003|261022075727099003|261021123027099003|261021135927099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3tisR8Wx+RD2jG/SYxf3wWNCO/J2FC6qT9dtIszc6YHoLVpkh5sWTXQSQuaJTdezPwbupgvFmK+gYMUJaZWP9ori1eVsANlDW95/ATloAkjounNT4L/sAZZq/rCI8J6BWsD7iHFV778bEiLNuVow2g2U5afIeGTsZDHpdCpcjr6WiYc1AHNJxv/Q5AWnwh9QjLyNPrHsn55GLmQGem9Y50FwXPaWqN1jFobBQdG6J89aAYDUVrGEI3ygIir7iDP5wM+qBf8bzpqP4BQhyJ6cWtg112KK6ycm1waGSe9VGSM3Ru4VNQ43iyLRdHE6PI3899Qsj9nMR1qDw364kbvC/+ueLDndc/Wij3WO+QyJulfSt7fsU0tRgp4GbNW+Z31GQ4Y9sv9JgDmSeyEtPNRnVGZSgisT6q+pJzcPh2fhLMIDoCb/AJIu3yYEf2N+D1cvXZBLASc6V/O40cQIonm/n45Afx0Epe8jW07lk8tMy3DY1gKGXan3zpD6qY6bhp5L7GL8miNc7q+57mMYRpu/TtCjrQlxQtXt+TI4oOnWvunQrryU07fIwBEiyLkbWI68T/M7tVBe792NfOO7NSyxd/14KML5cnjCLUZPA9rwrw5qzSD3aP358S/9boJ35lqp9UNNBBfIWt+2mObTJPwPOQgzyrH7AzfvYWT78usOCow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0623.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(4143699003)(261026121527099003)(261022075727099003)(261021123027099003)(261021135927099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHQxTm9GWGcwUmkwV0Z0bnFoK2lUVWhYbXpMYUZxSUhENkwrUUFiR1BRaXdN?=
 =?utf-8?B?WmNRaWMxSVpHRnB3eWRsYnNZcGp2dlF3ZHU3SFRXb2VOMWxEeWJkcGJYUGE5?=
 =?utf-8?B?bGtFWXV3VzdTMEdseUNGMm84VU91bjFzb3JCNVdZOHZRTDUyZlV0Z0RjZzlH?=
 =?utf-8?B?TzIrSE1KSFNwR1J0RERtd0hPakp3QWp1TWpzMXRQYy8xSGZqWkNxbEJJRTdY?=
 =?utf-8?B?eWNUZDduTlVURk9jU2lZY3hML2VWeTQyTzdJaHdSeUdNeXR4Rldmejk1SEdi?=
 =?utf-8?B?NTQxeUkyYThCc0RUdC9MaTh5eVFHY1g3UmRHd2dDalZpS1ptZ29Pckd3K1dH?=
 =?utf-8?B?eHp2RkYvU1grbUVCK2w1UzNCVGc4UjFydFNWeUR0YmdydlZqT3Jla0lpM3Y0?=
 =?utf-8?B?L3l4TGM3Q1VNa3VaVllWdnV5ZFdrT0pGN3Yrd0N0Mmx3NkxsWUc2TkZ2RmJP?=
 =?utf-8?B?d1N2eEV3RSsraFVCQUx0ZFlLdlJjMGljWFlzWEZKRHZkUU9lRXpaVktMWFEz?=
 =?utf-8?B?TWV2R2NWWGkydmJMUmJERWVyOSs0MW11b0NTRE1waVBUUWRHcXFOVWJoRXBO?=
 =?utf-8?B?dGY2QmpZWXZ0RTJFdmx1MWhqNytQVEhBYTV3ZFFheUJnV1NKSXZTYWtBbjJD?=
 =?utf-8?B?eTUyMXY0c1ZHQmFIUUNObTlEZHF1UjFxMWRkbURQdjVlbllLeEZTK0ovYlRD?=
 =?utf-8?B?VjFGN3dXN1Z5aUJVQmpVQXhWeG1XclhEZGQ0cEdhZEVhTjJIbUxjbHkvaThs?=
 =?utf-8?B?ZkpGZmZCaUJwcC8vNHd5RFNpcWR5Z3JuVEhYWE5xZ25PYWx3SGJSNXJjL0pU?=
 =?utf-8?B?bUdVMG5JMUF4YkdsVGVacy9pZ1VEbmJtTy9uVEdYTkhWbmJVWUlqTkdpczJt?=
 =?utf-8?B?SG1NaHorRWhVT2FUck5mS0dKZlVqTjJkMHZ4UkN2MUdwNzR5dEpjM2RRY0lK?=
 =?utf-8?B?cnV0RmtVOXBNM3dTdytWQjl5Q3R2Wk5OUkpuNjN5LzhSbVNreStqTExBak9F?=
 =?utf-8?B?N25jbnFjcGM4OXl4YmNMRmFydGR5aGVISWpLdzQ3SGlDYzROaFlTdTJ5NGgy?=
 =?utf-8?B?MzV2dzBaYkUweFJMbzF3Vkx1RU50TGVrL0o2dW5SK1poRzFpQ2hHcmxUOWpu?=
 =?utf-8?B?ZlloUkRLUlF5MkZGeUIyc2ZHdnFIN0pBVTdZMmRCQTAwV1dCMG9LN2RXREo5?=
 =?utf-8?B?NlRzaHJGekNMOU5Xb0RnODFoeVhuM0VhMXNrdlNrMDNweVZ5NHBkMWd4NHB0?=
 =?utf-8?B?MkpaNEVqbDI5cUgrZGVweTk3RFZYYmRSOThLVFN4UTVneFRncU5RSkhRK2Yy?=
 =?utf-8?B?RkJGR3JBVmtVTFpOME92cm1wWWJpdVowRzAweHE1ZTBVUjZ3MHNLdWc1aVpp?=
 =?utf-8?B?MUFSWjFMVlN3U2FzMkFQMXpXQ205NFpZcUwwV1VBWVV4SWsxKzQwcHJRQ2Rw?=
 =?utf-8?B?dmppTzlxU1FtMDUvZmlwUHJWVlJuY1hHNHRURGNpUlFSVnJya3hMSXZOdTR2?=
 =?utf-8?B?V01ZZTY4Q3Fhb0Y1NHdPTXd4ZUxVbFU1VThXMytkRU1LS3lMUlBSOW03VFNH?=
 =?utf-8?B?dHBUd3NnK2VuSlAzRXptUmtGRVZZWUd1dEdETDFoL3VkdzdPUUpZa0VSd21v?=
 =?utf-8?B?V2h2SlZrcmdqaGdrZGx3dG81eThVQ0ZRRFl5YUhManh0U1pMd2hrZ2FCZGRE?=
 =?utf-8?B?N2xDKzVKWmg2MzVNTllFVlFPTXE2KzJVYkQzZTZJQWlscGF5WDhZbEQ1U05D?=
 =?utf-8?B?MCs0NmxKL1ZvdUszWkQrdlhZRmtXSjVQSFpmQmxrRHZHaThyRWduUnkxbTFC?=
 =?utf-8?B?R2xPUXFNQW5uMnhmL0lkRHBXMW4vVDVzNmJiRDUyOHVUV1FGTUt2NVgzRkRn?=
 =?utf-8?B?ajhlbGJnRlI4blFoaW0rNTlkMlF5cnl3bkcyUmY1VDJGN3YyMUFTa1hrSmlx?=
 =?utf-8?B?OWlkU1VuYUNnTUZkL0dyd016Kzg5eVZkRUlwa3dVZGpPcDBBTktVekI1ay80?=
 =?utf-8?B?a245UWNCMk83dkFHZW4veUVLcGZUSEY0bEVhL2pzSHhRZVpUT0FNTWx5amJx?=
 =?utf-8?B?cGtIaDdGZDNlUXVMcHVhNEQ2UktVQTAyc1VsbnJrOWl2RFpBbkZod1YyVHo1?=
 =?utf-8?B?QUwvYUE4TlpIU045aEZVY210QnR6UlppVXBldmN4QmYzRVlLZjRCTE5tT2Na?=
 =?utf-8?B?TTFPdDBzNDk3b2dkMk96Vnp2NzhYZlJ5Sk5VUk9uOEtZMy9RTmVWTHN6N2tO?=
 =?utf-8?B?NDRIT3h4ZkVkdFQvclJaNi9UdU5BYmQ5L1VrYndodHU4SVMwSndyYXh6Zmts?=
 =?utf-8?Q?TEMCR3ctNnMf4eIeVE?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 62299421-47f6-4a99-bac3-08df49750253
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 15:18:21.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MErYqaepkV+/eBpkf+FenoB8E9h6b3Ye4fmHaIPOeC7kNBkNm8gMBOUa6EQO9AN6vwu4WG6m+PqZ51xE0j83QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCP195MB976614

Hi,
did you base this on the latest downstream state? I think you are 
missing some of the fixes and adjustments made due to hardware 
measurements from downstream e.g.:
0fd256893ad2 arm64: dts: freescale: imx8mp-phyflex-fpsc-g-som: Fix wrong 
comment
a0890e65eb83 PFLG01-46: arm64: dts: imx8mp-phyflex-fpsc-g-som: Update 
eqos drive strength
df7ad84865d6 PFLG01-46: arm64: dts: imx8mp-phyflex-libra-rdk: Update phy 
delay

Am 16.11.26 um 11:54 schrieb Yannic Moog:
...
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts
> new file mode 100644
> index 0000000000000..7ebedbcba7c67
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts
...
> +
> +	reg_vdd_3v3: regulator-vdd-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VDD_3V3";
> +	};
> +
> +	reg_vdd_5v0: regulator-vdd-5v0 {
> +		compatible = "regulator-fixed";
Why is "regulator-always-on" and "regulator-boot-on" missing here?
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "VDD_5V0";
> +	};
> +
> +	reg_vdd_5v0_hdmi_out: regulator-vdd-5v0-hdmi-out {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio_expander2 7 GPIO_ACTIVE_HIGH>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "VDD_5V0_HDMI_OUT";
> +	};
> +
> +	reg_vdd_5v0_ref: regulator-vdd-5v0-ref {
> +		compatible = "regulator-fixed";
Why is "regulator-always-on" and "regulator-boot-on" missing here?

> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "VDD_5V0_REF";
> +	};
> +

...

> +};
> +
> +&usdhc1 {
> +	bus-width = <4>;
First of all this is not necessarily needed, as this is the default 
value provided by imx8mp.dtsi.
But if you want to supply it, this belongs to SoM dtsi (as is done for 
imx95 phyFLEX SoM) in my opinion, as the SoM provides 4 lanes for this 
interface. The other 4 are on mandatory UART signals.

Benjamin
> +	status = "okay";
> +};
> +
> +/* SD-Card */
> +&usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <200000000>;
> +	bus-width = <4>;
> +	disable-wp;
> +	status = "okay";
> +};
>
