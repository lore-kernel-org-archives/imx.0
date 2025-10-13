Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B32FD7AA
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760362432; cv=none; b=JDmyxlz9asvJcCAbur63zH0Wf4PlUCt6r8YEliiRnC7hM9+kJ1EDAqAQVfU+uz5kdkG2u7n6oCM/JIyQ7XSY1qDLGYe/iTfk4t0YxsfEa/MTay8+B+UxraHCwnDVZY41etfyhd1EHwsS9MuJRNFJbM9bNzaJIxXN5YCiMF1Q9MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760362432; c=relaxed/simple;
	bh=H2juMaGdKsnPU2tLSraoa5b9/EA9CP4IrGvXhZXInKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBzwfDgaXpJVQFi0VHKBVwhjJbiGcDSRNKPyaiB6ibPLh1p2HNRlAmS9eUYRU3kNNRVqnRS10fvidsbgOsWQrq7DrpzLqUWw2nO4sO91sCt6CfZKCrJkrB207sTRJfuEhMwYOC1RDNNef2OX457KYT5RszkdenwQ+2q3MV1TeSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Du9+UW+8; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Du9+UW+8"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso33438371fa.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760362429; x=1760967229; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2vv6Elqb0iIv4dJrDSGaSWX9dF6LnvkTkr6vnIRmSI=;
        b=Du9+UW+8/OeWTx6/6dNt0vWO/BhHT1aydLptH9bfNDrY9o5LECjXdj7d4Kix0hw9at
         bBcmIVmt2ujR88V+oyuOrdsxElZX0otySfDNKcis546ff/widGKYhE/OXLzBeJqw14NY
         ephGC35TXqqQ+90x6spcJepjprqAwvWQaScL87ymAgep7BWPWHlzUJFPMOz9d8u87u1M
         rdku5/07fg89/6ltEddyq1kVHq6ekQzqtng9Bj2tPW4o1cQOTthWsxGIxVcbf5mcQ+Hg
         mEMZWGf/p0sqvZdCpRVbqtepD5S+C5GHSOYIU0ycPjX7bM9p54Xx6k3SLN4yb727RuDF
         QLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362429; x=1760967229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2vv6Elqb0iIv4dJrDSGaSWX9dF6LnvkTkr6vnIRmSI=;
        b=KdXm9ezy/wB0hGhj/2sfI9c9EGHwZodWU5zyA8eK/3WPjLrXSYRJgHdsuNn21SDjt+
         0MxaenvwJglvRdImK5yIzUaJ62djO/9vKwBZlp99wWlvA40NO5NBPEExl6pJg0Ai4p40
         L7oLd2z5zbQJDKPQaooNLt1GsU0nE9e8Qy9x5YkGK+UoNoE1OU3uS+QOOZFIhLp0C4sz
         yvnNFroUAABajDrsek2we7EQlBLkUpNMPG3TCjjcMqYggsMeF+aO75SaGtg52tpPSSM7
         vzdQ5Sye+3RnSn4wb3XdJvFbspPVFqCXV0GprmCMPQX9CftGeUKYP6350hHx7+8BELAf
         DvDw==
X-Forwarded-Encrypted: i=1; AJvYcCXVtmOkphEN4SDaOn+7GdL6O3nL1RuqUJiXkbR2x6XTFSCAKpKt5d+UxlmR5mmoMn8iKEI=@lists.linux.dev
X-Gm-Message-State: AOJu0YycUoy5IkxEwpkBQi/Ldn8yY3UVJoKe+iBAnVHgDx7xWfZs+wHW
	gv6oNKqjmHUdNDluYLLPJbCfY9eNA0mzOC/AK19zO99q833isZMi3zeY1gU4jcBPCfZW5QoekX0
	jMHRRItJZhv4DHzh8Hf5qmGxx5zHS37mIaEM3BgkRHA==
X-Gm-Gg: ASbGncu6EMYKEOS+Ps+zCSREZe7oxHI+VI2cYwzMLWP4y/vBxSe2TkXSgu36tbHRFUE
	GWEWSEqJimhUi18Oi19oKVf8LXc+YAtIWbeFV+EETozrijodxzLbHTRl/AYpL008cXlOeibMRw2
	6J5jnYqEj584Lv1ghASjztiE+IJ6yxc3hdLAhAxZY/+qXrW65drHKCxlJnlaBa90sSWvYGu8nMI
	rYyhT6i2NGfsFLbKfCo4htHMlzufQDT9YfGhjJ9
X-Google-Smtp-Source: AGHT+IHgmK1HRnpsjGLKqPnG70DMAC1goUv3OwVcHtnyu/bV4k7lGHTS4AnKXk+tRstKPxroMpvqgq8QwqZeDkRf4ek=
X-Received: by 2002:a05:651c:1ca:b0:36b:8361:15c7 with SMTP id
 38308e7fff4ca-37609ee797dmr52547101fa.42.1760362428700; Mon, 13 Oct 2025
 06:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251009222716.394806-1-shenwei.wang@nxp.com> <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch> <aOk0y8xTi9hoGvyX@p14s>
In-Reply-To: <aOk0y8xTi9hoGvyX@p14s>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:33:36 +0200
X-Gm-Features: AS18NWBC-gdxliFCyTe38OsztEkF4HyZ8vB9ddnx1Arh4R638fPWDwBoKXMNGso
Message-ID: <CACRpkdaTp4SPj1DvJUD+ThBuQRrK+0ciVE0j92P9_c7EVvF0Jw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 6:31=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> On Fri, Oct 10, 2025 at 12:58:38AM +0200, Andrew Lunn wrote:
> > On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> > > On i.MX SoCs, the system may include two processors:
> > >     - An MCU running an RTOS
> > >     - An MPU running Linux
> > >
> > > These processors communicate via the RPMSG protocol.
> > > The driver implements the standard GPIO interface, allowing
> > > the Linux side to control GPIO controllers which reside in
> > > the remote processor via RPMSG protocol.
> >
> > I've not seen the discussion on earlier versions of this patchset, so
> > i might be asking something already asked and answered. Sorry if i am.
> >
> > Is there anything IMX specific in here? This appears to be the first
> > RPMSG GPIO driver. Do we have the opportunity here to define a
> > protocol for all future RPMSG GPIO drivers, which any/all vendors
> > should follow, so we don't have lots of different implementations of
> > basically they same thing? So this would become gpio-rpmsg.c and a
> > Document somewhere describing the protocol?
> >
>
> I haven't looked at this patchset yet but I think Andrew's proposal has m=
erit.

Yeah this was my comment on v2 as well :D

I even posted a bug to the AMP mailing list to elicit some attention
from that camp. It worked because now Arnaud is on board reviewing
the patch set from an ST PoV.

Maybe it is possible to split the driver in one generic part and one
i.MX part, so it is easy to reuse for other SoCs?

Yours,
Linus Walleij
