Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCDB1EB9FD
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728490670; cv=none; b=mEQLDjzBMPqCxAKZMaQrguYR8QMqOLowS3RRiuBMZhMEnIFIvEJOV1eF0c45zTyL7VrWb25vznfvhEe9nN2cD3VTwMl14oDvXgMQg4SHq1cRs/2lrzgRWfG3n6AnkwnZsUlpojrqVXUi7eh7itml6fKqop0NljH0JkopCWmCSSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728490670; c=relaxed/simple;
	bh=XsCqJPOQJaKQv6y7Js2/0JYlyxdvkv/RsvJw/wD4z80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcOkTo2vW34l1d6LF2mThGTIFG4C3Eupv1byJA6qkRCVBxdEoiAjR//Bd0owgxEvemHYCOT8NSpWIbXGzIDEv1pzGYE0hBdmaBFTE+LSm82hNOM5/g0eF0/C105PnN/D4tSo6UcONdBZQTE34PHqAiP0ceY0GUVXgwriL68Zon8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YJR8NmjV; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJR8NmjV"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e25d405f238so6116032276.3
        for <imx@lists.linux.dev>; Wed, 09 Oct 2024 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728490668; x=1729095468; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsCqJPOQJaKQv6y7Js2/0JYlyxdvkv/RsvJw/wD4z80=;
        b=YJR8NmjVVG8uDQLADcawVZ1/1j72W0YryfyOuE1zV6DoeLc/kw5FLbybv41Rpvdlrx
         fKTQhHiFVJFcXfSqgcC2rlkZzCaGSPCiEDpPzah1Z0DvnRLl13Bd0iGJQOmdEfppw4DL
         qLi3Lg75RN+qhUNeq3nnJBwwjg83/yUvZzhcQSaC4aAblp2FT96fRJoyGnMsVSR3MkBN
         wgV3X6gaKtQth0+guPO/Ck694TpGjjQyK+joUal1YsgHrcAspa0VDblGGoXdwWEhWxPg
         TV48I2pHUdeMP6EHEYGlmSUfiqCrDM2JHmOrJypjhAqrbC/GKmF6cq0VGSUIFD+D2ZL2
         HwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490668; x=1729095468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsCqJPOQJaKQv6y7Js2/0JYlyxdvkv/RsvJw/wD4z80=;
        b=IdhM9jeKPSaX0FR5Lp3OclIzVlCGA5X0z5inFCh3TeJ5b1P1/Y/8fce1Cf+Wz8Xi51
         nKhgcwUAsUqnNksrlQfSqD9dIV1oefwH+x4VoxArEssU6qTD9ez2Qsan8BSQOUFKexcg
         FFZNJ4AKCNRy4ab0kkhcwjFgtIi9RXZIGiN1L1xriiSnFk0lf/fvJtPNlZ50kXPK1rz+
         oWbGwUoiLBlLbAUd/hoNO+lZnKVQmRc4NMVVre6EwIQSzFGdfhv3YC53G5GH5USUciAK
         r2e5627IAdxMwXVCgool6Dk4X4hukFaB53PLYZ6phszUEJQlwYeFeN97UNfe/kYRTvk7
         mxHg==
X-Forwarded-Encrypted: i=1; AJvYcCVwCo2R91yW8sLVak1S+5Js5gpSGqRiIf5pDpJJkvJxQP7j7zeD/R49y9yhfTXTzIMQTNk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIvFC1JjU3I4nTPlGLvTdTnazgB52ZgwwMvtTYWO9/p6fLL+3e
	/ufVstxYLcA9Hdt6Nahkl9e8fytJaCdItZEGUJgDMRx38SVl15C5Tk/8x/R2F0Y5yUDRnGyhBLQ
	GuKbjeYLEC2/7J4xXQaFuUHkf5LM0Yw01A3vhZg==
X-Google-Smtp-Source: AGHT+IEhc4X5nJH7MxXrAXKISCQ0c1nXP+Dase0RooHZuKgw/ZrA+HPP70H1m4gm8R9ZIUWIimLj3y/pq23btFkwfJY=
X-Received: by 2002:a05:6902:140d:b0:e28:f172:976b with SMTP id
 3f1490d57ef6-e28fe3d18bemr2644772276.8.1728490667542; Wed, 09 Oct 2024
 09:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
 <20241002135920.3647322-2-andrei.stefanescu@oss.nxp.com> <b80873cb-432c-45f3-8f65-41af607af4c2@oss.nxp.com>
In-Reply-To: <b80873cb-432c-45f3-8f65-41af607af4c2@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 18:17:35 +0200
Message-ID: <CACRpkdZf0jSExrs9=E7dcxm_WAUGHsZE6gNTVeyEaAbGmF8-sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: s32: add missing pins definitions
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 3:25=E2=80=AFPM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> I would like to drop patches 2 and 3 from this patch series
> and keep only this first one. Should I send a v3 that only
> has this patch?

No need for that, I just applied it :)

Yours,
Linus Walleij
