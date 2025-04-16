Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903B1B424E
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814272; cv=fail; b=RVRb7HNzqZytViF1S0S9Cm3xD9hGIcmBpNyB89erMxi5B95j2SadD79SARd+9qFRsaMbhTB0xJcfrUFV3zO1yEzQ5nDydXEictyARFoPJBleHH7P1Ntb/p1TrTftiaJmTP6NenOegvtk7Z75ReEWtO86CJSZuEdIlT0AGESjNNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814272; c=relaxed/simple;
	bh=jsq2R/jekSpiL5sy0MqcOJzT1o+VGaJnqmCQvCLUdNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FnyMzRobMoSqcp3HgNwotY7DhvPxBuwEMd86UCWpyQ6jYr8Yh9UKePRFyJNe2qQPCaPTr4yPtA2kduThGx6+umathHi9PoW/SM3FDRl9bVvf/cBn5ERPhpx/rbI21edo39vC2N4iGb8b0H5RxlZaaGnSR3GKvDDDqeEPoRQFzBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A8A04PMj; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A8A04PMj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g53Vc9uG57i/zaUmGgVkKS/RK5438ePgumiyIz2b1arydsWfFL6ouLvDhoHHHf0L8MUh90BEtzqPeqBT0/B1ErCrhwNZgVhyw9ZT7akeRKWGEnBzpiaDL4zj36ETxi2Qc4mCuxum0DpMe3xF5075is3GhWVYxCuOiByapBKZGdq9v1V86oLZPWWCoF12EpwENvnVSo5FRymk6SvGsIHCjO9QKbZDdRXMdlhSHfxklMoCbnnYNh/dt6Nx9wy4sIXO1anBez346oth1LH7/8//+Cj8dLxPF5Gd4BJidRDoU6Zs8mZfbY14mieQZ3DGs+o4xwR3pMW57XTPS75zKtWpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxtZNDpuOX3ph1LdTbSZ2VLKBBrBdk3g3DbzYGvhtWU=;
 b=C6jBw5a+c9J88StYxEHtFFcx8tQ8mjzcLt2nU1kT5ulONHIwOrcF/4MkbTt0mZRvPd0zOOKAjMSRZBEkGD7tBl7xxtmnt1GX9+Ss/CnvpP+f6UbEj2+jkbz3qu4AZm8afU1Pm97PVugEMy/8LHGfFYAsn8g+hgzZW5hBb+JVey6kCopcC1kqeG6LEYu2k/LS/Mzoq9Ge2niakLj7MAGDh1WAYGOb97cNUIze6fgmzRdfkOJp0+KHE5g2TS2keN2M922+B/e7rqKvoLw5GybYD4z1uWxXUBi71UGB1ckAF0E2Vi/6iTes/NWq8ge/aaoZXvXJP1yX8krUPnIiqdKVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxtZNDpuOX3ph1LdTbSZ2VLKBBrBdk3g3DbzYGvhtWU=;
 b=A8A04PMjVPEduGeY+9GbqFwm8+kmOuZI8wwK8y5HKacAqgYbbWjJR5Edi8hIQ8ESs8YHporJRhO1yOCiE7qAfiaBr4hCUuhXdtBJPyBx2C2XRwt2ah4z4DijuRjYVqc6Vh4bjSdieewwzzgtWy8YQJf3h9LVgXMVSXKFC7FfJRLYDcuEoiTNq0WPKx0wC18sOvyEhzAZXVfi6TkhhPPOPaMtHxtMdUYVTQBLUE7gvVhNdE3wNlT+nIscP+ZYmKPTHpGoQhZl7MzzzoLgW+XqWTVcQYpAkX0rztC8qvJUUT0ivEc42TpRL5yfitOgLn3VXdU8lPIOXAldzium95KEGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 14:37:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:37:48 +0000
Date: Wed, 16 Apr 2025 10:37:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/3] extcon: ptn5150: Try to get usb role switch from
 connector fwnode
Message-ID: <Z//AtayeLP6zRGBT@lizhi-Precision-Tower-5810>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
 <20250416105940.1572672-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105940.1572672-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d62b2a-c893-4035-5814-08dd7cf441f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ytky4oNrj76IJ5kHuwhg6kLlsGAfBWxR+TQhoLjfk6yvBCTv1Xs/yeRlRqHu?=
 =?us-ascii?Q?YFfy6lx4NKs9z7ZsT6HgQ8n8n3JSeN0F3NnLU0R/Q8FJ0tDnGDUP1/US/KOt?=
 =?us-ascii?Q?Jz9XVvgtBBPKr/Fl5to2xuEcC1EKdLfX/3GZjxTLWNuXa2FKcfvezfEkHr5b?=
 =?us-ascii?Q?U/m5KYtxcUKjpEJ4Qf+MPlGtQ+suT0nFi+RJ+gQXXMHneWPwGlYj1Lk6PnI9?=
 =?us-ascii?Q?UbWpnT5Yb210h7Z1qv9mqAxKEOWwVlk2e1NrcHcjEtOJe7p29CcsXsigm3ww?=
 =?us-ascii?Q?cmZIcblaYIxH4czLoOVuHdWjFZ1NwVp40SORir4N5AOKn4kpn2HFSgjinmXB?=
 =?us-ascii?Q?zmpruz3dKc8fBfRCmkBN5EsfNj1ORCeQMxxtvZhK51SwfHdRBMA+ozf98COU?=
 =?us-ascii?Q?jg/qTGkrDQkZBsUDNd7gpb7eC6CYC//VWvFukAekPwDlHhobQP1CqFiuF2pE?=
 =?us-ascii?Q?B0ReDkj9IRzWKkNMd0FXtUhOReDS6stozNoWOQiQLvOldS5J4FWiTdAuNILc?=
 =?us-ascii?Q?otpkqHCD5MLCnQA3lSmUexNRWlRbW7cMxdgOAmQgcpOyzikxyYYOCcgDZLwd?=
 =?us-ascii?Q?kzkzBDkGn9w8NbHoXPVlxsAWtbtR6vfb1lSJc1MznKvDrJ6EaNj2iAouHR+C?=
 =?us-ascii?Q?eNczVjxNrc0gvf2Q3OEqqIFjgAp6gt9wnFUEpUZFlifGlg54Tq3Fsl7nnHg/?=
 =?us-ascii?Q?C1aa5PR+fPheKW1GE6BJS0Q2b7SMhNXPmY371muqflDD/1WDoyyLp+WcgQRP?=
 =?us-ascii?Q?5psyqv5X8sFAdgUmd2uQ/LzFk3pZ1u/5j0hSffmAcrxgcgBYY4BDmldJVg4n?=
 =?us-ascii?Q?FrpIVBRep7ehJk3//9Ti6lfFZufHkcB7kbpNCrmiRLMHgaA+YI69JpsLgsCH?=
 =?us-ascii?Q?dGKkaiotEpFSZwgJ7IFRAHXncv11nrJeK9eHPHCO3wig8mqp6Pfvy14H1fNA?=
 =?us-ascii?Q?zA57b7Rc+9rrLWoV6T1E+XBKaZ8y9jv79pRPX+/4ULH/b+Kr8TmgTRjYV+yg?=
 =?us-ascii?Q?wHtDjCZEIXPkqgTTqwBPlFFU967C8K8EAGIdZ2mMe4Eh78l5wtDh1Pgn9rX/?=
 =?us-ascii?Q?V9YA1ZS1NL7FVleMDHdDZFIXCCKNmeIzBnI5QGM3GrRZiReeDRR+LKa/5pR4?=
 =?us-ascii?Q?/KQVZH3EsgOOUvZU3COAzUR8ZvOh88w/I1S3kRMED/tF55AyCjazHI1Msli8?=
 =?us-ascii?Q?SwODCCYyHl2lYs5PBrk01Mv6tJiX23uUF6oKiacie5iPFeX+BOvk6zO1J0C9?=
 =?us-ascii?Q?X9XAXG1Ei9YhXyzxrJISJCHhWvVeg5iIxupCCoT7LOga9wFyu50xZIhCS3zl?=
 =?us-ascii?Q?kqldNiNh60cTInUoE0VaGH5PPzFivbH/fjKhGgvCI4gUVmDSNczQp6kF2ijv?=
 =?us-ascii?Q?ESCXaDBFL+KzzaSuWI6N0Soq2CcP3StY5BHhiKwqf4rohad8z1+8zM+ndJGX?=
 =?us-ascii?Q?zUYG89IOIbXZB6dd4EZ9SdZ8h5d05XqOQDMbdyuXZ4JDubz3au151oj6qysH?=
 =?us-ascii?Q?fRtS72VqSK9XSuo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRyAf1VZLGQ80f2hfIGv059b2ZypMdLN2N8O+BJb+EBTfcd64hXA4ggLD8sK?=
 =?us-ascii?Q?XMZ8Pp/9aDUyEpLl0BQVXTgq5jNouic73siBTrH/Ub9xsb3YCpbV5UYNP6p8?=
 =?us-ascii?Q?m56NpNyEjIEZE97tqPUabCwXPzqI/V6qv/doR2i6uf1rxBo/gKUn8bUv8lIE?=
 =?us-ascii?Q?ZGgGZGAxlrt1N9OAQhUz2UsA7w8U+WkCBb9bFHjB+J5+1tYgFYzvl/EnaFs5?=
 =?us-ascii?Q?aLb9lkm6odnoU5ir6yXqC2RTtw9YUjCpI1Z2X+va5tKMPVIGSoth2KtpsygP?=
 =?us-ascii?Q?ov5eR1AzM55IHJ3W6mnTl9tDecfQ63XbDpVNvYrPrbK0Qrp/IkQc3sYHLJn6?=
 =?us-ascii?Q?MG2BbWHffUCPKFRlWLPOa/grbMNAYtg5uXBZL+RCiq/T88AtZO7FnnYbp/1O?=
 =?us-ascii?Q?0Z2HeeICeopbR1ZsssW/Nvld0Hj2ik4u+uJrCqAPc4j0SQJN+QmM5oTbx7Bc?=
 =?us-ascii?Q?+0163pO8EfmUigA5G60TqmNdya9pmrxAE9iVynugpB9aiMPo2hrFPjkhfGLP?=
 =?us-ascii?Q?2tKmmBpERB0zbowoIZlzd5MXm/NziG+Yeh1+x6VDTirgJAGE1fOzi5nuMfmG?=
 =?us-ascii?Q?qVai4XeJF2NoqBQiNvgl+JLDYVSi65IBdPHK/NjMz2qeAxXHy02kPKb2QUdY?=
 =?us-ascii?Q?q21kjK6q9gQ4/x5LiEMBPlR3253OXgEyzUEh+qv7slSqUXnTExY/kwHc0MUb?=
 =?us-ascii?Q?bqMe4yBtvDYYnlVcbqD8GcHtEFaPTeYdN5Zwl/KbPCj1tcymFmLDLAbLOEGH?=
 =?us-ascii?Q?2e+t3Zwpt0MoR8FSRatJzX5n85fKWdQT5+2DInVRrrLPQltx7BPNz4SgHfUj?=
 =?us-ascii?Q?drOzRma2fEWjyQWpZNSpygaJgKSg9TjYk8OTDmAYaYXGznPzGgON5PHH5vbw?=
 =?us-ascii?Q?jh2akOWTlMeB8Z7ty8eDg0gapsZFYgbXYHHffCErk4LOBdP3k3csJUmqRx3k?=
 =?us-ascii?Q?Qq37sAfQiOor1AsbgVYG+I3dkmtaE1AblMPfVYLThc/dTdGUI/CBY+6LkzBl?=
 =?us-ascii?Q?C5QV9wV3mva7ezmwjXL6s+oe0HVWraVIGyy1oDol+hfTRVarlQ7+iuaRheeu?=
 =?us-ascii?Q?Kj9GHMAcMZgTItSEO/VD6U9rkHRt3HJbF9/7d0ckeFcudzmX5M4rxQslwr3y?=
 =?us-ascii?Q?327BIeX6/yxHHS3VHiLTPUNxmKWfYFBBRbS6f2iSDyno7b+G6IDp7Nwd7pxm?=
 =?us-ascii?Q?5voCbKWqWoZVU6/G6bkJv+iERS0iuMy6ifGCOveoOIv406t0kr+KvUPnzvMu?=
 =?us-ascii?Q?rgF7DpYkRxTrNuI2iTIgHctwwoEGxSfZnkcRt++Q5TAoDmVVrTfbEoSQr10M?=
 =?us-ascii?Q?+lu7pLvVvs/dgEvodfRd8g323lzmXDeMFt/SA5VYgavfYM7Q63geF/FCUpur?=
 =?us-ascii?Q?pPAZhrkHGD4JUMdfLXM5S9lkIRarbF56qmp+mcswDpIf3x196r/dKYdj6ork?=
 =?us-ascii?Q?sjxOZBTnZO8XsDHYz4/Z+cTk1eVnbheGDMrNZBvlpd979trvnGfsGrXZNlCy?=
 =?us-ascii?Q?pdQ+D9AkaopfxN3lIcbpK98egoMascmX+bMuRiLqHWZhuW9WNlzmKsR7isz2?=
 =?us-ascii?Q?QivJEhNp7EIs/tQpaOx6rwRSLWztf+6F8Moc6ljB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d62b2a-c893-4035-5814-08dd7cf441f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:37:47.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0I0ZZRrpDJsmPIeCNFo/NFybisYAMJjIC3Txv6bl4QtcbtLF/hMCrktF3Z+cIIuJ3hDzDInaUefsxuhw31Ryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

On Wed, Apr 16, 2025 at 06:59:40PM +0800, Xu Yang wrote:
> Since PTN5150 is a Type-C chip, we normally need to describe some
> properties under connector node. Due to this, the port node will
> locate at connector node in the future. To support it, we need to
> get usb role switch via connector fwnode. For compatibility, this
> will not remove usb_role_switch_get() function.

Your patch 2 already return error if there not connector, which already
broken compatibility.

You should handle compatibility in patch 2 or before patch 2.

Frank
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/extcon/extcon-ptn5150.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> index b7e05d921c79..160998e163f0 100644
> --- a/drivers/extcon/extcon-ptn5150.c
> +++ b/drivers/extcon/extcon-ptn5150.c
> @@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  	}
>
>  	info->role_sw = usb_role_switch_get(info->dev);
> +	if (!info->role_sw && connector)
> +		info->role_sw = fwnode_usb_role_switch_get(connector);
>  	if (IS_ERR(info->role_sw))
>  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
>  				     "failed to get role switch\n");
> --
> 2.34.1
>
