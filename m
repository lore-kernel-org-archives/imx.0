Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417E3BF69A
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624296; cv=pass; b=JvvtNCgIY+xmZL5HzST3SYhm3wvla607WcUPeRGEMBa2EtBjQivbSKNQmb4vA5b+62nma6pMsV6oA9YtJlGUeyYtBMto6yjN7sMA59rTgogLuXFjPu4cMxUqb92JluUh1NhKA8qQVuwcilUUrEGaJg+F6WEAKEyOAaB46Ct0ebE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624296; c=relaxed/simple;
	bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5bZCqDPi0DVz/oh3Sw6nZBwKfPW6g+YmgXxfHLfkx2RJCjNc/YliHei2eLE7d8jAhQLWFFBrR39jnyj9dd7mP3OErq6KiWrejyHj0KjmmPYpMYU6mL9Wj7Kk/eHufTiPbsc2Z88TH3rzJ44uhzhavJhNKzEunxAxTVmo3Im7KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOoqEIqe; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOoqEIqe"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c999f162c9aso6930786a12.3
        for <imx@lists.linux.dev>; Tue, 21 Jul 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784624294; cv=none;
        d=google.com; s=arc-20260327;
        b=o5Fs1wWFgEaxYk6kKwZWCKN12TocLYqBLTe8+yCHe61UudT9qH3Ww7PL318mgxbfZQ
         XQimMUh/mVO/QxKg08iIWuorIB1Ye55zZoZSc27+4aQaolytykBc9bJDXvW7Gk9KWRPO
         71ulMwgj86pGlq1Onn0zJBc3j4IHnXNS9Zrc7IgJUFfVEElE0oAP10G277b2Xlee2o0t
         +uQEpsCw41hmXAVMFydHPX+Cu+gVS/9L6xg4Q1dwXWNGgFyqckveXWjnGQcsV8h/W9o5
         ZAKfnuR0vsJTL3vFByhhcoVEMHydnSCb5cC30J7stxjqkTTTycdtEJVO3R38lmUb42yT
         RIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        fh=zcczCcRHyRKCGonl8vXvy14TdHa7Q/z2uSR5u61pb7A=;
        b=c+5GysbNZMOYcECox75vrYR/TqOaloRJMSuXmmzBVqJBZLtRkoEkjODtcOfimuLpFD
         csI0kP16lBcHSvBEzZC6Z0Ei5jnQ4cy5IbQ1EqcVcgoqrbbileBzl6SumgoqwzB/2mbu
         ZTUr2+WkNKGa8r/UbUtb1VX7x7jBjCBLdYknvgi1v8YTLSVWohL3Xs2aJDx8ZQNi8qHC
         lgwJX8CUENPDHGQFI2cn6AaH+m3fLb3BVkmtNYeYNPEyrPxt6KE/Bx07wAMNalMnOd7H
         wv+70Cv7r5fD48uBVaf8CybIYXel5cxAqdiawmDbnZJBdv0N2ue0g+SqR9dWRcZQt1Lr
         o5WQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784624294; x=1785229094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=eOoqEIqeQwFnuNTgTsYyLxVx3o/YR+CnbEj+wObLVacq9J2yjeAaa8r4yDWhYyNQrN
         8WVgmC7gHxOvg6MUJ5dabEI6Bsc+//WLHwSuBQGoYA0fNvgZgDxdVbQPMU3TJ7NOG5S9
         UHv0QLCVQyiyE4UFOYoMfozBnNwEvwgF6lbyZ/okWGpoaQIacxdjaedEigC46bj6ek2X
         p/v6duxcFfl2dUCELImbb9PS1ByIR38oCfllQL7oDBbw7nfAfFhakQOKoAnKDQGOX7Vy
         34tWGZ3iiVo4iTnxek0Rmi8H8iStGkxGC8VLTRso56VJdpkjx0PFalVX4CfwJP1wKCzs
         rT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624294; x=1785229094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=raFApCSJTaTbcbRUuWsKXaZ7Dqrow1gSdPyEhJv7YIA1AhSYFHTMl0YTDmF/aTC2TG
         BVea5Llx4Lb39Tb8jHhXK2IEe+aC5zd5AZAz+FBXLSIYNOukCccepvOxA4ZGQM9CorQg
         IttU36ml1iWIIK892lk0AlSNH2NvxYk5ukYQZOCDJzk+Kb2sCMRvVUL7FKwnz15ebq8y
         /mFWZd1Pkk4wFS+/kCuzVQgmf60dDAbyWv3ZEMWEcSS+ZHrNd/D+TvmJHfQbJvjL3SQK
         zFM4JrlxHjaUXQ22XqKKVYcLZ+f76cWphL52jYQJ77CY7C336V7H6jbl5+xCyRZjFMKb
         0lmA==
X-Forwarded-Encrypted: i=1; AHgh+Rpndqhd2S6UURY9FwEGvCkfAg28lthNpRPNHumMjXw2UUdhCDBUcz0gbUy3egSkh5RlXcs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHZAgzwoMTMr8HXpd9Cyr0jHBQz1jQVLwEI8OyrdB47AsDWUnW
	znBeNH0XJLJC7DEp4V24d0N2q1ZD7qUMNPgajgKZrw+2Bb6VxFTFaWmldvOEWvbnm33MFUhhy+k
	G5xm+fr44cHAm3dPFUDDh2gMJe7jDiGE=
X-Gm-Gg: AfdE7ckxNcAyfjtCzDoh6YMnO2IjzVdrrRjsMV9PxE+yu57xqCSFCaleLsVtM7gHZdP
	l/N53ChaX/gwoPxP95RCAJ/7Sc9Iqd6jj08h11cy/8BoTaL+unsRcovGWz9tD5oAbERcWihsR9P
	UTpm53x39mOyoyhKWIGO15T26S16O0XPeZz+Bdznz5KUZ0xrMjLDFxlqHK6004WmDtLnx0kWiUq
	5psUdeOW6q2X9e+NUUPRk8soJBl5M6hTcV3hoyb/R9BN/KcKvYZexJzLFZ8iA7OFy5UGZQX
X-Received: by 2002:a05:6a20:734f:b0:3c3:6af8:ab24 with SMTP id
 adf61e73a8af0-3c3ad9d5fe8mr19173494637.56.1784624294467; Tue, 21 Jul 2026
 01:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
In-Reply-To: <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Jul 2026 16:58:02 +0800
X-Gm-Features: AUfX_mxyjKglcWDGiHlL7pHojtmA7GYBRqbKLhdnlf4NA0C5KwDC9Zvpc1PZDyM
Message-ID: <CAA+D8ANTBSgzhEQ-fsj9jpKnOBKCQiJeY5pv2-zck0O4DTM04Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 10:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for pointing this out. There are also some comments from sashiko.dev
I will try to address in the next version.

Best regards
Shengjiu Wang
