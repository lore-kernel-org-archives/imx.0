Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE62F83AE
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833898; cv=fail; b=drUpqFUz5NbXWNk68RtEGbljRLfriurueGkN9GD+jf2nYAe9i+Lfgx9o1875tz7+Y/RBHBdKMHPTNzh8okJUH12e7l9yKNAiQrbpBfDjE8QQaXznkxXHyP+YTKlJblUgNZAHwumrKtX/xiidHdxR/3Tmg3lFxYr9OvyWQhARMzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833898; c=relaxed/simple;
	bh=vR3L7zL82W7P5gHs6x/13MFo7ILDyHfIBgZQM04Y6LY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kXkakdBLeU+f55b0kzUvxb55ipoPf/PSLpwOUJxy4r02WEDt0kEUWJxEgBqgiX3zY28/VFL5Hlbww65ZyBtSWQGtjqlaaNLBLJ4beeJ7hZNNld3i89DN0zFy1n9lv640aKDKCt8zvIjyx+R4HopvfK6cw2KEpbijH7mpo+R58cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Yf5DMrjx; arc=fail smtp.client-ip=40.107.130.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Yf5DMrjx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FB7GNTcCwdMvpBcSoFlc451SpyK8isORNAzdBvUHeFEgWnj9k+zVQOdzrZ3aMl/X1gGpFd95h23JCC3hFRwiYCnbr2J3jOEUnhGbuiOZztxuRhw/NWRL1cFJoh9DZY6rn/zCw5pZvKgft9B7laXDLUB0qbDNQT+tCrwGjtRrG5jJJMNuH/ywM2DitzVGD5nVoFc3AftxdG1HhW12GO28TenBnfPEJhunyDalkctVyGIFYGLVaUs2+zN5/TyMpXEPufoR/KlEk7OVqMZ3D+Ga+Iq/ovtnJ/iW28zYb5X+aJ+9zTlufjH+OveO92OAnfqFMPEdjySHEDJUtTKxD0t9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4TXNEVFznOpjjvUyrptNkfIsltVguMcwYLL+YQrENg=;
 b=ArPHpRO8ExsB/F2Ux53L24yuKbCDIc/CF36fadjBFL7mRAlSYA9HZqrJ0IQCQR5qKLxKAeh+jLjLzBDmKylXZbzj0muqgPC9oK6j1iEdequpGlwih/D3f1NMpipPxvaO0l3klvks6somcuF8W91K1O4Irolc9hMjp2Yi1QFu57o4JiQ8p55finmsKmW/hc6pEv/gCI9Xk5PJ6PInbin09RbV6fxS4LP8HXL0MgvjF78+V6XwhkJTEer1ZdTgTAakuDuP0EKyUwP8xNagfuMowD9wwBt5Jp+rpHeu07nay9Ji/mtY/8zgBUYpZEch/v8Xs5XkN3+/h7Z+oweazMJaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4TXNEVFznOpjjvUyrptNkfIsltVguMcwYLL+YQrENg=;
 b=Yf5DMrjxARZftRoZbFRZ2RUpWQ+GyO7Lx2jL05e3yqCoxFhqkKvX9CM+Qp8+tq2BPH4MuZBUIvtbSwjZu/13pdIyhU1jp6mPVL+/LKLKco9dPtTSXEGPkcpbxuH3rp4CW/RqmLyd9V48q+Wy2lrpJM6/MCXbRnzgXTYwW5AxQ3oHMIQQ8QG1yjMoWEr7DqfD/co5n7F0DmyGRGpG6cxSMA5YnF7Rc6q9U1qs4or+fPlzdPQSDlWbu7Bk2y/hBNtNqtJ1gkErNMmoy3tnbEPczaK+3Y2BEhn1mykVBBpvlMT20j6ZVkDlLR5XyRhNPSVSWFKN+eQ5sMJ1OZommrQoRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DB9PR04MB8091.eurprd04.prod.outlook.com (2603:10a6:10:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:38:12 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Wed, 18 Mar 2026
 11:38:11 +0000
Message-ID: <6b5f1a67-b6ab-48b9-9cd0-1c154177d841@oss.nxp.com>
Date: Wed, 18 Mar 2026 13:41:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the
 default dts
To: Sherry Sun <sherry.sun@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260317031024.444157-1-sherry.sun@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260317031024.444157-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DB9PR04MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a7afb4-05c0-435e-3211-08de84e2d543
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DDPgoUN5ZCpubnrMTlMcQa0DQsMYiySNASELOIpUyR9cEUYvEv+R3TJUrohtOyJpaSwUTiOpmd+WV1Qpxy0V3a2AwfWbcJwSp7xQK3mixAB8PHhrqWBLBU17ainuF7mfRn6fz9io6K2JSSIIwGMYtoCfDFrdDOJ7Aphz0Ddb3DJZKDPgUhsA26WWtzpyOBmGcLJzI/zctwCskrH+AZeBZ+NjHdn/P5NKfxPr7C5m+lnIWzR8ZX0Kcbp92zC1PdtLW/9dD1DbPKtRTfIpS1yWriXZo4gNG6pH1Y+dPaPFxIN5UBtU/6n6/XHUvKQnGrgWimrHUDasyNHE2EMN5gZCtVwyez0e6MZW6RootfkRds9CmD/JmewZLVpCmF0Wd1O+GbO7mi00rbB6ksmm8tOKlOEPnw5ll6y+lp2PetQcigankDFRmucyQ7ngHSiA/+scQr9Qy+itq1SnouQuFZZqfeVZV58JvQRPag0khTKYMW8vkX3BDgmwhGdqdHxPDZ+Rs1A26GQoLJiPADSagOS4rnINGBMUAwGPAyHbBmHr9crkrNgEsxKZxuHI2VCO133A9PIAPvdJqKIHjk2vjrhj8VT2z40KlakM329rheYWZvduZrNWzMP3WF3rPcdyqmBmX2Dsl2/n5F7TxWR2o9UZeIO80SLVss7UwXr2YHVtsehfcu1wGZBrOdhSrUpPLaa6EnAMtaXnS2c55dW1LTsZVkBtkpSU1xtIMpsWJxIkPZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekpyN1YxeVdza3N6WEY3NEtBdWorOGVHeE1DSkxNU292ZnM4TXdkUXNVRUNv?=
 =?utf-8?B?MUpxZU5uUjIzeFNhR0VyUWhkMC9DZEtCc1lVYmlSUU5TN2pHRnk1OFRzdDgr?=
 =?utf-8?B?ald0VHRhNDFrbytNZ0tURFFRR3p2OVFoSWRjNGNhc0lTVVlRcHJIa3YyRC9r?=
 =?utf-8?B?dWpwVVV5Z1lBQ3VBd082a3oyL1prOUFrM3RkOG5CdXArNnpENTlPTnFQRE51?=
 =?utf-8?B?bnRETmdnZ1NobWg0UG4rMTJJL1Q2TWJ3V05ob2h6WTFuQk5UaGRUM3RqQjd3?=
 =?utf-8?B?WWhUVUdyOThhWXVQMW5OZDhxSnVsL2V2T3lCKzB5aG8wZkZqUUNPVkVqZWdt?=
 =?utf-8?B?L1lEV0FNY3BEUUtURVpVcnRESnJrV3NtMkpkSkhWVTNCdExxMUdVSlVyQ0lr?=
 =?utf-8?B?KzBUOHdjcnJISUlHTE5PbS92b3MvWDIrT20rdG5sZWR5YVU1TE5GTEwzd1gx?=
 =?utf-8?B?VVFXNDhRa0RGcStHYzk2ODA3d3l1NVZ3eGN4d3FqSnI0THdRU3hhMUFzMEhU?=
 =?utf-8?B?YlVVdVZOLy83M0VFb1BNTThQRkZ4RUk3RlJ5QTc4bitpTWhZdHZjZVV0emMz?=
 =?utf-8?B?c0QwNU85V1hqa01YMDdobHJ5VitXc2h3bzliM0RwUGd1Z2dkNVYwbS9wZCt5?=
 =?utf-8?B?bExBWVpjOVBvdVFHZ3ZuVHRBQjZrS3ZXR3Y5THJ2MjVHd3ZsSjlicU5yc2pI?=
 =?utf-8?B?Z2t3R3lXaXVHVzJsQll2WkpuQm95MU9lNm9iOUxXb0Jka0FVTTM2eDd1K1Jq?=
 =?utf-8?B?RFFMaGh5cU9QNkxFdFo2T1ZyVjdWL2t1c2lualdqL1RMbWpxTDlyRTllSzhL?=
 =?utf-8?B?SUlvYUExWVc5M0RDQnZkTVJIVXBKUTdDcVZ1SHoyV0tpM1Fhd2VhZWtaS1Fk?=
 =?utf-8?B?UXFaMms1V25GT2tXcVNpVVRLK3dtNmZQTHhxRE1zRGNFWk5rMTVEanlKWU9K?=
 =?utf-8?B?NUJsWVJDV2JhQkJGclJzK2NPNkwxRVFnV01nWHZEWjBnUnFoTWtBZEVvcTI0?=
 =?utf-8?B?OWlnTnBPTE9NaEdQTkVVSEJld05XZksvRkhFbStndzR3QWszMFIvNnNZdEtt?=
 =?utf-8?B?Wmtxdk9GUG9PNXl3ZFkxbGVkZWMrTmxwa2NRQlNZUlV6dkJIVTlXVys1LzVr?=
 =?utf-8?B?MnBlTGM3cjRoeXhrSThCcXZUQTdzYTBiSVJIMURhOGc3Sm1NTzVIV2t1dWpp?=
 =?utf-8?B?Nlc4Q1VkTDVhUjJXMDR5TkRLUGU3cThNOXVVVzVMeXlzRit3R2pkaVdDb01w?=
 =?utf-8?B?Z2tBTkl0SHFBbnRqeFZRZFY3VDNkazRZeVd3bHVEZXZqZzQ0VTBDY2lUNUJK?=
 =?utf-8?B?MXFEZXhHOGNOTmRTMk1mUXZvdEJYWDNoNms3THQ3WjhkUkdiTk4yTUE0bWx0?=
 =?utf-8?B?T3RnNURIdlFuN1V5dFFGeGlKWVV4N1BSYjcxU094cVU1emtEUlBmTW8zdXpZ?=
 =?utf-8?B?RW8xakJoYmNvOTN1Z09KVTFNN2s3MHlkTXc5M3UzQXlRcVh3SytQY1Z1R2xX?=
 =?utf-8?B?U29ESkRvSFFEY1NEYnhHRUI0VllLems5RmJsYzduT3BhNWR6Vmk4TjF6STl4?=
 =?utf-8?B?NWxZbVEwOVJLS1VyOENGRE5HaTA4eVJJSUV0ZEF5RzI0bUVMZVBlL2JrSE44?=
 =?utf-8?B?UGVMZjdvT3NsQXgwc1lBY0cyUVlwcGVJMU4xQU04aXRVVzh6YjlZY2dGV2dW?=
 =?utf-8?B?Wi9mTVBieGR3UEFOT2VRVlJCeW1vbFR1ZlkyT0RwUXQ0cFdJd0tYQ2p3clEx?=
 =?utf-8?B?UncxYmhyTEgrQ1VjcTNoK0J0K2owRFlqNDUxZjlsUWgwbVQ1SlJYWnRhR0s4?=
 =?utf-8?B?QUtsRTZ5TEFDenpsZ043aTZlVFZMdFdTbkNJT2NMSFo0SERGSWhpL3FHM1Br?=
 =?utf-8?B?cko1cmkzZ1ZSR09aQXVVblY4ZExDZ0V0OEYrUEMxL1dtV2lSNUZQOWRSdWth?=
 =?utf-8?B?NmpsNFlwQmtPZXhpYWFPOU8xaHRoNENXWHBFa3JvdFZuZmlhUzV0UnhQU25x?=
 =?utf-8?B?Z0tBeXhKb3pockVITVlPdkQ5dXBGbFhJMjcyanNjUGg3MHpEdVN6S0U4VE9B?=
 =?utf-8?B?ZE1MSTB3ZWh2amoxZlFodHhPS1VhWTFhQUNNN3ZyUUtHbXBUOVkvZkZsN3Vh?=
 =?utf-8?B?M093eHhJZ3JkK0l4ZXpUdWNZL1puYm1VWnVnYmQ4OTlNWW5wS202YjRmNXd3?=
 =?utf-8?B?cEkrdEI2ZHZNYjBUbEMyV21aQmZtL1FtbUpnblFvK3EwbS8rNGNKaG1mVVo2?=
 =?utf-8?B?cHNTa0RvTXE1cHRTR25Yc2NBQkJyaDgwZHA1eW5qbnhZQXppWU5BWVJQN2Vh?=
 =?utf-8?B?N3F1SFdpM3I1S3FzSWFtTS9JQXZydVFTSU1ONjVtT0FGVm5VUFRhUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a7afb4-05c0-435e-3211-08de84e2d543
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 11:38:10.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xq71q68cokj6cS02lsOay4+wj08QYeFxGDu/xs3/FQ9BVpUgPA/7vND4CAfoVibcxdgJ10bCO1nJc+Lml4mGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8091

On 3/17/26 05:10, Sherry Sun wrote:
> // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> index 7eb12e7d5014..afd89ce3cc5b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> @@ -557,7 +557,7 @@ &pcie0 {
>  	vpcie-supply = <&reg_m2_pwr>;
>  	vpcie3v3aux-supply = <&reg_m2_pwr>;
>  	supports-clkreq;
> -	status = "okay";
> +	status = "disabled";
>  };

Since this node it is not used here would it make more sense to move it directly into the overlay file?


