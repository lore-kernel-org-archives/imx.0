Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECB92FD7A4
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334965; cv=none; b=VMzPLpmP6/XUqNnC1HBxdhAwB5CkqmxYPIb7otHFD6WxY1yX3loCyKvZxmPEroDXD7bhx5txMNfe4yDpmv+0N+FLXXx9vlxUiuR5i4pj1NYzWB1/vrE9wbm9ac8hfXjG0HuY2pQVjnwHshUkqniZvrXQVpsF3ExZBFopLbdnSAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334965; c=relaxed/simple;
	bh=0XgQsaPK8SkvjG5BCRqme8oV5Z9wnVFe1B2vfhJEqDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwL3qOne5Fm9xJIrdxk146kYZDEPFOguzHDxxV7t/sZgnqo78x8xatpuebZT0TfQCgFjVQ2upkX8hr5H58++zzBPPLGatzUFxBmMEz3oLMkSGLvHY7WfnDn0phql1R/7f9EP83qYX8HqYq2/fTJGLulolCBsY0KWuoLIoYE6Av4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aybyUNml; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aybyUNml"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b9ab6cdf64bso316828a12.0
        for <imx@lists.linux.dev>; Wed, 05 Nov 2025 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762334962; x=1762939762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txxoHQsD9SBr+0uAjaOafgKfJPgFXKi5Q4JCWLCgjxk=;
        b=aybyUNmlNZU8d+s0MEN6xl0Lnf/pnBI5+Z37+gbK5TcdMrUiWSl/6x9r73aga+fJ0q
         aPyjdT1/w3P6OW1pEiW2mAhmUgz72PD0jTpu3kg6xk/NbZKiMDZMxFrfWbiQPs0kNJVC
         7hzkV8F3IMDjbTdzwf298zqkUV4C7Kt76D+Xrq/V0ask/GwalD7pSWS7jBkeeXD+8UZA
         Y7z3H0YQ+8nr/4oBg6Q0AlDu5Vzu/LDByJQn+EjPGGpQ8iaFo57NzMVk/uZW479hvHdP
         t8ilwWvHdocrVks/bKfe8lnzJKIAlPPeRaJvuIn4Y7fpvML3uVLQBUc1z9yZKyRTq2AW
         c0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334962; x=1762939762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txxoHQsD9SBr+0uAjaOafgKfJPgFXKi5Q4JCWLCgjxk=;
        b=YCF0OWUKPqDbaXpdb1tfSI8TPjqtKNGz5VOthme91QMhtIHwLkzUGbl5CpWMOYIPON
         JEwHARm0bCHMTW523ApFME18Wd+Xn/GWAzipn+g+PaK+lNIaZE1RH+6JTYjMl3UUWd2r
         YDAUUYi8r2W5t0N4pVXcK+AdBsX6U8jIYWvOW4DUBAWxO7DXCT/a/Gw7coe0+yYbLKaZ
         ks94l3LcZHnt8UUJJsfYDVZUz3Tn35GyiWOM9TJOoT8alNez/3mkoK6g9FKoeQvSJmeI
         E+Nphp26ri6rsVAnj0ha/YQcFyNav7PBrmW58x5R0elE46K9waGfvRhoSZgGYe7cvSea
         gTgw==
X-Forwarded-Encrypted: i=1; AJvYcCUHq9x6+0b+nCZ8pcJ7nao54zhIX1HFznkgU5qWBgxg+S2rpb0oRjCQ4bLwUqBuNilPuRk=@lists.linux.dev
X-Gm-Message-State: AOJu0YywrD5YsRrnT5tpd3Mt0dU9kwj/4gGJXUZ7dzs3XsIAwSFUW4vk
	gobraT5VxhmG9n3YoBh2kWnPigFqoRmj4vSLOPNADRcYGoLJ7Ka47T8xXx3L2bnbEKSXyzxnCM8
	rskOzOuQkZ8cTfdmI4GSBIVIwNKEThvw=
X-Gm-Gg: ASbGncuOquzmXEAMzoIr7Ck1Ms0Es970ZC8pEFLp4Ka/f+53mBvkJFBSiGhHSbhABa5
	wDkJJeo+YeLVmmKbxpLWuPYZYp5dqs3dfrfpOZSQRYsYNMTCXkYUTanc5ykm4SXbGWYAwMBZHP1
	cp357sEwKTcWgRP0+Dl5oCezocnaJ6PDENqsiZ0ZC7e5p2uIDirAgh6yoV4eH0W34TlzllJ3nsS
	Ykm3NtDLMIGLTnemM4kY+NJ2vke6uUl1Slrce3VHv2ND11NKNmCKnebXw==
X-Google-Smtp-Source: AGHT+IGkCxRvJh3fC5yidm37chqdIHgljJdYABqu7mHMgdmlemqRQI0lkZmwfrypszqAHRlZ8j+gATWb4FCpIOGaggI=
X-Received: by 2002:a05:6a21:999f:b0:334:7e78:7030 with SMTP id
 adf61e73a8af0-34e278f99b1mr8298964637.8.1762334962544; Wed, 05 Nov 2025
 01:29:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:31:49 +0200
X-Gm-Features: AWmQ_bkrt0ospuWqleJ6w_sx1LCaBE7SCRpsPmV7R0cWe73tR0hYLHwUvfH1Zeg
Message-ID: <CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com>
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

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
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

Thanks Peng patchseries looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
