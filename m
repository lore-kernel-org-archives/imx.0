Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518AB2DFA39
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821763; cv=none; b=SEr0TzfHyMOVJbDsMQMKpScHybue6RxwS/osugNiNwKqhDuG88jNiAKlMbUEjfYzXXBuO0v8XtddZqYPgZUKjpTh5hIYb5p9GGjeumHkjxnIqucOccKhV9ID93LdVMWlW4ol/bk9L8mRhxgOpgAamdjIRhTmJHmc9TuJxbuyiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821763; c=relaxed/simple;
	bh=t6qJ4Krbe8Eig8u7HuRNaH82OJCGzRpxUAzmtO7ZEgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzPQRPt65w+Ne7RAtCGLTY6kz1dw9TogK/z8VOUjC+Fjtm5P6UAmEuTNu6spsSdDrivAcE/tH1FTdhvPlNgHD3SdLUwI5HVHnW4N4kmrrW0rRXsKgu8KKGfW1UyR07GZjRKVtW9idlcU/zka5N/x6k0FPnPnK6Gvu3Ultb+WwHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ddoy/0Qz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ddoy/0Qz"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5607c2f1598so1694176e87.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756821759; x=1757426559; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6qJ4Krbe8Eig8u7HuRNaH82OJCGzRpxUAzmtO7ZEgM=;
        b=ddoy/0Qz4knBuW7yr7aRNZSzf3xvJJJ3Vq8P3djFZC+TXd9jRNcWrb8BD4sN9NiVJe
         5m93LnmKlkQxDQ73HyT7mBtDg4+LYsehITbvCt8C3zVmK7e28GAORUFK9fERZngv4aSO
         7ZlpZqC2jb/GEQPXj7WWjcVWoAVbElJlpc34fJK9mchfVfzH+0hI4Jibaexc0vKXfoqt
         0VpYy8HsIi/YtwkAcLi5FtXNpAkGdAsKSuxR5a9Q1YFYVsY26CTnJE+Irn0WN15oQzkG
         AdNjTrAdUA8BPjNi/zVckTS/WZO7rNzkzO5HcZEkumPQQ7LgMbTtJQ6D4f76hM7Rqfn+
         lTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821759; x=1757426559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6qJ4Krbe8Eig8u7HuRNaH82OJCGzRpxUAzmtO7ZEgM=;
        b=hJW6yzaaC3hRDB7v2J7mMKtX/0uXh1j8iOr/lbqo092+9+xDzl7olgha1TJ2fCW+Y1
         BGZz6bZ8umHVyedxLKma0Quw+eE0J75LVLlI99GBWeOm0LIqV6AFVYDQ/CYNaepV3DzR
         BaqshliprdKqGtgMJxTZr2iQekpdEWYc1c1GX8QPJudWzq0UctQDzrnUSFaJIzgXcjaI
         7S0OblBSPhqFQBh1SOwoxoDS0YFjWLe/5nJuAXcpgGdEHGGksomlUyaSEQx/vovUrofw
         gx8wNhZOh4A4Yt77sZLW9SApUrhEn3U0/t/dLsoupoP7P3wYSi4tWSPeirtQiVA1HZxq
         3lxA==
X-Forwarded-Encrypted: i=1; AJvYcCXLGpdjV49fHMhKO9a9BgibDa84R5nfsrp/acVTivvwLdGUawR7ivTIm9pPstjG3fUavtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRZiOThhc4d1IXdgO9bPgT0iYE7l2Uq7Etv+r18ihuLV/FPTxk
	eRo7W3PxpIL8le5j9GDs2Qxq+98aJOYATo1XSEmWTFXfac450ibHv2EO5cZEHkQ3K94mNfZnxhU
	F8H9G7t9zwE/v277oC22DcKgfov1rnTOcEvGC7V55KA==
X-Gm-Gg: ASbGnctE9oT0d4H7cxDjfkMLG8tuZPbhbONzgJ6Hs3ZVo5EYa4+sZmdDJ3Nrtw8vO6k
	runIrYzS9FN9W4NDeKt9iH8k0I9op2aKDElz4oAnLiqyOl8F8aD1IhM/o8OVMI7b6DTk7dbKtAs
	jglZA1d0aVnxBbO+wemC7k0/BxuUtHqCXZgbCFJw/ydmN8fSk4srqt/xectWgDqKWM/cg4st+1L
	yE52ccyq0reBVy425yHVtLl85T2HkzBDk2u3anLIEzBDpeglA==
X-Google-Smtp-Source: AGHT+IF0XxTo4Eof/cAnsUmsXyl7FaRgZjHqhfNse8z4FzsrSjUbnY+JobcnARjelIxZIYceGk+U5xWeRaOHkRoNgZc=
X-Received: by 2002:a05:6512:1289:b0:55f:3f25:f03d with SMTP id
 2adb3069b0e04-55f708dbc89mr4083265e87.32.1756821758848; Tue, 02 Sep 2025
 07:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
 <aLbrz5DYS5Yxx_UE@smile.fi.intel.com> <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
 <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
In-Reply-To: <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 16:02:27 +0200
X-Gm-Features: Ac12FXzmmMVa4i5hYh_JJ6GZvRRv05y-_-Nk_APJiumjkhCqONHKECafTZ1ySu4
Message-ID: <CAMRc=Mdp2djgGbgu_uwLSkrtRPomAU=6-SRdzCdSbrHWzS2c2A@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of pinmux_ops::get_function_name()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 03:29:31PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 2, 2025 at 3:06=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > > >
> > > > While the API contract in docs doesn't specify it explicitly,
> > >
> > > So, why not to amend the doc at the same time?
> >
> > Because this series is already big as is. That would be another commit
> > that can be separate.
>
> I meant _in the same_ patch.
>
> > > > the generic implementation of the get_function_name() callback from=
 struct
> > > > pinmux_ops - pinmux_generic_get_function_name() - can fail and retu=
rn
> > > > NULL. This is already checked in pinmux_check_ops() so add a simila=
r
> > > > check in pinmux_func_name_to_selector() instead of passing the retu=
rned
> > > > pointer right down to strcmp() where the NULL can get dereferenced.=
 This
> > > > is normal operation when adding new pinfunctions.
>
> > > Fixes?
> >
> > This has always been like that.
> >
> > > Reported?
> >
> > I mean, technically Mark Brown reported my previous patch failing but
> > I don't think we do this if we're still within the same series just
> > another iteration?
> >
> > > Closes?
> >
> > Ditto.
>
> I meant that this fixes a potential issue disregard to your series, right=
?
>

No, as long as the imx driver keeps putting stuff into the pin
function radix tree directly, this cannot happen. The issue was
triggered by the discrepancy between the number of added selectors and
the hardcoded number of functions (we started at 0 which was not in
the radix tree and crashed before we got to 1).

Bart
