Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1037430CE7
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353481; cv=pass; b=TZ8+31hgT+50M1eVZuUcXYWzQ3L0ZPCrHJq6tK0rG6eqW9EqrTS5BX05oP7d5m97CDSSR8CkgJg6GpTjs7lqdMw32eTBtw2+J0nhlMHV9hPumQbM1qAaaLkUDMXONb3blFK9sNZ+HaCAr5lY9RHVKhUc91daEVNduxkxBA+iSWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353481; c=relaxed/simple;
	bh=gCs9HokUb+6ZMGzRlYcfJL9jBr5oqoU0ENUXdBhbWys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoxfwRCADJwTwsSx9D8VPEir9A3ZzjUjQozN9JHZdEMyYVXM4W+9deCEoXXOSnMjg+RlSFpLtmQs2Iq/H0pPJFcluGNM4idDMe19VNqKems4o3FqzvteHfU+dctXz5X8+xZWtXij2LDsjTqtvjEtSpM8uUt5IqUnVAEay9Ol1u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJbdPar1; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJbdPar1"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69532288224so5763641a12.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 08:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783353478; cv=none;
        d=google.com; s=arc-20260327;
        b=FJHNV8nLbJyehZrBwWroQ9bfdmLhgRgFJ3KiOGoD8kvaVsqkoGKpCUY2MONDmuwiUp
         su7CcfifZHVJlzyiuYsFse9LP4kDZhh6veOSKfZGlmrj+5J9z9t82BY3CWx1tyVHpe69
         YBta48NYWSkuHHlXUOJWeebfZ2Vb39JEhLr9UvvzjRGnJpIYcXqt/r0+4882qtiNXRcj
         T0YDqqUFWUNaOnbVDz4HgaY68yNxMCYorYkkv4lXvmfFpe0jEX65m/bC+1C9v0MzZYL0
         kqeQdf3poQyy96EYf/msDjmAM4YNddVw4wSv1oPYB7gubaekz3ftSQsvaU+TFSPa1HEK
         XG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        fh=pcvtNqjhbBvhH9WV3p0i330cj/7uUlttfL6JCDDVdzU=;
        b=NY9eMbLpF9V7WjXgWBG7+fCunwVWolPosmcM8HhgNPT180/qavQ3HiPX6R/XnZ9JhG
         IfrDJVBZj+b+6NfyOiVbeX2gMYmvdM1dNE6E64OzzxbqK33U+GE+zbAgyuSL/330JNVc
         dGXzl7uifYfthHbupq3v6xWJhjVASSEggwwrI1RUO767QSz1sirFmKtW65Fc3Kend8pP
         6B1tohHmMM+oB56fiah2JC5jMdELdykBEuEdFpesXPSJTXHmqplvVCosca4l5VEKI1Ib
         /q64Hsa7nW+oyeU0BVTDcHmQr43PMl9sktZHSu/aYmT79dAmO+4LYvgNtgHXJjRvbS7D
         1vfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783353478; x=1783958278; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=VJbdPar1VmnkxapPUHJGlaacRN78idJhc4HhCKkh5cIheIkAyw/RhTo2bqjlvzI56s
         XHuBe12fa0UD9KbdIv2t8s7gEgjNug20sErgCXKrOFkLikrgdFByHUq/2ti3ZrN51Emc
         wgFhA64nGWJp1QWrFebJrOgKBIeOxM+xMMQI8AD3uWv+ufTELwnhf+6Eb8Q1PBpI9L8g
         m+WgNBwkN38IAbnrkxInSo2+ZB6FV8QtIMDn182ezFYWzRhmUqauWcAltEb+AvlQXyYm
         r2P9U5yz4LbCCtrI6WaVPHEZNKOtxBtqOO6De3x94hL2w8a/YhOKmemtXwFReAKPPbbM
         hnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353478; x=1783958278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=k0+TTygerl/HMhSQVHVjOJb1Xdk07p7SthzXdP7WT7YVG4QYbTD7Nk7+v24nrImyDH
         ShpWbxtL3HaW5garxSSPfKpOMhhMwwv4YpU99GOjH4mF1TQJsYdgvUbZ07dT4RAkVEuZ
         JsVjw569PW83R0BraSn/8vGJVTmtEL/0NojY7qDZ1eg6D6pga6kU5HRS3sdRF45u3so6
         YLCsF47/FrWDNYZJb6/B7TaPxJ/3daFSMhZn9Hx+lZUlOgd+R/jC5NjKgCSRU1evNxTQ
         rnVCtbKWY5RoLT/jVAEKsWskOzkJEXmmxqOMq6Hq4UHtWt2d67wicwCDOwnA6dL1Rz/+
         Va3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqsqzM/wSzevY2xGsh6a9+XSlFG3iOE9ziFlyHWyjfxf6Y1bv71XnppuRIdRZQqJ8c88KI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywku7fFy7LviL/em/j1LaAPmHejkSdaaSOcoZHxbZeWUoOejyx0
	xI6zsFnPUVJM3N8WCwxdRN3opZzyv7zJCwolZcOUCNYhz51Ha6P/DDstQ5xrSrlK9ESOcccBRh6
	J7jqkEhRp1ugIVHugyxtAJhu+50zpBMK74Vl5kV7xIQ==
X-Gm-Gg: AfdE7clMTVQt+BFpTM6uiJsvhopn1ark+5yctv0h7KuVh4HktebgJkyKIzm1TxGxlRL
	zczQYY6BZeV0vrt/B358stxLwFOoTG329MbYVvCd1GmRlJ6fRFEy1JhgGThJqwWCaQMX6AFFwLO
	xa5ayXDvcwWLpsP4o5v07g/lCcESau3KnVWvrUcVphawZxNHpOGiWGNUmEKhDuj0oNvOx+cej0m
	csCz0iZjGupdpYyLnVWXSBBkqgbqt92I3M2JcovNaxUrLJg7fEQ0UQDBFQLwldA7uSafB2y2IxL
	hO45CS7TdEU1BakLLQcJ01U30D/t
X-Received: by 2002:a17:906:3ce:b0:c12:992b:16d4 with SMTP id
 a640c23a62f3a-c15a68cf56fmr47982566b.41.1783353478105; Mon, 06 Jul 2026
 08:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com> <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jul 2026 09:57:47 -0600
X-Gm-Features: AVVi8CfCK8RZVsOnom89zz62dC_eh8WB0dnPwnnTYPsAfwJakdAft3ffWaiSkNg
Message-ID: <CANLsYkxmf=QfNUe=BLrrP7kBtZKq2Z1BkQDLnzmcQsW-kYzTPQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Jul 2026 at 09:40, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Shenwei Wang (OSS)
> > Sent: Thursday, June 25, 2026 10:55 AM
> > To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel=
.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysz=
tof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjo=
rn
> > Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;=
 linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx=
 <linux-
> > imx@nxp.com>; Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; b-
> > padhi@ti.com; Andrew Lunn <andrew@lunn.ch>
> > Subject: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
> >
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Support the remote devices on the remote processor via the RPMSG bus on=
 i.MX
> > platform.
> >
> > Changes in v14:
> >  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>
> Hi Mathieu,
>
> Could you please let me know if you have any further comments on this ver=
sion?

I intend to review your patches but other people's work is ahead of yours.

>
> Thanks,
> Shenwei
>
> >  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
> >  - Modify rpmsg-core to enable prefix-based matching of RPMSG device ID=
s.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.
> >
>
