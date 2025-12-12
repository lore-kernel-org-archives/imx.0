Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA61230E828
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530992; cv=fail; b=jlk8+M8sshH+PvlYo/QQWRtj4174n0aXcq5ADl7Hkyw70TV8a9XN39p3CRZVjWd1s4ryTe7+IydPxUuMegv/TdgODv/WieBjTM/2/13D+qsNH7QwnkiigpTWrHrwUk03LyAaou66R4PZLtvQUCF//ONO652Ds0TtuUk89Jl4ZG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530992; c=relaxed/simple;
	bh=ap6nl5hFhKgWWYlM8u6Htrujru2To4YzZJEDbxakL/w=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=qq+a+deyKCeiWjpovV86YFBaFVD/g0kJvEwk3Uh5mMqXO28dkV2pvv49RXl0oxS1iHAq4kykkz5XOAmPYoBGl6dhpKqYoLGLLx1NyXoLStVu7fkHsI6GytWAGdbdT1/HxBoq4hZn5t5JXPu1Q/dQ/Fs6jTnQCde/jiW96Sh8kyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X2ej0YBn; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X2ej0YBn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQrkXqR3Vjw2J3thAA6nD1fVtfeuvjqc/oM+S5M/bGRbuPn72Rr4thiIQpuyZ4hwJJAAa+TOexIrNsqBe7rTRJ2rC6OFgb8P3Xw45KWOjfuF7CvU2DSHY5IRo2AHak4Ikf1cwxJJ5p+fOcjgAhYQSKcZ9qKl7hhR2kzvKEYPSZ9NiQVWDapPsEMbSiDVJ3RbpZEt8HyFfSeWfh0I2XbmqbnzqMxbIN3BMsBoceHFcDz4PO9shw+ZgFgOtTYbpi9B6DBJ05JQ9EJHbRI4JhoTAvjHxMsAZc56+rK7JJoVKOcRMORRP6trGL9jGJ4N7xLpqWB7KQEtvmD93C8Su99Mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pmb2CtYHKYYqYU6p3ZQ/J0Bt90CH+Ey64CdqKDaY3NM=;
 b=GuFi07dEorotu19A1Zqd95qNRNi192LxVRxEFX3CyrI6pEtfwRokUgbxyIJhFJzEZh7wd4taGhdwMDr/5TZ6kMvurLnL4A0j8jg775UOIkb8vA8uQrFK/UKYOEJ7dKkG3kW7tuyClJE+HcpdUVLAB7FLnrXy1hQtCYxY3bMyymOREruv2/fVyUvrJ+TR6pkuS8gCs2FwpD03KAd0t9Yx7f4U/OE2Fipc2BLeiDFvNaxlx1lalgCt7Dvm/YqlrZ1RmvTBnSbeoRixBALqCHcs24aobt6Rv47dorL0E4jFTO9MHT7902dh1tVJeSinKuAbLu5l8VC015VD6i/MtmfArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmb2CtYHKYYqYU6p3ZQ/J0Bt90CH+Ey64CdqKDaY3NM=;
 b=X2ej0YBnfNOnIiM1e0XPQa3N+MpBfH26yvcEl9oxCgB+Yl/ghqaKd7wpBVhZN7zSEQKJ7Sbpn+9Jv7yQ7Fqo/6lM/JaRpjq1dkYb3etQDB6YMuBavMoMalqtXexgYJsLlEa3MsoiYGVOpQYl05Ge4sbrzPL/myt2tvgjvyxgZACGDZLxn095MII+4IGKEBGFScUhr7BUvCUrfspJFf2pfQ9Olj4m6MvywG77VIM+5Uma/wI3YE3RlYgrnMYSP8uxsDITXv2bFyJGSeQfQutFyaVi8kMH1lx+EHOTii4yrKU5tZUUlJ+9dNTHXo9XqsUCydpVxcez/N95Kz4XhU/bVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:16:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:16:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] arm64: dts: imx91: misc updates
Date: Fri, 12 Dec 2025 17:16:06 +0800
Message-Id: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbdO2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mj3czcCktD3ZSSYl2LFKNUEwtjQ0vDNHMloPqCotS0zAqwWdGxtbU
 A0pMkq1sAAAA=
X-Change-ID: 20251212-imx91-dts-8d2e483191f7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: a5178a83-8349-4384-4e09-08de395f2038
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1NJQmI3ZmJmVElTb3Raa1VyU2xqcW0wc0toWjF3azl3bHBrZ1ZjclRBU0ZC?=
 =?utf-8?B?azBHdnkwNUJ6c0lLN3lBSXR5dTdvb3ZVWUJXcERpMkw3YU90ck1KcWdVaGVw?=
 =?utf-8?B?dHBvaTR1YXdJdlRFSHdkTlVMdTUrdE9oLzl0OW8zd2lqOWUvelZ4MGpFcVMz?=
 =?utf-8?B?cENWWEY3dW9oTzlPZjZhL09PWjZ3NnFUTHJ4OTRmdkxHQWVEWElGNExNU1lx?=
 =?utf-8?B?WjlWTllNL0daM2h3clVzQUszNGFpSjRSUy85YmE0V3J6VUdmYk5RYTBIUDhi?=
 =?utf-8?B?dFZ4bjExUWp1cGNZK2pXcmRjS0NucEpmVndKVGVjWlJLVFU5VGttNUNhQjR6?=
 =?utf-8?B?WEkyZ2w4Ri9VL3JhRmpVWjUzTktiZ2VqMytmZmJEUzFOaWpaVmpGQkU3a0ZG?=
 =?utf-8?B?OHF3RTdPdkllK2h6dEhJVFJ0eEMzb2IyMEtWVldmM2pZb3R0S1EvTFNDa0t0?=
 =?utf-8?B?KzFTaG9HbTB2NFNSamhtWlRCaDA2bFRFVGNqWUZDM2UyQjhXV1RZVWM3Y1po?=
 =?utf-8?B?c1pZRHJKdGFxRWxHdCtSd09GSHJYamdaaGxucHN6RjVqd040ZE82dzZ3OFBn?=
 =?utf-8?B?alRlMFJCWXE2SVFnT1RMa2l0NHNOK1JMVER0WjhrMnZoTVJ1OGNONTBlM052?=
 =?utf-8?B?Vzc1YzdqRWhFTEZqZHFDUzRMWXBoU1JValhKa0o3MlhlaFp6Mm8xWEVuOEh0?=
 =?utf-8?B?TUFabFh2eWVFb1c0dXBHa09aNW9yQ2s5MEpXeWRpK0JFUVRxd29GbWpmSTgy?=
 =?utf-8?B?b2N3NUlaTG1zQ3Mwc1hXMGg1TGs4aUNPdCtRS2laRkxZbFVoOGMzSmdLQ1NG?=
 =?utf-8?B?emtqbjREa1hCSWpjV3pEZDNrZTBBNXNVZ1J3azV6L0lnOUsvdUFReUZoejNJ?=
 =?utf-8?B?OUUxd0RCRkIrNWdMc2pkbEZ2NlNIc2NGQ0xMbk1ablp0a0prME5mQzQ4eGlx?=
 =?utf-8?B?eG5oWGNyWEhEOVdxMy9vZXlpeStNV1ZwYXFJanloTEw5dzF4eVdsSTRGbkZj?=
 =?utf-8?B?M2xSSjJadnIrMDFHcHRqdlBvQWxpTFN0RXE4ZlluZHAzOTg3VFZFaDlrV0M1?=
 =?utf-8?B?N3ByUTZYRWtKbFM4M1RzWGlHcDhHcWp5SDFtaFJ2ZGpuUzA2ZDBVRHQ4VzZS?=
 =?utf-8?B?MUtTV3B2Q21pRW5XWWp0bTBpK0dsN3lsNzd6d1hRbk1VWFM3aTNKYXNxaHV0?=
 =?utf-8?B?blFOT0JCWms4OW91aEdmUmpsbHpOK3huemZGWk9LdDhESTZNcC9WWTFUQisr?=
 =?utf-8?B?MFMxOXIrMjlLcU8rT21jL1JGVENzbUtONWoxQlZGZ0I1V0V4SmZDclZIL1hl?=
 =?utf-8?B?WVpZSWdUTWllRUI1QkY0dGtXSGdHblBQWFNIUlB4ZDIxTytRMjJCdzBBOE56?=
 =?utf-8?B?NEN4MTVxWDE0QzFBRCs2alh1RUF3N0p5MVVDMW1Pamp3dTBCaDNSdGRhc25P?=
 =?utf-8?B?anRyOUh4cFR2cW9hQWhHaHJZS0E0OXRYQnUzcEdaTWF5cnk3Z2FMSzdmNDJX?=
 =?utf-8?B?c3ZjcjVxY1RILzFaRHlneHp3M24yRmM2dVNhK0NOYlFVTUgxUTdzbWgyK1BD?=
 =?utf-8?B?WTVhMGxtKzVjaWtQR1Z0Mk9YRm82eTNnZVdoRUh0YWQ2cWJzbEpORHpSMnY3?=
 =?utf-8?B?d1hTS1NTNVhld2JIM3o2SWJURWZVM0IwOE5lcFNrc2x1VGFPd0hZa2NzNkhk?=
 =?utf-8?B?S3Z5NVo0MGE1V2xxd1hOUUxpaGpWYUlhZ3RUaTRPcDJ2RFNKT1pVbGpuUGdt?=
 =?utf-8?B?Mmpnb3VVdlgrY3UxaVlvUEFabGV2SEJBNGNvUlRPZ1pWenNMQXdxdFlHRnRV?=
 =?utf-8?B?dEFiY1NkaE1zSUVBczlrY200N0t6SkVyQ3FZN0N4RC8reGFtQVBidFNXNmxi?=
 =?utf-8?B?V29TUmlzejkyTFl1SzJST0RwMEpmTUZxQWVjdVFqSVFmYWtmSDlYYVRFbmtJ?=
 =?utf-8?B?Slh1NmV1OVJvZncxSUFPQloxWE93UEdudSt0Zk1zVnYrOEZ1b3hPTXVJK1Ur?=
 =?utf-8?B?VmZqT2dPWVRRRE8zM1dlUUx2MU4yVDFWTHNlbHlMU2kxRmhMdm9aemNFZy9X?=
 =?utf-8?Q?JeoN/E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU1nbmd1czVzSm11RGdZN1IrbXRjY2tEVk9ZVVRFcUdSdDJQUTFmeEJSYk1P?=
 =?utf-8?B?V1FQSlVjeGsyVmlCekwrZkFwV2xFbXJLRk96eWdyMnVwS1BxSVBBL0lmU29O?=
 =?utf-8?B?SVhRZ2JzT0JrZ0MrZWd6NnMxUE0reEk2cXlYeEdyb2hYV3R1UHBjdjUzQjl3?=
 =?utf-8?B?UDc3TUZQL1Erak5sK2p1VmVZQWc1RVdEWGZ5R0prbHdnelJTbHg1OEthaXlK?=
 =?utf-8?B?dm9kWFRTZC94SHFrUDVqYUNDSkIxNFV6MHlNdEx4alUrYmNCT05mYys1TG42?=
 =?utf-8?B?UkNKbzdPNXluSmFWbElPRGRjTnlyV0pwUGNYM3BmOWY5bldsTjF2OHBnTHdz?=
 =?utf-8?B?VU0ycnhpbDQxYW5QZ3NKL0E3T2g0a1BXbk1Yb2RRanZqTDl6VDFzRHVRc2Jq?=
 =?utf-8?B?aUNZMjFZWTE2UDY4VFBqUGVTQnh5QzdiWjYvZ2tmNGJiZi9qVVN2VHlrMStE?=
 =?utf-8?B?YWdUbllvVmlvOGJyQWNaL2syWEdyci9EMG80T296R2x4UVVZaW5ST3JnRFJo?=
 =?utf-8?B?djdyN3ZVZTV1Z0UzVjZmcHAvN3ZVZWdqR0FxQ2NnWnJ2SGRLOTZIdnNZWjgr?=
 =?utf-8?B?d3JuVVBaQktLSGxlVTNFSWlMdEhHNFVOM0pxM2lPUXBLWFhLa1YrcHY0VEd4?=
 =?utf-8?B?VzJCM2szU21sdzNuTnh5MHQzdjJqZXlsMHdnV2VqNU03cE81eUVXcTZzdXg1?=
 =?utf-8?B?UHMxekJEN0RiS0FVbXBVbzVhSSsrRkY4a3cvLytaQW9JaGF0RWQrVS9aTlFn?=
 =?utf-8?B?c2VlL012c0p6NUdkTm84cVR2MkRHSmIyR2tCbzRqdWI5d0RuN0hXZDdERng5?=
 =?utf-8?B?T2pPU3QrTGpPTzRYWWZoTmkwdWdXazUwa0diRkdPL3BVdDlQUnFTaVVXQXg3?=
 =?utf-8?B?VDFmeG8xdnpSem4vZG1NSk1OL3VXWDc3ZDNQV3RWeG5OMCtxTm5Rb3dxeTU4?=
 =?utf-8?B?YXdHSFRyOVZXcUc4Smt6ZTJUWWk5MXVYdEhNSVFaOTZqVGo1blNabUcrVzlR?=
 =?utf-8?B?NUExcDN3c0JtaDkrc3JES3BVZjdqcC9jZmwzVUFwQTNPaEZabzJmNUNUc2NW?=
 =?utf-8?B?RnJIMkU3alBDVlJYQnBSQW5uaXJsM0tMVUtrb0JrZU1xUUJrVGg0USt3ZGtp?=
 =?utf-8?B?L2wyOUFKRVUzdkIwbDA4N2ZLZHZwV2h2TWZmTXJ6SXZqU1EreWRtWk5IaW55?=
 =?utf-8?B?SU1YWUN4alZYOXg0RjgzakJ5ZjRmMlB4V3crbzhSNmNOV2o4TlNRRzNwdFY2?=
 =?utf-8?B?WTZXeFQxMFFIRGdrQVN3a2Jjelp5czdUTDdaZGZJeU9tejQza21NdysyVm5l?=
 =?utf-8?B?MkFvV0hjOTdiMDY2OXhpRFAzZzROM24rYkprUW50UVg1TjJ3K1lPSGs1N3o0?=
 =?utf-8?B?ZFlvRmdqMTBWME1oZEV4bS9UOUE3cm9GSENIa2t4QVlCZC85UmV1U25RamRM?=
 =?utf-8?B?eWFHd2JHSFFqSHk4MjBDMkxzVkZscm5GTU9jd3YxUnorSlkyK3E3YnErc0Vt?=
 =?utf-8?B?K2ZRMEorTXh3QUZvNk9reTRtOHkzbTdJOEd4RzJCcDgzWnJ2N2wxWmJVQ0E3?=
 =?utf-8?B?NncvNVdvdFhNNXI0V3lTNS9CSUx5dHl1NHBzLzRwVTMwYVBJa21wajRQMk9o?=
 =?utf-8?B?QUUzRXY3TE81N3cxeFdvS2RPZUFBUkoreHB6QS9KdmpvVnBTdzZkd3duZjl3?=
 =?utf-8?B?WDNsNkpwRmY0RW1Ld0lRS3hDTnBma1ZoK0R4UE1uQy8rekZtR0E3d0VoQUZw?=
 =?utf-8?B?UENXbkg3bzJ1ZzBteWpYSkxmZ2t4MDVuL29yVTBobk55MDhISzRyeDJINm5R?=
 =?utf-8?B?V21IaFZ0WE5TTi8yemtpajBlK0VFWDR2cGQ5bkhpVHhrS1BlOWJkOHlUdUNv?=
 =?utf-8?B?VWR6dEVvb3NvdEdGYTlWdVJ1NWpvZWNQUEcyNEx3bkljRFNJaWlNdTF5dG44?=
 =?utf-8?B?a2k4dEhMNjhURTlIMnVCL3Q3MDBVclhTZ1B6RTZtTmdaY1FIaU1Sa0ZSdSsr?=
 =?utf-8?B?T0k1RE5lb1BBc0daOGthQzk2MThqNzBIblFnQXl1SUNWclFDZzVBaVhnL1o5?=
 =?utf-8?B?clE4djdHS3hlNStBNEFydkpsY0RWd1AxbWNYZGxpZmlBVkw3Q1Y3bHlMOEFy?=
 =?utf-8?Q?JMWsvnDJUte3vWfGrjxsIKK5x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5178a83-8349-4384-4e09-08de395f2038
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:26.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/wVwOSMNx/H6TbghNbY258aiw2bJnae+SbR3PzZrfaZ4B6EG2RULp3CRts7vttvvxwzxeJ83X514JLdnWZCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

Patch 1,2: add temp sensor and thermal zone
Patch 3: Update file name
Patch 4: Add gpio4 alias

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      arm64: dts: imx91: Add tempsensor node
      arm64: dts: imx91: Add thermal zone node
      arm64: dts: imx91: Update file name with dash
      arm64: dts: imx91-11x11-evk: Add gpio4 alias

 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |    1 +
 arch/arm64/boot/dts/freescale/imx91.dtsi           |   58 +-
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 1187 --------------------
 arch/arm64/boot/dts/freescale/imx93.dtsi           |    2 +-
 4 files changed, 59 insertions(+), 1189 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251212-imx91-dts-8d2e483191f7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

