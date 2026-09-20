Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC0478E5A
	for <imx@lists.linux.dev>; Sun, 20 Sep 2026 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789942590; cv=none; b=ggbJkNpiCL9y4AzS/B2a+W3bdwbPGP/dmoXcUCfV4ZiTV2ZajG5U68EP29ynFs6IrvgvaxJib6+e5wnmmOJzotNooUT3OLYD2kBXwOBqUBid4MQNTjLkBbgVHZ2QENxb5ax0qfZ0Bk8Z5aPcH0k7r54GWoOc9Fovzx9sWQGDM1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789942590; c=relaxed/simple;
	bh=ebKDhKAhgud2bnS39ZCHaxinRFvr6zWcjZYPy1ikOOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/GwBmyDxqUXsWRa9tzPYpTLX/cnST7KNpWz4ZAQri4TwWyA0hD2ahSE699pIrPY0QJnbAJrkn6Uy0O2Is1DRHjS2RvgJjFeYoihfMikoErCrU0mGAEgxcMGHWNSxMzbxxGlQbyFfiDcXSnLIg6rxihFqN0BkYjOju3Z6147KWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yq9WVFPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yq9WVFPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056D41F008A2
	for <imx@lists.linux.dev>; Sun, 20 Sep 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789942589;
	bh=ebKDhKAhgud2bnS39ZCHaxinRFvr6zWcjZYPy1ikOOE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Yq9WVFPs+jqy/pjJBlh2QI/tgJFpFIS6b6e05Igu+4qP3Gy6LvWdo3kJmjl0DZH9p
	 jEE5RqyWaSfQiM3Aky8eaEROjlFpleYUS0gAtq9+Y3qMWvKzR1Eogz4ikHuTUTIb5g
	 yaXe5/nYNVYfd+nfimQTzhKPRT7RVpq6quNXhYjyDNR6xfW90k6MsGV9uygJFl9Ab0
	 dpZDxLUTj/Ow98i4gcjjZL9awJy42OH9fnWtGEARiUZtnQ+jpyj2nVboSpIDgymHM8
	 5YjHBT5c23zDGei+wDWAkIvM0JjT22xo0ThJbcV165tHIxA4B2cNWiVfxCk5l3i20N
	 4Oh3cBLsp91aw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so2594611e87.3
        for <imx@lists.linux.dev>; Sun, 20 Sep 2026 15:16:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykK/HM8XJdhxVy++tqiEbUsptZGxtyc1ErPl2y+y7siy4ZOUM/pi6nnWjZY7FpyCblgmo=@lists.linux.dev
X-Gm-Message-State: AFuF++mzZMSWPWZMxpTcFmja4g52cJCCeSVV6zStrHWpAG0juSmcOoU1
	Xq0QTGZm2aPDAXwrKaesEqv1spAbOiKthWSlaSQ+wKWzGIGYJnrwy2CqyLRpxJfWwsEnb0zOBVq
	8pDJHwFSlUeqq+5ANx/bMzgNs9r6SJvM=
X-Received: by 2002:a05:6512:1293:b0:5b4:ab7a:8275 with SMTP id
 2adb3069b0e04-5b8c17f5ea5mr2698722e87.3.1789942587664; Sun, 20 Sep 2026
 15:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com> <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:16:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLmrxraJUDbRvixcrkMc_foxERA1hRavx5eSRcf9r0_FHw@mail.gmail.com>
X-Gm-Features: AcwNN1X7pTA7qBrMe4T51xXoaKqZZVpzO_aXkfOtaHIdAuBs1L1sA2lNLANIGoo
Message-ID: <CAD++jLmrxraJUDbRvixcrkMc_foxERA1hRavx5eSRcf9r0_FHw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] gpio: mmio: report the line direction on chips
 without direction registers
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mehmet Fide <mehmet.fide@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:42=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide <mehmet.fide@gmail.com> s=
aid:
> >
> > On trees: Linus offered to take patch 2 through pinctrl, and patch 1 is
> > pinctrl as well. Patch 4 gives wrong answers without patch 2 (an
> > undecoded pad register would seed every requested line as an output), s=
o
> > I would rather the two pinctrl patches land first or in the same cycle
> > as the two gpio patches, whichever way you two prefer to split it.
> >
>
> Linus can put the first two on an immutable branch for me to pull.

OK then I applied those two patches here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-gpio-dir-imx

Then merged that into my "devel" branch for v7.4.

So you can pull that and apply the rest on top.

Yours,
Linus Walleij
