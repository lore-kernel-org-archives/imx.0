Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885F1E1A39
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729864397; cv=none; b=FHmdTXVKalZ3ZkROaszARIt6pdFuG6+1sSviUri9UItoYKs+OUsJAtCUexFoP2zzPL3DPYNjoL3iccTFy6UJCmezzqJAbndZc8VSfQvMhA6uzq812ylrL/rCJyBrb8A2riZj51hdnvCSKdUAOIs27bUEkfwEEL5mikmOY4br9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729864397; c=relaxed/simple;
	bh=dLnhZv36ldJad16CK8s2AbD04/f19Oaqvlhu+fewXbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gC4LWdLnYIHBSEVqxLxQK+GnNfg0NnfGZqjRRCfqHaZLU8mvY8YqvTVGpMkiSsCsON6syZjX54XKi7MmlQFJgUtNpmbzp5GHwqbW5o8VPUhaD2E5pMpw7Cw/31yW5AjpABw7/R6eHwuVrrJES643kOMd8E4PuRtzLwhgX5B5dI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db20e22c85so18243227b3.0
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729864392; x=1730469192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djva4KOP4v9Rg26S81bBmAQ/5dEE1/x6R+NZGGRbJmc=;
        b=TgjfTpJN0O2bPgsNlt5siGalJbhU93lfnz6p1HNV0d8t+NIuLk3fxwXc3Dq2BQF2SN
         vhrYL5ddgDOIiMBYjCbtJaq7rihMBfuNeStzGfJQucaSoCjYeJd77/HVCfHEuMJvGewI
         xV2bhBUqBya+Q9ukIhCK1c01JHIDYB2FKNpCpJGMBJGd+6T6AOHV0euSrhlmli94SSzu
         zgvnk8ZzWNRWOwX7uharYGbOjoMoRBCPyXPihmBvbazgaAfLYoqLXBDa+uNrtN7KC1gn
         HzTdls8/kZdWV9BuBodcU7usbfJbcsgLt1fnowhHmTz7tNkcMhAKbp0TATGASwcdL/Qd
         RktA==
X-Forwarded-Encrypted: i=1; AJvYcCWJDNput6itcs1w35EFgvfPvaPxGRccNCV72fbwQkh7Ne3rjmlYAWAyVTvS3lfYYhxpZtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YycsPvW7Hya+odn2gO3YqYzFZDvkvLN0bOm5aKrhL6JJqlVEdLN
	Fa1RCg+KEAkjnE03XglPtivuIqB93np5EqHkDl5yg5u23T2D4eISsFogJkZp
X-Google-Smtp-Source: AGHT+IG73YCK8kw/Gpv99SefTDUu2FBs1oZkQlHH4zcReNi9GrGn1EZ1Hip7pjUhoPL1cfbnhb8y+w==
X-Received: by 2002:a05:690c:f94:b0:6e3:21a9:d3c9 with SMTP id 00721157ae682-6e85814d4ffmr62221847b3.9.1729864392365;
        Fri, 25 Oct 2024 06:53:12 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c980dcsm2802467b3.128.2024.10.25.06.53.10
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 06:53:11 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e35f08e23eso20146887b3.2
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 06:53:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6Ub7+fTBwdpP6ws+TU/q4AvM0tA1fv1Tq2N7d7LY/jzM4bIuZJFDr2xy0ZX6I7Zq/ceU=@lists.linux.dev
X-Received: by 2002:a05:690c:6610:b0:6e2:1527:446b with SMTP id
 00721157ae682-6e85814e730mr59897987b3.3.1729864390657; Fri, 25 Oct 2024
 06:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023210313.1390767-1-Frank.Li@nxp.com>
In-Reply-To: <20241023210313.1390767-1-Frank.Li@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2024 15:52:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
Message-ID: <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix
 coexistence of output-low and output-high in GPIO
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Wed, Oct 23, 2024 at 11:07=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
> Fix the issue where both 'output-low' and 'output-high' exist under GPIO
> hog nodes  (rst_usb_hub_hog and sel_usb_hub_hog) when applying device
> tree overlays. Since /delete-property/ is not supported in the overlays,
> setting 'output-low' results in both properties being present. The
> workaround is to disable these hogs and create new ones with 'output-low'
> as needed.
>
> Fix below CHECK_DTBS warning:
> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb=
-hub-hog:
>    {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-high=
': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']}
>        is valid under each of {'required': ['output-low']}, {'required': =
['output-high']
>
> Fixes: 3f6fc30abebc ("arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR ov=
erlay")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Alex:
>         I have not hardware to run it. I check dtb output is correct.
> ---
>  .../imx8mn-tqma8mqnl-mba8mx-usbotg.dtso       | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg=
.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> index 96db07fc9bece..1f2a0fe70a0a2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> @@ -29,12 +29,37 @@ usb_dr_connector: endpoint {
>         };
>  };
>
> +/*
> + * rst_usb_hub_hog and sel_usb_hub_hog have property 'output-high',
> + * dt overlay don't support /delete-property/. Both 'output-low' and
> + * 'output-high' will be exist under hog nodes if overlay file set
> + * 'output-low'. Workaround is disable these hog and create new hog with
> + * 'output-low'.
> + */
> +
>  &rst_usb_hub_hog {
> -       output-low;
> +       status =3D "disabled";
> +};
> +
> +&expander0 {
> +       rst-usb-low-hub-hog {
> +               gpio-hog;
> +               gpios =3D <13 0>;
> +               output-low;
> +               line-name =3D "RST_USB_HUB#";
> +       };
>  };
>
>  &sel_usb_hub_hog {
> -       output-low;
> +       status =3D "disabled";
> +};
> +
> +&gpio2 {
> +       sel-usb-low-hub-hog {
> +               gpio-hog;
> +               gpios =3D <1 GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
>  };
>
>  &usbotg1 {

Note that after this, there is still

    /delete-property/ disable-over-current;

left, which does not actually remove the property.

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
