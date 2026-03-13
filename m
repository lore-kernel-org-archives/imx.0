Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7053AA500
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773414832; cv=fail; b=MU9KwrptM/rBirY7QSaD8TNJrnOQsZAzceh2jGPkIQrS5VMbL1w42aiSQFDbeQi5ogdTiF2YpTHSRGvy2MUiJfpqYmv/ExKFAhkZRdxNx1hmrv3g8KvEub5gDwMhT4dqQSwf0IUJFZbS789gjbud7h7+6mtC9hX5t4C/ovm4O5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773414832; c=relaxed/simple;
	bh=WtbKIWaF7V9et5N0bv2XBhJAw4mcNlTu2Z9jq+uW8/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uIPQBr6PmozicIo4gzUgkVGo7dAgbz43JcA5EeIUndyaCGL/untb0Gxxxo9Hercd2atjayPAFJt+SRuN0jTTZSFQXgt8MW3rjOVk3zZf7vrQZ32Ggoc99wIGKOS1eRfXK3tHqxrCGXlIE9Yzm46z4AwSfi+G4OLc89aZ3W5HdxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lhe4/IJK; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lhe4/IJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO9iWIjirc6lw9AkdeS+4zPrNwPkkbFYw1xOz1gF/Qc7V2ZU5WpwQdYAmunMEvErkRKWF/WMn0XNx3mdOSdqcY3SZfIebRMWLwS2NMuyy5gT6kzDZEAQ5t4Cw0aLdJdyYx4VJxK2XbJdsGBI7u2GZopyYk6sseCZQGAsnYu8tl9BuzovqX9kDnsV83+8tfeM5Ac5TN9yBdO9fBHkxbfv6xbasO2rqQGB2RjhKwDRqy+XoJwm8dX4OlGxvafLA795KAwsDwKwIyx6DWJqLWU+PYG4FA1QisIbiV/12OmsskNBg1lt3jJM2DCNhUhirOv4+RqpApnGRloe3noZ7XKx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcRf3d583AbTWG0IwV75Q1ljj29J3NiwvL48y8XlcZE=;
 b=g0bijr2G6byOooFSZ9+G3B3kIHK9Kq98UtAKUXMLcgUaKmtL4YqKzBIg87gOG8EDYqbVbGpEtuH5dYdAghb0ER6W3ezbFK2lyg/b8tA+3xCpOXvyTUEmy7xwtENBWM8WmSxPUMWs5+vgxcRtPRIsvLS31XZneUS5ihFkvxX1uZxXj2Ndm5xi3bOsRZaewX+rUG0WSQMzLs370gZm7aOaUPuJzkDImaAru7QK/LBfxjYXUhCrOiFyBTM4HMmYmnxDua3JDMaeuzipSSpAGzrQOBIV65tLcO8B1jhQCOYASJGr5xRA2hxkuGGDQD/NahrxETght6+dNOsdd/3Myrix4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcRf3d583AbTWG0IwV75Q1ljj29J3NiwvL48y8XlcZE=;
 b=lhe4/IJKCFCgiUqG6qdMVgbl+Odasu6qC9fWdsT2uw7XGm5twRXpO7zhw1iEdCJzqQkOfjZVEnK/+BsIxlxZOu5DMza40rhb2WrXD4ASzlE41ss1DWcp+QUv5yWOQzICGJ5Mpn0FodVLCbFF89JEvZr/XaM96s/SkRN7CA/yzAlM1dcJRmUA/ZMXAehZ6+hNhuVW5tZgidRSYsdJ4QO1NmuZVo/zx0oJbwF16AxrF+iPrP/sYvOWScMsIY0HuTFeyQXtPMpZWrfZaBE3blS70SBthtYH9dl08q2XpxjmhRZOy04v05GW82rFWKdtnc8JSxQq6Z1P0q6FiDpPxpYvaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 15:13:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 15:13:40 +0000
Date: Fri, 13 Mar 2026 11:13:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>
References: <cover.1772642881.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772642881.git.stefano.r@variscite.com>
X-ClientProxiedBy: SN7PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:806:121::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: ab78b252-eb69-4bcd-c399-08de81131b86
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 lvPCNnoBdk+fDqpHxWOc/lsdpqbbyZsfejR1pXfS2bQm41EH7yYfMMoMTi4NXXu2/X/2pOJ8nAKTi9nz0x4e8lzZC2npoChUgoVO2woZO5nB3VRq0YXykYJQImg+UPXOM0Ryh2ikhdz4Nr0SljK45siNTPGGWEJqWTfH6VXWzNbtCuKzP1X176MsV5ddEP+wxfRPZajp1hfCsSlX8FUIhwP1XBqogV4mbx3HxjY8JWouN4lnxvmG8bPeR8QoTGJ52bFsa8DuQ+eTD8t7Ft67Aa9xQ8WZUYhJm7xjd+oOmAae3e9E9CLdL240vHUasz2gf+ushfc/WtH5jva5V3R79JsI7ZcLY9lw6SmizYQbHLsDx/zxsJBQpCUSpuvtP6Bdqr0fewL52BgD/T3xUFttCK3te9ZwQANrmCcWNjKU/PI6p/K5J6lLR7fUEQ5wIEJ8q8QwYRmyX4EInEXpk9vUB5ne0P6NWX7Mz6St5v/zQm2KxF0CiwWCb+faS6XCWbCuZGsewb2mlDp4q+mmAxYyJRn+OBe0/2+GHUWGj8roBaPKaY8xUBtyg4gNiQBSv4dq0+Vm78KxX2vBAwN0/IzfMAkgPw1SqqoH68K2fXH5aXR8+QHBwIJKqNP2l1Z8AHBC580OYV+JuELGWXzqNhgCJkE3o6HGCZ1ir0JQ0n9uV8ovEPK1IHkXLckCx7sKwGdH/j4PLPguVJZWSwMh78zQ0yxI41/L+BZl+DZdY8Tk3RAfHblT12lDZ7Yt1iJg7Za/
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uZ6ONWrdnvchdFKTv37dIgD/bna0yDBuz2II1/+FYuHdf4jezEmIntwkA32g?=
 =?us-ascii?Q?5bQ2NaQmVUJy0Kl2zQrK87opl2bMkRVXgWEKkwnYTru/BWzRWnUERBDrME8c?=
 =?us-ascii?Q?EKVKjTxIr9mc/VyrvLm++ejOWnnGeSynbQMYxXQsW8VpfoV6aWUgMro90Z6C?=
 =?us-ascii?Q?8VI04RUBPt72POhN0PSbpVM4MwNFIFXEKNcV+QJaFtt5/cr82kn9Qcswdjqo?=
 =?us-ascii?Q?KvSwX6z/73FgSyMt4tIIo08KkYOpldx4uIOcfFt3f+1ootaki8CA9HPoG3yO?=
 =?us-ascii?Q?SWhwnfDCTyc7ej2LE1/JnK7Dq38VO5SsrQLlXcd52mzggXxao4rfwIrreW9A?=
 =?us-ascii?Q?WTqc7+Wxlmhq3kHr1sm5GOi0EJ1eXNR7OkZPNz7BkofwWEv2X0shzNj3ENYi?=
 =?us-ascii?Q?Pjj35QuOeKlTboU9BPrK5We4HlFSqQzK3pPee8sedoXvNcR6H8DMvs/VJxss?=
 =?us-ascii?Q?DS3ymdzohyzWdmOpp+VIY0+9n6sl1bBNzx/xjrT4s0nU60ZehD0S33wAj2E5?=
 =?us-ascii?Q?NM0Txx2ZxdYUHvG0p0QM+yxuwDTmsq1azBVF2S0P1Tug1nnPmQtHVzS9d+7z?=
 =?us-ascii?Q?a/fIBj5nB+97uRjIAzFOyuRPpAUnaEo+3rg30g2bA/PqQwi3qXfRdYuTWSqZ?=
 =?us-ascii?Q?DhlCkGRf865TqbgjzrNnLEJSKSj8dDHu+7tSnOAke2KtIVfArNiCbRg77TR6?=
 =?us-ascii?Q?q4zik102lbENrkuXKNKmFzsq01/4s5hgddfAO5jblqxepgMWKdDtDU4W3ubt?=
 =?us-ascii?Q?SIt5J/JYf63Mo1qQyglEFFQIQr0I6DXoQ6mmVG6uOGotE52AtSejGBdBLkUU?=
 =?us-ascii?Q?2G1R2HpKLUy0joAsjn2+qZtZ3hniAx0bmRdjnfNZj2w1RX4TqClhCc3RSRHj?=
 =?us-ascii?Q?x1WNeKDmCE9/gqDxNV/9xouWnk8QO7Bixi0oO4JDbj1eti7nVcH2vGacrb00?=
 =?us-ascii?Q?Lac+7TUyroIXLAcAXz8bYjv1EKi7HcB8uGuueNS4o+AizWFVqrKXqJMsgfWb?=
 =?us-ascii?Q?4vkxtqW7dYG2Dnsy350EbLU6yauASnETFtl/CUhcV3y5dNOpMWjb6RM2fMMN?=
 =?us-ascii?Q?IRnPPGfzpXHXXWW+IqMOhqyYUrmXfKFfMbsE2xfV2CCjXL8d3tGUaAIoaFul?=
 =?us-ascii?Q?2+0vrb5yqpQptTCypttbalid34RwxyRNFSK69yazutDb5IEyibCJqke64Bvn?=
 =?us-ascii?Q?OvgzIvTyJdwkP5m3DgpAQPlOrbzbNB2aAiDA/7RMHDaP6Kpp+1w3YVVZsi/O?=
 =?us-ascii?Q?bdnQHnF5+fd95FFPn76bZfDLcp4L1mm73tUGmteG9OATsKdoETpBNpl4ZOMh?=
 =?us-ascii?Q?ZjS62MWECB96ewhGA1akDJ807a6bCOj0r7wXW2agMAcSfRu3pjHPPYm1iFEp?=
 =?us-ascii?Q?qjFnWXEgqnYwRpaarpzWVwaLxptalkMUw+AXSxYlpAUdDxecf3Z7EqwNezcD?=
 =?us-ascii?Q?/HFXbvCb5BhueXD0qNW0u3QZ5DEYLzW+nxg/kLc7CHBoKtPce7043CkxLOrE?=
 =?us-ascii?Q?COhzmkZXntpCbJgk5CY4W5N6mu1GlSbD6xd3Yx2RO9zMSpHfTptBL4LBliF0?=
 =?us-ascii?Q?bryramftCkVHddoNJ78gBU65gJJkibPStalkGeLGzIf0q4c1Y004Wj9eMOsk?=
 =?us-ascii?Q?9bwbjO0nXht5yplWxpLrlMkH/5roMHqZ+z0PlUwfdA2tor1PlUUXBqmbwK10?=
 =?us-ascii?Q?/1Omhtgrdk5LhIeRmRmU3wyE0dnSoWD0he51hY56nKAqA5n9+avXZZys9/FJ?=
 =?us-ascii?Q?prP2xX58rg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab78b252-eb69-4bcd-c399-08de81131b86
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:13:40.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjh2IKxJ0YhLanoRYGAPVm+0DOj6niiajWASA831PloOyz3Jp8Fj/qlcMHitFdMSKgHGvj6+/xNabTxrB2AQJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743

On Wed, Mar 04, 2026 at 05:59:52PM +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX91 system on
> module and the Sonata carrier board.
>
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
>
> The implementation follows the standard SOM + carrier board pattern
> where the SOM dtsi contains only peripherals mounted on the module,
> while carrier-specific interfaces are enabled in the board dts.
>
> v3->v4:
>  - Fix space between BUCK4/BUCK5 aned parenthesis
>  - Remove unused pinctrl groups
>
> v2->v3:
>  - Rebased the series to fix DTS apply issues.
>
> v1->v2:
>  - Ordering by hex and node name.
>
> Stefano Radaelli (3):
>   dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
>   arm64: dts: freescale: Add support for Variscite DART-MX91
>   arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

Can you rebase to my for-next tree
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next

And new file, run https://github.com/lznuaa/dt-format to keep node nice
ordered.

Frank

>
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx91-var-dart-sonata.dts   | 471 ++++++++++++++++++
>  .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 +++++++++++++++++
>  4 files changed, 946 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
>
>
> base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
> --
> 2.47.3
>
