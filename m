Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2059.outbound.protection.outlook.com [40.107.247.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF44225774
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613851; cv=fail; b=QyBRYdehH3UTtit16XjQ5Sa94F/8R1FZVislM88I0IzqEv2vY8Y2ezITzKq3p4E/QFrxGYcVRDRb6CuW3vZMutk78sNgipsr9Zg4hyLzjtPUQTWojpjn3EVGdP0of44/mGY7Gal5eR0z+nXQhxaA/RTK0wWzVCuxeooI4fvMZZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613851; c=relaxed/simple;
	bh=So1qb1mZdf5crPgsgJIDQ6r9AYqepnxNsPGymQdqI/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sRgBK/jVpG4swQUh1IVETytOrPYqTVvy3IgNLiEL5QGIabOSrv8Upyf3AtA9rurU07H3EhfoeStQgxIOWonOgNdVtqwEhUNIHtEl2AQGy8BDFXWJzKkqPeGADa/mL5I2sMdw8DAvLAK5r7f8BeOs9bZmCNARNE5nN6b00JEq1jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dSHGny+Q; arc=fail smtp.client-ip=40.107.247.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dSHGny+Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myKSdBiKGn8cM5A32Dc/+T9OuQtEB3/MpCmjW9mCbcs/zCj3rBMRJIc9iofGHzvFE2z72ahWjK7n7nuszYQL6fgsHv2yvhA03tIUhrzslA4HnTgjKIDL7/km9JuA/nqnoesTcMPhohCPWa17ga0GMXKPrHYg8frh8qHldAk3PFqpUkYIYUNfvr5X3CnUjoL23o3OZlSpqzQ8IrQcA/KDZNt/fNCsdr5u3nCnfKs2MLP/PK2qjZWkKFHwl40YeZhCdD7xMD5TlU+7Yt2eBPDI2XEM8csIhuTzcwsmHd3vEaUB1x3/1Ff35Ix/rA8qn4SOdBL4YDmiIf7kKCL1yTuusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/Sinyv4+hbZE3+UGqwkZK7zp/FelTC2mTgnvGMOJEw=;
 b=xmxD9IFg2iJ4Rd0kR5GXYrwdpv2kcpHBzIgF5mke9dciHO0rDS10FCqD/6vBi4QkLOb+oxYULd0ot7WM0+3cbAkN6CyzDEH65vne0+GutIyl44M2308GPdCAFpaEyVgahAwbMKDOcIFK1U3yNhTv87Jw2cyw1jLzJhhtt7bnblEVHTpttqG6qcqknfPqkdcQBYIyqm/dZ3Zj3EUbwvCWdhpRvL5EJB7EeVodq4NwWY5PHogPk0ND3QdZ4MxqMqWe1m5UQNN2/jq6MIz/+nOcCjvyiSwxzL1W85NJOkuyKIIy8Zzo7AjawdzynpklujqZHC5LCQSuAOQq5RyPgmHdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/Sinyv4+hbZE3+UGqwkZK7zp/FelTC2mTgnvGMOJEw=;
 b=dSHGny+Qfu9wI6scRV6bEDdVqlR3Z0T2eNccA6J/x47Z7PA1NJ2hHX0lUUVz1Db4QRHmaRRGH6PT4j2Dvwqiq+/iCKI6VR1E+nbKDkxmLxy0eali7fLxWmL3aNTOvE1V42ivgDapdlDm8m16Kb/VKXZAPGCq6zJu2SVSKyiOYJlYgkS1ub2f1mjweRK8i2irvK9SzpkxSh1guCSeN5GPuuSKCAZulPfxfYG2Ta+sKM9AbnBZaPhcZn21hI87MZxsftXjFciS6zvwJ2My3dlYy+ztdhn2uS2x7CPt/y48lJ2656uMIgsye/zb+v8YrU/eXW76P9bT26J9ABoViSCRTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com (2603:10a6:10:47e::21)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:10:42 +0000
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a]) by DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 13:10:42 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 4/4] arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4
Date: Thu, 19 Dec 2024 15:10:29 +0200
Message-ID: <20241219131029.1139720-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0060.eurprd04.prod.outlook.com
 (2603:10a6:208:1::37) To DU0SPRMB0099.eurprd04.prod.outlook.com
 (2603:10a6:10:47e::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0SPRMB0099:EE_|VE1PR04MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 606ecdf7-8be6-4f57-007f-08dd202e8a5e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWNFdWdYaXAyaEpjT09hRXlqY1BrWjVnR2I5S05VWjJmL2QweWk2L1oxei80?=
 =?utf-8?B?MlVxSms5VzZZbmM1L1J6cEhFckdHQTV1Qm5Ya0Q4Y2lWMUZSbEtKc0tWKzA5?=
 =?utf-8?B?em9WVUhld3JKOFA1VXphSmwwTUlSSTE5NkdUY0dzR3ZzMm5NTHpTS3Mrd0Vi?=
 =?utf-8?B?MVN4ZTNiKzU3MjFWRVp2KzhKTG9TZU5CeE1RNWlMZE5JZG9mTkJLamp0V2Nz?=
 =?utf-8?B?U1d1QXpBMGVaTWlidUU5OGJUZituc1ljbjIvbm0zMGNRVkUwNEUwM0tYWGpC?=
 =?utf-8?B?T1RxakxzSjhSb25MbmhhSmhCd2lpem1MdWNqN3VIc2ppbzFGZ1puZ3UxZllo?=
 =?utf-8?B?bHJxbVR4bXJySVgzMmhBdmlTSE16OVpYYnk5Z0poSkJrVWNxaTFjNHI0SERk?=
 =?utf-8?B?S1JENDM2d2NqZmZ4b0JPZ0VEWGdadEFOcThVSjI4OHBxbjlwellycUhObEFl?=
 =?utf-8?B?K0ZPTGthb3huQjA5TTByMDFrK3FNaHpBTmUvR1h1ZmVLcHN5YlpZcENsd2pO?=
 =?utf-8?B?RVJ1SjM5VHBLK2xmRUNZcUJFc1c4bGNlWncraTdjekJVUVlrMGF2RUIyNU5z?=
 =?utf-8?B?d01iQ2pXbE5kdHJtWTN3bTFBWUN5ZFB3ZkowL0hqZ1ZQVVlTbXVjWWFvVVJi?=
 =?utf-8?B?UHAzNmpLQ2JMOFNwYnV5TFgyWm5pWXpzc0MxdG9Ha1hDYU96Ri9JVkNNc1FT?=
 =?utf-8?B?Qk5HcEEzYStjSFdZbk9vaHk3cEd1N2h3SkFmeEtXNVNMWnYwbUJWU1duNUlv?=
 =?utf-8?B?Tlhmd2FLcmZNempYOWZMcTFZMnlkRmlMVE95YWNOTnhaK3VDeUoyNnFqVlJK?=
 =?utf-8?B?eERxSW82OVF6TnN6Q3pJVGxrb3BMTGhvcy9mN09rbXBmaER6bk8wTjNzOFhF?=
 =?utf-8?B?YnlJaloybmlWeDFxeWlOYVFUVVV4K0k0M3pOeG5pdXR4aFFzYWh0QW5ORlMw?=
 =?utf-8?B?YXBkK2xNeXQ5NDhHUklQemlRMWtrUDc5ZVNvYWRTQzI5d2w2aGdDQjI2NERM?=
 =?utf-8?B?ZUc4MWp3a0Q4UUozaXRIZ2VqT3FXSTh3SG5lUVRrZzFQV2Qvd2pCNzJ4dXVG?=
 =?utf-8?B?SjM0N2FUMjlUc0FTVGYrZnpBckoxeHBNay9yeE9BelhDbkVqYzlSUGFIeHY2?=
 =?utf-8?B?WTVkNUdQbDh5cjk1OVdoa1JxdUpNL3JINDBSeTBFSVBDYlNlaldUNW5HSlhP?=
 =?utf-8?B?NFBWWDZhVzRNQWkwWkdhUWJ4NTdsUVFTVFg0VFhXeDFROGc3aUhJWnhGS1N6?=
 =?utf-8?B?NjBRdFdCbS9DQys1akw0S0NqWHJicEZSTFZ3TGhSQ0pLVXgzakFBQ2ltTEhT?=
 =?utf-8?B?SUhLb05DdEhpNDREZHZKdzlqeHRLRzhEU0N1SWR5dERUZXFGOXcxWkVnNnI2?=
 =?utf-8?B?Y3dWWXZpL2luK0N6MTR0c25QYnB5QkNmaTQzdENjdmhROTJmek5BWFZ4aUdG?=
 =?utf-8?B?NmpWaG9LcVlWSTJaUzNVdWxGejFuQXpHMWxBV2krUU5tUVo0WW9KN0FwSmFS?=
 =?utf-8?B?SVA1djFxTUVDaUp5TGxWcmVENEt1QktRZHh4Z2xod2hWTTA2WTFuYjhQYUVB?=
 =?utf-8?B?dVBCMzMwbFRHWnIzMWQxZ3pkbThXV21mSitGa1Rud3BsVzVzUXFWRDFQOEtr?=
 =?utf-8?B?SlgwZTRlWGlDQ2hjS2pKZTZyRzJsckZMd1cxYjdjWTRMcjlOeVlhU3U4RHNl?=
 =?utf-8?B?aWpwRnpFVXByR2pScmNNdWUzWDhwd3piRHZlS040eFpEUU9RRm82NUk4TWlV?=
 =?utf-8?B?S0NWa1ZVSlZqVTBXMkFUempHREFQRlNKMTFOLy9yMnQ5Y2EyUElvWGRlb1dm?=
 =?utf-8?B?VHp5bUN1RlRjUFZMWDdXNWxnQVQ0dmNWQlZLMXlKZVFteDlTOXcwNkMvcDVu?=
 =?utf-8?Q?+8mZXTEnvq+Up?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0SPRMB0099.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUdzVHF2K3JuMkloTjBYSHNKbGpKRk43QWcyL2w2VDhaVHFjMlV6Zkx4WXhX?=
 =?utf-8?B?ZFprNTd4RWZVcW1LMnlvaEZ5cXZzZk1xbGVYbENpRnRFbXpqSW03a0hLc3Jw?=
 =?utf-8?B?WkcyZU8rbDJwMlN1aGZQQUwwRlR0ZDN6WnBmemI4Y3l1ajhUNkFUSmRXWHZy?=
 =?utf-8?B?bGt3TDluUnoyVFh0ZlJ2OGZsb0hOeGNxSUs2SkR5UnVMTHhoUnNsUkEzcGJY?=
 =?utf-8?B?V0pzUEQ3bTgvS1V2SFB6RWl3NlhUS0p6djIveEdBZ0JDMDdHcmwvR093aHdY?=
 =?utf-8?B?ZzVVNlpMZlpKV1FhQmVEWkd0dG9pWHdodEFmMUVQc3hZQ0JqbHJqbGNla1Fa?=
 =?utf-8?B?SHNZdEpKc245cDdnRXMyeC9SamE3Tm12NWloTUptUDZUZldaVnhXR0IxUjda?=
 =?utf-8?B?UURRbUtRSzVNMGdhcFpjdnRpNlphYVZ6UFovd2xBRFRBUmtwUjl2S0x3NFh0?=
 =?utf-8?B?NGl3eXBjNE0xL3dZQnJwbVphK2FoT2hocXFJeTUrWFVFZ1lsK3RCSnY1UUJv?=
 =?utf-8?B?K2JvRGNmMXJzUmhmVXV5MlJVLzlmOFRnMWRMUDRNeXM2aWFCSjB5R2ErdFUy?=
 =?utf-8?B?U1RpU2hPWTdBY2IzMXJoTXFkNlVaVjBOVlVRTllzdW1pWFpEY3dqeEU4M01i?=
 =?utf-8?B?SjNsVk5tV20vdzF4Ti9HbThxZ2g2aWJuRUoyMHVuc1BUSzN5U2ptb1BTMWlo?=
 =?utf-8?B?c2Z2N3ZHN0JWTTFGN0pZN0FUSVJGVVY0SWpFa0xXS2JHR1U2U3dlWnZFK0pM?=
 =?utf-8?B?eENycy80ZUdBV0EyTnBkKy9IeUJYT3FLWmppWTdjMFcwamZiQTk3RmJNUElC?=
 =?utf-8?B?R3FIdE42em8xT09NclQ4T3UvRzNDRlU5R2EyWm05ck9veXBETWsvTmNkNEF4?=
 =?utf-8?B?K2ZMaTlTa1NqUEhBTlljSllUcm96NHhmOEo4THJTemNNUFJycFhNUDVhaHds?=
 =?utf-8?B?aEdyeUxIUmNLeFRnYkFhbnZmR2t2Rk54VXozb0s3b21lcVd1MDc0d3lXcURk?=
 =?utf-8?B?NUtHTS9mTVVqdVBvTE1TbUNmN2M5d3hwZ0Z4SC9VQzQzNTVveTUvYzVSTXJk?=
 =?utf-8?B?RmRCUHZoWDNscHFnM3daWkErRFdxeDI4b29GYTlsK0J4STBoUHY1RkloRVZ6?=
 =?utf-8?B?c0lxRks1S1F6NDg5TmhLTnJGekdhUE9FZlM0TzduMUlWc0tRNWFMTXRWcEpQ?=
 =?utf-8?B?bzVjK0NTU2dseHd4UXJqSUx5NUl6MEtKS1VYNDdUb2x3QUdNSHBKcTRiczBH?=
 =?utf-8?B?em5yWDVHeTcxTktVa281NGVscksreW9nRDk3cUdYZHVhMEpTQUJiZk5QZXZ4?=
 =?utf-8?B?VDRKdU85OXZwVUErMFpVc2c4dWdLMjR6S1doWjFBcHpXR20xMzUyV3FJOW1u?=
 =?utf-8?B?ZnhodG5wNmR6NjFiLzBUQVVoMnNQbGNBYlNRcHFyTUNWWmhkQU9uREd2R3E5?=
 =?utf-8?B?dzF0UXNoM3FlZXcxLzFBTUhCMjVNaUR1T3Q4ZUxkWFpQTVpGalpRN1FkY2lW?=
 =?utf-8?B?Y29nVzVWL1BOS2NZVEVrbVE0a1pqaElZaG1xSDFrVk5URmJKc3MrMzdzMVAr?=
 =?utf-8?B?dkxpYVNOVFJHUld6Q2Q0aENSUFc1NGJXYy8zWG8xZVRaOEkrMHhFVzFtOWlp?=
 =?utf-8?B?RUFrSWN0L1Y2Y2dmRlpRZVhIUUgwSDREY2xHV3I5QVhpVFdxd1k4amMxNHp6?=
 =?utf-8?B?aUQ5UWRYRFQyMlRkai9GVFEvOGpsbmpZTnR6a0x3azI5eUdUb1lYc0t6V2U5?=
 =?utf-8?B?NzdOVHlOb0oyZzNneWNNSHNpbldlSjFyUnNGR0w4aXJoOTcvL0U4enFCTGxX?=
 =?utf-8?B?U1dJYUNDTGp1Ris2dzhLbkQ5MEhlVXh6SVZDQm1mYVFUTDh4bFBlTEE0MXVw?=
 =?utf-8?B?SzRTeVIyMEpkZ1JlalJiU3h6dEh0M1FoTE56OEw3RDlBZjlnZVlpMDY0dUNN?=
 =?utf-8?B?dkNqUGoxMTE4ckZjdVZtQ3hlcUFRZ01qdGM2eHhvVFBOSWw2ZyttRms1dm1V?=
 =?utf-8?B?YXl4dTAvcm9NTWEwamJVK0RjWDVqRWcrbEtGejI4dXI1NkVQcFdXSlVIV0pz?=
 =?utf-8?B?K1NMU3VmZC9laHFLbU41Qk40SW1JNytkOGUrWUgzM0p0Si9Nc1B0RHNYWVNt?=
 =?utf-8?B?Ym9pdkJ2Uk1mMGdMQ3VPVVgwdG5wdFByMkJtcDdCdEw0ZXMvQ1R4eVBNQktS?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606ecdf7-8be6-4f57-007f-08dd202e8a5e
X-MS-Exchange-CrossTenant-AuthSource: DU0SPRMB0099.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:10:41.9754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UudmyV3+dqBIkVV08v1ve//DTWgrddBY8jHeSF/gJjVf3F4ThJOY8+UcYd7cQDFWyrVmkqza7Tzoo0u3588AOqaKMcwIHLbMqMULc5dyIbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

On S32G399A-RDB3 boards, an INA231 current sensor is connected over
I2C4 bus.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 94f531be4017..5f8739c068c6 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -40,6 +40,14 @@ &uart1 {
 	status = "okay";
 };
 
+&i2c4 {
+	ina231@40 {
+		compatible = "ti,ina231";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.45.2

