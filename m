Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAF2EC574
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758270202; cv=none; b=S/RW7E5WOZU/uePQ7fJ/N6uwZ188w7t0iiZSrzXcxZkTaH/BC2SzCoaHGOw1fe15EH2wDapwhV/PJSSautl7eFM6e3OKHQ2ZS9aRpbMWxlFMwjCvyz6mMdF2P548xI7vtZ0AnQAhsnnQmh/bJf7wKcbLu1draA5Bp/MCI+Jjfpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758270202; c=relaxed/simple;
	bh=usjY+o/8CLlwfSa4Vymf4+fsSkyqM1VeZm3AMQMgllE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgkIquZFKtqB3x1Z8MPuAAFwvOi3Enp21BXtdyAmQUqAwxJcFmC6aIWwpOafpR6mGsSlTt1xGYmSmQLEeUMf5mfY+QIxvb0sTy/FT8FNYeQnmvCRn+Hq6SizSII2U195KLQPsAFapxPVXbdR9rtrm3CON4uplKf/XGpC8ro3ejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRURMpnK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRURMpnK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2677a4d4ce3so19802975ad.0
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758270200; x=1758875000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVujP+zprKI6yaucjxQ+AnFkVr/LyLnb8WhpE7+IVts=;
        b=iRURMpnKSp41ewzWQxcAou3x5ThCGjPlZO2n2Yb2FOHna29LOMAAbLCe5NYmjilyUI
         mcQfIIc/n2tR3727S/eCGfs7THJO4wY0xqBw6KLNN71OImq3LS0QCqpJpGAi/vz/lJGj
         TwcMQs2xc3B2bJ8/DNioztfMfsn9MdL5khep0WX9n37lFO5K6Y7InDmAjcZcCyuZJHX+
         LszOHI+BFr6r6b1dUUD3rLeHCxfe/xXo5uBIYAymVcn2iLO9glhUdaAFQq7NUlP/eaGt
         05CQhFpBTnfYbGoIcEQMiBMYGa+tPHi5yMy5t7+U0B/y7thGFtrd5VFJ8v7JEWwAu371
         QNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270200; x=1758875000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVujP+zprKI6yaucjxQ+AnFkVr/LyLnb8WhpE7+IVts=;
        b=uMx15mq70MCfgUg/ugNYQNJuauY5mHBzn+itJnvfKn7ukbMfd0p+UduORyX9kItTv8
         cRa1lRgkZfyJKBgrGmHQIZXEcTYF7lqumWYfirpurtDb/A62e2ICToa8uvaTAmDZRBNj
         iwYeE6ZYC/GyAXC5PbTEaoId4b2YQdawND5QCrXEheZKD1eHGroD0eHrCulqajQFqAXy
         ZHJq9cgQXJUrLn5hW/SrT+qz/d972yG7sO9M5xEhlTOjjOHc5uw97mCfOHwzoXRRnLtl
         rf/HeHyI2bevwMSSuN2p7UoECDP0Zuu6cZvVrYzx2At9fAVVjMyLTvVvny5zjE5UmdfB
         XHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiG1s59x5PDZoTptZ2vFVpq5Zs+GDBEqvikY7eHu/smzS7vOcETAWm2aixl6QY6DtMJIA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1OyGEhTYj6BuPtWblX1H9TGXomcGD9KumhUXGTe/vvOPO7Xsa
	voIJN60lvIIf+0lFxQ/T3uElCwvU3i5A57nNguSj2xifNs5uoLMVkWlhxeuzoii3irgYzaTVAKa
	JgPe7eAv2r0fX/DGqSXeQOTQSFEv7hAw=
X-Gm-Gg: ASbGncsDbzsIfdhdEnFoBvQkRNJVWvHA7U9082USJLY4jIv3fFDrJyQcGdCjUb5k3RA
	xIsW1rNoelP6maXbwNUy8ZUVuA1CcqvO4TiS5YJfGFKhZiZYJFsbJjcYuzguCY8OXWHHh3V24z6
	3iuAlUPHo9jibZ+WShqYTP1MDxyi21z40YrWHsIej7m0zoHtAtJDTh6YL+vdFR5Sq7EYxRqVw4y
	NjBxqQmvK4GQ6v4pBaH99Luos/ukNF5FXiS
X-Google-Smtp-Source: AGHT+IGkUgFKopsVCvKH/I4NVsJnRweFemKrfKJemNsyC+3rmEF/RNRSqYb65QnzlOCE75UW6MFYdTLXvs3rT8z5p6M=
X-Received: by 2002:a17:903:24e:b0:267:e3af:ae38 with SMTP id
 d9443c01a7336-269ba4643bcmr39630535ad.24.1758270199791; Fri, 19 Sep 2025
 01:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com> <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
 <PAXPR04MB8459216DAA827DB05BF675AA8811A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459216DAA827DB05BF675AA8811A@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Sep 2025 11:25:38 +0300
X-Gm-Features: AS18NWA2ML_75oP-q69uMA6bYWYFWGOMeEfKy11gSalmyDGfNKtTFsYUY529N_o
Message-ID: <CAEnQRZC34KuJZDcv3TLJQrOcT9NFsYtD9q5Rj6+5MUKSBub6-w@mail.gmail.com>
Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 5:02=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Daniel,
>
> > Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable
> > logic using dcfg flags
> > > +       /* Remote core is under control of Linux or clock is not
> > > + managed by firmware */
> >
> > I see that you negate the comment from imx_rproc_clk_enable but
> > with the negation OR becomes AND.
> >
> > So, the comment should be:
> >
> > /* Handle clocks when remote core is under control of Linux AND the
> > clocks are not managed by remote side  FW */
>
> I thought this flag is clear that clk should be managed by driver.
> I will update the comment.
>
> >
> > Also, do we really need this flag?
> > Shouldn't we just make a decision based on the fact that clk is in the
> > device tree or not?
>
> From hardware perspective, there is always clk for the remote cores.
> So DT describe hardware, a clk property should be there.
>
> But NXP system firmware manages the CLK automatically, no need
> driver to do that.  So this flag is required here.


OK, makes sense. Thanks. With comment changed you can add my

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


thanks,
Daniel.
