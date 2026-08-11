Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF1390204
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 02:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415317; cv=pass; b=aBSyk8KCnFo1giXZaH7CkQ9jmuYV7c1cWYpZ79pF4D9FhrDPkeAU0cDLDA95YBNYev0xCQAZok2VRCUPLZLiECK14tMR2HQAdUnmsnx3lF7MERFpoKy6bhSeZEFg/fgYO/X/M510ZU4ifxlrLtOtL3OMHubTHzWs6K4V2ebMxB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415317; c=relaxed/simple;
	bh=AUc+FEsu+DrlUEKF4zIc/Pac63ML9yu4ibWXeDmIe8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJnjB7fGqTX7MdJP1PLoOBclcjeEh/irnUcr4a+u5AR+jbNNgqjVhj7OEXyH2oCysL8qEiZx3PpgofsGBr1xSFYnwTbQv3I2HHbD62xkVazIId+jUkxMQGZ5ohNt+LvHxRWezyLys2y3WSwaF4NK9eH14pBels8PQ4dyIwOZqW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYF0HvAy; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYF0HvAy"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbe3fed2f58so2013875a12.3
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 19:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786415315; cv=none;
        d=google.com; s=arc-20260327;
        b=JoZwMSRtoprVLK+LdeY2B/CzpSBnPp7BzZQeS4QbsoxuqQJUBzylG40UGJc1SrpbOz
         bs7IMyN4YiDtLkvsOkxT/z1RdC9zmJbImzCY29svP6UK1MxrowP4ba9ZKtQhzKK2/iL7
         QQhImJFm5oIIwIrF15PHbIASz+LtK6HcsNlYjJJ7WhL3XnV373UF7FPqbAJ4YpjItVag
         rLEamJEk57e7YT+U3JbYxQDe60MYYf2KA19px7HzvWhou9vPLzO4mhurQ7H1CgJuazFu
         t23K18ZtofV5UOAPNX5BkEYFB6RXPtGqlLLOeeZLj4MytWNi8v3lzyzcwUui3djeKaBL
         O6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        fh=iTqZBpDIewiDPQ3Xpm4c3bx+AQFhr7JjQvc5KRV43Aw=;
        b=oqJNRdv1AERuBCc8FBFGPR8yfua9fZDhzm5jnGnDtQi84EN7bZPefigGGhVNq+Wv4Y
         W3th0zsVxN3liAMeVupaH7cjCFJJ5xnnocIOhFf0A+P7nH4Zv3/FIJGZ38jGLSYRE1wZ
         QxQ5qvJzhwYUdTOzQQKO7WEAoPKr0A+YI2MwWxIlqMkYkl2A+uIqwi+s/wUGBMTw5O9O
         bU6Or2ybLYU/psJyzvsYNzbjC9h+o7qisQMfeD2ZbmiDTfAwr99vu5xscfeHIjozMWk1
         Mzo9vvd6Ncd0i6m8jiChQ6zPUt7GdNyD8DMAYNQ4Tp6Ax7fD38ZKxwPo3p+V2i84NsFR
         3OpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786415315; x=1787020115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=MYF0HvAyXtK9sqon7ICsSfu+eQEZNvyqrBnFkhBbDc1USBhX3ojU1tyduOHNx+qcbl
         NdmpVA6f7W7+Fhca4wHYlhmxhgaoxY4AShZViEYDtH5XaF2asbpe1YFrjM50TcPHCSZ0
         +J9sxMpskqYju20mLhtEAiICgf+JsJnREJJyzsXy0nxwuBi4GVs1FAzBZc5Sixj8OXLH
         vxQ5DQcITM3ALMjJupmS2mm2C9t4dgHWVt5j3c7+sMcZ3tE50b5jLWL2lTJFxr6gvVBF
         dzP6JDg1RJxOE15zyTSBWxzXqP1DUpRj/e2ZD+r+3CbAKmczxu+Cr/5ke6mg4eF5cwmm
         dAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415315; x=1787020115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=rm/Ji3XDzY2AzI+CraMzJpjEQY7GWY+7XEI0dbl4x0bA69ATaF3TQlaA3JVdfJqF7S
         1BwVOI0iJ/gxAKhzR1NIdDTp9+e3UA0MJnMdHj10QtXnCMHIkuwV2BWoseaoi6AsPQUa
         2dm9jr2p8IVScPhpFCRzyBNXdErbMdFXVmNXfM4r7YBeIHTCH+6jH8BN++WB8JdYX9Dy
         vqldXY+K9lGBVA6qPN7Xu50kgDBGedT7vRsIIsK0fa8BcyUNIHr3N0quZBl6Lo1om8Z6
         +0OpnMj7LuB3IvrI46SZEU14OOEDr2MuEVTdMJmnFl8wpL1sMVOtq/gWX1T+BxnggKVG
         pjAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYBS01c3NrkD6wMXPFWZiujNiKEFyr8qAwKO0T+sgCS6TsuVsm9srNxxW5OuhMBADhmqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzGHOkCaMXDJBw28UWrYqD51aPBVPnGLAo8m2JYDZJpcfFblxH
	5fRSkNbXWXS3tN+oZouWPjeE9hYfnpuYx8M3328/sO7Nv2tirpz45esknIVl+sUq9LPIvQO+5H4
	va6PS13dpG4iqaBR4l5pO4bkOA/k74pE=
X-Gm-Gg: AR+sD10emdzTJDCwu5YyWvsEz/k2ACaoB7bpnhN474eg/TnM/WTjAOAuAZ1m864W0KN
	FZa6SzxMJyNfKK6eUg21TkYHPawND+5LI2ubv7Z+FxkFHgzrB1xRqWwkfIptCMqnzKV/k3PrSut
	O5VyZECMTSjmo8Xpn2Unk/Hx6VyM15Ht8FWr0Fm3bTZCitwyJAjlgV38Y3/fycac/+jf1vIjuKM
	AsFaVztJDH7un13Hgwk7JcSpo/hwevR60akqEheJ+rP0Kvau8Zrd2qer4GgBYWYL00VUFRthrr6
	hbTwD73mO0TrxzCFdFM1L264L2Q1OmD2VE1wypXWQBGJ
X-Received: by 2002:a05:6a21:e0a6:b0:398:837a:7af0 with SMTP id
 adf61e73a8af0-3cc2baff1a5mr397245637.30.1786415314854; Mon, 10 Aug 2026
 19:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
In-Reply-To: <20260810-normal-cuscus-of-argument-4b230b@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 10:28:13 +0800
X-Gm-Features: AUfX_myaxBa_rPqdovqcCYr4z7pz2bgmNVRQ7bdnJSbreWmsZ5qeF4VRopEa4z0
Message-ID: <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
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

On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Which SoC? Did you read this binding you are changing?

The i.MX35 ASRC (the original) already supports three conversion pairs
(A, B, C).
All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.MX8Q=
XP,
i.MX952, share the same three-pair hardware. This binding covers all of the=
m.

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
>
> Why? Did the old hardware change that it has more ports/paths?

The hardware has always supported three pairs; the original binding simply
did not expose them all. This patch corrects the binding to match what the
hardware has always been capable of.

>
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> Does it break other users of this binding?

No. The existing single 'port' property is kept and marked deprecated
so that any out-of-tree device tree still works without modification.
The new 'ports' form is additive only.

>
> Why mentioning upstream in the first place? Either this change breaks
> ABI or not, explain that.

The deprecated 'port' property is retained, so this change is fully backwar=
ds
compatible and does not break ABI.

Best regards
Shengjiu Wang
