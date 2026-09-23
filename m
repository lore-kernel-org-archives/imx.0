Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451BF4E781B
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165473; cv=pass; b=B0m4UGqZyKtlsKGu35FEfNYrNLy2dHfcHkr1fTZ7UOIJbBpYwVYkolelmfSAuskHVbHS/dZRkiKwEBcLBoWYmL9Rju0YItTUgCFxwXCCUykG+NdAMUbmLOlnLJ05d/5R3Wd3d7nqujmG2hj/OfM4vNtbrRCT5ghHVGMVYpeydVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165473; c=relaxed/simple;
	bh=o9ESTc8AilBu3NYkC+X8HMlQp3tCaNfUdjSt8pFWTNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+hQEecFu9XjVqENM9u/q3r3SzlYm1TWZ3Fju7nSSs76/p6XvY2XRMdiCg7S4wMEZs4Dgfb6Y2fav1eBpoInIYKcmB4nr1+F+ClxBSawzblxdK56Ds6/jS06Mpn1iKbq7dFvGYIL04YMaQqwWvASlKoMzIwURvj56vCW6+N9PP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ngr8BXPz; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ngr8BXPz"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e62211987so947664eec.2
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 05:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165465; cv=none;
        d=google.com; s=arc-20260327;
        b=jNDk86Is0pOU4oc9Z5yyNFqpb8QCtlpWUVTEl5MAUqg7mtnStG6TXdeRMzQ/kkuxS5
         Yef94KCcbX3F5pHoZsfuOyheZVq7F2ZplM4jrtAOLyVHC1sv1bk4o51n5afJANat/mNW
         I+NP42VD31ApK9abKXekbwb4dGbTEfsmiZOKkmxbjyckmsZ/1uq3qvkk9IMdKxH9JjbZ
         KcxDGljLSCMAEkRIiTQAIcDPdKOEXoLLmaBImQd+GWBgSkmKvVKJlZR4gQeV69NDXEOs
         r+TxExEwxp48cgnpUgBsqeGuT6rGtgD+5Tqqx6EQ2fAsFqegaH8zJ3/akvINCCqSmdmj
         DGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        fh=FVpW+qrln9H+qIiWTYm6AlwyqjDlvK/su4iUqQddKYA=;
        b=icPY4oTWEQlns83REJX9b2Wc6DEixpkpi5CIrO3bYKQngwDNCllnQmB4P0VcAWIjMn
         9lfk2PHv54zgGscmJHSQVR367WeXpNhxLDl2q1drnT+FbHravDiMIv/RnjAcI6Hpe/o2
         CNwV5/icGZEk5onkqeqnXbp8HBFMaoPyLrGS4xQ/Hsc9fq++0WBB3+6rrmZJ4wZNIHBg
         fySsZjGGAfem2bcDuPCYTuQyotsVf8Wrc0PoGMFsbqosfeiLaLT6lzv5LH9oa9l0e9zS
         n8Yv2wwwqEyajGL6MBNdDhtqQ4R6CWYOhETqv+Y7BFM1bgUSg2JIM3ML2+EOYAlKo6Gf
         dgiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790165465; x=1790770265; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=ngr8BXPz+hjDOsswRx4XCPbZMirwXHAUbMZGl5bEJ2CQd/LSUjJ0ldIIKa6u3Txs1g
         ey2fe9/mDWFyfy6mdKg03gXSdxfjyDMiom8eDjzrcfQK4rlnRi3nNE49Suk8WxQ6+9ex
         cn8HFB3o9K6lnAIyXIZKwxI4tjzKAcJ1aMfoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165465; x=1790770265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=ZKbzWvFcqixxDenHFoMy0eh3zTxmF+p42+mGxXoSZPJ0DvxDqzHtFhV6yQ/McgOKCO
         KkGlGXoBuka5H9aXw80FmGkAvOWLZvxrxOWeSM1MJP0rhUCcd/vdcnVRIbCzKiFkHUmP
         YfRAtOo0n4W6/iws6hLKOcaTNHGLegkqSS/KZHN8Lr5q3VyjK1yI1/eXDstgqJK6R5nC
         PAoPgplfqkcot7BC8DFu0bOr88YwKZP8tyHYmndvg6zh9g4L3ihYpmbJrSbt0K+rPI+o
         g7Pqi5ojN/BDyEcquzun1iAh7/aRAxNbONqzzuc+10SviJ7YV8YFcIpLPIROl9jBgq5s
         f6lg==
X-Forwarded-Encrypted: i=1; AKwUvBxEYxmB4Dq3FRalk2uPrPFM7NFuiw8FNxfgx9Xzj6Cq9LtwM+/jkH6AOabk83ISfsPp+Y0=@lists.linux.dev
X-Gm-Message-State: AFuF++mG4eVqy0c2Ao1klzmNuxlZbLIKEr6QHEM0/PtbB1DYV+yyIm8g
	7sjBnyKbVKEoMfM+Wwh1H6ztXLycX26HSEJeZ9KkEommZfb2SDzCPthpoLlQVVzODzeN2SeSqpY
	bhg8EbINTDZkGbtjMjucMxkDBK0CzH8NhaB7k7E6f4Q==
X-Gm-Gg: AYBFou1jorUQ+HHX+kBa3cNm+1t9yTrFMJn87Cdgunt7qKdefh6zj2lRpUQxXct2l6I
	3MVQHNAeKM+bz1sVsqsTcTf5CBRvK8qUAMEpj8F9xNVHCm19sl1SiWF0fMwibOR6Ijdxn876h3m
	UquZNQJ46ZGMs09x5YSHnVkHw1HENkKma9wjsp0sGuehE49RRfsGAePvchYtCOmE24F64BXRvVh
	KECNaxvs1Gx+5i4WQOe+u8pSuhOgLqEvAzFileg4Og+ZDh3lW0Qhh0caJRZcVPz+lylh2HQ0C8y
	3IpvzADTD+WW7Ki5uZgF14eCIeZIsQ86umIIF7uLaMM7B9IX8d0+8auQaaOGHKu0t+zzOqcxQ8H
	vyeppPKRr
X-Received: by 2002:a05:7300:c7c8:b0:315:9d54:6bf with SMTP id
 5a478bee46e88-33ea4d875damr2193402eec.10.1790165464415; Wed, 23 Sep 2026
 05:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
In-Reply-To: <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 23 Sep 2026 14:10:52 +0200
X-Gm-Features: AclHuK-84lPkb8p5nYwdkesZrMKYeKl0UBKC7sQ4h-YVRpCrvvaQQCitxdpuwrs
Message-ID: <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 22, 2026 at 4:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul,
>
> Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9cri=
t :
> > This series introduces support for the V4L2 H.264 stateless encode uAPI=
,
> > core and support in the hantro driver for the Verisilicon VC8000E.
> >
> > While this is a first version that will likely need some level of rewor=
k,
> > it is already usable for most common use-cases and supports constant
> > bitrate rate-control.
> >
> > A GStreamer tree can be used to test the series at:
> > https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
> > And an example pipeline would look like:
> > gst-launch-1.0 videotestsrc pattern=3Dsmpte num-buffers=3D25 ! video/x-=
raw,width=3D640,height=3D480 ! v4l2slh264enc rate-control=3Dcbr bitrate=3D8=
000000 qp-min=3D8 qp-max=3D42 ! h264parse ! matroskamux ! filesink location=
=3Dencode.mkv
> >
> > Note that documentation for the new uAPI is intentionally left out of
> > this series since it has not yet received approval.
>
> The unfortunate part is that the spec is important for the actual review =
and
> interops analyses. That omission qualify this submission as RFC from my p=
oint of
> view. Any chances you can reply to this cover filling the blank for the f=
ew
> important bit (something similar but non spec style of:
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-statel=
ess-decoder.html#initialization
>
> - Querying capabilities
> - Initialization
> - Encoding
> - Dynamic Resolution Changes**
>
> The other sections are just going to be the same imho. The ** for the DRC=
 is
> because H.264 is not that complicated, its intra only, so you can reset t=
he
> encoder (use the drain flow). So that's probably something for future us
> (VP9/AV1). Adding your view on these topics (or just matching what you ha=
ve
> implemented) will make review more constructive.
>
> cheers,
> Nicolas
>
> >
> > Marco Felsch (2):
> >   media: hantro: use hantro_decoded_buffer only for dst_vq
> >   arm64: dts: imx8mp: add VC8000E encoder node
> >
> > Paul Kocialkowski (12):
> >   media: h264: Add a more generic reflist builder init
> >   media: uapi: Add H.264 stateless encode support
> >   media: h264: Add SPS video definitions
> >   media: h264: Add stateless encode core
> >   media: h264: Add stateless encode rbsp
> >   media: h264: Add stateless encode reference management
> >   media: h264: Add stateless encode rate control
> >   media: verisilicon: Report default pixel coding for non-JPEG and fix =
JPEG case
> >   media: verisilicon: Cancel job with runtime pm put/clk disable on fai=
lure
> >   media: verisilicon: Add common encoder parm and frameintervals ioctls
> >   media: verisilicon: Add support for the VC8000E H.264 encoder
> >   media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
> >
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
> >  drivers/media/platform/verisilicon/Kconfig    |    1 +
> >  drivers/media/platform/verisilicon/Makefile   |    2 +
> >  drivers/media/platform/verisilicon/hantro.h   |   17 +
> >  .../media/platform/verisilicon/hantro_drv.c   |  180 +-
> >  .../media/platform/verisilicon/hantro_h264.c  |    6 +-
> >  .../media/platform/verisilicon/hantro_hw.h    |   28 +
> >  .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
> >  .../platform/verisilicon/hantro_vc8000e.c     |   68 +
> >  .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
> >  .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
> >  .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
> >  drivers/media/v4l2-core/Kconfig               |    4 +
> >  drivers/media/v4l2-core/Makefile              |    2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
> >  drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
> >  drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
> >  drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
> >  drivers/media/v4l2-core/v4l2-h264.c           |   69 +
> >  include/media/v4l2-ctrls.h                    |    2 +
> >  include/media/v4l2-h264-enc-rbsp.h            |   72 +
> >  include/media/v4l2-h264-enc-rc.h              |  108 +
> >  include/media/v4l2-h264-enc.h                 |  135 ++
> >  include/media/v4l2-h264.h                     |  146 ++
> >  include/uapi/linux/v4l2-controls.h            |   33 +
> >  include/uapi/linux/videodev2.h                |    1 +
> >  27 files changed, 7231 insertions(+), 21 deletions(-)
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h=
264_enc.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_r=
egs.h
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
> >  create mode 100644 include/media/v4l2-h264-enc-rbsp.h
> >  create mode 100644 include/media/v4l2-h264-enc-rc.h
> >  create mode 100644 include/media/v4l2-h264-enc.h

I tested on px30 and achieved working H.264 encoding with some small change=
s

Michael
