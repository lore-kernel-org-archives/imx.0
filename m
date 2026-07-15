Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD53112DA
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100749; cv=fail; b=oVSbcnozJ5btsdkQ1GcLVDFdbqjXvfJKkG95u7Phv2VnSKSizbqpxR0jGIlXDYgOLMWZpcAchqk6LQNBETVitnxGwSu0GcBcsJVaqSFEShySPXELPp1VVScLaxrlKbFs4Fi5PJftu7Y17nr3F6Cm9z9ofj28GfsS60MVG0GFOG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100749; c=relaxed/simple;
	bh=N+E65BPQi6phbrzHhY8LAWjJh5X3FWoIUE0NCQXx6t0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KY6CqyLCfhNRZZN/i/V79fONlToG48CzVvbd0/OW4JrD4nAU15Vw3B85IzLsyshqFkcCFCHvlwRzhuO0bJ0+8j9Gj2yPG8OVvgrdTAWNhLp0+LeqZaJ2P0dDzkBl4DDuDdt3fVNtN0pl3UWQ2wx+LC2frd3Ysll1pmbOSGvKAMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=J13u07B0; arc=fail smtp.client-ip=52.101.69.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="J13u07B0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMbkp6KB2PY2pN7ou63RmBCeDQ8/DQ3y4WuhFE1eOYc9y+EQr87hpE4s9fNyjUstHpKIST06+0sYB90QLyxmZY3pKywXu7VzMZCWJIBzQ1X5x/gHvOzT1VinWp8KwByc9B5gtPGAHEan5C5pWOZXSJvnoFFqu/7/yCp/+uZAZBWNLAK9ZELqkMdHA0LgzuX3WgBwFgW8tDkn+G6dQNHCN0e3b1qdIZ5ZHskYcAZZagsZoVgLnNgQVJinMSfhgAAUsobXpM81xcLuBGF4sXZz9fpJ1ULIaLi+iExTW/mzCk0MmeCovUchi1mIYMtZR3/w9tGclYy9RQ6sCoW8i3LHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3PUv0x+bvtSryl5MGKh/6XbyrVyLVy9Q9mdmCcTTvY=;
 b=N2ZaUfj3tqLnDH7HbDIHt0VsBqKecqEFkYWQ6Rjegp82s/46PPHnw2O5tJ3Xkby2Tp405ZbjonkWO4y4GYampO/dJJdmOtmwWqQn9j0xEdtOUCeJH92Ci04Jos8X4LmwM46ZdcGBLY0sJobP9/QD/qTigvk75CDz964PQlaF8frmPI41bBrDFrcd0aXMAEtg8BD/vGkmsRCQuUHpJnGhOGF4dxQjf+8dx9rhc0dGKuVTSWm9PncNP1YUEDvAhMOU3YWFyZqGcYgg3lDaWp+4y+dWm1KuIYdSBibc/Be6RkAe0jBn5u+G5btNKsemO5PYtstZbXy55KesNM6WaEvzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3PUv0x+bvtSryl5MGKh/6XbyrVyLVy9Q9mdmCcTTvY=;
 b=J13u07B0JBCv0cRPovotObhABmX63iEmMBPrH9no5dyWlBilgOkIuW+jJdoXAbl2MBzWPd1mi95RlRe5gdqbmddNPeaq8hBu0ghllFRg1+FX9bin+Oo/GnsB2Rrp98T7Y1lpTxVvsnwVROXaFJisYIEDqSlxA4dZ6VY1Xo7qru1TaX2x2suXM+EG+iGIgpS4rk2dXJXq0hfIw4rKbMfllDwEILO2SJ6U2D9IM1APCzV/MN5MNnkb475OQx/pP9WoGuPl7xxdPp8TGFdE4Ra7n5mudJ8vDo1gMAx5Q0HXFUBIoTile9jUqln3WcdK0phAcO8PuqCXE1LBfw9GJhVSBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS2PR10MB7712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:62d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 07:32:20 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 07:32:20 +0000
Message-ID: <17183e83-d4ef-478f-aeb6-e90120e58380@kontron.de>
Date: Wed, 15 Jul 2026 09:32:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v25 0/7] firmware: imx: driver for NXP
 secure-enclave
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <177799642393.1381528.2137639571938103661.b4-ty@nxp.com>
 <73a5b9fd-aff4-4ae2-ab2b-d860bbc7325d@kontron.de>
 <alZJzKHs8w0UAw_z@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <alZJzKHs8w0UAw_z@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS2PR10MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f975665-4517-4d03-6770-08dee243349a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|5023799004|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	tBORyCV0bMf1fYR9ReyTJ0FAJ8Rf2eeIfNr5cJmHeuh6F+mFCo/Kk78nTyLf0xiHUTBVKwf+N7IcUHVjF6KCn651SdT++ruy4cKZOhQwyUgF5UtwuIWKBiGGr9NAvI7GClm33ru3AVwqQ1Qn5doCln1EN1x3W7Twi+VzBGSHhR0btz9M+OKFq5MO1bBcl7q/6PcEM/+mmKEw7tucIDdJ9eRPbCy6zU3SmweNGwFzVIMxFFbcLUAc7WhUZmm2533FoqereZQUTPF7kV5dhkSfOBP7SraaLNYIJP0dj0EvYaBx9F5rUAHB/2Hk61s+rxdgjqTVV9QLI1OzePT0+YlxPJg6RUAi+G7E1IQJMLQ7GkjvILms8NO6eA7pMnS6oKFoBuvXp0C/kZDdbAyPbGUC5NSqkJ8Irfp7kZ2wsZBwMge0aN3ROzifhTt9Ig4wJVj5LIJF95iBZIBaMkorM5+3MMOs9w95GPaSQprZPtq++88uXd5/HjR6tIp05YZjMTNYAsB8YthC/2RFg92uQ+k3TMUvPLd5ZI+6H8utT2Dy3FTzW9lM6BDEDFbndZWTELFpBDpl6zOya70ukLNk5aQkVSSKasczlS1XZlpVXPJibvu6s3fFwYBBSagiP2zw8G+DjopksszkcyNqivDDYd+GGOyRRf3E5UEQESjb2GL5Cd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1hxQmNRUUFxZi9vbEhNMDBjNUN4d3VwYzNaMGVGb1JleXRIcTVXTFhBNU1O?=
 =?utf-8?B?VlI3a1lmQ2lQTUM5RjlJWjUydEk2VWV1cmN5ZktVYWRrUWtzaElPTC8zcEIr?=
 =?utf-8?B?aFZvZk1zNm5DT2dGQjVjb2NOdGZ6MURRazY2ZWhjRTlWM2dyeGRyZ0VHWDk4?=
 =?utf-8?B?TWZubVJMWWNtb1o3TTg3djEvbUxpV2g5MHI0WlF2VHR0Y0JwOHk4YlJML2VO?=
 =?utf-8?B?RU81eUQzYnY3VFpEejloT0FvR1UxbDBtaXdNSTBrdjRhZitGSkVlN21uTlha?=
 =?utf-8?B?ZngyTDdGNjMxekUvTXVnWmZ3cGZBeVpNUGQrK0xJOWlGazFQc3dLL2Z2V0Q4?=
 =?utf-8?B?bEpycXdnWTJ5SkhKV0RHYWUxNVMxbHlheXRFMGVUWUQzNkVOTGhNMkRJN1Ji?=
 =?utf-8?B?UzRSZ29FME5xUnpqNDQvRERwMkowa0R3VW5GOHRZUmdGMXowV3Zac0VlMm5T?=
 =?utf-8?B?SXZXTE1Pb3V3R1g1VGZURHd0azlveWVXcmZlMklZWCtNa3p2N0tXc2Z3MjBO?=
 =?utf-8?B?aEl2ZGUyVWVPcFJJYkhkOWdtRnA3NWd1c0J3VXRMRys3THd0MERDdU1aS3g4?=
 =?utf-8?B?UDgvclN1eCtyNitTakd1dVpHblcrLzBpNTlLWUI4UXJoU0llODRWejRDT0ly?=
 =?utf-8?B?NnJBaUtPc0JiOWMxY2Y5VmZndTA3V1lqWkQ1NWxvWlJkYnE4YVBMYkZoUXlo?=
 =?utf-8?B?ZWpBVHRrYnlISDJVMDU1ZDArM0JHZ2cyaUd5WE9CTWRER0hRRmJtY0R0K2tz?=
 =?utf-8?B?TTk2U0VrOVRMaElrQmk3OTdBQSs5d0g2ckR1dUk3RFBFR0FVbDFBWkZWaENm?=
 =?utf-8?B?b04rU0JmM1FBbnFGNG90aWlsN1pnV3owY3dVeExEczBsTkRSdW5nUnEvWnRh?=
 =?utf-8?B?cFJnKy9RQVVFMlFyQ1kzQmU2RlkrZDlQeS9ac0VqdjBWekg3dS9TbSsxZjJm?=
 =?utf-8?B?Q0ZWSjRaWFlLUnpUZlZhUEJsOHF4QU5LSVlnSXl5TzRRMHJUMnlnRGpzNU03?=
 =?utf-8?B?NForekZkdmw2MjFucDdDV0IwNE9FUVR2K0t5NUhIOU9lWWNEemU1OUhXM0Fv?=
 =?utf-8?B?M2c5aHhzOE1RUUpyUllJNDRVSTlMdS9Za2JEQk5QTmIxb2JIa0hTbWpSUFhU?=
 =?utf-8?B?Y2JmdUZrZzU1MHNpY0FZUWpWQ2p1UGNBYm9NT0RIbElMemZUMUpaclVtdHc4?=
 =?utf-8?B?Y0JLMThSdmtHSE84S01YT20wREpnR3JOK3I0M2UxSmhjUzlCZ0ZmWGVqcTJH?=
 =?utf-8?B?TmkxVHlJWVFEclNRRUlueWJFN20xNFNnajZRKzc2akNsRjJQVEx2bTUxVGJt?=
 =?utf-8?B?SGdsRWdoWUxoMVBOVW1yam4yaExXaHBtVjBCL2tFVk5LN3pTanhNc3IzMDhy?=
 =?utf-8?B?UG5KakN2aVFOZGlqelhZaU1SSVlPbUZGVFdSRWZscUQraGVLV2NZaHQvMTI1?=
 =?utf-8?B?Q2lGQmNyd0pHVGNPMkU4cnZUSWd4dUlIcE1LY0ZORlpNb3Fob0R1bW1nSlcv?=
 =?utf-8?B?UjlhVjJXRXRIN2JJM2xQcWViUlVXRzFjZWhrT2JmU1lXWkxqbERsWkdnM1la?=
 =?utf-8?B?U3FiOGZ2TWpHSEZiL3ZqTGZuc1ZVMmpmQ01DNDVUc0FnTVZacEFIUVFOd0p6?=
 =?utf-8?B?TG82ck1HUVlhMWRWNDNQNjh1cGt6M21RS0VtYTBpUHcwSklQVmoxYzh0UDVP?=
 =?utf-8?B?b3lvR1NYUVEzUlRKZk5uZGhpbE05OWl4OGpxOXVaSDFhUWlxSURmRUczaDNs?=
 =?utf-8?B?NEZDS1JoNGZqb1NjM21EK0JyWmZzbnhTT3NwUGVha2lRNExaem1KbHQvN2V6?=
 =?utf-8?B?UDk0U056VitrdUJNY2RqczIyT3Q5YWQ5dFlaMXd1bXZJbzU3VmdFc01ZQ3BO?=
 =?utf-8?B?UzhPNDJTMkhGS2F5cnNMZFVlTis5QUViZzg0T1NwVnIzVG1pTTgxeWUybGJs?=
 =?utf-8?B?d3Q3dHVIQk1DK05ZNG5TTW95QlhCbTROQll4VFdrWktMV2pzQ2xqdDRSWG5P?=
 =?utf-8?B?ZExYVVZxZWFoRXVYbE5TWjA0L3k3WWQwNm9DTTVPcnI0bU84cTlsM3RlRVR6?=
 =?utf-8?B?Qnk1WkJ4OEwxRzYxTTFFR1RrcldRVzg4MEhtNThLeGY5NTFjdVJEVGs4V2cw?=
 =?utf-8?B?NDJ4bzc3WDA3aENialhEUFVnWXZtME1lSnFTZUN4Sy9jcWJXVk9iZmZLb29m?=
 =?utf-8?B?WmNCOGc0YWFQUmk5TFJOMWE0Z3VXK29rYVhhUGFRRkdEOUpoOFg1Z1FsOVdt?=
 =?utf-8?B?MFZRWUNIdTVuQkkxYTV3REJ2NGhlaHZJNUxxcmtLZE5xTHlLV2hnRGlHL3h3?=
 =?utf-8?B?TVlNYjNQSy9rZVJnTTY3MFZHMzNaZ0c3M2tjUTI3QkNrYUdmbit5UksrOTRH?=
 =?utf-8?Q?EFrfGaSPzSdRWTw0=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f975665-4517-4d03-6770-08dee243349a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:32:20.7630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXojSCdjXkLLMHLLKStJe+n8JrzGeN9mIb05owIxSCh+ZxDh04owtRM4cgoS41dSxGJwLTv9bk40EiuMpIw+UHLvGdCHYjKu3PWbpjUzXH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7712

On 14.07.26 16:38, Frank Li wrote:
> On Tue, Jul 14, 2026 at 09:27:06AM +0200, Frieder Schrempf wrote:
>> On 05.05.26 17:53, Frank Li wrote:
>>>
>>> On Thu, 22 Jan 2026 17:19:12 +0530, Pankaj Gupta wrote:
>>>> The NXP's i.MX EdgeLock Enclave, a HW IP creating an embedded secure
>>>> enclave within the SoC boundary to enable features like
>>>> - HSM
>>>> - SHE
>>>> - V2X
>>>>
>>>> Communicates via message unit with linux kernel. This driver is
>>>> enables communication ensuring well defined message sequence protocol
>>>> between Application Core and enclave's firmware.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/7] Documentation/firmware: add imx/se to other_interfaces
>>>       commit: 3b4531c6e0f4c8874f0266853a410438eda1fc24
>>> [2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
>>>       commit: 4d7bcf0869686d7d7fbf16244453b987e5ca6d14
>>> [3/7] firmware: imx: add driver for NXP EdgeLock Enclave
>>>       commit: 338529a73c2bf2c277013b745cfe6f19b84b70af
>>> [4/7] firmware: imx: device context dedicated to priv
>>>       commit: 2d733ed67f608ee85abb854157011f88d7f280a8
>>> [5/7] firmware: drivers: imx: adds miscdev
>>>       commit: 4de71839142b5f43846e3593f4eb236e1d733885
>> What happened to these patches?
>>
>> They were part of linux-next for quite some time (up to next-20260630)
>> and then they disappeared (missing in next-20260701).
>>
>> I didn't find any hint where or why they were dropped.
> 
> Sashiko and linux-next build found some issues, which need be fixed before
> send pull request.
> 
> Pankaj is working on the new version.
> 

Ok, thanks for the update. It would be helpful if you could reply to the
thread if already applied patches need to be dropped so others who base
their work on these patches know about it.

@Pankaj: Do you have a rough timeline for this? I would really like to
get my work with the NVMEM driver [1] done.

Thanks!

[1]
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de/
