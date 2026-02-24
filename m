Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020099.outbound.protection.outlook.com [52.101.84.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC88156F45
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930277; cv=fail; b=tfVtSxXuEa+Vg0ccT57OUwJOwhzMVaahfN0c6l7kIZQdFSgC8MMrn+2OZx3GLeYc/N0TK4j5fzgEp/GvvLZ7lAcNbgqpyWRYRD/bHf5/077ab5bqG9ZgvXN7jOoO9KtHJF+0lfLdjAXB6MNM3pBT+nJZjkQV+OfO/1XHvk2HId8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930277; c=relaxed/simple;
	bh=5bePOVAmdoB6es9kQ/4lrjiGDPhHy/8PB7oTd4nXwoc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K4XB4onJicVuuVRm4HKHAReo482KYp6EGTR20BuukKuWCwoq1pIQywtBjKV2M1t1haAXknQFXDgKZCFwYHhdSgjH0qlN5vcM2kEsdFFbVlzzPbZ9PoxkvvsM4oiTeXw2SDl9hWqqkKuZe8jxeOD8I3FdRbumtKF5+Xj6ac2vBPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=VFKtAkyG; arc=fail smtp.client-ip=52.101.84.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="VFKtAkyG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHUwcuY3EPis1keMUhjLYOHz21qAwzwBdXnNJkHZUogQ0BiGwzt8Wd23JTuYmxPbxmRCc/e+8zTUDhnlqwkAxwGHJCByWqZyMQaGj2IjPey7rhxmz6cxQ9Xiou5ImngLCjQ0a3KtpKGFYNNJtA4Wc7f23XlPnRn4ysuFST2chsHelaWq9fFrPMjJad2UkuRxJGSuzf658kVuTQUuw7pG0Ca16kUCiTcpz/rYXG8m4Y5r+eCoJhksbp6pGZnVEeHcy7ull7uxwL3Tt4+D7Y6I3igTUxn1ka0n1Q1JrVp+0UKKK7vovb2GJh+jiVieKYwd+eqnBH/H+c8/fbPvjPsldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HftUBs8jeBEzSfG2/aJjlRx2ZjD3bCoo8F6qPc0tgG4=;
 b=F7TmISQgNy7vHjHHclPkWWLsQQ7F2k79tlZpsWH//nXg9Q3dlhKtFsnZ8ELCpFi0KN19B4WOB4O44J5Of3EQiTwKwbTTp7uHMsrIO4jKJciffy5dZoowILJi1UV4KjdS2VAIwjSWDQvgePUVF4S+X0w8r+vOr1+IPmLXGDBKg7XiVSDSn6OwsH25u76dmeI7r5TRVlsGxadaVGEoOaiIGaG3BpGVDeuRAYjbmFLsCBHrTTxI1+KAqmkInXj2oVuASFapwYpxlACIWj4+Bskkhj3dfUu1Wpkik9UM18YhACc2vpuUVPQOnmJeGFI4hFfUyXbxwENjxvPKnZS+8kELGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HftUBs8jeBEzSfG2/aJjlRx2ZjD3bCoo8F6qPc0tgG4=;
 b=VFKtAkyGgHP8faDF/lkGA0ydaSrSNSk+XPem8/i8lK5+AEsm1+SuW16h0R+4qQ4TSODihVbFLOWgVvb/Oa7/RK6eP47JIPcgYDp/UQMM7KNNuSKTIFO+xVe3eQfUmYXvNxmslUxQI1INiEXCryJWaS0BbrTnSguJBOmQPs8aP/fYue271gL4sYSxZQqnJboYUFALjeKrxUBipZg4sq4XbpssdOVPv32tPqlW4pvn98eHAC80ycQejauflXQO5e2vTPfRkBfD8oO0vkNzuZgJNeg8fWDSsGt9dFlqyhbXnw2CVWcxa3IdoiFKgLXyGA/peDQrDtjP9NrMBZNFsa8sHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PAVPR10MB7058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:301::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 24 Feb
 2026 10:49:57 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:49:57 +0000
Message-ID: <dd43fdab-831e-450a-b1ee-66d3ca4f33b2@kontron.de>
Date: Tue, 24 Feb 2026 11:49:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <20260122-imx-se-if-v25-3-5c3e3e3b69a8@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260122-imx-se-if-v25-3-5c3e3e3b69a8@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::14) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PAVPR10MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 071afd78-9dc1-4ef8-7c1d-08de73927357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnpLeEdSNnI5UUluWDkreGs2d0UxUU9KYjdJdllFOXdRSUo1ckNUT3J1ZURK?=
 =?utf-8?B?R3U2c0gzTHZjMi9GM2UrQ1ZoT1M1SjMxaWdlUmM2YUpNRDlRT08vN0JmeStN?=
 =?utf-8?B?em41blUvcjhkY2dkSTRpV2tIbFpFQUZsYUxLZWdlVUZiQlI4WGNVS0JramM4?=
 =?utf-8?B?dEc0NnNEUDVDcHJuUnVvVHd1dTArYS9jNUw1YVRqTjdDaDlZY0RvNXBrMjFy?=
 =?utf-8?B?OXZad1ZuMXpTRlJTS2NhUTBPQ2x4MEJUeWY1MnpFQndMMVJ4RU42ZTZkNnhX?=
 =?utf-8?B?RFU5N3REbkh6UkxkVTVXenZMM0dvM3MzVTdVMW9heHRJOEtHc2E3RHlVM0px?=
 =?utf-8?B?RUl5QXVKbVF4cHlrZ3F6NGhOTEZsMm9oa0dIYVNYVXVVaHdjbGIzd1BNMjJt?=
 =?utf-8?B?T0RHYUpTY2hQcmdSK1JWQnQwTERFcVYvTXcvMGZPV0pOb1dyM1J6ZE5Rdlkw?=
 =?utf-8?B?LzZzTEZ5RS81Nm9qL0dUYlVuWW1rYzBqeGtMb3RkdzhuZXlnbWdBNlAwcGd4?=
 =?utf-8?B?TWNEM3FORzRBOStSZGczYUNqeUd2R042WE8xeHNuWS90aENVTUV2bVkwanRy?=
 =?utf-8?B?clFMcnpZU3FoWnlNcUxJcGswek0vYUsrQXNVVzg4YitSYkJaOEx2V210TjI3?=
 =?utf-8?B?UDRrODVYUUFPR0lMTUxCZE1ETmc5d2V4UUtVTWlSRDJMOUJpVTF5U2ZOd0tW?=
 =?utf-8?B?MlZFc1BQRXZ5eHc5aW1VbEtCY0Z5WDFEbVZGYU56YWwxY3RKbFVoUW9EaFR1?=
 =?utf-8?B?Q0ZYN3BGZHRhOTdLeFdFRGNmUkZlUUJlMFB4c3QrdnJJNy9OOUE0K0Y4SGlT?=
 =?utf-8?B?MDhEcWFhZi82RENIaWxLR2F5b0FjUDQ1V2twS1R4bndzdnpZNUlwaVNpYXcx?=
 =?utf-8?B?RWVZQ2tDQzZPejZNMVNwYW12b2dtQ0NBRG4yMENTYTNVdmFOc1N1RS91VSty?=
 =?utf-8?B?TWdaTnZKLzZKQnNPdHRHQjF1dzZaZVVwZzhNRmxzSmZJckh1Mk9iZWNHdVdR?=
 =?utf-8?B?T2xnZ0RDZTN3d05pMXhBUlgyc3BnWTVFN29icS9sREtIODA3QzJuMG51dTBE?=
 =?utf-8?B?R0lJNnNRQm1aa3dzaUpLUGQvd2lEVGV1clZGVTVmTEdRSHRrRmpZTUtBYVc5?=
 =?utf-8?B?anBqYURZNC93aEJFQ2krVFJtYVZtd3h2TExzbEY5aFpnY3RSVVlkeEFMUWFC?=
 =?utf-8?B?K1pDUE5LTFBlZDdhY2xhTHMxd1lleWhJNlJaZjhqKzFOaVJrRDNGeGZkUXBj?=
 =?utf-8?B?LzhNcHpSRFdESmt6T3VaUU1XUDNHbkl0eHRXOVVkOEs1VFk0WmdvclZhekFC?=
 =?utf-8?B?SVluNWVLVGdkUWdHZWsxZzJSQ0FVdFhKVlphbW0zWnZiV3JkbStUQlcyMCtu?=
 =?utf-8?B?QjZwbkxqVk9QcFVGK1pKdWpRWE9jckVyTzFWam93Yk1TRGlPdmI0KzZoYkJq?=
 =?utf-8?B?WDd5bUZvdUp2TzBjWUxocVBramdPL1ZEYmF6QnRPZnMyL0l5ZGhTdTUyem85?=
 =?utf-8?B?Y1ZuM3Z5VVpKM1R1RTNKbFIzR3lHampOemRwaEEzMlpoYWVZVUlocXhya1hF?=
 =?utf-8?B?bHFTTkk1UTg1Ri8wQVlEVkhBN2xOZ0w1K0ljcHNZK2JVQklOYlB3RHg0ZzQ3?=
 =?utf-8?B?enQwRXRmZTUxWFpMLy9BaHIvUVd5UTNHbTdkZlRHS2p4ZGJROHBGSGJpTGhh?=
 =?utf-8?B?ZkxnOWVtVHlOY3d6cU5kcFRCTE9GQ0lKYWFIL0dXWlhvMHQyTURvenBHeFFS?=
 =?utf-8?B?a1BIY0pOM2NQd0hxVTJpQ0JObXVjbjIrTVJuOHZmS2ZhcFBQdFFmdyt3VnUy?=
 =?utf-8?B?dHhQZVNob3M3alBydUlFV1d1RlNFS2RwdmZsRlBZSWJxYTdyYVk1TXI0U1lE?=
 =?utf-8?B?WTdVdGZGRmRiM2YwazV3RmVtSjNHbTlDNmpkWUUzazY3cFNGbWZLd3huUXg1?=
 =?utf-8?B?ejdjRldneXM4S2RIYnhPR05aeUd5NUJBZTV6ZXFLbFR5NlJWRG1PNDM1cURl?=
 =?utf-8?B?WE80YUo3N2Y2T3VYOURLN1RJQmVjV3hVeWhtWVl6TnIvRThBRjduaXV0MENG?=
 =?utf-8?B?cmpkVDlkYWRPbkVXUmhJQ0pMaXNvNXVzOVNKVkEzaFlaMDAzY0RhN0hiMWdm?=
 =?utf-8?Q?0KpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVdUenJWdFpmMWkrR0MvQlEwbUQzWGpqcmdXY3huQTF2ZzZOWVVKeE9nOTJV?=
 =?utf-8?B?dTdDMFlsc1EvT3YwSmsxTC96cW5KZVNKR1l0WHZGOVdZeTl1OFltdEJFM0dK?=
 =?utf-8?B?TmlrMFJkREc0L0Y4OVFTZnBXQkhINXhsNUF5cUFLbUFLaEQ0RjhQR01FeWc1?=
 =?utf-8?B?OVA5UlVheHg5VitoVFU4VzdLT2tGMUF5am5HZmkzdFI4bXRmcENqRHVJMjBU?=
 =?utf-8?B?VEhaS3oxbUFYS3RIeTVRL0Uxc1JNVWU5eW9pUjlrZnFNMFRTZ0tIY3oyRTJu?=
 =?utf-8?B?WDgwdWJJWDcwMDRWNVI3RFlEeVdEa09CVUdYWE5NYm9aNDNVRk5VZVUzUm9E?=
 =?utf-8?B?VWlBakN2MVZ4MU9qMFRwakIvSXlEb1IvSmZlTjBxS3dRVG9FaGlXTW4wMXlU?=
 =?utf-8?B?cmh6Z3VaS3d0MlB2U055eTRORnE5Ykl3aTVhdFhTNTNzdllGMWpNcHd1bkdn?=
 =?utf-8?B?YW5hczMrRzNkM0JPaUNQbU1zT2xqY0pSS0k1enNiNE1GMzhSTjdHUWNOZWdh?=
 =?utf-8?B?VXBsRm9BYTlMWVo4ajYwV1BZTSsreXR4OFJqRURyTkhwZkt0OTdNSEk4STFU?=
 =?utf-8?B?WUdyOENYSDd0WUlESFFhRDlkamVIbStUTGxPQzAvMjVNY09DZ2xJLzAybDZz?=
 =?utf-8?B?VEZCeUNFMlJwQnlpVy9adVA3RUp6dmJRRURjNzNTVWY3dzg0SGxGYlRZZVJy?=
 =?utf-8?B?YUw3b05Fa2JYYlY0RGFPYm9tU3lJUXhrRVo4Z0lndHlBZFJYMGVobFNIY2hl?=
 =?utf-8?B?WUxOclJVZVByMVl6RTNOZlpqbUhONzdxaFZ1dGdDcTZnSFkzUVJkc2FuWFk0?=
 =?utf-8?B?aVpHb2VXdG5CS3lEaHdvZjRybzdLVDJYY3l4WU8xSkZKYWliTnhjOXJyT1Na?=
 =?utf-8?B?RHNjRm5kVkVuNzRTcVRPOEUybnV4RG9NeXhtRitSeittVXY0aDFZSEppTmtk?=
 =?utf-8?B?YzY3NGxhMzU3VU9vWno0VVQ1aG5JRFViQjAvVGt4dkdETTZsWUIvZXRiWXVY?=
 =?utf-8?B?WlkzdHZqK2RRY1Q4NDdiV3R6SEEwVUlRZFVNTzMxUCt0RGlXSk8vTU92Rjlv?=
 =?utf-8?B?Sm1xVnBNMTVIdUlIM3l4OW5NOHFob0ZFR0pTeis2bnJsNDY1MTZXTEFzekJh?=
 =?utf-8?B?QitFSStkZC9WOWZEUkNPSHJIbk90OU45MktMQXNMKzZNM2tESTAydFFpdnlp?=
 =?utf-8?B?dWp6MFV0aHM0cFgwSWdFT0RSaGF5MVZTcUhtTmtKeFdGSFh5QnNvNnF0b0wv?=
 =?utf-8?B?MHY5czM4TVdsREhsSXFYbjkyeC9aQW52LzlXRUVGa2ZUS3VIUThyWmthNEFL?=
 =?utf-8?B?R0JKaDU1dEFpK0JzVnRpd1ZVdFdKUEQ2WFNKUmoyN2E2L2xENXd0cjVORFV3?=
 =?utf-8?B?NjMrbzVJUDZiYXl5SkVqNGl4OWd6bXhCS3A2NDliOUFzelNxdXFBMEJWT3o4?=
 =?utf-8?B?Y3NmbXNlV0pNa3h1eGY1Wi84dXlRb3hNNW1lSkRvTTVrWkhBZU5MdmtONFNC?=
 =?utf-8?B?NnUzcUd6WmM3N1JXenZ4UU5EcW0vb1RzbEc0T0FDWlFVYzdTa2FTcXhMSHZO?=
 =?utf-8?B?aGNqNFduSzQvMUF4dDU1a3BHVlBmMkNyQWJOTHdzRVFnUVR1RFpSTWF4Wnh1?=
 =?utf-8?B?SVAwYmdCaENIMXdsbUpRMVNYRTZYTUtTbEl5MmhsZmUySCt1bHNRamd2ZGRG?=
 =?utf-8?B?dFJjTWdZbDVvb2U2akRlNXd5OC9lUFJRRE52MlgyRUdpaWx5TUlIcUlJM2E4?=
 =?utf-8?B?TkV3SWRuWVdJeTB1ZCswWTcxTUNPMVdTcWdEY08rR0tUUlZnaTdxc1ljc3Ru?=
 =?utf-8?B?d01rZnNQdk51OUgzS2VYTjR1SVJZR3U5KytFQlhmSWhDaGtMSlp5VXpTNHQw?=
 =?utf-8?B?S2hnZWp5OTZpbDJzNFd4Qmw4MHB5cHltNzIrdnZKYUUyWXJpSEh0aVJOOTB5?=
 =?utf-8?B?WlI1Qys0S2pESVBxVExaOXptcXo0TzFhYWgvSHhmREt4eVc0ZzlTUzRXaTFs?=
 =?utf-8?B?NjA2R0tRMERBVzZPSnR4RE5iQ3dtSjFRN2p2bS82NFdRV1JyL1pWcmN5L2ZG?=
 =?utf-8?B?QmttMnRhdktscDBlVVk4TGF0N1lCbnhzS1ZyTlNzOTN6K1pQemxrNjN0c2sz?=
 =?utf-8?B?bnRaNG9HNmtQTnlTazN5L0w3UFRLUkJhekRUSm8zVVFPbzFFTXF3SUVvSW90?=
 =?utf-8?B?ZkxTTGxmUGpWWnVHLy8wU3g0ejNoUFo1N2M0WWRXR0xTb01iNXNDa2t2bW55?=
 =?utf-8?B?RXVxWS9ONWFKck83Rm1pTHgrajVxNDJyZWlnNUVkMEc4dWpuWEVxMWkra3o1?=
 =?utf-8?B?L3ZTQWZtbFNZSVpFamh2RXplbFN6L2U5SDlTQ1JpR1FISzVmaE0zS3prd24r?=
 =?utf-8?Q?KtmHmyvRSZl57n7A=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 071afd78-9dc1-4ef8-7c1d-08de73927357
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:49:57.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXLyZxCO17T+2ZMyGp5D6EK5RFZebiNBwYDvONNnZEAq9xMqUtqjBiGElJSwMlLHZruEPfkZwnw0t/Woq02ibQahk3eBHfDS+F4x/oqwkvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7058

On 22.01.26 12:49, Pankaj Gupta wrote:
> Add MU-based communication interface for secure enclave.
> 
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
> 
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> 
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
> 
> Other dependent kernel drivers will be:
> - NVMEM: that supports non-volatile devices like EFUSES,
>          managed by NXP's secure-enclave.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

I tested this on i.MX93 using additional patches to access OTP fuse
registers through the NVMEM driver.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
