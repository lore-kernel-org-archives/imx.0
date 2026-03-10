Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7847F302165
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155474; cv=fail; b=Qd31zQXSnFVlMEbuND0w8nh+34AD7oo89bwhaMxzQr6tSKQEphhIGwg0szleFMYvyUPF0ASsz4yr/v+/VsnWuXui6XVGkXHF7o+qxQbkOBmvX88PcZxLETGzDguuNtKvTJzqyFDhNxDpGu3HQ8LZNguq8O+NiW5vGgUECm4uZMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155474; c=relaxed/simple;
	bh=3qG5gyveFoMpB8enikbV7tUHm/Q0gY4yYcZNxUxyv0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xjx0/ZrlwwqR5pd3tgsKq7Aw69rSIxS+iU2OKPQ4rFW/Ukkj01ZTcnAFF9Y61njRRK+zzW8PYlOQBpd+D9nh5nUZnbwXJvt46MjtqLQUT9W8ZuaKAiLZRsJL66NzMHdj1t8EP4NILyE/XKppcAQuZ3qHulnjVF9LQAJsOYeLU+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g0cj9x77; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g0cj9x77"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO2mAbG54kiM+pjnR5mjTJLRqTeWJJVerTYT7vdzc4SPS92hiSWDfBu1vKLPoaIwwsOdTfbCGKd5i6YJTLX7AGsCFfuUzuYmN4UNVFbtzMF1D424sF2JgUhsKz5O1EGIq81SSrBvvRRlv0nu06vKYZoqfHwV9VlPcTSvSNBC5ub542358cs6l2OixuIhEPWs6TQetWiA5Nt8vCvxUD4QGjTfOaaiCFcW3BAkRkcAmVMv39Llt7Ei+SVyA0+zbZdBgZQFhT1RyQgSR8BXE2+XroTnkGyOSztBlR9DfcUC1mNwJjAgoCSxoTDuqvQexMJN8aVB9+8P8RCZFBh+qJmhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8zrucRjXOX0sMf5p9YPJrcjxd5xpjAvaUJpTbGaXao=;
 b=Wegm0D4iaTyIz3J20C6WkSAG3UP3qKb2ThSjqvVAFU0yzg5SeaeZoauZDwFZ6rjux7SlcmtFU3HjjkP4f3LH67as70XPqcmQmc3TaSGWC7kbmeo0Qu2PS4DXKK009hXTqatlucFHDfN9izUFnDSnpp7bOf43P0cu+KjsrpaEkAemzK7KEYYHFIM/ibUujqqITlI0bHHcqgoymniH+x4SwzutwLbjNUKPoWmwnxIPDPeRON4symJ9N6rHzzTrOhZKmkf+a1UPIC3h8NMLbWtKgWi1A0dY7bcMf/aTFmJpXfCL/mApwSR9cixF7+Ql4gMppNj+6jLhZgl1W9vHz+tilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8zrucRjXOX0sMf5p9YPJrcjxd5xpjAvaUJpTbGaXao=;
 b=g0cj9x77PHlx93kEzAEHbYBdiWvMMwq2hTG/j4i2gRYuUx2yFIzF+yWYSDUTEjAo2Q6xVVOe/ZpzYFlD4DNH1gK3TbIVF6ChnE72iTulTVoHdcOzKyTiX+fZ1cRP3cgoac0tVQGIyxVi8zQIAghdSeiJdeYF1t6lqknBDPsMCZDRYhyVeb2ySwO30rIzvLf+RZ0Mw3DxoIaV6ATMcmVurD8EEfhRa8qj7n3IFO9DeaYnhFFz0GN/snJu6BSVRGYeLoiOpGTKAAWRU8v8LCjDG/EK3cqpeMtU0wOYZLMcV6tNR2UCXXOxfWFGuQHQf4+eq5L6Jc6agzpa48poiWAK2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6799.eurprd04.prod.outlook.com (2603:10a6:803:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Tue, 10 Mar
 2026 15:11:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 15:11:08 +0000
Date: Tue, 10 Mar 2026 11:10:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shengjiu.wang@gmail.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Message-ID: <abA0W82MyPtB2iVj@lizhi-Precision-Tower-5810>
References: <20260310063522.362545-1-chancel.liu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310063522.362545-1-chancel.liu@nxp.com>
X-ClientProxiedBy: PH7PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:510:174::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4961a4-efb9-4deb-e653-08de7eb741b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8+FfVglkQxyOAuLxJCZyLwQj40VmnO1golLG8kGt6d28eX7KH3RXT2LJwdGXGFHxF93gfrVjMcVDaWx+WF5dS5he6qO6oFNwG+Qw27tzguh9zJTG6m2qpIcpJr7WM/KpRFLSzvRn/HGAHY8PQoNJUrZ3vHz/6Uwz1JR2avf53iStkJuAlQ/kQEVLO4FsgqSJH2PRfA5iH+XOk3Bx2qsObCXqhGg30QRUrOmFgin5WF+UbPCemKiHECIOmRecX1vpjlQusF+5VJb5iVHrMbJL3glNQccCPeCiN+2eknpt6hMgTs5Dyp91cRTTgDONI6Z+Dg2FPY5NmzsczyLkaCQPnC/mvyF7qlMyudhLeLDBLa4pUH3L8dm+QKBnpFanNQlRyAk7yQZ+TVYE1iftAErsxwYF6GEiu0NxcNKen4+8iaN6/veRDIiasmTdGhtbkVs0LpVnkiqMLEyFcMBij6gOY2ZcBLDLjk3hkeF6mxgSP6qmauPYowZ2dnNatfHXfE+YV2glw0rqq23TJv2J/vONsKLnUxyXbCfJsGNACXQKF5vqs6fUeq/IvQv0ea0dYqOlTBQpbob4offHik6T8WbUVYmjEDY+s1o3VlKiBdNrFW+OOBAhKd8qNsTOqH9x9XbRC7+nnv74QvKttZiXBIQcz2NGTZutVwJmnKa+rZ60DW1P22wXkB9inG3cJCcont8KVsgWYOHz5l0afPlSedheTzC7Ei/GslV6aDVc1N12WU5qz+gCRgQ+NCbbRAf5YAP9jXVDVGoso/ocjBIvt52mI8+aT/LvC9LL57M8e9F5rgw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jy9gRsWtKZzWNaKH2zVu2CsBgj31uIg9DaISA75nlg2gPuqkQ/Xwr6Rms7dH?=
 =?us-ascii?Q?ufGRlA0yO3uBGPHsgosZH7Art7on9i6VgzPmHzLwq474i555UPZJ5hrrgXLk?=
 =?us-ascii?Q?Ur8tDbGtOzc0SNH3KwJdlk/TZwozX3BC2oKQB9xwR83jQFuVsNCi5R3A2fgy?=
 =?us-ascii?Q?Z1ScuN+0LZBxTF2q6xx6mUMUw020UQRG9wknQ+JsSSDxYqo7n3N9KTi27A8u?=
 =?us-ascii?Q?9VxS/p02gVG8R3iDp6qXnA6Og71no8uivmJAdCLvSVP4dBm3ONpXPOuteT5L?=
 =?us-ascii?Q?qTUR720cErQyDe++4uhHOFTrbrQrdNHykFPezvSQvNt1oHfioGNfzx6ITF+s?=
 =?us-ascii?Q?5EjlIx0aizCWVmd7CIV2VrLRP3g+ly7nZVB2WT3sZpmIaSqfPWF8o5BhhYC6?=
 =?us-ascii?Q?Y1597EKDh6VtwQcYVHWJhinGiSqI7sMQSaicZnCxrfs7QK2KQbgu9/9FjM6D?=
 =?us-ascii?Q?38kGMSKEK6J+8ooWPCXnfR+qU8wKe4nWqRRTkNRL+zZYekJMcx6jNcALuMlI?=
 =?us-ascii?Q?DpdYkmVA9V0xBDPnB9yj39PnVs94/hMJpQJK12cQ6L7vlTDwa11V8ucKJ7P8?=
 =?us-ascii?Q?MaS3slctHIvjhXL+zfjGja53bKA5rxesVEWXjbRbAfIZV+4/KVNpth8Mbhig?=
 =?us-ascii?Q?1hTmdnN91gtTdwf/BNdLZZZ1QWieth50Zb7BjPa9Irhh/4fjTNiST9U2gRYE?=
 =?us-ascii?Q?29UfeXtuH6odRNiMYA8xDFlfaAlz0PpoBdxblYS+c2bbwzHKV73LQNhMH4+v?=
 =?us-ascii?Q?zGXjDWrP7jwxvjSFqc9R+QXDsM/d69JY3laxmL2IDRa5wiJgJPuwxG+HU0UW?=
 =?us-ascii?Q?v/RGeBg+J5TG20XNiSCBwQdI6tW2SlvvfHETi1UjaYcShDzMHCpnoafquw0I?=
 =?us-ascii?Q?meHY13CuzM2r1+jcN0Su+Evy2HbOs/rArIrFoF1f94y8OOWOEPV94cXcwMLr?=
 =?us-ascii?Q?yuT4vLQZKAsi9tYXaX1TwL8r5ICLrmabPBdi8oTrr4jy0doIuhgmJjnbquM+?=
 =?us-ascii?Q?zla++Z+YU6kjD+/0/gp398brDpAbXBvuLjFvQ+qvkWgzy8k7nwRaeCyOyVc0?=
 =?us-ascii?Q?LF15vQ4K4CL3qLfXKJNb94Xz4ZfYiuOI28CzKE0SllCxtEolZZ9GgKes+AdS?=
 =?us-ascii?Q?0Of3hC+nozDyLVKaCQBH4V2reg4ZobABiV48CmwnR7HrmL6rHvCDvwXA9vcM?=
 =?us-ascii?Q?VOh95ntdE8shxJI77VlGSjhRS5FuOihozTY8G8Ejfp+K8OzZomuR1znwch7C?=
 =?us-ascii?Q?ZnbQMNhWCZCEjtR1w4tWsbhpAXHrNMfZLP0vsgBOug1w7N4xCqXVUt+OSLXc?=
 =?us-ascii?Q?rD9si7BK95jbusljHEyCi+TwUcRL9Yb4haJrcNHA9biEdoytlWaIpq6Zv0+R?=
 =?us-ascii?Q?8Rrpa7FFkwPUAsnGUBYePzs3EWFrY0BGDfkLt0J8YaHqJsPwYw00kgGdc0rt?=
 =?us-ascii?Q?IduCXH8rYKn2rGbF/kQrQUsIWD/G+vkVgSdlEq8ylJ1zA2gPvLnWcO7lHz5G?=
 =?us-ascii?Q?sqxqDz37s9yoSZehA0F2n3X3u5I56mEJZfu9mbBC+roq5+cecTYzpnJH8Q3X?=
 =?us-ascii?Q?Zdx2M0bjczM9XyAuBdqD6pX7/1js/78qiKOXKwfoXuzDyyIY6GiqgP9T6DQz?=
 =?us-ascii?Q?0s8j9p+jddThs7Qfiue5+ZqDrCYMFX8dPVYsonipSTkt5v9gprVSF/cx2Qc/?=
 =?us-ascii?Q?Gz+ySGcseVk0aAAEBTl8HUQaATffPhe0DW/DLWfQHzhxg7CEPIVvWVa2ZFTR?=
 =?us-ascii?Q?PHXYGDbquA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4961a4-efb9-4deb-e653-08de7eb741b6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:11:08.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jcQqLqVHMn1uG9T8AuAY20oBR3RqSo0DqU5Qy+WTFIplWIPXKtTt4B/GgKQF/qmIsNF0Bz9xwg89/LqkfbrHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6799

On Tue, Mar 10, 2026 at 03:35:22PM +0900, Chancel Liu wrote:
> The imx-card machine driver originally supported only codecs operating
> in i2s or dsp_b formats. This machine driver can support CS42448 codec
> and this codec typically uses dsp_a for its TDM interface. Therefore,
> dsp_a format support is required for describing such sound cards in DT.

binding is descript hardware not driver. s/driver/device.

Frank
>
> Update DT bindings to include "dsp_a" in the list of supported DAI
> formats.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 3c75c8c78987..5c08289346c0 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -36,6 +36,7 @@ patternProperties:
>          items:
>            enum:
>              - i2s
> +            - dsp_a
>              - dsp_b
>
>        dai-tdm-slot-num:
> --
> 2.50.1
>
