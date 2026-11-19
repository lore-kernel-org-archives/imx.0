Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795120686;
	b=D48L4Yk+fpssZmGABpe26Ct6IxbIF2/DZ52RK+YPMsBReE3GvVQhi0ptiw923pF3sa8+
	 wGPwzIX40Iqf4ZUEwlrYsJFfiVeUKfK7prZDWVqF2QmU1qaygzMm9yDLlcLkv7xBgbuh7
	 b9KmJEsKvts+JTSrz5WNlvr2bEq0yjLxXdzOeYnUe1xnR+l0rWqvX16D4MpBq60G9GWAs
	 qofz6PBmREfN31cZGVGQR6kZozfL3SbQIGvYZmnPJsZvjqyd/dOpF/yEVB3E+fCv41P4I
	 5vyef8SzmL5Dh4rNJ6DHVvwv+CGFHbhI3vYVvykfYyE+JMs1twe+gF8Nm4RHFAoKiiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120686;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=ylkMDtmkNrKYI3+rxYgOmFpioBP/MYnKuiWSq3GDu0s=;
	b=tD+LPCVP/je5rtyeI7k7JPEGeUcUNQ8Hp4r9oyYVkV50Q5enbMtvQK856OD4yIunxaYt
	 xWj7qjdWmQhc9OhTncUA8GRO86jUVa3bJ9W7tlhKMRapKeZC/QOS6H8Qnu0goN6c5AOHs
	 bgcqOP1aM6z6W+CcKlG761VFfD+52nfxQ95pe50S3ikYhrOO5Co6c5RaTSdswAse8iMsM
	 rdYFrX0thAOSuZ6OkNob1xNcF/cHyrLQwriOs7FdqHXDUA3QTnYNQZeF7HwQ6dB1D1mm4
	 lRTN7H7XLVkVR4qxpL53RdynXkr4C2I6KhpGh7SAVnWyh1WAlmWkbkeFtcHYVlEO7Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XYjuysXZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.18
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4076074303
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 20:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4076074303
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XYjuysXZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HV/CyoJdCOv0wjnhXMEsufwlXsgCI0H+q8IOx5xSKHfr/Tl2Ggtx0vViJjQZ73So9772R22vMZbVkSYf3iZgJi7wAP5vOQhTpxHVVqFe55zxcbGjbes4C+31UlXYLeWZ97qii8nZlR3fzJ/7IJLkm//QdWm9nPPFd2a/iK2aF5SPymE5pYvl7AbXkuhnCksToLGV+a0E+18yn9uzC9Hukg2BT6YLlbHiNiaf0QoA/BKDEuGr7aBBvpwbEEhXOgkXHzKq6wN4GFBVwWGBsMYVqrHdsBl0Z/xVHLEuJd0Aso09MquWONweSiOMY+Ty7xmMf2PqcbzIUrZh486Ho6u/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylkMDtmkNrKYI3+rxYgOmFpioBP/MYnKuiWSq3GDu0s=;
 b=ipEOyXtOv1mplcypQg6Gtx8jC8Q5vtDwIFuLe2leLQQ/jyknbussq3mZSilWpl6HAOhNwxNkqeeRhFZVp+gIGd/8YN1QA1vXpXq62LjunK68D6FByeOY9jkPrhAieW1b3/Knt0xiemZjsV0/meaAMFFCIH13KXdQ+Pz0oO/PAif0BpEqphobUtAUgrqag8VYwufX29L1A4smfocU+eROUcE/bv/kR7tjZ8CWC9F6T+BtdtndalgxP1zp30hOfblZ7SRSmUUN//IPN5tgkvbDg2jmThTzKHOlKnJZa/7QdqOqhsUXHKFyO0H7tD5Q+bThpreWym9/4FH0ukFeLJDOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylkMDtmkNrKYI3+rxYgOmFpioBP/MYnKuiWSq3GDu0s=;
 b=XYjuysXZktT07zudjDqXRKZsmn0jJXA1vXP9vu56CcqzFXUyp4hn4trkfEskOlEz5+IBz8NC6T1GWMnFbemNRZRNOCytRCvi6ZRzLjsBXEvwzOoJeNxsmW72sZ90aiu4F3WLQ/9j3V/GkdvK3Hi7wo21ysNRwTVfs/P6LvtXDmyDR0ODkYhX0HDQGCnIHLvMgIfA3TO3BhDF4O4tenDJ5l8+438JBzTUG249IlfLTvcIfFuR4kJ3v+QNDSHKDm/gYs1gGY4RSUJzJVrfDRnNgTeBbROcwuC4T4YXhF9x0ihen333rlk36NxH5HQz5iHgDcPfP006u9rcuXEf6YDPng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB7966.eurprd04.prod.outlook.com (2603:10a6:102:c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 20:38:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 20:38:02 +0000
Date: Thu, 19 Nov 2026 14:37:53 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com, kernel@pengutronix.de,
	nicolas.dufresne@collabora.com, ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH v8 04/11] media: chips-media: wave6: Add Wave6 decoder
 firmware interface
Message-ID: <av9eIKDq8XMM_rfC@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <c246cbe7fe5fdd1affbce30b8c7f7d2987fd308f.1795075580.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c246cbe7fe5fdd1affbce30b8c7f7d2987fd308f.1795075580.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH8P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d556e2-0a2f-4721-c2ba-08df467d01c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|366016|7416014|376014|261009223027099003|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|261026140227099003|4143699003|261028144727099003|261102123227099003|261022075727099003|261021135927099003|261022105027099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nhbx4nF/6TFMPcg+rmvAw+weyVP/OEcSbuldfETppYYVeQx22X4wcVCOhSsf+sPVYhJV4S2h4i8XuqeWQuqUBlmCZnHubEptec9aNm54/3H0qpDO4y7pluqRWSNuzLsxwVDp5TpXi3yp6oJ1FPt/ew+7+zETj3n6Xa3+jbSBUg9jpWjL15soUJJ6PDy++agRGvGEMTs3J8yKYyYS4glwnyRv7xe/oBschJWQ7tLLe7UAsIh925RgjnNwI8L+XfW1eL7Ys6J0JxAcm5lFvIXqcTKRPQ1N5X3XGF3mzA3d9MQsbcQJl+EtAGlcBvfPUZqlRJ+u0Hjvejka6GawP/BbB2Zk6jRZtoTsCIaiG5z1o2Ut1oBSxm/aJoCMSp0Y/wm+rabKv+FDTq7q6eKJdhkUUI3RTLdysgwuMbdgUcPUI+B84lvQ2QkY71NLMYNYz4FpFfg6DieqimKZ2ySasVEnmg6ucZR5onuQxMX1HfpOWYlod+xlWy2VxargCrKtEiy51lwNNwO8Vjmwo7gH62El8/3kqoOzXne/qwgEcFbb4qHyygDsu/f+NPyui8tT2486jaUBmlMDNJgdu2bGGj4MotNz3bqVLjyWlphK18I9lhGnwkWsB7xFkp6cIMS5oIXFEcK4+Yt9ZQbn32svBymGwkBmNkdDbhpcZ8CLUe5nb2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(366016)(7416014)(376014)(261009223027099003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(4143699003)(261028144727099003)(261102123227099003)(261022075727099003)(261021135927099003)(261022105027099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0DlFqX3OOxB//8dkN1Eo+0W1YjcsEai4FHRrojUHYdnGm7uXF8lw4qGjhCb?=
 =?us-ascii?Q?IuuAbiS2T7+ERRiqzktwMgzingrznZdGnmZVWPMOu2oqHSs100SetCq/svjZ?=
 =?us-ascii?Q?tgamtHJQXkGrYIDEzUC2mpBawWcvxhiBEqYEfkOzKOd7s+uckRxoUKdsS0kX?=
 =?us-ascii?Q?0POr8wAnF9/HqFeKSkcSxwLTmHsJZu/J+ChQ7goCFSjNjEHACjte+u34A4Pl?=
 =?us-ascii?Q?63gxlUbkxwNs7zyTsa/rVxwzOHCs86w4SV24dVg99EPfyOUMEcic/Xi1/RPY?=
 =?us-ascii?Q?nkyhw3vPPrjKGO4XKo/NOuaLTeVbKRgF5bU2T8HUw7zNcmjOOUYHp1gVK0ei?=
 =?us-ascii?Q?IRGn3z9B78oCwEjm10hNbbyGDFZ/FCnJB+kNFQ3USaoqoHohy2F9U5KxmPIF?=
 =?us-ascii?Q?tS58uQJMBS7JLFzrpBOFhsFTZpNSBiO9YNeXS9/fGomUXVkO5aetPpjenulJ?=
 =?us-ascii?Q?AZQzJ7PcuB0ts9CiBbcAfpUcES+sH01XHVvGJcW+bAMx3OIAsMhRkxSYBXYE?=
 =?us-ascii?Q?54HC0ElheYWTPyN5UZdrhx+X2iA4o81LKdAcWwg5dJnmEa8FeQTbxon+C1DP?=
 =?us-ascii?Q?WTyNkAqj3p29/23TztOuRs9SnUckIJ9lSRqLv36ku1NW2HdsWMSK8RGrHisV?=
 =?us-ascii?Q?sUihNUUtP2zE0LwXLG0etKgjznB97LgS/JsiuLHn8H997mVrXMbZjMa5NLW1?=
 =?us-ascii?Q?5PdsZmrk9+utkB8Y+xiiByKRwnrwN8dGu7uRQqJIbwtKDSKeqmeHGd8opNOR?=
 =?us-ascii?Q?5lBUAoGZ4DgxVzkm5hfKJ7kqllPu9fJX6e9AbsAU8eFttH7GDsQbdsGeKdTn?=
 =?us-ascii?Q?bYEyr4EonVIZ85rRRt2O2Ekfxac9/0E5WYmwFOUqnJsxA3nLwen7BejN/L1v?=
 =?us-ascii?Q?wg6+sASZo9iRfp2yCqvqRtN9qvG2b5f6mRhAnxBR6UI4lNHg/L7p302cwHxC?=
 =?us-ascii?Q?jxyg2iqq08q8Hsank/8r+94fCopCtJV2FVIQZmSF9ZfsReRh3gfHA3TzIVLg?=
 =?us-ascii?Q?FUs6NOAqFxli8vfJHkM84TfOxPdl4kFEIdfYXPQusvOuCMKVT+Y0BYCRJAfS?=
 =?us-ascii?Q?KRF7Ves8+jtXru2WTrR8Xt1FDKCv9ecDpXhKkW18cJJxCakyoxHkEMbvFGPj?=
 =?us-ascii?Q?lTuDWsuIfgYN69BaTD0G0nQig622uyp/iHaPJaC30YuuMtc9Aw06E+DPcC0J?=
 =?us-ascii?Q?IS0cyfVb3v++BinMJ1fyUNvA69bIY3EBbt5bdCwYx72hYswP67imGwmbOyLC?=
 =?us-ascii?Q?K42vr936hHcp+UAZ3MLJWi3XU9lsyp8ipxcWQGilxoGe4KBFdrMgX/tmjZ0c?=
 =?us-ascii?Q?/1p5qgW2WfuJQd8gEOsxaL2uMALmKf8B4MwhDpCmsOQXK7hPF8P195lsLCBL?=
 =?us-ascii?Q?9R+iED6h0QHAd9VS6vCrfpsOQ02H9IvzttQExbpqqrYaL4+FVoxghs8UKDq+?=
 =?us-ascii?Q?2cw9JdB0SqSxIih18O6guyJetKY7MvPZdecLQvBSMhvQiI+LOCVN5dPAMd2z?=
 =?us-ascii?Q?JG2lW2uxcVMGcG4pwqlVqbEY6vFyCLiu23W7Tp3Oaf6xlPDC2m6JcPUAWII+?=
 =?us-ascii?Q?qk3NKA9rZwKvGJNpyvriUWA56ICUomqoOw5jFV3+AVEK/Zv8+c9iZaSAS6Bz?=
 =?us-ascii?Q?Dw6VVXqT2XoZWe8ngCdhkz6AEoOPWJY5KlNygdh+cIT5+nTZ1CP4ldJ8ldgn?=
 =?us-ascii?Q?UAOfVln5Xkd3jy35lw4yXma0UnTTPLYB2LCisqpDA6nzGGnAZe9P+n3UoIaj?=
 =?us-ascii?Q?j15e6/8biO++UtTRPWYy5h78y08vPQytmZFiaJ9g6nQUJQpPubFO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d556e2-0a2f-4721-c2ba-08df467d01c6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 20:38:02.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whHAXDIZHOcSJGF6T3J1GcCjMswBKQnHVX4wVMqCBCChP+/ENbTp+5qc2QNsCUy0SizJuFRSYO/8ReXDrCw5R8mMfBoCpHZWFDWdRTnODjh1VTlbiL8WR/4cU3QS1b2F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7966

On Thu, Nov 19, 2026 at 05:59:58PM +0900, Nas Chung wrote:
> Add an interface layer to manage hardware register configuration
> and communication with the Chips&Media Wave6 video codec IP for
> video decoding.
>
> The interface provides low-level helper functions used by the
> Wave6 core driver to implement video decoding operations.
> It handles command submission to the firmware via MMIO registers,
> and waits for a response by polling the firmware busy flag.
>
> The decoder commands cover instance creation, flush and destruction,
> sequence initialization, frame buffer and display buffer registration,
> and picture decoding.
>
> Sequence initialization and picture decoding complete asynchronously:
> the interface interrupt reports completion and a query command reads
> back the result.
>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
...
> +int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst)
> +{
> +	struct dec_info *p_dec_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	guard(mutex)(&inst->dev->hw_lock);
> +
> +	p_dec_info = &inst->codec_info->dec_info;
> +
> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_RD_PTR, p_dec_info->stream_rd_ptr);
> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_WR_PTR, p_dec_info->stream_wr_ptr);
> +
> +	reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
> +		  DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_OPTION, reg_val);
> +	reg_val = INIT_SEQ_OPTION_MODE(W6_INIT_SEQ_OPT_NORMAL);
> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_OPTION, reg_val);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_INIT_SEQ);
> +	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}

I see many place use the same pattern. Can you move to help function to
macro like

#define wave6_send_command_sync(...) \
	wave6_send_command() ...
	wave6_wait_vpu_busy() ...
	...


Frank

> +
> +	return 0;
> +}
> 2.41.0.windows.3
>
>
