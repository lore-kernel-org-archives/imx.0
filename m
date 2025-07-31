Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CC4242D7E
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753940396; cv=none; b=r3zUw4vjuquxZOXczrWE3JMzvJIIaACGU8rTB4s8cDsSOGfGShmEJtdMk3GgHDNHVOI5TPcn1YAhEzrNH8ODYlcs0pz2f3q7A54nF0o1vEoWdYtfadyRuri0oYA1TnUpFuXs7VthiMOTAukmVEwt6BIii4WwNFkOfCe24BG0SzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753940396; c=relaxed/simple;
	bh=vsSfQTv1GnUrDdf1LZJoge8igmimcPg14ako4+S5MGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5M189rEdKatyKi/vTDn821pFkV0YwvfOKerBBPUgwBOnbj2NNZ6SCtTHqC+TQXb4hd4KlDF5hpOQ/B1npngSAklLpmtbzhjzA80r9KrtCHIZyyqkLyXuF/tX6xFgK5jFieW/IVoV0Ej1+CKSf2mcicP0cmsYL/418/5IdMJPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuFyxAQ9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuFyxAQ9"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31f53b3b284so1810155a91.1
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 22:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753940394; x=1754545194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyR8ctYmx3hEaQQ7Ej343UwP10RXzS7rd++ptfwUqxQ=;
        b=JuFyxAQ9r63s9PtvQNx1ZztAmn2AzQpYPXiy9kalgy0Cy5qgFfqJDzsp+cYGmruEVp
         V6krNFhtpXUvnESFzFPyheJJonxVSYVT/KYfKJk7q6y7gtl3Fw+fBz8e1nf+NC6Nxing
         5F71sQwdHGeiqSpl+g+qqpGZmVBtmPTt2c+yiQ68kDzp0V8GTbn8ZJuD/eDbmwmjcnxY
         CpY12V4aeeLieWgBhkqanLz3rmbxRiz3JAjFhpM0PElf/rFh+9iHCeX+gVorKuXlyOV5
         ucQ4Tk+3RBm3VEC6g4VG2zOLVaQDwdA5lDG+vLmvPRZZ5ObzCdviAMLHFXA1kZ6IAXgF
         MEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753940394; x=1754545194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyR8ctYmx3hEaQQ7Ej343UwP10RXzS7rd++ptfwUqxQ=;
        b=nTubmV9DR36VfGo/Cffgt+vzSmJbzHnhQtkC365k/DzU++aZqocshSJxSNLnvctyJu
         LqGw4j1yFBX52/5CCEZiZiEKU2p50MqaKmjGUqigDOaBLlWhjPrrfFUSDmPQR83S83VS
         ObFhPTnKeXTs6R1BMwghKKnbc6g08i4TiV/Y758Aso0E46ODtcXQdzkbvgxXMqB7IUOY
         VgN6F5IZB67LP/WWOHJC6eIkTJNjRNJAg/xtwJGnPWD3XYaAzY5+RoIfo9cjgvaeGeyW
         sI9/Ye28GfMN4ko9+O5smhyJUZASlDekS5GGCKhLDNWpc7tsntF+bquCk5nUm4B9eJ6Y
         Tylg==
X-Forwarded-Encrypted: i=1; AJvYcCVCrJH4EB+0zrTSUNBc4uFEQju44OVTVd6mFf0Ui22JoQr7p7wwPavDps/uwOO+gOmBGSE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkHmwxAXtSTc5UjkybZ3YbfWByujHCw9cH1g5ZpqFkE69keTxk
	GtthWrzRhizGk+8CmEtzjcuAkGSWEz9JUNdni3LjcMdY8P/F9tNut67YEK/NBQPRhLmZD0ONqRV
	BD9X3p8MOnOVRxHVFp3JCwdwQYsfL4aU=
X-Gm-Gg: ASbGncsLnU1h5jpuW4d+zUhhuEO7BJGo+qeGVHcyF+DbblB1rBjXBvMdjlj3//VC2sz
	W5GTvB79/8CW5HeKeLLy3MzHCm1K0TC4yuK1XFAkqYc4YKt+VVhkn5RUfpDPyn06n07sAbckRD6
	jMsI8uoFdeG/+kt65a6O4tmPGCQQ0Mlro8S1EtFJ4UHg6WZEZmCxW7xHiJRR2W0nkHAmEjfwzt8
	ixAIVlaTz1LfEU=
X-Google-Smtp-Source: AGHT+IEN/5Uprcdhi7MsoFJRqmRXFZ/0UsdnfeTS9e/DUeCreLww1zDlGo75i7TCkRFGHCCKIBUwn6KQMum1mYiQZPg=
X-Received: by 2002:a17:90b:2243:b0:31e:fe21:ca43 with SMTP id
 98e67ed59e1d1-320da5a2970mr1180603a91.4.1753940394106; Wed, 30 Jul 2025
 22:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729033817.1239646-1-ping.bai@nxp.com> <aIqChYG0c2d9yCEL@lizhi-Precision-Tower-5810>
 <AS8PR04MB8642778C7A89226E7CA31DBF8727A@AS8PR04MB8642.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB8642778C7A89226E7CA31DBF8727A@AS8PR04MB8642.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 31 Jul 2025 08:42:02 +0300
X-Gm-Features: Ac12FXz7cKv6okxguz8Xj7yPba2RBV229ftYfVp9GxCGOkavwmf_UYtiRc0KAyg
Message-ID: <CAEnQRZCVB0+wQVqQYwcvwDW-F-_e6moH+T4pePGsDrbWyVY0yw@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: Add some delay before deassert the reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 3:39=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:
>
> > Subject: Re: [PATCH] clk: imx: Add some delay before deassert the reset
> >
> > On Tue, Jul 29, 2025 at 11:38:17AM +0800, Jacky Bai wrote:
> > > Some of the PCCs on i.MX8ULP have a sw_rst bit to control the
> > > peripheral reset through SW method. For peripherals like GPU that nee=
d
> > > sync reset, some delay is necessary befere & after release the reset
> > > to make sure the HW is reset into a known status. So add some delay
> > > before & after release reset.
> >
> > Nit: wrap at 75 char.
>
> Thx.
>
> >
> > >
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/clk/imx/clk-composite-7ulp.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/clk/imx/clk-composite-7ulp.c
> > > b/drivers/clk/imx/clk-composite-7ulp.c
> > > index 8ed2e0ad2769..710fe4f84465 100644
> > > --- a/drivers/clk/imx/clk-composite-7ulp.c
> > > +++ b/drivers/clk/imx/clk-composite-7ulp.c
> > > @@ -7,6 +7,7 @@
> > >
> > >  #include <linux/bits.h>
> > >  #include <linux/clk-provider.h>
> > > +#include <linux/delay.h>
> > >  #include <linux/err.h>
> > >  #include <linux/io.h>
> > >  #include <linux/slab.h>
> > > @@ -36,6 +37,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
> > >     if (ret)
> > >             return ret;
> > >
> > > +   /* wait before release reset */
> > > +   udelay(1);
> > > +
> >
> > It is quite small value. udelay()'s implement is not necessary to acces=
s MMIO
> > register space. (arm64 use cp15)
> >
>
> 1us should be enough as the GPU IP reset propagation only need 128 cycle
> of its own clock(> 200MHz). the first udelay is to add some margin to mak=
e
> sure the GPU clock is stable.
>
> > writel(val, gate->reg);
> > udelay(1); // it may less than 1us as what you expect, because previous=
 write
> > have not reach target place yet.
> >
> > It needs a readl() before udelay(1) to make sure value actually reach t=
o target
> > place.

I think we should capture this explanation in a comment above the udelay.

/* wait before release reset */ doesn't really tell much. We should
explain *why*
a code change is needed. The *what* is obvious from the code.

thanks,
Daniel.
