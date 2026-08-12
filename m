Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFC2BB13
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534098; cv=pass; b=MoQe7lOQC4VJ8IYgrPKIxJRPO4/KFLYxFoxg14/Ll8za3rXlOF6vxU6ZZ2i5Y8vCtBQnX06f/fEcnmaEcxo3HPkPCwNAWHA6ihOyYIlb6r/pGe7MB/6UvaCwdDLx0D0M234vaHBMeaZFALmtq3Yrx+Akp5eJJYG8E/bVNoFoTN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534098; c=relaxed/simple;
	bh=2rFGE4qfBernJcN/gTlI/3NpT6ke01djCdzhEcA9pVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOBfY5XGIVgKWZp0phPL9iffLcxIcxPh4tQfs6rbxseLstxP571ZdKg3tO5KD/BT+mAGjWlQy/JTK499X4OF6OrucO/a2RJvSE+SzogcWJKB0XG/8+yz/V+2TcUidRCPAxrAZ0tVKqGEhalfWJJzVgCDkBo+xXVgU+tpH32p4PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO35d377; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO35d377"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3811f512167so975375a91.3
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 04:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786534096; cv=none;
        d=google.com; s=arc-20260327;
        b=DZ/0NKMl+FmYPIKiD8D/eCnqDriW7SvP8wTYLthi6FyEo63ZMfe7R4YRZoFOvkfEK5
         v/gw8xFjR0cTF1nqmI7Q9IxH3hutBhqqzLlxZNaERv644RgfBp6WMobcGxAYuhZJnYB4
         rfdcnZg1p7LkoGDSw811CzpYZBSsYRIHQmab462kzCtprjyBCnKPezZiy+Ia0dE5JT6g
         d29pdhZpeDv9vuIA6LGwT+RNuu91CpscgnVitTvcbWpaSKBHTCJHjgXHnE+0msuEiqHi
         MEOXfAROVYYUXWqT7bJmbaJfBj52rasTMngy61lhLclGnukVlc4dY124ANBN+pfjcdUx
         A+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ciG76+KQ9pkjJMs5bmm5Wc7sSbVFbcyhCTB47xsSC/4=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=mOdIbswlqYI8rzxikzSOlNKELu9tqsbIk8E7EK2k+cR9o4QyRm0Q+U56xU7SA2nKkY
         U3QWzC2ugi0RAjoC7lCuxOfZVR+q06vL1tDmBhGOe2w0B8ZQ9k+W+NWQmt7D1MB8+fb+
         sYRFyVK66eOCz2oJyBAHAgpQ+U9v95bo6ZUNXd3wghD76Lbxtk+TrrD8ny9c7P8dSvpO
         yCKKVEiou64HUXEvQpnK96xKjksL3v+SQDVz1LQpSTPI1YF1FuuaK9p85ONbbIEEqA4y
         jwVh18Ke8OYl1VDmODd3lFN9TJiWsBrBv9RsNHNEavi6ZuH2DecJi3/HZ08xNK5u91+x
         fcZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534096; x=1787138896; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciG76+KQ9pkjJMs5bmm5Wc7sSbVFbcyhCTB47xsSC/4=;
        b=ZO35d377tup5//fQ+IwOdQOcitAqVd3kn+QdLvhAqgkcyPG92EzC5B3sw9RDjHaOza
         YyBJe7eFC8G86HRukVNfkjWFmYCfn5eGSRtkHKLYlcNO8YUDM8jw2DPdBchYbsnhSWXS
         jM999ili0jDDRZJsMfROSHm9gjyGt2i2WwD34dLqzU2Rr570sKJHJ4hXa+ctPDKJDfg/
         6k/AYRIbCTSnE70V4cj9VUglObZpTVp29lIdzfHBCWoQgetIRe/JirM/QPX+FsnPGhsi
         tryk3bzBaIGqBdfBQhb6pRIBOg5fR/kgPmea8YJzoiBsdWThdH03/RbJv5+lLQoGGApf
         YCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534096; x=1787138896;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ciG76+KQ9pkjJMs5bmm5Wc7sSbVFbcyhCTB47xsSC/4=;
        b=IEJq+wVmAs0XX+XFJy9k8BpIkepty5nFAcP8BCBD23k6zqqLiGGgY5RmhThEsQRn5W
         rWGmuuxK/+7VWa4+EEab22WJsQBorSRrfAJzpZy+PzH2uE7FhaBDPg9m/MnHzPdDZOOK
         l6Itk26XKndA9DlICgz++4WFSUXbdduEuo4PiXZuzexYGsAU/0t1bOpsmQlMkdXS/U+X
         enIXs3+bhiliNu3zLuLfHZBYaMpt7xMgBjs94zXyfIUsjBBqa9cREdVYd1NIFz+IG5Xe
         n1UulPp/uv0J50+FiRqaoH7F51CNLv3ELwSU6QE5vfLobn6LJG63G7m3q+5qeBe2PbSf
         dFNQ==
X-Gm-Message-State: AOJu0YwHxhQKECqTOKYPMFfF3oWlBQqamwOiwkokf1+OJSyQR3ZgKRBk
	0bDWw4wSeA3ASFZ9eoiFVt71qxpjN3GQl4gzxe+Y23sTeIe4hGgA0lWQmFPqGJ+73KcwgK6X7J5
	LC6Y+6R4YbH6iW4lCbjIVBlWu2XN9Ick=
X-Gm-Gg: AR+sD10tgntJrVQ5k+KSrl6q6/qWRBccRpVAS0P2HUGriPJQuDTWTvAwU+XQUVs8Sdj
	nWBLGMoBxLkDvaL/CTWwF91521dqjYsJ62eQLdLCYsXn00hoO/PnxQzUVwr07/ADUYTNtFtXSRl
	oov5zV18tov8Yv0U+jymwxErgFSglMMwBHtDJpIrkAHQD+SQynxN26cUEWu2X0uv8b45KOIPDZ1
	ZPjdNgqx2RW56Df8gCg2dpAjvr0L6DlmoOBVW2TRSeSNtJoHZ7BkIdqxEPWbWaG+PX+xT85xFll
	6ow4wPNSAC1yTQNwFhxpLkdIkpId9/7y8QaSq/+x2rs73CEgb2wksFLo8DMUDjnOSysfa8Vva5l
	5Nm6vxbVQm07BxSun2Rl3+/63aF6B/M60n1JkarpKfvIhMz5fOTwszkwl
X-Received: by 2002:a17:90b:3c50:b0:38e:8050:e63a with SMTP id
 98e67ed59e1d1-393014230b6mr4960578a91.6.1786534096017; Wed, 12 Aug 2026
 04:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812101418.37966-1-phucduc.bui@gmail.com> <20260812101418.37966-3-phucduc.bui@gmail.com>
 <20260812102938.D4E101F00A3A@smtp.kernel.org>
In-Reply-To: <20260812102938.D4E101F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 12 Aug 2026 18:28:04 +0700
X-Gm-Features: AUfX_mxppOfJDeDuODBCk4keCHLpvRYa2z6NmDB-C1PSyXw7Xu2FjUDIo_zRHs4
Message-ID: <CAABR9nEzo9pb=mLhZ2nyDuSYr=qDcgBZDzMUqptyvDCG8nLgTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Are we sure the underlying functions actually log these errors?
>
> Looking at devm_request_irq(), devm_snd_soc_register_component(), and
> mxs_pcm_platform_register(), they do not appear to print error messages when
> they fail, except in very specific edge cases.
>
> While the driver core will log a generic failure code on probe exit, does
> removing these specific error logs cause the driver to fail silently at these
> initialization steps, making it difficult to debug which step failed?
>

I checked all error paths in the called functions, and they already
report the corresponding errors,
either directly or deeper in the call chain.
Therefore, removing the additional dev_err() calls does not make these
failures silent.

> [Severity: High]
> This is a pre-existing issue, but does returning here leave a dangling pointer
> in the global mxs_saif array?
>
> Earlier in mxs_saif_probe(), the newly allocated saif context is stored
> globally:
>
> mxs_saif_probe()
>     mxs_saif[saif->id] = saif;
>
> If the probe function fails here, or if the driver is manually unbound via
> sysfs, devres will automatically free the saif structure. However, the driver
> never clears mxs_saif[saif->id].
>
> If a user is actively playing audio and the driver is unbound, the ALSA core
> unregisters the component but keeps the PCM file descriptor open. When the
> stream is subsequently closed, the machine driver's hw_free callback invokes
> mxs_saif_put_mclk(), which will dereference the freed mxs_saif pointer.
>
> >
> >       platform_set_drvdata(pdev, saif);
> >
> > @@ -857,16 +855,12 @@ static int mxs_saif_probe(struct platform_device *pdev)
> >
> >       ret = devm_snd_soc_register_component(&pdev->dev, &mxs_saif_component,
> >                                             &mxs_saif_dai, 1);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "register DAI failed\n");
> > +     if (ret)
> >               return ret;
>
> [Severity: High]
> This is also a pre-existing issue, but does returning here cause a
> use-after-unmap panic if the clock divider was initialized?
>
> When mxs_saif_probe() calls mxs_saif_mclk_init() for saif0, it registers a
> clock divider and an OF clock provider. These are not devm-managed and require
> explicit unregistration.
>
> The registered clock divider is passed a register pointer mapped via devres:
>
> mxs_saif_mclk_init()
>     clk = clk_register_divider(..., saif->base + SAIF_CTRL, ...);
>
> If devm_snd_soc_register_component() fails and we return directly, devres
> will automatically unmap saif->base.
>
> Because the clock framework objects are never unregistered, they remain in the
> system. Any subsequent access to this clock, such as reading debugfs or a
> machine driver interacting with the clock, will dereference the now-unmapped
> register pointer and cause a synchronous external abort.
>
> >
> >       ret = mxs_pcm_platform_register(&pdev->dev);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
> > +     if (ret)
> >               return ret;
> > -     }
> >
> >       return 0;
> >  }
>

I confirmed that both issues are pre-existing and are not introduced
by this patch.
They are unrelated to the error-message cleanup in this series.
