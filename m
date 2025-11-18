Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C20F2DC789
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493759; cv=none; b=savQlPAfuSrxSJXACOOq7Mx4iSbSuIpgaNLxF50ZZStQqQWL7QGe49GVHevICpoAoxchtfZ2IYduxivA9jNklJEEpfGpZ1SRqkRWnedOoOWnlSPRcK1gCQhULHEDPrJFxAYM7WYHt15Cok5dLAeZIs/xUyNAAYatNSMuGeQ1zq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493759; c=relaxed/simple;
	bh=675Zk50Y3LTZEsvLuNfGMou8wqdkQy66ind05TlVNkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qANPPrHyJGX6ZweUXIsrkogxJbLIiOgYnRVUAt3sjV1zrtliFZ3Pje2WxsXMW4QKsnjdXXTHaQ6JwcZsO4FXR4FalO/TnftPzqdRmA1yfkIRMIixHDugZ72naD6kHRhqKHJZmeC3b6davIbrDy6eNbjalZndYJRSYvYoM3pRaHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPlaXEHb; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPlaXEHb"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso2439214b3a.2
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 11:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763493757; x=1764098557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
        b=TPlaXEHbk+B8+IFt1eQuvAFZZ10588aVlkE8he5Lbp3ep2KkrwfbwrqOxbM6KuX4Ze
         zMfFvQki3/VEt4+ISmc7ZMSWO7w1zy5cPCkpbIALjuPuUhcLH6ZUxZx/uKQMhMDDTfwA
         K4SHaII6na0RI72ITRzgN5NuSP8lCu2m9dVX+EscfBUGxa1KbZdHZE6ZN5SEgv95EYDd
         t+YLW309LpixrPdvx4E52AOwOAe6Swxz4OO5m8Rs23DvuTyfXCv2+hhHhgSSLVNpKjie
         Mrd6akHAmvm0XurlVLmkcPrAPFViVlH6RijUO0h+V4c6EL59iiCEd1B5MeznhwxCwdbo
         6mZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493757; x=1764098557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
        b=JZRDW46AlyhRQa2glo822ioBWw+5P8InjuHFct+kjil7UiJzWMChkllh/ax2aPc4wn
         uGB4tkrc/2e/o0z84llzi3bUOsn+kkSl8JsbX662g/L8+Tdct+84MKhRXIkYaAq8firg
         LpWJbsE7yy8XVKo/EjquKRulwrRjddzKNavYioyquym41k2shfth9p8EJ9Aczeg2SijZ
         3euhMgXmF6amDmzqQ9doC6ljES/xnaV5MbBP2o+VFMO2GOHtPhEVYoJDpXxxq+SYs+K6
         BpKSk/bURw3CEihjBlW/g0UIEKRzrgTRAKaXRcLJsKxcb7i7fCPwgTWyYcc8Y6OOxsyd
         cp5g==
X-Forwarded-Encrypted: i=1; AJvYcCWihQLcOqrRv2XiljL0heHsEFnZ2poctEmCUIwrogqPWR18yT7zetA2kwR4WuOASmCVX4o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzASkW2tR7iH5oDN88JkByGDPcnSDNokOVatIlpQuGNboJ9Yfe/
	6xoITQDQGqWBQuocJ9QUpzy7Y8+zNpeRKYddHP+zRs44UxgFUVsNalgQ
X-Gm-Gg: ASbGncuiwCqlL0id/ENUgiepoLe7FwwF70azqeWoEG3DcKCLY/scGW2Q9MPC8AoX6K8
	FNS8Hg82h4Sew66x00OcisbN8lRi31NIn4yh7/Pq7fJZjSE0lcHafeCcbc9YJAzBmXaNfzZg1GF
	p6+3thhvOL38NsrQAJNbSHothWCfWn8dSE9KLt43mKrBDtsw6+/eizf4jwwTZiDKax2UhvWWauP
	agAAm/oq7tzZtv1prZx8sFZkK9haYgglM/1OhhQe0vNFHldw4fYMcLsJZFtg/lBtpNCjwp9AWCQ
	369KUz7MumvNRaTaxOtllRw89rIHucE10Ndx73eh1syrSJkWu70mHDKhf4kqGYFkJi8cRlo9U/+
	cKi2YLhENsMQP0Ork9cpkictktiFX3MOYryKdIdtleDrZ30xt5d8HOy6+ZyZi1oB0kcjLsnGkQ5
	y/84YtDDEcxSEY3XVXR9CADl3mlQulp7heCtiUMcEmIS6DnDLcTsyrCxs29+KqlUkZ/4BleIPpX
	Q==
X-Google-Smtp-Source: AGHT+IELEZhYWlXzd98KtP04N9FRevtbbB+qIzdu2jhq6XqeRQcPW3sY3BwS8IiZhjDpaOtgcw6rPw==
X-Received: by 2002:a05:7022:43a6:b0:11a:49bd:be28 with SMTP id a92af1059eb24-11b40e846demr7788674c88.4.1763493756655;
        Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm64635016c88.8.2025.11.18.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Date: Tue, 18 Nov 2025 11:22:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <rifyic7w2zyjupbmzwcewcslryqiyexxdvbgcuxtkw3trmtulw@y4otarfyvgm7>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>

Hi Josua,

On Mon, Nov 17, 2025 at 01:28:46PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index 0dd632724a003..8c5a54b336816 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -396,9 +396,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
>  static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
>  {
>  	if (ts->reset_gpio) {
> -		gpiod_set_value(ts->reset_gpio, 1);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 1);
>  		mdelay(10);

This (and below) should be usleep_range/msleep/fsleep.

> -		gpiod_set_value(ts->reset_gpio, 0);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 0);
>  		mdelay(delay);
>  	}
>  }
> 

Thanks.

-- 
Dmitry
