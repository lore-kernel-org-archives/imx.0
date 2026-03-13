Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB83A873C
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773414111; cv=fail; b=mExBacRjZTslYPAot0Jrujr67uMBcU9qZ0zIaMA4+6VXL8opJkj6jEE8Lg2Zuf8n+lMY7+sySs4zenEWSrl9B0KL5yV+Pk/J/KtvbjzjpDYLmMhbbRXTekD6pKaB6u4w9oUM0dufE4pHAh7UTt7ENeuAQedy8i9SzlyZnqfCbyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773414111; c=relaxed/simple;
	bh=F/q6KGKLRa/djjxjq9tFcqpf2Sas8s92ZSpzCORIsZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=HDIAbc2bcyZ7k404ROmUM1HG6gmPY01eB1LcMj627CcuPS66HNtRFE00/ygUqYhacsIIbS6jU5pqgjf3aPCy8QhHXwmLw8V+3Zg9G/rVW1Q4JYcVFlAB7BVafOlyAvPJHx8tY5uFlIZpSfLPu12MMDzp2v8pLQ51dAye948QXtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vfgy9bCu; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vfgy9bCu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBz0aIq3DgfH35o4GSkzQwToQLKYZe+K4FwbDdOZpOorDjuG6tbp3QKSMec3u6nMF1+zsS142G1m/syslJgY+TyRDvPE90ASqFbbkdTS7BzuGihBPtnXwTI98KSxdjZm2zzEo6EiMtujanxNguk7WgEdHQTgq1GHYUfQvcI4PXnyHkcUiCsWxwaEcyLNs0OOk+zNOqb7WxkOX/jaF3zH9A5HdqXG6y6+IRWFqYbqM5TQjjrJoTDAZ09gwiigjSi0gc/7ldgzKIgV6FV6+C6PNY4OwlI+C4vKLgDqm+B2osgEjfW7pH47gayvQuh7KRmnMi78deVVDO9ES8yZJCnJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEHsx+zgaLQDqI63CnvCJFTft8bBOWJadWtiV7hXXbw=;
 b=fP1rNaV91dCoslroN4EMlDcLF9Ebl6dimyepUpjI4pDA1FyZQAORFJOppspI3NknRaHFmhkseYQTcv7R0TJCEW2I+FUmpyS1ggqHLV6VN4PkpoTaTPFhvLCd3/41yZ1hMZDwkFij/YSqATyyxHHNN/UO1r4Srva3pBJOV0l9Ns5YG/ne8wHSDAQblZM5z07BANKc/b8ADEudeeOg22Vu94bXuleUbSfN+gDGyOztS9G594nqk0EXDTDwUTmU9wmQbln8V0KcA29IL8vvjdNdxZ8970rNfNCpLvvqt/i9Bh34PuCr+IIwQ587rLw6QLyr2kzueO4l1I4ltO6DASiCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEHsx+zgaLQDqI63CnvCJFTft8bBOWJadWtiV7hXXbw=;
 b=Vfgy9bCuL2MRwOXHuz8GNsU5wwK7V/++dmxJH8VXXOts3ozYktoBlo3OAS8doD1YvFxI3tqe2pkQKaU6TNQl3IPyN1+xLsgmbmY6pVf2ijAW/QvTVgz/Kl/fnzXd8COOfLDBWQ1Nz/kmL3Df0eSmKh/Pr+BrptNWZ/L5HOH2/AkFE+Q8bAVvF1jJ/XdkviMMmDlPAlCMCQkNjK1o5AxMfGWwLgI2voNfYnm7DSqdUtVYwHGF5UxJa1wBkbyODokipcRBIwc9FS0+dz/NKlcyBGI/fDXwdCt+N8ToY4xjrTHIuZBBNRvnCWPnmNtEdD9XXZPeBXmZuHFkqLPSLDcmAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8527.eurprd04.prod.outlook.com (2603:10a6:102:20f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 15:01:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 15:01:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20260304144423.1511858-1-alexander.stein@ew.tq-group.com>
References: <20260304144423.1511858-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Add i.MX team to all arm NXP
 platforms
Message-Id: <177341410495.59730.1697374950303161740.b4-ty@nxp.com>
Date: Fri, 13 Mar 2026 11:01:44 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e166b1-1cae-4e45-8f1a-08de8111705c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|52116014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XfdEwaumCQToscPTS6qwNzEXKPb4SZiBS3dwsqIOtXYzI8s5aVh16snI2bbbDbYC/Ws9c7hC0E6lIIhf/JiVI4Hu8xYFG61VdDAGdJWFy8Jy+gUB1FWiSnfNZla7Bj6l9GLU8DcAbdE6e1WLrxbtDOU+NnUepBk5I2W466UTRWalLJP56bAOjF3yy4M0rO+TOCvBfMARcVLjBvcsYodaYskatiVds7bOA+JekC4MHSOsj+Gs9cLp5MajKuDoHGmrG34L3kYreUzxdgEl5uccxPJJtfAMClQ3e7qsQQ+sHs+4CDBCMpVl4yEvl+GQnumKA8p52dsbvsHrcGkYDb153cEJqRTzV13PhG8ehB1fwqAnjNIBAXScdstVDY0VdRTUe2Be4asfkfm0Qqd0xHQLMBpxmV61xMxwt00ZjvjYR5hJfYtlh0cq4c/eeaat65EQ4U+It8u/zkkiDZkBg06pjYkFUbmpXlxAcCuVJHKCy2g1U10vpLH8Zah6S3EPWvv9IW45CE7K8mX/LT7Ec3PvXEbCEFNkocr2RFx5GvTUDKjWFQ7x/uhCMcgDjaPl643LgS46yMLuTSfazRFhKQ4TY+ebLqIxrk02cthskARgkaI9vkP15sEyJI/Fdw0dst1RqAtYOtJEy10GB2KBv94DPM6bVn6sTwxZw3ANuweM0l5LSrDLOTKvBD9ewQ8PtJj7efXRpNcczYsh4rC8GrGRRoyvYXioWRlBJeyLMBEmp0F+AMKH+icuJOmX6d0YMi+v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(52116014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zks3cE9pN2ZFa1FxUnBQV3ZET2NBNGJBbmc3N2dzVlVEdXMwUXMrcnFZOG5x?=
 =?utf-8?B?eVpWUVdqSmlCanRhNmVGNWVIdUpQZ05jYzk5T3lRMmlNQUtscy8vUFBXRXps?=
 =?utf-8?B?L1JEZzQ1cWFCVGRlZXVUQlFRUWdBUFRqOWQ4Q1UzaTY3Q09NYUNXRU1zc3FP?=
 =?utf-8?B?V1NIUVdES1RaR1crakUzMjYvSzFRN2FDaGNTVVNWVHFPOVorTkVscVhjdmda?=
 =?utf-8?B?WGRMQ2xub2t1bHp4eEMyRWlsV3AxeXY5QjZlOThOT2FXVHkzM2JNTDRHdDRy?=
 =?utf-8?B?ZGhsaU5zWnBwNVpSMnR1SjFhUE9JS1E3OFlMSG9mYXY4Y3hvRkl3cmk4MTQw?=
 =?utf-8?B?dDF5dSs2b3RZMklUZjlkMVFDbWY5dFBJd0xGS3RBRmJ1eHp2NCsyaWplTjV1?=
 =?utf-8?B?eklKUEtvRWd4ZDhsQml1bFN2ZWlLSVpSSTE3U0F2UjliaWhaaFhDaU8vMmJ2?=
 =?utf-8?B?U0RGL044VGQxdlBzb2pLNU5sVk9ETUlINEQwUnR6SG5KRTBoc0xDcE1XeTVR?=
 =?utf-8?B?ZGRsWFlrSVAxL2JwQlF4ckVjSkVwSTlvR0NnU3NyR01lODFDSlNEb1dFaW1i?=
 =?utf-8?B?WjF3VWg3OEFITW5LcklLVmRqMW0vcFBsdjNvenFBQmdOZEhjT3hJbGhMQ21F?=
 =?utf-8?B?WVFoRDl0aUZmY214U0FVS2U2SHhvak4yeUZHV1ZvWHBVVkNQZUU0RVZ2dG9u?=
 =?utf-8?B?aVpEVkRGa3ZXajJMTlNUUUdmUUdrNWY2SExkTkl2aklkMkgwc2owNWt0byti?=
 =?utf-8?B?cm9sOVVDdGhObmo1ckxicStuUkZwQnJZbXE4cmtML3ZJVmlIc2dPNzFaZSsw?=
 =?utf-8?B?UkhIWE1ZUFBFaENzOG9FZVdxSUFDRDdncU9tMWc4WEVCcEVqY0RFUDM2emNr?=
 =?utf-8?B?ODI0Mkc0RVYyUWMvOUxjd3JWS3d5K3k5U2tIRVR4VjJBQjAwRWE0NTQwL2pF?=
 =?utf-8?B?d0ZwV1MzQ0dqa1FNUWtOaiswMGtHaTEzbWw5Z3Q4eGpUQzB0a2o5djNKcWln?=
 =?utf-8?B?elpsN3VPdE8wQzNxd2dJY3BZUmVZNWVCRlkyV3Y3K2Y1ZEhjMFpRQXJ5bFNE?=
 =?utf-8?B?S1Fzem5wamc3RkkrSW4rTStPejZnVVNNSWN2U2NibUI3cFM3dVFjSW1mcmpo?=
 =?utf-8?B?ckVnTTVZRXdTb09adUJ5RGtTUmwrdThUUldCQU8xenFkVFNWdXN3d2tLdm1v?=
 =?utf-8?B?QXkzc1Z2S3lFWEJtR0JGMDJCR0lGUzNkUTFRMGsxa3pKMmNxR2k0Zk04ZkpY?=
 =?utf-8?B?VW1mM05IVDk2ZmNZNTNVNlZGdjR0L3RpZGJOMlp6aE52aEVxUFduMEFIWGJV?=
 =?utf-8?B?WHphUlBLc3RQd1hGaUpmdzREbDlVWGpJSGVtRzBBOWJla2JIY3hrRTlaNElt?=
 =?utf-8?B?TlkyWmFlNWRNSDIrc2Z3bXZLUmppQVJpUnZJNG83TFJYcXV0VlRHdklBZWhI?=
 =?utf-8?B?UnoyYThlWVVzd3RLTThQVWxUVzdGV0ZZTTZ0ZEthRU1lVEV3ZFAwM1VhS1Q3?=
 =?utf-8?B?NEJ6bHExSjlkNDY2bFZKYitvL3Q1UHd0Rlk1UW1MQ0pMcWwyTTNkM0lwL2p1?=
 =?utf-8?B?WlRHc2xUd3FvVEpwVGdpZDJVNTU2aEM4RnF1RXFSSmZTb251aGFOdHBiR0NY?=
 =?utf-8?B?WHdHdCtjODhMbnYyb0d2NjBYb0c3K1RhSUhqVXZRTktIbWJ2eDZqK21oM05G?=
 =?utf-8?B?VVBraHVvcHIrYlRtOG5sS1RkUU15cmZvSFMvSFRVQldQb1FTbDM2V2hsQ0Q1?=
 =?utf-8?B?OTF3Ky9FRGtFRHBrdUhhb1AwcFNxN2p4V0FIbHlVWUhnWGxkL2tLNHVVT2Z0?=
 =?utf-8?B?MEhBR3gySnVNUDFkYlNvdzVaWVBQaGR0ZnljR1pxNWJ2dzFSMTEvbmhNV1lU?=
 =?utf-8?B?NDA0T0dVV1lFRVZqWFppcHJSWHZrZ1hmTUxhdE1vajZaa3hsc3NoUC9oQXFM?=
 =?utf-8?B?Z0M2MFh4cE9kR3lud2M1bzNqNTBrd2NZWUtSMHYzMmR2T2Q3RmwzWG1JelN0?=
 =?utf-8?B?VGhFU09PVFdSTFFHSWxFM2hMMGRraDBLMDZqNERhWUVONitTY00zckt6YlhL?=
 =?utf-8?B?c0xxeUc0a0NIVjc0Qm5aemJhaG9xRmxGb3J2ZjFMUjA5ZmRTenkrb0RPZng3?=
 =?utf-8?B?ZFM0WFhUZEhJaFhDaFF0MUFsQWhrcEhVbGo3SzFmWVpjRzkvbWdBeHpsZmd1?=
 =?utf-8?B?ZFQrMHUxQ2JaMzFrYmpCV2VDamJJaDJXMzJwWVVJUFREYWhDUjFUTTJ3VmRJ?=
 =?utf-8?B?d00vaWllMXU3U3JkQURSQURLZHJLNGhBMlZnYkdPdDlDYnAyNnA1NzZRSFhn?=
 =?utf-8?B?OXIySFlPNGpYRFZwZTF3Zkk0T3hnSWdQOHlrdy9ydld6V1NkOTl0Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e166b1-1cae-4e45-8f1a-08de8111705c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:01:43.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMRqrIqtApldDpoTXRw1/OaqM+/nXrQG4BpPBUTYCeThFyxBoYP+VerAikxvnMxeVJMQSZ0IPDX2q7MoVwInpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8527


On Wed, 04 Mar 2026 15:44:22 +0100, Alexander Stein wrote:
> i.MX team maintains layerscape as well, so add the whole
> arch/arm/boot/dts/nxp directory as requested in [1].
> 
> [1] https://lore.kernel.org/all/Z+Vs+pHZs2fMP%2Fp3@lizhi-Precision-Tower-5810/
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Add i.MX team to all arm NXP platforms
      commit: 1b7c834dedf9933447c424bfa01348f9dc3db4d1

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

