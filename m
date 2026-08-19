Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF12F745D
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157436; cv=pass; b=rZ8cKUPIRZjB8e8ranKwk0rn/rTiIqSQa4LaWC+zXeTQd3nDhGrkFmL/7yPuLRzfHl30T/e8mA8PQPkb93sGBG5BC//c1LXH9h9TJZsjcROieHvAjmmOYsJ4BzJRpaXiQW9E3TFxx9ewdM62K3SrHQCNx+KR2Xy9hyyIPLYJDRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157436; c=relaxed/simple;
	bh=9wzb+bkXQhH/592dFpKoXLTjmFDLvUUzyCaHRErkhcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKG0Qaxfr36V1e3A45xUTpZ5PIiwzgOgxRho5W+6r+U4+c/CG1ULuRrI3cCcr9EcZxOXPlRnuOin87k628LLQW64D165aIJqQqYHB1BYknyTzcklFAXLsIkKFmluoaKGLZv1HeFp05+J1x5oCpPHxOuImZ37b8K3+2vTYYxvfjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cC92+7JB; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cC92+7JB"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso1622136e87.2
        for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787157432; cv=none;
        d=google.com; s=arc-20260327;
        b=rgzskt/8UT0Njn9hI46ykmPagfoS+O5eNev6obQQER4yIzPRAxk7Xhyguf64E9IUhA
         +LCSRPGtZoIAWiL6BQR7V2/i2rDAhOCfzBkz7VNCGh4evQ1L1M/Cm4EYglhcaDgs8bKN
         tNSax7pzNjPf+LlkzxruTteYxCIIsqq+ZZQd0bAq91ZwXYRr5d+UylwuKG2X6lhoUlAL
         VoKe1G/x7gTpJA6GNC4+0UTJ6nqT/PeXY2U/wj7mXYzDgw+YqTZBf2oqbnYpCUDgM5hr
         rto64jOKexIZFmN6uonCyCW9MySi/3qls4TVf7G/6vFtm0j9ElXKnnw+AEUvYB9NxShi
         rs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4/2vYKJSDxn6CwCgQ44O6XRlCA3F0xRGLPQF24ansLE=;
        fh=ARVCqjR7KNX0tUcxWXC/5ZgnQIzih01Q/pFsZDlcLb0=;
        b=aT1zUBFQQTach4lolJleisj8MM8AcLRyQuxls9WFiFKqGU5iDw2z9LTs603Zjj7xF9
         EaR+bwvoFygQBbYWF0qx/XxngHmSMOtkibU2cgHmmnX2uQc45L5NTbT/dFtj3Zklf9BQ
         t407Y+JBYH80vewjAvH3QZpVoWl4s0SS/IHMWeZ6eaynjMxiopP8RnhHFWx6WtD44HAw
         uM0nLNhDPOJdE5NgFZ9WRXc8PxE6zygAQchdu9uhhbf7mGkMaQu/PiLRy7w3pEj3DliS
         SUpEiw93w6D6r65oLPdz+z0n9tcJqGb+s1wA045qyHOEwgtazpN1Kqpq+Hziu7jj6rvJ
         sTOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787157432; x=1787762232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/2vYKJSDxn6CwCgQ44O6XRlCA3F0xRGLPQF24ansLE=;
        b=cC92+7JBOamJDu2VeKUyEMHx1jk9Y/ubj1AUjQvTw7UWHAI5jaIuIuKqVWqmP9KHxC
         VxkEljt8PGacodh1/xxP/d9NFjTFnTQhzpTIjJJz52nMLBC81bsJiual7w1mxboZLDMd
         fb+gmlPa0Hd1PYZHg/ay4/cSgFjDwS/2L++FQCJ971G60v7w3x4Ma0meKy495vIKx25b
         V9aPPj+cI81rG/TlbFEegexkYy0xZzGQN3TfeE9vvseu0AOzIPqDJksA+lyVGj8UGxYw
         ZIa/ajNAIHNxt1fPQ77yT8arzdEdHP2m+J8FIw/AjMu5PYUC7U6WTpCndA7SlahhISQV
         PhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157432; x=1787762232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/2vYKJSDxn6CwCgQ44O6XRlCA3F0xRGLPQF24ansLE=;
        b=gRHz4S/Ib9f7sIVsjNBXWTnWWWjsQ23j+HS1bhFcFcvn6QMzcA5jw+r3466COjtOOq
         j7+YrUsEmx5YivbTymQXmNfilZMZyFYa096P+W8tLGloWZ3FwHUy6712rbT/H+uHKayG
         hGA8ODk1pSvHO1uqQ7XHMSsuZ73ybORzCWLJDylPGYDTf2ea34slK2CZMaholkIElKIL
         VmO2bSP0Az+Sx5yd+zNb8HAMShhi54MHXd8WEuh2W6k0xDX8jQd0s3kdArCTWFnpsyBH
         eDcjk75Vgufr1X7gMCV+IBeRtuwq2wnQ8I4leUwFuidmybnXwDZB+/vXc1llxVDBfT4l
         TfNw==
X-Forwarded-Encrypted: i=1; AHgh+RpfcS2ZIEs9LJiiZKenm6TCbD7IAYLSuOji/dMRn7ZU1agODFtKv05j6VbSt9QNcgrx3/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyR3ArPh3cUJixLPkO6CLIMZPD8A4gLCLaJqw8n+CtIj7Vsokt
	64Glft741iNDRisKXSzO76xgIcENjSWgHwW6pFTIDezcnTNxZ3daj60FXVXBxKU0PCKjZiY8wsQ
	gf7fw1iLry7VfuL1BFcMsmZBl+B5zNEU=
X-Gm-Gg: AR+sD109/bqC1tcaWyuubZHsIY/1W0p3/3tWarnnNTaF/HXYWgSLjyxaqrd1FAmMIRf
	uZISqRFhKqK18PsNkSQLP9Zw2HcGPGLRIXcHvOqOmOQcCLrU+rMzg/rCnnTx0IJrWvWgu9G1kgc
	AQShNuRDONmoYKQJGUo9aoNFIWxUJNmx7So9FenmQoX+aIuN/JHrBn+9upSXsGZbAT6M1ZMN2ub
	EbXQ3/m4Z9nOLI63sBqbbj903lKUovnHhNnwv0N6AfiOPifMjAg9cMcdu7+T1EMuCXXe6YAC7t+
	9UAlKPw5IDS4fL5wcaKwnWG/SSDNVkgkH31x7wN4un70jlf7TogLgNhb5aM1u/wK3lmlo16p9bz
	ebSSBBE1S67HW2Fsws7lB98Ttu927+/y6LQ==
X-Received: by 2002:a05:6512:b9b:b0:5b4:58eb:cb6e with SMTP id
 2adb3069b0e04-5b478b927aemr1863019e87.5.1787157432057; Wed, 19 Aug 2026
 09:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com> <20260819092506.832631F000E9@smtp.kernel.org>
 <aoXAXFI3kRWh98R7@SMW015318> <CAOMZO5DT63sfGdUXiKNK=ihMs=rXbA6kBUUO4TmE1o=e6dkxkg@mail.gmail.com>
 <aoXaIc5bX14esW4I@SMW015318>
In-Reply-To: <aoXaIc5bX14esW4I@SMW015318>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Aug 2026 13:37:00 -0300
X-Gm-Features: AcwNN1UdwmcaFSyr80JGaMi_4fZncJ2QrAHvbOJHJp6jkEGX3-W8WbTnt6JqwUo
Message-ID: <CAOMZO5BrzRYWbJZ5V7ca14znJ7NR4_MwxWMv7WSCeYsfMzLTNQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in probe()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Zhipeng.wang_1@oss.nxp.com, 
	Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 1:30=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:

> Fabio:
>         Is it okay to let zhipeng to pick your patch to make a serial to
> avoid conflict at maintainer side?

Yes, sure.
