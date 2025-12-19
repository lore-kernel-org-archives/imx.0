Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DB8BEC
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 02:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766110748; cv=fail; b=tlsCGEH9QC6lP/PacV3/UopCDp97+WPt2l+vu30T9S0W2RIZi6uW4niQ3ygeETDzgymcfhU9vWYRPjJlhfz1PKFiXMyXazyDfQWNIJY8ObqgcGt2ALxbzSnnlGMiG7YGXcXzhrxi72H4PIJc9psFrDjgzJVRPGzAFp/5JgyWIB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766110748; c=relaxed/simple;
	bh=PK9U0bZpV1eVMACSx6KqnK4elqBLgW6SC39XpRVHP14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rySrv2pZgtN/1K/CE02GUyFBorQwubdO9inQHT90HGg/6R38ZkkwuoqqRzQYwGFoVk28EM6LD8n3X2veoNAKrmZyAcrBE5VeCRkXi7JYH41lrFZggPilmLoC5yPQAWYEuYE11IXfaxadfjbeS8vErNRwRGWrymHUmortEp+Dy9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DkhheTI9; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DkhheTI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQ93gQx+Qmt+hUUN+MQT7/iTVaHFMBgTRhG3K5g0FKT/kz88mwJ0x9wX713ZniZpkzKTKza/l8qejOaFauQKMAZg4YepROsEa791MCzRtmDAyyxKx1zAEMJMlRpk1gOzPn25MOCnVKDpE/GLmtfq4R5FNxfmFUeFrsK/zpPUluNY3UibVDilkfG1Mu1IGVIpXS5CAmSbbazXnBU2PShNmDwtSjT4CyI8cKarcMoFAW9CmZ4/7YMN8YnZY8VCz/gyY+OtRdBgIYlq89U5VF8Z+vDgYXAn/wsLARLru+8ZTM5XAC7FONaGxdUuR8hJVv3R0FTRdjeb+nzLjsRbMFEMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/Nqzp0eiS5g+tk7eFb0G45iS35T1p/vS1mgpqrxHXE=;
 b=VHfkP7qGRnEq5fYTBzLiZYw6JVShEzHNMybnoc5aNwKsdMMjzn6L8MQIWZFASocwYfkNwLU5GDuTltQJtPZQH0nECBGlRT5/PMGCTrzkmwyrA1PRILuAFt0iBR0dnYcOrVUwvgfeuf4GYsSW7TlIBT9wRL+BVN3TgDqz1u16Im3soQVbj26737ScWU+ei572mfMxMqwlR6jaISHsLSihw9vFQVOwLUKBqdKi+GSHXIw5Id9zdMA3O3Jo4At7VZeRKHkyzrHHS7KycvxWzhKYdGArA8TIhQrcFj8hkx5dmIE92vCABf1c/fX4vMJDNA6SRvFxdPVJTSTvgMpN8JE27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/Nqzp0eiS5g+tk7eFb0G45iS35T1p/vS1mgpqrxHXE=;
 b=DkhheTI9KzAHSnI+i1Bvm9k+NFG4yxTXhRsVwu+x2Acvb+Ak0wLiVFScDvTqj84zoBhoC/t3irWK1WmQhTZ67TXmW8zkff+Jx0Du38jJvpKbvLuiwkndThJl3KzT3q6FWBCYnHi3ltn7MJsfsBVBkpUADcKRoEYPi+oys0DcGL3gXt7kp4J/rVyWSD9lqRvsGvH6g8ib0pyOtPy5zbpVaCsKWCgASGe/OzADOjd80TAYBN9THtx8LjZIpgtZTEYdUJUKtlr8gE6rPI8B+rpkm7mlJOYv8sKkXEl6DtOWu7e+XLGf5vNsEZQ6s2BCw5S5kiJrw9VJUzANSuPUW9BR+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 02:19:03 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 02:19:03 +0000
Date: Fri, 19 Dec 2025 10:11:57 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, j.zink@pengutronix.de, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com, Frank.Li@nxp.com, haibo.chen@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, Stefano Radaelli <stefano.r@variscite.com>, 
	Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL
 field before using it
Message-ID: <fljc2bb4oa37pvac3iudgkjkhx7yqotu57w5aoltyniddcvxnn@qajd24gc6f36>
References: <20251218194100.365269-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218194100.365269-1-stefano.r@variscite.com>
X-ClientProxiedBy: SG2PR06CA0248.apcprd06.prod.outlook.com
 (2603:1096:4:ac::32) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d58a24-349d-4de3-fb24-08de3ea4fa50
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?1vEEp+/8T9napGM7AkS+3AMjGJ8F+yKFpLRNIt1juomoThdow5dw2adI/9Nv?=
 =?us-ascii?Q?UWkXKwg9JjMu+KbbxXO/xf8xV/BHz2uZz9223t3anareIU0sHVloYaBqbeMZ?=
 =?us-ascii?Q?EmQNMfcY8BqU3qkw1d+u0FVYVzil702A+cwkNG0RbS4ckL5qwFfdhl3pE95z?=
 =?us-ascii?Q?tWzlrGyrMs5KezMrYv8I0baex2btYzBiJGPH/VyGm16btSTGEIJaClg3SXZt?=
 =?us-ascii?Q?Iz664FkzWZqwpAZA5IC8kk1XGyOwleOm4zXSWjwNCk/b2WCmFBDIAkkfwna4?=
 =?us-ascii?Q?o1CWGqJA86h1vk9Ed697DahUoPqqbxJ48QJ7CmInX1fzsCY2uky9uRZeE2BR?=
 =?us-ascii?Q?1IHJqEl1gAyuB8vdbMqLH9XMUn7P79arexr3zzrxufAvHwEHsnqpTN+GDoIs?=
 =?us-ascii?Q?yty1ijMWRO4EEyaUSr18zvoGi1qzRQeQDuLch8ZkV68nZmg+kl/e+wnoQkul?=
 =?us-ascii?Q?/yZkNtENgubJJYgTasNeV1f8Iyik7NyJyHdfvwI4FyYtRj9vPJQ7CYWiHayN?=
 =?us-ascii?Q?/OC4Z44aAEyJWHvZwqF/fvYlQK4tl0PLgkWu/kCDP0FR54DZlyEFWJSliH+z?=
 =?us-ascii?Q?3rP5WyK66328rluvTcFBgnCEfducLvTiszuiPO7hgNBmmeUHYUHGdMYog39E?=
 =?us-ascii?Q?T+hhAtB3s9yXRGL+SwHVR8yIC7aPp1qFul1nXYdITYtH6oJw7+LctP43UNNS?=
 =?us-ascii?Q?4sKwHd7CxTAtUQ06jTi54gCcnzY4mIz+v3YzVOmLojLFHGqIi5IM6AjRJWbM?=
 =?us-ascii?Q?xv4YZqN0VzKXeVoDD/2f9XFLhRyD15UyGEzzhg4oqHcVnlg2U0ZXeF0bkDEC?=
 =?us-ascii?Q?YEbqrRMKrDxkC6TJfgrqzvrPoB9a2P7kO7lr2ZhksJ2645XOJR0QtweFFSXH?=
 =?us-ascii?Q?/emJr8nAKt1fydLLQU1gru+eesVcPuuxlrMawxKRV7TAjfWkWtO8skopQ0a3?=
 =?us-ascii?Q?ntLd4JklXDa3gImsVyyIjL85BsCBVbWFpEeWcWUVlK5J6dwO77ZU78GaEezD?=
 =?us-ascii?Q?JVzjwdmClq79YF24dtbVJ4UQ9QGgM2RO7exT6acBTov8Zs5PNlkN+B66cph3?=
 =?us-ascii?Q?O7JQVvnk+XjKNhTblEHZEj+br/kQSK8Pz7ZWk3om9lWtmez4UfyKCiZKGOMz?=
 =?us-ascii?Q?8wW8fMCJ/lJ4AyxfaXQzLPBtGP1CTP4kN8KvIWr8Oczc7TlIBHVPiD0WELcL?=
 =?us-ascii?Q?sOqcay5W8YLmo1xRKYBKSOEQRYqA7gXe0UzeI4R/YwJh/ovrCu6mF39qNifr?=
 =?us-ascii?Q?3DGldBip/f05Nu00H65yvIe56wGIUKnoCctZrjD7t8N88wTmnq51/2ZiNdXt?=
 =?us-ascii?Q?TYQbhU2k2w0tp2jhgwNIHAkdfxKBYXBgI83OFBVWL6EzElyBU/GVDzGp1piM?=
 =?us-ascii?Q?TLh1I8EYF48884S7JM262dHFkeCSc50Cmuww6Vmppu5gCVpViV71QqwAJUfu?=
 =?us-ascii?Q?/xmIJSsNlZFip8x4pTloepglIe3dti8A595yjhkwG/ysNXXzDYPyIgUKo5xA?=
 =?us-ascii?Q?7Hm3MA7NhYyi101Jft5lbk2k7feLrrqBzNZy?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rAloRIml+L+cdIhgKRc33q/IbMzIXWQ4H7bA4t0rYdAZAu/jL8je3WFCdy8k?=
 =?us-ascii?Q?/YY/V673peTbE2rreyQIzyeHulxkich9fupGSRTwjYOx/QFhd0Woh51WP6jZ?=
 =?us-ascii?Q?1A4lqq6JI3d9RCJQ86b+wgWd2MwdrN2l7yABJPUPoc75CnFed7TIrTbAvDYc?=
 =?us-ascii?Q?GlmuLcGUxqPsfB44elXJJr1ThjD187f7M3ei+Q81/yGrnEidcUlilmLVSSdl?=
 =?us-ascii?Q?u7lr5a9ieRPDmUzThVm+cYe2WvvfvxCasHMVGWbRXg4WENwkmWlOEB2Yj1D9?=
 =?us-ascii?Q?x56ddNcapzgrsJgD5LX5N109Xj4U20CZCrFkzXBEZsK+6Bvj8mEi61AGsj7e?=
 =?us-ascii?Q?Xs+g8wMajFhCDzW755m1QqMTskNqOEkK69vI4n9fy1aLW6+gkfEuRBbWaYfP?=
 =?us-ascii?Q?//R41/h9dgXUqOAurmDrIgXA9Z5XYS2sbA521wS8NYZboTtyKAd/xd4+K7xV?=
 =?us-ascii?Q?1wpvQ8OaF4D1hNYoiC8I9sRF6iS1itZlUvBeI4ye0Vp6WEp44FDK5OiPGOvq?=
 =?us-ascii?Q?cUBvH3FomJ6NC5YnBKWqYr1+jOD/Os4teB8TKJutBbEN2Or/gEI0gDN3qxX0?=
 =?us-ascii?Q?/yNG05m20VnX1UPaPxpP0fq2Cz01TNmY849j8byv+RHupHBPVjF2D5QnoKj3?=
 =?us-ascii?Q?MN163du2DT+2vk6nPGAafCgd7rsOiygu958J5XhMEVjWmGTleTJUqVCjTtU9?=
 =?us-ascii?Q?UUD7xDXMSko4SKfXdsTkUCJcisCU2YNmgs8sJoEzu6Jjhtrzo0c8Oc0qDzPB?=
 =?us-ascii?Q?+qhYKcPv4S3ViYMUtNkC+HtNQdrW5ksQzsyNG5L+t5Jl1Cq2yGJvDqG+UC/E?=
 =?us-ascii?Q?WW/+HPvTSbHuep3IG/nbNb7IT/+uHy1qzecQgQHXwNwYtR0r//Rwx3NlvMlb?=
 =?us-ascii?Q?oRvp9pgMVkn6kCwe74UzvrQp/UwvbDEi9mpbM0Ry2Tzy0vMtz/kGw1HD0g4d?=
 =?us-ascii?Q?YLXRLs2ym9Szuf8/Plw2dwiQk+nDoXVHbRs85jIs6dYFp4cgnTDyoAYC3xLN?=
 =?us-ascii?Q?0RO0lyhFZ2ZM11s5bsbhsQ1fI2ujWhU78hIGNusZNHz7xA9fp3X/0cK5tyZI?=
 =?us-ascii?Q?HsxatqqK3LjMNRZKkvbntQbB6VLwFEucbxNxAvOdCd/PMFTDFQUvVEtX25qq?=
 =?us-ascii?Q?71Nc4bfyjaMih9nBo7GfgZuWmsLiK6J2Mc+Tx/Z5ZZQvIgV+mCsbfl2Ykphe?=
 =?us-ascii?Q?qEtWWxig/x5WhDt2mIP9aqTQ+DWLmgBBOhJ3Xr9KnQYAv2BGf0WKG2ePWU2Y?=
 =?us-ascii?Q?Qv5olXK0ZNEJnicR6WcXmW0fmtUKIttqWJ3Is4rbKCd6hoN6ABVmfT3goBhZ?=
 =?us-ascii?Q?FhS4iNTEowf94dilVIegwREEF9abiutVFsphXzMg5ndPIZfwWCA9/zj4KCiV?=
 =?us-ascii?Q?kVLlHH7EyP+T47ag5woDI2KzMWfWOka9MEv8keLFpdECBfD3+YcvvLAjOeS5?=
 =?us-ascii?Q?2kTcYFluQnJxUYXa7MpuycgpxyhJkGaB0TnDjoR1wfj6ojEn8eOJUjbUalBX?=
 =?us-ascii?Q?4UkTTu/irjG/NodcYI3tmxgYcu1jE1fjZuQ4x1l3oOlLJbv8oPYfeKJPszzU?=
 =?us-ascii?Q?DU/w1St97ZMvDT+t0poeQMgJv6vF3IETvCmfeolF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d58a24-349d-4de3-fb24-08de3ea4fa50
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 02:19:03.1044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCAGMHum+6OClY5h9IfQkyWyA+DfrHiH7ur8gbQy3o3cOCTEQQoJY3Vgr28FQDuDVrAV41yZ+khsDWB00uvfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212

On Thu, Dec 18, 2025 at 08:41:00PM +0100, Stefano Radaelli wrote:
> Clear the PCS_TX_SWING_FULL field mask before setting the new value
> in PHY_CTRL5 register. Without clearing the mask first, the OR operation
> could leave previously set bits, resulting in incorrect
> register configuration.
> 
> Fixes: 63c85ad0cd81 ("phy: fsl-imx8mp-usb: add support for phy tuning")
> Suggested-by: Pierluigi Passaro <pierluigi.p@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v2:
> - Improved commit subject as suggested by Fabio Estevam
> 
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index ad8a55012e42..9458b6e5fcf4 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -504,6 +504,7 @@ static void imx8m_phy_tune(struct imx8mq_usb_phy *imx_phy)
>  
>  	if (imx_phy->pcs_tx_swing_full != PHY_TUNE_DEFAULT) {
>  		value = readl(imx_phy->base + PHY_CTRL5);
> +		value &= ~PHY_CTRL5_PCS_TX_SWING_FULL_MASK;
>  		value |= FIELD_PREP(PHY_CTRL5_PCS_TX_SWING_FULL_MASK,
>  				   imx_phy->pcs_tx_swing_full);
>  		writel(value, imx_phy->base + PHY_CTRL5);


Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

