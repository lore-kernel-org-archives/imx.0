Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701CF2170C0
	for <imx@lists.linux.dev>; Thu,  7 Nov 2024 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731010101; cv=fail; b=uVpNik9vhdT76vxkfmqU9PyWusJAA4K0GY/KhgjE84ya2eDK8kXLSE4G161r+l7BTeKgDF4wqg2CoMiqewWyX+5QGldCsVBndheRYdQVRz9bPjmIu0nGV40tXBtpGBAy1iRi+tBPfxu/Ov0/farWwkA2Fbkmf7ygDslQ5qaauJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731010101; c=relaxed/simple;
	bh=mehDCDfBiLIfATNkEcoAXjBU7TIC/NN8Ul+qb/wfeYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lCVufYwRNfZ+22uZVMHgnVVXTyDhJXctnXYOCCYrhSMam1dvfdrmwpBx3kp2W8KRBIYxKEjfy3U6h49LNwvtoG/FG/t2EyqO7+xLEVDHj6jajC5HpUPjcnjOEoMOkiE/GtMcoMlLhDGBDs7T7gsfdgaRhhFmgEOdWqSJfN1dvXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=byPbUL+A; arc=fail smtp.client-ip=40.107.20.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="byPbUL+A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQPQbXcA2lIUMzbpbVPG1k/qNF6j1nupZAij/4ieJGu+bMeKqI7v7FNFU0ivfmcrk7Ik7q23qC6X1cpwRYjktDAv/nDWZ16bqIvIt5FNvKBPme+foJQXcTacvpP5ITq5f14Sdf/bF6CikHzXlth01Mu/L8CdVtpy5MtFfrV3AiYDuD/ns+GuJjD/PmRPkslzJGLLhhpYS9aEZDFKqtplkHmhVbFfPfdyeou5EXbaSY9d6CFmCIscAdbxaEkFWd9rtg2EmNHEdqzGBJJvGBvNG7yPJsyy0sGvSlQzwFwezSRhm35R8pil9ZObo6SDToVb+9Y/InXuCgrZOVhxaiFpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34JlCLm8+3yw+7E24QoDRTJjWqnbo/qlmnarrJRO6Cs=;
 b=Glm74goPoBwkiTJvI37Si3bAUDbUr3NPY3YlFbo18CzODjzXDY3a5xq/okIywar/8xtw9nFiQppeOBRsfhO41Rt3uViE8aT/mt2OXN8ehqV2o5Cmbkfq3CFAna0BJ3M8J4KChsliBG+qc0yLcRD+uwMGQN9stM7UQY87BMN49Vb3SmDKSKBJ6kqAYsUdWNDDk5BYL69aiUpLKcErz29R+40Wbu4T32N2EipP7O88xKxb0wfovW6WZWR80ybt/gBkpRucJNdYIEGoSwp2cQWY1kFsv7ZZCTy1AoF9tlZP0+LXhoV3Q4DOGx9M9ncsk5JpbbCwJVQxz3slGl+qnA0bMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34JlCLm8+3yw+7E24QoDRTJjWqnbo/qlmnarrJRO6Cs=;
 b=byPbUL+AEM8vfAx2YemsSbk3PNdT9iR2rfjFxSow7C3GsGDglKLqQ5d+vAhUsp7jbUREvvc9QdyI2fl/WhkmwnEe/jUHueQvhsUZXIMamZYkuTILe2TAjPwGDmzBtw/rgDN6GskcGcSolq78AQiS7GhxfCIZiEv6vjUsurqq/ByKzLLE3ebWsVke3vpWFSxAViz4X7GhEfNnyLtCumkf1TF2cG7onHRSATCdLPqKx7zVuaHG8cSJlzobCHOQIbY4oBZ7SnqHgfUWQk+8Y68jz86Njy9T4jTLLt8G0eU6RXXiHhAmCN7jIKtiHLJJ7dHhLWUrUVNcKSft2swxqn8j8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB9120.eurprd04.prod.outlook.com (2603:10a6:150:27::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 20:08:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 20:08:15 +0000
Date: Thu, 7 Nov 2024 15:08:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	marcel.ziswiler@toradex.com, imx@lists.linux.dev
Subject: Re: panel-lvds for imx8mm-verdin boards
Message-ID: <Zy0eKTTiE//LanUg@lizhi-Precision-Tower-5810>
References: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
 <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dd72d8-90ac-4eff-7ee1-08dcff67ea24
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZTF6NjJHTHRpS0tDcnIyYkQvbTJmbk9XVFF2a2ZJNzhEako0U2Q5Rk5Jejk3?=
 =?utf-8?B?cFFmb2N4MTZYck1KNU41SmJ0UmZIdXJ3UC9DVU1Vc0h1MkF2ZytueEkyTHBY?=
 =?utf-8?B?bTBKVnRjQmcvVlEzenFqcWx0cDZ3R3pZdjZXQmttTk9HWHlEMzlLbmRXMjZk?=
 =?utf-8?B?dCtXVDNrNi9rVmxFNFJEOWFYelI3dnZkZVNWRDdMbXpnT2lmTGZDZ1BEdWVh?=
 =?utf-8?B?SmhoZUJsVlZLTHZ5Q29CMzFwNStLTVRyV1FxSkU0OXhsdjNEcHlBOGt1RGJ0?=
 =?utf-8?B?bjNqUEV5WDJ2bG5tOUVWYVRLU0psUEpBTWFnTzByWGx4QVJOc0FFMTlBNDRh?=
 =?utf-8?B?SDFiNWJUTW1idnc4aUVRNlJiMHFsa0haUUphUzlFd3JnK0Y4VndldnBjMTRK?=
 =?utf-8?B?SmdmT2RnYmR1elJ6Um1kNkUxYTdFM3pjaUlsZzY2bTZSemJOZU5QcCt3R3lZ?=
 =?utf-8?B?K1d3TFRUd2NqanExMGZNY2tteE9FdU5NM0U0WXhtQ2RUbmxEYjNmR2txQkdm?=
 =?utf-8?B?MEl1bHpTMEFrOTVFdHNhc1JWbGk0amdrZlBkQzFLU3hBVTFHL2hSRVh5SkJ3?=
 =?utf-8?B?blhPdUNud1huQzVDWDN0RjY2V2xwWHhNbjZQL1RLVCt0NklpUzhUNnlPejJy?=
 =?utf-8?B?ZVBWTUFpNEhGTzJBWlFYallsMzltS2loR2c4RkFWWGpmWis1SlFtVXc5eWxu?=
 =?utf-8?B?eUNVUlJ3ZEpocm4vUXJ0Wm9JTjFpZnFsa2RsZkx3SXBwNHNyRk1rSHB3NW92?=
 =?utf-8?B?c0xxemNRamszWjJzNGJseUlaeTl6UXd5TWJMRmF6S1c2TG0yOEczcnpzWVJx?=
 =?utf-8?B?Z1dDQmxHR251YStWQWxCL3VicUYyYXZIdHMrWEVVTUxJQ1NseXB3WHV1cnYz?=
 =?utf-8?B?UTVnd0pMYS94MkpKRWhzVythQVJJRHNubG8xZ3FmU2Y0Um1OSXVsRlo0WGdx?=
 =?utf-8?B?NHo3U3lITHlDdlN2eldRV3dNWUZTUkwybjVPOVY4N0xXdDNiMzc2cU1uT3FF?=
 =?utf-8?B?Ym5idExjeHRJbktrSGFJQlM4YnFvd0Vubk9QRlRSaHJtSE96K0ZSWFl1eTVt?=
 =?utf-8?B?aDhQbWVva1lidTA4NVF0emRVeFF0VnV4b1luOUdOYWd2aDlFRHV1YzNvOHI4?=
 =?utf-8?B?ekdCRGZIT2ZIV3YvWTNVOVBobTJMOEJxMGlRSWFtKzZDOVdZVGs4OTVXTHNY?=
 =?utf-8?B?RVczMWU2c1JoYjBadWZUTmVGUjRtNmVWMjQ2WURsakNoY0dpT0srL1N1Wkk5?=
 =?utf-8?B?anJwTFBMbkp1RFM4dnVpaThZY0FTUVVxZ002TGZhRGxDSUovR1BCSjBvcEZU?=
 =?utf-8?B?cWwzaWhKc1VTQ0lXeXNLbGVwMUo2NU5TamFxemR1R2ZueXdLblUrYTJXa0NX?=
 =?utf-8?B?MGkxQ2lEUlZ6eUE1Vm9UNDNGRmtjbVdWTFFmczNkMjJEOFlKSE13YTFLaDB1?=
 =?utf-8?B?YWFXN3hpc1JHOEhxb3pkaXNLL0dKM2FsZVh2Mi81R1Q4dHI2eE9qZ2Z5WnRI?=
 =?utf-8?B?K09BNEVGeGRpL3NqNk4zL1VLSjh3TkFvU2RJY2NTUTcrL3B5bTVrZXllMWxz?=
 =?utf-8?B?V0lURmxnbkdDUVgyYVZ6WjhoRzdMZHJVMlZORDlUVWtZMUwzZTJtRW9HcFFl?=
 =?utf-8?B?d3cyL1pkVjZIYklIa3VKQWJKekowb3prdlN1dHVUaUw5NGp3RnVXbDJWMk05?=
 =?utf-8?B?ekY5OGpTR21IVFdaTzlJeldwWU52V2FYZWtydWpVU3JVOWRIWjdtRnd5MUhx?=
 =?utf-8?B?RW9IWXdZK0hQOEd0cnQyKzM5d1BMMVZDTG1BbnN5NXJCVW1oSEs2ejZlMDFu?=
 =?utf-8?Q?eh6eVLz+FWNlep2MP7ImKWF72SLB+i7kkmYB0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c0FTVDVGWnI3VTlqRStaRmgrek8xQWVuNWE1THUxN1lqbCtiS2JKajdqamxl?=
 =?utf-8?B?MGdaVjZlMTJvOG45cVlYQUE0bVNtRHE0dWNOM2JGREVWRThRTkNoWVF2d2o5?=
 =?utf-8?B?NUZYQ2VhMVpmNXJSSXFjRGUzQzlFS1FBMTRTTjM5c2ZGaDdmODgxVDdTaFNz?=
 =?utf-8?B?d1VBRVR1aWNlZlIwbThkRmJNTThwbXIySGpHK2pXaGY1VlNQQ0FMNXpaUU5u?=
 =?utf-8?B?QjBUYkZHZjE3Q1hKWWpjZHNsVjVIeTNONkFhUHoyZ1pXRWJza0V4NDJod0FE?=
 =?utf-8?B?WGdHa3VWcjdTYWRpQ2ROSVFwMGN5Z0xDNG5aaTFNMEpYbEEvZWp1ZWx5VEdX?=
 =?utf-8?B?S0hwMHdxV0hVUFlFb0pQNWcxNXZINmpXSW9zQUE0YTdzZ3NVb3pBVXJWOVMy?=
 =?utf-8?B?ZFJlZTdwakxCaUU4SGdZWCszQzRyeDByRk1GRjlCYTNvbHRoekVRUmtiY0xT?=
 =?utf-8?B?R3d0OFFic2RkeXNrbXhQdE1EZ3BtYjlrZjUzaUhqeUhCOW9ibXNzVSswWU1L?=
 =?utf-8?B?Z01MdnllTlB2akJHUVhWb0U5MVhXZ2E3TjJiRU5SV0c4ZkVEUFdHd0lLRmNL?=
 =?utf-8?B?MHllamFBeWdJd2gvVjBLM3JtSWEvaHA2OVpDdnJqUlBrbENPcmxWOERDS2JL?=
 =?utf-8?B?QVdSSUEwZ1J3R282bmd5aXc4UUNQaTNmTzY3MytLQTZFcVVEdG4vUXVZa1Ez?=
 =?utf-8?B?N3RGaVBOT1hkV0I5OW9lVlBBZ202QkdHUk1LYStoTkFHaXcwU3JQRzNwWDRa?=
 =?utf-8?B?a0xtV0Y5a05MOGptYzQwOHBUWUdEa0xwb0JtWGVDd1lXVUxRaitJeHRhM1RB?=
 =?utf-8?B?Yi9naEg5KytIdWZSNHV0Y3loWkRyL2crL2p3d2ZkM3dUQWcxWGp2dkhoVlVR?=
 =?utf-8?B?bGpHQ2FRaGcwL3preDBhTkk4blhRVHk5ZHRTNTgwYnJiRDAvWGlPUFFDSCsr?=
 =?utf-8?B?Q1JLZzdUV2kzaEJFMkorTHNZVktPZWZ0UkNHUTFUbGFTenlmNTFJNHE1Uzk4?=
 =?utf-8?B?TEd2MTlrVE5vM0FVRnppblA2cWljc2poNWRvMWlqK0lmVkY0Q0tyMUY0aUJT?=
 =?utf-8?B?VTMzK3dNU1RTY0JDOGlTampoYWpUZGlaVHIwWGVEWDhpdDdLUXJyck9tc3BZ?=
 =?utf-8?B?a2lFRVF0YW5rcmRCbjF1VUV2Mld6U0V0ZnQySmZqclN0ZjlobjRwbXVIT203?=
 =?utf-8?B?Wk5OTW5NTDZmajBpZDlNNnJXWWRMdEk1Vi90eHBWRFR2WlhWeGF1c1BrcnRN?=
 =?utf-8?B?RGtvSlVDeEZwMGFTRWpTWXA5Q0FncWpGQzYvbHdpeit6ZS9qNlVvYmtQdXlX?=
 =?utf-8?B?M0pDMkQ1ZGw4OUJmbUx0NkdGc2JZKzQvcVA2VG5VcVRpMEdoa25pYXAyeUVJ?=
 =?utf-8?B?T0JjVSt2N25tRFR4VFphV2lDY1lzYU5pTFFPN0ZWQXZJazNzV21WNkdmc0pR?=
 =?utf-8?B?c2tQL2YyMWpNdldxcVdTek9ySnBHbUFaaXhCbDVmeEJiTmQzcytSVHgzcVhT?=
 =?utf-8?B?THlKWkdDdGRJbHIyWVBXVDNFdUJQQjdKNXF1cm5LVG1yaE91emgzUFN2d0VI?=
 =?utf-8?B?SmpyRlcxMElWWXhEUVBUYWJUZExacWlJOE83UWlxZTlWbFV5RkVTM0lvemRX?=
 =?utf-8?B?TXllWU5mOUtFaUpjdUVVYkN5RVhpVGRwd3g5dmJNUGs2eXpORk1QVDVxQnlv?=
 =?utf-8?B?aHlLOGhySUxURGE3MXpxNG91SitYcjNCa1BZNGR5VExDQVFzZDU0cDVvL2pP?=
 =?utf-8?B?VHpnWmNEM2xjb2NxS0dPdG9id3BXY08rbU1aZlFQOUtsRTZZM09CYlFQczE0?=
 =?utf-8?B?N1lLNGxYN3hVQUVUNkxpMzVGUk0xL2xXamFZWk9jejJqTVNCM21TMktRUmhN?=
 =?utf-8?B?ZkNyUllBZW9vd1VuWUlLNzhLTDlXUVdwZXRVcTEvNlJXODkzN0hlMFRsaUUw?=
 =?utf-8?B?eXRoQVVqSDRDaXRvYXQyWFppQ2wyZWZoRjI5Q1NEWUh5RGc2ZzNlV1dBVDE1?=
 =?utf-8?B?UkRST2hMMHdEM29kTnBJaGJXRkM0WW9qaGJQQW5QVDhvU0FQYlFoa1RzTVNK?=
 =?utf-8?B?SlBVaUlFeVFvZUEzdnRPR0p2RkpDSktPN1VTQ1RLeTNja3cxTXA3R0xzVUt5?=
 =?utf-8?Q?VDSTL3o1rDbGEtxBg6SjHWdUW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dd72d8-90ac-4eff-7ee1-08dcff67ea24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:08:15.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /knM2CQuKSDlC+7TFOSfxkrDBA+cAJ2TO1GhtZoQbCsvE2eVKeCf/VDC1XzB/KIMM2qBS5f9aNVRd37VnPSGNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9120

On Fri, Oct 18, 2024 at 06:13:07PM -0300, Fabio Estevam wrote:
> Adding Francesco.

Any update from toradex team?

Frank

>
> On Fri, Oct 18, 2024 at 4:24 PM Frank Li <Frank.li@nxp.com> wrote:
> >
> > There are some dtb check warning
> >
> > arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> >
> > Can you help add actual pannel-lvds compatible string to clean up these
> > warning?
> >
> > Over 50 lines warning related this one.
> >
> > next-20241018, all warning under arm64 freescale is 814. My local tree
> > is about 138 line.
> >
> > If you can help fix this warning,  It should reduce to below to 100 line
> > warnings.
> >
> > Frank
> >
