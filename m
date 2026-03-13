Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AE1A681C
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417698; cv=fail; b=WyFcLlIcCCNdQoXKAzkoKDv9nnh2QXwhM5pI0o+M0nNhtF1p5ApsM68eYaTayPU8YZMAqFYOCX9QSVRisj191qZWPdvtDnxXjKCLcTAVGiCbg5+yZOJtEtKLzYBXg7IKrkS1G89UAGdjd6ya+mNZFIKqu8X8KP/ETJU49/6rvXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417698; c=relaxed/simple;
	bh=N4ZP/6wr5ExD9dHGhUdp5A2LCfwbF6Ld2hssHoo+49A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ext7VDbsjlXM3jg6L1cyimkUx4kN2dAMqnCcrfYZxDLTyth11PZTwCBaHoxneOtB7tHkmCFjbcQmXv6jdz4XMG1tzcFT4TCXKjEgawILCEKzAJV+YkgT2n63n4ixMisXw3jy4Bm2RapjX0scGbUCfdlaLn6cn1Yax/vkcJmvpzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cNplRdnu; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cNplRdnu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHnYfQsG097KX4imTmwqbw0/5XCFnPc3p57EmWLtvdt74lf8OcYcahK1V3RVzOqxZyFJHZ+st4bkZ+j8opwAgZqARqyK7HfegQz+HggJxiCsGPfc2QAL20t5zlq45sxuSCF72BaFcE8ga6z530raVTrmT3hXTF/5rbQ3OMsN36TzOlRpmraLpfd9dWfeYTqUShDwfMKIfvy/Tmg+8yVhlU9MmhYMBnWJSUWUclne46qvkc8aDITPfpv+LZBikeM2wwP2L5p/o2VCF1cIdrMg5YA0DocSzSGplEtHbp2dXp9FOsz3AyLO3d4B8NT31waGY/+4XjVvXZ2SmAxuomP1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6LgMJDjiwS3znYcNk4GJjfCOD/d7LX30Lth8ijthAQ=;
 b=hie5egLDjEoJj/5gckPSWbXVrRCzFohJOJV0wyCPNfEqDTDOet04+A7iHUAIIfIHt/yhnQ4V7C3u+By0dmMxmZK8tSta7VvNFqM32Q17Tg6pOUdEpiaKGlyMyhyuYiKnJ+qec8hyav0Fp2v7VyVwjt7nK7UR7Kgg84wHJ2oOWO2YfIxmbG9OPou0CeNCugOhkalzlsG+JTS/uDu/2kWJzZ2qzujp6aDvCJSwXFW6Khht0MPoMWLlpKrATjowtXhNQ3KxZzR52fF9O2ldP/hS6Qn1wbE0KH44U41CVDllCcR75lp9V/3ombATSI2StljK6Ih7JyOdRT/roQpIR5luEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6LgMJDjiwS3znYcNk4GJjfCOD/d7LX30Lth8ijthAQ=;
 b=cNplRdnua/Un4mqhO3Oxzg+6ejL0AHAdNYH7YEUicdps4Qm3FFQ+Ow3RLXbJTKVoCEZ8CxtGT5ihWfLDkCgeKDRgQUJ2j1PkZzCpqRwdiczleClhri12ZyLlht/DXloaHh8d9zXbWdM68qvj9ZvJ2eTHQrzidlkgxlyVzrzZJB3sBGgo2IL5fljhetRjtnbv7B6vbsLeuOWD3gu6Ph+43i9JcqihPfhcHDz3tBlU+RrUtO+juozRCGSXxqtIkhnPNdYSIhoWGaJ/LKPCbrQXTx6oVQIT7H9QTn+3zeYbICJbp4fbqAIRKkWXknX3+ly0HWEh/juyhI8RMeY1083Bgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7382.eurprd04.prod.outlook.com (2603:10a6:10:1ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 16:01:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:01:29 +0000
Date: Fri, 13 Mar 2026 12:01:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
Message-ID: <abQ01CDXSJ7Ep9Vg@lizhi-Precision-Tower-5810>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d8552f-a3c7-45ce-b30d-08de8119ca08
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 VCogyDD2jlDwOP4JDW6EkpWafCwJ6xWFUVZHnlDRSl8iXaSaoxDKbJPYs1P6rvBS4oLO8RONbW6sWeUTUxsV+KfLZSkl2Cu8Th3NH4fHAXkvTfr4qVSIdbXdXPLS+l/G/4JgRXU2LSA6Bo/7XD+XmdX2s7z3n0bI34d2A0f9/2EDahZq7bRiM67fT0ak5h8JxwfW40AoFTSEG0BO7ItsU3UzESVmqklopIWRQYJT4ynskXz91ncircyq/3ab6S5wV8G381+Evea1LwiuptFazbdtb0AMFS4cx3VcU/fxQ1hmCEhRv/jK0yJvHPo31bNfnRCtCp+GEGaYEoS+w0RswJr6TUP3URNhSokiJRiVFgif7m5/OCsnsFbOTV3hVjk5pHJqPtTDwKlQKzUilIV+yLIr+96X3pB8vTj1l6EOB2l7T6oNWJLCjQMEm77vrAf3XITjhGqtzz8BtmWFiTVqnFb37MyB3e9eOmlb+WKckNhS8aZxdm+9O4uTsT28hj2iMJ9qoh4wfaH1uiKDeGpUqDbNNYmwtE3MYqkZ23M0hoSzZlSq+9vj8ytAWwtDPSADWIERv/RvsF6Z2sfqJOIRVTalpU0awbELMTAKUv0ep/zP4SEdY6RASkdwFg0/n+bjyJvFZTg9xhsCAsJ+HpeNZwcxy3RbqD+SUc1ciu9+l8apRrP0eaNIpkvyrxFClBt+isoABqBsWqtOMHUk/CWMJSc6yV90LpzixExea9Me7n+i24rpahCBmpM5AD7clfn2
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?C4G+g+whZVvMXAz2nIhLB8S3Mhi6w9FMDuON2+4ZWU8yrp0+g3lCTnjFC7hO?=
 =?us-ascii?Q?lOiXfpTo7lwlEiHGkqxfUGgVBom62GHWKYrORKkb1+Wt9VnpthGbXH3VuCH0?=
 =?us-ascii?Q?IxQB9BRf7hPv3EVynxhGE1fwgQsQWDCw4vPeYtuRwFUIwAbEvl/LPKEdWwf0?=
 =?us-ascii?Q?o80apcUizPmmRNSBnRCe0pi3Ib6dJ6BiIThdLiWKAokoWxDp0nUhOqbj/ikc?=
 =?us-ascii?Q?E7FGxby4Uz7rWk5YLpaHLCTzWEYCx4lU2j15K81qcVxaY+9m3kKNijnHJn2N?=
 =?us-ascii?Q?bPXRnjJFkpUNwE2c8kadcJtf5i1k3/7G566+DVJwdRWNUWj6sBDVdXK+FLIG?=
 =?us-ascii?Q?bYNXGrl9E8JiKwm6J2cJkHmu90VVmpxos6pacUg8bP56tFo4VZt/x34eneOH?=
 =?us-ascii?Q?fYXeI/jtyAnHi4MrxbX2kWNpoWrUvVTkRV5HdXIqHhd0uw1+docdt//oWQZg?=
 =?us-ascii?Q?pORbEFQ4+iWQXt0UJwYyJf0qZ0j+O6tF9hd4YN6h8Ch4R37uUG7xkHzMY86/?=
 =?us-ascii?Q?fQstvwOCP8lnp+oG0bwYrA9GAjL/NQHlleaVaA2FG/C0MB1khOmA7MaCz+je?=
 =?us-ascii?Q?GW5v8tCDlFSbj/WIDwTkICp3J0Y25wYKn4QKlJLTISPwymU2gwMfRQTQTq/d?=
 =?us-ascii?Q?a+GRQZO/S5zNSfElMBIwXK9Pvtcy3qw602fPJIf6Laum5KgZCi1J3Frd4E+L?=
 =?us-ascii?Q?zqeo1P64ZmGxaTRvm5Myr4uYQ0LvsjxVYVhHqU1nCfWOm1E44FEL+mS+9X9J?=
 =?us-ascii?Q?8DbIBxBAn+Osc1k+5Cl0DR3bFjtWtNoid3Q2wiZqNIq8kmP+X8IRTOtYFW0k?=
 =?us-ascii?Q?Ud2CHup4CoImvWEsaln2nikHdyVO++jJv78gUwoHpRcpINBTHF7YcxvYJmHV?=
 =?us-ascii?Q?lbD+4uhDo56NizPpGuBLLeQ5KOmGiFwM9jJ+MI4+T+jXjY9c4Q8lEIDhFQHy?=
 =?us-ascii?Q?c5v86oMjHkrlc3eXFmRXbXQ5TbpedvDn4mFUvPAkF75Eb7czLmKbC7g5jhl5?=
 =?us-ascii?Q?SZ5Yr9Zh9UOHF0BX9cwExBx4ZIVvlyHKZBXyfuigRgJAjzwNl5IfWYjIUimm?=
 =?us-ascii?Q?MAXS7jVrn/gKpITbJ7vTIlKzXPU+QpFlQlI6Ja1G1yfMWfdpwlH8U6B2bVAL?=
 =?us-ascii?Q?U9KZSbQTzN3qJa/X3a3pT7QcwkNlsckZYLnJAq4VCnDYlKSbpmf9YTJnkLON?=
 =?us-ascii?Q?3zpnvjf1FyhrfkLiPsV5LYfKxQTQeWlOp3WBIsNyAJllrIOzH/b9DubK0K9Y?=
 =?us-ascii?Q?NrdGtBCH3O+TfXTPixg5YpeanEsOtNXFYbxyqq/78GJMJ0ZyAJT5uycpZWwT?=
 =?us-ascii?Q?APYPKf4xppclm6qT8pkd7u+ae6Nb/FZVc4i/jY1q3uFpGqm1FrvJtahiAlBr?=
 =?us-ascii?Q?T4GO/wJuAIfI2kGN+oZqCLmcdXhtdbSkx2j5ODATyF9bApubuVctND7WuI+y?=
 =?us-ascii?Q?KmK/MyWCOXRDWllAFzZgL7o8ljhdig76D7Q8bsh+yL9ARi8+F9C84yo7RSXZ?=
 =?us-ascii?Q?D0bVOS2djr4a5lBDZ5RVcOLtiCyVqzjfjxTLzuVzMeT9cQkUp9x0UVeUJ7OK?=
 =?us-ascii?Q?HN/oeyJL1FcrUwajOrrBpEbhKiLwit6xsL3wNJSHrL4fnn9I9mpmyk9zIj/S?=
 =?us-ascii?Q?KdqLs+tEo6UynMcZNdElYFM5pSiV9//Bu1LQWI+06Del+6xqHSylBNfFU35Z?=
 =?us-ascii?Q?HyBOGhoCmXsFpFG7Z0l7zuJqqvKXz9Kbycuz7Xq8DQKELGjjxLCX5YB3oAGG?=
 =?us-ascii?Q?GR6TJf5BAw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d8552f-a3c7-45ce-b30d-08de8119ca08
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:01:29.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWGQYcgJ1F/yNkZ+CrpvBGD4B2d/vMS43b96Pyc8inKb+mqk1/s8SK8lBFFjKx7iwttDfsikCZP9Fi1X0PG15w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7382

On Sat, Mar 07, 2026 at 04:54:42PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> The VAR-SOM-MX8MM currently integrates the NXP IW61x wireless module,
> providing WiFi over SDIO and Bluetooth over UART.
>
> Move the wireless module configuration out of the base
> imx8mm-var-som.dtsi and provide dedicated variant includes.
> The IW61x configuration is moved to imx8mm-var-som-wifi-bt-iw61x.dtsi
> and used by the Symphony evaluation board device tree.
>
> A separate imx8mm-var-som-wifi-brcm-legacy.dtsi include is added to keep
> the configuration for the legacy Broadcom SDIO WiFi module used on
> earlier SOM revisions.

Need empty line here.

> The Broadcom-based SOM revision is no longer in production, but the
> configuration is kept separately to preserve compatibility with existing
> boards.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v2->v3:
>  -
>
> v1->v2:
>  - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules
>
>  .../dts/freescale/imx8mm-var-som-symphony.dts |  1 +
>  .../imx8mm-var-som-wifi-brcm-legacy.dtsi      | 12 +++++
>  .../imx8mm-var-som-wifi-bt-iw61x.dtsi         | 45 +++++++++++++++++++
>  .../boot/dts/freescale/imx8mm-var-som.dtsi    |  6 ---
>  4 files changed, 58 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi
>
...
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi
> new file mode 100644
> index 000000000000..15990d141d2a

All new file run https://github.com/lznuaa/dt-format to keep nice order.

Frank
>
