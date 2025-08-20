Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B87D257853
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755673327; cv=none; b=p8NzM0OM8S/0t2Za4Fjf4dWBU4oCTDew8AW/Mdwb7Pyw6+nTYkBm3MbZFP3sFaT4+aIAItAgcRwZfT1vMM4B2hyQgrwlkAANypSD9sy4nwRzjPYk3EnTBVtCcaIfiWoDC8RzOrqXdblXWXM235TfhRIEjAgACnuYZZ72+bZGPDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755673327; c=relaxed/simple;
	bh=i4ERcuBkz054ECPJjThNCwPQD6jSP8StzwVOwKtQP5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgvNNxI66lq2how+MOu5AGT1LZT/6iG7YkQloseQbNRvRDy3655yuqLJi9lpkDM4jER4QFLeRJIzNXmnvDu7grA6/s5nN33ctpEUD7vAYM/bKJFSPuSwMNqpMJIlMUSzO5QxpCHCJWoB0DX+y0GfStkVajzytSHRCEEn+I7U86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF/usosC; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF/usosC"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4717ba0d5dso453931a12.1
        for <imx@lists.linux.dev>; Wed, 20 Aug 2025 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755673324; x=1756278124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4ERcuBkz054ECPJjThNCwPQD6jSP8StzwVOwKtQP5o=;
        b=JF/usosCK6cR45zQFUEL/tmDZtdrsI2QoQWufdnUKEc1LiCsbk6ZakTftIK4sUtT5r
         NAfyDyvt+rhi6HRtHDiLg7CvX0E3/x7HYLfVAREizmmoNkiTV7DDr6FVhZsWL5Fmgc1K
         REsIk6Bghgxn7pSrHau9nyIBvcuY4bUhC+i9awMXj8s/eVYi1uJIbMDhBCg8r7ZKfL0V
         fCf6SEUjPl33Op5UAEKDrvQ2cLsGDX+GeelkRJENciz8yARhbHM/l59D/QUk7jRLNCXU
         hZG/h0zHe+GlsPd5FhBYahUch6FjruEyF9UAnTh3/nw8Q7/Wt2VwLH+H2zu7NeykfuqO
         jUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673324; x=1756278124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4ERcuBkz054ECPJjThNCwPQD6jSP8StzwVOwKtQP5o=;
        b=CQbsZlP6xIagnYs+LZrTwWahI/iJY33evjV+K/Q3naAnwTiCwEakTLFaPtAf6hQ+Sm
         aQjBYGz52KsQg/9zAJwCNOjod+du0bW0EvV6jv467hVZkZV6DKP54k6vOGl/5NYKGXK6
         YK78+xdSFufNTy0CeSiLAe0v9vQ70icpSO7BrhsUeVoJCgm9QEPWjuQl0LTBZ3Al43qM
         XO1cSJAfSvH/1sYgTXmZWSe87s5YAd+m09fkKDJwKUMlsGFA5VzxLEN4EocX7YJ6394T
         E/hCpsIkuuFLBQ0PHfuDtSO9ETzSQj/w2HMxepqBSnQMyZb7b1mi/cwGv9/hw4Yd5jLo
         Hljw==
X-Forwarded-Encrypted: i=1; AJvYcCWRKKjAKFl3efUwcIIaarZ0Z5DhFEKHfl88ATbsDtd1gPO8GET7XM+wOkgT6XjGKzISS6g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD6dleaRTND0UXcQtdgWhoctlvcHKIkqkRysdTZk3EFZgZklu0
	nCplkUyai6kVS576LtgLF9TcDgffNroYxPfDRJzSgBSlwbDQDijxxZJm1Brbd5vS+SQ5jFmby70
	PsCZIvkE+dI+3JlCDIVfuGWtCTnhGXkQ=
X-Gm-Gg: ASbGncvkIm7e5RLSyzQO/ODggP/imljlWIjbDW6fNy/J3GTt0mP4CkAGpq+weuzns6O
	QW+O4zGmpue1D/HN9XUgz4La3ASzlHAfLT8GZT6ogPSqUYyYJuXAYHuajM7tWLbgDhRWdtGrB1n
	NYZcZSB9nMBI1vQZsRBJ+PRV/02pRLSKZxmTfn1JJ4HhAfsTP/2bOjW7TV1d9wmEhrZkswNx39F
	Tfy
X-Google-Smtp-Source: AGHT+IHHPFivguwx59JWvlat8wg5hbDcpzsuPKOdRHB1YVSeDKLyRD8WBPzrIKMxhH4SbHdZoh8skwBl5m7DkXSMwqA=
X-Received: by 2002:a17:903:41c2:b0:23f:fa47:f933 with SMTP id
 d9443c01a7336-245e0930050mr60894285ad.8.1755673324182; Wed, 20 Aug 2025
 00:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819112654.588527-1-zhao.xichao@vivo.com>
In-Reply-To: <20250819112654.588527-1-zhao.xichao@vivo.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Aug 2025 10:04:15 +0300
X-Gm-Features: Ac12FXwHe-YqwF-mmb4ygo_BKMAbaiq0WCeVkeFd0iiGVUmGKDnWjNYFXTSpa3Y
Message-ID: <CAEnQRZB=fq7=ahMkFWaQ58SR_yftSTYqZKFBh7YEXz2M7PyXsQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx: Remove the use of dev_err_probe()
To: Xichao Zhao <zhao.xichao@vivo.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
	daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kai.vehmanen@linux.intel.com, 
	pierre-louis.bossart@linux.dev, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 2:29=E2=80=AFPM Xichao Zhao <zhao.xichao@vivo.com> =
wrote:
>
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.
>
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

NACK on this.

Quote from dev_err_probe documentation:

```
 Using this helper in your probe function is totally fine even if @err
 * is known to never be -EPROBE_DEFER.
 * The benefit compared to a normal dev_err() is the standardized format
 * of the error code, which is emitted symbolically (i.e. you get "EAGAIN"
 * instead of "-35"), and having the error code returned allows more
 * compact error paths.
```

Thanks,
Daniel.
