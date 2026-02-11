Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E2207A32
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824091; cv=fail; b=RncD2RSJKKQDiXxtl5gC7TBcp8rHysJFeAwfoU+2rqKlAqDIX5zdoS7V7cx9pr+FiW4dGiotk5jJ1+vG86fJvg3ug984dF511n6pKZeU6+El0SeMxQiAXhygt/YLYedT9144KyXvLUsUi7vFsPGy0U9k6SQMEhaGM2T1vsKoJb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824091; c=relaxed/simple;
	bh=PNPfI/dXHcl9xxyJRpdybnn7CUqjsBs/v3D4QHZoN6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r00Ju/hG3XEpWxsINRDnLwDb8ONaTtq00B5MmJ3VcSeMW8xlba9TkjfYtmla3Qdtt+0jJBoUM5CHrz00mb3+6X97lYdge4f/pNgsUUgt/9qoV+Q6T/FCBQjz7FBWJbLUrt0HLAYn5I3TAgD5njKIgYNj6EMZskHoTri3xoBcHzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=maDzQ80o; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="maDzQ80o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4NuZKU6endMOCsXGyaIVzEbzOPepdurdufDaj7DSjWiZjNx9FbH9QykeJsWb0qYINXUGPceZxEzxoQdte6WBWRHSM39ZiweAc5jkzpj3DqDCs5GN9iM8IIHIryr50YqVYSAxMNDWfjmytD730LCMjLg8UBbeYFsRSYntX1RXvYWYM+w83BFf549Xd3jTktCpngho7PBpelqU2CoGNgvSi+bcvwBUPTilDfOaGvwJoBsLEyO5pTLJplE9OGGgX3Wk9ujoAIBF7Zza5UaNsh+LNUFANbODuA8DQgqdzrLstNzAGF3YrDXGhCCxTZFkXBw7KCTBFYMMvKH/n4G8vm2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmMUjiSbgE6P5vQ3yQ4ZlqqvYnPBYO9sQLN++eZzB3U=;
 b=MnbeaMEHjDoftS1roSDZsxDTo/EjKFY5orulLJTPxS0uxRDRr1BPwDVIWcePvs8amLzZFFMgjrFgVFM5tBjF3pW5cu1r5Rz4vdb7TdbCTdGD4G+nroEJwNONzsXRO4WgkOhKLjRYSAEL6zbIfE6cIzI5UAClr69L68ATPQ+CUk9rvZPayMKWfog5jiXJmRQLNtGwcqsbH/8V72GRvan5YE4Q2lzCmUlWer5YNuvFBH99h8xEC31Tprq9pkc3jO+mk2KuN2sOle1u72RogUOlseyPdm11ProcwUiDNTPztTH/tYbN/Bbq0pN8Z4XnLEeB9rqpOajTVtuvCKc8pS3Z1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmMUjiSbgE6P5vQ3yQ4ZlqqvYnPBYO9sQLN++eZzB3U=;
 b=maDzQ80oN4ULf3TWKn1xQhDTffybCkgtVk8SaMI/Q0LwSRQe0nfsJaoqIkJ+KslQVcz68Xw+2QWHBcaL4bhQqae0S1ecXucD2WLbN+NPnHSMgLKR7Ue9IDA3wR3cA8hT2eiOg8ifoie+jyYvk9Ggyon2jXZQYIrw4bFWudOyv8e9WpBw+VWdDTBVG7xh2wA94jTWf5b8ymudXapG3Fpf8Y/ByT549EsUTq4xDaF7LgvZIE61CaiL+KotK9DrpgIKfCCo9wlO0fJE1SsxhHFbhM1Gh8LiWa6fsLoOkrwL69UTgsWn4l1CklNTX8iM4xUYZoZWRGXihYZbo2Hz1+rxTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10832.eurprd04.prod.outlook.com (2603:10a6:800:267::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 15:34:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 15:34:41 +0000
Date: Wed, 11 Feb 2026 10:34:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
Message-ID: <aYyhirFMOy3yLMyk@lizhi-Precision-Tower-5810>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
X-ClientProxiedBy: PH7P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10832:EE_
X-MS-Office365-Filtering-Correlation-Id: bde502ce-9e86-475e-484a-08de69831323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jz4rIE+M7AN+QKDW3+hDVa5aRkT4XtSm+BPA4C4MMjNWCjYv+5P8pnsImjBi?=
 =?us-ascii?Q?/6c4sYNu+uXUGVh+eaio4yrQZtV682FEkRAE+YzrL+/KWe9L2UOUACQFpP9w?=
 =?us-ascii?Q?wkd/uins2KwGPmGz3qNap/2HEhTuEqNjP3xvExcOZU4i/YbbN9fEIXjgE6e+?=
 =?us-ascii?Q?IxlYqyAR6BoOq6kg6t9eWhC68qIfMVScCc5ACCES6d8il5fNnOVbEG2s6n+m?=
 =?us-ascii?Q?BZnfTjnfPsWFxO1rBVQ/pliOMOSusuyO5OeVtHU46ISntMWGxveXEXhfoDBa?=
 =?us-ascii?Q?bRqoEPt3Duw+V5bFQBmPhucT6fHRyEW8CB+uRn/fNhqqHPKIvcrycOOGuF7o?=
 =?us-ascii?Q?Yw4MPJmyjIZQ71bo4/xxcgmnfWFwEqkdIRWhjdgyoABPpu17wNgEiUT2a+5g?=
 =?us-ascii?Q?f9uz5EIROvGm2NrswbcBScqN2IyMK5+za2iU31bfAUOT0HqVxrixVYdbw+3o?=
 =?us-ascii?Q?N5W5gxcYvSGHDDQRDfGR1rFLZcTErTiFDWC9k6iekfK3N+iaKCCIAelJ+PI8?=
 =?us-ascii?Q?ncF3sUyqeGNNFxReXpmONcjR1VADKSZWK3WqzQ18Eup5uP/QmxzMgb9jFveR?=
 =?us-ascii?Q?3dK4Sm1ka/Wd/zwxElvEu/JTHHmvUBJne8+pQ6a61N+cyx94x0ev4Lgww3pF?=
 =?us-ascii?Q?DZrBvuPSNe6HIrICuTWBcaX1XfG4DnvTcTipOabVsCVEEy5Cpe/IbmV3hmUe?=
 =?us-ascii?Q?wQr50YRIe8XhFuWWDAMwTEZOgCAFAcTxtDlzJMHrJneWRmJdRjXsIf4ODi2A?=
 =?us-ascii?Q?04IREPKeI5gTFs9zeys1T915N9IcUDF4AQgonjIIms59TsQoyUa+J0m0V5tX?=
 =?us-ascii?Q?JiMiMRlPU5aqI6A/UOFl7FZPH9/xZnonYuzua5uRIa9FeXKdlUY304zDwtYs?=
 =?us-ascii?Q?fM6auLBY1Kkw7CDalXy6zSQnaKjlrVZhghNOTuwe9EZ6jlGrlVj1ueNXdOtj?=
 =?us-ascii?Q?hS6omfS6dy92ju2/aST2DbMopLbytXDuKbvjZajYhOvdLB1xrbvpLcR7KShL?=
 =?us-ascii?Q?8T9S7AfkDyBfyQ07GyLpmopZYza2yiYpTuSCF9C/JuFJkx6rFMWoeP/23d//?=
 =?us-ascii?Q?QXG3rH8pcZ52mYn1Z8DCodPENmmW9V/roHNkyRcrOKLNnxSCe3TWpSCRUZLq?=
 =?us-ascii?Q?5w5u/a3MQRV8VG2taT55WwwdapsKrUv+LrFYGtfpaNb6vxXpMQF0aHYCVTGw?=
 =?us-ascii?Q?rb5OSTESw7PgMpdLRD5pK4HmiBmFiwq7qzxUmwbVvbZZvcGYOqDUrKYjxa/v?=
 =?us-ascii?Q?qMKrRgMWpApK8EUBLjn4E5NgR6VBUtaCcjd7W86m0oQ3uukID0g74Kqgp2Ai?=
 =?us-ascii?Q?6fdxi9aHw1dVmxOTFoZJLsqx6CNe4E6kyssyTAZuFZT8kyO+vTx8e+QuQkLs?=
 =?us-ascii?Q?kixs4QKro/+qvbjdWmZKDD0Au6AtOVAPctCjQ5qE/fmWFGKUj6E4/eUHCAIa?=
 =?us-ascii?Q?8Hcjggu0VVVsiRXE3MjJcusXRdYzMcEwvjey+Yk/7e08Q92eiEBGaCJtKzkx?=
 =?us-ascii?Q?Pt97d4iFJipTQPpQfmAenHhuSvLGyBGkv9JlNJ7hFaiYqquPyhsZFHhY3+a6?=
 =?us-ascii?Q?tNyx2xpbu7ErTCWSgRp4P/XeYINzFWvShsOq/kCks9u1brR/jPplRk5w6gx1?=
 =?us-ascii?Q?rnIt6iQ6sGFv/2YQ7fRHyvA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S089zs90sQxBzn3RvOskAYGCTLxJs14EKbPKiQqzFtyf1WkwR8kn6yd4DNBN?=
 =?us-ascii?Q?ArGZFGTSc3FH6AckCYhAkRi1TbI0a+KQ+J9SMcl0wGqaorXC7+zVsDPzxBG9?=
 =?us-ascii?Q?Dvo+0K0Mrbi0BhttTk6BmK5nPbuNhmkL19J9164oQJ1EmI0naPm/kALLckt+?=
 =?us-ascii?Q?+IlwnY2s2okez3NHAnbFLPPTY4s9GrGLADkSubh2+fD/t605FLatnDTOotVm?=
 =?us-ascii?Q?oQBVQzInFXi39YqqVIRcqEtirYHeGPVa3FbUfCf1AqP7Qrhw5dC1YUXmpgw+?=
 =?us-ascii?Q?GA4vfhelbXTjSJ9wNSj4ayj5fIFy9wsYHd1uvhdn/8QfiPUJDv4yU0+j0adR?=
 =?us-ascii?Q?n/AqnpwcccOj/t3tZNSxZsvHLjX0siNH3g9ypJXtY5ibMM+jFvZaksHgPYLy?=
 =?us-ascii?Q?63VnUCd8RqKk9foEWdM4ZY2YlgndJq+8OCGmy5XlHCHQ7KxuyQ9CpYk6WFtW?=
 =?us-ascii?Q?w01T6busz9Al8gTq6x7x96PI294on9ebzGtbwangM2Bm1s2aQQI/CpvwEcFO?=
 =?us-ascii?Q?BuXWCMxYzZoiuitwU/zjXJ1mM5rNclhobxdF/Kdy1COA2CUUwSNMpuzTUHJr?=
 =?us-ascii?Q?jFidFSRM0rvfTtoh41sfwyVj4DF9f1zAsJlnokQ9LGiwx8dqOAizpISiVKei?=
 =?us-ascii?Q?BgTnD9k63EirPMXi/nSeE520xDQt3uf7/gQ3y8VD+a5dzgyTr9t+V/sG3heK?=
 =?us-ascii?Q?t7629M+avFdASIpqtDqrU4kWOiJdlHX43qDzGp91sQ5zJgzGrEk1WkTArCn5?=
 =?us-ascii?Q?ex+9r+Zm0Od+KTHRKWzRTE8ECpcwnKZeP4SKroP6Bruq/IbltBtYJxtpD7vW?=
 =?us-ascii?Q?qSlXpCClNFN22flRxB//UDRXjc9x9L38478K5JGZDRBPJvppvKCGBZM9DX4G?=
 =?us-ascii?Q?PGncgG/vt2k8L+I2YBsf9FxVu7ZRDr8Y+F6pLXLR9qN0Yhz7TsKUusR0E3Cs?=
 =?us-ascii?Q?m46BT8/NRNFh1YCp6eb9lZYBicRBb+rp5cZ4PsbdPj7/vjR2TYiz+15Fmebo?=
 =?us-ascii?Q?qM0rJGCFTzJa9ytiaiRjjboBcHctfoONMtSodLAk6C85ay1NifneC5SwaIxp?=
 =?us-ascii?Q?mWo5knlq1LM4ZQx2yNpPXjqVIajTsT8YZqSrFWpCSUM8jFBXaiTkIDDuIwbB?=
 =?us-ascii?Q?pX66qZSzw/kIynINlNf9cwvp/V/RMmYc4dpc3iln+0oHPKZOZcrT6kvp4AQY?=
 =?us-ascii?Q?N3wFLbEj33lXsbZKyWGB/phYsq580q2fLS2EWGKFWazjcQ+H7PgPP9DnzJsL?=
 =?us-ascii?Q?yuxOub2SW9TZv0VafPct4hlkt/1GJvK/jKMxjVR8FuwNBz7dTf5g8ZvfNAQz?=
 =?us-ascii?Q?CV9BzIATxbQnOmoKyfoVQZ9KF+/bN+OPjyUulPQ0Q8/4WZmYyYi/URbntxMT?=
 =?us-ascii?Q?66QHx/2tcL9WBbk6ZTFmexfk1ZYErCOWRabo6T/ub81uQViYehllYV+8I+oz?=
 =?us-ascii?Q?g/bX51tCbTYy/VzOTxyast1Da13Otz0X98NUgTuq9rcvEbjVaf8wCwojQdPy?=
 =?us-ascii?Q?+WxASDlRV+cYzsfa+w/2uQLR3HqAKyFiHweusV6yMTmN7i9r9jDdklEMhbHC?=
 =?us-ascii?Q?D3v6QZchF+tyFpzLCNmALnK/of8a1W28UVGJ36zvSrugmxOPJKZQUL1Szz3p?=
 =?us-ascii?Q?MoDFEQgmmTp8wA0EViakM/ffXhmcjsnkWI+uul+fhEaPIPuEPbAeOIOhwXNm?=
 =?us-ascii?Q?5KgjhENGeVj74y3JjYCPAfvPgJ6CFjQbyeAR5djMzqFh1gWRcbyLIJe5GZwh?=
 =?us-ascii?Q?/sRBH62ypA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde502ce-9e86-475e-484a-08de69831323
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:34:41.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPblmqRLG29NKUpoMykXb2dl5rnWPCMBYDOM5/WDOPbgaz9SXDgq9BRAni8OglPjoKhsKpHe3+ax852cv63Jlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10832

On Wed, Feb 11, 2026 at 05:28:24PM +0800, Joy Zou wrote:
> Add documentation for the dma-channel-mask property in the fsl-edma
> binding. This property uses an inverted bit definition: bit value 0
> indicates the channel is available, while bit value 1 indicates
> unavailable.
>
> That was already used widely for i.MX8, i.MX9. Correcting the definition
> will break backward compatibility. This reversal only impacts the eDMA
> dts node and driver, and doesn't impact DMA consumer. Therefore,
> keep the inverted definition.
>
> Also add a note at the top of the binding to highlight this inverted
> definition to prevent confusion.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index fa4248e2f1b9cecd00f1535744bfe6d9ecdba613..f609038e35ae1836b89c5b4d8a095b15a882fb87 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -12,6 +12,9 @@ description: |
>    DMAMUX0 and DMAMUX1, specific DMA request source can only be multiplexed
>    by any channel of certain group, DMAMUX0 or DMAMUX1, but not both.
>
> +  This binding has an inverted dma-channel-mask definition compared to
> +  the common DMA binding for historical reasons.
> +
>  maintainers:
>    - Peng Fan <peng.fan@nxp.com>
>
> @@ -95,6 +98,12 @@ properties:
>        eDMA are implemented in big endian mode, otherwise in little mode.
>      type: boolean
>
> +  dma-channel-mask:
> +    description: |
> +      Bitmask of available DMA channels (inverted definition).
> +      Bit semantics: 0 means channel available, 1 means channel unavailable
> +    default: 0
> +
>  required:
>    - "#dma-cells"
>    - compatible
>
> --
> 2.37.1
>
