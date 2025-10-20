Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D00F265296
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979227; cv=none; b=XYQkpAfOY2O4YE+IzPzGSjmNs/YYnHu4YiqM+oJF6kCDnpJGS47GeKQ0YuOEzU7DKX/VmDL2A/cedoZfrfKQSPO4ku7lloRqVgrhLXPhrtM05swsi37d8XurZtWD+0r+jqhz1ZHNnrycRcUudCeZRdxiKc/W94R5/Wxpc4a3Ya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979227; c=relaxed/simple;
	bh=e+m6gKrJ9WVNcgrFV+aGX97kgnEJRRQEVjtTKxNaaSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5pWYvBCsqxdcF7fsNwH8qc+F7DsbS4MtoWXU6M6IffhzeXdWoeEDE0B06gIShWdq3LpIB4Svnc0CqAPxpWA7lyQZdkoGY5Ib8G4zsigzXbtlPI1/ExDGQs9gBouRE8z7mtoQ/RPr6SktafAL6Im2lftbaCAjigfZx3HZ+gbFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbSu+Ta8; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbSu+Ta8"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b609a32a9b6so2604838a12.2
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760979225; x=1761584025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=;
        b=GbSu+Ta8LwkbPgX1eROzwhwXczLAvBd2+22lxQSHqX7aEAHUoBlXthFOr4+4QpGdqA
         wGd2nReYv/bDrx6g/yttAuR5Zrt/Eav+JjTVthkeKl5cvn8Ks6BzBD0fWIlNvmkfonuy
         Kl94k+sLhzhuFg5GDLiKHAH9aK7zm8UOwkOjeoPihXNXE7T4oKBo/7+E/O/YJgLW0zMo
         7YPM8bc7yem5V5WCZimZ9dwz3zIO5F5KiBBxLbRQRN+6L9hg3nOlz3/sjNeZEw4YxWI8
         sR5UUsQ9f4T/4xHAKJi9F6p4MnLUVfxnDuBOEwJ0QN42ot8jbaD26w1/Tbr8UCAUebNP
         LXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979225; x=1761584025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=;
        b=N0pD4/yynI+Y7yYXsuxrclUCPK2B+PGbMyXF3HC3i7qCR3ZCG6qj/fAeTk0bfhI09+
         o/IeQ5CTv3wkGrmKujceNZNSYQeZGQzr7raP9VfqSc1uZGO/JoC2iz614RcsfAoMHtDE
         clAzWCFN62YddzrkHOO29aK1YdMF0TNrNVJ3W8t42s7t455Qgpe+5CvvZXoKbXfrt/nJ
         6CPRZte4mFZOnxNbcW5liVA2cp0pTPfVMx+ZwaBi0GKgD5bccQFYcoraRJKGjCG/dKC5
         n16MtAp7sSO90xyYS7EKqNGmZ2OyY99yN6LlW1Ehewpe5kEMgv9eHXwWBE1PC+vTP3ji
         kfsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVeIQtx8hzeOTknG+qoMJ8+JOccprkRgDy/zCOt2DOKEjADbmJFzBRatQAle3M6BZvBK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyID9U0YSsj1hUgLCmvT0ytazyM2LLkkrzqSvEaAKuCfm99mw3E
	zaARWeRG2bfMeOk9S/bmQfAT0cisCW27dAzP3QB6owjcT4MR7mV6YQZclDsmaUK29qz94aNXeEi
	UPl3zAkFA04dVBYXvq4BBdhoCJMOn5Uk=
X-Gm-Gg: ASbGncsIAdiplDh/OhB5ipNZXLlu+WkuVuzFbn7+4e/rH+fK6Q/6NXIuFPfvNuYBeFh
	2BgTGR5kU85fdoz58tdwcHhciZdW18UBTwB8BLOu3kDR2VQ16+Hk1PjfrizXnDoYMrIar5RN4sY
	Pm4BzgvB8TiaoSeniPIO6tWG2XUkXeO/dm75w7NAwphWqoZ9iwTtnOSKYP5CDZUwUP841r7JjfU
	4tctR9lgbxlEU9stITvV+si+stsmqxAZa+EtWSZYiqj3INppeExf7dITXfWwhhflfWminZm1Gnj
	MgMZsKGonVvkeg==
X-Google-Smtp-Source: AGHT+IHRLawtbL1et4hkHzQFikS9RlkgNZ3tXH8Fnn3CVZHXzJcNVH96n3jZk81ZCVZWEMKh95kb9ashTsLbS1kPQ3M=
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id
 d9443c01a7336-290c9c8a738mr162660385ad.9.1760979225307; Mon, 20 Oct 2025
 09:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com> <aPZXNlY1MK4--Q_g@p14s>
In-Reply-To: <aPZXNlY1MK4--Q_g@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Oct 2025 19:53:30 +0300
X-Gm-Features: AS18NWCDDzyLXdoJ1ww-uT69WkAwCVMMmB4swG4QnzjbOUSySmr_LsY0EDRbg2A
Message-ID: <CAEnQRZDk0qLb2kegEZrE24oBfoKjqcc86N5e9QLB800vsKbOoA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 6:40=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Oct 15, 2025 at 09:52:57PM +0800, Peng Fan wrote:
> > PM runtime support is safe and applicable across all i.MX platforms, no=
t
> > just those using the SCU API. Remove the conditional check and enable P=
M
> > runtime unconditionally to simplify the code and ensure consistent powe=
r
> > management behavior.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
> >  1 file changed, 8 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rp=
roc.c
> > index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb=
2a8ae5e20b6b4f667 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_devi=
ce *pdev)
> >                       return dev_err_probe(dev, ret, "register restart =
handler failure\n");
> >       }
> >
> > -     if (dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_enable(dev);
> > -             ret =3D pm_runtime_resume_and_get(dev);
> > -             if (ret)
> > -                     return dev_err_probe(dev, ret, "pm_runtime get fa=
iled\n");
> > -     }
> > +     pm_runtime_enable(dev);
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "pm_runtime get failed\n")=
;
> >
> >       ret =3D devm_rproc_add(dev, rproc);
> >       if (ret) {
> > @@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_devic=
e *pdev)
> >       return 0;
> >
> >  err_put_pm:
> > -     if (dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_disable(dev);
> > -             pm_runtime_put_noidle(dev);
> > -     }
> > +     pm_runtime_disable(dev);
> > +     pm_runtime_put_noidle(dev);
> >
> >       return ret;
> >  }
> > @@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_dev=
ice *pdev)
> >       struct rproc *rproc =3D platform_get_drvdata(pdev);
> >       struct imx_rproc *priv =3D rproc->priv;
> >
> > -     if (priv->dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_disable(priv->dev);
> > -             pm_runtime_put_noidle(priv->dev);
> > -     }
> > +     pm_runtime_disable(priv->dev);
> > +     pm_runtime_put_noidle(priv->dev);
> >  }
>
> Daniel - what is your take on this one?

This is on my todo list for review. Will send it asap.
