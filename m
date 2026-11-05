Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793890773;
	b=ZYAgN1cbkyPEXe9xOI+PfQIyEst60IxIDw6hENrzdTBx6CvlNMClYb9AE3YWq6OHc4+W
	 g2zp5XOPu6j/77VHAgzrq2NEDKV/x+kEB0eWhtE7iR36gLMsRWbtYpnXwXDGBRugAevm9
	 ZnNrCymfIEXoITQRah56xTBehFw0vDUt9VKq8pkd2HZFSaiXZ8fZgDTd6Pnu/4cQPLOk1
	 deCUzCD70Z2IFmItgZL/B22Yo3ONs9A8P2qAbsOnYEA/9Jff2WQYwPehiiD6iiINOue1v
	 6KN6nfMt+XjpS6fEoR3VQoqb/CE0tfG1RQEyCwoQlkvtESZNP7v0CmMSMHEmo+ogv4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890773;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=F9089jXskG0NR8fMcSQdzGTgeygJslDGrtsoKbfoz6Q=;
	b=LDJzNqNXUOeL4tf9KfO4Up8B6SR2v0E758XNCgrKTVRcyd8PeV7jpaj8BH4GQCBUoum2
	 +rDQcK+cngynwKaPhTMHp1NrxqTVhzJx5X1ochQA5kU5aNyYBNU8DvPg5pf6FMR3/SgGA
	 Qnp++sdMMK9ZpkWbzPfTYiBr1lhrD05I5LOCCU/BfaCWzypDcih9Sr+sEnjrzoERqovFP
	 qgShkxPmKBaRpnaPOBFtBdk0OCmsro9sEiGxRdIgfcMbPNWHe22b8eZ7QKypoZJSvoNAV
	 EfSr5ZCWPf4IYrlo7hu1pLnUS/vFSZd+gscrb0KZCkjLFv4jiRJgi8HPQEXtsLnHP2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wlnq1hZr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.14
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02739606A326
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 14:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02739606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wlnq1hZr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tqg+TH7AbHDQG4k52hTXYFPl5hQbzHk02Daowy4rCLxlGLa+N+/YhV+iubW0PvyVAnUu2cKvyBdaU1bWstEHr3Ef7LTgSvM9hcoETKSTLqF//BnVt8/RMx1GkgcBJskX/PFzhkJrxeYbeueOV1A0Y8qPxNX/PPOfNJrxLfX7oTNqWMFIxW7SrJ2lHitykSC4l58LZc4GUd2sT7BqIaghYAJRNSy4Cb7agBP3TT8a4bwbxFEHwdJl9+Cp34V7hv2jAmBS6B8RRdRhHCNhapIpoTSlt63iOpu6CxCwhyptqYQuEztCESZsdGGWQV9JIaPOWReEYrjuozRTC6JHB045OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9089jXskG0NR8fMcSQdzGTgeygJslDGrtsoKbfoz6Q=;
 b=I1/UtsYcskkO9TCt4OrIjTheV3B4wEN1uqjhzB0YiTIbCyv3+fFXGAuvW/0gF/pseSQ1a0m/MSYFlpQ3+6pYAaMafMs7f8nLRBVs3OyK749NgkC2TZ9KO5pTNY7w36j94VdMAQ9NzcWVYiLl/H69lDMv70WqZlOR3kSSiPGvPYyv+9hlLLKXGfxJho7QmO+lA8q6Gcu1ZlZlqRcE26p2Rq3isOKIp3tCNMqgcIZAQy+rI0AxKMB/1sHwtUyt0uc5PAL/ASrK5IYD3hcwbsJjLUFbkSg3GvLKHIzFgCcmuhwpWN8VUIlsF1zvFyd+hhmtre0EqNbwQc1Le2ivNQ3W4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9089jXskG0NR8fMcSQdzGTgeygJslDGrtsoKbfoz6Q=;
 b=wlnq1hZrHMw9/Forv16bhISk0V1zOv7tIiGZfyYfBYTEE+MBm8hPwn/ZoJzxAV9IYVT4BjRSwatXGIATb6wd0F32kEilCH9FOU0hugWyNEBirktF8petI3HqDWWJiLgW/bPywMNAJQtTGYFNDal/9Amepwa4S8p00Dm4Uej6X4IONFrMgU7BPMTdEYkCltkiKFFDLzZhoRBbwGSa4Oh+PKtzI8kG1gQkRBqS8eUGbZwMw73LcUW+dPIjjEW9417N36w13LZMMsSr4hGvqKwyr+w1sKn/eEGDmQ3WmI/Qg5K6lTEbGtjnmHpMqQfXI6HlnFPty7p4lCa+DURAMA1t+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by PAWPR04MB9815.eurprd04.prod.outlook.com
 (2603:10a6:102:381::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:59:27 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 14:59:27 +0000
Date: Thu, 5 Nov 2026 16:59:23 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
Subject: Re: [PATCH 18/83] drm/imx/dcss: Switch to
 drm_mode_config_create_initial_state
Message-ID: <auyZr5qupit_zzfY@vm>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
 <20261105-drm-no-more-config-reset-v1-18-763560c2cc3f@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-drm-no-more-config-reset-v1-18-763560c2cc3f@kernel.org>
X-ClientProxiedBy: AS4P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::13) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|PAWPR04MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b67481-9cf9-458d-11d3-08df3b4d62ed
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|11063799006|4143699003|56012099006|261009223027099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bGX1E8JqIYsHWUXJDCIg0KGLzv7GuygKzyQZ8e5lRRWptIQzPkPaYLiEAag35m9deD5S3gO2Y2mmsVRCn2YjIg3jRoSdbCUG3mRttdumV5WiBdzMxH2Gjj99OILh3DspD1+o+dQwHY7RsC/fybnBAQb8nMJT9gyF5wnyBfD05vrWLBig+9QKgzVHTA2rBxe4JCFyRIKy6xBWXKvKgGYMbyWamD0T4IiPrcF9htb4YnQj99l3hUTheZ9FgINEix/f9jRRa2IGRxzCVwCwp4ZNkwny5OFcUTAxgOcGq2L4eV3ZhRbX3H+7tQBt5HwCFTDOepROqSVBdF1znnAcwzif2c1P4iy0DTktjvf2JRUcz7hl3aZD6pGkVzNHMTQrjT5y1tLLcxB98XdvQGK2Ax3WIp6KYpLTubxcW85n2dUfP4B8Q39bAYhzHGvSX+HfLp9rb6SMhSVQiCO6K3vDc9zhD2NASCQT5x95Hm/60WgaUicT5iPDNEjWUeIO5PDxqCRAdsMuVu2s22yN2RxfpGWzukyTnN1yg8/GLYwu2NGyUjH2m5ulLyybr6MJLxg3Ch6Z1bN6g2Mp17qF6f7H+Eo61krS0Yddu6kZCfJrkZxsUjhOJuTQXKvujOl1ZT/2xgnWc6568gVy4olTLNyO5FGDtFwde+//ozjrB6DYb3f+QM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022075727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4oEi9ZHM5NBvywG0iiaMzr1/+J3P3ShoQV+a0LSOFmXDVP5CRQf3U6qEoXa1?=
 =?us-ascii?Q?oDZV+4OgATrXXFI1il5slDWHrTn8dJUPLpEWqsDGWAw0KIiKDU0EAyHapLln?=
 =?us-ascii?Q?IVx6V7NQmzhdxLWNm+jMGyhYNPloeGhJWsJoR4GwMkFLlB5gSXT6uiRt6WqI?=
 =?us-ascii?Q?bVU1ISZDqlMHGNTsC607eoDX2CTJI40dQdUeIOcovMsN8T4TM0dvolYG3Ay4?=
 =?us-ascii?Q?NXnR7E/Px+/RWSy5+bYJ+CFJiuOhjJlMM0hrE4xz7pCSjSt1GVv1/f2D0fr/?=
 =?us-ascii?Q?Cvnp2l51kTl/2dJuZkPtVNJxa3FYM5PP8y/0m236rCNIaQnWX3DfKXi4g1sI?=
 =?us-ascii?Q?1djapmSkYuVD+u2avQXDsEGWqm5lDzg5QoQ0ByI51+lxO3lUwJTySN+swbit?=
 =?us-ascii?Q?o02Sl7+iPADsPzvN9ua6iJ5yAyE63uhZjMN4MrFWOVSuiCw25O9smAyINBay?=
 =?us-ascii?Q?slEbDRn5iAyWiF5jz+5Jy79ehzZfvjSLcdBzilis28OTi1Da9BrsilfgWCOh?=
 =?us-ascii?Q?xfBiPmtm+bUBSCuMFpMxSG40rh+7zlnMtwi+jh6qixcrthEfmBQDjWJbg+hY?=
 =?us-ascii?Q?Mh1Yhb/Y+eYzfnCz91+pY/9yv96NJnDpdLhrUSzm1laaS/Xw9aj5dggMqLe8?=
 =?us-ascii?Q?3WNfUTcHR0QCrc0bYqiUopPf7hRBBHnZZWqQorgHEkmJ+KGjtzswC1tLHTHw?=
 =?us-ascii?Q?iVCh3JhNfFdQKqTvaZ947VcXwc9QvL76cJ9IVGDSZYcKu6bsngaBdUiwpGEF?=
 =?us-ascii?Q?QaYifiaOpk51Pmi5wKuSA/3s4sXL14ZLhQxWOOgeDdA4Ug5ZDNpbP0vfRcl8?=
 =?us-ascii?Q?o9woyswGlytBe5/S0Opuk/eUT25sHwH/aPUTKb+iUmhOJyQB7v+VRHnOo2/W?=
 =?us-ascii?Q?pf3KJSRTxL957aL+7lyS6hP0xR4Q9WuEhlXIsuedILjXJU21vc3v+83Q3Bjd?=
 =?us-ascii?Q?wxBIhUEM2hBHMVZEuWWQgogHywwsRdAXsGMel/R+lZ3E7Qgy96qomnC9KnAZ?=
 =?us-ascii?Q?0gitlHTzP8w83hoiNivM4M+11ywd3Fn7xqMyS78iAZ1y443GNihc2Zlig4F6?=
 =?us-ascii?Q?k3stWETiXdP2d5OU6aBqz/jcUKQZjjHPAmxQjIzsRK3N//CQ8/ddLPu7KEVM?=
 =?us-ascii?Q?kV3k3LBIPz99TcCIBTc7xLEim64d2GgOCTPprDZTPS7V93DPb0IrVSxkDoHt?=
 =?us-ascii?Q?g1biZ5es1Bg2H0p8owLkUMwE4Ec/OULcF2pSIxv6+9Am3LSEe4MAK9ZYJ7Ju?=
 =?us-ascii?Q?59CnvPfo75Ns8FpdInI9TGYppnD3n6FTQnbZOdQSSgM9J4aNDSYNyIifUalz?=
 =?us-ascii?Q?nCZIa825FLWY63rsp8DhdzMs7XiUGWdrRNjNeY0l+eUE2p8RsfRu8tTTyron?=
 =?us-ascii?Q?nmceatxrnL9zNNPmbobySHRFrOJABiT225DOVLc4h85f69ZvoLhsLeF3z09j?=
 =?us-ascii?Q?nGqiMR/VIrwNMu2Y36BEeTwHnuHx+84tS2D/x8uNy+BYir+GSP49tRmpkUtz?=
 =?us-ascii?Q?tdeEgT/uamcEDYFqMFZ3bbz7fnuj6PfZeZ53JLua6y4UpJ6+QVZrX5BOTiY/?=
 =?us-ascii?Q?FlxNOoOdf0cz7gdyo9Dmpk17lan9TCRi/tCq1XUygRw7XOUnwLnI7m5N7ikf?=
 =?us-ascii?Q?dZKQAfGZXn5qclLDviZnsjuiFU6P8JehM7TaV7IDC4EQfVxPpC2uquVWP3CP?=
 =?us-ascii?Q?d8nb++1wlfKT3Qma/Z2RN/VJ05MR0gxzvlKyiTe+vOxZV+3lDxh5Cf6GcdUr?=
 =?us-ascii?Q?AcJJ/0GxMU6yKQL1M3v0hJx+eZYNCLU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b67481-9cf9-458d-11d3-08df3b4d62ed
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:59:27.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9doQWRRc6FbQfyPXB1WzZ1MBKBnIkICdBCkFEaRtBvQP6hcLUqbrK0CJAVQ76UnWzNyhfctOVRmDU11IYyxBkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9815

On Thu, Nov 05, 2026 at 03:07:35PM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() has a dual role: it creates the initial KMS
> state at probe time, and resets hardware and software state during
> suspend/resume cycles.
> 
> Since the two roles need different behaviors (notably for objects like
> drm_private_obj that must persist across suspend/resume),
> drm_mode_config_create_initial_state() was introduced to handle only
> the initial state creation at probe time.
> 
> Switch to drm_mode_config_create_initial_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

-- 
Thanks,
Laurentiu
