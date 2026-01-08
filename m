Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF5350D77
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859137; cv=fail; b=NE0LLi6R7YLoqiN6CT7p+nelZfxBTXptTP667ixnG6B86L+i645yzVmHlF9hF/Sw/6dj7nyKsAyfklM0QBFOYLZ7y/dThlduQU4uGWjB8hTr8LnhGcLPsu/gSsNfydPk8e2sCVuXrmc9YE/Il4a8RZTm91ZPfyK6RbgNH/IukJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859137; c=relaxed/simple;
	bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pF/XTets0k6qzt8j7NUQwXYjVZylTzwKxFGbh0o3Q9ZeFvJ5GcqAlwQPrQSNw06ftvcVTn8Zuxhme8iBYZditkDIw8YUbJpWn5B9Y1qK9n3aNihZnS3dpD/gXezYNK53/v9TDmynAoXgHOPXmF298N+5a3EO934gemNoJRYpjCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=YPa+fs7x; arc=fail smtp.client-ip=40.107.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="YPa+fs7x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoM+9Qys3jMg9CE07PU1oyzaLVol8RJcJGGpAIUrqTCQ5jL9bZiMkpKLWu7oqUhbh7B0x5d/RdPyydmuV3+hpPhykpSXCAmTYoZHnQR18/6/i632oczKfobrJ1ke+gmaN8Hk6qftEZVYLOecMs9SIxshwgNfkLEZXKpJZ19xoVYW87X4sQqbdRkkR5q/TJWCC8EBsSufFeruEekGhzlM1vrjKUbsWA1CEsGSt3cV853x/5kOpKzL+vQRo2FcplmSHLmcR7uwlIgYryVqcuUIYaaQAuU90sZ6t2Fn6wuDZ9uIIT2Q58olJM+ma2+j+4Tl/95TmAKPIkl8KjNfu4ER3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
 b=fqsSw8SiLzr9Zg3X+SBfgOvo9b05czLg5GpSNVWeA5h0ZUV4WoZZyQQSGtbGjgq9TGEiaP9K9vGPtOOQRQVWr85bPBN9i+eSySQVWT5UsCnjXMWQHqBnhEgX1M5AOgrdmDK/XB1CdlBic81ntsl+McjMuvdFbEQr+cCStEGF7CqN5JcwzQUiTukyFK3YiIUk1PWLkiVeKGIjcUrxA3/TZLf/qZrZUWROm4rYnwz18AXuZv7bZm9r4sgl0VMB3nVjCxQj4jxT4lZ1FriB0NloSZ/jOtPk73/aLb1Chrs9kIAN/UZI7gJytt+I+mbGwBf20XIZIG0zcnynS2iK6SQ15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
 b=YPa+fs7xA704B2t+bInj3xVr1PzkM0jlSXZfuYgEH5c7hVhA2zfAdDqGQ5ckSkf4o1Hy7lbw2SuQzJbAhDHqVyPRR4aMtuPyNczOn546IP0hsLaOg4Dis29EUQAFuM/Sl64nogaJ6G38gfW3a8auchcXIb44y6SPWy5xyvr33p8BzcGA3kT6wFUPi2OqrJI5tIwJBC8jLffbudNfo6JvcGC/G5lDbwuKH88689TVg4BTUOog8TqoQRj5ygw6/yfm3QyzIQg252zbP/WtBeS0qD6h9ISrv3FiuejYM71SFq9d4+TlR4l3nanPODMLoRB3b9OUNv4SBKavX3u2rg+vyQ==
Received: from BN1PR10CA0004.namprd10.prod.outlook.com (2603:10b6:408:e0::9)
 by PH7PR22MB5086.namprd22.prod.outlook.com (2603:10b6:510:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 07:58:40 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com (2603:10b6:408:e0::4)
 by BN1PR10CA0004.outlook.office365.com (2603:10b6:408:e0::9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3
 via Frontend Transport; Thu, 8 Jan 2026 07:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 07:58:40 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D10DF1A2CC;
	Thu,  8 Jan 2026 09:58:36 +0200 (EET)
Message-ID: <493b1bac-2eae-4c78-9c07-801eaf954b04@gehealthcare.com>
Date: Thu, 8 Jan 2026 09:58:19 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
 <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
 <04d8766f-0f79-409b-9290-3170e99e9750@kernel.org>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <04d8766f-0f79-409b-9290-3170e99e9750@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|PH7PR22MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0512bc-daaf-4f32-d76b-08de4e8bbc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1V2aDIxdXhXdEU0cWsxd2l3RTdyY3dxaWV4cyszUm5CWkhIN3E1ZmI3SGRt?=
 =?utf-8?B?UWQvWWxrRUM2SW1hWnV1c20zaEpHZi9wUzlmdSt6dkVYV09yU2RhbjBWbGdG?=
 =?utf-8?B?Ti9BeHl2c2hoZzRJTmNYMmliVlUzeUtjaVJPYmptS1FoaUhzZ2NMZXdTMXhZ?=
 =?utf-8?B?WXVvYjcrclZ1MmFoSjFYU1hwZVU1NkJIWjZTZVlIeU9oVE83dk5FWWxabEkr?=
 =?utf-8?B?S3JITjNzTk5JTVhCMS9PdHJZa1pWUkxVTU5OREgyL3FiWXUwOVB4THcwOUxD?=
 =?utf-8?B?b0hYSmdjNUdBRW5PdzlYOXF4cytKV2NhSCswUnhpTituaXVrd3JObng3ZnYr?=
 =?utf-8?B?MmZtb2dTVFRraFhzR1AwS2V4bUx3MVh2VFJYSlgxNks1M3ZsanhDU0pQMkVI?=
 =?utf-8?B?ekgxWlJOQ3dxb2xYYlhFRlFzMkJTUCtrVURRbnByR0xCUG9zeHl4aDNWREhN?=
 =?utf-8?B?b05qSHdXbFRIWlVxQ0RPVkk4TUF5S3JTdkdOcm1aRk02UVpzejdMSlV0RzBF?=
 =?utf-8?B?Uk9ydHNxTlo3SENYT2NIaU8yS2ZYMTBzRHhEdzdNN1ZNMzloV2ZWei95YXI0?=
 =?utf-8?B?Qm94UG05NWNTTXJmZzEwWk5BYzNFUzhQY21CaU91cGN6eTBPZU1uSVFQTVFS?=
 =?utf-8?B?Q05rVVZIM1Z6NVJMSEFZc2hLa2dvVFkvY2xtSmZlejloZzdzaXh1aURNR040?=
 =?utf-8?B?a0ZxZTZTZkpia3VSQm1ua0pVMzVhcU84eEkwRmpyTnhzaXpoQ1dVNnQrUGdr?=
 =?utf-8?B?V2ZycUFiMTFwTWlhaEF2bGpVb29SNms4YnRsTXJWRGVMbWpscStnWWt4YXA2?=
 =?utf-8?B?MW9PbzNUU2ptbWttQlo1VVpoemoycjJHM0o1RlBqb0trd0lhUEg4UXJFNzdG?=
 =?utf-8?B?Wkk0WXlycGF2cFJlS3d6ZHdiVW9pTE1qSC9OL0dQbzBuWEM4dXROdUwvczJ5?=
 =?utf-8?B?SjZPRzZPVGFJamM2cTF3TDBMOXp5eWF2MWdoSTVnbEJEdEVwY05MdnZmbnJU?=
 =?utf-8?B?dkhFWkdWQjNQV2o5ZUxxSnBHeUNNTWg1WHpGeGx0QUpQUHdGb0VwWGU5aW1u?=
 =?utf-8?B?aW9FYkFvZXF2Ri9UVHBhMksrYmRZcTE0TkoyLzBBNHBZUTlOYko4OTZLdXMw?=
 =?utf-8?B?aTNNYlJLbVUrRWZvREZBa01pSDI2clVkbldRK2YzdXNROUtlUXJCTlBXQXVJ?=
 =?utf-8?B?T01mN2FQek9tWHZsR3BMMm5odllYc01EeXVRYXdRdkg4NTA2S09LZldJSlli?=
 =?utf-8?B?Y0F6SERjeGFKSGE4UzNxNDNYRUZtV1FGK3NwOHAwZWJkOERLRVd4b2xzK1h6?=
 =?utf-8?B?N21YN3p5RTU0YWN5OHBhVk1lRCtHV0V0Vm9EVy92NXRLZy9hSlRHeXZpczla?=
 =?utf-8?B?WllBeDBVS3JkbVVjZDJWbjU0a1dQSmk5YmRpL3JpVjJNMVNOVCs4ZzVRVVlL?=
 =?utf-8?B?UWNDM1EzYWlUZms4V0VjRzg1Qk5BWXJFRWpJVXE5YXJKbXRxa09KWW4rcVh2?=
 =?utf-8?B?Wi9WRlVxSEdVd05uVGhJV1prOWNGcUFxdWJuUzlJZS8rYlA3d2psMmZiMDVH?=
 =?utf-8?B?U2lhNE9xQ0gveGdVY3RuelNCM3ZMU2lFelArZUh4VzNaU2dJZThGZHZEdmJD?=
 =?utf-8?B?VWI5eGJUbllPeDlpVStzeDhSWS9ON1NoUGhtYWwzV0Q5RWdaSmhrTnh1MDFl?=
 =?utf-8?B?UHRFOUgzOTM5enNhcTBoaHYrcjNJR080VkNaczRMdTRQK1RjRjRwb0tvNGwx?=
 =?utf-8?B?aE92eExrTFoxb2NXb3F2NnRsMDIrVEtWRlJLczBFcjdjcldnbkZFd2xudzNU?=
 =?utf-8?B?MFE4ZTF3VFhwQWxUMW9Yays3N3oveERXMEJ1WWpHU2Zqa01KZWpIZGRKUXY2?=
 =?utf-8?B?T3A3Zy80d0diLy9NUkNwanB6SkQ1cTd4S0MzYVR0ZmUxSmdVNTBnUXY1VDhZ?=
 =?utf-8?B?amVzVTI2ZENMWWZMV08zaFN3ZWd2UXpuRW5HOUtXdTl1M3V5QUs3eERsVUdW?=
 =?utf-8?B?N1g3YVg3Z1QrcDN4cGptUzk1SVlJcHJWTXllSlNIeE1BNGVZQkdnOEF6MkpY?=
 =?utf-8?B?VG9BTXFIZFFTK2p2bXZKLzRoNlF2dmRKckxqaXNWeWE3REVsYmZXemxwL21F?=
 =?utf-8?Q?Tyus=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 07:58:40.0187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0512bc-daaf-4f32-d76b-08de4e8bbc78
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB5086


On 1/7/26 12:48, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On 07/01/2026 10:12, Nandor Han wrote:
>> On 12/30/25 14:34, Krzysztof Kozlowski wrote:
>>> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>>>
>>> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>>>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>>>> running in low power modes (STOP and DOZE). By default, the watchdog is
>>>> suspended in these modes. This property provides the option to keep the
>>>> watchdog active during low power states when needed.
>>> And why exactly would that be a DT property? If system is sleeping
>>> (assuming this is what you meant by low power), no one will pet the dog,
>>> thus watchdog makes no sense.
>> Thanks for the feedback Krzysztof and Guenter.
>>
>> In our case, low-power mode is disabled. However, we have identified that under certain conditions,
> If your system has low power mode disabled, then you do not need this
> property - you already know that watchdog must continue (or whatever you
> want to achieve here).
>
>> specifically during simulated high-load scenarios, the device becomes unresponsive because it enters
>> one of these power states.
> Device as watchdog? I really do not understand your explanations, but
> for sure system load is not relevant to DT property.
>
>>> Otherwise I fail to see how this is a hardware property and we do not
>>> accept SW properties (see writing bindings, numerous presentations).
>> Our system is based on the i.MX7D CPU and the watchdog peripheral supports the configuration:
>>
>> (From i.MX 7Dual Applications Processor Reference Manual, Rev. 1, 01/2018, page: 1174)
>> ---
>> WDZST
>> Watchdog Low Power. Determines the operation of the WDOG during low-power modes. This bit is write
>> once-only.
>> ---
>> Given that our system does not support low-power modes, we intend to enable the watchdog across all power
>> states to ensure the device can recover properly under these conditions.
> That's not what your property said. Your property said watchdog should
> continue in low power modes. So when system enters low power mode, how
> the watchdog petting would work?
>
> Now you claim you want to enable it in low power mode but you do not
> have low power mode? Does not make sense to me at all.
>
> Best regards,
> Krzysztof
>
Sorry if anything is unclear. I would try to explain the change from the driver's point of view.

According to i.MX7D Reference Manual, the watchdog controller allows, via the WDOGx_WCR register, control over whether the watchdog continues or suspends in:

a)WAIT power state (bit 7: WDW)
b)STOP and DOSE power state(bit 0: WDZST).

The current driver implementation provides a Device Tree binding `fsl,suspend-in-wait` for configuring case (a) and forces the watchdog to be suspended in case (b).

My patch adds the ability to configure case (b) as well.

Regards,
Nandor



