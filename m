Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F456605CE
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713869825; cv=none; b=gKpISsc5BIklbEI9k+dVm4KQJm0AcfZOHPZ8yVeUv3fQJpv0m2m4HoNpWd3ELFYyhiL/+BOA3RGmSNEuL2aCmGe6j9t0TjkC/4ZvmYEG5bOQ3A6b6uinRB4I2esx7PKX7bzZ5V28iol/g5pG21AV3mEqHvQNk734g7v8mDtfcHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713869825; c=relaxed/simple;
	bh=wLVBgPgK46w9KM0ua1X9pCnwdk9I/0PinDZppvDLcmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faV9Bby/kQ1t0HfaRifzv787B6up868szxja9H0YEL08D0xxbKjDPLdmNFd4LcKZo8bq3OPupb9RrQRyV3PzBZ9euBSuiHQ5++I+YRj5iamKmHP427KB/G7xjoYir7vniCyhigcNUQvXJp2ciCvyoIhBwyTWx9qGrki2IO5Uchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pJ1YNGhw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pJ1YNGhw"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso5173608e87.1
        for <imx@lists.linux.dev>; Tue, 23 Apr 2024 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713869822; x=1714474622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdW/LjY6qj29zoQWo6lWGy4ogoBC4CsCwa2E/E8rpTg=;
        b=pJ1YNGhwir5EKE2kc2zafLfQQ1JvSEWspx/h6J/HdaWMyaBJVa+gSKEd+3qdT4acXn
         vLK296PBLhk+CkJR0b0s1ooSHJm0+K0uy6xkRCR2YlZ2/7BietSw3zElqGu1MqC9m1Ec
         Hge5C+G7ApBbK6lBXld+p5qD6BE+wOrA8X/6Q8ufeikkSnR8/nkJqsYgXq02ejX8VAtQ
         6bTsGyy0KH0bvhyYH2LAIJB01vESOYco+KpiLQ3igqclnGLlws63QAF34pgg3pO1A+8g
         E2+xAbMzs/+xRUkENCGtQ852e3AmUBCGWBH3e0G7MLsb/OputIc49TBH//HFTyuApUdR
         gHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713869822; x=1714474622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdW/LjY6qj29zoQWo6lWGy4ogoBC4CsCwa2E/E8rpTg=;
        b=O7db8ZQiQyxTg2muYXHWdnPRNF6IxMjWBnVmqIH2hPc1nDP1TFEl0HUSZerO3RwbgR
         Al1kNKeZfyOL98S4sU6xuDiYfY6MzIEhfI1S8p82L8FeMOm2dxNdeimjHa2266FYo4Xa
         TppsonGDLMbHyGk0M2hWhNVjpA7pUFqib4tSYedZv19wqUZLEt5vmMEek+KscEWzQ6hS
         T72gksQDHu1K0vWOxknGN98OdSOt4hPZoZAQIB/A4wsdeqaRiZIFsQ2eSFTj4lbU5nOP
         IWfDWRnIT59sXGRARHXURZLGmiy4i8FbxM+hNzrUVWKwfnE0e1NGIPug7CwOJsEx7T32
         3eMw==
X-Forwarded-Encrypted: i=1; AJvYcCXln/anja6LvTRr9gfZBMaHLkR/JIaLGKxPaankn1/nzMYVpx1oKRZyTcY7mimqwGR36Jyrz6phq3QbK8m6cNgVQcp3
X-Gm-Message-State: AOJu0Yw1H++oF7QhJvU6QJmyPJ0NqkKu3n3OjM75I/melQ1oU6Oq2+un
	34kcQ6AKEWLSNXv2p2Jh0OyrNLPboPAC1vPKWj74tObkUK/exoROz6UR0S3E3R6OdnYebsmuuE3
	rc497voqaLsAqp0620Bw1z9nERIyioQTyOparWU9WFtSbO7e77eU=
X-Google-Smtp-Source: AGHT+IHq2NMdnc+Cduu/lVn33H+Myuo+m7Js3CIcZkZiVbqVDmL57a3r9YJygCSp+EwxMqSAKS5xQlOBYQJzMkAjP60=
X-Received: by 2002:ac2:5e9e:0:b0:51b:533f:6483 with SMTP id
 b30-20020ac25e9e000000b0051b533f6483mr745330lfq.30.1713869821680; Tue, 23 Apr
 2024 03:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423022814.3951048-1-haibo.chen@nxp.com>
In-Reply-To: <20240423022814.3951048-1-haibo.chen@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Apr 2024 12:56:50 +0200
Message-ID: <CAMRc=MeoAbdqwtpK87zQytC7PcS==HjQ6GUO7MeWcZHRXf-SjQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
To: haibo.chen@nxp.com
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 4:28=E2=80=AFAM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Though the default pin configuration is INPUT, but if the prior stage doe=
s
> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> INPUT.
>
> e.g. When use one pin as interrupt source, and set as low level trigger,
> if prior stage already set this pin as OUTPUT low, then will meet interru=
pt
> storm.
>
> So always set GPIO to input mode when used as interrupt source to fix abo=
ve
> case.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-vf610.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 07e5e6323e86..305b0bcdee6f 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -214,7 +214,7 @@ static int vf610_gpio_irq_set_type(struct irq_data *d=
, u32 type)
>         else
>                 irq_set_handler_locked(d, handle_edge_irq);
>
> -       return 0;
> +       return port->gc.direction_input(&port->gc, d->hwirq);
>  }
>
>  static void vf610_gpio_irq_mask(struct irq_data *d)
> --
> 2.34.1
>

Can you use gpiod_direction_output()? Otherwise the flags of the
descriptor will tell a different story.

Also: this doesn't matter here as it's a built-in driver but irq
callbacks accessing gpio_chip is a thing that still needs addressing
as it doesn't use SRCU. :(

Bart
