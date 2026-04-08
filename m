Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013026.outbound.protection.outlook.com [40.107.162.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A816279792
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 06:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628099; cv=fail; b=HGralx6ij1GXpkxYYogADpZKl216T+Ru9/gc8Q2FiQGxe7ReLIk4qpmwudC+nL7h1O1C4Njm2w1DlB5gall4yiJsVcSzKN2UcScDv7Rku6EZ3z/b25OkuCKrGTaTkmaS4YTgTXseZdwhhJAraq3idk4qxf06I5AztnYyn+YIj1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628099; c=relaxed/simple;
	bh=GVMhfu4d56awnL5gIGJYIuN6U0gnk3rsTm0i/snYCHk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DmcAABWSTjDLFa0r2HQMaPqVgj6LfsUKZyKg6+KEcB6ZMSlPbCIna+EifkvvbPjX5S0UogA32pMQYpOkwAKX7m6Ffc6+lLR3ZddsD5rmQU4feVTH3jIK1+lBqIneTu6j53V9mTGj1FFrmjush42zFwmS/RfZ4jI7pMKNeS+xy0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nm53WgdS; arc=fail smtp.client-ip=40.107.162.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nm53WgdS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKwdojgQq0Q5OkO28hoLO96U9YXRNersyl1E7bYqKaXRk8iCflkCOjITGG3cMjVbyPGWi3DQAnYZv/3xu6oFtGyht7S68+LCj5rZ0rByv04u1VB8wf6unBO/6vzSYbfx5m4Iu79MQZfKosCGb1J0966an2CGj1dFBaXtg7OMcoZxBaIX0Sti46vQ7nzAbm1ZUOBzAag7JK0NTOc+dpVQGUBY49IWOzM9imhGs8EqvJ98Xj7u1U8i7AwlyVbJzCpxkoVNm0bwn9Daue1aGfKNIaXRqaGi6vqzCIEq3pi6wWPPBTeo4SW21tG1uacZCm88YZEmZ3ZgO9cAp6YpEX4FWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asHbYDUzfObPFnAg1d+62PJ38vwz2w0ef0lYURsRJ54=;
 b=zQ98p3zZ8ELFT/VoBRt/xqyI0TLNECJQiAUSjgS8tf86osXswgf9ZPy9VUl1g+AtusaoWZMhFpvpt1t1jM74AkGogHvkJqziNg4UL2xi123NUQBOw7ixm1rZj15fNAxkZo5qXKWwaP3m1j7uWgzhpOmQ8aWipoFQt3tFX/rBplLv6U1lAvPWS6zjfW4hAlj4e1CTdJwOcN3guEyYm7ZrIHbzLfRwAuUkhNV5di/+UtfSZQdCW1FYMv6dpg7L848h/jyPkIbQv2zEoIPSLgW/UyVhvvmiHQsjnI/+DuEuKe4DdeQ1zmioK4wJKXLGvQp5sPPxgWAkBBcY+XdK1bYOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asHbYDUzfObPFnAg1d+62PJ38vwz2w0ef0lYURsRJ54=;
 b=nm53WgdSEOq/Ju3r6RKI0wHD0r83ZQY+1AG9IRt8C37bM5qZb6IHx8i/RGfsG6RZfWJ/SPp3W8OCYylapDM2ZBIBDy4u0DlNIpO5iYu+9DBnI8cmuXDGItnOg5+niitpYXSDc4baCt3qA7W3u5v5QWbbccNjXgOlfvNNejBm67jL+84lwMYI5oIVDzyECRnm3beGVLbSC/t3Zqr80FbcKIxGUW7wX2c9NwJnofyAlba6VPvvmrmMFVndnZ1rER7EeXqBzstytjjBnjBhRK9JdkPrsUHNBIZ+vtlDXuCcYKulEkAwuzl4Q51CNMk9VcJMINja8Y1qi63z79hJ2c13JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA6PR04MB11831.eurprd04.prod.outlook.com (2603:10a6:102:522::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 06:01:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 06:01:35 +0000
Message-ID: <a31e926e-9e7e-4ba4-aafd-0f76f53fa176@nxp.com>
Date: Wed, 8 Apr 2026 14:02:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
To: Frank Li <Frank.li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
 <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA6PR04MB11831:EE_
X-MS-Office365-Filtering-Correlation-Id: c80be953-2581-48ba-9525-08de95344a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mDRauK3Ss9da1Iv6zAZvCL3Swv21UqoUlQkTJvj3ztY2inXhrLl4YHNuj/DsTJI6zjWoADP0k73jTCJJWF0542TnsraeVGUrMyHZqaBqDSgNZgFchgblx4rPbmadmjc1iFEotH6IPTG42U1O2SnhsjYkHPHoobI87D0jIvFFi7Oq3KQ9XEDni1nbUvHCdGdAIxZo6Se6a+dhUX2DeytgimW+nR5LAdFFUXFDVZvPxeRzuefYVTIxSFIP++wtkFaQ4z4G1Tc5pHEGfQ6e2cha9yNsQgD+DkO0uMSNjRYGuYe3adgX3tUNfbp7bGqAq0vcjYskaIQOULgAOc8yfjEAh6KDvzfBUv5xmwtgqfqpEKlQ3Py/TdESqOYT0IFeScjBbRaS3VbuBwmGUWtBP1n2ClYpEnWzqUiB/WtsdFn5RK6g+RJoFsZOXYuDL3ET/X7F1DR9E+YroFDfTL7Yr+XKHYAblnINFiP3YdLeKf9T/Lc5Kmxj0DgvLQrQB9MGb906CDuaApAAFWGlqii2YavNMB8XB0LbWSQa2iZ1cATCKybNojWrbG82czOkGf2MFTy+UKuZoswwrsQqKAOKeIWq3ckIIUXEfoKVmU54S1zPNpq708rn8A0XnicOtriwd4j8ZIax7CHKu8w+wlH+QoQ1Y6CU8eEofD26upFolpinYzHwy9hXAkjfVG/d2O54QrQP+ldhZhwCbytUVWZ8pSl6JpXxn6eMv8cJHy9Hjf85XujV6zrMfbhurgql1E/LV1BX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THFLWjZ5cXhOajhhL2JraHdOOVAraDFoWFNqdFZlSjMrNlVNTkhOVFJoSmh6?=
 =?utf-8?B?MTJpZmlDT2laazhLYllWWStybDRHb3NrTEJWZ3pzTEhmY1AxRE1rMUdZQVpW?=
 =?utf-8?B?d25UcWRkWEtLTUxUMUlqMDdNMmxnTHFieE4vbHpmMzVzTmc5bEZBbVJlNThk?=
 =?utf-8?B?OVpBbG8zcG5ZNWd4RFl6aCt4eDZ0VmVpYkVsL1ZVdStSN1JVOWNab1h1VlB3?=
 =?utf-8?B?U01tdStPaXZ0UG8vbWtmMG9iNURKSFExWkkrZ3Q4UUpvbHhyWkh3d2JNdHl3?=
 =?utf-8?B?ODM2SVZlQzZWZmRPVlR5cjNkajJ4UTVCZjJTZGU2WHF1SDA3eWdHYThwMUZz?=
 =?utf-8?B?RlNOYUUreHRCeGRUNDNMWUtSaVR3dE00akZGeThZbys1LzNST2h0bHhzOGZX?=
 =?utf-8?B?Z0VyRmF4TlJkdjhUclR2YmpGZEowSnJjL3hZdVJXTndla1I3V3Ixc3d5bUQ2?=
 =?utf-8?B?QTh0OFM3QzhRMWVYdWM3dzZid2picVE5c0pHdUFmYWhKQU5HbFNDZTJQOUhR?=
 =?utf-8?B?cGl5aS9FQnRJUk9MMktSQmQ4Q3dIekVwTllNN1AzTE9ZTkFUN1pYMlFrak5Z?=
 =?utf-8?B?c2JDZ0RaSjFFaTVBRGNoYzVmTk4zUHRKcEc1T2VCZE9CR0MrbU1qaHBVUkVw?=
 =?utf-8?B?K1RFem4xZU5IZENvT0VEcVVkMUk3Ymh5S3hsUnhoQXZxQ2xBbjlQRk1TbEtm?=
 =?utf-8?B?MmNxUU12TnBzdEFnWkhLNHMzVHNKV0t4ZGwxMjJpUEpJZmwwVzhpT2FKK0Vh?=
 =?utf-8?B?d3UxMURpWHF5c1RIKy93cmI0YWhrcjlWajdaYU5LNWgzMHNFQUN2Wkc2TjhE?=
 =?utf-8?B?SjA4aXMzVDIzMm1DWUo3dzVpK2VoQU4wbXIvUFBNblI3MyszRnRGK0w0NTh2?=
 =?utf-8?B?VUo3VmFtZVJ6a1JmOGhSMjk3cVZxdlZUR1Y5M2hBM3UwcFNCZmlNN0JwdHFq?=
 =?utf-8?B?Z01lQXovOW9DYjNYcTdLaWVQUUlENlEvNkdOUDk3UUNqMlNtZkpzTFlXVVVH?=
 =?utf-8?B?WWUwSVl6QlJrdXdRbHBQejBIQVBOSUJvb1NqSFU2NDJrOVhXcG1uZzZzR0R1?=
 =?utf-8?B?OTFIZUw2TVRaYVhZZ0tYTXpsRWcrcDJ4bUlKSnhaU3BjanpXanZaQVEvNGlk?=
 =?utf-8?B?YnpBNVhXS3lSU0VjUUxOajg1ZEJZd1NkTkxkWDFtMk9EZ05OUHNrNXd0R0dX?=
 =?utf-8?B?eWZLYXc4ZFRKUkFyaWR3bU5oZ1hWY21pd0pWL1NqZHFObnBGaFFGWm9iMlcx?=
 =?utf-8?B?MkVaZE9BOTBRcEFoY3J3ajgrZjBwU0srdmw2SnVVYjhBMlhETlNiN3pGemRx?=
 =?utf-8?B?a0hqVDVYdGlxdncrdTl0UXUzUzJqWElEOHQwa3pOc0FxSWVyWjRpZXpKdm80?=
 =?utf-8?B?VFYzTG5XTWIvOUhkcXNOTlcrY01HRjJmUTZzV3JaZXZkOE4zSWpKT1FmSkJ1?=
 =?utf-8?B?Ykl1VHhUM29JRDFQQzJka1FZYjJNUnRiR1hJbDFqYW1CK1pza0FVRlk5ZlJP?=
 =?utf-8?B?d2VMeThpRmxvK0U1bGV1TGE5R2hVNXdLZ0VJS0RhSXlIMW82eXYxZWxHR0Jh?=
 =?utf-8?B?OFp3bVVobmF4d2treU1FQlppaE55QWdFQVRQL0hFTWhZWDhCd2ZCcVdqZWpS?=
 =?utf-8?B?cnRUTk1jSjV4Vy9aeWNBY0UxckpYakx0cGJPdGFwbm1Jc1JzT1d3dkFuYkZ0?=
 =?utf-8?B?V0FuZWd5cWFZNWtXdmdONDRPczlKcWpNc29FNW13V1RyWmg0a2VCWk45KzVP?=
 =?utf-8?B?K1ljMjNvQ21ZTGVtOEQ4KzNYTG51ZkdpaFVNZGlCUXV1VFZEUEw0Q29lZDFN?=
 =?utf-8?B?N3NZUjdzemNSeEtZcHh2UXhFeHY5ZUpWRVBqclBBT1ovc0RUN1dBeit5OGtK?=
 =?utf-8?B?dWdnaGRCL2psU3dBZWpESDMyclVMVlFLcnlZNFE2dWRqUnBZdi8rS1locmtU?=
 =?utf-8?B?Tmp1cE5ackI2QzJqZVU5OTNTQ0JBbG1WZlUxK2NLZW5zOE91YnRwZEZiZW13?=
 =?utf-8?B?dzBEaWNRTXQ0SUpWYUFxWjVPQWdzcVZMY0s1bHVOSUFUOWlUOWZqMkU2cEU2?=
 =?utf-8?B?ZC9zMjFKRG5CSEplZDhqc1FjdTRTdTJHM2JwR2xYNitadkxCSE5YYlhIV1FY?=
 =?utf-8?B?aUdtNGJwVjdPYnV4TjQ5dlB1VHhrMEcyZU1SSGMzUGlxSFNhbXZieDlZWUxG?=
 =?utf-8?B?ejhMQUVTR21Zek5xT1hQTVlJR3gyUVlidWF2Y09UMFE0c2lYaGN4QVZkNVht?=
 =?utf-8?B?QnQ2a0VpbkdKeHVHZDFjbjFNK1g0elZEL0hnZ0xPWXdXenlWMlFPZzQxMTJ5?=
 =?utf-8?B?N0ZrWFlXZmx5azNMZXFSZnQrTktva3hvUjRlVThPb2MxUjlRZGNVdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80be953-2581-48ba-9525-08de95344a31
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:01:35.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYbvQx7xSl3V2FkeuPc6yZQxBeXr3yxNz1AM0joMGONlms3M7s1H2vUvkUczs7LCoAXYWJWs+/D5+eN6qapiSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11831

Hi Frank,

On Tue, Apr 07, 2026 at 05:55:29AM -0400, Frank Li wrote:
> On Tue, Apr 07, 2026 at 05:15:31PM +0800, Liu Ying wrote:
>> Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.
>>
>> The panel connects with the QSB board through an adapter board[1]
>> designed by NXP.
>>
>> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41 [1]
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       | 110 +++++++++++++++++++++
>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 106 +-------------------
> 
> Can you add some description about raname in commit message?

I'll add some description about the file copy in commit message.

> Use -C option to create patch.

Will do.

> 
> ...
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
>> new file mode 100644
>> index 000000000000..c233797ec28c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2026 NXP
>> + */
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
>> +
>> +&{/} {
>> +	panel {
>> +		compatible = "tianma,tm050rdh03";
>> +		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
>> +	};
>> +};
> 
> Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file
> 
> to imx93-9x9-qsb.dtb, so needn't create dtsi.

I'm sorry, I don't get your question here.
Anyway, the DT overlays are needed, because the 40-pin EXP/PRI interface on
the i.MX93 9x9 QSB board can not only connect to a DPI panel adapter board
but also to an audio hat[2], and maybe more.  The newly introduced .dtsi
file just aims to avoid duplicated code.

[2] https://www.nxp.com/design/design-center/development-boards-and-designs/mx93aud-hat-audio-board:MX93AUD-HAT

> 
> Frank
>>
>> ---
>> base-commit: 816f193dd0d95246f208590924dd962b192def78
>> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
>>
>> Best regards,
>> --
>> Liu Ying <victor.liu@nxp.com>
>>

-- 
Regards,
Liu Ying
