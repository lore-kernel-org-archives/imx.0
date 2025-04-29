Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2082.outbound.protection.outlook.com [40.107.105.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C62222C7
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908244; cv=fail; b=lI3MRrg5w1l/kNK6PgoT05Nes8LsSNEAbZ0k/rRvzGi4Yro4gZ70A+7TvRgoQ/oqdDOABDOODo4xG/oaqT68zFB5C/ha3SSgztxgDYlc52lOAe6axXVXSIwcgwHl5D0WZ5K2wHvMRW+dEJHzfIdKONzAe6Nh3jOMM8Hz6T+98Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908244; c=relaxed/simple;
	bh=qdaHFEEmhgAQ7BQ5vjZUNHrXgu6NeItYCOXLbrj3nqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XuAt/brqmCQ3lhV1tTkpCXdk9/guDsq5nRk2PTL6ogXOc9qSFO/vQ4dxJOVgb4Kop7iTt7W8Jhd/w/MEJm5n9s43GMk6Rc9xRxBCpRT82ovqlwafMWWdEoyTlaHzNRU8uRSwmHROPKF1Dh4H/vDXsrRl4LFixlBP0C2NpQnZRtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YGPOhCcS; arc=fail smtp.client-ip=40.107.105.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YGPOhCcS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4F1whirCmdyshM/KHOgl8p3vJc3aFI0CXfqNQaDDs361/XacYTpjo2i+ArkDAYeYHuXOtJx+B+/5iwFqNZ4P6kJwNXvrP9dOxf0fuQzO/zYwvWIRL4uLn1g9R+IqvfJdaI66NSq6+r7CaviDqn5ChPaWN0MSnaj3sWIOzEUm9zME/Qui4+S1YfJb6FX2mQMmI84cOm8DgUkiCY30tZrNrlWrnyhihMMEm2FKi9wzn8KdIH/EZos9AQ5uTtayPYrHbohZoo0bTkSL+neSiA3M7MHPLKRQ09PvZaXWpz+HsLIAe8asFC0XC25/8cpDQlVckRxnsTWp2LgeuOQMMUKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwgako3mQ+3UGHOHVxy3N782KDLSRHEJVh0LtNWCah0=;
 b=pH82GhWyTbhTje75+Pjey3mpHstE0SJY5UINvmH1DuRcpPpHAae+qdm/UEuiixUsQbCzE4Pel7MvNhBIfItkEm/TtWD8SSUaA+S4ArNZ3P7hRrEDR4DCcPfqoolXARy42JEtYWaG5zRCuCelbG13t5P+thB9ACA0YO4y16fO8RUBvTC4S4fXx9xPCEfQAoE20q90YIJyxyHa1M0Psld+0MlgwoPXH0zkFyk3eDdKjjnN3OsjqOhysm9Q4SNx1iUIJjGaHPXDk3pTpJck7DPaE3n9QePDUE5CZM8PMZomeFei5cU6rsjKUDJNQBwh2IlKg9pmzus4J1JJhlQtACOTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwgako3mQ+3UGHOHVxy3N782KDLSRHEJVh0LtNWCah0=;
 b=YGPOhCcS4CUwZXG633njIYEKeTiO5rtULKoy3ZVM18tA2+RPGQQZtss5z/V054qH9kNfwOqQ6PBM1lWmgjPSo7CIhOPtAAb+WpQRH8ICPg0lG4GqWj8fEvGgFpVA1VamBjpOFOTO+hLLZy0j07+lqTeTROSwpxEMi1RvxhRqXvIKjQCCfXmCko5ajKcyDhjgIna0O/rf0Q744yroS9qP0cwoX+yvkS9e/UJXpOPtZmSiYPPOMZycjfhDqZ69Rs68lw49asKQE314OK5AVEq2Vf/+1tDBTmusdYGMbrR4fQDnUnKbvaK5uehFvsJevXEduzsEKeuQQIYdhOWj3wYJzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB11079.eurprd04.prod.outlook.com (2603:10a6:10:589::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 06:30:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 06:30:37 +0000
Date: Tue, 29 Apr 2025 14:26:40 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250429062640.cqqtkp3vwkd5a2gp@hippo>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
 <aBBpzljSQEnQwlvU@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBBpzljSQEnQwlvU@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB11079:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7cb111-c779-47d8-9c98-08dd86e75a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1R4lmWaPmWri8krgL6E0MxdkdMCauvOzy3rg9fM2KFb4GI1vt65kMn75PB07?=
 =?us-ascii?Q?9CvsEI2d2pA7tQ89gOdfcROb25cgpm3edzbKGIh+5gTmlnRQFqyjGcNIBoza?=
 =?us-ascii?Q?zBNX/AkJIkYVFm0LXjr4RB2BlctXc2qzcaDLBtOvvIv96LkoGeY9rUL8Rv3T?=
 =?us-ascii?Q?7TYJAh5FAcHh3K52xiI3XFt4YbFOU2d8v2rFNuzoZT7jsMJs+6x8iGLzLwsw?=
 =?us-ascii?Q?1Di3Lp3EeyF3nirNXTw1E5EfA/bRDmVhJW7qauMz6uAqGxZ5XgW5z3rDN1x1?=
 =?us-ascii?Q?/f+oNA/kl0MkFXHIOYOa9HFMHkG4tWw8mtC49NicY2Zom3x/BGwNEBtGJ9oA?=
 =?us-ascii?Q?jLpRZeWQmAPfKt+JCn/xzevbYYLGO6TSxWSV/kkv7uKbDFKMWD/Y2rLisFK7?=
 =?us-ascii?Q?1d8db9vNM1CV5ZyAW3z3zY5JLv5Dz0x4nkGfXVUwrMlvNomuzppzyeajWnK6?=
 =?us-ascii?Q?Ack5zVSCw+F89kqs2w/vlQGjo+C5EM/Pdosp0ZNhO1442jLuacur8K3X8Ej6?=
 =?us-ascii?Q?pLnfl06WD331gXBr+7KICKZU40FW7JvziYjV+09VjpWzoqiFzfyqiAtfLUqg?=
 =?us-ascii?Q?oFj5UzUoPFNZjYtb/s/5aCxZ7SUwNt5IKAokxAzXNl5qXmsxLX0OWJ3/lL3q?=
 =?us-ascii?Q?JkW8PutgIEBykQt8mMB8Chs169XwR0wUR+cAt7/UDDJBe2s90bRRoBh7IRug?=
 =?us-ascii?Q?etfrS3sW7PwsimurCCM1+sHEJp/efjUzBR/7ekJ6WXaX6PTambmqk+Q4WfBC?=
 =?us-ascii?Q?rLfVFNSXege59WFgwfDXKWC4UMKB03FvKuP82Tnx42qAY5r8pRDaROQ8NifA?=
 =?us-ascii?Q?AhQqJr/2d4GXhVTAwmmCF+Go/txQQxn3ETnXOSmbMrxUpg1nUNo21872XCGb?=
 =?us-ascii?Q?ahUh6RBKC7OQBZAEE9AAoB1ocDuzraqhX/nObHETS0Nk8LLTQElr9Xh/Q+U1?=
 =?us-ascii?Q?VfnGTinXWkzospZkKQBBILtlWlJ9dOj6Ug0eCEj4UbtziHQVJaw0KZLfO7ed?=
 =?us-ascii?Q?aI+jWPW2qDNHOx+tLtzr9huOkzaiTm7LUk08CQeg5BrpvTBPmhQZegvrClP1?=
 =?us-ascii?Q?Z8muh5P6Ih9Iqz3VYB+RD1wbvSe4qG8xhIHmVl4gXIlyI/hMQfnfE5gQAf+K?=
 =?us-ascii?Q?62uo8sjLeuxRSagGPRiBp3UFzQXycsbI9bG9rjDgE2flX6TKNEjZ0Z0Kf3WW?=
 =?us-ascii?Q?KgHtomSvVG0IxLQp0g4SDZkNx8lXThFIL46zKlD/EUPvg+p2aSLYiALAH6BC?=
 =?us-ascii?Q?k5RkLSWPzFmXq/kpUE7Ul8rBcYbE0SUQqzko/r0gF0fstv6ZDv0716gR5+XD?=
 =?us-ascii?Q?TdyZy43t0wNXemPv7VqqR74nw29q2xUux09cm2ErvyseTs/Ymm3rNkR6XrQw?=
 =?us-ascii?Q?5JdN3wCySPxKig4TFy5C4aeyVb96/KGHU7jCT+U/AEhzFl6dkI4vKV+bFfn4?=
 =?us-ascii?Q?aWKIQTVgmba84t8kqJ2zWqpZY7o7clbMgx2c7H0RyHNDkoG7/yOj2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zfq4b9KGkab6fbTuHUvF82uWY+3gcJNbpFtA3BUrRDzSdIM9cjwlXW+mXY9A?=
 =?us-ascii?Q?ZrBjz0kPcAkH/bLLrU0BRIwgRVAnOvkXJO79z4cpiClxClgwipLavWFpNDjA?=
 =?us-ascii?Q?lxspgRb4TfthNDj9EGwlnYDPUegvzkQrz+aAQD19qeq1hayojNOQrGiSIx5Z?=
 =?us-ascii?Q?5pa5CTCKbhO9PVrja1ttbKSH/MzhD2CApNjdNbfDv7u7PO3KViDKr0JVDi07?=
 =?us-ascii?Q?RXsbsdkNI+zZmhhmBQY0+WITNPcZQ+n9nV2DI8zzyZ9wmM2ZngFtCrjIZLs0?=
 =?us-ascii?Q?FPRoBRt/cWw2hdHWmagWC3NdbcxzVIbAm9HdsGtlzHMy9JZ6uzSu4xjYqJu8?=
 =?us-ascii?Q?RGcQzDzc3sG1XpgFjKatcV2VcNgWOfzkHOdnYRanE28T+lqYxJfGd7Y0kz/G?=
 =?us-ascii?Q?1CqeA0rm4drlLppS7aq9MZgBbxuB33GeDb/W3g9oR8K0lh8DTeTyKRtqjH20?=
 =?us-ascii?Q?+tVPplm3RocWTp5J0v35JC8cM6IoSFnTW20Ts+bG/QaFVdgfV43hyKVQ5fQc?=
 =?us-ascii?Q?17dkwJARbTt7YINOJS77rccwQwOEfU7wikp1jRwcLHj1jqvnY6NVakkzlduk?=
 =?us-ascii?Q?wclOIUccKEWH5y9b0RJ3mNKqVmKKNxXARcfInoXbbb5RPH3hVjy4w3gk76U9?=
 =?us-ascii?Q?wHNUzhfSOBT53tm8RkSlhx8da0kMxwOqYmooTWgDpYjzNXvKJb/jZ2x9n0bV?=
 =?us-ascii?Q?qK9uo/DSbzGrQwLXZZHRp4lhJOJRq0fIDX1UMBvgZjElJw/qSnhauQf82Xzi?=
 =?us-ascii?Q?/OmDz/0E3fJ3hkRmjywWu5Onop4hJcGOC44/4tvP7Pg2jsBczE7PbNQwvhUf?=
 =?us-ascii?Q?2aDCvA3FsEKRjhQbNpwilrNu3EcDgAatlTXwFHZ0xKuuP3WAonKnKVQ+alvQ?=
 =?us-ascii?Q?tIF7Qgjx39jVzJqn8uJfLkp1gfVfva6kF7pVNbBmi/ovTxcPXef5H+fGt8ff?=
 =?us-ascii?Q?j7FmOkb6nESJPstOm0StbwaQjIUNmnQZ47HOxRb4GkrDiSywLSOg7LubpiyH?=
 =?us-ascii?Q?eSwYVEJym8XzupPGWlxZvth919dxUUis0MSHnLa61otpsqHLulFZ4EsqzwBE?=
 =?us-ascii?Q?0crIcoI7lOxeng6naNgSnf4f0PzWo/7/S3NCx3fa4X3lUNRhiHj3/B3mqi5A?=
 =?us-ascii?Q?Ea54xys/oInizCVEsmxyhVMscvEUyJjtsUbhCwn4YnpKVjVN783CLctZxQ+v?=
 =?us-ascii?Q?3qZyUDSURKZ405rM1rPTD8MmGkGBR0tZZiV/TfJV4x9Irz8VYe4ho9MHCekT?=
 =?us-ascii?Q?5ni3Jp8ahqZydO79tEGWAfAxi6CHnDx+fChZGW1vl9OaU82BoonYyc0L/ID1?=
 =?us-ascii?Q?wf4r5ZwZ9y0uIeCX9LDhJC/SfECbHExqRkVfma/Dp67Ohm2z7Y6YOkQ39jEO?=
 =?us-ascii?Q?p/VGp7w7jjepysDxhg92BQVZUR0EYt63EMglGbVSBszmF/zMrox4dc1XpU/Y?=
 =?us-ascii?Q?dGnhJLjwE8KurxqB0MxG4Wa/7Tveo2Bt0R62zXV2ZykyB2w0SmyUh8HfroME?=
 =?us-ascii?Q?opAeFxrmlX6KApLOO4BZYWpxu+GE/uT+I4mcXUzfwZlAIstF+QURGbRL43ue?=
 =?us-ascii?Q?4W+qfJuIsUsAmLdXwr6HkUkQ6wCgi/76UNkQqXwn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7cb111-c779-47d8-9c98-08dd86e75a37
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:30:36.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTKxrv5y+oSc1MDTFXoc+dG3HodqRbLhR0yfsc9z0d0W4QE6t/ghJaNwDropOlj6WKKx4qDAnLfhl0TwriWKNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11079

Hi Frank,

On Tue, Apr 29, 2025 at 01:55:26AM -0400, Frank Li wrote:
> On Tue, Apr 29, 2025 at 11:30:07AM +0800, Xu Yang wrote:
> > Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
> > properties") add many tuning properties, but some parameter value doesn't
> > match the register description. It made some changes based on the original
> > value: add offset to a negative number so turn it to a non-negative number.
> > However, it's not easy to find an exact tuning value from register field
> > with such conversion.
> >
> > Because device-tree supports negative parameter number, this will improve
> > some propertie's parameter.
> >
> > Mainly include below properties:
> >  - fsl,phy-tx-vref-tune-percent
> >  - fsl,phy-tx-rise-tune-percent
> >  - fsl,phy-comp-dis-tune-percent
> 
> It should be standard unit. for example 0% to 100%. DT don't prefer you
> direct use register value.

Yes. The dtschema and driver already use standard unit.
This patch is going to correct the unintuitive expression.

Take tx-rise-tune as example, register field as below:

		00b - + 3%
 [21:20]	01b - 0 (default)
TXRISETUNE	10b - - 1%
		11b - - 3%

The valid value of tx-rise-tune is [-3%, +3%]. However, the current dtschema
add an offset which caused the valid value to [97%, 103%].

fsl,phy-tx-rise-tune-percent:
  minimum: 97
  maximum: 103

When I first added tuning property to DTS, I thought I was reading the wrong
dtschema. Other users may meet such confuse too. 

Thanks,
Xu Yang

> 
> Frank
> 
> >
> > The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> > and i.MX95 USB PHY has different meanings. So this add restrictions for
> > them.
> >
> >  - fsl,phy-tx-vboost-level-microvolt
> >
> > For this property, the parameter value is wrong in register description.
> > This will correct it according to true value.
> >
> > For detailed info, please refer to i.MX8MP and i.MX95 latest reference
> > manual.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >  - keep widest constraints
> >  - use multipleOf for some properties
> > ---
> >  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 60 +++++++++++++++----
> >  1 file changed, 49 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > index daee0c0fc915..71e5940ef4b8 100644
> > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > @@ -42,16 +42,17 @@ properties:
> >
> >    fsl,phy-tx-vref-tune-percent:
> >      description:
> > -      Tunes the HS DC level relative to the nominal level
> > -    minimum: 94
> > -    maximum: 124
> > +      Tunes the HS DC level relative to the nominal level. It varies
> > +      between different PHY versions
> > +    minimum: -1000
> > +    maximum: 875
> >
> >    fsl,phy-tx-rise-tune-percent:
> >      description:
> >        Adjusts the rise/fall time duration of the HS waveform relative to
> > -      its nominal value
> > -    minimum: 97
> > -    maximum: 103
> > +      its nominal value. It varies between different PHY versions
> > +    minimum: -10
> > +    maximum: 20
> >
> >    fsl,phy-tx-preemp-amp-tune-microamp:
> >      description:
> > @@ -63,15 +64,14 @@ properties:
> >    fsl,phy-tx-vboost-level-microvolt:
> >      description:
> >        Adjust the boosted transmit launch pk-pk differential amplitude
> > -    minimum: 880
> > -    maximum: 1120
> > +    enum: [844, 1008, 1156]
> >
> >    fsl,phy-comp-dis-tune-percent:
> >      description:
> >        Adjust the voltage level used to detect a disconnect event at the host
> > -      relative to the nominal value
> > -    minimum: 91
> > -    maximum: 115
> > +      relative to the nominal value. It varies between different PHY versions
> > +    minimum: -60
> > +    maximum: 45
> >
> >    fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
> >      description:
> > @@ -112,6 +112,44 @@ allOf:
> >          reg:
> >            maxItems: 1
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - fsl,imx8mq-usb-phy
> > +            - fsl,imx8mp-usb-phy
> > +    then:
> > +      properties:
> > +        fsl,phy-tx-vref-tune-percent:
> > +          minimum: -6
> > +          maximum: 24
> > +          multipleOf: 2
> > +        fsl,phy-tx-rise-tune-percent:
> > +          enum: [-3, -1, 0, 3]
> > +        fsl,phy-comp-dis-tune-percent:
> > +          enum: [-9, -6, -3, 0, 4, 7, 11, 15]
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx95-usb-phy
> > +    then:
> > +      properties:
> > +        fsl,phy-tx-vref-tune-percent:
> > +          description: 100x the original
> > +          minimum: -1000
> > +          maximum: 875
> > +          multipleOf: 125
> > +        fsl,phy-tx-rise-tune-percent:
> > +          enum: [-10, 0, 15, 20]
> > +        fsl,phy-comp-dis-tune-percent:
> > +          description: 10x the original
> > +          minimum: -60
> > +          maximum: 45
> > +          multipleOf: 15
> > +
> >    - if:
> >        required:
> >          - orientation-switch
> > --
> > 2.34.1
> >
