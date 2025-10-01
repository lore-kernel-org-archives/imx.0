Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F048CFC
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328572; cv=none; b=NDpbUoICFGc66AN67zkduK7+fbMFgm2c8Bxv/HggqeJaO8IvUOX0rMGgC/8+Vlqk5RkuKoH4VGG9bowy6auyP663rQ0EX5MfG+Rzq7wgbJgGrfCobJrM5LqUgpcsdDa9/SrAxIIwRZXeuHplDzj7aEdp1MwZACqP4LOI3vg/QWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328572; c=relaxed/simple;
	bh=r//BOeg6hJFiIpgXCGuyUcHwsmeUXaZtItuSCfFTHEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNy3ZwxW7EVBJaWGZJPp3B8aVS2uLxVXdr9zXbQ6bfnIrxak4BmPpHLjSFK714P3XBY7r+l54X1S66P0JpORFfUMtqfpOrRMY+kQnpMEaREGxbQZdVtdHCDBmTaavUldtQqOfefqD1JhWhPmCKht//YkmYU7J6parQ1nbtbEeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGq247rB; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGq247rB"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b523fb676efso7027853a12.3
        for <imx@lists.linux.dev>; Wed, 01 Oct 2025 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759328570; x=1759933370; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZWPPQ16OuhZ6r+akwzEf9yapy+ye4jCYQdCK+8Qq+M=;
        b=nGq247rBNcYcVPK2LiJQCF8MJQGouMpcR9oMxy0z1oYtv0CvINlRE5glkM/k4alX6H
         /tnhEsjEbcfl7Ke8H4P6L2VZgiLiIoOMWVjcVkcMQljYodU1M7qzVTAxpP74l87rKP12
         3N21fuQRSjOTVufc+0c7A5XjNU8p+/oMIxroZQP6Sj1O70az9jGjQwqIvWStwjf87R2H
         +mTuphGl5fy3VACURpgHWAGUvkWlLXvgXVS4ta9NZ96gvstpAzow8xZYGFJ8yFDJmt1s
         w13zi5a5aQ1+98KRXIuxhPKMx5T2z3ZVH3TsZZZI5psaShgJtbZigwLUpE1L29Cg2fbO
         8WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759328570; x=1759933370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZWPPQ16OuhZ6r+akwzEf9yapy+ye4jCYQdCK+8Qq+M=;
        b=CUSolgxPe276RJY0BfY5fmA6uCD1PXsRbB/LLQfIznquF7Brzyc8xRnkoalCIkPO+w
         Btfdcf6Xb0Kpc+A4euAj+RZzFrVoFLbPkCL3jepwqEUlZSAEIMLZCDMUfniAty9w9DjT
         9EkJmuxay+yWePGInUaR1SvXUe3H9NXQuKMbEmZ5GvesQmYLS5EuQ33ID6hG8BCYU46l
         mwOPIbyVKmXqcJNzV+JPGK6nTtuxo41mRt3CopvDV8nVjMmYQg58unuh5mqWN5Wp/3Po
         pbPqW8wH45Fj/6sRNzm8c44R94bNRibKB7VHSc38ChnhFZ/v+ClVsKuDVZp8165wH8Qn
         yKOw==
X-Forwarded-Encrypted: i=1; AJvYcCWVBkvpuLxESXRFMVo7EfhQAc7XNgKIGS1AYjyKohU//dhM85MbjhUssqE5rUCiCesFZg0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeZfRRxz815jJ+Fy+oVJA/2ob0KDWdWGbstwzEt5cA3MknangR
	zqnicMb5QH2ZOonIlWbgT0rQZLk3u0EFk7EgRxydZ4DqYwashlj3RckMO+C93itlBwY=
X-Gm-Gg: ASbGnctMwkapFzMPN2hdwr57ii7FWZQDFW2KskzczluCR4r2APMVnyAQA91nLeUp+mk
	t5Uj3PzIRX3flOSdxih1Ov6IGXnU8VLi+OSxUoK1E7GJ0ptBOCDHmAHZLsIcYGzpBsJdkZbi/Ou
	8CoIzhir5UcEQpaz1opkU5lfxbwYT3K15z6nPj+VhYRkPDQ1ahfNpDDll6bTrd4MiXe0SgomPX7
	ytgIcXBT1Usag1fMxovdBAV3Iq7vxuuy36hsnKAPu0+4JBc+cS3zzxNsaw1JO1l08Jy3gIc0FDx
	M1cq8PyLG5NOeY3Wyetz2dth8LDe8VxXQwV01Mcx9CpEfOCZnp7LCcAyYiWL48v7MT6ftdaKTTJ
	vwMhNYQNLvbOXTzip4UPct+RwHUVhOcjn+jtM8nrleqE9L5fooBoFKpqAhfsaLuod94U2Xupu9X
	MisgtgX5By8aW8EsjFJ5Bez78u8KI3jfqcOMaacsnpLZngA3ce
X-Google-Smtp-Source: AGHT+IHqVeD/wJUVy5+C2bUJIvZQddubc9m4Xd4Qgoes6H6s3Vr0Kf8vrqdjy3H/lxWJPRN6L5BOvg==
X-Received: by 2002:a17:902:f546:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-28e7f440582mr49997025ad.56.1759328569779;
        Wed, 01 Oct 2025 07:22:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8417:c9b5:17c4:6237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm186020025ad.138.2025.10.01.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:22:49 -0700 (PDT)
Date: Wed, 1 Oct 2025 08:22:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aN05NsINB25lW_Lg@p14s>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>

On Fri, Sep 26, 2025 at 08:33:14PM +0800, Peng Fan wrote:
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.
> 
> Retested all the patches for V3 on above platforms. And pass build
> with patch incremental applied with ARM64 defconfig. pass build for
> imx_v6_v7_defconfig with all patches applied.
> 
> This is the 2nd series to cleanup the driver.
> 
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
> 
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path.
> 
> Thanks to Ulf for the suggestion on the runtime PM fix in patch 1.
> Thanks to Daniel and Frank for the internal reviewing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Follow Ulf's suggestion to address the runtime PM in patch 1, and add
>   Ulf's suggested-by tag. I dropped Frank and Daniel's tag in patch 1.
> - With the changes in patch 1, the remove() is kept, then there are very
>   minor conflicts when picking remaining patches in V2, so I still keep
>   R-b tag from Frank and Daniel for patch 2-6.
> - Link to v2: https://lore.kernel.org/r/20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com
> 
> Changes in v2:
> - Address a build warning in patch 4/6
> - Add R-b from Frank and Daniel
> - Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
>       remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
>       remoteproc: imx_rproc: Use devm_rproc_add() helper
> 
>  drivers/remoteproc/imx_rproc.c | 100 +++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 53 deletions(-)

I will apply this set when 6.18-rc1 comes out.

Mathieu


> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250926-imx_rproc_v3-a50abed3288a
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
