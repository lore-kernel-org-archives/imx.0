Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B47215717
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 12:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698377; cv=fail; b=VkFWFCQjivosQD/VmIGOySRI/DHFlQNd6eDwFOL+PEkQ9vnFpQ2NHcVgvKJY/Zv1yaPwFX+KV7zuSrikqUDpdo7fGciKIkx9IUDGEDwALIWYezlSz3hyiSN8EUrwBFlixxOj3TUUgvC+qSD6bNpb7/XpW6Uk3Gs1eCJfugfserc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698377; c=relaxed/simple;
	bh=So1qb1mZdf5crPgsgJIDQ6r9AYqepnxNsPGymQdqI/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DFI7/0UklJGVhAbt6gT3v2k2hxy/XsagWGiqeNTlU8EPpEhFjd7WN382Y+MfJEoYhClDkOkXU/6DFTata6SHXilGJewnMfRavalCD7bApRwEJTTYowJFZeAyc24IOudPXJm1B5awHN8iQK1eDFDV+iJg2LE2G7N16C71CUGRtf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DFCWXAoM; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DFCWXAoM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL6s+jx803nQ+faK1uBBDjrxxJJx9VTVnke86nsjtJcrN6/AegHvPHTEmFXja61zwvU3nSdxBQ7rdRafoCR0s/zvG+9g/nNzWhcTSBhmYYQHWXzaBo/rpVynOTQvHLENd76+SlTCA9wovhaRB2Bf0ypr2UoVn6h75pwIlN+t3qpG1KSfCPHedah0lVuytbLGZ5Bw3MICYNdRhATyLdXo/jf3vEGLLT70E7e1/ltSDeWmtQoARNV7VSAgTR2qgUw38Jm3LCejzBi9G7inF5DN1sCYqg3JEy1iPwz5b8fppMKpiIcwMn+NJi0SPtbObBaH5jdTDPpa2O9WgujahOwARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/Sinyv4+hbZE3+UGqwkZK7zp/FelTC2mTgnvGMOJEw=;
 b=qKjwGqJf+/TMWf12rRvafQBGM19Z0OV9l8N86WOlreeBoRObViy3KKtI1goLVaUo3pPT3l2XHI0PUla0do/dTUjZgCsIQ+b2fpGqtrWWX5Bnp0Qypq90n/dve2vIABxz26BFX8Bk660rUFWLqvbkvtm6era4wcAQ4F2E9NHLvKqoKr6pdDK/iFouJgefLLfQcOBVRdmXrnfSOXNRqM6j428R5ZnlmT4quaxib4O+HKATN6BLFiX2p490cyfsonM07Zlf/iz09QiThQbFD2dKbriCZtb65GGFk2PKVNjKe3BGqAAP0RYRjMmPeROZ0JDq0fJDpFAEwSFaV5B/cENvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/Sinyv4+hbZE3+UGqwkZK7zp/FelTC2mTgnvGMOJEw=;
 b=DFCWXAoMN9nvw3XX6ieA99fq9Jfwg91CxLqMWQwXPmke7RqgEvDlm0tMBlfzj2O+q6Dt3wk7F7vYnbZN94c4MQybpJOSrDUmeQoz/2ykhQxaoVuURJikV/xms99rRzm/4pN/xFr6Y+AjV7GDO3dTUDZjxsOKasfANuj4s6cawm2IuOagtXmgt80e4G2iDReRBonxaBdGCILNLs1AmgDQCyfhf8ySZO+XTLiQ0U7xp/EssWEGSynVSkhwTKgNczKseHsMB5h+s1XOl4U09OP4s5RyxMqyUpkwVnKPU7oYJCc6AEJXav2z53DJOGsxvDQbyClWPzD0bo9dJ72RI+K8XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB9516.eurprd04.prod.outlook.com (2603:10a6:150:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 12:39:30 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 12:39:30 +0000
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
Subject: [PATCH v4 4/4] arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4
Date: Fri, 20 Dec 2024 14:39:16 +0200
Message-ID: <20241220123916.1452582-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::30) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f48f6d9-34e4-405b-3255-08dd20f3591c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTEvdHRLTStlaWFLbnZnNjdLYXFPWXUyUFVOZWRvazJxWE5XLzZBL29JUFZ6?=
 =?utf-8?B?alhpOWVDZTlHVzVibksvZ3BZdHN6elZsNUhOclVZWS9oUTcrb01MT0VnU3JU?=
 =?utf-8?B?WlFGNE1xZUFrbUt0NkEzSjZnNGhjOTZtRFZONUdQeTRWYWgwaDRPdWV0QU1Z?=
 =?utf-8?B?TzIwa1Z5TUJRem50Z2UxbDBsdjFHRi8vR3dZbkI1SFVwR2c4U09UN1UraEw0?=
 =?utf-8?B?dExwenFXUllOQjNDUDVyRVFBeURtVit4UWxOQmJwazdkYnM5Y3dKSFp6bzB0?=
 =?utf-8?B?UnRsdmZKNDZRT1A1OHlGZkZhTDhaWVd2U0paVkJoVFpNT1Bkd1U1ZFlSdW81?=
 =?utf-8?B?SW8raGwrZ3NMaWNyaEQ0L0UrTVEvc05la0FXWGRHZitoeUgwSW1pWXcvNUl3?=
 =?utf-8?B?em8vTThING1mSTBBTTVSbVZQQW5KekJmQ0R4bkRVUFkzMG5OOVUyR1IyZENQ?=
 =?utf-8?B?RzhEVG1yTmRvcWNLejlHdC9KVXRRNXFyL3ZOQVl6MHd6VjZLcisyaGJQenk0?=
 =?utf-8?B?UlpUZGZRQVY3RXh4dk5zQW5JaWw3UzVLNnBodUdUQXppQzBMYVRQbmRFOWJw?=
 =?utf-8?B?NlhDZ2UyT1JTekNuRGQvdGVMbWlYRDZJSlBnckdnK2JwS2dyOHNudjVaWXlw?=
 =?utf-8?B?dFdqdHhqV2gzVlBTd1pGUE9SQnd0NUtyWmhLdkJmeGUrdHdMRTNFMHdpRzlk?=
 =?utf-8?B?YVRJMzl2b21GU0pMMlZmak5EV3pPS0JENGRGSG1ueUtNZGZWUWNWdnorTUJk?=
 =?utf-8?B?dkVtQU5vZVE3S1FROGt4b2p2VnVuRmppRU04WE8rNVMwa2NJV2VMTmNyaTBU?=
 =?utf-8?B?TGQyUTUwRE96VGZoc0VoanZCa1gzTGVOYm1YSlIwNG5BZVF4WXp1dlVRczBG?=
 =?utf-8?B?elluR21tQ2pyeHFEd2lnNkZBbkozZUt5MmVDdERvSFV4WVZCcHdvcDVaejJM?=
 =?utf-8?B?bmwxaWtNQ1dOS05WYTk5d3RjaHlCREpiRy9WUTNEM1NlTkgrRi8yQUJRUXJ2?=
 =?utf-8?B?elZ4dUpZNG9zMmUwRTJxWFNiR3ZDTUp5VUozQXpWYlhHZWoxQ0J6Uk4rZnB6?=
 =?utf-8?B?c2pGbm9uSjk1Tmc0T0tlTlFRS2llWlYzdlM5NFpKdnZUVXM5SFlUSVJXa1BN?=
 =?utf-8?B?NHpJd1dxSmJzamduZW94UmdpbU9IV0hBdUlKK05RNjYxb0ZiN1JBa1ZwdVdZ?=
 =?utf-8?B?WW1rNWkraFl4MzJPSVlvSlpiOHBYdTNOOVFRTFpHemVWQldLNkVhcXcrSVRY?=
 =?utf-8?B?UFlhNzh5ZW5QVlhQb3d4bVJId3hYSG5vczhFOGlCdmxtMy9vRGZIUGpLZGg3?=
 =?utf-8?B?Um9VdUU3UDdibTMwc1RJc0ljaTJHRlFDUkxOemZtMDdoV01EWXJFaDV2WDJZ?=
 =?utf-8?B?QiszWmRRam5jaUlIb1RsYUZmTStJSnhlWU5YS3RWTy9Pa0QvenRwK3FvLzd4?=
 =?utf-8?B?Y24vak92RFYxOXAwNlVMZTE5VEtVUTF1T1pUZEFaOUJkV3hKQ2lDaHpnRm90?=
 =?utf-8?B?NFRwcDR3Q3hBekU2T0ZHTVdjV09tdFhhZng0eW9ydFZIODdWVzFWaGxScGVU?=
 =?utf-8?B?YnE4bXN2N2xjZmpqRVBJeEhUdzhkNVJ0WmdieWhST3E3SlhBMXRVM2lwVmZB?=
 =?utf-8?B?MHpPMGlmb3dnbXZ0MkV6eFlmK3M3RmtTWmphWkM2Sk9ZWW81L1R0S0VaWHFN?=
 =?utf-8?B?cW02NHM0Y1dNR0h1NGxodlhFWlhiZ1I2Y1Jrbm5LT3NUWDZkVW5xemtXRU8w?=
 =?utf-8?B?dTlJZENmc1RHSDFDMlVaZzZDM1JJZm5INC9vRTZvNXphQ0ExKzRIWC9PSWZE?=
 =?utf-8?B?ZEQvbjE1bU5neGQ3b2JmOS83cTYyRzM0cHRncGh6aDMxV3pVbGxZK0h6Q0VM?=
 =?utf-8?Q?RVg+XyHBJyRjm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FqcFIzQ0o0cVBYd1RROWUyRXhxMS9vRVZYRzVLTThsTEI1N2dqMkpSVlZD?=
 =?utf-8?B?TW1DY2Fqd3h4QkF6NlNIbi9HSTVYODI4MDdLVmZRdWNURzdzZzRDQUUxdUxT?=
 =?utf-8?B?dk9wU0l2VFRkVU9nV3lOVTdSYlVocUQ5N1ZHZytRaW1yYWk4YmNCdnN3czY5?=
 =?utf-8?B?YlVOWDJwMUpWb0lXN20yNjhUNUxSMEFLOTlYTmEvT2k2MUhrZG5FbEdUR3hx?=
 =?utf-8?B?OGhPTnQ1ckl6TDBsNmg0NW12Nlk5TGllOXFXWWRWMTFTcXBkMUgzZzdNT1JY?=
 =?utf-8?B?MGdHdmFYdmxHZDB3WEVndFJteFVNdGZJZDJObXlWajZaNFpPSkpvb2taWUZF?=
 =?utf-8?B?cUNSNXlkODFoTE1Nc2RHTFRLcHhYaWNlVUU4N3VMM08rNWhZdWpRclg4ellD?=
 =?utf-8?B?Qkh0bDVNSlFKb0xYZ1VwcWE2U21QMDZOYlFnWXRwM0ZGRXB2K3kzRHBKd3Zi?=
 =?utf-8?B?ZU4ySk9sVis0cFhtZ1ZjYW9BSXc2bGxXM3NGdnhUdjFhTlJpU1g4TW1sQlRU?=
 =?utf-8?B?S21KUkhGVU44QjdSWWRGOW90V28wbjdqQ0N1UG9oQ25EYW1VVW5RUmhtc1Fj?=
 =?utf-8?B?eFZLS2dIOHB4RFMrMnpucXR5TnNoNHFLQWRGYXZ4a1I3cmR2SzdIdGhMQWtF?=
 =?utf-8?B?Nk5TaFZQRitGSllQVkF3ZGVMVkJZQUd1VVg0RTFNbytRWmY3TWFudk5lQnBr?=
 =?utf-8?B?OEZLRWNqVzlRMElKc1NQNHVxVlZyYWN3YjRlM20xaU9uTk1RTHgwclhnOHlN?=
 =?utf-8?B?dmFRdTFyU3VhTktSQU5CcE5wQ1FJUlNLc0d0emFVRVZ3NG9tMmludEgxckpa?=
 =?utf-8?B?eGJwZ2RyaGUyLy9rUGtwOFdxakIvOFlnNTNnREZOc2doZE1mcVFJRFA3K2Nl?=
 =?utf-8?B?Q2pkc3FIclJoVWFmdTA2OGZ4RTBOMDZUSGxYWG1LU3liN09QTmw4YUtaSjNG?=
 =?utf-8?B?MmNjWEJKcGVQaGd4OWtEZUQzbkdQOERpSGJIMTh6WHJxQ0M4UWRWOXdTbEpW?=
 =?utf-8?B?MHZJUE1VNzFPN0oyMHIrR1dOVzFUbGIwaFh1VmxIcEJmd3IvV3ZKNVJuRTNi?=
 =?utf-8?B?bG5mdVdmQUY0K2hDVDkvdmJDc3Vrd0NpaENTcm5hTFhKTFJtRTFJbWx2UC9O?=
 =?utf-8?B?TVc3djFyM1RhdVpqL1I4VG4yOWF5THoyampzc1cvajU5TlNHOVVCbXVrbEFo?=
 =?utf-8?B?NEZOeVB2d3hoekpOWjJ5L0F4RHM2ZEVyR0lZeUtEdWxtcUF2V0lNeW5nUWYw?=
 =?utf-8?B?bDhPamFKY3dOY2xlbVM2UW1XQ3c5STZ2VXpsRUladG1PUGRPT25nV2EwZzFS?=
 =?utf-8?B?Zzc5Tk5Fenk0RjAyYUN5Z3RHbUpYU3Y0TFZvMkFXNUVzL2Q5UFBsZ3JEUk9H?=
 =?utf-8?B?dEFoK0MzSWNKVllRSlJPc1BnOEllbXZEd2pGYWVNR2g0TXlMOTlyMzJrVWZG?=
 =?utf-8?B?anU3WTRqY2grYWlZT2ZpVU1XekEvRFlTUlF4aHE3a0I4b0hJM2NWaTRSdlpW?=
 =?utf-8?B?cXoxWmN5ck9hMkdtakdRUFppbTZNY0pzc21JSStESlJmVUV2U2pSL1kzdTB6?=
 =?utf-8?B?SlI3VnpNZjNDMjNINExmRnJuOGZpY1JVTkFFSHVnMStuWHFDRytUM0pqbngr?=
 =?utf-8?B?SnA2Tlo4SkpIaVpva2syRDMrcktUOXhCS083dVh5QjAzYSt1alBkQ280K1Z2?=
 =?utf-8?B?dGJyRjlSWC9TajQxemlxeURrOW1SVDBZaE5zSzhXL29jeG9vb2tHcmpwNmdW?=
 =?utf-8?B?LyszQmV4cGlQUll4ZlFUSmdxcG9CMEdjTWNMcDIxTzIzMGRIL1dCaVAzVlpO?=
 =?utf-8?B?WGN3bXB6dzZZMDJQWTNERUJZc0dRL0dtVE9ITFJmRnNnNlFQcVlFV1hhOUJj?=
 =?utf-8?B?dnUxb1ZDem1wTUVCRzhzZGVSazhXN29ocE5oaENpMStVSEU2ZWpkbDlNQ1VL?=
 =?utf-8?B?SjRNUjJVbjUzRjN2YUxrV0NnWk9Gb0Y2L0ZMbmVVZXBZeHJSSDhWYWt1T1JQ?=
 =?utf-8?B?M2VQQlpsVFRBdTB2VTBYK1U1UGMrU1JyV0twK2lzSnMyOVYvbS92aGR0ODRO?=
 =?utf-8?B?L1gwb2xvaERueVZKOFpZS3R6NlFVWW1xRzBpQjI1K2VmeWZuYXZrTzVyNUp4?=
 =?utf-8?B?MkU4b1lvMWQzV2F5eThYNm1kTnhkT21ic0hNK2FIYkZGalpZWjZjVWVIUkpk?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f48f6d9-34e4-405b-3255-08dd20f3591c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:39:30.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fGWoXTwpnJiPxF8N0CG4GUInx+7nIo5w4R+SPPcyP5qn9Pyg9mmDdqY0FuRwjUuYY9ZiN/31Vmf5XeilL6e/+fh61Iy44VhxrEpsW2O8ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9516

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

