Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768557;
	b=kJJjgzpp/Ip3Z3I4sFhwTenw1e1B8Ggucfb4FZ9btCyha2n0UVaKJpoYPvVyWluKtaxT
	 AHzgkAFzjphbFsKSl2WTcM3jl+Fw/nATWPgs2QM2WrDwxDNa5z+pnlXVzgdeOIUHSun6m
	 CJriuJ6Y7hzAMXw/FmABk4RQrQjDPkSOI9Tliz4CunfYKPILgkV3sacLmj57vGRD+ycpJ
	 c6iVcEhGaUgYxeVWhVcWkNWhPDa/JU1yP/8bOV1tybS6RKi9hnRR6PBM6VhAhH/EOzCoj
	 DX409DxM8Av/ST2KxjF3gt1tiZDrqmhnwLPb+M0gQggEchleJfU7rHn08xdXIAVEvNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768557;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5oJpRDVpwsYL5wMq42O/LjLxP7ykplzeP8H6xERXWeg=;
	b=QJ9H6fGkgpxzoZCl5/XiK7tZEVT+xmRzemH+TFapaF3sD747PoNI8r5e8Lc35y0wdn8M
	 +Ip52pogDSOy71g3FEiBCH8nDLPX4PWK1g9qmvuAmB4raE5EQ5iDOatIYpkIys0jmhcbG
	 2N4gyPmI7Sc7u8SE/7LXadUbVxXyGHqw0bZXERqe0GNPFQSkt8uAwEVcoKFjndUjSgYJ+
	 38JVGZcUtCveZbmVhTiUNbAm1ftMvtzkZBNALJgSxkux34XqxSuqW/+Gcz+o5uXpEnQRB
	 Z8j+e1Nm/CNBEBTz06uS2yolc4bpd1FwTS5qiSOf6W3KcmQIRVB/98cdCRrV3LLlOuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RLLVD7dZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.4
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58419606A31B
	for <imx@lists.linux.dev>; Fri, 23 Oct 2026 15:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58419606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RLLVD7dZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yw6FOWl4vSjsWh0rvQSQfJmO7rEqTM+QyjAvQbfjYu83H8RyQR7MKERuYfHsf4aDuHxDJI9y87OYt+lOZ8Ac6np2LDzgvN/mIOCUjeFgiE8eWv29qy8kz98HAflqC0mo8eI4Zi1XfLfolNUAPIy5PMlc8MO88KpAhygbENnGLXakQmfR/bS+VKNbLdeybsONxW4NIjNUM7ynhvV3h0AJIyB9EqFT0XA7RKyLtjsHTxWcaYq1gBJI+50EVAzF0kv7YnXEdL51SlrOWQutSczjqAJ4JqgIlkkSML3+sQMCYSj2tx4Y6YOX5CXQ5S7Eu+w2fqI8kryZrdC/4+u8yEA8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oJpRDVpwsYL5wMq42O/LjLxP7ykplzeP8H6xERXWeg=;
 b=oBtzsgnMQUBNylmiTQGjTSqzsSsnoIFmBt4j1puUybQaki02BIQhg2ZMW38GVlaHM5UVIA9JS4ZaCW+R+lQKkjl6+V0zLiSI3TjgjoiS0Jc7CrQPDhem0bLU9AvD21W1ZE5+Md1OaUxtM2w0TUebkK0fZYGf9nI8VqWu0qmLzErh8eg+audCBWqpJrQcG7Ogky+7GJF4QCk8J3YZVdxN0A1clqWTMAoWkf5FyYuI1UsQSHHnphs6UEwoKOUatee1HBrzyZ3+LMXyaP48OSamLOKgJCDGoJnSW2kxAFKeV5a2vTHWY3wJDei2yMDtXJ7beXF22Ou1ZrzKa3LGMiybOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oJpRDVpwsYL5wMq42O/LjLxP7ykplzeP8H6xERXWeg=;
 b=RLLVD7dZAXsr6hCPMjXa19ntVtc/iJDJqTUWe/7NpuoB+QkxxNndovb/FgaMKP6rAVdWJZwepGTQRiig0CpgYMsEmJTCGjl7hfP+Xc34JTiCitXq5QL3rE9MJusk3IVWDqC3ri5TYgKNUBmSA4duMFX6Tszy/GDNfnZNqPsgwnaVd/wrrUeTTIoXQob73JCZPMlIS9t8zJRyO7bsWZ86Gb/3idBkgVxX48GCO5nveZ7KB5ypGSj/0pjg5hGQiH1Ya8D03NMfgwJvzWaamiyG8831s0KRwxHro27EYS4fTGhqHq9Dj1nfvdUyg4hltca9pVtQG83pIEZPPFHXfNgXBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA9PR04MB215426.eurprd04.prod.outlook.com (2603:10a6:250:106::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 15:15:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 15:15:47 +0000
Date: Fri, 23 Oct 2026 10:15:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] arm64: dts: freescale: Supporting Variscite SoM and
 carrier revisions
Message-ID: <att6GNZAVv64Rlnv@SMW015318>
References: <20261023115242.11197-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023115242.11197-1-stefano.r@variscite.com>
X-ClientProxiedBy: PH0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA9PR04MB215426:EE_
X-MS-Office365-Filtering-Correlation-Id: 031a1091-420d-4b00-7411-08df311883fb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|261022105027099003|261022075727099003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
 uN948liOzVwNH3SHQQYOg3hA2o8DxiQ2VqLsOpKePl6X/76phwUcrFnlZV1mlcNDBZj6yFyjcJ65M5iqWAAEnXs1tWDffzu6GG7dkimsFdptX1kDXmkBaFUHGszVJE0IqnkxDvTC84H1CdEBgfK+eC/LbjVMs6b4thAViJa9SAc4/AvmjYw7cvbvzX3hPPg6clqSha+Kx0Jayhy9M09Wcqk7e8sfJ9vuBwlPFNZrusSCy6zElGDeu/o8JPtl2ThGqsbuBuDo7NMtDNALWq+/W30XmqHrXTyITOTALG73gOYsFQqAFJlGH5EW2yX6J9xs4zyAihHZpwY+cmXOF1qJpI3/wS+K5CtYau8wLIB423GrVupv4MyXN2kBpKGXBpRLxk2ZLo5Kg0G/bwTP8Hwds34hXm/x1EmCqOKJYdflKFCtq/zO/D5KoqcsD9IcoqP3CGM7og/iK+kmwclj4G19c43XukhzgWsgVXgJO7nytv7/XPMcYYeQPFW8YB4OflTnDl++q0BmS35MK+2fZvyGlXnSmAlATLLVE2KlG/nFGxGrdD2J4dzYW0AN8xkzoCfRy8KDYP6fvieMNFlbDfM7/o05sZ9pu/4Mqlt5NnJxaYxhfPR0K1R9gF0tBpavv4vK0aB6ZLBrgnC9aNwk2F8jMeTlBcVUdfntiynHK6RChpE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yJkmBM6TlVeRh3yanJH7R4ylslpvf72g7Ya+E6ykOiITSEn61GjEySVlKJ0P?=
 =?us-ascii?Q?tRm8Z8OdVUFk5uTXPRmBB3q3/6NLOoXdjmTaBQ/FxUJGk+DTyH6WOSnQNpet?=
 =?us-ascii?Q?gE8F38motOyAiMgwgCvzOjBfKUSDqGmatjMXHsAeXJEz8No7B6XFMGEt9eFF?=
 =?us-ascii?Q?asXWzcb0xIhPRspq3IEAnrauD7b3KbfzZkaMibh1deWGcHN8d9WzOLolaLPH?=
 =?us-ascii?Q?Cu6sz9AfarPbzI0SA+NM3xV8jNyURNFBxkq0XnjCokGgmCrQnPwTV6roAACM?=
 =?us-ascii?Q?mHn6TMhPLMCBqgbGRY0wuv9SRFmxFvDDXtG6Q/ptKqBajGyzN3g89Toa0+/V?=
 =?us-ascii?Q?1ygPs6PGqJl3Dt1RF2Dho1Z3HW+p2gbhHs6mXdDFDvZ1+DC/PNEnJ5REbSXt?=
 =?us-ascii?Q?hELUFZ/srlesmzJ6EFwa95O1486H7lSeSSeJZXCEGTcufixoFDKmANrySyRK?=
 =?us-ascii?Q?FXRGS4HFvbkxYg2NupLDGykzLTFTCO1kpu59Bzdzgry/UZwIwmpru6N2+hDg?=
 =?us-ascii?Q?6lptC/H5nQKyGirFf7z19NsmRBpgPnZ9kFctkca9eXKlrgz0SYAOkekjYEUp?=
 =?us-ascii?Q?aEsA3CD0zORvkvYy02Sqj4O5g4ijbJiGsojYxrKQOdA0h5Iy56QCk5NLvB+n?=
 =?us-ascii?Q?3uB57wy6XeUaSNaKIENKTdRZ4PGruP2Fv+gWGpdrbugk5X1L7cZmO9Nm2iTr?=
 =?us-ascii?Q?JwxAHS/IddVRQaNQR1aUGQrthu/1QiJh/7WWmo1ov3P/m2uRVYKxmXyslD8g?=
 =?us-ascii?Q?lMTPRagH99JDiMsSyhnN7/FqNuhDGkK8BZGTEEf/HGKvNleB1ok8AYkon4gj?=
 =?us-ascii?Q?ulPf3wiRhEeDNuPl8PNSH132meV6LIUKK+Ah3iH3/ScTUwTZsxJI6WFG7DY8?=
 =?us-ascii?Q?GQf8D4Q0xpaXS2ISY+PM0YAP2Ukv9E2sToTzTjKpMOYq6cAs1WlNSEwJJgPo?=
 =?us-ascii?Q?B+BG1IlsUpLiyWBO2zM4cWUP5+D5BBPeW4nBcF3sfLOISYjIyg3cHOwmlKWW?=
 =?us-ascii?Q?Dgi2z0c196gg5tQLdWlsdbhLxgpOihx52I7bsO31hcQEh7Z8fMe+FsW5stbt?=
 =?us-ascii?Q?Y4PTNeQLEn/Fc9N2kKyZg5aVkuZssbkqnXy6U8ZhtE0/iDtSDASKqOPwckyO?=
 =?us-ascii?Q?OpMKe6145OO/+qoN0X3sfw8Ilu2aLXe26rdGtFuve+I+diEMpyAFsJ17b7DY?=
 =?us-ascii?Q?oOscNny9OvayAb2I/UNqeZhSfJglizQJnNWgcZXOG7q523/JurfNqxMMTv7G?=
 =?us-ascii?Q?IAeGXqwwDjoLmMb2mzQ8dAmcW8yzOKLZyoOBzNptZLVWJKSJYIW85PfBYNCi?=
 =?us-ascii?Q?TDJGRaSYkFUqH4CtYO4GumASRcxvl6FCP0nIEUFfTi9cYKjMpp5RpM/ZubmD?=
 =?us-ascii?Q?l1ukniBMIMJ7+Fo9dcfmtc1x0NvRfPTIbc4S0CDBZQdQIoSDQ1iq7K0KZLX4?=
 =?us-ascii?Q?0Jk+WSevc1p30YKI7CU8dBclBw69g7AYj5fdefrf7F2HO99+uL3fCmdS/755?=
 =?us-ascii?Q?dA0+kuaNONuHGW6ks9PnOGaxJX+PlPejKLveP6WG7HGAHrIErTQG0IlTjkwz?=
 =?us-ascii?Q?6HQkooGV154fA54unSaprj0acxlNXxc3yTon8CR7JJS1l0RhfRd38MY1Godj?=
 =?us-ascii?Q?bpAW86Tya7UMv4FQG4TGkBNV8apjRNnglnmgsVddzFdESmOyVSwM1WY6k9Ct?=
 =?us-ascii?Q?cYaBA/VKxk+so3KrBc2A6YanLj5xzuBs48Vva2WCderqeD5wY9B6Q+waWu7T?=
 =?us-ascii?Q?lu7L7UQSrXF8DfAVilt3kxvuUXh8K0QJFE9e+hJUSuDCWYz5VZTR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031a1091-420d-4b00-7411-08df311883fb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 15:15:47.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsntFsBw1CXhi2/Ksgb5wugGO0KlicxSofL0v+eC5jXpk0Ei5GxVSM05gGHQmM+Fc8y5WzSEf4BVCpc2FVEmudDyfoV/uuIq8hGKuTzylnLrVYRl3csveXQBaDq+vL91
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB215426

On Fri, Oct 23, 2026 at 01:52:41PM +0200, Stefano Radaelli wrote:
> Hi all,
>
> At Variscite, we are starting to look at how best to maintain upstream
> Linux support for multiple hardware revisions of our SoMs and carrier
> boards. We would appreciate guidance before settling on an approach.
> Our goal is to support new revisions while allowing customers to keep
> using current kernels on older hardware.
>
> Our platforms are typically described by a SoM .dtsi and a carrier-board
> .dts, for example imx8mm-var-som.dtsi and imx8mm-var-som-symphony.dts.
> Both the SoM and the carrier can evolve independently. Some revisions
> require changes to the hardware description, while others may work with
> the same DT. Over time, this leaves us with several combinations to
> support,> without wanting to duplicate complete device trees for each.
>
> What would be the recommended upstream approach to organizing and
> maintaining these revisions and their supported combinations?
>
> One possibility we have considered is keeping the common SoM and carrier
> descriptions in .dtsi files, with revision-specific .dtsi files extending
> or overriding them, and small top-level .dts files selecting the required
> combination. Would this be a suitable structure? Are there established
> patterns or existing platforms we should follow, particularly to keep
> changes for newer revisions from affecting older ones?

It is quite depend on how much difference. maybe choose overlay to update.
but some change is quite big. Have to rename to .dtsi and use difference
dts to include dtsi.

>
> We are also wondering how to handle revisions that can share the same
> description. As a concrete example, we have discussed the following
> possible grouping for DART-MX8M Mini and Sonata:
>
>   imx8mm-var-dart-2.0-sonata-1.0.dtb
>     DART-MX8M Mini v2.0-v2.1 on Sonata v1.0-v1.3

How about use boards compatible string? You add new compatible for new
boards, so user know this dts cover which boards.

>
>   imx8mm-var-dart-2.2-sonata-1.4.dtb
>     DART-MX8M Mini v2.2 on Sonata v1.4
>
> These are proposed names, assuming that the same DT correctly describes
> all the hardware combinations covered by each entry.

If new boards 2.3 appear, do you plan change to
imx8mm-var-dart-2.2-sonata-1.4-2.3.dtb?

Rename affect addtional problem or efforts when back port.

>
> Would it be acceptable to keep updating the first DTS to support a
> compatible revision such as v2.1, retaining the v2.0 filename, as long as
> it remains correct for all previously supported hardware?

I think it is fine.

Frank

> In this scheme,
> we would add a separate DTS/DTB for v2.2 only if a different description
> were needed.
>
> This is an initial idea rather than a settled design, so suggestions for
> a different approach would be very welcome.
>
> Thanks,
> Best Regards,
> Stefano
>
