Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38451FDA84;
	Mon, 27 Jan 2025 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985538; cv=none; b=pDbjfWSZzV6THMJX0kOLnPWJFZ028GsZKemMBO2lewm7WrJYt1Birec71WIhYiz0KebRX3iDoVlBjTCqd+UZSvvH7oPjwWwKgaTLSN0ncO2ImmQMP+FgXae2OiTUD7/UJ7xNfbryIuMtZZobZnbmnDek8DGtoRvp/GnH22tnhOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985538; c=relaxed/simple;
	bh=Vori4fip27Sc4/LH5rLLdMAGOebUrJz0cFz2ndYAD/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceI8gyIJLRi88OcKm2T1TlaE+6VbjMvK6i/9AUqgWdwXcGjiudBCNyknWPt1O9F8vMhLcGv1ZBNigxYVTvq/mPjCEjdfMj+h7zD8sch8XmLkeHasCv6sCV0Yp7n8sXI31j7npmIKqXcTvIU12c7J8qSvcszRNxbLiMVChBIl7/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51cee9d5013so2812455e0c.3;
        Mon, 27 Jan 2025 05:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985533; x=1738590333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezeJexvLdIAOyqaTRkV2GqCEVD2bATElU5AWxdy7c60=;
        b=Hc0UV1x6ImeSHeLWZww0dk7L26spmlBw10YcrmmEnR1f60aOvPpDsGFYUbHi404tg5
         yN30G8G96Q7Zt18iFF7vtRkVOJ9vafLWN6+8OkZD1HnRLZr6HhN5al8yas1zMABICsDp
         GYUDq+UVO+wcNgpszz2T5QtMxb/AjLeOKzLfLuQRaT7WwYxe5bzcHtt+DzjxamHsGdkr
         w3I657WqamnkLJSFHC5AxhcoITCVwXFIyDApS0kpAFermgXjFXpy6ySJZBKRXeilRUZ8
         FnEuHz60bp911jdUa5uFPjsWDKzHi3yGGDx05xxVe3CfaMX6WPI5AX/pzpT6GALc2DBZ
         TCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlDFdLOusLuH1hpJFj31+Avp8PlJLstAhd8ZhduKdm9PEK+BBX81l+RI4CTbU28XLjijekEJ5L7s4Rcus=@lists.linux.dev, AJvYcCX1cm1g3YUgZZI2w98pZXIFN3aJErZuIDzvNuGS5RspXqJS1hCr8Bt718+59vA5Zj+x80o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKHmGhu/VU/6O/Fwnm5RswMOWUp5NDqJ7cd6NPIMm38MY9jtDT
	nR6UlXxKmkfkdHDeDXN5/0qU6rv7hH6ywjYyB/4G+dnrwh8m/6kXzdI9GgCU8j4=
X-Gm-Gg: ASbGnct/Oi9whCMHUFQOWpwZYP/hTxgC0mivi9qdZm5hclReLNIybS9AOVnWWfThUZn
	wZYivHCltcBZZw+ETf8oLxR52p9yOKULC8SLu2JZTK9nnGPCtllnFuzLotDumveResXzVcmSkn2
	q4tFv9KrUz725prbpu6kj5zBMx4XEkm7X3RVF3PhLKH8B5BPgiN1nK4HoOrHpJ3g9mEyuQMWo85
	TUlTlz3jkHeM5VsoWUgSOwTINp2mvka5uMUsf7bHWSExcnzJtrclu34XCigAcD6nscsI2ohWKH3
	VNVWOpqE1mMQenbmPBLAPCLZO3xLEbFzhQjb7n8VSvI=
X-Google-Smtp-Source: AGHT+IEAqDoDue/OWPgb43aMMB7YwFQBeUQ3IwmpBcgIbUnOxmGrczjO5Tj01b7i75MeYMNb/zBqWw==
X-Received: by 2002:a05:6122:885:b0:515:f586:5298 with SMTP id 71dfb90a1353d-51d5b2cbc82mr35203996e0c.7.1737985533029;
        Mon, 27 Jan 2025 05:45:33 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebbde5asm1415457e0c.31.2025.01.27.05.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:45:32 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso3734981137.0;
        Mon, 27 Jan 2025 05:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdOCZvJJ1w0qLpLJ2ld3e5DgDxDwmEsVP+XDW2WcDpP/Z+nkNbnRX7BugF86fxtRgcRjg=@lists.linux.dev, AJvYcCVkaUiaUwTswDDObrBOqL7vVRgS7qbRDCzKCJjwiJRr2SYfErTx0ktHZw31UJ98NgxjW/+ONAaHFcEL0ho=@lists.linux.dev
X-Received: by 2002:a05:6102:a4a:b0:4b1:1b07:f7c3 with SMTP id
 ada2fe7eead31-4b690c77e0dmr34279786137.20.1737985531453; Mon, 27 Jan 2025
 05:45:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com> <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 14:45:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
X-Gm-Features: AWEUYZlEDDkC64B3GghXYxN7ZaYz24mUqfziFlSmlvrKqtJLvKHGpws7NZJvNqU
Message-ID: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
Subject: Re: [PATCH RFC 14/14] ahci: sata_rcar: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raphael,

On Mon, 27 Jan 2025 at 13:46, Raphael Gallais-Pou <rgallaispou@gmail.com> w=
rote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks for your patch!

The subsystem prefix is "ata", not "ahci" (not all ATA-drivers are
AHCI-drivers).

> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -927,7 +927,6 @@ static void sata_rcar_remove(struct platform_device *=
pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int sata_rcar_suspend(struct device *dev)
>  {
>         struct ata_host *host =3D dev_get_drvdata(dev);
> @@ -1005,7 +1004,6 @@ static const struct dev_pm_ops sata_rcar_pm_ops =3D=
 {
>         .poweroff       =3D sata_rcar_suspend,
>         .restore        =3D sata_rcar_restore,
>  };
> -#endif

If CONFIG_PM_SLEEP is disabled (e.g. m68k allyesconfig):

    drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_suspend=E2=80=
=99:
    drivers/ata/sata_rcar.c:936:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98sata_rca=
r_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
      936 |         ata_host_suspend(host, PMSG_SUSPEND);
          |         ^~~~~~~~~~~~~~~~
          |         sata_rcar_suspend
    drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_resume=E2=80=99=
:
    drivers/ata/sata_rcar.c:973:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_rcar=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
      973 |         ata_host_resume(host);
          |         ^~~~~~~~~~~~~~~
          |         sata_rcar_resume

>
>  static struct platform_driver sata_rcar_driver =3D {
>         .probe          =3D sata_rcar_probe,
> @@ -1013,9 +1011,7 @@ static struct platform_driver sata_rcar_driver =3D =
{
>         .driver =3D {
>                 .name           =3D DRV_NAME,
>                 .of_match_table =3D sata_rcar_match,
> -#ifdef CONFIG_PM_SLEEP
> -               .pm             =3D &sata_rcar_pm_ops,
> -#endif
> +               .pm             =3D pm_sleep_ptr(&sata_rcar_pm_ops),
>         },
>  };

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
