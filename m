Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28534AB14
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601971; cv=none; b=NalXjWPxHh6X9R4XDLyP7BkuybfSk9j79DplV2Gvo+kv1qElM3QnpKRJ6HvdpnuiQmTwQuPhIom43Y1B9/lKQuYZs7VIjgJW60G4ptf+6yp8vfxui5Oxb7D8sHceCUtpmqYYNlvht3LVja9cvnxh5KoVH9bj20BnT5dKaHHtkNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601971; c=relaxed/simple;
	bh=VKSX47Aju/DzSJYwp5bYidhSzFn8zeiXLyG/eQpEZMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECoc27IEyOHEGo0ayRrAp/8bASpLO0wSTeTMfvjxRuueHjuUn0nUOXjM7brQAuLJR3RDzSVWPRlXHH+i0ce00gG1nef4iewp9VJKKm+MLmF5safCoQ3/X2+n9z8fkWpVwZo77MpfD6lOfxUQnF6hfP3V8LISDgJxBlIxRrcnADQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1vOIRRF; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1vOIRRF"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e9baa0310cbso781926276.2
        for <imx@lists.linux.dev>; Thu, 11 Sep 2025 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601968; x=1758206768; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=I1vOIRRFl7BupsgTtP80h9tvvDeMHSwsLpLQEujwUjgheXOhDC59B66Sq+86KKgDt1
         lW5bt9H6pEGvw0xj1so0HaimknU3r+14EF88JIebUDYsh9LyAzvgcvXohlU40546NdZ/
         Vx1wEUP0nBzffWQodcr7E18mW/v6CRj9mG9KvKN/Oq5pcqx7aKJYQ6vTy5/gIZV9anMe
         JP6Qr70J4USMrrjQL7ZXurgAQJh7Rv71OipPWiZCiyEI0CmmkPPbT+G7yuLF+X6oS0OQ
         uZuvAnRBcR59apop9yPTVMVsKYxfKxZWQy0yaHBkkwkHjz3u1+iBmEnsfWS59RSo2Xfo
         bDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601968; x=1758206768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=dI0SDKgXz6oXWfgYUOSNVUn+yoxTnEzHdpiItv+GarO3OXFq3LkfKEsfQnjzqbTmmm
         KqFsTRYivOX/hgdKcsT2jTbiQpEKtMucjEDiLKFJSV1QZvzK8FavskDUbjnWMC3Xt287
         M4UtTin/GSoyVhsWpnYwjciE3wjVLmfuoMlWGwWQcVp2Iz6vV8A0Ckl3kZ0MbXEJQp1J
         +FAUAquMynmHVa9zmZYwn33BtuUhuNSzzebsS3G9yubgcAWuujSYTcD/sm22qdZjXPYN
         eG7Ej5NIfNbn34maMyka9dw5y5DtpXkOXRNd7quMrKzqg9W8zEqP4PoTh6GF6CoE48sO
         koAg==
X-Forwarded-Encrypted: i=1; AJvYcCWUiOook1YN7z/Dl5QPDXUk4uT7f70/jNScJ2ETnpPmKNy3LghR1BsM6WnKx5gHImUJJ+8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCDpI7Y9ZIj2lkXBfSpHxBivh/x75xvhgOAeElLTJMQhTiIMCJ
	lYWM+8Ok5wkb/GsQWKophWlRE7MrMMscrB9nwRtuGsUfVXgPnWSbcBHvjKpwvYSXH+stMYPDf1l
	J00NzZkofuOM+Th9GlrIDPPJuMHhiDuf+Np25qjxW5Q==
X-Gm-Gg: ASbGncs38N98VUsuS+JiY7qCeDn8/Pz6zuUh/2sTd4UVIH7qpZuYjahsrzq0wRinFJq
	1OlMLoq9ElhDc/gWKgiFdODgLqjS6wrL+AEg7136OFCtU3rdsee9TQ5R0ccJUYGKkJfL/5wZwnx
	E1nMGISVxBkLBjUcDUT9tHuokidT/6jf2VdXM8ByBPRIYLKtY97Q2he+2czuurD559WCOhPYDAU
	iVJlR8YkIYCLaZ5iBUcztfRT4cOJQ==
X-Google-Smtp-Source: AGHT+IGA14KLSVMCK2zV6p8As0+Jn95rbWVq+KPV+CqkNJxyiiFOFLcSxRvo/0exdQaaGDHMXMlIe6ixp4mKa1e9IQY=
X-Received: by 2002:a05:6902:1892:b0:ea3:d40a:2563 with SMTP id
 3f1490d57ef6-ea3d40a2737mr1177746276.41.1757601967783; Thu, 11 Sep 2025
 07:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 16:45:31 +0200
X-Gm-Features: Ac12FXy4zlU7KeT4OFE-vyI1bqh6ZB1528BpXJl_SwXQzUbCOw7DO0NcEvUZLJA
Message-ID: <CAPDyKFqBJQ92HH1tSq1rfbXV1OwbyvgChyHfv7ykJqf2A6qYpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pmdomain: core: Introduce device_set/get_out_band_wakeup
 and use it in usb
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> This is pick up of [1] which does not have response in about 5 months.

Sorry, I have planned to have a look at this, but just never got to it.

> This V2 patchset
> - includes usb driver changes(patch 2,3) to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> To i.MX95, USB2 and USB3 are in HSIOMIX, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. Otherwise the HSIOMIX will be kept on when
> USB2 and USB3 are configured to be wakeup source and Linux suspended.
> With this patchset, HSIOMIX could be powered off and Linux could still
> be woke up by USB hotplug event.
>
> Patch 1 introduces device_set/get_out_band_wakeup
> Patch 2 and 3 are drivers changes to use device_set_out_band_wakeup
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Overall I think the series looks nice, but I will make some more
thinking of this in the next few days and come back with some proper
comments, at latest in the middle of next week.

Kind regards
Uffe

> ---
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> ---
> Peng Fan (3):
>       pmdomain: core: Introduce device_set/get_out_band_wakeup()
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c |  8 ++++++++
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  4 ++++
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  7 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: 1b09efec32046a9c78cfecc46a26b1b139a3e8a8
> change-id: 20250729-pm-243ff7097e44
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
