Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E1A2EF641
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807865; cv=none; b=WsdA8wFHapRAkfRaXL6xwz6oVabsnUpDCBrrFRldW196KnzuZ1rk1A0obxEOsqgKptAQ8SSNiaNem7jSdoeId5oOisiJ65u3YJqCf2jDxjioUSm91s8gZtw55M1stRK2LsCAnKvEEm1bK+KOhmDrPTKadZHGFsYWaNuIxkE2yLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807865; c=relaxed/simple;
	bh=f4FSCQOOsa/4OCBJBGTowZPZFe3uwXyHE8EAIbJ1KzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZHGNoXyWgQJ9iZ9We3iT+ofqyNhIkbZd/iw3vk2Icbk4/Yy5AHTjIuaCNm32swmdQ/zkckhIbghPGFYzXWPoBKybCHjAr9s8PU6AkB4nm4m8IYGJlek44SxM/yCzuBN3qunkJzUBSGO3Qxw8bqySZHsqYpLyJg5gY8VVvyR2hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEFOObV7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEFOObV7"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5607a240c75so1697371e87.2
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807862; x=1757412662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=FEFOObV7W6c0naNQYJZ+4dKaJr4kRLnnrew/1+1WfKm9cgiTr//7kJj2V6C8hVldvh
         I37p3drwkzoDW9gQf5QHxLbClYBOs5wDOOSShSC+4s+5KU1TpG+X6YVBibdftZiusd22
         inZx4KExSbYofxyvCC/kQDBFhmE0LJqsD/63m/VFLHb45lwf+7YJmpF4/a/cRQXQIMXF
         8h0JwkTAOLbFM1yrIg3pqwejPwXruGNf6l+6C9St2oPpIDPQfdWyGh/kcCFxsVYX+d/4
         PgLEvFpjIN2AHIcJV74xUvPjPGyUsCD/pcFONOolgE+qgCPE6yoaTeEhaEDxtN9S77Gv
         n/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807862; x=1757412662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=bBsRWgcE1Fk39PG/XSI7jVI0cQyIiLzRUNpt1IJt89PPI5ReieFdydUxxUQqqaJ7bD
         IzNjhwQ7iaTljU1lNOSMBhqns3eyJLOiUI2zOblhqROUxn6yFoc58WNfGof8XNhHj3Un
         AWD8VcdRK2V9Xi0Lz1B3frbovLW9zVT1v6+rYKfWlF2Lh90PzihiPmBpNFpa6yX63OT4
         pAftRZCg98o4mO6DdrGoEuRADtAWHcvJKwrq2sh7tkmVMZVPzHb+iOxXimozKkHjWx+F
         cDkPhT/+OT9q6/AZYEotJ94Q2hCEe41zSonXs8NGH2wRajw6etKdTR+cjIdx/phh1EEY
         WCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcpUA83XRtsEUzQ/ysJfS5ZJwZY4I/2Bc+TQkBKyJV/R5bJrKE2leY22CDIWvvCByYLes=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4fktKtUHWLERKXgG/GXtRc8+UWX+EnMw61jfxQmmiAbY8GQmV
	2eSCDwTO46bJhyEDHk6o/cwOK1YqrRpq/BYvDIIsxDuRnvURa9MhXJz6yxCvLVymorPNJHqDVEA
	/BcpE7dl47SSboaA9YLLRus0hscaGc2s+1cYiusCO2g==
X-Gm-Gg: ASbGncsTYTJjAv+rXEUBBXHRnM6/LeKDEjA1ei1LLtwabS4DufQMUP98IFXgcHTxOps
	5EaLNdw4xrtCSY1iiBtgQz6u83mMy6CEhV3Ol8PJDk21kbUdMeqoEL2wYMBFYXkBiRcwv1TmVXP
	Pe+WZeFm4ic8/T8beWaNPREpw1aaiUtpE7OMFxNDvWmOzccwal+KiRQzHzmeQdBqsBuSBHDJLYe
	ZZbEPU=
X-Google-Smtp-Source: AGHT+IGvJOVNe+LUFvOCbgL5wgN/h/Cjvl043KlTfsb1COy3EuiSQw/TerVuRTUEwrGuUBs+VE/GG3RycL486iAnqi4=
X-Received: by 2002:a05:6512:250d:b0:55f:34e8:b1a4 with SMTP id
 2adb3069b0e04-55f709dda1amr3184317e87.56.1756807861583; Tue, 02 Sep 2025
 03:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk> <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Sep 2025 12:10:50 +0200
X-Gm-Features: Ac12FXw4LKCvHHNtKGBjLfwABtGCHq93WPj_v3YPD6EUsw9OMGyVKBEoUj5pgYE
Message-ID: <CACRpkdbrRc6E5idzkdN53QPDCSGpPUfdjmFmEFsS3g+v=cB6LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 9:22=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
> >
> > > That's not a lot of info but it fails in strcmp() which - I suppose -
> > > is the one in pinmux_func_name_to_selector(). Any chance you could
> > > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > > Is it NULL for some reason?
> >
> > [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
> >
> > https://lava.sirena.org.uk/scheduler/job/1758947#L705
>
> Linus,
>
> FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
> be able to debug it and figure it out shortly.

Awesome, thanks a lot for your perseverance on this important
patch series.

Linus
