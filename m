Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D172B37C0E0
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 16:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770654241; cv=fail; b=DRsnkdwKsVOsCe03XR8g2vKLz4nx8AMcf5zFC0i1CaRd+1Ojb/W/4+wZdZscHwhzXjRsIROHhUq6gFq/sHWCUOZeVG4zvW1hkyZFn22delMTdRB2UPP9u3xtuXx6QLQBbDtIdxpHXO/3sBflYqGy8QjSfTTxKks/IjXkXJ8YVgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770654241; c=relaxed/simple;
	bh=i79ZagMX1qdBXtkP0x70cBhEAEFei0B74AUxhiVVYu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=heMwHIhJOwtUjZuKMgrrRIcUOeoQm5K3d/QCGEt0c3jdmm9ms72T5ylTrEDsc5E+cjukOmFVzJ+in1VWm9MtSMzfh3yOedHg+vnilfygOJUOmkGZMApFNar6+Z18LqnHt0d/JKIXZmfo37UvwXFOZlaNbQXBsVMaZEDmPtAzqgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O4GDlCtf; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O4GDlCtf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9SQbWQRpxoJSz04oWcOC1OtCd4wDT2zRUTsivSjFlJ0fVAmykY9sS7Tc9wfEkutL7DQCxQvb8NzN/Nf0f/Rw3vj/HslJQvR5syf24JgVs2LDmfYVeCHrSqeOupHz1B84/L8IVVda/XLt8FDP/xUsjJH8jg2gkEmmWh53M7QBLll06ixJa7Uc8+YmxGaYvIHUBMNuqR3udLCfZeem4mDc8pbF1lY/wo6X1dJAxkL7A9xCxCpmlBKRFC+Oc3GvTOlSouLPDzd+fiUjaoh4pjPbDvE8u4axD97fr7FhMaNJNo7wgGn9m2/l0mSzMGXLGGKmijWJs7aDP7CU5FlSaDJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5ns2roL4wkSp6NhFDGyINKg3X54CUSxK0/1WeuGou4=;
 b=Qroup/aszh3Ww+DpWeIO1TARHUUCq46V3Ui+Mj2p7vbsdvQMA5BQGaaECzF9xnE2ybLsvdlCA4rp9F1npRf+9XrtjjRw3z75wtez2hVGwR4z/BjwV3U6gPTiUR/PiMUUF2dVhMzboGAvPzG/rar/d5cjEQ4gr6M7KKlBRItQ9a80Bpyyex2o8QxSnnBtV2zXG9gUVkdhU+OvqJIjVa8ueog/dJJsuyvMNyZhcFV5C3zyDtk6mcc8DMz3L2boh5nzogWRt66GzOz3SZwX/OklTKsbP6bcHuDbYh24goavzIvlwRZ3ctNKQqSOVssukvuSRbHafkHF4Y9gvUpSlPEl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ns2roL4wkSp6NhFDGyINKg3X54CUSxK0/1WeuGou4=;
 b=O4GDlCtfgP2+F+YL5+o/pJI6YR4rmQZxrjcfDCrBpiPNnrZwcdwfzeg97+TsHlZyB86D8Pg536YtDm2kqNXVDzarrF79ajLClX9WSGxri1IvjUz4TcrOZRNdQCx9m9Oi5rK8NXNVNpP9pBR7OVT14pI1GCPtZzxmc3iygaClvi1udGeTz8eGAM6NEvQzp8g8XDZNAWBb5+xYSla8psGnBAEVKaw9zhl0yQ1cNxoA2nIDifFjfrfXApvMLIr41VLhxnPegDukRKoOj2CnSqnFA1WZrQHtHcaBj6D31bThtQwsiXu01XsL5O0KahZh+8VB13fUXPdif7CbUAgsWYuTsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9370.eurprd04.prod.outlook.com (2603:10a6:10:359::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 16:23:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 16:23:58 +0000
Date: Mon, 9 Feb 2026 11:23:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: sherry.sun@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx943: add pcie1 and pcie1-ep
 supports
Message-ID: <aYoKFr4Xmev6Z97F@lizhi-Precision-Tower-5810>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
 <20260209055745.1545129-3-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209055745.1545129-3-hongxing.zhu@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: ae850ff7-7892-451e-8fc4-08de67f7a064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|19092799006|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sd6GKyIBKtnBkGaJgrZxEjQYQD227eioEbeQgpOWIabP7puGX0oDE2M9wEXC?=
 =?us-ascii?Q?a1iy99fx5+0u394qFlQBDaxLcsEP3e7ed6ylf1zGsxmCmIX0Ui79cbsaR8NA?=
 =?us-ascii?Q?Bxhc+1tdnW/TMJdVP28NXbBEGECljldgd7o22Oi41UUx6vBwRy2rlD1Hv1Mh?=
 =?us-ascii?Q?7Xzqdq2g/YUiihE0A7Rv/BNE5ZBqKHbR1u+2r5gv1bbiTCceM3XF16A6g1D8?=
 =?us-ascii?Q?bFNDdxdCgCPdbC/8K0ggwy6mvSdWHIbuTB9mbezrnH5zGV0z9sXjs+wSNfxf?=
 =?us-ascii?Q?AjygZosKxRH6B8tta61NY+OS0r//q6ts6Aqc0NuCMgqUe7P1aCEUPkDAihFa?=
 =?us-ascii?Q?ImGgtkwravzUL1vRklZLDqG8US1vdwdVfrHBkK69Hct311H6EB1MIyS9nY8S?=
 =?us-ascii?Q?x/9cT9uFFBF/nhsqhtiOMjdv9KyaSRToNa6ipzDGbehY9uvvCyEzBvmFzZ4v?=
 =?us-ascii?Q?CEOVfazFKIOYSkXrbonP4dOgasiC6QBmm9/vS0HXpYL3cd09Cbr/mywOleCF?=
 =?us-ascii?Q?rC8vOEvo5BBzEaV52FvZChzhEjui5RJnnE5W11kQGhHz1NWbj5ZFByEtAAoF?=
 =?us-ascii?Q?GRE9To24legXVxlOocS23CLr6oz5FPSJHuSger9JbA+6cQzhUyc1E4sF0TYk?=
 =?us-ascii?Q?C+FLaNjRkYyCNtCUwghaOv8Ob0lpYyhtBw1MO9Fwk7fxS8FGwNvYu3KLPalQ?=
 =?us-ascii?Q?qqXw5UXnrHtmePYCLzb6LO9jT/kzNlESZpKTJidD/JmW6UswYGJ4OL61ps7L?=
 =?us-ascii?Q?ep2FVD6XPobHqUMXefFslDskxuA5Kz6h782RczWJUQJYWxNy5l6jHSDxZY7z?=
 =?us-ascii?Q?cHmWb9i5IURdskBPHnvC+9wMtBut1vGj6r5u9YsodcGfLz5eqereR0AetoJx?=
 =?us-ascii?Q?h3e1JjTdlAg2/2ZgmxxwU3L2S89x2dLgkCk6P/VOQFAY8JKAfEZGraeQC+Eq?=
 =?us-ascii?Q?vxnNgpnu78BS3Z60JacgI0zMM/6Bf8i5UvjPsPwI3xd7zX2cMzBvbMFTbaZa?=
 =?us-ascii?Q?znlYKtbt5fyh3ZTDTslDkjnNp/if6MiGmvTsHOOaBTQqu6yAl+McP1mY7/Ww?=
 =?us-ascii?Q?UuXSkzz2GgPg/sJlFG7FnkfXDYb/DTNBtNgt1zyW6yOWL5644KwKKtrBx+0b?=
 =?us-ascii?Q?jZIRdv36pZ23bsdDrMHRvuVEzOqWE3OG94yHYiiU1mb3AMCYyINSPsnQtTlH?=
 =?us-ascii?Q?46AwF4Y8LlxD5iCn5Pzdp23ZPyyAey+RVXlaYJji44rLnGgbDC2H34YDGcu5?=
 =?us-ascii?Q?F9Fcod0SEJwy09E4gWBVFsRbM62BJraXsY/spn9/EvOTcEJtbVFpV5KJsjDI?=
 =?us-ascii?Q?Xboofcty2yDUiMg+5p8le8vAl8HMuf5UsMHW3OGOmCuORu9/bn2AhBBWGY3S?=
 =?us-ascii?Q?qkvH1hNUYLfktUO1xIZeUZwChdLBwKeo7X1rL2aRIfTCSkrKBUZkOKb3OFFw?=
 =?us-ascii?Q?R9EA0gXiskbE4oOgBce7jnXlZ8FLjQLHCg6zcg57itTq1HY0wmN+bq4pBhwc?=
 =?us-ascii?Q?xpQaasTOdsE7FKQsw+sNcjK6FrP5jlQLqhml/IoU6voR9Kjb41zUuXlxXLJv?=
 =?us-ascii?Q?wT0Sq82lqmXCzyexVnTRMjAxJ9EHC5UACdl6AF12XXfcWII6u5KwK8stV4pY?=
 =?us-ascii?Q?SP8fS3g3ilKc68tHk0tSs0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(19092799006)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xlWWLwHWgac+PDsGWAjLH8phjfSJqw5T9sD9NW0TYRrKv+Y7uyDLkLG9WmFM?=
 =?us-ascii?Q?MwFs+xjlGGYJ+j9TH87a0WaCqHAFNkBRwc6ao5EwwaWPKI5A8LsR4D7A4XE1?=
 =?us-ascii?Q?2n9V9H98wy88IRDfkdXVz7wdU8fxyQqWn4EGr3UtVRpQ6XS1Wi7PMgQVZZa2?=
 =?us-ascii?Q?Z10YUgkoWqJM80XcHAGPC/yPoTgNgjFzV9lfS2YUdLeSWKoLid2d6X0dzHcr?=
 =?us-ascii?Q?QSUeLK+EDQsvSmzXE6Ks7TKv3EitJ5bNa/7SNa5J/3eS6S5htMuMh+pLOTIx?=
 =?us-ascii?Q?zAqqcXbzFsFVHmD0cWebeI9bI4dXlZWxqPijmC6PguUCy4pRW3dFoITGezXx?=
 =?us-ascii?Q?GgpoK4oMj+Qh5sdEhCvNnuIOt2GgmQ5YES9HkhqstAayALbiVLtvzmXSEuwW?=
 =?us-ascii?Q?UkH+Sbn5T9/f7D9EwNVspSFZv+wp8vZfPGRp4E1JtWyAnIuwS2U4DZZqQ7mA?=
 =?us-ascii?Q?qADdSwVSYm6xlbjP/Y3u2PR4AhjSfkbL/0bxIlgrA6U7vZLMlIzZMd4xQrS8?=
 =?us-ascii?Q?Kcs72R/XHgQRIDAr9uYDi3BgBRw+eMYt5yWCwzfpaidiA0TrZ9bKZ7c6M9/8?=
 =?us-ascii?Q?cfmFGTUHNYcp1JWe1txonlDAbkP/Aw/E7QlfcNtSjqqh1BpqN2oBpuZU0dPD?=
 =?us-ascii?Q?lLl3b+N2PCGLCgmyBYUvmErrwE2HCat9d0EJrmWaaA9pcXpSUhjDCmXCXcyO?=
 =?us-ascii?Q?/1NBLIlNvYnci3DubCZt0aeJp1I+52wS8I/DNUUJAutApnPa10wIftierq1d?=
 =?us-ascii?Q?NnZ5xR4p1kQ9eRqNJJxJIHv5laBW1zbvG3KjjepdiJpIupvYpycnKQ/IVn5U?=
 =?us-ascii?Q?yQei4r9D6KFsTYRWHh++wat0SNtutrKc0CdOKVy/x2BY633iLBdQmxn4IwjN?=
 =?us-ascii?Q?R+I4zg045w0vIFlB36FnpzNKxOj6YggNb7bVz3qVomlAmLzF74CVkc3d4YDV?=
 =?us-ascii?Q?FEUzt70BiCCXE+ucHSKZejU8XYifDlEWOLi9vVqbj1BZ/oqYq9sSr9VS1QDu?=
 =?us-ascii?Q?ahq/JJkjt9Jc6cuYbz85aRIzzG4skYvWSaHrHhON6KF4jWFmAbP97x8sfaa6?=
 =?us-ascii?Q?m0L4dR7p0Fm3aGcvR210aqpJXBaf3HyAEYOH2eY9WIyfX6ynm0o9TZmT0d2g?=
 =?us-ascii?Q?WJ+hW7WVP24UnMO6oP1SK8KTL8B709oRRotlceTWtPvzZzR4QKBzOPhfBZIh?=
 =?us-ascii?Q?RBPbb/bWLWt5S3v+3iszxcFV/fftj6pzR/lEwpD/KiSdKOiQwCKqv8uggnVs?=
 =?us-ascii?Q?S5kTLBJM8VaIhwvG5fWkpjoUZDXH8ltF39jgrmCk+g97HNXqSH/f/Jt9Q3Fl?=
 =?us-ascii?Q?E54LtP470BDCbzIOxju4XGmhtAm2S0lZHC5Q5Hehl3cNTnKVQ2mfNtglZ5li?=
 =?us-ascii?Q?pxtjz9zgWEiuBfdre3C9OVuy/82zwaMEtxP6rLn2c1fCVBThjjM2kjm12bCS?=
 =?us-ascii?Q?Dqfh/QIo2hIAhN0l9ZbyjxhSyQcwAbvYgpy3Y5uPOA05g9/0klnG4UJIYeMz?=
 =?us-ascii?Q?tLtDi8d9Cr7Cyq8tHYhQCKQUxxQvoatGw5vtmExEY0cPpvW5edOT0ahanYjX?=
 =?us-ascii?Q?J+ymbYSCPqLF+yOFOq/XM88o6Ht0m0+c07VvnbxoGh6TAD/+TvOWShq/T43K?=
 =?us-ascii?Q?QGE6BgHcB9hGbfHhgDt0TlFxICkSpPDtscAZbkxN1O/M+IskBFSVBI9jNOA4?=
 =?us-ascii?Q?Jq4pMwF2g19+AEQeP6VEiDWqw2ezR7WHxZAisOkDqlmq5jG+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae850ff7-7892-451e-8fc4-08de67f7a064
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:23:58.0476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72L8TL6btn+nJWsmI10fg/lOlIXK1uQGKM4BEFOZd5s6mT8glV8sa0NS3dxJMNTVulGEzoIBH33E7qJyGUYCHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9370

On Mon, Feb 09, 2026 at 01:57:44PM +0800, Richard Zhu wrote:
> Add pcie1 and pcie1-ep supports.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx943.dtsi | 76 +++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index 45b8da758e877..0df9d24cf985d 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -145,4 +145,80 @@ l3_cache: l3-cache {
>  			cache-unified;
>  		};
>  	};
> +
> +	soc {
> +		pcie1: pcie@4c380000 {
> +			compatible = "fsl,imx95-pcie";
> +			reg = <0 0x4c380000 0 0x10000>,
> +			      <8 0x80100000 0 0xfe00000>,
> +			      <0 0x4c3e0000 0 0x10000>,
> +			      <0 0x4c3c0000 0 0x4000>;
> +			reg-names = "dbi", "config", "atu", "app";
> +			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
> +				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			linux,pci-domain = <3>;
> +			msi-map = <0x0 &its 0x98 0x1>,
> +				  <0x100 &its 0x99 0x7>;
> +			msi-map-mask = <0x1ff>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			num-viewport = <8>;
> +			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi", "pme", "intr";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &gic 0 0 GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &gic 0 0 GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &gic 0 0 GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
> +			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +					 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
> +			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
> +			assigned-clock-parents = <0>, <0>,
> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			fsl,max-link-speed = <3>;
> +			status = "disabled";
> +		};
> +
> +		pcie1_ep: pcie-ep@4c380000 {
> +			compatible = "fsl,imx95-pcie-ep";
> +			reg = <0 0x4c380000 0 0x10000>,
> +			      <0 0x4c3e0000 0 0x1000>,
> +			      <0 0x4c3a0000 0 0x1000>,
> +			      <0 0x4c3c0000 0 0x4000>,
> +			      <0 0x4c3f0000 0 0x10000>,
> +			      <0xa 0 1 0>;
> +			reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
> +			num-lanes = <1>;
> +			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dma";
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +					 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
> +			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
> +			assigned-clock-parents = <0>, <0>,
> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +			msi-map = <0x0 &its 0x98 0x1>;
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			status = "disabled";
> +		};
> +	};
>  };
> --
> 2.37.1
>
