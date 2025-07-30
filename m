Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33563262FD9
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753879831; cv=none; b=YsiVDICeQj6oNYNbQomisnM60x9iJE28DYXPeh60rB/Hz+DOjMImQcz5aqo6xhI1iYCC6+P4QPQFr0lVPTj0OqDEofH+b2kvYeZeZmbcOLrhoIRjGh7ZmeT58T0eVhfPfFfdoP3PrtX5eo36oHJS2gRGHkmJfbthkuSZ7kc4HuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753879831; c=relaxed/simple;
	bh=mAirr7gyYUrBa/ClKW/JlnzUq/0q+Y/udQ6/llJgM1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcEHO/6eW5/qwaMH0kZwgAZEqafx+J54nz1/2nvhu5WEtoi6cIdQTkA0Y3G1H1CN4ytm83NS6rXsRK1w9zlK/NQI17Q2OvAoLPL5T7LBtH37LvaCg5nwrtQThzVO5A+IeLLbua0NnMBa7WqkX8pm3yJycRY7lafFnOuXBkfQzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEVtjbbH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEVtjbbH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61592ff5ebbso1004264a12.3
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753879828; x=1754484628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvvn2gu3QwfMvEps+Es99aXQTd4n5DxwynGQISYrqRE=;
        b=cEVtjbbHWizM2Z8FLduCNwjw40XR2nUM+KLgPyOucKWGYt6jfAZF3Xm1yhHccMssty
         8PDL3PihlVG3mnKvAJEN/UhV4aAogD4YTyhVimvizST/Z74idzbmgarURn04lUrMDFbx
         r8gK7TJGFz8jPmCg73FUQ4AA5YOriis7u8p9toej/NSwqxvUnRYmDdn59RHZ6y0d8a0X
         hLjy+x/ZGbrBnHUiaOloYol9+/ilThuOMVLEn2HoQe0Cq8oJ7wcFNH3OkJr8/Z/KDiM/
         SlVLt5wjVvCoG6KyK/qjRGeuxpKjXz0RHHt9tFD2A0aaKL0Evoy+jygv7DaiL8Cy77GU
         s0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753879828; x=1754484628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvvn2gu3QwfMvEps+Es99aXQTd4n5DxwynGQISYrqRE=;
        b=WVtrcWcLIf8lIVo5xanJjYMHpQgUtXqxj7KBOLYShyDMp0GA0xq37pLaIvWvLt05i7
         ZjxZrshbEDrMN+6KE7lTrcluXy0cvWRdPsf66iUDvRhqXBlLK82NHcVhtfL57k5GymID
         fTuRiJaiy+pkMtkdaaY5Xwjqf1n7ZwC0zqvtP0x0nMBMUf3ELh5PwoeI2TNnE4ZWXxdc
         M19WTqAdYB2LT2T/30Fzby3gPD4N9MQkQ4Ya8i70RYAcYjEooA7ijfemEzGPW3pehgAZ
         vw2D0h9bStpRn9xRj+PVaB36VXjV4ssbVzeatmXDTs9tPY32spTtjYprje3/MZHfVLZY
         fxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF7TQSpZG3ab5w+tDG6CKJR4Snn5cSWn3pDFfyeQcOtJyYH9Ohh75E2cR7A5NNvko6bus=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTS/UhPIf9ywOKaxYu4x/nCrPCs+BlDoAEoA1t4r8blp2oyApE
	f4YQ3dZKmXr3ikp0Ps+yW9YblGwXlaHLxIklHrUFq4taRR1JjJZ0CeQ7W18+8uOCyFkCVftsTrM
	IF5fFUYBXYMGBJd8XFyJpRLPb/J130uI=
X-Gm-Gg: ASbGncsfmDrkEBOZuZnojsdigTPImOECsSkmMVbbRN4fML5Ew006dE50yNJ6Pab5A8O
	Cn1XWC1TeUy9fVnJ/uJJEuexv8RBa998WeWt4mj9fuFqm+ndKqAxBlrHJ7nHRIe4MfFtN3rea7S
	s3Rtx1vzhIqeDjVRq5yjvRM8vhJtX+6ZtXWYSOGHcYwmjgDfzNRRis+w5aYYMvc1ArOgKEeCH9L
	0xn2j1bQw==
X-Google-Smtp-Source: AGHT+IEJQOY2N21rRHh/x9SsZgR/AC6673gfg/Aq7DulgeR+61NEupHsjseGW2o2I6RkO01k98hTvI6/W9mnPdZHDTE=
X-Received: by 2002:a17:906:6a12:b0:ae0:b33d:2a4a with SMTP id
 a640c23a62f3a-af8fd97569fmr398869466b.35.1753879828299; Wed, 30 Jul 2025
 05:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com> <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 14:49:51 +0200
X-Gm-Features: Ac12FXxgFDuQutFN_-MaFgaos1SbYd6nY92Ty-kjNsHnooD1EOK3KyGkMl4TA4s
Message-ID: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > >  struct pinfunction {
> > >         const char *name;
> > >         const char * const *groups;
> > >         size_t ngroups;
> > > +       unsigned long flags;
> >
> > Not sure we need this. If the function is GPIO, pin control already
> > knows about this. The pin muxing has gpio request / release callbacks
> > that change the state. Why do we need an additional flag(s)?
> >
>
> I'm not following, how does the pin controller know that the function
> is GPIO exactly, other than by the bit set in this field?

AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
of this information.

--=20
With Best Regards,
Andy Shevchenko
