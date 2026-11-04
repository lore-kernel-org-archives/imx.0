Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793831087;
	b=lwP++LH7dpkmHLxe+G+W598ooX1QB6pea+yWvSmoHKf2ux6951ZegJzDmut3U+e1+ixs
	 TFeEYpouwNY+SqQ4NUs6O/w54JoU/tJKGfwnylwVnW+fWV09F8RZ0iL2U/XDj4pKYdUIg
	 dMXVfWYrdhDxm/l4wASBPRYVZgPUkFl7D/gU72NEqCCOjfSdggUQxv+R6NXGyogAzRRAG
	 qySU++XDDHx4saR3czy38MUUOxAEuduQqhgBveL9l+JEAEHUOAY/kKED3Qbwm/xGQbn3E
	 4VyPoBkvwAzau1iYLPTD/R2Hctq0WGQ1HKQ/MHlxemTWYCgfdX6vRQbNcsv/Eb4AnKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831087;
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
	bh=dlRpxpTNXl3GQe2H4g9AFG8ZnOKEw87FZKj0YM0qOgM=;
	b=RFx8qApwizOtdSSUmJ6GlOEy25CIImwzg3eS4Gd7PAEHKycGZl9rAhqnnmsgcB1XH6TG
	 33Kfq8CD2pw+mkQ0S51tUmjGa3IS8hnATmZ1r2H9g7OSN7qtlqYLPGLvCn2mfz/sG0NrD
	 buS+hGFmbpAgFDunzIUnUTFjjx6JNtoqztmdw5syS2aCO0/fEdbrThCsrzYE16zD6+63y
	 2abxo4fuokldAcI7MW7+LMKHYqkPsfkfXofgEfkrI2SLLR7YxLVPxW4pNyHoCHspaCRT4
	 KbzDt3FUP6ObQjbCEQRBZH8ngbKqY3FXK8CscIy2F04PiY1uk7hotKADoWjQiFxM7iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L6vqVUOa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.51
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F516606AC36
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 22:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F516606AC36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L6vqVUOa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2KZWKx8/K6ZY4K5ccv5jRONGA8HBzhns+uebwb5meria3AVswW2Pv7dNEkRG+40c/LMSmmo2Kj3em61W3vW7Nyluy8+cEyLQwlENd8B1nNGMQoyOb7+ofQLHo1nXf7iStmzogQ8ojj9dC4OxMabBAy3d5wV9z784UJD6Tpn/hSXOS+EoKsx1WhlUkwE2xjsFEZNT/07IQfpoDWlISHAYM+btR+7GWxRP/uxsEvFtH4hNtldQCTC8VBiRRMvpUBIHW24L7CpYKpXF6ZQrGC9jTh7eLd/mjeKccxZW7fG53Kq+TBHPaeuPDxyvztndlUU6FU99Xjjh97cahs8hlwL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlRpxpTNXl3GQe2H4g9AFG8ZnOKEw87FZKj0YM0qOgM=;
 b=l1psvt3YdRmeey65mJddHQMp7/9+65S56j6V4rXQm4y7dC/nXXAi7FvAmtKVefFcmLlH8A20ZchjjiWsYxw6x68f8zYmZKKRNB5LUov7v6hT97jzSW5Mnugqjl/05niHyWFaKlAO8NZoPsB9rUgQMjgbPadVNzKpwAheQSMXxpuac5FB5tqhyclAUPZZ9+9ny6eYNcYHsZb8K9ROmhVW5aiMYwiidGyc7eDbl9AwQ7NAK2L2Njjt3W0y38x1aaaQ60jr7NpO45BORGjuNxSmBEK0/z0+hCY0RuCkg3i7eIh6FHY3G8lIQoXQdinflYAHrpQSSA6saARFX/FORNQprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlRpxpTNXl3GQe2H4g9AFG8ZnOKEw87FZKj0YM0qOgM=;
 b=L6vqVUOav4VvM5qKABREf7zMFuGCYNTS5hzY0lNhoZ6gyJScL2106r3/2MFBFGNnll5L8eUv1uL5mKt5FH2kg1UeZ0f8vOckFdQEaII3DrQiVZYhEaed+MJm/ZUf8wiOwVRGNiPCFfPJunTpda0zLsiman0E1TFG4T+w0nzYKPSorUm0Vs4BWDoBOY5d5W8vy3lI9cg65iSu1CQk5SFNSQsuJyb8w4zy+in1JCjs+V6nQVT+vlJAf7kl+tFhCAC+mD32DJzPnbbN2MeVFkpUdN786RCJdr6pxG9wBo8x46khPSs0x0YYN/DTtE5CFgaCAA0q/eBTXxlnE830D+vyUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI7PR04MB524858.eurprd04.prod.outlook.com (2603:10a6:290:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 22:24:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 22:24:44 +0000
From: Frank.Li@oss.nxp.com
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	linux-media@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Ming Qian <ming.qian@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH] media: imx-jpeg: propagate encoder command errors
Date: Wed,  4 Nov 2026 17:24:36 -0500
Message-ID: <179383105285.3936985.14458765816346694249.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012141824.497906-1-thnkslprpt@gmail.com>
References: <20261012141824.497906-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:8:233::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI7PR04MB524858:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0584a2-3e7f-4736-9bd3-08df3ac26d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|11063799006|261026140227099003|261022105027099003|261022075727099003|261102123227099003|261026121527099003|261028144727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	QgEDQdbL4lgxNJEEh3IVZgSNi9a6ZGndgnRnID6k4vkuGQABVq5XTyJxmxd70Oml+GJMtOmbqTgCazWnxEx1KOSOGzSk1sCxJt/dBlBtcZVtCwF/YAocqKct9UY0hEVL6BQJa5H5+T6t0ycKlzWZ3rbHNTrKZ32aIyVNix/2GoROkXTdDnFOIYJhlJPWh24EI+28B95hLeizddv3H/M4dVObMeR+8RkjyrN6EXUyLxsSc2MMhhj8fHxW1JxntAqjRG7GCZhw8CyysbFBY7X+Z5QuB0HkYNxogIb4h3Tabof01STfh54UPlDOeHsSlZ28lDd7XFXQqIB+KxargD+CksQUB14oeWCBMlNBb9urciHkDpMxGdLfX5dNGRbQ4xJlnl310redsZetK/+O4Y4PFq3Uf7PUYsLBa/SqP0tfP25JP+meYxWZgiKtP/wIctczHi1OFJplyRtTa/+zOQpx0GfSfxjWzP9dI0kcxzd6Efxo/nJQGwIxr2DBmqt+jJvdpITsGk/rCdzF7WKghGPFp8d8a2aBMC5cQpr1x3sXYLROrnqpquMIui43ywC7uvsk1CTcOkWc2vbJr5cukhmb0xWaiXeL3WLGPPnSrmTTtvV8D6mS617D8ZYUy7lDIv2SdGXb7JQLTDwlVAE4abAblcJ5XIqUtwwqYqOIAamy/5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022075727099003)(261102123227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alhMaG1yblJCcFNleG12Sk5FVUMvb2lnNHVOR0cxSlJ1aWJCWEd0MkpteGMr?=
 =?utf-8?B?K2JaZnNGdVQ0T1hTTzAyYkR0NmIrOWY1cVMrRlM4VUp1cXBtN3ZVMDFiY1h1?=
 =?utf-8?B?RXNLZ1hkZHpBVE9uVGpBU0V4dzhjTjhwOUl5Y1RCRkRQOFpJM1VXMVcyV2No?=
 =?utf-8?B?UndXWlg1a2NqUWMweXJxSkFybDBZNG4xY28zV2hPbkV1WE42ZmhPZ1FDZEJW?=
 =?utf-8?B?c2tXZEdOa2xWL3VJV1AwODFHMmM1UTB5RGlJOEtvRE1ITnpJZ0o0Z05lVzlv?=
 =?utf-8?B?ZzZ5R0o4d0RLay9ZMk1oSWdQazJqQ2UxUmd2bXgycXBUczg0SFZ3RE5EdXJB?=
 =?utf-8?B?Qk4rS0FvdnV3NE13Zy9TcXVHT2VESlFjZ2wvTTdUNldJcnFudVRpMm5UYVVk?=
 =?utf-8?B?VFJQTC9OZG5iMTI1SEFtN25KWkR3NkpTZjhmZCsrektIYkd3bzA1RXh2MGN6?=
 =?utf-8?B?eGVqZ2NZNzQ5SGp1UEY1a3huOTV4V0srNHFhc1YzcTVSNVBRWlZPYUpNYkd3?=
 =?utf-8?B?NWNOOVQ3QUZFSFlnc01zRGNrMTdHNkt6bEJXL09nZWkrT3djMVh4bmFwUG55?=
 =?utf-8?B?ZzRybTJmSHp6QzZBL0ZIdHU3bDV3SGFHS0FLc3dGT3Y5ZHU0dEw3MkNPQlMv?=
 =?utf-8?B?dkJybDE2RmZYSHV1T2ZmTDJzb05RQjhkaXV4cmdwTUJIbTRDdW9xd3czZExj?=
 =?utf-8?B?THkrR3hybDRQZ0JOZGZXNGF3MEUrTTRsUXVnY1AzcS81Wmt2U0pTQUt6b3dM?=
 =?utf-8?B?OWozYnc0SWJzbU1xK2R4VFd5aHdJY1RabUQwU0RkWEtWS0tMSHJCeW81RkpF?=
 =?utf-8?B?SFBIZGJ3OWE0RjVMU1pacjhnb2d1WTlyRkN6SHIzL25TTmdSSnYvY1BFWGRS?=
 =?utf-8?B?SnJ6MEdKNEN0VkVxQWxhNUw3UU5ZYUFhcmxPWTBTYXNsSGx3WVBuQlFJQW5a?=
 =?utf-8?B?VjFMUisyK29uNWZFd0lBV0kyb3BHcVlIWUZycWQ5Zytqcm1SbWJGV0ZrSnJW?=
 =?utf-8?B?L1habWp5SCtLalBGcXJ6VmF1N0VNSHlLaDVLcXVTK3l2S0RkUXBrb3hVeWFh?=
 =?utf-8?B?WXpyNGdacmhsQzhiUXVaS3pJWXdSRExIVjJYQnF0cE5lZ1hMbjhhMFdETGxW?=
 =?utf-8?B?Q0drdkJPb1RmbGVjVzluaEthZE1PN1l1K3ZneVFTQnZZUUdzRzIxeFBaM1V4?=
 =?utf-8?B?NnNoay92eFpwUjdjYU1tNi9mRHliMXYrSzhNQ3F4S00wTjdQT2M5RXJueERn?=
 =?utf-8?B?RzlnZnhKVXBFT04xeXlsOFp3L1l5VHFjUlhXK3hCZU5lVVU5TWFqRW5hTzFN?=
 =?utf-8?B?dlU2NU1Qa0NvcThxWnJyQjYzUy9OYnc5RGp1ZGFzOEovaXdVQi9kc0Y5bDJW?=
 =?utf-8?B?dE5PSGxaTUpUa2tUT1ByWHpSYXM1UGZ2bFo1Z2p4M2dZSnF4cVpLZ1AwVnhx?=
 =?utf-8?B?L2FwSWdiMXRQNjdjckNVUG4yT1pYRVFVMThJeVVIMkY1V2ZsWFNEMDBjNnp0?=
 =?utf-8?B?RCtCL3RYYWx4QnE0NmFjWEhVYnpzSGllcDhJUTk2Zk5idktFWSt3UjZ4QWJ5?=
 =?utf-8?B?VDdUVXVBZjZwZGpHN3luaGNldTVDdWY0aG96dUt3TXpxRVhUL2JscSsrSUJI?=
 =?utf-8?B?MW1UeGFFOTdVNXo0ckZsM3lRUnVodEJQZFE3WTlDZno0VmpUM29IejlhSXNZ?=
 =?utf-8?B?dmNwWGZBNHlQeDRyMkNucDdiL0F3Q1hkTG5obzdpcWhTM3Ftb1IrMGdpRVZa?=
 =?utf-8?B?RG1jNEtjMkhhYjRrYllIRm50T3RwZ2FBMm5KS3lmSUlCbVczcCtTZGpTNUpw?=
 =?utf-8?B?Tk5PN2xpQUJtdm9kMHo3NzB3clp5WVR4Yys0NEdOcmxRbDE5R3lXYUVISGVD?=
 =?utf-8?B?UVdVSGM5VVJMUXh0dWtTdGhEVUR1WGZLKy9yemxaYWdDUkFyQ3I1UVdaTHM4?=
 =?utf-8?B?aU0yUGRzUkMyYTM5TkI5NEROY2VUWWt6cFhuTFA1SEU5V0JiN2Q0TW1kMnNJ?=
 =?utf-8?B?c2IvVi90YmdseTZJNFg2R3VNUWxnSVdBenRzWExkMUVwNjBRUVN4REJPbFN6?=
 =?utf-8?B?NENSMy9NdW0yaFE3NUxIR3FsZlRCakVyT1VHUU1ibGdvSmRUUTJhNmFVcFdK?=
 =?utf-8?B?ZktHdFcyQ0pGMlRjK2FEUnhSbjdyWml3V2ZnbU83NFZ1WUk4Zm9aMVVpVFJj?=
 =?utf-8?B?ZHRFOVJRNzhsNTFOZmdNSG5sWW9sOWt0U1pQZ0lwL3EwYVhCS1R4eDVuaEhP?=
 =?utf-8?B?TUxVR3RJWTBrMC9JWWhRYkkxWGxoZFFOS2hGTFRtdWhCOXM5YjI2UU5tWktR?=
 =?utf-8?B?eHhQcVF3blZsZEFUM0JXZTBlQW8rTnI3MDAxOXJ4Y3FQVUNjSk5FUGp3NU9y?=
 =?utf-8?Q?G6tE1EeLeazkcFe1qRAekqzXalh7TCAzJpAGn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0584a2-3e7f-4736-9bd3-08df3ac26d55
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:24:44.3009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xsmD8MyFFMJ2zu3XlupThBOa70va8TI20zVuuXuI7OS82j6N7gMaROZXaJ1mGiaTzf2XV1iGhPhfvvxh3PSBG32emSClKrFVP7+XBtuv1qEiCNQ+beQQsJS66NLbw4T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB524858

From: Frank Li <Frank.Li@nxp.com>


On Mon, 12 Oct 2026 17:18:24 +0300, Avi Weiss wrote:
> mxc_jpeg_encoder_cmd() returns success when
> v4l2_m2m_ioctl_encoder_cmd() fails. When an encoder command is issued
> while the mem2mem context is draining, the helper returns -EBUSY,
> but userspace sees success.
> 
> Return the helper error, as mxc_jpeg_decoder_cmd() already does.
> No obvious reason to clobber the error here.
> 
> [...]

Applied, thanks!

[1/1] media: imx-jpeg: propagate encoder command errors
      commit: 9c309894703d7b539346d3a511ab4ca0ac30e952

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
