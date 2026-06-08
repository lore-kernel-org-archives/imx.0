Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA0D3B0AC7
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909835; cv=pass; b=DI75oc9XzspkIzd0zpNhVv1OOVUr9k2wfhDqCUXCqievC9a21j4zp6F/4WICqhLWNyfMfOtcoU6jKkxLOC432rk5Cv9iRYBoBbB3Se77XhJNnbnlXk6gdSrbrXB5f3Hk0EOdh7enKNiUPTlJ4i2s9y3j96fNFaQWm3VA3XwoftM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909835; c=relaxed/simple;
	bh=dZbilIS/Qna4fJ6oZVSTQqKNAm/MOGoPv0Ifm7jq+/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAWumCowJeJwkCyN/8zSr/l06DBKTrkc47bvo8ck4bDFPg7zH6u5HcMuaOqiiQwVP4E9FPB2SC3CV6yEdDd7FseLghi7e6bUForQkU348B+84rWGdoRJYTZ0RJNEAfXCtS///xHrhHX65Soa9U5Yoh7uJh2Ap9t1fnyjkA7N2QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEaiSMlt; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEaiSMlt"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso4118002e87.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 02:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780909830; cv=none;
        d=google.com; s=arc-20240605;
        b=eYAJAUWWCJBtK8CIBQRDkZpLYq5GPDpB/PtL4wwc9XPIz7FU7pRQ+zyIYhNKkKOrOx
         qpXrxNgIdhWMW6Jg3whshp9GNgs4ooeDQkR0ViG3Y60PVRdXp1jW5u0A01kchO3O/FVm
         29rUDiVQj27laT9CNeARacKcuais4Lllmd8KbK2LiQBnP7TM5YL6FxLXK6M6lQplkWNt
         l3T/vUL+phxjuz+oMQUOLZ5XOHcFstvjbKiMfc29rccJ5G1QUDGECMzFyf9hQTHHc9sg
         ic9MK+nz1iX4T+qzx+U92qyb1GaxiaCD9pgHyZAaU3T1FskBXSpg5aNN0vx4eXHSvnrW
         hqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        fh=UiqyoHgs2B2/1ouKCkw1ruQpbdjAO9Uhwgv/ZZvSCxg=;
        b=JAHItRPnayaPrxGSvBafIl21BZg23ctMvtZZBUM5l1uskGzVEEyDxAVkqJzLYa9ngt
         Q0up46GI+SmfeT2JrgmTbAKX6WEeCClpIQsfwuEIBB4fRv/E8Fb1j4tk0Ni/TKR4zPyH
         dJ3mLknGdrazAcd4E7/i11ComK/BkX/puGGUmzLMGP3sxQUiNnBFj67WGTDeKBcnrce7
         J554L8gzy/BUtBUXAwpLP3IuMSN7yHRGkuBGb8v9wD3p1dxcu3AQUTR1verDxw3I9XH/
         t89Reo+bXTUHBK0cz8c8EXab+AEzKV+M9b7+acF7yPkldbn1esXa7FfAoCZLWprfur1M
         mbTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909830; x=1781514630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=BEaiSMltsiLOUEzzvJMYkk17DUJzp2aSi8Z01DO25MNy6K2N+0wsqpw8un2LsJEnLn
         JpHZFJ3TfCWKFb5KtfCTccUEpcBB/rrprTAmqw0RtrnfW8I9uzDNoXNuIZmKT0LEEYZD
         zrn7rHLjueoSHhmTHiy6Hkz8H2AzjZBnnDtf1Gan10oH1S1/WG2c9HhyIX3W6Zi/r1mj
         a8cjN92Otbiob7P2DVpA7dOGxMmvfm4JjdW0MZtWNGdsMhEqosEbBKn9ncyTXqO+myHH
         ShkrvADKOLkrgsJFclqlrF+NeHlb/8w438bWNfjYlOlEGhEnKB1U2n3m5n133mt0kCuO
         Wcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909830; x=1781514630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=cP9nc+3rcTZ2lzeoXAUDH0PA5JRBXn68u3tSySQIJuuTcIfxMDKue6BpVeY/iKdt5B
         B9ifsXfg1aJltCs/vByUmpMkg0VmwvzZqJuvvmYYiM++hFborz4y2nrYEKOCgJb9PsHL
         zT1iAgpC/593UKZH4ryUd2ZF8mXkR7Sup4vBhC9BBxMYiz78CiySMedBuKpVZ3E5y0YC
         0Vdw7oYhkqqGgE71dRsnKQxTPYSG0P5BuvEwqtxLkI+Vx50L7ycGVg5Fakv+WRpUw7vA
         36LCLI+5zSCzF5WQ4zQjVGt7DfVfqcCAWyXP9nWN4e5k3B4WvPUqS/KzF7g2GsOwOnZc
         LKgA==
X-Forwarded-Encrypted: i=1; AFNElJ8OAzI7g5v5ZjwoTv5VYkLjOqCD6YitqeaVT+1Yfc/Qd15ns0GttJrEbBrxEfYwXQFva/I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzosh5Ea/hpS08xoNVWeoWStiFWAlleO8GqQttdHFVzT0vz3kue
	eaUgK9DmpjhMi5RKTC2kpMVKwuctVBorXHOsIqubJLSf9nvjd6zBTh1BXoAndX9C0LLz+fE8u3o
	Eh6Oz/bkj5c4ckKLReSmW4yxr1khMrXM=
X-Gm-Gg: Acq92OF6I6LovLNEkYb93qwUipWBlJ8ApyFDR8E2X/KDTiPrlemER7h+bG6iigO+MUd
	y2EBIMFyuQ8R+/AhHQHVH6p3SnMhzfccWJ6UXQzVRdO0/jBg8k0ZYtJNCt3SDVonpyzfFFHx8Bp
	mo7uFLogW3WTerzg2M+HM8/vB67+gr+ELt55wKRqJudQFGhvdmLBeHYvanRiWCVU3MJV1PeoGyz
	34qWaMn1Atp1uqh/d2pKGbwy/vFPA0Xi4IXvqD9Nqbt2hQCqmA0mQg8jdlYzc1VvPjAGvxO3/YT
	9+rLvvI77Y8mmBvyEmv5g1DJguxIkJVtRLLfAy5nNc5WgEBsiRvPq+kZsXtiddpkLuhjQrcha/j
	LjEyf75w=
X-Received: by 2002:a05:6512:1116:b0:5aa:6c66:e343 with SMTP id
 2adb3069b0e04-5aa87bc93bcmr3927231e87.38.1780909829307; Mon, 08 Jun 2026
 02:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20260605121112.27866-1-piyushpatle228@gmail.com> <aiZzxhljfyYQ68Gl@raspi>
In-Reply-To: <aiZzxhljfyYQ68Gl@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 8 Jun 2026 14:39:52 +0530
X-Gm-Features: AVVi8CcpFt73_s1W6tVAYjL6KIr_ANTO2-Kr_9uq4rs-k3XfwDZkGI2c1mIcJWo
Message-ID: <CAMB+xkZm-FA_hmnAYRnXw6T4tZvVtamM=kmEyatFKZWV0+kJFA@mail.gmail.com>
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Abel Vesa <abelvesa@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 1:16=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Fri, Jun 05, 2026 at 05:41:05PM +0530, Piyush Patle wrote:
> > Hi Marek, Liu Ying,
>
> Hi,

Hi Ying,
Thanks for the detailed update.

>
> >
> > I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI =
on
> > LVDS ch1). It mostly works, but I ran into a few issues around DI routi=
ng,
> > LVDS format handling, and DC enable sequencing which needed rework befo=
re
> > HDMI would come up reliably on the board.
> >
> > I don't see a v2 of the series and things seem to have been quiet since
> > November. Are you planning to post an updated version?
>
> My plan was to enable prefetch engine support[1] for i.MX8QXP display
> controller and add device tree for a whole i.MX8QXP LVDS display pipeline=
,
> before adding i.MX95 display controller support.
>
> Unfortunately, it seems that Marek is not a big fan of [1] and I'm busy
> with downstream development so the plan doesn't move forward well.  I sti=
ll
> think [1] makes sense(maybe I need to rebase it on latest drm-misc-next),
> so I'd like to see review comments on [1] and hopefully people think that
> the overall idea of [1] is ok.
>
> >
> > I've accumulated a fair amount of rework while getting this running on =
the
> > FRDM. If you're not planning a v2, I can clean things up and send one b=
ased
> > on the current series.
>
> I still think that i.MX95 display controller driver should be in a separa=
te
> driver, rather than sharing the same driver with i.MX8QXP display control=
ler
> like this patch series does, because the two display controllers are quit=
e
> different as I mentioned in comments on this patch series and in discussi=
on
> in [1].  Also, the common part between the two display controllers should
> be extracted to a common helper library as I mentioned there too.
>
I agree with your direction. A separate i.MX95 DC driver with the common pi=
eces
factored into a shared helper library seems like a better long-term
approach than
extending the i.MX8QXP driver, given how different the two controllers are.

> >
> > Thanks,
> > Piyush
>
> [1] lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.c=
om/
>
I've had the current series running on the i.MX95 15x15 FRDM (IT6263
LVDS-to-HDMI
on LVDS channel 1). HDMI now comes up reliably and remains stable. The mode
and timing are correct (1280x720@60), the LVDS/LDB pixel clock is at
74.25 MHz in
single-link mode, and the DC plane is scanning out a linear XRGB8888
buffer correctly

The one issue I'm still chasing is color. Timing and sync look
correct, but the colors on
screen are wrong. I've ruled out a few obvious causes and see the same
result with a
simple CPU-generated test pattern, so it doesn't appear to be GPU or
Mesa related.
I'm currently narrowing the root cause and will report back once I find it.

While bringing the series up on the FRDM, I ended up reworking three main a=
reas:
- DI routing (display interface selection and pixel-link to LVDS channel wi=
ring)
- LVDS bus-format handling
- DC enable sequencing

I have time available to help move this forward. I'm happy to continue
testing on the
FRDM and provide feedback on the reworks I've made.

On the other hand, if additional help would be useful, I'd be
interested in working on the
separate i.MX95 driver under your guidance and posting the resulting
series for review.
If that sounds reasonable, I'd be glad to coordinate with you on how
you'd like the work
structured.

I'll also take a look at the prefetch engine series! Thanks again.

> --
> Regards,
> Liu Ying

Thanks,
Piyush
