Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4050B357CE5
	for <imx@lists.linux.dev>; Mon, 22 Jun 2026 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137700; cv=fail; b=j1G6DQhqQHUG/Rswmmes7CwBcCnod6J2wZ9VVXMRsLuW4n+eBZu7OVMQJ+wif77DSRvLtch8F9RLDr5gW2RzJZycMKT5NcybZ6ki8gQGUtD6zYIqUFhuYNd0LZaHkFNuPLFBJxl0Ci85jUQxQI/DEJRE4imBeJy1qRiaxQt4d0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137700; c=relaxed/simple;
	bh=1UBoCcYmPL/R0y+shKgjfUGSpZkNDLRS82S2/OwwMvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LMQo72pU8AXEtyDim65+RtIeCBVFIxvcosPz2kCdhJH0cTSaFm4fPugtmc4lsEomjcJS0es8Ky+y5XLEX+gU7/yZgOuvr0MMDUEn8t4L9if6W+vxZ3Chmbh/goef0YFzdKqodsdu7XdVgvMlraQYdQ7xb7PiTvUdV6UMoJgpr3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ltrQkFlH; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ltrQkFlH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF1qMyt/KSxDwDRjpkar+7+cFAXA6AQev+IhAPLNqPLrOf9+6xy6vNEiDovet6H7+Jg7Gaze+4FuaNYPv7wSzEGIGa59W9zX7AtXY8demMI+z46fMTmBW/EhOOUTTOGAvgRi8D560raGPyIdnNlmFybYbajRZGUwFpLh4YiGeCs2G/BffUymYx0BWJ1zaHwJgLgpj/iZjmiayUrxy9rlb7dZ6eLAVpe9JvPIqvp3Ifgal8DHD8tnwOnpkiJ1XfIrrBUhwlNia7x9pFSZ+lfKz/v1g+GSYbhdb9QLo+336dkRsN+6wRrwD/s12eFOVwo6DhHj0i1/HnfJe42YnVbTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCLVAYUhmkmNBDK0fDr5a4BppS89AkvAxUucxz9/7Yw=;
 b=lCqKJwCrV0uXH32GVuyeCL6RA1LrPP8bwmKU/6/jMqrz1Jnr59KaiJRaE5jKhnlRXzPKBS627DJeOWEhyR8FHZOGBwULrNDntmytQCPZeIZAw1iVtHrLk6NdxN96K5487mfO6IPRi8DsKfGGNEDWGCkgfxv/eBYZ2N2nxmUr6cFfQGpSvR6HrS3EbZPw1mjGGfLjFVYa9Yj0W0kdw9tiuON6MNjgtgZJyG+C1hK0FeVU5d0fdcClwOXGzuHQU700iWT89pk6iFxCOcAccVfcxVRdZwIHkGIipGwq8/B1Futjiw3Mkt/qTvu5Y6RZx/G1/bs9Lxb9SlGf3N6u29FS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCLVAYUhmkmNBDK0fDr5a4BppS89AkvAxUucxz9/7Yw=;
 b=ltrQkFlHk2JVh8oPInsjN8Z+RLpdTIq2i/HmvVtt0qySB9hL6ubP+LJjy5YJ8+lh9h4WWC89VH7hXHu0TpCLC5nFnPOpHfG2ip/vWs0dr1UwZAsS6HM9DinVfhCl/9nXRcOlihtRRI+/Mju0G5OinD+nRwKZaDzpEwW7bZkQ1QLLo0+axoJkIXoP9ealxVsTpWM4MKVzxbnKXGpUb+xw5z8v0FImNwbIPjCd6HkHZeIJRNKo7juIWBPbrFZmprRpLriUG+NCtd6XO45OWrEOYK2QptUgTSmuuVEEZ1DLAmhhS7Et1IOQiX/qefiyg9Ar8qYYCVVM6IFB4LyJRn3A3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9149.eurprd04.prod.outlook.com (2603:10a6:150:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 14:14:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 14:14:54 +0000
Date: Mon, 22 Jun 2026 09:14:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Message-ID: <ajlDU6FVl8XIjCWW@SMW015318>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
 <20260617-prodigious-private-inchworm-beae1e@quoll>
 <085262ba-32e5-4011-8df3-5a677575b2db@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <085262ba-32e5-4011-8df3-5a677575b2db@kontron.de>
X-ClientProxiedBy: PH7P220CA0111.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9149:EE_
X-MS-Office365-Filtering-Correlation-Id: 917f5b4e-8ccf-4395-7ab0-08ded068a1a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|23010399003|19092799006|1800799024|11063799006|3023799007|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4OvS7wYhn6gGUrdZiwsCLSgTbnWtLUjQP5PyIf8mmVcv11GU84Il9v9EpXjE3Ql78FDp+Wz6k2/Sy6pZwTYO54HqSNZNar2P3uyl/Mwf7WlLp2v9j3EruVP+K/jaxDDkRgwYnaUNwJ5mHRDxK+9o9KbCBY3YcHT7g3N4rx0hWLwtNBCu1mvwiK6snc4TJk9ACjIVHt6ZtcE7uApuCaA/Mgq97BybNmBlEaEkvlFotJqWFuO5JdbhxaXcZcvdaOhCBQY2kRFWim0tyzOx1Qg9JTjhvmMibudxa2k9XHzq8UNXcODVkGYWMvRrLPWMWt1Wt7VqDFdjxsSQo0MIsDXEg9tdg1aKdmbzlkdDjyddEmcI+ocA5YOfouloIpvdhAHaXlWZMKpntRDxyg0sjxrdoHq/RceDDs7+iR8guRnWatOxD2cGIgzNVvP7cihb6/S39rWRKXwvH17clJx0ODFsyijQ1sM/zyOVHNew7c9851llJ4DprOOEIFOWlQm4kBGFEcKLNqgn981VyuOBUmNGiSgYTuBQB+LTufpSYfYYf3zVAlSJHI7zPS5u/UwtlF3yc/ICKHlde1vakERZwfLQnpOACb74C4HSRVShFg5BYmyaPmDK8leNZwRbFGAK+woL2goLsayu7T9O/GMHhstn8qqkdLL33uiun2drg4Gv2wI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(19092799006)(1800799024)(11063799006)(3023799007)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CSndaQPvh1cFtCq7QgMxbbZFZ6+E9a1L7HLrekYQdajShdN9trohbfktgkmg?=
 =?us-ascii?Q?kTh1OnygtKvpe5s8n5cCGcicwVyEN9QA4+GNDmFgCYBX8cUQ5GYrY3e/Qu4C?=
 =?us-ascii?Q?wwGrAh71Kws5jTy8Kbv5mpYgu0sXXNkLpou6nslug9Y22FBYom0uVJ0dP9nd?=
 =?us-ascii?Q?aHl/xnfs9Pl6aI5+/WfImI31qSmrm8hKEtK3PUGpojnPFIPMaYDXiIaJJeju?=
 =?us-ascii?Q?lhWG1vP7H2vi1N9iV1Rb3D+C/6aH0bLgwTryzK888GIfwBps1yBWiNHH/INY?=
 =?us-ascii?Q?CvSCuk0PZRPnZr8N04970DIiEZ07X5jbZw8L1+0YZT1gquO2vDdvnbGXsq+P?=
 =?us-ascii?Q?dFTdUFXGMFl2jSekxAwCjXVAgwmNc2Zcs+k6JHejzZnJG5PEZ3UeMzBMTF7A?=
 =?us-ascii?Q?CDLXguUOjgHo5VKO6spHwO1HI8YUOW9poNRV4bm+jsRhmiD1tPzduCkKCiOi?=
 =?us-ascii?Q?aFBnmte0W8dPvYl5uKZV8dNJ/AOlSItNCsnmK3Nd+X+vvKjdQU6jpXVrfm4I?=
 =?us-ascii?Q?Im5On3obNRGT6S7LtxGVpklupW3Cvu6lQXNODbC3CRSPQq2d2s4l21ha4GUj?=
 =?us-ascii?Q?QBt5b811Hx01Sy2mIm3PRzhKpLKYBudkGwuEuC0HDaZ+a/vrQ1zb0DrrSF4/?=
 =?us-ascii?Q?Y0+6c0kXhdrE7cDLaL2fl0UeiIJoehImO/5mmUBHOdd84GpwK2lnCJiGs8as?=
 =?us-ascii?Q?b9a3Gnagmvi0QqsLIiNWIWxCjot7wrLG4vKziCWBxOks7WNEZIA5oNo+zOt5?=
 =?us-ascii?Q?Uqh6MmAQd0D9ngg2s18Un2mTgy4fXhuP9iFyekUjZsiag2D91xYAE/oFvBvD?=
 =?us-ascii?Q?ovjko+cRxqvKlKxZzZkU9gQn8ABDAqXDCyndNMXI7sffuVbMgyqjMzzVOsi4?=
 =?us-ascii?Q?JPgLRwbGp4ThH9cNZEHlQi8ORNFY5ILIFaYc4HAQnOD5GDRnU6BTgOD7+HDu?=
 =?us-ascii?Q?UUFq8BLkq1WFzrphuppX5VzA4lbziUPnc6YRGTKFgvNyIX1pipLBIFxqTc3S?=
 =?us-ascii?Q?6buZ/6lwnGfa9zCFqnxhe6PPMdPDE4qJ66egM7l1VBh+aQVNFbk8X5vz392w?=
 =?us-ascii?Q?Pk89n1jZFYvH3DGa8SMWUXYE1cF1kZl1mqVQrhiDAKKpScghDu5AkG7aYtUB?=
 =?us-ascii?Q?Xn/KH/9F9tOL1Y20ahEvFHy9M+pqTTLpTsyRZz8EZBAl5sSDKfyPQKMSDDfH?=
 =?us-ascii?Q?dWMSGoQ8sFh66dBRHC+loScnOFLFscquvIfoXRo706V/OaAxPGNgdZSIgyk2?=
 =?us-ascii?Q?tnYYNBqTzbbPKYUXrjyZBRVrDfKlP4+6LQRbiM++5kW/nnc+TZunWUhpG/+7?=
 =?us-ascii?Q?vvvL9nh6A5Fuxd+lzSL6Z/ka7JLDMOFAkKyCiaG7reJlXv+YhmARCApxoyeN?=
 =?us-ascii?Q?HzUKHKQd7e+LXrY59V9z1R3Lm06k/K/5v6gpNv9NKtcBiMNlU89XHDZoM1Kc?=
 =?us-ascii?Q?vpn75x6JLAcVqIycO+IsJvDgdU2u/UJe/M4U++s+rszGZvqWfsEbOd1UQJ13?=
 =?us-ascii?Q?FVYfPbSyvsWbNSzMdCe0nxf6Jv2SoZKEd2R/SniqcdS5TrEFa5dhRUQor+BE?=
 =?us-ascii?Q?tkiz8crT1siwmv1v0dAf8yhPg8e1K04HglHnvAaFt8xNgAhva/wqYqagX5K4?=
 =?us-ascii?Q?ZrJeUUYbPPi8Z3Lb+SGXDtNbrMBcfq9ylNo4+z96PhowJPLr70jXgXb703el?=
 =?us-ascii?Q?wUeKg537F+rVwt+aPEVRMC69CLXvtXBmHjdfTINAVYLeWUdtOMJY1kVjtT5M?=
 =?us-ascii?Q?IJm6SvzQOWM/TkwOotgAtMSTt+rHgxDPU1XaCWqwLoxPxvp6iDeJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917f5b4e-8ccf-4395-7ab0-08ded068a1a3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:14:54.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgxIbOilvlh51QVnq8VUF4ns+tzUu1mIMwfcoPBBmhd0RJIT+LE2TLkWdzcGWWjOBwWWuyBfoWKUFQ/0Se0mWCGSRi3ky/yudem4cq7bIcazaWh+rmnKOnli/rpIxcm0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9149

On Wed, Jun 17, 2026 at 01:36:30PM +0200, Frieder Schrempf wrote:
> On 17.06.26 12:49, Krzysztof Kozlowski wrote:
> > On Tue, Jun 16, 2026 at 01:52:16PM +0200, Frieder Schrempf wrote:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> Some SoCs like the i.MX9 family allow full access to the fuses only
> >> through the secure enclave firmware API. Add a property to reference
> >> the secure enclave node and let the driver use the API.
> >>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> >> index a8076d0e2737..14a6429f4a4c 100644
> >> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> >> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> >> @@ -53,6 +53,10 @@ properties:
> >>    reg:
> >>      maxItems: 1
> >>
> >> +  secure-enclave:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description: A phandle to the secure enclave node
> >
> > Two things here:
> > 1. Here you describe what for is that phandle, how it is used by the
> > hardware. Currently the description repeats the property name and type,
> > so not much useful.
>
> Ok, agree.
>
> >
> > 2. If you access OTP via firmware, then this is completely different
> > interface than MMIO, thus:
> > A. reg is not appropriate
> > B. Device is very different thus it has different compatible and I even
> > claim should be in different binding. Devices having completely
> > different SW interface should not be in the same binding, at least
> > usually.
> >
> > If any of above is not accurate, then your commit msg should answer why
> > and give some background.
>
> Thanks for the feedback!
>
> The driver currently uses the limited MMIO (FSB) interface to access the
> OTPs. The intention is to support the firmware interface alongside the
> MMIO interface so the driver can pick the interface that is available
> (firmware might not be loaded) and fallback to MMIO.

Does ELE and MMIO access the same bank of fuse? If access the same bank,
why not always use MMIO. Any beneafit from ELE firmware?

Frank
>
> Following your argument would mean a driver deciding by itself which
> interface to use at runtime is not something we want to have in general,
> right?
>
> In turn this would mean we need two drivers, or at least two
> compatibles/bindings for something that is effectively the same hardware.
>
> Actually, my first RFC approach [1] was to create a separate driver. But
> in the end it seemed very weird to have two drivers and two DT nodes for
> the same hardware block. Also I have no idea what happens if both
> interfaces are used at the same time.
>
> The other idea from back then was to replace the MMIO (FSB) interface
> with ELE, but this would mean that we rely on the proprietary ELE
> firmware to be available for simple things like reading a MAC address,
> which is not desirable either, I guess.
>
> In which direction should I move on with this?
>
> [1]
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250416142715.1042363-1-frieder@fris.de/
>
