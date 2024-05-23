Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B67E572
	for <imx@lists.linux.dev>; Thu, 23 May 2024 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716487643; cv=none; b=N1UAbCCvd7Ku4JbZ6duMeO76FyzGkJ8JLiM3+iXb3ztB78K0LHolFXgm8RcrbvnYEnsFy9E9iBdAU0dZvYJasC4xCFyqVd1X0X1heXuLzPSc4MKVWCzVF3sifHVzUQ+1lRqsujrzwZNtsxnQXGjjmG9IvEuqWHul84Kcocn4Ms4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716487643; c=relaxed/simple;
	bh=3mrlTMcuptgmskH4sScQfyLoO4h2ZhlUjBZmZ+bDnqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjpXHKTbzSuw59ZjUai6LWdcwZDp4s2Xc1xDnTIFtoYG4VXhlr1OKnZnPlpF1TfQKTxi6VicZQ0D7/MBylgcY60W+U62vWF1YwJopFpDTy314+nwHLLAd8Uj74TARlqb0/5Lf1V6gPbVJS5IXZgON+N/ZdtcqQEpCtL1F255qWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuV7kZXM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuV7kZXM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso19221165ad.0
        for <imx@lists.linux.dev>; Thu, 23 May 2024 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716487642; x=1717092442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFvamzZglehHBEolPcL4rA0lvGrignK3Mpdrws3oBZY=;
        b=VuV7kZXMQhD5IwlN4+JlZvpmJMs/wm/VZOb/lpXp3sca8a7TQ1pHoSHHgripZQjC0f
         E3jgHHQLH7GBGWpmjyDdJaMONAMPPaPfjSiskdFVoorz+po/40LEoX3bFIBELkexD40V
         cfkntjBH/yU2tK+JfJ0sGf69qbptqZA610gnmjnw506xH0ujqFvy/aT0prgybl7rnSNF
         EMWAhJlsz2gPAoyRv1q7KzSwT62XlbL27vWtC/rDnRvk77ftwcPEdeTEzVqAc6QeLyuA
         Cq6CcXbFKmZ5EaQ0+r49nfeyPfvyjUPwr5qfZC9qscjr7rg63gVvEoaDAsaFpj17xM1U
         7QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716487642; x=1717092442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFvamzZglehHBEolPcL4rA0lvGrignK3Mpdrws3oBZY=;
        b=nnPpyUyxZLgA7qz0JLDuhpe7btwGQHVKLoegxRwEGMOwDBCq44AmfesrX/vJohFdmK
         4xG7/Ey7Q1VPA8U4wR1M9DXbecw1nfXjzdw7LKqCypYTurwyriS8BaClsUN/NeKQPlK7
         6o3LyWESieAxLzlN0kW1CyVn1KvL1tXRwTP0gMZa7l1+P3zVNeiMDdifvAqm1zG9lIGH
         i8NinhCSkddn2lnP/nHAN/a5e+J0Bfp2Z7u0M+eIU39Z9/AQ5ulfwz+88ccix9I2/CKe
         17KFi9zVUtp/vzF0orK+U+7qIfx2J5nvx97l8Mi57+WpqQ1LT8tVLR09fziRsWAZ/BCb
         KEAg==
X-Forwarded-Encrypted: i=1; AJvYcCVxoX4cShTkAuuRBaZNkakbmEytwG9O6+wnnSSP2OaCiGc8SYXSCceY6O6Ljbd34jbUY2IvoFZZRYw7MSldb2GzQePo
X-Gm-Message-State: AOJu0YxarxPzNjhLsS1bq3vc1vqni/66LCFaha5LcCdIWR8KjIbpg+72
	6HFou6nfGeqELA9vc591pzGYn8ZnlEn7SEcUBhJXm0DF2vQASbP8pd9/dwKYqtyr0w8vu+zjTTx
	nhJEQdGsIRygBQodFIF3K6siPY49Qic57
X-Google-Smtp-Source: AGHT+IHW5lnRSRg4PCHbuQEIiRJQV3sSxY1XjBl+l0OmlWGBWLh6ELSgenhRJyncHAlp7WNyAce/8AdoA6d3i3/47I8=
X-Received: by 2002:a17:902:ec8a:b0:1f3:356a:a300 with SMTP id
 d9443c01a7336-1f44872bbccmr1422585ad.24.1716487641700; Thu, 23 May 2024
 11:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1716479340.git.jani.nikula@intel.com> <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
In-Reply-To: <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 May 2024 14:07:08 -0400
Message-ID: <CADnq5_MDPH-WxpucjQpKsCAk8mKa75upbcGN3KJo_dqKts4kTg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/amdgpu: fix -Wformat-truncation warning in amdgpu_gfx_kiq_init_ring()
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pan Xinhui <Xinhui.Pan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 11:51=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> Enabling -Wformat-truncation yields the following warning:
>
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function =E2=80=98amdgpu_g=
fx_kiq_init_ring=E2=80=99:
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: =E2=80=98%d=E2=
=80=99 directive output may be truncated writing between 1 and 10 bytes int=
o a region of size between 0 and 8 [-Werror=3Dformat-truncation=3D]
>   332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d=
",
>       |                                                             ^~
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:50: note: directive argume=
nt in the range [0, 2147483647]
>   332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d=
",
>       |                                                  ^~~~~~~~~~~~~~~~=
~
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: =E2=80=98snprintf=
=E2=80=99 output between 12 and 41 bytes into a destination of size 16
>   332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d=
",
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>   333 |                  xcc_id, ring->me, ring->pipe, ring->queue);
>       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Silence the warning by checking the snprintf() return value.
>

Already fixed with this patch:
https://patchwork.freedesktop.org/patch/594864/

Thanks,

Alex

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Pan Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 1d955652f3ba..92744d0d2c10 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -329,8 +329,10 @@ int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *a=
dev, int xcc_id)
>
>         ring->eop_gpu_addr =3D kiq->eop_gpu_addr;
>         ring->no_scheduler =3D true;
> -       snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
> -                xcc_id, ring->me, ring->pipe, ring->queue);
> +       r =3D snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
> +                    xcc_id, ring->me, ring->pipe, ring->queue);
> +       if (r >=3D sizeof(ring->name))
> +               dev_warn(adev->dev, "kiq ring name truncated\n");
>         r =3D amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_D=
RIVER0,
>                              AMDGPU_RING_PRIO_DEFAULT, NULL);
>         if (r)
> --
> 2.39.2
>
