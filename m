Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42273FD139
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433606; cv=pass; b=cNlWVLaGBICI/NVj6CbMp/DuzqU4zrKv+bJHNDn61nliVLCi4EhhwoTQVIVA4Fm8UmbrqF2ZhY8+IDzz+KFrFgaUj+wrQ/Iu5XzI9Jx2YivbJpI++yk+DmZ3CpVXl4gXTBEp2h5CD25PXSTbFI3AdNM+5+M+LDtBQetHtdDF4wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433606; c=relaxed/simple;
	bh=kfaDMc7SeR1228IzWwSdYTwwBERUmTN0kZ5yR+E6Fjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDVCZqBiVJHwcmOT+UagRY5ZjttOMPFNgZPT/DhTh8VYxjYoeLxAhHsG4QMVd16huuDY67mzCB/NoYLMlr/C9Dh37vav29Rkk4mlll+iu3zpQJpXwCJAVOGlikQFsR1pMWy9L9Q4fpIlM4u/Ni+RVPJDt8RqT9+ZjLwGZRv0hQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxU5h+Ad; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxU5h+Ad"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so35007805ad.3
        for <imx@lists.linux.dev>; Tue, 11 Aug 2026 00:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786433605; cv=none;
        d=google.com; s=arc-20260327;
        b=TQLcWeQS42ApU3VVUK/hv2zahVgcQogUCItyQ6v7a3LsVfFcipR9P3TGno1XE23SWF
         pIL3nstzwPwviBiOBGdKa2GcfSuxZCQaW7k1Otl8r8JMO8oYS5ib8WRQTMvQXBL1SW/G
         rG/S4qw+f/DZ+U1K7aERnAcmoAFFt9DKB8JKnX9C8gikp+GcX5mQ+QRXu7Yt9lMWh2Bs
         sWpSHoQZxy58XxbZdULgWTl6MS+l9zcSiTdMc6Mt4Ib+WqE0TLfOY4RAiK8dtPsdEyyq
         7O0s3FeCt5xVo9yOQZy+m4ssc5unI8eS8jkyEmi0ZuQQORloNRpXohCOR/6fWE2Si+p/
         zEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        fh=+9rw9AUPtScfRNn/MXmFCL+NFZzNQYQR1KL7FwNvYMM=;
        b=jj1V9EE0tnE1SGpWdhUugkJCOid+MLl/6XzdnwNtwiwR938PxG69VyEtf/CCLxB/Ha
         DVFw8RUrgwyqJ2usie4EMW3wRC33t5E23nsGLKb2zhfUxqWdTNy20ZC61Wc4SzKprQpG
         PpC+1ADO0IHL6Hjz5UOCL15iXN+syHNIz0yNhrJnoEc7/O3wJv35Ge+iyGiuLE/Z86Jm
         NwFhDPkACRGYNqyEGKK1D7AM8DlPC+0apVpJPXFOEcGa69hcHI43okC9olGHsku0zUfT
         m4hvvQmdmbdoCXxO9AXrtENdpwqcIGcPxcNlBT9wFyjkEZ5DSCHONPqMSfVvVR1fO3PQ
         BVTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433605; x=1787038405; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=PxU5h+AdK5mVHgL5eMcFxPYacc7aumNq7tR+RjEEXYZmKO5Ql8twMAOb5Wn1bl4BPR
         fLpjpBRTKs8xABZXLPdAIZlmswR6X7VVGFMq037xqj9xyjV0KVmKeaF6JRFGqLt+ScuI
         Bn6yrPbYVi8j8DuOHWNa7EuCVoUlRNZTHAgYc20D6bE+J24Jn1LIHCZKAef42sWFqK/1
         izoLumIXFWzWyyJtfSSNWxBj3WyX0hVdK0IbAXMTyg42aPPVil604EIToTdh4stWyPMi
         vSOcFtpCnhSW4XiIx1/SVB8HJN17SUt6X7IUC2GUzhBHhM8SuG0keI9Ok0PiYtFQy37o
         LZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433605; x=1787038405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=r0zWH6X5imn3g0636ef78p9hrZ9fnkuj++iQ2mwEYKdH38gA/qT+FDAun6FrNszVg9
         i/smsWBFK3A0DUTbc7/PnGmyxYM8e2MlCsHkyPZOmhalgU4uAAihReRJgFvvE/iAMd1m
         PiaHBlyoZ3aJGDj0jhl8ywXz1bTerUWu1pPPedsK9jJRBL84zIx306FRdyE2h10gQC5j
         Xr1w3gYnbl5Gb9oJqDz4WhR6eAiadJ9MOlCDy2jtg+XsnPzDGx/t+4ijiqRqZxs1VTF1
         jIBQQpHaAQBl9uRy2E2IIanDjZqeuqZIqCx8WXNDz5Nk5K3oGPT9deW/QPzTaVTOCbyU
         MpEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy0UGKMcYF1VSId7PjOQGZ146ILzt5XNnJ6paO9dLUvdl5JC9M+hbzGqvtKqJAYOV2jtw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWdfxBMPF1tv1RdCOob6RAqbO8syBCT1dubWZDiJm3kUotu7cH
	VzbIR5dknK2vsYnwjdflMAl1JLMukmmeUsti2mdaiDGZ0tRffjyTt4IHeFpGnbQxVD8ibEq5Dhw
	py1aPCMitJrtsoTCB77HBQuPAqD5XlZE=
X-Gm-Gg: AR+sD13z8/bllG6soSMLbCCMVp+ZYEyxSUsRix1XSllRzLF25/qSLQxryqO7458Y7Le
	G30wULs++XcBps5j/Nn+xgLHFmYlG9tPlXVzWiTVCsbXDMTJRJ4BNMhVwkmTVvCkY557FxyQIdf
	5m8l3mpIzpIIbZZn4fos+XUnmViwNaNwUVyAhJ0Vwmfb2fk2qBuOOkm8B6o9+B5LPYLdXrGNqQO
	vQ9Nw7qYIqQQWiDoRJnMC9NhYr4xxC3ymZhtDdBSWX9dpU4Y0M11F4r/+4guMV56JhaArUMiwYs
	3QLJvtKZKY9Wl5qkpnb4FjdO38fqNKz4ChzlnGWGEuea
X-Received: by 2002:a17:902:d4cf:b0:2ca:d975:5bbd with SMTP id
 d9443c01a7336-2d3179365d0mr16451405ad.20.1786433604824; Tue, 11 Aug 2026
 00:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com> <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
In-Reply-To: <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 15:33:03 +0800
X-Gm-Features: AUfX_mz8xzcQdpAVFUpNZF46ew2dm49dWd2moRqPqyVHFf2Y0Ny2enqss2gXdZU
Message-ID: <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 04:28, Shengjiu Wang wrote:
> > On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >>
> >> Which SoC? Did you read this binding you are changing?
> >
> > The i.MX35 ASRC (the original) already supports three conversion pairs
> > (A, B, C).
> > All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.=
MX8QXP,
> > i.MX952, share the same three-pair hardware. This binding covers all of=
 them.
> >
> >>
> >>> The existing binding exposed only a single generic audio-graph port,
> >>> which cannot represent independent conversion paths when multiple pai=
rs
> >>> are in use simultaneously.
> >>>
> >>> Add a ports container that enumerates up to three sub-ports, each
> >>> representing an independent conversion path:
> >>>   port@0 -- conversion path 0
> >>>   port@1 -- conversion path 1
> >>>   port@2 -- conversion path 2
> >>>
> >>> Each sub-port references audio-graph-port.yaml as before. Hardware pa=
irs
> >>> are allocated dynamically at stream open time; each active stream
> >>> direction (playback or capture) on a port consumes one hardware pair.
> >>>
> >>> For backwards compatibility, keep the old single port property but ma=
rk
> >>
> >> Why? Did the old hardware change that it has more ports/paths?
> >
> > The hardware has always supported three pairs; the original binding sim=
ply
> > did not expose them all. This patch corrects the binding to match what =
the
> > hardware has always been capable of.
> >
> >>
> >>> it deprecated. A schema constraint (not: required: [port, ports]) ens=
ures
> >>> that both forms cannot be used at the same time. The binding example =
is
> >>> updated to show the preferred ports form.
> >>>
> >>> No existing upstream DTS file for fsl,imx-asrc uses the previously
> >>> documented single 'port' node, so this change does not break any
> >>> in-tree device tree.
> >>
> >> Does it break other users of this binding?
> >
> > No. The existing single 'port' property is kept and marked deprecated
> > so that any out-of-tree device tree still works without modification.
> > The new 'ports' form is additive only.
> >
> >>
> >> Why mentioning upstream in the first place? Either this change breaks
> >> ABI or not, explain that.
> >
> > The deprecated 'port' property is retained, so this change is fully bac=
kwards
> > compatible and does not break ABI.
>
> So why? Drop redundant parts.

Ok, I will remove the sentence below in the commit message.

    No existing upstream DTS file for fsl,imx-asrc uses the previously
    documented single 'port' node, so this change does not break any
    in-tree device tree.

best regards
Shengjiu Wang

>
> Best regards,
> Krzysztof
