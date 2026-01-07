Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C72DC78D
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776707; cv=fail; b=tO+sQPdPRk83bldt9O1N0w98QfVwBE0WvXGj/37A2ka1Hhu8DM/sZiukDiMssSFiUD7zdKevHNw2W5sDJ/tRp2ao2hIZib9jpmd0Zwe535vhgOhaVk3pUuQWhWOKWilY2T9PTGHmvrXsi6wX2oEQTxLxwl3XNSqNMQD4peSq98E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776707; c=relaxed/simple;
	bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zj1wArPwQOFQLpEjXSzpThqaSBFjs2nn6uI/Rs3z+RlMLDnpjPFTxLHp92x5jOBMtLo/Z/WXeIWgroSla1bsglndOIxavb+WRaYhyey8qal34wlbXM4skSt9cwFyYF9OELztYOcwgCly0W/ff+1WNPvkZIh3zoNm5qLuNxHPH4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=AGsmLxQp; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="AGsmLxQp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhO7EKfoXDSEiO328fL6x3dyPMa8C5OfnYtE1oXGGZIvwCtSJMm8AnJMruC+1sx74p9XZvdk0aPXMAT3xS3iOyEQ4PU7/5zKhYEF+IQl/EWilHtbHUQV78Oi3I8Nhq9i6DWEPXBAIoljANtzShGvdvyq4v8qmtYu+LNPyqPvNQ+qUBs5WMY+XplnXds0UBnMuUlDiNecmn0/HysIdPVyphChuacnblDG2einq1dVijmRu5oqnhChknmo11hXKi32HJhZQPIO2XHAAiv/Za2vv+5V6mqhxMrJG4+OIIH30S7Aq6tbEe57bU6aRuOBmT+6yE07GruuzZQCu/Ym8IsBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
 b=YmHgP3wYQVbcMpr1sLPgPfhKp0kPL1oPBqJPcx+psRwIV7bcNopU0CceLUteOvEs/Zr3527FD71VZGq4Xd+R7pagIKBjCLVl02Xp0/79SYJSVnzIlN9auEDQ/nbuQui5QG+HGyxWq32ZSRleTTDF0u2s6Vmm31LNkr0f5C/8sieRhDeXh/pTc8tNBSK/7Mht59llloeam26vrDm3tODXuxLUrV/Td9A6yZsnJyUIgBy6o7CJrp8ccvN5ZK1WKqwzSIM4v6+k5M8D5UTVWVVnNoxWJMJihX0HI4GPWVhfWDpQ2mOuMXRsdadUgjD0jI2vmpufJUgepgcGgauHOw1KIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
 b=AGsmLxQpYVd6XyOiGhckWRqH0geYVxryYZ6fIa8AZw7TmrDWINJZNqcSG+2pvtQyP5Jkp4XQ4sQogCVsEMr9kOPu0x7OdIUooTCmVB9jFDrkEheH5fx24U1Q0usaVi179ipL4LUetYoX8XfQaDNioLdjYPynvMhB4m2tK6Nj50VdmTKbul/Zf/xsAm/G9rz4TZaDzFYrFDJkCUY2b9IvWvWp8409ZMWr9O9JrYoYufu7Y7iTpD/jr+QRoYfnwzNEeIaryiSJnBj5H6REDwFefN1p/ZdAirXDtfVaF7hWeYHXfQ67V9MEv1QhIUqBkuZUsPrbI4Pf1fJZ7T34PcjrDg==
Received: from BN1PR12CA0028.namprd12.prod.outlook.com (2603:10b6:408:e1::33)
 by LV8PR22MB5150.namprd22.prod.outlook.com (2603:10b6:408:1cf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 09:04:59 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::7a) by BN1PR12CA0028.outlook.office365.com
 (2603:10b6:408:e1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Wed, 7
 Jan 2026 09:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:04:59 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 3A05BE57C8;
	Wed,  7 Jan 2026 11:04:56 +0200 (EET)
Message-ID: <0c3ebcfe-dc45-4e52-a86e-cc776b3bcae2@gehealthcare.com>
Date: Wed, 7 Jan 2026 11:04:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
 <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|LV8PR22MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f639e52-7498-4d3d-fdc9-08de4dcbd5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTY4R0JpdG94RXVPWWhFUTVBaFhDVnppR2h3UVdZbzhqcitWbGJFSEMzeGk3?=
 =?utf-8?B?dkIyTGZqWHZ0R2ZLSExTeVdadW14TG80UlVRTGt0dkZSR0JkVTlZOGVJVGls?=
 =?utf-8?B?bTRyZHIrLzd2L0t3dnA0YTJTK1dCOXE4TWtjK2srL3FWSnZtZFVTdGx2SWsy?=
 =?utf-8?B?ZHJtSFR4dTMrVkZrL2I4U1ZnMC90UkFwQUxGQnFoZ0pQWEV5bTZ0VlZwZFlG?=
 =?utf-8?B?SXd4UTh5UHRrdkU1STNpWFlyV1hidWRNUDJTaTlSY1RYOGJHOURzenRWb3lE?=
 =?utf-8?B?aEEwOXpEN3FZNHQzajB5Yks1MFByeVRRZnJrTjB6L2VNVkNWaUFMOG1Uajhm?=
 =?utf-8?B?dWlhdEczZVhFWDFUUFVoc1dOZTdDMCtjYm5vRStZMVBjQjJCQ1pNd3BDYzhV?=
 =?utf-8?B?cUluM3M2c04zbFAwbURKNGFiaXdGdnovSVNsaDhFVk1xcDJxUkQwMUJMMkdp?=
 =?utf-8?B?MHBZQWdXYlZMZlM5bUszVjZzUXJoWUFudFFRK0kwNGgyUDBRdWR5SzRhcFNU?=
 =?utf-8?B?Z3dFNDZvb1ZkeG5CZy9NK3dsa0hOZ1JGNFVxYk92bUI2Qjd4RGFHd2RIcGdT?=
 =?utf-8?B?L1ZwdEJxb0hUcTc4SEQwMmVQSHlJK2ZmL2ZzYTJabXhIWTh2TmZJU3ZINGlh?=
 =?utf-8?B?M3F4ZURXQVZFZGp0dmJnSUkzOTBOTzFkekZBOGdQWlVWWTRLeFh5bVU4K1h3?=
 =?utf-8?B?TnpKc1lkUFZWZXNKQllFdk5tKy8zcWhBaVpuK25aSHRodnVuQXMxY2o2K3BS?=
 =?utf-8?B?dFF0MnVhdFRHRGFmZnNXWU5ZSi83ZHdxQThDcE1BSWxhRmVNNVFSWFRkREp1?=
 =?utf-8?B?ZHpMSG1NS1FUeWM0TFhjcDVKMkF4dDUwRm1ZdkkrOGRqYkFIdVdIelFaZ3Bo?=
 =?utf-8?B?Q2xKU2hlSVlIZjBaWHpYUEw2MzhxOE1jc251UU9WTzVGNHZROG5mQlRIUXpZ?=
 =?utf-8?B?S0hzY2dwZU5qZG9xTGlpZTgralNWUGVCd3FWUG9vc2ZFM3NKZXE0T09VSnY3?=
 =?utf-8?B?cFV6U3JpcCtJMDRXNXNiNHBaUXVZdUZpKzdNKzZITUI0ZTBxR3VRWFJmTnRi?=
 =?utf-8?B?a2lsQWRqUE9mWFc4K1VJYjJHLzRFcnhYN3pVMUVDT3hSSUhmODQyNzhXTzJy?=
 =?utf-8?B?WmcxZldLUWVuSDhmc3pqMzZjNmh4RW9NNnFwdllrbkdDclBtc3hxZkdCWDhN?=
 =?utf-8?B?V2tvc0NBcmZtbENMSnhENHBPQ29YRnVuOFRoNURYVVFkWXpvSnpzM21WbmFp?=
 =?utf-8?B?OW5IMXQ2VHNzdzBTYmxWLzJMamF4UTVqWG1ZRkNLYnN1dFA3M0wwMmRJWElj?=
 =?utf-8?B?OVFOaUFqQUJzREo4RnZkWFhTcGlreFFYaldEQW9HYmMvQWhmam4reDVSL3hJ?=
 =?utf-8?B?dENyMCtQVmdkNEZFa0lPd09xNVFDVnlnU3lhSTNxNkpuT1pLVVhrNU1nSGtW?=
 =?utf-8?B?YzNyWFZCRXlwYUVpTEJHZng4Z2tDemZ3YklyYmtFZi9tM1lDMGtMenB5NnNh?=
 =?utf-8?B?K0kyV2xzYmRPWDg3L29vR29zYXNyTXpSdGlKUC8zTG1xMzd5MHRQMFVNU0pH?=
 =?utf-8?B?OEJIcjhiSk5BOHBKTjJ5d1lhcENSbjA4QzRKVG1vU3BFZkJRR3Y5QjdKbUpn?=
 =?utf-8?B?RkJDaVFBMGpnWjVsNE9UdlJFQVBvaGRZcm53cE83Z2tYYmZBWnlMWU9DWHQ4?=
 =?utf-8?B?bVNOQndKZlkrYTRvSzByYURJelBwZUhaMWsxWEU4K0lXK1lkUTZoamVzZ29C?=
 =?utf-8?B?L1FvVXVsSjFMVnJmUjRzRjlBc0lSZUh5Y2Vqb3pPSStQZ2lwZHFsM0Flbml4?=
 =?utf-8?B?REJyTDFBRWFwdGIxeVlTWDFwQS9YZ1ZEM2R4TnE0VlBVcDA5eEhJTFdxTEF6?=
 =?utf-8?B?NGEvRk1sdEpsR1hYanRza1dGUkovWjNwQlViMTlacFR6RWJ5dGY1bXdCdWc5?=
 =?utf-8?B?aEZyTGtrRXBPZkVlNmFRYWFKTzlXMG5aejRVNVpDdEdRL1NKbS9BNWdOUmp6?=
 =?utf-8?B?dTd5L3hWeFpDeStJMjZGaW9rZHlLRzVJQnJ5c09Jckx4ejlkT2RITTFJUDNu?=
 =?utf-8?B?SFNuWWpRcWkzRUxITVpSNWcwV2hPa1hXUGtpTTFiY1dzVUlKSHJLeExzalgv?=
 =?utf-8?Q?yGYw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:04:59.4131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f639e52-7498-4d3d-fdc9-08de4dcbd5ea
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5150


On 12/30/25 14:35, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
>> By default, the driver suspends the watchdog in low power modes (STOP
>> and DOZE). In some situations this is not desired.
>>
>> Add the possibility to configure the continuation of the watchdog timer
>> in the above mentioned low power modes.
>>
>> Note:
>> Please be advised that the difference between the variable name and the
>> device tree option has been intentionally selected to uphold the
>> prevailing driver functionality. This ensures that the watchdog remains
>> suspended by default in low power mode, while also facilitating a clear
>> and intelligible device tree option name.
>>
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46
>
> Best regards,
> Krzysztof

Thanks Krzysztof for the suggestion, I will take a look over the doc.

Regards,
Nandor


