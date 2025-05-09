Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933328936C
	for <imx@lists.linux.dev>; Fri,  9 May 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794727; cv=none; b=rWOvHVvsGLQYhlqjAa+wft88tEJ7ry9qkc+P3amozU7hbkQK/aCefyqX+p50/lZpW6+m4nahmEAEb0ofzYX6RDzTqtsXQT5RDAXt6q/SL8U3Clp/2HBkg/tL3ytbVxpqbvedd5FJ6sMPVtRt9KnzMeucbgV5kXBc6DjqcYBREkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794727; c=relaxed/simple;
	bh=8NSBwkR/zU9DvjRNqknsrKz0iNJhVJvXcYxWAeswOCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWIP6KpnLrxj23eGfcqwytSjdervVycCMSrfPdIXwvQ/w5uAOPsYm4V1x1pFWH2lFfgUbjU7O7EbcM66vY5pnvqdrwtPuyPichnRNfNgN1p7xdfLA/9lV15XI4PXvoy7uNzJcfD1NzSfXoaX5xLIlqPhfknUA1G++Ku0nG1CCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pE0NQRij; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pE0NQRij"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70a2a42eb3eso23206957b3.0
        for <imx@lists.linux.dev>; Fri, 09 May 2025 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746794725; x=1747399525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=pE0NQRijX/vSnKUfcNguAyqPOC4H81LCKjyfKNd0tuc4aLbjsutN/mxmehAfb+rHYm
         Gtxx2hXjppiSMpqzcbyGQSl7k5fk5dLP8cPSdHnIdwvLhXI5Eo7dyPCKwv1Cienn1H1k
         ldk0oLWbgXHDHHCs8Yugcz0BbVy55eIh6g3ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794725; x=1747399525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=wHxgT+Vy/D3lVfoCfX9ZvFf69gMXw8mmDZBjS9BCHVVA8p5cxsB3JcncGaE/aVXCeA
         v3WvqH2KsegIXkzvy/4rYV0u+wM2NBXhvgZ4lo2PzD15KMy57MfrlRWC8qHWktnLg4HW
         i+H/ZbDLooEC8xqxEvL1T72x2o4WwVBmSjcLT+78EdDeRWs6iV3xSZYbvSriSZXn8T8A
         aSKsy8bTF4CQJ9koSvFV4AFl4IrbQzDOBGU5wbCivki1Li95HDwpCjMF8ibepHZ4f/YV
         PbHpbhLxelFSalnhULBqVsoitNBj/F3JlgM7fU5wy4Atiyldv/fn5BwfUW7ThYcUeU73
         Q07w==
X-Forwarded-Encrypted: i=1; AJvYcCWVsh5SSiyc6pryKGiXlIoqaJ4ezNdtHC9bjh/9z4Mq18d9l4aBYm5b9q1D2kN3xLfJ1Cw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6F6iBv7AZtbkU+xMtA6IAskf4DNCw8C6d3u+GMn0xL7BY53G0
	ZuwY+ehwARXp4w3SWwhO7LgE36usDhDDdVokHqdcWExVQYxPVx1A1ewVOK/lJ7UOqv2fffVUSdn
	GYqyYySuZc/HnvTDknW2gLYs9em5Jubt+roQJwg==
X-Gm-Gg: ASbGnctqqN0AVPtuhAr2dbkm/ZOSYFBfnHB6EmZLBvbVmXHNUJDmQ+mGZrHw6tCI+wA
	8WE/eC+S0os+NlRdmihLG0f1QnGxBPTeK6iKljIlWlHTnJXQzh5dDPUnd5xU055BAtIrlu+uVOF
	VUSRh4J6ArNr43s4rcbA==
X-Google-Smtp-Source: AGHT+IE+ZAuLmkz1arQbVX0YZvJVLhQ7nxcEKZcFN7pYHPM6BXlBBzNkNPkqSg4yVC9lFIj68cGkI7vjB1r4wxAuYWQ=
X-Received: by 2002:a05:690c:2506:b0:708:11c7:d200 with SMTP id
 00721157ae682-70a3f9e3f61mr40837627b3.4.1746794724940; Fri, 09 May 2025
 05:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk> <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
 <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
In-Reply-To: <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 14:45:14 +0200
X-Gm-Features: AX0GCFsMhC-bZIQbroR-iMbqMxImzouNrdaQ9uRaQFjqPmIkXBI_CX0YvsjmbY0
Message-ID: <CABGWkvq+FQZ2A9vpv2XfDmbHgpNOSnZhCMdkKaeqhCcvdjzdAg@mail.gmail.com>
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock driver
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:00=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, May 09, 2025 at 10:34:38AM +0200, Dario Binacchi wrote:
>
> > From the log I see that you are testing a board with i.MX8MP, but it's
> > probing the anatop for i.MX8MM.
> > Is it possible that you have the CONFIG_CLK_IMX8MM option enabled?
>
> This is an arm64 defconfig so whatever that has set, including the
> above.  Note that arm64 is supposed to be single kernel build for all
> platforms so we shouldn't explode due to config options for other
> platforms.

Ok. I'll fix it asap.

Thanks and regards,
Dario

>
> Current -next defconfig:
>
>    https://builds.sirena.org.uk/f48887a98b78880b7711aca311fbbbcaad6c4e3b/=
arm64/defconfig/config
>
> > I have personally tested the patches on i.MX8MN and i.MX8MP
> > architectures, with only
> > CONFIG_CLK_IMX8MN and CONFIG_CLK_IMX8MP enabled respectively, and I
> > didn't encounter any issues.
>
> Given it's wide use for CI the defconfig really needs covering, any
> random combination of options that can be set ought to work though.



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
