Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50197222587
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956322; cv=none; b=LmnwWe98X+GoHlX+iHFQpHT5jGlQUtMN6tPmWibaoeR5AyT/L+5HkFSBJLjYqRSsJ8oXHxfK+cOWXc/wQTmVge9ipi3CngfsP+AjFPg8dv6q/wganJbIbu3WOUuV+wz7VNeGkLMYJuxh4v+WQ+L12JJ93+1Vw5sItLmLcI7B6rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956322; c=relaxed/simple;
	bh=h+naC3WP5Hca5p6GdNfPWAs3ASYye9OHxLz/qrFbh3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYJf01ftK4CHfNPIcs74emQ6asrST0oTFoPaRxs7mHnHopUL2puYst6L12nkuOOBCbxwHEC/FtwYoNpygnH+KPrwpz8gmtRDVTQG7Db6AExEPZz28BuWcDoFzw0bLeI2FTynlUb+WsVHJef78D4uz6sQp7YpnghKdHRat8ILM4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goT81xh6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goT81xh6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so631743a91.2
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 06:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762956321; x=1763561121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IgqMB/v3xeO5BgQjIq0XWQN2JeRWzsu5Px5Hi7zIAE=;
        b=goT81xh6Cigwajv2EhSGPoEd6Rt4jbWlQrCjvGHXGk/KV1lwE7x7wSACujeGn1KeGo
         aG1Ip3JlxdT5zSU8aZaCbBAW/gcQaaFVdzUp0ofsQZjL91Gd/G/lMRJvsJKJv6R08G9w
         ltvfi/ZT0B7Ogi+HiZrebUQEVTDa5R0w0Tds7UpdckhQI9+EXVx13NkHPMcM/dVe6CP3
         R2BibMcYZOHUuoglWiOyH9Yk0rxoFuiMuOtSyiLjVrzX6yVkVkZ/TNT2d+TG2MS3ka35
         UmNwS2cvn5EW4d9E2PkHudsuEiqf2kd5MRFsXDwFl54KClIyJoRUIlk/BKibPyOoz0ws
         79Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956321; x=1763561121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5IgqMB/v3xeO5BgQjIq0XWQN2JeRWzsu5Px5Hi7zIAE=;
        b=CyX1cXEBPaK5yakimblpK91Z39KNJ7vaH5xc5pnfvMqbw+TkIKCm2Jc7llXeSj2Ge/
         xwXq2shpdNaYVBMEt20h204uWL5wQkqToc6JBid4LO//+1VuttV4mwUpkBYW7e/64yOC
         GDKW3T1eha8pkSfIf4xTo5nLEla9NjbMvx4Xp2vA8IRK7bniKA4oBbjWlBClsjBjcKQ/
         LYo/M68lXVZFsPnb0yCpQm1gccFhFryht82egDIcCqAyOJDKV36EJQXFJQ5BvHJoUfSJ
         fkQhoOG1QFeD9z09H7nkn4k0yy3GMICaM+DDao00TnQYqhZMIMwMmiZkQcjX/p41BIyd
         DEJw==
X-Forwarded-Encrypted: i=1; AJvYcCWym5OnFCitEF+I9uWw/lL3TDRVjdYKrrOaBuonViFPrGtBaturEdcDszzqvW7hKiW6rJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcilUY+FB3vkIrSmgkcvC/XZ8yeb0dcNG3OaprSK/0HznDX7+0
	DYeiZUfxIgkpzooEkIIn8/4GgU19imYr18E3oO5dx8oSjM5c2d+EzzCFdh8YNkp9VP4PHPKNYbL
	IS4n+mUzAVv2tjdB38TdGZnE4taU4VuI=
X-Gm-Gg: ASbGncuqsiElIM9hrOcclp13DI02Q7Dk+5D6t24EeXA9KncBParyoY1ZmbTqwogayAX
	s9nWJMEP108RVPvAqY/suFBVuydl4r/Etp20KW37THnD+UDVtZAuCh3RAOSF+iSPUWeLu+0GWEb
	wdiVrPOpOV9t31eJ7y9m8VkdPKqQcnrNbn8OKFJjPwlYhC0PppL0qqRNgoXkDT0lVAsyrBFdcTR
	ANH8H0Or1VZ2SFPfm+PaQKwLCB+TJFlV9lXcW+GkB4ckD0jFgo9cHow/aIl
X-Google-Smtp-Source: AGHT+IGGE4/VL1DEyxNrJ9gXhy58i37XginUx1Z79nbxZV1zaeXJiHFTS6UKxC5C1DeQKZdokBPv7izFiH2R6Na0d44=
X-Received: by 2002:a17:90b:3f88:b0:33e:2934:6e11 with SMTP id
 98e67ed59e1d1-343dde1328emr4083273a91.11.1762956320459; Wed, 12 Nov 2025
 06:05:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
 <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
 <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
 <CAEnQRZBBJ4PGDOk7hBP_qsk7bBiec8pHb0DYKs2mhOAahNyKww@mail.gmail.com>
 <baafb460-fb65-4cd2-9911-89d828199d9b@kernel.org> <2e160fe1-bcb2-41cf-817e-ac2a36959b16@kernel.org>
 <CAEnQRZDg0yAjR-a-4J2ZKAjh3mm8NeQCA=o2kyNJtXMAFCMLAA@mail.gmail.com>
 <56530f64-6ddf-4d2a-a079-0578db260449@kernel.org> <CAEnQRZD=h5qOC445U3_+HPh7aCE8TohSpZmg9hgkRE7mg5HUpA@mail.gmail.com>
In-Reply-To: <CAEnQRZD=h5qOC445U3_+HPh7aCE8TohSpZmg9hgkRE7mg5HUpA@mail.gmail.com>
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
Date: Wed, 12 Nov 2025 09:04:26 -0500
X-Gm-Features: AWmQ_bkE3E5kBt-au_w0tdPJgXF5KUKjHFMKLDQ12VqLfiSClucWeakQI7DwekA
Message-ID: <CAOkaPuX7YeUJJj15dY0vD8mngg5MS5uBwU_UfrFRFjrghR7NDw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Fabio Estevam <festevam@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 7:33=E2=80=AFAM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> <snip>
>
> > > We (NXP) immensely  appreciate individual contributions from everyone=
.
> > >
> > > We need to be fair, the v1 of this patchset was taken from NXP
> > > downstream without
> > > respecting the Developer Certificate of Origin.
> >
> > No, it wasn't. Please read carefully DCO. The chain here was not
> > correct, but that's the only thing.
> >
>
> Indeed carefully reading the DCO Clause b) you are right.
>
> > >
> > > E.g there were commits pulled in from our internal tree without
> > > keeping the S-o-B tags.
> >
> > Read DCO, please. It is not mandatory to keep 3rd party SoB. It is
> > perfectly fine to skip it, if needed according to (b) of DCO certifying=
.
> >
>
> True. In my understanding though if one bases their work on others work
> they should at least keep the S-o-b tag as a common courtesy.
>
> Commit messages explicitly says that the work is based on NXP internal
> tree patches.
>
> At this point I leave to Rogerio's appreciation on which S-o-B flags
> to pull and how much
> of his work is based on NXP tree.
>
> Thanks a lot Rogerio and Krzysztof for helping move this forward.

Thanks Daniel, Krzysztof and Fabio for the review and discussion.
I understand and agree with Krzysztof's point, but if there are no problems=
,
I would like to keep all the names suggested by Daniel:

Author: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Co-developed-by: Joseph Guo <qijian.guo@nxp.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

Co-developed-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Steven Yang <steven.yang@nxp.com>

Co-developed-by: Lei Xu <lei.xu@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>

Co-developed-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
