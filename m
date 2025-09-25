Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720A244661
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787337; cv=none; b=OFSSAyX1wudC9rv3UWdKuvlQE5WyYNBNxJ6nAK2f8CBQkuhSLjC1QXXkf66TNmuRQntK6EJP7gJ/e/Rc+AYO9cnejXB/zjX8zmmC9bihXYse4kgUS3DYijL2qZ+9BvIwoqb35BMCH0o3rYxfigi4hhwh8oXn5q1hwMlcK7AsK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787337; c=relaxed/simple;
	bh=NdLPCWYGKs4Nnl4f/TPtkkAAU2xiHmYr81MGuS2MbZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zuordo1e38s+G9KbAxApCPcU4wiLR/KPKxnRS3M4jtYCN65LwFqsAzUO/+5MaRUAP17q5XeZTnBMiv4ruyV3x/to2++00OTaeriEQvv2EiRIUQP0yntCfTvJZdr74h/5Dg6SIejfRvqJjbmb25PhkjcsUrSw9Wzt5/thCd+WNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so411377e0c.0
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 01:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787333; x=1759392133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUcMlfE8b4AOAO2p/aFN45tB3uALYO0TSoBHD4chZzo=;
        b=Lw8CMYAVliKnCWsUtK99IgjtADKOb/cIG6Gy+N6BXOQ9ab03wI9jmynTIDmqFFlMK2
         SQ29ZjwoVB9ywC8BCW2LJqRZh2TAslTXuwSKP2NZuq/EKTLC1Chdilt2h/mtbpM2VL4V
         8jEeSvGMqAuSqecP0VGdckTEpwOf9yW0F+HNIH6g0wh+Aot2EhfTh3lsRAwXGVQu1g+b
         FQh+JZsk1NQlQF6V8nPf9BF1OEvZQqIXv9ybtfAupiln/WL7D3mGHzKqpos1Q7k9TOhV
         VS5Qt9QcvidQ5FrK8cAagpYzUt89DrVuqcKivvLIdn9IkSyV6fovgz66BrtSa35N9hS/
         kMAg==
X-Forwarded-Encrypted: i=1; AJvYcCVJQY0wuWaiqZFRYwTe1B+Ny3O9TkkAwCLBCuWRrd9gDK20HlY5MQz5Xff1A5FQdw5DcM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMm+DOdjObFc8nxIoWyOO4bajaKsONqVPB6g8j7z0dyXNulaNz
	sQ3lk1oGvsU5AlIb3Oyd3Io3RPBmKxv1neMUH3Tqr8P4Xg/r0jjii0csrkYEs8iF
X-Gm-Gg: ASbGncszm3Y17zwsnmk0dd0glTkosQ0bik2JjL2Kse/xBDDfKSXYot0aC7nS7OPo3tW
	f28vDk9XUBYyIFJfS1pL2t/tEC2QS5oM89vX5U1cYVqhSSIRkjek9qGJjjuH48h5rZBUPjx832Z
	tXqJeZ3SF8w2dutD8h3zUHJyMWEAQX83X5zUJy+ZXOxlxhb5W6Q5INu28gi3HFeOGS3b6rPBrq0
	B6KiQdLYDqkncQQF1IqMbqPZR4X66T0kiaFCJw9ZQ8oG4lcqfm3ZcDwpC2bzEYbsn1n/VNAJg2B
	7heHFPTIY7YyiowNnnlVwtU6cM6oPt46aOY/7knvghRsmeYZTFS8ajbSpVuQuDJy+RVXIHm+H/B
	BC8quL+esUWDCcKP5XvWW9kUHUBwZw1FQd9ieokZXiMigi0SFiRT6+3+Kj1pdEoGL
X-Google-Smtp-Source: AGHT+IEE3A7GLHPyOJHX+KuKeUxEvOHQ8nvRTFWCNtFElzKtVUccXqtqf0rQCIvq0oJL9rg0MhbZLQ==
X-Received: by 2002:a05:6122:90f:b0:542:2912:664f with SMTP id 71dfb90a1353d-54bea2f2d56mr980791e0c.10.1758787333439;
        Thu, 25 Sep 2025 01:02:13 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed881e61sm254695e0c.5.2025.09.25.01.02.12
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:02:13 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54aa5f70513so198508e0c.2
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 01:02:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIOpKuVl5BtWl97it08sAiKrbPbtKLJ3JKaQ//M/BzJZOUfow5eb3MscsHWF0KC2P/rvY=@lists.linux.dev
X-Received: by 2002:a05:6122:90f:b0:542:2912:664f with SMTP id
 71dfb90a1353d-54bea2f2d56mr980779e0c.10.1758787332548; Thu, 25 Sep 2025
 01:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com> <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 10:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
X-Gm-Features: AS18NWCyYwXSHgwWU9cjWnhwFzyaiaKh315kbRG5kwTsoewxQN_WDT2npG3qPmE
Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, 25 Sept 2025 at 09:52, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The (typeof(foo)) construct is unusual in the kernel, use a more typi=
cal
> > > syntax by explicitly spelling out the type.
> >
> > Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> > use more common syntax for compound literals") in pinctrl/for-next
> >
> > > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-=
v1-13-9f723dc3524a@linaro.org/

This is the origin link to the patch (by you) that started the discussion.

> >
> > Looks like you (slightly) missed your target. The correct link is:
> >
> >     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

This is the link to the comment (by Andy) that questioned the construct.

> >
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a link to the discussion with Andy as per Linus Torvalds'
> recent request to use the Link: tag to point to actually useful
> information rather than just the patch's origin. Linus Walleij doesn't
> use b4 so the origin link you'd normally expect to be added
> automatically is not there at all. That's probably what caused the
> confusion.

I know ;-)

Given the "Suggested-by: Andy", shouldn't the link point to the email
with the actual suggestion?

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
