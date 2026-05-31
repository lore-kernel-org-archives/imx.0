Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582837FF43
	for <imx@lists.linux.dev>; Sun, 31 May 2026 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780214440; cv=pass; b=M5FZwwXC1MUYxTra/Kt8zIHGZGBVrMi0hAZWpwbMVIJ5GEplsw3Cn6g2cU8WLuuK3hN2diYQR2ZhR1znN/9/NtkRZDrfqkajEolo3ech5ZQHKDyOdve4peDCOQabtu02WvfK1gPqfPSWp2fNuqreS9+5ypX0qF4V67R0EXQPmH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780214440; c=relaxed/simple;
	bh=5EOku21r4shcDKnfEd+sX/o8iz8eGlTM8QXuTu8JouA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLxE//PNcWRWjuKClCmxoY0Js705JSbw3WQ66yy6B+gMHl2q/J36PnKEB1Cl+t9wo0KdS4/nkqV7OHTn+4CdeG84/0pJQOsYZ7PVycrYHpXiFG7I7jBN+8bAdJIYENLjtrpr6kvLEydUMdNBZeokVEUTE/7tJyBOzbBXY7E0wDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDovvP3h; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDovvP3h"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bed19623d6eso1223966b.1
        for <imx@lists.linux.dev>; Sun, 31 May 2026 01:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780214433; cv=none;
        d=google.com; s=arc-20240605;
        b=fmFdlLxO/4TYi+0pxYMjac7iMSTjnGSx7JDjOq1J5H4DNTJt/f87iGx5pLun/rkZ+Y
         esB/nfOGLyM2Z70PUB/1DcNIX6/sE1yikUJEao3ibaMVy2Kz8hdfGQvUIocwSegCUUzA
         Bb5LltLi3AQp7kuf2sXE3vqZkQ8zx9xWeWk4pzdoDr1uIAYeox0BlBW3KKvYL8P/vCr/
         mV9T3ogH7lpwwBG003o4G4hK+o7AJPGiOGvaxZ8VWZAHim6kYogqVMjoUKiplEGVM06f
         HMilO1sh21pIBwcyTJxge2ULHHQNcgKFcWqLTEQ71jyMyvsGKQVcHfH5hEPCNKxExLA9
         ym9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nildDfl0lwt1rEp0UvoHwGy0UqbjD9j3If0RBiN1My8=;
        fh=zd/nCKcHKnvhMBCKD02lp2gzvk+e+28pxmiDazSFa6o=;
        b=SvdH2KSkcPqjRkGSiasN+RiymkRYmZEIz8gHEo5boEMDGUr9r8uEDI8s27gHmFW1Yk
         F3HG5vgsGLnRPSsy9csU5qE6f2qkBqnUGLroi3tFMunj2np0O9Wd9F2s15iOWwRXihdh
         vV46O4dOxRRH61s+1MNlWxFZbDOrQ5kz5fuJDrDMpenPJEXxpoKl2qICfVmK1MDG4wUR
         Yj9b5KY6M/Fl6bFFPTsmPOYl5LIhjcP3QAqRfAyqfWH8kImxxsnkoVKo43QpRdT4H8pZ
         DrBLluwCxKQ3weILI55c7GEZ8+5l1aBwoiKX9IhglracUp+ZMrqasb1adNJY7nbzBX1U
         9aNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780214433; x=1780819233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nildDfl0lwt1rEp0UvoHwGy0UqbjD9j3If0RBiN1My8=;
        b=EDovvP3h+I7L8C3Er4LHBGkvj/Wj5jpTFy410y/wvWDQr6NrDWUjkwuxzFr96P3YDb
         ayB5vPPUh8ZU14EVn7Wh5ef47aQU0VKRsbn5gjHotpY6WtnmHmQg4AJ4J/bETifYBRyU
         RIkNlz8rte9T2iFeu8asdlKjIV+z7cPWmgCPO5wpjBQAmDYd3OvdycANXhUtkZYwaCy6
         Yb439vvo5mt6sgmnF9nlkBNHR9hybE/VDNFtaC1sblPudrPu0pLR0V6J+xZUijdhjPpr
         FLRcjpDOZGIsOB8g+qW/MNB5ptOeIErmpohLtt49v39Xt6p9WV2eAwrqP4Xhuf8y4xRv
         U1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780214433; x=1780819233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nildDfl0lwt1rEp0UvoHwGy0UqbjD9j3If0RBiN1My8=;
        b=CtkwCOUfnahIDKi1+grwjXbIFyjumAZinBhQYNydd4WBOInNZfFwoU/MoKcVkgOBfV
         HOHuDTvRxxU7TpKr7Mj26AWHTWFGnEyPUkUBbagVK8JFL+VUl04cC3Fci5WLjtgNp/TD
         Y2b/KUmm5/oAeQ5suSFCdXMWGvDAoup5hImpbT+xrPFlMqoJGEgKDT9Om1VC6mDKcZsR
         yw1vrJnlZxptstZ87Cr2k3yAFnO04l3zGp1REhfy8doN+xQ60S60fyfwolXTXsUKP71a
         c5o3sA4JRg+x/MuL7pUCOO8klUpVOBBrNB3VBTcjPsMP1uQxTMfxNr7OKsm74n/uedmF
         ybjg==
X-Forwarded-Encrypted: i=1; AFNElJ8fJEK0/KXT2YPMKuvEd3wnSi+UISBriZASaTlLOLQF6VPOaGXd3Z872Ji6iszgjcroUew=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR43w0dZYhiV7chLuYCxZW0axKoGEZVdB61nJG38eG0yXxqh25
	SNuIhtA6rjd7EfgOF4B/7/qSsEQip/8UM1wllYiIZUKidl7PsVgTREeHHLubZU+qPIqPdv5nn4N
	/I0rxZuLEuLeMKFCoSsZf/WRxQVDreJw=
X-Gm-Gg: Acq92OG0zsDgBLNnb/FeZ7bfe6huhaE0oUBh76WUxfLAed9iaW7kbFcGIhCEQeUEIdj
	aIq7EEhnhKe/zlXGJLaTWX21LhQ8RUfzjnZATRhAHSOGqhYF3RJF6UA0mCthvW9o4iJ7ek/g8lE
	0pqw2Lbm0nn3A1/5rNb2RLTp2A6XSNkT6Yg3G02NSEIbk0Grpva8lDSVRodivhbVXZI/7DgffYK
	RAQTcEUYKaZhGAf/RcHcB1lPoVGrtnOSU2sM19zNlewofw3YSWq3O2kezjHyLaD0L+1fL2x+Fal
	Q2agL8V147y9kccugzQvQ/4q8nR3Y9UEZj+nL8GD8QkVBiHu1NmSvJIoFEvnTWZNn5f1BkkoG/q
	5goWs4NIyWhNDZX8BZBEVxq9hdSKb5lDq+SqNKajaky/IsmVfamNsJal4n9LNbiThzr1Y
X-Received: by 2002:a17:907:c07:b0:bd5:1576:dc7d with SMTP id
 a640c23a62f3a-beab3452ff3mr329934466b.36.1780214432977; Sun, 31 May 2026
 01:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530195525.5059-1-rosenp@gmail.com> <2026053127-nastily-fool-88eb@gregkh>
In-Reply-To: <2026053127-nastily-fool-88eb@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 31 May 2026 01:00:21 -0700
X-Gm-Features: AVHnY4LlC_u5ovIg85l_0nDDUJ11KqTPCviOKI2YGvc9iXS0Genvxl2UzGnGAVE
Message-ID: <CAKxU2N8bNT+irM-gOk9SM5DHPbcbh7zvNM7n4wF5+q4TSEMkSA@mail.gmail.com>
Subject: Re: [PATCHv2] serial: mxs-auart: fix probe error paths and clock handling
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 12:52=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, May 30, 2026 at 12:55:03PM -0700, Rosen Penev wrote:
> > Sashiko reported three pre-existing bugs in the mxs-auart driver:
> >
> > - For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
> >   prepared/enabled it, leaving register accesses in probe at risk of
> >   faulting if the bootloader had gated the clock.
> > - The error path and remove function used pdev->id instead of
> >   s->port.line to clear the auart_port[] slot.  For DT-probed devices
> >   pdev->id is -1, causing an out-of-bounds write and leaving a dangling
> >   pointer in the array.
> > - The probe error path called iounmap() while the IRQ was still
> >   registered. An interrupt during that window would dereference the
> >   unmapped membase.
>
> This should still be broken up into smaller pieces, don't you think?
>
> Whenever you have to list the different things you do in a patch, that's
> a huge hint to do so.
I'll do so. Although I doubt the bot will be happy either way.
>
> thanks,
>
> greg k-h
