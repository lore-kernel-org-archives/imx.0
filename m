Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F4199FAB
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753911898; cv=none; b=AeYzu542jH39ocGBDik5f+60+SPcwwVycV5uPs5Zh21BHMiuk9Td8J7IOhsJOmmveRn7p2ZdiX3OpBw32oFJ1JX+LmWyXXs2ZEBiapsxWBXGGvfLTheHegLn+i1WxfYFqnaA5VUT+Bx3t+FW9tUUZkVjFOhb6sipyIuG3cqjMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753911898; c=relaxed/simple;
	bh=PPRlwx1CPANTimR56E3Tq9xJjZZGDr/ycInC7SqiA7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2eD2pm+SZiz3VriR7Sw9Wfbpq9qy1oKDO0KYlpFG7oCKImRlGjinY6pQB6y7QqNTDGQ0c2Duel7VomrvjShSebFWKdxQpSubJ9eTErbKC1XlmBuFFxImq3GcYFndXROC6kxDwFaiyJg68nb18N9PFbtIxofpHoe4TFBQ0O80GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NefG+6+A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NefG+6+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753911895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
	b=NefG+6+AoB+nFdpZ+Mvu2NIzuXZlagaCp//jX+1tbnrdjPncw7v6yX2nAiBAio1zkx6niJ
	gUHhSY3aAFEOzAafEwReh8wVfBbiY6PRCmjRy2pqoIkoRfBRl6CzHHeh/74hcaFFuKN+Lj
	YirNP4/+yqXVhT4auVKrq63d+e1PXqY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-7rB-20E2Nom2sWgSZG_o2A-1; Wed, 30 Jul 2025 17:44:54 -0400
X-MC-Unique: 7rB-20E2Nom2sWgSZG_o2A-1
X-Mimecast-MFC-AGG-ID: 7rB-20E2Nom2sWgSZG_o2A_1753911893
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-af905b8978dso13309066b.3
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753911893; x=1754516693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
        b=V3Q/9VFDmZU1foRJA9o7f6BoHZ/ue/Ta7RRvVZqWGM9CTuJLiEEqqBE1KZkMFxhjTH
         5Nh0dPbSe0c7Kze+A7tfLmUpHoBmI8MgKZtUPUcZmZy2nwl5BIQo4g6GVBNJge+YlCwN
         GTU2pPtVNHnOEG2gICkG85BZbuvlkNpvc74QX88twekFmzE41DhgoQbMkcWjpX1olwhx
         piDfCYisV9sSqug8xmRtihjjrXu37OaidcC+wAXGXX7uvh47epCNd9Oi5w8eb/JYwDfV
         LzP3y9Dg3iWRsV5pLY9gufH6VVygOXzC88WkQG7vzYsvFtK7Ppev3+unSbbpnl7c3zct
         Mu0g==
X-Forwarded-Encrypted: i=1; AJvYcCUmO+DA4AkAaiMpjWg7ZLa3S3AUrEe344ch0e337jDbmGAqSxzUFfMwT16pJWXiKVdo+7o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwojV45Z8iXXOeOAx8OVenBPnsdz0whn4x36WFl4vZ7k7d2da7b
	9nuTd04c0v0KEL/RVxPEYJwGA4C6FEdesilnkHuWDa+fVxrDTteFKR1/0CtTImV0eoRXP8FrSx2
	rMHBiW6Pxre+Qpy0mGSQCa51eJMEjeAxU4xczX7ssXrLA8Fn6A1OvIR9mbD3RUrmC36jcccM5dU
	Ywm0+2kKdigPcu2dUXmyYcy9iLE1nO
X-Gm-Gg: ASbGnctmXWv6YiQoeLLrQz/6kzCcEp0x7SKm66tseQJciE9yq+UynDWQvo4ATmpOlyu
	yd6PwwjI6OsssJloCktgIVeGFbf8ido+zMZ7AXd7ONy5FfvBXG6rvxNCvuFfKzREo/X2LYqBBtR
	dC9C5DBGVQBpCxvixAivKk
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id a640c23a62f3a-af8fd95983cmr588748566b.28.1753911892814;
        Wed, 30 Jul 2025 14:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETx/Q8z8JkM7YCT5hwYxMVdj/tg+Mt8q7qzSVGG/eKji/F1PzdcrMN7TdxkQSZqczHP8nko8qLTPufvPgLTYo=
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af8fd95983cmr588742766b.28.1753911892317; Wed, 30 Jul 2025
 14:44:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com> <20250711-adorable-winged-petrel-3a55df@houat>
In-Reply-To: <20250711-adorable-winged-petrel-3a55df@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 30 Jul 2025 17:44:40 -0400
X-Gm-Features: Ac12FXzMGo-MKds2pkAwVkvrlMlbQL40TOGBvmpmqZ_c-U-gdfMUVGNxYave4ac
Message-ID: <CABx5tqKuOcE83t+BVz=1WudVtBxJYTzcjWJ_n4se0JQWeU_Y1w@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
To: Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ebs4_n1-3cYjvh30fLAfhCYtcpKPJM2Dse940K9v08o_1753911893
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 3:05=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Thu, Jul 10, 2025 at 01:43:10PM -0400, Brian Masney wrote:
> > -static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rat=
e,
> > -                               unsigned long *parent_rate)
> > +static int sun4i_dclk_determine_rate(struct clk_hw *hw,
> > +                                  struct clk_rate_request *req)
> >  {
> >       struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
> >       struct sun4i_tcon *tcon =3D dclk->tcon;
> > @@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, =
unsigned long rate,
> >       int i;
> >
> >       for (i =3D tcon->dclk_min_div; i <=3D tcon->dclk_max_div; i++) {
> > -             u64 ideal =3D (u64)rate * i;
> > +             u64 ideal =3D (u64) req->rate * i;
>
> There shouldn't be any space after the cast.
>
> Once fixed,
> Acked-by: Maxime Ripard <mripard@kernel.org>

OK. I'm planning to submit a v2 of this series on August 11th when
v6.17rc1 is out. Unless the maintainer that picks up this whole series
plans to drop the space on merge.

Brian

