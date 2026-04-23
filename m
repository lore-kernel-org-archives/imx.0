Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E43E3DB7
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939660; cv=fail; b=dh4/i8bHuXkPYpeG8K4ofZwrlpiM5MfyQFOVnTOpJEDxm27jbvUw8JXJbz6V5V0cGP5h8qZIroHAywGUxRNNDtnFXCTPYjlpX/gB8I8MtUQAHNPsPibf/SNAWL1s0jl69iAbQFS2hHc7ackNCo9bGQDmJ+W3B6qcZtFG9BplPtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939660; c=relaxed/simple;
	bh=yfj00NCwi++4TV88f/3qLxcFP6d81Er/bSu2ip9OTdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aYJhIbX0DhXcFp6bcbIv5bnSBrk4TbSrw7EIRng+H4xNWAZS8WBTTnDjHUTcNRSAnq6tJ3FltOMtuDuG5JtCkAN++Mpwgf+WxalCli9K5Hdg7dLO3Hh1q+uZYNRYRvH+vGi4yQOjKf8TmoUGW4cp7L5Gdqy4wkJH3B/hDw01unw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S2pAITts; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S2pAITts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvj6/3h9tBwAwbsrK7a2y5EXi3J03H3UaK5LdMY9HKOOG+swp/QWmQiLk1dapPMGKMJ1vvk+ekGxCJK8zrK0GS9zv+eQU42mXsYhIdJB0EkqYrMn8Lsw0/KKOixTzAR7BbJP7SXT9AvBIyjEqO2jPIQrnl5KKYzvvI713tkHKuUbi2Xw6ZBENj28t4NWeiOyJ9gpHN8SpodfX6l2gSjb9wiylI72SvZ7m8PlYkmvHwqwnHtz28zwsoH95AWo5etzNUu7FkXIaQJ8VVVRGC5K2OhEgtsKdESswF9jXjgfFlnPrpVHp93TU5g23EyZCMptSc04+JERBray51kVl2RKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf1Z9dxV9qfbYDjKAE18iXGT7ua+B0FpF4IT6jRMA2o=;
 b=dxEtFe/GGNLdNYnV7wju0lrvG+20v+tVXvD83DZUvkCoO1GSPm9FPMGOU8fNYXXrEFnviQHMdM1tmrx9CyjATKUeOSwvn4M20svoglpjNrLPPwMB8eskLSYWMZ0cF1QORylE+G07GWpAxqVRbvfw5LydIlkxEaQKJiM9tOxCaGLH/ycSkvU6DgNV0oi3B878gQHJKp4VxewZdIFXAaPLjYJ1XUF7tGAF1vxTp24gaUFMpwnlMvg38J0xlKiw5wy3Qw44+YCkVSgabbUXmYeeUYovAx87kFVg8uA1DZd3sr4cT9GMoGU1yOxl8aIMRsqHjaLYKhWHlpqOd4r66Ja36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf1Z9dxV9qfbYDjKAE18iXGT7ua+B0FpF4IT6jRMA2o=;
 b=S2pAITtsSAXsF0jV4mFDy81XbeC/JFTL4BDD6E1X7m+1E7UWo6giP/sAiSE3IQn2dDxSjrMMZtoLO/PX+XZQYuw6mX+/J9onhp66nei4yK/3ou/zW0/KFmm1IUL9crw14j+zRl2Cu5eexIx95pIU6Zquf5sIKbsrpwLF3/GUy0bxenXD/7B97gk6/oBXXi4LVjIMgnpRQyfkw/hs51Q6x1EjpOgX28qyhU/gWRfFFmHak+Btku8Y8p0TMeM0EKHZH3B4V7+ngpn0UdHtGgVZqrWJqBQZe1bTQfk+UQA301c/2/oWddB0rwp703blwaBmWybaHYS4I76MmcFrvNBjcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7265.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:20:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:20:55 +0000
Date: Thu, 23 Apr 2026 18:20:10 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp: switch usb controller to
 flattened model
Message-ID: <6w6hf2p2msohdqdu7qnpcdyiavguppsgrsiroyszascpklzu4k@oi3a5bjpu4dw>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
 <aehEXEsiFl2PVIye@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aehEXEsiFl2PVIye@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 61dc2db2-59cb-470e-ffc5-08dea122012e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|19092799006|1800799024|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZHVhVQ5fvylMMgJEElWH80auC6sG3KOGVbI/cL75buPUccWs1u6M7mEyfef+PcRBe6PomzKPWqwvrFgdnAg8NboE9B9hpXyubGHt81PvQ/Jy5yVC9hqHbhuJHrgq3ejQTA75fQ3/C+YFWURwaHcpuPwVr+XsIHiZFiABd2SA6FncISnnLf6+uBbM6M3gAUH8s+fdYuSgsLXmtDiXHuQI2r4+oND4fFt8HK8ra12+fa5wZHfi28IFa2E8/VKYR1m5aFywIhf3rSM3SK/lVlz1ldqr1XqtXN2F/F1NXz63c5e8UFr6WufT5dwgu77hj7iQYbUFcaz59yK6XlMbDPRgx+xItZUVF5vlilDQFiHH3FuTbbMD+150hyNfm7PzVeR1Ipi/gpqnFZRr6MQoVcpyDwpGhViKgMsw9GNWFy1bJdD8ucf1m1bXFnd7Ij/8EYSY4OTvU4NPMwf9//vTT4jw7xiWFIhmQFDEa9oJm5AvxWxSiVc44q+KB+qLYC2ZEY12bTRs/l85PiQi/0olas99cFr20CUmFhZWj5Fh79PZksTb0lpc9bf2iL/blZ3aUDYKRkIpkFbNOWsbOTscbnilw6s7VXV1vlfEQ0SCnBhmoP3VarAvQKlfvOOVwEFHX6fXVyJQwsJpaJf+s9gN60nYAcwGKNStp2mbE1M94n74W05JpsIHpq/4HHen+T5oqNvESOI4w23mBz/yG7X7oBGp4kMEQWGaLrL3AjePlIUEerGtuRC4RRQpDrs9780dUm8zqZoFhusrqDcw3tZLTZzIF+3T9XeuXL2Jrpq1oHZQOGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(19092799006)(1800799024)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WAahYQfqmuW6gNcpcgx+Ue3GNPIg+3y9qAU10xaPL2c1zbesQsxb2h84/9lr?=
 =?us-ascii?Q?IW1c5euNCALXeSZfs4Df1dciz9ZRcDVBo5+c9i3bvxrtuHqsPrpK/bZ2KNEh?=
 =?us-ascii?Q?JcczgUHITqnXMnDk0h2UBa/eyHfiB7ExrbWElYdjG7KuQsBhA3ch4jo2Bf5k?=
 =?us-ascii?Q?S0ti0mgN1SVXwoq1cxp5WAiQl+8krtf6Q/+WA+0B2GF9Mu0e8H+D2YYP7CUZ?=
 =?us-ascii?Q?pQKYTU596rCc7BHVx0w39wECJYiAL7PoiEHxj2NhvsuiKE5TnRvy7oku3L7o?=
 =?us-ascii?Q?1n584YZqA3OkvwNZMTQ33L+1xeXrI1DHY8EUjLCyBIkkS4N5sQ6lMPPtjZEX?=
 =?us-ascii?Q?mznY/Eug99+vZP2t+0kaVW6jSTff4Jc9lqx5n43fltAqfIKMdClKGL5vh+41?=
 =?us-ascii?Q?ajGJiHHFcplf0nhybF2jh/VS/k+ZCg4RcH+3aV2Xieq6L53DSy5hTjq8jCQl?=
 =?us-ascii?Q?/kcTGEg5dlevU4/aqJL2djvcs7CwgNK0QVF7/VnVlLgjfgXmYpn+x75252n2?=
 =?us-ascii?Q?eb0D9Va4KCKpshVQr4ZUAwPxTQ7sx5n9U76FHMFF35j0/9ZrOT5PaEamSbeS?=
 =?us-ascii?Q?GFldkcuRno87Zj1ZDjkT9mE5KZ3j0mi++vSeQlMU3uoK4yui/ccH3o3z1wDn?=
 =?us-ascii?Q?ljnCeH67Nr/QdCGJt0dJotef8hVzfIm8XNxYxizJMWOMGGa8FW+gB2L+ic43?=
 =?us-ascii?Q?iQrzsj7XT1sT3UsxwFNB+kem56xCw227g9FnEyT9E1b+2SQE/y8RsRMHJ7z9?=
 =?us-ascii?Q?uVmG7hr09XjefPPrVtIkmmwFqkz1/l6GJl7oXZTXw3vFMPdhXKreZDdh03cz?=
 =?us-ascii?Q?+wMZdngqDytVYAdYouCDNEwW7HXZesVkWGkU+2W+06fJBTUNB4ZgqXeLOhww?=
 =?us-ascii?Q?2gqG/fhrC7YTBC1lll93E3+X/RYZ7boDxaW05UdepzBQuzWEOQ8iMPsY/oVv?=
 =?us-ascii?Q?PTL+glmWybtusbga4KAbcWufSCiAN4VlMN5ILmDc7QCiQNoIxDWGaeP2viBJ?=
 =?us-ascii?Q?WGSovGkCofBVwZtVT7VJVPjF6yQ11YXjrsQgujLj0txBgQKZoy0/STA25Gxe?=
 =?us-ascii?Q?WoTStzRhEw666qYt934m+ahH0jnAbCVg0Z1jh3P64dkl3i/mHI8ZbVM+Z1j7?=
 =?us-ascii?Q?RPg50ufbCSTEBoKbHa/Bv4PklLPxv2PxHYqlyCeHj1KW59njS/n9rhCcODsG?=
 =?us-ascii?Q?ySAvOJKAW4ERpsKxaJH7No4Trfx+bIoujcLEgScFUI3rnQ66BktSSBf/HopK?=
 =?us-ascii?Q?tsxbw7fKuxD+6d9AEfsf92Ap4QgoUwn6M9IGlqV2Tcar3UC+apDlKMjyzLru?=
 =?us-ascii?Q?O29bVf8CCjCqynAeQem9WE/vCqAAr86LW73AfNbeFkVZj2q3LaGab+JMMmt9?=
 =?us-ascii?Q?yt8JytAhy7QGpH4vf8mEsmpFZXedXDWLGnwskT3Izdayz6S3ryswuAViz0K6?=
 =?us-ascii?Q?gSpdtLynaJ+LJ99vAavDePOrpU8kVNW23moT8gHItocZEEzbDsguAgf+M3GN?=
 =?us-ascii?Q?YURvgs9Cf5RQLsdQs5RZCcUcHvHVS27XU9J7cVs6Jr3H+dmVo9QLNsQsosVQ?=
 =?us-ascii?Q?z61rBQiziHwhuNm52clovKKqOaGHFIlohA3iSMOowycM+k0ZsjFeRerpWPG7?=
 =?us-ascii?Q?ttHmz/ygSo17MegUvAmrOZT2aEfMNWSNhod/nPke5bnciCcidvCQp2RLIBOk?=
 =?us-ascii?Q?vaez0Lg3nOdxDCSPnsOijVj/54K4GxLsauSZ7bYMK+Ehli3pqDkkT1RNmKmY?=
 =?us-ascii?Q?KeSEgSY6RA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61dc2db2-59cb-470e-ffc5-08dea122012e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:20:55.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHYD/3x9SpIZhHMEtQl1L4pryA7pMbnX9Qh3n13dmUPBg59YM/9rdSkP2WvHZUh8OGsao8Qhguprk183jmXFOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7265

On Tue, Apr 21, 2026 at 11:45:32PM -0400, Frank Li wrote:
> On Tue, Apr 21, 2026 at 06:55:00PM +0800, Xu Yang wrote:
> > Switch to use flattened model for all USB controllers. To enable USB
> > controllers with restricted DMA access range to work correctly, add a
> > pseudo simple-bus to constrain the dma address.
> 
> This should not "pseudo", and bus is physical existed, which limited dma
> range since it transparent to SW, which may not mention in spec.

OK. Will remove the word "pseudo" in v2.

> 
> >
> > Also reorder USB-related nodes.
> 
> this need new patch to just do reorder.

OK. Will add a separate patch.

Thanks,
Xu Yang
