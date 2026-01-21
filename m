Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9BA48096B
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988931; cv=pass; b=NpIjkO6Aud2FkIYvl1s8Fz6bx5mtwOCjD34tnG29Fv4Ah6ipvX49JIgBVCzLd6tGF42hBfv/fsJ2YfnL3BsacU5r3ga5Hvo3uVuwxZlYaUaztvf79RMlzenavcDtYEt4rFK48UhaFJVn9sc4NNhKTjKqR9uDLZpTt3IwfvvJLO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988931; c=relaxed/simple;
	bh=olsdjkI57G19OOQVq1JESSEQwePdLNpA5vX41DpQCG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SW8qb8xglM5COyQrJMoHjEibAdP7lUmAC8AWWF1jdlg78JhSJ0CdrqvcnMq+Jk8Sl2wRTtKk9v6JXlSIT6p32P4YTBU682jpeO6g7mNKq72HwD5SUZxWfnTe/uuSYnyuQk/JyINXleH2E6wWauGnJFGgF3Ind9cj/9tEbZ1a80s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4LnbniF; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4LnbniF"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-121a0bcd364so8231924c88.0
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 01:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768988928; cv=none;
        d=google.com; s=arc-20240605;
        b=aY7shCqRELWAKpelkT8TVFJuMhZUL8+KNuMRes42+lb/5ZSP7EZIOm+gHUmLKjbrFP
         4QLjl3WRLFaxq3dNLXlsCJANUuE9E59gkWxV3/WYUzJCaKkgu8sqSIGV53CJjOzi+2gq
         RDRKFqtl88PnY8NAlMd17afRft7NWvqr2j+OASNDCKaw9LX/prVi/chDMtc3q1xgCgs9
         0CBWmWLRSI+qQq/OD5+/zy7B3Uaq1h4iqYDjW8VVaTjfOXKVn7jCJv9t/oS2I7nRNsB8
         Swhb7LN253iKgyrL7emO7oUlbbIy4ar4oZOyUF84+bTgdVpbijqhNbSHpZ4VADZb6/b+
         cpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GSHGaIsWZ0YnveCWlqyCPygExtYlmBkZI3k+7sIdigs=;
        fh=//zdwNB0IX+AgOX3TG8tubsKaVoTsWOinNuGRs2HFUs=;
        b=dWMKP2XyU2IaHxb74geqRpPERBYavcM/jdGquWUyMrU27pIHLNZLz1lMz3Bt9tWUQg
         KpBwk0HYUtfOqD3U1MUUgonvSwC3vKDJbOvT8glheWSaMhGdYyvGNhlcxDDU18RuCSbv
         sGIDxxxJKL9g0J9lIhdZWMgAOUGCqR2y4TGiOh1oTAzpY83YsiG2/99i9Gnmc7/zqHDb
         Bsgc0DtScLoj8gXFICceNc4LOQWyNNQ6hCZYcuXarBQ8+mdqbQeD1/mWwZ2k+injVsDV
         zAyxnLBosyE2QOq2pDhdlRVHtXfy1eKPA3uGPZCX2pPEt5t7K65PZi0XNL+tQhn2vZUS
         v++A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768988928; x=1769593728; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GSHGaIsWZ0YnveCWlqyCPygExtYlmBkZI3k+7sIdigs=;
        b=l4LnbniF6rFcOsDRjD+B8jZZyXCig2ml3DgD6DyedmNa69YJaWzhZ89FQd2DdQ1l/G
         vGE0GxS5tBYcmZg1vXR9iTaqE08/TdAORW3CeBoR9pUDxuLT11fWeKWHk+zryuogx8hH
         /O02y4UqjrbU5k+TYosg9eWQFB9jGeNJMzz3QimDSrX3ZxGjbFzlIr3iolNb4BcfF31y
         DhDuuhJ9GsYykQ3e1TDLIZnxxSSQHYxtpjCpZBmDu0DQZ6C/uMlU305JEFbiSUGSsl/y
         XBLPAJ7zP3kxbtxFfUJxR47e3zF1sdh1se8Jcgmg32pmAHmJV7DMYnw6f02gL3WBiSdX
         EVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988928; x=1769593728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSHGaIsWZ0YnveCWlqyCPygExtYlmBkZI3k+7sIdigs=;
        b=V+LAhJ0+90EM7d6BDnzpd7cBKitxf0eYrPwP2frgycoi7NAv5DetavMhQgBIjvtKf4
         AYGMJRudVRQFjRROWxpINocY20GBITAZoEZzvQFr9+Xkzpl/xEKXaezwasOkilv9LLqV
         hyfg9m/sl9eWZjyYVW0xv2jj5KIE2CmoZKoT+l0iOVxCH2gghWxdlea1cGx5+j9xqfDd
         D/AANMTO5bj+ttC6MdU9KBu1bBUO+q4cHD+cE1oERUOQsEfF2FnwGyuJ+xj32E2V/GEs
         KqquqjI0NErj4djeGh1BTid48L8dIji2lwcfwAwi1qm1+/U2kNYB6ULlNiHNNt3sf1TQ
         Z4sA==
X-Forwarded-Encrypted: i=1; AJvYcCXKb5CUkJZsFtSJRUD1MIY8wxbEh7jMUewbK4qAJLMGmMU53dN+vmmavnKDQblQR7dR4xs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyltKw8jh3InunQKo4481rK24SrllZDkRJ5olgHBOoQ48s0dL0n
	qk5fH/uc8iOoxFdpOZxDLMEsmAGB7+aL025Inn6DvJyWL9aygrHp4RwEWWcAt4emQNbcW26h3wn
	csQurGKhi/Tem2DzVH9/wDHsYa5x5oJg=
X-Gm-Gg: AZuq6aKGKt7+XeZsmdPvRvuprMLMQF2/GpgIT+Fkr1g8baXwZguJcvVD5OHGUH8c/SS
	MxC8kK8IXPRd+Tm80xBAmrxn9GcJWuCoUy01q9hMcbraRBX9mFG7oomNjHVmQfb9LB5idufBzcK
	nXdZzmdGmjiMAphLvGTcRpM+3YkxzqlhqSwiN0JeNuRv9379KfevsAVmZU20rD1hJoPXIAp8Juq
	kyETJkEiaHoozWc9Efp1i5tRpN/4fu30/GNnIT/rfIqEApEqPMJsqvzwBPXhqw8nfvrtywXi0tA
	lsKse98hQDvp98yPAwu/j0ORCotmzHqkDV4WNk3dm73rsc81dpI/PCojoTJiS3TYdkVYBjRtsia
	T1Qw2TcpxIA==
X-Received: by 2002:a05:7022:1601:b0:11e:3e9:3ea2 with SMTP id
 a92af1059eb24-1244a791beemr14456344c88.49.1768988927959; Wed, 21 Jan 2026
 01:48:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120102604.1989725-1-sherry.sun@nxp.com> <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810> <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org> <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
In-Reply-To: <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 21 Jan 2026 11:51:27 +0200
X-Gm-Features: AZwV_Qjqfx2U87Bv6XKadV2LQsP0YlPiUuwembG0uAps9TrGxLQ9lqFEOdimBZs
Message-ID: <CAEnQRZDCNXcAH7kBCPLJm2pPrJ9akXX+ZMW98H7MO8Hptjp3TA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	"dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, 
	"Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>, 
	"matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>, 
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	"primoz.fiser@norik.com" <primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

<snip>

> > >>> +              - fsl,imx93w-evk            # i.MX93W EVK Board
> > >>
> > >> Is 93w 11x11 or 14x14? can you add suffix to keep align existing one.
> > >>
> > >
> > > Hi Frank,
> > >
> > > IMX93W-EVK is the official board name, it basically reuse the  i.MX93
> > > 11x11 EVK board, as described in the cover letter and dts patch. I
> > > prefer to still use this name (imx93w-evk) to keep align with the board
> > official name.
> > It's second case, previous was frdm, with the same argument. I don't care
> > what you prefer internally. You must align to upstream and all NXP boards are
> > called soc-foo. Not socfoo.
>
> Hi Krzysztof,
>
> The soc name is imx93w, the board is basically reuse the i.MX93 11x11 EVK,
> so do you suggest we name it fsl,imx93w-11x11-evk or fsl,imx93w-evk?

As per my understanding from Krzysztof comment this should be  fsl,imx93-w-evk.
Like soc-foo not socfoo.
