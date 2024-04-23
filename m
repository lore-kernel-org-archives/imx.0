Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2F1420A5
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713872469; cv=none; b=B5esHA1JtD41OIGEu62RoFMlXzspNGz5gF2237/VW1r1RDOCcadR3oQHUjMTuXU5JuF3sjKGs7gQnLx84RTgeJQ4NMZdR/9YcA7lWCnGg+EQjLwkkt32eEJFZjCvdCo7eLgbykNPpLnJlrLjIma1fq7QYnfHGHqH2MAx4MbxgUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713872469; c=relaxed/simple;
	bh=jGSxB/aKBQrvQZyFP9ugxKa9qzrbfWhqVhGn/ZIkYAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ago4uCu17HOGaz3eg2q55gju3hB/5qOgNVrNicVEHPvb5p8XQuO7wJzFqlDHBxrLgQ89hdnhetgsrQVvo9WMMjs+G1TWx7LREbc6fNIh8jzD7LqEuEAnjd/Sl/3WyR6XZ1D7jrLy03vMYSb3yGMYOYQ0jMUwP0GdYKOnVKRQCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dd0RQNak; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dd0RQNak"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de46da8ced2so5395576276.0
        for <imx@lists.linux.dev>; Tue, 23 Apr 2024 04:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713872466; x=1714477266; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHww8guo9joHfM40pOxCx1WuFD69gCMICsgCV/kfVdI=;
        b=Dd0RQNakuyVIamDSbBXtI7I2CnMA0uj2VnHnzPcaobTvVQcavVrkCuo3+mnkmdlgTi
         lyp7TZbK9j/UF5YFQIUdkYzbFeBIalTUEuD6shZaOYTsBqTAZyilYEVGQ8dmoIiULJ/w
         vORWoYwD6fcrpFD1h+MgX/HWsSY0QzHYOIUwpZCzXnRtllXsXyJFlnw+BpvPHZGc5ap1
         JZphpiX7gHafZuM22A8tJd1z1f7SK7/e0fyACRDiZ66IfzCcZS6a7v2xo48rLYtRE2s5
         LzXXRd8161kMm379zvqIbZeuSIWni7UMtC0R4UrDc/uAOejMLX8boL/Kf8T5l6Soe+iA
         5LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713872466; x=1714477266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHww8guo9joHfM40pOxCx1WuFD69gCMICsgCV/kfVdI=;
        b=PpH1VJXJtNXSb5nMND1bwOKxhiNP99sgG9A4q2l1nUZQMduS2pxZq9pgMFO95JJUmI
         s1rKUwf5zg6u8/tIUn0h9nmqBNqztmaxdoeWvFxdKZnNLG0gSW5CC+SIEeYYzS/yxI6l
         T1bcSFcMsCy83drvRJ1EpYsNIBw+Cy7QGGJfq/4cFHdnhMv8VaGVTswcYQN4Yw0hX/gX
         wIVFJhIUcFZC/hUszfjvzFQXd4rKSIowROY/tWVfxpDLnfHIiHCud8xIiZmjkxtoW6Hv
         4eYjZ5qb8qgsZMlJ2edI7zacrlJWv6MU75BHsPMZmg1bHWOzN5n5/enku9hZcM1nNef4
         7fVw==
X-Forwarded-Encrypted: i=1; AJvYcCXNyq0hpNp1Bygc+JUieyQOAoUA5IKtk6PkY01pNyIB7N5KxP3/8guVFllXv2O/xlvmwMKkLKOupjyEWoEU4+9DhaLR
X-Gm-Message-State: AOJu0YxNMZM5q6ge7zfy6zE2qiLDb4O0tpfOghpeJg15iV2mp7VyKOdh
	lJAh2ygi63OpVUigyQtyAh/vLD2CfsQU94Czir8194H9ydHHCKN3fbbIXJ/TpuDfYAyMQLfzSMp
	TFAR2DBp+JePis86uplfP0mV+VA28uD6WY2fEFA==
X-Google-Smtp-Source: AGHT+IG0zUJ0k+vOuaZckaNvNj9KvErNxit8stDC2Lri93dfWftA1haaHyaI6RFYiG/AC23vxxVy2y/4BpkWBRxblqM=
X-Received: by 2002:a25:bc45:0:b0:de5:5084:715d with SMTP id
 d5-20020a25bc45000000b00de55084715dmr1506637ybk.53.1713872466081; Tue, 23 Apr
 2024 04:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423022814.3951048-1-haibo.chen@nxp.com>
In-Reply-To: <20240423022814.3951048-1-haibo.chen@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 13:40:55 +0200
Message-ID: <CACRpkdaRxoEZT1_KyJ3QMDgBcciw1XUXKr=cEiPxbcwSnpmyiA@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
To: haibo.chen@nxp.com
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 4:28=E2=80=AFAM <haibo.chen@nxp.com> wrote:

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

Just call vf610_gpio_direction_input() instead of indirecting through
gc->direction_input(), no need to jump through the vtable and as
Bartosz says: it just makes that struct vulnerable.

Second:

In this patch also implement gc->get_direction() which is currently
unimplemented. If you are going to change the direction of a
GPIO randomly at runtime then the framework really likes to
have a chance to know the current direction for obvious reasons.

Yours,
Linus Walleij
