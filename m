Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BFE253932
	for <imx@lists.linux.dev>; Mon, 29 Sep 2025 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138289; cv=none; b=KVvZcObF+i5SvTCydF6yIG9q9CxFbvLa9zb9v9ndTNfTv7Fhk8KQWKCVfnlMjLdb8fPypGlE7jAr8qA/11JwYQWGEV2alcl9it6n8TsNYwK1iDjGFpD5ntwpvlu7qHM6Y3pZys1EM4Svh9eo8q6H0IEqV8g+u+8D2SXlzuSz6bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138289; c=relaxed/simple;
	bh=0seYOOKfhRxSaRtbJv3opFssAUw4AxrKK0HRe+hoIgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ci1mFcFIWTLy1Ryyuv2dIqN3dfuGPCRC9YhLoptSefdmXaGptHrcxT6cUuizz9Fg973h0F0YD0cstGql5wjxByjbiXN6iEVgZSg1tBFO5GKjKI03xyIyh80xMg4onlJTeF5BEV+5ytxzxfsQOt0dcJLB2KUv1wKOCK8LZZ/bBCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBKmSNij; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBKmSNij"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-74435335177so75115397b3.0
        for <imx@lists.linux.dev>; Mon, 29 Sep 2025 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759138287; x=1759743087; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H948Ks4FyotvIgoJWFnIQzusTpF3IW3EYA8On9YnJSE=;
        b=SBKmSNijhpMXiPeb8lw2QuVvK/MVpL5E4FClSVRgPJ/uj4ZsSYwK6JSfdZr2LO4fZC
         HtEqR1Y8RNSAfcWNcjvIyBqNGaHK676HER/BK0HkIEvyoOg8YsyBBj9NkHkZEn5NWdhU
         gBZLPTbRXU+0/wNsVokFVPQDHIOLB46WzhwWLXlPgWUMJWwMR0cpEGSiRiU0lIAto2xc
         RFh79PkdKlF9YmG3jTimxqr8rhsIMlHxyJXVWpDwyOYz0Hrj7gQQjMxuVpprft0+yoHM
         mxD9TNi4kvZ7sQQr+AnJOw3yvSKDT/unFnYa/tmGHHB5j3TZJ/6xBd++1Qg5mV0S2mB/
         i1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138287; x=1759743087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H948Ks4FyotvIgoJWFnIQzusTpF3IW3EYA8On9YnJSE=;
        b=dEwr850F+NMLzRokmvm2bEWkpAMTTbLvkM8ekTqXn5fQj5bdAbzHkGIpgeYVLYYNos
         vBqdAd5hZOAkJhOzEorB5nhVBDDIdySdMPMYsVgW4WlOVz+6KOdAS6kbB5OZU1CTtMy1
         Q3RAHJg044YTGJI0BRmb54a6OU3VOyQHwbGFi5x3pQMpuZBOhRD5e8mfoEhdsbHcAtaS
         9dSrdpfT+FeKKN0lP7QCMVu/cdAOL734UikxrC5Hl5WYm65Fr0aQdjhv6BBJRAIfrnm4
         oXe8/Lg3Hu2NgitJv3B67oyPBGYgGQYm90XHq7HMpRrqiknqstp593pGVa78U6dW21Og
         ip5g==
X-Forwarded-Encrypted: i=1; AJvYcCWtyFk1okGx0iSzMmipHioM+otiwVmdpRzJv8mBH4Bt+qZyEg6EBvefotyLijf28orIsLw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPVfpxwTaf5VDRcE3t2rOaM+CH5gZu+gd+eDFPmcixnEQ7AzD4
	qMd8Ar1bd4EfRXIoWNQqSjMRJSbTCByTmB/eIZFgBdC2lIisbJrHDnDxhLbg1Ai55qlIfGguUrP
	aKeGzoFrEuDDB8daiRq0WClXh6Ul2Iu0IaG4qq41JMw==
X-Gm-Gg: ASbGncvjSxy5JXEfAmLG0QOHL37OBIpRf9PnuKbDlQUrHwHv3L0v9zHFLkkbnPnZNar
	5qFNKkJKPIsh9eek3e6J/+2bj2GkAcmPtRTDl2ThdnKSkCakQU8XkvkY7hzT3agahEZjKo5w2HT
	nvtVgL+l+oGqzw28gGTUkJTyB8XRQrFZllmgW57HYDEFJDSy17dnayL3bVyOQ6qItCwpIEOuzuA
	2rTc20X
X-Google-Smtp-Source: AGHT+IFXTh55gLh86/vkdYVr+heB/S126ORlkozE21AFNkj/jMs7BoGlJ6IMgFlkmd0UlQRqUYqeDkRaveHfjIEl1aA=
X-Received: by 2002:a53:c345:0:b0:5f3:317e:40af with SMTP id
 956f58d0204a3-636dddd2c3fmr6803730d50.19.1759138286766; Mon, 29 Sep 2025
 02:31:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com> <CAPDyKFqQgS9j4uGkTL_taPTL96su1tqpyoek1cpZgTiaaBMpCA@mail.gmail.com>
 <20250929034048.GD29690@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250929034048.GD29690@nxa18884-linux.ap.freescale.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Sep 2025 11:30:50 +0200
X-Gm-Features: AS18NWDsIyPq6WyP-cYDKXj4NowCxNtd4ELMHIi6ak8TqMmTMVVwpzVIqFM3mSo
Message-ID: <CAPDyKFp1NrdA6nZMQFrgrpc5Ub4osgYTiSJ=Gf1m1q4X8RYCmA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pmdomain: core: Introduce device_set_out_band_wakeup
 and use it in usb
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Sept 2025 at 04:28, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> Hi Ulf,
>
> On Tue, Sep 23, 2025 at 12:07:02PM +0200, Ulf Hansson wrote:
> >On Mon, 22 Sept 2025 at 04:21, Peng Fan <peng.fan@nxp.com> wrote:
> >>
> ...
> >> ---
> >> Peng Fan (4):
> >>       PM: wakeup: Add out-of-band system wakeup support for devices
> >>       PM: domains: Allow power-off for out-of-band wakeup-capable devices
> >>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
> >>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
> >>
> >> Xu Yang (1):
> >>       usb: chipidea: core: detach power domain for ci_hdrc platform device
> ...
> >
> >Rafael, I intend to pick up this series via my pmdomain tree shortly,
> >unless you have some objections, of course.
>
> Sorry for an early ping. I see v6.17 is released. Just want to know whether
> you would pick this up for 6.18.

If we have had another week, then v6.18 should have worked. That said,
I plan to queue this for v6.19 as soon as we have v6.18-rc1.

Kind regards
Uffe
