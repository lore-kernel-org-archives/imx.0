Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA4540A94B
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198656; cv=fail; b=Ay1+ysEsqN+am9LI4ADQWYAmux/jYf6pfVPrGxR5K3oRWpbFDAbtUsZXQ06m/pPSjiKqN3vJN1QZbVPPQ64Xaeeu44GZ/kPA6IyXC9rZKP3UyjlbaZHL3jlSc3GBe7qWKZJ2iEpn14EQD1AxiTFh60nTl+qsGERc3qHJ80N251k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198656; c=relaxed/simple;
	bh=I0g/nP+SunhVSWFDcebJzfYJZxP/jKDCEDMfYCr5epU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a+/baheaepRz6I2Y17NLH9iLqKzpdtueQvOXLHJ5zLHowTqibrUJEo9Z6UBIS30HaZn8dt7T+kzA8KYv0MkUcJG8awx3Mx/Gx8TJlRbV6y+P6mViW2+EnbyFooNJh473HqhPIM9fEz0chEtaksfwOOTwlOQS5jzS3I+2RDIWo7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IV8ihfQq; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IV8ihfQq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIXQvKnG7C71OxAuK6ziJNsPpQw0WW0ERPi2+1ACsaFaFM9wCQ1a55HjXAZnxbTAXWnxF+nQ+08GIpcIStO3PPqNJxfvlPAPEB9l6k/mv7HgAqr29iw6eqkzDxm2nHyC6vkA+fAIHUelyFbwnx6au5W30bU4XMlrO01Vq2mFdrFmCVdU2B7rqWLjRSgz3R3EKWRaX0dVNCdQiQ/mJ4hrRV5st+LkwyA6egzd7WL96tWaMrPAXOgCN0Q8PGEEDxZmVE7WvCgtKWv70HSOp7b7TeWDlFSojYpOa61CP72xKX1FNpdm6y0SuOOEHX/zfz1GfLDo4oHWR4tofeBs1ni8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcoyxCwKaHjyFnCF61Q0MmqKoIf2PtD6pChr510LCKs=;
 b=t5sgBBqhnT1EeZjDTOeK8ZgYe/oNlmTm353xfjWT1Qb9EWHVYfLNw9QzfhYI2dSsxxgXQV46d4J1vdRnbn+YJIctS1aE9fVnY4WOGBn0iGvpjx+Xcvvjepu1o0CBEjuiS8PBLLZZ2VKVWIQOMnF3GQajVFCXECkuxlF1UWA0TDgdevKhnmPykcq/D7CA2aZSqzHRh1//gD+G0fWv9CXIucz7B27NrZDS0Ab6WneE492vsuOOVAD+2TMhHVRDpwzldIdmv7naGFT0/K9LZFvFDrUNz3glCiLzxvI/8XkQzcUW4RLiaiHskW4UaP1MHvwuH1Np4CR3h/Us759YEkCBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcoyxCwKaHjyFnCF61Q0MmqKoIf2PtD6pChr510LCKs=;
 b=IV8ihfQq93EeLYnILGtpHB5fJvTaWN/U/dnIQ4I6kZrujzzuNZsOHQ8Sc/H6fv/X2JCrE+6iRFjOwgrbNfrXggr0WS/gpF0M1FE5baNlgZELTUqNgNPjq9D3a1WaMcw8aEfoLcfbHwKlVJyGhyOO19w2FDx9m6KfcVyRjUEabTclrK58FCPFfEdKgb3TNL+EFMHeOhmIm6VRXU7HucZJD8KwXRpSxrmwT1+9V4Xxv+t+LlITLd9Qh2HyO+MNzZjXDINX+UKHZtM9qmBF3BuX+rVAeFJ2yi0jruuQlLQxbtp+s9dtV5KHRMSJDRXFImTARhUkD4ipQhV5bqzMLrizzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM0PR04MB11878.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 10:44:10 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 10:44:10 +0000
Date: Thu, 16 Jul 2026 18:42:46 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v6 6/6] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Message-ID: <chjrvuq2h2og54wwffcogls3yik6ehita4orusf5izcnkl675r@5uy7pcaevvu7>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-6-00d95e270e4c@nxp.com>
 <aleoGO5hBWCl6ZgE@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aleoGO5hBWCl6ZgE@SMW015318>
X-ClientProxiedBy: AS4PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM0PR04MB11878:EE_
X-MS-Office365-Filtering-Correlation-Id: 7454117f-75c6-41cd-b32f-08dee3272af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7PkSGwvRDjw0kSqMQTG249h1CsjB1+r5M2zGHutFNXvOrfewu1YKztCObdn/ms+WfTaIwtd37MHTGgHFC4dCs9nt0r1gf+Y7cTwCtAgD3TvteJFGw1Af+G22yxo8hMkJlozmb2Lkhg18Sra6U4etJtkGqM8FLRQxzhGgY3wOzanfOUryDfgWqlcFwFE6lNfq/bbJofNmorjzIGO+ynOerj3I/coY1FMLSsxi3a2zK4DlKj9utx/fqZhV5pJyUrNaO98WovCXbdhudYW1nxsaI9doAYy7McsDhD6wme2au0d4Z3jRd9VDdIUbGCQSo4bqcMCBp5YYosRxtEvkvtkb/IQ6aek+OxaFow0q0HwJA3jrJ4uAeFcl5gXhmhVe4CaSVox8AfRFWz0ds5b0aPKrOXLkS7DAaQFqjao5T4e1YbPMOHwW+IkCRtquieYNtBd/VV/RkQ1f7+qSi97FTn9XnG3TfuhQcyKfs3MPWEt8Ztkx4swtfuCDOGj7ziIhX8nCbRdmcGChBPzT6PbZV4RH5KTfKTiz/VDYD+AevqtDrkjNkLheYv+ypOWJvxxzOoBp2HjHdckWh8vIvHNRExxL9FXNkezjiEw+Mwz3/p++i7NsSHcWPFDVIlv/GPNgbnZXGW6peG00ljIM/IEAhL+OxZZxLyXl+ha2WObGZoUABF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WfbeIsv9P7Wl9U8gSHOfw/nrnynba3Hmz8e28eB8QMH3X24UrqPBfa7yKZ7S?=
 =?us-ascii?Q?nblAzdccGZKN3RpgF7t0vEb8FRUCVxYmktxtvH6agjUvi2x1rmv8UHRD4Xue?=
 =?us-ascii?Q?3zFU7WjT3WXJpcPPHrL5BmkloMkagUHhwwcUbLfXoRrv289begdCO8gr0FcI?=
 =?us-ascii?Q?q3ubU79RHXKGBXhSIh2bl9c/mH9SLRet5jH2bk2gT/NNNr+eVm+b0fv1QLqC?=
 =?us-ascii?Q?vUpQ17n1bR8dMdIBcTJKihs4SHP5QwGNOYP/ThXi7U4wb7NfO6mF5slkM0o0?=
 =?us-ascii?Q?5TnQNULsW0Mek8cJftvocEjNkxDXwveFeKNO3bYjCs4eguUKqfGX8zLzMIF6?=
 =?us-ascii?Q?B2QZhfUb7P3k9s6vdCD2TxYWKENDZ4D7yPuHMMBUtyaQtih/B4UmVrGi/0d+?=
 =?us-ascii?Q?qZW5TCEP5i6uXzY5wm1MiF4m4uSCz3iAWW4+oE4/1yIMsZ2rKc2Zxof3UGVb?=
 =?us-ascii?Q?U0ftdwCEZaML7dE0z26elRr5ZhWgV4Srz5GrWgHPw5uZ31GEwpI0cqDuIrnx?=
 =?us-ascii?Q?JRlyvOgfMdGgZcAWUo8Ic98m/U88Z1RGgDZ21IhkOMS5KpKCqUMcBTuWAiiR?=
 =?us-ascii?Q?+KA66BLRe2srVhDQKOrdJPbtOMDNptxR+svpi8LxzLmvf4f022EhtgVZlY2f?=
 =?us-ascii?Q?uv/qLVMeMALJIp+HoI2H/xURJsFWmwuH0FF1I3ZSLjivWCmXElkp7sNaOX0h?=
 =?us-ascii?Q?e5JRyrxuYYP+W9NtAD+DZOvc+D0VFxXFZ/xaiNT0rc+iFEEmGWWFvgXGW7h8?=
 =?us-ascii?Q?HsIdp/yoTupJMHOgP6gq//0NgxX4vY4MEeMAk9qzCOyeVKJoixpKyK1QJGta?=
 =?us-ascii?Q?CzeVySB6gNLFYWTqW/4+gZJf5zuZDDc10N3ewkYyQSTxcQ/vZDX4inPpijf1?=
 =?us-ascii?Q?AxbhMjxhviFBwC/tFYWO+Pm5aFwjhp2V+7vAuIq0NDRV04ErYVAY90jLj28D?=
 =?us-ascii?Q?Wkiziry4l/N6BI7RDZ+rBcX4AFwsjE+7VPG40W+SbGdBBlQUEmTstiospMuf?=
 =?us-ascii?Q?lvw4uA6c7mbZ+i8v0v0zc1sNyfUOge3GUJUUy/Dv3r/VEbvbuf41KQJR4yRu?=
 =?us-ascii?Q?vC8KD/esEXb69tr0hYfYW/lFNDr7qr6+uQIE2WJO5Fd4vFfiFg9KDDZDcPtM?=
 =?us-ascii?Q?JoAFGBvViGtCqFnRL3vJp8eejfj9db7TlYL0BVhpjvEG95EHu4IIGZOkTXxu?=
 =?us-ascii?Q?dCzkmN/GpHV5Kj2Eik+JoHe8eslEUeLpP1M0Ky+2xLYSyZMA/U/JqE6Dp+lB?=
 =?us-ascii?Q?C4BR4dO6v/FEzCtmm2ArUF/i5A4QHqnTqPheuPFPmocWGTSSYDzuJk/E6eMA?=
 =?us-ascii?Q?mivRwFO7ekT9L0qW1sTIZNjhGcCjoiffuc1bORRixSzc5fkoQtVieO6Xu/ZA?=
 =?us-ascii?Q?PJTj4bDbyS1C34N+97jS/aqClPLkUcBhCquhRqYEOh4Vz4H1e7WnYoo4YZlr?=
 =?us-ascii?Q?SVZ5H0B62jsTR2W4qJptltPPssWceA2ccCY4ctfA9xRuSznGwU3ErlAZs30i?=
 =?us-ascii?Q?+A4XVQSWEjpdqDjCJCW+h2aHwC7qg6csHNtMCk2BD4+eETheHRoeFkX6QsND?=
 =?us-ascii?Q?3lDL9oyHzk5wcCu+5MrBb6UiM9Ve+3Aj34Juz1h/eTmbkemyMGGg0l72wINh?=
 =?us-ascii?Q?plZyi1dlIVF2Yf3PFhphFsQYlrLyhlF5zq4Smrk8ipYT5xn1qVykNUVbMe5s?=
 =?us-ascii?Q?Z7nDJnuV8a4Muq+WaEkUjYvQxRY/fbA/CJzvCq/EnqwKCyMrxgjTb1HsJvHt?=
 =?us-ascii?Q?8oIWnHnK/A9k5hbimt5eVZqg1WT3g4QkmfoBmeuuTPS3Vj4TnYoG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7454117f-75c6-41cd-b32f-08dee3272af9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:44:10.0459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8XoyiXWqSkDFPTBuDOoXQ66PenbDnYjaJJlSlcsYgZRc/rxlc4yM4snbPouJqpKm16K+xJk08H1pdc+R5ZPfsDNf8CC5kZ8JSa9vhVmgc+JLLm8eZasLbld+Ni+sSrG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11878

On Wed, Jul 15, 2026 at 10:32:40AM -0500, Frank Li wrote:
> On Wed, Jul 15, 2026 at 07:34:01PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > On i.MX8MP, the USB PHY has a dedicated power domain that was previously
> > never powered off at runtime. With the introduction of runtime PM support,
> > the power domain will be powered off if the device is runtime suspended,
> > which breaks USB wakeup functionality.
> >
> > To preserve wakeup functionality, mark the PHY power domain as runtime
> > always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
> > need_genpd_rpm_on to imx8mq_usb_phy_drvdata and set it as true for i.MX8MP.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v6:
> >  - set need_genpd_rpm_on flag for i.MX8MP and call dev_pm_genpd_rpm_always_on()
> >    if the flag is true
> > Changes in v5:
> >  - no changes
> > Changes in v4:
> >  - no changes
> > Changes in v3:
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index f0bdfa75d586..2398bda50eb8 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/regmap.h>
> > @@ -134,6 +135,7 @@ struct imx8mq_usb_phy {
> >
> >  struct imx8mq_usb_phy_drvdata {
> >  	const struct phy_ops *ops;
> > +	bool need_genpd_rpm_on;
> >  };
> >
> >  static void tca_blk_orientation_set(struct tca_blk *tca,
> > @@ -669,6 +671,7 @@ static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
> >
> >  static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
> >  	.ops = &imx8mp_usb_phy_ops,
> > +	.need_genpd_rpm_on = true,
> >  };
> >
> >  static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
> > @@ -739,6 +742,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	if (!phy_data)
> >  		return -EINVAL;
> >
> > +	if (phy_data->need_genpd_rpm_on) {
> > +		ret = dev_pm_genpd_rpm_always_on(dev, true);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "failed to set genpd rpm always on\n");
> > +	}
> > +
> 
> need set false at driver remove?

Not need. Because this device will be deteched from the power domain after driver removal.

Thanks,
Xu Yang
