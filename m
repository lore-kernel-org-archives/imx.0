Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893BD31D398
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 22:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757457079; cv=none; b=Vvkx1qs1y3SmM6oepXNjxzbmwKfUPUzWp/nN16TDQdyM3l5xkvdyDF1NBOEChkYshZsK6H3sV1Rt0DsPD//2Yk+I8Fm08ONKfI7+RE1vdeGKB/SRVtmNsEcreA5DMCVhs118kVwSX0MKRzHer3FYhYHTDk2YJLnIwIiDyxg4GPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757457079; c=relaxed/simple;
	bh=TC2JZtkw5BkMX3Igl25beU/iUsWSo7CWbRuDpStlv3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhYNAtlddxHU8T+qWQbN+nm9vrH7soXCPa7mshMGxk7WJEbgWHhG2m2evXBIDgArgzpC1etx8OQm1IVhDXxzVOIFl3Sk/XtgRT8Ikcs1Uaw4VHb5DxwRnl/RkZkjBS4ehK4NUqEFJNG5HYawh5qGVVVzseAz5ppO7bnxpBXPbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OESgcnjq; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OESgcnjq"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b0415e03e25so820684566b.0
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757457076; x=1758061876; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=OESgcnjqmhAU3tIxtN4DnlBS69GndcdUwiU8IK6j+aSzj0z/LhO9LNFfziunZOecIp
         n2wOq94XvQYEZqmM7WUauCgOTXLGSSHvTQ5Bd3dDf5/tAK9hPZqXRaolBviz7ahp1lB7
         UjTaFT30Nk8NctIeGP50pifEy0mOdyGYdZeKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757457076; x=1758061876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=FiHFlhLn+tQWIRcHjB0Fy7gBViI82bM7sDYC/Ux6KGZIZXF3wissQ3WnsTcu9dshVG
         Rp5qI73BW9x8fG7cPIBJPneVKliXwjuDhdT6LPfhrc0+pN2rcWLpJq7HC3pQdEHgNVyf
         YgdkQ5pH2hH83kYmhWHQt91Y58z5hjiejiRQf08ZvGVe3TMIzVc9//m0cx+zDbD8gW0O
         ZypGvNSIr9zoG00ebVz/H7LzovUOn6kUc3eEYHV2gh8qCJlBk7hSyWy5Tw99Rko+eS9+
         vxqgJq2q8mGKCGE0s0kYSH2oe79knnyhfIER35gWJjTqx8Sl5Y3Dg/CfT6L3CZA/dnD4
         QPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG6y5WObEya1wjkyFgqwrotrMBr9u0MTJ+DymNP18AqDyyIfJQuZm1Yom/hCfHU1he4FY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxb14Ny/zOb05DlHe/CBq1LKhGLGfG1+HQ/gnABLHEFYlQnEen
	K8IbANnqTpvN65B1awNuX6Hl+wvxhNqlN+cH0zZt4FoUfMKORxaa1SqnWmvm0X48ALL0korRdMa
	ioYIQTx+FTQ==
X-Gm-Gg: ASbGnctzmFVueqQNR4c4Lx9VCODOBsn5CG2jrD/SRUrzReuXIAd8DFquSqECES5mXnl
	00yz7W9nVKrMlRjKPxS9aM4Zc+hZX/W/PGfePn95cJB5HnnLrgQ9iQWQ2MCBKBswt+TzygyEVSg
	c1u8IbcHK1jmdGneM8Bab7Afn1uRQ0TddGzMNqCT6xzhbGunm8zRBJa9c8kj5yLDzgEXpbTU72j
	KBkAAvO7+wiweebOWds2LOU83iCjplKJv2SCoTdTjHbOZJTM9N5rhEwE+8sznYxKhdJfBGE4lVL
	hASZZEf9r9LCuoME04sXwoxwLLqs2xHbK9y4e7qriy37Y282ceChe9XCSPZu6j5gngbDXQUTiFE
	VK30Qowqm6l9MarUSx7RRH8LnzXgID4rJ4zsKXAnf5feNIbzss0s5EuFtO6h2uG1RPAXiG73u+l
	AWuNK8w3U=
X-Google-Smtp-Source: AGHT+IHmgHWc4fG09/I7fOSutWpIGRWnZ001fAr9A3Z/bg3gd8xyxEGYrwW1j2rbclCz0Njw+0/9sg==
X-Received: by 2002:a17:907:7f0e:b0:ae0:cadc:e745 with SMTP id a640c23a62f3a-b04b1655e36mr1439125866b.40.1757457075578;
        Tue, 09 Sep 2025 15:31:15 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830acd07sm61516166b.32.2025.09.09.15.31.15
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 15:31:15 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45de6490e74so25913655e9.2
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 15:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhQ8PpatFdPQcz7LjFCwJbbAgTzDXz4VpOLjZRsbwZ8KYCWf30sdQ/qlDcMatIDjoOepQ=@lists.linux.dev
X-Received: by 2002:a05:6402:4412:b0:61e:a13a:27b8 with SMTP id
 4fb4d7f45d1cf-623729cb58cmr11071027a12.1.1757456686093; Tue, 09 Sep 2025
 15:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
In-Reply-To: <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 15:24:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
X-Gm-Features: Ac12FXyoXbbHUJtrfKhAFeDlVJsB9IiUaRxuYQBQJQyqpHDKK1GQ8JtkX5zx-HA
Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
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

On Tue, 9 Sept 2025 at 14:39, H. Peter Anvin <hpa@zytor.com> wrote:
>
> 1 GB systems used highmem too, sadly. And 1 GB was the norm for a big chuck of the late 32-bit era.

Well, while on x86 1GB systems did use highmem, they'd typically not
use very much of it.

IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
exact), with something like 120MB highmem.

So they'd either lose a bit of memory, or they'd use the 2G:2G split.

Or - and I think this is the main point - they'd stay on old kernels
like the ancient museum pieces they are.

I'm not convinced it makes sense to have a modern kernel on a museum piece.

         Linus
