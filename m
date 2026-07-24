Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D731D366
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905186; cv=fail; b=CEsNG8yEpXeLb21ZplGrXoR6f0JIDKZs+UYxF7FaHsPVrUd/rCtSFlaM7CH11rOU5YcZtz2stbhjq+HVJpm45VKE3ity7qgIxIEgdm8ygGk4k2hKmEU3pEHL2qJg3KOJ6JZZJqv9gQfHzkha5tT5MdxdwkUHXTKPCVaEJDhPtF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905186; c=relaxed/simple;
	bh=4J1Cm0sp8dq7lRJHcgv21psBRn9jSGdIZKSxA/a68aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g012A/ON2kB3egEKUf8uZpm+tgUftDEVCuw2LlQJQXcNwYN0NSZLDWFeZ3FVi3Ewe5LGwh8HxriRoOUxWB8PQQqaVho5wQYsOEtQP15vdwAhe75N6dLexNV7Sio1dD1Y4z1k65Ca9dzdYl8HWW872IIaC+2eA2l94EiVXPIVoqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ENWR3bh3; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ENWR3bh3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5fMt18DKRYvaPwBKaaMz7LhcWE06TK8oy7teIErp0299VMCGdpVRfE5/Y33vlYoqBgpnAJSOAH/iY2OxCs+9dZOo3pC4Sw4co+Ig6QWcDXa7sZ250Xn5HXB4+bcdPu4/gKkyLKYj7oc7KRm1D6IpmW+ZgbSeBxysCmsdI6It3tGuEz6MGaQxZ4eiQg2QLKtPiZEY7RzkHP8vght/2iP4z46TnfG0f+spZfcC0GA67APzEDgjjJNwaX1POjb4GhLItCN/VyuPyDJX20J97FZVFxjrAohDrlv/GjaAF8TICqJPFuGqjfxXXa2oUvfWdHqyqPogW1THN7lfFx5pCuW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9+t/YlIbd9Y8Gxd2fQJRiCeHIkCMnTdGhBmhDWvtJo=;
 b=dxlt5J6bVGZ+gQiP8K692cnSgftbflJ3hyOrUcrClx2zRBpK3Aa6/IAU42AaxuKfq3XkNXGmjKK+/jyRUpgCBf82YO3SaVcVFXgoln9VoigAFcRXafsgsCVd6fj+XPwteMO7/H6imw5tMG3FSKbK0jRF3t9uAKl2wJYxjEPRVZWk8U6SK68L/eVlD9a9TqLiXZWpa6FdxXM+jp26CogNWwPu1kJtOUC24cKY7cpVPrewS/sIRcddXOcKPSJXbl6nL9VTc18HKTT6yspoxo92+zHQguLU92+lYBkPeVzYNyt7oKaIa7S8AhLRJypHcaXZjKQillkkYDkyDWe55q6Llw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9+t/YlIbd9Y8Gxd2fQJRiCeHIkCMnTdGhBmhDWvtJo=;
 b=ENWR3bh31e9xZ9pD6GrOj58IzgL7/lRL51b7IFuREXLY44ZKWVggUX/RNsyrDZToskkbP24Obe8QI+xauKoYpFNalizWeJxpDsUHLc1UUT/lnr4+S/3m8iEvc0tXsa6wH4081k+RBKWOKDsjHUcEqBwFsoIWeVALJg8SHt1IsRM1ST78ujx4zTTv5SmVWt5RBBTq9d03fg9sO4FtljjdSMYC6IR4ECLHRTVmiH+PRa65zVR1lRKUBO200B78DSKocJ916NyECk3ALNdPYdxYQDvggHwAa5cfRgRFyCrh69GbsCgc5NErYOzWsE5Mmu9QxwGj9WZ+O+Ov5UMUJCs5kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12113.eurprd04.prod.outlook.com (2603:10a6:800:314::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 14:59:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 14:59:38 +0000
Date: Fri, 24 Jul 2026 09:59:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <amN9zxNjXM0bSp1w@SMW015318>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
 <amJrv2FDbdkbvMKQ@SMW015318>
 <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
X-ClientProxiedBy: SA0PR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:806:d1::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12113:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bda4655-78d5-4bca-34a5-08dee9942eaa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|7416014|22082099003|18002099003|8126099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
 HAn8Ow2tISJMRhpRBbGiAK9J+A9ZO+wMSoayAUPxhPUv9ITVuzbPRt/KvXqO7D3hR5uuVi1NrjfsdRKIO2lXV9cwoGxJGws6f/dDIm4+lvIhSj9lNexYDerI2QVcDKGbnIsMmyn95aCLRgChXZbExsnoNhY6xxlcJCKKtOYhRn8lYxeFGL1Mbw63/zmykFE1CW41QB4fwrH47bhIwWaJSonRs3m/T/RWzQAa+GrYBoxByZ/CA+nUQE97T/nrKyvt92waSSXpqpP3eV5VtyNBrKkgO1dkFWJNvCnBIvl9tPiv0Fg+1svGXGAE1r8O/Hnci1yRIiSQiNU6g2SqNG9nXlArlMF4PPTfF9C3N0+fg0vreDmKFc45rn3PmA8fbwM0HpivSAclDZYkAtAimf1sAtqQYfdqV38uU/GLCWWLfPR1CE8xO8NXq9HWyuinOfJn/DAgBHk4A/KOCXEpTpa44o2oDAKxi2XXEeMvNukgs6/OZcndKSarcVmIBEpJAUMY1YSyWSSyAdQaIEiFOOnZzDnpEpjdJiIAO82/KILVJN2jvIdcGT2tNCmca+CtCRcPMk4/GMFXU+/xJ7BahN2wwod4thOcp8I0Xi++Wuj9nVdEuw/PLw95rtXXlUpBCl0P
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(8126099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lMXXT1bj3BGG2Yqlds0Xdz6jRgThrv5gsJ5t/fzKJS3VBnYpL3C7VJZrk8AB?=
 =?us-ascii?Q?bjXmFoclKBcjQyIK5BZJyeZxKSY4xVyEXbCGwEA3Sq2Se0O786ABGW++XZvo?=
 =?us-ascii?Q?mKqXXfbxVVonCRVT3olYLbspuWAGlHiZuK0MxYULS67E1eqd584Yd8cCNA8H?=
 =?us-ascii?Q?Fa0vpkYahyKEhNBZwwSTiOFst2R128kWwA8VYxUMZQ//UERrZHWIIQ79aPR7?=
 =?us-ascii?Q?Exm07ilcQQtGtsFaE5PfRRC9qkEtQjdRjKGk79+P0zXowXXFwXqXQ8Ff6yn7?=
 =?us-ascii?Q?u+YAE8wkVDmbr3w7AHE1EO4Kwm0ehlViieyqOsRspcAHFdNbMwzDVviiwKof?=
 =?us-ascii?Q?g5KU5kYP/oU2GVLpqzqXswIIFYj88nirdJVRSw6AOQLoGof3EK4kNdhgJz4W?=
 =?us-ascii?Q?M9DBzA8bt76kBwhhZ9ywUx52fva6DeMIMPKN3TRPXlXgcLgBMADghooD8HEd?=
 =?us-ascii?Q?jwaN10oOHvqc5HWRSSNWlwMSSoAsUome6Lw220MpVrzviwxdsicYTl92f9RS?=
 =?us-ascii?Q?sI3UsSkakamUhtKp3eAnAlYEaILQqeriOcrprRB8Yp0DCWqo7Js4TD+5P3l0?=
 =?us-ascii?Q?chpz8YALpC/VKqDQ9dqVTXPrQJDV5Ozix9lGqrOiuUEtXB+Wxt0nVJhTFgBT?=
 =?us-ascii?Q?NI+Fsu9WmoLPm2Rv40E1zCszQF+a5hF7ffeK8Nh+SP66bgi23j9mfgY4IHrG?=
 =?us-ascii?Q?YHOiZBgz4gsKClfQ7rMpY2+LNekM4nssmpFX24QTonblFYVTVnNVaa+zFroz?=
 =?us-ascii?Q?dlUFEBl0OuL8Epqg3dr8cqH8nEukwn2RUXDJmV3aWZ7F6FEHImJ/uxnAv3ZZ?=
 =?us-ascii?Q?ctieapJtOOU5W4tu44nKDdQPllmDf0b/tcwNf8GKs1RYQSkY9U9R4hv2N6A0?=
 =?us-ascii?Q?oLvt8JKv10fhoCo6jaIcPxp2R+mTE/tkwnSw9SaXuYJeeDktpyuqhrsrbgQu?=
 =?us-ascii?Q?y+dPhiW0s9cwP6wn4mOMuhn29qqiwwWesHHnzkcE4EuyY/rCQEcYmrd5w+nu?=
 =?us-ascii?Q?VeS+nQGAC/g43dEpdbHWVwzfoBS7hG90g4NvWXrKMeJ/GGjkWzjmNwRFWGXO?=
 =?us-ascii?Q?BhKqX75KrfBXyJGRdP04zteE0M6oaPQl0IaYySTvA0QfAnzTL78HZ/kuQdWd?=
 =?us-ascii?Q?ybfIz9YhtOtsDgghZ5rQksRWCPIwpcv2XGXoch70Tq3QzonMWxng0FKj8doK?=
 =?us-ascii?Q?c1l11LNHqFPsFKwJ4BruBemYPCAmyp8BSimC5BHYqaXbIAJxXBeEpWTeC+TW?=
 =?us-ascii?Q?CiNiLqz8QJPAi2QFWrg38SW/v9I3GbtfCaBpgdicYx5YPguaQKKUNwe2+ztF?=
 =?us-ascii?Q?pR1+uHZswFu7hN7gm7kPMvSInnja4kVl9i8hYRwtGCB/RKaj9m2s7nnkQFj5?=
 =?us-ascii?Q?s12TfNSPTfwow1+WC1of4hqt3E9hJPk3iUCTsMgdauxrOUfBjWA3HObkIxOb?=
 =?us-ascii?Q?JIvei6S7LfQYD/KwzaTTrrxWx5WMjn2uo6CU5Fl0NUvfGQUMWmoqdrsG2e+S?=
 =?us-ascii?Q?tj5Z0PTVV/Ld6O1uz5dlYm5Q1fQHJ4+5DhQgAfM8ITksSF0zXB756GgWQiJR?=
 =?us-ascii?Q?ityx5kVZxaTTwwq+zwZUkrhfEpdgMaDcv8KGRVSYX/4x9lwClTW6TXK45GOP?=
 =?us-ascii?Q?ailAAMkuJyAsIWYz6ztZmp2T2/flKulb/tcZJFfX0B36Z9QxbLTobbVVub9b?=
 =?us-ascii?Q?QDEIgkRONCfWCBMD047kRVuFpkcTxUByvPAaSNr8thBxCXPfoFs7BLHNlFDp?=
 =?us-ascii?Q?U/cvsHiIajcHO5Og2qFzzvk652unA0+q44/0azJD9fI62J/Sagxw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bda4655-78d5-4bca-34a5-08dee9942eaa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 14:59:38.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u61DmRxYeWbEQomvF6whrRNfwiIwNL0P3PqpIMaXaYpkjuTuVLfUIJcV6sz+xawCnAflZWREGvaxZkd3BKk9mQG0coneUPQgZSeCABAdn5hmNrq1AXJW229fZb5HhWJt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12113

On Fri, Jul 24, 2026 at 03:41:59PM +0200, Ernest Van Hoecke wrote:
> On Thu, Jul 23, 2026 at 02:30:07PM -0500, Frank Li wrote:
> > On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> > > On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > > > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > > > Hello Kieran,
> > > > >
> > > > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > >
> > > > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > > > >
> > > > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > > > camera module.
> > > > > > > > >
> > > > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > > ---
> > > > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > > > >  4 files changed, 119 insertions(+)
> > > > > ...
> > > > > > I think with the Toradex ecosystem there would be some value in
> > > > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > > > so that we can abstract the hardware which is being 'added'.
> > > > > >
> > > > > > I think it's important that we tackle the problem of combinatorial
> > > > > > explosions of overlays when we can add a component to multiple
> > > > > > platforms.
> > > > > >
> > > > > > For example, your OV5640 camera could be added to many different boards
> > > > > > - and each board could have many different cameras - in different ports.
> > > > > >
> > > > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > > > have 'thousands' of identical overlays.
> > > > >
> > > > > I see your point, and I agree that it would be valuable to move this
> > > > > topic forward. I will raise it internally at Toradex and see how we can
> > > > > contribute.
> > > > >
> > > > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > > > >
> > > > >  | DT connectors have been discussed for the last 10 or so years and three
> > > > >  | is still no real progress.
> > > > >  |
> > > > >  | I would be happy to send a follow up patchset which would convert the
> > > > >  | DTOs to whatever connector implementation format lands in the future,
> > > > >  | but I am concerned that waiting for DT connectors will block this
> > > > >  | patchset from landing for a long time.
> > > > >
> > > >
> > > > I do quick check for ov5640, we can use partial connectors, which already
> > > > in kernel tree.
> > > >
> > > > use duplicate label like
> > > >
> > > > in mainboard
> > > > csi_io_i2c: &i2c3 {
> > > > 	...
> > > > }
> > > >
> > > > csi_io_regualotor_3v3: ....
> > > >
> > > >
> > > > csi_io: connector_csi {
> > > > 	compatible = "...";
> > > > 	gpio-map = <0 0 &gpio1 3 3>;
> > > > 	...
> > > > 	irq-map =<0 &gpio1 4 1>;
> > > > 	...
> > > > }
> > > >
> > > > in 5640 overlay
> > > >
> > > > &csi_io_i2c {
> > > > 	camera@xx {
> > > >
> > > > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > > > 	}
> > > > }
> > > >
> > > > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> > > >
> > > > Only clock part have dependence. other parts. I am working mipi dsi for
> > > > display, almost work except panel show have some problem, which is not
> > > > related with connector.
> > > >
> > > > Frank
> > >
> > > This is very interesting and I agree with both you and Kieran that it
> > > would be great to abstract these connections away and kill the need for
> > > so many variations.
> > >
> > > Certainly I will read up on this and spread it internally as well.
> > >
> > > That said, since there are still unresolved dependencies, I am not
> > > convinced that we should already head this way with this series. It
> > > supports hardware that exists today in the currently standard and clean
> > > way.
> >
> > Your ov5640 have not such dependence. You can try connector firstly.
> >
> > display most like can go through connector, (I remember pwm already
> > supported, but not sure).
> >
> > others continue go through old method until dependence clear.
> >
> > Frank
> >
>
> The ov5640 still requires a clock nexus which is not merged yet.
>
> I have been playing around with it locally now and find the work here
> very interesting. Certainly this is also useful for Toradex and I would
> like to use it to reduce duplication.
>
> We will repeat this work for the Verdin iMX8MP. So I see real value in
> using these new mechanisms to map the GPIOs such that the Verdin ov5640
> overlay can be reused. However, this would also require a new binding
> for a "verdin_csi" device.
>
> Therefore, I could consider dropping the ov5640 overlays from this
> series and sending them as a follow up with the partial connectors
> support. But I don't want to block the series from getting merged for
> this non-trivial effort.
>
> If we go that way, I wonder where the verdin-ov5640 overlay should go?
> We also have Verdin modules with a TI SoC, with the OV5640 overlays
> already merged, that could be refactored. Those live in ti/, not
> freescale/. Do you have any input on how we should deal with that?

1: need make both work by duplicate overlay source file, which under TI
and freescale.
2: try to create common dir, and merge two file to one, which may need
involve both TI, freescale and Soc maintainer to discuss where to put.
the discussion start utill real case happen. This one may first real
user case.

>
> Personally I am still more in favour of merging now and refactoring with
> our next series for other SoMs, but I understand the desire to start on
> this now so there are more consumers of this new behaviour.

I suggest use this 8mm ov5640 as start, you can refact other later step by
step.

I can increase this part review priority.

Frank

>
> Thanks for your input and kind regards,
> Ernest
>
