Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB273630BE
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 19:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773430293; cv=pass; b=eBaAPhSHg9WQEC18iFw/6PmEo6wc4UoiBxyfdwV8iP4E1CQHcUu7PypjhCyqwOE9nlur0YJ+Pw4g9qiKwLcB8ocuxDeegdi+badRvGv4lfN8Sv0n0QVfRJLDS/X694xfeYbqXkrYt8iynEHgNS/Ogr/ZXpFWc74fFSJMj0oJN98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773430293; c=relaxed/simple;
	bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbZvYORmiq0G5DR4mGERvugxi0WRvKtGVurjSV4Fx8iy7Xg/qAsznQkhnXI2rzi5CwGRnYEihUb+aYEYCpW2EQwMFqUFF6NKlFlhwU22/jwb2u2bzAKK2Vc97xwbA18TWm5ZEtdRNy+7vboKuJezQq08ew30+GM2QhPeSwgezVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjSH9TV1; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjSH9TV1"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a3066b68bso24032331fa.3
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 12:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773430291; cv=none;
        d=google.com; s=arc-20240605;
        b=dp9HRZfy7n+EvutiYynZe3YQNgeOmxqRNI83EscNgogLldc/1Mw/O6FkcjOam6vmHj
         1XtJY7uUGx8L5ERlKNbAOdfr6HBls8KtSLNc01bF9zkGQy+BplnWCEVly7MW4sF2SBOS
         UjbP01e3yoG7Ci2jCo1xf/ncmWMIJS36aOe72RDB+zywHySpRGiPT1fvywObEanWNe1d
         IB0UsIuU/HEFsiHfsFdEz/neWKl5AtHJqIht9NOr96zIpRq54H30M2l9/QmGfLrHvIvu
         aUw+Y4VZM4C7GJMNGo8Vm85S4v2w8ZVwgOs+Dg2/q1Uq+g+XS0fTNtxRMC0gtASD7nZf
         zZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=;
        fh=Gg/AvU5LMfufuxMleT6ALGfCaTNfOzEo0LcVvbi2zCo=;
        b=UXAHJKNjjhojJvlOxX26JWIFnHy9OW4bBvTnSwYae5Lh92XDf5diiP1BqynCH5U+wG
         ITa0RN8ZIQWwCeZZyz6vPDnDP3+BX3dfGSpqfBYhj52dPdMj85JHqgT5uv7Dj5Jbyh0D
         TGv+Jco8J7Pa3VssyF5g7WbIXWNaJJa1PcNyyO3qptPkRdS+9In7uU0b2qO7NUiZzemO
         aDO/9sn+mUuqQI+it8NFZOfrglTH7K32U85+rRyhYa/yKpALBM1abzXMzzOOQEtvnbRk
         oBYe4ALFtyaJ1oUJE2qM5ZvOxNvMTmzDRAR9bIJ2Ov02dKw3ki8NZrdbIO2tMKo2D9fE
         9Rkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773430291; x=1774035091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=;
        b=bjSH9TV1I317pjpYHKhtscLaQM0/O6lL0P5IfIr6c4kXXgO860qxEBIRmREL0KmNMa
         mYBRlq98Dp8XKLJ7bVlcboxheXZgoaqzThacwXKd2dpd/bjhplltDkllqxXKGLZyesc5
         kzWruiWn48h2C+crmicx7+1HhIdgSc+/nPP48i0aMjls7eYNtUrbmBaZ+N3KcBvfW9mM
         tumONQBK9mEGcIRZP/26EKBG+45COSPnNYda/I/dpILIngMTPxXFUYKZsJQ4OBpdlYAu
         7GZa5WSTt+Rje2J1XXAr29u9I5bCU08k5/SWOKzRsbSiZXkTrRnnhIAwErb1J9B7lUe0
         FtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773430291; x=1774035091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=;
        b=Xu0FdoTDmUc6GD9EonnakaS9GHWeJUQydQ0iZUqrn6IsmxKuii/rGw77oFqx7bxmQJ
         hekc7BoaPvVpmSQlEW5IoZbG5bLBb4PHWafTLk3PvcTg244QzGDH3fzz1m70IdOCP+yt
         Iwsu4lPoCflA1PjvtVWE0OZ4Xulhhj12lxfBP8L6sk/ByIdLP4aoFqx4ecguNKwOG9hf
         badspqokS5fB6FS9p8Ib+IhOcDpyCB81KRMpeKyKzbzisJZ/4sy22avC1wGjG/3tBvHC
         +2ZjAGIn2bwg3NImdWj+9p9EmAjHkEXBBVABmqtkhMKBe2yL0kRAF3yagfmg1Wnd1KJN
         lnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW30sqlWPL9vOSr9ZxcRbE4GPbCbbT1t90vGe2/2CzFwv98l29C/H3o6F/lLXjAYYB/fzg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzn20TixD1bPQ/1b56/5si7gT7/2HrwAbWwbocRhzzxKseVgvz
	se4FPPAyxV/Mugpp+/6HYVSHbeYdYWqEpc/Bq9xD3sluJ8ZCvhmITYKKjX6xewatXs6grwkdh2C
	ZbPScjsP3wvALrxcFvO3fsAf0mn60EVk=
X-Gm-Gg: ATEYQzw5D8hdQJHjV+cC9WpFy9naEWdGUWaqt9HP+8abXbHM/oO+k6bPBxLI5QvApKT
	dHUyjbnaS5+3gpN+u/rcci4LDWS+L4BoB/V/3c53O6aO6tSl6a7YC0O3Dw7U+3jYoxmZcCBeH1N
	ul16Z+gpeeR8zAdrdrTDzDF1kTbMsYxbMSJMA8507UWGenjO2Y9dZXtyhoZTEm7Ol+6iJt0LCVE
	fP1nUSD9aAl0GH+cVjmCFT0d/eQNvfLPnBV4YVSR8euMwigdz8Q+R9Vlsxxcr62EufopkMBtA1t
	YRWk+e5CgGsVq4r8eeLgpIGmuPxPay5X5vPkCEKh2Twp5Qi3UopfvYoj0lR3TqJNFzB4frpZexV
	UMd+buu0=
X-Received: by 2002:a2e:a36c:0:b0:38a:1a50:d843 with SMTP id
 38308e7fff4ca-38a8981c174mr11402461fa.36.1773430290368; Fri, 13 Mar 2026
 12:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
 <abQ_d9fGarNobYdo@Lord-Beerus.station> <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>
 <abRDxRK_GFYwmAGE@Lord-Beerus.station>
In-Reply-To: <abRDxRK_GFYwmAGE@Lord-Beerus.station>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Mar 2026 16:31:18 -0300
X-Gm-Features: AaiRm50pUUd5PlDELi1jeVhIygeT3DuOuUYNivL7Ni7NnylRuT23VDH4JhtqGGg
Message-ID: <CAOMZO5A7XJL8TFHZJAgJAV=yHzqHEb4+AyDEoiBR4Zas3zMisA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 2:05=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> Thanks for the feedback!
>
> I might have misunderstood the best approach here. The reason I split the
> WiFi/BT configuration into separate dtsi files was to follow the directio=
n
> discussed in the previous revision, where we decided to keep support for =
the
> legacy Broadcom-based SOM while moving the configuration out of the
> device tree, giving the support for both modules revisions.
>
> However, I see your point that if it is not referenced anywhere it become=
s
> dead code:
> Would it make sense to add a legacy Symphony DTS that includes the Broadc=
om
> configuration, in addition to the current Symphony DTS that uses the IW61=
x?
> This way the existing boards would keep working while the default board
> description reflects the currently produced hardware.

Yes, the idea is not to break the old boards with the Broadcom Wifi.
