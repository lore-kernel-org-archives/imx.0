Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795652336;
	b=GzqiT70D6jedpgXhqK4UT7qU+YvMfMk+2oh/1XMM05O/j/Bv24ZOAB+kDCUrOENtzbCE
	 ReilpWvaQU8B1tm4w15VtlvL/PXObEI20jpjQJKcO6+WRHLSZOxMOz2sj+U0yMMHYnVqL
	 PGP7uMpoQ4SlabsQ5GTtEjA9nNdU9XqiWhnlg9qzs5JjRzxRwjNfbxANCinKZsrvikLg0
	 BXXLdKIO85TX39AXDlAhZ6kCN0Tmwy4No2/Ps+dtVCcyVbb3XrCYulElUlnd3gFbVCPMf
	 toJj+32jgOrs78J09FWZqfzz4EmzuVw8M1T9FtgC8xUJ2vUszQ8wHSQAzmgF+t533CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
	b=oZZUhzTFTiB/hnoIZ0gM7n3NruDLSvyFtof6g6ZoTM3OEnD4vbtWWgFFyoDkVup9OaFh
	 Nkld+1KdjIpAlFKyj850zMx5o1mFF0A3AUYUYIVlsQpNxgq0mq4ee+v8Y6mk/6x5DWKJP
	 FZLjqLPAa8cR3brjdLiZkTIf5oAUz9DS2ei+s50SlAzOJS6n8mFVj2NhjGbAxsz4hcdOY
	 DABa57xxE+zZxE9zB8hPNh2PME35JaN1T24pzhKdDPuyG8Pxcz/onPva4vGiU639aHK4M
	 oN1SkHe+GNdlzovg06+fo4psxdP/rCbCDwZuQsQh3mYgKRcyP/WfAGIX6IAmLaHxcWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jz98CQDY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D49B606A321
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 00:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D49B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jz98CQDY
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386d1859e1cso1046732eec.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652335; cv=none;
        d=google.com; s=arc-20260327;
        b=EvV3wcZdh8U3OXNGkCeJUL8FHn6f5mfw4nRdj6qbmntZ85Oftcao7mpKwc38yTzFqL
         RMkB2AdHka0Mp1ZamND045IO+X3ofckHq5Qp/B+d2OiHn1R4vMdwwkdDZDTXuldXrXuZ
         PTrHeGHnte32g3ISj1cbI9lJ2m0xppwdMtEmGgnk1UOUDbjyg+yo80rKswsBB90CjWf2
         lsSc3drMonGNzC8SjbRe6uwOM/mw86RD0JSoR/Q1l7WLYhY2urKpG93B90OImhyLBjk8
         nWLo/v3vw4xCtKiRLdMZO69Usm//j1OUIeyY1pUQGhH/hSsgDbpO9iaSjcy5NqqCvyoT
         ygJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        fh=KjpKMpbhVV9OaIyS45WrtKRce+tyr75DxypSx+WtcbM=;
        b=Ivac/cUZSyznIdJXDnjv+/gXniOvOtkF3NbCBk9yZrflVS59RWR2e1k6LGK2thqkFl
         LW2saWeIlTq9t8QEboRimKeJo7ZuCR22vlJPhzwMOHW9dlRMYhi4HcMaJ0rrU69ziW0Q
         fjKVuqTvhpcvO13+ImcfGnu84MYLt0NqL8U4Mna5qaxsHdy85TMe/rxmUvXO92xfZqLk
         QbD9J4tcrEOaD8TdSO9FF3hWsoegkrmFJa09t8f9BP9FuZeudNrPveTET3D7ytJbvqjP
         TfHSppzFXUoQBcFHiP6B1iE152j144NAcfzal7it/N4DJ7gbhH1b0SF8Y5Sxc0FrD3mu
         KLXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652335; x=1796257135; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        b=jz98CQDY0INaXVsA6wrobOH9YeEGIoHDDpGcZQ7fkzuH6lveN8t01eoGibz9dY6zhk
         5kz/emWID2OqopF7xyJ0Xjs681U0GP/rDfeFa4g9K4EISItgHr8SfHtbZ8DfoVCHirJ8
         ZUiHngbz/gngL8XzghpMWzhlAj28SM013MWZcxKoOaNey78kB4kcx9wPj7Aycw9BB4UV
         KWvLfB3eETJea77nKk2PDDLTcyIBkgcEuw7yO1GoRcM+UiCl6J064Rgxxk90XhI8s5AY
         V5nTj70mCKqPsswWwRXoAz+EY2v2Lsz1ChlawjnpRLQ2FluKhHIwtSunTocqc6zBzVC3
         Y7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652335; x=1796257135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        b=rryvb/LwxaCeI4IT372KJE+D+Jh5wgSFUeNsX4SQ1ldX4p/+ynR69dwrvfmilo7tTS
         yI37woL+VIS55PDJLvO7UkDzZRfM0wJL2xUV64ZWZIM1Oz8v2zB0hLCQOyR/Ri3YPnLp
         7UlY4ik3WY4/Zcy5MJTFy9lWQnBXjMWyI8iyVvfsN2HrvBqiaE04kze9cUx0YmzKah/r
         frdmp1ZOkjAZdeyH2AbVGtSt6w4nZZJ6RRd8GBr0Ug6f7Qg/DdEGKSRR10u6WTvrfFMQ
         ZuR9fkOYHhf4lhwKPuRmtnvOkNuDjvZA30/APgbHhpUMV/hotV3bEe2fIzmHntvV3j9k
         96BA==
X-Forwarded-Encrypted: i=1; AL+hErHhVGqwL1XyTjL9OSoL6nVOcbEQ+aoosxr7q7Q9A46IXuGb1vg3goEx29H4TjQ2BOp/8fI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/GtGpxjZfkgk83Lrw+QAP8ePEqeZZJ6novTOoFiTqg9STL7MrD
	U18o97MXtkf6fQGN/VwhgE7jHYzPbPdt7EFOLk5MoCE6+NmcfV/5raRkQNg+JoBTEB2jnOJW0a/
	EuTj0dTuIhLdF04x7zpVw/3PPoS1QZP8=
X-Gm-Gg: AZFdTZdERF2NTjchtDxLEL4bca9dQg4+yZZxzGbBhqUIy1cwUPyfYF6rIAnH9Grpu22
	e++VXVL95+l7fOTfWbYIW7cXoh4sCHsYKjyDiUWRTG6rdZE2C/5rm5mVTnehXWG9TmIDkGhlKXo
	tewihEGVnbGa9JuJDDJIJp5R6NdGlx9TKulLBw+sg4CVsJYgeLwa/AwmRYStzw78/nCLDAwvPW5
	i3vYcpp9fluB3q6SU3mEFXbXwyT15OilmuPtJClSM3PAylChTrglIJIQhDHgLK8gnZudt3UPKcC
	daFTq+RuV7dE8Wd6nrwbV9JS0Brvt85GV4vuRPpoCh1W+fayKeDH8gmsZgmt4AS7WDPBre2/+4c
	6PBUYLWcGsOQCFOvQK/j480SKcLz3qmshuu33iTg=
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id
 5a478bee46e88-38696fb2022mr18962402eec.18.1795652335244; Wed, 25 Nov 2026
 16:18:55 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-9-prasanth.r@lineo.co.jp> <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
In-Reply-To: <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:18:19 +0900
X-Gm-Features: Aa3M54qYngOgeBcgTcKEBPIYWY5OQaxOihLdYD94YpYTWZ1b5b1X3H2CZvSNV8c
Message-ID: <CAG7eodE36AzthJZmMhTTPn5BHjD_PFAabBn=yiyVU++gAbDEXg@mail.gmail.com>
Subject: Re: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
To: Paul Cercueil <paul@crapouillou.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, CL Wang <cl634@andestech.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Prasanth R <prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"

> Should probably Cc: stable@vger.kernel.org then.

Will add it in v2.

> (Your family name is R?)

R is an initial from my father's name (Rameshbabu), "Prasanth R" is
how my name is written officially.

> I see devm_device_init_wakeup() can return an error, which should be handled.

Working in v2, it now fails the probe with dev_err_probe() suggested by Marco.

Thanks & Regards,
Prasanth
