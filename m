Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8F1A9FA4
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770760963; cv=pass; b=pwenzjbiEK+bvFbMihVzCx+gRtUSLNxY5nyO2v+/wMQjkORS6vnruwc+JDosDvNNUMKZG+bLtC+OKMfTdn3J1eJjgtZVJDfothIyv4A5i0kJXKrEwU02qIiUEEiSbRUpp0HxTcANssq4C91b8DkZIuNonV45DQ/pP8m6tM2vPdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770760963; c=relaxed/simple;
	bh=Xoj4olL+YiTWgW9zmEIfi+/bzgXNCnIyAh7tU7+vqu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUXBKjrVTXJKdXpXPPs2+YilpVcxNuGjT5qBEpxAyv1RcC1T3e0cbqUMy76/bu/Zp8qN3JuqM/Ra2iesQWKQq3KIXk01YrqGQrmFfSb+ppDsjEzLRgELcDIqnCjkp2RZBJnvsQ7qd4D01fii9WnWULe5uuVOEoAsb4/mMDUhXms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xagQVYe5; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xagQVYe5"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65a26c220b6so1077590a12.0
        for <imx@lists.linux.dev>; Tue, 10 Feb 2026 14:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770760960; cv=none;
        d=google.com; s=arc-20240605;
        b=R4E11QwHrQXAxsI/FbtiTbM7vsrMp6OXI7VmiVtnMCvvrEZm1BFBK80uVotff2AJPg
         /ahX5rgRgkh2FS+BevTpx7+eEEIKbtVkFPqS7Rl6+z/Qt9IU9GCARtQXRLhorp/r+45k
         TwJYkr7377QKisQqvRDY3Pz+8wOgJ0j5LTplQRNfci5H2Wg2Xhw5oS7XplDZGNBd51zB
         4An53MdCE19PG+CdYFVoIejewm9/dGkI/vjJRu/3G+AdKKYzCbcGw7V6XCRmOudd/DmJ
         MiAoldvcGaGfiDC4zXumdDoJ5PSWLg7WeiYZalg7KgWFFQpTBdA0uAAlry/9E3C/gbG9
         9zRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        fh=TeL0k6C+3lSaaI1UIE5C1DUDaxUyKx9VPC2WFQnCMU4=;
        b=BbKLTeL/lZ3NjVigrPv3WCqT8N6f043SbrkE7GHP0/TdxBZcvrZ10s4k5he3si16ms
         Ii7si8veFHgw0dAbEuM792k2Q9B8Kjpj0RsqsvXsjnf01dSaPrPd/RiiHamtVoISNB3O
         zPQRN0AZ7uOnSAnzGwUAXZk0u3JoxSYnMKADIX8FYUP2LPYrr0E+36+oPPg038vqO9Au
         6kUMVtKvwBb8/HeT4UC4bALhYo8ScGlvIDO5rGEhU0rBc/YI3BzqEdPSmhdXQUfhiS4m
         rLS/dhS6MCwGHBjRvFCDsgcKdny6iIKUI2SykOCIYLKMqmJPapOzyMB0E1jPt5cXUgNk
         pRlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770760960; x=1771365760; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        b=xagQVYe5Hmwxg9v3Dr3Cr2sjb918JCAYJz733Qpg5AnvVwN1QbbSfHbupgbhlLAt+Z
         MGgOt89CItWucbrIcbPMMX9NpQMmLAGwU8WIZZTW02//IMz2JWKKAMvJwr/GwDwZumfp
         tFp9LQ7dgkXThInyQD+gIrJikdxVxybQbkSM6ge+T9+e8e+80WZlTdeJiuU5+aqAJIg3
         0B2tQOx8ELEQw+INaHrB+wamCAzR11GxiKPuw5U3tVpqLSNIEQ4ryNYJK8yBEvP6kH9P
         1JF3n7PISfZa6NuKHrEEF2vZwfKkYkS09B8XnvenhHPwPtSOIasSSzBBIaadh33AF3Bk
         T1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770760960; x=1771365760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        b=r6nnlLLiq0PDzjZrvZQPSOMjsMVyV416JjeJKqQbSLac+XYpbE+T2ckmm/kKTTMFyb
         9+ZQ2HmnJs29e5c2xSbPJbjFIj/d0T67W6ZGpX5SovWb/YEX/enRIkTDRz5y0lonXF2B
         aqjwkY9KgXbeTxrpv+W5y4FIrj2JibmUmDvCWeSCVSzYDY4b2yWP6dJcrevyy+ong1tf
         JMy22geOgv0/esT6ekIE02ExUjf7le3RKyrKR67x1BL7sfFvJ6Bf0JwEljmfqMkIsbt/
         KHjbbWmUfswYMt9b98Uu+aseH1znsHf5B1RdIGbnsswbvyICxnx1UnMJtiav/sA3vgXm
         MYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuLIs4mXMKJrO7zNkYKclov6HC3xUrmtFGBaC0qxjbrY3IBgYr6tDJOZ2jDxTYX33cxME=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrJLg2F1JD8F9yKuQa8RjnZ9iRXYJGkYb9Bk6khFW0UfMThIa5
	4xHi1r65zODXBdG0Yx+vb1UJJLE5WuiykB5V5Dsms5JkbSST16uRv2ObYDhfOarUbrgQYhHbl80
	IGEd+82M8VpBVp/7LDWNvr2VbDVzX1SYT26KYYnkynA==
X-Gm-Gg: AZuq6aJx9tt/f2bBnzpHOid0ZVhAfyKlN86tbN4aoh04AkpdWG8NZd/SiRF2z6agiv0
	tuL9TmHDqPMF9JpjuZdFCH/hAtnlSnbKWRL3MCcyVQgD6R4vyRMdk8fpDUR5VXS7EB48XQ3633Z
	3Fw8/ACI5u+eKOOWESOq1mJyTLcoHEwa5jbYZDZvoKIoS/xhmqFwuqlU1GUOwiwTWmfv92kD1T+
	LbO53LQTf4onjyBKFbgKItQcDLmvjhIsnCHjmNR29xdN3QslNxWWR0nb1p8Y6dVDG6EieFMkoxz
	k2V5JzbKzGjTALahE8wBQDpMghTSqPHnUefoCjt6+g==
X-Received: by 2002:a05:6402:2747:b0:659:428f:a6c0 with SMTP id
 4fb4d7f45d1cf-65984195a6dmr8461697a12.20.1770760960108; Tue, 10 Feb 2026
 14:02:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260209051407.1467660-1-nichen@iscas.ac.cn>
In-Reply-To: <20260209051407.1467660-1-nichen@iscas.ac.cn>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Feb 2026 15:02:29 -0700
X-Gm-Features: AZwV_QiEwWqMd-kvx6163w8_DnjRXZIR5SwPqJy6RBJlGaVXXNh7W1JAS9Kje6M
Message-ID: <CANLsYkwVL76mt1BcKb8OkMBCH5UzrO_rp9ctuGoN1uo7QmYcgg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: peng.fan@nxp.com, andersson@kernel.org, festevam@gmail.com, 
	frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, s.hauer@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Feb 2026 at 22:18, Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Add error checking for regmap_attach_dev() call in
> imx_rproc_mmio_detect_mode() function to ensure proper error
> propagation.
>
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
> Changes in v2:
> - Use dev_err() + return ret instead of dev_err_probe()
> ---
>  drivers/remoteproc/imx_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d67905..75baf905988b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1007,7 +1007,11 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
>         }
>
>         priv->regmap = regmap;
> -       regmap_attach_dev(dev, regmap, &config);
> +       ret = regmap_attach_dev(dev, regmap, &config);
> +       if (ret) {
> +               dev_err(dev, "regmap attach failed\n");
> +               return ret;
> +       }
>

I will add this to my tree when the next cycle starts.

Thanks,
Mathieu

>         if (priv->gpr) {
>                 ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> --
> 2.25.1
>
