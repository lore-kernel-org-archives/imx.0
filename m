Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69EA3090CC
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061418; cv=fail; b=sYti1GGROqVf5Vc8/JfzLBhjdWoFUTxQD44U9xgWquf8+2MlnZ2m5odbeEHLB+5ThYbyXtjeQkWXyHDo62vyYBPrhXJ3kahEaJ8IwSM1mqL1r3310vRygc9pYLhd22Qyn+wN2VH532WnnOlJd704IE5FD9DZzUgvcK3nxbsrouo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061418; c=relaxed/simple;
	bh=mXq3WF6wR384JqmpS56wxPpfEUQ86waA9WixhD1KX04=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LWqQ4Iop/IGPmTsaHcWj0Bf3lPDe3WVv86bneuLbqFB1Od/mHda+GYQI2QiYHdJIRm/CDe5NySHfM0/QpHt7OwGjYURpT1P3NHJVb5jdhGjQPuuihGBkohTMkkYGzVixu2xa/H8mYVT8nx01RSHrZkfd/jor4V8clAzHzIqzPYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V9Ns7ZAl; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V9Ns7ZAl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7y/BUvHN33eyXzAAQZ4g1bwCEWoCiIN0zUnN2STTELlgdDVTFWYjQPy1OLlU8o28pz1E8NBMUiTWoyrUsO0B2BH/+KdIMoXXtV6aVKquJO21bziMwAZmfoluPMXekzLoxkZgK6s4Nx8evyILciUhV2cKQNRiHPWtRrxiEq8rya+gP2yS/O3ambDlaxEvtQmsl8JJlXCEw92rfCzJ+zr70g2K4OcrnBoU/CYwewzuWewF+btbqhSFkR5kOQlobyASzek/vwf1AFsswRW1F27mL0ytMMiqXbF6CXE51/hchSZCf1ptv3y6lASTnPNd6mulTvaECkrnitUKI5HkgEbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlwIoRzbvyBaHSf133DxzX7XAU9xZi1uRcVmYePh97w=;
 b=gSP2TArSAvE4tGbCEv/SilYYKTqB3iiGrvuACg4bLEPfRWjpnGB4Dbq/Vs7s73c7DIFK8Yd50uOLkwOCrAIQl/IHIx1h4v1uz9rbYKZv/fVqHAB3O8gdCHgnI+DRErhwsjqflkJmIQxgtSs6m2TvYEnxq3EFq4jO0O1Y17OvZbZ/LRcgxc6FQp4UJbJ5BVBp4q5f5AWl4uD09SOCHpZqAetZm4cfdU502a/VY2LSNXYNPlJPSH6dYZOC9OMYEFDmgAWFimdSaXwEIdlti6g4srOjA+UhcK8I9EpJG05CWHEenFe9bFwRK6gBws6zt3LW6uLlqPUHoSmBhV08IUR+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlwIoRzbvyBaHSf133DxzX7XAU9xZi1uRcVmYePh97w=;
 b=V9Ns7ZAljlxlmTOlJtuaAo4AmRzoyszdPuowQx4Duo5jehm4ad55W1v35vfvQ53mCS9gK400kxAVBDFCqp1AkZVxxSKURPBgPZ2S+Pi3227GcbbSB+R7d1pykEzuHrNyjVeUBOl/DLOvRi+r2ki8OGjupKRjLKblqW4zMvXGOlgLrsADZTcZvM80oRGThcbMq4nNare7+a/Op8dMcuvMUkoHUGjDywFzvAyqd8Vx2y7MRCmouI4Df7fXWm0yomw9F0/r3TIGAk+ifnBlAtVOamImH7XqaJQOHjAUUpN/dInfhmZ1lvannEvSEWwN5kDzYNfuJh7L8d92w/4GHbM9aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:18 -0500
Subject: [PATCH 01/10] ARM: dts: imx35: rename emi to emi-bus to fix
 CHECK_DTBS warning
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-1-434dd2643c3b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1573;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mXq3WF6wR384JqmpS56wxPpfEUQ86waA9WixhD1KX04=;
 b=NEdSB/WxhGSPL8xEDjai4Zax752V0oRFKwpp6/8N3PMNOD/RK7tFPsp93mCOFIhJzgIXnbaMR
 I5FMSFeRTDADxwtq1e459y0/k5Nspb8tgBmA3mD5LaCybWN+Y8keWQX
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ede0ea-4224-4f71-62ba-08de62935999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTRFMVoyMDc2T09ValJZOGxobXdkblh5UnpLcUl1Rkpia0NXaDQwT2xsbjNT?=
 =?utf-8?B?QmxteXY4ejR6d05rcUhsUWhlVWpoOGNjeEpRTm9ZZ24zTzJKL2U3enIxdys2?=
 =?utf-8?B?T3FDTnluVkdLNmJhZzNhd05zZ2VVRVlOT1dsUEg0Vk9EVDZkSzI2enZSUjdY?=
 =?utf-8?B?a296bldiaWM4UEhlZk51K3hTUk96cStZZnZ0cUVLbGptejlhRHVLQkYrT3ZC?=
 =?utf-8?B?bmVpWlBiOWVKN0ZjZkwxNkFFZmw0T0loVjZsbWRZTjU2ZnBMcjg5cjFUdDhz?=
 =?utf-8?B?T0pDR3pSU0JLYTg5RHplaXFheVY0ZXZibDluSENPdUZQZktrOCsyTEMzTkh4?=
 =?utf-8?B?QzRhdzJURnY4UXFlcDlyQzBQazVreGlzeEJPZXNyZjFLSkF4NFFlQ0sxTVM0?=
 =?utf-8?B?ZzEwenYrQ2Q0MHZSMXNxOGlWSEFIdWZrcFdaTXg5V2lHdEtMSmlKeFdHS2d2?=
 =?utf-8?B?Q21ZVEVqTURYOUdOUWIxQVh6TVlHUUhnMGlrajYvUnNnTkgxYy9NM0hZdlk3?=
 =?utf-8?B?bHlObWFTdDRaQzc0L01MWE5EMmthVGo2aDcyZzJYMmdDSWgvSU9menBuYmM3?=
 =?utf-8?B?MGlOOURmRlFXaUFnYWxrN0VXZVA5aGFNd1luMkNqVzEwVVBvOG1aeDNMOVdN?=
 =?utf-8?B?dytCRnhrRm9uQjlBVTB5Ri95aHlsbGhzeEhRdytXcng0bVZmWjBHN1dPTlNY?=
 =?utf-8?B?c1VQVm1NemtSQ2dpTFlWUVJvQncwbXFBVWN3SC9mV2g4eWxTTjQ1N3JjS01x?=
 =?utf-8?B?NHNSZW42UDM4R3kwZXBYQ3VWY3UvS0o3K3B3NkNZY0wrYzIrcHFsajhsTTBz?=
 =?utf-8?B?RnhuUGw5ZjFTK1dxOURvaHJCc3lheEIvajFwbUdCdXFYaXJlcDEzUUNRQlZh?=
 =?utf-8?B?d25uWDdjNnEyaUpxcEpQSTJtY21pUEUremEwd3dwR05Lc2hoMVArWU1BY0Nn?=
 =?utf-8?B?bncvVnE0YmQ3WDBjRmtsMlBkcHYxY0U1Z3Myb09BTzdGc2doZXk1QngvRHpv?=
 =?utf-8?B?emIrWG5aT25RRVAxQnozbzBkVXR5d1NBZVYyZ3FKY2c5eGM2RFBISk5oaGlG?=
 =?utf-8?B?eWh3V2wrOXpsOElxMlY4SzRQNkROWGdqMWlZUkczUndTdnJ0dTJGMDZENzdk?=
 =?utf-8?B?SDZjbVFvaWNZdVRZOEtkeEhLT2c2UmtaOUU5UDFsem1UTnAzaFAxeXh3MC9D?=
 =?utf-8?B?OFZhWC80clBBMjgrNExwcVZyU2RuZ0RrVjUzS3oyK3JZOC9meHM1aUJaVjVv?=
 =?utf-8?B?b3VOdWM3ckJmWjhqYTBjbTh6YklJVFlSZjMxdGZWZkRBYjM1RmtFWGdJWEdG?=
 =?utf-8?B?YXBVUU0ydFBnQ3orVFJaRWQ5ZGRla0pmS1BzeXpBZkdsVjVNSVAzSnhSa2w4?=
 =?utf-8?B?NmVWb1puVHVkOFRqNmJNbXo1bnE1TmFrYUtaNmZjbU1OUERUSzl2enlKTWdU?=
 =?utf-8?B?N2E2U2ZqTGZ2eDhnYXFSaklvbmZQRk1sc3FoSVd4bTd1dHFNRjFFWDJaMWRV?=
 =?utf-8?B?THdud2FWYmpZdTYrMnBPY2FBUCsyU2Q4RlBtU05HbHViclhyNW1WTDZqU2ZB?=
 =?utf-8?B?YmVxMklaT2ZUY0prdFpFU25VOURlQWYrbWtVbGpHVXpSVFQzOFlwNzJINUsy?=
 =?utf-8?B?QXNXSGpGNW5udFVzZHJ2UUtwY2g5RmNSUkV2WTJJaG9PYTI0RGZqbTRKWnAr?=
 =?utf-8?B?ekxOYzBIdHFPQ0tkM0FaTnY0QnQwSzVZVTl5bW4zN2lZSDFWYWtSWkwvN2No?=
 =?utf-8?B?eUF1bDJqNW5tT2lBTXFIZDAybGNhYUhad200eFZsZjN5NGlVcEo3ZTF6a2Np?=
 =?utf-8?B?VU4xUkhtVklzaDQ1N0hTZEp5MS94UmY4M0V2dk92L21rUVV3bmRSSmhwK0J0?=
 =?utf-8?B?bmRaVVltMG9jZVFvM3UySnVqN0haZGpXZ0RtRDcwNUVDWWszTXdCSFBqdm5s?=
 =?utf-8?B?WVR5QXdYcG1GS01QZzE4U0xlaHpwdGJ0dThoKzJNSEc1bFhrL3V4Y3JyOXUr?=
 =?utf-8?B?WjMrcG5rb3EwYzVDK0gyMkNycENDMjl0THkwWmdGWThTY0UxRjdxeWIyS1Ju?=
 =?utf-8?B?cXp3aXFZbzJJbE5kSXF2RURzYVBRK2pTWnpES3dtb1EzOUJtd285NmlYb3Bj?=
 =?utf-8?B?aUFBa1Z1ZXk5NndIaTNaaG5nK0wwMncrSHNGc2ZYQldKRGtqK1pja05IYkdP?=
 =?utf-8?Q?m2VmumNzwSID6dB8mBZBzl8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUdKdUllMTltU1BFNHU1R0U2Tzh0bUlrSmczbHQ1Z0V3WDRwUGU1ZmJRRGRw?=
 =?utf-8?B?dHI4UEV4WXVHb2RDYnkrQmRndEl5emZ5NysxVWNMSi9qV3YzaUJ2S0VZL05t?=
 =?utf-8?B?dDlSWURCZVkvYWFUdUZTT25oUUxoT0g2RmsrbWpEbVJGUUJnREdoYnAxWXlD?=
 =?utf-8?B?ckJTY2d1Mml2V0NzM3VSbHVJZUx0dVNFK0JtdDB6bU10QmIyUkNZOGVHVzdo?=
 =?utf-8?B?cmxMMmdlYVFxbXpkOHVJbHBJTkhFYS9QL1hWUWJuK0lWVi9FVldPZGJKMUJN?=
 =?utf-8?B?MUluc25kTDZrMG12NjNMd2FDS0dnV25TRzFBWldBZ1NCT29hMEx4MTJIQzY3?=
 =?utf-8?B?QnZUV2V5ZDJWRW9LU0VickJ3N2FOMnBUTzVEbk1KZWZYbTltNVRxQktTWTNs?=
 =?utf-8?B?Vi9TUE84b0hCWGhoc0VJSkwyZWY5MVo3SVJOZUxzM0lIVEMzVk1QZzVVVkdo?=
 =?utf-8?B?ZkpBTmFvbzljVnhHQVhOVEJOazEzUktoRktYeG5Hajlsd3YxN29CamxWdVI0?=
 =?utf-8?B?S1lXaVVvMmtQTjBxVm5lWUdRUCs5dmF4elN0RDhieE8wbENaRkdjM2hGSW9o?=
 =?utf-8?B?LzNIQUkyNGcwVGRoSWZxRkhLT2h4ZDR5WFlIR2xjUVA3ZWJMRmFreHlLMG9p?=
 =?utf-8?B?YWVXODh1VzJiSlFnOFl3M1VTakowcGtUVjBieXVTQ0lBdnFFSWtFdlF0ckg0?=
 =?utf-8?B?SHpjM0ZOZ1FXejB0L3VnN3podUNWKzhJeld2R2lPNEtQWjlDTWF1ZEJjKy9S?=
 =?utf-8?B?NWlRUDdyQ1ZZTkViRUprdFZ3UThHNkdqRW12WnVPeW1RN2d2ZzQzV0htN3pX?=
 =?utf-8?B?TXF3MEN6YkxKMC9oWWZyNi93azR4UUxYVUFGTlRQSmNnSlFVdVVaZFBTQ0hr?=
 =?utf-8?B?RUZkMGFYOEpBUXhoWEFteUJLelo2YStMUVRyMUcrR3grc1VSZHM2RFJrbkVm?=
 =?utf-8?B?cW41bCtid0tJS2Vpa1RRdnIyZjFYdklVVDdDSkZ6Zk80UFF5cnAydTc2QmJT?=
 =?utf-8?B?OXYxWUpBVlpRN0JKaWFReDVuWS9jbVc0NXRhUk1LN0FocUs5bEFyUm5OZzNB?=
 =?utf-8?B?Y3E3cVF6OE1sMzF3SUd2eG5ucHdkNDhUcW5RSE9lT3RKbHR0UUpFLzZCZHNH?=
 =?utf-8?B?OFpxT3AzSkN6WGorNjJXOXE0SW1OVnAzR1h2dDdLY3N6dUF4UDZYcEpuZ2Fa?=
 =?utf-8?B?M1JSUXVUcklxYTYydi9NVkxzZkJWNEdIRnNCQUNRUmcrRjZzWi9UYlRhWmM5?=
 =?utf-8?B?bmx5VVMwWXY3SGNCRVd4NktySzVoSUpEcHpwaG82VFd6MnZNUVQvOEtmMkZh?=
 =?utf-8?B?VmFkbzhMTHdHV0hCZmpwMmd3aTlvT28rUHd4My85K1B1VDJLc3c1UWU0aTh6?=
 =?utf-8?B?bWVFS0tvK1d3SjExaldoUjRSb0NxWUVUY0NxTXhUeWZvM044cVJrKzgzTVR4?=
 =?utf-8?B?cXM4QUM2RWNpblRGR1pUZkJuUjRPc1NEYjM1MGxDb0tZN21qYmI1K0cwSVd2?=
 =?utf-8?B?K3p3RUdEcm9qMTBQVUFLWDZFS2dLTmhra2Urc29rWU1xb0hqbFdUbWpidW5k?=
 =?utf-8?B?V0twYW04TnBvVWRVMW01OEg1MVpaRjl5RzdZbDFFT1diK1pYd1ZvU0Y4Z3FZ?=
 =?utf-8?B?R3lLMkwxWjZYMjRVbnMyQlVIOElNM3BsWTlVenhTSS9CcklLb0EwVVFDenpG?=
 =?utf-8?B?bEtEYytQUUVaZTBZaEkzMVBDZVg3U0N4RStPQVBKaUNVdXN4SWl0RGM3N2Z1?=
 =?utf-8?B?Y0tEVFZYdjNzRzhpWTNVclBDWk1hVHZlL3phMUkwUkdhek1FYkFKTXM1OE45?=
 =?utf-8?B?ZDdVMDF1RkRYQXlyUGFBNXJoZS8xdUhYZzJyZWRIUEJNN1pWQ3U2bWF5Wkpm?=
 =?utf-8?B?YnZsRHBxMWVuNWZDd2w5SFZJbmVNNnFzT1hxeUVKbDUvM3RvZEQ3V0VqZWNL?=
 =?utf-8?B?N0tlMmdrTGlnTXhhKzJoUG1qWTUrOXNVZ3l4ZFNrVUlpMTZ0eXlOMEJJOVd3?=
 =?utf-8?B?VStEcTVKdHprM0o4NXc2cEJCUEI2cFdVbzZPNWRCVHptaVJZSmtsMEJqTnBP?=
 =?utf-8?B?ZjFyUWN0cm9INnR4VmNIUDU3dG96TngzMnpGVzZQSVJINUlwV1JQeDVZZnY0?=
 =?utf-8?B?ckNBR1NvbFJxQWw1czkwQmRaZTZvY0VxeFFoME1qNkNZNkl6elM3MUl1c0VT?=
 =?utf-8?B?Y3U4blhJY2RTUGtSaWEyWUllenhxdWlIK2UyaDYyR2NmR2tScWN0WnZJd09i?=
 =?utf-8?B?NU5zeWdVbUp1UTRGckF2TzYvN0NtZ1dPRUtUc3JIeVJZN2ZsYm40aFBJdmRW?=
 =?utf-8?Q?tbZS2pCKGUY8RCXaeo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ede0ea-4224-4f71-62ba-08de62935999
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:33.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYOW177BcJ7fBBcrCZUtHOZMgkUXetpWk4JFqS1jLPXY0ddYAE/lryTkxc9iDxNgq8mQZKZo8rRTfsrCrmy7qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

Rename emi to emi-bus to fix below CHECK_DTBS warning:
arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: emi@b8000000 (simple-bus): $nodename:0: 'emi@b8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx31.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx31.dtsi b/arch/arm/boot/dts/nxp/imx/imx31.dtsi
index 8541a666747a94f4bc64ca4b48c709ed64375a9d..c58f855ea85143e28ff33b14951c470e14c56a8e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx31.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx31.dtsi
@@ -333,7 +333,7 @@ pwm: pwm@53fe0000 {
 			};
 		};
 
-		emi@b8000000 { /* External Memory Interface */
+		emi-bus@b8000000 { /* External Memory Interface */
 			compatible = "simple-bus";
 			reg = <0xb8000000 0x5000>;
 			ranges;
diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index 111d7c0331f504723ef160235eca1381eab0524f..1c010a83d5df138562cd086c7b10d34431378add 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -356,7 +356,7 @@ usbmisc: usbmisc@53ff4600 {
 			};
 		};
 
-		emi@80000000 { /* External Memory Interface */
+		emi-bus@80000000 { /* External Memory Interface */
 			compatible = "fsl,emi", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.34.1

