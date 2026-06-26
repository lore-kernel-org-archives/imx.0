Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C03403EC
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782503634; cv=pass; b=pzwoO3zguO2ZdeLiP1FGQB5u8xyl/JMLgR8P4PIb/qZc571ksXGMn8J7PsOj/GyOnVWCCZqctiwdUrO6mWaPTisHqXYtAAYwTIMHvyh8zQmzhiKCCks6FeBQjv7tbwF837XWcqaXqsEzm7nabGpRQNltwgvzniblNNqwUKO2q10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782503634; c=relaxed/simple;
	bh=wSobVBtxGJ1akwNrZpF2zDyzG0HFSPY1i0tXs1vVKIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRMfjyR7TjJ9gkxSM+W4EF5QItMp11fWMlJQcbFZmjxsl6/3uaLpkdUd1wQ2+vuBxAHAJOPUi0DnbmhWqla9h0jjAklGx7KRFW0rDV2KKqnmSsUvgVu2APsHON9yru5byGII+c0N5PpO5jdQuHUXOk7E3IauThIzH7Dsk902/Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCpYhUR4; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCpYhUR4"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13809223fd4so1680090c88.1
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 12:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782503632; cv=none;
        d=google.com; s=arc-20260327;
        b=LZBIy79wnlVSrZ20oc/JrVOX20YJ0h62agIuzsXzAMqifXox8fK9AE/w/AhDXir+fd
         txlwdKYSmV+p6gCAcMGsrGOiJPwT5KoaakPYjrQuyYNFO8zAbCjczjFCbjuiSAaIqQJ/
         f26VeivvfAnNxqgsv2TrBclR8rvV7tuzaFotWGzu74aYQLJPTtDVKZmRf2gbbnM+AKA9
         PBvRorxPCOGgwNNhx2Z0y0HTYrsMiwXzF6FzDoeddvBV+h+U2Qa29tHcIcgpiYnbEhck
         mepo6CVnVo6+tp8PCB+eNspP8csnn3L8waRHsCPXBs+D5hwmIi1RLTLxjD963+tEshUL
         zz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHIpLp9HI+rPAwCzsNS6avOzV6ru9OowfuhFK1lFRb0=;
        fh=TdTDEG/SQC33G8FIFXRRHveSxkBHhUUSjiROrfq1p70=;
        b=RYYsRsBowjcIFhnLdUbedQam8b1bDjGhnvopFCiwYGJqPX4/aiw7ixEU3LVVTTR0PR
         sQG2bzmWv33sDnm8a855HvqM8UOAWZVAqpz3493qjjp7/OM3AnWl0r5Qdkk/GTV5eoSi
         p4SI5xWeC5S5MYbDMjYQ2S8MO1PbpmHZk2yp24q/EAlrG7yImcTZza0bb+ruWsIfqxmq
         ekov785fGL6jSFzV+wNVuRgiDy0PrhlYyqygTFEHG+7/U+yHZ243teK/VFW0N1Wc4Z1L
         YeqOJjSeCsneKXlfGL/zVgAb52QeJo447zZ5+2XEA4rQgLnMQ5CDL6hPFXaZk2HhmnLN
         SQQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782503632; x=1783108432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHIpLp9HI+rPAwCzsNS6avOzV6ru9OowfuhFK1lFRb0=;
        b=NCpYhUR4Rvr5vejP6crKoHAHUauaxHExZn81TTpAlRLLSZW7nfVga1pPeAO1w7yueX
         yMcS2OIG00zTpP8QpbQiOBSp60kyPYQa3FbeEtyUkh753hQj8b/fwAnrdIKo96wguoRR
         YDLoXnIVyDbsWz/VhP3IcfWU4/BLK9Tc6x8zch3+OyaxB+63rnGgRNIaDORuBfYYwTDr
         ITR/jEH+gi60nJ6N/1SWEztwzme2HQkBq2htcsmiVbLEQqHQzNdctdcl7UbsJuMs7jGh
         /2sbsq90iMrBZZcWKQxxbp/O3Nei1nHrTO3B0xhBXmlKbmrc171pISfViCEhVe8i7inC
         xTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782503632; x=1783108432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHIpLp9HI+rPAwCzsNS6avOzV6ru9OowfuhFK1lFRb0=;
        b=Y0CBrzK29nMdct7XdVOzi03BMhO8Ilrh4KGqi+P0YEmKB+gAONf1RAg7IJDQ/cA8y1
         Klh2g97iADv9Jris/cypbh9RxxhdgLZH9JOjCul9TSFp9smneJkBCN7dJhGOQXfnmH71
         DCWFw5iCs3RgXquwfHSaGBGEDL8c5zmnRTznSXr+6PNJncUjGQo/7pgLu4trihrtTLiC
         4jPagEmPLMloHfcNXlNP/P5MIbsbxQw8Rxpd90NFQV0gOTsdQzZUTJBSxuB54pk/lJsm
         TFcHgPgt5I7LT83w4Su0rLAxBHRR+4tRlIX9DUKzA5dwDL26dHpzTBscsiPV1oLd+gxv
         bJQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CaKEYJGEcGHpHliql1F9aRlrjhDjjLwG7R/FrA6Io4J7f8H8pzdM/hXxzBGzer0q95zc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqsFJSi4ZRGFj76jc0SbBdEE24+xwpVh4kPw5qeMuXH6yM53kl
	wzXUiUTVjAVPNm2doNxAXodjO7ChYI+VSxJeB1sc8ogBdnXCzeL0uc7DTXIDvxRMiSMvgMiTyCK
	0b12NNbkLv5/sZHuuFEJJdUgaotHEh7DMhfMwcNE=
X-Gm-Gg: AfdE7cmchquvZwaNWEOR0M0kDt3f2JCZ4hXIxnRh2Fwo2JNzV01ELCLfFyBdwMo5fnF
	Dzff0f8jNAUAkUttH3h0zveW0upQpqiC2FrPBQqgi8mrkS+TUk2OWApT/LNOZWsdLsTbspN5LqU
	gtJdKZzMfXxeP+Jrmim3berVrbvzMyHN3caTBr3aY0KiEwalve5nSQd8JhRV2lz+BJ1NxSQFvd/
	c+UBEhDT0oxJWBLaS+L5OnMzg3fUGWiTzB4knpe58AyFLS6TNVGjoLxbSfp/2lscR1YBmp602F6
	BizC/lOC2iXxGFqY0T4iyBLUUdhM8cWUgmG4jCaJa92GAOZ9v0QXHZuH99AmNew=
X-Received: by 2002:a05:7022:2528:b0:136:959a:abf2 with SMTP id
 a92af1059eb24-139db9e5eddmr6574649c88.2.1782503632436; Fri, 26 Jun 2026
 12:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624100326.413699-1-piyushpatle228@gmail.com> <aj5MNiKSCiEDvDzL@raspi>
In-Reply-To: <aj5MNiKSCiEDvDzL@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sat, 27 Jun 2026 01:23:13 +0530
X-Gm-Features: AVVi8Cc8J5b8utQLMkVEyLYbA13emlJ_chAaoJA4TJ2pE9djj-ndQ8odlJXm0ws
Message-ID: <CAMB+xkbpqNbYpQH331aiXxEhkp6mZTcfkCeELyeS1qbiLTN-9A@mail.gmail.com>
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, marex@nabladev.com, 
	daniel.baluta@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org, 
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 3:22=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> On Wed, Jun 24, 2026 at 03:33:18PM +0530, Piyush Patle wrote:
>
> [...]
>
> > The current dc/ implementation is a multi-device component driver with =
one
> > platform_driver per block bound via the component framework. The downst=
ream
> > i.MX95 driver is a single monolithic platform_driver mapping all blocks=
 from
> > one register base. Unifying appears to require reconciling two bind mod=
els,
> > rather than only adding match_data.
>

Hi Liu,
Thanks for the detailed reply.

> I think that upstream i.MX95 display controller driver would also be base=
d
> on the component helper.  That's something for sure.
>
> [...]

That answers the biggest question I had. Knowing that upstream i.MX95 shoul=
d
follow the component helper makes the overall direction much clearer.

>
> > There is also anticipated divergence which is not yet upstream (i.MX8QX=
P
> > prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX95 blit
> > engine), although mainline dc/ is KMS-only today.
>
> Just want to point out that I sent out v5 patch set[2] to add i.MX8QXP
> prefetch engine(DPRC + PRG) support for KMS.  That changes the driver's
> mode setting code a lot.
>
> [2] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d49=
41@nxp.com/
>
> [...]
Thanks for pointing that out. I went through the v5 series together with th=
e
downstream i.MX95 driver. Although the modesetting paths are diverging, man=
y of
the common display blocks still appear to share very similar register
programming, with most differences being SoC-specific data such as register
offsets and tables.

>
> > One question for Liu Ying is whether the separate-driver plus shared
> > helper-library approach is still the preferred direction, and where the
> > helper boundary would be drawn (which blocks/ops are shared versus
> > implemented per driver).
>
> Yes, separate DRM drivers + a helper library approach is still the direct=
ion
> I want.  I think that the drivers and library would sit in the same
> directory drivers/gpu/drm/imx/dc/.
>
> The purpose to add a library is to share code to reduce overall code line=
s.
> I'd assume that shared blocks or common part of slightly different blocks
> should be covered by the library.
>
> [...]

Thanks for confirming that.
Based on that comparison, my current plan is to prepare a refactoring serie=
s
that shares the common implementations for ConstFrame, ExtDst, LayerBlend,
FrameGen and the FetchUnit base through a helper library, while keeping the
i.MX95-specific blocks as separate component drivers.

One implementation detail I'd like to clarify: would you prefer the shared
code to remain in the existing dc-*.c files with additional i.MX95 match
data, or would you rather see it extracted into separate helper source file=
s?
>
> > how the component and monolithic driver models
> > would be reconciled given the differences described above.
>
> Like I said above, I don't think upstream driver would be monolithic.
>

Understood. I'll treat the downstream monolithic driver as a reference
and follow these plan for the upstream implementation.
I'll start by preparing a refactoring series for the shared blocks. If the
approach looks reasonable, I'd be happy to post the series for review befor=
e
working on the i.MX95 driver itself.

Thanks again for the guidance.

Regards,
Piyush Patle

> --
> Regards,
> Liu Ying
