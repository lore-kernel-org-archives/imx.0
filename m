Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAE7185607
	for <imx@lists.linux.dev>; Sat, 27 Jul 2024 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722096824; cv=none; b=l5HnQpJch/hjeUYJRWyOOUkbmZnLYS1v8ewOi8Aeq2pttMNUszW3lBu6CLj2Zwf/N0NmlKCwXUZfhMqIKWB8VhLfLKXvWbJN0SSImLa3BTXbeukF5e9psuw0rpmHwjXeXR9YPgVBa0Xdd6QH/7+j+tf9FPBkFW/jk+IQJe0RyII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722096824; c=relaxed/simple;
	bh=YEvZ8y2XBMsTfj4J2K4E5pRcf/SFM7Y6vwha/HOEo/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqa4GP0kY6Jn1zY/r4oT5GyXgcCbGpNOGRNU7p/Lv3NC179HlaI1pSZoKFPFYAcvT0VwvLXH/B4FgRPvBt0yW+QjjUx1H+Q1mKh/uDr1nHtUNQzypEJcNDmeg2iqABEClRDrEphYcd0EB2PJaDceYnjYp2x0Poy3dsyb9844vqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IB+V9mng; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IB+V9mng"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f03df8c8cdso21567681fa.1
        for <imx@lists.linux.dev>; Sat, 27 Jul 2024 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722096821; x=1722701621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R65NOswuKmOlcg5v/47v/NC7ISjyuU0IR8ikjFCmA14=;
        b=IB+V9mngbsncfO8uxNk90AF6KZ8+3MKBPl2GKx/JwTC/hK8cav90uKjfYimePgmchb
         g02Bhb5ZCPD72ygaPRk+rkDT+a27DKWyMRmWREBR5FpKptOUQgxYncvAR4H4ZLCjZjmY
         6DnUDEbAoVsszE6zcWjqMNDelE1NeACDtoxBChe4AhsB/rNCWowo4f7Kr+QMzSDQZHHv
         hC+91YG1Qx36xEeR/S2/BCTXupfcfEXJm2TrBehZBZso7ygyW/bLXnZZI2WbiGrY8TL+
         G+OP6AfWsevNQa9QT7/5bVUfJX4tAIfL9YOXpsFiq5jSRxzTjSDu//lAX8ycWJJ+hJQw
         U3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722096821; x=1722701621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R65NOswuKmOlcg5v/47v/NC7ISjyuU0IR8ikjFCmA14=;
        b=NHpAk3MA6enO4ZorkiNxpoHg+ybsPkZlaPLDsMFeZh2YwzWokCMEXCJSrL6njxTC9e
         rlLcuP+ufGPERTi0FctF0aryTPo85uyFgRPFnJrSlEC+YgBqPh79LLIw5s8F5x6NLWDf
         O/eEbtL+9xIDqWAL1UK/KjtpmuC/6qRzNIGLLSp79bf3ozi9kQOXCwi+z31qFLiuYTAs
         8cJ7iPLgIQfgUxz4Q3sDFEHl02kOTUd57ceJZWPelQNr8XvvOtJXv3A54Q3dNZDLgEvd
         nLkG9PrnbzDYVz11hefJGjHXDTW4jxpr4vFW0C+7eFXA42Xb5bJr3+z96Tw1T0pgk+Lk
         Jcmg==
X-Forwarded-Encrypted: i=1; AJvYcCXdtu98qA6QVif06GzY6qdvo1cSeYuLsRciFSE5yhkMNP2buDgpauj9vcgTJiN5uAKtNCNE4pXFu2rZ0y73ersM2j9j
X-Gm-Message-State: AOJu0Yw7SFcLcFtdHtAdocQdmNXKokqOb0jh7aaWgu8zNCKRskE4ZgkQ
	0QX9ALdTxcXpPsnp1qN1ND2WR9RPbxxIOJba1qIINAzw9upPRHXK+FS5aLUoxr8=
X-Google-Smtp-Source: AGHT+IFmhVyFWyXbEhPfCIHxIT/ADxUCtbXvdsR87jH1Y5GSmJB81c7AAgcrJPh51vmgGGoCWI49Lg==
X-Received: by 2002:a2e:9085:0:b0:2ef:2f8a:52d5 with SMTP id 38308e7fff4ca-2f12f0bb2b1mr6793381fa.8.1722096820422;
        Sat, 27 Jul 2024 09:13:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f12dda4129sm2714401fa.139.2024.07.27.09.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 09:13:40 -0700 (PDT)
Date: Sat, 27 Jul 2024 19:13:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, 
	frank.li@nxp.com
Subject: Re: [PATCH v2 07/16] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <ibdzow7lvbimaefrp2z2aolgp4pytpq3dcr2y3pegjavvknhgm@2e6j3f4zytqp>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-8-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-8-victor.liu@nxp.com>

On Fri, Jul 12, 2024 at 05:32:34PM GMT, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver as a master binds
> those unit drivers as components.  While at it, the pixel engine
> driver is a component to be bound with the upcoming DRM driver.

Same question / comment: create subnodes directly, without going
through the subdevices. A lot of small functions that would benefit
being inlined.

> +static int dc_cf_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	struct dc_pe *pe = dc_drm->pe;
> +	struct dc_cf_priv *priv;
> +	int id;
> +
> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
> +	if (IS_ERR(priv->reg_cfg))
> +		return PTR_ERR(priv->reg_cfg);
> +
> +	id = of_alias_get_id(dev->of_node, "dc0-constframe");

Is it documented? Acked?

> +	if (id < 0) {
> +		dev_err(dev, "failed to get alias id: %d\n", id);
> +		return id;
> +	}
> +

-- 
With best wishes
Dmitry
