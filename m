Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B613451CF
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 06:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901807; cv=fail; b=RwPB+x8Xemdyd5yXGnmEVDI1l3vIazstt+AyBL3C/gj7u81fcbKmzchTs+cllmF46xnV2rsDWYtiMSmYsh9A6+YB/7YIJblv7uTrn7YJX0dkoHFljKb53o0+KBNn5Iu1vpz1Z1U+kUcOzpjjThxtTorM0fhyeDMqXP3xPHkzwUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901807; c=relaxed/simple;
	bh=zgSMC783ekID2iMZS/ciXQ40YRkdYQ88GanGBYX3FDk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mCX6RC804kmV8ViuscGsmoX1MBg0Bfg04r/oIOnObty7E15ntup53MPNOktcLF50x1Mfs1qmV0Lf5gpGkNlwq//s4reYtZmaW61xJDaAUDNPUmTxCRcol69QhtJkRsZHUtix9W8TQ9g5dyywMDeuXU1YWJ4QPe0/HildeshHul0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XZyaU7kh; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XZyaU7kh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k468Ft2srS/N3jk85KgIFBlY6erILGBzYv6zfbl17giLKampjlgQOD4SHGLdk4JGi6sJTBtV786+oi0FWy5ce8aXsp73RYKYQ83P4Pm5wfVEGRfk5DRv13BEMnt5WsXw6vCGP5o0l95929bldh9DNfakXjTB/JVOiunQWs6jSJiXB4ngsxf2OdaluhlpAkC2HqAefj3l8thHqP2etcDAP3M6eRrKMAoVOS4OO20WoXadtxZBquZE/bVZKV5FxYAzLmZidRkEEg+Fab7nbKmycbZfIfuldthJ1vbHo8iRKN0F4nhY9rBgP8HNw0npl2McCeGEnJVv7rzZhbGdURTrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgSMC783ekID2iMZS/ciXQ40YRkdYQ88GanGBYX3FDk=;
 b=GbklyaFnQBcjn2f0NmV/34UQcLkf+2+44w5RfzSab73ClwFq2XTLMvmwVGC9/+1davU/pRyEpAbep7qAaegzxM2YJx71jn32Taj0q13ZQTNas4Z7TYUm7MfTI8p5nuySZa/TXY7lyuCYUH62oFiUVG484My43g8rx0sHXK+mVIJd38rIv8+Y+R3HwBjF9DEiEGT2197b1TfYmbV+wlvAqS3twem3MkGvJOtUpNez8615XDyTUs/XOw5iPV8PVl2GlcQepYw6j7ybVbzg0+oYm5xCz813RsHUG7WsBATQLyJ4+OLf3CGY7+vpVasXN2+TCzmQrIELimlyng+Ak25vCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgSMC783ekID2iMZS/ciXQ40YRkdYQ88GanGBYX3FDk=;
 b=XZyaU7khcBZtI0wi61s4nRLEfGPKxeGkfotX/vJfzdAQ6PEGEDWmsDqrxLr9M2aajOMFaPa7UC9TZAQZnzHbRAA5I/0G79UDvxkTIuh5Ugs/qvSb1WJHTQG9PKNSzMNo0aKcVfRKMXcwthzQx7ipVNPiMZQkKOWk4aatQQdIU8mMuh//jmKpGve3OmuC9vKfA2h7rYPeTITT+Jg/Sk+/iU+7VYvX7T/LiKYlWvgml0080nX2L9q5YcnfE3qsRer5Q/TbayPEX/RaqMEQKPnFJdRR5GZw5itGz/m000kEdLMkcYNgomniiCN0k7MJbjesq01p3oYoJ1vKL/0BzRZUow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 06:29:59 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 06:30:00 +0000
Message-ID: <cd5ef40c-f8dc-42d7-a747-5c20e37bdc7a@oss.nxp.com>
Date: Thu, 19 Mar 2026 08:32:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO
 board
To: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
 <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::16) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM7PR04MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b9bb63-dadf-403c-80e6-08de8580f28d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c2hDdJyLRKOAABhGokJJU4a/+0FAidJIUogtDJ8E8VjFxOwLujfSAPRprouGSDdY+PereZsExqPNbBUOFvnRt+/UlEsVC9LBkBMAlhV0SY2xLNstmyvuNr+UudvhJ5UDwDIfAIoKQ71AUuw0HFI7/NdHuJDwkwIS3NgMOwF7iQvJgjQ6DK0aEYMtBtr3+NOgLYTbLUYnKuaNYkV6Kw51uKRidAKsosBcwWOQNKJ+F+Nby6oJd/ZnRFpTEeuyh+26b7DXUaE97jTU4ZlJCMUUBtXswgh59MvVS3qeTWcgtKt2EOtV4SQFYOI4mIpx1yReJ8ULzVAHl7UWBwQ/0Ae7T/tV8YnIRCokTGlQqO1hlUV7RC5zV2ZQRwc7kdlvzxJbKegkE7p+d8o1hdBpT9Nguz98DN2LpccdsWRfkxtCqxfCpnxKGpdOah44oKHimxPMKKvcX1uwGxn2kFBDtXVOJtAsK6W3WUhEVtxOMVHRagEwEqn3YHZ4OEPFyVk4cGVHsHey5SDLvaPKe7skM+CdNVL3mPwIZBzo4Vex0DxOAMq+7PzTRsoPs/a5yaTO0NBz22UIoqiDmVB3w0U6f3IVwtjvi+RT+Z6ADWXUZ34DXB4jIVN/YJEY59IeL1uKXXCsf/i4GiwWSrpwpk/KIkx14NLh4nYntGQ2prQxjglpONO0RQdghcWlKJwihlK8FwswV8hVpw09iDZTtxyEhqNovAVElHfqZefuhpAFt4YT+Js=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjlaQVc2TWwzR1pmblVOK0h6ell1aVpadGszOW8rRzJEeSsvaXlramE1MlFh?=
 =?utf-8?B?TU55bHU2d1k2L1QxOTUwazdSR3hHWWwyZkZCSmRUNCtmRDhWNWtkOVE0NnFL?=
 =?utf-8?B?ZGFlTEoyUDdPcW0zZjFHWFdJWmkyTzdVdkVSSkEyVlRWblhyNldTLzErcjdV?=
 =?utf-8?B?OE5SeXp2ZTZGejVURzN2Z21Hd0U2anIvdzdXWXU1NDV3TXp4VmN0VU5nbytu?=
 =?utf-8?B?RlZHWC8xSkRaRXFER3o5VWpLOFNLb1FWSitqNi9aVTBZTWdkSU50ZTlqeG16?=
 =?utf-8?B?MUtmSEdiMUtPbTVlaUxxV2RscTh0a0srclRjRDQzSnNudDNtZ2NneU1jV3dX?=
 =?utf-8?B?U1lSUmZQV1M5NGZIdURqb0c0NkRveElyZmxmQTJ6L3VMQStaTm8xa3dBbDJN?=
 =?utf-8?B?VHZuV0dKSnl2UzNyUmFoMTN5ZC8rTzhYMXVQWlRGVjhzbjlhcDJhUERPbWY3?=
 =?utf-8?B?S1R2V1BNUmtzSmU4OC9HT3B4OWlnbkxpWHpENUdYOWE0YVBjWHpza3BSOHNU?=
 =?utf-8?B?bGRDMEhtSUxzdHZPSVdsenhrOG1NM2ZsM0ZtNlE3RWRtcDFtSEdXMWtsWnV1?=
 =?utf-8?B?TG9vWmxpZmc3eEhEdWwyQTdoSVkyVU5ENzNFT3RPZU01RVBHNHJwdTRlOFFK?=
 =?utf-8?B?T1Y5eEhWdnlYaEUyZElzUmVldCt5RFIyRUtnT3VLcUlPYjFCVUlTUWdReXlZ?=
 =?utf-8?B?TTVUWWpSczJhUStXU0dEVk1DVlFxQ2xGWDd0T2tnWUZxT25sMEZFS09zUjlD?=
 =?utf-8?B?alNGVDlvOU56UFROWWVjSnhjT29ZL2VkalFpa3EvSm5Vb3krM0ZYWGx5KzF0?=
 =?utf-8?B?SkJ2azhIUXFLd2Z4aElWQlFTMS9HRVhlZkltdnRzL3ZzbnMyL09FZkJvdHNy?=
 =?utf-8?B?T1dIclFMWThwbVYxS0h6MDNMRGxrNkxDYzJua1hBeEVDWTlwZG9DQnRBSGJF?=
 =?utf-8?B?ajEyUnZNcVhGV2F5YVdSaVAwYVZBaEN5RFhlNmVWUjhtdGFhVnRtcnovNk9T?=
 =?utf-8?B?eTBUOEVvdUFvdW9ITmpBMFRCSE1LUU4vSUFYbmFaemM1MkduM1lXejN2TFB2?=
 =?utf-8?B?YlI4bGZkM29PTXhFcS9VYXNhTi9nR0VTVGVnVTVia1gyRFdrcCswQmlhMDA5?=
 =?utf-8?B?NE9DMlZIT3hSNmpBY3p5L2kxYk5pUTRMd3NFaE5NWjFWakRWYVlCdUQzeE1q?=
 =?utf-8?B?ejBQUTlFMGgwVXROWXlMVHBDUUZUZllGa3Btb1Z3dFBGZkRIbWQxdCtlWTYr?=
 =?utf-8?B?TEZDK214NHBwY09TaGVxeEZJUW9EUFJOeEEwYnhvekt4cmhOdWdjWnRraFVz?=
 =?utf-8?B?WWFpM1hCNUtXdTRQdFlNQzdhRGg0TFhuMlB4NEtOb3Q0QkRxaDhUV3RCUnQw?=
 =?utf-8?B?Z01yM0Z4Mml5UkxhVlY4TFVWOWQ3WjdvMFJEeEJWWUkzUGYwcFE5V3Q1R2Vi?=
 =?utf-8?B?QTRRUXA0RDBlcUkrUlNEb0IzVCtxd05MYlFSdVBJQmhJYkszMUF0Mk5DVi82?=
 =?utf-8?B?ZGsxSTh1NDhVdGtZK05CWDhvL0EvVzdRdm9lWG5qTnQ5cFNKaWh4NWI0N0l3?=
 =?utf-8?B?YXAvV2JDSVlyTFZHRGVpZHMwNlQrYzhOeEloZmlUd2tKTnpXZVZYYk9wYXV1?=
 =?utf-8?B?dHJjUnZ4U1hDNFRudDFLeUdYZmpRU1hoYW1VM2JKSG9FK3hyZlRiQjJ0UEt3?=
 =?utf-8?B?THhld1l5Mmo3SHByejZDNTkzdDhoalAybEtsRXphY3FpeUxqazI0RnRZeUhk?=
 =?utf-8?B?SSs4Mm1TQ214MVpBVmFFRnFqMkRGZ0ZBN0IvUzArNVhzS21NYVFhQ3lMRjV2?=
 =?utf-8?B?d1FpbjZ1UGZINVFZcG5vbXJBSTNQOWdCYmZmcnFRUjBDQXI3ZUptSm0zYlN1?=
 =?utf-8?B?STNhdDBZN1BIVWdIVnEwU0tGUTZPSlVETzJrcmU3eU1sL1B0cG41Zlg2eEdz?=
 =?utf-8?B?NU9MdjgrSVpOaUcrWkYwMGsxamo2RU1KNFdQTWV0OWVMODNiM2ZYZGtkVTRF?=
 =?utf-8?B?SHZFVGQyamxOaE9CM1g0eHFobEI1ZUYzQ3J2emw5a2trSHJhcTVXTlZlc3A1?=
 =?utf-8?B?OGNKTThaUlBWUXdydkFDRlY4OFU1YXl3ZGQycmJxakZ4SWtyc0FQQlhjQUdq?=
 =?utf-8?B?NnNKT1dDMElXak9zNXh0SWhuU0tOTURsc04xbFJvNW0vNlBaNmVPaS9Zc050?=
 =?utf-8?B?bWhDdmJtZ3loZHhPSUJmOHJ4SEwrYUljVGpuSFZHa1J6eWdaczY0L2NuUEcv?=
 =?utf-8?B?bm1aMG1hZjk5MktMTU9zbzUrOVYxWE5CcGNTS3gxOVZZYzZRcTRlZkVORFQx?=
 =?utf-8?B?S2x4N09aT2FGLzRUOWFmaVdGcjdVTVI5L3owVVd2OU5sMVFERzFXUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b9bb63-dadf-403c-80e6-08de8580f28d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 06:30:00.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO+NS0XGHCivrpCU9ngNeIXxF/FCLO/8Z7yzmQ5owoS8sMybXT4JTON6bwE5OqZlK0lHuPOCEmvlwWp1OkpjRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160

On 3/18/26 10:04, Joseph Guo wrote:
> Add the i.MX95 19x19 FRDM PRO board in the binding document.
>
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

