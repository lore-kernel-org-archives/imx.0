Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E130CDA6
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758560804; cv=none; b=QODV6yqK/HwwON60VrsuDCieDJ/jnGSPSfZFAxNfzoUjdiSS1kSDz/kPvssymDdC+cyj8rBKa7JLEyF40sJLomTKMTRQuju6MTMkHycXrtFLk/JnbLBJLaWa5RJ+7X8n4paeUdNnyHYjRt9iVzWRgAX7YyqKoF1e4bgPBAoJsTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758560804; c=relaxed/simple;
	bh=mfTxy/VfoZLfkD3A3YneqkiMYF042jvaQsyUPhITHp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXlRb6cVIYf5PFrjyPHf6HfuHGqUa0tLNSVjZH8R7dO7KsowVVyOU5TygEm2Q1qHEbhD7b4rr+YmNmCV2xs3W4ecuj9t10sL3xdDwVGFJflnFdI6fzFDdoi7mhE0X6lGA4IBdPdga3EmlAfv2TLeLzWhyNkpbc1Lj+V/x9MEeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=rd1YN8eA; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="rd1YN8eA"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57eef777d3eso1128215e87.1
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758560800; x=1759165600; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=;
        b=rd1YN8eAtZ4+Df35uv7yYm0hT1ZOAADp7ddXvUVB5WyZUw2CyDCxN5CPREvopGlL3H
         YHJEViFbPCiy6l52GNL0clO5jiuvaWOoGmHfEaWDNiErLWmrQCL/6+/Lse9SAYl0bnGg
         kBTZTsKtha9dN/EgFKS1sJ7/i5SyU9GcAKNYo1FF9qoAmnnI8iYvxQ3aZWAdaSMlSZGt
         VmI7lI8TkGBZd3yB8tgsetSC+Fvf7FvWuCLFfukZ2jjmZGiYxxgxwvZd3/dCJkt5F5M2
         vxDAnRzOmiJPXJUO+YdVIB8NKEP3dH9xhrgJUtHk/18Xk2HUg8qeACG+MUjwFetDfbgc
         QsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758560800; x=1759165600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=;
        b=iabrUUFV2CsnBNF4hufP8HJc9aGSbNIkm3+6CkSJqhHn2zXPHIyCGIN87+IsorI7/y
         uTdlvgrtExIvO6kiXmdwjEyT2BkkWtmbb0/B6wVQSu7cbIy+BmWgSMPd3cyLROJ6vXCZ
         sHDp1y8LOz9JyW/KAqqqcbtYfyShtiaWvPIhocp7rDefH+qAN1aFDMa1Ae5/T10pteMa
         oUYlNrIPYOF1v+jtBZZeXmhA1QuEnr+9PgguCCFJk6D4gtlft3b06ubxjeLLtLf5aJFZ
         O+OtPF/ahzgH2DlSrt2b101mxxfhERKSpyhhGVGfHtTlHiA1tcEk9Y53cFntwZUH+huw
         ovXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIEtboN7euNN8pgpbyzLBjAdWRYadseONHD/xrNOP/f1J5mFCuPtyAjK/ZUMSIJ3azbUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPrzDmJD7M81UINQyPveOGM7uAcRupddLCecAOgEbbT+WfipCN
	bLY0a7ifqQlDuuoLewJm/3BmMuNMP7qgj4EW88qdWhZlVj2gAMRFMhyZG3mriOmCG6Qu2dDjovq
	zf2UslZ7b1z2te/tATvyaV7zneWmoNo8dwhoRuXoQ7g==
X-Gm-Gg: ASbGncvIvfpcqVFJFSmlKB+9x0QJZwExrQcAT7YtprXI5w+DrM+xO6LTW8eBxxigSKh
	1mm1+FGRmTroJvpkHJ/SCtoLA7Ag9iraz0DgAA3nonTuNX+11ssq6JQQ46ur98Olv+wcZx8ulBo
	rP1ILzmmw3V4CtwuESxCbiGjZB1PZHxOgF95YX/40nJ9hbv/tkdSzcwMBOkp6On/yrrmgl/5ri0
	te0
X-Google-Smtp-Source: AGHT+IGGtpp1dzmc7QwuqgW2pSLIm4mtcBhZLeu+2i3+Ni9prtVcG/n56U1c5SPCEyTQDr/U3BLl49JsojBTLduSacs=
X-Received: by 2002:a05:6512:4013:b0:57b:aff6:68a2 with SMTP id
 2adb3069b0e04-57baff66a5amr2706206e87.26.1758560800251; Mon, 22 Sep 2025
 10:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com> <20250919143436.GC2132010@nvidia.com>
 <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
In-Reply-To: <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Mon, 22 Sep 2025 19:05:49 +0200
X-Gm-Features: AS18NWDJSAue7YE7c8rlG0jvR5lve033dTh_Rnu2Tx6e392cgPO_ZPu-mU9r2No
Message-ID: <CAHNNwZCsBY+ta2-OqD40K0-C8N25PLMYfOJowiVeaEMotqR1nQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	imx@lists.linux.dev, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"

> On Fri, Sep 19, 2025, at 16:34, Jason Gunthorpe wrote:
> > On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:
[...]
> > I am right it sounds like we can drop vivt cache support with highmem?
> > vivt is alot easier to understand if kmap isn't running around
> > creating virtual addresses aliases!
>
> I think so, yes. I've prototyped a patch for it to add a dependency
> on !VIVT and the drop the code paths that are clearly no longer
> needed without it. This obviously needs proper testing, but the
> diffstat is promising:
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f14bac913d50..0a31cfaf3818 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1214,6 +1214,7 @@ config ARCH_SPARSEMEM_ENABLE
>  config HIGHMEM
>         bool "High Memory Support"
>         depends on MMU
> +       depends on !CPU_CACHE_VIVT
>         select KMAP_LOCAL
>         select KMAP_LOCAL_NON_LINEAR_PTE_ARRAY
>         help
>  arch/arm/Kconfig                    |  1 +
>  arch/arm/configs/gemini_defconfig   |  1 -
>  arch/arm/configs/multi_v5_defconfig |  1 -
>  arch/arm/configs/mvebu_v5_defconfig |  1 -
>  arch/arm/include/asm/highmem.h      | 56 +-----------------------
>  arch/arm/mm/cache-feroceon-l2.c     | 31 +------------
>  arch/arm/mm/cache-xsc3l2.c          | 47 +++-----------------
>  arch/arm/mm/dma-mapping.c           | 14 ++----
>  arch/arm/mm/flush.c                 | 19 ++------
>  mm/highmem.c                        | 86 +++++--------------------------------
>  10 files changed, 27 insertions(+), 230 deletions(-)
>
> I did get an email from Nicolas Schichan (added to Cc here),
> and he is still supporting a widely deployed Kirkwood based
> platform that uses 1GB RAM configurations. He should get
> a chance to test that with CONFIG_VMSPLIT_3G_OPT, but I
> would expect that to continue working, possibly with minor
> bugfixes.

Hello Arnd,

We don't use HIGMEM on our Kirkwood platform, we are happy using a
2G/2G WMSPLIT. We don't need a lot of virtual address space for
userland, and with the 2G split we don't waste physical memory.

I'm happy to test your patch serie with VMSPLIT_3G_OPT and see if it
still boots with it once you send it.

Regards,

-- 
Nicolas Schichan
