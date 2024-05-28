Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0CD16F274
	for <imx@lists.linux.dev>; Tue, 28 May 2024 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902379; cv=none; b=mUNtDH3JneAhFJUVAjS0GeoPFj9Roh04yO8n40qFSeRY1sIg3q9nG0zwxDJkDPJKksSvk2DgkDzf/HgS3l4tMjQRUtktQKzzJiPWyt7t72yfNjVXT+AuWaqex+MJ7ahXZp2kfYBduM+e0s9qxG4tUefstNJ9r/IT7Lkn5OLDugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902379; c=relaxed/simple;
	bh=5cMzI+v8sDAeyKiAtvYu0nmQOVHCMm5QhUO/fz8L32w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpIcqLdSjnXUT9GWRUDfoRvbAdab3FN2qN5iFOA7Pah5f0SzDEQigpuMbJUMOEYXN6kM3oafAHhS8cGGHWWimA6ml6BRt8QfatH+xHUvK9kz5aL76Jq0iBNdJcFuNdjcBSaMhEGMYISpOcD9aoxctZPPM+ScgX0KbB8cE1jEWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeWrGtTb; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeWrGtTb"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2bfae86f1ffso152886a91.0
        for <imx@lists.linux.dev>; Tue, 28 May 2024 06:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716902378; x=1717507178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cMzI+v8sDAeyKiAtvYu0nmQOVHCMm5QhUO/fz8L32w=;
        b=ZeWrGtTbB4+O74gIDUYi0XjMpTPtzQVQV/zXAbMW9jLOvaxfLNWYx5Xo9fdHhoc3ZJ
         +xHZer07muvAHR2NVBc8qFBv2bsFPmslNIrlTOMSTlCbqVNAL7/GfTx38Qy9uGuUzJLv
         WrvKtyH1hZO1imL/HT8iWJIsZzyXbCUE2ndcMJmOqwFq8HA9fYv4ZtmT9uBxDSq42qH7
         28IzV1L9KP66hhNcFuqR1WJCPkJu/vs0qEJmLUyLys2bsVOIKHRSSb97eUd0L73H31jM
         AdTv2bSWXz7nsQMkN2mbjw0j2bMl35GbK2DkdYpe/lnP6kGXluZTCvNlxqNXe5DDAVPk
         PSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902378; x=1717507178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cMzI+v8sDAeyKiAtvYu0nmQOVHCMm5QhUO/fz8L32w=;
        b=QbiwO3JKPKYZp+Hknt5fia2e7MgpJ9tjvVmL6CatomlUSZNE33KrAMASXs2kjTB4Ql
         0amoFVnwqqzAUVivWTCdycDvkgSAxt1QML4L8p/YYvm1e1tcSfQOvfdbvoktSNlJ5EyP
         +sAOhU9BXrmzEA71UENTWGYIGVQb9ujYP0da8u93GzB/nI+i0maVeFcCCu2Wnv1pmf0v
         vbxtcadIaVlkG6A79VmSTNTxUBrvlSsKFfTPz2FdUWbEJhEmnPJNqOfBPK0vbQro7bNO
         KWp2XpduYhh0kwA5yE8YBW2ebuo1ybhtD7bSgKDUEgIcYQLkz2VUtFQSsyqIzMintmLo
         2Yow==
X-Forwarded-Encrypted: i=1; AJvYcCU6E06y3nlQ9hvApncMdJyXISLfidcregWIq0wIdRtbIJrU966b3CEQEGdgSDcXpXWd1p8GJMWeThyVG/fRuWmlpmhF
X-Gm-Message-State: AOJu0Yx1tD1u+VnaZOrx8vhhPBxvNj8jw4/FlMLUjQ67t4E3syLF79BR
	7EfVKw+fVhDSYAqNqTyTZ1RtweE/GB4UC4lYjFcyDNnmsVjHpHP+zhOcLl5t0YHx+Hv3Nqy452i
	o2lPq3Z3+uwV5gY3upZyjMVZEOMU=
X-Google-Smtp-Source: AGHT+IEX2lE0VCcvC7pGoKnB7c+rFQvdDWmPp7YXpTSFlvIP9+457a+iyNl7IkydoZmoCqXRmbTtbTKPReQBamn74Ic=
X-Received: by 2002:a17:90b:a58:b0:2bd:e950:dfa5 with SMTP id
 98e67ed59e1d1-2bf5ee1f6c6mr11120702a91.2.1716902377828; Tue, 28 May 2024
 06:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528094022.2161066-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20240528094022.2161066-1-linux@rasmusvillemoes.dk>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 May 2024 10:19:26 -0300
Message-ID: <CAOMZO5BfwMrQGiaN07VC4ZUiTPjkW=epbckOWs2GAWG0fMXERw@mail.gmail.com>
Subject: Re: [PATCH] serial: imx: stop casting struct uart_port to struct imx_port
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 6:40=E2=80=AFAM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> struct imx_port does have a struct uart_port as its first member, so
> the current code works, but it is not how kernel code is usually
> written.
>
> Similar to many other serial drivers, introduce and use a
> to_imx_port() helper based on container_of(). No functional change.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
