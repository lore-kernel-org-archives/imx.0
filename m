Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2B83630BC
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417497; cv=fail; b=QLHFxHlH0eOmNsSXtqX1rYXBpH3BqUPDtmPljjQcNR7eaE6aFkmNekTL1jgoAtkio9RGTljPkGO6DoUGs66Quj/fUrY7j8pXpe0ALhLu7Ba5Bl1H574Za6ueDx7YD/HojVxCVtDdzvi8xaNImhImQkGIubM3Rp2vxfzlCLOZDZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417497; c=relaxed/simple;
	bh=nw4hzbpOJL5YmzCGvirq40CjEwql3JhlrZMOxHbuxEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HDgpR4LK/7xNe/rPIGgqUrga+DeLAB5C3rF8BpiqApD3Ts2DKAgjQq20Zyx1DGhm88vUpAKF937peDGMlVFcTJjmr/0FSuH8EOVmD6C2AXLiP9hVLjbp/DsXCgC2ly1eNSlqKziCR6l2zE+wjq7Sp5mdDwzUKMzfiYhIlpSSDo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RIClZbvt; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RIClZbvt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/bDczlf1gM6ToXkrYhLMGCH5U1beGE4XkpJuNpErNKMFJO7D8NrIK8pX6HY7gxaY6pXXtPBQl3mhvnnE56N4dZuJpd9II02P0lJJ4h4joCW45SGnVi7RMVLF0mqJcYXKezcukHUm99cjpHsYHdsWiLc6pEOZVIm1kF2Jv1BNzlu0w8prCiOfQ5aHTpZ3nE1Vz1Yoqx7DRFBIsMZQknshWjWn5JvJGDkyFdYbB97Q+vehLF6cAVYtkgIPeOsNzFhj2e98w8RiF5i2PCngK26EUfQABFC7LtOJZXAXWE5b6w4hykPzbqS/6Gfqxs8YGkyRre+RqJqMUe+BFAIXm1vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw4hzbpOJL5YmzCGvirq40CjEwql3JhlrZMOxHbuxEs=;
 b=x5p40MVtnCjPBxbQIjcBXBNZHEfCteZgvTV4m3GgYXW2DBa8G26aJ0UN0XAXuwuRuLmyxMQvFyKM4F/OQAQu60HN9JN35NIS/o5A2g05MXynYMhGbFtiGVerkriUMv0jh70v4IesC4PoAf2WRDYWImgZjTJYbfMSAjmFWL6G+B5BXn0ZL4CoLDEHG3ihxE+UQOA1LM4j8ih033JXQv5Y3+4hEVzLtb0Cy9ff1VKwtuKCSelPaHSZktSle2iAOLe84AuVK/Rc5aYzJZv7AW0tjru4E3HyxBQddjNtoioEDlJBHJHrwPDglziXuFR/lGnrEV+6WNxn87X/G9n7zYWo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw4hzbpOJL5YmzCGvirq40CjEwql3JhlrZMOxHbuxEs=;
 b=RIClZbvtTSFMpPzpwfYnwKqE1axA3TJMbyS/kn9sOSku9musGokK8vuauduLZazs6A6aloAep5LUcF0+NMBejcQuwztf2EfmlXZdIVk8SQ7IbK7KOv3eYtm77msa7YzKaOv1L8Z8hW762D0cy2HMABKaRgjYXFNmeI5z654ksnxlVb20yNknnAuX5952MEbff95VvWj5QDuDvQ3BDfAHB4jYOosrqDBKXI2IMYafdy8D7VwjrPUsvpixPKFdXW94Ot2WYQ8+VnSzfysE1IrTMr+RnUpp5pATEKVCnB5N+lGzG8cVU/LcOJxlNtKyax47FPESbLYkxvs4/oxFyP2sjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7382.eurprd04.prod.outlook.com (2603:10a6:10:1ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 15:58:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 15:58:10 +0000
Date: Fri, 13 Mar 2026 11:58:05 -0400
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
Subject: Re: [PATCH v3 05/11] arm64: dts: freescale: imx8mm-var-som: Add
 MCP251xFD CAN controller
Message-ID: <abQ0DT1jtWVNQfL3@lizhi-Precision-Tower-5810>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <d007d05d5927820aa06389c07dad55357d5f8d4e.1772898346.git.stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d007d05d5927820aa06389c07dad55357d5f8d4e.1772898346.git.stefano.radaelli21@gmail.com>
X-ClientProxiedBy: SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 83746e9b-8470-4f4b-f4d0-08de81195310
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 SVpSfCHd17aFqNgMd6mdoDuNf9cnHyztazsN9d/AkDAnrLc2pHhGCXp2Akahpm529qURqXQySTH3pRNTJnkDXO7tyNWzMlxMYCFezslCtPW75thKYjIJCk2vfMRXqOmTl/Uf+Ntv+HHB6IqQfGmwZlP1mYX8BIYu3+5GdnnTMvDZHapdqxyqurDVGSPshkocATSKor3UqF4+Zs/MkmuNtmU3MXPGLvPZ2dFjWmYG6OtBe2s4W3lx+tnP33X5sw2iF0TJDfLreB/KhL8Trqe/+Ijf+vRcBdqf/gLJNzlHasE7tCC3vBfzjpZy4AqoSB+pB3kU+M5WAqnJ6ZUHd+Bhr9M/T8YW2WXfeybN/NUualLlzU3irSvdm929uCbq8HCr+IQPk9IRHjJQONEQzDKbiTtPG/QzAGCqzuy3TflFbsdMan4vrIkfBcB61YK4RrhqCoAjbHm4npvYxBnyvSuql87La+aEF4RxV+gOzu07rMCuENWGKEmJeso3b8rUHTLo1C0r+++PB9Q3glXF7HOOQM5iXRiuckf1e+U5pLnlLSLnoZ6/vrcgeEefiizhyl7BkYyy7pJ/I3SbAUPwj4zNi8TSRNDKX48y2z42o5EcnKvlapHMscLm3cRBiEHoAlcEQqfBHJHkb1WfTwyKTbIbtaGqEokdC413s7Ii2dgalM9nzHAlP6Q1rF08YoX+QQa4gkoJIebFI+lMSQZg3hL+11CQSY8I+1WDdZ49NKyPoWxeV4eaez4W7txUr2RWQtSEnMJbz1u56kAK4ZzpnYqTHIYKL0KqaI1JS+gGZWPZJvk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MVDvh8p4oW9UnZyBVrK+FjZgDmxnVkFEgez1/3fHdxthOsIwVgHgRuY7pDE5?=
 =?us-ascii?Q?IwaLSkKeRi3aCAoLjEhA6DP6Bt/QkVpobg8DYX2rQ/QPpsVBQn7DGKtSfeBW?=
 =?us-ascii?Q?oivDg1IbRHvnFtzLKm7utseMRYftpVtA4vvhvC9ZApfE4yDzo3fLU2dCgcYs?=
 =?us-ascii?Q?ta/MuChIVVOde9Su5UmKD+fxPcCCtCS78KaEMOLyvJzofwADdwgmp72HXvgE?=
 =?us-ascii?Q?5RKAY4h5qwtVbUplH4mB6iH7oE/L7v627vsadGWvOpYfMUSAveWiI7d88A7g?=
 =?us-ascii?Q?uQRmAvgSZndbDWtzR/tsPOegQmeXWP7spAPBO0F3h7xtQi5SU9KZgVJKOpx5?=
 =?us-ascii?Q?D8BY/keWXX6IauXQdNRAAdqtWfcksaUWjO/v/04XUqoviw10Rg+i99yOoKYW?=
 =?us-ascii?Q?s2V/GBpjaRO4spy8grPie3o01swBWo9TiyTtVraJSAy0RBdx+anwX+p2A048?=
 =?us-ascii?Q?+W3GqCRY1FEM+B7mT1spEierCisJe28l9+mzLoWrl7u8NWvwGKF0rKWLt5UJ?=
 =?us-ascii?Q?Fx8cFXXtF70h8Bm8kRx2GPPlHhO9d4WZ0QpnIKOqGHkMX2u0fqK9qfvvCQgn?=
 =?us-ascii?Q?drFsUYyH2i6fcPwAK8Ay8Js80Lq2Qr3lIYWX1uzGPZv+3N+IkIvstbnsuN5Q?=
 =?us-ascii?Q?J03esQdkf/saZ+1WimFvsyMrFL998mwEseoQlU9iWsD92bFQlGonfVdSDF6D?=
 =?us-ascii?Q?xHTb352FGRBhDuIlvMQGdQ0R4vniK3Uk0aRiDyjdenJuN1fL70kOhQIt3IGt?=
 =?us-ascii?Q?OdaGn1YunVQdYzO63c0q6z2MA5jel+spwNu2hz4lOvgx5mRI28DZ5fBbAz6v?=
 =?us-ascii?Q?0A7ceAVtL88P516PS7XLQPPIiEuSH4311SSTh4dzCOx47rdaeC/zfywLsiR4?=
 =?us-ascii?Q?VCsQjdzCz2veeIJZIuEpZWthKolMIkw/E2P13CS6ikD99MQr7jNJylZ3MyMN?=
 =?us-ascii?Q?dZBt9lKu204A+5ZhrPEVXzlgGuwPaYx7+MPgZyuNkLuOMsJBuoqzpK35r8SL?=
 =?us-ascii?Q?PhNwjipO4YQETVCiUQVurYcDYptSyfPlIT8ioxXQGx06Xsr3Saz+I8fC9ECi?=
 =?us-ascii?Q?BVyx11Q4muePa3AYYet4j6aw1fx+n4VeJ9IyFXF32EseTE2fa6DacVjKmmZd?=
 =?us-ascii?Q?Gy16wjUxkC4vBO9DNWXFc+jWz3xdSG+sAbxj83Nju2V99Szm+1jQHdYGy0IS?=
 =?us-ascii?Q?AKyU4a84mx6CO+w8L0slmsV/1yZvbMzcH8ChKlQdvGUv2cQZ9Gcmsqj1cBnj?=
 =?us-ascii?Q?kluzVd6xay4jCnGPvgNodWWbCQDO3Pqr3p15Z57eJCnU097RIsjmf8UVS4lf?=
 =?us-ascii?Q?Mv7z2p+9F5yiBP8nIMiuxoh4gVxOqCtyr1OwtnGZO9RFF4FnOsAgWACAVzTG?=
 =?us-ascii?Q?AB5OuR34pAjJ40dAz3V7sGBkxFwEnidAsq9IiubhtIGXM2zw8M2QPvql70Cj?=
 =?us-ascii?Q?IMJApAAmUEIzR2DHv4vY6UuVTi7aOjVWFhV506wK8MWptLrJnGIiGl1GPtWd?=
 =?us-ascii?Q?torXk8wWqy+gxLO5zWp1h8w+DDbYxLnTRS3kEIzVDqEaFbKyiNYVMNsD+0vO?=
 =?us-ascii?Q?4HEkfXAifXOcRIzR0Svb99mW/UdPAxWS/9Fpgsx8NeISHszdyYyCEjXK3xQU?=
 =?us-ascii?Q?q3p2Y6h6ku6KiisvzCtu+q5qytUiLJw+VIWoQzCAOfPR/P1A1AOaC2Nuszt7?=
 =?us-ascii?Q?BAbKvqgbhWCzRCF5qkyyoEHwctljS8ji8JBtVObQ9O07er0TavxdPSutdO89?=
 =?us-ascii?Q?SNd6GOEWng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83746e9b-8470-4f4b-f4d0-08de81195310
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:58:10.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h57VwEPmww+x5mTAsb/n7K5/AryTbZitA0c+XKJ0zQZKx8DSKRxT/Acw1jo4yStH0pxQxYhC2DrRUmP/S4GMjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7382

On Sat, Mar 07, 2026 at 04:54:41PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add support for the Microchip MCP251xFD CAN-FD controller connected
> to the SPI bus on the i.MX8MM VAR-SOM.
>
> The controller uses a 40 MHz external oscillator and requires an
> interrupt line and a dedicated RX interrupt GPIO.
>
> This patch adds the fixed clock, the MCP251xFD device node with the

Remove "This patch", Just said Add the fixed clock ...

Frank

