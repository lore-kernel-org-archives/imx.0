Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F12B1E51F
	for <imx@lists.linux.dev>; Thu, 10 Aug 2023 09:59:55 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1bb89ac2013so608678fac.1
        for <imx@lists.linux.dev>; Thu, 10 Aug 2023 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691661594; x=1692266394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JGWiMZs7afpHNba/9KEQj3tEokgpEuSpBv4LeBPKa4=;
        b=Lm1JCMFGUbo0kBsVApqK1y00PydiuWA/U5/leDQ5VnC3BZPEcITpqhLwyrBdQsn+GR
         F+n+z+iRK1CGjqC4lVc0fVWXJP8OfQ4C0R9gGsBtWyfKtP1dqnrPn55I00ew6ERcmCD7
         q8j3DQwsBCTPSF26HTmQ3nc45eu1aANNNTzvouwftWY1PNpz2ob4yG87A2dyKjl9FYWZ
         8JlCB0tflDsBWH8xQJjuiV3Bdlfjo0c0k/mpxkosocc+o3n/GGGp1b8PLTb5GWTRdiRK
         hHjNA7nGh+lw/A1g5rrlMCEa89ZZjr7DTeOwa3tjp0wEuja+zRg8n6FsKbmzWOfI1FcE
         j19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691661594; x=1692266394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JGWiMZs7afpHNba/9KEQj3tEokgpEuSpBv4LeBPKa4=;
        b=eylklJmELlPa66v06IP3YYBlOuXaTdYHATmsctW0pR9H79pFJslZ4sm8RTwj3JK+nY
         Uqkn2yGeEA0wlsglHu4xZR/nGEvU5i0Kp/On7q0HHcdJGRhoioFzgfl0BjU+Srngqx/x
         PmWtCan5zE01r4VpjK0Gedj4Ff9RG+eDm5CVk+TwLxIaURTT058i7XbAQ1SiA3hAqIjY
         cyTxjgQ56zDOGq2BQS5un49k4j7oVuueHwGHszxR0fn6+LXK5dUPBYI4fhBJz6CKmPt/
         pqZSw/vzd+kYpW+U6r2ykY6aP3vi+HhFK54G03YkgR4jHOaaKrKojtKch3xvD9QCKCeU
         AoCw==
X-Gm-Message-State: AOJu0YxyWOrjVVo946LM1ys48yA2z3kihxY0cCzM2eXjlj4rprhB4B/V
	y12YXEVT3KsfT5hpCTCO73bol2dr57HnyuijPjY=
X-Google-Smtp-Source: AGHT+IH3hMflAx0JByKHk0Nmor/tcbKdqITi4L9TTc3sTk8X0lRLX3LQYjMVL6z51ZZH6H72rreI4O38LghoYxXQCVs=
X-Received: by 2002:a05:6870:239e:b0:1be:f23f:99b with SMTP id
 e30-20020a056870239e00b001bef23f099bmr2289939oap.42.1691661594389; Thu, 10
 Aug 2023 02:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230809141324.400448-1-shenwei.wang@nxp.com>
In-Reply-To: <20230809141324.400448-1-shenwei.wang@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Aug 2023 12:59:18 +0300
Message-ID: <CAHp75VfB_fHD-h3Tdu=oB90Y7UC1RG2U3ECX4pymMCRFTux0Mg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: release the parent IRQ in runtime suspend
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 5:13=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
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

Assumed that this change has been tested (esp. when an IRQ is wakeup
source), I'm fine with it,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
