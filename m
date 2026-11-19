Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795120917;
	b=ObR/opYxXE+CoxPY9ZfcKKyVxS9tHqkFlwRrODLVEN287b/T4nDVUSADAOQpNItHpCnc
	 qEMbg0+nI061X3HL06oj6y22ySnDnoBoX9UKlwODiH5TTRTSYpIAQcruHQhY2byKHxKb2
	 zgp32vlv23feOMm7Eay9TWSvVe4VxNSNRriLs3hwprwoTQ1lZ2aw93FGnXQVPjVqRvQMS
	 /utTR5Tn1G5qGNRSwvuwkLQU6jbNKYGSVDAqnlkkOh+MsEeAUdB3gQaALbJal8Dox6XIV
	 dCIaN7ifUDBUARubMQj1xA9rZ0p04gQfBBQmLdwAVJlOBg+DTSrJvA8Y1ShU47GofWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120917;
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
	bh=IHKj1NH2KrcvksreDL0wVDmiCBC+yCIlOPb+zhfda2k=;
	b=C2ZiV6PJe9ZS1gF43z/CE+QghmibOVgc3ymRhMmdDsm9iAeLE3POiV/SkWGHjPk/QbJ6
	 KuIvQUVl48tH1iQhC1Nl9WZNPTFFNbJc7xAIVCZDzPRqOGdtERKkoN/nBkwwIUehfd3sg
	 fIlUrIU/P5/drcJw9oDQqrXR1K7frKcbAXYUhY3MNxmqopK0Wu1b1uLhJpIMh9ovzpVEc
	 c+/Vq3I/6wzJRLOyoSHje66cDf9V5xrh7dL0eMlVi4KnYemzhrrknlAU2AcSqV2ixUihz
	 BqpEBEgfMq500I8J6bVYnoCWML34D/TWE/6vifS5Av1SnFKqi3rOYbb+FfdVJdad6Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mTX4LBWu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.41
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661E0606B74D
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 20:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661E0606B74D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mTX4LBWu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMXr2bTKf6tOwZVhsmYv+bRD82xHjbq3vMQ0Zk+8kKJesbciu/K+KLSJ0Z0Xyb4vf9Ng9fjQjpXV2XK9341gEyuSa2IRSPJCei9XfHIKPH8c1LfCJzMl19vJzlRUAVh7YgRWBpT0hPODUWilvz42zMa/e1j2wa+YvuYcqWXNpmbGAIdBVrSoGPAy7Tz817nw827TwaEH5c6Bx1Hs6Jyhj9Sy7DM/IopZqYgi5c8VEbXDtK8Bn2aFZwo5Yv6TU1mBfIBJD9dE2k9LtN+gSSXmnw0xcrpskqY4iHM5hxfhn4R9DfgA2Bb8FIyycPnEpNpsEf2lxfjsvKg9FHEQKmQA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHKj1NH2KrcvksreDL0wVDmiCBC+yCIlOPb+zhfda2k=;
 b=hTkvluB19boreZ+CHEAyn1pzFs7U2KdNnO9TkpGQa3zN0b7Kjj7pZ7WmipPoq+9LCp64ADAyXXhk4hKsUx2BWsILhPOw+gpfjXII0g2veWGq3fdq4K+fWI3XnAfnM3Lri6I4FLpct54oGi+hlIPvMO4kpFMPWgzEMoRdtBUX9FXkeWPa6fMve/ouAbrBP6nihdv9otlKWVdKCFkCGxCn+ZjAlBhuXoNafbG5ES2GTGUCTg54+SVzvC0ucOFAJqXCOtDUsPc8NtArqrbEtnsHwZxB6AnrFH8E7Dkn+SwQDXsF7AWUFbiP+OETlpM782+tWPolF1njqP1rVdofbku+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHKj1NH2KrcvksreDL0wVDmiCBC+yCIlOPb+zhfda2k=;
 b=mTX4LBWuguKj3C3lKCfgUVG6PRB4wz7WqBTXWSKWNv1fawqgd3+p86pwUMxfMY0t306rMcPoSlnVv7hwvrEyWfap/DmcBQC9VkgTQYZAf6RtZ2HACqmmiwsLafrNdCFC8Jar6zoyt+1e/9D7TCKO+Rn7eFU3oNDXao8qs06BjVVhMUyTO3E7+bPcFedg2Tzam920UleUWjEaqmJM16kX2mwWgi2PvjgDF1Efdmnes0FKD8VpQzJ3EQFrgLEGG/p7o20AzK5pThTgmcbDwhtL4QHMY8rXsUpwJss+Y7hzbf+Lpm6VB+d+BvoZbcQZL246rS4yONqAJhn7H77tawZCgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 20:41:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 20:41:51 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	wei.fang@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	wei.fang@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx94: add NETC switch node
Date: Thu, 19 Nov 2026 15:41:45 -0500
Message-ID: <179512090110.1802238.769378710113302535.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110031918.89948-1-wei.fang@oss.nxp.com>
References: <20261110031918.89948-1-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:510:324::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 178451c8-7bc9-4f9a-2e7e-08df467d8a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|22082099003|18002099003|261009223027099003|11063799006|56012099006|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	y+SmNz/M30MbB9rTJ8BNCJBxZRwwAOjTBK6YPfSS+TFD+xFcrF+CUgllUH1xe9dmX8HYgLh1REfk0ds75uCet1E/ZsTiz0lXgLXSd+wputgqdlohv4qsu/99t5rfMgfVeH+Uw42o2IYDphFapz9tSwcfYHWvuF1ON412IGew6Ib5RAZF+rIHfGJaLsAVfwx75V2GxyVPs0goNcMul8pXBlBpDbZZFBzJerGAz08DASQYNbT28ahDUJ9nglQNUdZT6E7Tk4aEkl5ZpeNhvAmv9QivTr70h7iJJWeTJ9fUp5mzhG8Gs/4tibtLoON1u+0cwajWg6yoAbwzWKA7xYbOvaRf7pFobGtWRHrM6PRzqfvBrk22HJV2VtF2u63Mk0X0WqEC0TG5amIfGsFJQ0tsiq5FxDCJ+C115/pLWl7AJJ2OAiai9tHYxWEFm4ycawTHAqoS1b9JxpBowOZ+UJrYG1PwJ6TNWXVs5gM3d90rMWMbDFsWgEwGC0XMg8m7ocZbPpXuZ03y8bokgnzCr+rKKfynSw5regGHf6bDy0vXmQwJsnOvOIWmxEyAIw2y16eMc4qikuPB0ivdcCu7dtdrmCqsqSaLkU2TvvMZP64zcozdQMns3z+5WrYrS/bBYg8ustE+I004hCntGvFk5pWLd07v1VAOrcO++6OYyzlG19w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXFkTG5YYjVWYUZEM3Bvb2RPVStJUmxOMTIrMEVOUDF1R3FOOXRHSEdwbElH?=
 =?utf-8?B?a1dXSCt0SjB5UU9rZVdJRkJEbHBGem1IR0J1TndLSzlkWWNtSmNEcmtZUE1z?=
 =?utf-8?B?WUs0cTAxbFRtN2ZkMG56QytDRzk5YmRublhhYzNLTEM0MzVuYjVyNXhUOERp?=
 =?utf-8?B?SXYrNnZXN3dqTlhSUTNlcWROVTZlZlRuMDdaRmlXKzdkYlYzS2J5enNjUUMv?=
 =?utf-8?B?L3B6d1BJL21laE9PbGZSTkI4QUs1VXhXQjYxZnVPNUsya2xNbEJMYmg5aHhT?=
 =?utf-8?B?UWlmdlpUNUxpaXJJUitJZDlRRlliVFZ6NTg5OEwvSFEvNEx2WWlhQW9nSzZB?=
 =?utf-8?B?bW9Jb2RhQWZqdGt6OGZKK0k4S1A1VFMvT0NzT3ZIUGVnWTJpZXhTMkFIK21H?=
 =?utf-8?B?dmdiTEFUeDAzSm83T2NpVWZFSkxZclZ1RFZyYVBtTGk4YTFwcXZ4TFhVYUhk?=
 =?utf-8?B?TDNrS09Va2pVUGZZWDlmdGlvRnNXc3hKN2Z6anNwdkg2ZUF1R3pKTE42MHo1?=
 =?utf-8?B?aXI4M2l3Nm10VkIxUVkxMG9pSmJDTnVjeXpDa3hkVm5NdCtrWmpURnVvSHUv?=
 =?utf-8?B?ZDlGcmZXVWJFZmxuSVRJN0FMaHh0b1NiM05sQ1NYT1F6VnlxSjRnNUxyb1dx?=
 =?utf-8?B?RXZBWUtNMjNjeUVLQnlPUFFONG1tNU5ZdmJrM3JwaHVhbjZQZE5hWTloZDYv?=
 =?utf-8?B?TlFQZzdhMnZiRXI3dGpnYjh5TFJucUh3S3V3WlVXYmRaWFJzSElCY1duQlov?=
 =?utf-8?B?TWEyeDBNT0lGS0pEN05RUlJhVTJqM3FoZ3dibVhZMm5xYjJGUnFYQ2hYZkhv?=
 =?utf-8?B?REFLbzhQR2VRKzBRczU1SzdHNWtHMzlOamJLWWRQZ3NFUzQ0ak9VcGJtelp5?=
 =?utf-8?B?eTNBT0s3MllwU1M2UCtVdThjcHM2ZXVMdWs4OWtSNm10MHpkeXJzTEYwRmxZ?=
 =?utf-8?B?dGhWMXBUdTFWZnhJMmF3dkVmMW5nRFpNMHJHbGtwdms4N0R5RnJrWTNtdGhX?=
 =?utf-8?B?OExFdU1hTjd1aHhqaGRpZWZnQWorN0thTnQ2NkRFMHNqcTMxaGFBV05xZ3pr?=
 =?utf-8?B?SG9hblM1OUNDSU5lQ09UVFdDNVBUbWQxTmtrNi9jSEN4ZlB3UzZaYjNRcTho?=
 =?utf-8?B?QjFhYkR5MEpDa1IrdWFvUkVXc0VRL2M3L01Nd1UwT0Mrd2ZGdElNcEhoZzNx?=
 =?utf-8?B?cXNQOWoyWFozQnpGdWVsaUFrdE1kSTFBWUxGV0I1UmFpQ2xPSGRKREdOUmkx?=
 =?utf-8?B?Qk04UW8yK2lZTTZURVlOMUVjZyt5K0NwOXZxZGNEb3dYUnA4WDluSUorUzNO?=
 =?utf-8?B?OXNFWWFneXFYcEp4VzR0bTdIZ2FiZnJJbHkrS0thSmtrTDVPQkFLU1VzZXI4?=
 =?utf-8?B?UDc5RVg2bHdYUzVGdWdpMWhFT1ltY3cvY0JBYkwrTnBUbHpKKzJVOGEreW5h?=
 =?utf-8?B?NGNqdHVWL0NOV3NuR0hMUzFRaFZtT2NxKy9kcFR3SVNNa0FSMUIvYjlnYUdX?=
 =?utf-8?B?ZmVCaER6L2hWbjhiejhPNlRrR1VlS3pGRVZBSXBQb0JYMmppOUVDeHdZSEkx?=
 =?utf-8?B?TE42Q1ZhcDhsdy9GenhuS2FzRys5WElwZEFKekxtTHA1Q0RTTkpoM0haOTdU?=
 =?utf-8?B?dklXU0t0MkdoaVVWMUxYYTFuc3ZQQ3NKTnhLeFVKME9pM3p3QmRPV2RUYlk3?=
 =?utf-8?B?ZmY5K1NSRXEzU25DWHZzWDh5TDhaYXFMWVV1NXN1YnN6N01FWHVUV2c0SUhu?=
 =?utf-8?B?aTUyUURFZWpiREVXak5FOGJoVHBHaytrck14VFFHazZnSEo5WHdsK0JNRWxw?=
 =?utf-8?B?dTJqNi82blp3NmxIWFoxZGozOEgyQ0xWeWFPNTJjUHFGWGU0RUlWNmROZlky?=
 =?utf-8?B?cnM4WkNiVHZsTWptN3lhVkcxbGI0RkJsci9QWjdaa2pzRlhrT3RxZHE0QVc3?=
 =?utf-8?B?eHFTNUxrNWRCcmc0bWk2ZTR1ZDg5VGxaUENOTmVad1FzWThxekRlTVFlM1Fo?=
 =?utf-8?B?VUNneExKRmROQzlMUTR1T1Y2WGEramhZakZpc09qbkJHUmxCY1BRMERwZzdj?=
 =?utf-8?B?ZG1KY2lreTZyYlV3N1d2QXJNNnZsdEtDSVU3bmpHeXB1SmlvRWxCWUpjckpZ?=
 =?utf-8?B?c0F0cUJNbzBLV1RKeEhKSEVOYVNXQWNsT1pmUXV0MFU0eHFjYTA3ZkJTL0Vx?=
 =?utf-8?B?d01OcnVaQ3VRMmpsTEVyb25LNlFyMlpmblloODRlVXN5SDBRUEpXcXhCMU9z?=
 =?utf-8?B?OE1ZVnpHZmVlU2dTODNDdktiUG43YmYwNmhNR3VKa2RJUlo4TWpwd1MvVnJj?=
 =?utf-8?B?QjRkdHU5WWFJTWY5cmxJSmZyK1R6RlRROXd5cDlTVWh2SmtiRXozOHh1blZn?=
 =?utf-8?Q?ZQh4YMCksHvw2LmKSUnR6lfDFubAjS1DHBpsC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178451c8-7bc9-4f9a-2e7e-08df467d8a20
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 20:41:51.3161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnO+IePKEXSFXe4EOzI4xf6Rex1XM7MQE/BXhnLGqGvvW32vq1tChrM1tIMIFLkYjeVYvBEIa48EnPfnjfBQfq+WIhuIeg2sNC3d/TG83P5uJXEPF+onbMU/wsfSXFF2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256

From: Frank Li <Frank.Li@nxp.com>


On Tue, 10 Nov 2026 11:19:17 +0800, wei.fang@oss.nxp.com wrote:
> The NETC switch of i.MX94 has three user ports and one CPU port. The CPU
> port connects to an internal ENETC (enetc3) through the pseudo link. The
> "dsa,member" property is used to specify the switch index, which is
> reflected in the switch tag as an indication of the switch ID where the
> frame originated.
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx94: add NETC switch node
      commit: de50945e3adef9a925146b5eae21d8af6d1003c7
[2/2] arm64: dts: imx943-evk: enable NETC switch
      commit: 621ba627f8ffb90d15a03b5793351ce513f6e78e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
