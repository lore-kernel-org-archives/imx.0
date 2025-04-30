Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF801EEF9
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992910; cv=fail; b=ug5ImWBHarWxHqa0fg5ZKLm8fzJVwEjeCUm7D8G31sDqWT4W+vUxq5bhiRdwFnnhKVNaKSSin+k4R0mVyHgdarRVnFgTg/SrRvn7p/tfgGI9FyrQyNA96x5X4s+E1jVC1OcILfeVGYi7t0F3lfTci31qK8nXVMuPmGyhef0hx7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992910; c=relaxed/simple;
	bh=Fy1HubtrpHAJTqTtSEljAy99EOCwIHj1QuUSrHJVUjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sXVVBjHH5wzXoQ/qFE8KAufpQoHi+JfiNiAaL43Qf24iKqxGePidc6vSGK/rWE1aE3qL8ordpdIkV++PzmhdhWiQfrGKMDGV78+cwDRD7+znPxrZCVLG1e2lE29O+CJ4LI3J9mz0Grq9lSe8oLBOmOnU/DVzFvVYHGCs5VS0JWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dPbAhoOf; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dPbAhoOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR6IFKPEvdXKWnw2ge7bWAqJofM0AlO+NGMGe+TDRNVbD/PWMrl0rXjLe0hbeFURyF8y4oPneeIrAydsbEWfLqGeRyvUqP223qDu5B6nmACg6CoX/PzGvS7ys/fPqb3MBamLm3CqbqaYqpBf1y7QwVL5x9VjGIt0kPOqGiwXfXKZX1QMsQGeemXrR5czOnijURYFn1bi1Vsnn+OGaySV5+K/ugzWj7rqzWr4+IidIo9xAhHgFekJDWuvwnVpYiafwbk0KQimT7YJ3H8iD5gnalj9hzLt7FlYStbzLqHQ2YGeA5hKtS+42+FTqUZtnqeHQQhpA6ezMdmqkwLnelcY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mQ5CNOweMNDOfHXhXWKk7JbACFuxo4pdYrB/F+fjEk=;
 b=FoZrZxqn/yaOvbW0CNe7rBXpTC5zzhjcD15tqJo7+TgAETzTv27rG7LjYVcgCneJMStVF1UCgm4UjlHjwDfCHuuaD7/MsV17l+wMF2BRQGdq/oigC8q9oQOvn5B3AwBM3UfDDvupo2a4B31vhVwE/Noxa3CE2DCBL1M2cChF4pBFP6VOfLYdtSLiJcLOcszSmydSOh4cNlRJD7wXdxa57IjKQWTWCInxZ89OC5aG9SdA9notjaMWhrhHPtVSx6UDURoosIKkiGRnRRz5ROzRouqDpdNBE4euNHOJpuRpRjPumts2FpaF6q/Z+btbiXsl28nVcpKwWWbma5vTRIwk5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mQ5CNOweMNDOfHXhXWKk7JbACFuxo4pdYrB/F+fjEk=;
 b=dPbAhoOfi+yDpPD13BQoPw8cSS9nRM22k9sS0Fpc9hktRRIwTP3Ba3RjQYEHKmyi/exqMSEAD3lY3kPuSwAoOTl/VyuwVLBjXWiMtIFGyR7gh5WKKpcOyZARLB0GvPCLq9TH+upUHTQhWqlxNJJtTJgpb8Cn01QUmLNznXYP3WhjHr13bNLAK1L6Q3oHkR0LaP7r6CtIgfkH8e6JRNwo2IW1BcdBqSGe/ZXC1zfBHJF5Y2Cwx8V8yJKqUpDAv4OE1pUOroxdI++xH4VUqU6AYiXeU3OL7XvTOCCfgUdZ98gXO9E4HpqNXcVI6p4YJAmfbr9jyaAj8j0UY+Nx9X0O0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9702.eurprd04.prod.outlook.com (2603:10a6:10:301::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 06:01:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 06:01:44 +0000
Date: Wed, 30 Apr 2025 13:57:47 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250430055747.q4udrsd7z77jj3xo@hippo>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
 <20250429-charbroil-easing-04f579c68a2d@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-charbroil-easing-04f579c68a2d@spud>
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: 676a9c18-17f3-4218-9cf6-08dd87ac7c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kFvpGM0ITotJnS5dYSer6KX0yKlw/SYLxtzu8XoyvE2y48rarIzF+1nLU4W2?=
 =?us-ascii?Q?n0MH37ANhg+ZAGjZL2IPlfV/qGYLTiB84FLx+Fv0AuCRCMPglwjVZCuvAwPu?=
 =?us-ascii?Q?3GihDlh0FzfBzj0CZbt4dwpCrxQwkbivsaUZzTrx1dNvjc5ZbiGmJFSgYFJ1?=
 =?us-ascii?Q?s7gJadyiEylZ/zHem2JL48NVCoWJCzd8z1lH4DlV70ejqaBH6RaFdnX2r3cx?=
 =?us-ascii?Q?jQbnlIuERUoqcbLIceMll0PnU8lFMHFZcpRlTPo/K41L2tVCRgsmj2u5SfKH?=
 =?us-ascii?Q?hq9KjYIEcMyOMKQ95gMT0dM7w/LYA5PrrGvoJDgV0zlgXuEfifeBRZBgCy3h?=
 =?us-ascii?Q?hsNRb1MMdcvIGhv4s8a29t67fGt2gTq8z1ADlU6/OzCBbovLP3v/FEbU3hnh?=
 =?us-ascii?Q?aA6HYUQgwKiARwNc+cSR//L1w+Czq1n+brCNyfvIokffqXMGfudtaiv806MJ?=
 =?us-ascii?Q?Co8jQWbIMHHXHWBs2nh4fpS+xq6rgh01VD+vKlZNkumCCDaPiOwk/NrDOQSe?=
 =?us-ascii?Q?XFMe8FspsUesd3GzhM1Zggmime04gxumobm/oly2L6/fUEjhQmhReq7i8Gxl?=
 =?us-ascii?Q?Gip5JwGddyrlQ5hKqDPWKyDl0hw1mjH7Hf3rckyp+ntj1E5QxwxmAljLVvDn?=
 =?us-ascii?Q?4K7oYyK+cJqa7lujWgyG77l6yvyKg5C0bToYKTBVyDWsvmgguW7uMM5I/pDH?=
 =?us-ascii?Q?DcHwESXvbpH5kleOjypFeVevufQEYb4vxmmumhYuzMdOGs7xDAbd9E9t9VtB?=
 =?us-ascii?Q?o92GShQWNAEGw0CTrF9s3DYjQY86jzfhGvTcCJWqVE5NenlnBxNhkN9ybKCb?=
 =?us-ascii?Q?TuawhmHKqJx8ohgQ0aMxB1Hg1x+e8IoT8inNLEMb9wHFbGUG/e26APTBhqPt?=
 =?us-ascii?Q?70VW/c4MGRpOfMcFZf6wk32iQdZxJv3uNX41shCiQXzWx6Nazj8kuEomMXOL?=
 =?us-ascii?Q?+sbXyW3AKGnYW2sSBH7eTumIG53qibm+/Dn2E/A/HgdTMgS9+IruV3nx/ABh?=
 =?us-ascii?Q?hmmxcFSIgksw1PAyb/gcMjOTrvMO0IjNNJ61VO8+bv9nwEgo5Mfbyboxwqqq?=
 =?us-ascii?Q?vhHiilLzXHMFGb5fBFdYyQSotWvL1zhthAecaE0EnREji9vcrw/2zP3PMtv1?=
 =?us-ascii?Q?mUH6BnfDfDdsY+ZBCdDit8NY6P8ENnL/+1yx3FNueA1k2I0pyN/mNyDtJw2r?=
 =?us-ascii?Q?FQDkOac/29qCShUE3JK45HP8QfxIOkDIF8rF3KPqeSg4hpPWGIrU+Q27gFYw?=
 =?us-ascii?Q?U8wKuvyN2j13bLmYB24piF19Vad5xRRuJli6T9pW/jkpLV/zNoMozmibDIdf?=
 =?us-ascii?Q?w9ekvR5UL3zaN7z/2MkagkzZMhBkcoF2Zfs0GIVeeAbomwpgyYuS9fanciBb?=
 =?us-ascii?Q?PqGvn9Iy2ERDsytc8RVCzqvLBcrXUkBHbEisulz4kgAl2elvOCGsgtvVthGs?=
 =?us-ascii?Q?0w84nU6OvN06SdmzfHZYNzchy56WqBnzMcv25f1J/gEm4TF/3y0BGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G0Vtysq5Rfy5Fpi4ZO8pSEUna5yhExMgGIVRMqn8SFvowNQlUcaVuOIYTPZn?=
 =?us-ascii?Q?MUKko7XdJPGKlX6F0NrnAalkoYFG0OCdbIuS0fqHhzf3o55NHj1JNExcVb0E?=
 =?us-ascii?Q?RFoUyXYDEj4dfaPKNWiO7eP/fieutg4XmjdCZw7aTrBkh3XYV1PUPp1gH5U2?=
 =?us-ascii?Q?HHv7AAki4yZH0yI+udv5W5NuuhS98pIOr01n+tZU5WHYg9S0ZA/2oeBuaPcp?=
 =?us-ascii?Q?lCygRBJmTqg0BLHwex1x75fr7En81HEDe3TBK2TtX5zun5zeh0edIs+H9pbT?=
 =?us-ascii?Q?enC4Pna7ww9PkG4bJ2yDG2Vl8ksw1A/Ecn0S1z6sS9QsLjbPn/UC/c+V2B1M?=
 =?us-ascii?Q?+0X3/INEkdzAXVhxv69qh3OFFlDQg2NU0Gq/4w441hR3ouDU29kzXXNV9XIV?=
 =?us-ascii?Q?vviE7cpm7pIRp1Oj7UXqPvkMnHUuGvWrSQPWl02y/PXt5YuHCP/eNkqZGNTd?=
 =?us-ascii?Q?syfj3sda+riooFLT8NLP9i1WMNRD98B8zW+pH332QToxyu/JWbEMCeyKvWVF?=
 =?us-ascii?Q?k92MOeLXVNFicDrBMI2nKU5wg5/FeOTr4v0RZXVvVE8laYG3kaHDba57IoW0?=
 =?us-ascii?Q?Q7gHpUD1YWvMrHGotXYMYEY0pLFQ/fnBUlgTqVzHnjVMbgwXKLN5U2eYhNdY?=
 =?us-ascii?Q?EwlMu5eK+U56UzRA2lVaKVgn0LZ5CZeVXDF36VmiND62OBLgkuLDRmZnWL8D?=
 =?us-ascii?Q?wkEokeWXTlaHHshnQk/Rbp1T2q20tCpVABRiECf6ahtssz1UnE4d65j9XVRD?=
 =?us-ascii?Q?jFgONnbJEkgjBUXt5bVrXqQh4gnazbWA9IQ2ftPpavGbc0KDLbR30MrNynfA?=
 =?us-ascii?Q?zM4NQzqbP3fFMvqCu8W1QZhdVtib3ZOQbkBpjz4XbMclWjJdAwU23+dSICEG?=
 =?us-ascii?Q?FtALb05Sj9kI8oDCmNPzIoTLHACu2Y5lAIK+HwYoQo4Fnj0yIJoRrr98P1vB?=
 =?us-ascii?Q?Grds/89Nsh26ou874B5tDmDkx1/QMVhBFqC2wT3RHdz3ecZWl4ArOvoIFscb?=
 =?us-ascii?Q?b7OBgBsH1/wC8Es+us6qTj4MTYdo1t8LJAt6+mXWmhMquX/KmlCvSga4bXJk?=
 =?us-ascii?Q?CJMWTXTgSbggGIeeL8bsuoVpjJXElRv9MDhLMWMKfOaZp03AZNcVPvdmDzg1?=
 =?us-ascii?Q?MWjObjzDlL6j318bFdoFQPNylvmWEY/MD2Mu21rNl2lfv3TKRtchKdcgOzWW?=
 =?us-ascii?Q?GMs1sK1XbgNB3VfHjQSJLJd+kpBZUac7htb2H817KrN7cea82jLoJnth/iXt?=
 =?us-ascii?Q?tIEYcthP+7fOi1NhgV5hzQghlkbErEocDUFl1ZkT+nsvPGrxGbkAFPXLNzcj?=
 =?us-ascii?Q?ZslN9Fi+dfjp2b8G+gpj7LmjmOwxv6TigsuX7D8V0sGwzZpOc9LDiQfcU0qj?=
 =?us-ascii?Q?5PZvg2UN+lIGTIbEBkYGNtJx35J7PZ4keXxgbzC1nvWeHfvn97S/Ds6tPTzI?=
 =?us-ascii?Q?6eHGC3KaqSzb2SIF24SE6b9uVDtVoi9ZfvNl4dw+wp1vCbqLclODRLqcoK6x?=
 =?us-ascii?Q?A4gn6jFEyNjzJPmn4llkkCA2+kbtc0VaHNfsCzbV/t7d47us2J0zFHe2dyzy?=
 =?us-ascii?Q?4pezjHKiwgMtdpSqBLa1VHYoI0NxyhOREj7A3haO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676a9c18-17f3-4218-9cf6-08dd87ac7c2e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:01:44.6229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWgFylyhzbUjiOApUOlUw6t/QW2YvRW5N+gpNDQe8m/FA3mejXSBTGyMxVFNWNGUrHA/SYZzOx6+td9CA46qoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9702

On Tue, Apr 29, 2025 at 04:10:13PM +0100, Conor Dooley wrote:
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
> > 
> > The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> > and i.MX95 USB PHY has different meanings. So this add restrictions for
> > them.
> 
> It's hard for me to understand from this if you're actually changing the
> meaning of the property. Will the current/old values continue to
> function as they have been?

Unfortunately no. I am going to rework it according to KK's comments.
Sorry to bother you.

Thanks,
Xu Yang

> 
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


