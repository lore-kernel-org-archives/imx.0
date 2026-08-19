Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70442434E39
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132818; cv=none; b=lP88iYAyhg1JYWqrEzG2nkIfmOcFXxpV0RxCajoGFMxlK2A31BA+wlkb71DVO4Pq1Ukm3SZLTe3Re4/dyFgV399eGaLIF1+7aU/rO1/53tyxKmt1Sx3jytJXg0C1Edfv2LDrcw5GUBKeABM+ihjSAvVgBVvtZ7vYc9zesRNBvHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132818; c=relaxed/simple;
	bh=zlErMMR25SYOsUd3S/0AwpVYnof7u7gBjzWgLBfix9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFjBte/BLWKH9x4QQXp0cYDgK8a1Xm2c6p2lZ6KT0WLR3GGM7hwnz5/Ro1kHouioY8UFEaxYhujf9bKVfC48mqkkcbZuC7V5MMjPFI+o8S36MP8F447ojOaM9D5TAM7htsizQEf8ECU/LpPwprXjxPfS8C3d381YvPYOxRXD4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80cebd41372so13854597b3.3
        for <imx@lists.linux.dev>; Wed, 19 Aug 2026 02:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132816; x=1787737616;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
        b=YgSdsrURKZBU5MkEbAA5LstzgQMDWMOs+4RZm9rU/n7ku/UDY8xKlZrhbr5xctljrQ
         3DVaKfpRL1i6wMOOrpBa9ArId0E6ldxBi2Cu+n7sbcJo/QdyBp/Ooxtyn7xbkizyEzfI
         rOibkPLC2jWUTm5TpFwzVnUBcDJ+6zNIBMj3yFg0SXmnOOIZ+8TJnsd4v/mQlQ3ijdTj
         fpo1af4J40rGz3YSTx5cbq17/CkO1K5bH3M9saOZcd4jM+veAJwfFJYSUsAZHbajtxFM
         zjBplP6pGEFKcnuongERJ8lctmTnF6tQQ6qW7g4kVPeHbHwxpniWNsRdCav4oEGQ+Z6D
         MPOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZefOSckAD0kKPzyRoLmx8/OjM1g/s1HnM3PbJqLJEdrxumiMNE0EiFvbA3ZaQ44bqegk=@lists.linux.dev
X-Gm-Message-State: AFuF++lMi5FBk2dlDyKLl5f/nLmvjEB5jewlDNoDJkrc//0hv0HfRkmt
	kzmGJInH1FcJkEwHhfzYpSQBXSI3IKk1bnyPu+1FTEdF0mftzehJm11FDo3Ks3Txy2w=
X-Gm-Gg: AR+sD10BSlcY13aqZ8JoZMqibyyWpONMns1BrLqpoy23uSaRuTG2KBa16UieDuBX8Lj
	4/O1N4HHgZAPfa8ZVIKZRGF4D1ZGMhwkHSueKV0TFMA958NpFDqJyxJgwWLvs/fYE2wvsREHM9P
	kqRgnvtu7udl/AXubvYpBplCFNL0RtB7ygg7L+tgayJYtIuXuuSdB75OC4QXF3S9VgaSlWT3Qkx
	GWUcnRwqYX9MCuuHOJQbO6yd0ZhaIuJyupoESTRCG5FJI3WiqzMJM7eYf52xszxGhfBIiYUP9zr
	UKnm9GkVKiwuPTLzrATG7g8qvkKVRYshM6z7Y9E5XXMfA6vh1bF8FvTJa0MqzNgkwGt2iG7a7HK
	a5pH5inzRLPeD3Gy9+HxYmXOB/rxuBB69PKMqtSxFlgMDW0c/L6VLIoeNC+BnxaYy+4pBp87gXr
	qkGtEIVpCcSOZqUMq+g/zwPKRo4kW+G6CJSWVwGBuq23WkTrl12k+Cjwz7QKlnqr8fvyYUbKxLu
	J7T9OMO31L56jprWYC2W2MRXQ==
X-Received: by 2002:a05:690c:4aa6:b0:81e:c998:9c9a with SMTP id 00721157ae682-844e2515a4bmr11563947b3.17.1787132815989;
        Wed, 19 Aug 2026 02:46:55 -0700 (PDT)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84512c408a3sm5756957b3.18.2026.08.19.02.46.55
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:46:55 -0700 (PDT)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66c7127a73dso1104172d50.2
        for <imx@lists.linux.dev>; Wed, 19 Aug 2026 02:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrkNiYnAO4aG1obWldemhyFBUfNYtWH/v3OH+typ65qU4nyn9a7HeAAJfU2/MD1f/1Tshg=@lists.linux.dev
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de> <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
