Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F252AF1D
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734952546; cv=none; b=TXe1UgPg2WWasV/jcKALU23lo9MjiyJlWYSn/7nDk8bWYwIEpypcSr3aIb9RV0jeLouOYh0kHZqEZsjHzd+6NqgUK/OMDwZyOJYqvaFU3kKMero8FjiET+WjTY7mjh5yEMOtRfRHf6p2FemqEqlE3X4fDsTsKMvnPxBzzr+ewPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734952546; c=relaxed/simple;
	bh=idEEV1+MD0GqLsg8r4dUdSLvnO/fV2kMnl3JISpwPL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCeHpehdp9Rt10VWjYRVzuciNSBtGFXFq/r5wkM+1Ry2et9BVEBjsRXhIBf+CDcOr8fmXAbCSzFybnRMaJjEd2T21Vt2jyb5JE/9JSS43L/UwK4JJzT/KPcYi+csPROm0WX+8zc4ApirVG21yWTAJN7+fo27nIp0dekX39XJ7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yAUO74PM; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yAUO74PM"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3022c61557cso51163941fa.0
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734952543; x=1735557343; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mo6MP2QToWKxW6CHGPpfwk7yms3zeJ7L1O8Z7JM6ls=;
        b=yAUO74PMMekQnyxv2bFA/ngPQzBKfiyFZbs9CvK7XRMDuixp4NM+jvyHpyLZqkvD4J
         RWNWqOZdxZsbHAiSFhdPObtP66erLI4f1NzCFouH7V/8GaUmhJa73KR9hxzQpKIIotPe
         KfyhekFbIo3QP0jCY/0Pj5LzYPuC0iO31rO1Mp9//pAyN800+q06PDWYezst6ut2h/5q
         YKoZ6EpDpC/BHAr1BvvaAqozww3+J37Iffqbvv3hB6TU91q2/dJZCwNhBZLgHaOt0qD8
         tRJTKEJ8D85MH8aBT1djdXi8WFuRKpxCMDkpw9tY7FRGvyYA5lSyKWZB8fEkw49IJ1M7
         NEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734952543; x=1735557343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mo6MP2QToWKxW6CHGPpfwk7yms3zeJ7L1O8Z7JM6ls=;
        b=NzkP/446jwQVB14eatWSP9TenUgce68rTtBxOBq6bQFqTPnhqO5vLC945B5mrc4Y7+
         KacZgR9gmBS6pKeGDRVAmFUsPkeE35jzZFOJrPKzK4Fa+6VPsDzGAxLDecPkv3PaflKn
         9k0jqlWJwBKyN4v1Hez4bMI8EQNVzeFMs9Plz/UlbJ1oOdm7FdK3DuLDQNcFBzMABJ/c
         AZW8153+avkXGSZXOoQQiJ4IhtEBc2lixfhdM8oytNSvSleFri9YbmWtmTyyzjb45rrh
         ckIL0l71tsHSDU3katAlkBOK9AhJZ/6WJDx3eB3y3dkCinyl6zs+Xxw42seMENLj+NvE
         yUgg==
X-Forwarded-Encrypted: i=1; AJvYcCWU0zw8bgw/MYlb1uxwdhQ57fIkaK6KUFrn4yF1G+YzU4W58K58JYrXtV67P1AXa8raVMw=@lists.linux.dev
X-Gm-Message-State: AOJu0YziJpOOa1VW6gLBjhSxfO3ddhpguyvkHvDw9M2/ioQR0KxICyzb
	KPv7d727Yu0qUtLS52N6Ji5LlBP1m6AtaQwxKZ+HgqdtANxReHvITNU7rRVAPC4=
X-Gm-Gg: ASbGncv5Bf/QdafAOGz7zwqTQLozIdtGfMAUPC9B4g21tQRM+tZ3B2TBc+8ue54lTCo
	ZZC/UXa4l2L64hrCIRSffm8SNMOrIVj2lCmxGsxr8j85goIXL3fmgFaCkZBskwyDCQR6Vw+uBmK
	TpEV2baObhokAVh6J6EF6lictgNdfcjNV4Ey/36bGgcVgMHCXBskDLMD9pV+m+HyfKotz/6VRFj
	A9cc/nOlpU2Nyt5+KIDVYITl32c1w/dd3u2qn6F/5AK/KWzwFyfWQOZHKbLu5kfbR92nQIUFWl+
	3Q53W5RYPshYe4HcbTAsq8/WHTi+NVxZGqZE
X-Google-Smtp-Source: AGHT+IEgmX/5ATGHYxkBwsAFplT1zESRogm6vsP2Mbb2JNoPZ4jUEIIAF7+Dio6FJRuZVz2+3nzV0g==
X-Received: by 2002:a05:651c:b0a:b0:304:4cac:d8ef with SMTP id 38308e7fff4ca-304685487c2mr37661981fa.7.1734952543223;
        Mon, 23 Dec 2024 03:15:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b083e92sm12807641fa.116.2024.12.23.03.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:15:41 -0800 (PST)
Date: Mon, 23 Dec 2024 13:15:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
	u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <7k2jqpkpagm3x7shywgzvtst364f6dmmhuz2covpbvghoa5rzc@3dvlbdgtnjck>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-11-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-11-victor.liu@nxp.com>

On Mon, Dec 23, 2024 at 02:41:38PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver and those unit
> drivers are components to be aggregated by a master registered in
> the upcoming DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.
> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * Fix build warning by expanding sizeof(fu->name) from 13 to 21.
>   (kernel test robot)
> 
> v5:
> * Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
> * Fix commit message to state that pixel engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_lb_blendcontrol() function call from KMS routine to initialization
>   stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.

Carrying several comments from previous patch:
- shdld vs shdload
- use of indices in the compat strings
- bind() behaviour depending on the particular order of device bindings

> 
> +
> +void dc_fu_common_hw_init(struct dc_fu *fu)
> +{
> +	enum dc_fu_frac frac;
> +	int i;
> +
> +	dc_fu_baddr_autoupdate(fu, 0x0);
> +	dc_fu_enable_shden(fu);
> +	dc_fu_set_linemode(fu, LINEMODE_DISPLAY);
> +	dc_fu_set_numbuffers(fu, 16);
> +
> +	for (i = 0; i < ARRAY_SIZE(dc_fetchunit_all_fracs); i++) {

for (i = DC_FETCHUNIT_FRAC0 ; i < DC_FETCHUNIT_FRAC_NUM; i++) ?

> +		frac = dc_fetchunit_all_fracs[i];
> +
> +		dc_fu_layeroffset(fu, frac, 0, 0);
> +		dc_fu_clipoffset(fu, frac, 0, 0);
> +		dc_fu_clipdimensions(fu, frac, 1, 1);
> +		dc_fu_disable_src_buf(fu, frac);
> +		dc_fu_set_pixel_blend_mode(fu, frac);
> +	}
> +}
> +

[...]

> +enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
> +{
> +	return lb->link;
> +}
> +
> +void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
> +{
> +	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
> +	int i;
> +
> +	for (i = 0; i < fixed_sels_num + lb->id; i++) {

This function and the next one silently skip writing link ID if it is
incorrect. Can it actually become incorrect? If not, I'd say, it is
better to drop the loop and the array. If you are not sure, there should
be some kind of dev_warn() or drm_warn().

> +		if (prim_sels[i] == prim) {
> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
> +					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
> +					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
> +			return;
> +		}
> +	}
> +}
> +
> +void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
> +		if (sec_sels[i] == sec) {
> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
> +					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
> +					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
> +			return;
> +		}
> +	}
> +}
> +

[...]

> +
> +static int dc_lb_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	struct dc_pe *pe = dc_drm->pe;
> +	void __iomem *base_pec;
> +	void __iomem *base_cfg;
> +	struct dc_lb *lb;
> +
> +	lb = devm_kzalloc(dev, sizeof(*lb), GFP_KERNEL);
> +	if (!lb)
> +		return -ENOMEM;
> +
> +	lb->id = (enum dc_lb_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
> +	if (IS_ERR(base_pec))
> +		return PTR_ERR(base_pec);
> +
> +	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
> +	if (IS_ERR(base_cfg))
> +		return PTR_ERR(base_cfg);
> +
> +	lb->reg_pec = devm_regmap_init_mmio(dev, base_pec,
> +					    &dc_lb_pec_regmap_config);
> +	if (IS_ERR(lb->reg_pec))
> +		return PTR_ERR(lb->reg_pec);
> +
> +	lb->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
> +					    &dc_lb_cfg_regmap_config);
> +	if (IS_ERR(lb->reg_cfg))
> +		return PTR_ERR(lb->reg_cfg);
> +
> +	lb->link = lb_links[lb->id];

lb->link = LINK_ID_LAYERBLEND0 + lb->id ?

> +
> +	pe->lb[lb->id] = lb;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops dc_lb_ops = {
> +	.bind = dc_lb_bind,
> +};
> +

-- 
With best wishes
Dmitry
