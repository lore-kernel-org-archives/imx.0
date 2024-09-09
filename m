Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D044375
	for <imx@lists.linux.dev>; Mon,  9 Sep 2024 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896328; cv=none; b=H8w12tuUVQaloZ6rPvyBtDfQHREZQ8DWN2NPrQcGTbxM4pa/hWOvSgpKkm1IzCURURUlCaHOA/41bXtVgRVIJANZ4dMPaL+rdlMcDVmZukCdIkq6y+HrG274xHioJU07xoxiTl5Ma+trpWRjSVBYzH+ocW5XTh9sGR2E8jElfag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896328; c=relaxed/simple;
	bh=ejGTtFr9UtD97Av6eKsXqC9yb/mVqCRD0gMrMg6wFBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDpPzRRUJZz9plus+cGMXQumXErEEQkfTmKPDD01YFNhLBkBp50i3H/RVE4FONrY34FmBX7y+1Q1uGIPwcctm2Xt3WKNDXYBQJaryXH27XC36a7yZ8+yjCGZ0lb/7WyZ/IcZjZ2rtkPsSZr1tjdDpfJ8Mu/Q9rvn4DvTqg+DAAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db4b602e38so28225547b3.1
        for <imx@lists.linux.dev>; Mon, 09 Sep 2024 08:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896324; x=1726501124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFPvrWEZnfEN8TWP1cJnvMCekclj4UD9Cp6NnLKH86A=;
        b=o5P+I6c2peVCcpnAAw3PZZ6mklGFDLvVwNPwkOxINagAh633oPHwx8C6LtzfDs7ys8
         3hJZV/5HfSbhEWDLR7wpYO+DzPWJqurcDpDPeKt+oWE7n5mRYQ8Bcg9D9PDbdoEwMUCt
         62yXp285ONl5a8X1OufB0iMdNdQYAqdZ6aSUHYMpZHjhJRZPIgrClMTkJvP49jby0Vwx
         2DV1BWNTDb2wC1oCWKOQ7okGiI2nN2uCGhT1lX4coRzPDNk3IdZCzLidxFzRFC9RrxYz
         4TwzZAgT6aFpALdB5fAOnRNJuZW3T2i2VV6OUXXKun+ww0KCY2UMJQL+RM0IUJIKHB1/
         Q0MA==
X-Forwarded-Encrypted: i=1; AJvYcCVZzq2IS8ieh8aTjTQ1dRi9GkjjbZ7gBYkKaPAb0TZghCeOnuc8E2Xp7LJQJlJBxpoUAZE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdfIhRQBDAyBkFvJgb16X/VhiFvdx1aR2yAyRC2bNBR0wOHy9Q
	f6cvNEnjDcDbLsM6/bMYoJKeKCjRO6IkX/YGbOvVpRrsveb7nwKTr3PxpFKi
X-Google-Smtp-Source: AGHT+IEEvC+pOW1AbuLNhWqrzaD3lLe4HBle0vXqtsEBvE+m2r7FJPbn9NlGQ8GVZBv9Ox8H1h4odw==
X-Received: by 2002:a05:690c:30c:b0:6ad:219a:b687 with SMTP id 00721157ae682-6db45272cc2mr150808397b3.39.1725896324526;
        Mon, 09 Sep 2024 08:38:44 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db5c6bbfe3sm9339377b3.103.2024.09.09.08.38.43
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 08:38:44 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6db4b602e38so28224987b3.1
        for <imx@lists.linux.dev>; Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRggQBJfJO2Ke0GwMkq/TebadcNcVofZ9U2i9RCEdNzilmH20z71xF+Jhl1W+ZoKCeGO0=@lists.linux.dev
X-Received: by 2002:a05:690c:a99:b0:6d7:4dea:5f16 with SMTP id
 00721157ae682-6db45133363mr150456127b3.26.1725896323567; Mon, 09 Sep 2024
 08:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 17:38:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
Subject: Re: [PATCH] clk: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 4:40=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all clk drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

>  drivers/clk/renesas/rcar-usb2-clock-sel.c       | 2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
