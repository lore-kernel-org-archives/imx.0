Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF90280024
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762329879; cv=none; b=ipPGiCCbb3HuonsoW3nEVqi00m8umwUwFOls2wz/81Qz/qJ5DdWI+fifCqg2d1iPgocUWi262/MX/ikZVTh5OZLGK5u9QSvjwXLmn3+nLUDw8QuMGG3j/qjwx4nP7cNQKzWpQzguGy1fehvqsgNrGiPUlA4+7TFnU/w4FUnkeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762329879; c=relaxed/simple;
	bh=LsTjAm09M/yGM5svcRs8AIkfB2f/URAn2Y/ln47haPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzUQgr3aLvsKJfxBgB0SH83LDmhIr4Hqk7RH75B/oTWYmb7Z8adBJ+FkuSOLD1TY4XUbL6k52+nlDLKyHxqUVydhiNC0x43avd0E+zF3tiwL0vTKdjF4rwwEbKzj4vrIuOMF00xuUvNr77ZkM4gf4onLZnOTy5jzRfjjKi/NnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+DeDOHc; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+DeDOHc"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso976088a91.1
        for <imx@lists.linux.dev>; Wed, 05 Nov 2025 00:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762329877; x=1762934677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDe6kRSygVEphf3RSRGt9HkF/eyEhvziT45X27VBXsM=;
        b=E+DeDOHcywU2DOJlOd1Yb2ABdwtN/WvEyPZ5BYZ33SugwmouSZoRGuj8ernaaHdgsB
         CA8GSHfwg3HOnA4gM1TxobJf4KzIx4gNhJArRlsjnrLJVLAxFXZ8ZDCkd9vPORoE0hVs
         8qqWccMcxg8uUl3P+55ymgrjdY2FQFLUkoM1FbTGC20obkj0EzB0nreqccpm1PWppqmf
         DSUV1TvjVMuQGKcL3bu9sgDM+aGH+SVcLdJa5a1rqG2sXU6cR63ucn7Z/HF0emD2UI9D
         6/ttsi880K2Lwf2kgEvRLtY4mLJfzbaHt0B7sORnzwu/Ss0sZQoXCrwMnaJmXahmOGSZ
         Qx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762329877; x=1762934677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDe6kRSygVEphf3RSRGt9HkF/eyEhvziT45X27VBXsM=;
        b=iJNy9r5L+n+Lq4O1kEWATYMTmKPoQW+0abQ06tymqfwiby/30/8SJLc7p5ELQoZK5E
         MgPACr9RfTS+dR8eSfWAottKoo92fkZHgg3oFcco62sZ454dt/eP2eKnEijj3e76dOr4
         CSPtPOm2H/6lqv5wd+nQLMFyNl5UeQRJpIU98ncTjAlkoKswXMJPALCBw9YLrfECovYe
         BB3pUDf81pECHSTnsbtU/wWeITYzrReFdTcALSVSi0uWeqseC4tL41uWPzrVLdNXYEkL
         uId3ryiBo7Iy7G2ADFu5VgfkvNKrXtE0BZazbMB+8TA54jIEq1mT10LtpIlcsOffzx1M
         Gb7g==
X-Forwarded-Encrypted: i=1; AJvYcCW/sz/roe2/qxYKdzIwtLcDgBMLxWbsY+Y780FkNYu49wc9bMCwVINBJQ/ADwA6gJ0gJfM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzec3h1DjHf41ZJjZLNluskvi03ITb9wVn+34FB8ySHh5qAdSYT
	V3XkstNcvpnni2zrLDOPYEysg1jlQfp4BIJDqgol6eRDo1iw5uu361sdtMkNiCJRU42Gww84L6Y
	xt7vOZyrKy8/nsGk0Ktj/WVjBqXW4gcg=
X-Gm-Gg: ASbGncsAwsS4iGT1f6W1w7nXyTyxSXuuBCGQb5nY+4lqpwIE5ASK2f/X7MBNImcEogS
	WNrMkXz8iO/JnBWEKaY5fqHPWLniC4rvOFSgH6XpxXw8qugNBq7x0ONb8Rs9FTJnZThvh74Z2+k
	y0Mj0IApg5TcjBtfmSyrupW+vEV4ctbLURnLL2fA1OFvO2nY6dBr62J8bsssy82HF6blL+KF3fm
	TBWk6pIYRTKjupSbEUOkfZpIdtxy8BzhYtjTNHboraMzNJQxZAlClXO4m7QOWAWEviizz0=
X-Google-Smtp-Source: AGHT+IE3kiYdO6A81tH3ocwujCNPCljvOzypJY9CyERGKSeoHzPi5nZ+xfnpKr+voNC9lIaFIPYuRWd+eHWQF6ZoNDQ=
X-Received: by 2002:a17:90b:582e:b0:32e:6fae:ba52 with SMTP id
 98e67ed59e1d1-341a6c1e406mr2591161a91.6.1762329876771; Wed, 05 Nov 2025
 00:04:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Nov 2025 16:04:23 +0800
X-Gm-Features: AWmQ_bka9Xr4B-LvpKHRbIbtt5BkAdNQKoTwEnWv8Ppu3FZE5Ou4N-m9M6c5JNE
Message-ID: <CAA+D8AMgXCcQuH3SWh2UU5ib0h3EqdJOdXTkwyFx4duv7qL2Ug@mail.gmail.com>
Subject: Re: [PATCH 00/11] remoteproc: imx_dsp_rproc: Refactor to use new ops
 and remove switch-case logic
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 5:14=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This patchset aligns imx_dsp_rproc with the cleanup and modernization
> previously applied to imx_rproc.c. The goal is to simplify the driver by
> transitioning to the new ops-based method, eliminating the legacy
> switch-case logic for a cleaner and more maintainable design.
>
> Patches 1=E2=80=935: General cleanup, including code simplification and a=
doption
>              of the devres API.
> Patches 6=E2=80=9310: Transition to the new ops-based approach, removing =
the
>               switch-case structure.
> Patch 11: Remove the obsolete enum imx_rproc_method.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu wang
> ---
> Peng Fan (11):
>       remoteproc: imx_dsp_rproc: simplify power domain attach and error h=
andling
>       remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>       remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>       remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mod=
e errors
>       remoteproc: imx_dsp_rproc: Drop extra space
>       remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_=
rproc_dcfg
>       remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_ds=
p_rproc_of_match
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER swit=
ch case
>       remoteproc: imx_rproc: Remove enum imx_rproc_method
>
>  drivers/remoteproc/imx_dsp_rproc.c | 344 ++++++++++++++++++++-----------=
------
>  drivers/remoteproc/imx_rproc.h     |  14 --
>  2 files changed, 184 insertions(+), 174 deletions(-)
> ---
> base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
> change-id: 20251031-imx-dsp-2025-10-31-260b2b979258
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
>
