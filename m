Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C66F38E106
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061439; cv=fail; b=fSFvJf3mLrPzVhI3TdTxAyp6rkwZWmDBvRvhYNWxGIFH1DBC2Ud0t1RHnzwOqJ2dll3rdLmUOJuzcS/H1cE3iYcwkYW5sQMR2Yt8/xBOJA9bGaIc3bNhYtr1tshHnY95WI/ZjJlGih2yxXpXoAB3pZEnB4IEwJQ6b7+vkQi679M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061439; c=relaxed/simple;
	bh=jkEvrFkGnqkaUHhBY5j/qFFkoMzJH4Fbl0NcC+T5x2E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jlj9B4kKRSiPTbIY7nHG0SJ59ZXcIUwkleTd9ly8wtZ07tHmKglVBdIflPNJ/qsGbk4/TFMXo5ZdyfLTgP5J0amvIMn3OSU8yh5D5infqFD15alen0bSIhPfT3WzXdkkgReLJxr45MlRtqFm6DZYcLq8ZB6Y/x6asKUBKgaF3S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HQUR7v4x; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HQUR7v4x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2qUS4tC90U60cZcUl9lC0SgoX8DdOVkbNM2hPwaN5uO9D0MNI9CF2/5i1Y7kp0x4yTYzBjTXQOM4IoN9ybEB2FKIE++ZXS3se4r3OdlCT7+WilRWMpcxuTuadGCGkh/g9RwccokA/Ga53ItoEzbebgW+xpg3PKk8PVntSsypGJumPxgsO3W2m1znTK6a/b0kR03y2pdp37Hv7YhM4nFxa6PywQH7lTKSkvaZGMAAe1lbW+dQzO0rr+xqyPalYkOz2NIu6njRWgx7JG61dNs0ZrpwSmzYN430p+c4fjAigyRHfDkLp6UF67TbEk1caQ1FteKslJaLjvGfaHBZ0BArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSUoFLn6vWiq91CicvZg8yCZGXlFzDtVSW/erhk+GN4=;
 b=mV10MeshkPF5dqA1uKfwrB9oGrik/WB0RQts1v2/OfZT+UkvrdWDinlRASR+UoSHgyzCnqdZ+kIpst/2je9g1T3+880VE6+j35DBLVobGvTLI8SH7xYs0SZCMe2loxEVkSQnAzqiX9ReR/YWkvW7wxg+hJhJ4XR6w+mkH1pkAc/GodOT36pDv60RSaBPsUdF8GBhK+ieZXql2BIyLQHt386DCEuxr7lfQIfAd4k2wzgwTuWNRPavkcO398AlRTH9T5SIkLBavubq1K5utwPmqiR/0mmWxI7iDUortjdnfGeJOn6NtB9wv8lXHbfiUQCU6eM0HVnXrrc9gGA5xT1+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSUoFLn6vWiq91CicvZg8yCZGXlFzDtVSW/erhk+GN4=;
 b=HQUR7v4xJ5zOp6p72E6xav2pf1NwDeEf9rK+YvaBYLluoiCQowxasZY4KUPZoK8zVblYqH4AhLiTNIqkhr0zMPN8peuDO/XXVe2eaNZKLfF/4OEmcqYThPb/S5NBVOhAO0rhL64SVtcec1EW6i+w1tEf35yc2tCbrw2Ecb/wEvXgtGULJhVDYI6MXMp5jIwBzsPvARYxT4KkCpNc274vyTze6syd1WeFwBiDppruEsqv5CWdsWMyzmzfohxS3OtW9Pv55WcKpznBqrott4NL6LCaUYogKBpbKNwlv1Ur85EO0jPbvNgQJQXP9ytnu/4vMAIg3C4fAeoZi7hwBUQEbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:55 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:26 -0500
Subject: [PATCH 09/10] ARM: dts: imx53-smd: Add power supply node for
 fsl,sgtl5000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-9-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1971;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jkEvrFkGnqkaUHhBY5j/qFFkoMzJH4Fbl0NcC+T5x2E=;
 b=YPnRokSIL49oLZG6Oxd6vyzOrspglLyu4iUwLmiZo+A1f9osEtAEuv6WRiixsCywlc1FA83P2
 jXhVMVc+Z2WBoFqOUih1r2pcs3t8YE4y26X7jOSe79Jn6tF6MMgcGOO
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a46e5bf-e1d4-425a-3143-08de629366be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U09tVWJlMlZLb21qWG5oMVRFcFhSVlU5UTZlcU00Q1ZxMzRlZXRDTDE5Ums0?=
 =?utf-8?B?VVdPcTdmcyt0YUJXR2pITDZvV2Y3d3NsQnd1TjZ6eWxqNERkT2oxZ3lFcWd3?=
 =?utf-8?B?UHRVQkMrYXdkVDFsOWdQTTAxK2gwcVhpK1ZQUE4zYzJtNU95eUt4VE5JeFRm?=
 =?utf-8?B?djFCNVlvUzE4bytGSTUxWVlnSmJQL3R1Wjdyc3ZMWkdjUWJEMmtEcThROG81?=
 =?utf-8?B?YU0xQ0FJc1Y3ZWlYV25yV28ydStLcHJiRkVZdTdtOER5RWZOTjJZL3FOdEVq?=
 =?utf-8?B?MXFMTGhrY3pma1kySjJXdjBkZUJjLy8vUHhVVmpzMzRLMHYvLzc0RzUvRlUw?=
 =?utf-8?B?dEltWURVTDBNZHpkMjNoRlNrMlBCTVpBaExqTno3U2NrTkZqbU1YOU9CWllD?=
 =?utf-8?B?T3dqc0FSK1JTMzRWcTNOZGNXeHhYRkxpWllJMkRFdmZ4VVJhWXAyNUpqbjBi?=
 =?utf-8?B?NFFJT2FUS0hKaG1NbWk2czM3b3N1NU4zV2RxUzhuK0JJdEVCc2ppUnZQSkhW?=
 =?utf-8?B?b3JtVVdTY1diTFA0Q3dWRXZ0cENROGNIY21kN3ZHTE9zOFgyUmNFRjFWVzJX?=
 =?utf-8?B?ay9sZGJBRDhSU0k2Nnp0Umc4MzB3TENQK2dRYUowSkgvNThqTzlqYUV0KzIv?=
 =?utf-8?B?Z2NLSmZZN2NnTEFieWoraWprVzhKUUNDNzVvQ2s0b3JEVGtMK3lIdjZvZ0ov?=
 =?utf-8?B?SnRJM3l2K3kwMjRwZWZoUXpiVHVLUVRkUlpHWUdhRlhLVG5SWEI2ZVlsN1VM?=
 =?utf-8?B?WTczZElINFREM3p6cXFBRllEQWRkNUtRYjBtV1l6bFhiSzYvU3RUc0o3OTJ2?=
 =?utf-8?B?V0ZIeXNSZVh3RzNzeCtzZkdsVVpWUTUvb0ZFcmdobVBvMmd1VEtwSElYSGJD?=
 =?utf-8?B?akpSQzhPcDBQNThGd3Nwb3E2UXhXam8vcVN5SHdRdkJNdGtTQzBVY044VHdy?=
 =?utf-8?B?UXUzd1E1ckl5VTdIUmxQTmZTSGU1b1NpUCtWZ3RpK3BnLy9YaHpHNlJ0bHMz?=
 =?utf-8?B?K0JmMGp5aS9WVENTR0pPeCtaTDJSVk5qN1JIR3B6ZWx1R2pjMDY5ZkFiR0lN?=
 =?utf-8?B?WUdJTURWVnd0Vi9Cck5JdGlNOUY2bGZYREgxeTZpZWpZMDFoU2MrbkdyQjlP?=
 =?utf-8?B?MUowV0hKZUNUL3hkZ3VWcFNNR1E4bHlLaGxmVy9jdU1QaHBEaFJycEtRMlRk?=
 =?utf-8?B?Uk5WUGVJaHlCeUxtWURRQmx4WTR0SFZlVXNyenh6blhtZzlFbFY0YVlPQnZW?=
 =?utf-8?B?S0t1L2hlMXRIREtvRWFWOU54dEc3N05IOFlUOU42dDFHWkxzTXBIaDJ1d0J0?=
 =?utf-8?B?M09NbldIcUxFSWRBR05NYWFzaUJjZStONWJLdW5sekIrNjl1OVQ5Q0xxRXNt?=
 =?utf-8?B?Q3EvdUdYMUw3SFN0L2EwR3hEQnZZQlYyS2RoQzlqamc2d0tVL00rY2Vpakoz?=
 =?utf-8?B?djRsM3A1cit6SVZlbTNpaUdoVTNmMVlRSlpoNmR0SGNNS0toMVRhNnkramQ3?=
 =?utf-8?B?Sm1TWnhjM1F3V3FzL0xGSDBXeFUwcmxsbS9xeW0zNUd6UHpoaU5PNmtMWllk?=
 =?utf-8?B?MVJoeVdGZnd1ODBzaEw0aFV0OSs3VDNRTjd5cVAyaVZIb24rRjdwRko2cndH?=
 =?utf-8?B?N0R5S2NFV1ZkYVM1endNNWhqUEhuY0VlQTJwSnpkclBHOGRuTTNDVWNDL3Mv?=
 =?utf-8?B?SlY5TWJjRFBFb1dNMGwwWkVJbjBYOW1tWDB6UmtLQXhuNE0vbkFsMUM5VG5w?=
 =?utf-8?B?Y1UzR1ZoNUtYQ0VOT0o2QlRhSkQ5d2dsS1duS202aFlaWlRUaFRYOG9Rbmtv?=
 =?utf-8?B?QkJmL2pReXhxeTF5SWl1eVptS0luODh6NGNOcDZIZjFVVFp2S0RGSTVvZGRI?=
 =?utf-8?B?U2JzYkdBMnJ4MUZpUExCUFdIeWxLallTcGdKODdQZTQ1V3BqSU5aaFpvMEM0?=
 =?utf-8?B?Um1lRzRQREVIeDFaaEF0b0hZRjdEaytHdTdEcDlHY0ZaNG91cW8xaVI2cmVP?=
 =?utf-8?B?elpWTXg2di9OUFFvdEErZG5wSm5lTk9icFE2WkYzYk15S0cydldNNHFEOWVp?=
 =?utf-8?B?bmFJNFFueHVCSHpPbklidmlFeUVGeGpTRVVOWnovRzVQWDlzV1lUb2Z0NXZP?=
 =?utf-8?Q?1Jo9B4QhqcEXf2ZHbYHXpUPhi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c09wSSt5Q0R2NStxWDMySlBGUzZzclc3ckdDNGF0YXNlOHhJVGt3d1BRbmpl?=
 =?utf-8?B?SEllandGTU5QWXZpMzVhTEc0dWJTUWg2WHlzUFJnamZBVnV6MENNeHc3N3pR?=
 =?utf-8?B?dEpERWhISUlwd2RPc29Ia0wzYWtsVEY2K0JCb2NJSytrVjJiNWc5anJBYlpN?=
 =?utf-8?B?bktGYzNRd25lNGVtVU42ZUYwVHNzR0F6ZnNkVFpFeFFGV2tEUDNKb2hudHA2?=
 =?utf-8?B?eERSVzF4WlJnL0hxcHBqRUt4a3NxN2N3dnJQZWdkWmZ6RWlOZVg4MEFkeFp5?=
 =?utf-8?B?NXkxV0hraVFnQ1huTWVWclNKT21UTURsOCs4QzVVNUZHQllTdWFDMDRqb1NP?=
 =?utf-8?B?NDVWU2xFOW81dGJoOTkwZ1UwNEhRcWRxcjBaRmRURW10QTJZRU5lNXpBREwv?=
 =?utf-8?B?K2JmK3NTSGx4WDVVZUhJVlk5VUFkZGJBM1NpdDVNUFJVR1AxcFNFTE9odWFC?=
 =?utf-8?B?MzdMaWVXcTdyU2kwT1h4Vm5NWDlKR3NaQ1BHTThTYzYvVVZITk9pNHRLRGhN?=
 =?utf-8?B?VXU2Tm9EcW1OTHpYUmkwaHZYYnQ4SXdKL3dJS3hEK3hhUFRQY2t4WlFxU1RS?=
 =?utf-8?B?SSs0aXRBeElkZ1NCYWhlTDlzR3RXSlZjNC9PZ1JoNFpzUUN5YTdoa1NibUdH?=
 =?utf-8?B?L21kU2lld1BOZlBNNjRILzBiM1pCeGphd3hqMlR5Y2c2SThOcSsvQUhwdlgv?=
 =?utf-8?B?MDBHS2hTUFhwQ2JlZ1EyOWNHQzcyTEhTSyttSXMvcjFKTDZSN2N0UTBJWkY1?=
 =?utf-8?B?YmhZaW1EekJST28ySEl3QzdRTG9XMGI3SWM0YjYvU0UyQmpVYm5WQjliWFpn?=
 =?utf-8?B?QStmNXhUaTdXa2pjS3BSeHgrMVRBcUkxQ05qcjhhb1BNempFWTJNUjBOdlRk?=
 =?utf-8?B?Q0VPamxLSkNjclhJQzBRazZKTnAyLyt0SERiRGpmdkdBTW9uOUh0aW1XRVdt?=
 =?utf-8?B?YzRNYmR6V1hhU3BDVVlDNGthMEpnNUtXMzM5bTNnRlh6RVE4b1dyTW93bmJs?=
 =?utf-8?B?bE9TNTZGZWduSmFXWmtDUk0xTXJnOG1iY3V6UURnSHFPR2U5d0pBejFldHQy?=
 =?utf-8?B?UkF3QVBwSThzR2Nla1NmNVN5ZE1hTUhBVmE0M2xwZHl2OENHNVhvaXY0MFQx?=
 =?utf-8?B?SUtQZDU2Z1ZBZWJQQjRzVXU5Z01FT1BCOEVWM2c2cURwck4ycTlzaU5EYVVI?=
 =?utf-8?B?Uzg3MGEwRGFWN2NpSWVZZCtFUVE0ODc3NEJlVjlpU0dhQzQveExrek5QMVBC?=
 =?utf-8?B?RFhQeVYrQ25ITUlxWm1hUC9FZXlFMXhJSm51T09OOWpQSUlScndxeWxnWW5E?=
 =?utf-8?B?N3Z6RXA4dGo0RWVIMmlwOVNTK1V5NW9rTGcwWWQvNC9aK25YRFpFNjk5RkNm?=
 =?utf-8?B?SlRjZEQ4OXpmQmU2SzNtWVBNMmVnVkhHQ0ppWERhcDEvR2RvVHNaTEUzUUFP?=
 =?utf-8?B?RFozTHUrdXUxSVd1SlowQkYyQlYvQ2R1cTJKdjlXYzlFWkU4bTR1aWxNRmd3?=
 =?utf-8?B?ODVzQUk1V0FkaHVENU02NE02Z3EvOTY2b2c5UmhQUEhFMzlHWnE2eDhoT2xW?=
 =?utf-8?B?eTZWTDVsUHNEY2VWZ3A2NHlOYWFqOUpVK003VEpsbUZFaW5PUkxnSGhLNmlE?=
 =?utf-8?B?S2QxQUlvRVVkMWxJZjBKL0ZSblFiOVRsZmtuNFNFZkFpNmI5VzZvUG45V2pp?=
 =?utf-8?B?dzhTZXpvYmlJTU5yc3k1dlBkYzZNeWM0NmxKVnY1eVY3RTdSN09Jb2VUNDVZ?=
 =?utf-8?B?ZnJhaFVuRW16aWd4MllNVnZ5N05oSVFzWkVXZzZhQll0NHN4R25vN1lBY3I3?=
 =?utf-8?B?QkRHSlczZHdFMHZhZzhQdHF1VDF2L1ZBSGRRRlMzTDhZdkFXcDluaTRueEpK?=
 =?utf-8?B?Q1NUbE5TR3JZeW43Y0Z2VnVNNEJHOGo2Q2J0SjlEWTVLNkJnSHpQcU1qdE41?=
 =?utf-8?B?ZTlIbXU1MW8yZDM4SCtjaHAwTXM0WCtsM2FhMzJkRzFUTE1UUDQvY0FwSzBG?=
 =?utf-8?B?eU9qOVZYQklURmxPWGQ3TWNwSG5hOHIwcjU1Nm1jYlVsOWhpN0h2Z0E0QzlP?=
 =?utf-8?B?YnpVUzNWUFMyVWNPaTR0ZWIySmxTQmxsTEdGUTBROXBHUzFIempBYUZ3b1lK?=
 =?utf-8?B?cWxJOUVFeHBtWVBMS2U2ZFlYTmRvLzR4RkdHV3dGOS94YkQ0SjZCUnVEWW12?=
 =?utf-8?B?ZnJ4NURIenVDV3F4YkY2a3R5Qmp3UVZOeDBWc3htMW9neGF0SXZVVmkxQTVt?=
 =?utf-8?B?QURvRkNmYzVqaEM1MHdMZHNtQWdRRWlSSWxncWNIUElFVjdiLzVDNTF4T2R6?=
 =?utf-8?Q?UOQO6ztITDbL9wlIxC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a46e5bf-e1d4-425a-3143-08de629366be
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:55.7715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGbRZzV5wT3aQoXFdt+x/qO6x5wpjJM2eNHG61ZMEcpdxKjEDGI30ssndu2kEMU98J3zWw1j+TYCBJph5nbwJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667

Add power supply, #sound-dai-cells and clock  nodes for fsl,sgtl5000 to
fix below CHECK_DTB warnings:

arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: sgtl5000@a (fsl,sgtl5000): '#sound-dai-cells' is a required property
        from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml#
arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: sgtl5000@a (fsl,sgtl5000): 'clocks' is a required property
        from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml#
arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: sgtl5000@a (fsl,sgtl5000): 'VDDA-supply' is a required property
        from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml#
arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: sgtl5000@a (fsl,sgtl5000): 'VDDIO-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index 386371c816f4d1f2566661e5dd7d02c498ed269b..a1e19f9709b2c7c7d02812f2b5c2afd382fb5d86 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -31,6 +31,20 @@ key-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 };
 
 &esdhc1 {
@@ -253,6 +267,10 @@ &i2c2 {
 	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX5_CLK_DUMMY>;
+		VDDA-supply = <&reg_1v8>;
+		VDDIO-supply = <&reg_3v3>;
 	};
 
 	magnetometer: mag3110@e {

-- 
2.34.1

