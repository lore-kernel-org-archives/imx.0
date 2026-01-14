Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513439900D
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396993; cv=fail; b=FApcSz0H6WEuUKmoBiAxdupD6XDRLK7NKLuD8vs4w5/3WC6Ti0RuF41EDnuZOIyH7Z5MQ64Gty9BKthQT4lin+DiXri0TXrG+rjsGQRh2YLcBx+2TiNWwFKm+m3/FyH6H+zQOj91zM7YooeFjQ8IKsvaog5FqjhjAQUOWeKIOkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396993; c=relaxed/simple;
	bh=/ptWXPNeZGd6v5J3qxkxf/pbkPfmbXzeshzgo6wM18E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrLGe+KVUn+9UqXfiUGQiStgjLuTGd8mCxIqTuKvv1MdzmpnvlBInn6aX8cVoMfQCKFanDHdUuYyc7Ulgo5YWPE4TjPXzsidAoJWHzH5aGwIAE9DhqdT5AZFpHn3BysBsfGHd6BvFmTW2nSOE5qwP1Tfv2/Xo33V5XgjrvCEvso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Vl1J4VYv; arc=fail smtp.client-ip=52.101.43.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Vl1J4VYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcs2UjwlkcikIbXayeKQehOwmiMJQwqCuZeGCHWEXUE9g0nj7+PeINUH6wIBnxW5se+wL+l+TS8mOsDmUq01EtLBKBSyMKTb0L8D2/dulJTbvsuElx/6697qjZGr2rR7BRHx8BAQdYaJEvzbDXwopefOM+MeFMb6uU45zrWWpBd4SVsKrRUl9bWbLqbXxLbuzABj2zIGL9ZG9jmK8MtK4GKQOVxOBk2uTPcQ08iCGaOYZNjsITtS8jHOL/l+Vd6b/D8obmqWu0XWPn/j33NVj8khZeVYkz/unIOpc3aR3D8j1mfv0BoUmKJ0tbBNNOsiK4tgJDzofAD0FClzz/tlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUwHdBIvTLsKsKR8Ly0Gbh+6BpiQRQUlrz49UGLMS3k=;
 b=QvlV0bcYoow6V3LUjIUnIoVqAeWHMKUoqHDWbpjyDCDVoZ49O/ksSJB8Vzu91aXuNz6nb/OXw8ccrRG6as66e5IDM7Q0E5pbDtJpKwqcLCSpL1vvV6sL85dgsO1WCMHstO/SKlvldSYIxbD+vfdNSsUmvqeCqZ/ivfXjn1HV8fCdvNGS1QDj1c3ue55GRL6ZLxZVw9AtRQpfy6Wwb6sC1jw33S0bWgnX+uyCokxK9DXfgkijFppPH7RQ8rT3EWO+CH18FC7TR45tkCSsd3iuPx2MZcngk1p9k++c1fw/KB2zEDlgaUKj5Ya0PdlPICu6iJ9q5h+hqciRLl4CY0ToOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUwHdBIvTLsKsKR8Ly0Gbh+6BpiQRQUlrz49UGLMS3k=;
 b=Vl1J4VYvmKlB4I54vqjEU35zcdaAZB1l6jRSQVUXJcMrfKyTi7ivDcfZu2WqDYaCLw8G+FxDDEaM4rnSfvDQlxSJZqxurXGaz6E6U/63VgNS1MbtW1o82EG93t5HfvyU7iUmSmMXH1Y9fvK02koy7px4Sg2DiALMuWvNSsTsiZJ5MnbXyBN9qnU9v3iKrmx4xjCecAV9toHsL047hu/2WQrtNGKNqXFdwjsfm29dM7J33CBl4c0/8bIRg1cJdHn9cJcQXNrO4mAY5QR89DzS7jJNIXji3XZG4idPfrJBddu5J+7aUf414mQ9L9hlLyo27rUWWccyApO5UN4Xr9JUDg==
Received: from SJ0PR13CA0224.namprd13.prod.outlook.com (2603:10b6:a03:2c1::19)
 by LV8PR22MB5456.namprd22.prod.outlook.com (2603:10b6:408:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 13:23:06 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::9d) by SJ0PR13CA0224.outlook.office365.com
 (2603:10b6:a03:2c1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 13:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 13:23:05 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 899EDE8F21;
	Wed, 14 Jan 2026 15:23:01 +0200 (EET)
Message-ID: <1359781c-a1cc-43ff-88e2-f381e8ab81d2@gehealthcare.com>
Date: Wed, 14 Jan 2026 15:22:56 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl-imx: document continue
 in low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
 <20260112130849.3748465-2-nandor.han@gehealthcare.com>
 <e66a3dd5-1cf0-4d45-9ed2-55f50faaa0ae@kernel.org>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <e66a3dd5-1cf0-4d45-9ed2-55f50faaa0ae@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|LV8PR22MB5456:EE_
X-MS-Office365-Filtering-Correlation-Id: dae345a6-506a-4bb5-b83e-08de53700d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDErZVI0MVZzWUZYSUhRTHVtdzZlR0lKQnd4WktsbDdEOTNmZE5ZR0lxcmFs?=
 =?utf-8?B?TjZ5a2p4Z1B0elFTOXlPSVlodjIvSE1NaTRublN6cTVZOTZ5RFZwMUs3VnFG?=
 =?utf-8?B?V096ZE80WjJYOFU1SHBRVGhYOHNWcVZuZHp1RE9RYXRZVWNOcjlUL2VRL1hD?=
 =?utf-8?B?dit3ME9QZElIenRadGpUSTdQakhjd00xU3pBMjhWUUNWd1FDSzU2eDhaYjFz?=
 =?utf-8?B?VElnNUIyU1FzSnpvanBoTFJ4TEtNdWNPYjRNaUpQeDVMNnJUS2RvUGRMWFRn?=
 =?utf-8?B?UWE1OHZGVDFTSG41QXBrdy9nNlFabGx1OUFpd0VQRTZCRzgzN000SGFIbUwz?=
 =?utf-8?B?YmlVNEwrd2VuMWNRNFUzdWlFYU51MlZaM3c0OC9rNHJBemlYbTRVbUJ2aXZm?=
 =?utf-8?B?NEc1ellhcnZmN2NxS2ZLYW1XOUNOaHhqOGlhc3FkandSZ0dmc1QwWE1aSXpa?=
 =?utf-8?B?M0lxeWJLSWtPODAwMjUzeFRuOTZIUkpVVjNpVHFzVVdzVGNPcFMyRncrMFg5?=
 =?utf-8?B?UUx2eElkUUtkK0YvdFZsNzRTazl5ZDZWdFg3ZGlXSXdhM21SUm9PK0RWSENt?=
 =?utf-8?B?V3BmV2syYXdrdG94cUFhaHF1TGtoR2hnR01QeVdMMEdTa1E1ZkJxaWNHcllB?=
 =?utf-8?B?cndqYzcrMEFwZVIvNC9QUVpKTUFKa1pQcUd3M2xRYUZKTDBqOGw1amt0YnVm?=
 =?utf-8?B?M1VpTlVLSkk3QndFa0xFaXFPZDV4WDFQN0Y0N0RPdVFQd2w5M0ljMG95SFU1?=
 =?utf-8?B?dmxqK2VHM3RsOVpwOTdDcnpYbElTZnNBK042d3lWclV1ZHgvQUFRZEJmZXpJ?=
 =?utf-8?B?Ri9UV0UwWDdPVUdwOVVQdDYzZG9FZTZ5bWVCa3ZtaG93cGxoYVFmby9jOHV0?=
 =?utf-8?B?TjBBY212TzFCdzVVUFVPR29BR1pscXMxUGt1MnpGMzBkeU5jT1ZHeHcyQi9m?=
 =?utf-8?B?M0taL0QzeHh3R1QyL0kweE1KQmc0a0V1aS94V3NIRE9OVXVCNnJFT0xlYkVw?=
 =?utf-8?B?MnhpTFVwSklUTFlOSi91L3IrcVlTckZyOXdMc0FLc1N6cDA0d2hjcW44Ry85?=
 =?utf-8?B?YktITk9nWjcyTGkrWis4VWF2aURiN0t0TFV0a1RvUWJ1M3ZkWGZST00zeDVB?=
 =?utf-8?B?S3NmVy9sVHVjTGx1akdjbjRES1NJREZDQUNVb09SbTlsYk1NT2VhdUtRR0hQ?=
 =?utf-8?B?aFJrYkgvV0hXQlZxK2tlOXEyRGpoN0Q0SVlnU1JnM0twN3hKVDVTdmJxbVhX?=
 =?utf-8?B?M1BITEdOemhobkFqOTlYYmRjWEpRRmgrWlVCSHJRSDFPYmFZTnBmOE5GVFl3?=
 =?utf-8?B?RHkwWG9GL21PMGdxUTBxSXVNMWJnZXBvMlFvUXBjblhyUDg1ckdiNXFWSW9s?=
 =?utf-8?B?cmc5V21RU2hNYUJlUnlKRnM1b0xHTW9ZUVRMVXBlZ1ZjVEJzVEsxdi90U1ph?=
 =?utf-8?B?ajdNV3JURmZqZWl2WGhQYVhUS0NRSHN6dnRXWnFON2g2eDI1M1EyM3lwK29Z?=
 =?utf-8?B?RzNqOEo3VTVoN0NkSGExL0tuNnFtb3RwWHNpWmhKYnptNjBnOGZUOHg3Mkl1?=
 =?utf-8?B?dEFQMUgreXJlaDd3S0RVZGluNXlmVjVTRllpeWtKUXJlcFJROTlPTUd3SHIx?=
 =?utf-8?B?M3k0QnlCQkJ6c1g3d2RhMjhPbGZCUGJBUVJ4clZLTjBLTUNuM1VHS1RtYmpy?=
 =?utf-8?B?Z0lYZGQ0aWR2eWR0cmdkWXdvQUc4WDhxcGQ1eUlTaXFSQkRPRm9EZFpObUZ1?=
 =?utf-8?B?VVJoWFZnL0w5b2NhaTZ1NVVWbkFIRE81bkFsNWJDbHRzVlBVL3VKU0dtZmJX?=
 =?utf-8?B?eVJJbVFZeXZhUkNrTGJCVnkxdmRNRzZuRk03eElhUkdDWnR0UW1ZYzRoWktP?=
 =?utf-8?B?dkZjUnh5K1pKWlpwR0xwVkpqM0hsSGRIVWc3VWlaK1V2dWMzWkJ0TGtMZ3dm?=
 =?utf-8?B?U3lKZSt0cjQzdzBqQTBHUTl4TDVQSmxpMlJuR0M2Z0R2OVdWcjQ2dGljd2h5?=
 =?utf-8?B?b3RJSW94ZkNvd1pHM2k0M2tXU1QyMSsrWThlV0o3aHowbnZPcitpOHJHRFFw?=
 =?utf-8?B?QXdwVmpZQ1NXa3I0MlNkaTY2WitGUHVLK29mNlFBY3ZSQ2RwUFFEZkhVdzhN?=
 =?utf-8?B?bDlvam9MQjljQ3dFeDBYN0R3MkllQVhncFg4ZXJLVEQxcHFXQmpUSG1FQjZh?=
 =?utf-8?B?RTlsVU1Pb3YyMll0blFKcG1IMFgvMTBrSnlWNjFhckJRZUppSkdTODcxZG1z?=
 =?utf-8?B?NXpWMWx0SVpHR21PWU50VVVseSt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 13:23:05.0778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae345a6-506a-4bb5-b83e-08de53700d13
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5456


On 1/12/26 15:55, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On 12/01/2026 14:08, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
>>
>> Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Apologies, will not do that on the next version.


<snip>

>> +  fsl,wdt-continue-in-low-power:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
> Do not need '|' unless you need to preserve formatting.

Thanks, will update.

>> +      If present, the watchdog device continues to run in low power modes
>> +      (STOP and DOZE).
> Not much improved. My questions how this petting is suppose to work
> remain unanswered.
>
> Again, system load is really not relevant whether watchdog works or not
> in low power mode.

Our use case is that we do not allow the CPU (i.MX7) to enter low-power modes.

To enforce this, we explicitly enable the watchdog during low-power states so that if the system enters such a mode for any reason, the watchdog will reset the CPU.
Since in STOP and DOZE modes the CPU is halted and systemd can no longer service the watchdog, the watchdog will eventually trigger a reset.

Regards,
Nandor

