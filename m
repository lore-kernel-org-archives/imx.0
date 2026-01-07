Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2670978F59
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777180; cv=fail; b=LV1BVaBlqp1jBlS9hNvzLMhinXkZYUHGSZexE3vpfBRcE8eGXhiRTLNHdKAZSXfzXcTjj4I9kzuCh84rLgD0yg/oxFvbFYiJwiqfEwGSBK0+2J+jUwc/BmsSQtXzxxDa61dbYZC1mwQcFvFeFrNlMMgtapSxw0qoQlbodehwe7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777180; c=relaxed/simple;
	bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUmOZhQlKKQ5eazF98+iqwvID8wVOHEM/lwsT5CY3kaydDHAw4cEYwnht7spd7EJy0N3jxQ22aAwSPnKB1rcm5oOzeus1IFOrzZcGLAlw558tyF8nd5FrfzQXW1Qln8YpvaXSPncf+hjigBAxU+VRm1tx9K6EzKm2CxobrP/UDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=bSGxBXrm; arc=fail smtp.client-ip=52.101.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="bSGxBXrm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSX6/YjQe+mYXUhqKbVV182SHYH45cXJxZqCrK0aAvfV0yS7C8pdB7UaDgTgPaBY4FbDzGwGIC34XalJVuNw+Yox6FcbG0tINRcK8wxtAFrTOEQ1wy7Z+q/pWTU3LLFPXxfcnuqYwL6nPkMScQv4E4AVlwUQ4uV8Q+C82CcQKX5IiFQsWlBvPE/1N9EbZ4BNQfbmuzIxUrZaExo2rDhnBqF1vlW34GK5ebwO+7UuabmdPz+dB/K4qt37XPzzSVropMvj3bCebn2daCDZoHReDyw70nRfAzgMyQMuimtBlF+hWDTz16T6wJDBBf5JIzl91esmD2qtQLV8Mu0eZma9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
 b=mON+jmYNKphefBhObvrvYRt1mFT4V8iS8sTi5nwJyO2GpkO2LyuNjUvMPw49ysz/N+U73oBh0pqctEHof1lCZY2AmVcEme5tBznalfE1Ij1ZKXrVr2r3BJMEtooQaND98HJkaKIGkuuxyT/PPmKocoU+VC6cN0ua6o7eLfG/49Xu2vlwEpJ2U9x8doYWHM1InJpu0QfdusDUNjk+CoV4DCqVWFdL0CYQetUeiAzDFMWOBYYmWgfn00OZYweNonjP8dmTC09gi7FDnMBiuzK6Cx7a5oKFpx8M6dyL8oBD3MOXiPl4Xx0Wc3S1vHWjHWBqOMinlN5JI3Dcx80ja2dgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
 b=bSGxBXrmRJelGM9rtDu192lGytEquHD4+mr0oAJIeg2v0/gJCwb5ihxgiSJyZ52oEKxInfHn1aFI4+PPczhQQ2dl4dPxgYWHgmmMeRA5G2A5nhwQZJDIQ5Zjxxu6DVlbPSOyVMsDJRPy6uzqsVo3kz75z+DARKtdDQOr5z4BzPSRb/q6pxEq48fsGk640q6pZHV6Xl8sSij0xWG/IGgtfxg8dkVFYldK0b/fBM44HjF42V5NURvssoBxTVgXJ8I/wJB/283xVUOe68TF9cHbyyc7sw5xLZafiZSYo8EBDUnB6MGGmwUPLpSrhsa6FMA5yANFy1O4sz7vFDb08JZzhg==
Received: from PH7PR03CA0004.namprd03.prod.outlook.com (2603:10b6:510:339::30)
 by LV3PR22MB5794.namprd22.prod.outlook.com (2603:10b6:408:26b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:12:55 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::77) by PH7PR03CA0004.outlook.office365.com
 (2603:10b6:510:339::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 09:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:12:54 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A8EA9E57C8;
	Wed,  7 Jan 2026 11:12:51 +0200 (EET)
Message-ID: <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
Date: Wed, 7 Jan 2026 11:12:35 +0200
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
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|LV3PR22MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 99306a8b-b5de-4282-5502-08de4dccf14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFVQY3ZQUHplK3VIZ2pmSTdkRUdtOE9HZEplUG80QzR2eDhFNy8yTzdzczYz?=
 =?utf-8?B?ZGNkNW9pWkNiTE16TEMvUGFyd2ZQNWdHUEZxb3N3Yjk4MGptMzk2dnhieC9B?=
 =?utf-8?B?SjFzRmNybkJWM2h4R3ZFZVYzbnlKcnUwaVg0UEdjb2o3eVFNY0dueTFBN2xu?=
 =?utf-8?B?VWR5NzBpdXhWT0NUVmMzc1BlVTIyTnBjNGxCV1hwVWdLM2dVbEhqNGJiNzBO?=
 =?utf-8?B?QnNXb2JMckhuL2FWZUl1R05JOVBzOWhXZm5wTXg4SUxndGc0UjJrbjFFQUJu?=
 =?utf-8?B?V3pGSEFoOVR4RmNrV3c3eGNtVU1lWTEyMG5jZlBIWUpPZDlsVUFvL0NLVmVv?=
 =?utf-8?B?SjRnWENRbGtoR2E2WC9jdks1bTlYVGx6aElORmd5a0hCbSs3cWF5UEp2SWZV?=
 =?utf-8?B?M2pZN0t2WXBkdHJaOVpFVVJFT2MwMXhEeUttZzlYMGgwYnd4RWZYUGh2c0w4?=
 =?utf-8?B?RWJJNXNUdlpPQmltd3dVWmN3Vk91UTZBMlVmaTZjR1FLdFQ0U2xUeDFaZHpH?=
 =?utf-8?B?UzRyeEZ2S3pPdGVkSjkyV282SFhiTjJUVldxM3JUQjRKMUt6YjdlUExQSGdx?=
 =?utf-8?B?Wlc4ZENYRmd6VCtjZmwxTmswNEJ6a21vQTRveXFId3JBdk0yb3BWZEZFTDFy?=
 =?utf-8?B?S2dXY0twbmE3UGdBUkRkMFNoUCtma2pOY3E4MlF0RE1aYm8vUnFFM3dEaUpT?=
 =?utf-8?B?dmRvRStMN1ROeExWWmdqclVlK0xkKzNwYnY4NE9QMitCeVBYby9neXNiVVFt?=
 =?utf-8?B?d212WFc5YmszNVZwTkphNnRmT2NLVHhsMFpjTEhWUTdIdktzWkxvT3puZ0ls?=
 =?utf-8?B?dmgwSlRrcHhHUnpZa1Y0VmIwaWtaMXRpa1hxdjcrZERJR2NUZy85SDlyMXJm?=
 =?utf-8?B?aTFSU1VVcUhCaDQ0bzNOVEhGaTErOEdUcWhtZndvMS9KYnFIUkpRbTcvVitM?=
 =?utf-8?B?Uyt6M3YwYWJFcVNoc2ZWa2xuN09CQ2VTdStmSUpmT0YzaDBZRlVBRFh1dFVQ?=
 =?utf-8?B?N3FFODkybHhRblV5SjdzNUE4V3dQV3Z4WXBTV092eVpsTDZnUEpwMzZtUkFP?=
 =?utf-8?B?VjRuV1djWlQ1b3VReEUrNXUzSE9aTWpFNGFEUTY1cVNSNk1BT2NiWDRGdnhr?=
 =?utf-8?B?ci92dTdzc3RiK1FzR0JoUmR6bU5RNWpWbVlNVTEzMFQza3hNcGU4MjlYQ000?=
 =?utf-8?B?T3ZsdXlRWUhPZ1MzM29udFBUaWszaitNcFZubTJuc0xCY3VoZDgyVCswUWZn?=
 =?utf-8?B?eUJhQ1RRSk5nOUZ6cE9CSDFrUmkyUUx5bks3M3BYLzJkazF1ODBpcE5kbFJ0?=
 =?utf-8?B?VVV4Q0xVVnExNCtFbHd0WHVhQlhqZjA2UnBjV3p5bHJPMmRHY2NxSmdBVmpW?=
 =?utf-8?B?QjRteE85N2ZEVHo4VncyVW1sd2xGSUk0Mml0WS9nQWo0TUZ6MXEybzdiRkNv?=
 =?utf-8?B?MTg5REEyemovUTRyZ3Y1SnpkYkdGN0RGN1AxMlF1SitwT3lFdm04bkkwZXZk?=
 =?utf-8?B?Ly80d0NJK0ZSNUtnNE5Yak80eDNEZDY2UlpCQzMxRW1Bd0hXTXMraXNTY1lj?=
 =?utf-8?B?NGlXRG4yRENtVkRFdVBqQU1rQ0kyNVIxVkREY3ArZE43N0dRV2d4cmRhcEVJ?=
 =?utf-8?B?QWwxYTZzb1NzWEp6YUNKM29sUDNvandWSFdUUXBlellFTWh3YnRoMEN5WnZW?=
 =?utf-8?B?VGlIMk9KK0JLd1Rxc0hBZFRJTnpBQ3FqZkJON2JTVSsrU21YUThIcDVjZldi?=
 =?utf-8?B?bmd6ODZGeGVJa0xlcUJVSWZhcnUzRU5tL2lvanZYVUM5TjZ1UEV3SVlBVG1V?=
 =?utf-8?B?SmhlYWtXKzhHVXpaMkdtWjN1Ynd5eGZweVVoRHA5Z0FNTi9Qd2hUcGlNMEli?=
 =?utf-8?B?ZDd3YWV2enZyNWlXZnU1T3pRaS96ZHZDVzVkWHM1cE5WdzNiR2NLUUJYTkZp?=
 =?utf-8?B?MFh4MUZuMCswY200UW0zcG5iVnNiNTRMOGtoTnl6Z1p0SWtEekN0eHdhZVJk?=
 =?utf-8?B?cHJ3NUZBRTNJNm5CQUVBYStkOENGWXJEYlluTnRyL3FCd3d1elVhMTBzbWlE?=
 =?utf-8?B?NGtXK21Zby9JTEV4UE52ZmFhM2ZUVmVwYnl1TDR1bGZ3WWJPVUo2ZHo3WlM0?=
 =?utf-8?Q?SgTc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:12:54.8467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99306a8b-b5de-4282-5502-08de4dccf14f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB5794


On 12/30/25 14:34, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
> And why exactly would that be a DT property? If system is sleeping
> (assuming this is what you meant by low power), no one will pet the dog,
> thus watchdog makes no sense.

Thanks for the feedback Krzysztof and Guenter.

In our case, low-power mode is disabled. However, we have identified that under certain conditions,
specifically during simulated high-load scenarios, the device becomes unresponsive because it enters
one of these power states.

> Otherwise I fail to see how this is a hardware property and we do not
> accept SW properties (see writing bindings, numerous presentations).

Our system is based on the i.MX7D CPU and the watchdog peripheral supports the configuration:

(From i.MX 7Dual Applications Processor Reference Manual, Rev. 1, 01/2018, page: 1174)
---
WDZST
Watchdog Low Power. Determines the operation of the WDOG during low-power modes. This bit is write
once-only.
---
Given that our system does not support low-power modes, we intend to enable the watchdog across all power
states to ensure the device can recover properly under these conditions.

Regards,
Nandor

