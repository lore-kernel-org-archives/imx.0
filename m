Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E2E35F18
	for <imx@lists.linux.dev>; Wed,  8 May 2024 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190234; cv=none; b=jYtVzfiSFT+A8P+9yU6h39ZGkRA1IMU5mYBCExjMWOiEAowXXcoS8t6L4UoSjXtLpXUBdTUN4Iuf/NurwIMqNFX/gk0SV4KMIECbGvXAQmvuGnKct9JRtl3rYPmZCU3GCZ87ET8ZHqDjoI6fJeVVoIcOp0lP3DL6u4otfS/J4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190234; c=relaxed/simple;
	bh=GlmaXEpUPEAQv38l0+uXNYHgdFDEfZFJKr1OuTg/q14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=md2S6h+X430ZdB74RNi3cAWP8BeK9Ux2+3U8dvq49rnqDeI+cbbDDKB5UO0X2BRUtpQq+D9Zq0RDA0+QIlJRdWsUthb4V2eOj2KYC3O6yX/xAoeNus2Fe6ijpVhWieajkYSuoy5BABZvYlj4MXHiQbQJeXy6Eh7u3jQCFny8Gsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMc9OLsU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMc9OLsU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f447260f9dso60122b3a.0
        for <imx@lists.linux.dev>; Wed, 08 May 2024 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715190232; x=1715795032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2iBgujy0OnahX2J/HXjxE27YjCfQEv+29oMFARQDLY=;
        b=OMc9OLsUX6CJ9xjILTTZzKrrPmIZ4DrGYGZfXiCmBnAsOazGfV4EuMvwR7jz5ukW8S
         txSw1wBoZDBtx4PH1CX8vcsUbVhqLcWX9UCKQmXslaq6pJ8Lx4le3fXbr6IwGkK4sn0y
         mMigkNypNdqvpqKQB9LGEoL3OA3BsMZ8GxJ/UsUWPRi7MRt+RMUA5ePfG7tK4gg3OBAp
         gtAaEsC/WYT4uWnD3UKtpD9AklJOBKIiqmSw8w2FoMaHvcUgdBeG5cCKxYGci5Wd+5ZU
         NGAcDkyUg8uPRwvPpp1HOAG2nzx09o1nD9aFsZjbWXg+v36QXncnwg2igJsxTliOVz+t
         JbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715190232; x=1715795032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2iBgujy0OnahX2J/HXjxE27YjCfQEv+29oMFARQDLY=;
        b=toz6N9lgWOUAr8jcNqsLMmRDfqdjjpG7uO5qMGnj25cUURhFuSSrnKrkDQgYWqdHVJ
         QLAsyLV3uVfqE9RuX5MMoeBxvB1cFYw/pHHB+0hqX56HVNXQh6FD+CjvwXytRlnC7C25
         Bt4l9gfMkmYCGEsrWeNL/LLwle+OXnpNbxMO4zmUPAEjQm28wbAjrYjx6kuoHsYKO98W
         J1MIIBxKjgfOFtBiGg/qQArqWt4OeDiyqUIknGhQYxPfVIhNLV72Mzibh3OKXbdF7TeF
         4pS8BM0RII1xUt/Hr/hboJiiUqK6IomeIpHbGH+eIU+jtSbDOSIjxEWhUWunz9DE2ARa
         dgcA==
X-Forwarded-Encrypted: i=1; AJvYcCX8BB1fuzIjjEwtQRJ6yxY+TbLnUi+Ds7+Vv4Y47aPbAN/sx1AVDQ1FYnRZv8bFL3SdjJ22U9UIvBy/ae5Ecx1Tf6pW
X-Gm-Message-State: AOJu0YxpXa/hzam6J9QZrNkIBOlS3EtTlh6v9mfhwnNRwWesLnqqfaJa
	4wlUmRDeEtze3OSWyL31KBgfIr7DnLAWGSvVC13WSKb1KLjFn8WZnCp+WszOHTl+OT9R+eev4t9
	gZ7HE4gtLPn01+9GgkSdJV5HhcI0=
X-Google-Smtp-Source: AGHT+IFNCDDSAiSeJeoQ+30FLHwPJeK88LACkFxqTrxmJnoIsjAJHHUfvL9LP70Z6C6Vj3Ca1UikUQhh+pxiYdXUWaI=
X-Received: by 2002:a05:6a21:2d85:b0:1ae:13f0:9bfa with SMTP id
 adf61e73a8af0-1afc8db7e93mr3770555637.44.1715190231927; Wed, 08 May 2024
 10:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418155151.355133-1-ivitro@gmail.com> <20240508174048.GA5257@francesco-nb>
In-Reply-To: <20240508174048.GA5257@francesco-nb>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 8 May 2024 12:43:38 -0500
Message-ID: <CAHCN7xLnSEPzvsWbm-+JquJrpOfMFwaE3Hd26Qhv_WqGaweUaA@mail.gmail.com>
Subject: Re: [PATCH v1] pmdomain: imx8m-blk-ctrl: fix suspend/resume order
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Vitor Soares <ivitro@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vitor Soares <vitor.soares@toradex.com>, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 12:40=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> On Thu, Apr 18, 2024 at 04:51:51PM +0100, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> >
> > During the probe, the genpd power_dev is added to the dpm_list after
> > blk_ctrl due to its parent/child relationship. Making the blk_ctrl
> > suspend after and resume before the genpd power_dev.
> >
> > As a consequence, the system hangs when resuming the VPU due to the
> > power domain dependency.
> >
> > To ensure the proper suspend/resume order, add a device link betweem
> > blk_ctrl and genpd power_dev. It guarantees genpd power_dev is suspende=
d
> > after and resumed before blk-ctrl.
> >
>
> Cc: Adam Ford

Thanks!  This is what I was thinking from the other thread.  I just
didn't see this one.


adam
>
> Francesco
>
