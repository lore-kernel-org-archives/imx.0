Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B193C2ECEBB
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692189; cv=fail; b=XKJM01PxpRfsmOOYPYuqzFVaV0Les7gK+MfnGQ4Hm76j7CQHvya4C8cFexILM+zuAB3GUO0K8XUtn+5+8R0CA+pooN/BbCjNGLsQAc0LrD88rmhRYgQgiCM43Ti/ffCoStkzuICaihHiXgvqJr8zaGm4ndNWE4b459bXvFsSc6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692189; c=relaxed/simple;
	bh=QI2JjtABlDbG++VtOsKSytEmsOXpJNor/PICDPr6NoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Izdq+33ECbFCvRHN4ML8EylNlG11snOs7A3cUjMEXQiVTrSD9C7bzcvjfhKwU3aQpY2Sn+aLbxUxGoeqM9e9xp0MRDQ3o0tH85NKGMuObHcYe1Frm5rQXdN6U0ckLX0ITxY8FN3Vo59b5O7CCyJKsUN69IkZUX0AbSWtpEMab0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hWU9D1HF; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hWU9D1HF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM6wB2KURMs1Ff1m9OjP80t70/cz4PSPeil652H5MQZgrv4tP6STKteT1MySSkSpIIONDKBbQORGWiXYJQXDQoPa9Z/Waf72xg0hJZCvUQA09UIoJwqfxnThFQCe068gvhrnjg6085tiI1j8sM7NB9bBSdzAGqpP9p7lG7PFM6nKgUbgoqPZbjRvjTjPNx5tA3vZWwDFDDlP71MVKobXRuaR3K0C70/ECglhQPJKt98+a+cBUmMthTTyHaRW5rZjbaqhkZ7JPhESKxJUo+nrq2iwuemxShKti5QU4vFOROh9PFESKJhBaWpUiuSCRUnEUksO+g0+pRhzDBKat1PPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI2JjtABlDbG++VtOsKSytEmsOXpJNor/PICDPr6NoA=;
 b=BW1doSsTVm0KnaK6kWEqrqRKclfgb8af6lniFOyCAN2BHWLA4scIYHkiJlTfMQLpJ93QZyqnEAXJIMXgWDd7d1XfZZnaxEQ5BqsO//MORqBqOSsFS4yRzeP4Ts3VydsEh2U/I4W2Qyis53iQUwzper1ZmIGsguYfz7ijeIvAQ7zhvBP3a3vfan3ETw2LmuHbtgKXjUliuxPOcyreXnrFI5YPar32UopxDSTN0+b2pZ4Ixgjsjw4YDx43Btia1I+LEtICT+j8UO1IUWHYkIGNSXFho3objeO9P3BHt0PzDMw1+qkpDM/LHej60z0NGUMGGB5NJHUuY15wZFKIMRIRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI2JjtABlDbG++VtOsKSytEmsOXpJNor/PICDPr6NoA=;
 b=hWU9D1HFa5W2/Nooy/d7+oXWdUJdDO7vm+39srY6qaLUqgIYfq+cVvHN37hmFfDmH1r/lR7C4g4k30Tmo9Vh5ouuFnLBhdUa9F+lxDClWyrUpSc+ywdZu+XesQadY793ihox4CnBsbrs6nBPuPPORxwIKfpn6Yfl7SH7T9xgT3UcNSp1KFWnNRw9fVR6uhTPtLi5UeMKJUULQRhT6koaZER+FjxL1mOAXTR1O65LP9f67ftcz4dDTrc/FglEFDHUhDBaZhCB586qbud9WmOpDoZGq5JkQ2FKuRo5vXyw3HAnfScJDsBcELe9lVpbyqgIKkSHLItMD9QTzTimsGEUwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB8637.eurprd04.prod.outlook.com (2603:10a6:102:21c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 09:36:21 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:36:21 +0000
Date: Tue, 6 Jan 2026 17:37:50 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH 2/6] arm64: dts: imx8mq-librem5: Set vibrator's PWM
 frequency to 20kHz
Message-ID: <aVzX7myAndV0P9ie@shlinux89>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
 <20260105-l5-dtb-fixes-v1-2-f491881a7fe7@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-l5-dtb-fixes-v1-2-f491881a7fe7@puri.sm>
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAXPR04MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b9399b-3ad2-45e9-c267-08de4d070cb8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|52116014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xFn0mKsnMPqHfLG7J9P/At8xvGuUy+w5J9yc5FhCbmaL129XdJ60OEdKaH4G?=
 =?us-ascii?Q?igQn0VKSrl+a1FkigrfGRXsySQSe0tVznX344k1ggAUTk0onSI+oh32j6jjX?=
 =?us-ascii?Q?vL7X9IsiWxWCQuGZTJNDJKV6/9PRrwmqXz5p19Lnx/J2bToKdQyubvjgkiMn?=
 =?us-ascii?Q?a7I5ulV4i14ezbbpu7eQkYMNkvPYw6VUgGBhn4+gvLKpmSDvo+f3epyQEjwQ?=
 =?us-ascii?Q?sEwxl/hfjJ/L2h0PJPKZ86MAXJ+DreegLwYKfUk/ntDGq1TcCsIC2GHoqbzC?=
 =?us-ascii?Q?TGNEkQA3OpLm8vQ3yQjT92BKpzs0EvtXK7455ooZ+wpj5TIbeEnPK+MMPhBV?=
 =?us-ascii?Q?GESQGALMfAUTomC6rFnFPxNVQgJGhWFL3sp4HzhY32z+HLLq98923g1I+oyP?=
 =?us-ascii?Q?dDtCFFgpxbIscUFS1qW9XAf8YNnTZrFhQfflbJGMOUKhw9+dHL0FqR1CQ2ME?=
 =?us-ascii?Q?eJt64wayRSPFslrTMwJbQKg1NPHMF+LiFzqe6loD3Fip5Tc7kJPi0iwWgr9w?=
 =?us-ascii?Q?GwL7YIMPlyux6S+bzEp2pVIt96dyuujH0Rc7qRhCHbew85twMVDbZszeWcMc?=
 =?us-ascii?Q?9XMI55vY75TCn37KbbGD+TmsjWlEXZvieL4aelFFS2ecThiVb5vHJzttGOu0?=
 =?us-ascii?Q?PhitiB1ilnCSdROGT/x5KIhuQYYF7nXhg2q7WcJaRF1TtDeFZC/F3TKmZI93?=
 =?us-ascii?Q?ilmD8hIBjH4Pa/KqVZSLhbWFOb2vMkK0DRPE4nSdCLgaI44nFxcFSQFOGEh9?=
 =?us-ascii?Q?J0q2ZcnfZU/AtC5LVuffQr44Uitgy1qpdxAbWwTGuV3MN9nxmrgkNk8rezHS?=
 =?us-ascii?Q?Q8cXPfF/jSnEeyJ6NjNQSnR35UNGuBGSgkGWiMrGjPpaYCz9FOVk5vU+5nk/?=
 =?us-ascii?Q?EuaihTiYMCx6WaKOYRFWq9DWRhoPFI+qEqDFTE1sijfERaLUVd6a8Ktr6+x5?=
 =?us-ascii?Q?6aJW8M+yflQxI31GeTc38v9FrpAEw9ZORUlX4Wv7AcrGZ4bbS9Lpc9EPU+FP?=
 =?us-ascii?Q?WvYMqwilfzkNsGpIzgvumkFlvltr8RESlNVIx4GBydQqCHLOe0oe/L2lRisJ?=
 =?us-ascii?Q?6iVI30ATkixYoTa8Wk7UjDVea5cxDu2U5tqXLkKMqjzPOxs6QjHr+sq5iWz/?=
 =?us-ascii?Q?qxGyo/OAsA98m4c2Dy4jNejiQLVn8Jd+FQCCmwlzl6mlbxOoPK8sUg5c68AY?=
 =?us-ascii?Q?VlI7SR+vvGrrd+o+nhuqAPfJOMqGsVDREdhTGA87NRaeqE8FTchPlCfI1WmK?=
 =?us-ascii?Q?Tf8Yl+C5E2iy1Em/NIH2JvAdi8MxDF4hVyPq/79huHLg4Rt0JyIojMvLypW6?=
 =?us-ascii?Q?dActd2/QofTwaT0CtW064yIQ+/jWbUwkyc5xhMYYm24JWm3WNevX8Cn7SLPW?=
 =?us-ascii?Q?YkrLLRCnCZ4ZZiHJCNvhGF02Q8uetkk5eb5QZG9k1GpOyJxVaEVnnRYRQ0/J?=
 =?us-ascii?Q?Ak+r7YWJW7BvYJ+w6Qc23X8G/9Bfzik5fM82/GDeRkPHMuZTVvPFPB0T/ZYK?=
 =?us-ascii?Q?rwabrqVlVXk74vhAT2fVPO7gyjKktgC+Yrf5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(52116014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T4ZwaSl3go28DV4CNC6l3ZYQ9l9CfPZ+u7nY/KGm2wyU4smE9KhR5euIAIxv?=
 =?us-ascii?Q?T5Fc9Ob2VAhm2ij4FkH2+XjCstX9gqXiJOry6PbNIA7JIFfzNWAEJcZm/DfE?=
 =?us-ascii?Q?twjy/Rfbz3oEV38d4uT1Vfp/x+ZA0sMkW5BIqJ25ck7Nh+YLU+7DkZu8AWjJ?=
 =?us-ascii?Q?hXltIsHV4nDfdWlBXZqmsjN2EsEVUtmVLiImV6lA0vEtUwMoMZh/Q5jFR5yA?=
 =?us-ascii?Q?VapucIBzS/MvHLAB8gNzf/dDhAZjEVrlrUHKIp7oI/zZjZgOxfD7Nv2oUoQ2?=
 =?us-ascii?Q?5tgFRTJ0KPvCIwoNkgvD0+nJl5OzCZdMtBNvMGPcbwoPlNmplElxNpV+MXB9?=
 =?us-ascii?Q?OC8vgPL8aKad9ZIc2Ea47ZyaYCmDLw4WPGwUnH0eTEQX4WpJUOVaNA5AVjnL?=
 =?us-ascii?Q?IIUbcULR9mOVviNq9K2wFlbKFq4APPbiAao7wJ/OsTTcSWge6zHR8GEgDz1m?=
 =?us-ascii?Q?W5ZDSZSmRiF5dY//1KOaTAhU1/LrANE271jVUkswsxdefrxcjtxECuWiDjiK?=
 =?us-ascii?Q?qIe/da8ifJyXlQm57k/iQB1Ija59dyfaAiDiSUcrJcSa2Sc126KY82J9XGpK?=
 =?us-ascii?Q?SPZLccdKuBtsDFn8CAPJq5fyZ8xqkfeIjhp0OM6X/LOEaI0Zy/B0pTwknlug?=
 =?us-ascii?Q?rQ/s6mmfBqJyw5XFP0rxSnDHDLluEDCQf+tm+ejAk8WZTmyO5Futi4OHg98k?=
 =?us-ascii?Q?eK0E1wyzapTDKDufWBysl5ogGLjrWBTaXgzDqEjiXHbwI2wrjR+u95fE9dYz?=
 =?us-ascii?Q?lO/oUXMYgzjS0vjHeK8rDi4SRr+FZ49mHF6YKEvX7t7v+O7Sb9cGQIMM5Pqo?=
 =?us-ascii?Q?MJuqQe2AsG1pJT7fGiAa9wOvAS8CMkS+M3/7zOyHEUj0ytLCHnkTzQhVV8JD?=
 =?us-ascii?Q?AuRltlPD1ewPFg2ssJEgVZB3IwOEYADFED3qXFGRWEKjojn/FqfRGghEjfzv?=
 =?us-ascii?Q?Fc9Ssp9jFiRyoeVknYQ72z8rKdXkwlk50vthDx+/D4goNV78++ihnmWtYIRs?=
 =?us-ascii?Q?VE5rk2U276zAjq2EHvEIteNEq7Ksho/a4Z4BTInKZmPA4zqxa+tnuGiu5dsr?=
 =?us-ascii?Q?ynAghuSLpeuFRuzsVkQilfEpI5bvhN/VEPYAPFfNS08Yq+oZPH/xKOJ6yeyH?=
 =?us-ascii?Q?OsZJs9UiYRfKZ7y70bh8eFMY7SPBzpDqK7Xq2TMjsnFikFuZuppX8DMwzB1S?=
 =?us-ascii?Q?/wf9/Pkqyu1Nds9syeQsvoIQpROc5R140g++S8dTr1iTCr4DoZXoijdSwTmA?=
 =?us-ascii?Q?92+r5SqQtPwhWKenoeNBOckUSYLXDIb3+nOdd/57BHCCPYns3vBTtwfOyBzw?=
 =?us-ascii?Q?DMii6R9/FJ8EfZ+zxuApZMp64yDYFLPGjptQ3vmQGoLZPgt2vUdD4TIn7zeb?=
 =?us-ascii?Q?DnswJ9/XiVdBnVrIrZyw9DyHyiz8qhmCBAooH9cDhzA7SEHPQ10XzjJ3s36m?=
 =?us-ascii?Q?MF1cW8Dlz1ZCksTUiQK1Wi4ksDCWJZ11LTaiJXKqMiIrLAMzyiE2A/7XVYqg?=
 =?us-ascii?Q?i/4nRuQVXcZm/as6NXImu3ssfKtRZNCOktcjI0++X7p42JlU++57rzw14oed?=
 =?us-ascii?Q?fy9KGGo+y1qw+PoYUZuQbIk0t2/T4JAquYuq61Vb1emuZmCUQnAC+gtSFoyE?=
 =?us-ascii?Q?DfTGMvaeq/XlpmkIJfaJKX06F3C2Jg3baWoYwOEdAxjcPdgmFd8RD+7l5qZz?=
 =?us-ascii?Q?fLeAtvoRr1Je4SU5WyZZzLRxU7wjuelpKRBdhNCbHcQyuGevhKrr/6GSB1YX?=
 =?us-ascii?Q?wQcY8OeL6A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b9399b-3ad2-45e9-c267-08de4d070cb8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:36:21.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwIbIYPAaLTFe1J7sRA055FhHkjGPkkMwRXvBEYLgahYih8Nx0TMd0zLIJNr/z53JYLj8JNymUT0U31WI0ywDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8637

On Mon, Jan 05, 2026 at 09:39:39PM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
>From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
>
>1Hz as used previously was way too long.
>
>Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
