Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2062.outbound.protection.outlook.com [40.107.249.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3341121B1A7
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734709507; cv=fail; b=WVkDf8ga6LOIc9nPqt7/fVDt9zS378oNCA29DRVKnZ1MjtpJTN/Xq8iBZwsHxjUEiRXjjCvxD6cRD4poGfLXnZsLP+tNtXG6UQL2rIV5rCiMMgXa6gRUf8/+67PzG3pK4X0R/lXVIFi0qZXahayOqXYpEf67/f38A2LxPBA/xK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734709507; c=relaxed/simple;
	bh=jxLYPZcaJ7J6y7tIgyk6kR3lM+tAC1Vdyzec8wVpgqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hW2HkKPI5M972UKOYDl921nedg4IDGYdORtpcfcN0PTPv3EW67NNgCqfQ88ize5+vNFkil7mvZayYrW/O28uNzQECL3pThu8GHRHmUsHgxZBQKaCeRqWP4tvX2iFCv7zwm0TC+E3YiKool5ZrGLgcVOOGrpA49gc5edAK/u7mFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nOlzcccl; arc=fail smtp.client-ip=40.107.249.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nOlzcccl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/ubVU0FF1zwAwcfWeOCO0M7UnX8kAY8lw0HSqH0LB+I0VSiNcRZQaMxJSW7g8T5CbOOrjcKTvYsPOfCejWQQ6u0aInOnKpvgJ9v/UC2ZWD5RoY/dMR3tozHwwqvJOhQM4qvODsHIExbrE7C0+HaLJQTh4pAGrTxqonYeK89LHfkeXYWfnVMtamXm9burbx8frsIbnfiihxtpBSdpX+sXmNbplU5/A3cBJk419FAOK82fLi73BLU7hZF7H873lHMycqlNIljAsa9o+6+5vb3bKWPEuxSb5F3aSDwsfCRkGy/ClLmvAKj0M9uZrWguXriyy6Lpjl+2w7oteuGn4czTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czxjzRHvyyJMmZjDwZGHQzIxSH1FE4F1OHXGHeGGiy0=;
 b=NJt5+Rwk6GaNTLq9T4ufVPKwOIGVR2Uw/qZKz2eJR8OXaGqBT9is4jS992r862ThNgjvg0ynBgXvWiwac7QY0SBCEKfycB2yYNWctrOQa5d73ULwc9JI5/xbsFVDwa/6opmcW5o9wgkwk3glAOdwkY9D85d3fKzFPb/m7jaLmU4hxATKGIVwiG7ZQBDmYGtG7S3kEMWYoIcIXku0Z/JnLh7VKLjnxiFu4Uf/UIsMwincyWz0I11aMkv5oDKP43pQ270kJBOw5Rbo6zSKgdmmdBNEXiYcr+5PaCn6Dho31xW/7HY6DBT1al6KNN+79v2C/uYdg2YV5kSEK06kJb40lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czxjzRHvyyJMmZjDwZGHQzIxSH1FE4F1OHXGHeGGiy0=;
 b=nOlzcccl7ogrBYedP4kp3Pgm+2FrcUDKcOkIEFGbTo57hmkCMbXo+V+S2scm7KKE2kWCE5/QGE6bhBEy9EKRbwlcMdHNvRu7nflnDsGiJkaNz8enWIdTJVTW+LWXehC9Qdbu3CQPGReoPtfzW/kFDMzrzFGCAUZAM9GFYLLhLP1yJyLGLlAnQ3bRkt8/nfhan9CqLvN7tHHNrLXQvp7J9tDHclob/D1GDVm/S9mVhOjuKuiOoUta0O8/1LwRQsvRTKsgTZTaDFuZu7KB4l8z9bC3XSXX1gpe3+oyz7/CjkGiz55UoBgccjLGdk6zKntcMDt1jfiOLn6mYB+KEQJqtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 15:45:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 15:45:00 +0000
Date: Fri, 20 Dec 2024 10:44:50 -0500
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
Subject: Re: [PATCH v4 1/4] arm64: dts: s32g: add 'I2C' common board support
Message-ID: <Z2WQ8j2kIQ462dxX@lizhi-Precision-Tower-5810>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
 <20241220123916.1452582-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220123916.1452582-2-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: BY5PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e545f60-31c1-4e83-9787-08dd210d434a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8cDF498e+ufOcywk+ltEu3xN3mT1IHIbS1Zn8Ah1XLhEms2GI9GUyuzOsyPO?=
 =?us-ascii?Q?g7EJEym/uR9YvimJy78inok/n56Q+Ya8092Wa9pUKNOaHG9MbE/fnV8C4h7H?=
 =?us-ascii?Q?GyR2vYTfjmduTfCa0/ZJjGmBpm841DhP6fMKGj8M/NTLYxYLwhysDBcGwiv4?=
 =?us-ascii?Q?MBiVcWC/DuDY9CehXeKduP5H2XMBEVXvbstj3htTCSR7vsm/ZhH6nMLOU4eE?=
 =?us-ascii?Q?XF+082I0b7+EQ3QbeTg92S9Tl7A/hvLJL9SFa+6DeB0r0uNko4O61uFiLunN?=
 =?us-ascii?Q?ahYCaId3X5OC0XaBeqr62W9vP313kvMY6ZJEmlBEjPufWV+auEXjZdciySm2?=
 =?us-ascii?Q?PA0E+VVpwl0JQNiocUxdN2lLBS0So5AwrZmhS1644cjhAJhLzvnhOUyJJ2z+?=
 =?us-ascii?Q?6p3f74l+5F3QC4Kdg9lAcW6ilfjum9YPIpRIS+3GGT76Kgi4pnPq6AU33EgN?=
 =?us-ascii?Q?LvAeehxTa2io2PbmM8qSLo4Gqd6XYreD9wUF4uC+bhhVKard/AZV26f1jfBS?=
 =?us-ascii?Q?C2U71x9wpw9RUzeNWkABSwNvMtA2AOc3wtZdSmHhHMPq6t0fXiycIZvxHXU1?=
 =?us-ascii?Q?zBLZHSDhP9V07UBrRbZSiQ5pH4gSp1bVwYDW+1/s9W8YQI3gpX4Kx/ZDlBN6?=
 =?us-ascii?Q?OGewdp/VoV0QgGNE/aG2Xx6cI90tpiXjgCwd/vOrjXeUWXcraFXlyLoVTQhF?=
 =?us-ascii?Q?Xm5vyakY6HylJjbMbqIAyBJSSJNIFJyYwkTAgVr0TvraNMcvud5BsN+5ZX+/?=
 =?us-ascii?Q?gYd7Igy381pL1zdKWua6STLNJ80pMPIP4vjRB0DAwG4DkyoG4eKJfKXRv0Ta?=
 =?us-ascii?Q?Lr52n8rsH3ZUtwQfL6dkGAcpizU28d4Fv/wtVSR0nFrq55XS4NZMgePCgdHv?=
 =?us-ascii?Q?QU/pWjQ7X54QHO3R1a5e+ewiQ7FybYcpDTCKLj7eHWDeNpTnqlGbhU+J/5Ql?=
 =?us-ascii?Q?ivdqBvd16WjMy27PUGLukVxvTGuNjkmXCTgozGp0Nuipg2NcaLA3b6jIpGBp?=
 =?us-ascii?Q?1iFDIhAmpusTc7cqVsSy/qs0gTmsnDPQFCQyhiLBSptu2YgKlZeFIKwuA3oP?=
 =?us-ascii?Q?GnoX4K9uBKQFVOfAcrkJ0UmEIpVT3WejxTgZ238ZjDkFZYXSUnajJlbzUdbp?=
 =?us-ascii?Q?Egdu9QjNbmr+30VzMb4CsMbn/3LOkDfqLouFkwpDNCEaptR9ScoqV2va5/XK?=
 =?us-ascii?Q?WmUaxzq5pmR0j+nc87y1r5046E4+VNnkDOL8Ctf0nnntERbrQpYU7+qlqijU?=
 =?us-ascii?Q?Oml5Rvbh7mzvjx95/6hXm9723ZUeo62/7U7oMxo/lrIcH+9rN9WIUfe5mkyg?=
 =?us-ascii?Q?aHjmrT+pq1wicgY/BWu59SljADSU6XGG25OqR5reE6s+g6qMpcqn5BiONkyf?=
 =?us-ascii?Q?Tl8S/1k736Q/AEIBuE3Jqb+z/XhXra/82lhUq2owcgZ0fSwE+gviSuQldp0t?=
 =?us-ascii?Q?IBiLF67QCFJVrQ8dJpxOAXjEt8ZajOtK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IFDX4ACgKfGKvVonsOLlGaJkkkrLYEAB1J/Rl9F+iYG/2M7xzJq5ZqbkpYRI?=
 =?us-ascii?Q?wUjoyr9wrHRREG8p7NemR5TrLoe9jrYthtR1hDhgNIqnIomWlnQtUDUVqCJh?=
 =?us-ascii?Q?hcFuJaye9fHFrfUlRW1KfRjDBRaL5PmMBtogFBX2TqdL+YgUeD9jy5HVu5Y0?=
 =?us-ascii?Q?UGhu2hMDKmEh5PFDUVlAAuYX0XSn6RkJxYjBDjCq+nkbdA0QwkYRZkY/nRCI?=
 =?us-ascii?Q?m+BF9ooAJP6ApeWpbua7gY0Bh1EGphPXba875rolQJ71nL5qBPFSV03fq66i?=
 =?us-ascii?Q?jytYO3px6uZuHTxBCk5NimGQKuRFfTrk4NksTW+kVC4ZKSKf92uO1iARX2+a?=
 =?us-ascii?Q?a480Dg8I95r8fItimpoTQfMkDXqyJZDB7jLMbDw3FZCo8sMjFuK6Rn6wy6iW?=
 =?us-ascii?Q?UnsuK5edpRSyr9PiFSOE1k5SFxfC1tKmU3OZhLfcmSr58G0ukVn/1+yIQCgJ?=
 =?us-ascii?Q?1a8Xy2DDJZtUKy0OH7ClriyX+ETYl7/KoagO6Lc2kiqbuY4pUL/MtJB7nbh4?=
 =?us-ascii?Q?oD0sbOQ8UNu3fNTwzfhKtRGzM+dIMOKzLqE26KoB5pqZ7aRyB2hpRJxafy1d?=
 =?us-ascii?Q?WG3hO0dm7MFcIY924JdaQce3F3z58hgJhARBdfznToK8uE1hHQSAbI2hNjPg?=
 =?us-ascii?Q?yP+hST4wvhhcPIjJDREcMdGcoKkfJq/Kn4cFQRAs6tcJBDEMYjWmwKPCim6D?=
 =?us-ascii?Q?xCFeSL+BS7HqPs0GxkOO10BSBcnA+qgW7cZbKGycnMLb0zYgSYEZNxa35Kho?=
 =?us-ascii?Q?9CG7T9Tm6qBlYhnXR22aYS/FAr1d/osSE2/2U/AlyySnv+sx8/PEqDZZOzHS?=
 =?us-ascii?Q?dBrqO8CVQFz0/yleS89iae6qN0kyBJcw5UjpzTee9jiuKlTxRfoHYa6sMIhW?=
 =?us-ascii?Q?/ww3deQm+g/6H2FMa06Gb13V09VuBWWYx/ntYXzbWFjCr9kH/ceDSJHH7CLU?=
 =?us-ascii?Q?apvvhnW5zHsTJyBJLqSIuSvYwlSSb+7bQuCUD2Np3Cm4bdD6krAMNSvMFgr0?=
 =?us-ascii?Q?GB58IsPQBSRpnxtkSdW8dcFpkMYATof+U9Hr/uGrkkpqonnjN2Xn/ESUrwr8?=
 =?us-ascii?Q?VakAeM2RSgEzAcw/9JMhQ1j3T5nghx/vzeThqGyRcaE0GofbrwI1cxbsi0Gg?=
 =?us-ascii?Q?0DpzKz/ZKPEufrhpAbscJME/uhras2xo4CJZ+ycu822I643MZ/D4+BV94Div?=
 =?us-ascii?Q?KEUk0arkwuw1R+SDB/mP4bgiO4aIuuC/B6Ddjx456n57RTpBa0uds30BZUgp?=
 =?us-ascii?Q?1uvGeMAZILgedhVR4Y113/Paz8tROYug5dpCnlrUm9y75H6JzM1YsT9b4d7u?=
 =?us-ascii?Q?KKo14DenEAQW/8VBBaFJvbIxAsY4wUckFRehn5VT8dNZlStXMeTBPXz6F5xW?=
 =?us-ascii?Q?YKcc63zzNXi92Aa5kjUkmVm3d0AKSwylFRFBXJLs0JAgSPhxAgcpEcNRKCme?=
 =?us-ascii?Q?2FRP5Z0RCIO817Fi60oo3c2LeC7UgM9j+XhQCrLQlpBsnTmbuO1Iq6m7PMoI?=
 =?us-ascii?Q?OcdZX56DWr7aTswaRjk8tG+3qLmDVZRWscsJoUvaU7S8W0rNAG7s5EDyFQxx?=
 =?us-ascii?Q?N2XUY8eDsa/DOlboVC0EdVWVXdDn7muUZ0yUaBzd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e545f60-31c1-4e83-9787-08dd210d434a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:45:00.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ti8il1WPQtC1L5RLbw+d5owtf0boBFiSacc0v6XgWdBr5PvBJyfIu9GpkJL5G38AAm4j0xVGd8Mtx1n/sdu2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761

On Fri, Dec 20, 2024 at 02:39:13PM +0200, Ciprian Costea wrote:

Subject is wrong, this patch is not for common board

Simple said:  "Add I2C[0..2] support for s32g2 and s32g3"

> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> On both 'S32G2' and 'S32G3' SoCs there are five i2c controllers available
> (i2c0-i2c4). Specific S32G2/S32G3 based board 'i2c' dts device support
> will be added in further commits.

This commit have not touch "based board".

So"Add I2C[0..2] for S32G and S32G3 SoCs commit dts."

Allow only copy subject here for such simple add some nodes.

>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 55 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 60 ++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 7be430b78c83..1a9683c234b7 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -333,6 +333,39 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x401e4000 0x1000>;

reg should just after compatible.

Frank

> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x401e8000 0x1000>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x401ec000 0x1000>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g2-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -341,6 +374,28 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x402d8000 0x1000>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x402dc000 0x1000>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g2-usdhc";
>  			reg = <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 6c572ffe37ca..5d28b439906d 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -390,6 +390,42 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x401e4000 0x1000>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x401e8000 0x1000>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x401ec000 0x1000>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g3-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -398,6 +434,30 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x402d8000 0x1000>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x402dc000 0x1000>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g3-usdhc",
>  				     "nxp,s32g2-usdhc";
> --
> 2.45.2
>
