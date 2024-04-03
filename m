Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026614A0A2
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 16:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712161556; cv=none; b=YsZh0B+GoOGVKGUNNhR19ZzEPB9C/4GfR07a5vedfX8i3pw1AYDIChs2CqVs9CJ2q92DIpYSJu/3tRHf7tVVzwy3BxDUJwPex6MMEt0942sKVjIag5KhRDgDibO1en3ByniEaI7GTqCTi8IhkwhsOU49Rt2dUzsr/J1kjakzEt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712161556; c=relaxed/simple;
	bh=JMCBB+N9+FM9hPmjmm5AAROCcok9dIVw6il7pADCYVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhXbuyvR8bztcGnk9yhS/O4J8rwWzHFGbeFW+zUPalzqhZUB4pUXJaX9fLTL8ZKH0MuClz98zuilZs1ed8oN84EWDnrLaiLmvhTcxAa2D3Te4Elfg5fUCGIxLIo9WOkbOhHXwEc2Ev4Z/1bFIB1Fo8mPl9KE4RtyuTlQvvhkZ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra/sd2t3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra/sd2t3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712161555; x=1743697555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JMCBB+N9+FM9hPmjmm5AAROCcok9dIVw6il7pADCYVc=;
  b=Ra/sd2t39IBEmxp8hWoYEbdy6bRZ91ItN2zcXsKJkCbYpOJuAx/R4ANz
   +QPSlxAtYnNhBJ+Kj6MCBeY/DYQknXLiArCOd/PaW2XfwS+p6eSRXSsPn
   ElC1uJJ5R4QLs3wj983ZdLyeXxHAy9so28eHd08vZ+0Rcd0keTi7rfp/T
   PSTfrlgYl63i6d3c+UpURdl+DSFmRzYhX1AO5+y1XzLxdVlqE5AbKqhrH
   rN3XVWcyj5ZzLhyYk/TH5XHa9yxD6N15WquYPL8+UYaK913gWosNMt+ik
   DCZjML0+BhzoYx72b9a7s2fnD2IiQqxAKhXAYZbRxwB/CmWusA7E6nBGC
   g==;
X-CSE-ConnectionGUID: Kob3IDPvRaikxZFhprZs/w==
X-CSE-MsgGUID: xr1mcdu1Ss6YlM+np6BqFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11184813"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="11184813"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 09:25:49 -0700
X-CSE-ConnectionGUID: 86lZB59dQ9SiXD5HsxZ5yw==
X-CSE-MsgGUID: 8XLS/jgPQ++ZeivpXNauUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18468376"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 09:25:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 96D8611F811;
	Wed,  3 Apr 2024 19:25:41 +0300 (EEST)
Date: Wed, 3 Apr 2024 16:25:41 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@luigi311.com
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH v3 23/25] drivers: media: i2c: imx258: Add support for
 powerdown gpio
Message-ID: <Zg2DBasC501hMQSS@kekkonen.localdomain>
References: <20240403150355.189229-1-git@luigi311.com>
 <20240403150355.189229-24-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403150355.189229-24-git@luigi311.com>

Hi Luis, Ondrej,

On Wed, Apr 03, 2024 at 09:03:52AM -0600, git@luigi311.com wrote:
> From: Luis Garcia <git@luigi311.com>
> 
> On some boards powerdown signal needs to be deasserted for this
> sensor to be enabled.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Luis Garcia <git@luigi311.com>
> ---
>  drivers/media/i2c/imx258.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 30352c33f63c..163f04f6f954 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -679,6 +679,8 @@ struct imx258 {
>  	unsigned int lane_mode_idx;
>  	unsigned int csi2_flags;
>  
> +	struct gpio_desc *powerdown_gpio;
> +
>  	/*
>  	 * Mutex for serialized access:
>  	 * Protect sensor module set pad format and start/stop streaming safely.
> @@ -1213,6 +1215,8 @@ static int imx258_power_on(struct device *dev)
>  	struct imx258 *imx258 = to_imx258(sd);
>  	int ret;
>  
> +	gpiod_set_value_cansleep(imx258->powerdown_gpio, 0);

What does the spec say? Should this really happen before switching on the
supplies below?

> +
>  	ret = regulator_bulk_enable(IMX258_NUM_SUPPLIES,
>  				    imx258->supplies);
>  	if (ret) {
> @@ -1224,6 +1228,7 @@ static int imx258_power_on(struct device *dev)
>  	ret = clk_prepare_enable(imx258->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clock\n");
> +		gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
>  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>  	}
>  
> @@ -1238,6 +1243,8 @@ static int imx258_power_off(struct device *dev)
>  	clk_disable_unprepare(imx258->clk);
>  	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>  
> +	gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
> +
>  	return 0;
>  }
>  
> @@ -1541,6 +1548,12 @@ static int imx258_probe(struct i2c_client *client)
>  	if (!imx258->variant_cfg)
>  		imx258->variant_cfg = &imx258_cfg;
>  
> +	/* request optional power down pin */
> +	imx258->powerdown_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> +						    GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx258->powerdown_gpio))
> +		return PTR_ERR(imx258->powerdown_gpio);
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>  

-- 
Regards,

Sakari Ailus
