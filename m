Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C74232792
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756716; cv=none; b=o6h0uVrEUGHNyZSJbnCp1PGAe8EKB8jJ2ehQ0Y1XAVTNvPEBx6qgtcwV3NJPllbLmN5BqMGWEDgCMVs4CCWcvUfKhDGt2Y5nxZsTLjiqRJzcfYCj5ScLJMnvEDxuZZlZ+PwfvO1zx8yUyScc5yyriv0HAurz5/5hMl98kEmj8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756716; c=relaxed/simple;
	bh=5t/TrcuXNWNUZTuS5pgxHTJQKuHzmhw4UrOTlIJ4BOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcVsB5JsE7iPBpnOdMJcmqcF0FOC+755+oUTtM8YE4vxQ+JXnzRnZQ/cTwGVcvuHSR0xO+gfTfe0B1kR4KzT1SzOwCfGmjsQQAL3QGS4KtwwaDM4QTsJ4nV83ycZWT0rlnXvg1gkgSj6Z8L/HReRm4tnCZaNiba0q8MjTnEmpZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ewRiOFrE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ewRiOFrE"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401ab97206so3985456e87.3
        for <imx@lists.linux.dev>; Mon, 13 Jan 2025 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736756713; x=1737361513; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=ewRiOFrEsokfpKwZ1bQcHZjYgHVEn1j2qW4EGVURUOU9CXz/omvW4jRKg4nO5AESwE
         UAnC0cZsF0M4FnKLaGvj0nKJKBFB6YVh+l60FhH/MA4lBV8uxRZnTu3yYwx66cvqFwJT
         iPAJ7DvlNYh4eekh11LXEFRGw4EnVDXJCdpSfKsYsVewZ2AFgbGMmZa74Xb4UVu5gPul
         UntwDorxHdfIab2fWxiOYWtJId3+fEpCBI89vg/Cl8SBs9nTonurfifaufLDALEgdx7e
         bW+ejhgY+8iy6VboomzQALY4y9ljgmb+h5Ltq86/YrBiOM6xgnVH0HsYRzwcWrge2pN7
         aMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756713; x=1737361513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=qC9qTPWehPNI5EuYSUy8NJvl7yF59KcYdmq+88g9eHlzH1R7aTOIqXyRpEBrYPpQZ8
         8Dg3IOHL8vhreBHc7Sb9ku0CbUbCdF6ONUbX1Z6UGtfsPHixD+Hu5MI7wgYdAOBqOmlu
         nTq4dQyvkueWtlHHWzbzbqoIWHaFen+SCi2kIrHHvqVw3eEWqzQxglvzFLS11avVPWHg
         dA1OiSjAk74rH0j4MTP3etxLI+B0pKmbSs+UFf0qKpmHUfrKKgyVJ4TLWVk+fmu6YeCf
         2q2ePWWGEl7e79YOs/0HnORFx1vpmTJIgcGpLMo312DcsUi2NtvNMWU4BLQZ63N/93Bv
         dfpA==
X-Forwarded-Encrypted: i=1; AJvYcCX/wiZb7oNSRv1ayxNJ8OWT8ldO1dIXBvGKLYuCjE9m3EcbXz487HLgQqbQ7wfgnj20aAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwT/oC2jgFQZRfiVc5aBmDMn7RBDJBjDSoJUr96Abg5OTkuybVA
	ioQEUG34FDMSOCJ2JqP1rjnvckd0B1XpN8DcsGLEBcxRzr0+tui5IdHbYm+mH7o=
X-Gm-Gg: ASbGnct2KyIQwCCWpHj5IczoNDaQo5E/iJ0RBnmskKPFAmBLlNmtFpqyP97Z616OOxJ
	nXjTZlYPKZnBXaM6uHWLxG2sm5mHkvD8LkU2YniQUquoNwJm72mW8tMHu1uNcaAYv4RThpV5WNX
	BceFotusxdElXLQwHS50dJ2kA2eE9/NGDpxU49FPVzIcpftAfU/PSek7pIfXmTwrQ6PBGMJo1NW
	d9o9wZS11hCQcKofJydDIc6Yd+U74JTWRy4V40/uVzMMsxWFD2Bq7yg1kArg60dToDSTutBuivX
	4lQXOCvrItmHl/Xm/5Y4ET0MXCh41mAQC100
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614;
        Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
