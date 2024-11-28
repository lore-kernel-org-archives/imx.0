Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DBF192D77
	for <imx@lists.linux.dev>; Thu, 28 Nov 2024 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732803516; cv=none; b=a9x1czXW/jE+aQ65aBNlI8MwZFXxZ2RadYPRgGVdTtvdosqET2FsfH1fvFYL/vH3wKV8VO/jUklQYstd3UE+N3GtPiEsaKYfTH7v328fuI39gO/8kOVYw5l+4DEstHE6Lr8KV6LJLY2iD7kT4FxHl58d2bzvLEeIVKI+yUfZbe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732803516; c=relaxed/simple;
	bh=dcwb9b33KIM/BSPqPVuj+rX/P95ylrOXU+LmT00E+2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rc5cNJN7QtJfFVvJgiMle/Sxt7Hpvz30EUfhfnbbSnCUKfqgXsX151CdOixOJsEUlEHI9lv+zRY0LIULp5EDBbkCFMI8mSb0UiXmBrezgMGAXlvcBIg8cr5B3L6PHjQy26v5FpZISWdDWRbzLji3/Xt22dd5jiugb6H7xOdxkYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQN3Gkn1; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQN3Gkn1"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffc357ea33so9507951fa.0
        for <imx@lists.linux.dev>; Thu, 28 Nov 2024 06:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732803512; x=1733408312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xA8QccDB7jDinpTszrKQcVtNkmKlzXFjmJDa5bO0Mmg=;
        b=CQN3Gkn17c9JUqyrG9zRw7bSOHiYkXiog8iKUkgMisKm2PfmONcm2FMLQDZGXxdtFM
         bYDQnNPkwOTsyWbknUrzvPZSM/XAOwyaXHnq0v5NSIkM+L/cgaYZivFunezbk1Wdk2Ww
         xLM4xT1nsA7/ptvtOG0+X4ofNFi1daMLZjnT3S83VZRU/sfshFPV1CuMY/SH9JOW9jFE
         TXc4cd/yNttta/0LSMccTNOjH5Yiv+iQhik5LYkNsqGwO6Nxkl7V3zvxW3mzAzUsJXkF
         5MRYJdmZ+ph47rTojCHXcEoesPeujZv3q/X7h/gTyOraMbr9PpmrqvO/Kpr/u7OkoYHN
         r/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732803512; x=1733408312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA8QccDB7jDinpTszrKQcVtNkmKlzXFjmJDa5bO0Mmg=;
        b=MmBxBtMJqCUddKLl335Z/ShwhQH5DeTQIIgDPmsYrVW3gpIPuHkFORc8jT2gaN6sVt
         4YIqliBZhEPKXeUL3vtLlp5W3y1zMFJntYcJmQasxSEwxPFoU+H06WE8gYQc73lwjsWn
         zAFMQi7Sz0wJpb3hxk92lBCmh+9vVygfKfra0v1liJUmQZJb9aIaFljz5qcpEgdTXojM
         C/Fv3S2CZdpcVU/4nkdWCRExCeEuQ8Ook+1Xqj6DakT4FmpDoaiPilmdz0KmrPnemK6c
         ehkOnPrfacA05PYzjWXcvdt5JiElVAKoUsF+vpDZ27LnzaILXeMqk4sJIiwuGSgMRlrG
         7cCg==
X-Forwarded-Encrypted: i=1; AJvYcCW8eXskHB8U2UfdFoHw+RT6AhThXGQfNA4SIrrEHYrPg8zfTB46xZeq5q+4bXGOC8y3s0s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUN1c7FcxN90KLIRbcHVjyXHiq45PjXZGz8w91xNUDLg+MqyUG
	SZ05pcEUx2G2f2J7DyzG8mBQ+PCqkXAxlvAZVjDJQqWynNC8WW2zojwcHW0Jo0A=
X-Gm-Gg: ASbGncuSt8FDtz5aRh95/I942AKz5vJ5rVNhXo8Wy3ecrDS5m2WsjPsZTf5J+SkeXCj
	J4rL/snneroa1Lz0FPKiiFU6rNaCY2sTmA7vdqIUH9V6YLjhSy2YqzcYfjHBlLTGtcYEAUjuw+7
	ACBRMeIphWJkH8aKRpiavMDfLE1Oe5E9lNPdidHeuTzUZhOdU0t6Y+MzQHcDoxauaq3P/UuBtSL
	+DpzQVS/vj6x4oUZEq9+5cIpmM5HPj80Yp575en8p5jfBe64mEBQiYH2A7zScFOEjYh1+3c/l5O
	kjADTiM0LxD/URkPDMJ6sBeBQgfbNA==
X-Google-Smtp-Source: AGHT+IEWrfuUcnXV1iqJHqdNEOSGIK8M6/LbygKUp+v7qqACcol4zNxR8qGEVUdI0pmwpuF4EUOzaA==
X-Received: by 2002:a05:651c:887:b0:2fb:8920:99c6 with SMTP id 38308e7fff4ca-2ffd604fc7fmr46439611fa.23.1732803512212;
        Thu, 28 Nov 2024 06:18:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc75452sm2022861fa.85.2024.11.28.06.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:18:30 -0800 (PST)
Date: Thu, 28 Nov 2024 16:18:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
	aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [v4,09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
Message-ID: <kixewphwyawbyrfu6pxtqx5fywqmq7ms2sa5j5pzogetmebcjz@ouhpohk7twbc>
References: <20241125093316.2357162-10-victor.liu@nxp.com>
 <c4334c9b-833b-4923-8188-64d662231512@linux.dev>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4334c9b-833b-4923-8188-64d662231512@linux.dev>

On Thu, Nov 28, 2024 at 04:46:53PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2024/11/25 17:33, Liu Ying wrote:
> > i.MX8qxp Display Controller display engine consists of all processing
> > units that operate in a display clock domain.  Add minimal feature
> > support with FrameGen and TCon so that the engine can output display
> > timings.  The display engine driver as a master binds FrameGen and
> > TCon drivers as components.  While at it, the display engine driver
> > is a component to be bound with the upcoming DRM driver.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v4:
> > * Use regmap to define register map for all registers. (Dmitry)
> > * Use regmap APIs to access registers. (Dmitry)
> > * Inline some small functions. (Dmitry)
> 
> 
> Why?
> 
> Its seems that the switch to regmap APIs is not very necessary,
> as ioremap/writel/readl are simple enough and easier to use.
> 
> Isn't that this just introduce an intermediate layer? It's okay
> for display bridges/panels that behind I2C bus or SPI bus. But
> then, why drm/msm still haven't be converted to use the regmap
> APIs ?
> 
> Just a few questions, has no opinions to your patch.

Please respond to the original review comment. Then we might be able to
discuss if the suggested change was logical or not. Discussing changelog
doesn't make sense becasue there is no context here.

-- 
With best wishes
Dmitry
