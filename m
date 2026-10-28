Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156374;
	b=YT3OHPPsYBB60eQ4w82UFZLj1xp7NQ4cuq+dlFi6d61coWdBkmvuVJuzbexxa6brbm3S
	 uSQhcnvlLqL9lEnEiK2LDrI4ArHb7jiqd5Ph8LpHu7DjKt6krf4tRkLF75XN3NsiycDpJ
	 I68Fj6rK9Xi64nQJEUUy/VfVZH7i2cO/tyQCKxo3GxdKrIeGdfiIjilCRmj6JWMpAD+np
	 qztSB4uJqkZqDPb6Ox88/wo4v3watOVbvrcMsmhuhxRfyEuQsqss3pbFhUDNTmUXtwi7v
	 vLBMaiSfRHho/c/dXIeozJVC7BpHq+/s4nQ+fWIvliyWwcMVd6EdI/eNsG3mtg2LNTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
	b=VFbW8fLcb8gjgd+SVTrz2SK9S4sLkI9FqQ46F7AJjNl8T/d4juN/WIjRhBRs6+fxxgzd
	 CzY4/M0htNG8aWCidZQgE3KR4Nu/SF7NgXTxF6Yd/XgghmnD97Di8H20XJF80Ex0+psXT
	 yJaOYL56xWtaztS++48PSOtq7ZUoZ506M2tLInSOAVcwn2PPumzOXCqyTVOE+eMkfOllY
	 wEcTdKfPiVEmD8WWsDWYP3uu82jb6fIvz/bW2JovonuYMBK+g5q6TsrCZmoh8fKgR9b2/
	 Oe96ON8wMWZVoUSoZxvnj3rvvj25hAyfVdbSktwEoRkOKKx1DcooAxA8C+T0SQG24Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzBG+UrL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01646606A320
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 02:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01646606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzBG+UrL
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e987a2ba0cso2578765ad.3
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 19:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156373; cv=none;
        d=google.com; s=arc-20260327;
        b=hw7XAORHNzURT58BS4DCODn64jV1k2t2Q62GLO9r7HkvbTO3BInH7u1BAyx16tN1fQ
         u/AqG42Da8Aku2/Yt4rjnPxIubr4/2Aj/iPFWIRS66bXX1Nms47KuR7XQQ8ZuU6rrjuH
         TbmcPZ6zFbEaEtDy659e8wb6fB9c6ithleLswHY1z1TKiBunHSDmwwi/PXhvxnyafigi
         zIk2rupD8WDHYclqdcmUuDekEimDk8Cld+JHhdTgFdgJy9NMrzGiQKtLQjKlldy2mc4+
         acX+I7Lwvk7IDGprE3Qd+CxrhltIVozQ9F5EdaC6ED9hMjGrlmsbMgfDkUJbs6EfEKjD
         L1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        fh=B6Ftb3yII211/YZigIW4PSWuQRISK7bcLVjQHNu+a/U=;
        b=ETwDsZjC+ghWLBZ+4W5bSKTKl7tnobfY5HsKRaC/o4hzC9KKlGeZZn6LPCxCPydFlK
         wfoJ/S1utb63vGBoeynfiSlB7QNaX3g/Ex/oPgOM71TnJq0K2Jhem1vikwvCpfLwwW2M
         o3EMAoTQOCml/sLAwmBV3KUQrf4gh/qzUOXV4Ggl3iUG7wGAhTf2s1KxqD5oHdRsInHF
         pbq4HeQsbMCSwIqS/7ulAI2hFjibGqsofzbPxf1WU4GrvEUkzI4U1Zuv7pe2c1VVxwi/
         ZdHe/HFU5D51gQuMaRpY5przQEf5ZTipbIR1d9AsD6CmJBorK+538QPnD1rSFEJTtfdY
         mKig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156373; x=1793761173; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=zzBG+UrL0e0lec9x862OPI38GHuozOaCifcTztbqwpTLIm0cdC32b2JlSOF/ljhR/F
         tAasjPT/xwYbmaE/siNqxB8r9jsfpO6FCbZh/rZipm8u+dcMCwwikeSw6U6juqQB7Faa
         fcsiPw5tsUEqDHcc7nrGev5cZd1HS3OZh63e6ov1AvlQjWgfDlqSweDTKdFFbT1iIcBI
         Gea5GdS+xeShv49ovH/FKtDSbVZ6OvKBeHbkQz5H2miD3AHEzfh2NGKHiGK/F7/KOH0F
         mBM3gNagC/qE5twim6sxLFQ349TVBRTc9OhYSCj8BzqQL24LZmP4f1VNqXf4Bo4NrOuA
         iZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156373; x=1793761173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=Q/iJPh34+AyH/L+BN16hRxWNUMqSbKB2zIhp4MH7lfdQX4fBZ1LgOMOTJDecfk6kCZ
         0+4piJ7Dj+L9K+nU/2KeUG8+I7srRbbpCVcGo2WBKiR9iLIflrQ24XRrr7CiVlcjGH25
         391xdXIJQzZ7YjmqRDTIBHsq8B1ANGPiEpk833Q30kNW+Bj6iNTrrGI4/dz7KpqnqIKo
         pvmbUzGI0bP/4fouO5F8/R+1fXMZtwT45tR0Ef6OqkDLlu7ulMMr8Hga0AAvLYddIaNO
         AmLWZW7sAxby9qQA3IeFwUdd9qyvGLqpvsOYT2Eq4MaoELdgqnney+WSv39TlTkGQ05O
         DohQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO/oT7VQQiQGYj1+fAPD7dJkat+0IpE8xKUPWhWt+3M3NHlMuoCC96muP5YoE4kb2klV4=@lists.linux.dev
X-Gm-Message-State: AFq9FYL5tQFQq6gHSaq0ZcrcITE7HbAzRRcocnWWchbhOM5Y072KRgV5
	Fbwph8BbIvyW2xjVa8Om1hklDIrGSZuKhr13V6VNdliLEblip2IiVqUb4W3ulYj9BdnIWRYxC7o
	LXdv/NHAvNti/Zyyh3PBWdqk7tDtS/HdIjuJp
X-Gm-Gg: AYBFou1Ao4V6YHEs1foGSqXv510ejJSQVUIK53AeMypqAONqfs5HvjRYkX8RFmd/gyP
	zqBLa0ybcqS4nlRGGLjehpJwLkUmrqjpTPk4GsBXGPORlCrafR2miR3WbgzhZCnU0yKhYJBNkMt
	KoRXGLpm31HH/VoBRLDAZ0V9C0VgbbKicAcA+Q2HzdCqP18i45DD/4hcQvLXSazfHvHV9TlJncd
	BRzgHiqBv4TWMiI1R0oBmN0xTdf+sjPbuE/tXZi1Ej5lgEuKeqixBC0Zhcy+uQVPub3n0r2ofsf
	TXT613MmI1xZRnkAjNvDRadbaxBex724MIFB/1snQZVMLQuQy53QRf9qvGmG58QZolp+6Ar+BIA
	Gh38qrC4/vn3OWWARxlh87syBV1Na1Z3BmDbs
X-Received: by 2002:a17:902:e889:b0:2e8:3566:b53f with SMTP id
 d9443c01a7336-2eb003bf1f6mr12865955ad.33.1793156373309; Tue, 27 Oct 2026
 19:59:33 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com> <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
In-Reply-To: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 28 Oct 2026 10:59:14 +0800
X-Gm-Features: AclHuK-tGLoHs34jMEzH16dC5P2hcrMRxMtYOVpGan1D-YWjOsuDop2uhxHPtLo
Message-ID: <CAA+D8ANey+JLj1v0wLh9cAWCD93Pg+gFoH-FwZU49f4-6zS7tA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: Chancel Liu <chancel.liu@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:01=E2=80=AFAM Chancel Liu <chancel.liu@gmail.com=
> wrote:
>
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > Add support for AONMIX MQS (i.e. MQS1).
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm6=
4/boot/dts/freescale/imx952-frdm.dtsi
> > index 7785eb1a68fc..750046e1a5c4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > @@ -222,6 +222,12 @@ cpu {
> >               };
> >       };
> >
> > +     sound-mqs {
> > +             compatible =3D "audio-graph-card2";
> > +             label =3D "mqs-audio";
> > +             links =3D <&sai1_port1>;
> > +     };
> > +
> >       usdhc3_pwrseq: usdhc3-pwrseq {
> >               compatible =3D "mmc-pwrseq-simple";
> >               reset-gpios =3D <&pcal6416 8 GPIO_ACTIVE_LOW>;
> > @@ -390,6 +396,70 @@ &micfil {
> >       status =3D "okay";
> >  };
> >
> > +&mqs1 {
> > +     clocks =3D <&scmi_clk IMX952_CLK_SAI1>;
> > +     clock-names =3D "mclk";
> > +     #sound-dai-cells =3D <0>;
>
> Above 3 properties have been defined in dtsi node. No need to add again.

Yes,  will remove them in the next version.

best regards
shengjiu Wang
