Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1422272805
	for <imx@lists.linux.dev>; Mon,  8 Dec 2025 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159400; cv=fail; b=U2dABiw2qdGU2RQIiBszkcqx8Oe5pQvwgOykRgswD3v8LCyNrT9nQ8H0fnUohmXPbHn6u8Btk+cxT8NHAVRt8Onmh+pVKlvIZX6mu31UNwzSQX2NnLhg7BXyQMvSiwYTIedW3CjbF3DBAooYoqtI+Dz+FA7ATa+cns17S/L2C1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159400; c=relaxed/simple;
	bh=/DX9bX/jbS7uIYa5zMvMiM7YAvj5jc5kdZxQ5DDrx7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qhd3rHzAGQmhGdcQL2xkP5i3QQ50XzoHmKZSw98eeZT0dvSuihZ9tZwOD6ZHepEP14kp7j7ZbLv94GdUUJj4p6RvMO/OTmLXvtTFI3qDicuvQEyBrWHl9Lg1smjaI7AqsXQXy8KgprprwQknsepDXxb6S8UGMDz/g2WN17r3sAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MOTjvihG; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MOTjvihG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V39KeDX/xGQ6OwtfWnzs6OYaKn0RCnnu6AHBLL1o28QmwFnnbDHbQ9LpPzreS2UVbk65etNU36jlSiFPZGBzxyTGDJ789xE9YNCn8mEfM8kJ7fQhQJt67Y2OvWPwF8c3Zce+CyLaITlSFFJ/oCW0//DNj+aadHDKuMDToJviax57LGMUXevAf+QnIBx1Tl0xTwhVbIeYcB21oyaZ0ISbZlthGTy2JWci8ZNo2GgBytQ7QZ4q0+rHM9df88HtMKzyW16J9We8jaSpe/9khz7ITZY9nq6bRMXFO1ZxzI84Xsvhr8koQ4cfV/GMBSqUmxoTDgNKsqo+wtJduFk6Cygs5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdiHpXPdAh35EuPKTy7kBStHZnqtS65K/I9Y0lpgqPE=;
 b=UVNXfZp5jwGmV0Ae8TTN2CyZIkKtSguue3BKHFJsEQRTQbn+B+UGVrMNGcWV9Py4VPtHECccjSg31GLm03SnrCMpUQSMYhKYJTYz7FOMKtgJ2jUb2rHJe/taj7Rb73i2eWlpIr2t+qoehmCAMVEzX6yqnfmXxLzuhUjLxP/yqbJOpjh6YPhdBwv+0xAm5lB7ZZEX8/s49yQX0uOBfkeSmQPskiBcEgxqdK8gYo3AbJSZ7XKz0rQl39ouq5ROCuy5roTlQrQiXsfaMkNod9pPINXJE+0RnYeafyv7nqPJr8Qs8IU5F6vfX62c+eNmf8bDhQoVpqVa2BexclZSJvhuVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdiHpXPdAh35EuPKTy7kBStHZnqtS65K/I9Y0lpgqPE=;
 b=MOTjvihGIVgeABxKlw0gaDt3OkVsHqzFzSUfjvcfVGvK0ZU1kT40oDIiaEhxWG9oPY15wyMSRLOZrGaEUcC0h+zA9JKcftkp0AOUSuQ9/8bV1v1TOMfvIQ/OUs1Te21fvWmNFEhUc9cNo5iDYEaMddIVHqX/zRwAziLvvFbyyQWsGCRnFultC9e71kKAUeNaOePfxv6hSixwyYuBQf2ld2ivpezoWkMIONRu4kQ1V5rCa/qONMZ3UPH0tzSQY9mXmLcm2PM3hzx0hcUKYwhD17ACGYJ3AEv9eHMcrAl5sfj20/R3PWiE0glDMYXruNamrXrqT9OCs9AmzCdpvLSIGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7533.eurprd04.prod.outlook.com (2603:10a6:102:f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 02:03:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 02:03:13 +0000
Date: Mon, 8 Dec 2025 10:02:03 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aTYxm_dfMwF4H0_b@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
 <aTKVMAMQ6v_BwD6R@oss.nxp.com>
 <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a1be5c-448c-45e1-c026-08de35fdf142
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFBRd1NkREFRTEhEWm02VEVCdGsvUW1HSm1kSllzYURTbXFZOEx0RjZXVjcx?=
 =?utf-8?B?VWlVblgyaWZ6NnNWU3ZycGZnNnNOVXVaWlJ2UGNDMjkzak5jdHl6Qk1YNjN0?=
 =?utf-8?B?R2N0d2RtVFVNS1dESU5saENCOHhVNk1XU3JRZkM0YjF6MVhaa1ZvQyswRmM1?=
 =?utf-8?B?b0dKTTVPSngxUlpkZk1xSVM4aFllV0JYemlkYytmbS8reEdjb1FkS25iVVVu?=
 =?utf-8?B?K0RPSmRYRkV0SFhiK3l2KzdJODRIOTBGUlcxZjdyWGN2NzdETXRCVnBiY0lF?=
 =?utf-8?B?YjJ3THBBY2tkR0lyS0tVLzViRVpWT29Gb3FvNXpweDZEKzF4UkNQcWJYYnJZ?=
 =?utf-8?B?SE82WnZMUWV6S01HU1c4c3JnM29pUjA5REYrU0wxVWZ5eXZJSTgzc2RZdUt4?=
 =?utf-8?B?VGJVZ0taN0lCK3lEZWR6SHQxZWk0UlJ5a0RrRTNYS241c0toOTltcmIwYUtt?=
 =?utf-8?B?NVpzNW5JVXVaNHp6THFiZkVpc0R3U3JVOTYrRk5kZkFqd3MrSWJNQlJOcUFZ?=
 =?utf-8?B?TmlPL0JNT2FTZDZVV0liZXJDWDJkUUZHRnJiemZJb1dDTGpBcGdkWWJYblV3?=
 =?utf-8?B?NWVrY1pNbmVRbUFBeURpaS9Md2cwQm1ZT01XbzROUytHSEZmR3Z5QUowdGQw?=
 =?utf-8?B?SllhaG9nTE5aRlpqNEpRSlgyekR6QVEwRkovWVczdkl0QlU4MThRTXVNdUlh?=
 =?utf-8?B?OW9IeTlheGlndndJNCtnT0EvTFc4WFNuVURWaXU4OHhRc0pISjU1Z3BaVDN1?=
 =?utf-8?B?eFo1NkVuMUMxMFhIb2xTeGczOGZadmhLcU82QW1tYTFUTGtSMEliNUhZNlRE?=
 =?utf-8?B?dEZ3LzBvN3BuTktJT0VtOThScTQ1MjZoUHBHUXloMWVRc2FBK0hWVEJSVEdj?=
 =?utf-8?B?WlYyQmVtVkxyTnZqejVzb2Ntbk5qaC9iRFhkTnJyYWN6djZ2ZVoxVDAxSGpz?=
 =?utf-8?B?NmVjYzdwWHJ2elBDa2dUc1Q1Wkg5SGc4d21QTHNDazBSMDFucGhtY0NvNVVF?=
 =?utf-8?B?dmdPbzdsbjNqWGg0elRKTlYwK2VlZFd1UGdzREN6NklpZHJqWHh4dGlEdW91?=
 =?utf-8?B?YVFNVWZ3OUFnUEZCWkc1ZU9MS2xKd3BWOWVla05iVDBXd1c4bVE4M0FyazZH?=
 =?utf-8?B?WERPVENkbnZwdE1JTmJJbXE1akVrZG82RXNiT2F3azJnNW9ldzRkK21wbWpa?=
 =?utf-8?B?em4vYlVJd21qZlo1dmhoNit2YTNWUTM0NUw0VkpjVHB6eUwwR1JmRG1uR3Yw?=
 =?utf-8?B?cHpRRWFjUkZRMnZ2MHUyRkVDRFBOenRVR0kvRUh4RHJaaDhkSlZJRlFpNjNu?=
 =?utf-8?B?OS9CUHF1bzNRYzd3QndjekljQWxoMWNBNnRUdG9xNjhSTTZLYlJ3K3NVb0Uy?=
 =?utf-8?B?RUZkVEJxRExzaVJWdm5LL0RmdEMvajFZZVhNVDhRZk5ENHVNdmo4N3hab3c1?=
 =?utf-8?B?TDVBTEpoT2tCeXd6aUsyRDNpUDUyTHEwbjFiTVRSSGQ0R0FHMnZwYVU2N0hy?=
 =?utf-8?B?dktxYTdvdlRybGpKTXF0RWZTNnBFLzcvVWlyakFDbGNFdHRNT0V4aXMveFQ2?=
 =?utf-8?B?WnQ3RVhpU2hPWUtKYi82TnRkZkk2M0xhaUZkOXlEZEVkL2lBVHpMQTNFQkhP?=
 =?utf-8?B?RmFRK1dmN0RLSEhEanFQZzVpTXJYeWwxT05ERzZSbVpDR2RXQmxjT3dxbmh1?=
 =?utf-8?B?Z2FXdyt5UjBHTXp4TWVmMW9JMythRWxWT1VSdXRUSmxSSjVtMDdPYWtoRGc3?=
 =?utf-8?B?NjM4d1FnV1NZRXQzREg2ekZFUGpHUDl2dHd6MmJ5cUZZZVBRcC9aNzJQcUcy?=
 =?utf-8?B?N0lCWVB3TjJ3Q3NzQm1BUU5kUlhaOEp3cmpGQ1lEeGZqbWFSWEZodkxKSVhK?=
 =?utf-8?B?elkwTkxVaU5zOTlMQXV0LzdOUDRyWWpvTzJpYnZtRU5NRnl5UDROSXRuSGRy?=
 =?utf-8?B?YWJaY2RGUHRKZlYrcWR5NUFZVnEvRGdVT2x5Yk9mMGhIb2UrV0xBQU9iM0F1?=
 =?utf-8?B?T1BVcmhjY3ZpeHBLY2hKdUcvLy9PSFdkQlcyUTI1K2lvWXFoWGlxSnR2VFp5?=
 =?utf-8?Q?mP32ER?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzJEbE51ZDFtYWpmdmxRUWF6RmZGQVYvSUFOQ2p6UjhzMm4ra3Vvb0Q5N1hs?=
 =?utf-8?B?dUswSm9vbEY3akc2aXVNcUVhSDlVTzBray9XOGhGbDA0S1g3VnZPYldtcVVL?=
 =?utf-8?B?U1FGcVhkRmUxcU1ZL3dyRVQzc0NsT2R4YjVzcCtkVW5samFKdEw1cHp5TDRL?=
 =?utf-8?B?TFlSZ1c5UDJ1K3czSFVRUkdQemVKTUtxekozMENYUFhORFdMUTVNSW0zeUNW?=
 =?utf-8?B?bk5RY2dFNHRjelp6N1RsRXlmYnZKbm1CcE5pcUh5ZXkxU1B2Mk5oQ1B6VDdz?=
 =?utf-8?B?RzZwUEVoMnFzZTVNMHU5L0RxenRpcDdJalJGMktmUWMzVFBOSUpnVzNVR3hu?=
 =?utf-8?B?MlhISTFNY1MzM1ppRjhHd0VlR3hiRG84VGtlRzZJeUp3Ulc5dkpQeWVEWnRm?=
 =?utf-8?B?U0VZUno0Z0NqN0crL0pyMEFMbkpZZU9RZTJtN1F1QTJKTGNWUFR5VVlPdDds?=
 =?utf-8?B?VE5YalZscXNjNHJEdGw1RGVoRmxsMzU1Vk5MNkdkTi9aWFlwMTQya2syWmQ0?=
 =?utf-8?B?ME13MDJINURXOHpnb0pFbk1MZzlUWE1qd3ZOeFZEV1YrR1NaVWJBd2VYd2M1?=
 =?utf-8?B?ZHYxVzc5NEVVTis3Z3d2aThnYyt6cFJlMVZKS2YwZzFITzlsMmU2cmdVVlhM?=
 =?utf-8?B?eEI4NzVJMG1Eei9EQlpJZmhnc1dJMFl6ZUYzRWtLeUtBcGNjNno3dFFuNzVG?=
 =?utf-8?B?OUxxMGJYdzZ5MlhFWWR4bGpPN1BDS2kvMFprZ29rc3hKV2dKTkJCUVF4RlEr?=
 =?utf-8?B?Q2dDdmUrZ0hYdHF5Qi8rYy9FZjh2VU5pRTI5a0puMmowRmlEYWV6dHpqQzNy?=
 =?utf-8?B?MFNKdlVNRUpPemtjUkxkSVpwSllLVnk2MXcvZTF5T3ZHUXB3eFpTME9DQ1h5?=
 =?utf-8?B?YWVRNkc1RjdDcVp4N0RXVTBlOEFDRUttSWRLVVE0ZDJrUi9OVlVBWm5MS3Br?=
 =?utf-8?B?M0tScUcxTGxrQlk2eDczRjA1SHNFMEdaamhVKzNmWGdZL3I5RWk3dnpPNnNY?=
 =?utf-8?B?eGpCeFJxUHkyQmNMajBJY3dnK3V1TGpJdmhvbGM4RDI2NHRmMDRPOTlaSWZN?=
 =?utf-8?B?aUpnOWZTYnkvVUd5UFhuM09remdFSTRJR0hNcHNKQUh5M1lXaG0wRU9renZr?=
 =?utf-8?B?YktpNkFYSTBKZ25KeDZHdjhuUEV1QTJLM2dvd2lFVGM3MmxCMmN3UlZwZlhI?=
 =?utf-8?B?YlVaMWY0U0VXZHRIMDFhR2NpaHNQR1dZWUhrSEExQ2VYVHBSOVNPL1EvU21L?=
 =?utf-8?B?UmRMUnNaTE1HRU1CM3Q4SVFzNWdrWHh2ZnBELzVXYXFjVlVXbCtXNS85dldB?=
 =?utf-8?B?eWpaT1dHaEQ1K1Y0UURKT20xSmE2aXgxakxXVTJGaXo2TXpKaHY5Tmo5VWQ5?=
 =?utf-8?B?ejQzd0tMemZWYjRCKzlHdjRGRUh5R3BuRFNDaStlMVRacDZVNjRId0NTMktY?=
 =?utf-8?B?aTV1QkNwUktQV1F5ajlYZzBnS01LSGllbmZKTExPQmlFbEhhMjY4ejhjWU9w?=
 =?utf-8?B?aU81dXdWdDc4WHhoUHM1bm54QlBWTTEwa0xYNTNvYmREbStBTVdoMEV3cjFR?=
 =?utf-8?B?ak5HU2Yvc253WFRjUWxJVEJGMHF6Y0d1YzlyOWxnOHh1OFBXV2cwRTRJMlda?=
 =?utf-8?B?eTdwUFZUaU1HbTBOcGRXUlNFemVWNzNkTHZna2dLdjhUaG9XcjNKQ3hwa0Rl?=
 =?utf-8?B?LzdxTDBSSm1XK3VEdDVxTSttdU5RNjlkb0ZPS2tVWCtuZ1NzUytWU1RWK3Vp?=
 =?utf-8?B?SFM2L29PT05udHJDYUhWNFVZb3k1aDBIc1ZwMkJRK2JDUVVneDdKbmlBUGJJ?=
 =?utf-8?B?VStzc0lVd25xMGk2WmxZT05SaVk4VEhsSSsyTVpQclh5eDVYM2FtM2FFc1NC?=
 =?utf-8?B?UTRhTGxSV2NkQUxrNnpRYnVTNy9jQysxV29kRzhLenNhL2ZKRk5GNW9VQzlE?=
 =?utf-8?B?eVp3SkFWdVVkYlgvUi8xUERHc0ZuODhKb29SRVhzR0NzNGp0VHBoR0MzczdB?=
 =?utf-8?B?a1I4M1FpTDhhSnYxb3ZiaUllRFN0Sk1za3hDYi96cEFqSkpTUnIzb2RuOCs2?=
 =?utf-8?B?QzBvZ2pzNVB3K25rbnBoQjRyMWJINHBXeGdheEVRSlE1QkpiTnp4Z2FaN3Qz?=
 =?utf-8?Q?abF/zqlRucOJ71go8JOVAhhaf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a1be5c-448c-45e1-c026-08de35fdf142
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 02:03:12.8311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9BnpmWjbn9/AyunM/c8Hbk72szE6S+aBX/ty1XEgbffsXC8Taue81ujR1Sx2cU0g1k2K48ohXg8Jis2SCFHxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7533

On Sun, Dec 07, 2025 at 10:01:06AM +0100, Marek Vasut wrote:
>On 12/5/25 9:17 AM, Rain Yang wrote:
>> On Thu, Dec 04, 2025 at 04:25:38AM +0100, Marek Vasut wrote:
>> > On 12/4/25 4:01 AM, Rain Yang wrote:
>> > 
>> > [...]
>> > > > > For the Linux working environment,
>> > > > > CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
>> > > > > 
>> > > > > Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
>> > > > > of its frequency in any OPP entry within the frequency table. Removing it
>> > > > > could simplify the OPP handling logic and reduce unnecessary complexity.
>> > > > 
>> > > > If the clock can be disabled by SM, Linux has to make sure they are NOT
>> > > > disabled, so they must be described in DT, right ?
>> > > > 
>> > > > > [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622
>> > > Currently, only CLK_GPU_CGC shall be described in the Device Tree[1], as it can be gated.
>> > > The other clocks (CLK_GPU and CLK_GPUAPB) are always-on in the Linux environment,
>> > > so describing any of them in DT is not necessary and would not be proper in this context.
>> > 
>> > Since this discussion is in fact unrelated to this bugfix, I would propose to
>> > fork the discussion into a separate patch. Can you please submit a patch for
>> > the GPUAPB clock ? Note that I believe GPUAPB clock have to be described in
>> > DT, if only because DT is a hardware description, and to make sure the GPUAPB
>> > clock are correctly enabled by the driver.
>> 
>> Okay, I’ll submit a patch later.
>> The commit message should reflect that only CLK_GPU_CGC is enabled.
>
>The commit message , and this change , is unrelated to GPUAPB clock.
The commit message is ambiguous. Could you clarify which parent clock
you are referring to, and whether it can be enabled by CLK_GPU_CGC?
If it was CLK_GPU, CLK_GPU_CGC can't be able to control it.     
