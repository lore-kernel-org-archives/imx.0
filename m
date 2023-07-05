Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF0620
	for <imx@lists.linux.dev>; Wed,  5 Jul 2023 19:01:56 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso11286734e87.0
        for <imx@lists.linux.dev>; Wed, 05 Jul 2023 12:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688583714; x=1691175714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCsGZRzf3HYCGfa3J/FwmvyZFYe1Uzq7njxx6cRcALI=;
        b=f8rFSZhyPMufcQlj9n6Kb5YkkoNZ/Rcp9KzhozHLymYOFEBCfSxF5kNgqTGNmsM+vG
         hnAbE9h41qXOdtKkKzWfSLq8xca7Xd3HsnGIQWzuGNqD6czhHX5RY2OluIiUkGYKGwkf
         oqE8zbRdi/mK5wGSuDNZjk2JwoCees+DPMHLMcA8oubhdaM1cS9BA3hvqxA97vJtic7O
         lZ0f87gTeeTTYVmKVOVcBxAxeaPfZbGCS1h4vVN2WsnJ7TMWKMF5dZWkoOEq1soFwV7B
         PAGG+H9fvtGYI4kyaWLgFlNjGr8IGUYnh1RBZtrwHjNtyN38rucO3V4btAoaeH27l0RT
         X4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583714; x=1691175714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCsGZRzf3HYCGfa3J/FwmvyZFYe1Uzq7njxx6cRcALI=;
        b=if4bvSeSIE+07akjC1bPjYhwT+MraNg+f2J8iapwjryZOuXtZay5IbYJV76pVg6zMK
         39vsTG7yUlqoHut9HoY/wXWZcGTr/jrOn2TD6TXbi5jgW66Aom91cjQDj1gxU+i5HPYE
         nl3CrQiqV3GsGUF8rqeVCP3OXQgiShytTMmMvCbx0dLcUztkNKeOnBl/1IogB6FleQf3
         6o8NACbCN98kKjYzVXLbCArYSAUOER+qCPLp/IRByTLuIq6QcypEvei4mCP/XnGfSIo2
         iUXG9KtIsfvjOAlhzyQ5WR4BndTZSUACSNdyOrzzn17uMpcAGlF8tUnTg8GY4xFkS1Qf
         oAog==
X-Gm-Message-State: ABy/qLaPlkenhuIhUQoRxahnriCzOET7HYl+LJ7jsPuPNaOJaqBqqagl
	r/HX+6lOOj4QCOWs7VctsxSL/uhsT+8Id/xhTSQ=
X-Google-Smtp-Source: APBJJlHz+bGTxoBYEWa3Mx8vdec2PFYHcq0ukHiMMB4xKJI7N1m2UXzsu7l/vIgAgylbfzExbT8SGp0Gn5tJc4hBpaE=
X-Received: by 2002:a05:6512:2821:b0:4f8:710c:e2c7 with SMTP id
 cf33-20020a056512282100b004f8710ce2c7mr13857329lfb.33.1688583714300; Wed, 05
 Jul 2023 12:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230705153713.2511647-1-shenwei.wang@nxp.com>
In-Reply-To: <20230705153713.2511647-1-shenwei.wang@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jul 2023 22:01:17 +0300
Message-ID: <CAHp75Vf+RovRT2rYJDnizeRUwwKE_Twfd+tF5pY3XEc_xOkXYg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: add runtime pm support
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 6:37=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Adds runtime PM support and allow the GPIO controller to enter
> into runtime suspend automatically when not in use to save power.
> However, it will automatically resume and enable clocks when a
> GPIO or IRQ is requested.
>
> While putting the GPIO module itself into power saving mode may not
> have an obvious impact on current dissipation, the function is necessary
> because the GPIO module disables its clock when idle. This enables the
> system an opportunity to power off the parent subsystem, and this conserv=
es
> more power. The typical i.MX8 SoC features up to 8 GPIO controllers, but
> most of the controllers often remain unused.


...

> +       pm_runtime_set_active(&pdev->dev);
> +       pm_runtime_enable(&pdev->dev);
> +       err =3D pm_runtime_resume_and_get(&pdev->dev);
> +       if (err < 0)
> +               goto out_pm_dis;

So, after this if an error happens, you will have PM left enabled and
the next probe won't work as expected, right?

...

>         platform_set_drvdata(pdev, port);
> +       pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;

...something here is missing?

> +out_pm_dis:
> +       pm_runtime_disable(&pdev->dev);
> +       clk_disable_unprepare(port->clk);
>  out_irqdomain_remove:
>         irq_domain_remove(port->domain);
>  out_bgio:

--=20
With Best Regards,
Andy Shevchenko
