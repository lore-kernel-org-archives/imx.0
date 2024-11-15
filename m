Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB097189BAF
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731628830; cv=none; b=es0uNc59n5bfEHYi7LMGtCbHVWDFz32lo08bmWnAyC1s7ARORVQtFGAV74G2qzPe4jgE+4pHDzxiNF2ZRdoES30cj8Wva1VN8cShajORZZWnnxlFXXWEYAnRfOfibWTmQV9EA81zFtx+uGckGhpQlcIFrtFLTFvGrT8nRGjLurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731628830; c=relaxed/simple;
	bh=seximQ95TY/KDhb+vB8Hrmxf7e199hCpmjuNkdXkuG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCfynZqak011sIWZuPfTDF1XnoYtYOws5RrWjINb4Cg7yJPvMCADWPZ8iVz3mbvNdnw/w46tAF8cEOcSRJolOKSIqpUFI366xO/dM1xkIeiz7pAl+uPFp473J8s4o6viaYvlxY70C0ASSwYF2wHVh+72qn2dth2AB5BPvdbRUGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KIb6hzSj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KIb6hzSj"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A70BBFF1;
	Fri, 15 Nov 2024 01:00:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731628811;
	bh=seximQ95TY/KDhb+vB8Hrmxf7e199hCpmjuNkdXkuG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIb6hzSjvZi+J215tZhJkpOSoFXv9XqPGhABEBwjpXQ4B6N+OPgaj15PQGDZO4pgG
	 pKW5P8w1nGcKc5bGr2PBfR7q5jQey9fnnYvZSfTfFtY41ijd0Ze6hX8Q+iawcm0wIh
	 XZ3nwvYYRJhkMlpoqSZ5EaeR/3UouV089nRb9ztc=
Date: Fri, 15 Nov 2024 02:00:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] media: i2c: imx290: Limit analogue gain according to
 module
Message-ID: <20241115000017.GH31681@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>

Hi Dave,

Thank you for the patch.

On Thu, Nov 14, 2024 at 04:01:13PM +0000, Dave Stevenson wrote:
> The imx327 only supports up to 29.4dB of analogue gain, vs
> the imx290 going up to 30dB. Both are in 0.3dB steps.
> 
> As we now have model specific config, fix this mismatch,
> and delete the comment referencing it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index ee698c99001d..da654deb444a 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -176,6 +176,7 @@ struct imx290_model_info {
>  	enum imx290_colour_variant colour_variant;
>  	const struct cci_reg_sequence *init_regs;
>  	size_t init_regs_num;
> +	unsigned int max_analog_gain;
>  	const char *name;
>  };
>  
> @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	 * up to 72.0dB (240) add further digital gain. Limit the range to
>  	 * analog gain only, support for digital gain can be added separately
>  	 * if needed.
> -	 *
> -	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
> -	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
> -	 * gain. When support for those sensors gets added to the driver, the
> -	 * gain control should be adjusted accordingly.
>  	 */
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> +			  V4L2_CID_ANALOGUE_GAIN, 0,
> +			  imx290->model->max_analog_gain, 1, 0);
>  
>  	/*
>  	 * Correct range will be determined through imx290_ctrl_update setting
> @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_models[] = {
>  		.colour_variant = IMX290_VARIANT_COLOUR,
>  		.init_regs = imx290_global_init_settings_290,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain = 100,
>  		.name = "imx290",
>  	},
>  	[IMX290_MODEL_IMX290LLR] = {
>  		.colour_variant = IMX290_VARIANT_MONO,
>  		.init_regs = imx290_global_init_settings_290,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain = 100,
>  		.name = "imx290",
>  	},
>  	[IMX290_MODEL_IMX327LQR] = {
>  		.colour_variant = IMX290_VARIANT_COLOUR,
>  		.init_regs = imx290_global_init_settings_327,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_327),
> +		.max_analog_gain = 98,
>  		.name = "imx327",
>  	},
>  };
> 

-- 
Regards,

Laurent Pinchart
