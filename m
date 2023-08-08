Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F08BE569
	for <imx@lists.linux.dev>; Tue,  8 Aug 2023 21:42:14 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-56d455462c2so3267372eaf.2
        for <imx@lists.linux.dev>; Tue, 08 Aug 2023 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691530933; x=1692135733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=765bOZ9Q3Awq9pYBjVlK/6DW6ZaFqIzjRa6sQD5aWp0=;
        b=r1HmIfkFQtHA3+ektE8isZIInkgNkw2/0CirSxwHmYegAOIj0HjMuS9IVDW667VqDn
         tQp+oL6lbTfz8tW4MLa5XGbbCGb+DsTEd70RuIqjimPNBy+Jc+t/i7CrtEO+a3lA0Dwr
         dMeHK4vkjoSx6Ib2HdyieiKG7JsiY2G9FxVMFu2OvfyTIgEkF0uF9lyEtYMAwxmdocSD
         5Ls8HjxmYdcJt3dJuZH3UxQEPoQWtn3SwpIhuzvMLv/fFGW3dAs7SPmD9jonAfSVG8A2
         YK9Qhk39DgKtyeSnbW0Hwpog3K2cDbOTIqL4qvYPXgNpgTlxu59ppxrAO1ThaNNAho26
         U6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691530933; x=1692135733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=765bOZ9Q3Awq9pYBjVlK/6DW6ZaFqIzjRa6sQD5aWp0=;
        b=YruvEkf+UyKgMQTP6SPylJNxmavfbpGX52Lokdds5tbZOCieZDNU7zd1PnOiV+3bNl
         aFcdyY73UOdNJYQgSJfhTu4IWlwfEFXtAc3qor63p9tdXwpSD8VrBEsYehqc+qOK0tz3
         rX2g2WwwllXPiR8ELHUb3HNVcmAluuw6+qX4vPiciWHARGmsDrVJhumtwvvJXmfaXIiB
         FYiS9ULBuZBqHig/Ou9wC3+pozwevkAbNOQjWbm0olkvOo224pDMU2OVt1k7sZt4vmQQ
         37Co7RXbJ9e4U/mjJVgloam9UzU7kOtaTs2NkKVtC92MGXfF+TfIuTNwW2TDKe78JUYW
         QPAw==
X-Gm-Message-State: AOJu0YxgF5J6HSg51vheMY+guxNlY4yWiF4yOz9lpEA0nxobbonodqtn
	sgii+gU+8bmhrHdJc+WzCpMS2YJpbBcKr1Dfb/Y=
X-Google-Smtp-Source: AGHT+IFAwLfgnbOmi18Zo3y6LoHgyRUD31XAyvN30kizlfZa9jJXkENaD7g81ioQyzehst17WFKTQCxSiC8+pngsD8A=
X-Received: by 2002:a4a:9b50:0:b0:56c:d297:164c with SMTP id
 e16-20020a4a9b50000000b0056cd297164cmr987995ook.4.1691530933092; Tue, 08 Aug
 2023 14:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230808153346.335411-1-shenwei.wang@nxp.com> <ZNJ9qDqDIF4s66E8@smile.fi.intel.com>
 <PAXPR04MB91853FD015613B944B8D2085890DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91853FD015613B944B8D2085890DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 9 Aug 2023 00:41:37 +0300
Message-ID: <CAHp75VdmfF_P+GUcga5goZEDccjX+W75tLLXTV4OTUk13STd1w@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] gpio: mxc: release the parent IRQ in runtime suspend
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 9:21=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andy@kernel.org>
> > Sent: Tuesday, August 8, 2023 12:39 PM

...

> > > +static void mxc_update_irq_chained_handler(struct mxc_gpio_port
> > > +*port, bool enable) {
> > > +     if (!port)
> > > +             return;
> >
> > When can this be true?
>
> If the function is called at right place and right time, it won't be true=
. Just in case. =F0=9F=98=8A

I'm not sure I get this. If you try to add a dead code, don't do that.
Otherwise can you clarify at which circumstances it can be not a
dead code?

--=20
With Best Regards,
Andy Shevchenko
