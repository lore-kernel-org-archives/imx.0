Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A25379EE6
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 22:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783202673; cv=pass; b=FnPt0WfG5n7+lTWNTbC9574+FC4f7IbXpF/SggC0CYqjdSzK6Oz3XuYJpgrYxXYZsK0eSUM2KKR3ItNId68iuXjDGrljaIuY5xb/aBmwJOldU86kSF93xA/di2E2C3T+sjT6htHCN30WYRr6t7iRN/OwSQ+dE3qY8qpShKh2E3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783202673; c=relaxed/simple;
	bh=EbA0kw78W0tMrYsUyww6Og5KAhqhEeNoGRE0/v+iVAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oe38W60kZjc4A6RmxKS7IvpRikSMrez1c2UBsgZFinEM/CI+hGOIB3bziPgbWT+HhQjhsskeNGyFG6NvJAsb/IK2S46me2HNCzAsIJ3pBGvXt46jaVDr/LKDngWZwcW6uUd6mvX+YkMtw9RKSvxA16LEZh0FTYqHy12s6xYDxmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXISMxSh; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXISMxSh"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39afb0d9f7eso16404561fa.0
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 15:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783202669; cv=none;
        d=google.com; s=arc-20260327;
        b=gtJylVasLzN1rvQQ4GtOov6+srf6nkw+rLTufgRD8LnZnr6ZV7TYOSkND5+A6EEJ75
         qq1NDDUxc5mw4jo0gsjiQjp1vfDU9grnbLicvwP3HKaWcq+Diyr7UOVayVAfhr0BJFdo
         41W+XZy6roA5MXFzLaRPT0FccqPH1vjz7EY+uwxuVmdZO0hNjHAHSYmDiFpFhhkNnebA
         SqoJ/NqVLVR/Z5uQY8amIiHoK+RaMzIqtZVcoEo3/anIAveO/AFReIAks0F4OpVVVJOx
         aTDYxdQ8gWxywoj3t0P87uRmielDMqNRJCJ5C2pCBPtjjVjT+4Rno1FQd1NqNyfFXRT7
         2F3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imtw4Ja43+86I9p9y9tUxtB3JG8gRr4QZxWm1ZiCc9w=;
        fh=bXZ+ArKYbQIgxPL8NcxH8QN8SEcWF3MNqCvWzPdaPXo=;
        b=GLWz2bps1CV3jjq4R+snGrIHoVyM6g9X36rbRoXiZ3TySBplw5ZtsZz2aDe8DVSDoJ
         zmZ7qWZvJ7RyG1iw2e68PpERuErYq2brWYU5+/O2Cg84cffIOTEymM6PimPVbjnnkT/5
         7NBnUJ9LtxRFegTYx+5yDRUzZA1uyuXK7Ehbs9DwbCL+1yA5NloYSYbuILd85NsmUXJL
         C4O56P2zkGtWjXKkkf19fCrLOGbSCHgPrvqz0esOE3BWYf0d81ZJiTikuVmAm5oP+7Hy
         HYHCVdLnyVdJnM4XBh8q4jQmC4GbTrqlfDlXWaXKA6zwoFoEsQoUO8MP4n88iti0trNy
         h7uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783202669; x=1783807469; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imtw4Ja43+86I9p9y9tUxtB3JG8gRr4QZxWm1ZiCc9w=;
        b=YXISMxSh6+CNoNDSpYSORUM3YROXX+lwp2wPTpVZ3IsnbUN8wMtOG3ETEmN3afCDWJ
         0rjrcNkUfOKyFFKcSO6oOe1C0o5mupTLBbM8JaxWWaL9i0AI2My3LrPmWp8/D5dpGkVh
         wTjvHZ1cOb5jnYf81T/3Ty5GAQWIdemdQoyp59E1Re7tFXtsL27x7CnqChQMxSJWf1yR
         oBMSjTabW4ohGz9QYR7gW2fVLf4D7Qt+azExVnuzluPCbjxQ+viShasNJUyibslymjag
         61FsT9Z5EctuGJWu/rbC5uiknXS2ACTlKy1WMIn7SFIRImBbpMdMA79KAlsewYMGdjn7
         QQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783202669; x=1783807469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imtw4Ja43+86I9p9y9tUxtB3JG8gRr4QZxWm1ZiCc9w=;
        b=ba0pwhdK/fFP9fJdgzWGmwgS/6EvlTYKGdMFyzWuobCxkG6KHAwMmklbWgbjj8eJIc
         1Vd2cOvJr6/PTr374JLequSXg3YYTEDTQKmmsFI2Uwzj5F1uZy4rcyJ5HyqdxnO+lM/t
         CApYCip1CyWjE5jXg7mHDOXi2M7WlYYrJvUMy1BcveZ7TKwV8cURLmDSTVLXuV1eeTtQ
         hy2UNQcgKYvLKtXc2c7XGwEoulaLHtpqk2EBAMg8CFMGcsiwmnizb8XeXdXwNrAQCbOD
         HK1Z5OVZXw61kR5bjqvljSarSUPkJVI484VGsj9BaT9d84Z59WuU7r9qJr3XeG+p1sD/
         IHRg==
X-Forwarded-Encrypted: i=1; AHgh+RrGzWo8KojvReecK2lcyczyGXpZyTYiwWeSaAiEtZAA+onauElhw40uHIJVQqW0oV57JwA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc3BXm5ZLCIMnvn30hVzSbB1rrr/y7KDZpEeH+G+MUA5DsX4LO
	N8Snou9j5toGXlGWKtBzQXvoDY7Nf5NmaQ+WdtyYceB/gyFCTniqZSvpmSuiE95iMlIV1tofTx0
	jtjqQW7fl4Wv+0DABGuVt7G1TNB0PSpo=
X-Gm-Gg: AfdE7ck8gM6lMR81uS06J4dP3Ibb6k3hUECKSj6gIh57tr5ognECWN3LFP6ngM/9mTk
	DPrNAk2bO05fR40zJuY5j5Fh4+wmo/xhC4bNg7i3wCRUTmrfwcUe4QIlbVDt5V8MdAT9OyptD+2
	Suh8o3nDTJkTPRsPet2gLcE21WGxS/Hx0Ys/Jy233I8mjtmDC9sA1wLV1/KlECaHHv4649pqR3m
	ySO+l4Eg7CWi6Mh5mcMaR7S5OeTZXz1jcTracwsiLeYH5OcWpCvy73OQqdj37NV8GndrVK/urva
	nMjAyitkU5ZrT5yeEhmgLUqqb9qxTT8c35WVOjXpxGFm/RPI9+VkGLryopP+jQ==
X-Received: by 2002:a05:651c:2102:b0:39a:e9c1:5809 with SMTP id
 38308e7fff4ca-39b53b5b23cmr8342201fa.3.1783202668746; Sat, 04 Jul 2026
 15:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624100326.413699-1-piyushpatle228@gmail.com> <aj5MNiKSCiEDvDzL@raspi>
In-Reply-To: <aj5MNiKSCiEDvDzL@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sun, 5 Jul 2026 03:33:51 +0530
X-Gm-Features: AVVi8CcSIfFK5hT-w5CsIKgn7jtLkN9mCQbJXOSTVkqzWIMXRePG02SF--UMxGI
Message-ID: <CAMB+xkayaViXeC2GyMMUfeCMzA4=fh-Dq6NYOL-hzKoLfAF19w@mail.gmail.com>
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, marex@nabladev.com, 
	daniel.baluta@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org, 
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 3:22=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> On Wed, Jun 24, 2026 at 03:33:18PM +0530, Piyush Patle wrote:
>
> [...]
>
> > The current dc/ implementation is a multi-device component driver with =
one
> > platform_driver per block bound via the component framework. The downst=
ream
> > i.MX95 driver is a single monolithic platform_driver mapping all blocks=
 from
> > one register base. Unifying appears to require reconciling two bind mod=
els,
> > rather than only adding match_data.
>
> I think that upstream i.MX95 display controller driver would also be base=
d
> on the component helper.  That's something for sure.
>
> [...]
>
> > There is also anticipated divergence which is not yet upstream (i.MX8QX=
P
> > prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX95 blit
> > engine), although mainline dc/ is KMS-only today.
>
> Just want to point out that I sent out v5 patch set[2] to add i.MX8QXP
> prefetch engine(DPRC + PRG) support for KMS.  That changes the driver's
> mode setting code a lot.
>
> [2] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d49=
41@nxp.com/
>
> [...]
>
> > One question for Liu Ying is whether the separate-driver plus shared
> > helper-library approach is still the preferred direction, and where the
> > helper boundary would be drawn (which blocks/ops are shared versus
> > implemented per driver).
>
> Yes, separate DRM drivers + a helper library approach is still the direct=
ion
> I want.  I think that the drivers and library would sit in the same
> directory drivers/gpu/drm/imx/dc/.
>
> The purpose to add a library is to share code to reduce overall code line=
s.
> I'd assume that shared blocks or common part of slightly different blocks
> should be covered by the library.
>
> [...]
>
> > how the component and monolithic driver models
> > would be reconciled given the differences described above.
>
> Like I said above, I don't think upstream driver would be monolithic.
>
> --
> Regards,
> Liu Ying

Hi Liu,

A quick follow-up with some progress.
I went ahead with the refactoring we discussed and now have it working on t=
he
i.MX95 15x15 FRDM, following the component-based model.
The common implementations for ConstFrame, ExtDst, LayerBlend, FrameGen and
the FetchUnit base have been moved into shared dc-lib-* helpers, with
SoC-specific register layouts and tables supplied as data. The per-SoC glue=
 is
split into dc-drv-common.c, dc-drv-imx8qxp.c and dc-drv-imx95.c, while
i.MX95-specific blocks such as DomainBlend, Dither, FetchEco, FetchYUV,
HScaler and VScaler remain separate component drivers.

The implementation is functional on the FRDM over the pipeline
DPU -> pixel-interleaver -> pixel-link -> LDB -> LVDS PHY -> IT6263 -> HDMI

EDID is read successfully, the initial modeset works for all tested modes
(1920x1080@60, 1280x720@60, 720x480 and 640x480), and Weston and sway both =
run.

There are still two known limitations. The initial modeset works, but
subsequent mode changes currently wedge the ExtDst content shadow load, whi=
ch
appears related to the lack of a reset path for the i.MX95 FrameGen. In
addition, the DSI path is implemented on the DC side but remains unvalidate=
d.

The implementation is currently based on v7.2-rc1 together with your prefet=
ch
v5 series.

The work is now ready to be posted as patch series: Adding LVDS/DSI
i.MX95 support.


Regards,
Piyush Patle
