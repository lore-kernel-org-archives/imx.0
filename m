Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5FE2C21E6
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 21:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780348720; cv=fail; b=LBE91WlIoQt4oeVhG5Jy+zeSHl6QpuS8mL5y1kJ2NiFqdA6JLI4wTXiXQ38+uVGfcq8QsEsFxNC7lkbcpJPM39sskpR85kurp7NWckDOXrzYVXqM80UASkN1Wyt/IGqU5VAsXBPoorOewbMowtbI0rYeVKEnoX/lZhq/6IT4kJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780348720; c=relaxed/simple;
	bh=YtfvIfVoX3jakCA4F6r4VVy/nI7SCc8dZQkSZJJ15VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KNOuqek+a6PNz/dz1fg7QDmDEy+mQ+69UqjYBwZNm8UHbSvrkl/Ezxf/gbJNsgdv3hZWYp42detzgR77F8gSEHLC3/IoNu669ivW7AzDf4vcSLAUK2+96vzmqr47ZC8zajckfSZgxRpmiAvKMkQ/wtp+ICQXhjB++QEcowqM0RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lmkjcNQo; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lmkjcNQo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCZlXljkJTi1fDIpZgV4w81RehKsmQD01e8zOB2MsuqkO83Ne9bR6y2KyGtWAKm8OJlOmitKdmu2gTot9I0U+qK3/SiBAMZZomE/8b7/dcwfDRsJrYJFXK4EtzbFNf/M5qD40gWuyphceMROq3wLDLw5BRc1fG/NJ6fs561UCd6MNrx1VltaQnnOrnc5VG1fiMVLumVBzB6QYgkkWuhTd7dXW/Kn6y2LCOSdU4+1dJKSE3OHTKe7oQvgmMyWC/QQsSArjZnpifk4typv+348IkNi7wy8IG7MUQ9r+1z6NxUfU4+FlqdKNDsrJ8XnopIrXMssW7VGqq1TEuqTQxB+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJDw7U1kcBNzBmGJrbXZH5GwlVvQzfCWH/Z1O7W/AZw=;
 b=b9kpm49ISLzkazddjHm82OphFYMqMB7VtMQqfwxFWyT9Vcik3+EVLZ9/foTRomG/MP1jrzAwbdGDu9Ao/1zbVPHvdXY3COZKCNeQ6I9mKmgswKCVy7XiujrIXtZd798Cx3V8Q938bEQuZT3H4UB70ULxoG8QtSHsmR2g2Sv2uLSpjU5BQIkKRdhVVxmV+0uGBKOLqWVEU9abJkLQLARmusfHNoIMPMp4C+YE162EI96nbdLXpH4rs5aw08KV7NTdkLVT6PtTvrWSTOuK3pQsgs/TDfHihPniGVPYv38darb42GFOBMv2tvGcJVBXgH/dyKuD3ZYAFSsv9m2DYkNitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJDw7U1kcBNzBmGJrbXZH5GwlVvQzfCWH/Z1O7W/AZw=;
 b=lmkjcNQoZBqwE3MfMtnAR09yHfoV3bW4sCUiDujcWAanAGT5qxymNX9txSBKnQBu4XdnECoizaFbVCGLw0LRX+FSgT8U/a5iLStGWbnCbdlk0li6z3ZQ+ecqDQQynYW1c2ZURrnPLiqsHK0QvbylVNHJxBIqmvCkDfwP3Nv0P8XAtMYMN2je/THpmfoPhiLvODg7yqt6bX1Un2RJnA7vWHK6B/p1/wHki4AYNCRo72VAhGNPReS4qaXtIWwWN1Yaim+OWR2LMTVexbXDd6/+N3HnPQI01gddahxoLA6MyL2x23zgOFqYMyW051gHZSd4dr7FUa/syQQ007+HyDW4iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11043.eurprd04.prod.outlook.com (2603:10a6:150:21c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 21:18:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 21:18:34 +0000
From: Frank.Li@oss.nxp.com
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Lech Perczak <lech.perczak@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lech Perczak <lechu@hswro.org>
Subject: Re: [PATCH v3] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Date: Mon,  1 Jun 2026 17:18:26 -0400
Message-ID: <178034863312.618273.11214188705931804692.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527101912.14910-1-lech.perczak@gmail.com>
References: <20260527101912.14910-1-lech.perczak@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132FF.namprd07.prod.outlook.com
 (2603:10b6:518:1::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11043:EE_
X-MS-Office365-Filtering-Correlation-Id: bed56a79-dbc7-4b50-a072-08dec023564a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|11063799006|3023799007|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	OstKCvS+UbVikTV5N2Qiz8qZLcXvP9FrE5xKC6LSOvpLcVlcZyJ0Ei4hTEtGqxf4/cs8KpgWNEnSjgIilnocZzJHKd3gKh1pogwlsO0lfLaEn9a8CKC8NKqPZzqpuGH43pcB+qiVveWNUSF1mKz+vQP3/UB27I/pY+LSnXJvHtNPgqIvyfkHDSvIRBZEeDi9Tg10ZZRCLoaUe6eEmEBAK7FsFt5VtFE/gK79Cx1HAJr1EMe7XVZijmfncrzi3rpRpR5sGSdhm/fq9qc5Dx7GrL83vgMdP9FCXHrRwXgHfEn2zf7zd+j18Locrbr40oyZkmvK9GvXpd7EGexCvJCyTUVS4axH7yLN3fJ2tCY/71P+pmL4hMCCIYLJf1LVXHeFH35U4/flgipehy0aoOmi5+Za8UpnV+eanfFSiCiXHPWiHhhSRU21ZMjzHARmIg0Flf2G0Gw9JLJWt5qIk5uzxma4rIcuk+qgiJC3LeZpXQTblOCs5WaAEqiX+p65sdKty9kUlmAr3Uop5PYybKZv//yGoafjmPnE1DrSjnX2ff6NHFDuvYvHPqmwGafJyRit2+vC3WDRJ1gN8p/GGGnQEbNWObtdf6n6MHEGFn4V4FgWiljopdC0nPYYrnOyMugcqqzWkR2qnP7GI3FrG1n6O51JinM2NATJKPewP2OPLkMNWLd4e9GRJSaruj2lMgGH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(11063799006)(3023799007)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ny9XRTd5WXBrRDZiS0lrUG9zRWFHM0t4V0NMQ2R4elRmTXJobkxaQWNzd21J?=
 =?utf-8?B?T0NleldsZisvc0U2RDl5c2tuWkh5eFovTDZ1YXk2bjdtbk1kTXhhYitXN0hz?=
 =?utf-8?B?RmVnMDBlUGY5cWNya0txZVI2Tm5mRU41ZGc1OTRoUzM0MDJ2dnJBS1BxRktB?=
 =?utf-8?B?SmhjUHVNU01Nd3NhRFBwNVR0bzducnAzK0xrSTFxK2psQ3ZTMnMzK053SGhS?=
 =?utf-8?B?TkJ4WFZnNVZYNVFtNjNHeVdjZkg1ZERRME9jVTErL3RSU3k3ZWt2bDFXUEhC?=
 =?utf-8?B?aWtKTzhvd0VPSGI0dS9lY0hHNkFXNk45anRlRGhwQWdkK3JxcHlRY3NGcnI0?=
 =?utf-8?B?WEdRUnc1N2FYR3ZudGgrQnVBV0lubU1pSjMyR2tHZDFJYnVKSXhtRnlSc2lY?=
 =?utf-8?B?WWdWQlJYMjE1RlMvKzRVcXJxbFVJc0dQV3U4ZzNlVzJQR1NtOVJjRzVLdXVN?=
 =?utf-8?B?cStFYnBrU2dvN1VBdjdoMjdEZ2V2bkJzUmlTY0FlMldLRjFLWmd0K3RrSkdu?=
 =?utf-8?B?RiswR2M1M3lhSklKZEl4ZUpJd3krNVArYk52dzB5VXVJMFExa0N6MWsxT3BL?=
 =?utf-8?B?NXMvN2EwRFZRbm5WWk9Id3BuWWp2K0w2aE5EbVYya0FlUm1VMHlGcVd5T2JW?=
 =?utf-8?B?MjkyTjg5a0lJSlp6Sy9xajdFWm4yUzRaekVlSWlkeEJ5Z2xwRzFOV2FOTTVn?=
 =?utf-8?B?cXBqeXh1MEt3a0JlL1FxTUFZNng1MXdlRHd2cUg2QUpUV1MrMzBLYlUvd2hJ?=
 =?utf-8?B?UlFwUjArVnc1dGVBY2Fqb2tTL0FCT3NlT0JLdkZzSWRTaXlFZEZWY0dOUk80?=
 =?utf-8?B?QUlqTFkyZ3k4R0pEZS91NlY0Z0pMbXRGaXlPbmU5eVVDU2RTeHl2YmdnVEl2?=
 =?utf-8?B?Q0ZwMlBwL1o5UFJpcnQ0TjlaRWppZjI3MFF5Vy80TC83MnBqeU1DTUlDK2VD?=
 =?utf-8?B?Q053c1FXYjByTkwvOEw0eDhtQzRpODU2ZmVBUlF2T2N4Si9EekpDVTNzZGs0?=
 =?utf-8?B?ZFlSWGRHZEh4Mzc4SnRvMVZXc29qT1JJbXR5MGdpWVVSQ0R1WlZKSXRFMkVY?=
 =?utf-8?B?cSszVURrQjlEN3dkT2poWVU2dVBxMTNBNFFIN3NUZzNkL0RVR1MzeFlqMGZi?=
 =?utf-8?B?ZE96NEV3d1B2ckRxQ3dJM21kdEF5NW5LOEhFaXh1VnY4K2t6dGdmbEVWNktS?=
 =?utf-8?B?U3RxOVZTZkZNcEFmOUUvSkZjZmZ2ckVzNVB1cFcycllIa01pMEU5bHNyUUJE?=
 =?utf-8?B?K3Z1ejdGM1BBKy9wTnE0b2hDTHNSc0JDZWpld2RGNU1SUUVNQ2pXRzVlUDZB?=
 =?utf-8?B?N2N1ekdSOEp6NkZldjZYQkVTTTJGajM2V1phS2VQSVlpNTlQTmpYR0JTOE96?=
 =?utf-8?B?TWtiaWRCWWw0blRIVndnSE0wNTFXUnVqUGdINldtUEtmcVBuY1lNMnNqTkds?=
 =?utf-8?B?Wm5SMHU5K2JieVJpa0NhemhleG1CUTVYS0IyV25HRkFhVGduS25SRXBxMUd2?=
 =?utf-8?B?bHpuM2pkNWJpTk5zTG9RMTRsSVk3UWVBTnFrZC9WQ2Q1eTg4M0s0dVdPUTFu?=
 =?utf-8?B?MkRkY0pnV2czZ00ySlNDc3dBSmZ5TGRNZmlTak9IbG15eUhyNWNhZ0EwMTNK?=
 =?utf-8?B?WEhXdDlLYTBCaGYwQlpmZzEwOTdhY1o4VGpFR1IxN3VGdFc5MWZObGdra1NE?=
 =?utf-8?B?QytFYmNZZlA5dWdnWXlGTVBULytSVFlDcGIzNUxra29EQXNjZ0JCTjhGZ2wv?=
 =?utf-8?B?QUg3alorZmVoMmRGSWoraW44cjhSRzdqWHZvV0RnTkN3SFh6aGlWSk5MV0FU?=
 =?utf-8?B?TGxrSVdXSGJ3QUxXZkpJWGxRRXE1K00xTFlmTnlrOVo4VmIvRTdTbC9KUWdF?=
 =?utf-8?B?elhpeHdPcmhlTGRDNGR6MVVuOXBWSHRNR2wzUGV3cVYvUXVWWitXNmt0RHUz?=
 =?utf-8?B?WkF5ZmJCK25oTEtsTm5OeEtRMldBRFE5TEd4U29VcTVtM3pkYWpLRklIVlBm?=
 =?utf-8?B?Vlo4aVQxSW8wL0ZRYW5GbkkrSUpXZGlXNG5hUHo2VEt3cHptcGJxUFU2Z0JY?=
 =?utf-8?B?MGkrQmg0NUc3KzlhcSsxWjBzbHBRU1BGbXFWMEorUTl5MGN1TG9oQmRPTC9B?=
 =?utf-8?B?emdNa1hDQ0xocHlLeFN0VkwxT3k4Q3NIeWJJN0E4MnZZL080QUtkV25kaWwr?=
 =?utf-8?B?SExnd0hldUJrTnpLWisvZk9QZGR0RUdOTWxIV0VFSVd0QjZJK2ZYR1JTcnhD?=
 =?utf-8?B?OUZac0FxM21PdDluQmNlYzgxalRmTjdYL1c3dE1jcU1MMXBHWU9CcTZud2JZ?=
 =?utf-8?B?N0wxUFhGLzhvVFlwZmMyaWVhYnpxRkhMUFVwTFN6VkJNUWsrQUcrbEozWHdD?=
 =?utf-8?Q?Mocax0fIgooVuFXY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed56a79-dbc7-4b50-a072-08dec023564a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 21:18:33.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHZLGzGilrv2dCz7JXhG//gLVvMvTHPUnquyBnH01dKyC7VSPKPo0TTWWM0d9r/L57PlbHBoAuy1uZmeheun4Vd+URS7uOYC0EHtGqIhYVc+H0nteVr3wZh+YYS4RS/k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11043

From: Frank Li <Frank.Li@nxp.com>


On Wed, 27 May 2026 12:19:12 +0200, Lech Perczak wrote:
> Add OV5645 camera device node and enable relevant components in the
> video capture data path, so output stream can be captured, and the
> camera itself can be controlled over I²C bus.
>
> This is roughly based on descriptions found in downstream kernel tree [1],
> adapted to match upstream bindings.
>
> [...]

Applied, thanks!

[1/1] ARM: dts: imx7d-pico-pi: add OV5645 camera support
      commit: ddcc0ca8809b4fe5b80510f611eedcc0679abe5a

Remove always-on for regulor and truncate commit message by remote testing
part.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
