Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795422251;
	b=yXiEqBs5z8EyKVN8fcpd2aL8RKO65t9vpChf5TwLNJgx/m04/yyj3jGYuI67qASHpNl+
	 5eHHpQr/eN5xM0Gg+Sd93lp26BKOeTYbnf4gX0GSaFmqUMAsi9sDyb1lfAgKREkJZDDJb
	 kXpX5tyk0QgZ779O03pVmw9KkArx3/jJ+L7HBs/ouY+Fbi4xuxDT+uKGyXkhTAopipv54
	 rs1PsoF3a3qD1r5Ajd9xgCLQL6B+xb66aohS/pcGnm7hX81x3wLCn/W+vxyfPHOZNu94E
	 DVnHj9ZUvwiOT4W0cNe/KyiE25+hXoAZmXF2L+NlOBfE3HrD+q2W7CcdQ7rdrMF0joA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422251;
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
	bh=7JV4TwoNsvXMu7vPPeJjdqGmjlYCEzvD+FBkkLCOKsU=;
	b=5t7Hp8Bj0z9DZ04kKLQYIHxj9fT5uZIBLfDVDIy2TD6l8j/ppxHyDr3pGXA1i4oxB7SQ
	 +56eivbb7svaRd5FGjUatBz6BsN6vxujFYaS2aE06K+C6z9V6LveACr6VegzEZIVohWTx
	 7XyH1Lr4JuRwhc1wJoLnczp+vdd4CqE7V3fEeHypMn9av4ixRfxIkcjKluYSOMp3WZ+dG
	 yE99MtusPmodEuiK1T6BMKfDa2sCw2AW2siMBVshQJZon0l1dMzc5JDKREfkk/DVOOEDp
	 HCiYuzAh8UrSPCamsksMfR2quBS4JlhMzoFBtqJBfN0NPrsEyP4OgEMQ2DBUf3yV5gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kontron.de;
	spf=pass smtp.mailfrom=kontron.de;
	dkim=pass header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=r6buaBv0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.101
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020101.outbound.protection.outlook.com [52.101.84.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34208606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 08:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34208606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=r6buaBv0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFnI7BwACHIkbQmNdCCCPtD/23pb9MyFToJQ3cpTDzUXGm+auiEcnUKNS24ClLvnaEc+RiwG96iwPmhNPOlIM3VTJnnbTyqrtuc+9/mCpPVKdrWKyrjMVZCGwakK75GtgHsmpbB+n5Xqe8Ye0QmiaPrWXqvTrEgUvACadLStnG7rMROtUkkNKgAXGhhurW3e5W4dTIdyNfhEDm5qmPOI6gEQO+G8M2LDvfPe6EGEW/f52KWUeDO0omL1oYriNoCG7a2L44s+OeVvy3nCQ35CKrSjbn15eIPTtV6tweFiDVRY6ZdkWxKiLEe76dz4OuDLz1bdOoHHm2KSKv4Kep37MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JV4TwoNsvXMu7vPPeJjdqGmjlYCEzvD+FBkkLCOKsU=;
 b=Z1Ej3lh8ZudLSoz6v9u4UE8CdXb/qyR4a5XinJk+oVI2KSU7c22le31v7Pa29cW3O+WFilR2Rj0Bn0QcNHZcrOhkBkJupTgdzaZMr9Q2mv1UGcfXZH8ijVEgrQOnSaZ/Y9i7NBianSJsCkvNnPSPnQnyj1D22cxi/+yYXGyLp2oQmDpK6MY7/CIa54dgvxx6+jdZtinu3zHYnIIqodo0QHJbpE0GQ4ee1FE9C1eR66t+ptFpctgwGi4NoI4wDo/1tiFwPXX7HFKDnPEva4Mp5yWZ6/c5wFJiFIoTBp5CyQpQIPPAzzcp4ZQ48+q+KmMPAdG4Z3yBZFaChQukeQ2sbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JV4TwoNsvXMu7vPPeJjdqGmjlYCEzvD+FBkkLCOKsU=;
 b=r6buaBv0t052bD7zhrrVXclCAddeyhC1z2PNVM+h2SnXGYvI2BplMtgOq59L1JlWFXeMwNJLeRyWf4Z3WxO3jQ+ydO6/FaJG4Nb12mctbRz1+KJitFrwoIkxMQto7KuZOy+azcXaktnshQlJiP11Y38CFf3PPU+LpTANxG0//REAApOzQRZBPmThMxEjD4rROk/H4Z0Nzri3LOzpiO45ll5lFrD6rqbKj7R5m6P7bzNoREyqGwvkG7G40WorzgBF/yXfww7jbfhGbkbFyAvnpDjCjX+d1C42b+xV+oiS+06ksXJuaYccUuPIftibDSCNFqxIpK4qUxRoBGv8fr9ybQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by GV1PR10MB8673.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Mon, 23 Nov
 2026 08:24:00 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0662.001; Mon, 23 Nov 2026
 08:24:00 +0000
Message-ID: <c0d303e2-cbb2-40aa-97b2-c0ec6d493cde@kontron.de>
Date: Mon, 23 Nov 2026 09:23:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frieder Schrempf
 <frieder@fris.de>, Eric Dumazet <edumazet@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
 <ZR6PR04MB5878801865D14143CC9622B73CF37A2@ZR6PR04MB587880.eurprd04.prod.outlook.com>
 <f0538c2e-873a-4522-9883-c28113efb0bb@kontron.de>
Content-Language: en-US, de-DE
In-Reply-To: <f0538c2e-873a-4522-9883-c28113efb0bb@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|GV1PR10MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: 5382b6f6-a27f-4d64-d006-08df493b2046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261021135927099003|261022105027099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wbHMoULN8bWzeML+P2DEo55ggEImSWcsWQgRAtAZW/AQHioV1lK8FZ1DKwNDk/5hHyIt2r23VZBfuxWVNLVX173p6l6PiUCrbeZUk+tqf8hmqHSKXgog5Xpn57YF9YR97ZwweL/YiUO2lfVdo4Ncw/Y2XiEH8xTRFlkchQdRvugZmLH0h5hP2Sl1TTxiDjD4AC+8HnGPOZ3GPRS2PspP5RU4pvy9e2qQnXjgFR0am+YfMagcBOvojF97TjKCtbLYKpyFvpzV2iHLC/LQKKkVHT9gL8q5ANPRBool6vB2BiwnhzllwdH6Snk4bNhwM/hdTqh5cVNAn1sAZlip7++3+1IeYsgC45vAS23mJinIcjKQWFuCyFz+2JE4q0nmd/ve6jK1u0zmovzXFOgj8D1m8t8wsSmYWCD2GzWwjoJZyPVhGCQrk3T4ikgkscb3Nt8WeQi19nExOfKOMWLCZbwx4Ug3a+FfYiqvKvXcKBHAVosC5PqdhLW6RaARH3yY93KdSDtY/ZiA8cbNTSwu5+cdqt4HoP8tMtsnCfqEfxKRxsS93QaG1G7ZJZCujXRvMx/MxdQRUuEUyUhJ6O8P+Y6drV/QFTl+bW70o7KJ4xJuRIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022105027099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEErSTdpRkduRitkaTZpbk1rRkJBaG1HQ2x2VitIdDVoNkFiVVlXa3c4VFcy?=
 =?utf-8?B?eVpxMXN1aGxxN2Z4aTdYdTZwNTd6MjRhSW1vazlkVVE4RUZHK0pISjRkVG5y?=
 =?utf-8?B?WGVHNTRaek83dkpOUk1RY1Z3YWtKWk5kSUJCTWcxaGhhd0x3eW5HeXlJb2Q2?=
 =?utf-8?B?N0RHbXhJaktVaU9mcXBVOGRvMUhpcU9ucTlxQ1pZdkpvMkxWVzZJS21jT0hj?=
 =?utf-8?B?aGdMRjBWeUhlR1oxSG5PQloxek82WXF1cmE3SVhvcEJ2ZGhXQ1ZmcUlhOFNZ?=
 =?utf-8?B?OHNCZUZsVFh5R1BkeFJLQXRsMnFCeVRwMysvajZEaUQ0N1lKWVRhOGRHWml0?=
 =?utf-8?B?eGtVeTFSNUNTL1JSVDdGbGxlSVBuMEpDVGMvQk1Vc0JlSFZzTVh6MkcwcnpD?=
 =?utf-8?B?alkrWloxYkZTd1NXa21sZ0ljcWZJekluLy9rVTl3ak9UOHZMZEUvVjVuT0FP?=
 =?utf-8?B?QmhvbWNmcmpuREhXZnF4TlIveDVJWXpOWXpMZ2NwZ2lBWm14MFd2MndlQkxJ?=
 =?utf-8?B?bzZRYWVXT0pJNnNweEJsRURtYXlVbC92aHBtTEdPRDlDRXVTZzVmV0UvUDZs?=
 =?utf-8?B?d1VGL1UvVlRSWjlFT1RXaVpzWVV5ZzRQZE44RGI0aWRHbGhrcUlteVlaM3Vv?=
 =?utf-8?B?SEIwN1pDblpUdlZtd0FmQzRPUlhsUDlMWG1ZRTJuYkZ6WmJCQ1h3aVEwbVJT?=
 =?utf-8?B?am5nUDh2ODUxRTBlQVlFTWlJL3pmN2pDeWY3bm9jam5BQlQ0SUpQMmQ5Myty?=
 =?utf-8?B?QThra0RSQ3k5SVViaXJaSmVMM0NsNHBLOTJ2Ym10NUdXRWx1blIzSk5CbnpQ?=
 =?utf-8?B?NnFybDF2cjlyeDZlWWY2KzJTZ3R4aU14bG95ZHY0QnY0WnJhRHJyakNPZ2RM?=
 =?utf-8?B?Z2V2T0xnaGVoS2daekxFTFZ6cUJSZHorTmN4c3UxdUhKcmR4Q3IyTWFENXYw?=
 =?utf-8?B?VjdUT3Y3c1VLVDMwTGZudFVMS1RKZVYxVWdwQ1FSZG9rVkpweHordndhTmx0?=
 =?utf-8?B?WE5hSmdUQkNlZXpwdkF6MjE5NFAxdnFQRm95RWxZS05rQ2dQV0NzUzhsWlBt?=
 =?utf-8?B?UUlyMmJCdXNJQ0tFWHEzTTZpZUtsRzlhbVhsVzM0S251SldRS2ZyYkIrNmJQ?=
 =?utf-8?B?R25qR0Jsd0cyL1g5aDNrWFJXVTBVU1gyTFZ4cGppYS9MMzNSaEdGZTVBZUg3?=
 =?utf-8?B?RDdjMjI5UVczSnJ5QU1od3lwdkhFWll4L2xYTG9Yd2VxUmNYaWdNc3FJUWRy?=
 =?utf-8?B?bnIzOERHK0hOaFl2WWpqdDFvRnJmaTQ0eWNOOXBaTE93YjJZRTlIbGtHendm?=
 =?utf-8?B?TEFHaHBacWZTWmh0Skd5V1htam42NG9ZQTBxUDR2dDVsU0JHSERYcENJU09M?=
 =?utf-8?B?MThteGNsSlI1anJYWk1pM2JVZ0wzUEZnQkMydnJnNkxrY2ltOStxTS9GZEUv?=
 =?utf-8?B?Y3JxSUNGQ0M3RE1ZUEVCeVUyWnoxeXNFbGMxVU84LzZnY04xemcraGo2bUJy?=
 =?utf-8?B?K2xFMUZqR2VxSGtMRUxnZ0hsKy9PNXEzRE43TXVmOFhCTGJTZWM4N2NjdnM4?=
 =?utf-8?B?OUZRUTljNWxrSlMveUlCenVpTmlwUTBuRkJhMXN0YURDRXZUejY4a3ZlMmhZ?=
 =?utf-8?B?R1NaQWdDbm95ZDNzQWJYWlZlVk9MWkJ5b2FXQXc2aXZ4U3QyTTF2N0lCbWlV?=
 =?utf-8?B?dVRBU2lkN0xyNC9kSHlLV0d5RFZSeGVwa2RDQXZ4TDZleG5hMmpHS2hyUENu?=
 =?utf-8?B?ZlM3M0UzTkd0RjF5ZUhJeXdTMHIyc3JacHhmZTFkQlVmZmUwY3U4Tk9xM2x1?=
 =?utf-8?B?eVNwVGRabkhmMkFFalp3ZjExd3NqTlhqVDZhNG03OENXSFpkbFYxWTlMTjAr?=
 =?utf-8?B?UjdqbHprNnlhY2FaalQ0OW9ENU9zemxnek03WUR5Z1ZzajRTUG9KVFVCb1dz?=
 =?utf-8?B?MmFpc2V4YUh3SUE0SkUyUldYdGNKaFZvb3U0SExBNE5OMnI1emRVQitScFIy?=
 =?utf-8?B?OGhnSjFLRlRtdkxNbFB6dk41dk5WQ2JZa1lpOVJiSEpydzZPbHNJYlFMQUZ5?=
 =?utf-8?B?djhuTmNYR3owZ2oxYVR2Y1IvZWJPMVlpcXE4Y0QvckRFZ09jTFAwTVJqUXRn?=
 =?utf-8?B?MWhRR3gra1BPYWVORjBYbUpUNDhEbmo3V3Y0bFBoNUlyencyRkpIT0ExWE1V?=
 =?utf-8?B?QmVCeWdpTjNJZUVrRCtQcHBDdkN6NUkzMW5YL1psN3pBdE4yUlJTc3pZdGh5?=
 =?utf-8?B?Rm83dzFJblA5V2J1bEhrUmRXaWVqKzNWeGZ4MFJsVTNpQi83YlFuUTI2b0RV?=
 =?utf-8?B?K0RFSlRvcEQ1RHE1THlpY3dpeU5kZlppSFdsVnVpWGJjZW9NcndzU1YzcjBS?=
 =?utf-8?Q?CC8Vd/TMs6EDWbWY=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5382b6f6-a27f-4d64-d006-08df493b2046
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:24:00.4382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLBxYVN1nwRznOpMIqDe0USYI70iUEUUtOjugvqSyLaCVkXx+I8P+leegaToLwlwbRwUq2LD2IOc7sA+Xl3bHOQ7rc+Jg3ElQefa1Y8NA0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8673

On 18.11.26 11:50, Frieder Schrempf wrote:
> On 18.11.26 11:43, Clark Wang wrote:
>> [Sie erhalten nicht h?ufig E-Mails von xiaoning.wang@nxp.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>
>>> Subject: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
>>>
>>> This adds support for the NETC Ethernet controller on the i.MX952 SoC.
>>>
>>> i.MX952 has two ENETC instances (IP revision 4.6), each on its own PCIe bus.
>>> ENETC0 shares bus 0 with the NETC timer and the central EMDIO,
>>> ENETC1 sits alone on bus 1. The NETC system clock runs at 133 MHz, compared to
>>> 333 MHz on i.MX95.
>>>
>>> The patches are ported from NXP's lf-6.18.y vendor kernel. The device tree
>>> changes for imx952.dtsi and the i.MX952 EVK will be sent separately to the i.MX
>>> tree.
>>>
>>> Tested on the i.MX952 EVK with ENETC0 (RGMII): the link works, hardware
>>> timestamping is available and the PHC runs at the correct rate. ENETC1 is
>>> untested as it needs an add-on board.
>>>
>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>> ---
>>> Clark Wang (2):
>>>       net: enetc: netc_blk_ctrl: add i.MX952 support
>>>       ptp: netc: use 133 MHz system clock on i.MX952
>>>
>>> Frieder Schrempf (1):
>>>       dt-bindings: net: nxp,netc-blk-ctrl: add i.MX952 compatible
>>>
>>> Wei Fang (1):
>>>       net: enetc: add i.MX952 ENETC support
>>>
>>>  .../devicetree/bindings/net/nxp,netc-blk-ctrl.yaml |  1 +
>>>  drivers/net/ethernet/freescale/enetc/enetc.c       | 23 +++++++
>>>  .../net/ethernet/freescale/enetc/enetc_ethtool.c   |  1 +
>>>  drivers/net/ethernet/freescale/enetc/enetc_hw.h    |  2 +
>>>  .../net/ethernet/freescale/enetc/netc_blk_ctrl.c   | 73
>>> ++++++++++++++++++++++
>>>  drivers/ptp/ptp_netc.c                             |  7 ++-
>>>  6 files changed, 106 insertions(+), 1 deletion(-)
>>> ---
>>> base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
>>> change-id: 20261118-imx952-enetc-bd2bc331e1b5
>>>
>>> Best regards,
>>> --
>>> Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> Hi Frieder,
>>
>> I have sent the V1 patchset for imx952, will sent V2 this week.
>> https://lore.kernel.org/all/20261104092217.1730351-1-xiaoning.wang@oss.nxp.com/
> 
> Thanks! I totally missed your series when I was searching for it.
> 
> Please ignore this series and sorry for the additional noise.

Did you already send the v2? If not, please put me on Cc once you do as
I'm currently not subscribed to the netdev list.

Thanks!

