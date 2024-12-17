Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2511DE3D9
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425745; cv=fail; b=CfTCfmVk2WFdFF3E23HPWy6L4N+3QSNkXx+Qvxo3p9QPjygk5PW5Z86ftdXHtGWYwIDLTyIfC72mhJo3tgrMW1jErdszGDzTaNefKkwFU7mF6jt6vZZWrYVYpr7ow99pm7nIXdmxK2inAWizG7S0ILj3s2G5ApQynRqI8jrq1dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425745; c=relaxed/simple;
	bh=8wYfa+NHuD0ZQMI+5pd3mXPxnnqdPaBlRTnC0zeus7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B9z7q4V+f28vurDINkSJv1nC/dRfdI6/RdpnXzkgaM5gkEztqpxdbnJ9KG/jBTEDNCQ6Yap3dqCQkXZXJmpfX/5CM7TTXaZuio1TsMG42LUSOXvSE+34g4SZLEXRn3y6F8+dqbr9avZdc4B9OAESzi7T57RNdQCV7P4mYlSrzRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aiPSCqHm; arc=fail smtp.client-ip=40.107.104.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aiPSCqHm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjs0uPrMlTxKzEJ67NP7QjXQL5gyjzI/S9mCy28CJfcB89K2xDL1y3Xe2SiewivRchHYI/BozXyL4h+HvA73MbEV3Fj7JeznBIhoxFlV5hWDw2LB2sbsgRwoKitXf4lOuTzXB+CfpWwjVdFP2Ds6Ajr2tHLaPg5CyEKV/a4NOGCGmbBlGR4jIju1iwjQ0M2irYYfrfm1Xt6aEOexfrJh/u7spIcYiSKfPLZE6PtdWRxlfZicLmNtRpFpFAQVCin+TvfG6jqpw7oodAoNKMriM7ZOEx15blp3VKja7GAEfxpKEsTeoKiX96BuPtfIysIqISGdx2UmFFL6Ia3hJUYbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wYfa+NHuD0ZQMI+5pd3mXPxnnqdPaBlRTnC0zeus7E=;
 b=MZU8TMx0BW+Y4xks9XrarLoRXMJUkfUCzgRP+SuZHlzxQ73ylr+Kn62Q6RXhCKXTsxXy+V6odr26i1MBCXIyP5axCakqQ40d3ONkxUDBpoA653BSXymXy5jwpGCVA6L8Am7vnFZguJuKdTaM8JKkn8e3TZfGbG6cHrTSQrmk3SASv8PE3UCSCwzcZ/c9rMYf3G3NissAFopHjASJd4aOcboDs61edvC7G5GuKCHyldnZ0ef/1MMGZJVv463/IcXFfgJ/iANXkwLUv/rmEWO7Uy8Bq5DAdL6/GHBuPVUpnZ580Z/N/7QotL9ZPXg231MMN7uCn2uh9p1hILvoPigSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wYfa+NHuD0ZQMI+5pd3mXPxnnqdPaBlRTnC0zeus7E=;
 b=aiPSCqHmdBb7AweFPVpJHKNAcB5tvMSbSBNGvWOtC7l/4Eb/3y5NQUDdLHKO4R+rNaoIXnEsbJ8Umag9sh3UjQPwK9Uovj9oCsPcm/MT/jIwybC/Qo2klNGQGyveLPeO+TTZhlq8jTdOVfnYDZOWQgvkmRLRdEqgYCxxTtcxNZYmKqPhUgT6eGqhUOoYI0WSduiyU5sEHMMdFK6hZZSytVcDtVHamjWB8F3Yv7/VoqaXsCmuxxzStMDUQIqZMiq4XBAl2yZMjJoxfvB7hS6+YSaIS0EREjWKQLCTIGIJsX2QHmVxcV9WKJvweb1R04FsdCKs9sSlBwPjzjLLRq/IcA==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS8PR04MB8945.eurprd04.prod.outlook.com (2603:10a6:20b:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Tue, 17 Dec
 2024 08:55:39 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:55:39 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbTHk81yKZ8OkADU+CIsg4vinMd7Loro0AgAF3nnA=
Date: Tue, 17 Dec 2024 08:55:39 +0000
Message-ID:
 <AS8PR04MB8642D11477A37E75BAB71F3087042@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
 <bx3r4cs3oklfduvkg65vke3clb3fc6sseske2ellq27ifpmsnm@msz6iqvjwufn>
In-Reply-To: <bx3r4cs3oklfduvkg65vke3clb3fc6sseske2ellq27ifpmsnm@msz6iqvjwufn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AS8PR04MB8945:EE_
x-ms-office365-filtering-correlation-id: 346d5322-6106-4ce7-05c1-08dd1e7894dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VjB6cVRIUnMwWU5CL1dsWktkZUM5czlQSmFTamUwUjZGemNTTkxZbnZ5ekJM?=
 =?utf-8?B?bFBUU0RodDRsbnVJM2dISjlpejBQZzZVSllqMTYwSmJTTTFLNHMwc29WbjN1?=
 =?utf-8?B?ai9VSUo4dlV2cU54NGdYMit6VEpxd1JsZHZPTW5wYS8xMCtOYjV6SUdqdGxH?=
 =?utf-8?B?NEh1em5HYk4xY1lsaFZNWVpHa0lPWmx5UE5IaEZuR0hEcUh6Uk84RGdwUmR1?=
 =?utf-8?B?YjR0aTlOZlROMEVLekxFV3dVRVZrZ093RzMycTZLSWJ6WEhOMVJWOXNFQ0Z0?=
 =?utf-8?B?NVJRV3ZiRjRNaGg1ajFtMTJDOGdVTi96S3E4Qk5iMDdHdEphSHJmTXFLdE53?=
 =?utf-8?B?WmU3V3FmT0RDdlVXeWkyWkhXVFJmejlpSjJqRzQ3bWFSY2ZSTlhybWlaVkZo?=
 =?utf-8?B?TzRUT3ZKMnZwTEJkUWNxeXZhdHBadG56YkRUREhMbmV0QzlPM1JDaGZPM3B3?=
 =?utf-8?B?MmREQllYTmtrU1NSWGhFd0FBN0VXT0l3eGJici9GUy9hb3N1TmxnNE0vSkhr?=
 =?utf-8?B?MW10UjVsOXRkdVRhd1o0dWlROXc0NVV3bU94RklYaGo0eG9oYzIyZVZPbUZ2?=
 =?utf-8?B?UUdyektMVzJ4cWVOc0ZpMmpHTHZvZ0R6Y0pQZUU0QWpSQUFCdFlleEVlcDla?=
 =?utf-8?B?b1JGV0kyd2h6Zk5GQ3l0ZHM1MnUwTTRESzZvMDE0c1NkSmZNZE9CaUt4TEln?=
 =?utf-8?B?eTZIRkN1NmJmSUR0TWRpMzhZQmdVT2MwZEFwVHRiUzJUSmd1UzdHejQ3Yk44?=
 =?utf-8?B?cTRvYjhJdHoxb1R2UUw4elA3Zk92N1RGaTlTUWIycFI4Z0FVWWJDd0d6Wk11?=
 =?utf-8?B?RmZkREl4RlpjNEZNd1YvK0JIT2xnNEN5Z214SVVIcjVwYXNjcW5WdU8wWmx1?=
 =?utf-8?B?ZUUxMHc5dDU0dzFNbnVRVHZaK0FxNFdZcGIydGd6VEJKYzNEUmR0T09PUmtG?=
 =?utf-8?B?N0pSMkJwZEtEL29PK1VyUWJsV2NsTE54VHpuSXpGbDhUR1NpelJGMnV1bFRE?=
 =?utf-8?B?MXRzc1NmMFBvc1dheEhieVdGV2dGS3B3eTVVOFlvd3UxUy8vRmFDWGJBSUtI?=
 =?utf-8?B?N1QzTXRFbHAvU3VwL25UQkx3NlZmWVlaclUzR3V1c0ZOMlgvMHBxL3RKWUtS?=
 =?utf-8?B?a291YlNCdklYdmRxSmlnQTZLMVdGQ1lFbVRsSlNKSHl2clNvdEtBQUFCOERP?=
 =?utf-8?B?V3dtd3VNcllweHNMbDk2dUoxVmxqNDVjQmtUSmNPWkppZllCbUdXZ1ZhOGxm?=
 =?utf-8?B?U1pUVEdBUFpxTjNHWm96eXZPQ0txd08wR0ZEdjRmc3lORElIeUdMR2lyRG8y?=
 =?utf-8?B?K05ZK2dwUnI2YmdZbGpWM1hid2krVTZnSXJMRVFPczVmRTVpVjBkZTlCT1o5?=
 =?utf-8?B?YzgxWTBzdzZzcEJrVDNRWlR2aFJlUzdkUllJeWpxem9FYk11Tnd1Rzk0K29I?=
 =?utf-8?B?eUNUOHlFMGd2RzdIUmpLbGNITG5QUHdQSWFWQVRpNE9JQTB2dFA5VTBQRHlS?=
 =?utf-8?B?NU1aa0FxaXd5U3NlMWlFZUlGQVM2bFh4YU5Nd3Zha29vdnRhTUxPSkVveU9w?=
 =?utf-8?B?SXNxK3dFTUk5Q3EwVmZCRDhDMlpUNGFoQmNac1NGS2NoMGp0bW54MEhVS2ZO?=
 =?utf-8?B?emJVblk1M1FaY2NpRy91Mk5qV2N1SDIzcDdiQXk5azQxWUJpSlRBUE1KSGxu?=
 =?utf-8?B?aHMxa29EcGxzLzBYcUVGUVhDQVpTQnpwUW1XR2hSY2RxZHdpdGtUcTNqaFg0?=
 =?utf-8?B?MWltM1phVXRtWFd6ZVBpNzBEa2hjd2VwVHd0cE9Jekx1aFNmQis3UHAwOVRu?=
 =?utf-8?B?b3NGM1BhY0RlZWUwdy9tVTdTTHlCTStxSDJ2YlpIbHRGZ3BId1dqc2gvajBj?=
 =?utf-8?B?TlBpQkhiVFlkRHRwYkxNY1I2MzBYMmVrVjRrVUplZjVSMy9YOEJ0dUd1WEcx?=
 =?utf-8?Q?FY/QuXeUeqY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHkwb01BWXFLT09JTnhCcEpXMW9PbDlVRDRqbmdCeDVDSDFLYVRITEFJaHY4?=
 =?utf-8?B?Ly9DS01hVElpTk0yQ29sUlJTSC9MUUhuUHZWeUIrUTlXNk90eTI5eldJUUg4?=
 =?utf-8?B?R1hYc1ExNjhWQUNjbGp3dWVWWWZMUFA1R0tsZ1lSVmxZOFdob1gvNGYwTnRq?=
 =?utf-8?B?VjQra3hCOGd3dUNLWTlpM3FzZlkvVlFzVXU2ck1kSFhJZjNMaG5tR25KT3Yz?=
 =?utf-8?B?ZklZa01Iek1BRjJlTG12TFRJNGdGR3VzUFVrbmpraXlxUTZTaWplcXpMZmFC?=
 =?utf-8?B?NHVncVFlVkJpalQwcjRlUVdTYTBuRURRNnQzVkNmblRrWDZVMUZGTVFVZ2RT?=
 =?utf-8?B?R2N6dUgyT0lkY2IzVEdTditTSkRKcS83V21Ec1NaNjhoNDM1MHZWSVBpYWxX?=
 =?utf-8?B?OHYyYTdEUTFPclJmSzRHQVNqSnZHcTY2MGpnTTllbURxOUlEQVQ5elZXN3c0?=
 =?utf-8?B?WDNYaDZYSWl4SDlrVFVsalNmY2hKb3F0SXJ2VVBMai9Ta1RITVBDTnpKMmM0?=
 =?utf-8?B?a1VNdEptRm5COHc1UVJDWEE5c0R2S2UzUTR1bkc4S0J5VytlYU9PUXMxR1NY?=
 =?utf-8?B?blBWaCs2QkJPb1ZTci9PM0loR3dTb3dMNGpDREpKdFFMRmJPM2hSNm95MWxV?=
 =?utf-8?B?ck5aTW9RZGFXS3pYNlRkY2ZYc2lkaG1USCtZL2ExcGF2TzlBSFRrWDdhS0ho?=
 =?utf-8?B?KzhEZEtHN3d4RTBxWFVHRWVIRWpzcWEzN0NYYnFwSEpRQXJNV1Z0d2tGL2NG?=
 =?utf-8?B?MVFxYmFDTzN1YWdMMjJtNllQR3BTWmZ3VzVWck5UOVc3MFEwYng5clNmMnZP?=
 =?utf-8?B?SmxYNWxCZ0RiVlBwY2N0KzFOZUNPbDhOQ1JSSmxIajRiRVlJaTZlYS9Cek52?=
 =?utf-8?B?YW9pU3A1VVpBUE1ST1RMZXBRcTVtQVNHVmZyajJhWEtlTlN3Mi93WjExSm9H?=
 =?utf-8?B?ODZzTWp4ZlNvSkwrRktXMzFjalU3R1lxQUo0VzNMVW5IVndqTDBlK1RTVFVk?=
 =?utf-8?B?NVl1Y2M5a1RVbjJwSXY2YzZwTTlFdmcxRmhOQUZMTUMyUmdKcE5kc3VlUWJM?=
 =?utf-8?B?OWh6Vm8rS2RsV05oeHJIMFhRbW1IeXpnS3lmNG1EM1MwNE1XWmlqazFWeENR?=
 =?utf-8?B?TEZFS0pHRHZFS3NxbzVMTEJWM092S0VaYWgveDdpQThNekh1djc2RmRrd2p6?=
 =?utf-8?B?SmNybkxHL2dUWlJYdjdac252TEtwb0lYWTNDalFmRzcwVVVKVUhhUHVmT1R0?=
 =?utf-8?B?SXdqbklHWk1hWElqaXpaNWtGYWIvdUtmNTAwMjNUa3VqMDRwQXF6SHhkZ0dS?=
 =?utf-8?B?M0s0c2orWkU5MjFGVmNXeDNnZ09IZitock96QkRqV2crTXNLeHRkeUpoVlhj?=
 =?utf-8?B?MUN0c3dYa0szem5UcDNnNkZqUXA5REdTYjNaT1YweW90d3YxSmlheDdOQVpR?=
 =?utf-8?B?K0RLcGE5N081SzJRaXhCTnFiQXU1azFuVmtlVlRWOWxrenBxa2tMRXFXR3Iy?=
 =?utf-8?B?NVZkSXl1a2VzMWEzbWNSRlFJbHBoTWJSdEtwdmM4Q1dzbGIyN0dLKzFMa2Ez?=
 =?utf-8?B?MktPUmRSM2drRjYxUzBRUUVEN1lEZGlTMCswWG9tdWFua1RROExIcVoxMk80?=
 =?utf-8?B?QXBGTmV3WjdjYWhGa25wb2ZSVGROa29ZTEM5aEJCUWU3ci9RVTR6WjZwQVFR?=
 =?utf-8?B?dGowQysrQnladW5TbE8wdVdqNExRYllGSUQrT3F1c1lVRHdHNzBXUnBMM21i?=
 =?utf-8?B?SEN4TEpUTXJNWFB6UkI1Z1pzSDVtaXhpZ2o5SkdIbklFNTJwS0RVaS9lMFNx?=
 =?utf-8?B?UkgwejVqZ3NzQUhNeVhqRGk1cnJQcThSYUpsRytIU0IzLzc3RkpVdXlLVFRj?=
 =?utf-8?B?c1g1OUJzVS81K0tBdVZ6NCtVQXUwT0ZBdFBWWldLSHVHZHFtaGtQYWJuVmZN?=
 =?utf-8?B?Z09IbGduTE5ZL2J6SFlEOEV5WDYvZTZxZHEvTHlqZkl6TFBKMHkvSDlrUXdi?=
 =?utf-8?B?NXZWTE5WSGExYTBRbWRZL1N0WXZGY0ZLeHg2ZW1NQ0t5SmJ2R3RhTGxnd0dC?=
 =?utf-8?B?RDI5NkZ4WXRnVU5hZzJrd254NXFtWWJnUXBjTkw4YitXWHVMSTJxNjNRNXRF?=
 =?utf-8?Q?qpzE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346d5322-6106-4ce7-05c1-08dd1e7894dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 08:55:39.8524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNq69elEG9078Y6O5JFyk/VKQsrVJhttBySL5mtmPq7Z3i7ateUw8WYFhh1LRHCSY7mkzZ5MlW10otqHkubK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8945

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiBmcmVlc2NhbGU6IEFkZCBiYXNpYyBk
dHNpIGZvciBpbXg5NDMNCj4gDQo+IE9uIFRodSwgRGVjIDEyLCAyMDI0IGF0IDA1OjM1OjU1UE0g
KzA4MDAsIEphY2t5IEJhaSB3cm90ZToNCj4gPiBUaGUgaS5NWCA5NDMgYXBwbGljYXRpb25zIHBy
b2Nlc3NvcnMgaW50ZWdyYXRlIHVwIHRvIGZvdXIgQXJtIENvcnRleA0KPiA+IEE1NSBjb3JlcyBh
bmQgc3VwcG9ydHMgZnVuY3Rpb25hbCBzYWZldHkgd2l0aCBidWlsdC1pbiAyeCBBcm0gQ29ydGV4
DQo+ID4gTTMzIGFuZCBNNyBjb3JlcyB3aGljaCBjYW4gYmUgY29uZmlndXJlZCBhc2Egc2FmZXR5
IGlzbGFuZC4gT3B0aW1pemluZw0KPiA+IHBlcmZvcm1hbmNlIGFuZCBwb3dlciBlZmZpY2llbmN5
IGZvciBJbmR1c3RyaWFsLCBJb1QgYW5kIGF1dG9tb3RpdmUNCj4gPiBkZXZpY2VzLCBpLk1YIDk0
MyBwcm9jZXNzb3JzIGFyZSBidWlsdCB3aXRoIE5YUOKAmXMgaW5ub3ZhdGl2ZSBFbmVyZ3kNCj4g
PiBGbGV4IGFyY2hpdGVjdHVyZS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWluaW1h
bCBkdHNpIHN1cHBvcnQgZm9yIGkuTVg5NDMgd2l0aCBwZXJpcGhlcmFscw0KPiA+IGxpa2UgdWFy
dCwgZWRtYSwgaTJjLCBzcGksIG11LCBzYWkgZXRjLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
SmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg5NDMtY2xvY2suaCAgfCAgMTk2ICsrKw0KPiA+IC4uLi9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTQzLXBpbmZ1bmMuaCB8IDE1NDINCj4gKysrKysrKysr
KysrKysrKysNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTQzLXBvd2Vy
LmggIHwgICA0MSArDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk0My5k
dHNpICAgICB8IDEyODQNCj4gKysrKysrKysrKysrKysNCj4gDQo+IE5vLCB0aGlzIGlzIHVudGVz
dGVkLCB1bmNvbXBpbGFibGUuDQo+IA0KPiBXZSBkbyBub3QgYWRkIGRlYWQgY29kZSB0byB0aGUg
a2VybmVsLiBZb3UgbmVlZCB1c2Vycy4NCg0KQm9hcmQgZHRzIHdhcyBwbGFubmVkIGZvciBsYXRl
ci4gV2lsbCBpbmNsdWRlIHRoZSBtaW5pbWFsIGJvYXJkIGR0cyBwYXJ0IGluIHYyLg0KDQo+IA0K
PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDMwNjMgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTQzLWNsb2NrLmgNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk0
My1waW5mdW5jLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDk0My1wb3dlci5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NDMuZHRzaQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk0My1jbG9jay5oDQo+ID4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NDMtY2xvY2suaA0KDQouLi4NCg0KPiA+ICsj
ZGVmaW5lIElNWDk0M19DTEtfRVhUMgkJCQk0NQ0KPiA+ICsNCj4gPiArI2RlZmluZSBJTVg5NDNf
Q0xLX05VTV9TUkMJCQk0Ng0KPiANCj4gRHJvcCBhbmQgYWxsIG90aGVyIGNsb2NrIG51bWJlcnMg
bGlrZSB0aGF0Lg0KDQpPaywgd2lsbCBmaXggaW4gdjIuDQoNCj4gDQo+IC4uLg0KPiANCj4gPiAr
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2RtYS9mc2wtZWRtYS5oPiAjaW5jbHVkZQ0KPiA+ICs8ZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmg+ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnB1dC9pbnB1dC5o
Pg0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdp
Yy5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgImlteDk0My1jbG9jay5oIg0KPiA+ICsjaW5jbHVk
ZSAiaW14OTQzLXBpbmZ1bmMuaCINCj4gPiArI2luY2x1ZGUgImlteDk0My1wb3dlci5oIg0KPiA+
ICsNCj4gPiArLyB7DQo+ID4gKwlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KPiA+ICsJI2Fk
ZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKwkjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArDQo+ID4g
KwljcHVzIHsNCj4gPiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArCQkjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4gPiArDQo+ID4gKwkJaWRsZS1zdGF0ZXMgew0KPiA+ICsJCQllbnRyeS1tZXRo
b2QgPSAicHNjaSI7DQo+ID4gKw0KPiA+ICsJCQljcHVfcGRfd2FpdDogY3B1LXBkLXdhaXQgew0K
PiA+ICsJCQkJY29tcGF0aWJsZSA9ICJhcm0saWRsZS1zdGF0ZSI7DQo+ID4gKwkJCQlhcm0scHNj
aS1zdXNwZW5kLXBhcmFtID0gPDB4MDAxMDAzMz47DQo+ID4gKwkJCQlsb2NhbC10aW1lci1zdG9w
Ow0KPiA+ICsJCQkJZW50cnktbGF0ZW5jeS11cyA9IDwxMDAwMD47DQo+ID4gKwkJCQlleGl0LWxh
dGVuY3ktdXMgPSA8NzAwMD47DQo+ID4gKwkJCQltaW4tcmVzaWRlbmN5LXVzID0gPDI3MDAwPjsN
Cj4gPiArCQkJCXdha2V1cC1sYXRlbmN5LXVzID0gPDE1MDAwPjsNCj4gPiArCQkJfTsNCj4gPiAr
CQl9Ow0KPiA+ICsNCj4gPiArCQlBNTVfMDogY3B1QDAgew0KPiA+ICsJCQlkZXZpY2VfdHlwZSA9
ICJjcHUiOw0KPiA+ICsJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTU1IjsNCj4gPiArCQkJ
cmVnID0gPDB4MD47DQo+ID4gKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQo+ID4gKwkJCSNj
b29saW5nLWNlbGxzID0gPDI+Ow0KPiA+ICsJCQljcHUtaWRsZS1zdGF0ZXMgPSA8JmNwdV9wZF93
YWl0PjsNCj4gPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc2NtaV9wZXJmIElNWDk0M19QRVJGX0E1
NT47DQo+ID4gKwkJCXBvd2VyLWRvbWFpbi1uYW1lcyA9ICJwZXJmIjsNCj4gPiArCQkJaS1jYWNo
ZS1zaXplID0gPDMyNzY4PjsNCj4gPiArCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8NjQ+Ow0KPiA+
ICsJCQlpLWNhY2hlLXNldHMgPSA8MTI4PjsNCj4gPiArCQkJZC1jYWNoZS1zaXplID0gPDMyNzY4
PjsNCj4gPiArCQkJZC1jYWNoZS1saW5lLXNpemUgPSA8NjQ+Ow0KPiA+ICsJCQlkLWNhY2hlLXNl
dHMgPSA8MTI4PjsNCj4gPiArCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJfY2FjaGVfbDA+Ow0K
PiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCUE1NV8xOiBjcHVAMTAwIHsNCj4gDQo+IGxhYmVscyBh
cmUgYWx3YXlzIGxvd2VyY2FzZS4NCg0KVGh4LCB3aWxsIGZpeCBpbiB2Mi4NCg0KPiANCj4gPiAr
CQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsNCg0KLi4uDQoNCj4gPiArCQkJZWRtYTI6IGRtYS1jb250
cm9sbGVyQDQyMDAwMDAwIHsNCj4gPiArCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDk1LWVkbWE1
IjsNCj4gDQo+IGlteDk0MyBvciBpbXg5NT8NCj4gDQoNCkNvbXBhdGlibGUgd2l0aCBpbXg5NSwg
c28gSSBkaWQgbm90IGFkZCBuZXcgcmVkdW5kYW50IGR0IGJpbmRpbmcgZW50cnkuDQoNCkJSDQoN
Cj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
