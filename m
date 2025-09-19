Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96C2BEC5A
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758266677; cv=none; b=Di/LTGPj2Hm+ghmEz5HuGYPubJn35o2TuryUAwl1AA6xj1vY7kEiMpdVOoF2aPqNB8isGTe/DtrrLA1Gur8Y75Tteu3Nt0XRHpS2ON5UM5Xsna0IIpvBoBkJ0ZRz1LIPtjdtgRKEi5wrWHHUVrE6uIX6I9KT+jItCFy/HsfR81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758266677; c=relaxed/simple;
	bh=wb2qdIEva+9wMnDjLkyVGNO79u5HZMke8qdhK9b51SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtLJA930VnrjmQK+azMJDJoSzl5/2ELTM8FumYSkjx838qiUYYQ0iGVzsNlUMtJjBYMaAC9YKeVpM8f6LOPcU6U/4xC3NdZW0P68EhZ6qYqIK3lN4e+JaUWAkEVMnmt3OddXmnaKLd36Hc/hD3IqYpxbqwfW3rT9wreUlT7T1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b5f6ae99c3so19453711cf.1
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 00:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266674; x=1758871474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jN8ls4Umh9EIXSEQoAkCyXxQ8L8mjN2Gdzzs4J/riyA=;
        b=shO7lg8+b7oh2mq7hZvpqH2djy5hdSAm2rJH6xNeKdeJxd3jwVGp09kcgHZcUDjv+O
         Gqu5yweQdI93MB2qVrRaFmzR7REKmL3tltT8AksEhs7WjGGXTgiuQHCIZLzTad/nET4E
         lRYAFcqaGrjDWL7IKL5utwz7g7gIRng0XykbE9UjhIWp40RMAdgsMjx7YQkCDAf3S/Hz
         pg2sXE0urnPW/uPYk7B5IKJ3cYU/1d/erxapoEUSHnUAbZeYQa7LOT1hHKG14NytIcu4
         T8Ci2YXgbvibKzvsR6PoHMfBsD6zuSOIcOE6FoLeKdscvHKQOooiBAqeoGrvhiyoYLvJ
         Oe2w==
X-Forwarded-Encrypted: i=1; AJvYcCW35US7OWE26W0lfYC0Gap9NevMCJ4efm9JelhFdRYlV1glASLaXt5cGClU8o01AeEEC/8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTOyQgbE2hZWt7vi4CR8E4jjgcHUKtR7FQ7BGFmq11OCUXY0zm
	dsdMM43mstqe+CD9dKIoZdAcHK3X/vFx5bNwSzOflJF9QMBRUq9Lq0R5q9ZAjlbO
X-Gm-Gg: ASbGncs2L3schfyNIwh0tlLozSSD+yPGctSIfg5pNhNCn/833EcNvjy0RXEMX7ebM1m
	KbUAEUfqd4oVgMgFS+TtF5fL/Kj1tXwUPsENJ+7/ssukdoS82V4/vwceea7jDaP/B65cNxnfgg4
	E3oHY9DfSb+gOc8EN0FY83gH0pnsrWmnde88nsAR1uJvoLuEQgiCFHTX/luIVGeLjVd5ApXk1Bk
	DIha0qQAH3gvrqxeSHlFQEXFF0XIW6wMvgWjGWE+Br1Om//ofUV8Y4PvStz/253UHc/9+J7p0MZ
	Y5ixYaIKOePvy500urpA41e9CzcpWPSZ/HvRaPQ7l4haw+YFA9q3DPmVnUDYugy3XG0nFXiDJK9
	8j2LiIEPZgMuUKYR+VxOnc0O630lS0JhifBFP4XWlsz59M9GX0o2u21y3O+ZZEg64
X-Google-Smtp-Source: AGHT+IEPA6/beiJhR4HuQ8mF/sELJzYvtWRGtu2I/xYzwtbcM5Wp7r83Jm6bzlIC4B1QO+PaK749dA==
X-Received: by 2002:a05:622a:3cf:b0:4b2:fe63:ae03 with SMTP id d75a77b69052e-4c06e7ccf9dmr25771631cf.22.1758266674282;
        Fri, 19 Sep 2025 00:24:34 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836278b5789sm296461885a.17.2025.09.19.00.24.34
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:24:34 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-81076e81a23so254396985a.3
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 00:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS6yoi65TGZhYo1Ag6Dj+7le+eRqbvM+AZyRmV9bEBxRmAIhYC8Rnaaps+f+ginlrOzyY=@lists.linux.dev
X-Received: by 2002:a05:6102:534c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-588f3357b74mr639278137.23.1758266271934; Fri, 19 Sep 2025
 00:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 09:17:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
X-Gm-Features: AS18NWAI1tRNfDFQjIFUy24j2rmv5VjIZdZQpBy05JHeqlSMB-7iVf4odZQDlmM
Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> >
> >> I'm still collecting information about which of the remaining highmem
> >> users plan to keep updating their kernels and for what reason.
> >
> > On this topic of removing some parts of highmem, can we say goodbye to
> > kmap_high_get()? Only ARM uses it and only for
> > !cache_is_vipt_nonaliasing() systems.
>
> Good idea. I think we are almost there, just need to verify that
> there is actually no impact for existing users. I already knew
> that there is very little highmem usage on ARMv6 and earlier, but
> I tried to recheck all platforms that might be affected:

> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>   get kernel updates, and the only one I can think of with
>   DDR3 support, but seems to be limited to 256MB total memory.

Are they limited to DDR3?

IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
new variants of old SoCs, to accommodate the changing DDR landscape
and market.  So perhaps they also accept larger RAM sizes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
