Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A8A1C9DD6
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616539; cv=none; b=dllUD6fIkm8VtsJfTadnO3AbxOM0IPGBnC4IxPXGxEEsl4QQXgYcjpTRm0kK+EYHuqlfYUvcuFGRMQVqUR+XU98SeV3Swl1o/iNvuUfZjIZfzRIVqrCVS2fTLsMV1eCoel5qdMSSXQnjRm83JGEuiDMLu8wwsOhymA2Ch8/TI78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616539; c=relaxed/simple;
	bh=VqOJ93A0a6WVyrazrQoqpPbwhh2VgG2wv/lBNfvEmfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB6DaK3uKHJZe8huyfCOTA9GQfGhwh+mHMPOkuwtBpdJPZbobN2Se876uAyyM6ER7PKYK5qmJObqhSDf+cNTDAigS1nkkD/ZdHX57o0lBCJkOk+6iXJq4jYQBVWmbsfpO2pjvdfVaCmpvW4zTs0AgDP/5tfN8aTiUg9jkVyr4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVX9AG/w; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVX9AG/w"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53653ee23adso1685919e87.3
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616536; x=1726221336; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E0KxWIleE3u20+F+aCD6IZbLW7v8LcTSKTjCbUE1knk=;
        b=OVX9AG/wB0mHbJdSTTlayF/AbPZr/iA13iM9xuzEloXtcxQEmYPzJnhDdxM3rl/5jS
         WG+NW05rXLnAkmx4pGk3NcgZP2wvdYwMT3LiTm0+mGFhFYWbxor7L7g9CPCa1yg/Fa4y
         kuTdHr096gOc9iHBN9WlnSFTdX9wHkRCy/CGlWWvyS7NH0YJYw99zKVfn3ZbB9yBPAXD
         oc6UUzGymaVxpy2dD7Wgn8ghpt1qqdjkjWyU6MXuTc5XtutARbDjwjcKiqKcrbMk0+cb
         gUoFEhjvNf2iQlg6uDzFidv4c8Ow/nH2KvpGe3KwD+NBtDE2ubPPImBPw3pQ/EdoUF+y
         8L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616536; x=1726221336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0KxWIleE3u20+F+aCD6IZbLW7v8LcTSKTjCbUE1knk=;
        b=Wkmpk76wfaVi06XrQIQQqjne7+ypjQY4PAao+07txzPDbtLPddGnpOz3YeKjY5cFUn
         GjDB9WFAqhdxNg7k/h9zKLdlt5cpvBXzDE+fyJPPtDysPXaGQB0yoUCO2oVeGmcRwzSl
         f6stFwan0/if4g4MwlcHgaLuBkVsuYvCNMZNzDJQHLav4A0ERhwTM0R4KBYyA28Qd65C
         5jLbLTqFBoUYGC1mVUA0YWlDsTOwj6s1OXqOiwpSRXCPJZMvCYh7ACrZ73QF62sba2fO
         Nz/HQETlL8zugljBGv5Xmw2C8kV/VCbVQPSD2CxlbL/CxBgRWBHmPPrdeW7vbiCDRYP/
         wFEg==
X-Forwarded-Encrypted: i=1; AJvYcCXOyb8N5MbNOe0rjdsaDmGyXvBvoqNbAstchIfdy83GquQE0V6/0syjmqa1WcIt9DxqSxU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQKIUm+M0NDt1JcNq8+emLsmf5yQ3nPleJz908VAbsJlOXwTdc
	iTp4yig0OycmfadZcBJVT8wqUxTm/VnNbzmtzY1JEcKsvrf54BBfYa5XJ/tfwWo=
X-Google-Smtp-Source: AGHT+IHe6zEb04EsF0hZnI8DiBbVQp4TFTFoRxW/b4jeG49e40MhUMCQNyAhID2vjkNmhWuQrjfCRQ==
X-Received: by 2002:a05:6512:1250:b0:535:ea75:e913 with SMTP id 2adb3069b0e04-536587c6333mr1667237e87.33.1725616536233;
        Fri, 06 Sep 2024 02:55:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536592c2dfcsm120331e87.260.2024.09.06.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:55:35 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, robdclark@gmail.com, 
	sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
	marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
	jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
	jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/adreno: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <5j626cfkrv5otd7v766r5ml6v5xtxrxe6ezp4m3agei27bvb4f@whi2rott2qrt>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-6-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:25PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
