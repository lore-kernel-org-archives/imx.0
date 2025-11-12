Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF3F2DC34B
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762935211; cv=none; b=YND1+CvOPy90x7qGWJxU4wxJNV5iuhN/WZVRhnYLgy6+yML9aJmKqmz5o21n9HceZ3yFWFG1//SL+9DwNCSRWwSM4xoqtMKo/4TXBpmupDuHKuLzu2YFlyQrpA9xNvHCwYSgbf/GgOKc7Tn9hFfEM1LXtccdHH2tvgwVJh05eyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762935211; c=relaxed/simple;
	bh=qLBafia/PKtEtA26Adnrbq1J4wPUztP9+12xCkx0pVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEsTsmrpwhDj4c1ENGFxmp7rU0UTktbGkTYIKrtepkShDgOfS2CTlrJuV96CL0a4mTsZb5PxGssW+k96JowFITuSaJz70uJkheatJdVyEAf5geAxyxeVEZ3erbLUP2n9r8WGzWF4t0wjZZghjRvp8fGB6h4U8VYaIB5g5Ot3MbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCt2PvFu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCt2PvFu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so152096a12.1
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 00:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762935210; x=1763540010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLBafia/PKtEtA26Adnrbq1J4wPUztP9+12xCkx0pVM=;
        b=jCt2PvFuyqckkRhzd4iiqkpG0bqwNhaq6I+8ndpw8dTw6paKx0Pd33SzrrmE2654XO
         CGw8dMyGCc3ZtpdZJRplDxXsXR5zTD4Gy4gdvjOSjolmTseilTVxENY6dDDmldsli1JT
         40634ugnfi8hp5Q96IGxvOY+JqG23bCMlDBzF5ee8yLCGCLqt956BC2Dvt5CoAFe8sFn
         Q3y/95oh/gmCVbf2zH3CIpOLA6ZIdURhklPiV2H9W74/kbXpO1l5Fgy8u8XY64QszQZr
         kkh/z+/I3KxzfzJ5xmaKOzvWf1/3C4Wrq1Ang6zygfJ68gAk5q7Ckj7bbHQ6h/eVIjML
         9ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762935210; x=1763540010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLBafia/PKtEtA26Adnrbq1J4wPUztP9+12xCkx0pVM=;
        b=bvOIQNG4cNTAFRzXtGZkAPWuH8y96lxVl6dkORxY5BqFAHFaWLZhriSEbZMXa1Sl4s
         +al5EKa8QRvLZqDO2N67m05OIQlxgzQ0BRFWEi+AcdY54k8B9U7NDS/CJ46XjpkSNbv7
         bv2qa3XY8H74zOWbo7qPQ3aCPNl3pO9hdwLxZ5o4VDZAnm6uAiCx3olHmINpEv5+mIo8
         p9dp78BkIMl8Q/WS/PO4/FZ59R+oejcavWuZs+W8ZMzpTVRItiR1SaJ+nf27EtjO07x3
         IfMqOel0nl1yKXn5aP0v3Qyj2mJ47+cTsDNY56R54GwWFc6rhmJRwxxTniinCLyzyV1P
         F+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW5tN0yAaenOFj+B6Q2KQ2rc3JzvCWoi51SihTKH5oxADgiiO+4FVhay9YC8+I/3yWA5c4=@lists.linux.dev
X-Gm-Message-State: AOJu0YziU0qYYy7WHRskkUS8uhpddwjzqzwUBHAuCmfdr8CRwFl2oOxe
	bJhPrEWeFRTTdzt36CjjVUwPSDjnGjcqqMeGifcen+WmCVv9WOi0lQ5vCCsAhr9vwLMqtXFS5vr
	4sTyaTQ7w+TM4AI9+QJ96hROTjEz1etI=
X-Gm-Gg: ASbGnctP3pQV06OoXRTOGI32+47MLmwME01kOowU3P66KuQo93mD9SjscMa5CYXhdO4
	UPuC1eJ2ofJFfhcPoeyUPm0QHiJPz1u1gbnbUZAWuzsHbC1s1OtBsmRK1951lYooRtdv9Lso104
	yob8qdSX7zRHrSoN9oHzkwZK+s1DAAOavDAGGyj64wfvPyoL0XCMKdILWSZnBi4N830KWgYMzOd
	ddaOczuwYYlMuQB+suf0ZmRbQzAeQdt5YPcvtFu+B02E19vOXKHZ38Uig==
X-Google-Smtp-Source: AGHT+IFnRin4gbmaFXUeI1BQiFdRCsNStgXxem0kbVw96MxrNLtIH0I6wkHre4CD95K+KCuFYtCNaztTRJvt/f8NODg=
X-Received: by 2002:a17:902:ef48:b0:295:6d30:e263 with SMTP id
 d9443c01a7336-2984ee02133mr29024415ad.40.1762935209636; Wed, 12 Nov 2025
 00:13:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
 <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com> <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
In-Reply-To: <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 10:15:53 +0200
X-Gm-Features: AWmQ_blLufo9e8_weYIhkdYf5Y61ajIvynO_fKPgAnclvKt8xEjxER44mrl124g
Message-ID: <CAEnQRZBBJ4PGDOk7hBP_qsk7bBiec8pHb0DYKs2mhOAahNyKww@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 2:49=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Tue, Nov 11, 2025 at 1:50=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
> >
> > Hi Daniel,
> >
> > On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta@gm=
ail.com> wrote:
> >
> > > In addition to that, Rogerio please read:
> > >
> > > https://docs.kernel.org/process/submitting-patches.html
> > >
> > > At this moment I think you should keep the original author of the
> > > patch.
> >
> > Right, but NXP makes a total mess with authorship.
>
> I cannot disagree with you on this, let me clarify it internally with
> NXP colleagues
> and sort everything out.

Hi Fabio & Rogerio,

Checked internally and to track the correct authorship and development work
here is how NXP would prefer to get credit.

#Use git commit --amend --author=3D"Xiaofeng Wei <xiaofeng.wei@nxp.com>"
Author: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Co-developed-by: Joseph Guo <qijian.guo@nxp.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

Co-developed-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Steven Yang <steven.yang@nxp.com>

Co-developed-by: Lei Xu <lei.xu@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>

Then you can add your own C-d-b and S-o-b.

Thanks,
Daniel.
