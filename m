Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A9E351C0B
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049970; cv=pass; b=Ak03dL4mlLRq2pDvajHLRvRxHxIyyEkH+s5h+P2N/bM+Zgib0UYSuy7tCb814o3OKnRIlD5536M9dL/W8yju0+x9If0FQC+TJxcjzdXX4qL3qns7nHCyM3qyAgUYpNZ1A6dX4DYBu6ukHOGid7wi6RT5hDL+8G6UFaXnNpRO6kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049970; c=relaxed/simple;
	bh=vxWtWY3HzhdcLD80hVcaFM9T8LFY9yejGPC1lkqa+7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faCKrCM3lGNcqQP2iV6cRbGSgufwMEwRC6Zx0nqFZ1Tz0yS55/Iz9Q90lh4CDIL/0ny1Lch2yUkJ8YGsKrZcWMDzx7s6bOlwwSWkC7x4SgM2def6d2kpMCJo6tYMA1G8257GLv83oC7XNiw8fLRLLRpvHabW3Rh55BIBfh6wWw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcyejRMr; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcyejRMr"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e59b02972so99833566b.2
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 10:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049967; cv=none;
        d=google.com; s=arc-20260327;
        b=Qen218d1MmZSEgrCCEigTsphhMVOe7MP38APKI1f7UCrNGUCNX9V03KrUKzENzB3KK
         +gJMtM45Rp3clyRk1fpERsRqQoY2x36MM53yjmgO2qSrl+RYxBU61mc1D5NXsECTfUH5
         jq+6Q/120ZBy1M999pWo2CuJbXYpq0onWO8SWnDP9sXe4reb54hkwy7xTuRyKVizh98c
         Gafef452SGRbX+s4kU0UV1inbwHtxAtO5Ji3wH3BX9viQnv9BKKf7t943qHS9JMOtkfk
         2y06wXReykzBJVgjjvVXH//c/nphYEhJZQI72+NNlNOzyElm4L5fgn6rZ5rCXQX/Z1A6
         e/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        fh=Pj/IxKY+T7oFrdX/sWRwRmctwKKwkxIv1eTLiP5tn6Q=;
        b=nk211F1bnHjfhP7nBe3UDk2qRh0+iJrSY1epq/OWX746wjeOpdyRF8SDY+1FOPDxwn
         sbLaT0RFDkp9BgQbREY/3mJw4K9ns+dLp4PU6w1H4jBQ7L6X0x2rVMOKdcASbwzEy3ia
         iMx7nyIWfJRcvd5sqMfUlnLS3DSKoKS11O2YAMTOQP/LBidUJz9TqVlGbIRiKv+vO2W1
         U5JM4gaJB0RfrHx2RsE94dyFd+TlI7Dto38Tal4SVKp4ho/mG0gff4ydOGcpNOzG543H
         7g2uw69+BgMKbPdrfgJFg3Lj3x8wBhOayeGwEz0b2FXnKcFwf4A00HA/lGCQtOGjdV+9
         9EKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049967; x=1791654767; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=PcyejRMrMC02NXqrC1isSAAnSC6Izil6gzINNmGn1gaDB0rKO9w1s+lG4wHCKhbiJh
         0W5R0ZLQqJeVm58BkxQG8VYd+vDamlzFaTYUMuK76AUbgK6FM7Ybvtvhm2ruKzcty7Wb
         n71YcIQK8W5c3PFpImPgKXkFV74E1f3PSRBCPPUVqCD0NjeIAPEkVMJfqmsTfLqJi3U9
         ehaDKTV7Y+jm3GipEjcN3eUL8s3iskDUGMrY1PYBE7oTuUQR+8J+/cAtt4+powCydSvt
         gQdRtmCC5nzbKmoT+MJagT9RaBELGhWv0/PwX6D5U3uSqZYgJ+Jjha+CmCdP3TXh7yrT
         ALtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049967; x=1791654767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=qJecccgx25Y1+7Zdz4qsqTbRIy3Ner3k7za7Ifnlb7zMwlaxWbl+pMGtZrpw2dQczc
         BWLd7ea90zRIZ7kxWYtk+QXuRL226OCOa7zny5W66uyadKnWq+bLm53fKc5z2RL8AW/S
         XgLObHSbouEDs0nrtc9pBbcDm1d6ORFs7sx+iJACrTETO28YTdmG3NRhVjN6cupCMoA+
         nQ668gFdlt+g3If7AabW9p6AcP+EQxE38ffCBdUHsBDQljdc9dyz6zoN/eS8Vj1YORFh
         pTh5c6LUSH4yIctCAiwDWM460901RZiWeswN7cjnYVbdxoq2x4qY3YUUbat7HYN3guAG
         1O0Q==
X-Forwarded-Encrypted: i=1; AKwUvByqZ7fqAB0wi/B8QyMOOmIy8nFT7Ljri0ocmHYRF9iopNFe9AHGjCCytQPKQTNDENYwAM4=@lists.linux.dev
X-Gm-Message-State: AFuF++n789w23wlOGZH05hEe/5srucMS1dhHCWXfKdtVWx+u9zS/pCdI
	c300fPNs9c0Vp1Q/94/QzJvPrJNJt3s2r8qvHSeD3tDhmDTY7hK1S10mvgENLpkTiHzAUqwEBl7
	1wWe5rXHmB3aywEg3KikobZhvc+AjPGE=
X-Gm-Gg: AYBFou07QJqAL7h3veFXSZU9v8DXSwixF6UaY8Qk1tNs1J8lWg3fZK3dtsncfILxB8x
	hesiwq+Mt4mU44cg3Uf7hFENdNlI+Xw6iHdWz5vGIhnJ0TL2Souv7wzBHtmLDkf/5n9tPGdvsaD
	d9Zrb1YQvcV+eO3C0d38uxk8/NvBTKISy7gHSYyAhhPY9Cdr/Z4Az6MW+qI7pCCIZhpmgJ3Fn6d
	3HgmlL/7TxK26B9COS4O1Y9iTzUdY3uwd85eYQhD9lb2vt5/r18wnUw6vR+7g54m82eVKdv9eiV
	HhEmWNN/9xz4yM1c74V74er5up6D10RLwq2w0uDWZst684a+tFyaezbu2LJlNf7PLAftMuNN+EW
	+i9MvgB+6LW+IMIB+u1GJVeXAVOvWcUCtrQCwsxpNJWrYTeu0RB9Uq1s6eCz39yiK5I9vAHycO6
	/9fcfGgjLnnstzFHhMpMhoc/b78RgUsG3Aq6VdL8cW
X-Received: by 2002:a17:906:ba8f:b0:c2a:f1e7:d1ff with SMTP id
 a640c23a62f3a-c2e4a8fd869mr493909266b.4.1791049967157; Sat, 03 Oct 2026
 10:52:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:52:10 +0300
X-Gm-Features: AclHuK-UG3tTAL01WV2ZDjC5tjM6igwBQLvqa3RPpfuP_ptSFYX_iuwDV1YsoBk
Message-ID: <CAHp75VdyMJUBv9Y-4vdAWp2f2JB0toX+y7hV_esXxtni0wXutw@mail.gmail.com>
Subject: Re: [PATCH 5/9] gpio: mxc: use devres-managed PM runtime and dev_err_probe
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Switch pm_runtime_get_noresume() and pm_runtime_enable() to their
> devm-managed variants so that pm_runtime_put_noidle() and
> pm_runtime_disable() are handled automatically by devres on both
> probe failure and device unbind.
>
> Remove the out_bgio goto label and replacing all error paths with

replace

> direct returns using dev_err_probe(), which provides better
> diagnostic output and handles -EPROBE_DEFER.

...

> -       pm_runtime_get_noresume(&pdev->dev);
> +       devm_pm_runtime_get_noresume(&pdev->dev);
>         pm_runtime_set_active(&pdev->dev);
> -       pm_runtime_enable(&pdev->dev);
> +       devm_pm_runtime_enable(&pdev->dev);

Definitely not.  There is little point to using devm_*() if you don't
check the return value.

...

>         err =3D gpio_generic_chip_init(&port->gen_gc, &config);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to init gpi=
o chip\n");

>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port=
);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to add gpio=
chip data\n");

These (and more) don't belong to the change =E2=80=94 split it to the
logically isolated ones.
One patch for dev_err_probe() and another for PM calls.

--=20
With Best Regards,
Andy Shevchenko
