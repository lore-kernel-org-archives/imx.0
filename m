Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020105.outbound.protection.outlook.com [52.101.69.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744637E5CA
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791083; cv=fail; b=LPaYMFUha3mAiREZKGILDxPxqmwXYzBDQx7HJHGOZGHCBf1NDw7sBdkmzJ+3eddwuxKj6J0FX8GSwN/cSSUzMnz27k8/ZYkA/Nl4Y8nZsUAtmMJpn02fgnAQnp8jsyljZ9sa7FYtsKXhkV+CAz15qLe8S4ZBqOlTorVvpWFOxPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791083; c=relaxed/simple;
	bh=rlc3Q4cwqz/PIZr1R5cO5MO/CJUVIQOLTdmUh7lMe0k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vv5fgvx0UlHfy5bUEO2shsHXbMg8GFN06CaBnOrO+ylPxnhpib8WqfUdrnQ1cwlDqYH/3qvdsvtpIXmfmVU2yKK4CLgaRrDHffSlMaOUESCTEODOhjBWaLki4iLr0yTbLAw6YDov10mzIhk61nSBCiLpl5jgo0/9gqp5LnGZaRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=bMRC3qaG; arc=fail smtp.client-ip=52.101.69.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="bMRC3qaG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIvsgHVQTbEaKxkeenYqoaE4H3Q5dJOLU2zPOlkOzViBqSnjcEYYcHpsOE+PWbfwl9tqjWyT+sB5pr01e5tAhPoqUrBdS6V5m3HnLnVUV8MAyvRHBWg9eQuozWey3imjttjR089Tgml6y6e81CWl4U245vSJ/8T6hrPrtAbKPN5vOKh2nRdec0y+U22FJp5CQ7xtelZb3hVJyOyVf4lkKuRc//Kp6dMcY4DQ5X7kGzT3nFVopI9Bi6pAGFFPWmx8VZxRgJTPVaPaoxglSSHz9EaQsw4RsIhx6auqcU4MBJQZQBv8wIAO4dxFk1lPyMkXFpy3mf5WAP+32DGePIe7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZSuQEICRR9wKufPellKc0CiZOiKHeOaVjk/uoyZIMo=;
 b=RC86Ni18Zu8VTB/KtVOTzK1cjPB7W5TvxrUnZPJlBGkxrOAfkZnVWv2o5KArUa4+6NBG/sIRRsNk/Y3iaI8cAxdKjRL5ggMcD6eEPqDryHcUkZ1mbWE7mgwVyXRQDqfYtCv6VMMDWCi491CqKAZ3vm7puGsYD0NmeSN2fBOCJDbIdw5r8FL+4s8XEG/w02AIATnqBVCHCrKphWqBcwQE+NoQSOGcB3+n0hPeRw6u0MzF3EP/Sd1UAj1b2TJuxv82nDZm7E+nHTS1Cqbz/1CmBS80voDqT2yo8KxkvcuvTM6dP109N+U0yWS0u7ax9wAJ9/gfy2GsyWkRPbT8p7NVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZSuQEICRR9wKufPellKc0CiZOiKHeOaVjk/uoyZIMo=;
 b=bMRC3qaGbi452bYeb8btwqCVmmpQ2LuHuCK3JK+nFJXSFFGn8LbcTAVxuJpwUMZNFrpsaUOAparxXWW5j2owXkGhUaokdTRsS/HxruOumkG64qzH1SQzBU/PL0OOe8xpBXjEx1wVy3TD3ObKyCb3MvQBFy/GnlzusCTos5p+GHErY205aUWXwStHRRs3In00i+OxIFiNfcRyt9MyGKIUV9mMmjX1nhC36syatAxZqpe7FhA7U5wFo+c4ZSTTgmtkKit2t4HUyrPLulI/9Y2s2uE79qAMQIwyzdizCg0yyNDyM3BmyFYn5bvyDkdYWnl2oOZ4TsygoCZgqZdU2mPhuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DU0PR10MB7359.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:445::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 07:17:43 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:17:43 +0000
Message-ID: <8e12e816-b5b1-482d-80ff-0688e2041132@kontron.de>
Date: Thu, 23 Jul 2026 09:17:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, Frieder Schrempf <frieder@fris.de>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <3056369.e9J7NaK4W3@steina-w>
 <9ceb5fb9-edd0-408f-8f7f-74d5145ae81f@kontron.de>
 <6611405.mvXUDI8C0e@steina-w>
 <88bb9b8b-a04a-4a15-b738-0ef39c368bd8@kontron.de>
 <20260722161222.GA4216@francesco-nb>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260722161222.GA4216@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DU0PR10MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f967a51-6dcc-4850-4eaf-08dee88a7cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uxwAW5DMeyf9uxnU7IiJGcWicpKCB/wyjPD3IbV/Lmj+TkFZ8HX+/zjBnW7qw20TmgUV1AN+aopj/38l4UqwJR0k4q3DPFvCsWxy6cZZEw63vyjeEkkctmB7iRDUjxkIfg+lR321OsTNQ11uYc+Wu/1UqyxLLZdaFVLzui1xexKXUW3msY70JkXsCb/yuXG3PM9lSVLVApG44n8+RE5JoD9vR94tv7DbVWdFSvE9fo+rhFmJEixm1ypuxlekAFsr1wsW3xTmiIeMqOIGe3HdONnp/yjt+0wx7hZWiGt1iFVSajaGkJW9H7YGzPK3NTI/haAoRgHHAG0kqm/mx+gCs9vXgNrV2QVYoQDjoCgYwZFCKlbazsA/v+YA+0z3VfpPOlo9/pRKVkPNq7fjTcZUwqOGTrtPcHYqJHWK4apQCGgEJhqSYkSh6nzbm4s7gPIgfXslHKtvRgT4JJjN4Hk9B8v8WCY/gW24m1WzUCbCevosVmpvRjr1KAoH1vBt7XjjsNYaXxERv61jyKwHhqrg0IB2QWooTlwsyDgUWYChgB0ayLY3Nb3nchcrLiP4MypJ0Wf/D0qfAy/Wl9+n0UDjL+2/CLE5B622DFV+jlxI3cvsQ/Ja9t+zCOTL7Gg2RxDKqeXDdiPT5eZlykSCfHN+9J9NRe9xoWH2u7C4XwJSdz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW9CVk9wQnNsUGlhTmJIYlZJYnJXMjNPS1NGWFZ5L2E0KzU0UGRtU3FNbFpV?=
 =?utf-8?B?ZGk2WUpIQVBjbVdUU2ZNS29NbkUwc01QRG9TeU5yYnJ4S3E2aUxQRHJQVEdZ?=
 =?utf-8?B?Ty9kd0VmenB1Q0dDSDhwNldsZmgyQWFHak9CODdtd2tuRHVnSVN6SFJsckZS?=
 =?utf-8?B?OXpBUGJQR1VMdW9PdnJCU1kxOUxuNGVMUG4xZ3dOaTVJWlo1bER6UExNV3R0?=
 =?utf-8?B?VVVnK1orRE9OdFpkT3RnTnBqZDlwSnBSbnFHaUwrSVB1Ulh0M01zVkw5TTN1?=
 =?utf-8?B?cnR2T3RrNCtubTZnaGlzdXh3Rm1PcHlBRXB5Ty90VkZ1cXNZNW1xSXZqQ21i?=
 =?utf-8?B?M2xwN0VVcmxkMEY3QVB3L0NQcHMyNTdwTzRzN2poOEhjLzRPd3B0MUJUYWFn?=
 =?utf-8?B?cmNTMGpyaGFHcUh3SXJGRnZtM0ZqRkkwcS8wTzI5NTJXbVZ2cU1TQVpTMy8z?=
 =?utf-8?B?YUZhN2FTN0RoNEFwZWNBbTl6NE5EWWRlWGxaWXVlNEl2L3NxMzhPYmhQNDVK?=
 =?utf-8?B?TmRQQ1JIQ3gvMFMyaGZadExkY3VwMmxnQkcyUGxFWUNpajJrVWdSUE04Nkdp?=
 =?utf-8?B?MXhIRW4wVENyNUM2ekgyWkszckZXdkNnMnB6NzVLRUV1ZTJBMVRhOE8xc1pH?=
 =?utf-8?B?RVkwaTFkMk1WNnVYVlgwRCtMQ3VWYjc2bTk3WSsweXA4aHdBR0dCUEtOOXcz?=
 =?utf-8?B?MngxMzBPLzRDZC81V3Jzb2Znamd3Snpka3lDNFpSVi9UaVpQRFNWMUplZXhM?=
 =?utf-8?B?TmY4Sk5OTkRRNWRHV1hua1lHcHNHL3J2am1zT2gzUWlpSTk5endkV2phNVdM?=
 =?utf-8?B?L3hQaWlmbENVbkk0eDdQaDF4K3VHSmJEc2pTcnVQRXpnQUZvZ1MyT1U0STNa?=
 =?utf-8?B?ZTFFYXFqWWF0akpsQ29JNm1CRVN1MCtUQnJYVHcySU85d0hqbG1CUzRnazhW?=
 =?utf-8?B?dlowVGxocGR3TFVxYzhQVXdjRjR0R0t6SHFmSGh2a0FPYm8rYUxVWFFCaVNr?=
 =?utf-8?B?QkZTdHFmb0QxeFhidm8zZGR1cmI5eHo4cS96eEc4WVIxUnBlUUtnNEdLOHBZ?=
 =?utf-8?B?YWx2Sm1yTnI1K0lJMVI3TjEzOHRXbURwdnIwL1VISDNmYWZSM3dNcjV3NG9i?=
 =?utf-8?B?bU9MVTMzbU14d0JBeXJiZmlVb1pYeEhGV3VNdlYyT29CdnRRc1RnZ01QZVp2?=
 =?utf-8?B?K0xWTXdJODE5ZGJCdXROdWY5OVh1MnU2OXc4c3Nkclp2d3JWVnQ3YmFnRVYv?=
 =?utf-8?B?bmFBL3dtZUJmRU9iL2cxemZEUDVjZnp0TmlSNm5vckJtUytQMWRIWXJ1b0Jn?=
 =?utf-8?B?MkVXQ1JLdEJlOStydWsxYzFnVXpheE1CUzRidW1XY1BxcjJ0Q0hPTlpQVkpC?=
 =?utf-8?B?emlqaG8xTDlWKytha3Ywa3RuN2FjaXM1MGRNUExJZGlHVVNlVDZJWmJ2U0x6?=
 =?utf-8?B?Ry9GNE9EaEN4VUlhdTNoY2prYlVsNVd4OHREdjVTMFdwUTRtdFhwSCtxbm9z?=
 =?utf-8?B?cFczZWlvRmhHbmFOR1c3MVlKY0dyRGxBemRXK2lFa2ZvQUlEdzR5eUxvVFFn?=
 =?utf-8?B?SjVwQmNCYXBzekJ1WFh0bWJUb0ZtUjlHM0FpRFBXM2h3K1BxQ0NJMDVlWGMw?=
 =?utf-8?B?bWdjZ2RVZXZTeXFBWXFZcGtob2xNVGNIWlJXZk9qQ2FTMm55RVV1SStoa3Zn?=
 =?utf-8?B?SUllMkpJem1SR1F3RjlBOER1dkFxd2ZkNis0K1Zyb0JLL1h1SFY5TjhCRkFq?=
 =?utf-8?B?N1g0TWxZWkRET2dEZjZmOFhpZ3ZnSi9KVjQwc3dEUjI4YzNCcXk4RGZaZ1hu?=
 =?utf-8?B?L09CajAyREdRQnFwRkZsaHVjTUZWM1BkbjVWNUhNVlo0ZSs0amhBMEhhR3BI?=
 =?utf-8?B?cUNhakY0S1lNMG1ySStUbno2K056VFM1MjFnK2VTdlZKazh6SnNDVHlDeGRw?=
 =?utf-8?B?dnRneTdvS05tbzQ5RGpjZmNZUXYwVHRhZDBMaHZwaUMrbHVDSlREaXRMNXZM?=
 =?utf-8?B?M0F2VzZUZ0dXc1B1UUNveHoza2JMdjd4MXdEekozd29ub2NqemNyNDhvL0VG?=
 =?utf-8?B?ZDNyVXBrRnZPTnFFREN0MnFiTGFBZU1Ua0JRc3BMOGRsQk1HZDYwY3FhZ3h1?=
 =?utf-8?B?WksrTkN0S0tYL1o3UlRWSUhpbmZaMi9kR21seFRFVGpBdFN3akJPWmZaN00y?=
 =?utf-8?B?eXQ1NTFnekxUMXdzQUZick5JRUU0WUpjdGpNaG1ubTBJMk5hdjV1M2FvRnBE?=
 =?utf-8?B?SkwvRUJrWXpOcmN1c3gveWtmNUQxZGRIVnJ2WDQ5ejZSRWdvRjlST3lKVnpP?=
 =?utf-8?B?R1Y2WVFJT2IwMU9VaXEwWFN1USszcHQ3cUpHUTF4SjFtUllDa3lPTWhQZEVL?=
 =?utf-8?Q?AqcnHIDzCYsIQ5Ks=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f967a51-6dcc-4850-4eaf-08dee88a7cfb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:17:43.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6uIs0fhIMzdvpOk/BN103V4RNWdUi0IWn+LXA/M40fWVJybfvkHKnTbqAXsh+SVUuEut+Gp8TwY1Bb8qYTRTFsOc5QQjugc0eSqr27KXpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7359

On 22.07.26 18:12, Francesco Dolcini wrote:
> On Wed, Jul 22, 2026 at 05:27:00PM +0200, Frieder Schrempf wrote:
>> On 22.07.26 17:09, Alexander Stein wrote:
>>> Am Mittwoch, 22. Juli 2026, 16:49:10 CEST schrieb Frieder Schrempf:
>>>> On 14.07.26 14:37, Alexander Stein wrote:
>>>>> Am Dienstag, 14. Juli 2026, 14:33:50 CEST schrieb Francesco Dolcini:
>>>>>> On Tue, Jul 14, 2026 at 02:06:38PM +0200, Alexander Stein wrote:
>>>>>>> Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
>>>>>>>> On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
>>>>>>>>> On 14.07.26 10:32, Francesco Dolcini wrote:
>>>>>>>>>> On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
>>>>>>>>>>> Hi Francesco,
>>>>>>>>>>>
>>>>>>>>>>> On 14.07.26 08:59, Francesco Dolcini wrote:
>>>>>>>>>>>> Hello Frieder,
>>>>>>>>>>>>
>>>>>>>>>>>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
>>>>>>>>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Add the ELE firmware API node and pass its handle to the OCOTP
>>>>>>>>>>>>> driver. This allows us to gain read/write access to the OTP fuses.
>>>>>>>>>>>>
>>>>>>>>>>>> This seems something we should have in the soc dtsi (imx93/imx91), it
>>>>>>>>>>>> does not seems board specific.
>>>>>>>>>>>
>>>>>>>>>>> My original intention was to move as much as possible into the SoC dtsi.
>>>>>>>>>>> The problem is that the memory node is somewhat board specific due to
>>>>>>>>>>> the DDR. And I can't move the firmware node into the SoC dtsi and assign
>>>>>>>>>>> the memory node in the board dts as the checks for all boards not
>>>>>>>>>>> specifying a memory node would fail then.
>>>>>>>>>>
>>>>>>>>>> What is the reason to have this memory address different on various
>>>>>>>>>> boards? Can we have a default in the soc dtsi, and allow the board to
>>>>>>>>>> override the address if needed?
>>>>>>>>>
>>>>>>>>> There is no real point in having different addresses on different
>>>>>>>>> boards. But the node describes memory that is physically on the board
>>>>>>>>> and not on the SoC. And I think that is why DT maintainers want to have
>>>>>>>>> it in the board DT. It's the same with the memory nodes for the
>>>>>>>>> remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
>>>>>>>>> But maybe I'm wrong and if there is a possibility to move this to the
>>>>>>>>> SoC DT I will definitely take it.
>>>>>>>
>>>>>>> We are talking about reserved memory, so this is highly board-specific.
>>>>>>> So for different hardware variants with different amount of RAM you have to
>>>>>>> go for the minimum anyway.
>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Or can't you add the address in all the boards, and keep everything else
>>>>>>>>>> in the soc dtsi?
>>>>>>>>> This could be a possible way, yes. In that case maybe we could even
>>>>>>>>> create a generic dtsi to contain such defaults for all boards.
>>>>>>>>
>>>>>>>> I would go for this solution, we could have something like
>>>>>>>> `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
>>>>>>>> sane default memory address, and have an easy way to override the memory
>>>>>>>> address from the board dts, if needed.
>>>>>>>
>>>>>>> So what is a sane default? At the end of the minimal possible RAM?
>>>>>>> I'm not really fond of something you have to make sure matches to your
>>>>>>> hardware, but won't raise an error if you forgot.
>>>>>>>
>>>>>>> How about providing defaults for the SoC part and users have to provide their
>>>>>>> memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. There you
>>>>>>> have to specify memory-region in your board.
>>>>>>
>>>>>> I am personally ok with both solution.
>>>>>>
>>>>>> I think it is easy to have a sane default in this case. You cannot have
>>>>>> less than 256MiB in practice, and this is just about the offset, is not
>>>>>> that you are going to want more memory reserved if the board has more
>>>>>> memory available.
>>>>>>
>>>>>> At the same time, having the memory range in the board dts is also ok to
>>>>>> me.
>>>>>
>>>>> I'm just saying, because we had lots of problem with assumed offsets/length
>>>>> in code/DT for NXP boards. They usually come with big/huge amount of RAM.
>>>>> This breaks for all hardware using a small amount of RAM.
>>>>> So it's better to not have a default than silently breaking things because
>>>>> the default doesn't match.
>>>> I'm revisiting this now and think about how to do it. I would like to
>>>> put a default memory node in the dtsi that dynamically puts the buffer
>>>> somewhere in the first 256MB. I would include the dtsi in all
>>>> i.MX91/i.MX93 boards. I think this should work for all boards.
>>>>
>>>> If I put everything, but the memory node in the default dtsi, as
>>>> Alexander proposed, I think I will run into DT validation errors if not
>>>> all boards provide a memory node, as the property is mandatory.
>>>>
>>>> Is there anything I might be missing?
>>>
>>> Mh, isn't that exactly the situation you want to catch as a DT author?
>>> Raise errors early if something is missing in the DT.
>>> I would go that way that for all currently existing boards an corresponding
>>> memory node could be added, no? All coming boards will need to provide it..
>>>
>> Ok, but what would be the benefit compared to putting the node in the
>> common dtsi and including that for all existing boards? People adding
>> new boards would just copy the memory node from some other board anyway.
>> This way we could at least avoid the duplication.
>>
>> And as I don't know all the details for the existing boards, I can't
>> provide anything better than a default memory node.
> 
> What would be the reason for not wanting to have such memory node in the
> first 256MiB defined in this dtsi include?
> 
I don't see any at the moment and that's why I'm going to send a v3 that
proposes this solution.
