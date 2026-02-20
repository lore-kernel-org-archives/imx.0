Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9262413B7AE
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771590286; cv=fail; b=faLtSrDJjSqbtU4toJjMEmnliXsEhzv9Y2dRysXcv6bVovicHC2xetaj5s2Ah3ef9e65OtfwwXldwToLLYexZKJYwICQegqkn7tm4X/2QDa/64Y94+wgLvDGP4PV4fHOsRPUpLch4M3x89lNCI+2uwCljfPe/PPx/YmHsg1Atc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771590286; c=relaxed/simple;
	bh=mzyyW+9VIP8ysPaPvw0X3F/nFYWCIHv2BlVXicTh0ik=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b9SQxbVYnq1EGqqitF3QCsvVhWFhBCNxPCN4fGsN680qRl0URvsJnjH4XWMVcUOf0Gdi05kiB/DjPWLwjpw4QlMnQOBF8iJJmuRHgStACd63v1enuHnCR/P7kQmxCwosGBaRTyTJWs2jZdtMvsnzMPGpxVnn7t2L/23M2Ub9eSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KyRkTe+0; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KyRkTe+0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke/cYWTs5/FX9eEzQGUPqf/zB0VInM52CUZXUQLp0/TAAl2CA9uwa1Wbb9J28BMa+sANWbwCs54cW9G8HvKCLkwXfy5LJMX0/SJIoOdRcspXJSHFllwWm7aMHeUXCgjqbYd2uxvsZSEXRAVbjZ1wbzPy69VNSwXDwcxUaQ/B/IraGXQD9RiaicXkH3NKhCnnOSVsre7w/fH3V1GNy3fHFrmcUJ3MciKlIxcUh5UAkUXtX4lXOfJRNAflr5O+K/wougreF5QeFmYfa/GwRZM1AKKR9nX+3xLIoLIB18WTv3k4tBa5deoYtQjcPDRz1JjWuUOHVNQzcLHr1pJIw7o7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzyyW+9VIP8ysPaPvw0X3F/nFYWCIHv2BlVXicTh0ik=;
 b=Ygj4L9OnQq6zKYCo6FCIHdC1G6S+HoSR3EhA3F6iuTkbaOgIyRvId3OCwb2V1uK9dvJIAy+lBtVjSB9eq9y5CcARvrzNKe521mB/R9T7jfNQB920AMd/h71ixLSv8DEZ9Q7NNhTC8WQC1Qb/LwTOuRI6IRq6IFqZ0ncCf+eEsNc1f2czvKc5B2L7FXqkvClNyo/xa5Q5SfPCeZh0IHMprkgX/vOlAcTdnHDjuewt3uJj20/etn8jSPK6pX0NUMWB4hd8d4J1foMaMyF0cMEV3I/zhtMxKJblN3d4G5k3U0nMRnOz5GUhyC+xkWtNhoXXsfz0Gxx/glR5HCscT+qA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzyyW+9VIP8ysPaPvw0X3F/nFYWCIHv2BlVXicTh0ik=;
 b=KyRkTe+0RSqW1NYq+oK3jnSZ6t2ZVsO+Nr9eB0GWx8Byi1bs+xo5F6oYUVqj/nxWA67VahKPjkybAy4SpKSOxNyNCt4i+uoLC7D8b4c8Vxn/cKRQHGf0dpzy2nWGGP0ZT6KNN+ki1y0f9OWaOMEXnvIFBno0+JD2X4TrtkoMtVdU9yMU0FkYd4uL2uDjagemY/R6+qjqG0cc117mwK62sfKpHIm83QA8k9yuMbmj5RWL9HfaPH8dLlYFE3T4byRZm18eSSQzDE2bFyHfA4HPiy3xNLYX8/t+8lqGG8BU/qpYF5TQczmNEm79ViSCq+rlVJkIBU5xrBoJ9wEeDrQl4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 12:24:33 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 12:24:33 +0000
Message-ID: <53e69d31-c435-4fb8-8e4d-63a4e27887a1@oss.nxp.com>
Date: Fri, 20 Feb 2026 14:27:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines
 in DL devicetree
To: Fabio Estevam <festevam@gmail.com>
Cc: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260220103636.9697-1-frieder@fris.de>
 <20260220103636.9697-5-frieder@fris.de>
 <b1ac1eb1-41c6-4267-8ab2-cb5a72cc625f@oss.nxp.com>
 <CAOMZO5B7kYtXzKtguYe=2YEnSm6rwa0vTHJwn1p6pUqjgZ-b4g@mail.gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <CAOMZO5B7kYtXzKtguYe=2YEnSm6rwa0vTHJwn1p6pUqjgZ-b4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0032.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::9) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 3317fe24-acdd-43d0-5ba1-08de707b00d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3pyQ29rNTZBK1lYTGRSM296SzZpVEhzZzJmMjJoOUo2dTZydGw4aGI0Tyti?=
 =?utf-8?B?SEFlc3UzMURtZWdxWTdZS2xtQS8xRnRKZW5pZFgwcndoM3lvbFByd3F3VDRp?=
 =?utf-8?B?eVU1bGZDSVBjdjhlZnpjbW5ObkZ1SzFwcm1GNkZncWFiNWIwbEQxaVZHZmxx?=
 =?utf-8?B?TDkyalIrakVvNk9BbTJlLzZmUFFtR0tKSTlYZ2lLeXIrZDBtYi9IV0luMXhB?=
 =?utf-8?B?NStpNURqWXRnL2ZYdVk5Z1FETkUzUjJjNXd0ZmNMYWtQbmVSbHdheGJDSjJk?=
 =?utf-8?B?VUcycmoyS0JHYzdvVE1GUjl1YzkycTBiQlUwNkdjL0tRU2JmUUwrQXN3Vnht?=
 =?utf-8?B?SHFjRGVVNiswRExFaWp1MTFGYWNnalNmRitCb2pTQjdHYnlCS29QYXZrY25m?=
 =?utf-8?B?SS9DOEJwV01KY3B0eUgycm01RVYzV21tMjM2ZE9rdTVoUTNZS2ZPZm9wZStG?=
 =?utf-8?B?SGsvNVdPei8vMkNqVDQ4RzdaODcyRWJtZkw0UWNYVnF5NjBvdy8wYUtic2hQ?=
 =?utf-8?B?c2ttV0dYM2FhU2dPN2dya0xqaFFkK3RLWDBMcFppMnhHNWh6b1VMZUkwdTc5?=
 =?utf-8?B?cFd5VDdjT1BaOHkvTTU3T3dVTzJLam5LQ0Y4ZFVaNG5kRWJyaVpwcUovV3dq?=
 =?utf-8?B?NnBXTnV2MUY2V1p1RXEwaHNZTVMrcUE5NjlyUmJtZDBQMWJwUEdvcUF6UHdm?=
 =?utf-8?B?L1Z1SUJKV0JPbkZVWXppTUlyU2h6aHJTblc0c0tvcjV3TmhqR0tLb0ZxT1hM?=
 =?utf-8?B?TTlYbjY2M2NSd3RSQVZ2bTdMdStlaG4wOU00Mk1CSkFOUnR1UHVxVVZudHV4?=
 =?utf-8?B?cDlwV0VVdmVFRDlSYXpPdlFQTmVaS2w1WDA2K0lUTUtXQVFxZ0h1VE1NY054?=
 =?utf-8?B?QnZRdUhFQVFXUHJncVNFbGs2L3lGenZwVEZ1VFV1NzVzRExwSEs2bUx5VzVY?=
 =?utf-8?B?b1djc3Y1U242bExKQ0V4NkdYbEtUK0RLbVVaa0RXY3VTSURKT0xFdTBOVU1r?=
 =?utf-8?B?SldkcE5PL0JudE5lQ2t0ZG9lMXU2TnJmcm5CZ2h2bU9CWDRKbmN0RlR6di9v?=
 =?utf-8?B?clV1alhiUXFiTnBxTzFLdkNaN204S2VXL3c4SDNwTkZPVUNyc0FSVHNXRmNy?=
 =?utf-8?B?aExKWnlheGY4V3Jmay9FRGdVdFZmUVRPenFaanB3YWJiM01id1M0ejI2aTJ5?=
 =?utf-8?B?LzBOR3lscENlOTdJb3RFN3BjQnJvcDAwZU14YnBoRnFvdkFONUFqUUFQMktK?=
 =?utf-8?B?OC9VdVpRNDM3VjZzTkdQbmd6ZlFkY3VBVXRqdTZyVEFPbDM3TkE3cVNzWjcv?=
 =?utf-8?B?WEVRNXZTUE9IWDFBdzFMdFV2WWhpZEJNY2ZWZW5ycDhTc25DT3B5L3RZWk9X?=
 =?utf-8?B?QkFXOUVtV08wUDRpc0dwZDZXcjVtNFNoN3JndksrUGZwWXpHVTZEUzNUNGd5?=
 =?utf-8?B?aE1RTURlOTlPS09xWlRpbWhka21Na2YzMXEyL2UzeTYwSFhzYS9vOTBYZENP?=
 =?utf-8?B?Wkl0NU5PYmxrbGlQd0VQUFdKdXNTMUdBY2FkWWRnWTFYTTFXeVU4ZHdaM21G?=
 =?utf-8?B?Ym5qeU5aQWtQZXdoSFlhcVVqSkg3OVJBbm1kenNFRTNteHZydTNaSDdNYW9X?=
 =?utf-8?B?ZkN2L1paV1J4UFFqTGx5akZRYmJTNUhNRmlCdEp2Y0wwcjdMamljVkFTYnpk?=
 =?utf-8?B?bWNhOTdoQlFnSnpocmFVbDJ4SFhOVEQyRWcxVVR1SHZ4UTVNV1BCSGNaZExu?=
 =?utf-8?B?aHVCc2dIUmFJWnh1Z2ViV1haTmZ4WG1KOWtsb24zYjh4dVI0WWlhMWFEUysz?=
 =?utf-8?B?K1BkU0RIWDNFcDZCWjF2WWRLR2FNWlJnZGgyUGU1aHZneGxVdHhOeXFqaHRu?=
 =?utf-8?B?RzUvZ29OeFM4MmFmamlZdDk4RjRxRjJpR1RYQkJsSStzak9XdjdEYWYvaXJi?=
 =?utf-8?B?amF5YitDMGwvUUxIYnR0QXhTbHBVVXRRdHQxaUczUEdWWEtQemJTZ2FuVVZO?=
 =?utf-8?B?OFA5NU0wMWVnd2Q3N295L0FMSXlxRGtDNDFLWmlVUDhIWld0TVBNUkYzOVdU?=
 =?utf-8?B?NEhqMjNSVTZYcGFONU1WMXBua2xDbFZ1eFhxd05lMnEzUWpWbjNLaEsxSk12?=
 =?utf-8?Q?Gkac=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDk5NlJWMHlMV2VmM2UzR09wZ0lCd2ZpamI4MWVuMmg2N0VzWlRndmd4RXR2?=
 =?utf-8?B?RFZVbW9RMkE4WHpzVmZvai9kN0FtaXZqY010ZkRaR2s2ejcvOGRJSXpndm8w?=
 =?utf-8?B?SmhNaWNtWlJSWFlrUDVPK1k1REdxVytveGxWZ09vSFZUdnZrNVUrSThZdkFR?=
 =?utf-8?B?NHo1OG9lTk1kYjdvN1Z2TGI0REZzZEdMT1Y4WnhXWGc2OE5rd2JnTTZKL2o4?=
 =?utf-8?B?d1AvQVU3OE9Zbm9aYks5UERXeDlWOUZ0cUZQMytGWkpwc3BLR0N2bGhzRjd0?=
 =?utf-8?B?SGdXM0luQlgxakpNeEVzYUJSMlRXN3VSdmJpSUMwTlY2eDVJM0duK1JIVW9w?=
 =?utf-8?B?MTBGZHYxVFZTMFBPQTRuQVI3YURMd2lCWGlSbHZra0dPeDRuRkZmVVp2cXVO?=
 =?utf-8?B?NjdtL3lmTWx6RjY0NVJkdzRtQytnOU12TFREYVpwQUxZRkM1ZVprd0JPa1ls?=
 =?utf-8?B?WlZWQVh2MFFxbGt3Q3FERVpZcjE0SnU0d21BRGZlMFlkTHNiVzRDNFZXc0hX?=
 =?utf-8?B?TjJRWEZlU056eG0zM1Fxb1FjSWhUU0k1WnQvNkN4OU5kaEw1MjNZdmRxSFEr?=
 =?utf-8?B?d1p0WFFoZkFrbDdhMnc5NjVlZFZJRGQ4UWIrRVFQZGFmZnVVbndCeHdNMGQr?=
 =?utf-8?B?bnFTeGdLUVNPdXp6bDVHQ2JoZm1aQjd6OG9IaGRIa2JUM0hQYU1QM2tneEpw?=
 =?utf-8?B?RjRwczRpRkRub2NabWJDdHRPQ2JOM2RhbkY4V1lSOVFyNlJOMGwvbGZxN0lr?=
 =?utf-8?B?UzZKL1Y3ajZzanFVMGlMMUJocGFFelBHVzFZZHdmM2JlM2FsNUtFSzhSaFRa?=
 =?utf-8?B?YndaR2k5cUxCRXFiRmd5WGdWRitjQ3hMc1hCdDl2VWtSNjJJVXBEdm9nMXhH?=
 =?utf-8?B?enVreTZPclFWcUN0Z3E5bkZLb25haW1YWGV5SXRLMjNpdkVlaHdReTgzdG1u?=
 =?utf-8?B?ZkJpY1JxaGVna28yd1V3VDJpWEpvT1kyUmFzaGtwTFMxTllDSXBIYUc4d28r?=
 =?utf-8?B?QUZCaWowdVdhUFYxc0ppbC8vb0FBamRHK1h2NlhvbGF3K2hqeFlEYUlwWGh5?=
 =?utf-8?B?WmpER2hZTVBaSVlMV095WUVwelc0SW5IU3BlN016TnBWdU5NRHpIZXRiWWdU?=
 =?utf-8?B?OXhieUxYeE8zTUVQam1qL2kzK1h1ZUdSbFlWcEhlMDNKRS9BQjkwM0k2NzRP?=
 =?utf-8?B?eHJ2a3ZzZ3d5RmU3azdKVll1TGt5bko1ZW1rakIrK2hKRm45a3lTMFZxWCtv?=
 =?utf-8?B?ZGo3T1ZJK0hKNENvbmNHMkhlMVJhb05TdFpaVVp1OG5sdW9QN0lGMUcxbzlY?=
 =?utf-8?B?QU0zS1NTcm5lNkNjRllFZE1CYVExVUNLcG1TRkVRZFlLU2hVVFNnQTFCV0o3?=
 =?utf-8?B?ZVA5OENUUmoyc2xHUmIzeXhGTVREZzgzUVdrTXR5YVVBUkY3SlE5V0ZZN2tM?=
 =?utf-8?B?NDcrdmtsa2ppclMxZTlHQmpib3dreDVRek0zMG1VOHRuaU5QWEdBQUlia0VU?=
 =?utf-8?B?ZVF0SXlaNVFzL0N2bXhwTGw0L1BFNmgyNnI1Rkw2STFLNW9iTFNUWTJzMUJQ?=
 =?utf-8?B?QWdxQkJWU0l6WThBWTdReWx5QTlTTUhMckQzWWV3dHBSekN6SkJySnhOajdo?=
 =?utf-8?B?VWZlZlNkM0p6QkNLdm9Ic0pUUjB1OUlOdzh1bjBmR3NhVDNWNzVDTHB3b0Nv?=
 =?utf-8?B?UXY2VFlsRUpEN2E1NXh5ZEpveFQ2b3luaG1wNGV1Z1RUcnREM29NbjBWRXdo?=
 =?utf-8?B?WmtoTkVrSEcyQkFKK1JlejFEcmJYeWF2bDB6dkJmamhNckRXVmdPWFcvTEN6?=
 =?utf-8?B?ZFVrYVVMSXI0aUI1NFhpMWVtU3EzRWxXdGVCSDg5cmhQOERGZlp2dE4xVnZR?=
 =?utf-8?B?M0duSnlDd1lsai9lSUc2WExrUGVsQ2gyaDIxSWluZkRwa0tOb0J6N0xZVmgr?=
 =?utf-8?B?aG4yaUo0MEVxblBjUUFzdC9zV3lkYkNuSmhvdlBzbytuMk5SaERjcXJMSkgv?=
 =?utf-8?B?ZTdsRkw1TVc2cmRwSmYrUEtEL29tSmxQRVBsVUg5SzJENUhSdGs5NmNFUG5X?=
 =?utf-8?B?aytsdkMxZkhjdldkc01LbUo0WkVXWUIxbmJUb3ZRNFcyell2a3RVMjU2aWdS?=
 =?utf-8?B?anVkTEtNNllYemNLQ1NINmJYT3k0MDZNUnhZVGJZbDBzOFZnTkFPN3hRZVVV?=
 =?utf-8?B?YWpyYkhDNDNleTBhOTdrblR1OWtoZC9lejgxc0UrVkplM29INWdnR1dZODNx?=
 =?utf-8?B?NWJ5eWt0RlpxM0tXTUZldW1xcDU2TG51WDdScDIybDkySnM1TFlYL2xrdlUy?=
 =?utf-8?B?UWtWN1FLM2JSYmJ0elp1THZMb1ZKdWgzUkJOc2xqa1Zvby9hVm5VQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3317fe24-acdd-43d0-5ba1-08de707b00d1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 12:24:33.1679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOeeFXo1n23xgBv2br786E5gEA6ySNBnyjnZwJ84DK7sePzIV+Hmsu+lGwAMTD0NRHO7Z5faHvFLF5pM26yD0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

On 2/20/26 13:57, Fabio Estevam wrote:
> On Fri, Feb 20, 2026 at 8:20 AM Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>> On 2/20/26 12:36, Frieder Schrempf wrote:
>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>
>>> To make the code more readable, use the macros for the GPIO and IRQ
>>> settings.
>>>
>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>
>> Typically your Signed-off-by tag should come last so you need to swap S-o-b with R-b tags
>>
>> in the commit message above.
> Is this suggestion valid?
>
> Shouldn't the tags appear in chronological order?

Tools like b4 indeed are taking the tags in chronological order.
But I always considered that when sending next version you pick all the tags

and then add your Signed-off-by last.

E.g https://www.spinics.net/lists/kernel/msg5995225.html


