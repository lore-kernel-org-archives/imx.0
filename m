Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7551CCB4A
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736117235; cv=none; b=extw5F+G8GihOSnSXsxLFLViR5Jdkg2dkOIpPVAD4RMs7L1AbzRSsH6zh65uN1AEYUqT3VOc2f7hKRfkz3rf9ERnNHmNw6X9zm+sMvErk3gGNZiQEQ3w/idKJC4eC0jFCi8LBbI8QLF1uQ/SgBEQvhCCXXz812hp27VraJaqPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736117235; c=relaxed/simple;
	bh=BMYDPdXSb2p42GtUdkIiijZF1go73+F4fVLY33Fiw28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdSmv74FZ7wBltT291B2C+JXJtFKVVUATdFTrY9ZHP4xUQtQjgH0yH2oJtVVS19mWu1WWw1h7tlpi66HYUJLXoLoc63y4NOuihWFXGuw1eTjM+L7rysgiG3BqQRrIso+ZRH39EvJX1huz1TJigVORohLmIUZMQM1jfYvS53jPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6yrbfpL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6yrbfpL"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-304d757a9c1so26972761fa.0
        for <imx@lists.linux.dev>; Sun, 05 Jan 2025 14:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736117231; x=1736722031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TUw/Qsx3e/Vb/fGVkhPXMOTG1JvaasLeNnFxwC0uDdk=;
        b=v6yrbfpLbKv8caoPyXedZ+1imcjbPXzyfHSDF8QgFSdTa7O5Y8MCL2qWzswnLW79qQ
         OkfuDMDf/Ptp1D0AxIiZAYD9XfknNZwW/Lqhv+OEJw/4OtBtV4Z3qgJXPJrsE+eJqE8w
         RmF3tKdnuslVoxONy/e7qulAilyEDZhOY2jw2beoXf1e7F+UbZrOcFkLHvmGDEtPlJfb
         Q4OOIPAh5Psx1f/NR9cRqinBPefXxTelrfXdnfnImWzaXR9sv3a4D5HPbwnO91+35cbL
         jjHtS2HnxnIKgCEwdrfaszTSVreDL6TOzy3rZYbeS7vKp7KESbeJi+B2sQC8Q/50MELS
         sEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736117231; x=1736722031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUw/Qsx3e/Vb/fGVkhPXMOTG1JvaasLeNnFxwC0uDdk=;
        b=gccP8x/7jp09xgXWX2KdHdJH+Yb+hn0CDiFzKZ0sbpQlGzv906XclCkPtOG2DOGlPB
         G4jaunnbqrCP0ZPbDLFEVPahuWlE//2omsB0PvxUq8PGNBYAyg3XWbOgfM1V5bpFNmnb
         1bwWxZq8bhf2a3Di2xQk5PpaR3b6m6n2IO8jZcM1ZU7Db/+aEyplFBFp3URLTKlBe9GP
         C4y2S1Ea7hGA+QOD0HpHSk56qAGatCRpGjqrV/0KDJzXOqjpONY2lTCKmtY2zyT0q4nW
         EjJ29jak5rHKn7GdcbvCOnxDkVW+JZ5fNElTz9F5UjrmwGYYdtw1UDDNEIXjKynGmx+z
         2TbA==
X-Forwarded-Encrypted: i=1; AJvYcCXzE/qf5gyH5BWcltYI1W4FzcAOieZ6670qIxaGOuReTUKd8Et1b2bIVKvNwusDKLWqlaE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs/crv3N8SWJBpfxANh2bhdjxDi8/SO5aTHvJdWOpE+rsBGoeQ
	wq9ISjI9D6P0F8oGuqXtwxzvcj3vgmSuFONmiIk018c4QG1xN4yn7bfFOdHsgFs=
X-Gm-Gg: ASbGncsV2vnQd/HKi4QQW909Rz0T5Z5LjxbcCDkzpAgJlwJgnmZP4Uk1NYOxy3yWop+
	TiMHG5MZpZbuz/NXPpH4ijusbFHZVv1WJgC91TotJG8ZmAN02a1LFFatagBLWPN5JB8FRbuh2aP
	esakBmplA0NZgCRrzcYjjVMS2KMocdJPw73sISoxhlfRkqXMj96Qy3nCZkVDplJTO1ABBfoXVdr
	XxxPtBdXBJCPMd0CZAxb5u3gkrb1B41A1CBcfdnwlAKt1RYNoYFZQMio52/pFgGcaMwslrnBt43
	/pCoDldj85bV5qnita2D9gRZOdC5raDIV1jy
X-Google-Smtp-Source: AGHT+IGdeC3kJKQByRSkP8PFuxEiAQLE0VDeCxWNLmf8WlobNvqOtqUKt3Qejko5pkmOL0gzpID7uQ==
X-Received: by 2002:a2e:a78a:0:b0:302:4a8f:428b with SMTP id 38308e7fff4ca-304583eca3fmr125244721fa.15.1736117231020;
        Sun, 05 Jan 2025 14:47:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b09669csm54711531fa.120.2025.01.05.14.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 14:47:09 -0800 (PST)
Date: Mon, 6 Jan 2025 00:47:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Message-ID: <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>

On Sat, Dec 14, 2024 at 03:37:04PM +0200, Dmitry Baryshkov wrote:
> While working on the generic mode_valid() implementation for the HDMI
> Connector framework I noticed that unlike other DRM objects
> drm_connector accepts non-const pointer to struct drm_display_mode,
> while obviously mode_valid() isn't expected to modify the argument.
> 
> Mass-change the DRM framework code to pass const argument to that
> callback.
> 
> The series has been compile-tested with defconfig for x86-64, arm and
> arm64.
> 
> Note: yes, I understand that this change might be hard to review and
> merge. The only viable option that I foresee is to add new callback,
> having the const argument and migrate drivers into using it one by one.

Colleagues, I'd like to graciously ping regarding this series. Should it
be merged as is (possibly requiring more R-B's)? Or should I rework it
adding something like .mode_valid_new() callback which takes const
argument?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Rebased on top of linux-next
> - Replaced 'accept const argument' with 'take a const arugment'
>   (Laurent)
> - Link to v1: https://lore.kernel.org/r/20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org
> 
> ---
> Dmitry Baryshkov (5):
>       drm/encoder_slave: make mode_valid accept const struct drm_display_mode
>       drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
>       drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
>       drm/connector: make mode_valid_ctx take a const struct drm_display_mode
>       drm/connector: make mode_valid take a const struct drm_display_mode
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c           |  8 ++++----
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 |  2 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.h                 |  2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        | 12 +++++++++---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h        |  2 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  2 +-
>  drivers/gpu/drm/arm/malidp_mw.c                          |  2 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  7 -------
>  drivers/gpu/drm/display/drm_bridge_connector.c           |  2 +-
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c          |  2 +-
>  drivers/gpu/drm/drm_crtc_helper_internal.h               |  2 +-
>  drivers/gpu/drm/drm_probe_helper.c                       |  2 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c                     |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c                |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_crt.c                   |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c                    |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c                  |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c                  |  2 +-
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c                   |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_drv.h                   |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c                  |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c                  |  2 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                         |  2 +-
>  drivers/gpu/drm/i2c/sil164_drv.c                         |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ch7017.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ivch.c                  |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ns2501.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_sil164.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_tfp410.c                |  2 +-
>  drivers/gpu/drm/i915/display/icl_dsi.c                   |  2 +-
>  drivers/gpu/drm/i915/display/intel_crt.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c                  |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c              |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.h                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dvo.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h             |  2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_tv.c                  |  2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c                   |  2 +-
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                      |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c      |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c                |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c                  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c              |  2 +-
>  drivers/gpu/drm/qxl/qxl_display.c                        |  2 +-
>  drivers/gpu/drm/radeon/atombios_dp.c                     |  2 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c               | 10 +++++-----
>  drivers/gpu/drm/radeon/radeon_mode.h                     |  2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c                   |  2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c                     |  4 ++--
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c                   |  2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                            |  2 +-
>  drivers/gpu/drm/sti/sti_hda.c                            | 12 ++++++------
>  drivers/gpu/drm/sti/sti_hdmi.c                           |  2 +-
>  drivers/gpu/drm/tegra/dsi.c                              |  2 +-
>  drivers/gpu/drm/tegra/hdmi.c                             |  2 +-
>  drivers/gpu/drm/tegra/sor.c                              |  2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                            |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c                 |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c                     |  2 +-
>  include/drm/display/drm_hdmi_state_helper.h              |  2 +-
>  include/drm/drm_encoder_slave.h                          |  2 +-
>  include/drm/drm_modeset_helper_vtables.h                 |  4 ++--
>  71 files changed, 92 insertions(+), 93 deletions(-)
> ---
> base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> change-id: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
