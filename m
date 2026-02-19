Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023078.outbound.protection.outlook.com [40.107.162.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1E332EC4
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 07:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487702; cv=fail; b=SjsglyvfO5Z6tI9ANi6HOsEXcHRG7Vl8/D2rl2R2dpBZ50UdUot153TQu7PqHQ0LnOGLvbm+YWAEOvw3+lkV6m1Gf7mgCN65lhy9wBx3U5+vha/Vokkmm8GmSlA08ZdiQGaSs5yHDlA1VvoH7vBK2Tlu8YFqHvCduQcFnw5E9qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487702; c=relaxed/simple;
	bh=AXspg9XbzZyki7PFUdbEyvzLu2Xn7bKOY7aiL0YFWMc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H30JIAzN25uI8Ofw1/L3XJ+RcqFBcIcUqfrunpx9T/V3l1mliSKc634l+mtYIs9Du1JdwSenVAbhPUepq6s4Ttyiy5o4We89dB8yBot2gWAPoTL6W/PAvztteiT50PooS7KH4lrR28/YXF3DNRqdN31ZQGWde/P6XX3yC7EfBLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=ijYce9IA; arc=fail smtp.client-ip=40.107.162.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="ijYce9IA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqwK7KSc86H/7BGiQAMUfuNIaZ/2G/DO/2iw207yePxj9ZQrac47q0U5fAdiRjMRWQMExSDmjmdDs9nhNE1Fpdkm6CSPIaRmmDInlzf8DuZASSBCbwBPI7DO/fr5X6hlf64v1cLrU801s6XtTsCSPJVHE9FcvRlfqsfCHG7lmWWwjKg42b/c0TCFNdRymkEfxVtb1ib6zSHC5ORVmP5qPVg6sd8vZo0/Wv+iSeZFYsDL6hzCZCsZIQI76DpMFAgRNaIVbDDhF7QyqPiSJ7I/NynnrCD3dkEbzb6EjWIPSACgroEKTFcYnWVPpCn2nSglTrqWG/YVyqCMHZLIOmLQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3Yh1d17OvRBUBlVUT5h7vprqCn/EcdD+2Ur38kIsIE=;
 b=Ot6tj1gvP27Z94ZvGKVFgNQ0y4GAF75U89WYmIBV7AVFWDVTVDJNPMGPAC+wuOwxHCgu89d7aG22BCbd65BJR2nLYvTUSsxB9Y/dHeJ3qxe+qwZ9q9kBSxn49v8kqtXx5lBo8BPb9md/6fzStyuFKZsof2aJ9dIuM5J8Ypaz+25FH6xKNNGYRDy4FLLXx1Ol8t5eY5I6V24PYJK3NwtM54ZJVtuFRubYyBXRZEonGJyG0X7GaTjTf+V6CakAYz21YzrtjtvoWg9LBTDlFvQl3M7QGP/1fDHv17jDRn6QkwydtB3PA0mulD3GlrD04YS2hpbc7aQ+TC0jhYL1m1uNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3Yh1d17OvRBUBlVUT5h7vprqCn/EcdD+2Ur38kIsIE=;
 b=ijYce9IAEsCHnRIrAgd8Esue6TE7NAKBQmB7KVGle13Q1OeDf+2NImu3gcbRyh59V6bgDjL4tkvVWS57bEDCr2ga8mg67/o1sw/v3Tv68j2/siTzNS+pUA/QmpfyadzFCtetjjmyQIuTPoC5rgDUjChX7CVme2pv88GNzlfeTpaCWcixiU7P5JZgM3LLkUKDW4InP26ijsKbY3Qn1pJmUJSrqjecb3WXpQGxmUeJTim9jn91+NugYYygD5u+YjrH7AiXSn2n3zjYqvjeoETnAL3IS01TWOEz410UNGxKKnu3gkNuA0ArKdKv1yzrQ+CzQX5jpwkbd1IteUu4gjX5cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS5PR10MB8103.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:652::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 19 Feb
 2026 07:54:55 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%5]) with mapi id 15.20.9611.012; Thu, 19 Feb 2026
 07:54:55 +0000
Message-ID: <eff7e6c7-77aa-40db-a115-3c8366f1ed0d@kontron.de>
Date: Thu, 19 Feb 2026 08:54:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC
 and RTC
To: Frank Li <Frank.li@nxp.com>, Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Annette Kobou <annette.kobou@kontron.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260218132519.74570-1-frieder@fris.de>
 <20260218132519.74570-4-frieder@fris.de>
 <aZXwdC0R1gzwVqeU@lizhi-Precision-Tower-5810>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <aZXwdC0R1gzwVqeU@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::12) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS5PR10MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c40655-1377-414d-8522-08de6f8c2bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cThTUXNrTmVpVHRGUFFGSDdQN2c1UnpFTGtxWktRUEdCNko0NkNKODdXL3Fo?=
 =?utf-8?B?WTEyK3E4dGxURnk1bFNVLzBpN2hZUDNlZGRqV3hrT1NZM2JJdTlabUt1NG5U?=
 =?utf-8?B?eHRVb2xuSURBMnh1WE02MnlNSzR2UmE2ek9LL3hTM2hnKzE2TnZYVjNvbDYz?=
 =?utf-8?B?V05sQmwrczRCMmhaZCthWWlmSTV1dFhJaG9na3JWT2RNbGswRmVlZTRLNC84?=
 =?utf-8?B?OTJFWjBDSTc5aytJWkRYOVNEaXNjRUxvNm91VW1JTThOcExYNCtLdVhTOHlk?=
 =?utf-8?B?WUJlYVQ4Z3BGRzcraFdWVDNJTTE1cExDbHNxMmlxVkFSQldaTGsrYmFUSnlZ?=
 =?utf-8?B?b1J2MnhHMmxsdHJZTTRFM0o5UEVZYkNwWGxTRFl2YmZkYXpjSit5Z0VkTWVk?=
 =?utf-8?B?TnRiZXBJbEJNdktMUU5ROStENExCQ3lLMS9VZFgzSlJ1R1ZVbFpmTWJieDg4?=
 =?utf-8?B?SmV1Z1lCb1lmRkhXR3cwNGlDSG82SDhrREp5WFVZclhIRjV0b3BkOHhWRXJ6?=
 =?utf-8?B?REEvaTlmbWRYZ251NXVtd09rS2VxUXl4U1JJdTZPMHRmZ1BJR3gxWnNPVmpR?=
 =?utf-8?B?dXRHMzIrdUpSWVByUTlDYnZZc2lZaVprdTF6VjNlcXUyUWVET0hFZWNmKzdV?=
 =?utf-8?B?VmdtLzZaekJlMmorZUhaTGZRWmEybDErdFB1b2UxQTcvSDFLSzZUNGJZR1Bs?=
 =?utf-8?B?Q1ljcG1nNkRWMlNQK1g5UVdiNkhhZWxUTkFKWGxLandsS2Y1MTBsbXcrdndD?=
 =?utf-8?B?ZXk0cGtNRzlZMWZnTjFUdmNXenFaMm9pbzNOYVE1MFpISk1zZitnekhrSW9G?=
 =?utf-8?B?ODZYMFVzSkg3WFNNeVE5U1plaFFqSFFXcmlTRkhiT1ZKMjNjSVBWUVR4anVR?=
 =?utf-8?B?RHpnNmhxUzgzR0NwTjhmRVE5bGI3ZXFON0lFcXZySE1HMTB6NVJWNmRDa1Z3?=
 =?utf-8?B?aEc0dzJFWUtoUnY1azNVRHZyRlQwVzlGZ2tQQTk1ek9zN2JNcWtzanhUR3o4?=
 =?utf-8?B?V3craFN5TUJWeEZwS0hQYXJpL1hiLzV2ZUxieVd6eEtVSXM1eGFiOWJ5Tm5l?=
 =?utf-8?B?N0dhNU83SFpBNjk5NG1Gd0IxVzNwV2d4VFNRUjRnbzBZMHVZelhwTWk1RW9x?=
 =?utf-8?B?R3pob0NiQkh0ZVNBaWYxYVBsanRVblhRVUgvRjFQa0xjMWtCcXpxaWJGMXV6?=
 =?utf-8?B?YXZhMUJPWEVmckg0Kzg0TGgvM3pHbVdrRThmYktEbnVZN3ZTakRUa3NQUzdq?=
 =?utf-8?B?RDRQVExESGFqQW0wZW1ZTkJISE9iTHpoNUgyMkREK2JKQlR1WUR2QVgwNUZU?=
 =?utf-8?B?MnRBUDdmTURoTDRENnl5VUVUMXdtdEFoQmFXeE1HeFlmZ2RBaVVGMUt6OXF2?=
 =?utf-8?B?dFdrYU1kWTV6V2xFZ1Z1bWg5TmMwZDJ5T2RHL1JDb2RPaWFlZ25HYUlJMlFU?=
 =?utf-8?B?QzJkTUxyQW5vcGFLMElvd210Z0NhT3B5UURLYU9HVFBIc29qbGZXSUtUMTFC?=
 =?utf-8?B?YlRiRjZTOWtGQ2s0SS9rSzVRdlp5UHNuZHF2aDhWbGhwaW0xcjRmaks1WkpT?=
 =?utf-8?B?UEJLSG9JaUNSZmxUL3VFTjFVcm9Ta0gvWDFTUklhdWtWQ0lneTZpbTdiUmhS?=
 =?utf-8?B?QksvcmJwNVFzVXdwUGdHdE9VVnlFYkgxVGwzVXQ5WDdqZ1MzTU43SmJPdHF6?=
 =?utf-8?B?TmhVc2x3K1c1azNvMlc3NklDTXhjTkFiT0QyS2dBR2U2MVRkRHpIbFBzZVFh?=
 =?utf-8?B?S1ZRY1ZVQjJLUFlET1Q0UWFHOEVxcXlsbnovY2E0d3diUFdWbjF1YkFXQ1lm?=
 =?utf-8?B?NUFSUmpvc1VXVjJaKzl2MnkyZnNrRHF0VEgwTDJRdUVTd013a2FWZXB5L1Jk?=
 =?utf-8?B?Uk5HMnJ5RElQNTVDK3IwejEwZjVRTGFaUjVSNFBraFFyQ3ZnYU5ZWjlmR2x6?=
 =?utf-8?B?MUhiOGMwRENmOXgyeFd3a09CTzEwaXFNcXV0STFneU0wU2wvWHVnTWJ2R0Rh?=
 =?utf-8?B?YkdUbjNBTnlnR3VHaVhVUkE2d2FuaE9hQTNaRTFzMzNhT1RrVjI3Y0N5MEd1?=
 =?utf-8?B?VGN1M1BWcHVBOUxJZ0F2UXR4QmptTElWcVVvU1J2cHJlbVFMaEtlOVJjeHBi?=
 =?utf-8?Q?fsAo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDdnb0MxbGREQzZJSTUyODAzRGVScWlYQU15UVdKTEFpRTlxSmgxT1RNSm44?=
 =?utf-8?B?RFJ1Z0Q0WXdJZXJhQi9URFpXMUV0c3cvQ2pYbzRuYkdKNXBuZXZ3K3JpcGZ4?=
 =?utf-8?B?RDJ3eFVTbXJqTkZrVnRtNDRWclF4WUk1Wk5Cb2ZKbm9YaDF6UmVUSEpndVYx?=
 =?utf-8?B?SU52eGkxODFOdTQ2RGlnd0Jrem55WVE2TnRvaVhvcWJLOXNOMGNmamFHT1VF?=
 =?utf-8?B?QnV5NGRYc3VwYnV2WlFoWU1UVVhnWFB5QjVldTM1aWs5ZGs0bEZyK1QyRDNJ?=
 =?utf-8?B?U0tCTUJINC9ZODV6ZFRpTUJ4eXNqcmUzNExOT0Fia0hLaVRzWVduTjd6b21S?=
 =?utf-8?B?elJ5VU1aY1NJdUlKdjdKZ0JRQW5nTFQ3WXhBYllMNWhBeTkvU2xMR1NIb0RV?=
 =?utf-8?B?azF3d244VGpybGJwYWxkZmozR2xkYlJhTlV3S2FqcXBnQUdzbFV0emQzRVBW?=
 =?utf-8?B?UjlXUUdYeHZBL3BGeXkvVFdMOGtBYXRXeURyNyt4aEUrQzY5V2dyby8yL0k2?=
 =?utf-8?B?MzRjSnNzZVh5b21jd3F2b1Nya043YWJEV2g3dEF6UzFxZW5MQ3daQ2hLY1Ro?=
 =?utf-8?B?cC8zd0x4b0VrUnJDWWRJSTQzcWt6U3o1TWlvVCtRRWc4clY0TU8vem9ITDVC?=
 =?utf-8?B?Qk04SXRIbUQ0UE5wdVdUSDNUYUpZMlhhd0Z5bEFwZGd2dUhrRGhyKy9PaWdJ?=
 =?utf-8?B?T1hWT0g1MlJ3UE1oUmZ5Qld6cFl4b3FhNHMrdC94N3YyQ2JROEVRcGcwU3lW?=
 =?utf-8?B?SDhlalVCZDJMRFZHS2ZPbm5UL1JoNjdtcU5UR3dUcm1sZTF0bXk0YlR6YzNh?=
 =?utf-8?B?MUdxWDJqc3Q0WE1ieGNNQk05UWR6WGhtVmhBM3BjT0xsbm82dFRtaXRsWEFK?=
 =?utf-8?B?aXZDME9iWFhacGNZczh2SldKL1I1eGMxbkVFaDVTRGdTRTFQSEFwSlhCVU50?=
 =?utf-8?B?LzBpQXFZVDgxNndjd0l3Nmd5bnFLbkRRM3VtbEd5WGcvRDZpOWhjbkpsYTRK?=
 =?utf-8?B?VWFjbXB2ZnpTcnUwMGkzbDVYN2pwdlJsZENHWHJzYzhncWM2SFEzZDZRZFNo?=
 =?utf-8?B?a05icHJaV1hNR3N3Q1psOC9PUnAvdWE4VFV5dTllYzFaVkFabERkbWtCM0Jx?=
 =?utf-8?B?bEw3SGJ0eE4rTTJxZUZNZDdXU0xiQlN2NmtKQzVZclp4ZFZ6b09VVU1uejgv?=
 =?utf-8?B?SG9WVmFQZkhFNmttb2RlMkwxaGRJdkFqWHZoVlppL0t0YWJYR2FQdlpGK1V2?=
 =?utf-8?B?bnF3WkFpTGVPZUtzelI1dmY5dkJWY2liV0FIbm5ocFVuY0txcmVRQ0dzaUNB?=
 =?utf-8?B?VlFuNy9lRUVUY1RSbk81dHpLTFQ4dU54OVU2M2xkNjZWVkZkQ3VlR0JESFE0?=
 =?utf-8?B?VzFKSlAxRjBFaXZtT3VxVkQ0ZWE1b2pzZjZ2M0ZwVGM1K1BaTXhPM1JDWjY0?=
 =?utf-8?B?cGlwSGVZNnJWc0tGNk5vOVk0Ym9POUxaOUlQYzNKSG9BV0F0bm9xR1pWMFVU?=
 =?utf-8?B?L2NvQUZ1ODNlL0Iyem5wR1h6TjJyVytCZ2JVMHU3MXFoOTY5OUpoWm5HTlNI?=
 =?utf-8?B?K1hrcWpZZUxiTktRYU8xSkNaS1R3eVU3ZTRjT1ByZU12OE1rTlBzaWxWTVVn?=
 =?utf-8?B?c2hRVVpDN0hUYi8zMmtFUEFac1FKTTAyVkQrT29kVzV0SzZrV05UMVVEb1hI?=
 =?utf-8?B?eEV5TkNMZ0tOUkpQK2FBc3g0UlVCVSt0L3JMV0tWY2VTZkNINlBXRmw0YkZ3?=
 =?utf-8?B?a0gyZHdHME4vZG5IZGRhWVlvalNmTkVyeHRvRWQzazVsZUdGK3labXF1YU5F?=
 =?utf-8?B?TDkrcjc1U2xJSnBiTGZ4ZktBR1oyOXJtNlpGdEQ1RVFNdnZxeUM4eFU2OGZ1?=
 =?utf-8?B?cWMzdGdpdzQ4UzdkZVdobms0OXdxL2tuYmp0a0x4a2N0L2t1UHYvRGw3VTJ1?=
 =?utf-8?B?WlpuR1gwWGRRQlhtQkVPUE96clE5Wk9UVnlydUhZKzVkdU0rR3dEZFI2MWxm?=
 =?utf-8?B?NGwyR3J3blJIZDFYeEo5UnZCZVMzSENjaUJoWEYxc21uN0xhbnhuQm1YY0Qz?=
 =?utf-8?B?dGZ1MnI0RjVuS0tEdzhrTmdaTFhUS2lPR3JUT280TTJoN0V3d0xGd0oybjhS?=
 =?utf-8?B?TTd5QkdGVm9qMUNIdDh4SElOdXJQWlRwOEhJV3F1VURGdHZNRDNMTlFkeDRl?=
 =?utf-8?B?aDlWNFJEUzcwQlVacXEyOVFQWWdNSW1rdThnQkpOYmNuRENiV1IxTjV5U25F?=
 =?utf-8?B?TlJhTFZoTTBoOE8rbVVtVzJYeGNIUW41ZnQxZm9BcUdJWEpsMDEzZUVmR0Ri?=
 =?utf-8?B?WXRsUWVhYlNTZjVQdE5xUHJIaVNPaGw3WGJxM1BDSXc4elhHTk9pajF0TnhS?=
 =?utf-8?Q?NjyljXBZ79YNVU3w=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c40655-1377-414d-8522-08de6f8c2bb9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:54:55.4704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJXCJ++PSJLuZMXgAprpf1krKZt2hGwbCoYnM2KlkkV0ca1MWTtvGCyETPnLBe9kc8PbUZGpBsjj3uZDppj3RIp6bBUxnXe0VfeG+c14r34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8103

On 18.02.26 18:01, Frank Li wrote:
> On Wed, Feb 18, 2026 at 02:25:07PM +0100, Frieder Schrempf wrote:
>> From: Annette Kobou <annette.kobou@kontron.de>
>>
>> The PMIC provides a level-shifter for the I2C lines to the RTC.
>> As the level shifter needs to be enabled before the RTC can be
>> accessed, we need to make sure that the PMIC driver is probed
>> first.
>>
>> As the PMIC also provides the supply voltage for the RTC through
>> the 3.3V regulator, we can simply express this in the DT to
>> create the required dependency.
>>
>> This fixes sporadic boot hangs that occurred when the RTC was
>> accessed before the level-shifter was enabled.
>>
>> Fixes: 946ab10e3f40f ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
>> Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
>> index b97bfeb1c30f8..bc1a261bb000e 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
>> @@ -330,6 +330,12 @@ rv3028: rtc@52 {
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&pinctrl_rtc>;
>>  		interrupts-extended = <&gpio3 24 IRQ_TYPE_LEVEL_LOW>;
>> +		/*
>> +		 * While specifying the vdd-supply is normally not strictly necessary,
>> +		 * here it also makes sure that the PMIC driver enables the level-
>> +		 * shifter for the RTC before the RTC is probed.
>> +		 */
>> +		vdd-supply = <&reg_vdd_3v3>;
> 
> Dose reg_vdd_3v3 controller by gpio, or actually it is level shifter?

As I explained in the commit message, reg_vdd_3v3 is a regulator
provided by the PCA9450 PMIC that feeds the RTC.

At the same time the PCA9450 PMIC also provides a level-shifter that is
used to bring the I2C data lines to the correct level for the RTC.

