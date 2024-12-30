Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BB6166F06
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735534890; cv=none; b=Ht3Unwd4a6JSMwRWuxy+9E3jZShcU2S771vZO/9OMPZmse3shUnOn0sB3iZQEWsB2kxnjxIZR5thp5UiYMGavUUsMcNItB7TgwQvqDJJlGc38j2eGQWf/j6uK7BW28Isi/PfdFgQr79iFj8mQd3fxPZikgO5AUWYzi0jpNDh4iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735534890; c=relaxed/simple;
	bh=KLHM+rpepwSZyO/0gnAKI+H3/80GL+dsgYoO+t1S2ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W44RdKU6SpTVY9XW8HwYZASdHNp7RW1ohU0W7iW6NB/DmGGKd0Vj3XdhOSizjw54KeL72NRpfdjiGiB2a6eIlDWxlYLojPg0hQrXV/X9KNzgr0W1MFz3Abt+QvK40K/zZHgZeBIKEkx1HnJFr1Cxm1d1b3dvIQAdSGrFKmGhIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=G0nXrO2X; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="G0nXrO2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OHwRFtQUHlQqYZRjfSIJzhBbHo/GTEW1e31T/9IquVk=;
	b=G0nXrO2Xn4TzdE9KrIdxZgbo7U5Mm8+F0GcgP3hIvJX/Ccbt0aHXSzbhOlouHv
	XklteE1FgdpTBfNLU76z3hiWXWZ0PccBWqNNFPQTyYYy9X0NQkwxRV3f5zv+rVXl
	rhzMOGrx4o4y3X8bL2XhM0EbNR1aH2MBcGh/6+A8rPriY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHvoAJKXJn_iUEBg--.60675S3;
	Mon, 30 Dec 2024 13:00:59 +0800 (CST)
Date: Mon, 30 Dec 2024 13:00:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"marex@denx.de" <marex@denx.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: imx8m: Add remove function
Message-ID: <Z3IpCXUL+tjHq9M8@dragon>
References: <20241206112843.98720-1-peng.fan@oss.nxp.com>
 <20241206114130.zt4rkotzbzi3xt5n@pengutronix.de>
 <PAXPR04MB8459052EFE2C6137146F9CFC883C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459052EFE2C6137146F9CFC883C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CM-TRANSID:Mc8vCgBHvoAJKXJn_iUEBg--.60675S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFWruw18KF47CFyDWFWruFg_yoWrJF43pF
	y8uF4rGFW8WFsFg3yaqa15Za4YywnFkw48Wr1xt347Kw1qvFy3XFyIqFy5C3W3JrWkZr4f
	JF1qy3yfuFWFvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2byAUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAXFZWdyDmBizwAAs3

On Mon, Dec 09, 2024 at 08:26:48AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH] soc: imx8m: Add remove function
> > 
> > On 24-12-06, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Unregister the cpufreq device and soc device in remove path,
> > otherwise
> > > there will be warning when do removing test:
> > > sysfs: cannot create duplicate filename '/devices/platform/imx-
> > cpufreq-dt'
> > > CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > > 6.13.0-rc1-next-20241204 Hardware name: NXP i.MX8MPlus EVK
> > board (DT)
> > >
> > > Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform
> > > driver")
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/soc/imx/soc-imx8m.c | 32 +++++++++++++++++++++++++++----
> > -
> > >  1 file changed, 27 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-
> > imx8m.c
> > > index 8ac7658e3d52..8c368947d1e5 100644
> > > --- a/drivers/soc/imx/soc-imx8m.c
> > > +++ b/drivers/soc/imx/soc-imx8m.c
> > > @@ -33,6 +33,11 @@ struct imx8_soc_data {
> > >  	int (*soc_revision)(u32 *socrev, u64 *socuid);  };
> > >
> > > +struct imx8m_soc_priv {
> > > +	struct soc_device *soc_dev;
> > > +	struct platform_device *cpufreq_dev; };
> > > +
> > >  #ifdef CONFIG_HAVE_ARM_SMCCC
> > >  static u32 imx8mq_soc_revision_from_atf(void)
> > >  {
> > > @@ -198,7 +203,7 @@ static int imx8m_soc_probe(struct
> > platform_device *pdev)
> > >  	const struct imx8_soc_data *data;
> > >  	struct device *dev = &pdev->dev;
> > >  	const struct of_device_id *id;
> > > -	struct soc_device *soc_dev;
> > > +	struct imx8m_soc_priv *priv;
> > >  	u32 soc_rev = 0;
> > >  	u64 soc_uid = 0;
> > >  	int ret;
> > > @@ -207,6 +212,10 @@ static int imx8m_soc_probe(struct
> > platform_device *pdev)
> > >  	if (!soc_dev_attr)
> > >  		return -ENOMEM;
> > >
> > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv)
> > > +		return -ENOMEM;
> > > +
> > >  	soc_dev_attr->family = "Freescale i.MX";
> > >
> > >  	ret = of_property_read_string(of_root, "model",
> > > &soc_dev_attr->machine); @@ -235,21 +244,34 @@ static int
> > imx8m_soc_probe(struct platform_device *pdev)
> > >  	if (!soc_dev_attr->serial_number)
> > >  		return -ENOMEM;
> > >
> > > -	soc_dev = soc_device_register(soc_dev_attr);
> > > -	if (IS_ERR(soc_dev))
> > > -		return PTR_ERR(soc_dev);
> > > +	priv->soc_dev = soc_device_register(soc_dev_attr);
> > > +	if (IS_ERR(priv->soc_dev))
> > > +		return PTR_ERR(priv->soc_dev);
> > >
> > >  	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
> > >  		soc_dev_attr->revision);
> > >
> > >  	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
> > > -		platform_device_register_simple("imx-cpufreq-dt", -1,
> > NULL, 0);
> > > +		priv->cpufreq_dev =
> > > +platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
> > 
> > If CONFIG_ARM_IMX_CPUFREQ_DT is enabled, I asusme that
> > platform_device_register_simple() shouldn't fail else it will be an error,
> > right? Therefore I would like to add the 'if(!IS_ERR())' check here
> > instead of the remove function.
> 
> You mean below?
> dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
> if (!IS_ERR(dev))
>    plat->cpufreq_dev = dev;
> else
>   pr_err("Failed to register imx-cpufreq-dt: %d\n", ERR_PTR(dev))?

Hmm, I'm not sure why we do not have error check on
platform_device_register_simple().  Shouldn't we do the following?

	priv->cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
	if (IS_ERR(priv->cpufreq_dev))
		return PTR_ERR(priv->cpufreq_dev);

Then I'm with Marco that we only need to check 'if (priv->cpufreq_dev)' in
remove function.

Shawn

