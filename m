Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD6E2E8E0E
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767114; cv=none; b=r9ilEMT5nT3vS6NwtxUlPaKwUChCScphM+Sx4CPjF89LcxDPOa7/+7TVJ85e1Z8/qJ50wFlsMXajeBfVIVYJvaa12wtFiD60r2TE8milhlD8ps4LTj19Jra65ngLbroFT8vHupUb/PmzYqp4bf2Zf+PFO3tN4xbddeZiLUOBqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767114; c=relaxed/simple;
	bh=/fJzjpPCho25zV5kgp+Mt+JXbM7T0RiVyjwGWi7iCBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoFigdI6jWTFumTuMEUMTzTxLJmf+LI6Ew0wHaGXHghrTDYcYcE3FZn+eLt/m+9R7aB1482xu8XNqi/WClv4nLUCFVsOsveMeiN5i3wpyYHYqeCy9YO7DjgeZ4+UjZ0C7d7EcJTeYrWtaaMhETJnopwg7kKqymAODiFYutcRlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5597a426807so1871437e0c.2
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 01:31:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767111; x=1763371911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRtPdzI1Yw78zykFlB0XCziKqeVOXzigJtW+jsiVzcI=;
        b=AJZpquKlfA1VDm1xP7hv7LXi1gPTyoDQyyAfxIk9+btbp/Cs5QsIZ4a2BzdiCO41r2
         Ld0znzwAAQbQOGaARBnsLzU5p1/6MzqC7vPpPRNBvO8AyCeO3VQ8SKyZHONt1syb8SUU
         qBLjYDyF0/NQkNubwZCncqf18RSxa1ZRI/4xRx+c9+hAziYxHM14qYStwQmNJlQJsNiW
         YaymonY6k1Ud/5N5k8m497OBCRBvK2Z9LvpdCb4u7IGEqBpuAh2rQr9U4Bt4fMLh4k/u
         DX4KSz3zFBYKBGYSBBX6ZwajWbRB24mCE2YVdCPIs3p2ndv13e1uJJceI/9WnfKZc4S3
         /JIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCD353LOMH//NNxhViNg2QgxbaBH+sIM6Y9ER/AGogzW+4b0nL1wN3drHbVQdjzASaepI=@lists.linux.dev
X-Gm-Message-State: AOJu0YweLcCFw4l2uZEWl1/kwQKS5L/Q3kBpobEvEOiUCyTtfyzilTuR
	3GotuAfzOkgECzt8HGZvgHqTT8VVaTTZoujTjkJ6cYChEeC67aA3U9/uVcE4HgCu
X-Gm-Gg: ASbGncvupn554OT65OuijFf+ubQFbPvpDgiydI/SgvyKGWwh1WYW84Z1ThhBVmRqMXU
	60yjzRDH9j3YYza5K/0S9nyGvchz6oczIHuZDkXAWnCp6brmHGqkTOpuqNRosd3FlOBqX3+xLbJ
	txdpq6U9oXTC05HUKFwu0Tw5SAKwP+36p2NTPRA4QWhbG/OckVG5uur1FIOKj/GoBWo4D804xrt
	ybNeuiTI0kMgXzw/sUsFceNkZefC8X4ZRTNptylh56zFd9ZwUAf1Xkx+my8ErnDY9fUfQla2mvU
	KofSe8kdX7sQyeHxBHjz3kyYK5M/7tJ7EGSI5UTAlYMzDUUx/ZlGXkPqUC/SfunF696XZzgEC9I
	hFLbP2gcpgtM4iS0iqWYh2UPo6r3eX2+Gev2ikP+psOsTxRVmBKMZ9D9WL3i4eKzq37Yt/+BFH4
	J3WrXDzc6wREAbSrVPEJ/sgKM2jrqoDvE9h6dMvWjV6NahcJCkS0BO
X-Google-Smtp-Source: AGHT+IFH63clIl+80CiN41tLXq96usQtskCITemzfQVXQ+cWeBk+Phdnb1M6XghqLgPLleCzSDNWiA==
X-Received: by 2002:a05:6102:8356:20b0:5dd:c533:1655 with SMTP id ada2fe7eead31-5ddc5331670mr1969960137.20.1762767110533;
        Mon, 10 Nov 2025 01:31:50 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda200bbb3sm5468526137.11.2025.11.10.01.31.50
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:31:50 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd2b7a7e3so2336509137.0
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 01:31:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXF6QgfhMukxA1jT+GXYep18MMj6M5Kza3OwqvDV7yfEekEQ/l8eU+wCUPX83hIaO6AKsw=@lists.linux.dev
X-Received: by 2002:a05:6102:c04:b0:520:dbc0:6ac4 with SMTP id
 ada2fe7eead31-5ddc46497a0mr2779273137.2.1762767109934; Mon, 10 Nov 2025
 01:31:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
 <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
 <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com> <12779401.O9o76ZdvQC@jeanmichel-ms7b89>
In-Reply-To: <12779401.O9o76ZdvQC@jeanmichel-ms7b89>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:31:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW26uKBUnYB5c3XAzKPKFVGNoOOwra_u_NOjPCV20Y-AA@mail.gmail.com>
X-Gm-Features: AWmQ_blSVM0mC21k2j7-_pQqo1T8ZhoFgD5EPrlyILfYI73Lumvke_itdhGi4eY
Message-ID: <CAMuHMdW26uKBUnYB5c3XAzKPKFVGNoOOwra_u_NOjPCV20Y-AA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Mon, 10 Nov 2025 at 09:34, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Le lundi 10 novembre 2025, 09:15:11 heure normale d=E2=80=99Europe centra=
le Geert
> Uytterhoeven a =C3=A9crit :
> > On Fri, 7 Nov 2025 at 11:29, Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> > > Add platform device support for the MCF54418 RNGB hardware with clock
> > > enabled at platform initialization.
> > >
> > > The imx-rngc driver now uses devm_clk_get_optional() to support both
> > > Coldfire (always-on clock) and i.MX platforms (managed clock).
> > >
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/char/hw_random/Kconfig
> > > +++ b/drivers/char/hw_random/Kconfig
> > > @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
> > >
> > >  config HW_RANDOM_IMX_RNGC
> > >
> > >         tristate "Freescale i.MX RNGC Random Number Generator"
> > >         depends on HAS_IOMEM
> > >
> > > -       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6=
UL ||
> > > COMPILE_TEST +       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SL=
L ||
> > > SOC_IMX6UL || M5441x || COMPILE_TEST
> > Is the same RNG present in other Coldfire SoCs?
>
> According to the RM, it is only present in MCF54416 and MCF54418.

I guess that is sufficient to make it depend on COLDFIRE?

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
