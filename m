Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A6B17C2
	for <imx@lists.linux.dev>; Tue,  9 May 2023 09:12:32 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-61b8faaa8daso27449866d6.3
        for <imx@lists.linux.dev>; Tue, 09 May 2023 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683623551; x=1686215551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD4d87xGqwj8x/aAkdAtB6F7zNjiV/R05nAVNR7p0Yc=;
        b=cyNNxcOgMAEz+pxIK8jws3GF/GGwMhJkgByFMbLlweStwKPs3fD/uGEYk18D0SnO0E
         xP5BD9cS/mxaNydVKAFG9OHI1AoLSJ+KCl0y3AsmsShmVhprLCmKEpaSbHb4qLBA2PHY
         PVFriZB/RgjH4iRxsiLW3hElqgz4nu3ljjlaZFUXXj2eHhQN5hkl6Ttvkj4p8ohmZ5Aa
         TSFAy20YjtTi0vxfys+NOfYK+V78kxc4aD3FxGy5A+dJR7hLy1kvHGJOFIuQueVUjsd7
         RQqVJeUxfEb8IGIICnA9HRXdIYvTXUsIHLh1EMQtlcIOWJnlM4+3qSxd1MvTmN+IGgB4
         k8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623551; x=1686215551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD4d87xGqwj8x/aAkdAtB6F7zNjiV/R05nAVNR7p0Yc=;
        b=N3DTvH1RcL41CdDkM8E0zJ50XHumjBKbJqHfmCnWQm/r4BfxQ9r00g7QntgYwSZRym
         5/iS4+tTwShiVLY0CvfQh2n86VcpqGp6gcbB2DcUJGVnjC1I2P8gZ0NU+dy9Fd0TtFES
         UDgJ7wo1jde/n16B3k/44gAcLy6iqhnMiUm8VboQJcSeRbO93URX5rYUQ6jrhWBWxKjl
         U5eVMjkIHerQob7/tXMCINYGvyvqG2R6mxglcmgViK35DXXMy7OC/IgciSkaoM8o9nGx
         erE0meAep+nNlCVqUuaNL8VKI8YGHBJ7SraBTI3FxJPGAKO6yw0K0MD1XK+aOmHNZVhm
         MWLg==
X-Gm-Message-State: AC+VfDya6D/KTmKI1TOyIV+oRMma5LLcviEamrBnr2wCejeuOzLtvrXQ
	WUJ95mlAzssawIZbKwn9/VDzCwEiNZsgxKiL7/g=
X-Google-Smtp-Source: ACHHUZ5BcIZfNZTH4hgGhb4e61mAhrMwQOYuyprUJnkY6wCix/GB42D/aI964LID1LLH3QEZTxuTdcl13nbKuBezaGk=
X-Received: by 2002:a05:6214:d05:b0:61b:637a:64df with SMTP id
 5-20020a0562140d0500b0061b637a64dfmr16250848qvh.3.1683623551626; Tue, 09 May
 2023 02:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230508194555.1057007-1-shenwei.wang@nxp.com>
In-Reply-To: <20230508194555.1057007-1-shenwei.wang@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 May 2023 12:11:54 +0300
Message-ID: <CAHp75VesbGkmG_7haH3LvHawA1Z3=TGv+w-kqF5nUkaTd5tfag@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: mxc: use platform_get_irq_optional() to avoid
 error message
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <swboyd@chromium.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-imx@nxp.com, Fugang Duan <fugang.duan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 10:46=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> From: Fugang Duan <fugang.duan@nxp.com>
>
> Use platform_get_irq_optional() to avoid error message for the

an error

> optional irq.

...

>         if (irq_count > 1) {
> -               port->irq_high =3D platform_get_irq(pdev, 1);
> +               port->irq_high =3D platform_get_irq_optional(pdev, 1);
>                 if (port->irq_high < 0)
>                         port->irq_high =3D 0;

I would rather do

  err =3D platform_get_irq_optional(pdev, 1);
  if (err >=3D 0)
    port->irq_high =3D err;

>         }

And looking into the code the above piece makes more sense after
asking for the first (mandatory) IRQ.

--=20
With Best Regards,
Andy Shevchenko
