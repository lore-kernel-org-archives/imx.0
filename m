Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11B56116
	for <imx@lists.linux.dev>; Tue,  9 May 2023 16:09:39 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-61aecee26feso28153936d6.2
        for <imx@lists.linux.dev>; Tue, 09 May 2023 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683648579; x=1686240579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15fvxsClJ8ajL8Xrnd/7Po8UAojxsnw+DrXatQWfl08=;
        b=C+WuEdM717CPbnAntVGGD1ug7rS29yE4EYPe7HaC8x2eUUB9j9ZEaybYQodYAegp6D
         Fx7/+O1Plq4Ud25EITrjIhXfO+odGnAkBdHnT1I0smzgUaq0SZxHqhFvkQAHKwNtoy5T
         ZQjd4peQ0eXQHNkzP5FHtKotZ500nuh5yu7zycFd76OZYDLSbU4j3gXRyZiCGVaeDtGZ
         LX6nuBXvuGlWhIBeOROWrwadDzSspTscsgAf1sh7ZeSbaPQTIdbcHucsattANFtk5O05
         oEBYe/Lu982WqJ7fjAngybKbiNfvt46O7bcDAsP49OklvFMIVsFwZ0HHo/TjQmgQyTPP
         Hfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648579; x=1686240579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15fvxsClJ8ajL8Xrnd/7Po8UAojxsnw+DrXatQWfl08=;
        b=MNOf+Eul3q2MwIJq4w1IMmgNE9Iadv02uCJ8ANXhTXPiQgoQ9Iz6nexdZDgohaF55P
         cbnAA8fyeSfNwZloe7wPSvwqxmfA3Mb6WV77SEV4tbAhtng5jgjda8kNecCbynyA7+Oh
         LbZnE56hD8rIk24LZaMGGoYoK+rPKEiZcApdMAYrzjga+t5Ug/rJ2OtRCu/Fw+EOQFKc
         /BAawiz83nUThe8EiTxTggLiMMltpJBG2vPFnAWzNINNcysLZFy2ab3xClKFD/JOpPfb
         vMjGxP0JgxY6ctSveSyW8VtRDvDN8+lbVctOHKaV9IyZQZK6WOFJ92GjM34A9sP38bp7
         3BYg==
X-Gm-Message-State: AC+VfDzSBr6NZ27CsUffAWR0VOdjAQmbuAGepi51+AgDtxShsIwsNLDP
	MZyxOHpcyklW/qX6HrJu+3mNdUVQ49CrDwMVDIQ=
X-Google-Smtp-Source: ACHHUZ6eV+pEfFSKP/KS+d2MKziCgeJ6w+giRVIc3AAD8QKx48ZwZORmhlLc7aiho9jqbCIc782uPLhUK/fLr4kXdXs=
X-Received: by 2002:ad4:5dec:0:b0:621:41f6:1f7b with SMTP id
 jn12-20020ad45dec000000b0062141f61f7bmr1933287qvb.7.1683648578746; Tue, 09
 May 2023 09:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230509160016.1074446-1-shenwei.wang@nxp.com>
In-Reply-To: <20230509160016.1074446-1-shenwei.wang@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 May 2023 19:09:02 +0300
Message-ID: <CAHp75VdodcyQH+O3Pqa57KrJCsFytQDbz-nqoWbZ0727L+wXjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mxc: use platform_get_irq_optional() to
 avoid an error message
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-imx@nxp.com, Fugang Duan <fugang.duan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 7:00=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> From: Fugang Duan <fugang.duan@nxp.com>
>
> Use platform_get_irq_optional() to avoid an error message for the
> optional irq.

Looking into the code more, this won't happen as the first operation
is to check how many IRQs the device already has. So, you may go
further and kill that irq_count variable completely with your
suggestion.

> Restructuring the codes to ask for the first mandatory IRQ before
> the optional one.
>
> Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to plat=
form_get_irq*()")

Hmm...
With the above, the proposed change does not fix anything, I believe.
And I'm not sure that this commit is what we want to actually fix.

--=20
With Best Regards,
Andy Shevchenko
