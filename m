Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B1201269
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734343181; cv=none; b=cR35HxgdYEsER4y9SQXe2DTCdTA8MDyJwck/Dai/U/Y960KtJ8jXTlLwlL6tlNLZ19qTGY0yXCmRpB3nVX3poO94Pb6El09Cj/4+yVcibM4I3+kD8u7+rlUF9wdhlfNkUKGkO6UGIFwtf34+N3m4lgSsOC+VFl45j9mYVdBbbVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734343181; c=relaxed/simple;
	bh=z8jRuBMHsUzN+G5xqP4dbCkXuQmhUoW2hC8mSs+MrCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw7aZPxYd9F671jraN4gql55c9+XrZaF2qI3UOOCuIV+4q3oskAEjhsyux3hTwEO3wXBbfxOPPgKHu+wJileLiSJaRmyzXpDC54cExetwDMt/tjHhq24eOKUzinIB+GOPEzw0j5bZ8L25ayZtgPTc6ZF1/lMyJ6JHyKT1iBPd7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yh6Az6zw; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yh6Az6zw"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3003c82c95cso32526411fa.3
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 01:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734343178; x=1734947978; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnJu3tNx6PFynXYk1/Woga2+QSGZXsPiestKM7hs3xI=;
        b=yh6Az6zwT6xXOTVMduaW7oFrAchzZSPoeBbL+vRvIU5wYbC6VjrHM2WKr423G68V25
         MaCOLVEq+Wv32dUfiaTWW9DwYqC+eZ5jVHS54kt0wLsZg6WgpsTcIvx60lG5n7k5Uj37
         RJ6x7a5O/X8L0bv32QIcNg4xUplKq7jlYspSPfURNduFSXBpTEH09HWFkMP3bkZci99O
         Xn4dkuAHRWFWRWaOh6ZF8/h6b+jiDUN5j9345sFu493qF6z6MOLY1F3nuweid9ts+NEO
         UH41bCFSR2X5rZa3qh14eg2U0VvrZipTOcPr+/+yeRGFHgFmEMI/3o8NC/ePBYS4MuyE
         OubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734343178; x=1734947978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnJu3tNx6PFynXYk1/Woga2+QSGZXsPiestKM7hs3xI=;
        b=pHAhB5C9LOrNwLjrI+bQVCYf6U6ZjWSBfxTqD/MMb/ejuUU7qah6AX9tyzDvcGeKYy
         e8mBP/t7kQMsqVvipkSWppWArKb6IQE02Y4TcROPle2pHrueoiI/Woh/Ixot0gWtyM7Z
         z9NKiKfvY0nGUVToDQqBdjQqYO7qyug68PHTGOX9A0OTocPfw+LZqEuN+e20ydZ9OxKi
         QPt0CTt8lcSYbjyf5jrc4C+wn1cuZagKGGr8MHPOhtt7ffJkWeekeXFWgKz/yOEjFOXp
         CTewtALCuFaw2pNEeSjPfauW/41dMx3wURSkAAV064YmvXHzSDGtQLrqXfmdyHwCaVLR
         Wgmw==
X-Forwarded-Encrypted: i=1; AJvYcCUM56njnntwHQtZkuanTmK9gtRrm9IiOe9tQhdPUpcgLq0DunGv/2IyzLEYvWz0A7FHFuw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUiw4UfA2jaQM3lNY+ypDPEKq9yarjzO1sJCH144LauBG8ef8A
	hFOy859TGaJ+mlVUb7D92gXFJ/Ti2SRGdZC6OSmXTiQzybIpajdc9eSGj3bHp7A=
X-Gm-Gg: ASbGncsiDqB7pQvMHQo1+gy4PVrag8Qk7A5vOzhIE8W/0tFde3shuT828Az6zjPmjio
	snGDXXHplZPIBggMdDCwtwSgwb9PKJuEvBWpcLvvcXQvh+4dz9kKLEQe+I5pLhN3kS91wcmyxCO
	GZU4BWrrPYxi2A1qEV0lBEO2ZbGcY5UQ0J/b6zQgvfhSQ2uwVq/3oCOI45vIOfACG4qD4f/Uwmi
	q1uYLGkp/wnIqNzKCEy8aDZ5vobnE0+TrCXEUiCtLNi3H5FasHwa6iZoTlMSnCVGSYbDSKKWFLQ
	wYcu38/wX9NefYs34nBDsQC9Cix9JxIAoSaB
X-Google-Smtp-Source: AGHT+IGzuyIoz4RW4zE50l9A5GROziEsvDO7/q2gt1gPF1DlZnBaj2q1Sy1bt91ZKI974j+OroEhRg==
X-Received: by 2002:a2e:a9a8:0:b0:2ff:8e69:77ef with SMTP id 38308e7fff4ca-302544230e1mr44031131fa.1.1734343177585;
        Mon, 16 Dec 2024 01:59:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a5a75sm8674571fa.99.2024.12.16.01.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 01:59:36 -0800 (PST)
Date: Mon, 16 Dec 2024 11:59:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v7 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
Message-ID: <75aewnwpb6y73gqlrqmelzeia7bdar5ihm3ety5gfjaqalkuby@gwv4xjpomoit>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
 <20241216085410.1968634-3-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216085410.1968634-3-andrej.picej@norik.com>

On Mon, Dec 16, 2024 at 09:54:09AM +0100, Andrej Picej wrote:
> Add a optional properties to change LVDS output voltage. This should not
> be static as this depends mainly on the connected display voltage
> requirement. We have three properties:
> - "ti,lvds-termination-ohms", which sets near end termination,
> - "ti,lvds-vod-swing-data-microvolt" and
> - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> output voltage for data and clock lanes. They are defined as an array
> with min and max values. The appropriate bitfield will be set if
> selected constraints can be met.
> 
> If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> end termination will be used. Selecting only one:
> "ti,lvds-vod-swing-data-microvolt" or
> "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> constraint for only data/clock lanes will be met. Setting both is
> recommended.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
> Changes in v7:
> - decrement refcount of the endpoint in all error cases,
> - add spaces to improve the readability of the long if statement conditions in
> sn65dsi83_select_lvds_vod_swing.
> Changes in v6:
> - rework termination resistor logic, default is now set by resistor value, not
> reg value,
> - move setting lvds_vod_swing_conf to default value of 0x1 inside if statement
> which checks if both properties are not set
> Changes in v5:
> - specify default values in sn65dsi83_parse_lvds_endpoint,
> - move sn65dsi83_parse_lvds_endpoint for channel B up, outside if,
> Changes in v4:
> - fix typo in commit message bitfiled -> bitfield
> - use arrays (lvds_vod_swing_conf and lvds_term_conf) in private data, instead
> of separate variables for channel A/B
> - add more checks on return value of "of_property_read_u32_array"
> Changes in v3:
> - use microvolts for default array values 1000 mV -> 1000000 uV.
> Changes in v2:
> - use datasheet tables to get the proper configuration
> - since major change was done change the authorship to myself
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 145 +++++++++++++++++++++++++-
>  1 file changed, 142 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
