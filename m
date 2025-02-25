Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FB29CE1
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490414; cv=none; b=kCU44D2VNu/Y/uBEw0w9qaZKIrjDtOZ86m5tQyHoghAI6tYhFQj7DZUbpqgwS0ORONTYHVzpOetcovadJApZfvbFNpvE1eJ9AqJXL3NjHr/HBA10I7KXJnYi2TaqRD8lwHx4hycYpDsUgYl3W2wVYpN27Bfxz44Q4Bt99edpsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490414; c=relaxed/simple;
	bh=53fpyJmRj6Rqqv2hcXrWuNnqYKt92WXS893aUdbh8v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCLBzlc/VynZ1D5qoLODgQ9w7KlQenzZ3GCtkOpkEcWX7RN5hsJ/2KaOua969FPCsSy+AEik1hCvkEZlOr5wCXtKpvnYQ509THP4o5VDb3jQ3/vAvCqWRrGa/1BTTk0QddoVE+oyPfc9tOJGpNHusAUDufK7an1cOrHm8d02Du0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLkqPloc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLkqPloc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fc6272259cso9054265a91.0
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490412; x=1741095212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyOopy8tN2qVORYzVG5T+W7YiTWMkF64OU8YybIupHw=;
        b=mLkqPlocQaVh87MUaoSuB9Ns1ZSfxo9XQkxUVFnR2z4oyC7LPcrG6JI8IeUdOQKmec
         FPj8HR5yjKznktI2DMu5OE+HFvBfQh5dwvL0JHJmSr5FhefbAl2eqIszXVtgjiah/ViK
         JR1ODASReeyK3iPQeaDatrs3Yl+DglYlvGKjbHEm+efBFdRTkVdNNJSy3qs18l84Qo4l
         rtwWsB2HcNqzdo07+fp4BbLVRiqn3seLUMh/lPHiqZLCtI2B9CEahh5olRwVbTgjiFLR
         9CSaD1+iAoOnXpBfT+XePTJy/EziLvrguTuRDzB0k93nQKTt+ypbUmX2O9suNvjYW7bZ
         ITSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490412; x=1741095212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyOopy8tN2qVORYzVG5T+W7YiTWMkF64OU8YybIupHw=;
        b=PmXvxaVZ4LvwwPMLDLTyYobqyi+PFEJDy/G4rd8EsAQrWc84fpytQWRdNRfUA9N+DC
         J1fyMLRaJg/n56X86XWxNTXysM1dqpltsN08Ihp1FPiv36E5Js/x9/p6NlkRin2inXRZ
         hq5sp3eOnONyMJgd8aLkBJCocOyRkQQ78jMhEWiCVcbHv2b9yzwhOSUWkx1PoErIF8VA
         p7t/3pbiaPe0lOw5N+VQyGDvgxcTrwCVkeNCVaX60EDRQGqY4Qqtw/PWNY3OM4tNqT6I
         XG5yuf4x8gj08ZZ6TOG4JvEZ7zmB16POU/cOs8Jx3Lh5kPuDXNmFRTBG81KArITkD3LE
         UYNA==
X-Forwarded-Encrypted: i=1; AJvYcCVraaEWlY629+pnzCQuzzmaXsw1O9w/q0GUknxIwc6CdNVWh4aCRmjIOjfqqzo+cjUgCJo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj5jR55ska2SJq38GHX9WTxHkuiX6RfdUsnduWRjgyAo5o4rDM
	n0/g5xmn9cJJGqmYvN7yBPOA6JpNftOU9/SxGvQamfne5DvXap1T6fwTjNCkvEHtMVvaZuQfkZW
	oElbQyo7fzn0nEFbiq8B68oPUl3I=
X-Gm-Gg: ASbGnctCNKDPwpSS2/14M6opz/MOGKdfjGZsogBHmvAsB4/zY6GNeX1VcyuMg3EKkmF
	5LVjLJXx9OrHHgJtWaIEo4BiLa4G3Tg4KekhfKcPUCO4DkDOmnWHA9z0f3Ls7B0rDnsZA/5X/hZ
	4nstfL
X-Google-Smtp-Source: AGHT+IFumrADYMZTbshcR/jQQQzsoDviUuD373A59nqtY8JJ4DVQv9+RznKhnhkMPzfDVQnWCYD8iJq2w2f2vqoh2zk=
X-Received: by 2002:a17:90b:544f:b0:2f9:cf97:56ac with SMTP id
 98e67ed59e1d1-2fe68a2e72dmr6336504a91.0.1740490412464; Tue, 25 Feb 2025
 05:33:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
 <20250225102005.408773-2-daniel.baluta@nxp.com> <f4466c280bfef24be5d998299df450aa02ff2973.camel@pengutronix.de>
In-Reply-To: <f4466c280bfef24be5d998299df450aa02ff2973.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 15:35:08 +0200
X-Gm-Features: AWEUYZkXV-v2aTP1kBRTGqqig6c6PuH1hUgPphPti5oZf8llKAM919qLE-PCQwU
Message-ID: <CAEnQRZDrC4KEmOBM+LupCRSvNRxpBO0qnPaqG7HBRNeNOzO9sQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: audiomix: Add reset ids for
 EARC and DSP
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	shawnguo@kernel.org, mathieu.poirier@linaro.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 3:18=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Di, 2025-02-25 at 12:19 +0200, Daniel Baluta wrote:
> > Add reset ids used for EARC and DSP on i.MX8MP platform.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  include/dt-bindings/reset/imx8mp-reset-audiomix.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h
> >
> > diff --git a/include/dt-bindings/reset/imx8mp-reset-audiomix.h b/includ=
e/dt-bindings/reset/imx8mp-reset-audiomix.h
> > new file mode 100644
> > index 000000000000..3349bf311764
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#ifndef DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> > +#define DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> > +
> > +#define IMX8MP_AUDIOMIX_EARC         0
> > +#define IMX8MP_AUDIOMIX_EARC_PHY     1
> > +#define IMX8MP_AUDIOMIX_DSP          2
>
> How about calling these IMX8MP_AUDIOMIX_EARC_RESET,
> IMX8MP_AUDIOMIX_EARC_PHY_RESET, and IMX8MP_AUDIOMIX_DSP_STALL instead?

That's fine with me, makes more sense.

Will make the change in v4. Will wait for a while for more comments.

Thanks Philipp!
