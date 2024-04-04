Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12C54904
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712214442; cv=none; b=uDBAmEXJ9aGAys7qjD42LIJXBqccN+WkokEudcdbXRGzTvoeh7HBsRabD8RVPM2PDWlvdEhS0ovrqblIj6OC3ZgnN3evVQlzRZVy9RFliOIvzM9G5jVyMtYwo8+9TQsRrlBAtiwz//5nHhZtXqlfBW7BN3AnTKIk9bXe05EDIPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712214442; c=relaxed/simple;
	bh=tjbbmFyUGmir3OJpfaGpvWL1H1B8isI2qONOSsxGtMM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkfbvfjtN1GjbDxzKJVhF3CMAQGISo3MU5R0RwiLexV9ZDfMvEeCd1utDuqsfZMmUolStENR5NaaB1VmrdymbsbXTwuSgfGPEadwOhMCC60nDHP4LoVGhgm34Y7TLPP2qhEt5HcH4cNWALSWisXm43VNMlQOoPAs+z8oQtDNr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqySJV0M; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqySJV0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712214440; x=1743750440;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=tjbbmFyUGmir3OJpfaGpvWL1H1B8isI2qONOSsxGtMM=;
  b=jqySJV0MV06EsYAN8kGvlZEklBXXUzDsFkQKrunZcgu9knWqTukOv3tH
   F+ZTCGUae6OdHC6eWJGGH3NqjXORBAjb2q8gB72aGO+IvAz3I93idaX7i
   VIaluPP73CJAIru7nmgPSNf/HAh2YiYcfU5gLmODIDEJipsq9fpHWZNLu
   dnWsA8hCV5ja0yWQe6y47kg9vBeI/d3ZoYV1c+t1mO62XGZKbffLWwatT
   060V5LN9/KywAY5DqVPDph46mQXBBeTixfnVdvA4/NFCwlXms/DsqIQQ8
   nyrBzyHhdNqYzgC5i5fAfTWzWXxyf1g4Oe0iV/AJoCznYIQOek0DWHGW1
   g==;
X-CSE-ConnectionGUID: vBEvCkIUS+OxfxOWM3y1xw==
X-CSE-MsgGUID: ArpgpHxkTLOWJeASDMZxWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="24937332"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="24937332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 00:07:20 -0700
X-CSE-ConnectionGUID: q0v0pLBsRLGeoCKZTqlbxw==
X-CSE-MsgGUID: J7gP4feRQfqFqPlm4D3YLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="56139003"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 00:07:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2680C11F855;
	Thu,  4 Apr 2024 10:07:12 +0300 (EEST)
Date: Thu, 4 Apr 2024 07:07:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>, git@luigi311.com,
	linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 23/25] drivers: media: i2c: imx258: Add support for
 powerdown gpio
Message-ID: <Zg5RoHjvpLhDo5NE@kekkonen.localdomain>
References: <20240403150355.189229-1-git@luigi311.com>
 <20240403150355.189229-24-git@luigi311.com>
 <Zg2DBasC501hMQSS@kekkonen.localdomain>
 <wjlcde7yoooygj4hhdmiwrdloh6l4p6i2qbmjek5uwsifyzwgu@xjhutvmsdfou>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wjlcde7yoooygj4hhdmiwrdloh6l4p6i2qbmjek5uwsifyzwgu@xjhutvmsdfou>

Hi Ondřej,

On Wed, Apr 03, 2024 at 06:57:56PM +0200, Ondřej Jirman wrote:
> Hi Sakari and Luis,
> 
> On Wed, Apr 03, 2024 at 04:25:41PM GMT, Sakari Ailus wrote:
> > Hi Luis, Ondrej,
> > 
> > On Wed, Apr 03, 2024 at 09:03:52AM -0600, git@luigi311.com wrote:
> > > From: Luis Garcia <git@luigi311.com>
> > > 
> > > On some boards powerdown signal needs to be deasserted for this
> > > sensor to be enabled.
> > > 
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > Signed-off-by: Luis Garcia <git@luigi311.com>
> > > ---
> > >  drivers/media/i2c/imx258.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > > index 30352c33f63c..163f04f6f954 100644
> > > --- a/drivers/media/i2c/imx258.c
> > > +++ b/drivers/media/i2c/imx258.c
> > > @@ -679,6 +679,8 @@ struct imx258 {
> > >  	unsigned int lane_mode_idx;
> > >  	unsigned int csi2_flags;
> > >  
> > > +	struct gpio_desc *powerdown_gpio;
> > > +
> > >  	/*
> > >  	 * Mutex for serialized access:
> > >  	 * Protect sensor module set pad format and start/stop streaming safely.
> > > @@ -1213,6 +1215,8 @@ static int imx258_power_on(struct device *dev)
> > >  	struct imx258 *imx258 = to_imx258(sd);
> > >  	int ret;
> > >  
> > > +	gpiod_set_value_cansleep(imx258->powerdown_gpio, 0);
> > 
> > What does the spec say? Should this really happen before switching on the
> > supplies below?
> 
> There's no powerdown input in the IMX258 manual. The manual only mentions
> that XCLR (reset) should be held low during power on.
> 
> https://megous.com/dl/tmp/15b0992a720ab82d.png
> 
> https://megous.com/dl/tmp/f2cc991046d97641.png
> 
>    This sensor doesn’t have a built-in “Power ON Reset” function. The XCLR pin
>    is set to “LOW” and the power supplies are brought up. Then the XCLR pin
>    should be set to “High” after INCK supplied.
> 
> So this input is some feature on camera module itself outside of the
> IMX258 chip, which I think is used to gate power to the module. Eg. on Pinephone
> Pro, there are two modules with shared power rails, so enabling supply to
> one module enables it to the other one, too. So this input becomes the only way
> to really enable/disable power to the chip when both are used at once at some
> point, because regulator_bulk_enable/disable becomes ineffective at that point.

The hardware designers sometimes do not consider the difficulty of
implementing software support for their choice of design. Maybe this could
be modelled as a GPIO regulator? But it'd depend on another regulator and
I'm not sure that is covered.

The camera sensor generally consume very little power in software standby
mode so the potential saving here are probably irrelevant.

> 
> Luis, maybe you saw some other datasheet that mentions this input? IMO,
> it just gates the power rails via some mosfets on the module itself, since
> there's not power down input to the chip itself.
> 
> kind regards,
> 	o.
> 
> > > +
> > >  	ret = regulator_bulk_enable(IMX258_NUM_SUPPLIES,
> > >  				    imx258->supplies);
> > >  	if (ret) {
> > > @@ -1224,6 +1228,7 @@ static int imx258_power_on(struct device *dev)
> > >  	ret = clk_prepare_enable(imx258->clk);
> > >  	if (ret) {
> > >  		dev_err(dev, "failed to enable clock\n");
> > > +		gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
> > >  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> > >  	}
> > >  
> > > @@ -1238,6 +1243,8 @@ static int imx258_power_off(struct device *dev)
> > >  	clk_disable_unprepare(imx258->clk);
> > >  	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> > >  
> > > +	gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > @@ -1541,6 +1548,12 @@ static int imx258_probe(struct i2c_client *client)
> > >  	if (!imx258->variant_cfg)
> > >  		imx258->variant_cfg = &imx258_cfg;
> > >  
> > > +	/* request optional power down pin */
> > > +	imx258->powerdown_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> > > +						    GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(imx258->powerdown_gpio))
> > > +		return PTR_ERR(imx258->powerdown_gpio);
> > > +
> > >  	/* Initialize subdev */
> > >  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
> > >  
> > 
> > -- 
> > Regards,
> > 
> > Sakari Ailus

-- 
Regards,

Sakari Ailus
