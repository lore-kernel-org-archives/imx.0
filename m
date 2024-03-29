Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208EA3B1B2
	for <imx@lists.linux.dev>; Fri, 29 Mar 2024 04:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711686340; cv=none; b=nM1tgI5yTh9cRvd1F7Wj4vyM9Bc83zux5EvRKGl1dPff57+FHeZCgiAi3oe6ZX/2Sm5Wj9YGmQrA6Nx8M2pGdL8vcb6L3eOT9NEA8TtgEjwjgJ2gjDXVLxDy36ljv05dAu+WOexEHH0PTW8KCFihX5gycNiPVRDmlHvighQ4JD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711686340; c=relaxed/simple;
	bh=7IZ6TQHzHNNntSBebLRFQSFiXdqxcUmk7UYW3JKtsJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBh2QsFGd6v6dKlBj5bx05l3qMQ6wGM02QnfK58jbRymmnoNK8PyXmM1DhBmZPJmZiTbJRlXFHvDfDtcLg0r/wHTDGOmX/+/A9E1DczaSf9g5y1PCiT037hcekhyPIDKtUZO16I4eEwOI352D7P+BLj3szSjLmJzXwUYFXlVLXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imZ6nkyL; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imZ6nkyL"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-366a4bcb2a8so6858655ab.3
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 21:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711686338; x=1712291138; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ37qzu7x1RT4FhH9Pq0w6AEDnJWDjXnQkreRgUC0As=;
        b=imZ6nkyLQY54CzCzXcsJ84LnUZepv8gs8jIiwimDvT3vXQy0CKvP+ow3r4WLH7rvZf
         yl6sTTYl/HRE/Zv3I9RnNhjPOXK9wQtJnisba4M/MfGzl6aIvbdTS1JYTMUBQVmV5Xmf
         z5jvTa6Huul+O/AZFroVYyuZ6yzECf40Lx1M7pWRAoXu4k9nliXJ08cIvYPE6FfZDkQk
         ukcg7YJSrcbCXAAyNsSsk8BXWtGQpO4zro+Pf2OPrWo9G0C5vm1lOrZt3cb4dV+IS6IW
         JTu5U4/Fa7YlVvigLnOnSMpo+b0SoPaiPaDTVXMrng14cb2bAW/8s5e3Jf903qxcmPva
         S1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711686338; x=1712291138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ37qzu7x1RT4FhH9Pq0w6AEDnJWDjXnQkreRgUC0As=;
        b=iNYbDpKSLoYCq7G2sBn0rpOXM3zFsR9FBvrWQQQODQubg2fzAiCHLqeGgzX7NSg4A4
         UM948tmMgxjmKWWRfbGifUuBgK3I0I5NQQoFwZkVK9N6G98vfNVtAefsR1cm4grfzgUW
         GHxhV98geJuTp42EeQJZ9qY8v+yjINTfHbAOsUF7VDeVG9mMGp65VSTi4mcz9IYCPo/3
         lOnsgZJP8nuvp5b4YbRmCsE6OO5s2pt3bNDUGWDdPCoTAOXb88+oPbvuFIlJeEUI/eei
         6ZUCndm7ws86mKNKAK5Ukf20bYjMhUupAeRREc8p3Vo6ZN5Hh/ttL3w4POUR8kjO5cNG
         SOLA==
X-Forwarded-Encrypted: i=1; AJvYcCWgX9bmogLS5pa4/wc8+n+zyjuyflusdOa/Fa4mPOBsd1z1mGONIKph0lUWm5SHRdwiDNFU5s1OzM/9E1malEGskYOY
X-Gm-Message-State: AOJu0Yybo/gZsuUDjHS9hzPwC/FdJVPHn6DOPTfy944q3BMOykZkrIkt
	gmvkT/xbVvv0xk7BP5OyxqEUSo4h7VzCt7lTR6ALbVMmyiooCO7iPk4+2XOeWbWRjMjvp7Zzd2z
	GVuXY9Ck/OWx75jTP5jJ5HCs7u0I=
X-Google-Smtp-Source: AGHT+IFPBNrPz2Mqe5xoNxdfvTWN/1rO/cx1RiqAvIgUhy/WtGLP7XhI5A97GYuDTi7AdbNfcGzOUxPoWL71kIj81FE=
X-Received: by 2002:a05:6e02:18ca:b0:366:bed3:a218 with SMTP id
 s10-20020a056e0218ca00b00366bed3a218mr1237240ilu.32.1711686338112; Thu, 28
 Mar 2024 21:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1711682887-15676-1-git-send-email-shengjiu.wang@nxp.com> <ZgZBH/HsO8YmgFZx@lizhi-Precision-Tower-5810>
In-Reply-To: <ZgZBH/HsO8YmgFZx@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 29 Mar 2024 12:25:27 +0800
Message-ID: <CAA+D8AM=1syyawLu7Wna5jHqzVsOuVvTKpTsaNUK7LCXMciL7A@mail.gmail.com>
Subject: Re: [RESEND PATCH] dmaengine: imx-sdma: support dual fifo for DEV_TO_DEV
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, dmaengine@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:18=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Mar 29, 2024 at 11:28:07AM +0800, Shengjiu Wang wrote:
> > SSI and SPDIF are dual fifo interface, when support ASRC P2P
> > with SSI and SPDIF, the src fifo or dst fifo number can be
> > two.
> >
> > The p2p watermark level bit 13 and 14 are designed for
> > these use case. This patch is to complete this function
> > in driver.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > Acked-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> This already in my sdma improvement patch list.
>
> https://lore.kernel.org/imx/20240318-sdma_upstream-v3-0-da37ddd44d49@nxp.=
com/T/#m59e4e03a527103de7bf1a7fe86e8fbc570454970
>
> This have more nice commit message. Can I take one into my patch series t=
o
> avoid conflict.

Yes, please.

best regards
wang shengjiu
>
> Frank
>
> > ---
> >  drivers/dma/imx-sdma.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index 9b42f5e96b1e..079e6e8f4f59 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -137,7 +137,11 @@
> >   *                                           0: Source on AIPS
> >   *   12              Destination Bit(DP)     1: Destination on SPBA
> >   *                                           0: Destination on AIPS
> > - *   13-15           ---------               MUST BE 0
> > + *   13              Source FIFO             1: Source is dual FIFO
> > + *                                           0: Source is single FIFO
> > + *   14              Destination FIFO        1: Destination is dual FI=
FO
> > + *                                           0: Destination is single =
FIFO
> > + *   15              ---------               MUST BE 0
> >   *   16-23           Higher WML              HWML
> >   *   24-27           N                       Total number of samples a=
fter
> >   *                                           which Pad adding/Swallowi=
ng
> > @@ -168,6 +172,8 @@
> >  #define SDMA_WATERMARK_LEVEL_SPDIF   BIT(10)
> >  #define SDMA_WATERMARK_LEVEL_SP              BIT(11)
> >  #define SDMA_WATERMARK_LEVEL_DP              BIT(12)
> > +#define SDMA_WATERMARK_LEVEL_SD              BIT(13)
> > +#define SDMA_WATERMARK_LEVEL_DD              BIT(14)
> >  #define SDMA_WATERMARK_LEVEL_HWML    (0xFF << 16)
> >  #define SDMA_WATERMARK_LEVEL_LWE     BIT(28)
> >  #define SDMA_WATERMARK_LEVEL_HWE     BIT(29)
> > @@ -1255,6 +1261,16 @@ static void sdma_set_watermarklevel_for_p2p(stru=
ct sdma_channel *sdmac)
> >               sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_DP;
> >
> >       sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_CONT;
> > +
> > +     /*
> > +      * Limitation: The p2p script support dual fifos in maximum,
> > +      * So when fifo number is larger than 1, force enable dual
> > +      * fifos.
> > +      */
> > +     if (sdmac->n_fifos_src > 1)
> > +             sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_SD;
> > +     if (sdmac->n_fifos_dst > 1)
> > +             sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_DD;
> >  }
> >
> >  static void sdma_set_watermarklevel_for_sais(struct sdma_channel *sdma=
c)
> > --
> > 2.34.1
> >
