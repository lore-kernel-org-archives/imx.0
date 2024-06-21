Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB148155C82
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957354; cv=none; b=PmXV7qHUWpRPLY25DhJCxZAsdh8+cTNFsMRAYId4O0ZGWzDGAPHcJh9ZuOgacA9uUNoh8W70QdIRCTiRZeDauVff7NO44XEigMTQTCEFCdnreg8xR9Dxtdp/J9GUM1F1JselyoFUvmjcIyk9tUMhhQnpt79rX3K7YK4i3Xe3wjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957354; c=relaxed/simple;
	bh=JO8jBgL5VicYON4ggakHf8zSEa0qmLKYKjl67css/90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o108NMVy1RPY5A4uvCYjqXcp7I1jRFw1DYOBcaphorkEmmz9FNt1KTR9Yjd2kx5WY+RDjCyFA/b7PJzapiZaok147sToPamaHugr0hIlLNXRRqclRSbme1wCpAb3DeRScPGNSTlkFVW9w08Dl7UbkW8toSLmSjzlvI5YzrVL/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjnyFiV6; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjnyFiV6"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-375b2fe7003so6673725ab.1
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718957352; x=1719562152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwClo4datysb7tCRM4Yh2KXHFdvHWi27Cv7/oywYAaE=;
        b=hjnyFiV6HJr3dj/XJgB7KX42t8b9SFI5ERjjc+SO1lmVk+cVMDfVt5xOenoTn/z7DZ
         Pd3R+BFJWnieGzeLJUdgekDlRMKbsRZTe3KZSJoG69XEitej0vHUrfaq/cVwAvBQdpUE
         qUGUllj1RmscwBSPeSquQ7jpDMcbMr8KvjIVRaoEyNnDT+i2LPCWkNBt/fGI12i1jSGy
         42IuA0mUBTBczVGnEzQ6lhknQViM+d6XT9EUHbE07PPxdU65PcNez5pcMLp8AzGpPvNF
         HkEbyFT2YoyiWtu8Mb2IIHc7MRCFyTJtdWGmahfpP07EqYiBnnSJzutGPysXPUvo+G65
         veVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957352; x=1719562152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwClo4datysb7tCRM4Yh2KXHFdvHWi27Cv7/oywYAaE=;
        b=vCk7fYr5PRaOymzzfPOGiMEj4is+iGMWE7Zs1JJQIIAqqQDZ73MhH0cbGJhEHxbV1s
         uX6UT5MnizGh8enu/5oHeKLODhm7jYL3A7oU5SWQDdccefrvAzGfV9oLM5x1gGG3r5PK
         /F9S2npp4xe9DTeP9Yy0h26h/SmHSYz3OFs7ntd0+J9QiXBIe/PTqE33VjHu/iEbxp9F
         2q6V4HoNmanH4/fPY+PJo+Vy4mph6AarGYZHG4mc/xF3N5c5dIy4ano/DvPwRsAZ9Psq
         7Zj8SJwalb37pNysxu0BsQoz2JOvZAlBj0Nk/BNW3+0WgLci9IDpp5mPlAKEG+E1it23
         8rfg==
X-Forwarded-Encrypted: i=1; AJvYcCWegNp85vmAa9qELdDJCDWr5vNSyLS+vjjotrgFgE9lDlp5NGIUZGgWJS/yiG3c80clMX2p2d6aohbQYhr4E37b7aeX
X-Gm-Message-State: AOJu0YzsPYuDQ20uaP8fkKgszlRFewkV8T1vTXePtisiidSe7qC0mffp
	vkj9qbW2eJd1NQxTMEFPBaehBXg94RgiiaMJpeeWj0jOC7VmApB6Cbjq2TOdkLsNN2njqNDvH/c
	GCgLG9n/7t1G3bL8sPjjpcqM19WE=
X-Google-Smtp-Source: AGHT+IFwSrtGzSeEPK5TgC+oT8UOSi4rybKlq0dBAqLPHDSohAbLAOfIvFh4wZQl+7YbkvIbecRy6ybHuZFNV6WdVXA=
X-Received: by 2002:a05:6e02:1849:b0:375:a3d8:97be with SMTP id
 e9e14a558f8ab-3761d66d1admr86716815ab.9.1718957351600; Fri, 21 Jun 2024
 01:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1718350923-21392-1-git-send-email-shengjiu.wang@nxp.com>
 <171895121238.3616871.12573343188535489268.b4-ty@linaro.org> <ZnUfbEBDaKqIJU0r@linaro.org>
In-Reply-To: <ZnUfbEBDaKqIJU0r@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 21 Jun 2024 16:09:00 +0800
Message-ID: <CAA+D8APggO9q1bC7LnEBLj4JqF_q=Arax=iO6VeO5wZsm=d12g@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] clk: imx: clk-audiomix: Improvement for audiomix
To: Abel Vesa <abel.vesa@linaro.org>
Cc: p.zabel@pengutronix.de, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp Zabel

On Fri, Jun 21, 2024 at 2:36=E2=80=AFPM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> On 24-06-21 09:26:52, Abel Vesa wrote:
> >
> > On Fri, 14 Jun 2024 15:41:58 +0800, Shengjiu Wang wrote:
> > > Some improvement for audiomix driver:
> > > Add CLK_SET_RATE_PARENT flags for clocks
> > > Correct parent clock for earc_phy and audpll clocks.
> > > Add reset controller for EARC function, use the auxiliary device
> > > framework:
> > > https://lore.kernel.org/lkml/b86c83a520f0c45a60249468fa92b1de.sboyd@k=
ernel.org/
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/5] dt-bindings: clock: imx8mp: Add #reset-cells property
> >       commit: d7d9ef1f40dc0639ba0901097139fcdc4bedb32e
> > [2/5] clk: imx: clk-audiomix: Add reset controller
> >       commit: 6f0e817175c5b2e453f7ad6a4e9a8a7fd904ee4a
> > [3/5] reset: imx8mp-audiomix: Add AudioMix Block Control reset driver
> >       commit: b7604e8b805a6e52161ff98728122005e6975a46
>
> Dropped the this one. Needs to go through different tree.

In case that you may miss this commit which is in a clock driver patch set.
Could you please have a review?  Thanks.

https://lore.kernel.org/linux-arm-kernel/20240614101727.zkh32bqe5nurnmbx@pe=
ngutronix.de/T/#m4bd8091438d9fbe0bd1400005d681483c59607c7

Best regards
Shengjiu Wang

>
> > [4/5] clk: imx: clk-audiomix: Add CLK_SET_RATE_PARENT flags for clocks
> >       commit: 163e678c0b24d0e45f617f4496c4ae9b1afd8d63
> > [5/5] clk: imx: clk-audiomix: Correct parent clock for earc_phy and aud=
pll
> >       commit: 22fb849ead1b109f868e83b309223d906e4b7d96
> >
> > Best regards,
> > --
> > Abel Vesa <abel.vesa@linaro.org>
> >
