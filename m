Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A819E992
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775716250; cv=fail; b=jZ6DxVE4VqWHDTbMWaotyx+s2+hPNUDRIpYYsZ9ncLwun551pY8AtaM1wBJys9cqxo9whuXZoqf24av3hg80NphPvBe98o/x/d1FvVpb3pO9oMa77XdmGzwQel4V4SY2FLli6Mjej5xCSosh/uORSG7jARt6IFcfMbLxrAFJjeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775716250; c=relaxed/simple;
	bh=4/JOpy5yqII7xMh+mfbE2vA1LpNYT9mjqV6lznFoMk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KPZV4V5+FcVFrawwpIurdlVZYceqRdVlGWh4B4VrbXd9KA3SQmx8EJHoSQtIcgEA7EBsQrbIjt1tq6hxZmwNl0GF9UrfCHQjx/55xx3qjhppEya6ZAJqRL4T/b/vNzXxjjOAx+gnc6bH2nxXaY43HWnnwkahugOvYXUe7iDeni8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RSB/WYAq; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RSB/WYAq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eue8GMPbrh1hQ7MowHTCSpXbkiZwxgx6SbzfZd4l11R4WExZ9ZRLie+ZaRSn2kWPAd2lu4uUbttpYmHsC29TRsLSNgE+GyvYHYQpHMt2PrEZqQa9g1K5QLR7QG8i+o4c+W/jDDqOrmY47BFCkYaZDs3WeJ0AMTyI8CbiE+RdoKzswwqlwLaqpQr5suYkBMJN44sLPKOI1NEiVMdk1mEEYGMycn4pLBcbIdJ7+sF6Z5VqIc9ubG3P3/31WUKjQqvG8sq5fbqwOIn2Fg9DWQwy1yqmTBZTHA+KWstTY8BhaFsdjCvrVhMis+vDAGdWJlA8tqoLIe14KpXxVENpvFV7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/JOpy5yqII7xMh+mfbE2vA1LpNYT9mjqV6lznFoMk8=;
 b=NcNzF+D3+131rpaI2tR73uUsdgk5OzDXInyfdIbGFli5vFYApjwA5DU+vlSL+l7iB8zKFiitsr+8N4RrQgBCZpIE3wNfpGF/SQo7UACdmwJJG+Wg+JoUDIXL64oRnxq2KjFq5vkLJOAGwf+53l7R9u+hGuITIxOyrHBazPp3idMyOjecCxqLW9uwTjc+ooNJ+1kzzJ+cIjGT34w84npTM3SS2qamq1Mzsb0Tps/oKIxzZVy2Exvdy8JED8p1Rpgd6PVnRKJHjv0ij+uVS3XDR2rlRbWGeItfSkJCFmL+WOwoPRRQ8R6jBtxq2zgV+I3xtjBs8qwLl4GWY4sWYlQXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/JOpy5yqII7xMh+mfbE2vA1LpNYT9mjqV6lznFoMk8=;
 b=RSB/WYAqSAPk1MAZT4G2OV7Dhpa3r/7C+i8LoLkGBqvOOk9gibgKEtwaiypP4XRVZjRKhXD+TIPAvpeDr/knEmHdAMok9UmVD8sCgPfJX33KSt/ZAKwju7A0q4O2bvt1XNrxJhW8JRU9VyKiGgxFFYK0mCgNf+cMVH8C75gV4TQZMj4gaEsJIkuTTMHmCkZqCYrmBdWQykxgfRXyFPzeF6Z0x7iRztxp8P6WOx6FReC4Q0fLJ4eKNio8aaa9LwZ2yWcVLPJVhbqeyrJC90PCz72PL2d+1hK4R7NZMxF5pwPogw+jZ3R4YReF1YCTlm+ZBthCxbRA21W7RRfQA1du4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9840.eurprd04.prod.outlook.com (2603:10a6:102:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 06:30:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 06:30:42 +0000
Date: Thu, 9 Apr 2026 14:33:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX91
Message-ID: <addIH03sz5K/JSta@shlinux89>
References: <cover.1775669847.git.stefano.r@variscite.com>
 <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6923d4-4433-4596-acb8-08de96018664
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 pbxCMi2EW0bx2C+AdIXB+73aWZzS4cdHSB81aEgQLIrp/+dyUHB82t8SzAd6AlI08VeoDMIu4gCBy28MSJoKhFU57UNgqdzpUkbg2Ara5KabRpiQCuJ+mE7d2pkyK8AZzDw7A3eVpOM6MDy9m+SUngJ2HidaP+YLUIZwJYwaYfRwGT8c5OkhPp4Wxb6eQPmPAf/9T5Ja5CYWu8KtQ26gIGfFgey4wrc/Y9IsCo1D9GGiO1B7qKsRyvVjRp6agSPR2/XrlfcX1fbTjsmY2c3+FamosYZTv25ecZx868MSF8Mmla5iN/IoGvaxY7U7+Z5oK7aSGTu+9jaz9jLpDJSuEPsjdl1kgnndPVrJYDWmRhm10Rk95ViFkZaGHdNVssGG78TN3ps8Z+heL8D1aqj3yTRDfg0RFj+HlWFCPOfow7o3it35wW9sJfDXHkaeFRF7brhlsjmGi3PCYwpTdTqZ6MO+HqNY87YjhfUTUYnShRgORVKlWc3vnBXYWxtVxLUPJCFRv6dlPjEpopPmcKRwN25FEPT+AxV2fIfyyUih8ZjeWiK1DbbxphTjysakmfZQvUYAxhMUjscVzTz0bSBvVbeVmVAni8WvvqVDS71Cqks+Int41YSUGnVfVAp5GD9lQh7nTlG0Ij+/4oSrIRNj4Kiwxs+w0zZdkNpBiWl/3OvyAMOGg4KbUVFdtDHFl0Wi4iG0dubL63UdQbSh+IrFtIOit63mXvsV9sIASdVFtAixR8usxRn95YaapvOKI9EGIf8J7Hi84Nxoq4vBm4IB1a5nchBUPdqnWsa7hCGHagI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ho6Jg/MMblISyKVbeEVA5Qr0NNX41U5ThOsCpO60rfBmsItXA8fLSnrQzZFH?=
 =?us-ascii?Q?1MMrn5rhiI2RokrDmxltg2xAifieePOoBHNqP3p0i4va+RIELpI5IPW7OLqO?=
 =?us-ascii?Q?7a2A4NbjMorKctgrwFE5cW+SPH9ZFMp0rLvdFFqD59eTcOPHXAd30pV5FjXj?=
 =?us-ascii?Q?NPMiw5CFqdnCTDO+mejB8ygkGRzIUwxvl1pv4TJ+cCADaeEd0VAamonvGfwl?=
 =?us-ascii?Q?X9AEIg/tj0bBwjNp1yWaOG1BetqrUuhxsqxDdz02PmkWYDe43q7KbJAS9vf1?=
 =?us-ascii?Q?HUO3G8PSJWGgZNm1lLvg/bM0JFhCQzH21J1NG3ps1Spba0YR2w61BGJuwfHe?=
 =?us-ascii?Q?ddkV3fJFsHK7M04XDwqfLHaH3b3oonAkjUeDM5YNNUDjeE/R6oiZYGiNg0Cu?=
 =?us-ascii?Q?xjeWiF2+p3msaCqpfSWMfHxhVdG8WIl9vhIQrWFUcwng8pukiZ+H2lV8PBNz?=
 =?us-ascii?Q?z139xGjrtNHERaI0y2MdYb1mcD8Iv70BHQAQs9M98upwuOwXBlI3woX9HmtQ?=
 =?us-ascii?Q?DmGf/89bXLtF6phoxxNkOgQVmMAopnY/1xXnfaIBoYhCIGNml7O0z5YhBqdT?=
 =?us-ascii?Q?NoQAxxw9nVL+Gf0qSDgVEOgI5J5oqel8EhXa2XpfP4kQ8+ZLHRjIZMb4Tgjg?=
 =?us-ascii?Q?wTn1kc4+Bs84bBBzPPyGLyDXOqKYu/PIebGlkcKXYhDpExxb95xgM0RzsX1y?=
 =?us-ascii?Q?pgeqcxDZOMQksduh4dZHg9XGUxsNz7TrpFQUIa/PbOTwiqSSf/QGzkENXRlX?=
 =?us-ascii?Q?Eds14FRn5YbZG4Qpp8LhLiL+ckAMk5wWLMkhy2gmpzuLPuQCtr+YBH4Eatba?=
 =?us-ascii?Q?aUAe4ZfkFkUcUUnkHWAYfXlAJe+JU3Y3XMHRy8h2fjIW6pnCl5cTkHDF8Oqu?=
 =?us-ascii?Q?sq8hB6GppNDzPrJr6hHt7MYAz1fdH3kmcfhgKrJuD7zq28+BLqbyccn0EwMz?=
 =?us-ascii?Q?2GvUY+baFBHk2fqdjutFdXCmmer8iVJyVJccT8onXnmU1au084Y5KZajTUj2?=
 =?us-ascii?Q?eaZ4MPebIwPYOk0Ujbb4HIwqFlnjxVEwn5gUL9ueCRVi/mVF5wDfdWCbxFT1?=
 =?us-ascii?Q?zjYZ1VQi+JcS40ubQrAAxF5PDWO3vsVbfs/vYcRnT2WTbCPFgVUNIf3POrm8?=
 =?us-ascii?Q?v2q+8DjMBigiZE+cZtVFlnUIipH/kORIx5Fx2p8XtQuqE8G4g8Lj7v8YTWXe?=
 =?us-ascii?Q?5eoVD/+DV3YkPZdXGrKu+rQVj5zLHi/+H20Nx0bjJexkNVFRf6EdGn65Triy?=
 =?us-ascii?Q?bEZxkIuOvbJShqLVMW/qB+ENCFdfIN7/8mP9/E8QT9PDuNOPyL6s411bDm1J?=
 =?us-ascii?Q?SCnMAPcsh445y4a4DJwxonI/RB8ylKj4H9uXfrqv6jq78dINJkDvIKQ7RKRS?=
 =?us-ascii?Q?mt16dSTD/ngVzHHWsLtpaXSmSnQOj2XD9EFkSuZUw+IjZi3o9AteTKcPN127?=
 =?us-ascii?Q?i/g6VlqhWXq3Ut2laGYwNbXXwCb77aIVFZtAhXV+T5aiVqIjXMCr46+9qjI7?=
 =?us-ascii?Q?vR8tGbMOX0rgpAoemKasZ10LiJHQ8coYdGcCy3hrBeJufxDTJjkRrnsxeBIE?=
 =?us-ascii?Q?86U/8GMhearGgEpegMyOjF/Uqd4GBI34LpHcVO4+/d97DPuNveVCmCumpjV9?=
 =?us-ascii?Q?tO2nLACfjJExsFlTOURiB3qr81KCsRp83OTJJfD2m+rDO0RJ1+r6bhFUAS95?=
 =?us-ascii?Q?eGTLei9z4NTrpZ4IgEDApLYdIXYNyzrvXC40RESxdwLwZGDjW7jAb+//zDwz?=
 =?us-ascii?Q?QRTVnYw4Pg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6923d4-4433-4596-acb8-08de96018664
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 06:30:42.8841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZB15o5GdPeoTiv4nDe5R6S48OmdI75aLtRP+xH5jYLyddVWGsUYCvluC769VmDFisfw7A7TeXlPkfhniE9mCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9840

On Wed, Apr 08, 2026 at 07:39:45PM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Add device tree support for the Variscite VAR-SOM-MX91 system on module.
>This SOM is designed to be used with various carrier boards.
>
>The module includes:
>- NXP i.MX91 MPU processor
>- Up to 2GB of LPDDR4 memory
>- Up to 128GB of eMMC storage memory
>- Integrated 10/100/1000 Mbps Ethernet Transceiver
>- Codec audio WM8904
>- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth
>
>Only SOM-specific peripherals are enabled by default. Carrier board
>specific interfaces are left disabled to be enabled in the respective
>carrier board device trees.
>
>Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/var-som-mx91/
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

