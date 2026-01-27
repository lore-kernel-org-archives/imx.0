Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BDA35DCE6
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534058; cv=fail; b=qVTy3E7uS+i2/7tSneUoEwtdARRakvo/nCCbjXvDS6rsKsgK4WyEfIJpojkMVGboYvZsGHq5Q5vxP9cwwSyudgN7l6wfB2Wo5lihfzKy0o15DVlN84n5unvojoY+hgdTX7MNoQLdgIcz4uiX/LIdVsXB9iK3B3xg6mZXpBKVC3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534058; c=relaxed/simple;
	bh=FHT668IY1o0ckGRYp+7+5fQfyUr8FMdtZFB7HLIdgcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oUOpqcxekd8RhNQPHBH6wuYxYnoyo3eKOf9bl8mstf1BNd0Lhm+KMV6og8MKluPEQ+wPPGrqPkpfiHXlUrBOq4FTX4Wkg2NgBCZiSFyTqtE+5mAiVZiKvYpCYNwZQEiA1lCtI/FJwXTPEsULfkKsnPfuBdsmr+soJg6clPFtxdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mqdJCvhQ; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mqdJCvhQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W670u5/S1yZ6UubdtXtmBlpt4QEbPM+KxPm+H3XO/9pnY+5OLowu9YvdMIRN8CJyo8zcDpxMBjD2PsumC9YsLGZrAnR8cQ6U44FfcURYjp6kIHmbPD0K32QeRLHhsdwGSrtYzu1ovQm3J8k6xm9D0DZNFsqurU5J/9OE5va9bzieXT4KrDh2D3JLwo7GIEJ4cNgwGf3gpyvc0JNk6YR+uwBR+DSoE2xkBCxcMCED+9w85dqN2uNxs2e6r1qfgl4+mUDgJCvD/Od+oJqW8nUOsIWQrIVYkwPCfpooVm9JdBNHVD+k8ua9c95QcSv4uMj61agZWGHB6BptIkN2R8YcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwLGdWhUsAJ8RP+T+F+GjVFHAs8vypgdA24qMS70SJE=;
 b=qIdqARh/I1vaCT8DZLJfPKkDUwJdi9+/RYo6KlFL6aUCIQtXuj/dzlmTGeivhDFFEPmO/Y+ygriqZ+UHJpjX2fRnAa7GUJjZzYRktwsYGkZ25K6+df8CmE59mkTtlS/FpLEU8IILQPCHkOGE4kdLJRxjgGnjS5svQYjOuHCJ8v5ZP9AQ/OInUqKhzBnXLPoitJaApOboBqF1tqsvvyS4XVeM4Vsx26McW5/kVstjgsNHKb1r6igFoY4X5lc2CSXyB79wQvWdF0MhLxoYuQBaGTG3qxdHGfBktXw+JemnraeiVavMWtMRZZm6ufJ3wk7ccULUicgG5s5xbwlNwf6dsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwLGdWhUsAJ8RP+T+F+GjVFHAs8vypgdA24qMS70SJE=;
 b=mqdJCvhQsrlgtGvLVTgxStopmYlFD0aETDitPqNO2o/G6fZARM6qRtZ+L/5q/rdHU7G7j37421o3ukij7+dvSI6XyX5FDv1oE7webR2JTqytISpXPbita60PnRR/rkHPQ3R2tlkh+x1i6Nr5ySxIFTC4aBuV/zaXZs3ndix2P2PrXDRzO7facg6SjpY3aZJtySLw7lniSHNtN6pWez4W0IIuccY2bldKDSX0586beBDpko/Ruk5KZKxz1Ey4InMidldNiXRqfFiGaN3S7y+ONp5YmOeaPrDnbeyiEvN6gKalKi7a8Z2CldG7xba9A7I8kO/Jc2qsJRINTtVM93JwMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB10061.eurprd04.prod.outlook.com (2603:10a6:10:4df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 17:14:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Tue, 27 Jan 2026
 17:14:12 +0000
Date: Tue, 27 Jan 2026 12:14:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Message-ID: <aXjyWHrwCJ19oUkX@lizhi-Precision-Tower-5810>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
 <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
 <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
 <c4f4a6cf-8511-44ac-8648-d8c4093e24d0@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4f4a6cf-8511-44ac-8648-d8c4093e24d0@gmail.com>
X-ClientProxiedBy: BYAPR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: c3781ce2-00ec-4f92-6cf7-08de5dc77da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|7416014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4M9z3QSDtDkSkN/R+L/M5YxIb9eX5k3ZV56MMJS2dhype5WZEmlQ9ImpB3XN?=
 =?us-ascii?Q?ybcEvKIzenJ6hnj+axv9uR5Pk4hBnQxu/T75NoTG+sVuBeTMBrFO1ytbOteX?=
 =?us-ascii?Q?zPm8wsPM0CiNBwJh2qwnqBGlqYrFuXS/TszsAuKhDDrNa7JlzgJvqHdx3twq?=
 =?us-ascii?Q?Fi0AIhZjvF6PB9m969fRaShJvcniwQnfFsddKkGBzrhvRr0kLd3mbH6uDPwa?=
 =?us-ascii?Q?KfT5YlYhN8GEHBm2AZRhX01fmyxjYaveuEYw6FB7B2QVJpm8EXqXCzpTf5Nd?=
 =?us-ascii?Q?VyJ+kG7OnN0JjPY4mIrBODNRsKR1MFTjpcDP6ghjUIdnhVlm9u2YZ94qwDpA?=
 =?us-ascii?Q?qMT/GutiKj/Tr/vpeEiplpufYkH0BUkEVlaN7eGjyaUYYK4pGVkz/n5+zh2v?=
 =?us-ascii?Q?1X3Y8LQDeE5VH+PMGd0s5+eT0D9zNkS6u/yaOzO7bYIOqScm5w6TYD23Libo?=
 =?us-ascii?Q?7zYHvvM859Us3YuukNkG3pbO2Kwxkn+Dl91oU0ww361umhp0LUdZLy0nRhZY?=
 =?us-ascii?Q?N7ZGTgJn6aJs+a9uoclJ+loJn2I9wgERuVSpgZOk87dXxO5vYXjTido1+50B?=
 =?us-ascii?Q?/FSqh5jYq/3x9K1zGhQlBojqUzfvIwRECjqHjx+L7Ogs9+WzdiJ7AaBU0qwS?=
 =?us-ascii?Q?7Ib2y/D3Te18atVvaxzWp/hFyDU1NSgk4wlqqIiqsec+lhF6XgxqLTzAJiW/?=
 =?us-ascii?Q?OMOiWgwx2k7Gt6iRRuUcQg8DMQ/pm/rtxyOZVe9tdBg/1JOE3a3bZ/jfSAJY?=
 =?us-ascii?Q?YXNvSebL+sEUqERnmmJ1nvhbRYjCfSPOZC2DgMAsfZnYULipN2S8q6FzHuQ0?=
 =?us-ascii?Q?6lMwgg9yH3U3uNctMJ9oR3aCPn0p7IZU68f8LnO3R9sT3JWsHgtwyd8M1QLC?=
 =?us-ascii?Q?n63zVURCUtRR24kPfwy/mTqbZrVnyAJjlKql2TU1c3PsaeVzrT3sasz0DVBD?=
 =?us-ascii?Q?BGMpo7W2iURN5GdGrI/HikRrFT4zJR0/AAePp4hM5nww5Km+/jagS9pi3/4/?=
 =?us-ascii?Q?b3F2TS+3oHe+nIFDoOUarX1Pa6XBWWlHMMDpUQRhMcLlzpkJxwTOVzY793r0?=
 =?us-ascii?Q?Q8JTAPG118ZwPZw+l2gtZJoMLVYB/hDX+BB2W6ExsFwGz0Mz7NjGMyFkjNmI?=
 =?us-ascii?Q?1OO9gl3Oqy31sk3yTqOPOoVVjYHhZn2FXD+T1odfqM9eQ6pGuKezsGyu5W0I?=
 =?us-ascii?Q?K4q1q2KJDdYqdi3VN5deXCXpCtC6haCZWIUsauQmBKBLeLCYsfOSj9UpLf65?=
 =?us-ascii?Q?cG0ScEP4bWPYpwbox4o6NGsOfhunt6CdZi92caF0Mr6l2KCJNxWjFj+Suntc?=
 =?us-ascii?Q?rqEEItuegJADQ8lG+FfoNKrUEc2LZNf85dK7M0bICEUnBA/U5M6OnVFiflBb?=
 =?us-ascii?Q?l0l6Sc+RsYFcS+fW2X4tczeUigucoXZrr9WkA71Z3nSMGjXWCzF/7xWWBKN4?=
 =?us-ascii?Q?NcRqsEOZvSYoq8fT+xqP174rPFr27e4hZ5jmukTC56GaoRpMyUhpkrldxOAE?=
 =?us-ascii?Q?QoOi5ZbjuQ74byZMe/QTQnyvYSFPLhMFsf1xR9Ie6PhSlSNAqu+YaijoJYvA?=
 =?us-ascii?Q?G6vPCfo2WdHaBj0crg5N28S+0CXWpQ39mEDTZ7ZpR6XYyrXEIQtK7GEaR5Uo?=
 =?us-ascii?Q?AZ1WF0pYcMdf2lwlWXT4nnY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EtMSMj205Gtx3Lu0aCLBGC29gsGCp7QKdBkmOehzApKsgPivAwBEnO26AUam?=
 =?us-ascii?Q?eDa/zHacirol4J61JWeWfse1LqeUoTqfk7sHBzttmS3H4Z0JuMAkDZDOPMtr?=
 =?us-ascii?Q?P7/tgVI1P2AZoU6aOekNDIpnRLY9Tvmqw9S8oEYGzV57aRgqBgOWuT9sHqr4?=
 =?us-ascii?Q?OtVmG872TzqXniQ1sz4oNFFqc1z2dNosmGPm4bTLEm/qAk9gpslTcaBtW5T3?=
 =?us-ascii?Q?obC6m3xcup/IXntKO5HIuWz6PbmJryC1nOtIrBLqajfcHasLdMz5kKHyILCE?=
 =?us-ascii?Q?e62PUi9AQUKmedswBBxec+ajme+UjBkvNAtQBzzODyEWsMYXjv11xsWSBloj?=
 =?us-ascii?Q?479mL25alClqzNUufRGZ9XbxVPWuu9iojzwBBluWrwN/6TnKqVAJyYUwQoT6?=
 =?us-ascii?Q?zmPGCZP1Xz4hZg7DCNeou8d0sAwLlS76Nowy+k1HWuJpG2q1Vm3Eziu2P+Pg?=
 =?us-ascii?Q?z2EhhKY8AmRv0pSV8/K+hukIVS5ADK/6y7HM199/KSyf0XlWmV6ZUDQv0vnX?=
 =?us-ascii?Q?SdJBmgjKFOKxJOs3Ihljbvj1nuoV+YUlB4HyZPpNmgPCN7fsGNCewCNfaZUe?=
 =?us-ascii?Q?v4mepn/p7afhS6Ka99YA9JPDRam7Io8EE89ZALtbxfiniKHmtvPaq9L0XD11?=
 =?us-ascii?Q?ugwMsikjayg256i0OhU5aS8uQh/TxQkLk9Tle7dkDMhdsdbQmLfgA1NGvWcD?=
 =?us-ascii?Q?nqBPSPBgrU/W4aHwMG9AdevKyPKdBWDqc75dv5Pc4JR/UWNNdAAsBJTSKmiy?=
 =?us-ascii?Q?krqeE/qydxIo+3X/nGeHoFT3OqQhWKYuugQC54Sabw3Pw/EH8ftVOtUq2jKa?=
 =?us-ascii?Q?3t9C+ieBA1pkmyPyQU7TS32O16nUe2ee4WazOGRxXyvJweTDn7U4eJ6pU1mi?=
 =?us-ascii?Q?Oga5D9lFLqUlRAHYj3Rm2dZLtL71acviVDh+KldDcgfO9CzF9gwi1Nfqclax?=
 =?us-ascii?Q?trMHvd95AKOzOIrI+vY/igX6epNlAvGiuT8ORpHlo662vHO9U6cEnzOr+zs+?=
 =?us-ascii?Q?c+WrUo6pjpN7jCkYNiC+b5hQtM6S0TJwvXr1FdUuGbIbgoNP+bnIk+LSY7P/?=
 =?us-ascii?Q?VjT+veZelYyx8cu7drtzVZykCWF9XUHt3A6yilYEySQiihs7oaDxoT1ZQBO2?=
 =?us-ascii?Q?TPRZjWFyTbgprosWD7UkKsJNeqDwMz2QmtcIgSaVo9kiArsLgwk2pX3fMN5M?=
 =?us-ascii?Q?Z99uN8t8ulWFqvzeYl7QNQyw5u0sXgr9KiKQqL63YDGeyNlJ3sBmxgNrANd7?=
 =?us-ascii?Q?GFkqjKSj9cyqqpPkS0XNiommQlPEXi2r7o0nRX+pVwpzrj62MTYgHryD7qAo?=
 =?us-ascii?Q?zNPe02v/I0rTgOl2tZd34IlGGPsSIzdP9C+miyK0Zg/9oml9tEDvkUAY4VPp?=
 =?us-ascii?Q?OjEr7ZU0YbTPPTIpm1C32ShYW5JI9YR2K7ZNKpftALPZtjCk5HbLfip00M+C?=
 =?us-ascii?Q?M8+qsNXJtBfFJ89AdGZ+l5nIlwOshbQecG3beWghSPO8WcFqp+hSFHO0XP8m?=
 =?us-ascii?Q?HNSmI2wAkNMgupHlrjHVXnpUKJQIg6sFBq5g5XdPZ0EhumD/fscQcykRPtN7?=
 =?us-ascii?Q?szNVVZxv5wnM2l7aX06CvPocEfBWEbA8ietCd+mNlzukPEiDfsZ5462flbOO?=
 =?us-ascii?Q?nXU0KcWZlo86L5UHc/aZ1kkVopSG5I54+hoYP11ZcEC9ZtE7jS33EemS9I62?=
 =?us-ascii?Q?kFyyeyhN6DEQOtJe1sRDfJB0hXnkvTw2xoBNRGrRMYBeM6GH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3781ce2-00ec-4f92-6cf7-08de5dc77da6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:14:12.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQH/1rynz1RaaUaAz0soC8hvlmqkFpMCpF9foTxeW8UfI//75ewLy4xoEcTisi9XYsY7PH0zr/UBkSFrELQ7CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10061

On Tue, Jan 27, 2026 at 04:22:19AM -0800, Laurentiu Mihalcea wrote:
>
> On 1/26/2026 8:40 AM, Frank Li wrote:
> > On Mon, Jan 26, 2026 at 06:55:37AM -0800, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> Add support for AONMIX MQS (i.e. MQS1).
> >>
> >> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >> ---
> >>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
> >>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
> > Chip's dtsi and board dts should be two patches.
> >
> > Frank
>
>
> What's the rationale for this? Is this "rule" documented anywhere?
>
> IMO, the DTSI-related changes are small enough that it doesn't justify
>
> the split into different patches. The split would've made more sense
>
> if we were touching more than 1 board.

Shawn's reqirement. I want to continue to follow this rule.

Frank

>
