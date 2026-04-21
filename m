Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58654388E70
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 10:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767165; cv=pass; b=krUECNLEFNpgEph7+9jgbQzxwXqpyDMRInZ87jYLK5Dyac07uM4ghToczU7OWue+8mSqrC/1HQm3vdyE3u4H5+7HcAQkUy90TyGY1uRnxqU4TevjH5w233Z5sNKqybiXd1bfjRngk6xMmmoyCLQ7ZEwX7ho1b7hXLgMKPZEqT2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767165; c=relaxed/simple;
	bh=fzRXlMPHf81MpBz9M+qEmJle+xL6godSrHPGAUjKBvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3ZqB6Wb71PKRpC5VhFi5G1YBlxw8neYTiWaty66hf2MtHb1wIIDHyhGRalaFcipF1AsVx67h3aMMr9PwqP0K8p82oSwU7v+zSct85Y7h59zzKQwPSLQR8OK/NgGE/Fz/W+x+nVQztsoo8xYFy9/U05PO4qYC9fzEOrnUiqDfPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luI/moY9; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luI/moY9"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c79662bbd2eso2729279a12.3
        for <imx@lists.linux.dev>; Tue, 21 Apr 2026 03:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776767164; cv=none;
        d=google.com; s=arc-20240605;
        b=Zt8SiF+6pEfWcI4wJ0rZrvLs2X+96kiypWDQalMI6P2aPqLsgRmyV4FZA+hUV+fiMu
         yKoetp7Qn8PHGYNIEbbEC02shw1oJV/++FTk1LJmBVAg+0eKpogVDfXyp7XNbfyMTeAe
         wwBUUuzvQ9bY1/fKgenTaTTJIMbCTpNvtd52socpf/AVkaIMr3gjudlMzIgJhl3PUF1O
         hJ06BJJXBrhQLQ0tDZ/Kvve/38xGbpg9DsZ4/gKek9pB0/7vGd/9te33vcoNvgYZFneI
         LCk9TjJUd/uHetDtXvWjYCVsmLDpqCHjcP4pey/T788aVmCxYXzk8F+x1W2oVI6blk71
         kU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1FvfcveV+14dOucFk7RAnQhXMQK/CgP4W5FAbyii2JE=;
        fh=DyQw7BG2vTvtUMl+oQD4xbSRr7xynLY3XMx7ThACeKA=;
        b=KS8LuzBMG1rfSYXUmmZU2YV0ZmcvSHCAlNuSAexyYM/PoqaNe+chFnDMbg9HKtMsAF
         HkEdoyyBEi2KFhXQelhWo90cOgZtUl8ZkQMTtPayC2giVTCmTG03JXGNjPWhwrb0c+gS
         KL6kuXE/MrBAkpUzi1viEfyzL2vb36LokVHslwlLz7tLndYYLuJdKg8uy+XpWHXw0/f2
         Et18bPldVSVYgRGjwVn4AjBTdbOmBoTIiGGsqCPPfNoTC+BFmkBKqEmsnJnwww2V3652
         vgvUyiPfz4H1b0lbW/LilwGZFRWEQqHTwAjTRK7b31amyu1S4Zvli5GaXskXME6zhj3s
         VHGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776767164; x=1777371964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FvfcveV+14dOucFk7RAnQhXMQK/CgP4W5FAbyii2JE=;
        b=luI/moY9ypkUpMMJcRZ0ncSenfrGE88W9M0BMcxQxVMyUuGbPgm8LGkxL9ddbCdX3L
         wOzRyt5bIFxLbmSpaT97b8A952DqIWVZ31yRlqPrFadpS91POU5uVYpUjbLyahS43EZO
         bK2REffo/5HwiKTWR8zcpWVR6+RylVu9FrcC5hOHb+IxUkf/wqND+5EGbquZuHQYf/MM
         z8MpwNZCfiz0y/rITA7tcpTpvvo7/mLRiGXR3me6A5wUAZ5Fa8+3cT0VlR8tYYBroV2D
         DdRWgBKT5MrIVUBkjHyBxuSKdkCepInms+DUSyGFe1/2Igw1hK1nspAQGUiaBv6qGU49
         QPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767164; x=1777371964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1FvfcveV+14dOucFk7RAnQhXMQK/CgP4W5FAbyii2JE=;
        b=XItd89EaTwoXSZUYBaIz3v0FPrQLu88zyTjD7wEXwG36qsbtpO9lywEAqi4n0RJ0Dm
         17A/TBNmsqRK7pk5fzER2PCepR7wpMc0DL4/rna+AHyj7PkB8eluy3rqlDqsD9z7EXih
         bxHuyVR/JKKG3qsV33nVoyeO8RPOnNzkCUijLLy8KONajpFRWckKHB9WKc4ENg0cjHUg
         T9OJ+umnbMorPKsDr4379u0TCIOJXb/NMJzvUyjYm187F9DWXIAkfH4ZnnZ7hkhOcOZT
         wl+jRuFFRtkSN/RxIY7d0xkfAyuEnETCDl0QWKa5ED90Ec6Jij/oGOA1lA9AGFD9HVTf
         EXTg==
X-Forwarded-Encrypted: i=1; AFNElJ9dl1LB0wKcqMKFoxCOil3JXzvrlCVVjeUCtZX7gEgldxFEoQSmxOBnt95Jg/8eiYGoOHo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYCFH/hiz9/c0G80RqUhUVwu9b7gj6SKw58DaeSti2iVJSf4K5
	FfWPpFADvzZTyKA84vhFSeDVjQT04UQh6SQB6s0wIieSn9rtNIp9XXjgaYXjUPA5I/DgNzuiBmG
	pN7TKaEQrx4MSJhwQYMcKCVjOVIa05mk=
X-Gm-Gg: AeBDieuB1ZVx6MOiFu+577OPOQyTKtf61Ku+DzNSsy535+VWuT4fhsmpUt5w356p5dS
	Td/ylH0WGr2pryoLV7tCtYo0BdhMPkfIqt5UlFEUM1Zt/NqAuDSOW3xmhfRfskTyubdwhJj4vsf
	6UHkWkQwq1v5KkjKIcHFabZ11tE+6rCDGiyulTd9gcQP80a+h3u/D7SwyajLqTjsMqfabugvABu
	ddYVrLUApNO8m3lvMzS8Sdnd6OiMypK/4FSL5RniBYRRoc0Bjtw4ZOipG/lGYMxh62aTn3MwgBC
	PhIVE6zJplU1MyWwiA==
X-Received: by 2002:a05:6a20:12c4:b0:398:8026:4811 with SMTP id
 adf61e73a8af0-3a08d8a8814mr21400230637.35.1776767163577; Tue, 21 Apr 2026
 03:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420100854.2095549-1-shengjiu.wang@nxp.com>
 <lkwfzz4lia37wv56g6ymzpossm42epz2oylhl7vgdpp7odt23h@vszl4uu2wg65>
 <CAA+D8ANwT0GKusZtvo6h8mzVf=xXSEkHXsb6nwHGZ2YQzPm5ZQ@mail.gmail.com> <4xbeeozhngkkc66r3ho523vr45yksbyftdckfzwk72zfvwzgv2@7lodth3abysr>
In-Reply-To: <4xbeeozhngkkc66r3ho523vr45yksbyftdckfzwk72zfvwzgv2@7lodth3abysr>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Apr 2026 18:25:51 +0800
X-Gm-Features: AQROBzDhXWgla_oCt6bVuib2j48W1hMySGsnPl8g4tOPNfdTT8qGzf6cm0imj8I
Message-ID: <CAA+D8ANwgkzKA2aDja=RTLeJX1s7-SfHS8FVC_cjKcRvbREFcA@mail.gmail.com>
Subject: Re: [PATCH V3] dmaengine: imx-sdma: Fix SPBA bus detection on
 multi-SPBA platforms
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, Frank.Li@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dmaengine@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:44=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 26-04-21, Shengjiu Wang wrote:
> > On Tue, Apr 21, 2026 at 4:57=E2=80=AFPM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > On 26-04-20, Shengjiu Wang wrote:
> > > > i.MX8M platforms have multiple SPBA buses under different AIPS buse=
s.
> > > > The current code searches the entire device tree and returns the fi=
rst
> > > > SPBA bus found, which may not be under the same AIPS bus as the SDM=
A
> > > > controller.
> > > >
> > > > This breaks SDMA P2P transfers because the SDMA script needs to kno=
w
> > > > if peripherals are on SPBA or AIPS to configure watermark levels
> > > > correctly. Using the wrong SPBA bus causes DMA timeouts and transfe=
r
> > > > failures.
> > > >
> > > > Fix by searching for the SPBA bus under the SDMA's parent node (AIP=
S)
> > > > first, then falling back to a global search for backward compatibil=
ity.
> > > >
> > > > Example device tree showing the issue:
> > > >   aips1 {
> > > >     spba1 { sai@...; };      /* Correct SPBA for sdma1 */
> > > >     sdma1@...;
> > > >   };
> > > >   aips2 {
> > > >     spba2 { uart@...; };     /* Wrong SPBA - found first by old cod=
e */
> > > >   };
> > > >
> > > > Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device sup=
port")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > > changs in v3:
> > > > - add fallback to a global search for backward compatibility, which=
 is
> > > >   to address comments from sashiko.dev
> > > > - update commit subject and commit message
> > > > - add comments in code.
> > > > - add Cc stable tag
> > > > - Don't add Frank's RB on v2 as there are several other changes.
> > > >
> > > > changes in v2:
> > > > - add fixes tag
> > > > - use __free(device_node) for auto release.
> > > >
> > > >  drivers/dma/imx-sdma.c | 13 ++++++++++++-
> > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > > > index 3d527883776b..592705af2319 100644
> > > > --- a/drivers/dma/imx-sdma.c
> > > > +++ b/drivers/dma/imx-sdma.c
> > > > @@ -2364,7 +2364,18 @@ static int sdma_probe(struct platform_device=
 *pdev)
> > > >                       return dev_err_probe(&pdev->dev, ret,
> > > >                                            "failed to register cont=
roller\n");
> > > >
> > > > -             spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl=
,spba-bus");
> > > > +             /*
> > > > +              * On i.MX8M platforms with multiple SPBA buses, we n=
eed to find
> > > > +              * the SPBA bus that's under the same AIPS bus as thi=
s SDMA controller.
> > > > +              * First check the SDMA's parent (AIPS bus) for a chi=
ld SPBA bus.
> > > > +              * If not found, fall back to searching the entire de=
vice tree for
> > > > +              * backward compatibility with older platforms.
> > > > +              */
> > > > +             struct device_node *sdma_parent_np __free(device_node=
) =3D of_get_parent(np);
> > > > +
> > > > +             spba_bus =3D of_get_compatible_child(sdma_parent_np, =
"fsl,spba-bus");
> > > > +             if (!spba_bus)
> > > > +                     spba_bus =3D of_find_compatible_node(NULL, NU=
LL, "fsl,spba-bus");
> > >
> > > And yet the search is still broken for i.MX8MP case since this platfo=
rm
> > > has two sdma engines below the bus@30df0000.
> >
> > I tested on i.MX8MP. It works.  Above line is for backward compatibilit=
y
> >
> > The search has no dependence on the number of sdma engines. It searches=
 the
> > spba-bus, not the sdma node. it will find the aips5 first, then find
> > the spba-bus for
> > sdma2 and sdma3.
>
> And you're abosulte certain that NXP doesn't introduce a 2nd SPBA bus
> below the same AIPS in which case the driver is broken again?

Good question. Currently there are no two SPBA buses in the same AIPS
for all existing i.MX platforms and there is no such plan in the
current roadmap,
SDMA is replaced by EDMA from i.MX9.

>
> Sorry for beeing a bit picky. I do see that NXP decided to drop the SDMA
> for i.MX9, at least I don't find any reference in which case I'm fine
> with the patch.

Thanks.  The change should be safe.

Best regards
Shengjiu Wang
