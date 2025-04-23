Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B826C3A6
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405912; cv=none; b=OGctNEhzxkwOknT4H54MllvoAKsrq5robNY1SuPdgt6Ru7TF7Dp00RFG2G38lw2wDgNoUUiFFer7OVLvwrvD8fLANsPTXthGiJHImbkUDirHsOj89ehwTOoPk8DGiVhEsjNbwi2DZJ8QjWBlEWY25qw5yjF4rZRnC8D6GiAPFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405912; c=relaxed/simple;
	bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDrfmsclV49iv2wiGDaePainHGFtdPlTdDFyCaeaoTgxIQnNZf6W4Zv8wBrHei7u9ROrY4BWzdy/7QzCeDOjOsm0Q8QpzmADTNDvL8wA2aB51YeP9sC1bGvTSf1vg8G3JmP2YhzbngVm8eDG/hhCRQDYz7p6Zp3InUrhx4LAO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kzZaCHxn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzZaCHxn"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b166fa41bso6861820e87.0
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405909; x=1746010709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=kzZaCHxn0lUfEOChS673UcsYfCErSar9o7Gf5BSvJrWdHgNdDfetnwBqt7smuGrG7d
         OCMjPrZHnnihMTe7CDx31GZYVJsAnIiJgj5558LXzreG9qX5WaQs96ncYYVwLGM3brc2
         E7VhcU2EAYMEUaksoCzGveou7d5CdM0h8SPKn9s946bs/TZOMnCUvEdJ60D4j8ZClm4v
         WBHOZUo9PCJdugHnkSb/05j2JZkI/IkFriuEGEp4K7cLrR4W4CqGXT2/1KgGKBdx/P30
         ZXlpsP+Xwzgbx0H6/yoGdFo3bjGkKIPjBBKpdr4eV7oJKYESZACHnXoG4Rpa3cACMfrm
         hNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405909; x=1746010709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=XnQ9G0uz24oP8e1JPR0gZ3tcSuOylxIE0Q7Tr0bB1mctJ2VX6kGr3+pO7AM1IvT9AB
         tBb2eKD3rNn8NYo43LqCkdEdCmCeHnC7fUTe65TVOXM2zUr20ya8qQixr3/nOq2UVXlc
         WDxUAzSR7Gxm33pllx8kzOh41hQ0GwBC+Y+4cZTfyV20+LGJGVC1YwM+6FuYQqorYndy
         Zi/TxyF4C3RerEOyUV2Gno7INWbzU0XqYZyGjcTRjikthfqtJUaNEgKod4+xwDMbkHIx
         TExeY7dwEtBOlFtQRKTpbCQuoXHbmLXVa6rp5RCzMko9M3jjtWTLsBtFMS5Jj/i5QOYd
         enUg==
X-Forwarded-Encrypted: i=1; AJvYcCUfYkEIJX1Tux/uRiDWbGysW7Ke+c7MGcyG9QeaU6w1SV4KR3L1ORf1kebMPOVJDp5lj7M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKl+B3b9qnVXaUEIAltjb82tR7UctBWsDBA75T5AVAqMcA4549
	F+q6RLQdR+fdxNjsYxLK9p2sdFekxSwfeIyq872hLQ3YcGk9Qq1zlwlAYVRLQuz2P8NJQWlq5b3
	t8quy0lKrMi+DmrFSDTJApobbn+LFMVEan/Gtug==
X-Gm-Gg: ASbGnct5+b3rDCaClGtl+kFN7L8ccDu/HigLbEKp2Z+nQQ/T6gpdjOebi5cc0UOlT88
	VwWHPpdjw720wq/bnYcs7ihKXaudpJyAF0QyWGuv5e03fMS7gz8SJRiRo6Pi2fJyUm//MWlBvq8
	YYLl1U5Q2eBON4CwJUQjGWVkETZYOx77/d
X-Google-Smtp-Source: AGHT+IEjS24jEIugO55xavRjGHILXYER6m4q0amlIjqOd7Xvxl7wCjNSGFGR0t0e9qberyDj3AV0pmDzW61zJwcHqaE=
X-Received: by 2002:a05:6512:ba8:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54d6e6629b6mr4831840e87.53.1745405909021; Wed, 23 Apr 2025
 03:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:58:18 +0200
X-Gm-Features: ATxdqUGeqKFeiJHfrdFM-E1Ot1VyXqrfMLSq32rxhf_gi-bzXxhhSJyFayC6FXQ
Message-ID: <CACRpkdYVf9C+QZjFZZ9J96FRtoS8mowzyrmCcYmvV2uGTgcmzw@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your persistant effort in fixing this!!

Yours,
Linus Walleij
