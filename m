Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03A92DFA31
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092566; cv=fail; b=A2QZXKFp0JpDssr8U3F2XWTO/MCxVxoCVSl47vr5Tx3c+eknzHGNahjuu5BCv5DbJhOoAOkl62wRKAyNW05o/gamOp/XBlzXuBTZ0e8OnnVp+w5dTrK4YuVpiJnXAs4J/7jG9Ox3RUhHodbNRu8fcd/xjd7Qnc8/IG/HL1XSNxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092566; c=relaxed/simple;
	bh=MRrHG6JmSqN25eXRTUPEWkAUAgHW0N1Hf5wODC4xFl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pHgAEhJRPAmeN6nhBtSKQifzZr+GDJPKxVCvPpDvMAkhIUvAhgtzce5a9cdQi5kQXMExOlFavPBMOIf7A+S7G2wWOuj83RXNVpVxqjah0RarOSA2ULZ+sE7l+FnISmcw0nVvS0XSHYqn6bNMlhno+UbqeQEJAqU2i1Z4/Xggcnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DIEQwspA; arc=fail smtp.client-ip=52.101.83.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DIEQwspA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irzgwBNJgwe6bDcezFj1GnT+/Qac4pviXxIbmIGVE/MICHcYcQvKHP/myqObzSQO/2GfUxUF8umfYQ2OHOpvZLAjEIBzHUOFiGZsC+TSatDzbdzYQixCGjekzjFv/xQFY/wN9aomWYYz+gwHnrnobXF/tFIHWxZNaLVqxCIwLa3OaCBiXETpktFmqK6uTtMRw8idnCB5+Wsr78qE8sqCIRkJhqtlEpUaMMUC7ORgf4zcN6kDgn6Iw2xUbBiW3mWb12s0C2ySLSVVYrP2eWP/vPBdm2fVvvv+o7tdAEOhzVSszg3dkZSGs6Kgn+BrVZZngt6lDZ3uxVgh10LxZncXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUvzOIpHmkLCGFixQTmISTozD4xMQswiQf10M3OeoWc=;
 b=uglNVNhRwdj5uVwWi03rgoe/koGZZ6HERnIIAWcmBPCbVXv7nbFJ45tuPWCJCdMxGynmp+F/pOeDSiviSM6AlXFb2oqZAggnNgBRzUvKwIR8Adm7pjVoMFwqpj1fFJauZ0jMxDsfabtx4EowsKPwPLs1oU7WK32nEPLYlBWI5BCzu4b97jSiXXzHuuU8T6Afrk8bAo3kz6Y+1KhlfHheeg2NY3pmPgudDCk/Zq9YzpEAjGXqLl8mYpFk/p36o2OENnBZWyyII9cJQbrSQSN+ZDdg2XX+9YqLVjlCjCCKh0RFgWa9kPmRwI/rIZ9FniF4idHM72HyOGFjrUzGb8T4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUvzOIpHmkLCGFixQTmISTozD4xMQswiQf10M3OeoWc=;
 b=DIEQwspAeuLaz32Z6OxTJKZEvWplGYHNmHyt353iwGj9w5ll1bNCCMrJoTp1KKlbWiIxcz7FIrqpmjC3L5EAStYPUFWkjPkrlGrtGnsF0RloIs7aKj9F68PGTIN8B1+5Lo87fsFarjj+Rj/advrLXwFa33nCklgCqHTJhS+CCL+Q3f9CNWv+Q5G64iOBH3ZkU1isCPvhyZ5EIY0F5OiAa+uAbAXGTHT4Qas/vcnXO0dEJzRgR4LdNWcmp38VJevAPpt9eAxZfIuhgZA4V/q7GQ3lRgGs+eryha+virwX6mBn2KIU79tbWlGcVrFHvacedkwB06uRFOrL5s9Sxnp2Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by DUZPR04MB9947.eurprd04.prod.outlook.com (2603:10a6:10:4d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 14:36:00 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 14:36:00 +0000
Date: Thu, 22 Jan 2026 09:35:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: imx93-evk/qsb: add
 m2-pcm-level-shifter-hog to enable BT HFP
Message-ID: <aXI1xgnkarGS0Min@lizhi-Precision-Tower-5810>
References: <20260121111346.2598783-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121111346.2598783-1-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|DUZPR04MB9947:EE_
X-MS-Office365-Filtering-Correlation-Id: cb40fc06-b076-49d9-b940-08de59c38fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXAyaWNoSGJuUERsSEdmMkNHVkZYU0dEb2VGS2k2RmNacGo0TWtLNHhETStW?=
 =?utf-8?B?QkpZSTlZZ3YvZ3ZlZ091Z1BVcG43OUpVeGpCam44dGo3c09KbllZZzdlVU9V?=
 =?utf-8?B?OFRCTEx3VzBzd21PdTErWXF5K25OeFJ1MEowUkM0WWV2UVRaRTFrN1BxeGhC?=
 =?utf-8?B?NC9GVnBPYzZxRHlVRW16MDY4bFE0L0haRkxnYmQ0MU9zWGVOdUVCWDNuV2Vk?=
 =?utf-8?B?ckRFMEJIa0lFdEwxVGh0NWRhbFZXeVErVk9XSmZOUWxoWlRVc1NRYlhuang2?=
 =?utf-8?B?YnlBbEYxbXdHMFdjcFJLRGVCWWljMm1vWUFsUnBEMjdPNVZzeW1RSXc3R1dP?=
 =?utf-8?B?aFZRT29yMVFiS1J3KzJoK00wWW9jQW5kNERvd1VuanRSM3Q1R0Z5dTRXY2FH?=
 =?utf-8?B?VG1jc05LdUNwdjhpNTNycUlaWFBFckh4NkxTMlFLbW14RmJNK1pxQ0lOOXI1?=
 =?utf-8?B?RFZHZS93ZFpXSFdpMUMzSHNJSzZVblg3LzZ2dWJWV28xZzhuOXF4WlBTSk8z?=
 =?utf-8?B?NFU2dVdYQTk4RGI1K29ya1RzbjRoR1o3TFBHNWd6SnNLN3lpMllZL0ZxL0dU?=
 =?utf-8?B?aC9SbjZlMlNPVFRhUkhBejJ5a3M5b0djTm9RZ1RLS0V4NnVEMnhwMEpRZTAv?=
 =?utf-8?B?bmxaMjFtMjBXTWZNVGhCa01tYXl1SDNkV2VPeC9sMFppRWJXS0V5a0F6aCsy?=
 =?utf-8?B?RDcyZVRWSXluRDYxQ3BvcVhZYVZlVXlpV1YreW4rVitIeWVVYjdneW9qa3hF?=
 =?utf-8?B?eWIwQmR0Yzc1NUUvL0twd0NFUzFLT1BPUXYvL2FkcERGL2ZCMmJHTkJKdlNT?=
 =?utf-8?B?bWRrUnRIMzNNaFJubTU2UlRIcnhVYTlTWWtJdHprUDlUU1AwTVRjU0dSS2w5?=
 =?utf-8?B?eDdzUE14T1VCYVRpSXlWOUQ5cnF3UGpNaDZrbWVlTGhqaEpERVRVNjZIb2lT?=
 =?utf-8?B?VEJ4eXBJWVpHUm9GMytvSitUNWU5REQ4Yy9Wek1WMCtVbjh4cml0SEYzbjVH?=
 =?utf-8?B?U0x1YW9FMVR1b0ZhU1k2bllGZlNJN3hxL1VjZnBHMGZ4YVJxYnUvWXhBeGdm?=
 =?utf-8?B?VHJ4Z2FTYzBhSncweFc4d2wzRnVaamZTY05jN1pVcFVxL1lNMUt5VWVyNUpM?=
 =?utf-8?B?QlhzdkpsS1dIdU0xQ1Y2Z1E2Z2laT0hWd1dwSGN6SDlnMGFaMDk1ZnFFUlZU?=
 =?utf-8?B?TlNjT2g4YlV1dS9lb3VWdGRUVW1ISURjR01XU3Zzb21Jc3laUzR4MTVRZXhv?=
 =?utf-8?B?TEZyMVp4ZTJZRkFFOW1RU25WMVo0NXM4OCtnQ3dudXBvQ0RwZzhtblNBNWxO?=
 =?utf-8?B?Y3JlMHE1WHpBTVBVbkNBZGlnVWRucW52VWRIRDAzRnYvdU50VnVyZC9obUk3?=
 =?utf-8?B?MnNQd0lONzRJTllXQlRDM25sbytvN09nMTlDWEVhYytnYS81Q3RJek92aFd2?=
 =?utf-8?B?OEtHSU1pZjlsT292amFNa3VzQ05DUVFzSFdFOFVUWU5GOFpRZ3lha0FxT2hY?=
 =?utf-8?B?TjB5YjZwdExjVjZpalB6c3RRQkpHZk5aWWtjMHpQUDRaZGhhUG1VdU5TRnJN?=
 =?utf-8?B?RGtkM1N3dForc3hPSmVXU2Q4anpPR2RONnZZbzVtbGxIZTFQdlN5eUxnMzRk?=
 =?utf-8?B?RzRFcDBFN1F3QWxzTHdnbGpKZ3FDMjRsQ2lScTgvRzBUMFZwTVJZYTdubWFP?=
 =?utf-8?B?SWVoL2plS0lQcE9ha3lyK29Mb1NsNFM2Z2NLSEtjSGpmdS9lRkpLNndoMUNu?=
 =?utf-8?B?RFEweFVkc21yZXNvSmdZUU5pU2N5bW1lRnFpOCtPOEVjQkUrbnZQUG9maXhD?=
 =?utf-8?B?Ym0zMXJrZGF5bkYwOEFVRklwMDlFU040d2sxdm1uak9EMit1cDlBb21MV3pS?=
 =?utf-8?B?emo5TERMTVZsaXo3a0doZmlMN2Z2M0dkT1BabGxnUGxHTEpLTlhWZ0hpYXVq?=
 =?utf-8?B?aDVNdU12WTcxWW5ueWswbEhQeXVSL2xpc3d0THUwaDBOMkx0UTZKU1ZFbG9t?=
 =?utf-8?B?dks0L2RDVkFYMndZZ0NWMEllQytFWWZsT1pHWDBLS2N5YmMyRFdrUldDMGJ0?=
 =?utf-8?B?L0hkalZSN291VkdJTFR1SzBqdDJmaEo3eWtjaDR0YlI3NkJZQVYreSsxVmdJ?=
 =?utf-8?B?Y252T2tTMnNhT3hNQ04vTytzTTRmZTMxRHNwaXZ0dXM4S01NN3Z3UU90cURW?=
 =?utf-8?Q?sjdpnbvqJZCm4MPSuOfHdJU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC9uQ0kzNUkvR1JHbmZvTFBWRHUxMTFGUUxMMU1NTXpvaGd0K1FPNzByUXc1?=
 =?utf-8?B?QXpWeDNieFVPTDQvT2R6UElIdUFkQUdlUXJEU2pibnUzWkNlSDkwQU5IcEd2?=
 =?utf-8?B?b2U0bkVnK3lkN0NFWHZHUVdXRkhQRk1aV2xQRmFxeE9mOVJ3V2VEQkRNM01r?=
 =?utf-8?B?THZPTkxEZk1oNk5kWWtEYWQ3UnU0VVF1Q09lcGFONlptL04xY0MrZm9reTkw?=
 =?utf-8?B?d0dXYSthWExRNU1JVC9hdjdMNi9pY1ZsWnhZeW1TK2xleUJkUlNCYzdHTXBh?=
 =?utf-8?B?QUJUYUpSaFBDalJpaCtpa0I5WitUaEh5QUpVd0x0dk5pU1AxZUlEbVFtWTFG?=
 =?utf-8?B?YSsvSzFTU2F0d29JYno5TVJibWZMc0NPeDc1b3p5TFVmbklFNXlCVXg5MzFz?=
 =?utf-8?B?QXVyNHJpVklDTEY2Vkk0bHl1Z2M4S1l2SmpJTWtaYW9ralMzTDdidEJBcktu?=
 =?utf-8?B?UXBMeWU3WjJrdXdIV1VBU3E5MFdhUk02cXVNQ0RuWWZBWlRLTXdRNFE0Nysz?=
 =?utf-8?B?UUJPRGVNUlJGR203eWZEbXAvZ2FCZWtaaWppdUpGdHRRbi9oUFNJUVNydCth?=
 =?utf-8?B?UkpXTHIvN3FkSS9qYlhCNHBud2M2VlV2aUdpT1drM1JQdXFsNktEd3Z3dk1t?=
 =?utf-8?B?MWNZbGlmeDFYNi9PelJmeXB3U3FmZy9nclNKK3R4SUJmbVRleXZ3MmxYZU96?=
 =?utf-8?B?VlExM1FSN0VSK2psK0JWRVdwc0lkK1FBMWRlSFo5bklEZWFybmFrNytSSmFx?=
 =?utf-8?B?eS93YlFMeVFBcGhUTjcrTmxnSUdpRlcyRVU2clRRL05WeTJGUTZLWnArOU1Q?=
 =?utf-8?B?dGdwS1U1R3hWby9pN1pJVFhNcUxncE56RGhoMExjdlpSdmZqemJCWWtLMjcy?=
 =?utf-8?B?K1pMQy9OTHUrQjZTTnBRR2dOK1hPQ0lmMUFNRnhEbkxQNjVVZzd0elg2Zmg3?=
 =?utf-8?B?SDhieHA2UUJZYUxnRk13dWNhbm9DZW8wc0xwdGh2NTZpeFFoRE9HdEtWYXRY?=
 =?utf-8?B?QWw4WGZIQldPbExwMDVibTRHT2RHbmJzdmx1SkxzbnQ4aDBzK2JxR3BidkJs?=
 =?utf-8?B?cWF5V0RhWVZzandtdERQSTAwdVVTNlZ2Y09vL2dTUDNKNTBuaEJYV2tGcTlv?=
 =?utf-8?B?dWpRVHgwNnhMVDdzTlFVUnQvTGtMakhlenFteE8vNERZWjhyeXhORE51STlE?=
 =?utf-8?B?WGRWQU1uS1dEa0JnQy92Qmw4TjNMZk44ekVFQ256U2diWmJHUkZxUnk0OS9u?=
 =?utf-8?B?Yms5SkJuSmNRRzNDMGJUMGpQZmtYMmZoeDJOQXFvU2Y4WXFaVFlwWERFejBz?=
 =?utf-8?B?d0FvMEoyWmp3WE9tUkJ6aE1JOTNTaGZTLzRkQytMRzNhdHd3M1hORDlGSzdr?=
 =?utf-8?B?RXpCUThPSEJ1dUx5emlkajA1M0Z6R0JxdmtTMloyS1ovOXVDWURLRDY0L2pr?=
 =?utf-8?B?Y3A0b00zM1EyelJyZWJTYVU3OGZYd3Q0UkZ4OGJXQVlscFBJZms4Y0d5OFpq?=
 =?utf-8?B?M1lxdTMyRHZVVVBpNC84UkQ5dUdKMjh5TFVxcWJIeS9rZ2VJZU1rUk9lb0dJ?=
 =?utf-8?B?dlg0TUpDeWVKS2JOR1BqdTU4MXRjMkpORHFsMi9QZjVMRVExNlpWVlBPeFdy?=
 =?utf-8?B?cVlNS3EveEdTWWpGcnVXQkRacEY0VThNMjJzUE1qYk1vdU9vVGsySy82ajZ0?=
 =?utf-8?B?K1Q0YnFRZ2ZvaVBxZjR0TTRlY3lacWMwSHU3QTJhZHJpVTVlQ0tNVzNoT0hE?=
 =?utf-8?B?MjgrNUx4NWNBUDdMQWlLNFJOcER6NnVhUy9JSFZnTzJGT3gvYUkya0k2YS82?=
 =?utf-8?B?cUczY3R5eEZ3QU5zRkJCdkN3MXVHRDMveGtxZko1VittajhGS3ZSTW1LbnFo?=
 =?utf-8?B?MG9XSVBxODVxUmt6MDhnYjd5aC9tVnA5STUwb1hCNS95SjIreCs5TU1xdkJ6?=
 =?utf-8?B?bGRrTDZzaEgrNGVCYkdaWXY3MnhDbGVkWllGak9UcWNoaURvYWNZRmVJSG1T?=
 =?utf-8?B?VVN6S1VodExVdkw3ajNVcmRoclVyWVpWdGJ2b3ZpanJ6TmZZMGIvMUFyL3dG?=
 =?utf-8?B?WHBUcFBQY2RwZWhVVVNjOU5KK0lxOTN0SHluK3FVSFBsRTRNNnVXVDdtZGhw?=
 =?utf-8?B?NkdzK2pxaklYVVYzMlpwZnV0Wmg2M1A0MHhydDN5Tzl0bTZKMXJyTi9ad1B4?=
 =?utf-8?B?d1Zhb3Z5M2E5endLRENMbkRMbktUbXVqbFN6THgwUFlFRmprb2daRkFOQnFJ?=
 =?utf-8?B?N2ZIazhRazAwVXRMeWR3MDFmN2lnZDRJaTdCMzRyYnVwOGNkelFsTG9qRGtZ?=
 =?utf-8?Q?DjWas9R4JrpPWnJgKW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb40fc06-b076-49d9-b940-08de59c38fb6
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:35:59.9701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kA7J9Q1DcoEz6V98u9kUldxlWq43YmU82Sk5CR9ST2VaaB8j5RKbWgVKl7+Yh34n/vOovdUr2LycOrrtbLR//A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9947

On Wed, Jan 21, 2026 at 07:13:46PM +0800, Sherry Sun wrote:
> For i.MX93 11x11 EVK and 9x9 QSB boards, add the gpio-hog to enable the
> M.2 PCM pins level shifter connected between soc sai1 interface and M.2
> PCM pins so that HFP feature can be supported.
>
> Since the HFP is only used at a later stage — after the BT firmware has
> been downloaded and the BT connection with the remote device has been
> established — both the pcal6524 expander and sai1 interface are already
> fully initialized and available by that time. Therefore, using a
> gpio-hog here will not introduce any probe ordering or dependency issues
> for the HFP use case.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in V2:
> 1. Improve the commit message to avoid confusion.
> ---
>  arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 6 ++++++
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts   | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index 8dd5340e8141..acb160d3186c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -356,6 +356,12 @@ pcal6524: gpio@22 {
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&gpio3>;
>  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +		m2-pcm-level-shifter-hog {
> +			gpio-hog;
> +			gpios = <19 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +		};
>  	};
>
>  	pmic@25 {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> index 0852067eab2c..11e08673083b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> @@ -349,6 +349,12 @@ mic-can-sel-hog {
>  			gpios = <17 GPIO_ACTIVE_HIGH>;
>  			output-low;
>  		};
> +
> +		m2-pcm-level-shifter-hog {
> +			gpio-hog;
> +			gpios = <19 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +		};
>  	};
>
>  	pmic@25 {
> --
> 2.37.1
>
