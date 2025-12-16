Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC92C0F7D
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765871995; cv=fail; b=C9WcYV5uw6i+H4vs76zoJt5GVKL+t0O14rlUWOXDcPBfvJv/HJdSUR6KXEdP00LjdOy+VR4nppUFZCryDP1g6Cqrd6uet6/1rDHXDrb8MZZjVZPMs8wdFTL5sklcyOB9sQFmdk6HtGnj0mIFK+qs0lzNJ6pWxLxW5USr2vFAsIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765871995; c=relaxed/simple;
	bh=tIEAtBEUCbU5Akmx/fmf/sCmW/6M3xJjFOPK06bP/9k=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=gAp5gtFIjjTErOc1Cn0nnuU1rORqvwiL8QUz34UKSYTy0oQ9RSl9SKrMH3gCxHAjUB9fXbT3aGjQmn804htCHJGdJCU8suiMdO2otw+dGQyilAjoCy63TFHfdEdm2W2oFNfq44vGevHpRumaxss/j7mLjg2FoZR2Rh62A3sX1ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g/qEgkWO; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g/qEgkWO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRV7hP436hKTefV6G5JDg1D3AXzg7WSmg270ozsTPN/YNpDQwwKetRRvQ5R6p3rjDNaIaQ1vf4yCIozKSr6bc1ryvR0oj1XGq9Mk9PkhfcUXKqJNte1/3BXG2BiGN20T7NkysfPRoYNk/NL4mCuajWJ9d2RKg0XxyCK7vcY2EXI+LBx8FDahq46EkclspMm+dqFvDTjFr3hKb4msrn6Ci3y7PMVKAqCz7Ag9qPbC4wtRnRpGsDEMLxIfxrh3f+4zy4G/B1RzexSqKLWxaw7LusWteuonpPvs+rFgZo+6CQ2glAu8/dvH3NtRG4V7TvYyirm8exF9XkkrkkKd7t+zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/6GNYKIOKg+AR4+elH9pjPAmkxrJwiLboEgjo+yNrA=;
 b=Os99EDiDubpN3n1KleAhA87NyzSLIY1wASjrN6GTASQK5aDKFbIHR99JtVeTPFqh1MYSR68z8uTTiZDa0eWXnUXBSuBJXfm7w+cxK2QdcKOLbTNBqZSvJDedYoD+c7cSrbmkzB5BrtEft+7gyyfB35QNl1YFggcpx5WsQs//clRt4WmKfcVXiYUuspVh1cCuNFTaAbdXNm+ujzTTsB2yXczokvkBJG4cnwzDgnVsWgTBWCnpq9iYdPHik6sWhEo+FmDx+GZbVutI0N5nCIEwJymzm32Ss01uzI4seyv8aWVHpABtbh2mKFZYEuqcBkukdyQvHiLLsx4Ns0g+t0nRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/6GNYKIOKg+AR4+elH9pjPAmkxrJwiLboEgjo+yNrA=;
 b=g/qEgkWOLXjYLzDgt2vOpNn0EhxPwTR13F5tV7ShvrbpnFFWNuVnb0KY83VKBc54qbWjrxVL+8Pyrqm8izO/YGSCIilJoZ7TZKnxQSFVO4PNgnis5bx3l7+aW/u/xIgqQ40daXT7LxRbahad0DiuQWi7tckUCAbfD9jkGNvsuxa0teZ9pBQcy+TfpSpPNWNb/3lspN4TlNc8jQSa8bABI1dFeek+L47avlGQtTh1ZabdzFKJRwXxXsQSz348VvgAL78P3y5k5Wz+6BR0zU6msQwcQth9E9ve+7I8apcKKOakU+qvYOiaU38gLNZPUrUxIg4WMDcilodbXW5fdXZOpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 by VI1PR04MB9788.eurprd04.prod.outlook.com (2603:10a6:800:1d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:59:50 +0000
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d]) by VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:59:50 +0000
From: Jacky Bai <ping.bai@nxp.com>
Date: Tue, 16 Dec 2025 16:00:54 +0800
Subject: [PATCH] mailbox: imx: Skip the suspend flag for i.MX7ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-imx7ulp_mailbox-v1-1-66b5bbcd3005@nxp.com>
X-B4-Tracking: v=1; b=H4sIALURQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3czcCvPSnIL43MTMnKT8Cl3LlBRj06QkyyRLkxQloK6CotS0zAq
 widGxtbUADzsFLmEAAAA=
X-Change-ID: 20251216-imx7ulp_mailbox-9dd35bb9b94d
To: Jassi Brar <jassisinghbrar@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, peng.fan@nxp.com
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765872069; l=2480;
 i=ping.bai@nxp.com; s=20250804; h=from:subject:message-id;
 bh=tIEAtBEUCbU5Akmx/fmf/sCmW/6M3xJjFOPK06bP/9k=;
 b=WFeAEeaLH0d8QAMMhGJzhaO1xy3GwxIXgn31t7xOeezMsm8uVQnWrprzrL8R8iXMGPeGu338W
 aTSbG/RIivWCOvV7Qh8JocKkQGC19XTtlDzof44Y6aiZvg27aohu2X8
X-Developer-Key: i=ping.bai@nxp.com; a=ed25519;
 pk=ckFjCfRynXBjQGmSmzOVI5hggMD9XnnNlwj/jcO/j1U=
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To VE1PR04MB7213.eurprd04.prod.outlook.com
 (2603:10a6:800:1b3::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7213:EE_|VI1PR04MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c05e0c8-b89e-4bbd-8f56-08de3c791670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tmc2YWozQjhreStoMXhZd2ZjQzFILzhmb2tGOWxlUHo5R1hSd0l1WFprdDBC?=
 =?utf-8?B?ZWVBY0Z1V2xlTEZrWlZjd0JLWHl6eGZueGQwdmNnRFZqQnVuSHVsdTdOdkxD?=
 =?utf-8?B?U2NSK1pWZjJoUHdza0VmSnN4a1RMbWxkQ2Z0a0RTM0xLM1MrT1piOGhTSHlQ?=
 =?utf-8?B?UVIrSVRWS2p5RDhNMUlXN3I0WFRZTHg1Q011NTAwVFlrR0tPTHpmUTJ0THI2?=
 =?utf-8?B?ZEFGNE1SL1hTMUdrVHBmd29ITTgzZm0wTnQrVUFMR2ZLRjJZL21SL2dSZHFw?=
 =?utf-8?B?NHU4a3djK2dQc3Y1Ris1NzB4ZjFveVBJWWEzQ1VnaFRxSS9NdlZNeGFFUENz?=
 =?utf-8?B?T2NBU2FYQ1poVmNDdTJUUG9BekppQlJrRjJ5emY4RGQ3djdlNStHOTV1MXlw?=
 =?utf-8?B?UnZid0JmZDhZQWhkcytFTUxTVnZPMUtNTTc3eGpIY0VzQmtpQlBoNGhPYTRV?=
 =?utf-8?B?dm9TcDViSnhmeE5tVG9nTU50TVdxRWtPQnFBMlN2ekl5M2YxSHJvK3FVM3hY?=
 =?utf-8?B?S1NzWHo3TWRCdTVIRHB5STVxSWE4b21PQVBtdmN4MW9uY01uWm01ZmdmL1Yv?=
 =?utf-8?B?TnYzYk9LRkJqSjBlZnkrUTFEclZTeVlTK1I0VkIzakhmMW5sai9XajMvWm1L?=
 =?utf-8?B?Tk1kMmlIRXJhaXVOSHlPS1l3RG52Z1llb0hXZXdFQTN1ZmtuaVE2Y3Z3eWJT?=
 =?utf-8?B?VFM2VnZQQWVtTm52ZkJoYWkvRk1WbmR3ZmJNbXRrRE45THNZLzRuUkpkbmVt?=
 =?utf-8?B?dk1WV0JGbWYzU09FbXFTbEV3L08wdm5YUVE2MEN1cWxsR09SK1pqaC93eWha?=
 =?utf-8?B?QU9qTzhKZTYzaU1yZTBCdlByWDdLbXNRZENpT0hOdnQrWnNkK3dSM2tha3Zo?=
 =?utf-8?B?Q3YvTEF3U1dsYTdXV2RUbFNiZnFSb3MvaGJWMjB3eWRrYm9DMUNLQ3N6R2FJ?=
 =?utf-8?B?elRwS2JwVTFmN0NEbWFGaTYzOUs0d0FVTE1UVkd5ZnJMZVdlWDg1QUlsL2do?=
 =?utf-8?B?RzQ5VC9JUlZIcmloK3JDZUhPWFN6Ynkxb0o3SUs0ZHpyUHcyaXRqQnp4dFBx?=
 =?utf-8?B?ZkNSZ3U2NkdieHNQUWd4ajNyeXJCclIvYWZya0taUjhvN2JZTm9ZU290c1I2?=
 =?utf-8?B?MlVhbG9FMy9iSEtKbFlITDBzSldob1pLckNNaCsyWm1pMGZiUGV3ekFBVGVh?=
 =?utf-8?B?NkhUaVhWK3A2YzZ3R1BYUHliNkkzS0M4WG5jRSswV1c3d0RwQ0lOQTJyNm44?=
 =?utf-8?B?K29VdHVZSFgzb2x0SUNZTVl3STltLzZ2TUNyWkc1WEdKV0dZbDcwVU5YVzVB?=
 =?utf-8?B?alhCcjM2dDRwc1V2M1dMRVJjUDVzNTEzdmxXaGtKVVVOSEw1OS9iS1FMU1R1?=
 =?utf-8?B?eUpzMThRaEMzL2wxbjlobkRjSzY1Nk1jcWQ2ZVBxbjN5UFVoTzN2d2ZyejdE?=
 =?utf-8?B?aHN0QmFZYWxMNjhqSWZxYUlmbnZlZE12QVRyUXRGNG9vUHRKMXJTeGE2M0dV?=
 =?utf-8?B?c1pHQitiTDRFTU9USXJzQk5YMU1lSkg5WG8wYTNkNWFWbG9YS1FuQ1hCNE1R?=
 =?utf-8?B?K3lscnpvS04zRTdNdnR3N3h2ZFhybW1nNkQ0Wi8vblNXSzVYRmIxWUl6bFlp?=
 =?utf-8?B?K0NGa0xiQms5ZHV6TjdVV2pNZUoxVTFUYW5HSDRnaTFsVTkxWXh2L2laUjRX?=
 =?utf-8?B?TTJOeGY4d2ZRaTI4NGsrU1dxakJ4dXJoRmxDK3I1QW9CVFBpSFpxSDhFL2hM?=
 =?utf-8?B?VjhCT3MwUEtCaXJRYmMxTkNIR0hCZEF4U2JQRnRaZzFkbkNJdUlqQ0htOTBl?=
 =?utf-8?B?bFBVcVYyUmZhU1FhanMrUzlVcUNtMURNdEJqOFhFRENQL1JjdkYyYXNFaHpw?=
 =?utf-8?B?UFpHNm54ZVdlQ1g4dUNaZ1hVSlE0Sm5Tbm1zYTFaL2tRdjRoSjl3L1dMaklt?=
 =?utf-8?B?Wk5xa2tkOWJlcWRISGdCMmttOEJRd205WWVLTjYyVG9ad2FGRy9sbHl2SExH?=
 =?utf-8?B?bWE1MFdqU0xqU3ZUV2h6eVkxS05ZZzZiWDBIa2tlWEVpdG4zcTFEd0dJK2Ix?=
 =?utf-8?Q?K6y07J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEhqdmFBUGFEK1NpMzFDWEwxNXVwVEVTNWVHS3lEclNUQUN0RzczVmlQV0No?=
 =?utf-8?B?Zk1ZRTJHU0tnOXphTjN3c1JtenFjNjZSdDd2eStCOXROakx4OExDRXZPSnFn?=
 =?utf-8?B?MmRRVHhOYTd5NEdlOXViNEF6ZzBnRmhKSGQrd2o1K0YrajVzZHRBK29RcWFr?=
 =?utf-8?B?RnNRejFBT3h3cWJpS3R2M1I4WG05N2Voc0dFVWkyN01yWFFReVByK1FlYXcy?=
 =?utf-8?B?NGJsKzRJNmF4dXd6ZXYzbitWdWhRU2Z4dE94ajlCV3dpRXZuK2xYRS8vZ01C?=
 =?utf-8?B?TllhVlcwREt2aHBSYndqYm1SSW9kcnRrUHVsYlBrZFFuTXVSVytQS0gxUUxK?=
 =?utf-8?B?YkhzUGlsWXh6QnU0dXVYYkpQS3ByblRDOFl4WnlndVR6eUpmdjJwNGZVL2J1?=
 =?utf-8?B?K0ZmRGNnbkcwQzR3OWFxeDBZcXNDeEhHYkV3eUExdDZwKzdxeWFMaVZPNWZX?=
 =?utf-8?B?SVMrS1ArNnVpcHNOejhtZ3hsaGt4SUJzbG9ib2RBRERSVms3L1VTc1A5TjNM?=
 =?utf-8?B?V29yOERKZGRpbzlNaHd6SW16eWx3VGU3R1JUWlh6V21tUEJiQXN1S3EzdU5R?=
 =?utf-8?B?dmdFYU1handNU2FTbUo2WjIwTnZjdmV5MS9CS3VkV3JjY2xnaVA0U1N3UUdt?=
 =?utf-8?B?bjNGVGRzcWdDY2dkS2JIc3lxTEE0SmloMjVoN3hvNTdya3plWU9xVGpua2la?=
 =?utf-8?B?c0diYzFGZTlTWGhLcWVYNFlKZmZxbGpxUE9JUEpHanlyTTdRSi9tMktBa3c4?=
 =?utf-8?B?WkFRRExXL2JiZ3hXVFl0elYwYVZZU3lvaUR2ejN2ZmMveG1pRkdzcFZQTUlG?=
 =?utf-8?B?RUk5K3NnTUdoRE5xL1Q0N1dtWDhnMmhKR2Z0RzNSS0kvQSs4eHRsVWtqNGJD?=
 =?utf-8?B?SU9DRTBFZDd6RHhjUVVxZjJaUFlWVGsrcDkwSWczM3R6MzRHZ2JkcWlUOXhz?=
 =?utf-8?B?My9kRlNCWmNKN0N5RDJOd1hlWjFodG9TUC9PYU1uYjMwUVRHejcySHVzdkZV?=
 =?utf-8?B?MjlvRm5XWjZzNW5LUXdackJ2eFArQ00rMklWb3hRbHBYWTNxNEtOZHljS2Zq?=
 =?utf-8?B?Q05FVGNlall4VnNlVGVrbjd6VVM2MVhzZXFSNk0zMHNsbHd0SWJSZGxXYzFm?=
 =?utf-8?B?bnJBdWxkMlRyWjJqUnIwcUM0eGQ4WXB0V3NydjhXQlZKQkVIdGJYNFcrR3I4?=
 =?utf-8?B?Y1o2UU1XVmQyL3ZkVmxOUDcwZldNQmNiaGY1OEhUb0kxTjVBY1RyZ1NJdGRH?=
 =?utf-8?B?WXlrVTZmeDBQTDNnUEp2QTU2RUZlT1M2bEdZSG9TQzRLa2JYenQ2NUtyNEhh?=
 =?utf-8?B?ZU0yVUFWMUtoUDl4ZDRPTlkwNUJtWmpuWGtqMng3SlE1c0xTT1RvenVtWWZ3?=
 =?utf-8?B?UEdwU212S005Z2JVV2F2SVpWU0RDNkdnSm5acTBhK3c3Z2VUQWJKenNKS045?=
 =?utf-8?B?bFE2alBqK3BHR3R3MVNnK2t2aWNQVWk0MXpmMCtwUXBFSHlWUHZQd3YwdGdp?=
 =?utf-8?B?eG5KSHhhbTdMcjN5Q2FGZzhOakdvb1FUUGNlTGYxL3VVQjBpM0lHU1BJRzlW?=
 =?utf-8?B?Y1RuTDg1enhISUp3bE5TSW5rTFN0RVF4dXFCcGtBRk84S3lldU1pYmEzM01Q?=
 =?utf-8?B?dWxwaStXSDd1RmtwZ2VicFNZYVFyZDY0ME5ZWFlkbHgvZEZuM3JveXhHNXdQ?=
 =?utf-8?B?dVQ5aE0ycW1odnA4czBKQUIwUmpUR3RtSFE5ZlAvTnNHNFV3KzhqVmxYN1dm?=
 =?utf-8?B?MGdPM1pzM04xQnlVOVoxQ1hjakMvMVdQVjJ3V3Zyc2RWRmZENlRhS1ZidjYw?=
 =?utf-8?B?bGFsbmRQekFVUC9oR3piYzcyUWRFY1ArZmdtSGJXYkpkeWZGSHhhbzRKN3F6?=
 =?utf-8?B?SWJEcktRM1A0b0RRMTY0OUFqVTFwTDRtVk93dGJHdVJvQjFpOUVlK1JUSUNV?=
 =?utf-8?B?OTdLVFI3TncwSHNnVnNMb3NCSUZpM05MTlZvOTFJTUFtMG5LQ3pkUDRjWE1K?=
 =?utf-8?B?SmtCR2tkQWsrWW03TnpuVXN1UFAwaThBZTFMbXV3bGRwNENKYkpNZGgxZHZG?=
 =?utf-8?B?blh3bFBINzZvRU5IalZ5WHdHVVI4ZnUrREtWTVJxdHdrTk4xOEM0dXg1eVlx?=
 =?utf-8?Q?ujO4uwkFjEda3IKgOWt0Ye3gV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c05e0c8-b89e-4bbd-8f56-08de3c791670
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:59:49.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3WjIWQfb5OOh1HWLyKvyqIr28DKJAO5aFvR1NcYD23S5RC+HyGJhRZqtfgflnTXr0Iue6n3Gzm2SJ81rpFvbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9788

In current imx-mailbox driver, the MU IRQ is configured with
'IRQF_NO_SUSPEND' flag set. So during linux suspend/resume flow,
the MU IRQ is always enabled. With commit 892cb524ae8a ("mailbox: imx:
fix wakeup failure from freeze mode"), if the MU IRQ is triggered after
the priv->suspended flag has been set, the system suspend will be
aborted.

On i.MX7ULP platform, certain drivers that depend on rpmsg may need
to send rpmsg request and receive an acknowledgment from the remote
core during the late_suspend stage. Early suspend abort is not
expected, and the i.MX7ULP already has additional hardware and
software to make sure the system can be wakeup from freeze mode
correctly when MU IRQ is trigger.

Skip the 'suspend' flag handling logic on i.MX7ULP to avoid the
early abort when doing suspend.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/mailbox/imx-mailbox.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 6778afc64a048c70a3afbdf44783ede0d1626937..003f9236c35e0943441b5e3cb01569451d7d0a96 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -122,6 +122,7 @@ struct imx_mu_dcfg {
 	u32	xRR;		/* Receive Register0 */
 	u32	xSR[IMX_MU_xSR_MAX];	/* Status Registers */
 	u32	xCR[IMX_MU_xCR_MAX];	/* Control Registers */
+	bool	skip_suspend_flag;
 };
 
 #define IMX_MU_xSR_GIPn(type, x) (type & IMX_MU_V2 ? BIT(x) : BIT(28 + (3 - (x))))
@@ -988,6 +989,7 @@ static const struct imx_mu_dcfg imx_mu_cfg_imx7ulp = {
 	.xRR	= 0x40,
 	.xSR	= {0x60, 0x60, 0x60, 0x60},
 	.xCR	= {0x64, 0x64, 0x64, 0x64, 0x64},
+	.skip_suspend_flag = true,
 };
 
 static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp = {
@@ -1071,7 +1073,8 @@ static int __maybe_unused imx_mu_suspend_noirq(struct device *dev)
 			priv->xcr[i] = imx_mu_read(priv, priv->dcfg->xCR[i]);
 	}
 
-	priv->suspend = true;
+	if (!priv->dcfg->skip_suspend_flag)
+		priv->suspend = true;
 
 	return 0;
 }
@@ -1094,7 +1097,8 @@ static int __maybe_unused imx_mu_resume_noirq(struct device *dev)
 			imx_mu_write(priv, priv->xcr[i], priv->dcfg->xCR[i]);
 	}
 
-	priv->suspend = false;
+	if (!priv->dcfg->skip_suspend_flag)
+		priv->suspend = false;
 
 	return 0;
 }

---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251216-imx7ulp_mailbox-9dd35bb9b94d

Best regards,
-- 
Jacky Bai <ping.bai@nxp.com>

