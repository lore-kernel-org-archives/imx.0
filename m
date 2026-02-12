Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E81E868
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909827; cv=fail; b=fDsOSXoDJ5vBcGX4AfMH/AKONe0dfUO+cRcwZAt7hhDlSmspB1Wvu9Tjqi7tV0AhnQHWVv8YFTnpv9e8XFE82l4sG4ZZ+uyAkP1QxGnUlLMim+X8XKPF1f8kIY+xyVCXWuTu2DqmWXbYQA30ZfK3X+qDBbD7dONP36ncifjeyk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909827; c=relaxed/simple;
	bh=HCuNQoQbQxS/fiSYmrotKdpCpTPMDQYNx2ve41llB4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ioygVzlrzvTRm2C67t4haaPdYYGC6moKh3hcsX/rqL6FwOKIpHqhKrCecN71BW6r4xQfiuFHeMI9RLqlN9fMVCK2vj5oA+0R8KOVIXkLcFpKEGB3aXyoxe6wIk0EGS1fdtwWwXfjq6nC153vxSUhUY8XopOTFe4qFJ8GZlbhBIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b0+EhvT7; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b0+EhvT7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM4YloJ5ejUIZmbvVwzh7x6/AGsuC91TcDE4eI73zcO4r/Y2yZcPq8l97cKHyTl7kJ7il76cUbIlAJCtYEQ+Ip8TMxmvsCWbJe/PCYtvP/7VG7/JInJjVdx/ZHR1tKIXaeG9ejJBYqanz7E/eBAhh90xRlpeyfuN79AS62eC4Sb5x1+Nz9Fg/wpzpCQ9F4bXdBJYUGIOFwDBpjzb/Jz3+YuDiRsxvFi5NWkVT0Q79/vLRNbk8Gi8o6BnKGhra1zy8lRCEZOYCeIUgkJmQZNUPtE0MVKKdNT3cHe6inzBo8kX8fPBLcnwfvYssrWWAkF1HWo9EYuQAxYL1rqwS/UE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz19lvTlVe1m3yas9mjRpH88PdiA56c1Apbb0jo9GIc=;
 b=vexJsIz5gLCaZUgiEYIANfWxTcv+lqtlujh4D74T2KI8AVepRx9/Iu9PPpD11TOu1Iyyhavs69XdJ9Mx0SF39epamb9cbW10lzKc2DBmyST0tW5Egr05pYc0qYtSUqnXuKkP71D7fBw7BWgKXquAlJh1HSrTTI6dFhGeIKYtiJOoRYEyNtMR8DBdDCNQ4elQF7w7bHA2hq/596JDBZVxqOL8MOA/ZEtuiKjjfIdgRg9oDcwQVEmhazC+KkaE1hTrVBrRpRsC1PHsF0QKQtfogLjgUZxj0pJEuq6nCc8CxR1rgfyMwTQj2y8MOu9pRKO1/oQAf5WRDSid+pZgWl9c7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz19lvTlVe1m3yas9mjRpH88PdiA56c1Apbb0jo9GIc=;
 b=b0+EhvT7LOYN154M2ypTen/Q+BYTKzcIu112mxdewDMULhkat9+jtLusyH6Grq2fslfG/LSrD9ZtTB8crpU01qeK9jr0RjS3t78RJqyoyI1Al8DgHA/+uH0C2vA5LirYD9Zcy8050INLsDRRnQbziQ70atSd/8Zq87nTAG6k9OfUOT0EhO9drOm4m86G7tU0L2mklI0gGas5tbrdHrtK2tqLTCnKJAmH6ZoyUI8XHnliZNjswRrv0BvhXw3MSxhfXPFfS8GHEcjvubO8hsLieTMYiNWzxrdotXxDecmGGo0v+q4gzpmmBSKTpNwaWmIo9Jj/KRMtzkcIyjNOM6Jz9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10763.eurprd04.prod.outlook.com (2603:10a6:800:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 15:23:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 15:23:41 +0000
Date: Thu, 12 Feb 2026 10:23:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Message-ID: <aY3wcx9seqSfd0Zr@lizhi-Precision-Tower-5810>
References: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
 <20260210-mini_iv-v7-1-a3ad8e7ddf0d@gocontroll.com>
 <b6afd8f7-f42f-4f21-b0d7-f270fc6fe5ef@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6afd8f7-f42f-4f21-b0d7-f270fc6fe5ef@gocontroll.com>
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4ea190-0c4a-4541-85b1-08de6a4ab447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8k4wpaHn8HhAXmiMeZ3/YSpxlv1juyw77acIw8ITnP2lftrW1ihrORrZnu1U?=
 =?us-ascii?Q?OBzvRXjaBNpApAAeN7U4+qEx5dRts7JsIAKTAQeEZSWC5hCHGi8gptyFd/Y6?=
 =?us-ascii?Q?9H7uQdqn7KbOF2swO6iyYvBgYdwnBE6NAaOCTaXyv1BS5/HrySg2fgMzSaG0?=
 =?us-ascii?Q?nRorK8iojNrMzLQH+SPbF2lBaegMn2WJUdnq4EjaQgqcWkF/o5nE+QVsm72A?=
 =?us-ascii?Q?tTUxq0C82WPi+BPC/ty4paoqqsJM6Es01va9C060Ml4BBoEuEeOqkEy0tIog?=
 =?us-ascii?Q?njjlUb+xUOrPkRrcSoy6rzN9K79PCpjIsY3419gyxNfmZGetkBq+uIpXSXd3?=
 =?us-ascii?Q?tQrkKd/ddfKfy+YBXY+caI92cgMdjn/QK55DbpvuTNxZfIo7g47h0M2DSSy7?=
 =?us-ascii?Q?WH/ACVgUT0RZkfG3E6arxzJQzpQR1QUFpkymNLbzrA80/jAV7U3zhAqKtBNQ?=
 =?us-ascii?Q?Hbm63DjGzNNFyhd3QA+1Ku1/u7HngO+frKNprFb7X8j++Wz3B0N7baBDd/H0?=
 =?us-ascii?Q?bdIiuGKroAMTq5dxOYwQbHikJYuySH+/KN6op/qPJ0gLulJaNUZr6obDftYg?=
 =?us-ascii?Q?BzOzRrf23U2Cqzs4DmNVpGe5rom3VwSn5mPKRDcN+VxGClTbcIuUgKh8BlZ7?=
 =?us-ascii?Q?BRlPAwjR2SmhopvInsHoAONPdnX3BZBC0XinfuoWK3gbZHTq+jKT/AuUwMxS?=
 =?us-ascii?Q?V2xbrm1UMPOiQU6/Suz8S6F8emlKP+3c8BRMfk8tPmgOOqMP0C+2v3/ba+/w?=
 =?us-ascii?Q?i1eJwO0Xi/6SIGDNMcteamPgTh0gmYiwdo8hZcGUuQtB5uGQpPMWHArNh+vj?=
 =?us-ascii?Q?2l+JKgXsGiXBnpD5JIzmQG/GtjO1sgvcqIMel0HEZUHSgF+duDBcDlu9+DhS?=
 =?us-ascii?Q?vxxSiLn6TSJ7UR8P9xqxR7Kk/nf2Hur9OTMB4t08VppKLiST+dlKwgW0Ipiu?=
 =?us-ascii?Q?AlondfqPx/BOvmD4oB9Q0CdlPZF7u5lybG7JA293LOG6HfpGMGSl0RSsnHCI?=
 =?us-ascii?Q?O+Ym9g7MlstYIG6Ge70QIVtewMsT+QypbQMpYFOh1KFkuFxOALuAdFcxWZ6p?=
 =?us-ascii?Q?Oim7TRv2D93AN9F7CFYe44tWkPTivHNK+ZSZWmewnX8iAjWnARDTqPIi3ON5?=
 =?us-ascii?Q?gDSmckGu+gyj2eB34cvdjKLiD5O0Dikird0U1+cWvNyTL5G85lUuuOE6jJuH?=
 =?us-ascii?Q?Y7khgQf5YGWLestcvsoePquyxmRDR+ESGH38ypxYZDXxYYuanmLKDGZfTzCj?=
 =?us-ascii?Q?sGl5dIsYaMF2DN5vj526BAIqMk0Cck3baMFuVKZhdJX8lErTovRimp/lToMh?=
 =?us-ascii?Q?aliIH147PBZ/XCSJBxMQvjlVk+MeTzk5T0yXYnk8MDl0aXdb4g9fOhauP1LT?=
 =?us-ascii?Q?jC+Kig4gkOdPVJV6UE3igDwlbiCnA1rfM4tAVJgPFMvTm3DqHMW2tSMM6y4J?=
 =?us-ascii?Q?ydtYlPWnN7IA2UYDS2Rr4qzOdmah000P6X8dZpu4FOKFhfuy/+YBhJsDxKl0?=
 =?us-ascii?Q?EqHKsNLmgkFVARXKSqWX/DL3gw8NLkr3/DR9NPoEw7hIGxnJiqxtRgiyOoXU?=
 =?us-ascii?Q?0SYj1Vuff2MoQU8AiVHLfuezgxw6CkLKdavB4Iu+R3Au0Tyj53vB2KxrlfR+?=
 =?us-ascii?Q?gFeYWqoEEuPmlHn/D4HQJTI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nEydVBRhm3IcqkNRfkcNt1snxk0DOoJSPDY7uHRZ3XWFx5p82jOFgQHHrYf9?=
 =?us-ascii?Q?2D6z5BNA2Om+DAYbswKrc/xg4WWm1kJPMAtNZkIpwdsmEJvCLq8HR4WSgZaO?=
 =?us-ascii?Q?CgRHty3LW8Lh/y6rGsGvMlm1B7Y0N/SgqYnSZuabstjS2oXr7EW5a6Y1Ca07?=
 =?us-ascii?Q?dOyXnZPzn/bW3QEbUdGfJTlVpZtWiEDamaHUr88w8TOS1WCGQ1wrKzreh2by?=
 =?us-ascii?Q?8ewXAE5LsLErneNQymMZcws7JWLQsVu1wcvU5w5Y58dUb+V6Vi2W36c59cIs?=
 =?us-ascii?Q?po5KXMejlo/6OWJiAvA48ORUFPl+kcwX3l4dl3RKns9289aeuu4hZjoBstEc?=
 =?us-ascii?Q?ZM3D3hDBpy6NadAXWGyuTQp+TdxkeReiD+XnvOLy9PmUSxBlRsfbZz6A/1W5?=
 =?us-ascii?Q?I+n2zgBwRTNGMql2Tbs8WrXL6ZzR5la062EvRtw1VVg1aKMp5HxNUjfdCyac?=
 =?us-ascii?Q?40pngiVvgywffgwambLapgmtlNHPxy7Bg8vdCJ0FzTGLiXeb4TBC+9uyyml4?=
 =?us-ascii?Q?fVNwU2ppaQm1FWXNLSsyBd5M35emwl0ULQNCv7DHG7g50KIDv720nbEYYGXm?=
 =?us-ascii?Q?gzcmIDCNcq7S0uI1pWz/Rx4oRXJEHRUvbaWQ9UCPX+qN2HBGjzcprQoidpac?=
 =?us-ascii?Q?+Rbq4EH+Su0dKrJW3P7Krv6AwE535kOkmYRaa9X/FnYvOV3CwpmeZX15i6tq?=
 =?us-ascii?Q?YzD6T7iIlePTxlnMTlurc6kU66/M1e6E27PKf1jETrIZGkp3f2+yy6gcOYZO?=
 =?us-ascii?Q?rR7I9KRYZ4lmcFjY9GziuimG6/q36/L54p0gPEHJWU+VwmMpF9nIrrEgxxSc?=
 =?us-ascii?Q?TIlu8PLhHxmQ6284w42fGhBBxrGyHtXbbp+E1DVdd6qoSnqzXlTSz+ckj8OX?=
 =?us-ascii?Q?FmXVRKL1FpKxtfC4d2xk8bG/YpJUZDAW7gHMGHOoeds/EcnKXp9IQqQ8f/Eq?=
 =?us-ascii?Q?A26RxuXE2msPFvTijnYlXgpE7O6YdBiICbNGG+XSsGchzjqb/Z8jYB+a2xKR?=
 =?us-ascii?Q?XWV3SWTfLIHSdBZPL6A7l9FU1xmXw/0nmNjRFqgSLwHYHTA56k4pFQhUFin5?=
 =?us-ascii?Q?ROTfpcyKfbJ1squoSBAh3MF7RJCAw2MarADjuNZu1McQSKT3R0QtQAoRj7EK?=
 =?us-ascii?Q?8nljAYJbjYL3Iqwn15A6m9i9rN9YeLrXLVXMvZixxmxRjQK1Q5FAkuyUR7rf?=
 =?us-ascii?Q?9l15P+aHaepN3hedwE0UdXEhx+QV9MwcLPHEsXxQEEyqfoqRH96zf5bZUycX?=
 =?us-ascii?Q?gNI9bBPFmJJ/md9lp0rB+Bh9U3/6CGHeNL4APTu/Fr2uv5Jf27lhAZdXO07C?=
 =?us-ascii?Q?f/VcToO1AOUk1MrnFIsLPZvpIPp5bkuOkL2k80mcErPkhTkYUn8IZT0vGU/z?=
 =?us-ascii?Q?0NrMXyhHzuoTwHhK96jILYZq8gtzlo3Sj0i1WHeySVlcNH1EUhabiQXC48OL?=
 =?us-ascii?Q?cub8QLNnIwqwL5ze/MIszqJuN8KGCrDKmdZjWcGgRKcf8W7ECgOZoEGePOvx?=
 =?us-ascii?Q?IQFsWQEDcv+9LLUYprWuoGpKAfWuIFRHHzjtJChhDe8S/cE4khczrhIKdGJa?=
 =?us-ascii?Q?Zwbz9ULQBWSV3Y/KGB9gdcS7cCRkCVBQydtUjsoYJHF+UsN/kLB7tMHZEap8?=
 =?us-ascii?Q?ZrQ9UCEsfngpU0/a6Q9rZIe6NAX5IokGDm0oQpyLjyi2gKlHo8/GKeQrl+Sz?=
 =?us-ascii?Q?0wRJcShP1oKZ7QB609uxt/MYcUOaYaAeEqqYSHItaKV2csGxSEAqpZU14UxL?=
 =?us-ascii?Q?rwQaZ29FEw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4ea190-0c4a-4541-85b1-08de6a4ab447
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:23:41.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qok4BC9lPiUF4xotBtYAxWo8sMfypCzvdpnBathwFDXoa4McAl0XORHVKBE3m9aUDA8eBRDYEabbkURPFVJ4fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10763

On Thu, Feb 12, 2026 at 12:47:04PM +0100, Maud Spierings wrote:
> On 2/10/26 09:45, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > Document the compatible strings for the Moduline IV and Mini.
> > Also add a compatible for the Ka-Ro Electronics TX8M-1610 SoM that they
> > are based on.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > ---
> >   Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 5716d701292c..c76c1731b4f7 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -996,6 +996,14 @@ properties:
> >             - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
> >             - const: fsl,imx8mm
> > +      - description: Ka-Ro Electronics TX8M-1610 based boards
> > +        items:
> > +          - enum:
> > +              - gocontroll,moduline-iv-306-d
> > +              - gocontroll,moduline-mini-111
> > +          - const: karo,imx8mm-tx8m-1610
>
> I just realised that I did karo,tx8p-ml81 for the imx8mp module, doubting if
> I should change this to karo,tx8m-1610.
>
> This inconsistency is now bothering me.

It is up to you. both is okay for me

Frank
>
> Kind regards,
> Maud
>
> > +          - const: fsl,imx8mm
> > +
> >         - description: Kontron BL i.MX8MM (N801X S) Board
> >           items:
> >             - const: kontron,imx8mm-bl
> >
>
