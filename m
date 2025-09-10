Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D8259CB6
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497811; cv=none; b=D3edmM0buy6jTP0P3Mvk+EmnImiL9kzP0wrgZM1BWvO2MtHm9cBtREanpsMwsgkhNyt6KFvcGSDymbJT3lnaQM/H204VPvpyNzSgfADfVknTBa160ZuF/AYyw88kRfYn+4pxy/7Fsu0SiVkU1blZIm0PYpr9snSFtvUB9zVCD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497811; c=relaxed/simple;
	bh=Arofhyx1TEu7R6Dw3jah6c4cRa9rC5Al23ys0fj9/3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guY3CXlm1gi4zuAW0WcjhVy/DNw1GWapEKkLTRGo7vBUpBxO68pGEvZu4ARrdT376AeXXzjwtFsD8U7NW39Hld19OE2ZZeBY3dYavMkDToMc/nPE98ZHR7Qe7VPwAtDTKaaPBKwkPxs7HzkKneqtSRBVcyzt4pEGjyJyTmtJ6Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzMuNGlD; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzMuNGlD"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-33ca74c62acso30135691fa.1
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497808; x=1758102608; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=EzMuNGlDp/P+Y5Kd6h3C9R+o+zvr0qM1zzslWfzCFBQkLeb7AKZzXaspwzGMCTkXm+
         vckx9UeI3VGvscHyoWgepbsaPFT4uGbAv9gpPLiejakUZk4+LnZ2T4OAcinmzpK9IGvq
         22y8/jCGCa9PZtBELz/FbqFpkM7tFqTFbb5APWAqyf5bcEbKd/uh0zSEE+rpQyZoqEHm
         WbHAtWmmC+Yu+hH/kovH+oKYTK//LevDRhfarQBwCYk2X6A5QPOaglTleBgmo70lAXpb
         Q8cH8GuLJbGQfRKzQeUV0G8s4s34KWVdOSr3IDIkKqB0ZReWZpNVDnqs9evTu1Mqh3JW
         KLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497808; x=1758102608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=bpmMZP62ODfs4FrZHohDoUDXYyK+8Neh92ozsZrBoSbPFMlrxgqCce7lDUHwCjYJQF
         Cuor8t+dcMFTMv1IGreWGAXWYk4+ACxs+VHuG2ZjbxY/uwA6EhVA+8rS/rdATJNv5gVj
         Inu+EkI8zyjsR1P8eUOCcngStva4qsZq4iRM2A9dNoX99W4F2Lw9cLzz6UXK12XzKMKz
         Va5ySn/wdueUq3EMgGylKFZjegBjOZVVV/5zTnKuRlDRcXmuVpmgg1G+xsWQyod0r33w
         MXgV237O3n2ycWoUMvNYizs9LoDx62TDr8i25A2u9WtUtN3zKxAy1F2AhwjaLOZPuSmo
         7VNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw9cfrecfEUA7griFWYeeQzV3iGgVNvOH9wVSN2NL8R0BQIEc5Mr4oDk8Mu4+3R8LObw0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJo3Q9zQvbixQKU6qUBKoY7MrX9YyP3s/n21oW6uruWgmktUGD
	Iof5d2f5M43wbk3SgvrXZOeeuRoeByinchZfsS6nNbJpi4gSUEgBEFJIqyJwRH9vfAuFMFNILjI
	l3YM29iGPvJXKSOoKdmwqr1Gb+myFeVkmq5tPmo39Aw==
X-Gm-Gg: ASbGncsNuF1I81oYY7M0nsV0lssrueBPocaiGAqyHPuZxGt43ohapKMuTsFehKeYhoj
	nMdhIftD0N1H2q8+Ly+J+1iMOMaGKhYYNIu9TGm+e+xK21LK77fa9gOm1mDZtG5snA2claVjiEX
	cg6RFZfPzcL/wvsfwFYx/8rpcjnxjHvWwk7B6iyUcH1uhtHSf+6ZYfzXDHmS8r9D1BEwHCTl92v
	Q4FI68=
X-Google-Smtp-Source: AGHT+IGq2x91wz7j8DANH/yJwpeO4d/hIy0ABq1WES66C1SeY2aK74/VWAJ5lsiz89NvTXBUTDFt595MC0reZwFBRxA=
X-Received: by 2002:a2e:a009:0:20b0:336:5e1f:b1ec with SMTP id
 38308e7fff4ca-33b536f14b1mr41029971fa.31.1757497807337; Wed, 10 Sep 2025
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <aMDYdp3H-yOHU1Pm@casper.infradead.org>
In-Reply-To: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 11:49:55 +0200
X-Gm-Features: Ac12FXxu2Penmvb-ANhZIzZlxEacPcTMGZ42OzvKFfqr5PHU2ajbCjOLxBc-XSU
Message-ID: <CACRpkdZZZNV5BdNhyXEK__=EJLjDtAEsc2Kv4Tv53+=Mv-8R=w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Matthew Wilcox <willy@infradead.org>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:46=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:

> I don't mind that the feature remains ... unless it causes us trouble.
> Which it currently does.  Perhaps we could start by removing HIGHPTE?
> There was a certain amount of complexity introduced into the page fault
> path when support for that was introduced.  x86 removed support for it,
> so it's just ARM left before we can remove the complexity again.

I sent an RFC patch so we can see what Russell has to say about this,
it is currently only enabled by default on the VT8500 machine.

Yours,
Linus Walleij
