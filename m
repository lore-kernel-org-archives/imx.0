Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5E1CCEEE
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725626822; cv=none; b=LLevfDsfkMoe6YJ74JnStNHv8Rk9pbe7zSC16VFZwIcetE1N7Vn8g+/t5UpJ+yMepNYG223n5yp8LEq3pbhL7OrNvjqg4fZg/QUVjoFSoWXt9FFjZ3Dork7s7rICvI3b84WDOXQUkRvN4E0MJmtE0O0wWIHskmGvVbLy2szOQXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725626822; c=relaxed/simple;
	bh=7FXIhim4R/YZPrjdlDaGzgsy4ddzF6N81eaOgtlPPiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ws/MC+uk2zaKYJ3gh8WAuZXG4Hdwqy6V6h9pGBFKZjwiTWgQ7rdp5a14A2DoLGSjtR5Te6gwigoJwnKfgt7j7c1R7sCgP9iRgorC3hh2blhaLdKARoNDVhEnsUxEUb2lFdoAxIbY8+cLhLTxc/us30cmJqSKF3F92Z/whENEyqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PgLAm0P3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PgLAm0P3"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f4f2868783so21963381fa.2
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725626818; x=1726231618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tCDROLtzQl9/e9E1lQx5QL5Q8ysDiREUAFeTrp/CYIE=;
        b=PgLAm0P3ww7LKKabhf8ux4fMMtpFoLJY3vd5Ee9FG8AzsKReGXva40oAKTss8wYe1r
         ZJGHwkrSUpRNIO8M5n+mGLTNeAszd5QpTV3yLUZUwb7BghsTBOt0Wtxjgrjbit8cer5i
         mwIPWZJr/Uts8mGQMgdoWPz2L869Za89B3Xuku5t75AGGtn1uPLJ2qWPOHX2JxfM8Sop
         WxWqQRuQIDik5g8Mx67vHi8nVv8QRO93lLuWjEsnsQY4no6z07nbqe45lwPeCV/fKBoM
         fM6N16Bf54wOwxVjp0qciWLXWRZwRXqflxnae/S6AwtgOop8dul0OJmVR3vnL/KFhhKt
         0aMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725626818; x=1726231618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCDROLtzQl9/e9E1lQx5QL5Q8ysDiREUAFeTrp/CYIE=;
        b=xQcBRtTIwaV0qWiQFY9iSBmljmBsjtcnWlEK3bl4feSjPB5nxb2ps9RuA6USC+vHzF
         lugzq4/Ljg+OAS76bI0qjQNSz8xHlEwhr6GOn1OVjajotuckzQ4OkPPIe0wlb188buaK
         RK5+dBv/75avZs7jpV3eebyObBDifRgHLyF5ZjMjReW/+U5y75DxKQNra+VwPvRL/J9y
         ywIeWCVA0/msH9/UdNyLAMRVC4rIyiQW8/abCKzBRtjOJ5ZI/WFKCALJIxItiFAwRSpU
         4VQPvGvQfh75H468MJSsSVndHhPN1V3cEuXu5jT54mUEEC00iLyaSd7OXYDSI9uaxuCJ
         a2IA==
X-Forwarded-Encrypted: i=1; AJvYcCWS7Z0AJvoX2oQl9bSufcrW+NDysdT0v2X749KWhH2bO6W53E+IiaTkzsDnPVplMhQ17Ro=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLmDOfKDqLKuF6ja0EG4VHgrgccqNfBXvq8dtBlExn9zPiuTqm
	ASXnaPDrn+6z8tc53hTTL94sKBX4Q8DYetsjydCND6GRPe5ycQSNAn8cGkCY+Ow=
X-Google-Smtp-Source: AGHT+IHdP6sVKOBLWAcV7i0DQrC/I56I/bOZ1oLFyOUUNnoZRvRmqzwYIqtPFBQ78Alx6bgpM5C6ZQ==
X-Received: by 2002:a2e:6102:0:b0:2f6:2b51:ee3e with SMTP id 38308e7fff4ca-2f751f82e6fmr15284681fa.41.1725626817484;
        Fri, 06 Sep 2024 05:46:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f38760sm29752311fa.60.2024.09.06.05.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 05:46:57 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:46:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
Message-ID: <cijdgivv2h57vwwpi7m5inl3atc2yryu4orrgxce52tguxiodp@aargw4zfdadg>
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
 <CAA8EJpoz7jtjN-Dxq-6SHNiZCz2xsFFf5j4HOoFiLAq=OnHn6Q@mail.gmail.com>
 <c4e1da1d2f005e22f74eb2461382fd4666dedd4f.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4e1da1d2f005e22f74eb2461382fd4666dedd4f.camel@pengutronix.de>

On Fri, Sep 06, 2024 at 01:46:43PM GMT, Philipp Zabel wrote:
> On Fr, 2024-09-06 at 14:35 +0300, Dmitry Baryshkov wrote:
> > On Fri, 6 Sept 2024 at 09:39, Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > > 
> > > When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
> > > users were updated. Add missing Kconfig selections.
> > > 
> > > Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I'll update it to drm-misc-next if nobody objects within a few hours
> 
> drm-misc-fixes? drm-misc-next doesn't contain 9da7ec9b19d8 yet.

Heh. And on drm-misc-fixes the IPUv3 doesn't use drm_bridge_connector.
So the issue is only present if both branches are merged.

-- 
With best wishes
Dmitry
