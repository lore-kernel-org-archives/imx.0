Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEACE23AB8D
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443043; cv=none; b=TJ4mgNxGbf2ugztSM+FqALfAFSHwi0hNmvF+FfQzSRC6bikKrszcEAOnOmteYUON8wqUtfKYgXjQ6OjZ7es2TS/XRuK7+edxW5JfWN0VdpLkyPL2ohISJAm5mB+bPWEmvRUJ/fxvD1fjdK34fqGFVAlcL/5iYBiMFjK61TjkWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443043; c=relaxed/simple;
	bh=EV8pPfY7I9OwtXfkZbUk6UzFe2y0S56qrkmnV0+G6Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rY1drS/2zRLOzQaSnQdXGE7czbpjUSW1IGIwAkFD86GIKXtN8TIFKYGaMBrxWbuxfrijUsY64axljPWIjcCd/rMjk6qc1lwwe+pXGCUvKgQawz9Qse/hks3QOCW7Nb9POzbpaY+8MssOtcABsuE5cbdWjzPt5Kw//fpzpHnJAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJOB430f; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJOB430f"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b403bb7843eso1116670966b.3
        for <imx@lists.linux.dev>; Tue, 14 Oct 2025 04:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443040; x=1761047840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfYNvCCPGe7L50oTKoEL1dXfDHFFc9ojZJtuVOHJgeU=;
        b=FJOB430fGSbj+43wxqVZvdRUjHJ6VC/1g/FdNAoT1aaiaxHvzLY2zJKLh2lzAiPTqR
         /mm2UZ/jDJsovWJTealqJkZHcwopnsYdg7n2cca+eA3sfHNpY0Ajp2SH4mkoSMmfsdlx
         PVvPvkyCbgk74hwHASjjwtBIKnonlTek3NR7e1txoeMKtKo6AV21Gxk0sA8qcDDPSq+Z
         qToWAIALytUX+eZlwoBQtMS9fVua4sHncHnnw7qtPpAJWt6PdpkjqbFqot0i9tRrmQzm
         cZlGxJDVtU26io1CjZ5R0Q6Z1cKA+k1Zpk/3ofPhHqfeHL/bv23Tf+uJwul25IlgXrdS
         Jj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443040; x=1761047840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfYNvCCPGe7L50oTKoEL1dXfDHFFc9ojZJtuVOHJgeU=;
        b=fWQz5vAltGo8vYRWHlRCA3M/TzJfEq0k4PwWV1hmRv4lwM09/SL8OjcR82cw4VMNEs
         RxnYMdfWtUJH1D7WfWtP9rPxkpjeZ+xQTy3TK5SRWaIGm3aN4zZeLGNRc1LIoDcuWFBh
         mnJ/ayQgGfJvnjMCy84jNQ7C7x6W5p++RMoOxdZbKdwSYBhv1eShPmhxq+SfjSTiNfxU
         DUZA6muqilYiQmE29rOoIWemnaewx45mp/Nk1kWs0gwR4YZDsDiLHvHFhXrv9oj/tBLq
         HCRpI2VjR9q8NpKV1VWl4jYZB+xlF8QltV7rG4DJBydt7lencISLwagN1NWLwQVVzcpD
         A5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCV4dlG91OhmmQKmsxKF3UZAEUtB8JaFbmCgjvbkbXCtbm4R7eeTZPw6nJOjHulxp1KjYV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhrzclpF3TQoi5MwSTY5WacMQdw1Bm3SERvCKriOImJKPQsu3y
	WjHCBKqZc4n49AI4RjbRJWV29X3uroBFRUvAGtGnwugnd6Knd6pEJwVA
X-Gm-Gg: ASbGnctwGTG9w7CGpm02QpklPMl0+puv6jW/gl2nQbkDCd7wsIS+Xhn166HJkMhxrWz
	d1Pb44FY+m+2D7wYkh5ObcnuebYaRW3KP8gee+MxeXQaI9hRn6V5AEIqC2IUUyYStLStn+8MJ7K
	C7KcLWJh6G+LwJJPSvn+qEJs9Zjeo3NASzVr3C2Tf+3fEqfmu4RBgNabOogKUuNSZFH5/8M1Gsw
	H3tROhmbwxhP8u8mnUD9Fyu4WaFLZh3ApGY6WTLQf5DdnZ72hL5juFHSIKY8BLFZ/yIZkdhB9+e
	nEfXyI8Z+v+3YAPzaZcvOVJHpSUqUslquR4jiL4v/LnlKGGIgVWdoRLMo42IK2yQD4xyK7j4MrE
	6cPKR1ZcWg822qsqHXaK9V36ldnX6wFudrEDBrOsuJF6nUPupQAFzTnKOdFv8BEpa5mxdD9DEmb
	XU974lNjksh9VW2yW9VymfBmQVkH6m/H+fAcFmI1n8F22J+S9VFLA=
X-Google-Smtp-Source: AGHT+IEO5ExkdB+Vc/eA9hYbJB2YUbFHvlBREw3jtxdBP+T0I/Kox+2SWgXKekZXvheyf/FHTlBwdw==
X-Received: by 2002:a17:906:c104:b0:b04:9ad9:5b29 with SMTP id a640c23a62f3a-b50ac5d1e3bmr2852743666b.54.1760443039715;
        Tue, 14 Oct 2025 04:57:19 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c129c4sm1152162066b.41.2025.10.14.04.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:57:19 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:57:18 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/imx: parallel-display: convert to
 devm_drm_bridge_alloc() API
Message-ID: <hr4htgladsaixbuhz6un45syyynzxl6qpshsss3cbeww6mnj7y@jbqwfnzbufqs>
References: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
 <20251014-drm-bridge-alloc-imx-ipuv3-v1-1-a1bb1dcbff50@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-1-a1bb1dcbff50@bootlin.com>

On Tue, Oct 14, 2025 at 01:30:51PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This conversion was missed during the initial conversion of all bridges to
> the new API. Thus all kernels with commit 94d50c1a2ca3 ("drm/bridge:
> get/put the bridge reference in drm_bridge_attach/detach()") and using this
> driver now warn due to drm_bridge_attach() incrementing the refcount, which
> is not initialized without using devm_drm_bridge_alloc() for allocation.
> 
> To make the conversion simple and straightforward without messing up with
> the drmm_simple_encoder_alloc(), move the struct drm_bridge from struct
> imx_parallel_display_encoder to struct imx_parallel_display.
> 
> Also remove the 'struct imx_parallel_display *pd' from struct
> imx_parallel_display_encoder, not needed anymore.
> 
> Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
> Reported-by: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
> Closes: https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applying fixed all the WARNING regressions I saw before, thanks!

Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Kind regards,
Ernest
