Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2602313E3A
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874098; cv=fail; b=gBOd+l0rtYL2QXGHkQ7yry0tT0IEOThe0VOxTnBMXIQwcpI32uoGW6DO5V8UObLglscKF0n/2TF9cxB0z93gEy2Z2YkTgZ6Fw7FyMYnDIddLbh2Uub0jifYQEadPSZ33XLOZJxU9JznJ+HsEol1uV6BCsx3+puYtp8YA1rRVC5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874098; c=relaxed/simple;
	bh=kwssKdJsZxCU0RNr1I/E5smt/2YD79wTSD6IjSGJj1s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LnB94Mg0xwS4rLmrYl1aHehY6PFSuOaHO+AJO3RdnMcuknUh8swnnquT/H5Ih3VHeJWEIYl4/dSgh8cw8VyFs8nOfpfIR+X+jjmxUNofqiT/BxuNhwUWdi7S5zEB1OBmVPxkeInH0pIMoEXq0zqTHVmB5bEOm5HKeKnJU4Vrcl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PCFXixrj; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PCFXixrj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDNXU5lJIlUhekWkOdBoWq+Dfg3ONuj00UQdgdtd8l3cwRxS0ErmCqxAbxvOqAikpfXV/HrxeOO6x6TbC75roK026aqxbXDIaIFWbMY1ymhnyS4VVlIE56FMQn6KmZDJw9wljJvPg/WsvkCLmYiW0Eljp4Qx/sQTfwsEk3NJc2Qi0yYf2Sto7AybYNIR4ccci9O9hxc+Q+CMGmF0MQI96yrFNqPkbc/YbdJG7lBM1c8Nb4+f3/gsm+j47j9wtjuHwMmbXg3t/GWQ+ZIcHsb/NfgKwK7w8Zt48nCIctPU4Nq2y+Xmmmc6rGbMqooAe86CfJEQR9ixv6GQZ9xLMmuRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwssKdJsZxCU0RNr1I/E5smt/2YD79wTSD6IjSGJj1s=;
 b=TZHgyglYt33KJZBSQbo3zQB6DuYg2nOkxvGMIN4/EFQijsHVLndf4RulTyIskpguNNFBKvfE8fjou8gWJshQ8U0Q5JgMdmrq8BxpEEgz222XHwnOq7BkYks7y/cvxPerIf6pbCHPYP4qT44yci4Ap1a7pMnK9M+dLoDYhMO4sSgG56+btod5vzE31DTi5kiuZZVxx4im/IOVZYeKUk3ALe+LwF4gpfb/rkcT7/EjzvAcbaSw1uDQbkXgSFur1F/0s2t0qekx7KiEFMwOSO9YarzVSedmCpdiTYpP/wkvit2HE8feEz7ZEYFMyI1VAfwwOzCfO3U+h75zdgW1EuUa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwssKdJsZxCU0RNr1I/E5smt/2YD79wTSD6IjSGJj1s=;
 b=PCFXixrjQxIg+UtzPQAr9PawqTfyG2Asak4Z0lsAISxJ0dFpS7UFpGJz/LU0pmvoimQDfTpwbDq8c515/zc2v63etzSvRPksmt3fJqRPPDbhIulMCwvzH281US2mYbzG0wMNtfcUUvps3jUesAIuV0AP/2+jJ01xyZzAKh8RogcA6BMK8/CJV+2jej6l3eRn3AdRaSTW8GlOakT2QDX3FtYB0u1kirJDXx5vxAgJoULG4m901jIaUrhDB8g+5CeKab91dsSzIorFht4urx+rs3hGPcs5BtEo8aoRSbjg+GMGcSxpFb+rXJJFYWdlVCY+bcHKhinETh6KIFm4dY9LYg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9484.eurprd04.prod.outlook.com (2603:10a6:20b:4ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 08:34:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:34:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] mailbox: imx: Skip the suspend flag for i.MX7ULP
Thread-Topic: [PATCH] mailbox: imx: Skip the suspend flag for i.MX7ULP
Thread-Index: AQHcbmH1r/yaC5z7uES2OQURUUYpybUj8Mrw
Date: Tue, 16 Dec 2025 08:34:46 +0000
Message-ID:
 <PAXPR04MB8459A075646D9C6956035DC988AAA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251216-imx7ulp_mailbox-v1-1-66b5bbcd3005@nxp.com>
In-Reply-To: <20251216-imx7ulp_mailbox-v1-1-66b5bbcd3005@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9484:EE_
x-ms-office365-filtering-correlation-id: dff37813-7eaa-49c9-a5fd-08de3c7df7eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDVBSXhRaVJXUU84Rjd0c0l5ZTJ3WnplcC9wb1NLU3FtK2t5R1p0elh2ZW5l?=
 =?utf-8?B?eCs5QjdkSklxbjF5K0tqY0FXU1FhbGNtV3FPUVJhSE5sNDkyczBUTDZkZjlS?=
 =?utf-8?B?NEZ5WXVIWEdpSDZQY0Y1NEMxTTc5N29zQXRBT1RRSXlNcExYUmY1N3VqTHZv?=
 =?utf-8?B?UDVWa05meUwwTEdadUJJM3poKzdwc2FhcDY3WEtFbU1nVlVXaHdwVDFJUTRt?=
 =?utf-8?B?UThSZ2k5OURDbWUvcEM5MGdTbU82blVVeEZyTXpPbmVzRmcyRUVpcjEyVXNu?=
 =?utf-8?B?b3Y4VGNVRDlZM0ZFbklrNHZ0RkwzM2pta2FRVVZQYkFFK0hkSDhpV1dtRVFY?=
 =?utf-8?B?Z1l3UFZqMDI0M21kSkVRLzRoSVhhejJxempYNXNHVHFxaXF5QjZZZFRFOUFP?=
 =?utf-8?B?TExTam5ZanRlR3F1cmdLVTlFWXczTTB3bzZzcTVrRzAxQjliOFJvWnlHTFc4?=
 =?utf-8?B?MzJ4UzRmTlNTUnZZTWZSZXVKLzhHQ0JDL1ZmUE5zVHlWUUNHMks2Umd3ZmVv?=
 =?utf-8?B?WjlRbkUzT1QzRDhzckpZaExaRjhoNVdWRUdzaldaeno5VlV1RGdiS3hKcndZ?=
 =?utf-8?B?UHoyaS8wcTlWcEp3bUtGL1NMSkEyMEtpV1RDL2F0eFJBM1JaMURrSUM1ZnRt?=
 =?utf-8?B?eEVhWDBJS0w2QjMyb3Rscy85UzNqakZNY25GL3NtaU9mMzN2RXZSZ0hERVM4?=
 =?utf-8?B?OVRDL3l2NzE5RzBkTWlSbzFSbU0ybjlGQ2dhay9zTVIyQ01kcTNLT0VNMDRl?=
 =?utf-8?B?amdNb3BUZ3BncmdlUGF5SWhZN0hoRDBpZlcvaFY3T0pJeTBZWWRWaDNTVDZH?=
 =?utf-8?B?cUlUSXpJTEp0S2Y3blA5MGdvZHArNC92dzlPL2ZwUjlDQ3N3dzVQUVI5K2Ni?=
 =?utf-8?B?LzJHbGR0N2thcDEyVGg0UFFiYU1xTXZyMVFWTHp3b0Z0KzZsZGgyNEc3aFJo?=
 =?utf-8?B?NnNoa3ZBelorblppOW5KRCszeHAxTHZtMXdBWGpOQ1BveDR2R0pnWmhJNS9Q?=
 =?utf-8?B?eklONk9udEtOUHNXZmJXUE41UU8wOFFwcnlRWmw4NFJEemdVaWlMMGYvWU0v?=
 =?utf-8?B?SkxROXBZS0tWL005aU5jcTl2STByMjFBcDdHQ0FMZDkyNWJpczBTbmRESU9G?=
 =?utf-8?B?T2kydVRmNHJxK0VWOHNwSDBrdkdLWnJWemNDQkFhTlhCWk81UGF2NUw3cnlX?=
 =?utf-8?B?VXg4ZEsrT1VVUUwyYnk5NU1xRTVaeEFyS0lXOTBqZ3hYckRWdnEwajRLdHJ6?=
 =?utf-8?B?c0FBM0xhemR5UFFLc25kTmhydGgwMUg2T25MK3NQL2E0UzJJNzkzRC9wZGJS?=
 =?utf-8?B?SFBLbXZiQmRRQ2ZGeGVWWWZ0OUI0UVNkSHVucEZHdWNWcitsNE5IUENQOGJw?=
 =?utf-8?B?b3dIL2s2YzRpWmJiNzdYYUMvdlYrRmYxWUJlYXhTUGFwZU5Ca2N2ZE9Ockg3?=
 =?utf-8?B?S0VPRHhnMWpVdnp2V3U0ZS9kaGJpT0kxRmhKUWRXQ211ZEFvcDRkZkRvTk9k?=
 =?utf-8?B?Z25FdW5RUjRhdzJXSFpDZHVjNWU2eDRISGFIckY5ZGdCMWxUK2wrekhScmpm?=
 =?utf-8?B?NG9PQlYyOW5EQStJcjJOdjlQdi9WZUQrK2kyVGJKQzY0TjBoNC9TUXVjZUpY?=
 =?utf-8?B?bC9PMXRpaEx1Q21hYlM2ZnlleThaRVRjSWpKdEY0Ym9wdlNtYVl4SUI3MEZP?=
 =?utf-8?B?Q2oyWVBwVUMrdGE1RERLamlnUXYwSnAzcmduOWxOZ25lcHZEbERQeUxsMDZS?=
 =?utf-8?B?b3JROEVuckJJeVBxc2VPbkJ1WThKQmJlajRnWVpnTWxVcGNwOWlmSmg1UCts?=
 =?utf-8?B?bkF3WVk3ZUFCSUtsRmJuekRXN21mdVdoSWxhZS94MDM2WEVFdzZYb1NoWm1O?=
 =?utf-8?B?ZndEa2c0c2N1SHQvWmNlaFZPamplSnh2M0REM2o1Q3duUzhmWHN6Z2ExRVll?=
 =?utf-8?B?WVNmbmNwNkptRGlsT05ZRGEwdFpjUXFkMDZkR2tiTDRwRjVCZWdnMXBnV0tv?=
 =?utf-8?B?RGR6QmQ4Y3E1bmhTdXdtMitGZjJ6SmxFVytISjRPZ1FYWXpDaWI0OFgwOEdW?=
 =?utf-8?Q?9AZx6J?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUV6WWl3UXZPNFZETnBVKzJNMzN6RzNFdk1UbXRiN1dUZUlQQ3JJS0NDampC?=
 =?utf-8?B?TTNjNkxIMVE4WlZYWFUvbEdoUEd5OGpmL1Jldm9od2I2YXprSVBzWVlmOE1h?=
 =?utf-8?B?Q1JmVkRVaEZ3Y1VhbkZvUSttWG8yTmFBQlEyTXNVZHNBOEg2cjM2dFpOdm5w?=
 =?utf-8?B?VU93L25sVmgxZXJ4Z1dERHpUbllITUxIblh5aDFLUE5aRTNuK2dsMklFTXRu?=
 =?utf-8?B?UytEcGRUbHYzaEE0MjlLZzBHaEdNL3NEYmVYRzc3NUdGSEowN2JQa1Ntd0o5?=
 =?utf-8?B?SUVIZ1ExWm4vRThWcHZxZGxpVnR0SWhEbVFqV3JKN2MwbFJpQktXLzY5aitq?=
 =?utf-8?B?eTl6clFDRUo0N3VZRFJkRFNjZWRHZThLa253elpLcFZMTHprOElDeUxKR1E3?=
 =?utf-8?B?dUw5WjRpRU1IRzRHYXVvNHBNeTZjYXdQeFFIZk9PZ2kzaFVzNm1yQkJ1a0xR?=
 =?utf-8?B?TEpXSUo3OE1OYTdZdWZVdlQyK2s5YTNqYWRTV1J6d0NUakNKSFd0NE9wMmR1?=
 =?utf-8?B?dFZ5R3BiT0h6SDhjVVlEU2ZyVGRsY3F1cWt2OTZoQzNOQ2FLRDJXTDgxeXNW?=
 =?utf-8?B?SzFFb21EL2NqM2NBZ2xZNUFPbDNlTmpyckJNUHdZUHNpWVI3bDdteUxsMkpH?=
 =?utf-8?B?dkNTc0MxTzRPREZKenorVXZtMEN2ZWJIWVY3RmlEN3Y1TWY2UTdMSHlNSjZP?=
 =?utf-8?B?M2RNUzIxaFVHSTZsbm4vamdsT243U2dUSDI0UWtxQkh3SG9VSUkvYVQyM2lw?=
 =?utf-8?B?RFJ6dDlnQ2h5Rk0wbUVMS3JrY3BMMmRSd0tkMkpRSnZsOS81Nm5XN1U2citU?=
 =?utf-8?B?YlVHZGVQbXVMZnJ1V3ppYUo5OU10Z25FbGlQdnBBQWxJS1N6Ym5mKzlqcUhE?=
 =?utf-8?B?TkowUWZmODE0Z3ZlL2RsaE1zR1BROFdnKzNySkpQOC9pMWpXU2pZN3F1ZExQ?=
 =?utf-8?B?RzlYeGJjMytySGV1d3JrMWl2b3FUZmNPZWQ2K3FZSWsveTVVaEkxak9JbHRG?=
 =?utf-8?B?VVArU1EzVDlnTE1tTkJTTzg3NjVLcVhnZ0lwUlJPOWdiWXlBcTFQZUdEMTlW?=
 =?utf-8?B?MHVRYWxtR0xzY1ptZ0lwdFlFN0o1VDMrUG5vUFpaS3lGVEgwTzJvSkJYMVZW?=
 =?utf-8?B?OEtkM0JMNXNlV0hvcm5TVENaQWRNTWNWM0lPOFRwVjhabFdxdWcrMEZSOEI1?=
 =?utf-8?B?M281VGNDZVpRcDFPcFFUZEh3d2hSSHpIelh3Nmc2bWRtckxzZk1FYXhNMVpY?=
 =?utf-8?B?MXBHMFpmMHA2L0RxYlRBbGgwbzE3Wk9NaFhXOFlqbDlSNk50R3B2OTkxbDdG?=
 =?utf-8?B?QmxTdmlaNzVVZHJBTzVGTkY5cVJJNGhsT1FOelJpVmNxLzMzTllCckFkSzRk?=
 =?utf-8?B?TUUxdERLdCtQMERHU3BSU0pmdUlxMnhNNnB1RW5vdTlTQ1ZacVI2QVlYSSt2?=
 =?utf-8?B?OThEdkMzQ1VxVkF3WjlqLys2cnFVRWpSSitRZythSTVvdFRZRG5hSW5xN1p5?=
 =?utf-8?B?V09EaFJtSGhVcVc0RmJNei9qY0RhNGs3dFVBSSs4b1VMSlQrc2hqa09DbDlu?=
 =?utf-8?B?dkU3d0NXSWY5MFZFLzgrZ09nZFFENDFnSzZJVlFadzRyZktUM1FDUk5zQisv?=
 =?utf-8?B?S1JBZWhrZDg1cXdZZFhidjdhbXFxT0JoQ0FjMEdaMFZnRFRzMGg4ZC9SeHNU?=
 =?utf-8?B?QmdHSnRjYjA3QzJ5ZmJtb3AzUndhY3RWU3FyRWNTalVpdm9GU21wdk1oYXlo?=
 =?utf-8?B?WGZZWUN3M3o3aEdMbTV2Z3VTVzZCQjIraG82UnVkR2IyMHBRRHF2ajdvRkp5?=
 =?utf-8?B?d3ZScUtFRXJ2Vk9YSTl1N1luekRhSjVqLzFWVzExL1p4SVR6ZWpLeVU0NUJo?=
 =?utf-8?B?Nks0OHBtZnUyRnNwRWhPQjN3Ly9VbHhqRW1zNlRvOURGNFVrenovRlByWTR6?=
 =?utf-8?B?NkpTU05YUk5ka3lJbkdqNjhpc1BLa1E2VXlzaUw5dDRaQno1b3ZYQUJqOUx2?=
 =?utf-8?B?SnpGckVYSEI5clFneXovR0FKcUExQjlNcVFJdTBJRU93eGtqaDdiQXhYMDNJ?=
 =?utf-8?B?R1VzOFFucGYwNXZFMElZL0pMZUhyWmZnOXpHVnJxcWloT3h2Y1FvRGloOEdy?=
 =?utf-8?Q?gOFU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff37813-7eaa-49c9-a5fd-08de3c7df7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 08:34:46.1100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdatge538aGV7jJBizv1MEjRVawmrfyuCn7ZN/tGBG3AoEYsRKFRHYekCOtA6TlkSwQra6E0G+kH1lqyG4DWxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9484

PiBTdWJqZWN0OiBbUEFUQ0hdIG1haWxib3g6IGlteDogU2tpcCB0aGUgc3VzcGVuZCBmbGFnIGZv
ciBpLk1YN1VMUA0KPiANCj4gSW4gY3VycmVudCBpbXgtbWFpbGJveCBkcml2ZXIsIHRoZSBNVSBJ
UlEgaXMgY29uZmlndXJlZCB3aXRoDQo+ICdJUlFGX05PX1NVU1BFTkQnIGZsYWcgc2V0LiBTbyBk
dXJpbmcgbGludXggc3VzcGVuZC9yZXN1bWUgZmxvdywgdGhlDQo+IE1VIElSUSBpcyBhbHdheXMg
ZW5hYmxlZC4gV2l0aCBjb21taXQgODkyY2I1MjRhZThhICgibWFpbGJveDogaW14Og0KPiBmaXgg
d2FrZXVwIGZhaWx1cmUgZnJvbSBmcmVlemUgbW9kZSIpLCBpZiB0aGUgTVUgSVJRIGlzIHRyaWdn
ZXJlZCBhZnRlcg0KPiB0aGUgcHJpdi0+c3VzcGVuZGVkIGZsYWcgaGFzIGJlZW4gc2V0LCB0aGUg
c3lzdGVtIHN1c3BlbmQgd2lsbCBiZQ0KPiBhYm9ydGVkLg0KPiANCj4gT24gaS5NWDdVTFAgcGxh
dGZvcm0sIGNlcnRhaW4gZHJpdmVycyB0aGF0IGRlcGVuZCBvbiBycG1zZyBtYXkgbmVlZA0KPiB0
byBzZW5kIHJwbXNnIHJlcXVlc3QgYW5kIHJlY2VpdmUgYW4gYWNrbm93bGVkZ21lbnQgZnJvbSB0
aGUNCj4gcmVtb3RlIGNvcmUgZHVyaW5nIHRoZSBsYXRlX3N1c3BlbmQgc3RhZ2UuIEVhcmx5IHN1
c3BlbmQgYWJvcnQgaXMgbm90DQo+IGV4cGVjdGVkLCBhbmQgdGhlIGkuTVg3VUxQIGFscmVhZHkg
aGFzIGFkZGl0aW9uYWwgaGFyZHdhcmUgYW5kDQo+IHNvZnR3YXJlIHRvIG1ha2Ugc3VyZSB0aGUg
c3lzdGVtIGNhbiBiZSB3YWtldXAgZnJvbSBmcmVlemUgbW9kZQ0KPiBjb3JyZWN0bHkgd2hlbiBN
VSBJUlEgaXMgdHJpZ2dlci4NCj4gDQo+IFNraXAgdGhlICdzdXNwZW5kJyBmbGFnIGhhbmRsaW5n
IGxvZ2ljIG9uIGkuTVg3VUxQIHRvIGF2b2lkIHRoZSBlYXJseQ0KPiBhYm9ydCB3aGVuIGRvaW5n
IHN1c3BlbmQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5j
b20+DQoNClJldmlld2VkLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCg==
