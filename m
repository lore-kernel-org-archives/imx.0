Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521025B0B0
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752713; cv=fail; b=Ms+cFTjcSUUzXGGm+rdowvbSq3lAk/4EcMYdR5rBtTuXJPzGkW7whoH5cCcf6qi6zkH2YZXry9AisafE6E58wS7Izz2ZG9XuahCeQiAyBUftRMcUxidDWGiElVJLdkRQCsmT6ybR+WhPIMrod9Bwy26m3JDuZo8EUyRNsy1yZG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752713; c=relaxed/simple;
	bh=nB2xbILe1SFtd02ix6qXVZfi2Y2blk2Ib5ToRq92hBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HlA3psKsgJFmJwpROseXsnd4ZtZZz3FW3cQb1U8zEA1BoggN+YjnGPcGZcU9UoWR0XTmptSCGyfXcmiTyQhwJ7gEW5oNqhy97G92fc0SeAli24esFZVVzvNX9TmIoyATqA1GUyBOH0LgKGSo+wdHzMNRMUdKNRYufJwrv/zto5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dSpzEuif; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dSpzEuif"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIClSSaKXvBiVeAft6KFvlMnHe35I+wpSFbTJk2StZ2w50BEhW+VxZuEAPuGd7Fj/tPEuxI4ZW8mUJFq5fpoN+f/ryIhFwAObWe0M/zt9iZuo95t1tKAVCVcMG/HrLg4K6rL75Wz/o9ZjPBf1jScUTPjnUUHYLAuX5IKzz64h7hAiBw+bEzEQXgUkDEn2rD9XTwHrbJwkcX5LFoEytlPyGX6WFvAQFRo63niIpocA0L2DuVRkOT+SFrtbt6H4WR6uwh7aSfNB3EUhiqdZ3X1H+BY5zlIJ1WWpQ2W0duPfRLKMyAi+Lgo5U8OErh7kJfWdYVJUDfi8bk5jmM79YDxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksmWWufbBBu91zg4BPPvwDZNGhcIlTpl6ZERvxDZJOA=;
 b=xDuPrzjBRGIjDLwhta53rA+IR71bi9+DeiGAsSW6ZpUk/joFnX3vGIA5Hd7eBRsA10taczqJkqLGX41FzVon9F7ccvq4SE1JSN0CC+qBf96irbTGJBttvhwH8G8MfN9g1Hctf6X4RSHlgIMAxlWLcnLMasue2Wn7U4dVfMeeN59J5Tthgz/1WrUTmxOc8P/NeSZiFTDw+JCG7uVgcGnM05r9tNfNthLtkr1jxrnKMKXD2x4pnVgfG4fg/6rHe/aD5guCmJ/A6tXnKoTO2AkIzXGCxoGHwOS6Jx75QLAmpeexOZ1nl9DefOzONYCUY7h6XoDHMgzg1mYHFLSw6blYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksmWWufbBBu91zg4BPPvwDZNGhcIlTpl6ZERvxDZJOA=;
 b=dSpzEuifoaYsd+Sdan4M9qPoJvMZUDxO4es3p6URcWOAb3JGJPX4wMDz727eSGRYgO6RqG06DRnG96TfFioF+8NZIIrhyG586/pIo/cz8LWikbFwidcM+XGg0byPtfyeZk3ONEODiK9cCPGvQzyZdHCeYXbOhehuInz+0sW+1mC9Jwa9m9Mp4deMrvDZZc7dM6sHJEGq0RE9LdwiTm//vOjtdutbcqx9nBrX0NgEtOhIj5HevKym9y7uOVfiEsVVeTfUOZjLm0d1ucB7MvTpbLOF1goWO2DKYtvRUmwE3aL08jkD0s6sz87Yxl8KnB3hAnAH9p1ciOWVe/NkO4mRgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8495.eurprd04.prod.outlook.com (2603:10a6:10:2c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 17:05:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 17:05:09 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Yuho Choi <dbgh9129@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: imx: avic: Fix OF node reference leaks
Date: Mon, 29 Jun 2026 13:05:02 -0400
Message-ID: <178275269810.2309582.15351984682673633353.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615174535.701013-1-dbgh9129@gmail.com>
References: <20260615174535.701013-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: c97c5a45-3d3c-4119-9662-08ded600935d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	6EFt/VDdh6LTir90HTlr2RsH/AXwU/ea1OBv2NaliJNLaBxzt+P0Z+aA27SKOnxSvMM7MNEN/tRljlzS319TW8QUDZfNo9iMcRaPftTXtjbOumsyJ9Up/oOlUJDtgrbEsueNBf7j47EjS4TMTM2o1AWOvg6tXNh5KBMS2f6cH5wmfDBzwrbcs1fX54F7O53SztqV7wK7+eySVgj5gt34K4nSHvk2ISBF1KR4DINWoY2C/aFL0IuPRr+1M1GJZ36Mdmz3nsCYH5nnvaYqq5u5rxk7+ihDWxKmV9vVDp+Nhs8A3sAgon/ghdAdg1xcrQJ5VIodf+swZ/hpgA+fL4gT526zJB5pT+3Ld4HyKHUK/Mvq86YxIf+B3f3BUHFeo173CH+R4Xkrb+oER65ttepZSmtO+9Mvv62dl4Ruqi55ebV8aI+WBvy3Ywwqoszxh8bo4ynV0bXAEEZ5vqGcd2vPWIub/Rw059Jq0SobM66cI0gmG2f5oWamtfqeA59ZoSgo1moheTN8dBEOKKmryGpUBrTyFkQggA1gyCeU+tJzh1qnrO4dV9VbtNYU1D00ruyWyyCAVSgJad31aUbo5/wRQvHHkuZYlmvrMuj1EVnbQVo281jfepwDu4wvMs4e1EitHu6ormWbE6zKF3EhqME8mnlMl3IkFnoOdEIGYHxw1Uc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzBCaUY1Nk5vWm9vTTNLUndKZmgyemsxMFZnOWhGYXpFZmxWV3FXLzdPVHht?=
 =?utf-8?B?czFEN0YzN0xYSWdYWElLR2dSd2RBV2Jxdm1mdzRkaGlpVWhoWi90a1B0aTNa?=
 =?utf-8?B?ZEgwTXNWcU5JR2Z2d1ZDVS91QTI5K09vVm1GVHRQN24xVGIyRTB5NGE5UW1L?=
 =?utf-8?B?WlZKaXFEZzRhMFQycjcwZWNNK21uR0xrYzNLbzJCbk9GdnUvb2IyaUt3MHh3?=
 =?utf-8?B?b05XbDljVGt3VFUxQzlxM2cvM2pvbUlObjlVaXJZbFF6MGtWcm9QK0ZKZDFS?=
 =?utf-8?B?VEF5bHBkMHAxeU1rcWNJRjhSOE54ZkF0WWEvaGk2WHE5QmVNaFBaWXFwRFBD?=
 =?utf-8?B?enowNmhXZ3o5VnFsa1NEOUFmMStteVhZN0ZHQ3dBR040ZUlpL3lwSWxJVXhJ?=
 =?utf-8?B?YzM2SDNZQmloUDdYTjRLTTJXWVkwTFRMVG5mWFk2VWdkek9DaTExZUlFTzdw?=
 =?utf-8?B?SmFnL0pQTFl6Y3ZHSkhJck9DV291bWVzdVovei9MQUwxbGttbHpCcUExblJJ?=
 =?utf-8?B?NEVhU0hpR3BITitaaTNOdTIrb2lndGpSVFU0UTk5UXRpZmg0YmR0K2luVTBV?=
 =?utf-8?B?WVJUcWNtVy9tOXpHaTQwRWFwTGg0dGlTcE5GN2lDUWlzMXZjNURhSmRNN2dF?=
 =?utf-8?B?WENrWStiMDZOSmtwcGFBall5OEdJaGV3Q1ZTR3BUUGh2THk3ZEt2ZFJ4SlZZ?=
 =?utf-8?B?WThDc3hXRktieXhQZUx6anZoaGZWQ1ZFY2d6NXJNVTJVTzg0ZC9XdVpZUzFv?=
 =?utf-8?B?UDU2Zm0yR0VJdlVORkRHY2dhZ3JpY2pMQjgrWnd5ZDZyYjJNTHIzUUlOUVNX?=
 =?utf-8?B?NlQyS3RxS2hhVmxWMFJjVnk1ZUUzY2hkeEYwdTVwdGtOSkt4Yk5qdm5TYzBS?=
 =?utf-8?B?UVFPL3o3ZlhsbXBDU0c2UWdWQ1JlZUgwUDE4eVI0ZXNHYzJ0SHBTb1pqOWRm?=
 =?utf-8?B?SkRMRzZpWDl6M0s4cHFwQ21ob1QrbzhMMDg5bnhCRGRYV3dHZURuU2VId3Br?=
 =?utf-8?B?M283MnJKYUtEUmRaL0sySzN3bFFDcm10NGNFbDZRcDFNTTAvZ2xLODc5U2tk?=
 =?utf-8?B?MEpJRFZNT2owMDdNTWRtUHVYK0xkWDhFNkNGS0RJOWdaVklZZXQ1VlY2YlRP?=
 =?utf-8?B?VURVVitwZTNEbkErcU1zczJ4SmFRSklMSHllNVJDMEt4M3crMS9XL3dHRmlr?=
 =?utf-8?B?TjhvSk41NVQ5SDBmM1BoOWVJdTg1TlRhd1BuUDRqV3I1bjNQMnNIZ3JnZE9U?=
 =?utf-8?B?WS9VQXNjeWZhZWR2NytqY2c4RS9IdWI0dllONnV3MFhjWVpGN1VKRkFLeXRP?=
 =?utf-8?B?QlErOWdSWTFBekNvaDFaMlZzc2NPbFU0a3RucWNqQldwWDBUS2RCVThsUm9X?=
 =?utf-8?B?eGlGTDZrR2FrdDM5UHVuOXJmZzJWOWl5NjZBMTBBWldKVWhzTTJrK2N6YXp6?=
 =?utf-8?B?TCt2K0NBVGlwY2hxUVR5Y0lVSWptQkdoUFR5MjQzb2UzZUVDQ1lQWHZjNGsy?=
 =?utf-8?B?cm1ZbWpOR0NaNk9NZUI1WWlIZW1GL0NjeG5LYXJObmVMb3RodkszUmF0MjJV?=
 =?utf-8?B?QzNZM0t0RDNHbGhreHVaM1gvR1lEcTRmWDJYOHFFNmMwazlWT1NMWWxtUml2?=
 =?utf-8?B?WC9HeHkrcU9NSlhBU09GRDJwL09Kdk1NVVFpdXlFcHpkU1NiUFQ2cE16WGEx?=
 =?utf-8?B?TEwzdzdJb1ljVFIwV2k3a1dQTW9WdWI3Z3ZseHRYUFBmNGJWRmRjR0kvbmxr?=
 =?utf-8?B?aXduQlBObGJJVnRYdEcrUzhHOEtYenFrSlhjUEJ6YlFrWDdYWmIvQU11bCt3?=
 =?utf-8?B?NU1aYkZWSnIralBpdnUyNDVvZzF5d1FCMmpTb0VlQmo4Z3JJdU9ZMVRxZ1c3?=
 =?utf-8?B?aUxCY0wrRDU4YzA4QmdsdXlkNlZWNHRiSWhtYW1MT01JMytNZjZxaHI3Qlgy?=
 =?utf-8?B?M09PQzhKd0dWem56ODlRTVczVVNSQkQrUTJyMXZHSEY4TDFBM1BOMzJWcUFM?=
 =?utf-8?B?c1V4VFJLeVJ0MDZLT2xaYWpxbEozSUJ0c3FUTHZhT0VkZ1pXS1hKRzBYeFg3?=
 =?utf-8?B?SkpHWHBiWURnek5RT281clhsQ2RSZkttSVcwZ2xqRWdsUUN3M0JBTTRsMDV4?=
 =?utf-8?B?Qmk5SE4wK3JVS3M0cnIxWE1EcUdoUGZJSDBPbCsxd0l3OFF4RTAzRUdKRTlx?=
 =?utf-8?B?d3ZUTFJPSzBkVC9JVWxtL1lXN21HZ0oxR2hBclNJWG9ieHYzd1VHTU0zYlVr?=
 =?utf-8?B?TGhkSEk4b0hEckk5eXpTNEFkc2RZR2xtY3IxMlJkN1ZOVFlaNXE1OW9DNHUy?=
 =?utf-8?B?UlZyYjdOSUdSQTdhVkx5TEpVOHdBL2ZSdktqR0NMeGVyallsY3VKWC8rc1h5?=
 =?utf-8?Q?VXQmPhQ/ZSS27tFIx3Gm65f2OGzlLZS47Z5Ib?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97c5a45-3d3c-4119-9662-08ded600935d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 17:05:09.5562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nZ25XVCx/iJJdK2BrwweiXdwJa3rgfRFYDK55Mj1RMKhvNQ/L4YX7IiXTHzjD4TuZJecPT+ToUgFuzpl/paDH5ssJ1xRCfvWG3X1MPRtf3G8rCi8CMg9Sf09uqV19Wz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8495

From: Frank Li <Frank.Li@nxp.com>


On Mon, 15 Jun 2026 13:45:35 -0400, Yuho Choi wrote:
> of_find_compatible_node() returns a device node with its reference count
> incremented. mxc_init_irq() looks up the i.MX25 CCM node for of_iomap()
> and the AVIC node for irq_domain_create_legacy(), but does not release
> either temporary reference.
> 
> of_iomap() does not consume the node reference, and
> irq_domain_create_legacy() takes its own fwnode reference for the domain.
> Drop the temporary OF node references after each use.
> 
> [...]

Applied, thanks!

[1/1] ARM: imx: avic: Fix OF node reference leaks
      commit: b24c12e1bad863d27141e4e9c19d25eebd68c4a6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
