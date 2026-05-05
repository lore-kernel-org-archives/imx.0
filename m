Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D143CC9F3
	for <imx@lists.linux.dev>; Tue,  5 May 2026 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012712; cv=fail; b=ZYXUYuLfq0Kk/aKs9VuYJHp1/9kzDIR9FKUIDlC5kN7KbGZFMYpXIuY4p47w4V/9K+MejFZga4n7Ehyd+WPhg/BI54geAchgLRu4BhRQ5uZP3RAFknHLKCBJp5sikPSjQDZtUDDwQehmfeVakMCm+rG6T7dmfwuBLhIWPEXghvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012712; c=relaxed/simple;
	bh=rsjNZBoav7PxzTRQ9BITcRnyaJErT+gWvUoThpq9l1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=Wv7nkwE5qk9SEijPFIdWyxOGMgqKM+Wzf5CEF9Kb4qMkH02ojtTA8wRlgFDYxHL+rCt+AIcP/UrWHHOdHnqVs/lyuTEKifE+azgdtt3TyczkAuakg6QOBkbbjc0G7sk6HOO60uxIwvu8n2vvJ9ReDyHNP5pkGh8yRWGbk5goZQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N/JgsNzc; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N/JgsNzc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYl0P7/1GTsNjzxaRs+auk7eG/2o/qas5ys8PwQiS4fNYthOYthSIKPhbggc7g7PI8gmT5Kp+sqkftwSnxgwJZQNjYyKqG0chqK5qIPe0IQVR6FnKDR8qaYgIDXfERIDHr5EOirr0wWKvB45beC3+WhNR7w2lWZXbsP5P3VG6VZSLJINsaAKHCb8LwpI9HJ2onZUR36JR+ZUkOoY847Ur9o+nC08DH/NTBh/qnBrkVULjEHikAulD6iCLLfN4mxpx/qcMDORxGqzQ3rhGsrsZRkrIjWLSyziEtbjdwaS0Ga6iSzSr9AZEy2KEAK0KmiyOgBGeICVj36vZRPelk+5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctsd4PdDpBGsNBKGZBuDuZRjP6TpjqlSSj+FZ8hEtUs=;
 b=YARgmfMX7vtSe86mm/6b3pmthYHU6sYwaKsuDGWzhmZTKoVJwu57ua0U+G4WTwOB4ZSuswjvINtjsWzfC3MG5GuOPBynTFzqXPOJu5e3+U2IuFjEV2cy//q9nPTdI+bOnlNEnzEAXDEVvRRNhxWIhO+X2Zunq+17i7Jkm1SCCqXRgaCC8FRJ7yrgCIHv4CPrDDP6470eYYIqZAbX9tbpid24i52aBzxyDuN7lkkv+AXWHb8nHpfiFu6YKhJLeFlM1fb9rJLNXajbD6D1Y34Nw37TenDQkOs5X8LOoFQJVs0bCs00hEQVe694Ngzw0nQwsjCfPuL1LaQGyRnzte8yrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctsd4PdDpBGsNBKGZBuDuZRjP6TpjqlSSj+FZ8hEtUs=;
 b=N/JgsNzcjjrvUde1w/JoU8uccgC74BBV/wPk9eUJSnahKL5pHxaaM9sH7se9J0JizLKfUV1UFL/oM6EYUER6ivqQdrTDGn7HIAuxGdRpKLu1deFxNsCi5PHI7xHZu75S7Tm61DpEjY5moo+KTMAY3SzsFjerSZfzm//59Jp6dtHWit5KlSHMaK6HYBbTWtCbVTOdzKISqHemsxIyLlfwHl4vDO6eaoAC+wplGNoLXw8s+sct8Yg7QR2WjvffGOIKQUe8oP7TgKPEc4N6RabsxFuoMbVlSeVHUikUxTNXRjDAUVyQu0a3YucXCmGIdMaXx7p4AOBQOMRjIpbpHQ/LVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8289.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 20:25:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 20:25:08 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@nabladev.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260422210939.81012-1-marex@nabladev.com>
References: <20260422210939.81012-1-marex@nabladev.com>
Subject: Re: [PATCH] arm64: dts: imx8mn: Sort ifm VHIP4 EvalBoard Makefile
 entries
Message-Id: <177801270580.2104872.13120169880330713402.b4-ty@nxp.com>
Date: Tue, 05 May 2026 16:25:05 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdf8ca7-7c8f-465e-1fb8-08deaae46674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jt3pQgo5V1hmZNCYcHID4ggPIBJ6GllUOV5oh5/n2Y++ScYE0FbGRQr58YRMIm5FrS4xcKEmhOBgqaHg4OmhE+d+Cc0LY1uSYjk6fvsnk3r/tVErNJqyzheUSa1z5w/cFQKcTpZ3CmZLbdigRVO5Iz1243ihVi7j8Uj+2nFtvhs+5XB7GjvItP+4Cj6/04om8zgXl0/PrsQCZtngQ8/PkVgBSlxECpv7Bpf3+4Jcg15iXAX6Fphpso4HZHOqoVC4urY1VnZV1RwBqxLsY/rfXKPOk5MDKsaePf7ni2fOL7I42dlZWDdKG+esnMBCA8tOfY/oZtxgxsTJpfhoqO3nXo63ABRKDMqomlo0zqwwHItriH7XYl1YIxp/nxwc4HCUkeLr8vFfb55QUkHrGyR0bMUoQZsRSblSTblorJEZE+742E2g8VC8M8j/mbi92lGXSc9wl6Hhuv5LMRROzfMapJ0VrIiIWdCmTftBWs4vEbcUqs2aSSRzfnfk92iLJMPGtDTtI+FcGdR5nZn7rBKss2O0yidIRwyWy46qa3FhrtUoj5yw91gboIsubmXy+RTcsDGbgWrUfATrH7fsTv/rZeAX8Vdae/RzE7J7g397ITtqmIcbSyrmsssrhNVJM1CMY8gp+6iS5FkRhaps93aSHZ8YXEJZd5me18hAV9tFvNk5lr+qXJt13JAJjwDg5gqUfWk1lFW2a05e3TxBx2hfdhhEESbJUEkwew3dwLCQsKaI2EAAZrDXnWO/vtoz75UW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTdVSkc4WlU0a1IvUVBwY3hPbS9Kd1I2U3dFR0dkWm83dVVRZExBaE9WTi9r?=
 =?utf-8?B?MzhidzZlc045U05vZnJOd0w0Um0xaEcwY3QxV01Tdit5RFNuUFROK1EvNlVv?=
 =?utf-8?B?NWNQTlFNVUNUb1lpSEltZWx0UGZ1M0lZdkFoVG42Mm5uOUxIUEZ6eXRuSVp3?=
 =?utf-8?B?dThEV2Jsa0RhbWJyNlpTZXBIUDV4azZSVXIxQUhvQ3lFY0poMjJCVUI3WXBM?=
 =?utf-8?B?MVRRa0lTMU9ES3lsbmpoTDR5TVZHTE1sOEZpdlVQMkdMVnJXUWdqVEJwRktZ?=
 =?utf-8?B?L1VxMHc0clcxUWpWR0s0QWxrZERKQUhQRk9mNTRwcWJnRDU2QmFEMkVHOExR?=
 =?utf-8?B?ZTFWSlNMMkdCdDEzbmZJdkpaUmJDVEU4OXJON1NoTU05aDk2Y3hGeFd6aDQ4?=
 =?utf-8?B?bzdtTmVDTXJCanlJaXNuNDVxOUxyMm9LbFRTV1ZlZWdtQlFtbDIzVHk4eHhP?=
 =?utf-8?B?amJlNjE5b3FrdXJQWXVpNDhIQU16cnl2ZER3d0JwMFM3MnBXY1RzU2J4QjBY?=
 =?utf-8?B?R0JSa0NCNDA1Nmwwc2NrQkpyNjZicTd6d05OT3U4WjUxaDZuNWp0ZWxJZy9r?=
 =?utf-8?B?c2FPbjFGcGsrU1p3Z3BFS2hDUi9pdExGRnFETldHKzNMaGpQaTB2bzFvODJ0?=
 =?utf-8?B?NHQ0Zno3QmEwWXNkZWd2NU52WHJVZStpa3J1KzFaTzRXckJZVWN3RW1RQU1L?=
 =?utf-8?B?eE5QWmNJczZ6anpqTERPU09tTEpQNTloNzhkVjd6YjZUdjRoUXU4bVJXeFEy?=
 =?utf-8?B?K2lEaUZqeDNlckp0SUNjVUpaTW40UmEweHBSYTcxc3QzQTFjODRKUWRiM0lm?=
 =?utf-8?B?TVUwcUhvb2JCb0czTXNNT09TeEhLYVRWenlITFMzZ05JOVZGcTdmWk1KT3Fy?=
 =?utf-8?B?cG8xdEVLWk5URnA2bk5MaWpwdWJ3SEVFSUJyMVNDUUtUTnNXMUh5aS9jU2RH?=
 =?utf-8?B?WDRsRUV0SjF1UkYwWkpEYkt6bGlyRExpS3RqMHVrVzkveFNDdDhvMGNudnE4?=
 =?utf-8?B?WnYrQUp3MGVqQUN3SWdMZzhiTXNzS0FFZitqQStPdUpIVFhhc2ZCVWhTQTNE?=
 =?utf-8?B?dVJ6a1dYeFFndlFESGxYWnhrQ0VieVlJUklGdVplSmNrVnNHNlphQ016clIw?=
 =?utf-8?B?TzlkbEhEd0krUzNjMDRENmNNMktrbmVPc1llY1lGdE9KNTFGK0FuajQ4MHVR?=
 =?utf-8?B?SzRMdkhPZXRCUVhqTWhaUndvdVprVVRwNFduYVgvWHI2bXJrTTZLdWoyZEZk?=
 =?utf-8?B?d1o0c2hKTmNVbEJOR0M0Rk51NDE3NmMyRnhJUkpBR1JndUk3ajd5a2luWVF5?=
 =?utf-8?B?dXlpYkRxWS9HRVpwS1k2ZDJyMk5aVXM2cjFVYzFJMGZZVnQ3a0Q4SFJyMVJt?=
 =?utf-8?B?UzJtRTlUWVlMWCtTa05LYkEwdGRISSs2UGNBSmU2QWdoSmhreHlCQWlJSFRk?=
 =?utf-8?B?QXprdi9Balg5bnVFNHN5Y29kUGxTNERtN0g3MEluSUJrYlZDV0FvWGVrQ3Rs?=
 =?utf-8?B?bDg5ZVQ5Q0lFV1J2VDJQdlFobkhucEVvRGpNalEzZFFPOG5JL0Mzd2lRM05m?=
 =?utf-8?B?dHhYbm1sdjZVVy9YN1dpOGM1UWlESjZ4QVF3UjU3V2I0K2xMbkJvWTJpajRj?=
 =?utf-8?B?eXpJSzVQOVB3bExENHZRQzl2Ny8wVko1VlY0clp2N21yVUtOZXdXYXUxNndK?=
 =?utf-8?B?WW51dVJYcTZTWlhoVXlSeHNJOGlGVVRNbGxPUFJVUDFzdEdORVdObXlUVkJR?=
 =?utf-8?B?YXFxdkQrZHJ3RGkzMmh0QUJ1dVczcytseFN2eEMwQSt4SEx0UWRBdldPWjZ2?=
 =?utf-8?B?TDJBMElaQVVJYkRqalhqSTNDYldXek5yMk1tZy9LZ0tNa1g5ajN3cnc1V09i?=
 =?utf-8?B?bkxwemtjQWlYazZpb2FGd3hrK2ZuLzJIL1RIS2ViN2t2d1JzSzRmdGlwV0hm?=
 =?utf-8?B?aTdNQk53VS9HNEtadzlONVVaRlhXSlJwY2VXb2pKaDJQUDc3SnU0ZFhkVFFq?=
 =?utf-8?B?VnMyQS9wTVdMdHE5MjZ2RmhvRHNlcjdtVnBYNjg4Z2FNayt2VFR2ZzJ3OEo4?=
 =?utf-8?B?U3NuUm9td1c4eEw3V0RhVTdTMkVyaFgwaW9VR2ZYVHNQbTMrZFRsazQ0M0k4?=
 =?utf-8?B?bWZlbDBvbmdiRFBCOURqbCtnZzRYYVV1QVJWQzE0ZzVUMFZrayt5eEFFem0y?=
 =?utf-8?B?eTBod3FEdmlKSVVCZ2F4Q0JUMkdJN2NFa0M2czdUTlIwb0QzMktlOGhpakZ0?=
 =?utf-8?B?NG9tUFduWS9uc0RqcnFzUzBjdytNbzZzRGVwc3BvcnhjczFpRWFVR3NTbGZq?=
 =?utf-8?Q?hfoPigRnRq1nODXuHf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdf8ca7-7c8f-465e-1fb8-08deaae46674
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 20:25:08.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2pbZYpo8lAL6l/jBl9IeGDJ2lw7WaLXJrRAsOBECD7rObv/xqgSHFrnhLMw355FMd7fuseZAkTpmtg8E8Aizg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8289


On Wed, 22 Apr 2026 23:09:23 +0200, Marek Vasut wrote:
> Sort the Makefile entries alphabetically. No functional change.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8mn: Sort ifm VHIP4 EvalBoard Makefile entries
      commit: ebdfb84ecf7a0bba26d7a04edae98dd600fd4b42

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

