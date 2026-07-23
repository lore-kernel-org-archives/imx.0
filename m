Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78A37E2EC
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784835028; cv=fail; b=PLNZyQZmkR7YuEuwd08Ig5kUtwB4BgsIPzJacsHRZA2pmRxgyTbH99HbBUk6Z0U9BTgJifTTYbz22TzURBPvBVHzFuAIIysqgF9/mme9dwFrVaWbM7ihKrHqPmOGeZ1Czjpx/USg1y0VeuJ3fh7XCvKfYWxvO4QjdOVz4DH1wVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784835028; c=relaxed/simple;
	bh=thJ+TSQ/NTQisx/q1V1MjgXlLr8r1VKsMc10EXazRho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oK8p7B4r7MdxKbfeIh+sE4fhktF/dsMXzPTKtktTEUXw8sHdkrxDLxcV4rXxyBB15Ofw2RVRGDhfumQ8dVimogbcVOOEkqEFNsfBhziOVob5spXQqDC23rKLQG13rUdR9yOvO0/0X6QeYjDK/GOA12ZvnXHNUMIQClUwieqvHrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W3z024QH; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W3z024QH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5pvlN1B40F3DSkY3fkeTZLYZ8+xtWdwVOZTo4QGfkdLK0H7iG36ajZUR8jcERCk6OTu9rNbPgbpYKiABjquEhykGAF6p1gqToXCx9dctXM9qaB9Qrl875ZwGVEaRGks0MI+pj2j7yPsPhfmyVmaPiMwFJwlzLY0XPNYAuFtF+DxVLqOb47Vq4ZC3P2Z0x89I+m7lzScQkBgTLqCB4/2KFJ6PjDIUBJaoX+as7d9dIy1ao6JmI+Zg7Z05Upm1fLtU0yWzUniGlpHSeBOB5pKRHJMy4Uf3as9xthj95l+1nz+T8nu01/aXp8f1yR0OA2xMl/sqiMpwyOA5A/tcqx9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPScg8ZhtJETRaTsDhfHsYZuz+doFNuisCQ2Soc+8xM=;
 b=GgcVv6QyWkzdlDDOrXhu0Pc50shMcnsAm5+9n+yo2kM43lVSnVAL2IIVorDKj9EVoAdSwA4XKcnjTBCxzudBWjs0zNFW1gmqvL/3mkkGTPLsGt5BhIAtogaqH5FLx9JkrSaCW3FBOvAFDCW+CefcdleXzj7faDg91G6+euacJJMyfnp9XjdSfEsotNt+rWGfNpjuDizgfk8Z61NECBmB6LDUbjHShZeTc9JCZd/qTGPnzEcT+nvoQBkEPizxY4uKGtxIo+DUNgydDH9H3FhN2vtLkABsRIjRdnEDeWxEA1Ai/AJm1kpdLSZnNCT5op1PbCad+LmrzIXTdtHEi1GvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPScg8ZhtJETRaTsDhfHsYZuz+doFNuisCQ2Soc+8xM=;
 b=W3z024QHXmtruLDM8uj0INm+nCkXIpxyge9iZBAKwHvFI6nK6bdYl8G8vUHcolPTTPbHBzaBexwyZxqUuM9cInO7ilZxdOBUBtN0DkxB4Q+H3twUqHFh2PDitNih0KAinY9/eNiEpeczKqrL0sJ+k6Vmy3/13DVDOMbFsbUVM0wTKwg03SdldoTeO5fu/bKVYazFwITvgqhdAToAdkoa7MByJV8+6YNcH+ZPDcgDvTb4bI1W7olipoMEZwH6lvXWZUZStU81coD/cHiz8WqlNeuMw8FECNei+VyheMkVilFEcoJE87v1PZuOoKq/tRgd0667T/PEoKxc/u3bBtG3pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 19:30:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 19:30:18 +0000
Date: Thu, 23 Jul 2026 14:30:07 -0500
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
Message-ID: <amJrv2FDbdkbvMKQ@SMW015318>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
X-ClientProxiedBy: PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3369b9-d601-4737-d2a5-08dee8f0d41c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|19092799006|366016|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 4AFxBjYkiL14RlSlr7YF4tJ4u1Zdcw7SB+BXwL/qL7d4TvxJN3I8hGbZ8Q9WERw1Nvj9ZA1V+o9M0ItWGa/rZJuPCHsbgIDHiiMsh2KFvCZZUf2CUA/iaqlI1D4vdL32JIaqBBF0zVgNRxSd93dlWQMv7RxMnNNYGTTlGwL5SrYChf04CZBirmEIAnZxyKeTE+b+kVtOeJy8u9b8wlmwvrOGmoT6hHDj0nR2/vLU7TyXu/sXzOCAnIoReyQfBN4BZNcZejMVeoRBsELjgaw6EbMoAf/Un4ssnFDIjkObQwaV5MDnTbSPE0q2eohUb72V88nxzt/R+mjRFSbPLux2Dr/eiMCVRvGSDD793cwBWuB/2jbCfMlGc8qQ5TQ74wj5pzjDemO4SyLq4K2k22joSBG5HUlR1MLxglNE7US9giiOYk6n5nkjoV9so8SbJ7fU2Wb/2hTaoG1QA9DArz6miG0+dl5PGyhRCSz9Wc0WMzk3RteXmxIsUz6R/6tXIjunO94Fikr0l0exK5npOMamvLZaVEmYY0gy+9VS14rGl1qexDW28hMEl4KB2DoSQJXTHN5pmoWqhMlg42R4hEREc5yMvdaCTEdWV/+byR/RQSCubtBR1bkzHBY6L7Gro2f6+u8xRVvz0tW8DoYhmGrSzx5WkU8M4mtXwRKDLQRFJbg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nTCAsxbV6uHbtxwBqir++h7QgxtGjMIbi3DxxtjAb0TUt1VrJXLwELtPfmyf?=
 =?us-ascii?Q?EcuVXHlAGBAYg48JqsTnQdTSnVMuQC2Xp7Fo1jD6C3N5N7QA/SXZ4zIsyiso?=
 =?us-ascii?Q?YKjMufsxb+zhXTlD1jr2ut+LdsFwqYPFTnJJnyjT0AUaq+2aazyTxTLfnjzu?=
 =?us-ascii?Q?OgM3oOf/MQSYDGtrAvepdDQh5Ihu68/kp3swMwvCFNmav1Ds0fGzWshlo0g8?=
 =?us-ascii?Q?QXFgB0r2nR5eYoQle9QxlVektCNLQMKboFAn8bq0+ZVa9Mxsyyu9Vpg1E7E1?=
 =?us-ascii?Q?J+SdQnEFk3aO/Om952hycqa0FvIxA8dOxkZ7Y+kYRH2rahLWE0htxLAEofD1?=
 =?us-ascii?Q?vRTeD8F5ah8tCBKdC9lyAv133dQceOymetf1NvgPF57902uylGX9mVX4IF6v?=
 =?us-ascii?Q?hKfWwmlZDpkJ68isYildD+9zwHKMEy232vHVCr9LsYGnmZ1766MvDfAxNWTS?=
 =?us-ascii?Q?DNYc97W8pye4wYN7qBHE8qg1leg7yCgnADjuOKbtyGQfvIGAQOu7i2Tging9?=
 =?us-ascii?Q?HxcKGikKqCjma27Bp5BkRMAZ6g/+KJglg8Twq8ylMNeBf8GD3owbnBI0kCJT?=
 =?us-ascii?Q?Io6sV4kjpcIrDoyWSzP1kUqAvqcfSUH31ps6o5MX23MvreVisuoB3bD4ZPSG?=
 =?us-ascii?Q?K5DfRoKSh72y82wDa6YEeevonjY1Ocp4bS1jUxdFlakbn9qdo/28qzg28Oql?=
 =?us-ascii?Q?GG3bLCnXNLn8OizObg9a2BiQGWWL3gMNrX3xFx476+eKiIkYYU0pnexbtg7V?=
 =?us-ascii?Q?YXU1EqjAjBKNheovnssYdmUbKDJZQsz3zFgIAQFT2Fg/Qvn2rLbr72qSa4b8?=
 =?us-ascii?Q?WFt73CCAXoSkN2v+5GkVS7KHoOwRT5X4gFvxu6hLRktkecY7fJcOEDg2/pBZ?=
 =?us-ascii?Q?8cUdBkdObo9UxzrtHJgBKn7HbiF6Bpht9YRn70gNU+BbtoDKtvnoRuGgQK2U?=
 =?us-ascii?Q?Dz0KZGLjW9U+mnhYsxcHtbe8Nfigody6UMsfh0+G7MW9mzNq/D/Lk2y5ct9/?=
 =?us-ascii?Q?EkJPtAIy7UVb1WINlQXqv2RacyRorx+vN0tJm7u2LgG1K+dhvwwBBm19jRe2?=
 =?us-ascii?Q?wYpRgjRGuXNSsxoRIDOOpkvJ+X+u8HC7kBwULLCNQLOWF2Lox9T5TBfxBvrt?=
 =?us-ascii?Q?D47GChmv2hrd4ZrK/lBkSYhfxdwTtoP66qjb0gizeHZ6j7D+eE7A7SqW+pyo?=
 =?us-ascii?Q?khDx5OeTcuuwxu+AJYd8rCVrCs08R74kssA9brnT3B+fOs70XIQOkZPmEqv3?=
 =?us-ascii?Q?GWEASSYSC5/3R0ZLTGk+vLgRE0xrmI/HMhm8jZqYrgojfPxcK9w2yARL5UDe?=
 =?us-ascii?Q?ucV/eSsiAyvcTHkp7WjIQ11QN8WL7s/MvWZO9B8Kz12CGL5/bcPb5dG1oATR?=
 =?us-ascii?Q?lPGIhZYF5Nv4wmw7tPlXNDJJ9X7wEvG9JO+LN+dRL08KY5M0ZqGGDSWn70t3?=
 =?us-ascii?Q?CUvxM4IsaFQ/07weLjJCSdm4Xvfen6vYe+kuFNAjHg8gAmTnQKZFDcv9Uw9c?=
 =?us-ascii?Q?N11PaVIRpmI2thOm/RhVCP/vEwhz7yt81ImKtAFP74odW473OocpgkjBekoi?=
 =?us-ascii?Q?u0+4xB3xki70K1zudMCxG7EtO7SxFlOWVWLYkd+5QNdb36Nlb5eioVvoItxE?=
 =?us-ascii?Q?SP5qr1z9J3SALX8XHasN2ZBAJv8QWhXsE7Ynf4DJoytEM5qgkOMfb7ylDhwQ?=
 =?us-ascii?Q?WO6UhKWDkWa2s/m1GzSALph9qfH9QO37ukJ2UIbKABfLhOyr6Kg2+yS5QeAk?=
 =?us-ascii?Q?FAYrnKqLGcCpEMA2E41Ts3Cs3QTCUxHlQxRnh2Tlcx7DHzohteYI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3369b9-d601-4737-d2a5-08dee8f0d41c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 19:30:18.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnyYAyP0pI9PZeqC5SYTQdwSiM7xLa3d8ZUDGYnCWLzxBxiqTfgSOO43ypevxRR/I/mN3o5/K5fJDZUlwbFEXd9OPp8LLsX3Az1CNVpLg8CgA7to06XuwPrXNGQk+36H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > Hello Kieran,
> > >
> > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > >
> > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > >
> > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > camera module.
> > > > > > >
> > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > >  4 files changed, 119 insertions(+)
> > > ...
> > > > I think with the Toradex ecosystem there would be some value in
> > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > so that we can abstract the hardware which is being 'added'.
> > > >
> > > > I think it's important that we tackle the problem of combinatorial
> > > > explosions of overlays when we can add a component to multiple
> > > > platforms.
> > > >
> > > > For example, your OV5640 camera could be added to many different boards
> > > > - and each board could have many different cameras - in different ports.
> > > >
> > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > have 'thousands' of identical overlays.
> > >
> > > I see your point, and I agree that it would be valuable to move this
> > > topic forward. I will raise it internally at Toradex and see how we can
> > > contribute.
> > >
> > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > >
> > >  | DT connectors have been discussed for the last 10 or so years and three
> > >  | is still no real progress.
> > >  |
> > >  | I would be happy to send a follow up patchset which would convert the
> > >  | DTOs to whatever connector implementation format lands in the future,
> > >  | but I am concerned that waiting for DT connectors will block this
> > >  | patchset from landing for a long time.
> > >
> >
> > I do quick check for ov5640, we can use partial connectors, which already
> > in kernel tree.
> >
> > use duplicate label like
> >
> > in mainboard
> > csi_io_i2c: &i2c3 {
> > 	...
> > }
> >
> > csi_io_regualotor_3v3: ....
> >
> >
> > csi_io: connector_csi {
> > 	compatible = "...";
> > 	gpio-map = <0 0 &gpio1 3 3>;
> > 	...
> > 	irq-map =<0 &gpio1 4 1>;
> > 	...
> > }
> >
> > in 5640 overlay
> >
> > &csi_io_i2c {
> > 	camera@xx {
> >
> > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > 	}
> > }
> >
> > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> >
> > Only clock part have dependence. other parts. I am working mipi dsi for
> > display, almost work except panel show have some problem, which is not
> > related with connector.
> >
> > Frank
>
> This is very interesting and I agree with both you and Kieran that it
> would be great to abstract these connections away and kill the need for
> so many variations.
>
> Certainly I will read up on this and spread it internally as well.
>
> That said, since there are still unresolved dependencies, I am not
> convinced that we should already head this way with this series. It
> supports hardware that exists today in the currently standard and clean
> way.

Your ov5640 have not such dependence. You can try connector firstly.

display most like can go through connector, (I remember pwm already
supported, but not sure).

others continue go through old method until dependence clear.

Frank

>
> Can we consider moving to this once these patches are merged and we see
> benefit?
>
> Kind regards,
> Ernest
>
