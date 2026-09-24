Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B62DFF3F
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 05:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227835; cv=pass; b=Jy1RlFhPaqZ297aaBpHnFCeR/UCHLouqg9mBJGSWblCRxH7gI7L5N11LeyK24Nx5VCA65n1DjITeX6EJHPgLxgZbH2Z9hewatcyD+gMWzRK5Uvl0oHe3Hq/QTvvYwxcXD7VhiRz0O59VVKtCaKslXTncYqm6pFTvHev9gluP1uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227835; c=relaxed/simple;
	bh=Y6lfdMzfxBrctx+JVGwRqRWinjsXPeJStQCGnizzDN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWKvFMDXZqPYdqLDyIp5WqVNkPK/czUZc4N6QzW1wWRP2wW7yjbXeNR28TutziFP8VOGpzYfG+Luf4ysW4cuqJWE/r4fJYdNQn85RLdDOddI2eV/dh++Uuw2gsiqsQAmmxW4CRorR/pIKlMvIGwhtEDwOC6j+sBb4OtS/gSxDOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mhG3g99K; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mhG3g99K"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33b9e805130so1268542eec.1
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 22:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227834; cv=none;
        d=google.com; s=arc-20260327;
        b=RpirNKhmmWXDLvVKuBGZey1yOoMJScn88hWmDnZcVK/JaR/jA53LPkcUSMZY5k5Pfj
         OErbeZjmbsYDxNFi8LWjcx9oSm3NtU/K4SnpVjesZVBdAm1l9pM4kekDqVqLBxoIxFHi
         hca0nTttyFEEMJCGI92h9zc9xlMu/jI7rgxdrfXpcyXo9XzYLQm3K9/7KSAcA9LFhq5Q
         NceDzhKKhL5h48WipM1reeSUu+mKWbBXSZ0mO3l8dLLf7BNc7etsDKPRIUNplas8xxEO
         /gelAOUoL3ZKVt6EJUm6wYIWypr9cDSEeZ7lfg4So+z+as0yoaD25ZLzQCzYWHg+wZls
         z3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        fh=1u+xMyYajF5L16dhOfo7SAioOtbYkjpEaQPpd2fqYtU=;
        b=o58GXzJ8m1w/i3XgyDOufVU8lseoMYqQuqSa3fBAnEKu7sDVQL/oMe/xIgX9rZoTJy
         7PPGO6zypAqz+0YCRdpP0TwyjDTrLtdKZ5/lvi3wx9BDAKt67TGzep1X0TCPFjus+rjE
         Rxi9s41N4LT/KcRPg2pa728qqQGNxUdemkCzYM1VkMtfrfzZD1ZeeQCVDvj6oaCK76mN
         NRuxbAnrgJWAvbxmXuUtnyjHA4FwMbCBt/YdtNs6Xybba611bsUSvbg7s1tGW5DA4uPL
         CB7CCCSM62GlN0EHcGH4EsoZhSyCq0Akruw6hC0ZdgoreJz7cMe3q/felNdnVYlxqkpa
         0+zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790227834; x=1790832634; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=mhG3g99KxovoqQrbP/Ms4wnp1vZvOQwfKb26YDwYT0WUsDZ8VpMVONLeZoq7flqUAF
         /wCLbDKj2AonQPBosYpk4Hx1/Uj0gznuRPEpm8PuTKZ71zeg1PJuA3gxaE0sxsPHZQ3j
         CnBBwk3nRoJNzdNE3nBLngIfO+EPoSlSZDfvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227834; x=1790832634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=RzWCO5L0iAVmFROvp6E4XrZLSwGOSfQWpp1A5zBr6C4uEDf3+2jlwLMh6HqguasSLq
         XaJlNCxUooEJ1ceqfxudUZ7sN0YuujQwUJkYbnC+2H1k8+ni7MHTiV2Cwik7tYAdeiXq
         YnjoCoaO7+ekd9EcypcrLttsGpjMSwmXXhHoYroTqPhowtqimXe1tG9tkD6jlipCci1m
         G06mGwf07cT7/6vbobJbnFi5uNKgNihaVz58HnEVrUR9b8pUMgufyn2gXfSx5awlceKA
         hLL+6Rz4ic3CIGapVpcFXMi3XQEslWZV7Z2EBzA4Fnu2wPrxf1jaIOHSlUX+yZIReTq+
         7t9A==
X-Forwarded-Encrypted: i=1; AKwUvBzWCRFvLWSKij9uAcIUPgD+4ZlYZH1LYlMhjPpqsZLumXNybAFtYk57XKqWWiEy3OIa2JQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mcbGGnEPcpWZ9kQqoNqoZ/bAwaIBQ+ds95I5W+R2GsALrKSezt
	RN9H+Mkf3BHq7cBJPcSVJHsOHn8L1o1fzUj6lYq1FRUvEP1rmg9nLkUawWNIjz2rYOim3jOxiPd
	VubzbBE5+Fbd0qD6AUMR5p2vBOXao1OwfV5wJnGe2Yg==
X-Gm-Gg: AYBFou0RRMP2Z0ynLNiOdaWuaYsLgceJH/TiG5jCbMEhZLKb+yeq8kE9NorKmsj7Zz9
	swH8YIOWm4AEnCkZREG/fO9eKHz4ZWrgouQhpJ4AslmgLWq2BDNdC4As3MthYZD0LNEggHfOO8F
	xDllQDIUOdEAVesSD4yOs65tnqBuEZOqG9fiXLKP+PxfR+JMLaRS+1MG1ay2mxtMxLvqSwnsGHT
	oRb58TS1DK6TTWExcpKsCL+vxoynjZDIQ6pXwqqF22iQ7kEeIpUntRzczAGnAhxFIAO8/wR9Gjd
	xkaStM3RWn6z/STV0+GospSAzkohBSiuLzmfhJJRYG5aG8rPbxYwNTDeps6YZn7iR38hBG2iIf9
	bdeADCZUrUw==
X-Received: by 2002:a05:7300:8d14:b0:33b:e264:362a with SMTP id
 5a478bee46e88-34004a89a19mr1123625eec.13.1790227832039; Wed, 23 Sep 2026
 22:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com> <arQxC3DmDyVIGdqq@collins>
In-Reply-To: <arQxC3DmDyVIGdqq@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 07:30:20 +0200
X-Gm-Features: AclHuK9fIcxWA7Sv69t_uK1zMqbihMAU90hONvsInRjWG6YY9lFMwau8XYvA7qg
Message-ID: <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
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

Hi Paul


On Wed, Sep 23, 2026 at 10:05=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Michael,
>
> Le Wed 23 Sep 26, 14:10, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I tested on px30 and achieved working H.264 encoding with some small ch=
anges
>
> That is a bit surprising, the Rockchip PX30 should come with a Hantro H1
> (using a modified register layout) while this driver is for the
> Hantro VC8000E, which is a newer generation with very different registers=
.
>
> Maybe you ended up using CPU-based decoding when testing?

Using
>
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

I have added your patch to gstreamer

v4l2codecs: add the stateless H.264 and VP8 encoder elements

Backport of the encoder work from the branch v4l2codecs/h264enc of
https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, based
on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
uses.

Generate the right element and encode stream:

gst-launch-1.0 videotestsrc num-buffers=3D100 !
video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
matroskamux ! filesink location=3D/tmp/t2.mkv

And playback over Wayland.

Solve some problem. I have implemented:

const struct hantro_variant px30_vpu_variant =3D {
        .enc_offset =3D 0x0,
        .enc_fmts =3D rockchip_vpu_enc_fmts,
        .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
        .dec_offset =3D 0x400,
        .dec_fmts =3D rockchip_vdpu2_dec_fmts,
        .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
        .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
                 HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
                 HANTRO_H264_DECODER,
        .codec_ops =3D px30_vpu_codec_ops,
        .irqs =3D rockchip_vpu2_irqs,
        .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
        .init =3D rk3036_vpu_hw_init,
        .clk_names =3D rockchip_vpu_clk_names,
        .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
};

I have advertised the:

       {
                .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
                .codec_mode =3D HANTRO_MODE_H264_ENC,
                .max_depth =3D 2,
                .header_size =3D H264_ENC_HEADER_SIZE,
                .frmsize =3D {
                        .min_width =3D FMT_MIN_WIDTH,
                        .max_width =3D FMT_FHD_WIDTH,
                        .step_width =3D MB_DIM,
                        .min_height =3D FMT_MIN_HEIGHT,
                        .max_height =3D FMT_FHD_HEIGHT,
                        .step_height =3D MB_DIM,
                },
        },

Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399

I have a small change only in the common part. Hope that it's a bit clear.

Michael
