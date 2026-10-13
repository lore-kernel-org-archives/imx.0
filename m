Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC04F5E09
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892838; cv=pass; b=Z46p2ZA4j8pHDQNgBvUe8e2wMxgpJacWa1bzpAYwvN+lZ8sLBlmifUf5lNMa6fCOgWd7uYFbUGsUkhAftWlSKbsN/bPH46MwZz/TnSghbJcddAlPFGqUuOifNoWmgUbwX2udY7fbZWHUb8v02B/yJCh1OByFXoeC8FZbMriDpfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892838; c=relaxed/simple;
	bh=3MZ0rBUQQ/DT6hYuG6QZ4NQ/FBC1DV7mDn+OHinCE3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNTkibbg4WOSKg9O74weyEHWh896d5gt0By9ZkiEp9UPx2GH6GWVev5z8u9yKRnL15/qc6bJiSkGb4UrqI/HBawOKTiBnvCVIF1RwwVcgJ2eKZY+64MG4eEeKaOncxP3oH0cB2oPA6dApHCCJzlJWASqzcy7wydgGMskTkQXA34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MVPbkELM; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MVPbkELM"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-677af43eed4so2398618d50.0
        for <imx@lists.linux.dev>; Tue, 13 Oct 2026 05:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791892836; cv=none;
        d=google.com; s=arc-20260327;
        b=fsk2NsZ0DDwgBV/jvR/NDqvXcXaGwvUsFXJPbsmCXZ+zANtnCbRdERmazb+vwczquT
         VLlY73E0d1SKqLrIziu78qjJaDx1pDu9aqNGgNmQZckdlYi+fFKU9+9Uf2dX5bIBvtEk
         Cir6CqMnm9t/c4bJNJsVmld/TIE7xOW86wDCdycdFKHZR7/7Xyp7TNsHEu+PpWjHKq0Q
         bPQPfrbEFStncBxR6m9z0BT8crbIYQuCK4NLBGAYl66qD3oicZMZ/2wFqgH81BNCmLai
         eibpDMnbO8xfI+YheqbbkkFEjlt689Tapfbg7YucIRvnTk9bSZa3/NT28b9usqzpa5BX
         2oZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        fh=yFLI6qgbFhSgnO4+uCDwhkVo9LFrb3P9f4GqcNL5dTM=;
        b=NBwR6ioYoU/JsNkjTXMDmBLaaSgQHzIPCAS81IBneXMhjg8eZp/UIIxvKysc53SjtZ
         bNfI9fYw1vulQQUUrBoAlrZUIXLugKjJgTa5ZFIzdtDECPUHW87j0asy/QTjGF5q/TKF
         dJhT4Lh4z+CzHiwgmxVrWZ7TL9ASys7xvNS0T3uJEAdHwzU/NPXOrRd+WmiDdsoQWme7
         8b9L2xL2ofgj3Tr7OvCDxagkCtSJS2/fHffKNfrhu5cqbUUquHOo43h8l19DxS0HUyP8
         Vc1OGQ9SW+7ea3/QQZgs+Ugg8NKQH1f+ZOI2go0rEYjVZjqjK6FvepbdVi7B+3NePQ/V
         hXNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1791892836; x=1792497636; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=MVPbkELMgJi6sJIVsQ7u6/s6gg2IGlL1SsDowwh/nuD8IpMQqfvil2QXEdc0lN+GsV
         mKh02ibVjuKQD90l8WK71Qk+qmpi1is9WmECcLU30waw21ZjBkCznjQaUv3A0bYqD3CG
         /43U5sgJH5bbujyQOHUmLAMjNc2R9dY62seus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892836; x=1792497636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=XxcskQZPhO1REooDz00vzOe/tU5iJDXrbY5KSRRI94nveEj6IID3LmP+mR4fhdx+xS
         DH6jgG98p029sNPFSy5Lbg9ps6yqjhjRnD0sOz7n3r0MO+63rYJaCRJpcNaI/njVdS1q
         XFSYcIeBumSmRenbYkcLjPxqTjaogRHSBMv19G8gZw/syH6tlg4YY3T4hGl3Wx50kHI1
         yXlQhkF1Ui43+/Picyq6tssBGvwTVZw2AmfnV3tA47gCorccLdzU6KdRaGkwF+33QqYK
         ykiBcWIxuqM4GrvvtHHA3aWFjlB2KwOiNRSLPG9SUlfCnLw7l0fPIhPb6fMZMuUj86SD
         CtiA==
X-Forwarded-Encrypted: i=1; AKwUvByIDoUF0Al8DCaqcdk8BM/jolMhlgCG0YsEjtOsvayLdQIu4Pi5StvOIqS0Dy5uc5HLFOY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKl3/dcMqVOmKnVdY1p7KrbdS+KbEGaMRjsSC3gtuwtIZZFCLMi
	5n4kacVfLEyQCPzD7qf04vvsoPYz4bycVNTZPP3D4hST5KtTuGySN6n53fNFa6WAp/UECYxFkR2
	Fqo+XO6znDXeSytZq6nVSjsuVDHUpAdCJDfTov23rMw==
X-Gm-Gg: AYBFou2EdvoruJtIvkAOVxX9zxjYeVwL2ViK7sQk9Mftsg997NLaO8SsszkSB4yeCsy
	3Wm8JreVjy1TPcwhY8uxDsgq51lVRbW/UL+uY/Z3jwM2J2KHA78D79pM/Alz3KCT9yOrlqaEcm7
	lNmc6hiPYuHjBxkniN9HAwpdo/eGOXPtFJE1eWQ626Jz8+pEALmc72iUYDyi5qe07mpjiZ/Vtnv
	COoMb0wDTpUjIMc8C0mMPFV3I0T7TSoY+pPfEGYYpoPUJ4rpntFIclLad93e8P+5ktBBWDLYIFv
	2lpmAsBxIKdsXMKIr2wyNu8z3tl2B3TAWeDXqhF79/eORPBJpX7vOx7Lj2C40r3JuhKZD9XZDjD
	DkzES7Gb10dSuxfYq5Q9uQgESM7AWtd2GZome0j9lYQED
X-Received: by 2002:a05:690e:418b:b0:677:d67d:39e3 with SMTP id
 956f58d0204a3-67936767e9cmr4005406d50.2.1791892835727; Tue, 13 Oct 2026
 05:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4> <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
 <ar2q8M7Sn9DccVBI@redhat.com>
In-Reply-To: <ar2q8M7Sn9DccVBI@redhat.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 13 Oct 2026 14:00:24 +0200
X-Gm-Features: AclHuK8xxG5WHCzDqDFRzliodJK57Ya-SC3DZoZtYPsOSf_tESDvqgcH-jYqUEQ
Message-ID: <CABGWkvpjZsDR=tOEeNfEGY3TWC0U3o=ZZE4BEWCx8DF7uBmt+g@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sudeep, Abel,

On Thu, Oct 1, 2026 at 2:36=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> + Sudeep
>
> Hi Dario,
>
> On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> > On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > >
> > > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > > Support spread spectrum clocking for i.MX8M PLLs
> > > >
> > > > The series adds support for spread spectrum clocking for i.MX8M{M,N=
,P}
> > > > PLLs (audio, video and DRAM). It has been tested for the video PLL =
on
> > > > boards using i.MX8MN and i.MX8MP.
> > > >
> > > > While at it, it validates the spread spectrum configuration in the =
clk
> > > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > > extension, which converted the spread to the wrong unit.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [2/4] clk: validate spread spectrum configuration
> > >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> >
> > Thanks for picking up patch 2/4.
> >
> > I put the two fixes at the head of the series expecting them to go in t=
ogether.
> > Am I missing something for 1/4?
> >
> > And how should 3/4 and 4/4 be handled?
>
> I can pick up the other SCMI patches, however I am waiting for a
> Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
> and 3. It looks like Sudeep wasn't CCed on the original series so I added
> him.
>
> Abel is the maintainer for imx in patch 4. I can take this as well,
> however I'd need an Acked by from Abel.

Just a gentle ping. Any chance to get your acks on 1/4 and 3/4
(Sudeep) and 4/4 (Abel)?

Thanks and regards,

Dario
>
> Brian
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
