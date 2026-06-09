Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E749253F
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020291; cv=fail; b=O0mgxnAQrZik9e1f+zy7yn+Tor78uumCG3vlIv2OoX615o1TZY1a+vXlgS0AARov/pyTqVGspiKQkMRd7X4PnaSgr5I6i0t6n9bKZg3kag7qyPl6zxqT981WDCNeZG8omCnSMMiclNb4U+CLKDqMOSDCuKSY4e8SNFjpwsBCBak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020291; c=relaxed/simple;
	bh=86ZRsdQVuInXvb7b9yOHhHRAZdFJNiFMpllYP9aesuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PdzQF96DVv41dZnFWMGNb8a+2uw24q5ht/klICwmq3EsRIdhbhLVJKf9SafLLCCNWGQYsyUpKbKAv+TrfNgvibRIgARZIigVZ2oJ8Z2WMleogVHYirlxqirGnF6hc21Ut2xOz0RFBSlWbk0FcB5CleWX48uEbepamcJBZGwLGvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XYhIm6Cx; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XYhIm6Cx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry5tKb/qX7yewyURUjq4r7efC7rFSgS6vAPGA5yKj4VzSM8FlXV24Hd99JqXTQTPc0TgfdD7ky6z2dUDKsGa2UwUcx845fnbDL9haDSo/QbPadsEexev3caanfl+larZ3IT9NNymXTfShXPKtd8coj3dPOfBtIbLztHpfabOhVLIwBuEK9Z104geLxVxIReqvXCYCbQfwzpV9Ym13xXH2d7+t0IxnbnsEt8BxX7K0+4xwPf1khCs4a9KSKCog+9Vy5qRayozpv4Px/xgvfHpN0KhEFCT/1HZRrnc7eIsU/ur+xVEAhXZS7NXwfcTpv3bfISsrrl74zI3Cji095PBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlkII0+y7UAWLmvYwjA0e1reKGFwmQRmP1cqgGQR/aY=;
 b=CMQrKGYkpil4HsTrgqO2xqOPd6fvyUF1tnKoJKT35tL8j6Nm1Eh6wiCifezYzYabTmT8RY3ZEFxK4Azvg6/zo9bOT71AYbl66xWKRDqV3iKZ7VLhNPxQdvDFb2o91cD3AYw5n8ayLaXSniUZ/W0M9jUv3s29Vl6KEy4sz/EvsDYUsA19/CAJR/CmfbKpCT9VJMNNUL4Ynq8IuO6+p1jMlgv2fgZw0hsmR78/vnC9DmS802RUCDZpUm8OTZoFEdcVlIH4aMTDWt/jnsIcBYVO2GADQBt5w9Mwyuqj651jWIms4F/q4JhyUbC+BRPaYCZ7f4CFHUx/mDHpwqcBRbgUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlkII0+y7UAWLmvYwjA0e1reKGFwmQRmP1cqgGQR/aY=;
 b=XYhIm6CxkkHEWi7PqzUg/oAmsopRYR2GatoYPrpP8t/6pDZE57lP4gFy/s0oWMAplwq8xoRid/K77x82zmKGoeLPOIdhV4QFgEwQhvHJD7xQSWb93lNtn9woO4hvZcR02oqfzk/RNwH5ChZlYvTIo19Copv+USYlPZF5k8NXWgZokt+7w2Npp6glxjp+9tzDoXMmo/W+1LJ6oqMdLdDLE+SShXCrbUk+Gi1XkKT3mCFDn4ojJNh5Fv4hBovIAPX0hYKSYimgdupjKlpSoS8BWM49lgIPU3rszIsGl4UC9pPnYD7Dc7Nk/bnDJSRkkxU2GZrxvS+iYRxpsmX/4lL2Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 15:51:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:51:25 +0000
Date: Tue, 9 Jun 2026 10:51:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] phy: freescale: phy-fsl-imx8qm-lvds-phy: Use synchronous
 PM runtime put in reset
Message-ID: <aig2dCc6-jSlHiLo@SMW015318>
References: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
X-ClientProxiedBy: SN7PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:806:121::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 418b1138-398c-4c2e-4efe-08dec63ef637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4I/xmbk6ZKVQnZK22R+nL++3L8VABk+rHL12mdJ0mizED4DAXui7iQOEgnN1CeuLF4Vl7XRGHyqPe3pu9zdDmc2pCJ2mHO72+WSOpHpiEx7l443x+AFTevnMjtRbmY4H3hG8CeoIGjj3cAoP+c8/1BRCKjLQUyeeWYdgNXirPNdc6PG0IX8NObKJwbg5ntb7SQBg2CLF3GRGrXkHWh4h0foEE9Wnc0W//z0aaDB6+T6uc9eN/JYaKihKajiyuzBWknzVKo7lXJhME8z4Ncnt12+BJ5DCxM9LkE1WIJrPBdV8zpqijdHmaHlm72J8u3qofagk+BddtI/6b/HNKITi63ettc+iK8ORt8/tZMgvTOJxmJZHEn9Nop/L6Hi1t8Y/Cilt00NIfjJ9rTDqqmAQOFeJBU/uqPACWW805eR/bw9HWRPgzuJsSTdXarNYUdwzSorUuu4Qc89Ln1BTnDW9C4dZpKA2AeIoIovwan6CeleH4pB6EAzq1DCby5rgf1REYAZIJxFPIdOYloJKm6/dcBsGGllEQMEJBgfCzwaNn6u2ndEgpDxOs4gZS0I1tlg9roLDKAP1zvkUXCXnUf6pHSCjx23NYWBrwWpjDSRum5V756KWYkpn+FUakQ6FSW9Npn/FZHLBOMq4TgL6sM9Yxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qUwp/ICf3gn+kb6VSMriBR4p9RbB7N/7N9PSetndh3xMFPCVE0ZFRJeHnZWC?=
 =?us-ascii?Q?fRpefELqygKFWgiPXARaxprCvvxZ4qaEC1Kyp5fiT0Yx1TEViIbKyQ7+kXiu?=
 =?us-ascii?Q?rhw/LO7z11i/AVPnyomODWPAkEkuHYMf9Yk9IViGVJLcjcHu1GaojHSWpLSl?=
 =?us-ascii?Q?KMpCBQam0nAD2u6H/cRmtYNez/M2aBeKPzahTYWZhlXJ+LII9Xr1fGqPDnE8?=
 =?us-ascii?Q?Nkq+ve8WeRamfAX6kYFvb5kirYswvAxlgKQFymKDFdCFt2nk/9FGPBD15wsU?=
 =?us-ascii?Q?YFlrHLoCjveofBx3xhvejgBoHTQ0njD2KVyy+lcFpFLTyuVhjbwkCBM28o4+?=
 =?us-ascii?Q?+/gwIA0w7zDKBY+O0EMWDXrHS3ZFdz4eNjvoq2NlTDhqePtntPFQWgoG2p/F?=
 =?us-ascii?Q?epUC0JBXvR+OEiaG0LSdN0nPHoTQxbCNMKZUurfOSHR13yMp5K5NtCf//w30?=
 =?us-ascii?Q?avTQuRkwmvSZUf5DNuSjV010+dLRuHMGEtrgVglEY3kdFg9vu7L5cxXYhT8r?=
 =?us-ascii?Q?FXm8zaG6x9Y4wAdBz+Q51XxL17Ps5ETiP39/CXHeP3bpaHcu26OPTkrIdS+z?=
 =?us-ascii?Q?7YhuxKLuDxbPVlk/dJmXGHbAJ6z4BgZ9pBT9AZ6EPcoXzIXFyL5lJtkRfqK1?=
 =?us-ascii?Q?TP3vh0dDl46UdQOUDadyjOpBqJdtvPys9b0P7dKSoqBF51+sY//iOydCb/IN?=
 =?us-ascii?Q?CAG83OCxc19AqgdiKwTn/yHrUvWUv3ywb7o9BkM+zZ9iS3/9X/DgWdeOq43C?=
 =?us-ascii?Q?+XOoQFszT9u9GHZ4S4+Td0kWUe8UA+/iNDsX6Tc3C0DlBdy3ie/mmHgIf3xP?=
 =?us-ascii?Q?jpc5lltmGysecEE4Qd/VkuezIJG2D5EbmJorjYXi0nfhVjlLFJ/Vof8DkrVC?=
 =?us-ascii?Q?wxH2D62pQuClGQEjw8oNk2kHdjrXUuI94RLxOErrAQkzhMLvC2yTYEmZ3g6I?=
 =?us-ascii?Q?fWU/wdxPH9oXSUt01ivznzlcLdjYDMlGhv6OUFw6EITn8+LFLH9bfkE1IeG/?=
 =?us-ascii?Q?4pJzzDxhP76m9UDdkGIynnP6aoVSiCM3W8MTd2NGM9tu8KQFE75dhfF3yVFG?=
 =?us-ascii?Q?uwoU97PoRkLA7FPAx54DIOzuTGYIFu2vRz5MOmWxeAy+1nh+zOf7Dj0eV6sx?=
 =?us-ascii?Q?WVpvdBodye3dZAnp8uEYcTU1GaLu58qDFdD32H/aTuXYw3WX60C4JBpzaMu6?=
 =?us-ascii?Q?X3WBBVN9HNUIv9+PNarS2/Hg3Pvte7DIfrmhY6wGfu3tzwppgnuR3ASHim6A?=
 =?us-ascii?Q?ZuP0QrVNMtPjpYQH5sqGLcPo8AyKW2VMpcUu+GMs7DjB3MZzE4+KY3Jm/uMp?=
 =?us-ascii?Q?JXMK81As1SKk3zqn1R9AA/TXuNuu5BfVzUt4TgAobmuSKWoh5MEFQOZRCQEs?=
 =?us-ascii?Q?vCez3AmRdeuKLqbpihftZYCm9OddMiti9l4B6ocYlbPzortv+DT05llY2s7E?=
 =?us-ascii?Q?gNLfYKyevcbv5+Us+Hjzje9LUwD3DxOYireXlkfqawCmjUAoDx0XRfiGuYMj?=
 =?us-ascii?Q?NPGJe0BkgYcTigXueyAkeVGc5uoABt8BxurF0G9ZO4gJd8QS+DA7JxRYov9y?=
 =?us-ascii?Q?o1p2HQvADiTEDmKfum0hCspwatSTUqwU9wFfeJTaMEc9ZEyBNdRLCQn1r2ym?=
 =?us-ascii?Q?Dt0YELCrK/QV34kL48tPjwFPUvZtWq1avROaOa24egjaX9kEdASshVJH2cq2?=
 =?us-ascii?Q?RmMQ45dqWT6BDkyOM7/1ne75l+Xu5bct4TsxMevknk4/wKQldXb6jv8HHN0N?=
 =?us-ascii?Q?KoBBAn/WcrS9i5//cTyBTeA+/QOkSPkIiRv7IwrZuBzs9tvRMkwS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418b1138-398c-4c2e-4efe-08dec63ef637
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:51:25.7685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wfg85Kjqs2pAXO5xuXR2MKQoYz9ds6+JrLC09wNZyhb2Wj//ml1a4KD37N585ePJYCUir78z2i8YZnceth6RcT7jVQNLRfGpA8qnR/VLML/uf5I4oqB+7RM5yk9KYkNV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541

On Tue, Jun 09, 2026 at 10:48:50PM +0800, Felix Gu wrote:
>
> The mixel_lvds_phy_reset() function pairs pm_runtime_resume_and_get()
> with pm_runtime_put(). The asynchronous variant queues a work item
> to handle the idle check and potential suspend, which can be cancelled
> by a subsequent pm_runtime_disable() call if probe fails after the reset.
>
> Switch to pm_runtime_put_sync() to run the idle check and suspend
> synchronously.
>
> Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
> Reported-by: sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260605-lvds-v2-1-3ce7539d1104%40gmail.com
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
> index ece357443521..e2a1645000ae 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
> @@ -286,7 +286,7 @@ static int mixel_lvds_phy_reset(struct device *dev)
>
>         regmap_write(priv->regmap, PHY_CTRL, CTRL_RESET_VAL);
>
> -       pm_runtime_put(dev);
> +       pm_runtime_put_sync(dev);
>
>         return 0;
>  }
>
> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260609-lvds-phy-6328389a2cf1
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>
>
