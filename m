Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6567A30E0F3
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613754; cv=fail; b=H4Zp/jVXsjCsEOxq57uYavOWcKbbeleTtEZiO9CK9YVS+2B+9Vz8h7f5ao7FlqPxzsLSoVeUBOrFeRzzheXjm2MQRvIyEeXlDZEC0SF2E/QGM0hv3rRgqen2N6neNJIQoBWnnQb3rFUSvRe4gQBowzl/mgHlbwvd/7Wz1NhNMJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613754; c=relaxed/simple;
	bh=7AdOH8+1CDD117RoYu6WSHNu4PhrUoyx5/NCfOMGUCQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kyK/GDnr2GjizSiKOgxxpz+7Q1xJJFaQEoaVOfcg2UMRRom34Gxwdw2Ajn21slzz1Lbqe60bdPyiy0JWYjM+HLK4zmGapLCZypR/bTs/xg8N98bBf2Aj8QuEFfUjIZDzVBYXEso6Ji4XIK/7qFChtzLsFAr1EuIvdyqo3fC4GPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Yy+SszV7; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Yy+SszV7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0oRP7gvELrKmD3Ni9M2XWurmoMXXRr9tKauMgaGhjAeJQ3vzO1v4Rm88WBubVSvd/ktOt65LQRf7tv3ddVqQU22R5/CTEFDtVdo/pZwG+CDmBu1LQUNS4JEVgc+7v9xausOj0MYBmVqlh5eXVNcOc17Z9d31bGQnRzg3ckk9cNMCuM8W+gzlOzcHpv/MRWE0xkGJkQZad3IN1OZF7ZU/j57lHbsv3U3cP7OE9jV9a2caUcOF8/i244lsryu+X0E69LKlY5oMrr5KVUwU1SEVjeP/Z5DiWiljccDt9T9u6su/Wv2q76ocdVytKObLVUgpFCsUxfXuqtOURmNRSH7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMIODfwQz9VcbPT8x6jGbJp2x/1GooUpvUbg8jwgug=;
 b=Dsc2g0JhJCwC+TSdjwXXKpdSzScQvJVBsmFLhfd5tsrjiv8uUBtHJKoSlgWaNTrRHtaQeEWLBeGFLXoG3VxbWhll+lb4B61HFkv0TWmZdt+JgJF2gL+aHEcBvALoyDpGyaM07D6zrOEqV/l0aluCYv1u3zGEagYz9riajoxMRDKisiUM7dsG4vCL14WOr5NjpbzLJuUk8FbRoV1Y2ZB1BqQ2m6AMZ6IY5jgxpluKLP63bV2lQhNPeR4ewKgBiFNT+2o8kSnQEvXpaV7MsIf131vgWLZ15Z2KNVOPcL6Zp6e2CTznyLsJJoix6mP19+nVhIoYEEKz3DCCnZpUzTSVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMIODfwQz9VcbPT8x6jGbJp2x/1GooUpvUbg8jwgug=;
 b=Yy+SszV73/TNkCI9C1a2K0PotBqzoIMjo3/VMsdj8jIW5PHPRSuoi9Gp5OVqZAFtBcdqTdFfn6DQ7dvJkbpp1xWG+bBXpn4+shuUGqGQqV4TRJGd+QRduAi9OOcu1Gv4QCdJhetMRW7u7s8QjtYWmX0KRTTAle7tSGnFV5IDQqMTNAZWDnLHOTrfNpU2GlxhXiqysWBWR88ZWQNbEMhlrJsFJ4nFIVANMlFTp4SqnpP5KA0gcM5sCHeU8eXxdHqmec8QecpxkjRnCNWeUF0eGkmE2Xa6tpkeWxDjXVdHTQI1e6wp67Cm4Hdzpyo1JkzHws6T4nbMtV/kkc1o1AdRkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Jan 2026 19:48:40 +0800
Subject: [PATCH 1/7] arm64: dts: imx952: Add idle-states node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-imx952-dts-v1-1-68b5a4d69710@nxp.com>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: 87df1a4c-d570-43d1-3bdb-08de4c506e83
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVFpZ0N3bXJvd0NtaFUzbFdHeHRBSXdibzJUY0NVZmxwN3FJN3VpZUlxeFdl?=
 =?utf-8?B?bUxYMS9oQWNndHlFaGxCZHZNd2NOdFBiVXpzQUhJb2tPM0Fxenl3QndaeWIr?=
 =?utf-8?B?cHltOFFwRlFMc0F4bGlocyticVFxYzBIWG1TaFZxRVA1ZVRZeW1pSlk4djZ5?=
 =?utf-8?B?N1gwRk92VFNPZ2dDQjB0dnBOMlFPYmZGQmRMTG5USDBJY253MW5RQ25VZnc2?=
 =?utf-8?B?QmM4WmtSR3pDLzAwL2pNQmQ5blk3aytlOWhXTCtNVXBwM3MxWHZSMHFzRStL?=
 =?utf-8?B?bE9mZTB1ck1ITmtibmpVdTVldWRtQUFKL3J1TnpZVDV1UEZhODJMSWxNSWRo?=
 =?utf-8?B?aExrdjlMWXNPN01wQ05qbkU3VGkwVXg3czBRaTQ3dldNYTNvWUJLOFliS082?=
 =?utf-8?B?YzFTQjliWjJJUVlFZ215R2hSMGpxZkttaEY0MENlVkQ0bDk1K2NYeEJIZEI2?=
 =?utf-8?B?ZC9EVGY5bXp4U29oYkYyeXNsWGQrcEtNdlZIZHprNCtrK05zZEJXeVMycmc0?=
 =?utf-8?B?S0RvVGlnV3BIQ25QSlpibHpTYUNHaUF0dTQyWDA4Vy8yRGk5eGJyT2VwQy9H?=
 =?utf-8?B?N3JuT3lCc2FmaVd2dGhWdDJ3UXZtMzNIZGZVR1FYVzFZN0dlTHBmSG1lbmFu?=
 =?utf-8?B?V1lXVnNGbTJ1RjFEZkdlOTdoaFNZdWhET3V0VHpYZGJoYjVObXJLdFo3VXVr?=
 =?utf-8?B?V2liSHE5alB4NHYvdzc0cVhremh3bDhHTlhodEZwOHRwTjlSMkJWT1gxald5?=
 =?utf-8?B?cGkzbkFNZmw3WDd2SDhtaVpHUUxmamFhenBEN011R2NLczJLNW5kSmVwTDNU?=
 =?utf-8?B?c0hVTWoxN09VbEFGVnlyZmtoV3pHSE5wZk5SMHljaVFKVnRaZ0RZMG5oSVlQ?=
 =?utf-8?B?UENrcSsyRFNoYkxwUEFHMnFwWURpY3MzTjM3TkN1OWx5L2tNUkNMUXoyYklV?=
 =?utf-8?B?c1RQaFFaZzIybUlVS3lTR2N2SjJwVDZGOVBnV1pPUmp2SVVHd0VVb1M4bTdG?=
 =?utf-8?B?SnFUd0p0dnd4ZDZYZGNRN08rUG5LN2lKMHFSdldRQVhWb0RhYURLK3FCdHBv?=
 =?utf-8?B?WVhObWVNUTl5aTVGb09UMW56TEJVVlJBV3lmb1lEYlh4TUgxMEQ1YmNQemJk?=
 =?utf-8?B?SUpzK0xqUUV4M0k2a3lUamx5dTBCa0p6VlNiWGhYb3VjVGlBaS9kTDZIRitz?=
 =?utf-8?B?UXVHa2NtKzI3eWhjRU1SNmhoMWlWUkcwOHVGVGdIaEw2eEh0UHRBZGJYUU5i?=
 =?utf-8?B?c2tvQ1hpQWVOalRtcG52OGxaMElsZWUrblVVV0QrU20rRlJuTHl0ZEJsUEdY?=
 =?utf-8?B?TEEyQjZMU0hzT1lhQVF2QXI1S09oeU5YM2x3NnQ3dnZ6Y1oyZUpyaUJlRW0y?=
 =?utf-8?B?K0NrNDM1V2tFaUNIZFkxNkcwazRJQzg4Q1pJMWNLejM2Y0F4Q2JIOSsyU01u?=
 =?utf-8?B?SDFhNWpvZ0IwSkI3ckprbHZUZHNFTHQ3WTdRdzByajlQZTdhU3g0NktpRmJ0?=
 =?utf-8?B?MllOWEtVWDg4QWhMY0ZNVGk0S0xHUzVoOWhpTTRDUXZYSkhLTFFhTytraGNT?=
 =?utf-8?B?TFB6OVRqaHhLZDN5eHlIMVRWb0ZhY2ZyNitFdllqcTFUa1FjT3Z4VHdXUHlx?=
 =?utf-8?B?TzhqTmpTUWdqczdLV1M2Q1duZmNaUENpcElxa2ZSMkpZNC95SzVBT21nY2NE?=
 =?utf-8?B?d2s3WGdKb3NaSG1lL3pXL0hPY2ZMT2VEODJocGx6a0lMODA0MGNsMUpIbFNy?=
 =?utf-8?B?RWlZMC9EUmwxV2txRVJMRmdxQTJPRjN4aU9XSVM2VVU5a25MVm1sYk52K2p6?=
 =?utf-8?B?aWlhYVNJZWJZWmlEY29hN0Q1WVNkUmZDYmc1eVZBQUI5djZTcmVpZmZic3E2?=
 =?utf-8?B?NTZlSlhoQldQMTBkZFNNRlVaUnpYYXBsdXpSM0xYY09PZnV3TzhyQkxjZTBM?=
 =?utf-8?B?cnpvdmNXMzRNQjdyVGxOTGZrYkorNjVWaFhrZnIzMFc1U2dUK1RMRUlQbWRa?=
 =?utf-8?B?QW1vT01PQVV0bmRCdHpOdE5zSWgwQWZQc3h3SHViS1F2Y1RoRU9zZjJBa1Z0?=
 =?utf-8?Q?SHBrKW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZRZjQ3bGNQN3BFSFREZHZGREhjSEI2VUY3blVCL1EydU5DaWN1U2JqRG03?=
 =?utf-8?B?SDdTbjhyOTVlRDNMbWFJTEo1NGQ4bllsclVWbFd2MHk4UG1SY3laWGo0a1dE?=
 =?utf-8?B?bWNQZUR3SFNjZTNXbWRKVmw3ekdRNW5CRHZGaGdZTGV1c29rNjRzdWMwb2NF?=
 =?utf-8?B?S2R1WWxuNXM1Y0dUK09xWEVkeFdUSXNYT0RjQ2VUUHZyb010cTVIR2tzRDJY?=
 =?utf-8?B?Mm1WaHVVR0RyNnF2UkJZWTBCM1RHeVI3eWJSYmpvWWVBZFo1QmhZeWFack8x?=
 =?utf-8?B?eUpkbWZJL3ZUcUVINjBjMVplRWJtenZhY0lwckMwanNnbXcyTEI2TEMwcmNX?=
 =?utf-8?B?VlYzbll4NGdkL3E0RDgwK1cvRDRVOHNRQS9sWG40QWZHWC9EcFVmelR1YWh5?=
 =?utf-8?B?ay9Gc2I5eURwUjZNVjczbTZpcGJuNVc1KzJQWS91REhPd3F5bGkvMUR6cXhD?=
 =?utf-8?B?N09obHFDYUQzaEdyeUo0T1c1aFBpVEhNRVNRbFJlNE1nVDRzR1dOZkNNUDlU?=
 =?utf-8?B?dkx4OHZEcUdNVmVvMC9ENjhNaGQvUW9RK1JIREhUdU9jSkVzUTRnYjBNUDFK?=
 =?utf-8?B?KzluL3dzZ2NmR3B4VWY4VHh1MHo1QlA3RXdXaW5Qc1JJdk5DSW9HbUFkQzdJ?=
 =?utf-8?B?SlYwYlZUVC9rbVJZQWlaOUh6RFIya044SVR6NjhjcDNJODNsOEJLUDhQbnJQ?=
 =?utf-8?B?aEdpMWJNSjFvL1I2S3BhM25YdXRLT2VGQmpwK05taTZJZ2FGRGRGTkJhckt3?=
 =?utf-8?B?aHVweVJReWNGUHFmUjNjM3BFeCtBaFczWDRQZm1BV1ZEUmhXVGhncGdxSzd0?=
 =?utf-8?B?Rmpub3NXbThtKzFCTU1mNGNzNUxtVExKaDkvdlFFR0dJSUlrZXRkdnhmU2tF?=
 =?utf-8?B?ZXZicmNaSDRYUmJ1cWVQMHVFVVcxSFlNd2dSUElJV1BUVUtKdXRBWlhqcVoy?=
 =?utf-8?B?Qlc2dHFoL2RSZjl0WWNpSURITVBxNEZzdFpGczI2OFYvWUhuQi9XcHZDdUt2?=
 =?utf-8?B?RWFPMXhwRG8vV3QxelVaMkJNdStaekg5TWxObW9na1dzWG41ZUhrR21TUUI3?=
 =?utf-8?B?ek1yamhGeVoyTUVLU1ZCdGl5TlVRZEdFM1RxZHVoOHY2WHR4QWJEU3gwcGx2?=
 =?utf-8?B?aEFtTk52Yjl3VGZWSjVnU1Q1blAvN0Z6YWhuYlUyaDhXNnVDR0IwVVhiWVQ3?=
 =?utf-8?B?ZmdVU3lRNVc2eU5xTlhybCtMNmRMR2dYMS9lMVEwUFRwWk5nQlVsZlZYa3Fv?=
 =?utf-8?B?dUdwZXJxN1NFblBtS0JRRmt2MHBuVVIzdGpkTzMvZ0FTcDE5eXZKZG1Zamwr?=
 =?utf-8?B?QWplMEdwdVNNMVJZdHlYTFREWkRidW1rOEg4WWhtQ0dFL3VMY2o1SlcyWWR3?=
 =?utf-8?B?TVdEYUNiL2xUdThSdTd0V0tCUHhEY1N0bllBckNmZ1kyKzdrY3ZKNGNBUmVT?=
 =?utf-8?B?ZU9ScngxNXBpMVc2ZlBEZHRsOFVKWFh6NVdyaEV2b1ZuNmV5SkNwYjduUk9E?=
 =?utf-8?B?RlNxVnBEV1NSUlFjVHJMNHYrb3BWT0hxdWlWUmtKeHRzdXFsdHV4VTlEODdJ?=
 =?utf-8?B?VklGMms5MVFUdmZKMTIreitqaytXR3J5QVV5VTlvb0pQSHdwb0I1SGVMaTRi?=
 =?utf-8?B?TlNwLzBJTzZXaTRCa21nZjAreG5relBKdGdZUVlTaEdPOW9VZGJVaG84SDd5?=
 =?utf-8?B?WXpRMUg4Qm8xOFJMa3BpVEVyVng1RUR2dDVybVhPcHJKZzJUQ045Y2l5WUtR?=
 =?utf-8?B?ai9nbjlXQ2NudDc3VTQycEc1VTFMZTZRYVZseEo0ZVNyWWs1dDdENEFDK3Iv?=
 =?utf-8?B?S0YzUXArWTE1dGRpU3NsTnROM1MrYlV2cDd1QzU4YlcrZjVRZTdMVGFpU05y?=
 =?utf-8?B?RHpBcEs3WmtaREx6UEtRWUVYTVI2ZCsycmZLNTJZVGgwakVNK0VBcVhDUHNq?=
 =?utf-8?B?MFJKNGtLVWNPYzQ0T2gxK2J2aURVczNFZy9kNkl6aFFYMXFWNFBXMTk5c2tk?=
 =?utf-8?B?SzhvU0VMSmFrQVRhWS9IejFKLzVYQkJjNDVXcXNkenVUZGlBbnVYQ2dnMmFl?=
 =?utf-8?B?WWJhQU9td0xRKzlqa3h1dENvclBYN2FaMVU3ZVVjMStQZTVraG1MSFVIcEZC?=
 =?utf-8?B?NjdwTnYvSXNONDdyUS9MRnF0QmlzTTNoN1JuT3RDUVM3LzdRSVE0bnBDK2FO?=
 =?utf-8?B?bzUzTHRTRjB2anlLVFJHOWI0emxvYzJGSFNRaGkyd0ZMTVI0TXVZdEQ3V0VR?=
 =?utf-8?B?Tm9vR3NaOE91U1BsdzBQbTJ3Si9VQzUyVVZqYmxENUN0d3RnNzJEVmpFajMr?=
 =?utf-8?B?eHkxRDBkTm5ZUk5qb0d1ZmluZGZBV3JKQzAxN2lpU25vUHFNaVJsQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87df1a4c-d570-43d1-3bdb-08de4c506e83
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:06.9684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6omS1PSd+hs88A5Qo+y8Vte3mhWqjRr1SonD6cl2Kfk3W1YKefzEANfxtrveA3J1EY+kOi7gXdjiI96W41GLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878

From: Peng Fan <peng.fan@nxp.com>

Add idle-states node and refer it in A55 nodes to enable cpuidle.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 33bde271d394d19407562f2a427a8a84b85bd679..f1a50896bd4e3e178567ad1f0bfe4679746b9479 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -50,12 +50,27 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		idle-states {
+			entry-method = "psci";
+
+			cpu_pd_wait: cpu-pd-wait {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010033>;
+				local-timer-stop;
+				entry-latency-us = <1000>;
+				exit-latency-us = <700>;
+				min-residency-us = <2700>;
+				wakeup-latency-us = <1500>;
+			};
+		};
+
 		A55_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;
@@ -73,6 +88,7 @@ A55_1: cpu@100 {
 			reg = <0x100>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;
@@ -90,6 +106,7 @@ A55_2: cpu@200 {
 			reg = <0x200>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;
@@ -107,6 +124,7 @@ A55_3: cpu@300 {
 			reg = <0x300>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;

-- 
2.37.1

