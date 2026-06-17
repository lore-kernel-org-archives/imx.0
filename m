Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020099.outbound.protection.outlook.com [52.101.84.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBF3EB810
	for <imx@lists.linux.dev>; Wed, 17 Jun 2026 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696201; cv=fail; b=RmzjckouslHHp+TTk5aTl0RkeyTXHRM+r/wQeg63LakI3h3WBe84Bdb8o94C2HXeuisA4mnnGLPPUt34JJ8GIZwZ9y+UVwDlz4CQWBwiZUyAd8xF+h6p6vhaOurSKRZmCARn/NrCRc53gLf8oSD1xDKB8bLypHQzrymegwOUD7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696201; c=relaxed/simple;
	bh=RNU+7yhvNbAWgw5/1IufsOA0RB/yPmV8xoWErmcrSfk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ug0pqh0Edo5aHsUG2IFDlyy3lRyEwIqtA0oI+3BpGKm8Y05XBN7eZr5vop/VQPuy5dxNtDiHUHIxYN3hP1TFKyJomCLQKy0oWmVpUZqKKZdYp8QZ0GSY7CdSxT/iZxnpwq2Zcl+oRbfUiQIuFl9iYEx4E0o/Y69dJhGIFG0zGlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=EOn7zPf4; arc=fail smtp.client-ip=52.101.84.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="EOn7zPf4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQGr3QLbU0E2kPHzzb5L4SDrqbpihDbQnAEBR8eFQKHtVmdBWiWT/7F31xk+TOlcP0S3aRGxEHBDxlV3/KQglN90WLQLeZqQAKViO2FzczenBOEvFBdgDHd37odKhWEvnFNhwKpUoJjUrZPdgjhzW0J8B2D4o/NX3wcV1aBIR7jvcx1iuK+wzAJNc7m+ZhEUAPt90GPsm8Lpve+mZGEuwhG5U9FcJjYJoxoD83Xh+tJ8DbvCEB41jrRM4uWReBbFRjOT95ViAKtTp/Z7qiYK3ipAqcgJwgrzJporJ6unhMvpc6TwcobC19C9YbInF0qcJuhVfW7E3HR5keLfkqv5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGiAW1AK7Hfc62TVSH27JkLQxeVPiq04b88L8T8a15w=;
 b=YxmVUhfUjo9KGNcTqp3RTdBqLUQtM6RQrvdfIB37nnmBqVXmFxEaOsrtNFMHoR8qK/lfijBGdzzIrrSKE50k8SvBeHeC2dUNfgThNSX7W8wc9Ky+PvEyEdVI61yHJnwjeQeGnj99fxVEguFICpWEfjeIVlOf7kHSmmaNebsZbAaInr+csV+f5S7sk07ob/DZS3ZFjP855VtEn3znV5fCdSmMdo/3knpqc66qko+Cn4f9BnU1fk19QWnrkCeh2sUAQzIxyZEWp5n7KOEYssBrUjsQjHbL7bjJo97WNuxCyRJeFA+O+98bAHoTIH+7LRuqYeaxWrEKZJ4LH1Q4GYmtxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGiAW1AK7Hfc62TVSH27JkLQxeVPiq04b88L8T8a15w=;
 b=EOn7zPf4XOYnj18kCZz51b/ZQlHoqYB8HVX9597T/JTXKUDsPO1KM8mFU8aC0j6SsGjd543xPPJpJ27jsmaT0ZVF5gnMi3yIeNvwblgqWrzBqBzhpx9HRx1yjqGyd65bRcweGZRosnp+CDHQYodx3052CtbG9InfQHVAUEi2xFCz4woJEEK9E3TcLX1eK3wDCTCsi5/qZjZYrsI3rJJkOzLTD24FwNHI6QLvYlGmfrbufwEzg9FjRJlUVqjJbaNQ/6d5nA9NF0hq9RqTGKQdy/Lyr69L+Tpple951HhjaJ8E0qXPGFdqPmyCasyFKIftI5x84TSWlAZmqnjLVdy0ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DBAPR10MB4106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 11:36:32 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 11:36:32 +0000
Message-ID: <085262ba-32e5-4011-8df3-5a677575b2db@kontron.de>
Date: Wed, 17 Jun 2026 13:36:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
To: Krzysztof Kozlowski <krzk@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
 <20260617-prodigious-private-inchworm-beae1e@quoll>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260617-prodigious-private-inchworm-beae1e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::10) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DBAPR10MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: dce69ab9-cfbb-46aa-736f-08decc64ae30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|11063799006|56012099006|22082099003|18002099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	2TCiXdZlghebiyiUKpuqFqU/GFrXAuxiBlF3DBgdeH2VeTjQVzQBi3GziyKtYBZB2eIMaDS6JX26aBzp3nFzQi22e0+8jyeFySrsUm2YJW51f5925x/ZUebzOPvtl/DAOTS3yCTEMiN5JymsZ/iGz6B7rVxgFpyORAqwoPtT1Gy6KlKI/S7CqPZAnk/GI3VzheksjpQDg88l8GEo9FrZhVhfZXwbPspzGLngVMc/A7ffLXKX8WQEY+VWcYibAXGbPoMnehMZf5KdVjXCGEjLtpiVmu57N/cQ+yDISIyEQ/YucxRmXzDOwfS+3FDoxe14ET13paYaxnUdNZFDOTrSYte1h7z7bcYsDhDagnRy65cMWJhU0iIkTX7imSyzfCcyS1w2LqSKoRQVKt50fbxE9qx25HBQeQzSFVPEB8mTfzxDa2AjADPjI/EiK5PGdNhtUHYlEtIfv/g7Q4jie6Zl+C4JF+KvFJPqqFJKXKKdBi3SUqqHwzSRFxlUdhrrTSDpv7z3HeSZV5NWYw+ECG+RBlw+KPpsTXbGs7SwG652zjx3necGDtK2l3LF6cESiYIj04GzCueBqk1SVHQaIanJq+ixL8G+tEHfVNCsiMgi+KdqduokJE30Ndtx3Wn1wAJxLuDd5utbgxM2Jz6irDvL76/39YUpJSxN2cdUOdMTAw/76sFnabG5m4PNQ4Ldg/Rc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkcxRlpKSE5uM25seGplOHZYelc3Um9UZFV2ZERqSDVpWDllTkYzTVh1WTFl?=
 =?utf-8?B?M0JoRHp2MnJYUWdTeGpRQmd5aXlJRlR1a25rQzF1L2VjVmZZdjdrTXBBVERB?=
 =?utf-8?B?UnVrYWNCMkdQTjJVb2dEWFhyeWZBbXIxclF0MFppbXpzeCtKTmhPZTQ5cUts?=
 =?utf-8?B?aFNqR1FaM1B1VWlPT0FNZ215OWlveFU5WU1NbFRlZDcwT2hpY09KM3NFQ2pW?=
 =?utf-8?B?alZsam9GbFdzU0lkMDczK0YxT3lqTmpleFdyck13YXNFNTd3NHhYWFoybURq?=
 =?utf-8?B?YmZOWlVMRTJWbU43UFJzYjRMR0xXZVFtYnkxVWhQYld2V3YrdEduaytFZ0tE?=
 =?utf-8?B?bWF2S3hLVUpLTEVIbHVvcGFQd3BpODI5WHNyeVlXUHgwVVVSWjlBWHhuRWxl?=
 =?utf-8?B?Q1hzTmdnTmU3OU4wTFJsQ0VHeFMxQ1JRSjg2NzBnbFNwRkFHOXlGTUdCcGF5?=
 =?utf-8?B?Q0M0M0FlZS9iaWhKUXNhVVJHS2xMNjZGNmtoK1BIZWRaZzZCaE1JcU5aS2dC?=
 =?utf-8?B?K3BFbVZVTFBVWE8xMVBRSEl2ZzVlNDRZL0d6dENYZS91Wjh0a3hQNW1HWUZ4?=
 =?utf-8?B?WW5aOVZPbSsxdVQzeDZ6U1lKVmY2aXQwUzB3YWF4Sm5maGg4TFhmVWlGVzJI?=
 =?utf-8?B?ck9jMmlvaVBtUGJXRm1GeHFBQjdWdmRVaVFrOC96NWwvenUwQUpyNVlZTmt0?=
 =?utf-8?B?bVZxL1VtVUdIR1l6VmhIZG94WXJERk9CQTNYa2dSY0duMDRvbGRmZXVBUWZy?=
 =?utf-8?B?MFVPeWJlN1MyRzhHTkVvUlB6R09aU3J5ejFwWFdNUEcwL3dmOWhWN2IzeDQv?=
 =?utf-8?B?eFU5MkxJSkxhL21UblJJa0xTZmFBUXVRSkdFblpudkYxbzFlMVd2bkRHOGlx?=
 =?utf-8?B?NUM4bldFUHZZSUhFYVJSc0xmazd3ZThCdkJZdlB4bzdJZHRLMFZicy9sNk5Z?=
 =?utf-8?B?ZmhGSjBUY2w5NjVQNVZuTkpKS09zRGdhRFV3VzltWFZzYjZPQUMyVnRoU3FW?=
 =?utf-8?B?enBOenVOUlMwYlhDaEZ6NStFZk96WjYwS2dBVkhMTHBzUTllVnNJS1A4QWVN?=
 =?utf-8?B?SVpFNUVTUGZJZi8xWHlpNjlCYWhHRGNXU21tY3Z3aHN6a3ZNZlF1ZSszc3JV?=
 =?utf-8?B?KytBMnN6aURGRmI5bTNQZ0dyMkdjR0pVTEZmMmlZYTcydGpDNlNvekN0ZUZR?=
 =?utf-8?B?NkR2U1ZXeE9PTGFkRUdCZDBlVU1FN1FqY2RoQmNJdVZHdG42SHExaHYyeHor?=
 =?utf-8?B?Y0RXRkN3VllDTWFicFRienlPVGJwUGFQbkoydGJCTG5jMkIvM0p6UDRmVVVG?=
 =?utf-8?B?ZlBnYW5PeVN2enk2eEpTQ3JOTVRibHoxYWJMWW5GWGhJYWxHQkE4YzB2WlpU?=
 =?utf-8?B?S0dWNkNaTkY1bk5kM3BjeDQ1S212bDh2ZENKdXV5ZDM0QTVXeGF0aDBtZTc0?=
 =?utf-8?B?aTN2aUt5ZmxTNHN2OHkzV3BtK2pINUVPRG5IWmZMcUlBUVdITVJ4V1JDL1F1?=
 =?utf-8?B?YU9TV3ZOWWdkWFdvcml2K1VZQktvTzhBVnFjUFIwcGp2aHIwc2FTUkhnTEhv?=
 =?utf-8?B?QXg5ZGRRVjJBYmxweVZYUWpIODhPZ0JqNk1QR1hhOVowemM2dFVsRmJjZG83?=
 =?utf-8?B?WDlWUTAwWHBXaW4rTGhMQURtSHpoVFViWjNENlJlWlptdlFCUTRxUXkvWnN4?=
 =?utf-8?B?bzVZRWdkMlpJLzMvQmlJQTlMMjBHY1BtdWs2MGRxUDBnMTdTcHNackJlL3o0?=
 =?utf-8?B?WG5MZGJFUWJsMUo0alk3eFdJMzJ6NjBaeTYrVDY2ZWFsTFJyaVZHdGhkSW9R?=
 =?utf-8?B?ekk1ZTRXSFRJTlZjalZ5VzFMMEJjMWNXbFpUZTNrZnBjUUZ6SnhWb0duWFh3?=
 =?utf-8?B?OTZpdlFuWFY4V1ZjckNiMGV1d1orM0IxTlVaaW00ZjByTllPN284REczNXJD?=
 =?utf-8?B?MnpRNno0ckVNbmVzY1MvdzdWaHE1K1NpMTV5dEtyM1NuNlhyZGFxc0ZiSXhX?=
 =?utf-8?B?RkIrTFg4N3lXZzZVZFA5WFpNMjVPMG9nS3UxakwzVWRRa21pb2ZCbjRQa2tW?=
 =?utf-8?B?aVZ3RnVWcjBWRUMxeDAxSm84eXVnRDd3VzhlRjdWZldEaHAxY0ZkZjRNQmtO?=
 =?utf-8?B?MUJUdjA1ZmV6SWJ1a09wU3FsQU53ZEdJOENienNlZG9wOTFBOXpiY2EwRTFw?=
 =?utf-8?B?d1hGOHZ5MHB1SzF3L0dNNHZ6cHBsOTZrSXdzbVljcWJRTTBHaWNLNkQvV1NB?=
 =?utf-8?B?QXpzMlg3bE4rUHY4REl4b0lENGlkeS84eTc3OW1HWUpZc1ZqZFpSdWxxa3dO?=
 =?utf-8?B?YlZBcFcwWlFqd3VadlV5eDlWNjJweUk0c0NNNlQ4ZSs4c3Q1d0k2M3ZHU0NF?=
 =?utf-8?Q?mkyTnHPvVXYfWJJU=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dce69ab9-cfbb-46aa-736f-08decc64ae30
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 11:36:32.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYouQNKPfa4z58kRCDfxDSTIJ4QF7iWgozl4YzsMNKS5b490P6W7TsZMsjNoWkNAB5wNV26VeTQJwtDl9eQy5ZMEpar/bIQ0tEVUPchva+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4106

On 17.06.26 12:49, Krzysztof Kozlowski wrote:
> On Tue, Jun 16, 2026 at 01:52:16PM +0200, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> Some SoCs like the i.MX9 family allow full access to the fuses only
>> through the secure enclave firmware API. Add a property to reference
>> the secure enclave node and let the driver use the API.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>> index a8076d0e2737..14a6429f4a4c 100644
>> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>> @@ -53,6 +53,10 @@ properties:
>>    reg:
>>      maxItems: 1
>>  
>> +  secure-enclave:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: A phandle to the secure enclave node
> 
> Two things here:
> 1. Here you describe what for is that phandle, how it is used by the
> hardware. Currently the description repeats the property name and type,
> so not much useful.

Ok, agree.

> 
> 2. If you access OTP via firmware, then this is completely different
> interface than MMIO, thus:
> A. reg is not appropriate
> B. Device is very different thus it has different compatible and I even
> claim should be in different binding. Devices having completely
> different SW interface should not be in the same binding, at least
> usually.
> 
> If any of above is not accurate, then your commit msg should answer why
> and give some background.

Thanks for the feedback!

The driver currently uses the limited MMIO (FSB) interface to access the
OTPs. The intention is to support the firmware interface alongside the
MMIO interface so the driver can pick the interface that is available
(firmware might not be loaded) and fallback to MMIO.

Following your argument would mean a driver deciding by itself which
interface to use at runtime is not something we want to have in general,
right?

In turn this would mean we need two drivers, or at least two
compatibles/bindings for something that is effectively the same hardware.

Actually, my first RFC approach [1] was to create a separate driver. But
in the end it seemed very weird to have two drivers and two DT nodes for
the same hardware block. Also I have no idea what happens if both
interfaces are used at the same time.

The other idea from back then was to replace the MMIO (FSB) interface
with ELE, but this would mean that we rely on the proprietary ELE
firmware to be available for simple things like reading a MAC address,
which is not desirable either, I guess.

In which direction should I move on with this?

[1]
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250416142715.1042363-1-frieder@fris.de/
