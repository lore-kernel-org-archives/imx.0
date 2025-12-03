Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1538729AB07
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744577; cv=fail; b=Fw3wU0RF4iFxrMbuTiPlxihbwOU9E7QVjAP6WBZOoh98m6JmnXBop+dRADIibq4LXtts2Qr+V/cf4392D+iRmLZ29C+tQkb6Qe9dZplKBEyxbdVxZUM0ESDwZIXu5ePNMqZXIYFy1bC4Om4q1hbYZDyjIyokKR40BPLXeidrthY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744577; c=relaxed/simple;
	bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tThyL4K7JUayt14zT/2QBfWbZxjcu0tzZv5rhEu2pAIlbwFNxT2FaXoUcrMLTzVUB+aR3DFl6N0wxNpAU5cvf8c6ScgkMV0cBNHBtOhrBj6wpkF1G7YiwkCiEjm1m5UuL3s20xJx6JN1CQeMpBui08yz5Anci/EspMGUrbLp4U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UvE0iZz0; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UvE0iZz0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8tPrT4FYfTeXJgXbrzQ36yJ6a8Ke0ggAgp+iA9llynFmVo+vigByspycegQQvEUH/WGEo9A3nOE2omb/PLESpzEGnqz5Q2RuABYAptCLHm+v0EcbR5BNilfdg/IBODtFv63FLyqtDvkrmZDjdwrokOkURz0EV+WyPQwFztRuFqU5wddQbgTQ45/hthly7syFlyxRY5dY8dO8sfeAbLoW0YMGvsRM+EDCFLGxi7EpzR9X7pjyIsvt8cxOawpRlfgMo0zwV3AClox0n4bshemWbASZu39iuoLmf3SD/JB7QKkBS6/gYi834qlxzhKtSQghTpIAWsYkr8zIQ3N1OphvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=Pp39J26nJjmMpsGtOSQfXRtlYphK3GjmSLpfz0eG/JdL0cLt9xOsAN11+6thDIRcxPpjOf94qACSkaoz973wAVtGHpUMP2+/V5muuh27U8clQqewtD7M7DUEMWU0TAXTXBV6yrI5QrSGQtsUz+pnkOk38pdP0aNR1exn8dNpdVZGNI3Mgh8QhJJI3gWzO03TbKkMqN1AUh5mLNxCcmDMciHVMkbRdaliOyVy596wqARUDeMgFYCyY44P6gJHYFrWYmGlhOAPBSHxfwy40OpGyuxk912p/BnU3bffGEVUwkq3flG+lNW2miNMjoxNuG6D4Jhd4+ft11LD3Fh0yWXJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=UvE0iZz0iQGKG4tg9y1sbFK6eAqAElO+qnmnlpyHQc3Qj9ks3FpX4ZuFkrySafRX9t37Vpgwrq9J606WHN6C5kFBXhv7BsN5T3Y0KaTg5FspIFJP6RnFRfgyblOGKVPJaAjjNcuZyo1gXbtDFFNPHyiQJLbvBzX/hFK01zrA/dGExcmJpvf39JEsWIsqH+jpkhErw1B1lfaOUG/fOCtjbD2F0L+Yv2RXbwwwOxt7pywUIPM8L/jHhTkAakIGL+UA0KrtJKf6ufT0K05tbvnvaCnHiv5QEJAaOJLW3KF8X0KyZaQRMJxTqVPy0rLweVn2p9JR5KJTfICwTdkrNgREVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:49:32 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:49:32 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 03 Dec 2025 12:18:11 +0530
Subject: [PATCH v20 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-imx-se-if-v20-6-a04a25c4255f@nxp.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
In-Reply-To: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764744504; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
 b=3o4TdG4nyKMFxgiIlwX/0iB7z2jxH2vj8IrfGCy3aUkUpkpqzppHIjWnFY3DywTC55t9VWBX4
 cs0oi1cHqroCn8SDWXMynT38GjNsOWldKfVTP5IQmuHFiLn19URstnQ
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e64e6cf-081a-4355-a3f3-08de32381d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3UzUUZZSUVGa3lSQUpTc3dlTTU2d0MzRTN2akRaUlRrck56YWtOdjh1dy9L?=
 =?utf-8?B?UVZzT1Y4VGJxWEhXV2FPWG5VaFZzWC9iRXNEMFdydXBGMlpWNnhBRWdvYkFi?=
 =?utf-8?B?emRsTmZSTFRhSlhoYTdoWUtSSWp2UzM5MnRORXU0USttQnNJMU85bHFNeGdz?=
 =?utf-8?B?Q1ByRGpscGlJVEdRLzlRamhBQjlQTVRYaDZvb3N3bXNZY0ZoSHNpTDZRMnhD?=
 =?utf-8?B?SnpDbUtqdDlQNGdZeVJscVVvUXNBUEREVGtDMVBQUnd1bVlqYzRrNlVYMk10?=
 =?utf-8?B?NXU2M0FYb1llREY3WktLT2gzVzlnVFhJZkNkZG95MFNoSXo1RzNTc1JWWlZu?=
 =?utf-8?B?M1hxL3kxZHA4OFV4WEJGdVZ6VnNXUUplcWE5SWxWQlFMbGFzT1M2ZFRDVlhI?=
 =?utf-8?B?c3hKUEZLSlpzejVFZDRhZnZSSnNadHZ6UzZmNUlpOGxWMUJ3d2pxRTdESFVp?=
 =?utf-8?B?WDFYam01WnltbDdGNUhGdXZ0RDN5LzU2VTNOdnRPTWR2amNYcjZaSHR1MHgw?=
 =?utf-8?B?WHpmY2xQRG0wekVMQkdMUktoeXJWZVozeTFPSWRrRHFiZ3puczRBc2pNUGZR?=
 =?utf-8?B?YVZLVTU5YWp4dVA0bnRQZDZyam9GaTNXMkU3bmxaTGJKZjU4eHlaNFlDRmpr?=
 =?utf-8?B?Und1bWtNdVBoVTFxWFVybTZWV0JpV2NLY3NIM3d1T0tWZkF0UG5hK254WVJO?=
 =?utf-8?B?aVJhdmFuRDNwMnpndnh2RStuVlB4Ni91L2dxMWZvV3FlcGcxbmE1MTBxNFp5?=
 =?utf-8?B?L2lDM01tRks0Q1NsSllRNEJFbFNqK2dUWnpFMXdIMWV3eXNONFpwemZkY1FC?=
 =?utf-8?B?LzRjaCtLc25IM1FTenI5Ylk4dzk3cXFhWnVFaitiRXlXN1F2c1U5aFMzQVMw?=
 =?utf-8?B?aXMzb0REbEwxZlQ4N2hlckQ0a3NPYllIVVBVMk8vMTFWa3RLdmVxWUNScjNH?=
 =?utf-8?B?WGdtbHNGUEY1bjRyOUhFaDZEQnV6bGNweC93WHhVWXRWVHZEYjBjOUxSSEJa?=
 =?utf-8?B?UlZPcURYNSs5TU1nMmo2WU8rME56SEVmSmhwY2FRazdpeEZhWGpLOUt1aHVa?=
 =?utf-8?B?RXJlejA4NHlSZnhDL3RUcjRZZUNHQmd5Y243UlJDZHZuZHlzNERnYVpkZWZ5?=
 =?utf-8?B?NXU4Tmh4QWw3c1huYmhYeDdRMW9DR1hjWEpVajJERFNxRlduMjBkRnl3QVBM?=
 =?utf-8?B?OXNYeXBBbTJQRmtGU0Fpak9Od0REZmFxK1NwQ3k5UEl2ditNTlU0R1hKU2hz?=
 =?utf-8?B?dHB4cEFzTXU1Mk9rcU5kamxuNjJmUnVpMjVSajdWS1dXSSt1cU5UckNRb3dH?=
 =?utf-8?B?ZVd5blVENVpFelRLTXEwS3htdjNmT2hlK0t4dkRuZWsyRzkwMHNSWmtGem1Y?=
 =?utf-8?B?cU1OQUlIeitwMmkxQUZPa2RMem9UWlpVNnloWG55aFhXMDFBZ21lbmVrb2RF?=
 =?utf-8?B?NUZNVWpIZW9VTm5GT3VobWhhbFhtSnR0SE1xSGkyclFKQlJwSjRyWFExSXV3?=
 =?utf-8?B?OHU4UVBpdmVNMFkrVFBoTmN1TDR3UXFkQkE1KzB6ZlpURnl3RFdwUWpaRnhF?=
 =?utf-8?B?ZzVXdTdqV2pCTmRNa1h5cXhqVGVpVVp1YWRWcmlXUDA4Z2s4TTJnV09oV0lB?=
 =?utf-8?B?UmthalVVODRZYXZYS2lhWjc5MVQ2blF6ekdDM2hPQUM1MDRFem40YVQ4V1hk?=
 =?utf-8?B?YVVQZUpHN0dkS2wxaW9oV24vNGZxTmRtbEowNHFuaGZubVhLKzRtUG9TWDFS?=
 =?utf-8?B?TkQvT2pxUXZSVXJqMGRpQU1sTlpKdXBGbC9TeVFZOTlvMWlodE9wcDlablRO?=
 =?utf-8?B?ZWpBdDg2ZjJwZ0RDQm1ldTh6MmtraTR1V1VIK0xuMnUvaTJsOXdheEMya0s5?=
 =?utf-8?B?WHNKVWFRMjMyc2l4eFM3Skk0SmRHNFhqVjlGQlVtaVZZbk50R2ZENTVwUjA4?=
 =?utf-8?B?YUpVdTlpTDV5cTNQQVZOMFYzYjlObnBQWkVGZCt5WVZ6TFBXMjh5NjFya0Q0?=
 =?utf-8?B?RzVBLzBCdEpJNVZwZ3FERVBpMUg5eHRrVHRFTFJ3bThZNTUvSWlXMlQxanVV?=
 =?utf-8?Q?fseQgG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bS8xeVJzV3prVjZjUlIveVp2VlJwaHg4ek1TcG1MbWdieTUrQ3Vsb3BxOFM5?=
 =?utf-8?B?TVhXaW1GdWJDYlU3TVlHdTNHcmlIeWRVTkUvSEFDWVpMN2hiUll1YmtDOTU4?=
 =?utf-8?B?TCtydlhCbE83c2pIZ0xjVEE0b2NuVGpROEpEVjA0Qk5MMjlBNWd4Qmxld0ZN?=
 =?utf-8?B?OVFZczNNdnZGdGNPWTY0RjZwc0txN0tGVVN2TFdKd2tPUTZqb21kc0FmM0dF?=
 =?utf-8?B?eDNqdjZXVXgzazhoem5GZUZleUluNElYQnF4SGZ1YjRIRndYM1ZUeHk0bEZx?=
 =?utf-8?B?aHk2aERxQ0Q2a29RanA2dUJ3c1ExZituNGZYZG9yYW16SWRGeEM1WjErVXR5?=
 =?utf-8?B?YVB1WXBVY3VGTWVwYkR6R3dnWWhpSGVrVjJsN0JCY05sNXlYUXlxU3lnOUlh?=
 =?utf-8?B?WGlnNTlpZzhEK2pkcXVDenZNTWhMbjE1WWExUVFOT3NIZDBZcFErUmlWK3Ev?=
 =?utf-8?B?dWs0SkdXOHhzNFFyVVBvZEVQRjRGZ1l4YjBBT2E1SE5yVkJta3JIbGl2WHVt?=
 =?utf-8?B?Slo1WVNVQ0Jzckw0bm5KbmRvWGV2NWpmRlNtOCtKaHNuOU5xdUwxRkRXMjJR?=
 =?utf-8?B?bi9FWFFHMmE0NTMvZDExQmI2ZkdpMk9oVFphZTdidlJoZm56U2l0MkpKdEdy?=
 =?utf-8?B?cU9ud2hmazBWWkF3R3BMMGJ1cW1tUVZuSGRoOVpBcjZpMlZFNEJ6ak1iazFz?=
 =?utf-8?B?c0w5WUI4dkJIbjN3VjZjSG41RjdGOE0zWWd3MlJNTVdITUQrK0Iyc3FLOC9y?=
 =?utf-8?B?STBkbzdab0JmOHM0bENvRk9WNFlRS2hZYWxXZ3BXM1hTQUZVQ2cwdzZCRjBi?=
 =?utf-8?B?MisrQXB2TUVQZ09UNGdreFlPUWdCMURyNzZ3SkZRbTlGN3ZkSHpNVHlEejdU?=
 =?utf-8?B?emY4K3JUK3JvbCtBQVFrZlpUSE1CdTh1Wmp3c1lxNHpJTzNiRUxUQnArWXhO?=
 =?utf-8?B?VGJoRWJ0VmFKVm5ObXRCb3d4Z2IvVkRReXlsRE9VdC9ZTXV3bmlFR1d0azhv?=
 =?utf-8?B?dVp6N2RCK3krM3kyeTRBbDQxU0dVcFRBR3dlejlKRmgyYTF5TnpLTXhKYzll?=
 =?utf-8?B?MGI4eXBZNVJBUjRJRVgrdmVFR2UwWHlVUlVlV0hReldzSmRRc3JBYVRpYXd2?=
 =?utf-8?B?Zm9UOGpSQmdQZ1dicWZtWXBjRndmaG1FUlBJNFozcHkrU0VwbnBXU2ZENkwv?=
 =?utf-8?B?ZlZYcG1JL1BzYW83WXp1YWo0TUVFTS9mNHlXQnVQbENjT3hhNkJDc1hOa1lI?=
 =?utf-8?B?MmJJbU1FZ0VWLzRoeTdNUE8vWVBCVm1JOWUyVlN1WkQvcm1DV3cwOG5HWlZU?=
 =?utf-8?B?VTZEN0hkbXNhaGdaNnRiV3kyWjl6dEltQmk3a0VUb01XQkRINndiTVhRL0lM?=
 =?utf-8?B?bEw5TGIwcUVvMnRMZ0djOFk1UGNUYzFSR0xpeERmVHY5ZzRycTExbU1PUVE4?=
 =?utf-8?B?NnJibm5EbG9PRFhTRzZidlBmUXpZdVJNR09CaFJuem5jbjFSSCtuKy9xTlJN?=
 =?utf-8?B?K0Nib2p4N1h0RVJZUHNXOGtGci9IZCtqbHhxemlmVzBiRjVIUjcyT3VYcXBr?=
 =?utf-8?B?RlJkNWdVWis1Uk0ySFg2bHdKanhGSE5zemgwNkpFSlpRUSsrUmZ0ZFFPa3FE?=
 =?utf-8?B?NysyY044VnU3V0c0dEVpTElPMytra0MrZWg1c095eUMxWVF3SUFzcjZ6UHNT?=
 =?utf-8?B?WFNvS0xTTU5kMTMvR3I1Uk8zSE9mTTRxcTROWTlUT292bTF2cXk2MWt6SjJo?=
 =?utf-8?B?TUMrRGhRVGsvT0ZJVjlmQ2tJcGwyaUhEYmJlUzJYdnRVM3RTSTRub2tVLzJU?=
 =?utf-8?B?WUwyMTdkTTJSUGJYL0pKSUlmVm9TUEJUeDc3YmF6L0t0Zlg2SXRSZVY3dkxF?=
 =?utf-8?B?dG5Da1hBMUlVOVNxcHoreExRdEFoczNldGhMK3ZOKyt3UlZoMHJrLzBBMzhT?=
 =?utf-8?B?STF2SG8rRTZsQ2JuZ2hhaTJ3aGpBOExJSkNWY0MwRmY1QmpvWG8zME1ML2pY?=
 =?utf-8?B?TnBOTGErV0ZpS2w3bU0zeWFMRXZlazhGUkx3K2pYckxiYzNuQS9TN3habkZE?=
 =?utf-8?B?NFRwZlhwK3ZuMi9nZDRqSGZ0aGpzV3k3ZXdSc20xWjBrdk4wL0JkZkFBRWJQ?=
 =?utf-8?Q?anyzxaNuyqCVOFOIWNlHmYMBw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e64e6cf-081a-4355-a3f3-08de32381d36
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:49:32.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFHngN3BAamorX/B0NiduMbsWkt+fWs2SiGnXOxt5c8iJKietMQfnsL7Qn0PRfd/wklxz+VM8PjA1XY0GlohRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..10a4779dd24c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

