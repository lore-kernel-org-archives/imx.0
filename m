Received: from mail-yx2-f36.google.com (mail-yx2-f36.google.com [74.125.224.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5234C8C53
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278718; cv=pass; b=PXGFx9ciJCURDwS29FbR01IXoL0dT7HCpNla547+7K9mAziwr1E+JyfbsskcHvytL44g0dHCCUx2Ye8UiBeDGv8zuI7NCHMCXuMgyrCZTF+HpUPdjxy3/DFGQO8w7LleR6huiGpq7/DEGtYPozf+l5p+Ms3gNa7mweNYfwQsvj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278718; c=relaxed/simple;
	bh=kRmPVZ4kecfhKStpwP/qseJ7BCFTN/An8sItpAF8EtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo5GyLhAzaVJqEsPKTKBkXTY9bB3CXgG7+DDhGrUdauzldXcoSSoDbh+249+gNr/H3/uA6DZQ9LaRmauLmd8KPps1RLiYeWJJyL1M8t0AfIM4RqUCbggUw1aWypF48pYqno80gPaSS4CBNdWw5v10W0XLBfCJ67W39WYJGgGK/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UkWjU9Rq; arc=pass smtp.client-ip=74.125.224.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UkWjU9Rq"
Received: by mail-yx2-f36.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso310997d50.1
        for <imx@lists.linux.dev>; Thu, 24 Sep 2026 12:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278708; cv=none;
        d=google.com; s=arc-20260327;
        b=sV2mouQ5WJudNKUHk36mQMm4nbORxyANZrfKWiRggMhAltbWgydX+kTyLjLx+INKbl
         BVhftkVfYOtSMPa10DYgCkSeCPKkrMaqdjoESbNhRelNxi5WAjHBT9pTwa1vfQgzLfjZ
         jV3JH6ONAOPfDqxLMFUaiewKjTVS+qx/x47vb/Bai+ZEWn3FBMsJGY/bliAMnrbm1r8C
         Ap7sVF3mmNPg0RQCTtwOgd+upkWXScv8D4zyfseGFFYsC2L1T/vWlBGLHZz2heTPK7yB
         ItZ4fzhQ+If0Hy/Nk0w30V6uceaLb2ysLFyob5qqmp/nS8ch+Nf497iD5FVay62w56Ir
         Y3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        fh=bD4k3RIAtbXoNzSfLjyRdrmo/L8c8IdAc6F3h9uJxCU=;
        b=LdbRwIW3gBdRa0SrBDulV1dEdGhBblKhc2jA0fj2Fpf4ko4Fsj4yDrgiakcxgmrCvi
         i9RXkmywP/Kecft5PbKbX+Uik3+Y1yTR5lA2M6fMAy9G9B3HwZQj2hIlG8XH06c4i2EI
         I34XZAybbfFb96dK0RQ0TQdT7E9k9iXGHVaNnezYDvLNsf56ykD7Phf59WrhOyMvifgk
         e4H/7t4WnFlC2jYNwCqV4R6CZTUUkpvpzaWZNZyrOawEVUHBwHl0jnx2NLvwfE9QWp02
         zCUdfdCNXpcx+6but01zjnipxfyNboEp08mzfDvjAlrrHhkYfdYYj/1QzbgrltAyrlOt
         8Gpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790278708; x=1790883508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=UkWjU9RqzU9jk4FFGcdMVc7HXfdpXqFmZ5KnftX0PCxHWCmiqdvOW3Ph/sac8jQLpR
         HtfrCcUi9Zk2dNP/5aLett43OJHrJw11ylZ/ylfuuSEEwy5qQNblkhE5XHFazEEpU0xU
         F0rOGj7CDLVxeL99k3vpbZiVCmQra3EdHX1dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278708; x=1790883508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=s422ZvJX2dDPzhMg1M5CIrZy8hmCH8X3tRE+wfPJUdV3X5PL1gPG8QGL8aAwrym1WI
         6sFmPRdCzmt61t0fwExQpGHhF6buGxsElC+fz1NZx666hUnuxB8bF7/t6PwjwLUCYIwE
         n/we7yLkyx/SEVm/ZmGGUZEopJJ+mdpOAOuSqzqLyzsz6Cz5TdXituIziVq6280o34de
         r9Nwf4l7zAzr4L7XD7QfnluHWyyFdiYUe6B0n2myOeJ/utqkz+liEQHRNT5oxasyi0s4
         LveRMqKjTXDAPC0ISYfkm/Jy1n3isrnRhl8FX2bO2HVF3E8nCBmYK4gy1mLiQ5bxbNrk
         cpAQ==
X-Forwarded-Encrypted: i=1; AKwUvByaTLzR88YVg1+hXXYz2JwvZAJftQBy4fKQkeCt1WmZfWi/4xgSALZBg37YkeUD4ZUIx1I=@lists.linux.dev
X-Gm-Message-State: AFuF++mO9RtmMZQ066nTstLzrah/eoK8IL6Gjxuco3c9uXdLU20ErPAR
	BoGb0EpQbQCmIjcVGOCmLJyZVdOyzw6+wft5QINUk+oO+Cu+C8VzpyZXxKsYQfQCbKr0ZmyNoOJ
	d32QcOSFx/dkoJigjIBNPrONLeT746SW0z3eDGF8Ti2vJb998S7NDjt8=
X-Gm-Gg: AYBFou0FELzLtv6xsiKYXJquf+DNbHRRUne5cfYY//78ul7TBxLTvnA/dUeOp8J6423
	6u5ASRywnGUH/Msy5idosrnsQkgDI3fGiKbeUJm0y56SBVVxRVa7nrMS/5cI7qi08ni+5tat8/v
	19HBDaDAAb5LJuwrsr+JNYIc9Yilzv3k6axmp9Sp1ifVTcNc1nmoIfLf2RAVewwWYbeA4AIikKS
	RdS6Jyt4pL7crI/WuUR0IwvgzR1gO5Yd4Skl8i91p/B2+kvNmJOsoLSjpeg9Jpyfj1cBdXmSRvQ
	3arvwx3By8NzjUsRDv9e7kxnD/5AN3CYw4SiawaqymAnwB6rlGS7hwLowFEj/rUxwWqwAk1MQC7
	AciEj53hC8Q==
X-Received: by 2002:a05:690e:d56:b0:671:4d9c:91bc with SMTP id
 956f58d0204a3-672ed3b8549mr1938576d50.78.1790278708232; Thu, 24 Sep 2026
 12:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins>
In-Reply-To: <arVnQmik-CveaAkY@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 21:38:16 +0200
X-Gm-Features: AclHuK_bBSWqL6tBSki95SII0DxHlrmdAk4MDI9hfl1lTZlay91QzSspJUrifKY
Message-ID: <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Paul

On Thu, Sep 24, 2026 at 8:09=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Michael,
>
> Le Thu 24 Sep 26, 07:30, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I have added your patch to gstreamer
> >
> > v4l2codecs: add the stateless H.264 and VP8 encoder elements
> >
> > Backport of the encoder work from the branch v4l2codecs/h264enc of
> > https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, bas=
ed
> > on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
> > uses.
>
> Yes this is the right gstreamer branch to use here.
>
> > Generate the right element and encode stream:
> >
> > gst-launch-1.0 videotestsrc num-buffers=3D100 !
> > video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
> > matroskamux ! filesink location=3D/tmp/t2.mkv
> >
> > And playback over Wayland.
> >
> > Solve some problem. I have implemented:
> >
> > const struct hantro_variant px30_vpu_variant =3D {
> >         .enc_offset =3D 0x0,
> >         .enc_fmts =3D rockchip_vpu_enc_fmts,
> >         .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
> >         .dec_offset =3D 0x400,
> >         .dec_fmts =3D rockchip_vdpu2_dec_fmts,
> >         .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> >         .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
> >                  HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> >                  HANTRO_H264_DECODER,
> >         .codec_ops =3D px30_vpu_codec_ops,
> >         .irqs =3D rockchip_vpu2_irqs,
> >         .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
> >         .init =3D rk3036_vpu_hw_init,
> >         .clk_names =3D rockchip_vpu_clk_names,
> >         .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
> > };
> >
> > I have advertised the:
> >
> >        {
> >                 .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> >                 .codec_mode =3D HANTRO_MODE_H264_ENC,
> >                 .max_depth =3D 2,
> >                 .header_size =3D H264_ENC_HEADER_SIZE,
> >                 .frmsize =3D {
> >                         .min_width =3D FMT_MIN_WIDTH,
> >                         .max_width =3D FMT_FHD_WIDTH,
> >                         .step_width =3D MB_DIM,
> >                         .min_height =3D FMT_MIN_HEIGHT,
> >                         .max_height =3D FMT_FHD_HEIGHT,
> >                         .step_height =3D MB_DIM,
> >                 },
> >         },
> >
> > Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399
>
> Then I guess this is using register configuration from the earlier H.264
> encoding work that I've done at Bootlin, adapted for the new stateless

I need to check mpp code too

> encode helpers? That part is probably not quite trivial, which is why I
> was a bit surprised.
>

I would like to clean up the patches before sending, and check all the code=
 to
not make trivial mistakes. I'm not persistent, so if we aren't, one of
my colleagues will take over.

> > I have a small change only in the common part. Hope that it's a bit cle=
ar.
>
> Yes in comparison to the register configuration code, the platform
> changes are rather small indeed.
>

I wrote this email to state that this change would be impossible
without your work.
I'm currently working on other things, but I had some spare time. Now
apart from that,
I would like to ask about the status of the entire proposal and uapi change=
.

Michael

> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.
