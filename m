Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7174140627B
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046492; cv=fail; b=nYbWc8vpBqCcHxj94BWEx1sl8oAFlYVR9agEZqiKEEk7NRapbBL0P/TaucRyruEE4tNGf3Dt/W1xEIebD9jNurA1cXIHV2gd/IZhu9JAyM2WXqhz4Bu+smiR4a+qtwpwNlTV+LnH65YzFRdlqKgSXGaV21RsFvEUtkwNyrg2c0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046492; c=relaxed/simple;
	bh=YBT7s0B7rqK9qaqDkfmTVdmKpbxd1rckftCcWBtRmKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JFPJKdv/A9Pk5OUync0LyahBtFdQts8ZeVvxry+KmEaeHclAv24De+5vVepwKINFwA7QJ7zZG4sHokkyjNG5sjTUOXP9JAOgTHbyj/73nRm2R6iJCHAnZHe266r6L63uRiAhb8OcfpP0gpKxZ0Bjz/FDpUZaxj2WL/pyo9OHcu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qs0ZL5eM reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qs0ZL5eM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3fuPJ0n1MxijzFTvEUQvVc4tYIrhN4KljyglLuw2oZniDtJj78nsvPqcOolRdIr3rwuN61ruPy1DuQk3Z8RfG7A/NldtknlG7UbS5OeqglJfysaa7R4krDnqZp89ix3UjaBbnOFN3k/dMYIwMeqYHRP94OFBdG3JHgr5VxcafpppBTCtsPMQkULb3GnroNQjQr3slvlROCUeQUC3ZkPRyDMyvHV+TnEbf5oAIrgo5uOgj5ztj86iTNLeo1pAbl8cZML27Hmcnxz/RMzLFPGOenJHTXpFH0O6sblUfmftiNlC/H4JWYE2KZSbUtHwJW5GC82hMOSpxqmpWBP4+4Vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeGUsEjQ40QRAG62gizVWErMRdp4NeglbR+FHfVh3OY=;
 b=V8ObyurwxP4v5FiVyFwDDt8J1pM+IArUIPlBjlR8JYpCU9NrpGiMucyXLrYnIy5WmLNiT27PB8vmvpx2CI96IbPW5QA/uvys5vBP8qyEQSEFNOKq0CmJQSM7MveFPITBOx0JtkTwEb5qekMoQJaByeYhw/B+vkzL/Uk7dHRr9xUYQ6Wo25shCuS3YdUF6LsLSdfg4mpK/nMAuWnzWsZgYqGm8qsUP6MX5v9rU4bGA5ySHzL9B29oOvySynse9XcyXsEs5ZSHYx5OqylmmRGWLSCj0EAmRbv0V9jwhzgxulVtPw3TEkxiJ4q1FsQRwREQl/Od10ZtePYZAq4DXF/0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeGUsEjQ40QRAG62gizVWErMRdp4NeglbR+FHfVh3OY=;
 b=qs0ZL5eMBll7m/VqCIl+NBWEoyDvjbDY2zOmybNQhAZtnR2AHet/6Jjs256HcX2LCU/AWl6znyoiseQYyuansK8EhoyT1gXKgbsJntgPIhdkeyKvBdjxmkDf50kzpoSI3mO0Ntx/PlGdLIKVM/zmcdTWPKe2epl+ZURhgDQPGipAcU8Rkz06qDb3E3CjN+PYTaztqtd6IwB2/STFKESt+RwWJhB86hg8DaV62Mrq7bQmj9zv8F+XCvmLuu8GafjJrZ0jsgTVsnIJcJnwHyKwBj/2X3Evd6A5NpcW4Wcm4YSp6UIl6MAZTq5cSIh2RISAfZvkrdK1k/CkmS0UyZd69Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7990.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 1 Apr
 2026 12:28:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 1 Apr 2026
 12:28:07 +0000
Date: Wed, 1 Apr 2026 20:30:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philippe Schenker <philippe.schenker@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
Message-ID: <ac0P3IjXyrECWp+T@shlinux89>
References: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
 <40dcbb9c-15ad-4765-9f7e-40a571f98fb5@oss.nxp.com>
 <1955363.tdWV9SEqCh@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1955363.tdWV9SEqCh@steina-w>
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f299f9-9b7c-4ecc-0afb-08de8fea211b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|52116014|1800799024|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	sFW9NQM/L3qYOvwMPAEbVj42IfJkxOSDh6DMr0hM5PqsHXzfdnkyDsBO8XVlnSApIdyc7PD/0xeqOnnrYLbtJCfuYpIawoW57MWlm7xA3XZQo4QV/UJnLt1Fc19opqgHoi+k3GTdQALFpd515xsTyG21thKkRkOvRtJHenqduXIDwMAM06TGQoc5ExTptz3Bg0RxOwjU/vqDBhBBIJ/xqx9eLc5dZIV6vrI4Pyy2dezZrrn6uoNmGZyZ3aVUjftg7rlq/HeVaVJ/tB5xaw13vJmh4Dz/AghFo4RtZOsRUD806SoOgs3y8os7hWML1O0bZCfpQ8EzcjkP5uJV1QRr2+ghIppXFg2CF7yn37iSp3NbFKFqz/JkiUrh65GEYGhH3zHNJU0ZAszJQmA7ABEL9s4hmYgnoJ3SVe+ZokwvAgSb/ahCKBttCPqZJ1pecyT5WiyEVaqXQ1Vdc2HW1JA15Zo7TfW2i8ho4gilR4bsGHdiiHHR9utlY5Jif3bovrNjigEqGebiFd4Iq7i8RdqBFEG42xMClFBDUqIH590li53cPq478/41QzZO8Uj7lWxIqGoGkJfFm7TU6gB8/1naYXDFV7M15iDf9uUh6ttrFnLoC2YHDdIaNhOaGn88NpqGFAjs0djkF6ADVUb0jKeRa4mo6mkdsHG83uKyn1faMD+RtKYXhbLmU+nJL2x+p9E1DB1Bb9mX6i2Fs8M9+ffPsk9uUI7J5vPHaBSk7kO3z2TM2BOvNigaNmxr0+trmto6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pbmnkYLSzzw0aXp5flr9iJuLUOlahTY5k1iiJsOQVwsdauxRuvmgQ5yyuI?=
 =?iso-8859-1?Q?BslJdMgXGj8L9p9vrHOyZ+GU6hbfmac+Dnf7CXGjCwUL0VgBGaOrNM7Y/U?=
 =?iso-8859-1?Q?nRcPYZhlKYToyqU0ch6gm7qvhkHwOJMcyCm3OgPtyHE8JVcrbg2HCWOrq/?=
 =?iso-8859-1?Q?F4XAcrLcRIV3tAypPQAQ562UE1hfOvMTheMejXELqPGxCFQbgZUb9MBNmV?=
 =?iso-8859-1?Q?shwGMMs7T+yIXxLEGpj6b3t4n5mDdqTsA+d6DifOv7FPf2X/aOvprsGk0L?=
 =?iso-8859-1?Q?UTQuEE8i5QdC2VrcOMBXWRzW8D7yMB/J4dVm4M+p0f1tJdzBebJG9aJXbR?=
 =?iso-8859-1?Q?rx8YYJJuLuwudGQSKr0dY0bcMUxDLDXL2BERLSaji/feQ0htPNE2Y8Mw/M?=
 =?iso-8859-1?Q?vUhxQCTHZKWsf9u4g2Jq8VtSGod+Fm6t3u7Ehl+XgZWrL8DSZUQ5+z9z1V?=
 =?iso-8859-1?Q?938BXRSN8pF19GSCJZuqDwJjpZFqnfioa3lNyXlVHFKFaRORpZ6p7c1tPm?=
 =?iso-8859-1?Q?G8+beZDuzb2yTaCYkH1gTlOepFeWksAcQ94fg/jRR+Q+S4IVlYP8x1sqrC?=
 =?iso-8859-1?Q?eNPFg/mlFgr6D+uQUBWt46ashncjc3AHM6lLPW8cg1c0w/dU1BzQotfQqK?=
 =?iso-8859-1?Q?ATjmelvYLuqWfHjm7RzSOjSDH8edjlcG+o5ZxFfXbidlzgFz597j9ZBL9y?=
 =?iso-8859-1?Q?000F0s/acPEcoCFFSs23DWTK6/ZY81k7IZCu7rpsFlujG8y9727nvfN0nA?=
 =?iso-8859-1?Q?LigcunQMbpxBOhQbxWGlRxJO4hrinGJWfOVjFHt3yvcaojqKK1NTze05Ys?=
 =?iso-8859-1?Q?sww/hZZXv7gp/iJwUDJD/ClJRIX6sbdVtyZgdb8RaZkLIfKVXqnnvxXTix?=
 =?iso-8859-1?Q?x6X/msdnYZDWKH84DFXS/pl1Srv9HY7MExogQorm8llry5yu90UfoRxKVD?=
 =?iso-8859-1?Q?ORf1K1w4xJOGat+oJ3EOqCzK6Bvxkn2CTtMIvikcinHiKVUMcdNpodDdik?=
 =?iso-8859-1?Q?Ygk8addal+TZlWu3BmtmMYcmsdQBVSdQBkVHxM5jsWO+pUHnEjB5KhO3do?=
 =?iso-8859-1?Q?m+m4/sqJohzMxa0fv2i7zz7ygs9wGviIuyeVfT8xaRcdXPTlkRWQGojYbC?=
 =?iso-8859-1?Q?bZ/9kSZtI9ZYVDMAAucvMCRr8jSUKlDqvWNPikjrj6RhuWYra0xKRYTDV3?=
 =?iso-8859-1?Q?5dX/jMs8BNiG+bcIPRvSiH5PMDj4JAzNreisNi4l09riH1kR1w6u9+zIkI?=
 =?iso-8859-1?Q?6eEGEBhaaBvhvhxvKQId9gtvGGIBFb7lwPATO+qJicshD5pITOyuvWju22?=
 =?iso-8859-1?Q?qfNlBAysHxYLNxGrJmTgoX21m0hG0N8vP/X6qjcud2zEYvlwuAjuSNyF1B?=
 =?iso-8859-1?Q?kHKXfC6Rykah8I1Ln19jCs+R8KB2+P58/Sdr7u8ZT1gYhMvHoc9okkyj/z?=
 =?iso-8859-1?Q?otO6pV4RobKCgM5ZP71Oop69OP4hbxQr5VOoycT2JaW9JHAmXfP8ac72Uw?=
 =?iso-8859-1?Q?xemWoHoq4+M9Owc2nyZoVLzKvUZnlp1baqE6nk4QY9VPZ7kejlSe6wLE16?=
 =?iso-8859-1?Q?y15Wisp4ndLBfLt2izXNPERqzlPeaJ1ZOk/T60HPfm6Zw4jH2uZZnHcrnD?=
 =?iso-8859-1?Q?Ko56YI9rcclkCPFawMAFRG3n0TR/TtKXeUTl4vH927y8mUaK1j8dxze0qG?=
 =?iso-8859-1?Q?vCXeZ9GbO0IKqDBfySVGuzu1Bw4PICH6lCid1PdycOM/R0llCdCQ75CIhj?=
 =?iso-8859-1?Q?hO5Ed4ItvZ3sJuZgMk6xhxFAj5khH1unRit01i3/SMOH9Co9yNKlKlpqNm?=
 =?iso-8859-1?Q?YScL6kj55w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f299f9-9b7c-4ecc-0afb-08de8fea211b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 12:28:07.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ew9PZaj1g82nD5YwaY6w5dnfsMDNrNVKtrCwfrG0SDemdbi6+u3MhB2SFZbGPbM1cBB+wvQhGsepgYOjR78j2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7990

On Wed, Apr 01, 2026 at 10:02:48AM +0200, Alexander Stein wrote:
>Am Mittwoch, 1. April 2026, 09:26:03 CEST schrieb Daniel Baluta:
>> On 4/1/26 09:40, Peng Fan (OSS) wrote:
>> > From: Peng Fan <peng.fan@nxp.com>
>> >
>> > SION is BIT(30), not BIT(26). Correct it.
>> >
>> > Fixes: 7ece3cbc8b1ef ("arm64: dts: colibri-imx8x: Add atmel pinctrl groups")
>> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> 
>> What is the general attitude around using symbolic macros for pin config?
>> Like here: https://www.spinics.net/lists/kernel/msg6072866.html
>> 
>> I think there are useful to avoid this kind of bugs.
>> 
>> If I get enough Ack's I can move forward and replace all magic numbers from imx dtses.
>
>Somehow I completely missed these defines :-/ That's a good improvement,
>especially as SION bit is "custom".

For in tree dts, I think we need to keep as it is to make stable tree
maintainers apply fixes easily.

For upstreaming new dts, we could force developers to use MACROs.

Regards
Peng

>
>Best regards,
>Alexander
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>
