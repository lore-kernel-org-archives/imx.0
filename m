Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B02E88A6
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756846019; cv=none; b=TBXGnhLilIotQ22vx5cJsbg8GFnWSw3bVo5TZz/jOJsQqMXw4PuFaAYngBkH8WDeNptrSXVR3vqHtjuqQspNTzzDV6wfaWJk0m/V6uwR5/udBway5VBcn+DFyM8j33R9z+4yKVR+acYGtbcIcei48O6/+Iw1Y5CsJQu3lFDp/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756846019; c=relaxed/simple;
	bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tD/zGOm7wTN3yX18PtFZQE8MTcyJ8nRIWw+T7p0rB1ylEs8p4IgQ10/Pfod/FM3eG5RtETEdNtcyzOWpLOPkvi6/zFJMcD2wILnmp7ARKsL2fnq8MBIVcATqLasXjuTf8/l0d2BmbcCWP2RKKTTBnYfNY8mG/3h+f23Lst84ddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQmkAWO7; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQmkAWO7"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b042cc39551so376150566b.0
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756846015; x=1757450815; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
        b=NQmkAWO78gbGShHSz9SDkvIJbDXp+tg3pBLxgMPpJLbZANrreXtzgG+SHKC/a5h47Z
         1TJrTMQ242N4oRuFlV0+4DLerS9jMtRLFdxaxzkcfCwJuItJBrIxmJMB5GKCOPDe7T6e
         1iWBAkkG8C93m854Mkzay25FyxiKy9qtzqgFeZKMDpBAdDNKI0uRsavp5JlWhsXRDvgT
         i3jky4Y7InaEikJW3dJeGh3+StYwmqrE9jiDUWrqfBYEuQHSWQFkbzy0aLlCi8Q7915f
         EBzffF1O8KebYBKmIS5S6+ZFeD2btRaOp/upXCNhPVfXmxzQJXhSsQ4uo/5b8ALdR/dZ
         WU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756846015; x=1757450815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
        b=kHg25macaX4fU4WFhRFTpaMQevoDSnLYybsuZzeUK2CYKhp+H+LtOIMspABp2SeGeL
         T97YqCz98YRhWt49WFEY560ncoQ17wNVOoLcsX2huAvYonNudAHEE5+tRqSsBIJRSkIQ
         7HInxV9SKnK1wC54kwXspxkOKHY1L8cesswTSKRKiPYhQEcOIxxZCe4KKKcOQYzt2Zny
         SuOapVwnKHc9U/hkQjUiMKsAV4i0oQVY4aScJt0G/ySpW08t0XTWau2iph9PGiozlK52
         bhS7VVESaCLN1yTRzYgwL7lIQBJnLAq+x3oK//766bsjHhgQ3SOtxEGUuXO1fTXGbGKT
         7JSw==
X-Forwarded-Encrypted: i=1; AJvYcCXPRb7oP69+7dwkQD6w+aviDTVa06/ACcAzQ9Rs/h1kJ0IPeLtWwBavi3rlCv8M+9AGMuA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoVuJ3eJrjzJ32xJ8PcXHVOtodYJUOtf/mKevVrYTMUAhCJVUZ
	6PZ4scjnioycaaWWNT0YXKwcZlsBlizOanV9uASZDt75yeXgP0u8uO4GDanmjyQJqJLtC4RHPtd
	AyKXab0doGPZXXFReWxhhnF27es6Y0R0=
X-Gm-Gg: ASbGncuZy4AAlBIR773OclrkI9GNCUY3jndxjTr7SZhojIZ3F4nNYBeaDRFzFzSJOPM
	ZQm99KoTTePlLKAdm/qJlS4JwBsGLgIW+2DpAjSH9jBCYcnJIJ0vhx/PS0lEclYgY7XBCMjipQB
	1bi7gtkGIXjvyVw9jcWd6CRShLIkdad1/7h+sHfXiG1UaR20qrO5aMx3ySe8LOrMSYd7jhkBLet
	dtsfKc86UX31HxSqA==
X-Google-Smtp-Source: AGHT+IG4zlhdZMe5YSuufGeqwlIQK8acaeuuvg5xL+VVOl3StpGEjjD0yfcY2w04cC3rT7k1Cl4bbDXfAthjT80xlmI=
X-Received: by 2002:a17:906:4fca:b0:b04:6546:347e with SMTP id
 a640c23a62f3a-b0465463a5bmr50237566b.51.1756846015338; Tue, 02 Sep 2025
 13:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
In-Reply-To: <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Sep 2025 23:46:18 +0300
X-Gm-Features: Ac12FXzQiEATdvX4DXbIt31zcGrGliq36XoLvlgsSrCLd-DIw99Mu03fZo98CMc
Message-ID: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The strict flag in struct pinmux_ops disallows the usage of the same =
pin
> > > as a GPIO and for another function. Without it, a rouge user-space
> > > process with enough privileges (or even a buggy driver) can request a
> > > used pin as GPIO and drive it, potentially confusing devices or even
> > > crashing the system. Set it globally for all pinctrl-msm users.
> >
> > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism to =
work?
>
> What even is the "generic recovery mechanism"? That's the first time
> I'm hearing this name.

"I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=B2=
C keyword).

--=20
With Best Regards,
Andy Shevchenko
