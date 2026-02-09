Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42113064A0
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664719; cv=fail; b=AZoaz+Jl5z4yBZXvXhZbIePwN96pkvtgEalR+Tfi1IT3zPSMwPM1Kt1b0UHvktbAnHri6P0C09RnsMOAVnOQB2ndeNl9UtKk08YZoJhz+u0dSO6z4xf4SQfvsLVZpLcrWsWZYXlSlbz/QiMYFrxOkUSdqzxUsiL2XiGZMwHOe5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664719; c=relaxed/simple;
	bh=S88lTn5zySatWwiQw+4uFbhlCImR++XpxiumL8U72XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RfrPW/Y2Zrx15kYXBb7na1CRlJsQzWzhsNmKdMZj3m5Mul9mU4s8Zs986AWZQ1s5bpLaFjqwIo9ZFDp7SQQQK5luZUABOD7402YUbRbu++Q1Jh7QouXmMPGzixfEKaY1MmuDqq9lgjvaUrxzABpCusb1UxrhhIhSmmczmlvj/AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wj85rQao reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wj85rQao"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXKJiTzBzrr3BphM82jvIselldTMMXQ7LoiyI65yUzIhZdeHIxJgPC525jfc38kCSyhjn+kFte38CFDlPDLEOhHLIOCONOQw1tHkfG8CS68F+Usu8vqZ07YXRhErjh+uY792+LYHvGjZkTX6D2V5tTK/wNlkxxXd3DPr/pVlLdMHvInCkvEbumam4gL5cn+D8nJiJa8HG37YjVlB+1MTv8wRfXgsZoYrliHc1AnrnwxXxUNCj66rIqi45NcYJO7yqTYNbDV3F0e7DxXnIW/SczmG+EJ4WveIqO2PHP6OSK912ZN55DR0Zi8uHG4jxlE7M1OYx81HOpPIiQbzlkXmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWMznFDVeNSOqPqyEnpAGImTQRowY3LB5WDj4jdPUiY=;
 b=yOYBXveuZOjZqClMfY4VqgSxELYRHjE8bbz67507YmteRDcRiPkWjWTkRJdWqvcyTf4jBoJwX3drgz6OimIBylyoHo4iboLqkjv7lmjwHlG5aLIgx4AB85jLrCFP/GCFB60kUxv0XF5tBKfLY1ql8kb5sRjvTaMYsjPIKsBQ4GRI0cGoXwptab0WH7NCz7x0Pt/zlL/63jl1ZW3URpEPOD9Pzok6frvDQnDqhOpXL7d3574/nAsBJc4F/Q66ZcEFepvZ2A39ClRYIlAe0cic52SRjKmXZ1yLa3Si66yY2XUG/MrFlusyq1v4bwikZ+xiR3Sa3u1u37i15XzTa0ClzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWMznFDVeNSOqPqyEnpAGImTQRowY3LB5WDj4jdPUiY=;
 b=Wj85rQaobqkOkYVvnJKQkgbU1+5DvJ16vqoRQ0r15coxx0nqePC031pgMolONhMQNReBr9CCrXKhwUOJWaILm+jg18VLExsc3cK3BLFzUoHrtQjakCY4RA6cEZCJSFEZ7ctjVB4pIHbeIQCVQQyTxqttLbSewMNr3muTRe8qNTlt5GlkPr2ADnGiZ6WaQStMPWks7qTIYPfF4iqX3k2Dm5im7tggO0n4/Lla93IFbiWORPVJTIIrhX4euE64O0rIxZ89VE6IJeX6tm0qH4PM6Fqh6qxGDJrTGo8y7XarxWMYK96TolbL7xskBw9DPJEYuWkxvqWfVWO+fTiT0lsQMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:18:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 19:18:32 +0000
Date: Mon, 9 Feb 2026 14:18:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx91-tqma9131: improve eMMC pad
 configuration
Message-ID: <aYoy_-v_T-cIHocM@lizhi-Precision-Tower-5810>
References: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 00987609-5a1f-4f3b-a1f3-08de681003bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?K//eR4EFeVhVLbLAwez6EDpfIbmPKZjezVYfpwKJjuNhOgup3GC8U5MD+C?=
 =?iso-8859-1?Q?l0G79UA6Z7DLgTXDiR76+241Ox7lBNN6CtBObRj5e1HFdt6e3s3SIg+AzA?=
 =?iso-8859-1?Q?ShJBhxPnjA65/HoCIy65yOwqFC0CBWlvfOUTPRMoaMW4c39L5AFPCiPsaX?=
 =?iso-8859-1?Q?wsXXeGhPaVg3NQi7jF6Dsy3Q2mZHuKwts8PsClmuT97RxVpe+Crle9nopa?=
 =?iso-8859-1?Q?qyz4z11atUTphOziuPxidsjmUbH/2WQ8xSqNWqEt9XLyVDyNBUoU/pQMup?=
 =?iso-8859-1?Q?fXKfZK6Grcn5BEKGuBzVUg0z9qIAWz4NjtXXv0w6Doivm4A6I9cJqQg/7C?=
 =?iso-8859-1?Q?xUaHbQvceeW5vgqIliVokrct4ybgtC0/W94OAs0WrPsVfnmOtYXzvraq/K?=
 =?iso-8859-1?Q?oWcB2twvLZWb57c9K6eZdAXfZ8odW95X38zKUg7/0CYRknV1CEH2JceGTj?=
 =?iso-8859-1?Q?jYI9whmV41iy8M+zkinsSatZoZmgUTcrJJ/70zyqSrhbTiAeXb2wUJg0Ul?=
 =?iso-8859-1?Q?2o54djwrZmyh762nRX7gonmLehuHZow8ZS4WtHaEK70IHD2dqVElYYUkf2?=
 =?iso-8859-1?Q?9L3Wy21NCbukIK3gwJN3FZYBOooNks/XLol9/dvsCVek3R6T6HDQCI1sP5?=
 =?iso-8859-1?Q?hbYuwY1BQOQoybDrd1mpJYk2O8AtCQNQbyfFFwy5VzPodlvIOufjOs5mmR?=
 =?iso-8859-1?Q?RVzKpmjNcKmzP9PobjwXR3cm+9KPbFntjuh0bNTMQtmml3Nm1IvCzA58Wh?=
 =?iso-8859-1?Q?e6NeQJrdxD7SGW6vUWZ5y083azTmf3wzDuZJDolUqHz2q0ZyRhgBgaTMO/?=
 =?iso-8859-1?Q?Wmx8u+vDf9kEmM3xBUhUc63/L+3BfRfOJ2y92iC8wo30YBMgfXOMZLcoPG?=
 =?iso-8859-1?Q?Xt3QV1XTwhDcSpGgJfyc765Rbq51KNSzGqjJCZ1XRp3fGb5SyVEjWNe4E7?=
 =?iso-8859-1?Q?BWaQrNQXWFV+6adteohZu5f0GA041eN3h4z+LsbI/Fs5I0C41r++vzT9pD?=
 =?iso-8859-1?Q?/q9yd5qEuigxSyzlvH28MqZLmi3EGCVsyr2IjpMJbWH+6Nket8jGkLaVUj?=
 =?iso-8859-1?Q?BXm4ZoNtqSlRIMN9lT3m4WtwnkN7mamjqPKmaXosToz5uCiKJh/YXbPQ5u?=
 =?iso-8859-1?Q?xHH9GkwDFymkBdKIblPNZdxq5oTmIo/89Ih63v2ZZCBQueB73RYAOsWBzy?=
 =?iso-8859-1?Q?5iacnPaAXLC9r0R/hMYMM0UX5W2WbtHQs84BrerslFFEq/wN5V4lQHYuc3?=
 =?iso-8859-1?Q?TUSpSW7FfbSbhX1UecLtKTH/i4Fb37zvY9E6Drht/ykSG7dBcbVgCF+alM?=
 =?iso-8859-1?Q?RltZqWvNRDahs6Qn4fkoEApMZTdxOYmsp/BBp7xkjHjldS/KJ3+LmlRqPq?=
 =?iso-8859-1?Q?i9vZLJN1bEy/k6dMnr+HSZa4bAMuZn+P/vqRobn5dk1e6k1dXjseXCr5GW?=
 =?iso-8859-1?Q?XyTbfdcNigO6aW6HYhNsi+XLA2AYoKwgqZroJKUnvv4yyHwJfXYaK14yI+?=
 =?iso-8859-1?Q?cy0bI9GlYonqjiiSYjXSYZ3EqpuI5OSw+fBOhJujXe6RmvuMIkuU9FrT95?=
 =?iso-8859-1?Q?sI58k+akdcL/YSa+nUaeO3lrTAABrgIHTeZo5TyNIhporKna0gKEOD8oTJ?=
 =?iso-8859-1?Q?HyvyX3ml4Shz9zgmV+I9E7bpieotxrXeVHkqz+rwMI4jIile1K3sS8yDKh?=
 =?iso-8859-1?Q?QKZiTlrZVoR5aKbO4yo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?U7VfJFe7JpINEDizvHNcGMLOyqnxpZohNlf/EvUCDqPjfjbVyLq0sfod3p?=
 =?iso-8859-1?Q?lxboUmJQrMXjYFOCflUcD+2c6kpBUH18LIFWGVd9+g8hHOvJc0SB5BUeoZ?=
 =?iso-8859-1?Q?+JwtDiTjHxmuc2wO6VbnDslC65IHpGiLR89f4iwmzLtIdkS6YpbXDV6WbD?=
 =?iso-8859-1?Q?n2Y0HaqUR0JH7YDAhfsFBXznGlyDyaLOCvTT6EVXA8tE8sh9sbKMkD+Eg3?=
 =?iso-8859-1?Q?RfDNiMWhHMvepb/hSDirDLdQ7ZS+C3XBVcdeiMXY2PfkrTzFq0Fp+VFvL3?=
 =?iso-8859-1?Q?fWrVxiNwrpIjVDB8nQofJfYquZ6h1WYZOf/+4vUN8Qsmv0WnfrYlBoNJGm?=
 =?iso-8859-1?Q?S+5kduulKxttqWl+mA9F8k93htbg5Is0Se7JjsaUB2q4jjD8nyMtx0wkl8?=
 =?iso-8859-1?Q?1uZ8no2bzCBnqJn5GKEIGB6ZfDQor9soTi1ypPxPyqB3fs2gb4RO+SPzzD?=
 =?iso-8859-1?Q?u+jtRBlXdg7kLuhfQCbnPwuBmXtE49C1dufCT+BOeg6fInQE7x6KjcUQIs?=
 =?iso-8859-1?Q?rWzcrV9bomO5mZuZ1OHwmzaHvJzTaJi3Kv2eMDt4tU6rzdaiMgK8L2F/75?=
 =?iso-8859-1?Q?zJxx4Qy6ZS454Ppf7RJy6BtEQDTw0VsRYKt0ikyDCXzvRVAIYEnIEyUO8O?=
 =?iso-8859-1?Q?LMu7rRz3sDZpOzNFEXIMVWWgsiN9v58NY0D6ECVLmjj2APuGyZ9mEQo8bA?=
 =?iso-8859-1?Q?k+M9lkOhE9zC3RXr/Wmri3YEguRh2JtHALKV7+TQDV1lGSih89e1AW+UaL?=
 =?iso-8859-1?Q?fu3EwOd9jGVCLq+jBboqfhJW8n94Nv5MtkaJakDm0T5NB8TPRjqsfwQxsf?=
 =?iso-8859-1?Q?4lP+qD/ScelQCAWSUinB42jerrdDMH/+04TB7vbTHHXCub45OWVS33UT4S?=
 =?iso-8859-1?Q?2aL1kyvrIMyqmZ/Wuond7H7hRQCkuLteFOV0U0FqM8jPG6xbADRIPVgKXP?=
 =?iso-8859-1?Q?fArxHYUIH5YZfYVx0sgb/FzhCJzyL/CQLfSeFFkVY7vkKMtleSTnQTPV48?=
 =?iso-8859-1?Q?tVK7x7ro1zisQh7OIy9XIju24QDNZToxWS1dFd5ofyGWjr6xT8X79hd4fD?=
 =?iso-8859-1?Q?6WgWYVqfgdyyVWJuhjq367wljHD/HT/li9LO40+6hdQ+0+iAU2UfpcenN0?=
 =?iso-8859-1?Q?5elQXJOfPqlQotpqlkf9kt/q8C54Atnr8M7Ogx5RmCaD84SJL1k83d0iuB?=
 =?iso-8859-1?Q?GrwC1jIM+OJx3XWLr/XqXj+KDMwDkArBYVgggVZtP1TomOL3SfXnbiqv/F?=
 =?iso-8859-1?Q?n7bI+L+pKO4zs72M7aATXfidz/Bjn23l84eUlBPPFiu8AnMfbViH7zQ2Gk?=
 =?iso-8859-1?Q?pb4UjGNsFiJeIwLfVfYpDc6byEPwHhoDMPWKMNPiZslQMPEy0i1GBiIwGL?=
 =?iso-8859-1?Q?7gRzJoFV9BfuGFkCLLuq9klrfYSeuWM/7WvllT7FjSMYjxH6Wh28rAlbn8?=
 =?iso-8859-1?Q?cIpMESPVEBYxs9d3FupMIDO95PaufiuBi0yfhpFI6g9+z5e0MuNIUrzbSE?=
 =?iso-8859-1?Q?V6ID/2JQW/NlEM6ivncETRrzagUXBGHnXSfkIyE66373TEyk7PNIt82b50?=
 =?iso-8859-1?Q?nOK2EqtoyelO6extZSnmOE+/xiS1kXPfaUI6geVJ5hsIzfdI57hnGWR2am?=
 =?iso-8859-1?Q?ZdUlc/FscTtp1togKsHx2gK9sLjpJWxyYQ8vIBlguAZTj5jniUBx3Zq5+z?=
 =?iso-8859-1?Q?BO4mZdTkUaTjuiVpJF7qv0+iRs69bU88MY/epY4XUmpOP6Xy3bvAObTgGC?=
 =?iso-8859-1?Q?sjU0S5GijnzhnFLxrI50zQhY+ryh/OVEPsu8xWcXYrJTmD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00987609-5a1f-4f3b-a1f3-08de681003bb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:18:32.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM3P913UrZKjQAscJezNw3MXT1T+v11ijrsdLhy/2ZD1Fq8No8hhcwCgsrzWV0cK02Aby0fnHbSJ9seFAIsOWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

On Mon, Feb 09, 2026 at 04:50:13PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
> This improves stability and detection at low temperatures under -25°C.
>
> Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  .../boot/dts/freescale/imx91-tqma9131.dtsi    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> index 5792952b7a8e1..c99d7bc168483 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> @@ -272,20 +272,20 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
>  	/* enable SION for data and cmd pad due to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = /* PD | FSEL 3 | DSE X5 */
> -			   <MX91_PAD_SD1_CLK__USDHC1_CLK		0x5be>,
> +			   <MX91_PAD_SD1_CLK__USDHC1_CLK		0x59e>,
>  			   /* HYS | FSEL 0 | no drive */
>  			   <MX91_PAD_SD1_STROBE__USDHC1_STROBE		0x1000>,
>  			   /* HYS | FSEL 3 | X5 */
> -			   <MX91_PAD_SD1_CMD__USDHC1_CMD		0x400011be>,
> +			   <MX91_PAD_SD1_CMD__USDHC1_CMD		0x4000139e>,
>  			   /* HYS | FSEL 3 | X4 */
> -			   <MX91_PAD_SD1_DATA0__USDHC1_DATA0		0x4000119e>,
> -			   <MX91_PAD_SD1_DATA1__USDHC1_DATA1		0x4000119e>,
> -			   <MX91_PAD_SD1_DATA2__USDHC1_DATA2		0x4000119e>,
> -			   <MX91_PAD_SD1_DATA3__USDHC1_DATA3		0x4000119e>,
> -			   <MX91_PAD_SD1_DATA4__USDHC1_DATA4		0x4000119e>,
> -			   <MX91_PAD_SD1_DATA5__USDHC1_DATA5		0x4000119e>,
> -			   <MX91_PAD_SD1_DATA6__USDHC1_DATA6		0x4000119e>,
> -			   <MX91_PAD_SD1_DATA7__USDHC1_DATA7		0x4000119e>;
> +			   <MX91_PAD_SD1_DATA0__USDHC1_DATA0		0x4000139e>,
> +			   <MX91_PAD_SD1_DATA1__USDHC1_DATA1		0x4000139e>,
> +			   <MX91_PAD_SD1_DATA2__USDHC1_DATA2		0x4000139e>,
> +			   <MX91_PAD_SD1_DATA3__USDHC1_DATA3		0x4000139e>,
> +			   <MX91_PAD_SD1_DATA4__USDHC1_DATA4		0x4000139e>,
> +			   <MX91_PAD_SD1_DATA5__USDHC1_DATA5		0x4000139e>,
> +			   <MX91_PAD_SD1_DATA6__USDHC1_DATA6		0x4000139e>,
> +			   <MX91_PAD_SD1_DATA7__USDHC1_DATA7		0x4000139e>;
>  	};
>
>  	pinctrl_wdog: wdoggrp {
> --
> 2.43.0
>
