Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6031DF248
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372507; cv=fail; b=EREzu4jxzl8OxDkDb3Izsnf7AGZJYAjv10KI8CN35A3HiYvVeVr/oB6w7ZbZS4uXfdIoQIupt8atM8CN4dHG7hWKiCbhPT7/j9SpT5RWltgnt3ZkgQ/tq2MVIhNorbHysYQTVwDeQ2kYnuqNs/jwJltziCG9Ye8+3a+u1VVEK9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372507; c=relaxed/simple;
	bh=Eei/vZ9YuRBLuduRw9Xn7SJyqEoYK9XenYgW/I5M26A=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=lf/n5sakP1h1hKXXELh2U++9VtSdbRTxXY2vm5b2jLKmpj6kgxD66RsXkht8r+9BP0XLg3uLNJT8S7YdN3XC6USciLaWqLLKf5kJcRbXNQ1WhnbKVSPw2U6x3YJFFxXikEY/BElSDTxXR9noIlz8Y6y+iEaCQYrJ045zU2qphzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L6tsLDUn; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L6tsLDUn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZRNIe1a4TNt+1Y+RoT4QdHv5/krv1WmTN5XZOAbqKR8QKneRBfSez37CX96FOjFzQnDh9to/eVaHOd2tuFwn5rGDPpwBWLQ0KRfsVoNg+Nkhq3I0o6yOjbowi7E5Z0HR1PV2aBRUUM/Yak/m3WjSaQmGetSMA97MWmtDaaZIN4MD9STPmVgEm1KCu96veeR5vvtT2HNI0CBZM/jc5BFz9KrIlcKk4zhmzVJZzRN2Z5ySDwc+RZv7K0G51sS9FD5lU4wkERz7Nu3BNLLnEuQXWWstJs4x3pMuu2+rMpQG5rPId32TTSjwOjZohookNMh7KtJ2oEvGVDkwvuuQfhbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DZjO9EoLuXZbrL9xycouZAe9J6F/yJZIR4NqDzCC+4=;
 b=rfFH+tLDhpVRCNuAmNAp5NrwxxTLf4kHuULElChE//n08jepJlNiWd/i7FuQe+R7kZVYLK8BtKWx0x7y92ndixKe+DPsMi0FRziyyBKVMAH5PR5AbpK5kQcELElI8LOw+a61CbTplKD+aHLJO/bzeQVYEyMJ9dZJWTCbFu8r/HOsMiFwgL45b2BIQpD9EOhpNavwrsIOKFY2uPp9b1alAm4cncDScTywFkJwitZxyQ4tUeEaGnhiKwtJ2hJE6U8OWP5tBoM3yGWO8sd/XaZpFvzXQMnHGOqCRDcnAnc85NxFYZ4KS4tYf4mKtAryJp929S3gsedvr/KgbEwbj6DoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DZjO9EoLuXZbrL9xycouZAe9J6F/yJZIR4NqDzCC+4=;
 b=L6tsLDUnR/64taBldSmWG7G8WvemqUajbjjyCQmNhk2N4gjbUJkVrp+G8/cd5IjC5Mj90Lbf6Xbcn9wYbPAMpWaBvxLztU+muZa+pRgnWVS7DegYPfwtGPulR51fXVrYPH3Bst/L/klA8WU9uvK8l/GM7RN48XSyT9nzGPewyhhne/KgqwtT9nexsNDfim4jy/jpClriE6f6L0mCFFoGF6siBI/5ss+y6zWC7ipnFg8dE+yKPn8vY0+jA41coE8qU9T+Faf+Piom0OoWOgiksyuXgZMAFoPXfOcHEAUYZMddt8L/i3XzWcZhOh8sEhGHdXrXRZWve7ePWWJcYLLWmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 11:28:18 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 11:28:18 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: [PATCH v12 0/5] Changes in v12:
Date: Mon, 20 Jan 2025 22:22:18 +0530
Message-Id: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJ/jmcC/13SSW7DMAwF0KsEXtcFSQ2Uuuo9ii5kDY0XGWAXh
 osgdy8dFLWUpQi9T0rgrZvzNOa5ezvcuikv4zxeznJAejl08RjOX7kfkxQ6AtJggPvxtPazVEs
 fNIAx4FWKtpP71ymXcX2EfXzK+TjO35fp55G94Fb9S0GoUhbsoSeOJljWHm16P6/X13g5dVvGQ
 pUjVTsSJ6gkdD4Y5VundmexnnpR4gIncikHE3Vond4dg6md3vpRAoCMLuDTnKZySLUz4qwN7D2
 o4JhaZytHjbPiciYrZnD0PCfvzoOuHT/+pSQKA2uyunXu3yFg8z4nzqPRyklTTqp1vna2dl5cS
 a4EiKBzGFqHsENsB5U1gH4oYMGpGD2XJ7mvDBK1K7PtDETO1iQOmaue9/v9F2uozofVAgAA
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737391948; l=21851;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Eei/vZ9YuRBLuduRw9Xn7SJyqEoYK9XenYgW/I5M26A=;
 b=JOAkGJs6cNEGFd6pc1zaSS8gkmO4p2LWUZgyu1heSI0vvCTWTajR18fnGi+AtsgYMRZUMf0BH
 ZRQxvJnUW61DUQ+MqvN8HoIDfVEkBAdTbr+0T8ntbIRfgUcUrlSjX0F
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: e0201aab-41a3-4ed1-7335-08dd394589c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWdLWG5lL1lrNHdFNVl0SVlzRllaWXh2Rkw1VmY3b1dMOHdZNHVjVlRNUjFk?=
 =?utf-8?B?cFNoeW1aYjA5Mkc3c1Nzckp2WVIrVzNhK2wxM3lxRGZPK3RLamdPZDlad2pN?=
 =?utf-8?B?K0NRRDJpanI2RlRkSnRNdGRIemRpZG40cXJETWlHRzRKZUhCU2w3dFFobnBH?=
 =?utf-8?B?bTZsMHB3dXZKdDlmQ252R0ZjS2xWVEl3YXQ5UTBIajRPeG1zdG15WFpELy9m?=
 =?utf-8?B?ejRPZ0pvYkVrSHY0U2g2cWRlcmNUdkxHL29jM1pocmJEK0gzYjdZMlUzUjFD?=
 =?utf-8?B?SWoybE5nWVRJemtCT2JlditrSG41TzdRRjBsNmxtdi85WTF6MHREdWVOZ3px?=
 =?utf-8?B?ZkMxaUI2N3RBVFUySFdQNG5FM0tTdjc0ZGhwbGs5Q1QrZXZxQjA3N2tpVEcz?=
 =?utf-8?B?d3oxZDFiMDZQK0l2MXpndFRQMFFidHM0N0xqaFpYV1VYTUhsbCttaHdsU1d0?=
 =?utf-8?B?c3l0cFdkMkxzQkh6Y3VtUlVudmt1dVd5aDlZdVJ6Y01ySXZBdlBjbnNhWVln?=
 =?utf-8?B?MmVkbXRSTXQxbTFYM2ZVQUNHUG44YWttZzJOZ0UyT1M1ZGw4YnIvb21waW5F?=
 =?utf-8?B?WmFYV1R5WEFiZmdHakdxbFFkN3ZZd2U1SU9hUERhT2ttSUFLcUZ6Z1MzaGhP?=
 =?utf-8?B?cDNVTmMxKzJhclZ4MDRtZWs1Rkxqem5HMzByS1FSTDgzZHF5UmRJN1gyZllZ?=
 =?utf-8?B?NUducm5tRHcwL3dKekJOS05ZeE9La1ZsRU1HOHNXMmZkOE9DdFRoc3FiSi85?=
 =?utf-8?B?SFEyWUFRMnc3TFNRM1RQV2pndEpzR0dDL2t4YjBFODdqUmRJdFVBQnh0Tk9m?=
 =?utf-8?B?R3FVbUllMUJUSG8weWVIZUJ2WnBIV0s1dDE4cXdvNTcxWWFvMnVvOTk5amlr?=
 =?utf-8?B?c2FneXVjeFF6OXJFWEFXb3l3ak05K0cxQXhrQ2t5a2VGV09FUm1sa2phMnJZ?=
 =?utf-8?B?NFVITTYyM3Z6NlNkK0prTzhFQ1FmQ0t1QTdBd1N0UFZUUVFRbklCcjcxOWl0?=
 =?utf-8?B?MHBJVVRuZTFHOWpFQzFhblIxMmdFREpmd2hORkh5SUs5b2VsclNHam4vUGJl?=
 =?utf-8?B?Tjh6cjllQlMrbFUvNHBnMlMvNHNtU1dYdXdUcHZ6Tkkvczg3N0hFMXpPWmtQ?=
 =?utf-8?B?ZFY1QmZ4a3Q0WFVwSW5UbWFzL3JRaDhHNFFRYkVXMnBnQVk3ckl3aXJtZW0w?=
 =?utf-8?B?YnJDNHJFV3lRR3VVSjNLejE2cFJYK2pTTkNjdXNpZGQyeWJYU0tWNVYrTmVB?=
 =?utf-8?B?czViT2pSb09za2hUSW82UDVDQnZwNEYvd0NTZG9kbXJYbEF6UXFITlJhYXdH?=
 =?utf-8?B?SVVHa2o2QitjQ3UyRDRubFNGcVcyNmQydjlNN2dRQkxmRDZSWE1XSTYxaDVz?=
 =?utf-8?B?NElGc2JLei9kekhjOEhNOTlmTWRTMDg5dmJJd0lydWJBUFB3UnBqZnIrd2FK?=
 =?utf-8?B?eEI2R1NxMGxiSTl1enVXcm55cFU3dnY2S2NGWHdpWFBtMDdGQUg1OUtYSStk?=
 =?utf-8?B?TWdmZ2xzZjJIQTU3Tkg5dk5MQ3RYNUZjeUc4QkR4dlRudUhXTjQ1bU02TVpw?=
 =?utf-8?B?UG1yU1h4cjZqR0UxYVMrVnZ5Uks2OEl6OG02ZlJibFpJc1RhOTJKZWxjeTcr?=
 =?utf-8?B?ZHR1WjRyY08wczVmQzVRQ3MvQjArM2lYNFNZRHhpWlpEMjhzSXNlckYrb2Zy?=
 =?utf-8?B?SzM4MFFSZmFWUkNaM0NidTdFMXZOUjNBUytPTXNrKzg5N3A3eXhvQjZHMCtz?=
 =?utf-8?B?d1NPNjZ6ckZJckU4V0J0QllvYldtVGNPdlExZ1VmQ1p6OEtWeW5CMEpxY2NZ?=
 =?utf-8?B?MTd1eExvaEdSY1N5dlViZnN4cVpicWJhelpXQW1HVDZSRWpYZ2NTNjNUY3Vp?=
 =?utf-8?B?anNFSW1pQkVSMmZaMVFCVHI0UURPM2R3U01oeXBHanNRRDMxY1JUZTZvdzJs?=
 =?utf-8?Q?lI7mCSO1F4nGAzIxetjAl02wcJ65Rgyg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0N6V29qMTBOS2E3TTBLM0hDMWcraGx5WWYvMSs0WStSQS94a3FsZnVwTVVZ?=
 =?utf-8?B?OFJSSC9UUXNTV0lwMS80Zzl2NjJ6enJhVEs4NGxyL0pTdVdndEJMbHRIeDJK?=
 =?utf-8?B?Mkw0alRWL05peENGN1dZRG9vTC9PU2t6NHhSTEdxdStIK1BOSnFscUtZd1pU?=
 =?utf-8?B?aEg4ZXlxMmdPT1YveWZ0N285RDFKd1lMWFlrVkRGSTFpSUhwWTNPT1lWdWpz?=
 =?utf-8?B?SjRRWDR5NVZxdEo4NC95Nmd5MHZ0TVRseW44NDlUSWFEL0ZaVEg0dTJ1TFYv?=
 =?utf-8?B?ek5LM0V6T0xNOSt4T3hnOC9ZN3U0QzdMRTdUWFJ4bnBsQ1BtWG9sRm41MG01?=
 =?utf-8?B?UnZyaEtXbi9VNTUvTEZQQVpMbzQzMzZ0OWJYRnI1N05WSG8xZGRaTmhUaklk?=
 =?utf-8?B?WlpmS2dMQTd1a1RLMHlvTFcxbXgvNmU5N01nLzdJa0hoQzM5RXp0S0M2elZM?=
 =?utf-8?B?TlpTSS8rOEppTU54YUdwaGlXQ0tHSEtYYWQvTFBrZlU1SkEzQU12KytXMlFv?=
 =?utf-8?B?UFU2UFNaMkVXTXJONTlOczYvVURMT3pNeXFNL3kxUngyL3dxQWg4VnAxY2tl?=
 =?utf-8?B?TVFmQ3J2VlpYNS9tZ1dKNk9tL3pvRTlYdXR2UWNUWWJwTXAwQW5WcW1CWFgy?=
 =?utf-8?B?RGIvZXVWY1liOFg4M2dsVDlQVXNEWmZFN2NhY2NrTTZvYlRwVTE4WHhVbVIx?=
 =?utf-8?B?VUZ4RWlJaWhFcVVsSVQ1eGxKZXV3eE9hSmgxNURDa21sYURxVW9kb2RQcVhl?=
 =?utf-8?B?cEZ0bUN0TUoyUFJPVG9JZ1pTRHJybkozR2MrcmtuTXRYTWxCNXJkWHJEYjRz?=
 =?utf-8?B?MEFYN1FDOUV4RTRNSnFhYnp4K1FBTGs2TE43ak15MzJjblZyaDdESlFvT0Fq?=
 =?utf-8?B?MU4vNVNWVm5wWndNbGNkWHhQdlVsdDdqdjRoNjZCTkFpWVd6Qm8yVGk2bWli?=
 =?utf-8?B?d2diT3dQcFI1cVlIcUhDSU5maldBNDdubHFnQUgxWjJVRm10dUVCOWhrTStW?=
 =?utf-8?B?bmhXRHE5Q3UyeVpWVjI1dnlzWWEwZHhKYkp6Skt3dXplcHBaUUdndUV4OTRK?=
 =?utf-8?B?cU9kUitKejROWnQ1VW80SFB1SHo0K2thZmp0L0JXUWRYdjRJcHZBcVUvQkNO?=
 =?utf-8?B?N1VaT2RPblh2UFNLRVBwZklhMG5kelU2TTJCL05ZdStlME5EY0hSbTR3MlE2?=
 =?utf-8?B?ZVIxZG1yUU1TT2xOMExVWFBlRnhRSkdodUg5cGJVT3c0MlRoWGswQXEyK0JQ?=
 =?utf-8?B?NWJaMHlYKzQ2SE9tS1p2YWFFL0NOWFNDUHI3QmxyaXhETTZQbFl6WGEycUta?=
 =?utf-8?B?VmtmVmwrSDZzTjRZMmgvRURLTVc4V0tWQjljVnVuN280Rm1tcEhJNkRBRCtV?=
 =?utf-8?B?MDdVcld6QjZRZUdteWxPYUFOa2wwMnJUaGI3Q0djcXErYS9CQUkvd0xkaUNK?=
 =?utf-8?B?NU9LVmJVNjFBem1jbHM0NUNPcnR6bEsvWHdoOEFaR3lTVVVIQ1ZDdXFaQ2xN?=
 =?utf-8?B?eTN3OG5SN0FrUnZ2Rlk0cG1XLy9JdVJBMXBqaGRrWkVVOXpBMjBiQnhWbmNX?=
 =?utf-8?B?UCtmRVkrWjZLSU44dERiRkxndWVIOEZMY1lzNjVDcG9GN0YrQW1CclhOT0la?=
 =?utf-8?B?U0o0OUl4RFowdnp4S2liUUdiU1RkSDlUTnE4MlF4a2JVSzhYT3VQRHFrSXJ4?=
 =?utf-8?B?V0xVNE9LeTFRdVNtMXNZeGVpUkhPWDJUc0dnbEZZM2t6elF0TTJuZmRVTzJO?=
 =?utf-8?B?ejFldWxMdDVlaDN1OUtQYnk5Vml2QStaV2E1RWg4cE94Wm93dWM5Qk9XRTNz?=
 =?utf-8?B?RDhwcGRWQzMzYkszQ1c0K2V6Ylp6ZHc0SXo4QW9xOUVYQkNDdCtBNXh5bTJh?=
 =?utf-8?B?ZUkydEwzUy9lRzBSSkc0WW9LMnl4bk1rK0twb29Vb2R3bDJWdVkvNjBEazJm?=
 =?utf-8?B?TGF5Y2JTZVY2T3N5R2Nwb29Na1YyU3lDRU5POGx3bERiakNsZjNUZmg0NkJr?=
 =?utf-8?B?RXFmMkt6R3dmckNFcU9LeHllYTZPT0w4RzhHWTV3dTZtcWNTOHVuUDJCdWhD?=
 =?utf-8?B?aVdjbTNpOGFGVTRZdC9jWStZMU1PL0NiL1N5NzBpdHNjc1lSNXZjNlZzd2tH?=
 =?utf-8?Q?xF1gmYnXOQJGpj+0txQauFnMT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0201aab-41a3-4ed1-7335-08dd394589c2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:28:18.6433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlTACcw4StoBmXyNrk7eAqQaxoCyIlR8SYLjwGdOrHapy+vzAw7pyNLQuY3tZ7YUujPbpniXIdny1jKBtzaRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

5/5
- increased the wait-timeout.

4/5
- rename flag "handle_susp_resm" to "imem_mgmt"
- moved the buffer allocation ot load_fw->imem.buf, to se_probe_if.
- setting imem state at initialization. 

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v11: https://lore.kernel.org/r/20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com

v11: firmware: imx: driver for NXP secure-enclave

Changes in v11:

5/5
- devname is constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- ele_rcv_msg(), is updated to add the wait_interruptible_timeout for the non-NVM-Daemon message exchanges, such that in case of no response from FW,
  Linux donot hangs.
- added a new helper function get_se_if_name(), to return the secure-enclave interface owner's name string.
- added a new helper function get_se_soc_id(), to return the secure-enclave's SoC id.

4/5
- moved the se_if_node_info member "soc_register", to the struct "se_if_node_info_list"; as soc registration done once, not per interface.
- moved the se_if_node_info member "se_fetch_soc_info", to the struct "se_if_node_info_list"; as soc info fetching is done once, not per interface.
- Added two member variable se_if_id and se_if_instance_id to struct se_if_defines.
- removed the member "se_name" from struct "se_if_node_info". Rather, it will constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- moved the static global variable "se_version", to the newly created structure "struct se_var_info".
- moved the member "struct se_fw_load_info load_fw" of "se_if_node_info_list", to the newly created structure "struct se_var_info".
- Replaced RUNTIME_PM_OPS with SET_SYSTEM_SLEEP_PM_OPS, in power-managment ops.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v10: https://lore.kernel.org/r/20241104-imx-se-if-v10-0-bf06083cc97f@nxp.com

v10: firmware: imx: driver for NXP secure-enclave

Changes in v10:
5/5
- replaced the u8, u16, u32, u64, with __u8, __u16, __u32, __u64 in
  'include/uapi/linux/se_ioctl.h'.

4/5
- No change

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v9: https://lore.kernel.org/r/20241016-imx-se-if-v9-0-fd8fa0c04eab@nxp.com

Changes in v9:

4/5
- change se_if_remove function signature, required after rebase to v6.12-rc1.
- move the info->macros to a structure "struct se_if_defines if_defs".
- Removed "info" from "struct se_if_defines if_defs".
- Moved "mem_pool" from "struct se_if_defines if_defs" to "priv".
- Fetching "info" using container-of.

5/5
- Fetching "info" using container-of.
- Fixed issue reported by sparse.

Reference:
- Link to v8: https://lore.kernel.org/r/20241015-imx-se-if-v8-0-915438e267d3@nxp.com

Changes in v8:

5/5
- Remove the check for SE_IF_CTX_OPENED.
- replaced dev_ctx->priv-dev, priv->dev, whereever possible.
- func "if_misc_deregister" moved before func "init_device_context".
- func "init_device_context" before func "se_ioctl_cmd_snd_rcv_rsp_handler".
- func "se_if_fops_write" and "se_if_fops_read", are moved after func "se_ioctl_get_mu_info".
- non static functions "se_dev_ctx_cpy_out_data, se_dev_ctx_shared_mem_cleanup & init_device_context" are moved static and local scope.
- Removed back & forth between the two structs "struct se_if_device_ctx *dev_ctx" and "struct se_shared_mem_mgmt_info *se_shared_mem_mgmt"
- removed the NULL check for bdesc.
- fops_open, is corrected for acquiring the fops_lock.
- Fops_close, mutex unlock is removed. Infact check for waiting_rsp_clbk_hdl.dev_ctx, is removed.
- sema_init(&dev_ctx->fops_lock, 1);, replaced with Mutex.
- structure member se_notify, is removed.

4/5
- removed initializing err to zero in func ele_fetch_soc_info(),
- replaced 'return 0', with 'goto exit', if the condition (!priv->mem_pool) is true.
- replaced "struct *dev" with "struct se_if_priv *priv", in base_message API(s) and others.
- Created a separate structure "struct se_if_defines" to maintain interface's fixed values like cmd_tag, rsp_tag, success_tag etc.
- removed the macros "WORD_SZ", "SOC_VER_MASK", "DEFAULT_IMX_SOC_VER", "RESERVED_DMA_POOL".
- Added handling for "ctrl+c", by postponing the interrupt, till the response to the "command in flight" is received.
- Removed the mutext lock "se_if_lock".
- furnction prototype for "se_save_imem_state" and "se_restore_imem_state", is changed to pass "imem" by reference.
- Added a new structure "struct se_fw_load_info", dedicated to contain FW loading relevant info. It is a member of struct info_list.
- split "imem_mgmt_file_in_rfs" into two "prim_fw_nm_in_rfs" and "seco_fw_nm_in_rfs", to be part of "struct se_fw_load_info".
- moved the function "se_load_firmware" prior to func "if_mbox_free_channel".
- function "se_load_firmware" is updated to use "request_firmware", instead of "request_firmware_no_wait".
- function "se_load_firmware" is updated to load "primary" fw image, if the imem_state is not BAD. Then load the "secondary FW" image.
- Added a new mutex_lock in the function "se_load_firmware", for ensuring FW loading done once, when there are multiple application are in play.
- instead of "wait_queue_head_t wq", used "sruct completion".
- add devm_add_action with action as se_if_probe_cleanup.

Reference:
- Link to v7: https://lore.kernel.org/r/20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com

Changes in v7:

5/5
- struct se_clbk_handle, is added with a member struct se_if_device_ctx *dev_ctx.
- func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send(), are removed.
- func se_ioctl_cmd_snd_rcv_rsp_handler(), is modified to remove the func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send()
- func se_ioctl_cmd_snd_rcv_rsp_handler is callig func ele_msg_send_rcv(), instead.
- Mutext "se_cmd_if_lock", handling is removed from this patch.
- func ele_miscdev_msg_send() is replaced with func ele_msg_send(), in fops_write.
- func ele_miscdev_msg_rcv() is replaced with func ele_msg_rcv(), in fops_read.
- fops_open is modified to create the new dev_ctx instance (using func init_device_context()), which is not registered as miscdev.
- Only one dev_ctx is registered as miscdev and its reference is stored in the struct se_if_priv, as priv_dev_ctx.
- Separate func cleanup_se_shared_mem() & func init_se_shared_mem(), for shared memory handling part of struct dev_ctx.
- Input param for func(s) ele_msg_rcv(), ele_msg_send() & ele_msg_send_rcv(), is replaced from struct se_if_priv to struct se_if_device_ctx.

4/5
- A new structure is defined name struct "se_clbk_handle", to contain members processed in mailbox call-back function.
- "struct se_if_priv" is modified to contain the two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- func ele_msg_rcv() is modified to take a new additional input reference param "struct se_clbk_handle *se_clbk_hdl".
- func ele_msg_send() is modified to take a new additional input tx_msg_sz.
- func ele_msg_send_rcv(), is modified to take 2 more inputs - tx_msg_sz & exp_rx_msg_sz.
- func se_val_rsp_hdr_n_status(), is modified to take input of rx_msg buffer, instead of header value, as input param.
- each caller of the func ele_msg_send_rcv(), is sending these two additional input params.
- func se_if_callback(), is modified to work on two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- Variable "max_dev_ctx", is removed from info & priv struture, as well its usage.
- New member variable "se_img_file_to_load", is added to structure "priv".
- Other member variables - rx_msg(ptr), rx_msg_sz, completion done & list of dev_ctxs, is removed from priv struture, along with their usage.
- func se_resume(), updated to wakeup the two "wq", part of "struct se_clbk_handle": priv->waiting_rsp_clbk_hdl & priv->cmd_receiver_clbk_hdl.

3/5
- Node name is changed from senclave-firmware@0 to "secure-enclave"

2/5
- Node name is changed to "secure-enclave".

Reference:
- Link to v6: https://lore.kernel.org/r/20240722-imx-se-if-v6-0-ee26a87b824a@nxp.com

Changes in v6:

5/5
- replaced scope_gaurd with gaurd.

4/5
- replaced scope_gaurd with gaurd.
- remove reading the regs property from dtb.
- Added NULL check for priv data fetched from device, as a sanity check, for ele_base_msg apis)

3/5
- replace firmware with senclave-firmware.

2/5
- replace firmware with senclave-firmware.
- drop description for mbox
- Replaced "items:" with maxItems:1 for "memory-region"
- Replaced "items:" with maxItems:1 for "sram"
- remove regs property.
- remove "$nodename"

Reference:
- Link to v5: https://lore.kernel.org/r/20240712-imx-se-if-v5-0-66a79903a872@nxp.com

Changes in v5:

2/5
- updated the description of mboxes
- updated the description & items for mbox-names.
- updated the description of memory-region
- move "additional properties: false" after allOf block.
- removed other example except one.

4/5
- Corrected the indentation in Kconfig.
- info members:mbox_tx_name & mbox_rx_name, are replaced with macros.

5/5
- Replaced "for  secure enclaves", with "for secure enclaves"
- Replaced "user space" with "userspace".
- End the line "[include]<linux/firmware/imx/ele_mu_ioctl.h>" with a period.

Reference:
- Link to v4: https://lore.kernel.org/r/20240705-imx-se-if-v4-0-52d000e18a1d@nxp.com

Changes in v4:

1/5
a. Removed - from EdgeLock Enclave.

b. Removed , after "Each of the above feature,"

c. replace "can exists" with "can exist".

d.
-messaging units(MU) per SE. Each co-existing 'se' can have one or multiple exclusive
-MU(s), dedicated to itself. None of the MU is shared between two SEs.
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
 Communication of the MU is realized using the Linux mailbox driver.

e.
-All those SE interfaces 'se-if' that is/are dedicated to a particular SE, will be
-enumerated and provisioned under the very single 'SE' node.
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").

f. Removed ",". Replaced for "Each 'se-if'," with "Each se-if'.

g. removed ","
-  This layer is responsible for ensuring the communication protocol, that is defined
+  This layer is responsible for ensuring the communication protocol that is defined

h. removed "-"
-  - FW can handle one command-message at a time.
+  - FW can handle one command message at a time.

i.
-  Using these multiple device contexts, that are getting multiplexed over a single MU,
-  user-space application(s) can call fops like write/read to send the command-message,
-  and read back the command-response-message to/from Firmware.
-  fops like read & write uses the above defined service layer API(s) to communicate with
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
   Firmware.

j. Uppercase for word "Linux".

2/5
a. Rephrased the description to remove list of phandles.

b. Moved required before allOf:
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
 allOf:

c. replaced not: required: with properties: <property-name>: false.
   # memory-region
-      not:
-        required:
-          - memory-region
+      properties:
+        memory-region: false

   # sram
-    else:
-      not:
-        required:
-          - sram

d. Reduced examples. keeping example of i.MX95.
e. node-name is changed to "firmware@<hex>"

3/5
- node name changed to "firmware@<hex>".

4/5
- used sizeof(*s_info)
- return early, rather than doing goto exit, in ele_get_info().
- Use upper_32_bits() and lower_32_bits()
- use rx_msg here instead of priv->rx_msg
- Moved the status check to validate_rsp_hdr. Rename the function to "se_val_rsp_hdr_n_status"
- typecasting removed header = (struct se_msg_hdr *) msg;
- Converted the API name with prefix imx_ele_* or imx_se_*, to ele_* and se_*, respectively.
- Removed the functions definition & declaration for: free_phybuf_mem_pool() & get_phybuf_mem_pool()
- removed the mbox_free_channel() calls from clean-up.
- Flag "priv->flags" is removed.
- Converted the int se_if_probe_cleanup() to void se_if_probe_cleanup().
- Replaced NULL initialization of structure members: priv->cmd_receiver_dev & priv->waiting_rsp_dev , with comments.
- Removed the function's declaration get_phy_buf_mem_pool1

5/5
Changes to Documentation/ABI/testing/se-cdev.
a. Removed "-" from "secure-enclave" and "file-descriptor".

b. Removed "-" from "shared-library"

c. Replaced "get" with "getting".

d. Added description for the new IOCTL "send command and receive command response"

e. Replaced "wakeup_intruptible" with "wait_event_interruptible"

f. Removed ";"

g. Removd "," from "mailbox_lock,"

h. Replaced "free" with "frees"

i. In mailbox callback function, checking the buffer size before
copying.

Reference:
- Link to v3: https://lore.kernel.org/r/20240617-imx-se-if-v3-0-a7d28dea5c4a@nxp.com

Changes in v3:
5/5:
- Initialize tx_msg with NULL.
- memdup_user() returns an error pointer, not NULL. correct it by adding check for err_ptr.
- new IOCTL is added to send & recieve the message.
- replaced the while loop till list is empty, with list_for_each_entry.
- replaced __list_del_entry, with list_del.
- Removed the dev_err message from copy to user.
- Removed the casting of void *.
- corrected the typcasting in copy to user.
- removed un-necessary goto statement.
- Removed dead code for clean-up of memory.
- Removed un-mapping of secured memory
- Passing se_if_priv structure to init_device_context.
- Updated the below check to replace io.length with round_up(io.length).
	if (shared_mem->size < shared_mem->pos|| io.length >= shared_mem->size - shared_mem->pos)
- Created a function to cleanup the list of shared memory buffers.
- Used list_for_each_entry_safe(). created a separate functions: se_dev_ctx_cpy_out_data() & se_dev_ctx_shared_mem_cleanup()

4/5
- Changed the compatible string to replace "-ele", to "-se".
- Declaration of imx_se_node_info, is done as const in the whole file
- Remove the unused macros from ele_base_msg.h
- Remove the function declaration get_phy_buf_mem_pool1, from the header file.
- Replace the use of dmam_alloc_coherent to dma_alloc_coherent
- Check for function pointer, before calling the fucntion pointer in imx_fetch_se_soc_info
- Removed the unused flag for SE_MU_IO_FLAGS_USE_SEC_MEM.
-  Removed the unused macros WORD_SZ
- instead of struct device *dev, struct se_if_priv *priv, is used as argument to the funtions:se_save_imem_state, se_restore_imem_state, imx_fetch_se_soc_info
- Removed ret from validate_rsp_hdr.
- changed the prefix of the funtion: plat_add_msg_crc and plat_fill_cmd_msg_hdr.
- indentation correction for info structures.
- remove the check for priv not null from se_if_probe_cleanup
- Removed the casting of void *.
- se_load_firmware function is corrected for not freeing the buffer when allocation fails.
- Checking if get_imx_se_node_info() can return NULL, in se_if_probe()
- imem.size has type u32. return value from se_save_imem_state() will be assigned to imem.size in case of success only.
- removed the flag un-setting in case of failure. priv->flags &= (~RESERVED_DMA_POOL);
- removed the function call for devm_of_platform_populate(dev);
- Checking for not-NULL,  before calling the funtion pointer se_fetch_soc_info.
- Removed the checking for reserved memory flag, before freeing up the reserved memory, in se_probe_if_cleanup.

3/5
- Changed the compatible string to replace "-ele", to "-se".

2/5
- to fix the warning error, replaced the "-ele" & "-v2x" in compatible string, to "-se".
- Added an example for ele@0 for compatible string "fsl,imx95-se"

Reference
- Link to v2: https://lore.kernel.org/r/20240523-imx-se-if-v2-0-5a6fd189a539@nxp.com

Changes in v2:

4/4
- Split this patch into two: 1. base driver & 2. Miscdev
- Initialize the return variable "err" as 0, before calling 'return err', in the file ele_common.c
- Fix the usage of un-iniitialized pointer variable, by initializing them with NULL, in ele_base_msg.c.
- Fix initializing the ret variable, to return the correct error code in case of issue.
- replaced dmam_alloc_coherent with dma_alloc_coherent.
- Replace the use of ELE_GET_INFO_READ_SZ, with sizeof(soc_info).
- Replaced -1 with -EPERM
- Removed the safety check on func-input param, in ele_get_info().
- fix the assigning data[1] with lower 32 address, rather than zero, for ele_fw_authenticate API.
- Correctly initializing the function's return error code, for file  ele_base_msg.c.
- replaced 'return' with 'goto'.
- Use length in bytes.
- Corrected the structure se_msg_hdr.
- Moved setting of rx_msg  to priv, into the function imx_ele_msg_send_rcv
- Will add lockdep_assert_held, to receive path, in v2.
- corrected the spacing at "ret  = validate_rsp_hdr"
- FIELD_GET() used for RES_STATUS
- Re-write the structure soc_info, matching the information provided in response to this api.
- The "|" goes to the end of the previous line.
- Moved the locking and unlocking of the command lock to the caller of the function.
- removed the safety check for device private data.
- Structure memory reference, used to read message header.
- In the interrupt call back function, remove assigning waiting_rsp_dev to NULL, in case of response message rcv from FW.
- do while removed.
- replaced BIT(1) for RESERVED_DMA_POOL, to BIT(0)
- The backslash is removed while assigning the file name with absolute path to structure variable.fw_name_in_rfs =.
- Update the 'if' condition by removing "idx < 0".
- mbox_request_channel_byname() uses a "char" for the name not a u8. Corrected.
- devm managed resources, are not cleaned now, in function se_probe_if_cleanup
- Used dev_err_probe().
- Used %pe to print error string.
- remove "__maybe_unused" for "struct platform_device *enum_plat_dev __maybe_unused;"
- used FIELD_GET(), for  RES_STATUS. Removed the use of MSG_TAG, MSG_COMMAND, MSG_SIZE, MSG_VER.
- Depricated the used of member of struct se_if_priv, bool no_dev_ctx_used;
- Moved the text explaing the synchronization logic via mutexes, from patch 1/4 to se_ctrl.h.
- removed the type casting of info_list = (struct imx_se_node_info_list *) device_get_match_data(dev->parent);
- Used static variable priv->soc_rev in the se_ctrl.c, replaced the following condition: if (info_list->soc_rev) to if (priv->soc_rev) for checking if this flow is already executed or not.
- imx_fetch_soc_info will return failure if the get_info function fails.
- Removed devm_free from imx_fetch_soc_info too.

3/3
- Made changes to move all the properties to parent node, without any child node.

2/4
- Use Hex pattern string.
- Move the properties to parent node, with no child node.
- Add i.MX95-ele to compatible nodes to fix the warning "/example-2/v2x: failed to match any schema with compatible: ['fsl,imx95-v2x']"

1/1
- Corrected the spelling from creats to creates.
- drop the braces around the plural 's' for interfaces
- written se in upper case SE.
- Replace "multiple message(s)" with messages.
- Removed too much details about locks.

Testing
- make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
- make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
- ./scripts/checkpatch.pl --git <>..HEAD
- Tested the Image and .dtb, on the i.MX8ULP.

Reference
- Link to v1: https://lore.kernel.org/r/20240510-imx-se-if-v1-0-27c5a674916d@nxp.com

---
Pankaj Gupta (5):
      Documentation/firmware: add imx/se to other_interfaces
      dt-bindings: arm: fsl: add imx-se-fw binding doc
      arm64: dts: imx8ulp-evk: add nxp secure enclave firmware
      firmware: imx: add driver for NXP EdgeLock Enclave
      firmware: imx: adds miscdev

 Documentation/ABI/testing/se-cdev                  |   43 +
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 ++
 .../driver-api/firmware/other_interfaces.rst       |  121 ++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   17 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   13 +-
 drivers/firmware/imx/Kconfig                       |   13 +
 drivers/firmware/imx/Makefile                      |    2 +
 drivers/firmware/imx/ele_base_msg.c                |  273 ++++
 drivers/firmware/imx/ele_base_msg.h                |   94 ++
 drivers/firmware/imx/ele_common.c                  |  361 ++++++
 drivers/firmware/imx/ele_common.h                  |   51 +
 drivers/firmware/imx/se_ctrl.c                     | 1320 ++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h                     |  136 ++
 include/linux/firmware/imx/se_api.h                |   14 +
 include/uapi/linux/se_ioctl.h                      |  101 ++
 15 files changed, 2647 insertions(+), 3 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240507-imx-se-if-a40055093dc6

Best regards,
-- 
Pankaj Gupta <pankaj.gupta@nxp.com>

