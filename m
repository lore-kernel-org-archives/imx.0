Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7646C4A7
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648559; cv=fail; b=LGtlx7qwHLKmEC5jereJQ+B+a7dwhoGQ9ts65VLiBlUTosRn4N3ATGUtwO9jO40BrYx5XK2DwQkYCiJdHgbX+fsXF4Sudrinz+7o881mCSvZJJ2PuxM6BLOYR3QQDasuKGW6Y+ui/boEkZGYGSNj7J/+o5E/xzXFWCqfqrzlo+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648559; c=relaxed/simple;
	bh=EfVXpUNLNsHtbHJk2J4c7z/KNO5rFR/L07qZKd/eHjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a9ubyyoJk3+vxd16XRGxTWuo8UOUM8pL/oLL+PqdCmO6+SwO3e0vw72WwLxHpotL/jssCB6lDmZtQTSBpN+FFvDTtxgjrwlayCQhegVp2t0A6RW5R1xexlttR6ju7YGmDaBrTaFcOgFdjodLK6T93p0SApZKHk3nevu62MManwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CmWr20xF reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CmWr20xF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSDnVCbUALfwTbjBCHFtI0BNZDCqKJexi3pMpidVmXwFN/ddvK2hUnUsVxi5zcfDiUVohEQvtHnL2AAB2s5+etmcJ+BeAIj5EUnHxUEoGFVyFWWZdEmp2/rhvOhX+EXMXaYyXdSXM2b7bL0w6nxx3s194pEDmQ+NN6nBeoeA0wKqOL2Nt2tnqlf1O7q+M0TziZRjnwd3IlpdbcBXOX1Tu2CPXb/CO0As3/yjs07RFnjvfo2H36bTOSDnLDojBGCrnuAlfTguXhqql0s2L2fa9tp+/hUls6PMu7G4nXAnytUs+Kc3/v6enKDkyUENif48JcnBuuR6/0lna6a7ADluHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xovBMCEin7VjXymkTsq+7Fa/oIevsmlhWqFvBVF9F8w=;
 b=qpYswikwMAMV2NHVcFhbnXVjC4sJVaHshOYabaQDTlzNvFLT0pOxfguFCKtP2k6EcdV3cMKWnlJ34WakDE5bvvscJ9MzxBomoxJZLX9NV7KrqDD1Vce4Kr8BZRLwlV424y3vtvVGAiGyXVmw3qYpxlovolNACBqvZ2Q/y/E3sn8TGbGIQ3kgxqT7fGfgsUonnC+WiXI0U9AsMDWxIeslbiPtDMXyOPUlZgnSmsR7in4wJVcRG4UvSWUD5cg8/XYFiQSi9oo+FXCrYvvsmRYqXjO0ZGrKzqe9Ji6nvLdyHFMhX97anA9ZxsYLAaTYkRWuERMBc3tETy8LuVjeZuMJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xovBMCEin7VjXymkTsq+7Fa/oIevsmlhWqFvBVF9F8w=;
 b=CmWr20xF1FPK6OxzYYDFNf1GiQGU4RJK2Qebseoxetx47nj72b5K1j6giWlg7+ouecAEydv0h99X/ETIBl9nXPbF76zFW7udqPugC/aCraCfH4b9aUzP3uJI24PmThd6gy8mhcK6yJPyP/xq09pi3VbiHNKVWE+cTsQ2UXAGCqfnq85QiVyTEwVGSBm5TJfi68byAk3+nX8lzimRdPx+X9EIX4Xi56J6NwMN/rDc3AVCOUwL//qVLfYbj3mGMJ7ogZ4gYL0e01opFfgOuM8gplLjSyifIXBCNM1KNOJ/1Fs/m8eEdOJqfyq1bc94NTCTLCEH13IsgxRNpJUsgofWCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6782.eurprd04.prod.outlook.com (2603:10a6:803:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 15:42:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 15:42:34 +0000
Date: Tue, 21 Jul 2026 10:42:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
Message-ID: <al-TXsoz3UNJC3gg@SMW015318>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <2844770.mvXUDI8C0e@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2844770.mvXUDI8C0e@steina-w>
X-ClientProxiedBy: PH8PR15CA0002.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 557ec0fd-3d2a-418a-2061-08dee73eae9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DMoKaSuvCR9aoE3PzeUH2wEk2Qzqei+LVGKa7ZYamDeJ/rCvjzZzak/ze3ZYjVCkEOKX9L/J7ejKY+Mf8QHIyAtIBzq8ctQDiZABF3jHMBgJkWqVE+KLMB6WdBVj2Ci6DItWfgRPb5ZHKumUl/cT8AT1ZhgS8+wnGCfkaR9chFXgukY4BelHBlZ0Qc9dT1geGXbLFCDZX1i5hW8j7gnYf2Yb7p8/P4mLUiAF5IewIJD37NbiyD3uIcH9iAPQ8IoIqC+BswyzJhnsY/4Xix4quMF7EAMNGX60W6Peq6AWQu+H9fZtJ49mdHgdCR9DASfOeTkwhzgemR4M1+nfqsCzc6ah0ZooKSOocAocR9vvTA4oeVIe6wBMrog0wJOmhGN8YyQocKBcpJJsFc8uPtlBgDZo5z215zr/vJJKMVFj0XGFa0Exvda4M9NDtC1OhsFjQIjTxBAofY49xggiWHVY197jlpBMIvDhe71C7PM6p5xdIZAR9UGKhmAVQC2x1q0pKr2N7pkWgS/DfRbyVklTRWKMawi0xPl7l1EkxUX7BOmNXixo+JzvfjEDVJbD6FvU4r59LIgn6yJNrSG54lAUfCfGOigqyZRC4+n/zU6d7Ug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?oQzEuIDRLcsykR9erBtSuxPtaGgMyfqbJnyWkcxsXCUPPxDB98CB96Q63k?=
 =?iso-8859-1?Q?RpX3LFN8aiJ/hSAGzwCMFjhL2fmUm52wtIhRxM21A32kr8IRJqk73zD1RF?=
 =?iso-8859-1?Q?weOLsF7jK1yimE5lnwaJs0jYBW98lzfeS/KdK1M2CblHkGXP7Q0pldXnVJ?=
 =?iso-8859-1?Q?2OQGPtsaooDVyWJLhJNRBrUYmtghLsvaQSY9Pr5XJz8OYdvwhJbrl52SGw?=
 =?iso-8859-1?Q?y7FYl9sgXTmArfBH9iqbOosZZooWq3Va9cvERIn5IgVCc4mLLxdTxdw+NF?=
 =?iso-8859-1?Q?sfWs1pClUCe9VTTSsfyvdwHKUu0bdX+Gtt+4zIV4m8yP9QQuhjW2PvErMp?=
 =?iso-8859-1?Q?mDt6FL+MNRPFzjlqLLe1WBGgwYhKojUmnXfj7cI/IxuxTdgWl5OlsBb5bK?=
 =?iso-8859-1?Q?2y/OywpHQR+E8TsMcoUUjWwgmFpuSDhLqu6GxL4atUIL9puM/EEOpuNh9D?=
 =?iso-8859-1?Q?dbEs3gcJcFkcoyjTcO11YVfK/ukF9UebKKQZL4EmPYcTNIEMWZPuKjMHdJ?=
 =?iso-8859-1?Q?ehkpmV9ZRKFvOFph8KQVNBZgDlXLcbXiHfQbPMcns2aRIbx8fTXmA5M50u?=
 =?iso-8859-1?Q?TCAsufPQhY8ggvoAwOXQrlCKVdl1II+sRiwcFHaHAEa9WH87TqreLdLOMW?=
 =?iso-8859-1?Q?aex/3uYdv+YrTyJ46wUZwQGFA9f+VSz0BjYe3o4EAHWqYV3BT2zkHjSszj?=
 =?iso-8859-1?Q?h7wFcwiBVA8W+/0XTqbF6IwIFVaB0WH6XymKcJ7qrQkAKGyc5RCRGcDn+O?=
 =?iso-8859-1?Q?Yj5svvcGEqwVLCjUS8KdKY2pHBSCGztq4UgRESHG+E/JkWiNzy2BG3TtFq?=
 =?iso-8859-1?Q?Xuc02ywuEeLWFiax5DCQ2Tyf8xBw5GT0whhq2WL4XRSZnuZzsS3MJGoLg9?=
 =?iso-8859-1?Q?Td+GNAb0drKNQLucjHdG348xsvTkNLTY+4HTSPwwHyIxOpFSYtDx8G8XQg?=
 =?iso-8859-1?Q?hpyrYXicTzFNhbq4IvD83rjsaDU+povJRtBiDHll782gUH5OZAD9jvi9Gg?=
 =?iso-8859-1?Q?ULXv9c0dFF7q0iOAhmK4jh/cGyBN0IhWZcIxbLXa2ScjloJSBo89Qfgl9z?=
 =?iso-8859-1?Q?XM6oL6y+/H0Sn8MadUt/LJBKLr2YaJPqY7I5QmpHDQGBKN6vnBu6fiSA0i?=
 =?iso-8859-1?Q?wkd8gn434zqsCP1UPsy5HJcsiZI6wVBmVSBB763WnMiTr8jArDGWQFN0X0?=
 =?iso-8859-1?Q?p1UdRwTigX5PsR2sode3R1GuumGqZUhaAuaxSfWXn5rKJXIOQ/QWf+8OJ5?=
 =?iso-8859-1?Q?CawLb5euD0wHZVY8U5/c1SZ3G0MzR9WUCQJpyp/tJBdyJGzXLnZ8hLBobC?=
 =?iso-8859-1?Q?5PMlgH8/Lfz5zam3/vZcE3iX1DvaX7VP/fe4uH48bcPqGkgthr3p7yMSkj?=
 =?iso-8859-1?Q?/7Vs1vgGTQ9RQJBlehM57FqDOMjA/fE7g9D5XmMjWeac73SxIbv3kqMjXF?=
 =?iso-8859-1?Q?UEGdpgGYAwXwbMzUAL6007Tpi1If7ZHup33H38kGb3BDey+4MenNinXI/Y?=
 =?iso-8859-1?Q?ypxzS4Hmdvb5DQqesLh47fjDO52X8EI10ub8r4tbetYFA9VR46+4mcDPu9?=
 =?iso-8859-1?Q?wl5hA3Wrxu6BpYvdSr6H1ZwP28Il7M7xIxLz4nk9QABsR9TxAa9I2afy6b?=
 =?iso-8859-1?Q?yjfOTj57ZeA5y5ke8a7OQ5UWHT8r0oImnHKtX04SM+hH0b8MxJF9o5LrUV?=
 =?iso-8859-1?Q?uauzxZ4/uHDauMWKwj5WdEZd3WFdk+Ya3d4W6lYK1dxAm1ZbQzO25+ZKmS?=
 =?iso-8859-1?Q?GdGwRPzWnXJJV0oqYuKs3QVCu0ppbPz90kZlW+hjjPZHu+vs5ljKpOXai3?=
 =?iso-8859-1?Q?he9oaLXW4IFvcNXayLwNb1hQg7yEi2supvUput5If9qDzlghrmC6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557ec0fd-3d2a-418a-2061-08dee73eae9f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 15:42:34.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8FeTnfCmkVpQ8rXu6eXCfsQpOiS2BjXdgHu+E11LD9ED6P+cjdE8T1BpvhErqV31Vw2xsok6TyRREMmPwFFyJMxz0fc64UB1mr1doElT3ZbpYozE0lOTIuz15J7P7zS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6782

On Tue, Jul 21, 2026 at 09:48:16AM +0200, Alexander Stein wrote:
> Hi Frank,
>
> Am Montag, 20. Juli 2026, 23:10:33 CEST schrieb Frank.Li@oss.nxp.com:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Add usbotg3 iommu information.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > index ccf9f510e0f88..1370a571153a5 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > @@ -32,3 +32,7 @@ &usdhc3 {
> >  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> >  	iommus = <&smmu 0x11 0x7f80>;
> >  };
> > +
> > +&usbotg3_cdns3 {
> > +	iommus = <&smmu 0x4 0x7f80>;
>
> Where in the RM can you get these values?

0x4 is stream ID, any value between 0-31, uboot will use this value to
config stream ID for bus master by scfw API

0x7f80 means tire some bit to high before pass to smmu by hardware.
I don't think signal defination can be found at public documents.

static int arm_smmu_of_xlate(struct device *dev,
                             const struct of_phandle_args *args)
{
        u32 mask, fwid = 0;

        if (args->args_count > 0)
                fwid |= FIELD_PREP(ARM_SMMU_SMR_ID, args->args[0]);

        if (args->args_count > 1)
                fwid |= FIELD_PREP(ARM_SMMU_SMR_MASK, args->args[1]);
}

Frank

>
> Thanks and best regards,
> Alexander
>
> > +};
> >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
