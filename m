Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2529A9
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386520; cv=fail; b=B6/V/iYe9Onfh1KdKhKKxGxtr70W5UJAzOoYrzPpkTd2XE6/XVRW0/cfUOn1KTkD0+nzwBX7xezd7t0y3sSgN2xcfFEVZCjByKxounbA55a3xOnaaMBiNlc3MNiwiDYFIOPoNDHwcDgYfL3ReOjR4qjdraGf3osX2gTIhttDsN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386520; c=relaxed/simple;
	bh=UJ+r9JMouQZ+fyZ8flkj3ia3vTrnKPjlHDwp1QKP9rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qnwOGiNfkXUuRsXyLD7wfRaYs1asU4gjvBSkHcUnBRija3Q8XjSuetwCu6INvJ6iMALqF9prngkNeaoAlmnOBOwcd0Tam2ODU+xUxw7b3hihePIWkTxhgfpSQxCMjOWuiwz3C3u6I5xV9ICjq4My3cWuFDyhgdA24ybXccEM88Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BSNUOQlx; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BSNUOQlx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWWpS+kVj6joibrHaoRtFmuCdu7HeQlXdVR/ZBTI1EqK9BZsZo+94npsGssW14Exf0RxmJAi5/1yzKn5pysIQNjEdefy1gOi5gKjnuqGPN2weBANclFURFask+tho2r2odkn9rkhEugoli20Z4WUVCev6utIboPyXJ2peHvpEOEQkP+ZDa0QIAauIUEw5v7fD3vy6fWJmW1Og0wbxVhe7Iez2CpLoyZLgTfsgn7N3Obt+KzKQSaPa1L2W3xMx5D7qboyVU2qgBvm48phQtumCWI7RbsbqnMjpMEG85SBloZn353kTwlDw22N4/OoCpCKHiCMbGuTDS0vtvqjulzB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReqfuJlq+4yrwcfnCCRTOIH3G0AJ4wfTn7pusQDxYTw=;
 b=d/jmlCC5TFo1E5Lycm1OsECgLTJps6Kb/Nm+l83sSmWfglCarro/IiqTkG8BMY1DpehBeG1T+GnzXKHazxVeTXrgisRXzfaMk+fG4f48x16uKsempV32DAhJvZpvhIFVoZMTGv4QZeVqui9nZ3KK9s9Ja3QD4dQ/yi/kgiRUrVDoRifs1yI7nFL4hj/XOodXx51f8TCFc8PzymYyaREtwcxvY+ItsVkj4OncxNqmFA7ISdxpZXJErxmFohpo9cbxTBbQcJMSQiYXCf8BMrImJYrrRFMLSJwS0FHv7eRpR61P1DRC7/c1AH5o5n9hBzOWl39beMO+n9IuSu8g8AGs6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReqfuJlq+4yrwcfnCCRTOIH3G0AJ4wfTn7pusQDxYTw=;
 b=BSNUOQlx7FAd70mEqX19S93jlGBig09y0fKJAIAwo8at9+7I5X4FsAusxhKoWABb23AqP4IRu6/tGQYg+cKqU/9seQDKf/2OmvslmXgfWT7Pcmpu6/3ue2aovWNZdKGp5HeYWKjtLUr3IB6MBPTwjkQiAvPkUX4ASc5qMuIgzyN0npW5EQeAEK7lVYiiOV1CIdlYqoHVdydqR+y47J0nDRpmFJ/Rk6dyuVaFldE4ISOeD1ip51bkcu/t1n9bsxy07Zx6OSWVm82ccbdBPOUD+jy9dNfpaxpQpMJUKrKq+9XBHGZMgYHxUEdw7cjVb4Gacu5ShxVfnfQrLleO12QA3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 01:35:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 01:35:14 +0000
Date: Thu, 9 Jan 2025 10:40:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Update i.MX95 compatible
Message-ID: <20250109024058.GA31833@localhost.localdomain>
References: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
 <20250104-imx9-machine-v1-1-18a78e41456b@nxp.com>
 <4666f8e9-d19e-45bd-be9c-a7f111168d66@kernel.org>
 <PAXPR04MB845922D5BCAA88C26C0149B488102@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <8d2746ba-47d2-429b-9df0-9448a4516ef1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d2746ba-47d2-429b-9df0-9448a4516ef1@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: fb904785-6cd8-4375-9d12-08dd304ddd70
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hVPLYqrRRXsQMzam1G167vtIwSu4xF7otsLvEU20JAka9KZZA1GnxRL1Vvuc?=
 =?us-ascii?Q?QFZW97jhy2O5fv3iOzPSf2KPmKOZm0M8iMx1YOUGeHMFeRYlQHmPltdzjkXg?=
 =?us-ascii?Q?lgV6cNoJVF8hfEf7tdq0/JKeOV5zRXR2p4POX9ZLWPG+oq8hQr6jgjPwTIrm?=
 =?us-ascii?Q?kII8a+xYHs1WfDgqYJjnMZn+MStWO9k/4uepEwfeDymr+bLjH2pQxMa0g8+A?=
 =?us-ascii?Q?xPUwXcMvLjdyS3dnFM4VON5YsaA6IGDSbxF672W8jBFcZat3sC9eayvPLfTV?=
 =?us-ascii?Q?Sf/WFzqyq9UvhU/QhYPy97UBHgOMB0qSNVNCIKGehDHM5w0l9QXmy71V9nnG?=
 =?us-ascii?Q?73T9+NhlB5swZWdQAjbRw/+fMPAu1botwUXZWglW6F8zMzS6xSeJ1EGri9KE?=
 =?us-ascii?Q?WQbduGaopOaJsPRhT21rRezrjBALbjUUgVgI3k6GgMX34NNHXMsnLfUE0Mj9?=
 =?us-ascii?Q?zyttYZ6opcjAqw6GVqBH21sgd+L8nBxlAcYOtvpohzicGEKBrz7Lyy7S4d53?=
 =?us-ascii?Q?ptKTM4BarsDb9o9VWGpWq0I4pHz3XoYM0phKXP0g1hv4+jqXNEJrjuS8dxUt?=
 =?us-ascii?Q?2qa3tNFrDzqh2MbgxhVvQc++/bcG6sPnfZKZFQaFbWO+8SpZzHdaF5WrvR9t?=
 =?us-ascii?Q?H/kAy4Ed68WNuuWvLVQ/Rj4cLR+ZUirV89mDtx+tfT9k8ww7ueQBRCfxguO0?=
 =?us-ascii?Q?TqsEgSTxDk9oiAAbSFJhBehiqv7UJot5GPBuk5XVSPRbCSvY1JYj7PKE/d8q?=
 =?us-ascii?Q?qb77N6apS0kGUCbobgob6HsCy5D43FWVafA/LvO7QIioHsB6rH+o3UjHemG0?=
 =?us-ascii?Q?pI9mWuS5LHmbTMpeddhIqscegaSamc31xHNb9bNm+V4JcSk2LfUmcZq5zP00?=
 =?us-ascii?Q?lAYMMDJLU9q4QAj4P+IDweJ9bi5mpShCAhJ3nafI6FFb/kXSdvFTy3DgU8QY?=
 =?us-ascii?Q?yoUjsuVuE6u1/ZB+lX1kzGaS/E/ZJUpdo5THACtkNTKNSgfOH0vNonQT6Ee2?=
 =?us-ascii?Q?vM25keYe/KNjFbRf95m3TgJbqDa7jjHe99cy1tMb2eFjiysAvBm48317zcmm?=
 =?us-ascii?Q?f/ITTDA2x1fnsutE3Ii782ug9D8ywnCnwITvBhthUBuTvema4fXfTd4nSznb?=
 =?us-ascii?Q?l1aIlBvH/j7nFagIZAMox/UBaREGBd7YJRIEYEt79hj4MpqbFuMszV5f/2zo?=
 =?us-ascii?Q?xKt/lSvP3PG3jGpBji0jRfgsDGkbFHHy/A7mCqXc77WuhbszIv/jgIg2DtjR?=
 =?us-ascii?Q?6YyKxQw5TRPTqIzc26vSw7nOljO/wMXKCq5hGXcxAI58oV+q+jf88nL2AS+o?=
 =?us-ascii?Q?pdx5PqOPJS95S4m4JYolOBgmOuPDR1qjkrJjHF+BhsCVo4XbJuwnVyKxhawY?=
 =?us-ascii?Q?IQs6I7V6mBmJ7o7c3nkU19SffAzLBJtrF8zgc3UgYObSh4w4Rg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4m/VfL2wKfhW1/KyFUOvZomTTwh0CLyNh/7xapVbd2qp4qs/slpuZnlTq1GQ?=
 =?us-ascii?Q?1j8mo9oDn5DRrdCv8yyAPfi0uG+3WY0Kzz2dT+syhJuAl9ixo7qYlLS6sASH?=
 =?us-ascii?Q?3OrmZCe0xYn84xEdxEqse4oROBIznARa5Z4WmkvA/QIhJTscIFLK+U6eDXPD?=
 =?us-ascii?Q?Y8w/xVv2kTzfLvwc0SWjVlbBP40F16L/3d6YsWZad1O4CQ7b4QnW9Nu+Jc9n?=
 =?us-ascii?Q?/4EM8VIO+uPnSMvkjRKdyVNoJd/Wfx6/U9no3GY1IvP+eGFQQrUPpJdfYMbp?=
 =?us-ascii?Q?34ooQS6ozCj2yjkJm1Fq8Mxc8dQSTWX+CWx+bwx3J3yIxqLtT138q+qQih0i?=
 =?us-ascii?Q?zTkwTH07OIFDFp7d4wqde/hyOWUTEg09NqlAljzzxSOst+GiirGqK2BVKDcj?=
 =?us-ascii?Q?aTJ3I/wssf2xTknnjxfbNeAnRFxHCIpNXsJPKTv4UX7NcNpblFAMMrK199+P?=
 =?us-ascii?Q?H3YMfxCVF1gzIx01lr5Cy/GsTGj5d90xvgaiR0QgEeqwoLu5SsxMQE16QOyr?=
 =?us-ascii?Q?HSSFRsOffoqgPkbZvUUqpMbHwoqcsT8/0V0d91haOxuCDRvqIuYuwuRjKTY3?=
 =?us-ascii?Q?mxn2pu4iWIZY6fUiIfE4JXgVlqXmEn83L3MpJKPkvMN9WQWMNQFlXdZX57as?=
 =?us-ascii?Q?3C0GbzF03Lzj/QBxf5O/iKYDFXBF8FGZ/ngJWS2q6SvWNwBBciVJc197WNaf?=
 =?us-ascii?Q?X+rxYqYINF+FzNN5y7uy2zHNRogBy8iu6O8enddILHw1QUYZ/Z5u5q5Oip/f?=
 =?us-ascii?Q?qR47j0H0YNrpkPAs5p4FsXuRRaVdtnbhyEvKOJeB6CUa4hlTXmtAe6X5XVUm?=
 =?us-ascii?Q?iN6Gf6iOf3XiZGugdxJzw/1BpFb3KByOPEfLTUlLBNtlEELWUlqm+Q5jFfNF?=
 =?us-ascii?Q?RoiIU4EdCFo5G4hZAgr/2GZHYHQ5Mkxi8jd2q96EMVw7vfCLSCTY4zJbZiYr?=
 =?us-ascii?Q?2DsONWdI+Rh4WwGTunjQTnZjpKY7Q5KVQ/OP6AwbSSyLcEh4sFPFYBe07QpJ?=
 =?us-ascii?Q?NI7P/vHIYGOjbQXXIa8whll5XO6NdSale+uJVvsNu/7C5lNd22Nz75aV/4FP?=
 =?us-ascii?Q?RLOhEciCDCRhojZfU+UTJvgsZwa/iPISg9TN04YPpPPYQfAPT/7B8XNRwWZ5?=
 =?us-ascii?Q?lSIC/wIYOZPxnQ1OJOFCcREHGKzn9vwcyqL5gqpr3ntWeJl1/SID3xhsHmKP?=
 =?us-ascii?Q?4oyTr3rEv3RR1u1AeAACWkjewC06oqqncatmTQv/p7i2Fvwqf+qSU6xzvzGQ?=
 =?us-ascii?Q?TD9YaTYSZyXwlJPo+/SbpCVzmUxgckxjUyzsWF/KL4VIL5co2zV9bN6GkwBK?=
 =?us-ascii?Q?6nPPNJA7bjmbvdxU6QwFB24fpAZue234WyY1Y67V5dk8WSKt5lPKE9egsIK1?=
 =?us-ascii?Q?jMft+DVAdgXY/K6OX7YM+aeirAQIynSpaPReNf3eryQprD6+mUje0KO4fdtY?=
 =?us-ascii?Q?QFjX5SjJvZ4vGUA8PfXAQUV05c3HzCgIkXeQUirntr10DdjkdmPnZnpUToKE?=
 =?us-ascii?Q?5kKOnhLHeav62ddRZg/aiH+bPQDPVbIl8FKd4eMGh2lJR7RFUg7d0Gz0lAMG?=
 =?us-ascii?Q?3/W0BTUkWIdxJW2z9k1Lm/5gra1hOzyr+FB3vV4S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb904785-6cd8-4375-9d12-08dd304ddd70
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:35:14.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMVTa7w/YVyuQT3Bf36I6ZA5fNCEoe4qyn5L097AU27Qw/UWz+bSxbeoWWFbWBy0KFe/ujXjWaiB/2CQN96rtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8829

On Mon, Jan 06, 2025 at 07:12:29AM +0100, Krzysztof Kozlowski wrote:
>On 06/01/2025 03:51, Peng Fan wrote:
>>> Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Update i.MX95
>>> compatible
>>>
>>> On 04/01/2025 13:13, Peng Fan (OSS) wrote:
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> i.MX95 features a System Controller and SCMI Spec 3.2 compatible
>>>> firmware System Manager(SM) runs on the controller.
>>>> Add "fsl,imx-sm" compatible string as fallback for "fsl,imx95" to
>>>> indicate it is compatible with i.MX System Manager.
>>>
>>> I see little value in generic compatible like that. All these are
>>> aarch64 so why not adding that compatible?
>>>
>>> How this generic compatible would be used?
>>>
>>> And by what exactly?
>> 
>> There will be more i.MX9 chips with System Manager. I would
>> not expand the list here each time to support a new SoC.
>> 
>> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/pinctrl/pinctrl-scmi.c#L508
>> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/pinctrl/freescale/pinctrl-imx-scmi.c#L290
>
>Problem is that compatible is way too generic to be used by Linux drivers.

Is "fsl,imx9-sm" feasible here?

Thanks,
Peng

>
>Best regards,
>Krzysztof
