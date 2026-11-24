Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538043;
	b=NMU5FL2PjI/tkS4hnmlySzqoxgsHjJYWUYNeanOl5QY7SdVZEznFVsLN3m9rdJOvikeB
	 WG5FrekR8Y8i2vjWDLpUVAJKny5FYmGI13Dbil+K2Zqdbt/6HqhbhxNRatJt8Y2aZPQl1
	 0sarFUYs2ZaNZxi0jcPlKl2hLhA7IWOdEKbob4nr4m1SEevFnZqqLz85wZcHHjACcYwuF
	 Sbl8LiWnkp6hzT/aGeY/uA1Vbb3jlp2auuO/LFHcCYrhOyUHWUTg4rm0/wvAXud8Ay74C
	 EU9lwsxMZWXXoMv3GI9PgE56R5AUtQb/JQM3I0TxWwpFS5hcvgk4llKmwZ4rn/6q31g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538043;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vyuvxOuBJsTERVLJjR5Yjixnm/Sr4YBfU6CkxxxfmoA=;
	b=vnMDUh8LoikBC0WpvjZde5T1JHCs9xVdRmjf906JPvOchJIITPM6s84v9OLsD7K5sH4t
	 fFyMBrBxZTKc1POZ2xSWP11K7s/X/zi3bXwZTQRL5f4MCWsa5uSzKrdMnCZi0GQ7cKxwZ
	 O46kPcBe9dKj6UXgr6aYo1IQeyW9W+grJEx/b+qpqYGmbzsZmKf0n4hg/t9w0CSOdYnRx
	 Je8w/yfLo/Mf5TDaezyTiA0l6K0xIwrsVtAn64hshPyY7K6BbktljfuOTNvTzpQQ37l99
	 ImfkIHSNs0T4H1R0iGOJDAuG9NeqDXgklOwff5qZ8WgBWRSVPbkKcdNbZbxuYQeMdWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RCdfRKIx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.64
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931FA606A323
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 16:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 931FA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RCdfRKIx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJaLRlf/LmYZl1XUq4v4dGbVzVoKoawltNkWq8NnDUhGDA72f45lK2wGVRT3tLNTz1enPeC638Vb+7k95VcnO5NGUM5tZtxNZrDugB8CiTwKPW8Bqz0/NQMNZNgysJfeAOg1YiElTnXPwPNNVU3oWpso3UacYONAqGYw1UKJiKf5U5PwIvaTKamxbr7IfOD/wMggwJvXQ0Njph0u+Iu5jMt+IPanrC6qjixEwkb2Cp/6aGVxgfZWUrfsVaqd7pZ1yNwzJ0fBRCArHn44rDAzkQKFAXeY+Di1XCJgwfRWMpUfUHOBpxGm3wnE3PKiF9AaWEFb5fWnxTG/YG8KwgH3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyuvxOuBJsTERVLJjR5Yjixnm/Sr4YBfU6CkxxxfmoA=;
 b=WN8LY3CekGux/COuw3Fcq4ogM6lHQw0xGk+h1qQRn5st96wWSr+DssKaZNxjOtOnf5ty6aB5fijD5AdaPPVwbwBCDOzDtqM5Qya//Fbwv/s6+PVSmOeGq7dvICSRQEVqy3qbuyu6QnCTZNWu/nsGVSfJJyjDKgNZnyKhY2vRe93rd02jJMvcWYhg6QrQ0hcSYQNxG/tPAEOFE9Gn78/TTuqRmG0UIaMlvt3d1Bg5Bol6Dq6qjxsLdayvbCpiSDZW0u0YYwtCS4jeKiMKF4yClmPuJAFakBElbE/HxgFd1od5kEBkR7oX9nKPX2FRXB0amtCnYw5FfT4ai+UMXmzrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyuvxOuBJsTERVLJjR5Yjixnm/Sr4YBfU6CkxxxfmoA=;
 b=RCdfRKIxD05ZXavp0JaD/CH8dbghRzrEvPeov5IGzsLxCWpwvONGIsnyUUXFsFEaTs5ppEwTHCJhFw1DpeXl5WQp+pdQK4fkmW9PXzA+Vw7wEXszM0nz1+Az676lJjJxNLY2CvcSS7fdhKbKCTbYH2o0fQ/3RWlG61P5ykc7BtkVy3ZoPx927JWgBrwzAddQk/VKANxo1yLZwNmjaMpgezGBwZ34GY4yztRVvsx4BjXMwPcf9V/dbWluT1Mzugp1vIDeawKgwQDQ6iIbR0UTv4B2OPbCCPJsf57GPjkUluoCPyl8iFcEYUONBLiy+plSzyy6qADO5tYBM0VHkOYp6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by PA4PR04MB7583.eurprd04.prod.outlook.com
 (2603:10a6:102:e2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:33:58 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:33:58 +0000
Date: Tue, 24 Nov 2026 11:33:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vitor Soares <ivitro@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vitor Soares <vitor.soares@toradex.com>,
	linux-bsp@toradex.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k
 calibration variant
Message-ID: <awW8cNGZOb-yx7Cd@lizhi-Precision-Tower-5810>
References: <20261118123837.651915-2-ivitro@gmail.com>
 <179546967140.2966585.2831171429960186619.b4-ty@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179546967140.2966585.2831171429960186619.b4-ty@b4>
X-ClientProxiedBy: CPCP307CA0006.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::8)
 To AMBPR04MB12445.eurprd04.prod.outlook.com (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|PA4PR04MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 61608de2-4527-499e-e331-08df4a48bd4e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|11063799006|4143699003|56012099006|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261009223027099003|261102123227099003|261028144727099003|6133799003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	PxyP69o+kuC5/RKh629dCyI0tbRqHTPSqVQQYDMbQt/7+xn9BDal8yeVzqgMyeQYTd6C/VOQ2roT9uaJlBWxhETr+qaYmcqL+bvBE+TfOCRF6Uv/kRLF8GInms1eVbEauwtN5Uz9tl0j6OfZF+GpRgTJyUPqtHxL890z8B4m02P2b6jU7lpGuHLKS49ucJrMhd3fVSe6uqxgiQYk0CGFvsGKgZf5dnuLEvGuuEXcwHjLdRmxgSCGZy5HPLK99aFl31Hn92rEY6wKSqIdHsaAAMqpQD1TKLqj+F/f8YHeUAjxITiFGqHOpUT8Zvfa0R0w1+ZGRtcfJNI3CWfZZzTcfF3LfytnAbeOAZrlHrR6Ch8HmvhV3nu6pj6CtoYlB2kGv7EWKQ5zt40MPeqG/1cCy/e9blVWE2nywxA9c/gbDcxC852tYbguCMEDzgSvdwqKpqSQCjy5EBxSmmveQOZdti2OwTkUC2qj/+uXFA/b/ByIqPSY4Sb0CiQ9RYgaoIdfzLgEgVmATscFI2ObCvcYpz7/4D1ybsQljjtkPIHDy15L7pLxwV8OBBXFNKexs3KLltV4gm8FA7pBVXf1/L2+IaOo2eDg9Jvmya1TuRKYYG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261009223027099003)(261102123227099003)(261028144727099003)(6133799003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ZSaFaaWVn7mwR5hSA1o3x18kPGcJT48Qhx2PmW7CBue8XvO64Uthdx6JZsA?=
 =?us-ascii?Q?iSII3tLuowbSTVrJ6lSsFKSl4KhSfS6s7DDoGm/hqVnUHASoK/ZaQXhiGnzm?=
 =?us-ascii?Q?qXtKisYyCkrssfFLlU+BT9D+HEVnjLZvy4qCReVoKH9qEyOsdjcRm3yypjoU?=
 =?us-ascii?Q?u2zI/mKiKcjlxZSQsGJjEwPesemvAduTiWQPX7tpyZAre9lRvA5G4ERFT4cP?=
 =?us-ascii?Q?s2Pj9pR+sbxN7JWXjzX6299G3yYvSRFEzDdEquWFFOzAlTVVr8SyyOZGI5J4?=
 =?us-ascii?Q?h0JKSEpqhW0fc9a4OAnRv2DxaYjW8KOduk51yhq2P//E7H+4oXGKJH9M8/Ni?=
 =?us-ascii?Q?m2OXCFzkGEMUPe++mCKZiYIypRPT4uOhjjt3ymWPF8hzBFMcYZAnod/qKhO9?=
 =?us-ascii?Q?OQuJbkStAAAza5ounKyhotDSNivUtBYiEXQlj5yyHNP+GFXUnhSZLNAG5L76?=
 =?us-ascii?Q?VgesQMfQ9Ndg4wLssu2z5vcS03hr3PSFz8MNBwc5ymRC/EItIP5ZUKtGvS7P?=
 =?us-ascii?Q?hx4E2E2bVW0YgcKhVDfLDyawQwKbORErSj4HXMHPx3zjsPSVP6fAGJRBn5se?=
 =?us-ascii?Q?Z7upuwFBZiejtBLcYoHdON02+xIM2rqOMhi8Er2zAIcnOPwmRgHKeJi7SGBo?=
 =?us-ascii?Q?1VvAx5z8rLEg4psgI9ig+knv9JXSBpoZyZtrVWNJaihJVuGfr/4bpkydsKJ5?=
 =?us-ascii?Q?T2TzwmZqQ0IfkQ8URyiI0Se6u08401u+sP5He58pGW6o7tM0wuKZO7vbrjWW?=
 =?us-ascii?Q?YhIv9l758NwW2dTY6ZEKgKU2zj36GVME4jS/VuPoHtM8BgB0czIKa1OKj4cx?=
 =?us-ascii?Q?sPUbwKlPXwPOp6BxxDOo+jk9VN6uuyEjGYsmKunRNFTOAJjIlCgyypcdkCyO?=
 =?us-ascii?Q?pUQbvF6dvOSgqOPR9l+53fKfzmtyD61BVA6jLAfYF8wo2LuVgEkIw3BrKuCv?=
 =?us-ascii?Q?/mZMgT67hsltOElaFJJxyz6VqTxw2JP218MbvJ5OQUY2i+eO28Q2LEvGKC0r?=
 =?us-ascii?Q?zWNF/oK780ZA2GnR4F1NlBxkYXjj26IW3rMEtsmizm+TqAqhx4AK/alECkQV?=
 =?us-ascii?Q?GaiHbll91UO9prp47FJOlyXIozw5VWhBBfDoU1Iv0KlraZBR2VL2sZqPumac?=
 =?us-ascii?Q?T/K1Fh+jv/3VRoFBsfT6Hlj8SeAsugHmcnPMDEMztQUolB63eZddAzVtAvsn?=
 =?us-ascii?Q?3uNeFbYyfn30vDYWtPjNXfL226a9adwWAt9GA2U44GA/JOAm61Q89DXbkU27?=
 =?us-ascii?Q?sCOmJdoGxSjP34XvmbBeUl3uuvOyenSQTwAfD5bs5i/IWZGpdlFS+yCypH7v?=
 =?us-ascii?Q?VWFCn6D9JtLmHE8EsrPtgpP58GQNlTwsEc9qHmqACTdPGpmI1Tv15nWCKEkN?=
 =?us-ascii?Q?/ysOGbx9CLOhv/Ft/cyI3a68idib+B9MJ0nDWJldAASs3+YxhkoEDZvQUgY6?=
 =?us-ascii?Q?JhAd9SZse5BPe12xJEycQH54P+8l6xnPKeHG0CpA7pYazQ3QT1AuFF0kgxVZ?=
 =?us-ascii?Q?lzOutFNM2exKaTkqGPZ7bTVAbDnaNku+lzdZ3WUWTbvWdyBhp6hhPIt4iKNO?=
 =?us-ascii?Q?zRs6i3N664JmSrsAStIyON53izq3qWZ7Hwb/3aSQXkdVTwyADs8UpVRvfIsk?=
 =?us-ascii?Q?A10bkG/NAX0l78wrSupnNrOmIDkihtEZ5MyTaQ1ijE+JsVFtJ8Hctq5CUubG?=
 =?us-ascii?Q?l2+c5eGXpTE+cF2hjvSmDFMDkCCoRFcl2MHKN1JilmfIvXvBjY3tcC2ilBKI?=
 =?us-ascii?Q?2OfbLTcScYVjA23EFxc1o3areDxzjL5Ov/pe3HR9jHn5mB5Uf+qD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61608de2-4527-499e-e331-08df4a48bd4e
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:33:58.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iRrUDKjs7yub69Y4CV5gOKAcB1uOVJLyOXoVzbu5ye/QsG/y1KrpP/G73BrA6U0dGzd7WnkQ0YSOjDWKQi/qj0NDjdefWV8tpDRrL9TZFY6DDhfa3eQHaFBDoW/b4Em
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7583

On Mon, Nov 23, 2026 at 04:34:34PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
>
> On Wed, 18 Nov 2026 12:38:37 +0000, Vitor Soares wrote:
> > The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
> > module reports the same PCI and QMI IDs as other WCN7850 designs, and
> > its board data also comes in variants for different regulatory domains
> > (US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
> > the right board data.
> >
> > Describe the Wi-Fi device behind the PCIe1 root port and set
> > qcom,calibration-variant to the US/EU/JP board data.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
>       commit: 8a03967da41f55b803d31a6c5b5052bc35346eb6

I have to drop this patch because

arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
        from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml


Frank

>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
