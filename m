Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C7251A730
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863981; cv=pass; b=UlOxmaY9jM/1aGdt3DK72rTIo/4xx38E5RXMPsvE7SwzbtKzxtP1oVg72MFbr6yUc3PapuVFaEH2xdh8Gy/Y9UVO/jZNDvzo/dJg/K1HYm8ugcENlghyu2/9qbjqESi3v1FBLP4C8BhOiCc3omtJ0ow6VIP+JDLnhIPJldAAo/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863981; c=relaxed/simple;
	bh=tt+pGvMYz1FVN4+bRmcox4/aVEQq4bCQPvkvBGNFnW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRmVYiCJe+Ghm/a/kOE0D/JOzi9jcL5oPQdMqBwRND+3IGNofOKoBvNNYGMq3P4MheVxZPEeqF4H53UJ79ZKfUc68nTHhyKtN06OVnmFjlgE5+h8y7RRuAio9Ed3Ze/flNzxLgyl+0MpMJKpo1SfZRc2bEB/pEZ6+KVgvrh+SqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMoHt4kd; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMoHt4kd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8485b358552so3951855b3a.2
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 03:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788863979; cv=none;
        d=google.com; s=arc-20260327;
        b=Skuu1LD8jzWKHulJjLv68hYfFZ9M90kgs0Ezi8+2Dzszsd+PUfFotaND48ku7X3XjI
         V6vzfh5TfZML1Wj/eK8l4raYHKgB+eNsgGcMIxWuj2IKZux9jSXeB9g6WrzdotIDtWRg
         ou6XiC257zVf5H0u42DlSvzTKwymnYxR18HWLGLPcV8toqCcZfgpmjfw3kEFRwO2uINE
         HirjWV6Jimd+6AvMMSCfe25k0w24x48pEFfO8sSnoR9lGQcPeLvkXn7iMlYons07vHYH
         p+rU5/zXipJ8mdFgqal3pT63MUvUOizVRp49cILrS8pdZgMPTuIaz4I/Si4c/ksHlQUr
         il6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jl3T9yA5icn0kDud2YKhOUFI5zpsByTY26KMtyiXHpU=;
        fh=CcjsTbSuoBkKYGIfnbK7TBquHu/UrrMVE9je1ZonDMg=;
        b=EMPau0eB2jlXd+xwHhJtyXXPOIMKmXugVf8JbWzc27/IyzEUa2L7syu1RwhbvBqRe1
         H5zl+QQfAEFO0VtHTzZN3jmeJkoeDOXdEOVEzW/8+XKJpi2gisXcQjR6eOeWoB1gOiqO
         xg6rYtoiyFGfiOXyuryaIslPEJjXzGbxNewlLnl8/6eoIlt3bpy3ImyFab0peWUfIMBP
         CEJTw0SAOuXxi72c4mNn/7W86OaQSVGyZb7nNduJeRv0f+2+5YOmuwE+ZVWgcgqS3tx6
         oGF6IGMyCetfC6h9vI/1HbYdGdSappqxdAqn3UfiaDxMMbLu2GXPv0jPsxg1Rl0W0txA
         ELdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863979; x=1789468779; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jl3T9yA5icn0kDud2YKhOUFI5zpsByTY26KMtyiXHpU=;
        b=SMoHt4kdzf2e4+lHjADfWct2BGV/Ps1Tn8mkXcvcpwt3D6gQIOCWb0xpajx1ecvTMc
         w1P34vbv/7E+FIcF2pxLhlJq1mfatAGIBg9cRe56D8Q0YTjhx85FgzMDyGanHIHnw2OV
         zU6neK2ACckYsUf+ll6oOmvQG5M7OgPvsyO2D2ti0Nd8OyoezYHx8w3eQeM3RRkpjx2e
         7FZGU4JfkiOotKP5ML4IcD4cIejoGxWTkitrfJnhlnHWmMZAKTqZAYBD8hD3xs+w+gkS
         e10QyUiYy/KPrmM3b6Yrs3kiPCStFXzrzUwF5XE+FFGm5AicwfIYNrLJ++2LBiwf+E7v
         H5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863979; x=1789468779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jl3T9yA5icn0kDud2YKhOUFI5zpsByTY26KMtyiXHpU=;
        b=pim9SB81NZ0SgoAHqJQVPz/jK2GSBkKvH2ly9p+2ktXIG8vnAr6iVmRm7Y/27T3jIH
         qio20Kq72OQvSuoobll0zWJPbTEKfRPiPaKKO6/IRm9rNhp7kHvKcL4mwZr6eiQww4Vy
         ZUeXg1H8uOMe8WwkaaM5wgPkGj6ojC3XFsMHFN2rXGdwSFSSdpQG0B4HTXUG50BwZBBh
         VDHqiiZiTJw2nO9T2DDLlVB/fhNkRTcx6dxTju0pyWxlsnL700xSgAl/hRxMLFyYTQEK
         BiAha8s/qI2tS17ASkIb+Dnh6xGXcIsU0TaZkMf2t7tp8Fn/fNMWZCzgCT1iL0qpC8Uf
         rALg==
X-Forwarded-Encrypted: i=1; AKwUvBxl8joBkxYro4xzkB7j9mILmTd/IGBZV2Fc7hhg5lrGXuUC9St7ApaKOfAb8mOJMW1oeA0=@lists.linux.dev
X-Gm-Message-State: AFuF++kBtKTIMzD5JWI+OjmwgaC23RzXnUS78NgDG/ZCNaOEJB496rO6
	rfwmgVe14Dd4RI7v83wi6jWpMSWQpmoBzI9ChUi9/lPLSd+M0sZu+5Hp1FS3egQlQfS8IUQazJq
	oG1afJO6/YQmoJJ2vDebCF0shFf2Afwg=
X-Gm-Gg: AYBFou0pjFxbPApj/vaHoOVGrchWV0kjZvNB7aT2s4Lyx88h6Ti4lATRcsk+EnMtdGb
	acfYEJM4OqRGxL7KWyVygnRDLLj9eZMScqETUnRUMX/1xHGHEMBwMB/Y/nmyC2v4R0Hy23AgPH+
	/KCyBHmXFXoIh8Q1k15ZqtXNf2vuV7pPY37+tfHky0WIBs1lN2xCkkDeajlz72O/NG6VI7UOIO7
	exC8G4ITzqygfKG68IIljsGehZwOMIbMQSv6LJaOAhuGccDF+WuReiSg+85dBeYm+/vNDt2D5Rr
	CIpQJqhLv5SMeYWUHCjkiCinbnk1YgBTvib7Kh/qUfBXqN2xdK4KFyWyfb25IaZyMyLsVW7qklS
	lnvKaUpSXtnDizzcYbHP0IkCQ9qis4DhzC8TOYI1h5hkr4eTEH22ahp9t
X-Received: by 2002:a05:6a00:c1c6:10b0:847:8449:2ba6 with SMTP id
 d2e1a72fcca58-866b2eace9bmr6165210b3a.8.1788863978907; Tue, 08 Sep 2026
 03:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc>
 <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc> <CAABR9nG49YgFejWRAkJrCcXF8p03A=HwWhbetmoHSjk_L3h9Gg@mail.gmail.com>
In-Reply-To: <CAABR9nG49YgFejWRAkJrCcXF8p03A=HwWhbetmoHSjk_L3h9Gg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 17:39:27 +0700
X-Gm-Features: AcwNN1UgTF6tGEUV4riCUxY5ZHDu-I4a8KfbZKcCu4UtgQm8VpsUF5cE-CTt_a8
Message-ID: <CAABR9nFg-V9XoNTt=dKCeAmXLECrZT0hPdxwEB4ONKV3kB1BHA@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: fec: free the PPS interrupt before
 tearing down the PHC and netdev
To: Shengzhuo Wei <me@cherr.cc>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Troy Kisky <troy.kisky@boundarydevices.com>, 
	Fugang Duan <fugang.duan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Simon Horman <horms@kernel.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I got this wrong.
Please disregard my previous comment.

On Tue, Sep 8, 2026 at 5:13=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com>=
 wrote:
>
> > @@ -861,6 +865,12 @@ void fec_ptp_stop(struct platform_device *pdev)
> >
> >         cancel_delayed_work_sync(&fep->time_keep);
> >         hrtimer_cancel(&fep->perout_timer);
> > +
> > +       if (fep->pps_irq >=3D 0) {
> > +               devm_free_irq(&pdev->dev, fep->pps_irq, ndev);
> > +               fep->pps_irq =3D -1;
> > +       }
> > +
>
> I noticed that fec_ptp_stop(pdev) is called only from the failed_init
> error path in fec_probe():
>
> failed_init:
> fec_ptp_stop(pdev);
> failed_reset:
> ...
> failed_ioremap:
> free_netdev(ndev);
>
> There are several other error paths below failed_init that eventually
> reach free_netdev(ndev) without calling fec_ptp_stop().
>
> Since fec_ptp_stop() is currently responsible for calling
> devm_free_irq(&pdev->dev, fep->pps_irq, ndev),
> could this result in a use-after-free if the PPS IRQ has already been
> registered and one of these lower error paths is taken?
>
> Would it make more sense to handle the PPS IRQ cleanup separately on
> these error paths, or,
> use a devm-based approach so that the IRQ lifetime is managed automatical=
ly?
