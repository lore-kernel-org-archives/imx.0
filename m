Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294037C902
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683203; cv=pass; b=qMC7+xo17K7rDb0EhoSPl9IBzkmJyaTeUchTX3TeJ877IYvuLhn39GqIYjdtYcUGJqUf9GRcm1wmq04euBZOYN8Y4M6esjTCcYSR5XwaLYqTmKIQcjKFYjtr6MTD3uvJMy1c82/tE866eskdpCTZIAVwJihD16HqAIfZa5RCYxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683203; c=relaxed/simple;
	bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJRNvw1ta0SMid9Ow5nkcpcbodb7ySyCwVJDmvVMTMgUi3mR77r+3gPpKlSX+QYGEBENvCkoJL1GnuvTsgiuUL/Uej9p1vA++XodNBRnb774ZYPQeX6Spm5RkeQaKNgFR2u9LV+Ybf08cDPYqLpL35RUxwCxJ26fKZmLnuBskeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKmZ1buW; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKmZ1buW"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-45171f2f608so196542fac.1
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 11:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683200; cv=none;
        d=google.com; s=arc-20260327;
        b=XTaFeFo2qIheN2HKCO2Koai6pUwBeFtnIIUK44ztRWkDS065gKpPVQAkL4+0ZTNfEO
         cOuis0NNyHmdZTfS/2EbnEsqxCUsc+O/zBLHaMA/zlIYOrAwfWv+BRhBSUX824PZy0Vi
         jK9drj2GEbLoOaM/RFD7TU2hmddTBuzF1fuwTltACBEQ3r6pRlfIgp8R8R20jWytuwYi
         VbfZIlyqHoWNbJMzXXuBxAykXZ8fNYMIcaPMa1pc14bk8B6h3zDgFK+8LaPIKT7WgoHV
         xDnCQQxhCMai0dsIPxzjWENQf8UCQgq1V9n49dxywgS4UBpD2PPmvuVSJS1hcBaKZ0U0
         OM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        fh=IWov9sO6S6h55+1UnlR22pPsw3gIOS8xjs+ARoX3Vzc=;
        b=Cpf+hmsGukho1XcK9HVPEdSv/6jLfZV/bqKGyKwp9Yse/Ba8i9fkzot17Ez+BIGE8C
         xOiXi43bff6ON19Nze6KOTpUmn8eJ3zwU0Vu8yfBZF6KEszBChV1UaWpQwxOFwKxMbAi
         Exr96xS5f7JYiIif93EhGe3dWEJSngc1JQJT9myHmR/ukQ8sck66KgZe3FoXCYElVeRv
         DJQXuxqOXi2MhIcJAfbiUHonQ82a8v6RTecj/40svMFk1rWF57XWCP7+heRV3wQ2lLbp
         C1pMUri2wUJshOp3w0uMWKfa+OwdyaLWL9X7hgDe/BQKqfLLbNRuudwYYFjzgW5Lw3eu
         vBbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683200; x=1788288000; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=DKmZ1buWnr04B3CxxhZftQjZkWhSCD5gle9AjMdQPDoNUOj1GQm52ap7IiP3Um61i1
         rEoa8NhXwYoOOJthK/Fy3H6tr1+447WHxRb01vWa+7+pv7/uIXdg9odWObRfksWo/t0x
         vRGMY65pbThVSGx+7BsYm8re+gpGDypmYNL3zMxBzVsxk0srl9j1A1YUtbeShLZ/qxWg
         mFPCUiy1DZlPwSzUxq8eBEhs9Yuw9haBhamzKhoEGUK+ld9qkNfSjbNoxpMc0tIfrOc/
         Y7csbM4FLUkhICXOiR0twpJ+pl/xwtvpCIqWAIPUZAqpC3X9DAfOtZl/ee7Z4W6z9Ux0
         X+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683200; x=1788288000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=Vvmo1hCKNGXrd7JkEdtJnhaVKWByq4+ixfllvu5s1xvEF8Eg+KCjeJxAsYD0w7ruQo
         GpABX9XtA8GAQ2rhUzzwMbVQZxm2b52llugBB8YbThGx6Vz19/L0c1kwCBnqXw98qpSe
         CUdMsJbLjBRQFWNG778WZ2omW5nuX7A0eCWjQ65XfAeKpa6Gnd1s1JOJOn9hIsiInS40
         OwQ6PxEQJomXckGghCYWTFBwfK1TjZDpjxzL5n2P/ChaTNCa9IlfhjNEDHPv+p86BgV9
         GCUz2wvgG17AUkhTuXYcDhBxeVt9dH/SrsKQRXtrPZhvGN9TldmjFqvCFHWkMVYPd3Kc
         s2Sg==
X-Forwarded-Encrypted: i=1; AHgh+RrG8OSfSDm8ySfhUrNVchQlvGtkXD2jHq50/+aL5P8mjviF0dsH29fYgcpbDaVJi70FFu8=@lists.linux.dev
X-Gm-Message-State: AFuF++n00HLJOovZII/rFp7XrQSOP9E/qLbx2ctupqeKh0tJEh17nXcT
	7XXlgMmXqWT87cX1xwYQpZoRe9kjs4azlqwAQWoq7IBPEhecTn3mFBlec9EsgmDUjsYlvhEsLNR
	B35Ez01OLtXVXihbLE1d///BT4LeJ+Hk=
X-Gm-Gg: AR+sD109dpuVIWBfpwRwSLAMWohSCCxMMwcYJe7nlywD+t4LZbOtVz+CcsI8zUUAY36
	tJX6w9q9Yh0BoQVVdNAx9T9FSV5mCODZcyPbj6/+NqFp3tE2RvpMZxWnSG3jBurm9Uf/AfxSHDG
	RaAkFNgTp3ezRl7uG+GI+2xm6DRqf8IPTFjLan6R1CvcJgWFGxc85XaC+7z2XoBRmhjoTSX0Mz7
	VMqwaKGnncGPu4uJK/b6vwlm4eIJDOnpi3QXEp6HCJXCoxDdjnPtwokQpRX3Tru17Mg2ocIQJqv
	RtpKxUGoTK16SqW5HPKJ96iSjQ3GI+VjmlXNCdJNazJU9Q==
X-Received: by 2002:a05:6870:f623:b0:435:16e9:f288 with SMTP id
 586e51a60fabf-4659bb24b93mr1602806fac.20.1787683200126; Tue, 25 Aug 2026
 11:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
In-Reply-To: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 25 Aug 2026 20:39:49 +0200
X-Gm-Features: AcwNN1Va3aTr02pKhzBqoinFUkwxjfSbh2WQ-EpZwUvKwCIdS5rdnwq9NOj-ZWw
Message-ID: <CAJpoHp56yo+eQAYjvR3ez=HTSzapCd3dYppo=MdPx-Lm4J4DQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Diogo, do you want to send out another revision? Otherwise it's time to
> get these patches merged.

I would keep them as is, unless you see anything that should really be
improved before merging.

Best regards,
Diogo
