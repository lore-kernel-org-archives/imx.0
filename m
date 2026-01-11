Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0633C50F
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135261; cv=fail; b=M5rfv+ocVSZE8U2zZ/ftMEyNjwLRLZd1u+8nH2An2Tb0E8HEpAc8RYNwEnzk8SZgF3xwVdv9Mi+2ARTdYYhTSmZHpY40hoqLsiUs+3hir9UHpibuc/y3/HYMrcoZLW7tNDSpfx6VxxUnlagA0jKP7VwDsJ03G2QhcdBOkACM8to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135261; c=relaxed/simple;
	bh=7u80YQONbMaYCICDKif5M5d6lMkLqnhfmZqpzZ+CkN0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tfcEfXM2/Jv2pMriBsmcTso/AiyaeUnA1wo4jXTNUS33ETosDd90Q44rkm5UeWw2CowUtw1CuieH1uRVQMmQIHt4oq9mfBvhgNBkmEdA0ZaGher+DDUpIXhoOoDfLtOOoTMgyxAwANHiKtz5K962VSo0QpdmcrlMHeKTz8V4ke4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DBIrFiBb; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DBIrFiBb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyyV/m5dVwNjGO2JarkyErQmtdsLms6ysTV8UpRLWEyaMEk4HNF0EC1ret+9Tg/C23agh6C1/mxgZ88h3SJS1h20CMXri8gHq2MHgKS+BDV/gYGaZPS3YpJd5ErsBcrjMzWw9ji5jcMnOk8eCBDygKv59HiJ+DbSl6QYfwOnRxOv3RieIkbpzTU6BHD1iwf6oO3SaufDdqpBp19UWkEgiXItTb3MWQT5O8gnq1Ga4cWaoofTPqPnaEF2Rvi/JMftO2WgrbH24PGzMdVafg/gM+NrlExq89p7iOv3OopMfw1OJZh3BY6aM19YbLwLJNLKsjeC0kRDbrfbqNSB7Wad6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTMrSR41L981Hgsx8TBhZ3uWAm3oGwryAp8mythDMU4=;
 b=mmFsvYwFy8HBJ1aTttEkOBA9s9EoQinV625letqAosBdRttVQvxXFPdPtpjGdI8kz0EFTT8G10H7YhZ1h4dg/5vl5XbrbXzw7TrKZKV5AfmpDN6qqnOoiBC4Mx49V9vTqDGt9CnzFWvOWgJKFckrR+ViHbU6gl8jlCobAsqm0WfdRC5cNxKtu3QKG+ORLsguImIXP/QCMHGtkG4Ussc9+s3+msNKt/fMP0+fXEfp8vnlT3KziORNQ1jftg7/VVGjDS598/fwpzwGeGSUbpW+3ps+IgWcSWqNj1j1HbmRp5OvHPzLlRtC9WZwAZh/wRX84YdUmH8PZ5bpb4abZdagvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTMrSR41L981Hgsx8TBhZ3uWAm3oGwryAp8mythDMU4=;
 b=DBIrFiBbmWwPAPj7fK9iMFPIExw8s4od4SfJNmD5c86qwf3eqb+CJBjPfjr2LIxCokGSZMugnvJioEDGMDxZQr6XXtJfUEAEICoAfRd3N0KVpXZd+Pk4EmB5N146CV+x87osgCoXYqcQgCLFfJ9KVjuFoOowrpkYHyOC4i2mA2mICXhhKlrlNCrhhCrCC/Dh6kFSEVds/sQoiUJIdnj0aaq44eX0B/8Uw0GY8Evz9yaLs4y2/BjGgytiGDo7rfKh5FhudsLN+SLJYs5SlnrO5Fo0pZOm7KPErqtQf8SG+s8FE8IMpUn60yFEQmnLvndIDLMAfBqAlnC/4CcyUcVm6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:40:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:40:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:08 +0800
Subject: [PATCH v2 02/10] arm64: dts: imx952-evk: Change the usdhc1_200mhz
 drive strength to DSE4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-2-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d7a9e7-bdeb-482b-c708-08de510ea606
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEhRVVU0V01xeFpuWk9pR0k1U0gvTVA0cC9iZkN1ZjJTcVNqTW5BOFlTenRz?=
 =?utf-8?B?U2RBbkRTSmFMcWx2U3JBcFN6SmkyekNIcm80TElTWnRHY2M1ZXpDc2lsZTNT?=
 =?utf-8?B?VStUbVIzUkpQU0JRcC9nekpyUzRkOWxDOUFXK0hiS3dQUklHRVJOM0hpTUph?=
 =?utf-8?B?NUdmV1JVUVAvN2pVQ1JnSVBpNW01YmpQa2FwelBici92ZE54ZURKNzBkeExU?=
 =?utf-8?B?VEtPUTV2aWtSaDdVNG1RdEphYyt6WWhlVmloOGVWa3FwVWVKbnpjVTkzQVlN?=
 =?utf-8?B?cDJaaXJ2bDRyNTI0ZUlSZ0ROa3dMVm9Ua1NBbk12R1dMc3BtbmVleDhLdzZn?=
 =?utf-8?B?M1NpdlhiZjc1ODdESFVsdzFvc1BRdCsyaTFjQitpdVlvNU9pTC9IdGg1MTRX?=
 =?utf-8?B?STV4L01vcEdrUE94OWx5TmpsbEpxZXA0eUlvVHNZZHBsMDE3bkV0THVDWTRX?=
 =?utf-8?B?N1l3cTRacFFOYWQ3S3BkbFlDTzRYK0N4SUhQaklsL0FsbkZoMUNTU2k3dE1I?=
 =?utf-8?B?dHQyVUZXbzY3ZXB2aXFnWUhXeFJ5SWZRNlVDT3MxTC9RSDRVYzRUODkwWWVM?=
 =?utf-8?B?N0hIZG5mU1QwMVZIRTYyM3orcEJiNlYraEU2NE9FcytxYWpPaFQ1WWhjWWxj?=
 =?utf-8?B?KzZNU1JtVHRpbk05bWNicUdsNk0vQXhCN0UzbG9BUmlUSVpxRVdENTZOc2lJ?=
 =?utf-8?B?cmRFT01ud0VhV1RoZHZhbnhSd0ttS2l2MFhXekJvUUdybEVQclYwaU5MS1hX?=
 =?utf-8?B?dTlYcjZxNGkxdy8raHM3TVZQMDNMOUNCL2E0SmNIeXRudlIvYW0zMlRVUzJi?=
 =?utf-8?B?M2N3dUFGODNSWWxoejNIcUFOUEJHOXR6YURqQlNIa3QxSUl2b0tVWHVJTmU4?=
 =?utf-8?B?VHBxOVo5WTl1MUd3NFVpVHVsK0pYU0ViS2RETnZORnZURzc5WnJoMXpnMTZw?=
 =?utf-8?B?UkZGbVgwUEtwMm9iZmRPeHF3cytCOGpydVZkYytvdTlHR3dKcGRMbkN2ajNy?=
 =?utf-8?B?TGVudWxqRGdLS3JTeWtEdWpiTFVaaEk4c0JrSnNqbHpnSzZQODRaS1ZYSkdC?=
 =?utf-8?B?and1N29ZV1I4WVdMQitBMzF4cGd3VGZ3WTIvcjdYaGRGVGN0YjBoSU4vdVlv?=
 =?utf-8?B?U1ROcE0xNkRDeWIxUmFIK3J3Z3Z2MlJDZFZlTlR5VU1qbTFSY2tpMHdXOXRa?=
 =?utf-8?B?OFdkb2tTTVE3TzM3cG1pcXlZaEdySUVXd1Rmb1FlUDVxZFZtWXFWOG9GRUEy?=
 =?utf-8?B?U3cySGtrS1FWREM5bFFEYWNmTDlYb3kwQ2l1SVpnN3VGWHgvY3FRTXREK011?=
 =?utf-8?B?YXB0emhPN095MmdjN2Y4NFFNNU9MTU9DaHpSOTN3TmZ2dnBFYUQwSk1oeFd4?=
 =?utf-8?B?ZXN4d3BuMTI0VVAvVUVBY0tnMUcxRnplTzBQWnNRSDJQbnpNanV3VzhoN0VQ?=
 =?utf-8?B?bFpJWkkrSlQrTVorNkFxc0hWWkdabDhBa1JvNDN4MGVsQTR5UUJxYjRQSjIr?=
 =?utf-8?B?ak91SSt2Y3hQWDFaMXJPYmdPYkExMTZwTGZFYlBzaC9FdXVLdmJKN3JSbzRr?=
 =?utf-8?B?WE91TFhFMC9zWGNyZHV5MkxlQ3VzZzIxcEpLVDMxMnVCbWp0QXlHdW1lRGcv?=
 =?utf-8?B?ZHFQNERhRThacHQ1ZkRrZGgwZTZaV1RmOG5leWx5N3ZGSU5hWWZkemk5aSt1?=
 =?utf-8?B?K0NZZ1ArbUZJaFNUNlcyd3pRZGp1TElPRHZoZXh4bHJzb3JRRkgrU204M1J2?=
 =?utf-8?B?WVEvaE5ySFhibHptRnNJbjNRTUFEcEFNalBRRGovRlpxRFY3UjgxWDcwMCsy?=
 =?utf-8?B?V3JBSkRqVE42VnJBaFFyOXpWVlI2dWhkN20yeUZRNHFpSUxpZG02bkMvdU8w?=
 =?utf-8?B?QlhMMUdNaWpTZ0djbVJBS1RxT1c0SnN1Q2VVeXlsOUpZOElTOEFxVElrd044?=
 =?utf-8?B?L1FaQWVXZk5zVENXdWRIbStYaWVkaFZvcmJYTmcwWWtBcjZPOERqRmJNUjlB?=
 =?utf-8?B?aHp1K0lpNUFLTWd1WGFIUzgyc09aUlhPR0dRVVFqcHpGUC9NTFVEQWE3V2dJ?=
 =?utf-8?Q?7OL701?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjFOd1FqMFZqamVlckFMeWZxZWJHeWFQV1NIYVJDcUJVMDFvQVNjdmx5RUNE?=
 =?utf-8?B?aFMyRUVNdnowNVdLTTJ1SStuZjVISVlDT3B4RW1LblV3RXZmcHVzM2JLN2Y1?=
 =?utf-8?B?emZ5bUx2TmJQaWFQbmVEZ0psWllMWEVnWmFWL3pUam5vQzA1OVlieXd0eVJH?=
 =?utf-8?B?cGp5eDJ1MlVGVXg3UUY5MVE0cDdDODJ1bnRoaEhwcDFDL3dyVklYZmwzUmxx?=
 =?utf-8?B?YUpGWDNWYzUvdzAvTnZQR1BiT0FiZ1oxdVR4bGYzOE40RWMwSldxTTQveER4?=
 =?utf-8?B?V01DV3lmVHp1QllDendrVzlpK2JudmVBYlB2YjlHVDd1anVEM1VvU3BqS2Rj?=
 =?utf-8?B?dWVQQjcxdThZREFCcytyL1lYdzQzd1Q0bUdTaEY4eFhnS0VtTVhQK3d4R3hm?=
 =?utf-8?B?QWhJeW9EdGc2YjFFYm1wdDhscGVQTCt4RW9mcExsMFBYRkpYWkJIKzdlQW91?=
 =?utf-8?B?elN5TnhjZFJwd21TcHNsVEhwaGRHd1liOG1DS1JidkxZeldpekV5UzNISWYw?=
 =?utf-8?B?NTI1eVVXaStTcHgxY096d3l0Ky8wUWlFaFlZZEhaN1lUMG85eWwvY0pkRzAy?=
 =?utf-8?B?eld0cmtJWm14NmJ1dk12Y0ErQ0tEaWp3M3FBa3VWUVBqUVV0WUVRcStmc0k3?=
 =?utf-8?B?cnl6M0xXQ3lPU1dlYXRUYktpTk5yelkrVFh1UE9yb2RHdXdOUDRHVGdtZFBM?=
 =?utf-8?B?SXc5YTBJMTUrUzMyMGh4TVN5OGVPU2Y1TGUrSklVRkdjTURVM2d5Rlp5V0Rm?=
 =?utf-8?B?endHSDMxWENKbmRhN3dreVFjdlNVRW1iWmJodkwvTURMU2ZvT1BSWWxqVnFt?=
 =?utf-8?B?REw1cUpETUpPUzV6WUxva0pBbWlFczhDWUVBSUNOOElLZEs2K1Vra1FlVzFp?=
 =?utf-8?B?VEpOVStuN0ZMWWFNbkZZQ2luQTgzcWpDRDdSMFY2VjRZZTNpQmFYMXJTVXBF?=
 =?utf-8?B?SWRFU2xGcUtYdkprS3hydHR4clUwbG5LZFp2YXVPRUVKTFZmYUJDQUM0UVRj?=
 =?utf-8?B?dkdWZjVIbHpjZmtMSGEvc3FEdnJNazJwWGpkTVJLakRkdEpreVZWZkxLOFI1?=
 =?utf-8?B?Y0hlOTR4Qitka1dFS1VPSzR4eVRXbCtqNTZ0TldwOEErZkFFSnJSNkFhTyti?=
 =?utf-8?B?Vlhha2xEMmpmTVZJS0dkbStsNVUzMFVkcHppbVBPTkIxWlh0b3RQbVVSdmYz?=
 =?utf-8?B?TXhxS2xWS1FldmlTZlJ6VFByQVhGbVczaFRrWGNQZ240VEVQRW10SUc0WHZv?=
 =?utf-8?B?d2ZJQUtMaThJeXdva1RUdGVESTRMeSthRUQwaURpVTY2bnNkMlZOaWRsOVRp?=
 =?utf-8?B?Y09ydGlBdDlpK1ZtSWpOcG5Wd0NLdkpNSDY1OVpsRnlaN1lSWjJUemc4MElZ?=
 =?utf-8?B?NGNRS1BtSVdWSW9wRE5kZ2N4eW95UG96V1FNTks3cW5mMGJZbllnb0RST0xm?=
 =?utf-8?B?c1pTeUdGWDlDVk9hNXJMUUtjc2J1MDdIQjk3dUlSOXpDc3gxVEpzbmVLRG5h?=
 =?utf-8?B?eTAxenFCZDZpeHlqV05XWWZSdjN0Q21YUmpQSEVDdVBVQVFVbmxRTUlwYkht?=
 =?utf-8?B?eEY1TWZqUzY3cXUwWEQ1RGttZ3R0ZjBFR2NMa0gycytqc0tSQXZnQlpkM08x?=
 =?utf-8?B?UVpPbEZodU4xcVZldDJ2RW95eGl6Vm1rb2J0bFhQSWltYkw4UnVOejJ0a1Vr?=
 =?utf-8?B?blM3a3FJVzdnb0IyMXkwSm5yQmZ3aW12bldYNE5HSHc5aTBvRTBCQ1c4ZDZG?=
 =?utf-8?B?dmd5MjRDYVZhWjhRK1l0VTBVZFEvYXk0cTJqa3Z1cUQ0SW16VXI5TmNjSHdZ?=
 =?utf-8?B?Mmlwek1xb3htcVU0RXJmMVZsMm9BS3c0YzRNNjdETm5laVFFeXJaUDl4RGJQ?=
 =?utf-8?B?RVFGTFlVcVIxSjNKSTFJbmpUc0VxSXB1T2xuRG10Q21mcjRhQ2t1Y0hDSFps?=
 =?utf-8?B?MzRXbytmMlhGbk5Ec01wWXoxN1FHWkpsSWN3dk55TjdQclEyUEhMOFVtUTdv?=
 =?utf-8?B?dkFhTEp6elI1aWZNWUZZcm9LMitNU0JTeXBFNG1JT2FJZTlmUHNwRWhuZ3No?=
 =?utf-8?B?ckFUTE5BWHU0K2hDdmdxdWE3cXdENkpobDVtVWxiYjBGYlBpQ0RaMmFidHNq?=
 =?utf-8?B?UzdDOVZhb0FlZWFZeTVDc1g4VEx4NXJ6SGRiZ0VVeE1ETE1aOVk1M0YwNk5L?=
 =?utf-8?B?V1I0Q1FLUlhySkFFcUNFV0YyQzVEbzVSVUxjc0ZGbFNwS2tPMmRCdlRDTHJ3?=
 =?utf-8?B?SVVGN0xjNzA2WWZiN3RiT2h2SDd4SE9UY0tuT1I4YWwyQTZtMDBBTDBpWjcw?=
 =?utf-8?B?cTlrdU1yQzF0cWFON094SUU4cUhPVGlhdDQwaUpOOGcxcmxLYjJWdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d7a9e7-bdeb-482b-c708-08de510ea606
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:40:49.1096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZooLgZW+inmzw0jJXopqSLBJUPPcKHdqXsP4gZ+9U9COfBlrB/y5LahMKmwAm7EmUAhpOvnFbmPeKdxgGUyRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Haibo Chen <haibo.chen@nxp.com>

Set usdhc1_200mhz drive strength need to use DSE4, according to validation
team's suggestion,

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 2c753fcbae3c5d545f5d835bd70492667061d626..e5d989bd7c7b7f8b7c0b0afd0ae8f108110e4a49 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -159,17 +159,17 @@ IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x158e
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x15fe
-			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x13fe
-			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x13fe
-			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x13fe
-			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x13fe
-			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x13fe
-			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x13fe
-			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x13fe
-			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x13fe
-			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x13fe
-			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x15fe
+			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x159e
+			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x139e
+			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x139e
+			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x139e
+			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x139e
+			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x139e
+			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x139e
+			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x139e
+			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x139e
+			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x139e
+			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x159e
 		>;
 	};
 

-- 
2.37.1

