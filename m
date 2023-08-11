Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE00F29E0E
	for <imx@lists.linux.dev>; Fri, 11 Aug 2023 14:23:19 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-447b64b0555so647133137.3
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691763798; x=1692368598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cthXwWS5AtGe0MF8m6zZcDd2hFTXf3PqXB7dHWgjVPM=;
        b=2SSpcZPdNhud+fpnQEu76tsbh8eem75/JLRj1NryTVxA4/oIkSiXS/Jm8swObeyxJ6
         dXKOJbFg5HxqUnGXTrkOEw5QIlzYkND5e7D/ULYJ7YHEBa4NfeEFG6uRpFu8MkAwqJdy
         AAkiIYybXFZ65Ei9vk4puB+Za7Kri2wwumINKZ1XmfyhCqDGoPengNZjlwfupAOsFDNN
         uM9gYRc07elZdMZM2tebILak/0YEKfFXvec2AqYRSwgFgGqdA61KLWgxu0sSX7i74uoU
         Yulv3E6weRMMnbqT5qvJDsH9IY7uuYgzImH8u9k3odA+xfU2MXXJ4tQNu5Ey64Dz88oQ
         1suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691763798; x=1692368598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cthXwWS5AtGe0MF8m6zZcDd2hFTXf3PqXB7dHWgjVPM=;
        b=dSYIa5O/FTjMLMdTj6ZCuFlC8GoId8ieuHCB6hZxA5yzflVEAXvtuqb0/WU1Kb69ye
         cwoZUMqQbw7KPI+ay/SGdI8AdlRX6m/SnoIQa/j2zzukehJeZxUib1VQOIY/BjnVhbzj
         GHRpoSZSPU4R0d3pW2SV1mOBUXM9VTEJEzg+v8BPnvLITFzz3WvP2kBCsknvjbiJTR9R
         haCe28+JBxfwvpK1rpaiyOrsOp2nT+Lqx7de3/x+miAA2ImQ9arg3h9d8XE/SCyKA5KI
         jsf+JPPypFP6EVblcKjCmaMte7oJVKLw9yXdO3MBTC2EK9Q8mMq+oRUaf3d3nhY6HuWi
         pO8g==
X-Gm-Message-State: AOJu0YwdcOdpCb7W7dzd1VBdjC6VNmTvXg3I21aJn66MjmVSMLCSySy4
	oed/pqQ1N9BMOqh1et3rASv+PvprwN4OFQ6SeESSaw==
X-Google-Smtp-Source: AGHT+IFbwJ49M147kacqfum1O0sfv2sNF4nvUYfxmvNZFNrcK8YlPbE3UeRnDsSNiKQwOGUZ5NtA4gNJaHny7KNZenc=
X-Received: by 2002:a05:6102:50e:b0:443:5389:b653 with SMTP id
 l14-20020a056102050e00b004435389b653mr912518vsa.26.1691763798388; Fri, 11 Aug
 2023 07:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230809141324.400448-1-shenwei.wang@nxp.com>
In-Reply-To: <20230809141324.400448-1-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Aug 2023 16:23:07 +0200
Message-ID: <CAMRc=Mdu+2Ed--Z12nA7+6tvX3Ujs9VQihJe2w7j6qXg-GYLmQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: release the parent IRQ in runtime suspend
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 4:13=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Release the parent interrupt request during runtime suspend, allowing
> the parent interrupt controller to enter runtime suspend if there are
> no active users.
>
> This change may not have a visible impact if the parent controller is
> the GIC, but it can enable significant power savings for parent IRQ
> controllers like IRQSteer inside a subsystem on i.MX8 SoCs. Releasing
> the parent IRQ provides an opportunity for the subsystem to enter suspend
> states if there are no active users.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

Applied, thanks!

Bart
