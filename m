Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52214D796B
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645388; cv=pass; b=Y/twZWVsG6QgHdVTZLRMqWANKhKzF/WexAUb5/zIpGhsU2AudXYjCYbIWvTAa49wqbHH2UJUkmMEvErKy36zlQWetO7SuqcZ0eB71/XSFmkHt5ZfSkor8NGoHJ6r1MebsSkjQIuL3WuXtur8rFzDnUa1v0pavSbNS8sKu7zO2Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645388; c=relaxed/simple;
	bh=vbrxd5srWOipj09aXDQHzqS5lMVRJ7HAcTG0L1bqBDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qez+Xh7m/HzOCryvyioY4m6OkKgs5Q6Gs+9t8OBKrGXpcoLx8o6TUvn8DjqSAmy/fWGLXQyDCblT8fowLkJaeO2KH1eTogzLdTigy/8eXUeyA7+yShjAw4lbbIpkuHCcWf8+C4El/CHw5lPwv7ixI8SkhC1DkwhTQJUZsgL84tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L7gi7nnf; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L7gi7nnf"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso623250d50.3
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 04:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645372; cv=none;
        d=google.com; s=arc-20260327;
        b=LPLGg4D76WAO38noFAnTwyxQDMOvCUzQCDRgrLRgtrIOcdUBFCCxIOTrW+2f8BLW10
         3M4BaieDOqOYIoeT0Szig7xH2YqZpTFNEAOUZoGkgiXLXmA7FOScLmY3Jgf6oiVZS0Ic
         DIqUpb5DfvpKckb9MvNAP5E9+DhNxra9Q5msZzSYj+fxF8FIIeAan6Naxk5U30IJGRdL
         vOzqsasfHIsUvApru3Kv7rwjd+ialb0WCiPd9tqqOoDA8q7t21ynF0tHvvahBBO6CLJX
         L1OnHmKgdsUUjGLNn5Xx8KyiiwVwHaloT7cSHQkAAL4mXynQydx1aF2RswZNvCTbrGDX
         veew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        fh=I9Lpbe5pM8NR2YXFLv+u/Fj+EXoC1ShDyQHUGvN9dZ4=;
        b=Q67iZttASLLotDd8wUMHhhDWKQILnoaIow3M3Ps8wuds7UmQuWuLbpMwyVQ4vLxVnp
         A8fPYxGvNBK9rf14o0Mv+QcXuW7QAHQf6QO6z5WJpbci4J5a0TjKZ84WDYK4CVXlekcx
         JX73XWtWvzxYgFu4N/Lt9PwVFSKgGXObNLIbT/Y3iYHaty5UOozFkrtkdaJ7F7l/YIFN
         Y9SuTV4wAFCvtoyDLx7xXTBWuISnokePzTHb0dZVYQjigy8TYIt/Ouleuz+i7PR8ccjX
         qMJsNxfzyTy/l3iRg7XFaCtbdK8Pk9qNbnpGYb6MeKPMuUwPrwyCZ/h8y3SjIxPcVQzt
         47Eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789645372; x=1790250172; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=L7gi7nnfZppgwD2qjz5Ad7tRbxH5hIwL/Q6sCAyf2Ylq0qdrUv4xGyq2dfAVq5CBko
         7y/MbQOBQiiIII+E1rdYurmkRzxLwwgb011NsmzLefGr5raYeTZHqQavqjvRO/YBAYq4
         CB51O94imJPhsD4olXHWrlTO0Sdxi+MlsK9OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645372; x=1790250172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=TMz97FxUBdieetzkyVMbg4yEj0BFkFQVdXuEyM2ePiR1CimFnONWlqmIC+HhVu4EhO
         Gwpm9S47YmDm0lPcrqAd605o5RnMjkJSuIewpPbtHSbgCvBd4XT03jFC7OInKMjIVqWw
         VbPrPD2LicwAjsmkpy/6rctRHAiSweNcvuWBCehqBhVmyhCCVSleJ/VoRgZOW9X/83uC
         OMouuUpnw+rpAU724NhM2UKjMU0R1VtLWUIzGtmwKUMfPjt6HKTHPwAeSoO4gdWxX83b
         ujjp6CzWLFxfaUYT3jqzdylbf4hc9BRM4AVswfREQNgcPjZeJsr2pCXOWCq2PweuxhJN
         sB6A==
X-Forwarded-Encrypted: i=1; AKwUvBzylosusUB2RlWI+tx4W4XLVi1OviRchhfyvdJt9AK42wlrP56umatUFgC19wjCqZlfszM=@lists.linux.dev
X-Gm-Message-State: AFuF++lV+smccde9qjqLV+sNPT4c/0+oFMlvMleQwKu7G1K4r5qTfZmP
	Mqg3+9/MPpW2FgkkKW1suSllc3sFoD/eZxe9pxIyMtc8uQLPP895kpz9WYiqvlVgAVV6V3GglTM
	8+iQaJpi0Rrnu+73wcvCZW5vliWNr80ragfbbxs6Y
X-Gm-Gg: AYBFou1fJmB++fVIo5qgmJXrw40npmu1Lbw5M6hQHyvumfWVPtfqw5Felgbd9mqSdwO
	NWtcPzZYIPTu4Zehs78eZdjbGGA7+E07i9tpMCX1THAHbvPvXOldOGKK+3JYfmwfwgnQi6s5jgi
	mY5pyCwe9vzjU94YKyMZwLhi+hYUWKluIB4xtRq2vJh7FHsAhlkJs4Hix2d2ZFdXqCEK/6WXl/n
	y3+3SJeyFUZrQVlCjK/85FpToXX2ExolCkjAKJJGVCRUqNfV/ftmrQyRKZP7zM06C8BALGbUSp0
	0xZ+CJ0EjDMvBLYHIGDMhNSAm+acdNsogJhg8z7TQJzMWod9ABsuvEa5PZqvbWMk/YGqw4hB0bb
	f0sYWGOzw
X-Received: by 2002:a05:690e:1181:b0:66e:54a0:cdd3 with SMTP id
 956f58d0204a3-6717724501emr313133d50.42.1789645371777; Thu, 17 Sep 2026
 04:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
In-Reply-To: <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Sep 2026 19:42:39 +0800
X-Gm-Features: AcwNN1UiSWBQWxLfTBKkSaF0uFiyhB3L4EIUoSHVNJlTekBmF6uuJ4F5EBEDj-E
Message-ID: <CAGXv+5FHiW8umZ=wLLb5wK5Qz3hf-mbxC_zH5v+pwxxyUNTwew@mail.gmail.com>
Subject: Re: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr()
 helper
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:16=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-09-16=E4=B8=89=E7=9A=84 11:33 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.
> >
> > Changes since v1:
> > - Add and use new drm_framebuffer_get_block_offset() helper (Thomas)
> >
> >
> > This series adds a helper to retrieve the buffer starting address of
> > a
> > "clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
> > which gives the address of the full buffer.
>
> Should vs_fb_get_dma_addr() in verisilicon/vs_plane.c be replaced with
> this helper too?
>
> I implemented manual framebuffer offset addition here.

Didn't I replace vs_fb_get_dma_addr() with drm_fb_dma_get_gem_addr()
already? At the time only primary and cursor planes were supported by
the driver. The primary plane can't be clipped, and the cursor plane
had some custom clipping, but seemed to want the unclipped address.


ChenYu

> Thanks,
> Icenowy
>
> >
> > Some drivers program their hardware with clipped dimensions, so they
> > should be using the clipped buffer address as well, unless the
> > hardware
> > can advance the scanout directly. (Side note: many drivers still use
> > the non-clipped dimensions.)
> >
> > While at it, also pull out the offset calculation of
> > drm_fb_dma_get_gem_addr()
> > into a separate helper in drm_framebuffer.[ch], thereby separating
> > responsibilities.
> >
> > The sun4i driver was recently incorrectly converted to use the
> > unclipped
> > drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
> > pixel groups, but also exposed the mismatch between the dimensions
> > used
> > vs the buffer address. Two other drivers were also touched.
> >
> >
> > Patch 1 adds a new helper to return the byte offset into a
> > framebuffer
> > for the start of the pixel block of the given pixel coordinates.
> >
> > Patch 2 adds the new helper to return the buffer address based on
> > clipped coordinates.
> >
> > Patch 3 switches the sun4i driver to the new helper, and fixes the
> > luma plane buffer address offset for subsampled YUV formats.
> >
> > Patch 4 converts the imx/dc driver to use the new helper. This fixes
> > a
> > mismatch between the programmed coordinates and the buffer address.
> >
> > Patch 5 replaces the open coded buffer address calculation in the
> > imx/dcss driver with the new helper. Existing behavior, which might
> > be
> > wrong, is preserved.
> >
> >
> > Please help test. The series is only compile tested on my end. The
> > sun4i
> > changes should revert its behavior to before the
> > drm_fb_dma_get_gem_addr()
> > was adopted. The imx/dcss changes should not have any behavioral
> > difference.
> >
> >
> > Thanks
> > ChenYu
> >
> > Chen-Yu Tsai (5):
> >   drm: Split framebuffer pixel offset calculation from
> >     drm_fb_dma_get_gem_addr()
> >   drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
> >   drm/sun4i: layers: Fix VI buffer address for clipped offsets
> >   drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >   drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >
> >  drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++----------
> > --
> >  drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
> >  drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
> >  drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
> >  include/drm/drm_fb_dma_helper.h        |  4 ++
> >  include/drm/drm_framebuffer.h          |  3 ++
> >  8 files changed, 118 insertions(+), 51 deletions(-)
