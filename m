Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E88149C41
	for <imx@lists.linux.dev>; Sat, 12 Oct 2024 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728722891; cv=none; b=VIuuh8Kq/OFrzT5UDksXJzTPm8zk6wWxw4pvz5tW2tMnN9cuI3NGJxihO59oWNmDH5/L5BGHUsRgA8luQfW4/Bl662wEkGTVy3sZje896wrYCLxOqAtWgekVB0NS2NQmEWssamY7m9L9B0mdh6LhaCo9NfrRJgqVXhWlpv62Z8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728722891; c=relaxed/simple;
	bh=KFuQlRLZV6kFsSMadCKcwpjYQJM58BTvJl7C1jSy1eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdX6TuR4JGJI1PihpoEGfTRnSW72poRE/rKLfARDIFdqDIl3QMpnc9yFv5zcgnF77+Ubr5MB2WnEflup7/Q+8SiW4Erl2E3Tb1sOrFLv4lBEd11xyKFJSqwnI75ICdkByGVnOKzBpWjR/hGAeABIxCdzAH7BouWyIY5mClq7Fp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9NJzF31; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9NJzF31"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398d171fa2so3612291e87.0
        for <imx@lists.linux.dev>; Sat, 12 Oct 2024 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728722888; x=1729327688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ash+1oKuFiPE3A8tEMkMCFcio5xBuHLSoR41kg8F3Os=;
        b=P9NJzF31jpS/kVLAGf/vvxHVpFbAtGuZkQ1nRjP31DUMam9vc/2fPfNCzocB3hAZn6
         4PREVErY+ew095r0fF0IK3XCCCFxEmG1LaDFVUfWg7DPHtPOV63f50oge84Zrw/KhHKh
         JxgR6lW1e13q33fnH97t83UJHOPN9fLvL/0YNNTN7EcA6NcqmvnKsEvVUTJ+s9y2rZPW
         i2v5NMWr1/xrnQhHaeQZu8g1lJmNO0atGE2dQTyB80TLP/f/mITdaChMUgoREM9u3o7w
         psXDFUwAYfREIPEl/xep/MZ0JztG8ADQ7Wq0C3qhMeYQ2QHCc9pVo+UeftKneIUd8lFa
         ujaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728722888; x=1729327688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ash+1oKuFiPE3A8tEMkMCFcio5xBuHLSoR41kg8F3Os=;
        b=d1WPnbFmUi7kPoyV6F8Zzkj0IHLcjD5j4HYXm85M0DvcWVDB6E+8EcPAQ7iCOqVZeN
         RVjRXuW7oo9Ys+X9rEqI9carj8qy1t3R7YU1ilRTP8u45H1OSqOXvziDHuiZa5Ei+R9z
         707SCD0DeZlNF7Jd+BXNnoLxvw3l+2hI+E2ia9R+uO7f4mHcI3pJS+1M2jsbWZb/mcZh
         DAGhQXnS6KwZucO3p1E0KvTl98tkl4Ga7Um80otFh13lrxPGbL3rl5rXOizcxM2L/1J5
         cnTNgvd0WWU2D0UWnPtToA7pTcIMVigMPe5NStYDcLGH4DGGdRAEsa423mlHKH8eyE8N
         n4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgurtEZ4ujBousc//I8yCajPlKtjdcaKazxkskDDwzrdfjQvIxD8KBiYqA5LHLHknAPzw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxdRHwk0ryl5iO+fBR8aVNMJSouuIxqoV9ho0aZC6qcj+xezI6
	YlYtyJ1onwR6CpvpwlUKuoTXju1/7OK+GaOFG0j3YnDe1NuSPP9z/IPlhPiPRZQ=
X-Google-Smtp-Source: AGHT+IHEc4ZuCZYoFT2OUlml69hpickixa0aunTqwOmFQLHqCQKZVS3BFKcMPasacN1gqJ2srIOpVA==
X-Received: by 2002:a05:6512:2384:b0:539:8f4d:a7c9 with SMTP id 2adb3069b0e04-539da552ebfmr3052540e87.41.1728722888062;
        Sat, 12 Oct 2024 01:48:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2c82823sm356433e87.184.2024.10.12.01.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 01:48:06 -0700 (PDT)
Date: Sat, 12 Oct 2024 11:48:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 3/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Message-ID: <o7f5xi4ppam6ox2a6h7xgofgg62ewxfptgsbisbbqkwlwkjbmy@r7mgbhby5x6s>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-4-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012073543.1388069-4-victor.liu@nxp.com>

On Sat, Oct 12, 2024 at 03:35:37PM +0800, Liu Ying wrote:
> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * No change.
> 
>  drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
