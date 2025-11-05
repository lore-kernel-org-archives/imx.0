Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFE22475D0
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334498; cv=none; b=VQr5r8GRoGnZwY4hBv+laCuCzwyiU3ZyP2cJSvQxyWV6lHSfYw1jPkMEmD23Bp29Rm5yq+f0ZEdlN0RPRioyiLY4r+0JqpAztMU9MyHZAfjaNWBqcjlECQ3szZ+Ljnvo4Ss2bBij6JATcIq+kQnyhJg0cqJ75BpMU0W44X0jsd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334498; c=relaxed/simple;
	bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffZnIjt08uHegXuxWTW3rRTUHWWly5HhbO0eP8MWqXmvv3NNW5yYXoeipMt3aBGmXkzLRqUvIzHzy5RhBACQkHLa8YeNnHCOVkYLEt6Bz5Z0juOKr6gMtnmsAJGuY3WT1vIZ1s7Ga8vp9fKU07etjEJ1YXgQY+G+yMNE6Ksgqtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkaFCGuc; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkaFCGuc"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-794e300e20dso531859b3a.1
        for <imx@lists.linux.dev>; Wed, 05 Nov 2025 01:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762334497; x=1762939297; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
        b=XkaFCGuc8l3OYIuT9PtLe1B7OyungdIncJxlcBpJ8uqll+z/u6mPQFTIc8wO5+IYBy
         ZpSh9PDHYdpUbL8JdQmAd7OQxrMgk3NRMToIoK3CSNzx8IIPWSPRXUvU6UZ2A+8x86Fa
         tboIgvSg0e6rwYh1WfYveHomY6ku1xYhPJ6eXyKqvmfNyyG14flEWJHQt4yr4iAmNXPE
         FmKPdJ6e547l66xkfTQrBgNB+5/8/B8u6ygng1OzcAsZz+P61bsnNMP5WzH1LsTnTmq8
         We5NoJiKuFfe3Kh+Tg2z5L//rXoDmnbJtvodiLNhYxD1hq/x4O71SMUygomYJgheSTd5
         in4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334497; x=1762939297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
        b=elPLstVOcJp/w3N2GtJnly8JwxBqARY9hbaiMDk67cwpkhw7IT97NHdAbR0NdLh/Aj
         eECj1LJuOh1MBQ4cltHBoqpqHKUQ8seNOYzykHl6g0hHNj3zBMxEHyG1LmdMsc4GPbj/
         l5oDt+18eXZ/ndzeGk96exst0UC841ELlGS25WFQr/ILeHSfcumkFfBsvoBIZEF7tmJi
         K+6RiGzYXfmTH2uA1uLYdLpYJqYxugUkvp3TsjoDct2lAikKO5PNLH8dUCKHQEbUHGZg
         hiGCkfhg1AC0Z+dipMJHnZ2yYvXDkES75zoH9Buja/c+JOB+Dhi3kLCrBPI+VdnUZkSR
         85Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX+0xg8wHUWhQLpxsRRujT3uByQOd7hrhsU3B73QPr4r3ObHPT7tFG561V3WEY1Xd147Gg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywluu1SwbuEBih3528Cu3KjAoxS6iHtb8NjadFR0l1IK9e8gCNL
	J1FV+2oSjI6vg3mKZIKS5PhnfVx/ypleJvZH9SxpozBrtxF7cTK/AldFN/9Dn3ke6rDiLgLdrdR
	lMLuSVjpqhPaPFmGxuFnmkXKpl1QYNCQ=
X-Gm-Gg: ASbGncuFREWnHCuYzhXih/cAkJ1KKBtWEnkV/kbp/cPnU7392U2pwKI26+g+J/t6pTm
	ILDqc85FYr4/vJnHkrkF2htXps0TrcMYofks5rnfwwZNZvE47Vqdr/R2WlBd6HvezwBvK94LoTQ
	UH7F0Rf50lp2WIHAlhlL807NQp/YgDhu2MrAxsjYRfwfTqUkbsRrVJnvVa9rFu/ndgs01idxMay
	VYuaiY9aX7UWllSlIEmta5e1pZ9VTadrWfBeqEEdrLH2WEY8hJj1OVujQ==
X-Google-Smtp-Source: AGHT+IEhLgnnarruJw6eIIB+8bTnN8uYAF3Chn6W7iyK13efG69zCQaoyAaLYmuTmnpZholD6kqVshKjrwpDBWN3vSI=
X-Received: by 2002:a05:6a20:d049:b0:345:4b5a:16b7 with SMTP id
 adf61e73a8af0-34e278f999bmr7748938637.11.1762334496625; Wed, 05 Nov 2025
 01:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-3-282f66f55804@nxp.com> <aQUEzx6sobI4Yes5@lizhi-Precision-Tower-5810>
In-Reply-To: <aQUEzx6sobI4Yes5@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:24:04 +0200
X-Gm-Features: AWmQ_blaxwVbzKBmJKN_0Fj3HFefT03QXEkDQ4Lh8h-h3RbucXTuRrqR5o2qb58
Message-ID: <CAEnQRZBNzo6RKjNf4JxxxjxtLCFfEGMMt2fSK4MdVeSjtF5aag@mail.gmail.com>
Subject: Re: [PATCH 03/11] remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable()
 helper
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 8:50=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 31, 2025 at 05:08:32PM +0800, Peng Fan wrote:
> > Replace manual pm_runtime_enable() with devm_pm_runtime_enable() to
> > leverage device-managed cleanup and simplify resource handling.
> >
> > pm_runtime_disable_action() not only calls pm_runtime_disable(), but
> > also calls pm_runtime_dont_use_autosuspend(). The current driver
> > only calls pm_runtime_disable(). But this should be fine here to use
> > devm_pm_runtime_enable().
>
> looks like this paragaph is reduntant.

This is not redundant! But it can be phrased better.

```
Current code on the cleanup path just disables runtime PM for a device.

Using resource managed version devm_pm_runtime_enable registers a
cleanup callback that
sets autosuspend to false and then disables runtime PM for a device.
So, basically the same
functionality as we don't use autosuspend anyway.
```

thanks,
Daniel.
