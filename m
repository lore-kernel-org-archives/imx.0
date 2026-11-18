Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999014;
	b=iVj6yLcVwWtAzrzY4Shd9T3SKreswPDuQdKJUUstuZ5wepbGdfT2o21JY24oKQajvM3q
	 cmFCd8f4jfktHQA71sJdR9Y4kkT5XbhN6STWPvp8StZhtVHeNZUbGYhOrpTrvGZthrEnl
	 +WJTvNtccwxzENYvzCZPzuGKmGVNaVCHV3JnJM9Wsbd2nDqKrHnfQaNAeweOSMMiXXzPe
	 LJBICfGEDwCDFIpGRw3vzugF5N9g9d/Il9pGGV9R7CwVAJ72LY8Pfen0PXzWPnHGh2Zlv
	 qXAolzCDfCwELSTSOJFCNgeSCiZohdaSo9pmGusHcIQJipk8ncscKQKnhJ9Rx3kSdtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999014;
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
	bh=x6KMkdvdUnp9PB7Dt1o3j55lqU0GHumozI0pPJyFNrg=;
	b=0BDiQCnZ/KtMyTWwWHUKK0chBZueWqTuXoLJ0X85Tha3/7PSb6LYZdGrnYXTmNB76u5H
	 i4aPOO0cxGWU7ZSsx+gqQ0uuJRudsi4ZNOdzstHUp02x3A6qSnx0zQ6Kv7fFuyYeREsNd
	 Hd1XJd4x9ZsUqxDBTVygIsUuohGs5D0koPHq6k2xUtHQRU110pWQWBxOxS7JHV56YHapA
	 omdf+MQWmaivwB09bBv96BoTwWRijQBG1OPZx7XPurvfsBPRDZGEzKDkqZl/PC529Il15
	 bOz4hw4ugHOjTVsxInu7CrNIcMPE1kCkEcaRj2i4hCt1Kx1cWjsQGrVLdXto2qTNLLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kontron.de;
	spf=pass smtp.mailfrom=kontron.de;
	dkim=pass header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=vA7WALLX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.128
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020128.outbound.protection.outlook.com [52.101.84.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B2E606A338
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B2E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=vA7WALLX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JujDXdDqJTa12Jt9HeihSLk2MIzbvEqfXlgdpDl+s9fbtDcMu0o92b7XoxMq+XCF+r23f7hDtg9uysK22CHWRXR0w4P+jyxwwOYWB/+LSljnTJQ01kkc/zAWQn8htfPhOLPh2bRf05Yo9SyTnhqVddumMe/gjLlGuToOg24T4HPNryBbbfAsfZTDwW1ZnCXfbERDG265C7aBTjzCV71W82jbMellJ2BthCAY29BT/OIMCKHTDvxqwWze4dAjEue52jjocLKj4MMtjzatMe6Wd0HLxeaSh+ixuum5RiVD6AtF0uyMrg6kYGA9BoGEt/knj+ZPRpUbvJnoBcnhG2qZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6KMkdvdUnp9PB7Dt1o3j55lqU0GHumozI0pPJyFNrg=;
 b=ExXo/g8zEM+Mfq4Qr6SXogOYZ0tT5Zmu6wpN6cW6aJqmvfne0mfjEiJuZnWrcKB0zetOAhBdQpz1D625fOmEyj+kU7yMXecbL2UYBr/9blfijfPhCtcLPs534rl0BZvrRddl2age30ON7/v3h/w9Ajj2T9dHA39mIXJCeQ5a5WdgrUlGB/vs8ypSO7SeuRWZkv9gDoa964taN4If6QvvSvuY7qQJnjm8Z6nvTBev0cgVF9/GsunLGiSiSGaGfORbsPL3cArFcGdy9aQtVXln8rElcQ4aEE1AJgcOO8eyZhPcIbd2g/JI1xJepthslEliPlbsQM4kuKigy7+m590EMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6KMkdvdUnp9PB7Dt1o3j55lqU0GHumozI0pPJyFNrg=;
 b=vA7WALLXeky1WT3sjSrOtktEW3yLqNpDeJ4FUkwLMu/LXX0jgksqYCeGXVVRmX2VnEocCRkE6JUXpiY/73b6FrMo47NWLAkz1rG3tlFmP3X3XVGR1OvssMb1N2j+4s3AeNjBZ5I0bqj+hOxlhm1dkja3dsxsJLHvLBCZ4exorypqHYnxQ9LQF1ADanzAFRoz0XbH2oR35+cKvRgYOtya/Siz6EDakIjenVn2Vo+piv7MI4VgIWQQUajajFqtzYzU9XcS7jQXyc0VZ6U+Ab5LxoMSqMp+uV8sc11DsPjfYaX3QV5D+qES/9qKoFyur7knpfabSNUVM3+SLYsQ1iLbDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PA4PR10MB5682.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:264::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Wed, 18 Nov
 2026 10:50:09 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 10:50:08 +0000
Message-ID: <f0538c2e-873a-4522-9883-c28113efb0bb@kontron.de>
Date: Wed, 18 Nov 2026 11:50:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
To: Clark Wang <xiaoning.wang@nxp.com>, Frieder Schrempf <frieder@fris.de>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
 <ZR6PR04MB5878801865D14143CC9622B73CF37A2@ZR6PR04MB587880.eurprd04.prod.outlook.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <ZR6PR04MB5878801865D14143CC9622B73CF37A2@ZR6PR04MB587880.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::20) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PA4PR10MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 5402297f-04b4-4e33-0258-08df4561b69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|22082099003|18002099003|921020|4143699003|11063799006|56012099006|261028144727099003|261021121427099003|10067099003|261021123027099003|261009223027099003|261021135927099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	sF1PmmvLpfUnt3yz1Wbuv8DJNC8Y0AIyGNVBgT4bkJ0iQ27WaA0GgnQESspTuBW95okY6pTU8LW/9dn1FIw7AnxdBBA1M4Q2Ih0PbiypYq9rFL7uBxtPzcrCUPO6qMr4RTbxe/UtgBKBfBSTMOZIXtYztYKqRuMUIZl7PKosbweMTyeL3Pg7lUO3HkL59n6DRmQK5gtO+3cnLiJ53eh/8GZ7cXbK+cK3/yys5hd7Et4+viM1YAOiTigAo8rZnn9R2KPkrSa9TEiKfBjLkqw4g5I6VUsnhYZtd7hwY86QNdOFuoSPuBY0rqII1oIFXj9o31G0VIef9SAwTt7UeN5i9RdObdNfvA/bBRE28m5MfjD/wl/MkOzx7gPBHP2of+SEBuIeJVZqr/mIAzyU0wTuQwrqiSXtj5TnSdKAF2ID26M/apfpcD4CCzi0o333lesmrLeRDPkD75H/v9t1jYGNO1gzDNMavnQf6KMQLd8YXUfHa0bp/x8oJcIcJ50HzjIRJkouYTTyd8+Cfpm8v5WEK6opg9Zfe3guKmAO9Vi8YD7CPwwMhi3PUIJN/yCjBgTjf1H7APoQvscpbAF3qsTWI+1PFM5kFHBKFu4edW9N704jnEUF9KNAinQch24YRSS0/3r8/BsTVhpxbWw8gDLv/WVEPs+6od1LXSK5ysVA8qY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(921020)(4143699003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261021135927099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1pPWURKZ1NaWUp4ZHRhR285RnVBRkNVakExdmVLL3h3VldiRG9BYUUrRU4r?=
 =?utf-8?B?WEVNQldBTXNBZFZzbjVyTkh3M0p1VEE5aXhFeldVaEtFNWJaK09UV0lFQnk3?=
 =?utf-8?B?Z2IyM2ZWSEhTd0hBS3dVWEFKV09jYWxVK3hDWTFhNTF6cEUvWGVNY25MVy94?=
 =?utf-8?B?cjB1Lzc1SHZpSDl5VHdnS3hXUmtBM0s3bk5xOXhyVGY3WHoyb01qdUlqalVl?=
 =?utf-8?B?WjBrUk5GWWhUSS9jODR3Z1RIYzdIbUszMlpVNEdSZzhsKzF5Zld6bHFuUjR5?=
 =?utf-8?B?aVgyNVg3Q3ZPVDk0VSsrcWUrSW1JN2Q5dDJMQktiVFlUQUFmU3ZXWERwejNo?=
 =?utf-8?B?KzIzcmVlTlcwRTdiajhUMVV3TzI2Y0dXK2RSV2RQTFJMVzdvZW1ncDFQUlpL?=
 =?utf-8?B?NEVmRkxpUzI3bmEzcVlIVnVSS0lxMVFFcTB6a3dMRXdSaE9DdkpUaEN0V2VQ?=
 =?utf-8?B?UTBKQ3lISE9JTlpScmdXd1ZwZVc0aUZtNjhUcVE4ci9NSEtSWWNxNUozUEs2?=
 =?utf-8?B?cngxSVZMMHJ5UVZVaG9VQ0hKcFRwaW5TN3NuVTU4QlR4cEl1anhvQnJMRFZ4?=
 =?utf-8?B?elErNmhRMUd6UktZc01ieHRMYk1DSW1yV0ZEMitZS05hbnBFN2t2Kzd0bUpK?=
 =?utf-8?B?V2NReVlWQlpUc2JFa2ZTRFhjMUlMY2wyQ3l6VTZveU5ocGVNOUVxLzEwcEJx?=
 =?utf-8?B?VEhDZUhycGJWVUZJRFZhRCtIMndadSt0dk9xV3hnWUlKb051VFdwWHF1ZVg2?=
 =?utf-8?B?VDkyMktXMDFteVl0bGRnd2lDNVdWM0d2YnMxSDhKZ0hmTEVZaVE5ODJyV2pk?=
 =?utf-8?B?RFlkRXYyTzJZRjBRaHQwaVdUMjMwVDJSbHVZVmpvR0h0TzNncmtCTzVIYm0y?=
 =?utf-8?B?ck5GTXVaRVJzd0tSSXlZK2FjWFBUK011ZmY0U0RyQ0tZcFFWdllHRlA0MGR0?=
 =?utf-8?B?aDBiRUVBM3AvS08ydHAvMnV0OE5kQ3YzaTFCTzVmTkpMMlVKaTRJWmhPNFRK?=
 =?utf-8?B?Q2N4eXlRTWowa1FWOWFhUTQ4U0VtNk12VUFJQlQ1RkUvWTdHWnRYYmNxZmxP?=
 =?utf-8?B?eGFQRmNMMmk0RVlUSG1KKzJsOWNLQlArNncrM0lJeFYzcis1aXJvWUU5QllX?=
 =?utf-8?B?bW00NTRUKzZQd1pQNzhaeUozWi9BK2grSWFIemtBQ0NrQ3BteVZXL2lsMXVN?=
 =?utf-8?B?UERQcG1ESUkwSnlPRXAzbFhkUEhJTU95VGRicVBOK1dWRkE2TGEvRElaa0V0?=
 =?utf-8?B?QmNIVFh6aVc4Z29IVGRhOENlQWh2YjliSWhvMjRKTmJqN2trM2tZL0lQZGNm?=
 =?utf-8?B?SzZGYWFUdW1Fbmg5d1kwVDg1UERSQTdkMlNTR29wcm0xR2x1ZlZEbmxidzEr?=
 =?utf-8?B?YzhnVnU4N0hKN2VaN0JnNUg0MWRRRGd5OTlyNjZPai9YZHlHZVdyQkR1MEJi?=
 =?utf-8?B?S2RWc1lZVk5RQ1hRMHpjNU1hK3VzM2s1R3B5U2lqb0lLTlowRDBzd2cxL01m?=
 =?utf-8?B?WnpkL2FZZmoyekt4TTcvNDhpaHBVS0EyVi84b2ZyWHRScXNRajRwR1BCNnov?=
 =?utf-8?B?Mjdtbm0wcUhwbkZjQTZFNjZZZS95aHhWQldVVEpkSzV0dWZkeFB6TU5RV2FC?=
 =?utf-8?B?NnYwa0x1RFNIcmU1bWpWVGNGejkvU1dib1BWc2xTZzRlV1dlVjRmLzVJd0RR?=
 =?utf-8?B?OHViTGxnL3o3NlFQYmQzaldCdEN1YU1XTlloYXA2WDkyM0dScHNWRGFiSS9k?=
 =?utf-8?B?MkhMMTJZd3ZnSTFZYWFzS2ZITi9vRzRseU8xODMvOUtaTUQvTWVLT25HNUt5?=
 =?utf-8?B?Mi9sUnErd2R5c1RtNFlqYXU5ZDlCcDJmRzU5YlFNNkw3dWwzU3FUYXN3ZnVM?=
 =?utf-8?B?T0UxSVFCbkVWNUQ3Z2tvNzlOVTZWUjF4dVIrNkZ1dXJWL0EwRSthTWhRcytq?=
 =?utf-8?B?QkQ0aEI0Tks1TEUxcmFDWlhmblcrV0ZHWEViUnZIdC9RZWFTRTlXNVFZSEt3?=
 =?utf-8?B?TTlDMm9jZzU4S2xUbUNPZ3N3aUNMRHVjbElmMStOR1ovWmYvbEUwemZkTE05?=
 =?utf-8?B?SGdxOGpvc2U1SDdmWHNKeHYrTm1BVElpbUM5QWhyUzloNExXOThQNjRyUDcz?=
 =?utf-8?B?djhYeWFJSkl4NldlbnZlNHg4eUFEMWljdzRDYXB4MTdwaGZJRjMvaW1EK3hR?=
 =?utf-8?B?N1o3QWFiNEVrUmd5VDVlSk5DZU1LcEtFV05xZGNsUllFS0E3THByaW5DTWw2?=
 =?utf-8?B?czRTdGN5YUhlRUxPMExmNnRabkRxZFNHSEpqcjZ1OUFzRlFHSWkxQm1KV2pS?=
 =?utf-8?B?dTBxZ3RweCs4N0VxUnlpZk9uSXV5VmpEaHpiNnBzWWVTWFJDUzNqV1NvelpI?=
 =?utf-8?Q?GzrvLssg8PsM7NQs=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5402297f-04b4-4e33-0258-08df4561b69d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:50:08.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQStJxiE7TUlRsyFEQdc/buGfNyJdm+mL1C5J0CCYmFrrE1tMs3dvZ1r+h4zrIpChEWpSwFJJA74tZe3fcHkz0GTyex7sxkq2/6wdao3NeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5682

On 18.11.26 11:43, Clark Wang wrote:
> [Sie erhalten nicht h?ufig E-Mails von xiaoning.wang@nxp.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
>> Subject: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
>>
>> This adds support for the NETC Ethernet controller on the i.MX952 SoC.
>>
>> i.MX952 has two ENETC instances (IP revision 4.6), each on its own PCIe bus.
>> ENETC0 shares bus 0 with the NETC timer and the central EMDIO,
>> ENETC1 sits alone on bus 1. The NETC system clock runs at 133 MHz, compared to
>> 333 MHz on i.MX95.
>>
>> The patches are ported from NXP's lf-6.18.y vendor kernel. The device tree
>> changes for imx952.dtsi and the i.MX952 EVK will be sent separately to the i.MX
>> tree.
>>
>> Tested on the i.MX952 EVK with ENETC0 (RGMII): the link works, hardware
>> timestamping is available and the PHC runs at the correct rate. ENETC1 is
>> untested as it needs an add-on board.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>> Clark Wang (2):
>>       net: enetc: netc_blk_ctrl: add i.MX952 support
>>       ptp: netc: use 133 MHz system clock on i.MX952
>>
>> Frieder Schrempf (1):
>>       dt-bindings: net: nxp,netc-blk-ctrl: add i.MX952 compatible
>>
>> Wei Fang (1):
>>       net: enetc: add i.MX952 ENETC support
>>
>>  .../devicetree/bindings/net/nxp,netc-blk-ctrl.yaml |  1 +
>>  drivers/net/ethernet/freescale/enetc/enetc.c       | 23 +++++++
>>  .../net/ethernet/freescale/enetc/enetc_ethtool.c   |  1 +
>>  drivers/net/ethernet/freescale/enetc/enetc_hw.h    |  2 +
>>  .../net/ethernet/freescale/enetc/netc_blk_ctrl.c   | 73
>> ++++++++++++++++++++++
>>  drivers/ptp/ptp_netc.c                             |  7 ++-
>>  6 files changed, 106 insertions(+), 1 deletion(-)
>> ---
>> base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
>> change-id: 20261118-imx952-enetc-bd2bc331e1b5
>>
>> Best regards,
>> --
>> Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Hi Frieder,
> 
> I have sent the V1 patchset for imx952, will sent V2 this week.
> https://lore.kernel.org/all/20261104092217.1730351-1-xiaoning.wang@oss.nxp.com/

Thanks! I totally missed your series when I was searching for it.

Please ignore this series and sorry for the additional noise.

