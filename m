Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B184C91
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 02:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856910; cv=fail; b=DBgbYJCpRhcUNlKF8058Doc4KYVa7oBZJzD0ACcLtyglD1Gaqchx++v6zETS88K7spRKl+u8JKKBeSkOcRPJ3fOQmnfnms4yo5OdzrhPKIdj7i+7wvAq3GfpoiNnWHRCmn5speeZpAfLdJSPnYI+EWWRimEqKa7SgB6Xky4MLnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856910; c=relaxed/simple;
	bh=P3tZxFhvQA9Ngd1f7ocTlGMYfocvmIRjuqJ2ONm3A3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JgHHpMBut965vmd2DuR39DcIkkmLX/CkSm5fhdRquj/EwROc2ailGm/jdJDhqZSq668NbzPc3Wo3TVlQJwW8qH01t3aMuBJy8OnhC6HM9v+FTRBVB6LknfUjqE0c2FIQanoqCYG5QrTejbbq2lJJoYBZXJtAZtxZIK0SwDwCMag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TFrmR7Oe; arc=fail smtp.client-ip=40.107.105.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TFrmR7Oe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNBse5+ow1PQ0xDgts1EGwSnguuJV4lxkLB1KpnO+adBtiUBr3ErDGEgtnC2AnJA7oBHDMYAItErrSa/YqEvv8DyFyz0+hJS+/oidYx0q1Iugdp9WYSSIg0F4gNI07Id41mHNhkckaaeUr0U2bngUYgKIE3T4J/8k1hmn5P5SZhnfSi24z6m2h3Peh5Ffp4wFJZfZSKwtx1ThIuj9PVjUq0ZDEz011ztTU1koaT0KCCYZ76xdVuqSZtnvKyitBq3WueP8Cf870ermjqFzFiP30TUG5prJXjaVKBHTJPBB3S/03yBcEMqgUWtnRfaYBsaBsQ+6RvU3hIw8aF6Irr/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxZnRh8yXRHjENgi49CfFeQaX6vAwqEuw1NFhJW2Nrw=;
 b=tJkpCNkCm+DAAojaLgPMnuVjnP5t2rPlnShSc+Qjf+CGi03313/awVQ5fnHyDj6KkRGZ2RD5gsNn64OTuFK3KWVHQP/SCJY8S7E+X32uv6YVGWxx5Dhp0raAZcaK3B3J8azVQrdKIU9kHJZq0CCb4l3W9V5Sl2kzYZN52dD0m33BRLefQFBxgRjKrP1khjPcH2nW237m/hkf7VExPArLN4HPiYYSxcUUsELzAgbDesBxb5fx0CSIptfIfcF9ET1irIuVIJRUAUIu4YGd+BepmuqHctdpm66s0vVBYXYOTk11sDJStjCld8ZsbyTya0TfiZLfHxi1FDT6bu+fGhNLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxZnRh8yXRHjENgi49CfFeQaX6vAwqEuw1NFhJW2Nrw=;
 b=TFrmR7OeWUmo2kQ8Dpe3kMiLrwHh/585EjxQUsjUts/90gnFgXPXZbZV72BEtY3iE/4qZ4XY5gkqIILH4S02SnmLGCnsT3WqsxMUqkWLRPS+M2dcUzIjtQ6Y8tfpzynAlLk9BV13TDVPr0LzbX9/8MBdSdXynLF2e8G6KA9gtGX+r0kr08S78bdCmjvbafmOkQNsVA2bageTA47IBpoD5nfOPFmfUgogx+ytiEA1cdEAWIMKigDGmTEUFVBTftrhtfbCe9p8rli2pAvATiWtrP4G+gVh3Ber9ymGXIHvJjhcsrZWZTcPcm59kvg6YfvZfuik3tvYaU8S7cYuWuMBaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10364.eurprd04.prod.outlook.com (2603:10a6:10:560::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 02:28:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 02:28:24 +0000
Date: Thu, 17 Apr 2025 10:24:36 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/3] extcon: ptn5150: Try to get usb role switch from
 connector fwnode
Message-ID: <20250417022436.xxv66vo5vfrbgqdn@hippo>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
 <20250416105940.1572672-3-xu.yang_2@nxp.com>
 <Z//AtayeLP6zRGBT@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z//AtayeLP6zRGBT@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: b353fd67-b202-460e-3427-08dd7d57875c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z/f71XVwGYGUiZ2p4A9zZdynuS5bUfmyOGG3YhXVklLryKAvfWVOkzajw0mV?=
 =?us-ascii?Q?CezVnYQNhj8aKs5j8BXbAGZTPWi+0riAIlM4PoIehl3AespgbRkOv0eRGQLe?=
 =?us-ascii?Q?l22jjamVqphaIJ43OVw5T2ZVhXfkiAWIWi0KW16tP3zHB/87nSXLLTMLpD2h?=
 =?us-ascii?Q?vdEdY5ooawoHn7bfGOvxMSbOigJrVf5XHeVL55gnuSBJ3zT/I7QSyUti3dhD?=
 =?us-ascii?Q?rJqqoo0vub+f/U5XQ0uyRUTYAOE5nN0Qwcu+W8pgTo8yH6ZvnUDrgf8ClX2I?=
 =?us-ascii?Q?ZfW5yoLL6StUc1wzc6CpmPcL2KtdOMpH84lwYOErrjk2PP9LqT+zwiqCb6Wc?=
 =?us-ascii?Q?DRK4qIWaj5r/J+5S45m0NZgl5F8Lr5rSm1Xqow7Oolk1HTP3XXFI/G0catch?=
 =?us-ascii?Q?cALS10EJJr6D1xaSvR2kQNfAX2ZKQMgsp6fjYWOLBYKi7Jc0c6H7GDlhFaS7?=
 =?us-ascii?Q?CzG+HYTErbTVSwixEnyI3DNrBATgzy3Nva+553klaMY7F5CuBCk/hh7YrW5+?=
 =?us-ascii?Q?vlZ7vVUphZ9rTeC+ePgTAi2VIAyJr53yjAMqcClKvVMEfXz/VYLrjnlcENCH?=
 =?us-ascii?Q?7vKsrVkcjfTl+IuXrX/Q5F+d/jhXEYti5a0jTRe5G38Uh3+uuEVDaL4WlcO1?=
 =?us-ascii?Q?CuyHgrOjp/443WOYPnI+puIL55sTVTdE+78N0PcCRCjwOhB7qNILIB4GFhtm?=
 =?us-ascii?Q?9NHHoCW7NqtLH1xxb/pEEx4RLViOiFlXyawM/iDajTEyDv3NtMVjZiKqFa8P?=
 =?us-ascii?Q?BBFD9Kg67JfDToxX+AZWeHjRbqfBFIIzQoXxjrSTjVABOtTC05TlJdKBNZ+F?=
 =?us-ascii?Q?eBZX2rgsIPJ6RuREwxFsBF3uo+ZW+Fs15A3h/OXW6/Gcfffs/qU1O8BsCwtQ?=
 =?us-ascii?Q?mEpYbDe3Ybb3bpimtJXixLWLuPPy81FP4V3NPKwHkKCa43wk025uQXeCCnLr?=
 =?us-ascii?Q?dy4dhqGmJkUrk761eBxLGGmsN1L6HmzuxEUb5uCpCnABnuul2Y1u5eHsHLIT?=
 =?us-ascii?Q?+04N++Obn2w6KQZZYQpjEDLhAHt0Pxasv2tBw+vkz1fOM90m57V4j2O3jZXu?=
 =?us-ascii?Q?x6iYTJh3/ohrWLahzcTNnySpI9sEnaCFV9KedJvfRrwIAd7q9oXjSp6d6rbh?=
 =?us-ascii?Q?y2A6Q2HM9AValWbKxYYyvV9DkGWEDfiIieRezqVSiTePTghhJDg6r0UmhEJJ?=
 =?us-ascii?Q?L7P6g4vLdmhZRRBLrgd5SsQYhpabUAF98d3M8Qnwyjs0Q9SRP+sGRz6iSrIs?=
 =?us-ascii?Q?SqC42/e5WXV3U+ltiYim/nqffpij2lPMYA1raLDUE7eYxiIWVzPze613A39p?=
 =?us-ascii?Q?zPo4pGDgC8upgkpixnhwudTKT4qNYqwZV5jltwGGCyw8ItR1+tpolA+MQcdp?=
 =?us-ascii?Q?8+wavT122e0iGfd+YVYFdR0dOMdIs7hwHN1sGLVoU27WZ65DrYin0b1aVoWN?=
 =?us-ascii?Q?OO2APzr+Saa+bbj4HvkERLY1gBE9ZTD9lfWAEkVXyWhd5oHJzRY/qQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y8Y4mVaBhW/La8pb5TiFBot7Q/ZZz0YxUo1s0+IeHSNFbc4SZ3ccgAacc6Q9?=
 =?us-ascii?Q?xu04jgQEck1SSKCY1ME14p0pdyJp2kfbMRl+Qmszdjn8el5qqTfI+lQR/rCX?=
 =?us-ascii?Q?iBdXUW3hDARa3GhrSOjrZ6ZPwWDKpZT91NyBd/s1Kj7YwPbhpgpc5qSkuwLw?=
 =?us-ascii?Q?rqRvSZtLRZ0MxBzfxFaAc3+lZa6ShnJDBbozqIfNQcy5KW4xwqAE4iHvGEbP?=
 =?us-ascii?Q?rZYdbI0klhxZWfCXohGHdXZiYxAqoYtJEYjDyMwkjC1AWCD5g2pHDpyGZ7sH?=
 =?us-ascii?Q?RS51FDdN1Io/xj/xq/00kXCooZZFkUXp6UbvXmwVNIKqQtiAmLBYT1LmFe3z?=
 =?us-ascii?Q?6wGXOu/JWlYaoatfo01NwJEhA1yp5MFi19ShkyPb7SHG3LXoKQcDr4ZBUj1p?=
 =?us-ascii?Q?JTYBtoxhj/QEX9hhdXanWgIogu+VMPD9GUbcGSXgZkmX8XqEF0FLbKFmlzdL?=
 =?us-ascii?Q?qafR7Kw3r5ujeV3fw3BK5n7gnsWn30AHDytCxKmHvkRODc+6xAQvjewX8sTs?=
 =?us-ascii?Q?L41UbjBVnadPIvyllTyvBCA7Fwor0CIPOp/y6pEwLPSXlSheD1LVKd+oKw91?=
 =?us-ascii?Q?FgN2tFPTes1c7RkgiVN+La0pSvv1YXWLWaKcAc6qYk+pqnPKtDkRNUz+t1Ib?=
 =?us-ascii?Q?NgkpOZ2oO5I7P3v5oaQIhrBRiv/I7XemF5SvnBcvesB+iR4Pt0EAkVR7SZ9p?=
 =?us-ascii?Q?WQvSVGU3iCZub7W1myCb9AsiAGrmb85IXisogyLvUlO1F96cnOEUA8oH1wu0?=
 =?us-ascii?Q?KiOCHV19hDMt+MVTP6E8OriTNS2i5mjNZ8IcAS0IwJ00zY6bZbF4ys6ZTtit?=
 =?us-ascii?Q?Dz6Y+gp+F/+PdmZXQ1mR5IDNMDAEXx4koLNuZ4pLxfC8FMJBP8G/fA+A9eAu?=
 =?us-ascii?Q?dXiutUf1u1MrAulyyo7t0iqtOSB2fYBIJQZUGRq/0KyN6rIYyFYp7uZhxUx1?=
 =?us-ascii?Q?7r7JQOaFwQKDb/KlQKxf7sBfPbvJSVCarDWUt96sUKEUHm40YI/jslbUacjP?=
 =?us-ascii?Q?caKDml0JTWwLum56eFXDb8y0grPNWZRbaPNBjql9rIZX1x9XVYGL2WPyqX8g?=
 =?us-ascii?Q?huUDkdH4YHksUtIuD0+IgPiQwPURA88BGNpp6kFxHHjmU3nw+MAqkc9pJqSE?=
 =?us-ascii?Q?H3NJQSqv5v8mUhcKoehZMSfuY3Gh9unBqUDnorlIZ2pWw4/xeTFSXgbuYm2a?=
 =?us-ascii?Q?L6ysirePb5KNifMIL/R9+7Pq3DXJozYDIr38TpFjyo55UxErPpmujbanFurd?=
 =?us-ascii?Q?jkWkoyUfOn1lPW3ujfGXJF3U+yB+JE7IQcWpEfGF4NX4vKb4esJEoStuWDdH?=
 =?us-ascii?Q?DSsj36xidd78eXV/dW5j/WFKbI+NXn2uI95xvC5Qwbr1UhEW64sNiDQLsQ3i?=
 =?us-ascii?Q?hWyv080kI6k116vZ3j1aDMFUmhLLYsPyrc+LU6iiqs17ILsY7uQB57DcXQCF?=
 =?us-ascii?Q?xaDgJ5P7XUcWD3XkhBhwgcKZSYRouU+ij3YUaZdDybp2fxlgSbDXWmb3bTGd?=
 =?us-ascii?Q?mo5SnEjW+OQeUdB5WTuPzdWrxLY0EUwJErF960zqBj6cH6TRsZm/UwHEmjq2?=
 =?us-ascii?Q?Q3Ia/DO2wBhnNuV1qdDRCHlDOQWgphhaz1nX/t6O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b353fd67-b202-460e-3427-08dd7d57875c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:28:24.6021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiCGELk+c/GgwwMStEGO1opP09nl3wh9L91tH5nMmdueEbzy5f19zeirorZ7XpzWLY6rdx50HYzW9ZvOTMZ6bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10364

On Wed, Apr 16, 2025 at 10:37:41AM -0400, Frank Li wrote:
> On Wed, Apr 16, 2025 at 06:59:40PM +0800, Xu Yang wrote:
> > Since PTN5150 is a Type-C chip, we normally need to describe some
> > properties under connector node. Due to this, the port node will
> > locate at connector node in the future. To support it, we need to
> > get usb role switch via connector fwnode. For compatibility, this
> > will not remove usb_role_switch_get() function.
> 
> Your patch 2 already return error if there not connector, which already
> broken compatibility.
> 
> You should handle compatibility in patch 2 or before patch 2.

Since connector is not a required node, so patch2 doesn't return error if
connector node doesn't exist. It only handle orientation switch thing. This
will not break compatibility of usb role switch (eg: port node is outside of
connector node).

Thanks,
Xu Yang

> 
> Frank
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/extcon/extcon-ptn5150.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> > index b7e05d921c79..160998e163f0 100644
> > --- a/drivers/extcon/extcon-ptn5150.c
> > +++ b/drivers/extcon/extcon-ptn5150.c
> > @@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
> >  	}
> >
> >  	info->role_sw = usb_role_switch_get(info->dev);
> > +	if (!info->role_sw && connector)
> > +		info->role_sw = fwnode_usb_role_switch_get(connector);
> >  	if (IS_ERR(info->role_sw))
> >  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
> >  				     "failed to get role switch\n");
> > --
> > 2.34.1
> >
