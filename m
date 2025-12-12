Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF441A9F87
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765558965; cv=fail; b=Evccpp+1pxDOKSRY1/P7e3p012J+ZQMh8zT/C55SARBA8Qb+/56PRMk9PajU/mP/Yj8F7UKjFuxURY6/EXrLehWeSi7OXazH4G31klKL8Qx8Je81X9GEUFF9fwXK/xaSW9znI5gm4kn2H7eWASuYybSSthhi6EbOI2SYsgdG53c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765558965; c=relaxed/simple;
	bh=MuooLTn8zzPwcADm+00wrh7jWaMEI6zY8YqAT27vmew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s4pChZiL5lJkDZucyOKUAxF+x8pb8bmGNm3IRXlHHGADeUuE9S5omAbhD2cJT+nuEEw3ipHzLeQ7ZrxXMqxNSMnNSlzevziGExfizdksuXcxvl8oGde6nqUmUwTbF+uc6YT9P3yOcd1eanl9suAryPI87qVo43o65vtt9bLWzyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VFQwqZPK; arc=fail smtp.client-ip=40.107.130.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VFQwqZPK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKddFzpMrfJRHC04xRN0Fsj6+4im5d343AmcyRCYdMy8KQemGr7U5su1j5cTr/ub8Ik798qG05MIANncT96NoLW/sxGJZVMVeD6eY3cVYk/JqyU5Plgj0g9ZhmxyZCS/oJg5UEaNbv0FHUaCXCsrj125PksBHvWLpqQFpZCzy6DY9989DcTRaGOtR7FX3WAhaHzB0O603qBKrWWXTFp1i4dphgIctR9zTXmACjdhLv7/eQU0PmVem/NDdvZ9lnDk33+OjNhU7+UpWKqM/nh9fY5pHPZFoNzexOvsY10lU0hrrME1MKVYhu3Q00qt3UB1CjAvcNWRyFsa+RAuP4o30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AD4dtSyAvSccH7osZ7Omn96vfugPTFvnyhocrQ37bM=;
 b=PL713b5QZPc9kRSAsW7Z8lpx42VKMk6WQNpFVGw/7jgbyninvQRrHy2Ttip8Ain0XT/ecO9iID+XjCW5E6Dhp3WvTzJIbFwKW1e9ls+qeNAEoy+zyd78cGMkQlakWIL1Lh4q853xBF6S175Ud/Qr/ML4whQ3+lRxcWhnPz71UksRzTuBZnTmIVucvnLkc1xMeBmgpX5zbTQkDTHOuFAoq/pjG8TR0EtGr6+OqDJmSsz5JrxHggOr1x/04g2Ae7pxH2tmU2Sh8y2EMTKACjKyTKmCghCLENG1Pmlp9BMzpeUm4IYj/6+QbbP5N1ZcrfOJL8+cnjAODFMwBnQXQSY/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AD4dtSyAvSccH7osZ7Omn96vfugPTFvnyhocrQ37bM=;
 b=VFQwqZPKRSRNe4qDvAU+A7z247cvhCkdz9VyBLK0MzCohXO3+womlsTtRRf1H1l/pyygfSKuB/WLYHyxBSSrf2Yx1aSjL4Quslu6SSjrWM/XJWCzk25pTVs1ZF9Z6WnPXgoV3MK9vFL+Sj9DQwmV70rpkAxQ6oxuYqjeUK4HDQBVSccGfjB9JQoFGe2Z7k7AInhnHpyBgsDsvbAOzgyFuCGDzHheytyRYXaozo4M3XANrzQuQJGUIfUpYb9F3oIB9etHK9Px9o78U42O2pMLocH2oQGhDICXoi/UyWD9GzpVY91+GNWLHnPQTx52w8+ya/y/WRJkqKKYRYnrTJbh2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 17:02:40 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 17:02:40 +0000
Date: Fri, 12 Dec 2025 12:02:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document
 address-cells
Message-ID: <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b589b8-5cf1-4e24-fa5d-08de39a04254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|19092799006|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AvavR4GqXy485eTh8mNKgQFFWimphvkmS9g84fMfR2n8MkebnwNOdH1QMbI3?=
 =?us-ascii?Q?kTOnuJdTUn8q7bSR+6NgySRHa1qxKkQhpE5shKKPBhUOqrv4vifal42UFa/s?=
 =?us-ascii?Q?KRqXxcZqCaGZnAJ3OYzSiX2gXd4ZM8BOxZNIH2tVmaLROk8j+1DpwKppoM5L?=
 =?us-ascii?Q?wgYXt7rx5i+2XcDzeJAj/et2spRezgVcfz6ZfRpMfmDCqNcKgleQmPmx5fPH?=
 =?us-ascii?Q?T+Fq66s8sUvgrf3ug77q6ot/UUqamFYmwt5YRIG0Dgh11BOf22Z9XvVaAJup?=
 =?us-ascii?Q?ZJFv3KG4DqYHQUWXB22zghTwssksQRvnuoMmvDlJVmPeXJWAmhokL+tJzy9B?=
 =?us-ascii?Q?PEUZh2tIP2sQ/mOjTXE4ANMafsV9xTv8rOYCOr2KSS9hxVuWLuG0goDlRmR0?=
 =?us-ascii?Q?Do1BykU7cQaHW61i2YJ1moC2ZHqteZTCn5d4M52qfVKIQqrg7eUJYlhkR8pw?=
 =?us-ascii?Q?tAA+3a+HpEUpQMrck2QWp03cx/Dg82QV9NWj3zmRnNkKmlLzdVzdLHQTTcLY?=
 =?us-ascii?Q?1B5V8uzItfGn7AVjyeTr6i8mNGWl2xPB9L55QgmO5AVT7dNI2We1JAL32GmF?=
 =?us-ascii?Q?9TSQPIP1550pHzGkZbVZjJSuIwzdZYhJ3E7mdFvC8CKkLEi68cWhIAbz7KlX?=
 =?us-ascii?Q?QEgjMuYcSWa2T0afPW8h1d6N7tS3RUNVD90g7qTU4P9Ju5AH3xuH/WUaB0qa?=
 =?us-ascii?Q?AFuCO/l314Q/wwI3EEXJRYf1YQVsDgRDbz3pZEqyR3ZlAgShoqYSW3c44tRC?=
 =?us-ascii?Q?LLHLjxuWomZ+pC/xQv8BHXGUJDH+ba5TWAZe5XLzP0MGXt1fxAsVBbCIQr4o?=
 =?us-ascii?Q?rb9Yx6XmGf4aEyVTSRJ5TGkMcF8tmqhe6u/RxLS2xiGZfp5r7kx8szAhu2lJ?=
 =?us-ascii?Q?ngONuUWhnsnhXDzGQFzCmunpLoRjzvn+nfH0magFhBFMRXzV6k7okkKBKR68?=
 =?us-ascii?Q?YbhdOBmuQA67uXk1dDAJJ+Vm8GHOmZtpTdIVl3DfjFAi+EyGUqyLJh6me9QF?=
 =?us-ascii?Q?Gc3vxkV6+QGrBxnTEwq6Qcst0XP/Cscz4RyNgxsJgw2w+DTZ5qTU0joH16oH?=
 =?us-ascii?Q?9onvz2yes0VXyfs5OkGQr21YF0/d/DhkeuZJk5OpfymLv4XSU5q8PRT7UQvl?=
 =?us-ascii?Q?ECk3sW87fng4CDboWZZsOSOdb9zTM9o1zukgnxCst1VbyKYUVV3EVmhDK/f4?=
 =?us-ascii?Q?yk1mCno6A03PNnWsDE+X1IihAlZuKRQJIrsh4Mh8DJUMEOF06IcfpbpcdyQP?=
 =?us-ascii?Q?0J2o6YmzSQwYgwY3MsodUmoR8SZHw7kBTX9i/X6SMFwHXa/0R4bBkATS9esL?=
 =?us-ascii?Q?82FGhQDUJVZwerl0c3TWfkJ9C21wYhkKNKKQUjFcJO7V1Jb2jz1G3HlqAqZy?=
 =?us-ascii?Q?vHzW/pPVCJlFUSSvq5iwPNVAX5Imd6+7vGg4qAxjvgmZDzrMIui57LNmCcUr?=
 =?us-ascii?Q?AdAPXqb8o/PyEJj76oQ1zIFduFRe+edlGnBwFEkQcLHfLqMX+vE/04BE89jk?=
 =?us-ascii?Q?6tQaYdLqr8NgjKMqPuu3hQR0EdwFoaX4SQLo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(19092799006)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7uManslrmqXGIykDnJ+qksl1YIM03Co3BIJJrpTtx4K/9fSQh8G1ygwgqoTI?=
 =?us-ascii?Q?KpyzAqSl39vzDfWs82RiHN/DsW3SjN+9GcDSOcmcWdLOQGCax4mQVN8Ahljs?=
 =?us-ascii?Q?/zzMZijQczZf1ecoVkXMEe0P3tgJFcwqqFp4htGrtEmQ+f8EtAqWT9zF23HI?=
 =?us-ascii?Q?PmUNZFxPZ9h0ePCrZy7/H+GHhqtflZMvt4ibxGG4sPInhVaqkIuWJ3yb8DBl?=
 =?us-ascii?Q?ohmnAm5MNXGcF27CqNCHfJ3Wv5LyIWm1seDoK26I6R3sNieeJ2A/hEFf7f+F?=
 =?us-ascii?Q?f/uNL/yWfGouR3g6rI5buGvWnpG6bIerrKepS/numg2mVdyGtq+Mzfe7JFgR?=
 =?us-ascii?Q?uhpU0OOrHKfKFOKyUiirAEJAMZ2xUjA+5tLxgGt0FnMweEeUQMnyAY71KO//?=
 =?us-ascii?Q?Z9tfc4GxXX8HNI8slpAg8eokV4iFLMZmHQoEbpPvr55ubkfRFRNmwSV8je+T?=
 =?us-ascii?Q?ryJNZR5/8SufnwnZFHjil+ibBRmGtj6WdjlN8Te6y0s+6sFCEBGfQIs3mXCE?=
 =?us-ascii?Q?tmtG0MMaRAuMLZxMB4LmrMLTxMq8S+2iWmFtoxI9/x5QRDxTJWmSscVb+nd0?=
 =?us-ascii?Q?b5QIyabwt+nB3jqHYFM2jRHsFXLjurZp7bwuYwR0qrxCzk6ISlmugBGwa98P?=
 =?us-ascii?Q?aTW9NiOwVEx2JhT7iDMCyG9RrSmwBz+wZOzwzKybkt5Qlmhcyx3QdGKpa0P4?=
 =?us-ascii?Q?s3ZFowmy40tHlMk8AWPqe95JUS7h2uDNEO+bL1H05IZGHfCuIQwZVhLZhcgP?=
 =?us-ascii?Q?3v90Zc1MyKQwyfL84+NPGFrI1NxOem6qMey9O6vHqsZu7G6o6UpoAMTk/VQa?=
 =?us-ascii?Q?5Ic1YfHVO+FWM5c5EJQXB0GH1xpYdsrEd1+MSXMO57UFikrfbWzvT9iNnwDs?=
 =?us-ascii?Q?8hAAK3IKFDq9gk29MjqMAl9y2J7QnBZ+8QKjuC7d4H4N3w0MiikNzd41J2Ue?=
 =?us-ascii?Q?5XrBTvJauexM3e1W+eJCKdLwx6HwHlNjYZw+Try7WwJ5Vs6QivytB3Sjjp5E?=
 =?us-ascii?Q?4B6KqpSE6sMopJOWrzi+mKO9PmCh/OGVaQhyVkNYWWJgNXBeHLNZ89kQGHoh?=
 =?us-ascii?Q?pGTG/Ju7XuC8W+Vq3hDVl7Xrrog9s1w9wwJBGyZ2ftTv/JXIsUbkBM8arinH?=
 =?us-ascii?Q?LPHFXp/NTIHYNSqzxhTNkczQnYewQTVuKIh4zgzbQPIqKD98xSSZbZRdJjsd?=
 =?us-ascii?Q?+LVBRqw9jz4HV7dxBGWaMZaLrpeHCX7140DATzw9TuKpb1oG9CjXOd+DZIFc?=
 =?us-ascii?Q?hb8Vrqh2bL+efGISjtrY20imuXJ4pQuvjMTQplfxQVbJjNJLSkIL0V1mA3N5?=
 =?us-ascii?Q?hxZT7YMrUWyDVzh5b2oQyIy8GH1dik0afFYilAO9RTutBPnTVOFX5eAn0mrs?=
 =?us-ascii?Q?WO1DqlTVeUo3omLObKZt3BsKfwDqhojfnckpEHPoKwsvxvn764t4Vx97UqU5?=
 =?us-ascii?Q?D6Ss1Npm7dRoXPF2ks0QNLgxIi7MI9GqBgUxSyIdCdIa+fGtOmuA2RDi0jmA?=
 =?us-ascii?Q?Jb8ty9LeBbAJ4hgOAnJCazcyImumFPCUMfSxs0Fwc/Linjihpr4XLknHodqM?=
 =?us-ascii?Q?x0ulu/k8KmRZMoBEiqs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b589b8-5cf1-4e24-fa5d-08de39a04254
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 17:02:40.6378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nh2lEjtTklF6P8iB7J+X/RuS5dfU4FO2bxS6dzpmKpEnjqyTJMx6LvlDDP1tj7hHtHTzP2R/a03+lQBXSxNDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811

On Fri, Dec 12, 2025 at 09:58:59AM +0100, Alexander Stein wrote:
> The GPC power controller is an interrupt controllers and can be referenced
> in interrupt-map properties, e.g. PCIe controller, thus the node should
> have address-cells property.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Strange, there are not #address-cells property for gic if there are not
ITS node. gic is widely used.

Does gic node also missed #address-cells?

Frank

> ---
>  Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> index 9de3fe73c1eb6..d49a5130b87c7 100644
> --- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> @@ -38,6 +38,9 @@ properties:
>    reg:
>      maxItems: 1
>
> +  "#address-cells":
> +    const: 0
> +
>    interrupts:
>      maxItems: 1
>
> --
> 2.43.0
>
