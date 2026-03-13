Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013044.outbound.protection.outlook.com [52.101.83.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD0346AD4
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 19:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773429695; cv=fail; b=IgK+uasUI6KOlmD7Vy3sjVY+z0J/J3ZLEIQcuKWxNrhW2sahw3kl9KoB35OXVX1pYn3ph+FuhqNfMHrRYUGutglJt+IRGyqInE+r1UV7DCWj9Vm4RCutSb6yl8rqMZBt9qNDp5zZhad80ceC6uO8TEs1LsRL87grIQHRNsXBnpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773429695; c=relaxed/simple;
	bh=UfZyiPYt13vVYSAnScNwMhjUQEjYx4zWNZh2fus2XZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QwoJhYarr/olagv9rcEzZOA7H54g8lvKTWxWiKy21jv6coOuPD3rGDg0Q8FergqR/PZm/Uqdwa9gPBh7yGQrKS4cebwuYKR6BNHeQ3mgBqmBEbhnhKztGtIEhMybS+z3CIIuj1PZTYX/ZXkztqDson2zSNm9M1H0gnSKfxY1mOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AsS5B+AD; arc=fail smtp.client-ip=52.101.83.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AsS5B+AD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8N6R8y4BIuPVdlWhDhJbSryikYvR/sCVuiGvOR7aKuyg9nDnwpZdOzSIBTE06ZXAYF/dAeGZOPLka4LsiXa8Ijo/RFUWWRKqBpbUQlHeHBcZVPi3abZrX3d6fsbSAclTgVwSbp3B1aW9qj9t/YRib11ohf2oeHoFUs3zQWWu4kkNsb4YpFnlYyNS0Q0xY0K8SuLJn4UbICx15W4lV42p9Tte+hWYnJD7tuE4bAm6Ss1UxUhTDUAkNrqNYuaJ0Q6yeKl+CIn88ZVmRFDESI1aGSJQW2pN/jFFk7RZomH2SDbBo1LQFCYG/ghfRVgPyzT9ZYdpLwlI1PZ18sysBDEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyJrxwpQgGSd4AD4XIZv9wN7m39/ef8372tzlgHM+dM=;
 b=puGZn5h/B8mRNef6GLIV8Wwcm818pvm1rNj8/IdwyJGUOZyX/AqfeMU0soaGJMQ59oRhO2mMo+KtVCJob32FpvqVzzLmT4O5krqrWeby8t2eA4DJtrpxPzpqlIYJdLuRlwzJBDjQArtMhrDuip+ldl3nVoJK/4NS3Xbu74kPaI89EsTgSb+QrCykqswXtmEfVtCMkoebU87i075e/gjdqwYo51gxu0zLKMjcOTr/gazMV/EZcPu2927sTdzZy4hZrhHcOV37xYPRr7sWTefKDX6gad/UOhPz0IqkiMqZuYxY6PjezvYE3NeUwu4URKw9ug5rdui2LbdikeeWPFDj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyJrxwpQgGSd4AD4XIZv9wN7m39/ef8372tzlgHM+dM=;
 b=AsS5B+ADO23wz4z5MDe7Y0gBKwQylWCKI9FKZxC0xqCgswKxYoUumIn3Qc/j7wzn8McNZMx7n85kPEvm7VXi8EikDFJ7U5ZKKw/Zd+iKAHSmrnbRhPMPEMOvPHsu5BiR4Iq98oVrdyxhMdUiFtMHQBs4daNQvQiNTWXP3n9RnHQ42YejXvPc9Yzm+4Ip/eK8ATdqcrXfw7x1/kTzAwdRru480X9cBeHFG7VAw3qSqDc+5AyDC3qK8MFpO+ikukmqOjXelPQpb/GqRJe8+0S13qpPN1HbBkx9EaS38vpTzdGNYTnKtPDd2Homdh47K+3zgPBrCR9SJ/9i7mX6YSgQtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7545.eurprd04.prod.outlook.com (2603:10a6:10:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:21:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 19:21:27 +0000
Date: Fri, 13 Mar 2026 15:21:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 3/3] arm64: dts: freescale: tqma8mqnl-mba8mx: Add
 dual-channel LVDS overlay
Message-ID: <abRjsnYJ2g2iLzON@lizhi-Precision-Tower-5810>
References: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
 <20260313113422.1722787-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313113422.1722787-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH7PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:510:339::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d29779a-1779-4a5a-becb-08de8135b8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|19092799006|38350700014|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	JDQEvleStaTZSSmNVekDUa1mjzLGJyaj4uBH8mm8ssAHYo/Lmcyslu88Uv6nuceQJNAIWfMBTqMmGJNNV4CRql9GdlyH77buNSPkRxumm0kaMZA8+oxOpx0+8q1eyOtsr4qRPwLgs0UmJEvho7gFIQ4V57ZsfyjEoIEqW23eQsPxUriTMNqvoI2SLBh6IBJSEBU9XimbzwP2rxsSDLtq70hUq5aUtl5zZZiBqp6ohYgxwkLGxtRxdf9dfP4RwvoPX9amtO/nwr6Ri2t9pzxOFB9oCADjvKINN/3KyV0cEgou22+DcGRYkzv5WGO4OIeAr05rzlB76Y5tPXAIg+DnZGI/ZTbtsProigTf8wbhFY6mzHqUby/EaT8FYG4voq274jBS1gbPb9BQJ59qEZ/NIS/480Ifyd5T0jo1ZvZtsOaJV9X3pC8F7HMNzGgSfSLviS8NslIo7ios8UOlppTrZoTVrkX0G7EzAkiJNUnAvOOrJVUGysJYurVLg0iV4wBm+kk0pE3mEpopwP48D4ssAiQt/lxJqWvrWO06XnNxGPVcL75DDTfqPEJISSRrHFkNd4k5XLZkcB69Wv0FbrfQ/8CVohKK0tkbmgsSATvQHQ3XZ0/uiIMG0DElNsjJn3Jh5D8YAdP2KpIyB8Iapg2rpqmGBaAMh1yQKUWnKAfeDlIEAbCxvfQIhaTVr45xr8PkZKxNaHqs4Ke1NnxWFXciiWXOgUVWfW2jOSLojKCohTjuxpKdbVKUaDDP1vRYziHKi6XGh862EyKANEgU+6t8C+hsgr+HFSk8lqJ0VrsLMIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J4FNKfjo1zjnmaUo+6ZD8fT3MRTlfybD8uwl0P3QRSpKUYlbYF89+ZzmSEt4?=
 =?us-ascii?Q?ENEVUFSH+zOrHA9xrxtHesiPSea0/7yJb7OJIMeCwq8UAB3ARy2F1885NEz9?=
 =?us-ascii?Q?pdjSVUFxmfjexHLEWA2FLYaERUSiEZ4lDU2NsMHroaVDopKPcfYze8j9Zd5K?=
 =?us-ascii?Q?r6YyRJxnRuQ5v4V7+3uR59KrCpWxy0AzM1rfkYiouDP2avJzK7lgcHd8NEr7?=
 =?us-ascii?Q?Um2AR/qFyLH8reiQc/wnIOptr3aaPEVbVQUeGDHBP9b2ye+Aler6XiaqvJBl?=
 =?us-ascii?Q?jxlRFbaRyfZ47a+CS3YgwfZEezxycexw46eCx+uCDJHC4W+Wwf96VGnbTq1Q?=
 =?us-ascii?Q?ktgF4EemzO5yf8g03wrEdymzB7m2joT1DFVGKHbqVEtcS4E8uXkyxssXQJjF?=
 =?us-ascii?Q?W7dI8q3w4/9KiYQEr3Y3Bo0UX5SjejOWXxnPiIBde9JeGyporiWRdPDLiypt?=
 =?us-ascii?Q?C5pV7Typ2Df8bg2fK0A8Z2L3NzDqdVUHPb7qarhK+a9u7KvqNmPG6bALsbl2?=
 =?us-ascii?Q?cVrkwwuY8VJsIC3MfzMHBsT+WXcNsl+NRkHRxp5O1pC+RGTJcDDZa0QvaMpn?=
 =?us-ascii?Q?28DHwILUY0+m13LYPygYd9ZnXijgoHjBMZGDYqjLmEKgUQ7G3xaSwbDHOBXC?=
 =?us-ascii?Q?YtxQR26a/zE/v5ntc6BVoJLbZm2qnx9VavUp70WHsGbtdTVGIS/QB9iwT9r/?=
 =?us-ascii?Q?UVEv6iVj8UsiVwPMznwS6T+LKmS5cMYWUbhi/Ae/IFEgIcimbP1LwgTLch9x?=
 =?us-ascii?Q?wsc1Thl3v6qBESwb29lPEm9Ea4M9MKTwfOHuYbNhhKwNOuRvbHgqISNJIKfz?=
 =?us-ascii?Q?+2c4D3m6F+oVlTM5qoDjNFpcTVi0XQSdbp/Py5gJYrd7U+B6FfqUafFotesm?=
 =?us-ascii?Q?Ctpe+KaAvnEzJnl3jBjPYAhAAMGw/Dls9mK8mFSpS4inaF90dPTOTCQbFJ/9?=
 =?us-ascii?Q?FMlZLWh81PdEydKkYaBQPgI332jPFk0FkT3bZqRCcAxo7n7vRVPM0mbUaVo8?=
 =?us-ascii?Q?/3RYfXDyeb/EcqXxBYvQO4J7f3J890ZRtDIP5fO22hC9STNA7Z2AB7AJm9n/?=
 =?us-ascii?Q?zjMQiNtTULRr5cUFubdaAmgUiaODORUO2X1ICWofy1iDHjlxtHhfHNq6AF9X?=
 =?us-ascii?Q?7TX5pIokXqE+Sx4CkQ94DZ+vaO2XKmSzao9hf7MDUNXa2p+d0yoQka3Z9BHu?=
 =?us-ascii?Q?oG4tb4PoeUYyOqr25QbrMLD87G+uibCaEPXOjqxISHyCkrUZFCW326GhM1e2?=
 =?us-ascii?Q?Gz8PvK5vxeQsj35NrLJ3Cbqia6j7dF0BorJRaZp7QvthQTjgyL6vnydHBGsE?=
 =?us-ascii?Q?Oag+TcmL0SAVjaXP7/TMflCexDMCgikCcIK+1bZuFIaaP3ETqrwCYwVEj7Jd?=
 =?us-ascii?Q?3UKQaZ2ZQXG9zex7Z7b17Cqdq87TvauEgGcHxcXI2gkKzudJzaDiHdVeUULr?=
 =?us-ascii?Q?BNSuNqiDhkQVV4Y/M0Qh94HSd/Jbw5jB27ANx2XFrVnk9fxEkopEmX4UFU+G?=
 =?us-ascii?Q?KFdY7QVvrOAsUsgoOA2Bs4iF5r9NBTecE9a4v4aZcCkjfDaCzySwCMyq4vKI?=
 =?us-ascii?Q?rZdRZOinpSs7nnBBaLB7zkLz57Yr2gyF5/pW+CnUGQ5uyHzrj7dKPlr6Lp52?=
 =?us-ascii?Q?ileOT02ibKg8w3MKHH/kSbkKryL3KyaNPJzJKy7p2DGZi7mL4VWCpecCsZlh?=
 =?us-ascii?Q?u+tW4lX8AMSVgaXQr/X14bFqCjil57ctXd0dZPR33dkL6CWM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d29779a-1779-4a5a-becb-08de8135b8dd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:21:27.0135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmIDRIkPIUUtPieK7rILOH0CatJzJhLzVtTEHFmJHQ/XFVutGL2jsT22XOqPdVOE1t2N+CV0AkOWIwP70VKziw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7545

On Fri, Mar 13, 2026 at 12:34:20PM +0100, Alexander Stein wrote:
> This adds an overlay for the supported LVDS display AUO G133HAN01.
> The same overlay as for TQMa8MxML can be applied.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Just change makefile, squash to previous patch.

Frank
>  arch/arm64/boot/dts/freescale/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f1b54f1b0a23a..18fe5134ff407 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -216,8 +216,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
>  			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtb \
>  			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
>
> +imx8mn-tqma8mqnl-mba8mx-lvds-g133han01-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
>  imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtbo
>  imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-usbotg.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-g133han01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-usbotg.dtb
>
> --
> 2.43.0
>
