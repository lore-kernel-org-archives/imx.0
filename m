Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D281DED5B
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267546; cv=none; b=BC+gwLSk0d2nSTZKrjsDTnMK7ro+5JWzma5rVPzOGC1uZgVuLt4V5acs7ZHB28r5auxo60uqR/Xbob1PoDnbDsGmzqCQTXtwFOYV1ugZjjcfK4Eh3SIJvbTGSp0BkQTmUGFCVgKpAh6vT73ALBX8FW8UKkLGVlUn/jlc42nd6B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267546; c=relaxed/simple;
	bh=6zIz7rLqvlLD78tMosqFxFhvxskFnkIyYamCQ3zyCFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hq0DrwQ2T3IlOAjB8jKyFs8dWDj3TeqdZxNxlqBEwoEtMdWWribne/v5Imgsu7zwCkVXcDQz9GoBGmyU9q2/9hJv7yCj7nBuRmwcT7dKxJwWLkbOimvjKMpd3PetX41Io0OsIIpyXEzCG75cYZLn0dBPeoJb5vcrYpdSF5/aaGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Av20QTe9; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Av20QTe9"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb51f39394so26271961fa.2
        for <imx@lists.linux.dev>; Fri, 18 Oct 2024 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729267543; x=1729872343; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lHZpTCnaSttFJL3uIXwXWK6iRmjck9Nu4C1mKRZ028=;
        b=Av20QTe9jFYYgjYyyTXLUA04OrmhNvx/FHd3+CZoA6Kwn8cE/42uighRnKzG1pnE4+
         hgD9MFEfaWJeUz4hLeiKVugOPuDPQx5ChBJZqfaHG5vrpGZz7tXapy5Qvr7+AME/1q0L
         cU5lAtF04pVQtP3Iq3E+6UGzemqA5Gu8M7KxnHGlVNjI2SWgkcRj65cBGoG59i31h3+z
         xG6tzkUqf0pY1zAmJimMRw/WP0SPywKurWSsT9jGhU8+gzcKL6De8buiI2M+TVU/xTP3
         6IQyqegtTsgS0X1J5OFakyLlfbDv6v6n6Lm5tTxBWmA+oH1G+6rOYJdh9Z4hM0WTh3OD
         lyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267543; x=1729872343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lHZpTCnaSttFJL3uIXwXWK6iRmjck9Nu4C1mKRZ028=;
        b=cyoiuUsRMUve3zOL4f3Csw8d2uAtyYVqxmKy5iXmXpKUkD0LqOUnQd05w3m4tRcSWj
         6kzq0hbdwE0fD0FgSKU0IKntIJAaEPEd5f0yT/Z8gfhaUr/jlznl7jr7ET+rlotTsklb
         /Lowa6/D762CXkSejkfgiqVklu+KeM+EV4AooBOdpdnVxZ9lfu3iQLo8E1L9IQ86E8wI
         LieU3y7MtkKcYw/9Qp9Kwe6rWXLZ3zOMnd1Ody6FukCB7SOzguOWhbSyLGstURiPJkRU
         2EgTKEt5RrvxjBoS9cFn9VhvZg8Zj8kq1pEV7XiCruxmgNPdbGgnEAY0VhXWx2jJlPya
         HBmg==
X-Forwarded-Encrypted: i=1; AJvYcCVzZRoTW3aMdwm04A9ly7MuPlbWNrvk8S6MpR8zUo/gdXtbohtLcwpG/xhp/QfTAh4bLCI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yykduq2IGACRYb4yPoSJAqpY0OzlJZIdZvfTUexykaVDEfdthRA
	ndFyeSrPYlqCBZc+TK27bwqg15ehy0QJndVR83+KfhNYaY+hoYYXQYtJQZH6z/s=
X-Google-Smtp-Source: AGHT+IEpeWFLJ8yL29qE6iphuWnFhSa96/H/Y2vX/YZ6kUiZe2MzqHfEFttDD3Eg9ojiGCjOGWPbXw==
X-Received: by 2002:a2e:712:0:b0:2fb:5504:7966 with SMTP id 38308e7fff4ca-2fb831e92aemr16524871fa.30.1729267542646;
        Fri, 18 Oct 2024 09:05:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809a69f3sm2445361fa.26.2024.10.18.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:05:41 -0700 (PDT)
Date: Fri, 18 Oct 2024 19:05:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/imx: parallel-display: add legacy bridge Kconfig
 dependency
Message-ID: <ccpkyf46bbfe4z4lo76kokixocgfofc4gltifnlesnvfuj4ndc@q66ke2mf5uqu>
References: <20241015073004.4066457-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015073004.4066457-1-arnd@kernel.org>

On Tue, Oct 15, 2024 at 07:29:57AM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver now uses the legacy bridge helper code but can be configured
> to get built without it:
> 
> ERROR: modpost: "devm_imx_drm_legacy_bridge" [drivers/gpu/drm/imx/ipuv3/parallel-display.ko] undefined!
> 
> Add the required dependency, same as in the ldb driver.
> 
> Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/imx/ipuv3/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
