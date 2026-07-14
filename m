Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023125.outbound.protection.outlook.com [40.107.159.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3933EBF19
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014038; cv=fail; b=hDuOgJzKR1BCRfHIwNpG1XYL6O9EqOKQjkHKdyn6gSdgyhFZEb8dz3yekOR2u+XDHiCVXoE/mQg0qFGOEYilImOn7SPJt68Ox/FZyxS+FjWtMIAcMLLdxgl/hvRdWEKLkdrFcuBHnw6VihWSKDvcN5TkEsCPPr3Gu6SznhpcYcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014038; c=relaxed/simple;
	bh=qOo4LDEFrSXncZ0XiNs0TC3cWSlvz7vpS0n0cUlQqCI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DautjDnpa7iaM9TBtZ3IdjX4MA3JreotmDnY5rC1hWMd4uSMpH/u7s7X20lgBCJI0Y1PUPQPMmWqlx4/4TR+bGEMmGjMW4SRzmOlLtqxDc+J/h8cS7WsypREojcXDexCZNQ9xRLbZUUUkP52C+JAhOvMNjbx3v5K+iChuFdbpc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=SCH8UOjB; arc=fail smtp.client-ip=40.107.159.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="SCH8UOjB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juN+jSEHtSc/0riBex6OpqbZ4dUocVjI/aXNU7qedzt75Azq+75KDTqIz4NC31w5nMqaji/O2Hj3vuOEPPvxA2c0Bo41nBHr2UW8wsF/qFA3x+ej71qSLQzvuUy7lkfvKntklpJ3eDGefrvfaR6sA+kyL6qI1DnkE86NXqGSyv4UiMhA0hzIErqhvfJkmKz6nqQGWd+XqONbKTpCgGEuCCyrxKE1C6rUBdfqZFtEQ2TlQe1VWYf+Ax05jQISlr5nmoPLrXEJ+vXvv0JgYSFyhd9M/JwI6wteIiEH9RTiSL1fIHOVrEb2seuyYNhnxAdhjNWLMb/uqIcoqT0+m7ugFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/q8F1gwVVPPdCBhlmoyKjC3i1hm/M/pR9vn2frAxwc=;
 b=j5h5Fff17oSGx6/zH8/zyCDkkEHs2zKkn6oIYO1bJoLzxxHmkdXSL0h9xz7/QConITke3MiEZeVCNSkRGh6IXLaglADV7qOiMD9CTYv0p3EwI6RvhBg5tpQf+iugL5Hoamz9+dcmmIi3PSsRDzVxnVOy1KhbYKxhTTRkQgWvX2LhZtOtURKe9eTb0KgMpdYu35LPTl2TT8+lSlFI99rBzpkRiGeLuWJ/jnbG6IllvNb9UDTF9COQ03ub4eGihFt1FCj0uJhjS6hP/sgv6/ywPEt8GDq118EM0cqehI05GRHq4HR9SO9SuX/C5K/lbYBvirhW7f8hSVc96cOHIyUKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/q8F1gwVVPPdCBhlmoyKjC3i1hm/M/pR9vn2frAxwc=;
 b=SCH8UOjBl+kuwtEUR17xvcsv9iE3LSpPeG/mhgGmb4eVUpCBsd4wrGwvRXs4vGkFlTJkNYEcX3sG6yR4cC2tIVmXVPm1KqkXgVONQHL/TO9JFPa7Lhgdlf2um3uSmWZokYyj2Wi3Zem7ybv85eQ9V5IKVoQoFUsIVrQOUhbRUptrxV8HJZmayt5MMLBBd1n0zZ6kUVhBm7EcS0Tk4+XqvKclUf1ywkl87qYk8EMXUor8gRPnisUT53cXmlUvwjlWe848GDm8k+25jFgDhxzmq7q39M202M7UQOI/t/FxcIjeztC8kDONZspZWYP8p1b9zUjaM/E9LN8yIfTYNlg+9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DU0PR10MB5310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 07:27:08 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 07:27:08 +0000
Message-ID: <73a5b9fd-aff4-4ae2-ab2b-d860bbc7325d@kontron.de>
Date: Tue, 14 Jul 2026 09:27:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v25 0/7] firmware: imx: driver for NXP
 secure-enclave
To: Frank Li <Frank.Li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <177799642393.1381528.2137639571938103661.b4-ty@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <177799642393.1381528.2137639571938103661.b4-ty@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DU0PR10MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: e5deb206-2f55-45d8-590e-08dee1795009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|921020|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	hJuH9RzFgHSYyKu5kBzjEpUT4MxYedIZLIQGdYpREYosdmH1G2QsYEh8JHP4q/nrzYisCl4hKfm2t4KI5F53ZtS3Uiw12Y7mOfVlo50t8zQWAf20615dzRMCxa0iTMHmv8X0KQRAnWLcUu1AutCwraF9z7UqeSCYw4VLSGuHgizmnaYwtGAnfW1g1PezMcfjoDi+HVe294b61Q5WQsjYLcRWCoq4iGhnLN2tWTZGIS66tjH7IW/S+eykzCddx1jR9/l2woCE5vFjX1kNWR3AWbSqpxK7cy5WgkpjDqHOW7FUd1ivgoSoLk8YgYT+cVSRHGaTXJgTK0fJmbThcrXwVoY9hNfKD8iHYVoAUY89Ka5gWvkVa25w0XiZJsWDZzBPz7hFlCYVe1Y6R+7OR1Aj2c+5G0rN1FTqFgX/jnYiDU5e6tzs2gZz8+mp/oJrYoEVDol3aPXRGczxZMA2kS4HaNdNWK+yut7lE8ZgFVTuni2xzCmVgRe5XPkqxWcSqvcDFAIMTUpNWXdkKNR2xuMPs0C9p4YMERcVYVgnhpOu6ywU3qd6OSTFT+nEEg9KpGb6ckAIEbeDC8PEzQLMJMTfqaODSWzYoMayOKfYRCQ1eRZQ0/9TSAqgrDfivDdEWiY9+0aVbPd3C8daeyD0+gtjtQZIsYR6SyghkhEnDx8qN677K+R1tPD+o1UGxqh/RT8+lT6zvWOcVwwnbDp1Q7nmNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk5ab0dtOVVxSW12YlJBdDZYNmdnWGtGUjNka0V4dk95QkxVMVArOHlxS25O?=
 =?utf-8?B?YkxNNnFmdklkZUhOak1LcDRWVFllVkxZSEpiVmZyUTN0dzN5S2pXTGNGNGI5?=
 =?utf-8?B?Q0ZiQnVuUUx2ZnBBQTFkSXBDdHFqaSswbHo3cFZWN2JFTnRaNUx5KzB3OG5a?=
 =?utf-8?B?UDl1WVNBUU9wMjl4UUtsdXVtUnJ4TnhrTTROOUpXUTU5eit0MUs4Y3lHMUdl?=
 =?utf-8?B?aWt4Wk10bm42RTJTUkJONzdXVG9RVGdETkhaOWthZG44bXhmYVNOb1Fob1pt?=
 =?utf-8?B?bzhTQ3o1Ulh3MmpWUTQ0ckw0SE5EVzh1SWk0SkxRZi9adjNiaTVXeWdlV2Nq?=
 =?utf-8?B?cXl5TGdUT09kcXpCRStQaW1OcmJCMDkyNzdmdFVxc2ZEd2FteHJlaWhpcHlN?=
 =?utf-8?B?WDRqZ3p2bldLVlI5SVRLNXFEM09GYkhNN3plYjd1WVA3R3Y5VERlckhhcnZT?=
 =?utf-8?B?RWlJNkgrNTZpM2ZkY3BHWVJnbnEzQjlRTkFHbXA2OVJLRkdBeGt4RGg5THVH?=
 =?utf-8?B?ZFl6dWdHUTZPclFzMkd5Y1UxWFBzSnJCV1BiSGFmc1ArN21LdFR5MFhERUFs?=
 =?utf-8?B?NHU1MTZYN2djS0NvenlKS3pzbE1hVFNIS3FlMklaeU9aNHhwTjR4UG9YY05B?=
 =?utf-8?B?UmpZZVlZa1drOUswNi92ZEFXaTliVXljWU1KOVVPald0eFR2QlcxK2JBaUxw?=
 =?utf-8?B?WW1IcXlQUk9mWFNxUnBmQldwNVlXWkZtMUowTFo3TFd3MHpFVEs1ckVHc3JU?=
 =?utf-8?B?Tnl0dFp3cnhnWjBTY3J1N3JabVZlWGx1YjEvMk5GYURvQTR0eS9SRE9ISDc2?=
 =?utf-8?B?Tm41QzZlUGloN0xYUGZZNCtWWG52Sm5nRTMvS01WTXNpYktTZ1QyQXdLQkNp?=
 =?utf-8?B?bVY2TTBYdXVCcnNUalBQaGZOSWxGeGhMTGFrQVJ0SElJQ2t5a0lwZlRnMEhL?=
 =?utf-8?B?aGxXSE5CL002cDE1K0UxRm94c1cyR01ZcHh5Y0FNOVpPUFNaUmRodzl1RDc4?=
 =?utf-8?B?YXNWdkFJU2trRmhQcktKb3ROYnNwdzBVVnJMVHRvYk44V2ZVR1E4Q0pXSlJq?=
 =?utf-8?B?N3YvTk9YZ05PbXZ5cEVVdlVQdlZZSDRwTE9wc1dhZmZNVy83M3c5OXBqamJm?=
 =?utf-8?B?UW5IalRnN3E4Tkl6aTIvQlZnblRScVg3b2lFbDd1eCtuU2hpTUs3WkFwemlZ?=
 =?utf-8?B?T0NwSHZHd1dKQmE2T3hBeGQydWpDK1hjVEo4U3NyRmtwd0hUd3ZZOVZUVDFr?=
 =?utf-8?B?dk5zMjFXdWQxcnByYWNYVEl2dHJ6TVdwck5tbDAzeUlDb0hMVHI2bk9PNitu?=
 =?utf-8?B?UWxYRzBRdEdFbTVpaWlwQmVVamxMbDBzeElPbEhKV0dOSzh3V1dxRFAzYjNG?=
 =?utf-8?B?aElIZ0NMdzdwa25YQUwwZmhRVHBEV1hCbkhPZ3VadzNTVDZFK1JMVkVNT044?=
 =?utf-8?B?ZXpOUkVUc3o5Y215VTlxcWNEb0s2bE1pYnVEaE1zRnErdXByaGJGL1h5dVVE?=
 =?utf-8?B?cms4U1JnZ0ViTVhTcU1leVNoSGtqbFFqOW45cEN4N1RjRUtzRzNjcmNaY1FP?=
 =?utf-8?B?RFp6R3ljaTVMMEFNRS85cXl2bUZjQ3JDeis2YTI5cCtrYUtnVkhaUmpQQ1hr?=
 =?utf-8?B?ekQvbHNKZHhNS1AzcEdXZGlOcWNvUmN4VGUzcHFBNGdic0lUaDZ5aGkyUmRs?=
 =?utf-8?B?YUNxRTVKaHY3aHlSemsxVzMycnk5ckFWd3VUTUxBajFES3YvanNWNWF4MXRa?=
 =?utf-8?B?b2s5b040R0tSZWhIZ25SZnM2ck5kaHdJWi9hWWYwNFhFaFVyRlY3dDl4b0Va?=
 =?utf-8?B?akNxMUdNUzZRNFNDRG83WXBHTlFGZEI0dU1WUmM2MTNZa3VNUnR3KzZyNWlQ?=
 =?utf-8?B?SHlwZ1BUMGxBSGo5ZXNId09Pc25MZXdrSm5ycUZmWk8xQys2WUtXc0Q1aUtD?=
 =?utf-8?B?Q0VHRFhFVFlmSUg4dzlsYmp1K3BWVVJvZXkxSVFnUXFzT1pnaGNKVE95dW0r?=
 =?utf-8?B?RHZvL1NaSHFBK09qbVViK203MVdaaXVqbFZqR3JYb0xIc3JUQ2c2Ni9uaWNL?=
 =?utf-8?B?VG5BaklRU3NIczRZNHVIMGEwVEUzQ0lJVENNM0lhVHJkQU1rN0hpMks3dzI3?=
 =?utf-8?B?b2FTNGZ5MFRVNE9XTDVXNTBQS2VaY0hPQm91VnIxeENmS0pNbVFvOFJYYW9k?=
 =?utf-8?B?eVlUeXoxMFV3eWsyNzVPUUI2ODkzY0JjYkpJQS9RdTN1VWhyVStQQlhHdVR3?=
 =?utf-8?B?cm5qRGRyUHl6WTJHRmpoSDFGYmJhcUhmK3JNcUtNdjRlNmpTdGhicW0ya1Y0?=
 =?utf-8?B?eTRlcHlzcmM5WkhYczlwK3Z6NjlZWWkvaWdhdDdJS0VLVWZEdE16YThSUWxv?=
 =?utf-8?Q?KIzSy81D/inkBECY=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e5deb206-2f55-45d8-590e-08dee1795009
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 07:27:08.4796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inLEqRqH6CO8d1t7hg7vQ10LGC5r2vo9GvEr5eN2s3DR2HfTGzdG2hrf6HHPYM/G+5XFyiBaoVl0vC1imcc00ee8RElUWUZRVDEhDzwZ1sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5310

On 05.05.26 17:53, Frank Li wrote:
> 
> On Thu, 22 Jan 2026 17:19:12 +0530, Pankaj Gupta wrote:
>> The NXP's i.MX EdgeLock Enclave, a HW IP creating an embedded secure
>> enclave within the SoC boundary to enable features like
>> - HSM
>> - SHE
>> - V2X
>>
>> Communicates via message unit with linux kernel. This driver is
>> enables communication ensuring well defined message sequence protocol
>> between Application Core and enclave's firmware.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] Documentation/firmware: add imx/se to other_interfaces
>       commit: 3b4531c6e0f4c8874f0266853a410438eda1fc24
> [2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
>       commit: 4d7bcf0869686d7d7fbf16244453b987e5ca6d14
> [3/7] firmware: imx: add driver for NXP EdgeLock Enclave
>       commit: 338529a73c2bf2c277013b745cfe6f19b84b70af
> [4/7] firmware: imx: device context dedicated to priv
>       commit: 2d733ed67f608ee85abb854157011f88d7f280a8
> [5/7] firmware: drivers: imx: adds miscdev
>       commit: 4de71839142b5f43846e3593f4eb236e1d733885
What happened to these patches?

They were part of linux-next for quite some time (up to next-20260630)
and then they disappeared (missing in next-20260701).

I didn't find any hint where or why they were dropped.
