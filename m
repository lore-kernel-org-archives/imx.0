Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7ED4A64CF
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551016; cv=none; b=dKICht+yPcDsKZpwXxsEWxjpWrNjuj2rZGivqyIFZE8qfynFQe8e0fy3El5rcSYQwPZUUMW1I4tB6ntySZbbjHFYmVGKUuP+WGtifkJP9lTgFdCTbza5EZS/WHSRTy5C0z7vHLo/rBrx1A0ZlT0LinGiBvrCV6GmWYfavCkARhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551016; c=relaxed/simple;
	bh=rVlNPjI4P2z37o7qE9/JXBSWEwGmZChcHXGnM7D9n6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVKnw7ZKhp08qL60m0Bw311awprEqDAYDdQud/kUPi70hJXn8Hl70ykRopAmW2Sn2GKxeexQqntd+yZkMuTXn/6sFAKGJuyOSIdJJ28bW9P59TANQ5nePftxpdhCsXdZ073dKwcY5U7yKfYMGdNCiHCSgLW/pcuwIPpC4OFzOK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YCaIdDCy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YCaIdDCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789550997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
	b=YCaIdDCyoE93yZmBAfESVoajo49TPwa7hyUImgklXjgAUauE0Chzl86f50GNoG1YHkECbX
	uKOo7D/Pns4ekjXFNcSGeDA73JAlN9XoMn0nntR3B7692bbvQVsqyPCtGxslQ+DCgKEJnz
	UEYk9QAiKvMY6GLKrQa4HtfSFvVHLhs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-R1frZppLMTmBZMe5FY49zQ-1; Wed, 16 Sep 2026 05:29:56 -0400
X-MC-Unique: R1frZppLMTmBZMe5FY49zQ-1
X-Mimecast-MFC-AGG-ID: R1frZppLMTmBZMe5FY49zQ_1789550995
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso28716415ad.1
        for <imx@lists.linux.dev>; Wed, 16 Sep 2026 02:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550995; x=1790155795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=BoklSAusEygv17uZZF4Ch/7CLe90KMBcFed37KiaESGh1SittVGEnFeUAtrPW+YnjD
         YkzfmaNdDdsQg3162wYqTcp3BB7YrrftX01fnWma9NTATwMaVhv8dKlW8l5VuN63F2oS
         k0043SCq29REEfIHNwlhepGSV9kkWr8w+BqihRP9HpEO4OZC3wLHnGFEWrVvL7DbENb1
         72iXlcqKgUP4Bsii6ecxL09afpn90nL8ER+lf20VRNNPb4421ubc5XEk9SS6WDHTCD5k
         914YAfnhED9gL5lYTYhQU+i/TglQleQnc3Ygie8gjttbf1KFSZn2eFbVAU7fUFhiQYjs
         ZrYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2CH2Cu+PZofk6dYooHm/37z0lpziNveU3CJKNPuM2Fs59/i80AY18wAqUxpFftl3Ke5o=@lists.linux.dev
X-Gm-Message-State: AFuF++nPID8RREb/gD7Rk3RKrG980vVBM+8NmB0tjUIyeCJKrTzJqLml
	Ut3X621md07M7JeI+QqsDPE81FTUqqaCR18P5TRLQGcpToaYf8jmc//+qjwydLoDOsqQ2wdbrCU
	+OmCT89dVbReeDCUeKjFmCoqBaIiIcGDMt1BcZFNfTUvUB5/BM+9v380BIuMtQwXFnWcbRQbFlx
	WNP2RzmxveGvCQM50RA8lTDl2YxYBw
X-Gm-Gg: AYBFou0MCV49hThvwpxRqaommmILscc1c6Om4Top560ihhaBbnjIxzkWbhTsWU5Sd19
	qtnS38n6h4eKSOXAs80kYei9owI/Dh+D+MhhyuNzvhC5r4tNB9DoUCuz01GjmA1s0Qs0iq8NTg8
	knpQ+xgfvWJ+AN/gwiEEsPlh1WL8uFdqAIWxLdTeEWn+5K+wobl7GJs1lK
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd8ea1cd1dmr23798625ad.10.1789550995058;
        Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798155ad.10.1789550994573; Wed, 16 Sep 2026
 02:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911124540.279841-1-tzimmermann@suse.de> <20260911124540.279841-3-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 16 Sep 2026 11:29:42 +0200
X-Gm-Features: AcwNN1VjQRR608PaSU5v9yXg9eP7o3aE9lu55JInhqrDujLUhvS3kxSMIUXF4N0
Message-ID: <CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] drm/panic: Test address from kmap op for NULL
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iHinQFIul0i2GZysEzn11tWutnlEnMWz1Amggqu-eSg_1789550995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Fri, Sep 11, 2026 at 2:46=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
> not likely to hapen, as the previous page from the same memory area
> has been mapped successfully.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries=
")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>  drivers/gpu/drm/drm_panic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ba21df4be338..d28ce8878e05 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr=
, struct page *next_page,
>         u8 *p =3D vaddr + offset;
>
>         vaddr2 =3D kmap_local_page_try_from_panic(next_page);
> +       if (!vaddr2)
> +               return;
>
>         *p++ =3D color & 0xff;
>         color >>=3D 8;
> --
> 2.55.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

