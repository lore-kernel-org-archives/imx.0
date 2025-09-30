Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023100.outbound.protection.outlook.com [40.107.159.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215E52222B4
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759223408; cv=fail; b=R6nCDxFszfDWfnbqfS1wo39ARQNBPu5gIo9ENwKMQjQ0V2OmQh6iGu586lnznUolqHKjUxQ6X6sJiJ2Lp81tIDDFzUjXlNuACzl05NA+WoMJMEoZY7BKXPsz/uQNhef827kWBx7igh/l0JIdXbUAkbl4ZfNW9FSc9nwwkql+p/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759223408; c=relaxed/simple;
	bh=TaUSVDXfeA0z+P4HFmBqG/xtukkxfvqgZRI6/Fu9gKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZVg0lE56M2+Rxn6CuV2MlCUBbe2p1Zex8Xsb9t8lJGu2+yhdl52OGPjy8kOdZSOttkGWhbddDq4ihp/oXOkuz1tYgAYzFFNdCpRcPIUSij2ePgPqIeSUK3+jylsLnGG8RumpyF9ZSddYF/Y6WKm3mXrcVyOvSULnjOhjUlV2vhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=sv1+34Zh; arc=fail smtp.client-ip=40.107.159.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="sv1+34Zh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXiWMoyiWaBFSI51P0mMnGxu54iFHc+1+FOb5k8ndTkh+31vVGO8vTIIHXQP6Jz3WdiTjW5QxkY6syjPOoHXra2pGsdEMhfIiMaOUlPbnz9PNKU/M6HwN+6zYE5u1p8eWztZjn98E3Lv1o7gQKkpP/l29SqwkWmXZMlZFohirs0RI1NyapZRAy2UUOcbzx3kxhBoPvALCnHBTIzf++w6DywymweC5UuZGrCgn2Uv/Qv4tBGZmYozkaX9DJO+7qo2MBAw2n6I/icUhVtPnj8YDMPFnAznnVdwhWkN/OGY/Z6w3YFuIshiEQ1hXo9wHBg5xc9BXJz6P/t9G0MMwdoyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaUSVDXfeA0z+P4HFmBqG/xtukkxfvqgZRI6/Fu9gKo=;
 b=MolN/rogB/J9X7oSilx5gbBa86b7hKI/9nhjImR2FKp6gv1DCNyWZeKx6oHwQAjiwoN95ZcqJ9lBGwhMi2xouECYWJTsfsIQmK06DyQ+qIruRCieywU/W4aXQhc36QGt7udgtEL/AXmSOab1BlVpD8hWOKLrvboD6IqaQLpr+8qqx3AUopYssRg9XTa0bWT/JsON5CJiwWg6EnHk/ePgJYAj0D9WPceOfCsj5NCIw/twImjtAY33DXgKGNjwNIPLEhE6/F0CxAFQWs5XxLJ+IHanrScNjJEFArS+wJnxl5jb4aj5ZoZWHFl1KAVg5N24vPf+jMxI6rsuorLoakR3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaUSVDXfeA0z+P4HFmBqG/xtukkxfvqgZRI6/Fu9gKo=;
 b=sv1+34Zhns6oVqdzwepq3ObKeEnGsG/Mml9N7f09ldW9aBiA1MdlawX3oJh+ohRuXdUdj2MGGQVOIqXPcAOm7e4urxLqzxwTftjiSYol5qscUxhMGPxCGHVR2lhqNwOgWUivZ6qKXQDjVaKR8Gkfwy5Ffe7W9PsucPaHetRAa9nyU9cig6/R3t3ipG0kMvfxQZ7oWtfwpRNvxg0fpIKG4ssWVKrCh/kMslRAcoDatL0ZanBjjoj3yoxong3fnZ3U7MvOUYY3Ziu14ctN499LW/5Bls+BUQBLlte7tdXdRRJQfjMsYn0TYqQ4Wt44giCAq8iym/NPLIqzm0OxWD39bg==
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:297::14)
 by DU0P195MB2174.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:473::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 09:09:59 +0000
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56]) by DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 09:09:59 +0000
From: Teresa Remmet <t.remmet@phytec.de>
To: Janine Hagemann <j.hagemann@phytec.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Jan Remmet <j.remmet@phytec.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix
 audio codec reset pin ctl
Thread-Topic: [PATCH 6/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix
 audio codec reset pin ctl
Thread-Index: AQHcMdYu+fhehhgisEu8OdNal+aIhLSrcFGA
Date: Tue, 30 Sep 2025 09:09:59 +0000
Message-ID: <e4125165e213e476eb4d226f0a4c943fddad7f56.camel@phytec.de>
References:
 <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
	 <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-6-d5d03ccbfca1@phytec.de>
In-Reply-To:
 <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-6-d5d03ccbfca1@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P195MB1228:EE_|DU0P195MB2174:EE_
x-ms-office365-filtering-correlation-id: b656ff39-98ec-4625-a549-08de000121f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHd5Vkg1VzVEME1xaDZ4am84K1h0VVcwa0ppQjdUV0dQRnhOQXRadUdCWDNN?=
 =?utf-8?B?czJQVlBaSlpvWHBOZ0tPRk16T0pHYlVERzBEcjBEYnhCdkRzaWJ3VTVzRWRt?=
 =?utf-8?B?R3ZXeFhNZEIrWXRKZ29DeTBLSmk1c0k2eW1EQXBkL1dUSFhVc1djcmNSQXRt?=
 =?utf-8?B?VzVReU9zYld4bDZhMVZpTWFJVTcrKytYM0V4WWovUHUrK2prcjFZMjlWYXFD?=
 =?utf-8?B?YTFpeHBFL3dBY01MMWNzZ3BCR2hYaEtVU1VpMS9pN05IMkRZUk9QOE1ZL1Bz?=
 =?utf-8?B?RnhIdUZ5akZRb2NmaDdZOW13cER0RDRScVVwR20xRDJvS2cza2s2b1lzOEdP?=
 =?utf-8?B?a0RNcEtLMCthRGFQQ2hBalRzZUtZQ09NT0VlSkx4bzRGNElnV2NZdmlxcWFK?=
 =?utf-8?B?V0NJb1VOVWx3cldXbmdaVlMwMFhLVmZiVE1hNkRab29KbHYyc3pmT05LdXQw?=
 =?utf-8?B?eHNaamxYSGY0dTRQaVpxNTZtYnlvaVd1aTVMT0NHek5mR21SbUdlZnVhNm1G?=
 =?utf-8?B?YWdlRkhwMld5YjBQOEovclk4TjhjdFI5bm9nQ2poSU9XZW5aS1NUL0JONTds?=
 =?utf-8?B?d1pPNndERVJvOVRCdHZZS0xpNXFZSk9RY2JIZWlKSS9OTFFLNXo2eEtMVU4r?=
 =?utf-8?B?RXNrMzU1SEtrVnV5OFNmZXNZRUI3MktRZ2R1Sm5zeHVXby9sVFV3QWZ3Wjhl?=
 =?utf-8?B?bzdpaitCbmNEU2ZMZGJCU25oMjBJc1NzSGg0bHZoVDIrWWpRay9ONkdTN2Vs?=
 =?utf-8?B?UTUwRUhOOGlPeTlKaFlUdFJ0K1lvVTh1MHlDdnpCYnh4Q1ROWStLbUdJS1E5?=
 =?utf-8?B?RmpFYW8xMnlJWEt3MllQcEgyc0MrSnU2ZHExQWY2aUk3M1kwWkduR1A1OEY4?=
 =?utf-8?B?bDdVVG1vR0FQeHNBek1zMWszQkVWMXBHQ1B2VDFsWWl1OGhNenErdUpHY1BV?=
 =?utf-8?B?TGNBV1A2cndnc3B4N0pJQ3JnOHZ6b2dUYXQwOVlBRWN6MFpFMnJlTUpkc1Js?=
 =?utf-8?B?MFI2QTM3c0NYem5BRmwxMG1vdFZrKzlSbWVRcmJWZW9LL3BpK0VJUXVRQjBB?=
 =?utf-8?B?RXA4WTFMR04wVzdCbDdWOWdML2wyTnRRTndXOHduSDRyOXIzNEpzdFk5dmxK?=
 =?utf-8?B?QjVBQUpsWFdiRXpQemlDVHhwT3paWXBXWGwwTTFNQ3NBMWl4RUxtNzhDK1hi?=
 =?utf-8?B?UG9reDRkNXVUVWJCaUxKR0orUForempXaml2NmFCYndYNVd6SHBKRVBXSXRC?=
 =?utf-8?B?VzJDNkQ3UERGcXJ0Y3FTenZCRjI5MFR1SUsrV2FpelBkemFWZ2xzU2ZpL3dr?=
 =?utf-8?B?UWN6SjR0L1luSURZUnFZWGREblduTEVBNHlZS09IcHE0U0JQTzlZazhrY2o0?=
 =?utf-8?B?Z09pZTZTNXBaMjJhdk9IRjg3UXZFU0xuOW90dEJBTTZUS2pBdU5hT1FtYm1r?=
 =?utf-8?B?bTdqdjk2eGJLTnltb2c5OTJOM1pXM0p4V0czdjRYTEJhTXZSbmlvK0kxQ3ZD?=
 =?utf-8?B?bit6TFljYnBNZ0dOeTRmS2R3QytJaERaRVFsVkVSa0NOQU93b1lJWmxXcUJi?=
 =?utf-8?B?ZGpEZ0R5UkE2Y2JOL2pJMzVMRFZRSThhaTJrSEdUcndkdDZpVUw3L0FlSEtY?=
 =?utf-8?B?dHJKKzBMeW5iQVp0N0F3Z0J0dklwM2Q1WHF0N1BxV215V0kvd3MvMHZVeVFu?=
 =?utf-8?B?Um1nN050ZEVQL3JEZnpDZGxRajZ3VEZ1T003RVFFMHZtQVlIWVA2bGJ2cjFr?=
 =?utf-8?B?SmdPcHRSQ0tRSFd3enZUdlZWb0M4ZWNMTFNvb3pIUHhXditaWlB6Lys0RFlW?=
 =?utf-8?B?SzdybEpOSUdSZ3pHeG9qL1N1MXBHaC9tM3l5VXBZMHlFTVBmK2hCM2pUZTdQ?=
 =?utf-8?B?M241R2ZOOUZlK2x0RnRwSkxEWmtWUXRKNEFvUndnNjVyOXZEcnFoQXdRU0h0?=
 =?utf-8?B?b2FGUjY3WGYrbmJ1cktKTzQzVFlCY0ZtUitpVkVDVjJlcFB0UmNIRU51TkR1?=
 =?utf-8?B?azAwcjBhRE4rZmdOWDBYVWlIMEhrREtzTCt4NnJNUUxBdjFWTzY0RmNySTBs?=
 =?utf-8?Q?rSF621?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1228.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHMwQkx3d1R1K1V4VWF4dmM1U0djS01xUTZxTm5UWnUxTUdvUDdmREpRQ0ht?=
 =?utf-8?B?VjZUdlFKcndRRWdzR3NiYVJsWjQ0d3BIR2JsVlNIamI4bU1iMVFkUk5MeVF2?=
 =?utf-8?B?R0VGWGF5NzJ2MWhFQVVMaEJGRytWODR5Q3FYWWZPTHZITy8wSHVKNXdlRjZj?=
 =?utf-8?B?WGpZcVZXOVFYWFVYL2x6N1FJOWcrbzQxSythZ3JBMUVBOTdXaWo4cUl4WGRa?=
 =?utf-8?B?UWdNQ3VOWUlhNkR5Um1TSzRuKzJHZjdPM1k1QjRJVWJ6VzNpaVRucW1kWEgw?=
 =?utf-8?B?dHJ2c1g0RTY4OWl4U3Fadk5uUU44UUJ3eXV2RzlJQ29JSW4vYjVaYlVKM1dy?=
 =?utf-8?B?L1orbG44TG9LZThkVFdpRVlMdit5NkErK0hhcFd3d2U0WTMrR2RmVnVITm93?=
 =?utf-8?B?ZjVHVkFQU0tJUWVLbWxUMjFXcUEzQytONjBaNzJIcGQ2NVhNV2ZCbXZ0MWlL?=
 =?utf-8?B?djkvNTBkQjluZzlYRjRuNEt3bWw3T0lLekN1MVNkRU9zWEJxa3E4VnhWeTBQ?=
 =?utf-8?B?MmxpQkQ5WWc3bWtpbm9aTE9QS1dKY0RuYVJSbllKQ0ZPNkU1dm1sQzJmWWNM?=
 =?utf-8?B?ekdJWGZPamhaa1E0TW5VbmJmMkZyaFlndUs4Y3hlOUkvUTRpazU1bjNUOFZr?=
 =?utf-8?B?NG84OFlSUmlVL2dOcjltV0wyejF0a2VET25kRzduRDJUSXlDZnBUYXFiNmpG?=
 =?utf-8?B?ZVgwTGhBc1NHV1pUS0xPVG0vTGMxNnhNRnVYbjFsYm04VEQ1Y1RzM2l1OTNK?=
 =?utf-8?B?NHZFaXFGbUNBaUlYRFZiT3VPYUdtRll4d3VHRVZvR09iZk5EWXNTYnhkRG0r?=
 =?utf-8?B?Y2EvenJGb2lHUUtaNUw5dUdsaGsyaUo5dGJFNkt6dU56LzNubzB3SG1hWGNB?=
 =?utf-8?B?blpNYTFvcVpBR0t1amFtdkw4UEtnYnkvL2tiWFppQTB4bk16L1JSZVNpK0xr?=
 =?utf-8?B?WDJvM3dhbE9IQnRFVE1lRURnTWVjOG5HR0hQQS9wekhHOVVEOUY3c2tNWmRk?=
 =?utf-8?B?ckxJVUNJVHZEc0JIVm5aNlJ0cjltSGxlRXhwdmdFRjBETGdDWFpNZm9vNGtJ?=
 =?utf-8?B?TW5YUm5HcmNzaHYxd3Ryak40MENhTGRqZDNyKzBtd083UmZmSUFEOWUzWmFv?=
 =?utf-8?B?NnBkNWNkOWJ4b2pvMlp3Vnl4NjJESUpTSS9WcmY5TzlMTUlvTXppRVB3TGRw?=
 =?utf-8?B?UDZyYU9mV1QvL2Z1OXZXbVBHblFyMjdXc0VhYks3d2VwTEdNczhQM3dsT0tN?=
 =?utf-8?B?M2pUMFo5UDRueGpGQWVUYllVenhNWmRqRXRNRkcrb3dRSDFnVCtCQ2dKdWRj?=
 =?utf-8?B?VWhRV1F4RFhJTEIvV1NobVhPenJNcHUrRkl4RXdwaWJ5LzVxVUJ1NXJoa2Vu?=
 =?utf-8?B?MHRhbU54T01NaytxRXJwSktxcG11TmNKNm9RSE1UM3BIL2JvUk0ybGxVTU5Q?=
 =?utf-8?B?OWliaExMYjl6Vjg4cUFTcHlYNnR5RHNLYUVCT1JYSGNESDQ0eHhMd2R4Rlhk?=
 =?utf-8?B?eDIxbnlESE5UWHlQYzF0RkJ3eWliZElpMlUzZ3RTM213bjZqcXhwbkVzNWlz?=
 =?utf-8?B?UmV0U1dQSFFSM3JWeVhTc1laYThEVGRUOElOcTd3U3VTVFkxVllWVXcyUmdQ?=
 =?utf-8?B?Mk5JNUMwVEp5VnBFb2txdEZUdS9LM3ZLQWFUSjdyOUF1c3VJUGJzOVFRTWhI?=
 =?utf-8?B?RXpQd3Brbjh0TDUvcjFaUEZGZDU0bENZemNqMVZFb2dYd0FqYitqVSswRDBT?=
 =?utf-8?B?aisyUDVkYXdZMkJJZFRiaDhUZDEzd0lsVWlEUzUrcndReE1uRGJwRnluZTUv?=
 =?utf-8?B?b25pdTdyR1cwd0hVNGMzN09HYzRab0gxTHNVME9tZ1dwb2ROdmIxVVhVSTVJ?=
 =?utf-8?B?SnFyc2c5TXBoV2xndGdlWDdkVWtScTNrWWpMM2JmTjRZQWF6NXZCL2FFa05W?=
 =?utf-8?B?ZVgzV0dTTTVXemFLUk9MYkVuUWlrdmFueGFBS3UrQlc5RWgydVlvc2MyR0dz?=
 =?utf-8?B?VjZkUGljWUpCSURuMlYvb3J5VVdBTUxNanZVM0c4UDkzZFZTUzRHV0pzKzRT?=
 =?utf-8?B?a05jTEJTaDNpSXdSVG9odGdHMW9ZZnFzNER6aWI2VjA0U1hPaDFRTUQzcHJ2?=
 =?utf-8?Q?S3BqiYA5ns/i/rciO8QyP4io5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80511B876DE4D641A29639408301E800@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b656ff39-98ec-4625-a549-08de000121f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 09:09:59.8006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c17tr0oS5vQwpMSUVVYqQh58zu8EIF5vU9O/peks0BTu9JmsG9PEQposzgrTIMQQRg6pQ79s5DO4GOfOLpP53w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2174

QW0gRGllbnN0YWcsIGRlbSAzMC4wOS4yMDI1IHVtIDA4OjQ3ICswMjAwIHNjaHJpZWIgSmFuIFJl
bW1ldDoKPiBGcm9tOiBUZXJlc2EgUmVtbWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+Cj4gCj4gRW5h
YmxlIGludGVybmFsIHB1bGwgdXAgb2YgdGhlIGFjdGl2ZSBsb3cgYXVkaW8gY29kZWMgcmVzZXQg
cGluLgo+IE90aGVyd2lzZSB0aGUgYXVkaW8gY29kZWMgZG9lcyBub3QgcmVzZXQgcHJvcGVybHkg
YW5kIGlzIG5vdCB3b3JraW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRlcmVzYSBSZW1tZXQgPHQu
cmVtbWV0QHBoeXRlYy5kZT4KClBsZWFzZSBhZGQgeW91ciBTaWduZWQtb2ZmLWJ5IEphbi4KClRl
cmVzYQoKPiAtLS0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHli
b2FyZC1wb2xpcy1wZWItYXYtMTAuZHRzaSB8Cj4gMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1wZWItCj4gYXYtMTAuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1w
ZWItCj4gYXYtMTAuZHRzaQo+IGluZGV4Cj4gM2Q0ZmZlZWNiOGRkOGU2ZjdhNjhlZWFmYmE3NjE1
MzRmYWU5ZGViNC4uYmQxZjI1NWUxNWVhOTViNmY1OWUyYzdiZDc2Cj4gMmQ2YTZhMmI0YWI3NiAx
MDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9h
cmQtcG9saXMtcGViLWF2LQo+IDEwLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4bW0tcGh5Ym9hcmQtcG9saXMtcGViLWF2LQo+IDEwLmR0c2kKPiBAQCAtMTgy
LDcgKzE4Miw3IEBAIE1YOE1NX0lPTVVYQ19TQUk1X1JYRDNfU0FJNV9UWF9EQVRBMMKgwqDCoCAw
eGQ2Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcGluY3RybF90bHYzMjA6IHRsdjMyMGdycCB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmc2wscGlucyA9IDwKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1YOE1NX0lPTVVYQ19TQUkzX1JY
RlNfR1BJTzRfSU8yOMKgwqDCoMKgwqDCoCAweDE2Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNWDhNTV9JT01VWENfU0FJM19SWEZTX0dQSU80X0lPMjjC
oMKgwqDCoMKgwqAgMHgxMTYKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBNWDhNTV9JT01VWENfU0FJNV9SWENfR1BJTzNfSU8yMMKgwqDCoMKgwqDCoMKg
IDB4MTYKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD47Cj4gwqDCoMKgwqDCoMKg
wqDCoH07Cj4gCgotLSAKUEhZVEVDIE1lc3N0ZWNobmlrIEdtYkggfCBCYXJjZWxvbmEtQWxsZWUg
MSB8IDU1MTI5IE1haW56LCBHZXJtYW55CgpHZXNjaMOkZnRzZsO8aHJlcjogRGlwbC4tSW5nLiBN
aWNoYWVsIE1pdGV6a2ksIERpcGwuLUluZy4gQm9kbyBIdWJlciwKRGlwbC4tSW5nLiAoRkgpIE1h
cmt1cyBMaWNrZXMgfCBIYW5kZWxzcmVnaXN0ZXIgTWFpbnogSFJCIDQ2NTYgfApGaW5hbnphbXQg
TWFpbnogfCBTdC5Oci4gMjYvNjY1LzAwNjA4LCBERSAxNDkwNTk4NTUK
