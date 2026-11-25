Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634831;
	b=jKDvKfb8usVD6tj2Ruy2aFrczKNHBJ4jQDKoMjfne3hrnbTTIewCD7YooKdUx9bmQJeL
	 9Vm6KPdNKJzLjpROuw3AhBrvOqbkhYBWeRtlYf28djW5YpxwvTuUT0DSxQKYEaslWMhie
	 2KU2fj4GzPhDbZVevzPobWlNz0rlhMuopViRGCgjDh8Cf3VBNZ8GvoZb8vXIdTAhb/UIp
	 nk06UZqexeEys4YHnbVHG0XL0E+ZjjYmGPvhkToliGjuGzil59eLWwbUt4g0magCRXISt
	 Lafl1+qHqvGFP/lVfmLZ8OoYuNW5LwH2AGBEPjO0tKn6Sq+Jsl8MIKDsOE0JKdUQzbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634831;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8kjJvWJQTYAwumT0MFlohMtFc9XBDOWISkn3c8EKc2g=;
	b=JP8NCITUJjq+yAtKpKXkv9WO+kjQVHDdr6BEEROTO6jgDn9v91zRh3vIX4eopDFqUuGJ
	 uBhDwB4zt9RvkFTEB0rVZRxXw2NBOKJj40AST+JdbL3uD2N+yIdarXPbAB9inZdLHkE9f
	 AyBxkSBdbAOPXa66eFdvuHEPSZo7q7qTTYGOhBydRo6Pd6t4aN/j00J4MYExsjSTWz0yM
	 39A1z/3NPL+DVGuObx9IeV8hwf5KFxtt7OxPcmhuE3uffaUUmARcO0AiWZjj4Y8//nZfW
	 Weh7srjVHxS6jRR+D2CTgZLSce7jeTgfYmx6zpxtLcausR4X5iD2jvT7jiCBUc/wv5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=U0Qkd4og;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.12
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DEC606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 19:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DEC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=U0Qkd4og
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8SotuQieuYzAqE0M0QplUGMd2PsGONjLbkJLtGROv+ww6lS6UxolvDPiRz3oOu/tPy8W9ALPou2iLyMsopnxjp1L/uwy6PijDhWe31Idip1GZjyeFskCrzTw/FbTicsjv6dEgR4E90P8viACT/KLLtqU0kBHmbjO2drnk9KGgejL0iTm6OC90plPw67WobxW4REYnuDCNcqHXnm0q6Gtsps554o0Ar7JF2MVUckct4D2eLaK+cjbgPm04TPhDBNY2HxDa/YusQHO4HXUmQLlmWyfLFqPO+V+ciTrZUsf+Qldmvky/1oFK32HHOVYDCvQ1S7mHrLUOpJrRQgjCD82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kjJvWJQTYAwumT0MFlohMtFc9XBDOWISkn3c8EKc2g=;
 b=pEDxzy3kPtWDef/y0kex7A8twPrNwInIY5M6Cd4yzhSvr/VTqYA+vjwj6glo3t+IYOb2vZXjlso9gLZazDvKg5EPFl/27Ef1EhqB3a/yVixxc68p+UmiuIx5VA5ePHaYxypmcZcZ68N8lTLKvXf+u53M7tFCLcpoVXrvEjRGx5OSmYy/jbZvIzd/WTgF5gnnG4GHr2VmHCd7PhTdgbkBPdodHlb+WpC6vMw1NVBaNGS4qTIKQ98D/PmVWJK/wtTMScxpjPMBWhvnEcMvVI+OlTcOLPcyITIsHStCZcRrOyowNUNzsMZXx/l2/8R8oQyfzWBNXrJRicivicXstZBItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kjJvWJQTYAwumT0MFlohMtFc9XBDOWISkn3c8EKc2g=;
 b=U0Qkd4oggW5wXvOfmVfJeT/RE2V+1l5Hzq9Q4wUMY8yd1PTUVJo7d/bIFxk8Nq8EMtfRxyKhu1CiHbkE7JCa+ya8EE5tAFtMQoOuCXlYzPo0bsCwEs57N51O7CC2UpEKVRn2EYhriWGV5yhxcWLwFMiuce4TELcyl74b1GX7x625ILy7qP2Z0LDyyZs93sqh15tou18itEn10oP9PCQXxlY/BNGaRZyNoQVb4Aw20WycSlx0CsXttHWuulWGubkDb4GJEh3T4p4wPvL5ltaUjPsUiuym+ATgYNBo0k9hP+m0EwRMfDBZPuymnQcRMLRp8z/le/6Se5nIRqTX3mLdNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:27:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:27:07 +0000
From: Frank.Li@oss.nxp.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Ager <florian.ager@bshg.com>,
	Haoning Cheng <Haoning.CHENG@cn.bosch.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Qiu Guochang <guochang.qiu@cn.bosch.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Wed, 25 Nov 2026 14:26:48 -0500
Message-ID: <179563479881.3280595.2598133457260209600.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125180316.882220-1-dario.binacchi@amarulasolutions.com>
References: <20261125180316.882220-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:510:323::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VE1PR04MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 12eee6e5-45d6-4eb4-2e49-08df4b2a17cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|7416014|376014|10067099003|11063799006|56012099006|261022075727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hYIX4cvOPtDlWmZ/wh7om6ejD4m4LLdB4Npfzx+IzmKPkXOrPGk3cI1+UmW5GWKeyLWHhRUYrabgf1GD4mxLR92VsZdu7rZcFdtxP/sLIaiMAF2upfhnchtoCGZPHE0/rwJ06xs5sQXn9JxumL8fPLi3pnMgQ2z45S4YshJuYAB8zrh1HGyJ46I5PEa999Dvk3hz5ELGWqALwXNx3A5fhZnsFsajXXHzGkVBvcy0TRAdnmPZhRWJ2md38K9rPtklHSGSQp5ONoINP3fHKq+PWBE6/tcUfqqzJMjg8Xg04OJRpKMegw2n40NU4FeeEBJUbLeTVg3cGUrKo7MRro7rFM5CI5gKgLouUbC1v2hlHk6qCAtQforoLKPjNppE3aP3xdtkBnm1Z94WxqNpbcnRZmcihXYVwWpBWjRNeZ/77pm+c8vkyF5rLiKQpTrDl+7MYfEIxkAYryvk/f/ydqR0WPBl5Szv9JSYQaxgEahk0OUtWxGaFYRqu2hqY9+n4dV5hsTsDMatH1k+s7+Jpw3ovAD24k+Vo1CgvDbc3ntfoweSkYhjkU5TXJ1O9qlFMi90myqORcj1yJkmPI+B6vAICuQ6yViiLAzWc55RDe7cucOZoh0dplSocv8M817y5dXb/VNr2FJG1UPr7jF4GmuDHZosrwEB3+w6Ma92SlFl73Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(7416014)(376014)(10067099003)(11063799006)(56012099006)(261022075727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zi9PUVhEQlFlWG5yZkRzdGcweTlSUFg0RVZuYVk1U05hY1NWV2RNekk0dys5?=
 =?utf-8?B?Mnk2RzZOTGR2cXcwQ0NCajdQeWxMTy9PbmVjTUM2ekpWVTdhSE1tWmMyRlNY?=
 =?utf-8?B?K1dmV3djVWZLdEJ1ZG4vM0NuMkpjOU15WnN5a1diTHBTamFBUTN6S0kxU3RP?=
 =?utf-8?B?U0M0QktNeWVQYytINnZWNjFXNWFpLzlwOVNLTC81a2tXS21CeldUN1gzNThE?=
 =?utf-8?B?MkdzWSsvRDFDY3Q4QUdQZlBheW9HTE1vOW9Xa2lhbzNsWmxjckgydy96UTBo?=
 =?utf-8?B?WkFJbFFnU2dKZ2NPdkwya2VCMUlwMnlMTFRaZk5hdVIrSFBTOFRYSFdrMEhR?=
 =?utf-8?B?a0FkRGZlU1pySFFQa0JFZ1gzNlBjdlNkYVcyYTlKK2J4RnVadGFYeHM4R3or?=
 =?utf-8?B?MXp0MVFaUDVPMEN1ekduY0RqeFVSQnNnSkYvd3NIakdVczhYY2RKVjFwc3ln?=
 =?utf-8?B?SHdwQmIyVzUyZUpGYTBDWm00UUphTEFvR1FvYVJPYkhPZHNhdTF5WXg4Q1Ni?=
 =?utf-8?B?bThtZ0tkdnlzNFpzMGRVUW1WT2dnR254OG81UDhhQzBzVFNDdmVkZ0h3WVRE?=
 =?utf-8?B?akNZSDhDK1ZHMEJER2lrSTA4VGxML0RpVDhmQm9CYVU0bnNZOW1xRjNMS0RD?=
 =?utf-8?B?QWVUTXJiYkNHejBvOWFFc2wyaWlibU1NSnpKZWlhaGh0UExBQWtCZ2VOMlk1?=
 =?utf-8?B?U3ZYRXcwM2ZmM0wwaDNMN1dBQ0o4L1pYck56MGthSStjdThpR2EzaTlQZW9Z?=
 =?utf-8?B?YkFQdjM0S2ZtcHZPSVBMRG9wNWRXekt4anBlSDYwbk9TU1hCTFhMeEF1S3hT?=
 =?utf-8?B?RWpJVSs1bkZWQjdvSjBuTlF3bWxmbmZVRlFyQ2NINVFWc2c3c2ltaGx0OC9Q?=
 =?utf-8?B?QUgyNHFpS1FVQXpUNURMSDJWMnBPSkZkbjNpQVlFRjlvS1RyUTB0Sjc0em5Q?=
 =?utf-8?B?VEEvYXpwUnpjdTFtVkpwbmxFcWh6YjIwSXlKQVMxNzVwYmlCeHNqd0xrWmpX?=
 =?utf-8?B?eXZwNE4xU29NMmZubXRZVkVqUE94OWZHQ2dURWlIdXpKK0RTZ2cwMlNORGZz?=
 =?utf-8?B?UTJDdVE2M0hybWtCOHRmcjJEL0lUMlhuVU8wbENJd1hvNU9RMDhqb0Q1MmpC?=
 =?utf-8?B?bWZnRWMwcG5VSnFzNWcyR2dVbms3cmtkdnN2cVlMMkNWTnRFNUxvS2ZISjdy?=
 =?utf-8?B?bDk4amh5Nm4wWFN2NHFGcWwvKzZqTVNOTmk3VktkTGFwbXRWVXNvOGRYTC9F?=
 =?utf-8?B?T2E0ZzJ2TFhobmU4MnNXUENOMDFlTk9IU29KYlN0dDk5WGM3MzJLN2JTQnpl?=
 =?utf-8?B?c2NkeTRqLzQ5U0t6a2RKMmRvOUUwTUh3L1hoWlZueU1LL0tGRytlbHZtanJZ?=
 =?utf-8?B?VDZLN24rc0s2dENrNUhtK2FTYjRJWmIwS2VjT3Y5dEZSWnVFdmovc1R0VDlD?=
 =?utf-8?B?UlZnMHpCUVZYZmtFdFVaZ3l3YklRaEZZTlJ0bU5JOHBpM2xGV2dlZ2ZlUXlY?=
 =?utf-8?B?Zmthc3VjSFc3cHFENEloQVpuMS9jL0QySzc0YU1ibGxaVHRrZ2pHcXdOU2pK?=
 =?utf-8?B?dXdHb3FGWGR1L2xXT0h5T0xlM0RHLzVIMW1uYkVLbzZDU3hnUXRnbW1jdkp3?=
 =?utf-8?B?VGhKWFcvaGF5S2dReVl3UEdtc0NzTFR3NDkxRGUxRWo1SjVHZUpDczFudkQz?=
 =?utf-8?B?TmEwMHZ4ZFEwM0luSmJFeEZsbW9hY013QXJndEZYVmZYQTdlS0h0aUhnZmFI?=
 =?utf-8?B?MTIybkJWTDlaL2gvSU9Qc3dreUpDMHJJZVFkM0dUMUphYjZFSmRmOGNsSWxW?=
 =?utf-8?B?RVpBbjEzNDZEZjVWTTFXVzgxUUppek9ieEdFYWQ4Tm50RnJ0Q1krai8yVHpN?=
 =?utf-8?B?dzh1TnQrbGtzcStxYkdaK25BUE5TdytKcEtIUUhMN3QreWlHOVYwVmRKNkFF?=
 =?utf-8?B?SHU4bmQxZ0tCcmlRNHo4cko5aWRtakZMQXZ6ZFZjVFBpKzRmL25iaE5Tc3Q4?=
 =?utf-8?B?cENiK2lLU0thMGhORDR1VjZReFdwZWlVdDNlVU5ENkgwTGhqMzdLUWlqSzJs?=
 =?utf-8?B?Y3pkUUc5L2FBYzJGcWFpUFRibktLK2tkVzFGQnlEY1kyY2IzcC9qV1F6MUtk?=
 =?utf-8?B?QjZGUHB0NUJUa3BnTlIxZzBjbWpiRHVsc0ZvY0d0KzY0Mkx5V1BIbTUvenJn?=
 =?utf-8?B?cm5JcGxzR3d1Z0RLTXU3MkpLazNYVy9yMnN0VjZtOVpTcXBhVkZTM1dYOUxE?=
 =?utf-8?B?QXlMaUlsblpuRFZyYmg4WDRmRVNKVGkvNmVnOTV0UEtPUWUxejMrSUE0M3cz?=
 =?utf-8?B?UENKdDYyZmJFbjZIYUlVdHpqeVZUWHRLaEkxT0VSOFJrdzRjNHV2VWk2by9Y?=
 =?utf-8?Q?6ZZeZy+tWO7wZPeqpoj4Tjts97ypxd0ODsLVs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eee6e5-45d6-4eb4-2e49-08df4b2a17cc
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:27:07.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eYE40h4jnjkE2qKK8rhugNU3Bff5BOdTFUoUvlcVviIACaJVcJwL1ZLqiZWRUi+qM1cOeEVJ3uQ3GXYp1fD5J+9oCS3wR15+43vHahpceqFoH1BPfAareJYCga1bbYU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390

From: Frank Li <Frank.Li@nxp.com>


On Wed, 25 Nov 2026 19:03:11 +0100, Dario Binacchi wrote:
> Add boot phase properties to the resources needed during the boot
> process.
> 
> The BSH SMM M2 and M2B need UART and NAND access.

Applied, thanks!

[1/1] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
      commit: 23ee270cda346946a155ec0cd6874781e9aa379b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
