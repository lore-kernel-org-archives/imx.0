Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C7643E9C9
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566311; cv=pass; b=J3b7CL5zg/SHLCNc4BT3QSvoMtYv9cwqSl4jE6Tl3gBSuFtstNtZotKc2L2rmSneraoOM+bLLkB5Mo5SGUlWPsCc8ocD4hZ/RHtreSSdU7f5d8G2XKcP56QJgpq6wjcdEBSbFnqzI03+5g7n8MxL+UO4KE47pkbI2mcgfrm2oss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566311; c=relaxed/simple;
	bh=h//PlCpI0ud1F5KsjJcqmQMXG40LlSIcqpcNuGnT1H4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCEaQ2W8g+Fv22574ENTHxxy0AL1NZPe2HocYfLW7Zd98VuFLm1Cm+Ab5xA3T/dygTiKX05o6GSdSOCFTrpn570t3tKSLBSyl0ju9tTtKS1tmwTALnG4BvhKb/1v3a+EW98qsj5HE/Jh29iYy4FcbX5yl+4qBf/68NSoUNtM0qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CT4Pic14; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CT4Pic14"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so19362818a12.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566308; cv=none;
        d=google.com; s=arc-20260327;
        b=B4q46IwaPZFw47jrK6SMAd/amcF0piuBVIdef+G3n0uum052PJoeqFMt5BnDolK2oX
         TTS1tuKX8i9YcedStC6xiFh2zptd3dy0tHzgGpMmQWc35aAgr02FiTGfAiF6hGmxegrJ
         VSbMZE3KHNNY7GKmJjvWf09I19z39+7J85qNCi4tB2j42P2mvPpKwkeu+twog2mzlKC2
         ljGFEvk+/qxgnURGPPxOVngkGZ0aKWDTlsKKJu7mh4WxOBLahS5Nv547ZW0v7WbY+Cax
         K6pkBBAG8ETfOC/shm/Ue8eUF9L3B+OTyUqg1iov/nvxye6o/gVPF7QHZLLubCDmUssu
         Z0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        fh=xQNRJObDlNbg45EwJ8fXHZdts7jNeZyvODb2vSO1JBU=;
        b=UWTJhKUWXwZ8mVq27JT7BvrM6uHcGdEx5uAqF2yhB0jbUEiIujz2pfWuaJfLpg2EaL
         8YRZg5Twzia1g0+671CAs2rom8LyCgm+3mCxOJ4mZcFpE0dg33dX4UtYL5bT5qNrslY2
         5Z1ZoUqyJCK48of4ZJnzRI3sNuvGSeBKiyDN9XlpHAjPS9/yLyEZFhy+Jr/sNNQEaWbG
         dVGREZQNQ7asyr8sUv6h1ZEU6TNtzU0qbF/GMu7YLM2GAK9Goc0xe5HeZhsVLeIpchqN
         nocSlZbSvzDaU1jDKohc2ei10zaEQiVhaz3LCMtaxOb3+aFmkHxH5aHuNSr9Cy+v5Hqt
         H5RA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566308; x=1785171108; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        b=CT4Pic140GKHNzB2m5HqIVr4N2+5CMn2HZV2ID0/M6zGJbTcalnzFRolpYpHpn7w1f
         kC9jeApjVGgbT5IxjjzlGfCESg8DRmKwFYr/Y/k+mbqzTASvxxWGooSM+f84wwvPp1NQ
         ipyfHezCFxpEPbYYrDD4WJMJhHe1B3j1KgtzpUyCCm06FTBjwHMNzatpTpbLs3Qj0N1n
         /6AfNdgRyBl3bDaFuOlTSBIgytOkwsX496rot2Ytau0nuy3JkSTXWcmCmkA8g60Hlibk
         V+P7/CPqDghwBTWOyG6dxsZ+oytLLdcMbGIeNhCWPRBMCctO39lWzrOWT2/j5PC+M//u
         nKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566308; x=1785171108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        b=i7ZeP7siTK3UzUT1EdICpGrBPIsFv91wZ1OApnG8ZUZe3GsutxzJvOr/NcU9qdfk2F
         Onmhd2zW3K9zpRwY7lH9mV95sFwz3k1r5/FQ22PB5LAFEzl3DQxzz1zEwlncn9yPHiY1
         tOy/MHRFy3lewEI4n0je0HjMcNzmmSTpplpJTzSWU0oUP4hZ+M+hfQa/nWxAjRMq/Eue
         J1yj7xXQ+qkZ7xe8aILYIHkwjMgNNwg/qQFA0Sj1HT7NydDCPckdAtJyMDV3EE9M6A0H
         +BMQMnXLT1sdGgxtAxdjrCSJBSMNvN/ywvvctvCPKj1xmVtOyNjiDlfWkrEdLyLALKbq
         7F7w==
X-Forwarded-Encrypted: i=1; AHgh+RqH1Z79sGj0bAmpLmqJIyc+Aep44SDUH8Q9BlD3T6v+tVO6Zbfh9ddm+tmpiszoz+tBio8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeeE1rsPfoOSyDCz/b6LRpyj0U7ap7CZ+5uQtRtvtCyCBqoI6G
	FEIRlj20PY4PP9oZUNOQqp278s4dIvxF7oxZaJQLlzvVbIWgB9hyd8W/yjMojpSxKQHVsijzeAJ
	0JUZo8nMOJlR0QHS+nTRYhPKkuV9b68BUBfixoH0J
X-Gm-Gg: AfdE7cnKGsU8IkUrvce1T+iFRp+UYxbNGAE6jQYIzwG5LtoEzSk3DhDSGcuwzQHQJrp
	tSOSRWkEHTkimWHMQTHtxSNlAaVmvwoB5AgYmLjrj7ciTKX2fyLFEiKEC3Se/iO8QXyK+7xsCPQ
	zJzxD25QPg9Tu5zwXroxPAdfVHjDKuegs2rxY+EXtx5DYl4i8YMmqIkzWPYWWDtl5zx5EuIOSGN
	0TnQsexIHhaeWVT7Ieg8fJadIHkIHYW51oicwEYdcvLqWMTR/fJRbK7shDhLwrbs9livNInTR2U
	K/UwyDsyxqEBHYZxWcPiE4QF/Jvhn9vXBFo4zsikMKjkqFZLtIlYTU3i8BNC6xwsed1B+jEFR6s
	j
X-Received: by 2002:a17:906:ef02:b0:c16:5e73:b3e3 with SMTP id
 a640c23a62f3a-c16b46b6f5fmr615505966b.7.1784566307098; Mon, 20 Jul 2026
 09:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717141648.1007059-1-linux@yoavmoshe.com> <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
In-Reply-To: <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:51:35 -0700
X-Gm-Features: AUfX_myHGrPuTu_ujS6tW3mC0SHvE_GdWe_YqayLYt46d3sdd9_DfoxWORNfKQw
Message-ID: <CAKwvOdn5xgtqv9NvMew0yBnH5E0xQMLaX+Z=bX3L_a9_K5orHQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 9:49=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jul 17, 2026 at 7:17=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com>=
 wrote:
> >
> > Relocated suspend code in OCRAM lacks compiler-generated CFI type
> > signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> > imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
> >
> > Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
> > for this specific indirect call.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
>
> Thanks for the patch.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Ah, looks like I'm reviewing v1, but there's already been a v2 and v3.
Disregard.

>
> > ---
> > Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> > Before this patch, suspending the device caused an immediate silent
> > hang requiring a hard-reboot. With this patch applied, suspend and
> > resume work successfully.
> >
> >  arch/arm/mach-imx/pm-imx6.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> > index a671ca498..d9b0c1803 100644
> > --- a/arch/arm/mach-imx/pm-imx6.c
> > +++ b/arch/arm/mach-imx/pm-imx6.c
> > @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
> >         return 0;
> >  }
> >
> > -static int imx6q_suspend_finish(unsigned long val)
> > +static int __nocfi imx6q_suspend_finish(unsigned long val)
> >  {
> >         if (!imx6_suspend_in_ocram_fn) {
> >                 cpu_do_idle();
> > --
> > 2.55.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
