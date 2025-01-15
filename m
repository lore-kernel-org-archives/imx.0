Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2059.outbound.protection.outlook.com [40.107.249.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF8139566
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955031; cv=fail; b=knc+5ssHk7NcCdmhwIad09NYQqarRCkX+2vji32gXDVafyDJqcKLv0rX7vcfuIbWE6LeHMnhPa+s+kD6O3yd66hZJd2B/5pHXFjnHtLzEI8F4lMJUwB85NPSitlxnr80gurQVz+6mvs2idPXCQt8Z6rWiqDz1slLy6UkYPzUr7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955031; c=relaxed/simple;
	bh=WNo6t0/SoqkepLlcKyvXXooUklLli1OOsUPph8aWLdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=chjZmz4MrNvykzfXGmaLvwGwWlLmlYtPZnvy6vdO0SWiOXJfu6wOrNDQNk48I6+xnC7SPokn5ymQRGE4cPARnZ2hyy80bw+byjAR3P+XFsCWWwMzdr0VcpuhG8d+OfeMNfpaEdGeEtdnD5kc3RGBu5VUUfEvNoaTcLGoklvTkss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LVopfWcO; arc=fail smtp.client-ip=40.107.249.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LVopfWcO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6AHK7VtZ6/VIb2Ky4U+7SRYtzBL3WH0nLYU0Fv3PZWHuRANGRxaVairxRdyej+6kEMow2jTpzk744Rt8jkzzeMJC1KJQRvTsQ2cL+JaXZee5r1LjUoV9uujCyMrBNF4Bg5k56KSdeMc4yQZW4q15EI0WG2AkhJulNuWEePRDOuLEztOIUO4F79jISbYdosHdtWDqtnEvQxHIr6SVXLa7sIEarWGIwcP13NfIxKV4T+Gi9mS8V5cQiuPVjCXAmHNmhj/cZ4j53r5ETIEV36tybOnP+VOH3Xlcap6G81C8TAlV037RAcJIuPdye+zglXFZF/lbIpw/XmpFXTn3O42CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8EdcC9xWWgiSfAHp55PPLEu1qRlWpByLtmSi7uowec=;
 b=BMsXJCTb031LmGdKLM5OUenB6zR8UFJ5Ahc7rS7v8rLl/cN/6FCfIgNlaIPejrRmHGJOxEHYW6KtxEh+8m6dITOi3rl+3GrSmunnhgE8U+oknNW7FuZePa5UiQp9Mo6VSl/Xh2wwRwNrBE1OmmhH0SRwbIsbDutXuIArdyAyqUTT2SoxLbCJ1ZwlL8ngiHg/ATKNihtpN7SdzBQqfJFFZ7OHnhs025qfKaJRL63U31PKCqR8KBbey4FyE+IXpSopOLrnUUqX7K3fq+yLpdRt0Ua8U31nvXwwT0DgMSlg37zwUNYrmBMUPmFuTqgr2jCa9Kas40y3Lb3IXafxUvpKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8EdcC9xWWgiSfAHp55PPLEu1qRlWpByLtmSi7uowec=;
 b=LVopfWcOJmntrrCOk/0ODyOFF29TMJ5hsP3GOjBGqBWipxx6gklmHcJ9cLpy4XfvbXAZJqjW40/XE191J7bCXkUAfjJ0ANNt/b4lk8Ntp3FvifXO4ahFmD/kRIRdV0bieZa4zwp9lJyf70Ve77KqlDYd6C6PKyg3K3wAEJDN6RaOLGrcKyR3HaPCDE4Oes3CMgubxYavpxx07v57ISUBOOCbA6RdDQwnXQSsHPFeq/9YBdIkcY1ZD0TkVgDRFonYVVe9o1X42xXJmvR7flpkJPABXuAzanVkXTE+Od8tEPRtzsD4dZ+3pceGardkt6Io7ZsviLQXGbmc5I6Fhd1x+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9393.eurprd04.prod.outlook.com (2603:10a6:10:358::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 15:30:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 15:30:23 +0000
Date: Wed, 15 Jan 2025 10:30:15 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: s32g: add common 'S32G-EVB' and
 'S32G-RDB' board support
Message-ID: <Z4fUhwJk7BrMAwmE@lizhi-Precision-Tower-5810>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
 <20250113110512.506007-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113110512.506007-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e433f9b-b4b2-4a67-988e-08dd35798770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pccy9fePEcozkYzEgyQWQsnq8Brg00f1uZnEEnvHzOY6i2jhQySsCpxTWnwX?=
 =?us-ascii?Q?n/TteZO/5OB9f0Bvqg0BH/m2ePY7dRqdCaIwdaf3kDtLWXYSA+7tTfjd7O89?=
 =?us-ascii?Q?iK8cjczuS/b8YhkMj6P1+ncXzWBq039mr+A2lEnyO8YIcto1aZ0n7U5kzdii?=
 =?us-ascii?Q?iUu/JzbhBHwf/2p6PSt/14cAegJ+NDqtHeMI17cCMpKh09CIY+P2UYvZTJS2?=
 =?us-ascii?Q?j32ksqikG220+A8qOJFqJ4GdfadqEslciQw6h+jysPQN3/k/ncE5ljKzXxHG?=
 =?us-ascii?Q?9ZoF89Gf3mT3CIQsBCpzkyEM7M8qeD83k731wSUfD1/RwJ5JwI+iLcetHayG?=
 =?us-ascii?Q?2S+lzJS61szIxKThKTM2C5RKbL2cvY/DEYnJQWLmOQs38Du829ZmumJTs2Cv?=
 =?us-ascii?Q?DBwNSgPWYM62n8o3TAf7TUb8T1X5vwiE8GQ6ibVhyszD4UNgk1uCKqaJyZTd?=
 =?us-ascii?Q?ODOmaFdl4MDRKTka6avEtxLdtdQnQHyaoGZpTR1zzy/xLv9eTzkchqG1WwRX?=
 =?us-ascii?Q?8YliLcRRSOXDj9ISYvtmMfpAetXqMVnXjPD6LU0etvDODtrQm0RyzTD7u3V+?=
 =?us-ascii?Q?tD8Nruy8ScS9q/+BDtwoYIerW9kUe3Qq5mD0IUBm3ZyJcruhApuYSw/2DzwZ?=
 =?us-ascii?Q?3yvr72dYAtFfj4UvjGweqGT2bIw1DdyZ6py7LC3NtkkVsoKWR4egl3XcmpEE?=
 =?us-ascii?Q?npYLZViLtpyrx80AIoGpcnF7fTkgfHYTKrIiVSidQOpLOTDnaX0xeMMSAuhi?=
 =?us-ascii?Q?oy7+/FUJZgTpTOXV83Uour3BZ8A17NJGMOVShz61xCzBPORf7oMJfgu1h3+4?=
 =?us-ascii?Q?Ca/03ah4BsRG+VQntSzteD0H7l+1aDmAqIZOojpBOQTFG6kBJMp4d3nLoFO5?=
 =?us-ascii?Q?ijCKTNVvRldFyT5CCvrlrKY42iWFAzu90RTq+IckHVp0TwUvv2OpijcEBi0s?=
 =?us-ascii?Q?1TGoukrz0HvEefyk9NpLrx8g3UMKDBuZBRHaHxtLNLC9zXjhoXVUvnyqT/EO?=
 =?us-ascii?Q?BejtBuuLUBkEiLhZrPN6N6L0U+WHkKTlxj8klDNB3jMMKt5bMleE9O234+HA?=
 =?us-ascii?Q?yuv8vO2PHkr+k5YZD/LqhtSvSmugTd+QZ2NsemUfoFxWZ4/NLyXxtmdW6ZI0?=
 =?us-ascii?Q?S1gY6N+xEfJnLygmGlq4+V7zrVUAKwMQsOjKVTw91j6keGGUsvkcrn+bci+y?=
 =?us-ascii?Q?aMVPbil+GLZL5JcVo2hNVFjiShGsoNrcreWo5Drh02xl8J2SEV5SK7NXMz4m?=
 =?us-ascii?Q?m3VtboS+jsJzYmLkPXgyqJUHDHkk21uvvIxgWldiY70EZvsx6F599OYJud/3?=
 =?us-ascii?Q?ZWmcvKROsEEf4RarPFkmoBT3Hg/mF6ilKv1eS4OX5T/FCJDt99/gmOoQiN3j?=
 =?us-ascii?Q?/fosnzf03cqQPCrUl+v6Ieh4k3RH0F5VqT1uNr03a8XA/6B4xDIaYTC4tSXX?=
 =?us-ascii?Q?AGX1sYEhfy+POk3vdeivcUhFSA2n0Pbx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZpNFCkSNg3XIMP7k32lnFOI6GZRypBym3ixz1cfV0jEDt0Pr5ErN5uDSZk7j?=
 =?us-ascii?Q?F41lyxFC5I5+Pleu0MpjcUzPe4rFmjZa/mArnJJcZ9vSFj33vOqs9aorTyG7?=
 =?us-ascii?Q?FGO7pIV2nwSwT85+dJDSroSF1LRcXhbolCULP6j/Nqqm7IBwkCOjDedddb0j?=
 =?us-ascii?Q?ki6COJOEGDH06+XgkId2IQRDPF3F99WLmqI33zj7QWg2YC+P7tB+pzftBcRJ?=
 =?us-ascii?Q?7bpZT5wYwYrFQUtIgTUg/ZlHXskdjbGr11sE7UXkRgsoGrwg3jtXczT4d+4M?=
 =?us-ascii?Q?kQg2FhmB01pxKWn4cEGDfm7KdXu6Pw7uFVwSWP2EJaP4I6qe/vxb9F9jkz6R?=
 =?us-ascii?Q?fVV+RWboUeLOg3y8264VZkXxINVQiK6zZ6txGCrhLUnKP1vMNmNay1lPrAl0?=
 =?us-ascii?Q?jQU+1dpQw5gwvVnuB/jMHwiAvG72h/MPdBlbz/s5sCFFhaH10iy6dCvd8q7o?=
 =?us-ascii?Q?qaxmTcmotpUd0IPxSzN/Vf9R3Ke5/TCwTRaDP6+GBt2uJ3qiiJ315s4alz7m?=
 =?us-ascii?Q?mgGE0XovP2eQ+oWJn7kMiRoaOTnp1krI4JUhati09M1WwSU2CyWGvd9ce3SC?=
 =?us-ascii?Q?bN8vz61iugjb2Hrj7Ds5/xeCSzKDBTOHX7PnhedI34XZBsJMq/b3rslwEWNI?=
 =?us-ascii?Q?1k1aWMQKjUO2x/63esADkTx4QeSZg90UZYB4qtHfa0dc/6Pl2zHY6tJyBvpA?=
 =?us-ascii?Q?3xBggFdtekwbYo1tO3Z1Qm77VlV6EdJ/NPF9KuZGkeUlvUs32vZ6foIOl0YS?=
 =?us-ascii?Q?Q2RWc7aoOhRawhvK8GpcXg6kA3ApG48SUk3yqpjG3CAh7s+X3bmGLwxc/aNj?=
 =?us-ascii?Q?8FTQcTkSfCwLuiE6DtoefiWod1et1Z3AO5UstaMbFpx3OZWktuv1snmhMr8G?=
 =?us-ascii?Q?j+D5qoTXGrIU4RzyviAydW4TuknEorZQJDvWsdW8oCuQYkU5W7rL5bi8Remc?=
 =?us-ascii?Q?BAy4Q32snM1RMEEA/BibLEA4uQV6oDSFhKCn7UqcZXcuQ2pv9JtEmql82pRz?=
 =?us-ascii?Q?5zzlEVcaHT+v7qcryAcBLDABtDJuUKRA1kt3KX1VoIUTr+GWwLA2BBVhEqh3?=
 =?us-ascii?Q?Fsn0sayA92mnJUOzEt73LCv0dYtCSlzAwRAHEYU1y9sYawTfSzmSptTNqNPz?=
 =?us-ascii?Q?52bxlGe47PUzPqL4hCm0YzZtJuiEpefUGXmonkh/ltiR4QQGrT8LxXxz5ZXv?=
 =?us-ascii?Q?7/1bQL7sr3CxNXhJ1GsLwekiMES2V7p0qT8cRssXTqMh4bXSY4T0ccnKs9P7?=
 =?us-ascii?Q?L3uKfhWHspIuVSY94q+lsd24vOjgaAShdFsPXjEucDYguF5gVq2aa8gPK8ec?=
 =?us-ascii?Q?lT38AKHpPkWSI8pyz70eIVQphNWA7J7bq43olMndP4WhKRCfUepGmDf8pw6x?=
 =?us-ascii?Q?M3LMStcK0eEyGuxHTc+aKUvCyfy58R48CU/ZjOPLtxzFFb0i64eVfydW3wFv?=
 =?us-ascii?Q?IE3OInoixGYcuW6bqcfsR56ijCWrgw3yO0pB/YH44sd2AlW9WBcPeYFfFMsB?=
 =?us-ascii?Q?Hqcx4S4cQnCYhsbcreHCeIuhsjsdOWrT11MMk386B2Bg5ZX9dFP9cMZarcW+?=
 =?us-ascii?Q?vVli+tCfox7naIw7lF5Y2GCzlkEEXtFSdUfHEL0v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e433f9b-b4b2-4a67-988e-08dd35798770
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:30:23.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbOhZKOWqprmUBwWjFWH+zGhhapIUJcPfDHroBjE62wtFsVmbtm0ddVg9IeKQ/70jcSkzMvn3MH2LKiW6FmTGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393

On Mon, Jan 13, 2025 at 01:05:11PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Create common part, s32gxxa-evb.dtsi and s32gxxa-rdb.dtsi, for S32G2/S32G3
> RDB2\3 and EVB G2/G3 boards to avoid copy duplicate part in boards dts
> file. Prepare to add other modules such as FlexCAN, DSPI easily in the
> future.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../arm64/boot/dts/freescale/s32g274a-evb.dts |   1 +
>  .../boot/dts/freescale/s32g274a-rdb2.dts      |   1 +
>  .../boot/dts/freescale/s32g399a-rdb3.dts      |   1 +
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
>  5 files changed, 275 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> index b9a119eea2b7..c4a195dd67bf 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>
>  #include "s32g2.dtsi"
> +#include "s32gxxxa-evb.dtsi"
>
>  / {
>  	model = "NXP S32G2 Evaluation Board (S32G-VNP-EVB)";
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> index aaa61a8ad0da..b5ba51696f43 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>
>  #include "s32g2.dtsi"
> +#include "s32gxxxa-rdb.dtsi"
>
>  / {
>  	model = "NXP S32G2 Reference Design Board 2 (S32G-VNP-RDB2)";
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> index 828e353455b5..94f531be4017 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>
>  #include "s32g3.dtsi"
> +#include "s32gxxxa-rdb.dtsi"
>
>  / {
>  	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)";
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> new file mode 100644
> index 000000000000..a44eff28073a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright 2024 NXP
> + *
> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> + *          Larisa Grigore <larisa.grigore@nxp.com>
> + */
> +
> +&pinctrl {
> +	i2c0_pins: i2c0-pins {
> +		i2c0-grp0 {
> +			pinmux = <0x101>, <0x111>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-grp1 {
> +			pinmux = <0x2352>, <0x2362>;
> +		};
> +	};
> +
> +	i2c0_gpio_pins: i2c0-gpio-pins {
> +		i2c0-gpio-grp0 {
> +			pinmux = <0x100>, <0x110>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-gpio-grp1 {
> +			pinmux = <0x2350>, <0x2360>;
> +		};
> +	};
> +
> +	i2c1_pins: i2c1-pins {
> +		i2c1-grp0 {
> +			pinmux = <0x131>, <0x141>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c1-grp1 {
> +			pinmux = <0x2cd2>, <0x2ce2>;
> +		};
> +	};
> +
> +	i2c1_gpio_pins: i2c1-gpio-pins {
> +		i2c1-gpio-grp0 {
> +			pinmux = <0x130>, <0x140>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c1-gpio-grp1 {
> +			pinmux = <0x2cd0>, <0x2ce0>;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		i2c2-grp0 {
> +			pinmux = <0x151>, <0x161>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c2-grp1 {
> +			pinmux = <0x2cf2>, <0x2d02>;
> +		};
> +	};
> +
> +	i2c2_gpio_pins: i2c2-gpio-pins {
> +		i2c2-gpio-grp0 {
> +			pinmux = <0x150>, <0x160>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c2-gpio-grp1 {
> +			pinmux = <0x2cf0>, <0x2d00>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-pins {
> +		i2c4-grp0 {
> +			pinmux = <0x211>, <0x222>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-grp1 {
> +			pinmux = <0x2d43>, <0x2d33>;
> +		};
> +	};
> +
> +	i2c4_gpio_pins: i2c4-gpio-pins {
> +		i2c4-gpio-grp0 {
> +			pinmux = <0x210>, <0x220>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-gpio-grp1 {
> +			pinmux = <0x2d40>, <0x2d30>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-1 = <&i2c0_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c1_pins>;
> +	pinctrl-1 = <&i2c1_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c2_pins>;
> +	pinctrl-1 = <&i2c2_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c4_pins>;
> +	pinctrl-1 = <&i2c4_gpio_pins>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> new file mode 100644
> index 000000000000..91fd8dbf2224
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright 2024 NXP
> + *
> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> + *          Larisa Grigore <larisa.grigore@nxp.com>
> + */
> +
> +&pinctrl {
> +	i2c0_pins: i2c0-pins {
> +		i2c0-grp0 {
> +			pinmux = <0x1f2>, <0x201>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-grp1 {
> +			pinmux = <0x2353>, <0x2363>;
> +		};
> +	};
> +
> +	i2c0_gpio_pins: i2c0-gpio-pins {
> +		i2c0-gpio-grp0 {
> +			pinmux = <0x1f0>, <0x200>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-gpio-grp1 {
> +			pinmux = <0x2350>, <0x2360>;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		i2c2-grp0 {
> +			pinmux = <0x151>, <0x161>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c2-grp1 {
> +			pinmux = <0x2cf2>, <0x2d02>;
> +		};
> +	};
> +
> +	i2c2_gpio_pins: i2c2-gpio-pins {
> +		i2c2-gpio-grp0 {
> +			pinmux = <0x2cf0>, <0x2d00>;
> +		};
> +
> +		i2c2-gpio-grp1 {
> +			pinmux = <0x150>, <0x160>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-pins {
> +		i2c4-grp0 {
> +			pinmux = <0x211>, <0x222>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-grp1 {
> +			pinmux = <0x2d43>, <0x2d33>;
> +		};
> +	};
> +
> +	i2c4_gpio_pins: i2c4-gpio-pins {
> +		i2c4-gpio-grp0 {
> +			pinmux = <0x210>, <0x220>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-gpio-grp1 {
> +			pinmux = <0x2d40>, <0x2d30>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-1 = <&i2c0_gpio_pins>;
> +	status = "okay";
> +
> +	pcal6524: gpio-expander@22 {
> +		compatible = "nxp,pcal6524";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c2_pins>;
> +	pinctrl-1 = <&i2c2_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c4_pins>;
> +	pinctrl-1 = <&i2c4_gpio_pins>;
> +	status = "okay";
> +};
> --
> 2.45.2
>
