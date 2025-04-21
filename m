Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B361B85FD
	for <imx@lists.linux.dev>; Mon, 21 Apr 2025 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253747; cv=none; b=G8B6UXn2O2tXM6jjqYpr+tPE2MamhZKXXVz4/yBfLRfC47ZJakQDRF3aGz4Q3av14HMyiiuoDFXoX7Saw8iwzz8oeuclqQivWQ4a9BRb1sMPf/sFhIwWB1EHqYJ5QmmDhC5cuR9QQ7fPCx2PgRRK5sK4ptBrzleIq3f7abIL7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253747; c=relaxed/simple;
	bh=0fsyOStHwhC1v88XvZ4Ac0nuPUuFtHM5xo1t68kAtVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prHz0uE4gqOvFmBySycgWQO1GNK8iMVDL15+6+bYGUpBIHDjCihTc3qXdiW7Wwec29bpNLHtGNzd4JBFnNIOAaJ80drx29Y5oOalCGCLtTLkXVNrdcrxLtkHikBEQDcGceGxGS3+6TrSyGBF0oxIHG51dbKMvR8BDCqtP+Qa/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuvG8Tg7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuvG8Tg7"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aca99fc253bso604162466b.0
        for <imx@lists.linux.dev>; Mon, 21 Apr 2025 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253743; x=1745858543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1I3cbwltjOGElOuVsLVlgvPqjddyD9qAtM+fs2VWpA=;
        b=YuvG8Tg70nzenUBUXDb5F1t0WrzHWNFDcD2BHGbs9q0p2s4EbdhQDeSinGZ1p8pLt9
         BePZBeeS1NvVi/OlVOVIFPiQoYLu7wCmIpB/lSXSPeghX/dPkgIQ8PXvuuDgqk0W9zw8
         S8ouXu3wIxUsd1UOOlhcdrFXxQC1DjS4ZV79GmJ4/qoGl0eh9V0KUKev9VlrLskXfz7U
         UQweFXYKu1JIXI8OPx8CrfMmuiAFX/s4XwAi3xjPcUHeRR1NBLw0Em/v++FvQYEYf7gg
         htjjZ+0nc2J0UnTM/WhLy5buWyC62S7SODCypJydwZeaHsLlTIVn6tRH1kjMzDKIYCAF
         N0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253743; x=1745858543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1I3cbwltjOGElOuVsLVlgvPqjddyD9qAtM+fs2VWpA=;
        b=lyhuFCw1Hu4k2BMzeDGZPVx8slJaa3hu+2MT84ccI4f63tQ89LCeNQ42Hels0loLrg
         k0ZDyASQXxwUYB5DlQZb1eq2L3IJSs1woySMuKUJHaNuNHaYmPTsMXumSVfPWOuMzMBV
         2AGaCZvSBsYzNPFPPoKP6Sn3eDFIujLLHpt+SQSgNu85We60erxcdaM0/g/FtDX1vr1k
         ZP502IjrOxhNbjBV5kY+Gr6uHl583jqo2lUr+XUOYztE4KVJG30+zTAKeM6FM46hyD5c
         BUBVWtMyq+cl86zj4cButbbD8KBh8PPFsJeuTGN2QY+1CJZqUOdFBnXg3+OmbNOvPvAD
         pxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1L1Ucxh+FffTKUHOhUlMchhGElhXvyysALZi8G5oxD+PsikHWdXWZgYIyMbK1LqTbeqI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+islcUNLtxdDrhRko81PXRNkxKmkob0CSV13Mq0kDlwIA+ryq
	yTndOgmLBp1HH5cEt9AqaS1bpJvWv1zcicrLHZexWpEtrfZ1QRYxqmwk2fbbu/oL5MGgpC8IUiW
	Wi/Lf5q9T3HACFhCDK+qvBPcK4mk=
X-Gm-Gg: ASbGncs0EtdF/iE8ndoGUrOSYQmZzWRLilKJYSUA1o8MWQwL2DSer+Im84wfgyQA0jL
	s+F6HZUq0YB36iVW/Z5ZhtUvFwBcBkmNMXKE/YygxXxl3dMlMENp/T1zDwyO35fxolDVFnByyAX
	THuUwMW2Sci1jxlq25i3DP8g==
X-Google-Smtp-Source: AGHT+IGOkY/7PisAD2oLp8QqIo0O9LumO+tYusSVEov8PZqxdtzgsegmull0yalfq2NuFZ5JO7zCd3FO9FZrDniI0y8=
X-Received: by 2002:a17:907:1b1f:b0:ac1:f19a:c0a0 with SMTP id
 a640c23a62f3a-acb74b1ca7cmr1191466066b.20.1745253743466; Mon, 21 Apr 2025
 09:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com> <20250421121341.49e28ddf@jic23-huawei>
In-Reply-To: <20250421121341.49e28ddf@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 21 Apr 2025 19:41:46 +0300
X-Gm-Features: ATxdqUH5lMC16PsOqzsa5gclyWSAtg59GNIHcNrRLuTnmqVLHUh5EH6DsroQl_c
Message-ID: <CAHp75VcAHZV4zGMvR-xVuVhhBJMCmo7A0w0fnwASw3iAWU5wdw@mail.gmail.com>
Subject: Re: [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct with
 aligned_s64 timestamp
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 2:13=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
> On Fri, 18 Apr 2025 14:58:23 -0500
> David Lechner <dlechner@baylibre.com> wrote:

...

> > +             aligned_u64 ts;
> aligned_s64
>
> I've not idea why timestamps are signed, but they always have been!

Because 0 (center point) was chosen as 1970-01-01?

--=20
With Best Regards,
Andy Shevchenko
