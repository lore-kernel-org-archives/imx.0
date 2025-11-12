Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343FA2FD7D0
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939827; cv=none; b=ggasXP3sSzn8lUzAMl/ewMrxT9REWojdn8nefp5mI1ws5kiA5OnEYJWMRdVwREKvZiSU1C27ZtMgVSXpHlc2I0kgb0a16brCG96aDY74JNOZyjX5RhDumkjv/p1Exf4OQsftQ4V5BOZrKDV4h6qDMXza/21k50Z4NDxIxXXtxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939827; c=relaxed/simple;
	bh=Vfncq6F+5VOllwyvE5UQeZbhoDYhwTMEClEBA9ZFmkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f02KG/MK9R6H1Ez3Xn3fNSMnKI9HyY4WbYvOR+CwahgEF9XsCdV5PnqVsl5J/zgTF6U+//jO8iqYsDngT5UNj2rs3Scrc+OxsGVTpQyORwY1f9MI6ZFofIzC1Q6dtLvhvKQi8zyXzQ/dHVdMW1YIzmGFuDYYi0qgz0fiA91TH00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILdCMwnd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILdCMwnd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b403bb7843eso133466766b.3
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762939823; x=1763544623; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqCuPp9H8HI1+6gmMgoIdl2q4ASSXdaZj3EL+jeW6CU=;
        b=ILdCMwndOaS7io4N/NngIIgQAw0oHzU2GPiC+7CykhRklux0ccOaFR0pkYuVhUH/k8
         FOy4PT2NLHIOufdjs57uR7ADkHLbMsb9PrmGHzGcHcL73CKWsyvfYCtlPx8QzvCy9JrK
         06U5mi4yEF4HHt6/CjjB4kZ04FvXuC4TsEIq0qRZjoqo0Dzg2H265spwWCIxdGSDaUbz
         q2z8f/NFCzuNgK7YTH1HS9v6IZCowKz7wjglhLkXW0rXwBWzjNlI3zO9NFw64DM6ykk6
         GMuqwCaUZEbeEUSJmPDXyGU3uVnjMRO1Df12OA0DcESjQT6BqsARh5B0OsKJyzjy/1/7
         fZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939823; x=1763544623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqCuPp9H8HI1+6gmMgoIdl2q4ASSXdaZj3EL+jeW6CU=;
        b=pmIudksNLxlNyzKxQcQd0ChlfUdy8VoSYPKyRg/D0tukVLcclMAt1B5YLf0/6DZo8t
         DEo7MNDypsfn4ok3h0umz7TkNxEDnsxl8bAa7IU8f/AjGG2iXwUNfX714vOkC2v6IUOi
         dLGsA6hb2ty7SUqScxbqIkj7eTHffNww5VLFFyynwI8NDfhtKr543hTYdxYDuYX+2rtS
         4xzabDOKsO223+5OIutmQkXxux+hVU5moYqwKJP9nID6HDFxBTWdbZ+SAoOmZyhbOgAN
         zjV6ZyJ8Uqn23NypzWSnpjFOkWD05QZRpEcKlprOOV719pXXfu4eUNbKVjwQMZN8Bv93
         ACCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD0h2uf4kjoYF4hHkInNWN+ndY5ybqT1pE518O9cJLnmHqYnKVAIE3kHqP3z5RSTKiKvg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn/76pwD9MUgQ2Wv+3YhhCsL28nMIOdxiVdN0yl4sZp7oWMm0H
	qsL/cee5Wyu+ZEXt1wGnj4iJfJFruhOljiYJ/tHETBBVYbeAxYpHV5cJK8nvXfkUG0nRhgMKPQF
	wHa5A9IiT0wVvSOjeDQOPyaiUx9ge3tQ=
X-Gm-Gg: ASbGnctfKucQD+zzBdERnKIj5zPtALksIC6C/QSDH2muDatqD8PPq6FqFYg1hhB9o8P
	RWsIPEyuhdNGiOPrnIJxH+CL4nGYMx9zV4pwZkK2xhXW0FbeUkhKD2MRBagIrLrtGGdpAtTfI9L
	83X9Oag91pwT1Nj94ZnonTvA5ynx1LMS6MYTeiFbiGT3QG8+jZgbkEK5038BqKWVQXsvUjMaCci
	1ojfK/QFxL25p4NUIsmV08XJ2AHAzEmu94bGGlX65m8MVOSHpeLbwM75A==
X-Google-Smtp-Source: AGHT+IGyBC+BBxL1KaIi5mi0ySnjGyT9eGbf3VfoXUYHbfCWS/PwYWYo/VnJObXv4/YPosnSNepi2Bx4++0gAs1GJ6k=
X-Received: by 2002:a17:907:3f0b:b0:b73:2df0:9fa9 with SMTP id
 a640c23a62f3a-b7331aec6fcmr200176166b.59.1762939823249; Wed, 12 Nov 2025
 01:30:23 -0800 (PST)
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
In-Reply-To: <2e160fe1-bcb2-41cf-817e-ac2a36959b16@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 11:32:44 +0200
X-Gm-Features: AWmQ_bk_gSFa8QTHeI1JrrzB0W9QZ2CPKTfJSvtyKPLDEFBLVYzLq3Nt1FpD5Yg
Message-ID: <CAEnQRZDg0yAjR-a-4J2ZKAjh3mm8NeQCA=o2kyNJtXMAFCMLAA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
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

On Wed, Nov 12, 2025 at 11:14=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/11/2025 10:08, Krzysztof Kozlowski wrote:
> > On 12/11/2025 09:15, Daniel Baluta wrote:
> >> On Tue, Nov 11, 2025 at 2:49=E2=80=AFPM Daniel Baluta <daniel.baluta@g=
mail.com> wrote:
> >>>
> >>> On Tue, Nov 11, 2025 at 1:50=E2=80=AFPM Fabio Estevam <festevam@gmail=
.com> wrote:
> >>>>
> >>>> Hi Daniel,
> >>>>
> >>>> On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta=
@gmail.com> wrote:
> >>>>
> >>>>> In addition to that, Rogerio please read:
> >>>>>
> >>>>> https://docs.kernel.org/process/submitting-patches.html
> >>>>>
> >>>>> At this moment I think you should keep the original author of the
> >>>>> patch.
> >>>>
> >>>> Right, but NXP makes a total mess with authorship.
> >>>
> >>> I cannot disagree with you on this, let me clarify it internally with
> >>> NXP colleagues
> >>> and sort everything out.
> >>
> >> Hi Fabio & Rogerio,
> >>
> >> Checked internally and to track the correct authorship and development=
 work
> >> here is how NXP would prefer to get credit.
> >
> > Sorry, but individual contributors do not need to give any credits to
> > NXP. If NXP wanted to sent the patches to have credit, they would do it=
.
> >
> > Did sending happened?
> >
> > If not, then any contributor is rightful to take the patches from
> > downstream and send them only, ONLY with their authorship. That's what
> > DCO allows and that's what established practice as well.
> >
> > NXP had a chance to upstream. When they decided not to, they forfeit an=
y
> > rights to claim they want any authorship.
> >
> >
> >>
> >> #Use git commit --amend --author=3D"Xiaofeng Wei <xiaofeng.wei@nxp.com=
>"
> >
> > NAK, there is no single patch like that from above author:
> >
> > https://lore.kernel.org/all/?q=3Df%3Axiaofeng.wei%40nxp.com
> >
> > Remember, downstream code does not matter. Does not exist.
> >
> >
>
>
> ... and because last two months there were two or three cases where
> vendor companies bullied individual contributors, I will be quite strict
> about that. Vendor company does not receive any authorship on patches
> sent by independent contributors which the vendor NEVER submitted,
> unless author really wants that. But I will treat any such insisting on
> authorship by vendor like NXP as bullying and working AGAINST the communi=
ty.

I'm sorry that people use "bully" in this context. We are just trying
to help with
the limited time we have and create a friendly environment around NXP
upstream support.

We (NXP) immensely  appreciate individual contributions from everyone.

We need to be fair, the v1 of this patchset was taken from NXP
downstream without
respecting the Developer Certificate of Origin.

E.g there were commits pulled in from our internal tree without
keeping the S-o-B tags.
As I said keeping the original author is a sign of respecting the
initial work of NXP developers
and a recommendation from NXP.

What is your suggestion on moving on with this? Would keeping the
authorship from Rogerio
and adding S-o-B and C-d-b tags as above work for everyone?


Daniel.
