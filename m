Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8870534EEFD
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636894; cv=fail; b=V5qF8vXVJ77skAftQpAIZCJCDCHvH/2SuyPH4Va9qCbIXRl9V6+zIK9ihlyOt4k4dZqBIe98OlTRc1p9jq1G/iYULYhZ0KpPjCi2RKZSWalkFmRkXW2OfmFX+zLwB7HJ/9vY+fsDVWgR5icLyJCBYMNhCjsUyh0B0Cix5zM2jAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636894; c=relaxed/simple;
	bh=MeokqSpQAqCenXrgUcXNQHXGaK6PkCpDQcalY0OGU+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=apt1+6oAMTcS11Xqj+djCzSGNvb/wqbTH6z619t8e2bKvhmesXqQ13w40wmA6rUOPhfujARVKPIwkL3wTy7EHIy888NGHYnG+BsaCgXwLuB2Wh6DtJikDbtcx5Shsh8hAeMAjOoJsZHviTUPyELZ6wjWB/+mdDLswOiI7nrb8wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nGHGebjy; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nGHGebjy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkZT9ycA9Z3KtuO6EvKeMvsDAAsneuz6jGN0NZ8E7hUpwAGzItKRm5JXL6sb9OIiHpQzxGRHTs47rpj9OhySCiT1wM0WvHZTgXn7Y0QZQ6jC5lPgbrLzE96XAW5ijoqwNSUn/rbK6x5zPdCqzYXQrVHmT1gaju8tSNwpfRIJYi/HSW3uFM2lMDztKTXVtddCe/23HsALNL/iBhmxaOTfXssyx8ZVr9a7TSWtGAkIjGFcN3M+D3Gs7oYyjjFyYuuacUY+2ZqjnBgDW7XETwv2nmxUEXXLM5q9hz9McFEH9YHUaV0cGYESJchWU0ksKdpYyolqd7EGN4lW9h6z2vdUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1T1zJ8Auf6HI4efPz3P+QpxWS/ASDrD/9H2ruaknc4=;
 b=udWoeXpOnrRfknz6YG1T4luUXXwjlPtoGGqfz1E9PPZ/xfAWB5Pm769fLr2X9ga6KdZufA9tkX5ul2VN5mYLzPlpS+ynF76LFMcv5QaJj+b72eJ+nVI3BYfrvKXCpQw9kf+uVJt/nYcYEbaHJpTz1Dhnhd1FVcSkQClB7Dz4KTQofzPn4BhNQmm9WWC7Nf6v1gqb+nYNe9AKiimf1MRzcr13QvSB4SSzEYUPpQHpWBLWqhQ5nnC41YushW63kbfh2HndMce4VMENDeh9lB890kHX/ljswigSrPZANZX6ss9fp5LUnn+AbB335XRA7XynpFnl/yVjSa54Obr/ox8fdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1T1zJ8Auf6HI4efPz3P+QpxWS/ASDrD/9H2ruaknc4=;
 b=nGHGebjy9FYq0o/1TG6GriiK1bS1JEBQXhSmonKf1O8gurIS499pA1A6f1BHCQeN4UWPH0ZPCVww90Td5Coj5Bfk4FUQjf58OOp2lK0KQZ1cYJrfzatxYstO88nQ13P58c6q4hqRINyK7mgR/sPRL7oeqkFb0X1mMKcjJ/7sHI0k0+mC1MW0CEHDmEUv4KnqrDYpqTtFvhQmj775uZhFn+YhVf3rcIFDy4axbxgq+9bZbhnNixM8u61PQK072RqkZh3voTb5n4X+VrvV0tpmf6wBqHe7gcNxmRphZTwbz4glgbxFsxD+4ZfMA3GsX+6O0z8OZC28otgaVzZcKwJYbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 18:41:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 18:41:30 +0000
Date: Fri, 27 Mar 2026 14:41:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca7ckVY9ure8Cwe@Lord-Beerus.station>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ee64aa-43e5-4c3e-de1b-08de8c307606
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 cCWZ9ZabwLDq38a7xobLXF/IXDTCkLAySDrxUq9psZWZ0M3sizRYatiGeiALx63GC7Z0B+xe6CFxEXvQepvjUc83looD6O9+NZ3gas74rfSH9lZIGTPUTjODeJ08aXnEcY7pziimT0BLDx8479+8o7AfiCrHszBIdMH9mjmE/XHT4ZhO5H55E3Pj7TGGyXjfjs7Kz6JOlY/svJizTHCzHpJCylGuAVu30YaxtBJjIWWrimEOkTsUdIjmAoNAniQIlsWt7GRsUS+rfJ73Qp+jsn+2Gm5f+GgLAfIf4JAaW187FwCIEY+HFBGIuioGStA5QFJOWK2N7ySCrgyPDypkQ5egkZT/vbvurecnMBEPs1S1YwwpfE85GZFUyd0jkRJhNyTLP0gPnL9FWXu4luVX+yGsAhf+mimiEckxuRrxn159NLE33k4CvQhl/hgv2xczCgKt5XpEGNQY/mS+liA71Cl8fMbhS9b1jKCub2h4QEc6d6gXrPofYR5NJXt1NIxPLa2Vdcwj/JHbOv9tcmQl2+TEOeqfgmPe8IhqXAePdw1iBWGOcD6AVriKJMt7+hmfA8BHdhRaaGUj5dQhtsclbyG07njt2bWHlskVXwnUCXjIPgA4RzEZMaBLgj330fm0dCc4uGN2ZZ1h8PT18R1ap5CsSLeGqhNc9YOEJvZSF9QfVpvC8JfKhBicfAW4dPRZ7hf8S7HgehdlPhbZKdclolVypHf5ohXJd15/h1OUKeYvx8N+NFKBGIXoIqwxdD5a3mVp6SPDjE8cxJltkzgHsgsNpQcXw4XVxI0EyXUM4l4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?elEY5d/Eaky11QKLszEq+67tYLQTLvcgjIwN8Q9JYbIRDLS3liXBAWXgyOwo?=
 =?us-ascii?Q?Ii0WsSyyQJ05FSZHIsYPcsICHiFuoJWF7q+PRU2pMEGZGK96i3sR0R+MZJm0?=
 =?us-ascii?Q?IVZk5t/stbH4FWoFIynNgZupxX14So3JeyVQdRkkF9RuZK2zcyfPjGi3tWZV?=
 =?us-ascii?Q?UI8U7/lto6lkNq/5LnK7WUqaW+B1VmpiENLhZtL3zJQoDNiO/MXeL50DQ+o5?=
 =?us-ascii?Q?RMq8deVVq/o3NRz+k2TRikUds966d1Wo9h35OacpJ9iAfzBpAxmztyT9ILuh?=
 =?us-ascii?Q?6Rx/AsSRsmfAhLt/CgMyJC6RtZlN8RDI9PT2TuTrGHhmHmWfOP98VY5HQfOx?=
 =?us-ascii?Q?HiK1Igbbbu09KWXVMYfvR7Bsc7qH+jVA8tXioJdbAQCxhiz0yeF2gnFDKy4l?=
 =?us-ascii?Q?Ec0+4M26X7ivg32PAo5OhVWmvR3L4XLzsfFvoEOtqUmUH6oVStOtrbnwkWV2?=
 =?us-ascii?Q?e2Hzh8OocwfCGg2fUrMsfmvw46+EpF3AGmBR9ZZbAKfp/dFrNFQlxTg3y2g/?=
 =?us-ascii?Q?fk6t5hFrgv67d1vum23YbvCn7P40SgzyrUVtDi7qQxhWMM4bzTjh2HuWd2D2?=
 =?us-ascii?Q?xoOi7edgCLJOfzDRgRfkn9vOTmjd6XnKIxZ4xMZFk8zRjvs2PtuS/yo+IXdi?=
 =?us-ascii?Q?3TFFbdOzH9+wMueDkEN7yV3xpJvHc1MuSNCVGqgDe89muUNQClkoxw2MzXiR?=
 =?us-ascii?Q?RBJyQQEMGix82sY+IPb2lrIv4HvKTZlc2fjgrmXXEgpHCgV7im0gcy2V3EZ3?=
 =?us-ascii?Q?ZnDN+kM7jAZOt5+Sc/pVdofGYDxFrsq8qzcGYPedc0L96acKReqSEJXSua83?=
 =?us-ascii?Q?L7pC8MhRktnQkXiVI+9psVBajH3mtCCC1wMc77nSDcfq+sArGz9QAC/3+Jgw?=
 =?us-ascii?Q?ocyrj0aANt3R7lNgUbu+pWcutHG1aMb1dZ2wZqIVF1aXnhnbEzEcl7PLlgfM?=
 =?us-ascii?Q?7yftfsdWg7lGNpYlIptw/EyTjC8vU0nRmPkrVEyY46W1mmyCzzc/aru3EuWL?=
 =?us-ascii?Q?x8MSVCY8LhPho6scIAw8RNqJQqxvsCWzB3vgEGSpp3pmL/ZX+9cFPXelKxTj?=
 =?us-ascii?Q?r1LdddkxHYl6aiU0CiqeNDA5R6BUaSxAfuZf8kjiOSf6xH+TwVHa9pMSY4lt?=
 =?us-ascii?Q?qxwARFeZqnHsZ/gS7q0Qdj/ug2d3odQ8dhLx4IaOhXLDTGzdkguzKdDfBl4j?=
 =?us-ascii?Q?v8mldwLXm5t7AwEeyg3aGQ4UgrgFyAmB8q9ELi8eb31YoT2YFdkdpW8oOk0n?=
 =?us-ascii?Q?sgMlroIJthaJL4KuLYzeT3fkc3P2lepbDnVutqJ7pzta1Tj5tCykDQj2h6Xp?=
 =?us-ascii?Q?OyfLJ1Jp4qQJE9BqPKtuhsDVnElLESf57BxqU6YFvixZYHb0ku46NIcsmP/b?=
 =?us-ascii?Q?6FTTkbOs8/Ua5UhXZ1vZAGWcZ/BFacz48y1nkWIeSHSpGKU1u+je8qzLZxTr?=
 =?us-ascii?Q?5MOxDy3/Rt4sc7upoOCt4itA6hgMluCQCHq+4OnQSQP7khNTuESU6cL1D/Xo?=
 =?us-ascii?Q?njv/SiZ+P7OePVUPI5RTRk/284Ghzzin3BCetCVBC/USuIbLScfoB/mUnzE1?=
 =?us-ascii?Q?YGpbCGkUtpjp1caa5Ur9bSAbsGDC79Jy79Dy0b87QhGU+tpTc5JT1k/ZKibR?=
 =?us-ascii?Q?RZ/FiVQ9eZpzyGsO2XMwjdKlQNfr/AJ9oclIGGtwTusrVfMhkze3NueeXY1C?=
 =?us-ascii?Q?d5lsiTJpKxZRhjt4LgF7xjECcRE4dfcSXAvEoM02D3YbNJpW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee64aa-43e5-4c3e-de1b-08de8c307606
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:41:30.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIaQPKVBAjmHQ3+1xWWoMUMMhEH9MA7QdVgRETDEkxsvibCqCN6xjcky3V+BmlbZBMy2xYUzhUXUkRyfsGpqYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

On Fri, Mar 27, 2026 at 06:16:34PM +0100, Stefano Radaelli wrote:
> Hi Frank,
>
> On Fri, Mar 27, 2026 at 12:51:25PM -0400, Frank Li wrote:
> > On Fri, Mar 27, 2026 at 05:32:43PM +0100, Stefano Radaelli wrote:
> > > From: Stefano Radaelli <stefano.r@variscite.com>
> > >
> > > RGB_SEL controls the routing of some carrier board lines on the Sonata
> > > board. The two PCA6408 GPIO expanders depend on that path being enabled,
> > > so describe the selector as a fixed regulator and use it as their
> > > vcc-supply.
> >
> > Does below resolve your problem?
> >  https://lore.kernel.org/imx/20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com/
> >
> > So needn't hack select as regualtor
> >
>
> Thanks for pointing me your patch, interesting improvement!
>
> Actually, in this case RGB_SEL is not meant to model a selectable mux
> on the Sonata carrier.
> On this board it must stay asserted permanently, otherwise the
> downstream path to the two PCA6408 expanders is not accessible.

Accroding to signal name, it is MUX chip select signal. Of couse it may
connect to a buffer's EN pin. I have not checked your schematic.

If it connect to MUX chip or some select signal, it should use above method,
even though it is permanently asserted when access PCA6408.

If it connect to EN pin of buffer, regualtor should be good.

Frank

>
> Modeling it as a mux might be confusing for users of the DART-MX91, as
> as it would suggest that the routing is configurable, while on this
> board it is actually fixed.



>
> Best Regards,
> Stefano
