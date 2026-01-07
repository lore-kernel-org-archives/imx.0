Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A707A32694A
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781824; cv=fail; b=YKki0oxaFPhXSmrn//s2LDJUKEpw3Tq4DfeE5Sjg/d3JXGW9uyF79aulZyXlM4A7FjnszGC9xguZfy4KQntVjisrHiqIR806Gw+r/s1J4DMLMAxN+tETj6uyOel831ybWND0YntP4coL78opA/JMzJPGOatB2NX8zJ0ouqX3sVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781824; c=relaxed/simple;
	bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXPaqmDcozGEbOdBZtQEFA6sYkNdA3CZdXJRP4yBmt38KmyrgCYXEx4255VX4gK8Igx6rH6vI0zeleYZ4YoMBLJaUMS00+sy5no5iilziSbZV4fshrkvjLtBRxVyHZQju2FJp4UUV8VKJvYrr1cA+1uPx21fyMoFEBkw663GqiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=B1zcaeWm; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="B1zcaeWm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW34hpK9dloLoM356zTKy/r6JsGkVdmlW/IqHoA4TpVOhbiH5v/4dwVDJLomb8Q5zrQR4XycESu+ojowaFYWYeCaRJv+pQNdltiAN/QaOsLr3mUJFe/sj7ttedpapf0/aBja4kckRwrdZPqvnP3WEGPGaPBJcCQw2JH+LLFzuopy2T/pnaQWJK9jKTs6vBCXemYvwQhFozMN6zjn22L3Ve5AXu6TS1ELGMdaD91lW6N9ZBMClKAiEJuSbYAt4ddnjlnyanenfwc/WWOiZ+jXl4ZEVxxPcnvRxdZyG6yEH9j/dsklu6Y4Mc5M2tFPgWfQ+FOHR1Ae/ZFGPPKosRXcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
 b=JHmZngn5QkQ3Ao4CPLNcEVP27s55FOCWVl1LWfwTrIvyWGFVS3Nvv9XUxdm7NDIgStCchYnTLWXcXsK2NEQ0Ew8Wf65Tp3ln/NtmxFD0+7LW2Z+CLwJq+JIN+Wmo6hr45PUKDs0zL6mQlZx8nLIF3bPI8LYkIXEhTOYINdhbF3pPsW0LpwI0zvljWFWsao+NI1bXwT6WyoXnFDOWP5YUtUsip20attbGgupTgBY52sJBbr5Nf0qlP595CZHVcBC0QutNksmTcj41qR5d4lxnvO+TpxbL0kSsGcFE1Gofg9nkWtBw3+HwTOjWuXuWyzOFHvNh9LXfzQlWVfFslHebug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
 b=B1zcaeWm9mo878ncGDd1GO8dI3NcsaI4WdJij5sHUX0h/SmawAHaP8LUxjatFsgUSfWhXx4Yul7Ucsx9DtSLYXbZjHgK25y9eo0TTdjwjTI2ZaDrQ5IcFn8SjoQcvI9Qwx01OTZLYEHaWhPoWRYpB//+iN7ST2ccr242eZP4WcZA9yxVA8dVn5WMreCP2latRsxI65CVlXIsI6oClS7zj77TwStidqNWAVkxPr79N3mdM4Zp71o8EozP4sUFI8QV2Tsc1gh1fUpLBM5HWthZr3HHioYHWc5xSGJbo4FI4i74jSqQkXsVbgIIrTifE4YulvPqoTzUoPLVuQuBFuJwcQ==
Received: from BN9PR03CA0204.namprd03.prod.outlook.com (2603:10b6:408:f9::29)
 by CYYPR22MB4350.namprd22.prod.outlook.com (2603:10b6:930:c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 10:30:16 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::74) by BN9PR03CA0204.outlook.office365.com
 (2603:10b6:408:f9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 10:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Wed, 7 Jan 2026 10:30:16 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 1ADA3E57C8;
	Wed,  7 Jan 2026 12:30:13 +0200 (EET)
Message-ID: <9f77a920-0ddb-4918-bba1-816b37727d52@gehealthcare.com>
Date: Wed, 7 Jan 2026 12:29:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <aVz3Q34/nchMuqVX@shlinux89>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <aVz3Q34/nchMuqVX@shlinux89>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CYYPR22MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: b5db23c8-b568-48d8-b720-08de4dd7bfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2FuaTRMOCtMaHZ6MDZTQzVLOU1PYnJYWEtvS2lpOWhTdkRIRm1obkIxWENk?=
 =?utf-8?B?S0xwVjNkT3hHdGgyZGFxQjZpZURiSnpSeGU3T0drK29jT1oxNWRObzFWS1ZE?=
 =?utf-8?B?SkpidmlZdld4ekdyRWZWRlFKY1cvYzlnT0hJT2MrL0hVNnUzcE5hbGp4U1du?=
 =?utf-8?B?QjNYTksyM3BUdHFRclhxazl5VWY3VDZ3eFJDRUpJcVhBN2IxNVdFQmIvNGs5?=
 =?utf-8?B?VDZXQTduM2d1d0JKNXJmQUtxZnpZdmhNUi9lcXpsb1JPUEJ5RkRJaG5lbWJy?=
 =?utf-8?B?ZDk2NExWd2o5dFN1aThnNFAzWDBZUlBXMFFiUjBrMzdXaDM0ckU0a0wxbExl?=
 =?utf-8?B?dm1rU3JMZnFlU2Y3d1d0N0xZZVZWSk05UjByM3hwWitmNHVZSXBuaFhYTnJz?=
 =?utf-8?B?b3dxYUp0TGJUQ0t6UUpVaWduMzdwTVZCSmd5bE9BRGxMVW1xenVOSEo3bmRm?=
 =?utf-8?B?RjBBR1BIQnI5NnhvUzNBZFQ0TVZ0b0VXUUZUTS9NR1EvMWxMbCtGMUlNS1Bw?=
 =?utf-8?B?TkhoSWg1TUFhckptVFlIczFlcGxvQW5DOTdrK2dIbXNoeGZnUjV2Z2IvQ0lP?=
 =?utf-8?B?dFRvYm5iUFFKWCtreEN1cGNQUitxMUhOa0VLYnladTlndGN0aE03dEZwb1Uy?=
 =?utf-8?B?UjR0K24xWEhZcUxGdXFOVHVqZUpVWlJlMzdXNEJQWmdlSVpuUXkwbWYweGkz?=
 =?utf-8?B?eWd2NloxNGhxRnBxYTQ3d1doNTJlUWJmNERMUzkxdE1pellJdnFYTFBDZk0w?=
 =?utf-8?B?azlKMklFRk5saVNNc0pRT2NzMzZadlluVDFqMTl3Z0pOZlhxNkw0OTQ0d0dP?=
 =?utf-8?B?Ri91RXRTS1RnaUdXYm1QQ2o3YUZmaVprTXpReVlKVkJ3UE9MRzNCRkZ0OENX?=
 =?utf-8?B?djEweEhwQ3MwK1pSd2FlcERuVEViT1RRK0hMSFBkUitieHJpUEp3SEs0SVEr?=
 =?utf-8?B?ajhUWE9JaHZBMXBwaHZqbk1TRFQxMjVYUUhXTm01TkF5NlQrbm1idmw4cFhn?=
 =?utf-8?B?cmVWV04wMWtHbGpETHZNR2RuSnU3V1ZFWkdxTGdXTFBOTUUwT2xGRXF3dTU2?=
 =?utf-8?B?Qy9XQ3hrdjZKTjZQb1htN0c0VDN2Z1Q5dFV6RWVzaDBFZGFkWnlLK25QcWo2?=
 =?utf-8?B?KzlIK3cvVmE2R2Q0Rk03WWkyN2VDVWU4RXBlU2MwTm9HVTVKL2FvUG15Y1Vk?=
 =?utf-8?B?WkM2VE5hV1pJWnk5UVM3OGNXc1ovZTNQZ3NUVjFEelU5eGgzYlFLdmlrcTBo?=
 =?utf-8?B?em0yOU91M1R0OWRscktkWSs3NUxOejV4WGpCWGxKbkhXNnpOTWFpQ3pEbTA1?=
 =?utf-8?B?MzUzTTJ4dnZLcXpiQzA5Z1F4OE9vRFpMT3B6Q0pKcHdpeVE1SEdHS1lHK3ZR?=
 =?utf-8?B?LzJ5YWJrRVZjdk14TTJNUHJnaXphK3lYYWpsKzN2OENGd0hpRk56cUxycGZR?=
 =?utf-8?B?NEtVZEhGQStwWHNtQ0h5VjIxa1RsenpOd3BQbWNJTjVvZWxJTkZZR1Evcktv?=
 =?utf-8?B?YWFhZDZ3YWcxY2JQME4welZMdGFHTlFPekp3OVNIenppSnZSRHczTk9EcnNn?=
 =?utf-8?B?a3k0Ryt2RDk3eFh4V05jQ1JqVzl1TENvUENqWTVER0liak95STV3TUJrU0d3?=
 =?utf-8?B?aFU2dE1ab0JiVERTcVg3ZjY2OHZ6U21GMWJ5eDdjMi9EV0NuUlJVNEMySk5w?=
 =?utf-8?B?VmhocTBIeWsyMVY2K2t3aE5JSlBZYUxOL0hrVURyOVpVT1l3cVlKWHg2U21H?=
 =?utf-8?B?N1RWTkg4UGhvUk9CT2Y2R1p4a2pHT21ZazRRdDRSYjN5NlU0NWZoVmdSRWNC?=
 =?utf-8?B?RFd0V0FJOWltS1FJMFkwNGdLRisvQVFjY09VY2kxTGgzbzYyRWJUWlYzVVNB?=
 =?utf-8?B?WkZqRkUxb3QrNDZzbXQwckVFOFFvMmdJN0lEVmZTVzZJVVllV1M1T1hzck5J?=
 =?utf-8?B?cEt6K2IwTytvR0s2dXlpT0ZhN1U3TmlUdE9SVFZVTVY2SG4vYUNzaCt2bFBa?=
 =?utf-8?B?Q2k4UVdQb1pnSVRQckFzN0plMkk5eEw5UjEzcUxlc3ViN3hGeExhN21ZTm92?=
 =?utf-8?B?UnRJS01vOVdiRjN6enV4eU00bWhXblhBc1k3WkVUbzlCTjhIcW1pelNyczUw?=
 =?utf-8?Q?zgWs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:30:16.1751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5db23c8-b568-48d8-b720-08de4dd7bfbe
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR22MB4350


On 1/6/26 13:51, Peng Fan wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> Hi Nandor,
>
> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
> >From the cover letter, I see that system should reset if runs into
> low power mode. So your system are not allowed to run into low power mode.
>
> If my understanding is correct, DT property should not be used.
> You may need to use sysfs or module_parameter for your case.

Thanks Peng.

Yes, you're correct, our system should not run in low power mode.

My implementation is based on the fact that the driver provides already a Device Tree configuration for the WAIT low power mode.
To maintainconsistency, the patch simply extends support to configure the watchdog during STOP and DOZE power modes.

One important consideration is that the watchdog must be fully configured during boot to catch any potential issues early.
Since this is a hardware property of the watchdog, we considered that device tree is a good place for this configuration.

Regards,
Nandor



