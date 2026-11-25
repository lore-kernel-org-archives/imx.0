Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624359;
	b=nhyGvi/f1pFw6dJBb9QcKpNVyoYGUCpgMwbibbgk6gL+vGDUP2nKDXI3J17YoGSV9EZP
	 pY0K4bRX06LMkaI6IHB0tV3tNicAwcVI2T+fwEapEjhCULskO/4VCMW4nupMd5x1+RfCD
	 E0267ayHISX/bxa08c36T5bW/Srdaqgqk6PVXEll3dyBBz7Z4mncVju29WxbkL+3gcFpm
	 /12o+I5qKngArnoIElJk0ynUed/Y1qd1JBd301oLgqTpdl6r2xmiRiSa+Ps5939Q4Ugii
	 K6kks6HdsF+5OMrTTroVMw9fppYZk0p1dVN7MdBpvuz8pF0lJGR2nlroXQUujwzHgaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624359;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XBDrLAxJ/0gY83X+GTbCxPKiwrBVv2YxhFcNVdxK9PA=;
	b=ZssoOh7pGJtafRmNc0TcGToOr7+GiA7xr9Cdz892hbt2dYMHCXhJ9Jv68nrHJ4x6ZNR3
	 qcDrVRfEfcFhJqMyaJR0KOuiEX6EWAvkSCiNm52U/FFeqkGslO2zsELq6WtqbBTO121nK
	 nQVoSooUqLcWfsxt3WooUj/gCpikNTF1mApdXHdi88I7NEKJ7NI0QBkfftyAJmIG0KAIW
	 nD21W59K7e798Mt8l/8JRRGD/hUA4clSJ7tlPPlXt0MTPB8kNp892TTo9C/pu1WlIL5ln
	 /bMdxCFDyAA3FNUsp1R9jrWFsw4TVTpTmPSn1WjiIV8kGI3SDt60o2pk7j7PoGvamSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=j1T7dK6Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.43
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C03606A33C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C03606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=j1T7dK6Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+KMYrQcZerEeBxxh5FYT27/BlQ+/HWM4ojOd7Rmh5n2ujjZwerbPQp7/jasdZVr/RNweDtdsnMwv0C9HXgHgRQCdmW2ZB2F10uMWtXaMFlL7iAxa2vSiZqSFbvMdfjzQFYd28XuZs/4e4KJdVb0YBg8++JOcbltKg1W+/9hN+E31JJP1/je2npfKk4UQmAHZtSfVPF3srI1OPM4TGjq2FtOOeKCSzEh9tspMcU9Ih5G+DXZLqY+HzbmLWcmTADAA7lYIWQdGYy0IizmQqQZYxWcLDhXrC8gsHZL4Tu6EeEFTRY4RyFXV7tTlhWmiEwCB4MwNgBtF7mZ/HduFOs2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBDrLAxJ/0gY83X+GTbCxPKiwrBVv2YxhFcNVdxK9PA=;
 b=abgrCExvgAOmT4Q9fEXrng22Np0l0DCWEY/yfhfgQae3tZH89POtdkJeqE8EqD5ZAOfcz1r4GCQA5qC5YhiAjO0OrDPHrqq0BjMMGcGWvLjk7/mkq05MCXEMe1E2x1EryaH38kh3lqPHJ747sFUKHbWCSPPUOFe68InZ+uFFSq8/whvLJbM4IyCnTxHWYcfzXSiH9gNUmlzTSn4/qxh7iwnlgEitr8LEubcDg8HRtBfIpgYn5DXPBmqFpV6Z7xzVLOJ2e/1fUqXYDVODVQ4iPhAi9XzdjMEycRVecDMUlzzpDh8oySg4abXHmY0lNFnsOl/SCyR938O36wMD9Gu6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBDrLAxJ/0gY83X+GTbCxPKiwrBVv2YxhFcNVdxK9PA=;
 b=j1T7dK6YQiu/XPWyE9nbRdrC7kEFCP2i3Cp5Qfui2nYL5Jbb2GeWL2Huj++u2hvQQG3Y/IkCRmqPxwNGD2aXWMtU3QnED4u7t4NEBZmPaJsogcscgvfP82R2wmlh0TlAEN4RwLAtHSJcsbELWY676sk1Ig8qblN00aTyZ+apt6Og5j7RabWFk9br0DW1DlbmBZs2Nz8XuWvMps/xP56FrbAsPD2Buo1dH+YK3wV0G0NH7i+SiFZ1OTJ/hbAOwA8yqNcz8gaRGno1Xw7BlzqbiCIiwVnM4d4Vj40zwZJl/m6685L9/PkhneOEOMvpw1acTUEqJ4uoYVksUxQhJoTHvw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10425.eurprd04.prod.outlook.com (2603:10a6:150:1d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 16:32:33 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 16:32:26 +0000
Date: Wed, 25 Nov 2026 10:32:18 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Dinesh kumar v <dineshkumarv85@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH v4 3/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board
 support
Message-ID: <awcNkgqB2YsIOusn@SMW015318>
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
 <20261125113845.297658-4-dineshkumarv85@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125113845.297658-4-dineshkumarv85@gmail.com>
X-ClientProxiedBy: CPAP307CA0004.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: 7934d6e3-cddf-41cb-1955-08df4b11b107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|7416014|366016|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006|261026140227099003|261022075727099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	rMKQYOHKfyT3MEfgIdDhTbucbvwWA/e9pFGx34UgcqLk+7daY0Q7zJgUsXarLf0fSrJLgnNdkfv4Bu/cKKqdZaBWRUPoWnmVDmge5Q8F/WQAAYP87AMJw2u0Qd9MGYW0bwFDkl77rdNaikDn0EXjXRTmHphz7UaO7ufuCEeWCAMwFBbwXL88lUTcjtopCIVfcM0GC2Z5hK5Buq7pESeDmdBEGtmdWZU0786Bl4pE9WzmVcjDoTnbB/9wcKHCB2nu+GkhlrmMsGT7HIys0RkUhQuusAa5Fwd/BjloconfwTydar1lm+oGinZuPY4zMCdaB+VlgPN/rQXOK7N467J0TcSgPEJQM2ME5FRLD37hsV3E1vAHOmwDn2xMkUrSqfJvZMbvL2aS8dBCPxFs3uibXIv1Ggoois6J5W00jo8NxfwFLW/A/e/uBPPWu0a8x0s8FI7wo+PtxnwdXhLy4YXnGzTNu2clhDrCs5De7cv+PIPB0q32oJkVRfBaKZ71mvSz0RLfH5Yb0gFtugK20QVgsatHbp6rwOaDa145iFSV0vUMCROaWCsmihmAya0v+YTxPQPOQbqYDqzIAu038l0piYrOl/Z96XMTjxmdo105h6TCH6MgioCSKEdgVX8q7hvjua/iujGkbJ3Lra2Xys3Jx9hEZm1krv/FxeH+LdrAf1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tCAcztSzpRGHys4K/LHNSOiwwtJLtIInEIyG+hGtCGnFeE6LZHeur40xeK0i?=
 =?us-ascii?Q?fxnjLv/v677XPEVAcg7/xJQ/ApOR5tLOD69IL2IfafBne6tnU/SXvLe8mETD?=
 =?us-ascii?Q?2JGjfDeMlYfSazK61UxzE3ERZ/5fuPokCRlat+bezebwvsTU5uuh4/jQDCXh?=
 =?us-ascii?Q?cm2pRoDoFb0cCMtN5pxWG8Ox3lgcGF6/1fXHDP+LENkX4eyhLqfni4W/vK6f?=
 =?us-ascii?Q?6EkXB0+VHnScXh1C3+PvRfYzVjYfrV8QMW9C6m7Lo02mIzGGnTENomlMmrUR?=
 =?us-ascii?Q?bs5lkkknfxETFxTjfHzrqzeHu7qXkgN/xtHEuYrtdZFslvOW1RedpA3DUO8d?=
 =?us-ascii?Q?rBxTtO+BO1emWmapqQDO+yqP47MvmZowJO7ootD84J91p4bz8Q8GFckzYYo2?=
 =?us-ascii?Q?p6aZL3YLAe3a/jym1BUvGxab7TGYDgt5MnTpAo4LWRAWnXK8LFzd0r2Q7Y8o?=
 =?us-ascii?Q?bnFOY7V2bEYplyrKZHD0rG+hrvmZMsmzQuP9na5XjHxQuyu9/pbVvm3UdzMB?=
 =?us-ascii?Q?QYSzyRlTmIaPv7n5NyBOVx5Rn8kvdG6MhvadrePJcO6nrgWcupxFSjakq0GA?=
 =?us-ascii?Q?vyPMR18zLM/lyaYO9u4mXtZb1HwCLn4CNN9qf9udToD0b7iHq7CjbnxjYAYm?=
 =?us-ascii?Q?MK2QhmudaFsTXT0foLJAXoWsQYF4oCFX3ygTjdWB4FLqlZaMU1FLLHHwfUOA?=
 =?us-ascii?Q?pir2VkjeT1NynpmPEIq6H3DNVU6UkX7YcCRxFNgFpIRDmYeJdl9rC0xsPfOS?=
 =?us-ascii?Q?aA1zEt8OcSnd2+3+5VhWGyU7FmHua9lIgLo/Z7kFAn2BOXUjnryeuwd7k2in?=
 =?us-ascii?Q?t7rVk0qFZ1JfmtkcsULqXyq9okqQrnaM1AFA3s7pjX8oYH3x4bh0CLVRkvSU?=
 =?us-ascii?Q?k5NHBY2YUd8ZN69tdqlFQSyiWBAWuS+cnkWW/skHw11LIw6Ufw5cE5v+hu8F?=
 =?us-ascii?Q?MEXBHa2FpTMr2qfkZN47urI8HkKmPyX0on0RmAr3McP5DBnU3UjxRbRW8oiV?=
 =?us-ascii?Q?WAyW6vbmtvjLOMC9WkauRioJog7WFaOcpslwJ89wrLJnFaI3bgMaZ7rds2uX?=
 =?us-ascii?Q?doQ0fEwWzU3julsp0+gFb+37vfEttojjZoTXYn0GWMZ119JwQhGi2ZTf37DJ?=
 =?us-ascii?Q?T7jeBPL5WSiw6basWJxGmjIzuEA7T0zwhLcVtrAysou7WS84+QWwSBJ2ipE5?=
 =?us-ascii?Q?nJfdEu5iZxAnTyk9c2cGbXY7SRLy2HVx1k4bTR+0jjuHYa5Q4qoaJ7Y0XoH2?=
 =?us-ascii?Q?qttPfhSESArOwsbJ4vlvKP1D0H/grEMqkfiQeJgta/CaWOjFA4l3PK656ESU?=
 =?us-ascii?Q?e7SIOVFf7m9JkrOgXb040A+qjVJwyW1jaBNKcp0UGz70C7Y/c8XNsm+1bwNg?=
 =?us-ascii?Q?xAcEUF3wWqafzxRWwZEyyoJ+L4y+YhksvpIQCtabojQAE+ofk8zB8DA3ohlS?=
 =?us-ascii?Q?LcLL5VODmgjmeKRUSzETmSD80ON62OQSki1gXLUfkxukbcNQisqHUKQLE94v?=
 =?us-ascii?Q?VChWCqZ+PwvqkYWzdqvm2H5pXrHkQxnfn5JGJuY5TVrZDdOnyoQzJTSfN5hD?=
 =?us-ascii?Q?8j+xqSmEJ4Jtit0j4LtueFb8XXz0mZo86Nyi5VsKd7qziY4SMLYUXibDl+wE?=
 =?us-ascii?Q?8K49yI8nx9/ZwsydUnLw3S5czqidsWuK7xD+wI2yPB+w38364maKTKB7ass0?=
 =?us-ascii?Q?qihD5Sz8xgvKbBkbcgSTpeLrAquP60/DtxVwf2iQKUaF00SVWjGRJuPwCO9S?=
 =?us-ascii?Q?kWiahoJLqUlpHAXAxaKiAeDbflgh7+3ao716g62ivglBkuARwSzR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7934d6e3-cddf-41cb-1955-08df4b11b107
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:32:26.8760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yv3s6ZNgNFMtM0N35LIccC8SmImvLNhg6hbfxlbtkbLCkOgj2pPnlf946boQ4SF3VE8SDSyQgS9eUYaiTyelW9eRRIyGV03DfNUmYyY2ZR0E2Ms0cTv2ipm7gSRF4zd2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10425

On Wed, Nov 25, 2026 at 05:08:45PM +0530, Dinesh kumar v wrote:
> Add device tree support for the ADLINK LEC-iMX95 module
> with the I-Pi SMARC Plus carrier board.
>
> Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
> ---
...
> +
> +&lpi2c8 {
> +	status = "okay";
> +
> +	/* SX1509(2) U1001@IPi SMARC Plus */
> +	i2c8_gpio_expander_3e: pinctrl@3e {
> +		/*
> +		 * GPIO Expander 2 Mapping:
> +		 * - 0: E_GPIO1_0	<=>	IPi SMARC Plus CN101_PIN29: E_GPIO1_0
> +		 * - 1: E_GPIO1_1	<=>	IPi SMARC Plus CN101_PIN31: E_GPIO1_1
> +		 * - 2: E_GPIO1_2	<=>	IPi SMARC Plus CN101_PIN32: E_GPIO1_2
> +		 * - 3: E_GPIO1_3	<=>	IPi SMARC Plus CN101_PIN33: E_GPIO1_3
> +		 * - 4: E_GPIO1_4	<=>	IPi SMARC Plus CN101_PIN35: E_GPIO1_4
> +		 * - 5: E_GPIO1_5	<=>	IPi SMARC Plus CN101_PIN36: E_GPIO1_5
> +		 * - 6: E_GPIO1_6	<=>	IPi SMARC Plus CN101_PIN37: E_GPIO1_6
> +		 * - 7: E_GPIO1_7	<=>	IPi SMARC Plus CN101_PIN38: E_GPIO1_7
> +		 * - 8: E_GPIO2_8	<=>	IPi SMARC Plus CN101_PIN40: E_GPIO2_8
> +		 * - 9: TP1002		<=>	IPi SMARC Plus TP1002
> +		 * - 10: TP1003		<=>	IPi SMARC Plus TP1003
> +		 * - 11: TP1004		<=>	IPi SMARC Plus TP1004
> +		 * - 12: TP1005		<=>	IPi SMARC Plus TP1005
> +		 * - 13: TP1006		<=>	IPi SMARC Plus TP1006
> +		 * - 14: TP1007		<=>	IPi SMARC Plus TP1007
> +		 * - 15: TP1008		<=>	IPi SMARC Plus TP1008
> +		 * - 16: OSCIO		<=>	IPi SMARC Plus TP1001
> +		 */

The below gpio-line-names already include the same informaiton, needn't
duplicate it here.

> +		compatible = "semtech,sx1509q";
> +		reg = <0x3e>;
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		gpio-controller;
> +		interrupt-controller;
> +		/* GPIO2_IO22 (module FAN_PWM_1V8) is the expander IRQ on this carrier */
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_gpio_exp_3e>;
> +		pinctrl-names = "default";
> +		gpio-line-names =
> +			"E_GPIO1_0",		/* 0 - CN101 Pin 29 */
> +			"E_GPIO1_1",		/* 1 - CN101 Pin 31 */
> +			"E_GPIO1_2",		/* 2 - CN101 Pin 32 */
> +			"E_GPIO1_3",		/* 3 - CN101 Pin 33 */
> +			"E_GPIO1_4",		/* 4 - CN101 Pin 35 */
> +			"E_GPIO1_5",		/* 5 - CN101 Pin 36 */
> +			"E_GPIO1_6",		/* 6 - CN101 Pin 37 */
> +			"E_GPIO1_7",		/* 7 - CN101 Pin 38 */
> +			"E_GPIO2_8",		/* 8 - CN101 Pin 40 */
> +			"",			/* 9 - TP1002 */
> +			"",			/* 10 - TP1003 */
> +			"",			/* 11 - TP1004 */
> +			"",			/* 12 - TP1005 */
> +			"",			/* 13 - TP1006 */
> +			"",			/* 14 - TP1007 */
> +			"",			/* 15 - TP1008 */
> +			"";			/* 16 - OSCIO / TP1001 */
> +		semtech,probe-reset;
> +	};
> +};

...
> +
> +	/* U1000 SX1509BIULTRT_SEMTECH on module */
> +	i2c2_gpio_expander_71: pinctrl@71 {
> +		/*
> +		 * GPIO Expander Mapping:
> +		 * - 0: ENET1_RST_B_3V		=>		U2001
> +		 * - 1: ENET2_RST_B_3V		=>		U2101
> +		 * - 2: SERDES_RST#_3V		=>		SMARC S77 PCIE_C_RST
> +		 * - 3: RC210_EN_3V		=>		U1300, RC21008B001GND
> +		 * - 4: LT9611_RSTN_3V		=>		U1500
> +		 * - 5: HDMI_INT_3V		<=		U1500
> +		 * - 6: PCIEA_RST#_3V		=>		SMARC P75
> +		 * - 7: PCIEB_RST#_3V		=>		SMARC S76
> +		 * - 8: TPM_RST_N_1V8		=>		U2400
> +		 * - 9: LID#_1V8		<=	R1005	SMARC S148
> +		 * - 10: SLEEP#_1V8		<=	R1010	SMARC S149
> +		 * - 11: CHARGING#_1V8		<=	R1007	SMARC S151
> +		 * - 12: CHARGER_PRSNT#_1V8	<=	R1011	SMARC S152
> +		 * - 13: BATLOW#_1V8		<=	R1014	SMARC S156
> +		 * - 14: TEST#_1V8		<=	R1015	SMARC S157
> +		 * - 15: DSI0_TE_1V8		<=	R1087	SMARC S144
> +		 */

merge to comment of gpio-line-names

Frank
> +		compatible = "semtech,sx1509q";
> +		reg = <0x71>;
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		gpio-controller;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_sx1509q>;
> +		pinctrl-names = "default";
> +		gpio-line-names =
> +			"ENET1_RST_B_3V",	/* 0 */
> +			"ENET2_RST_B_3V",	/* 1 */
> +			"SERDES_RST#_3V",	/* 2 */
> +			"RC210_EN_3V",		/* 3 */
> +			"LT9611_RSTN_3V",	/* 4 */
> +			"HDMI_INT_3V",		/* 5 */
> +			"PCIEA_RST#_3V",	/* 6 */
> +			"PCIEB_RST#_3V",	/* 7 */
> +			"TPM_RST_N_1V8",	/* 8 */
> +			"SMARC_LID#",		/* 9 */
> +			"SMARC_SLEEP#",		/* 10 */
> +			"SMARC_CHARGING#",	/* 11 */
> +			"SMARC_CHARGER_PRSNT#",	/* 12 */
> +			"SMARC_BATLOW#",	/* 13 */
> +			"SMARC_TEST#",		/* 14 */
> +			"DSI0_TE_1V8",		/* 15 */
> +			"";			/* 16 - OSCIO */
> +		semtech,probe-reset;
> +	};
> +};

