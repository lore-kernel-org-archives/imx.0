Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36861885A0
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734953538; cv=none; b=A2lCvzMX9eIxNqXfaTTMmQ0wGug3TWzBJiedyLBVwMEsY3vw1ZgE9QDlPyc5j/L3wugFTF6/6ztXfWcCR3Wg9ggm6pU7lYlgdslzR09er9dESQ0S6ncDx8SES+YT+n+1blxi3hlni+qghIxjtRIjI4FPX9vAXacI05elXnLodCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734953538; c=relaxed/simple;
	bh=dwgXZ7OjRV0NuQeTGYq8Bqun8q13W8uT0PDCRiPFdCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsNoUQ98CPMFvtl+9dv/m8OYqAqmHqSjrwWART9kpfmTBOt2wvSNbc4UJiVxCuopI2EtZmxItlQlyGcdVBTN8n4tq7ElPZ9iOMhJa7vKq2wFy00iqdylO8qaNYvsIFh4o3gay8PqN634DZ0wVmkp1t+oMniOHkmM8a0Y7z/lunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qr36ZfKG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qr36ZfKG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so5428115e87.1
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 03:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734953534; x=1735558334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Io0aFnNNwQiWHsIlYK7BZZBTMpe4hxTbSGJahPhqnd0=;
        b=qr36ZfKGT5Ri+NoOFGGpQsuP/Xx7VxcFb9ELCte7yuYi+K0+2tKm9zGKV8QKhAy6i9
         Q8fn+DYO1fos4fn8WgXU5yW3kMHpsXV1r0cJ/lprfgawhgLy72wrf156UHuL4Sf5PjS/
         2vfQ0vJ23Iu+qYPRyCMGKo0IXyWBuh3ZTRVL43JsFEQi+g1yywFzbk5RudsOpdTCNshP
         4Zx9/u3crCa1WDcLJpnYpJhtZ3ikYu7oCuL0xzL2EuXmIWUQ7ezMqR+1iGtLy5ZGugeK
         azOclllkrv9EGi8UCrz+8Svg4rSYUziyjvg2kwRlHK82NxCRmdSoyVNF25u14mv7O0Ju
         qVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734953534; x=1735558334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io0aFnNNwQiWHsIlYK7BZZBTMpe4hxTbSGJahPhqnd0=;
        b=P1Lk7gOuMVtEDaZvktId8r0IxEAOFm2aTANCguciXm8vSzFN+T/Xeq5gTFGj9CoQYj
         BOwKJ0tfF/vlOkPbPe/ePaMNeryIThBxSojzdxwVhW/s83NuPiF/PqSoVlSiFF1GGaf5
         bdvYZWS/TbYhcm+jEquLHI1bpP5MkOQbNPFYYDF7QJWlr9ZtX+ZV9eKUFeM5qzkFN/iL
         ERJx4/e2frMf66G9Ib/CIZ28xPEPe9iXbTmnoRPRM7NeYrEgpbXuM+5jSvhMtUlNU6r+
         0joO3gXAfKQr/pY6UFjXLIizPPOS3EvE6ijqN5DLAdzdkNL8pLeZD+FpP8UF9sMJAq9U
         2ukg==
X-Forwarded-Encrypted: i=1; AJvYcCVvcqJF7IOSMfi74IWxnMwvjZEyPpNxiMM9d7Qu4Wm09MrvJ4mWeIQAzRpSkVdeYm4Np5M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/tYIKj0ltNfMuvB5O2cTeq8qpAbKiUNMPyUfE647Mih+mKR18
	YTbo7QdYU9SuC/tiwKIG95Xz0XMTBjU6ywAHhV4ej9SxPOv91Hggq0jNCJ5qEso=
X-Gm-Gg: ASbGncuJ30xfGCLofxcTySh8lJMRiLouuo/IUq5GpjtPoU4UdqrFhhAHfGkFO/8Pt9f
	dmwjXUAyZw/8KQFXmIJbTXQHTeSbcqKvmk/KRbnrnU4SlEJOLRUZ3DEkgJyMaqytDBj8gw3VpF7
	lmWsxQ5yfGn5Xdj4HkF4vpY47u1+/0XkLT2VV8o/TNezptymMEjF4JsTNaO7vU48TgqK0MNySu1
	DQSUbb0bKLM9JgXNrKlCRu3dV7nusQ4NU6pgCR4XQs9gSoWAfawv97yAKudhSuuYfOJr8QHVPAJ
	AqgMMsnZFZgYFV+NarMz2Sj07kfznFvt3XHS
X-Google-Smtp-Source: AGHT+IFQAVVka8tfhQQLypKSuFFeZTfbXIdbwFKArHWMlABaOq9wX6sZw2Zp8LWAHfr0uv4tXZ5d1Q==
X-Received: by 2002:a05:6512:23a2:b0:542:1bdb:9a61 with SMTP id 2adb3069b0e04-5422946f053mr3666830e87.19.1734953533962;
        Mon, 23 Dec 2024 03:32:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223831fdesm1270675e87.241.2024.12.23.03.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:32:12 -0800 (PST)
Date: Mon, 23 Dec 2024 13:32:10 +0200
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
Subject: Re: [PATCH v7 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
Message-ID: <wpxxedxabgo2kxf5wuosu76i5ud3ce2tywm2imhvad4nyy5u2d@qgfhev2hndba>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-13-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-13-victor.liu@nxp.com>

On Mon, Dec 23, 2024 at 02:41:40PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller(DC) is comprised of three main components that
> include a blit engine for 2D graphics accelerations, display controller for
> display output processing, as well as a command sequencer.  Add kernel
> mode setting support for the display controller part with two CRTCs and
> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
> registers of the display controller are accessed without command sequencer
> involved, instead just by using CPU.  The command sequencer is supposed to
> be used by the blit engine.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Drop using typeof in macros and explicitly define variable types. (Dmitry)
> * Add a comment for disable_irq_nosync() to explain why _nosync. (Dmitry)
> * Inline dc_crtc_check_clock(). (Dmitry)
> * Use global drm_dc->pe. (Dmitry)
> * Drop dc_crtc_disable_at_unbind(). (Dmitry)
> * Add kernel doc for struct dc_{crtc,drm_device,plane}. (Dmitry)
> * Define common IRQ handlers separately for each IRQs. (Dmitry)
> * Rebase this patch upon next-20241220, so drop date entry from drm_driver
>   and correctly include drm/clients/drm_client_setup.h.
> * Collect Maxime's R-b tag.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-drv.c. (Uwe)
> 
> v4:
> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
>   function calls from KMS routine to initialization stage. (Dmitry)
> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
>   appropriate .h header files or .c source files. (Dmitry)
> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
> * Drop dc_drm->pe_rpm_count. (Dmitry)
> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
>   Instead, put it in struct dc_crtc.  (Dmitry)
> * Call devm_request_irq() to request IRQs, instead of using drmm action.
>   (Dmitry)
> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
> * Select DRM_CLIENT_SELECTION due to rebase.
> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
>   rebase.
> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
>   register dc_drm_component_unbind_all() action.
> * Request interrupts in dc_crtc_post_init() after encoder initialization to
>   make sure next bridge is found first.
> 
> v3:
> * No change.
> 
> v2:
> * Find next bridge from TCon's port.
> * Drop drm/drm_module.h include from dc-drv.c.
> 
>  drivers/gpu/drm/imx/dc/Kconfig    |   5 +
>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 556 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
>  drivers/gpu/drm/imx/dc/dc-drv.c   | 238 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.h   |  22 ++
>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
>  drivers/gpu/drm/imx/dc/dc-kms.h   | 131 +++++++
>  drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
>  9 files changed, 1342 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
> 


> +
> +static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
> +					struct drm_crtc_state *crtc_state)
> +{
> +	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
> +	    state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
> +	    state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
> +		dc_plane_dbg(state->plane, "no off screen\n");
> +		return -EINVAL;
> +	}

Nit: doesn't drm_atomic_helper_check_plane_state() ensure in this already?

With that in mind

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +
> +	return 0;
> +}
> +
-- 
With best wishes
Dmitry
