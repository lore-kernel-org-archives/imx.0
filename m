Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E6370AC1
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801622; cv=pass; b=jx3luelcgrmUYANBlemYCXV9/OXKSLmHu3NCeyYTimsU5NfnkP2Sr5/wfnbJbBevPnJeazmmrqpTRX2AiUfD27ejp2dbwv5yApkScVQHiExmEOeyQMsflXp6gcbARveE3SPnM4LUTMZ3LnwpU3U4kDgfo5WsKq01HPOoHA30p9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801622; c=relaxed/simple;
	bh=92KIamnWD8cd5WYLKJyli8qdGUGMlFHe2PGqMoGdBQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGM6Xdjgba9s/PYzmdb/o3mPhMFRyQnjtcR9T2k5JwIU5KRT5BNNoT2rXM/FRxo5pX33+e2vaJpQHbCRbBwOooOocY6mscVK5Yj71McQeetJhWC4D4NFP0iZO7zWxhqnC9hOcUGP9EyXSwhg5xSxOvcGZCnjo3PVJifj2fBt2EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDHGafJg; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDHGafJg"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so4089591fa.1
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 03:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801619; cv=none;
        d=google.com; s=arc-20260327;
        b=TFprvWJzTy9cHnwOdwuqwCHgzBmnrXvuw7l8w1V2DvvcPVXiAm9b8lznzZZkMgziNl
         hTxruXxvfeSMAoVDCwIvaLRlpmhk+v9SgLwGsnqjn8YxB5pXFmWKDXMJTtaXHA/PZmJQ
         FrMP4gWB9qAsAR0z0ptUCYvrR+97ZATTlTn9QzGxM0FOW+AHoy5RYkQgItUx8NsyMZ0+
         NUd01JG/OZhowW+SPdkPwBKu5x/IIW8LlA3TOjFM+VFsVNjZcZkpF6vHPvftrCOun6bN
         5c7VU43p5P+IgZAtdayURuZmVxCkQ/9b2r38YamHsbOZJaWJ455qtXVSeXpFIyW++rP2
         sdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        fh=pErieDvnJe1t/MXNhOA+3+G8yUrlube7Tk7JP36Vc+w=;
        b=R9HO8u9rJiNOda6oQZMyqP9QbKhrP7jXRP7mCEMP+ndoo0vMz+OQHiBjyI3dL+lfOx
         6o1nrEprKi1lpQmYkP/B9pBYBuHga9O+M8UZXeaoRpsfBwRU7UsqCpme/zePTzM6bG75
         3FgHJlM4por+ZVUCnuUHq8Aia3qFpYSwRNV7YIFS7EMvRM4TeDbQlMVrLOClVA+cWeXJ
         0BJOPJ614tnTofIRtN9XaSPmKnSiEbP7Fo3yrKIiPOeTP8nBIAhMbwxBYkaLRp+NJ0d+
         2W2FowRoG2Raq3HqgSVtv/aa57v5Twa2H3dqoA8uNtrqB8jDDz5MzK+HDqh17R2xaRjA
         3CVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801619; x=1792406419; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=aDHGafJgmTalqpybbdITxDk4Cnn1QmlOPOkSLGa+jYqwBDp134Filp26x2nGMFcOrh
         DfYvF3zeJr+Ybw3lbfh8QtZFcj29jDMu0O23EhirB2/5dCtqzYVTVH1mBpGXhU2+MZIz
         P3RGAkTgIJEUVDvAmRv8vL698abOllGRt2uQFb2EE1Gz+Naa2e06Y7KfvZN0czqbAnH/
         ZsZZ5o2Qu8eqFYobhbzYtdRrHBifJjO6hhkiC9cq8lmh+GrrBdG9/AeVhPXfLxkbuenk
         v/t/JT6+II1m0Lsbf2+apWzOUdHEfD96p2YmfpZzHUJdyEcqmReys6/11W0Po60sDxi3
         YRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801619; x=1792406419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=C4DEXqIvHirMMzwnwIAJl3IHmPEPk44twRClnFtqvJpNIkp0Oe7BCx8HrvgOVCIsVC
         sQzkvSkojDMHlLv24ewP+5h6uBIs2vPqONptc//+t7WHj2biIXwQV2C8KI1wI1gGOSXP
         N79zD8kE00/zPr6V+M8nFlCA+QCNN9m3UiWQVzJzl0FPpHEOkHzjl2DVhILgtixYg0aF
         isDdpNJ6p4oSpdrCuzPdFrjCq9PO6oGjKSr3nX9aRNK1Q8YSvzmGuGema0oxe2cj/Sou
         u1uXNo7Dg7W3EmIpnUVwTYEgV9oS2RTKARgc4VgoZ7lsIS6Qap54LBhYv/WAFxcKRf84
         VHyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2CBeyvAKit7i//wBLjBOxwuDJehfOsC+pH5WmDA5amnbgVarJRcxuwD5lIY4UVIPNUiw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJiWeuGJB+N6kq+hkaQR9HLLHBWu3yG9xXOPf1W3UftLQbyp/hc
	XZk15BDrVHvJOmIWYzsSFbq7d0jZ9+PqDIhSRhn+DOINQP8mcMzDjY6Tv2Lfz6ULXor/k9yGhrV
	i4GSyS+9eE8xiB2P+StfwoZseXw6bqng=
X-Gm-Gg: AYBFou04ujympoGFLvAfUWZkxa8lGvP3aFM5b7+ufXZvP22KnGIfXTMUrHdU/YI4h85
	U/CuExyQwaRdiEUaNSFtHVRFtrqzo3CFMOg3g87RodnaaJzulyAGjaVwE/U3u+nyWHgqSVvR4GG
	PaKsz2qMffvbw7jfPGuOs1MLaiJk/P2pTDbsUotLFyZgtHuTL683EOzFXNm18S+fHnHcbqIs35p
	7HZJI9i5pp4PmLVU3teVkcZ7y6f6ujPQgfWPPPymPB3T/5bSQ2sIhMfGDARLNtfRx7F4KnkbFwG
	KIhQiUPGKACXE2V+FUirSlaSGz5N1lrs92DBajZVHHp4QYqXaILT5PBKQ+P2jpva0EF0DwRyxmq
	bRuCtB7tPwxdu3qmJ2Nu4H9DXo4EWPsJ5XMtbGPSmKTRSYBOFT9DPMTWLTI7B/jn21CusGECAhk
	40crivpY4x2LooBBj+5rItADSnF5CJDhvQ8uw5UU/U
X-Received: by 2002:a2e:bc18:0:b0:3a7:5ff2:576 with SMTP id
 38308e7fff4ca-3a9c4eb3dadmr26987981fa.1.1791801618912; Mon, 12 Oct 2026
 03:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com> <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
 <asyw9ns870F0g7UD@shlinux89>
In-Reply-To: <asyw9ns870F0g7UD@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:39:41 +0300
X-Gm-Features: AclHuK8j5vu_bU9arYI-L7AJUk-wyVDtV4Vr4-xee8wNlRYyo0Qc1_7I9JALruk
Message-ID: <CAHp75VcO8YEBbt--P8WO-_Vu1O0mR2nsdqeBSG=JgavCEoR3Dg@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:01=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:30:07PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:

...

> >>         struct device_node *np =3D pdev->dev.of_node;
> >
> >Why not this one? Is it even used? Perhaps you want to have
>
> of_alias_get_id() is used, there is no counterpart in fwnode api for it.
>
> >  struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> >
> >here?

What about using to_of_node() for that one and fwnode for IRQ APIs?

> >> +       struct device *dev =3D &pdev->dev;

...

> >> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, er=
r);
> >> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);
> >
> >This message simply needs to be killed, with initcall_debug in the
> >kernel command line you will get something similar from driver core.
>
> ok. Let me fold the change in this patch, I would not introduce
> another patch to just drop this line.

Why not? This is a logically different change. Since the driver was
not touched for a long time there is a technical debt, you can first
send fixes separately, followed by a number of the drops like this one
(remove a noisy line), followed by new features. Make it three patch
series.

--=20
With Best Regards,
Andy Shevchenko
