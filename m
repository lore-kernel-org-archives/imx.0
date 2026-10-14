Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA64DA9BD
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970201; cv=pass; b=SCaugoNj+QQJuuLyJK06+1zZnOiOaAo31ztUWYbYAxHyxtTz9KxbRpdpBDGnFgSpqx2yOmW5U9gKEzm28BQsjs/6ymcvLTgMuXm9ueVwN+cZwruu1XCrQhZQIHNdwlZjZ12IQDo+VQlAKp/mXJMkDBcbWqtuyF9t2BMAKqe/pNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970201; c=relaxed/simple;
	bh=pWLyM9luQsQK0o6TzyDtyGsr+aOk8Ps1JZKkmmEaLaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=At1zFanx1/EQLzXSj8vhJ7UcCPT+VU7fDgziIkl+ghYhMVgFgFqFsYYXPbUvovGOYkGsb6Z49JyekhmJ6SPPQWIn4b6uxBAMkV1Ug3Zz3QBkYu3tBMSeSs0U3GOa2IxbmCiNOFMMtYAUX3lgfjSbDmdYBvULeKaHTXJXrE+TtfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dwPkRhC5; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dwPkRhC5"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67699afea08so3011770d50.3
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 02:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970197; cv=none;
        d=google.com; s=arc-20260327;
        b=PEAerOOq4CPXZcIREPpXlMT0uEnJOtwR68b+ZlHCfx0zpkA9B3im7UJdHRiw1MqbMW
         2MT3B3MnEI4qYPV5NOn1c2WRan8q9fCpJfXV9fakJMa0BMESPEB8hSnC6JzOhhYchAtO
         ANFJqQ6wMjzNrZYShoTgVUOMKbfybk3DsjBpj5OzFyisHos881db13Ab1XO9fB7KcaZI
         UHAJRMXFRLK53xkfQJJSN6kvpQYe3+ldUSA1jVH3AKv0oUXdjlub3kPCf9g9KiMqky6X
         x9SVUiaUd0fzM9sLxowqXz2mNNdwQkzguPqYiA7mqh1NKz3gNISBfxj35Du76s4vvvx2
         uNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        fh=gfeygZ91spt6QGAryspN4eybH8UEZrgeR7OzuPzyTVQ=;
        b=L6D95IUraV8A06G2JjUQTNnu/GhKtTeyGLB/LWg2+nj6l9zq/57XS9MbXB9jsA4cpe
         dkkk5h7ZklYq80SXx4VkXQnS4s2/wuMAvVLAtOesP0VzZy12ehFXUevNEqZzbxb579Z0
         QmoBVgWbqI+Z/WdPl6zmWcI/Y1moRMLdUMtYJZitoKbhw2t8RhzpVHu211e5yWbKgD0+
         rNqzV0A3FdrlwmoVeyM61qAuRrni5T43027oPhNgu7eKAbPYxBANLZNlLHm6vdrBVeY2
         5uEHSBfhrsIwcMUmKWYU0yoRLL7tMDpIDnq2WVvYNx7p8nvYkdJZaOvaEoMpycM0HUiE
         XEfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791970197; x=1792574997; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        b=dwPkRhC5razbc6Lhhc+1+Yok8fyAO9iv3Fk0pmkUzUL2gQ2PCilJkXI8DjEDEC/xft
         AHP8fycU99363Wl0WkzefvYntwImBNsGe4xZgXjJY7Y0IuYzfZqnvpk2WfGqUBd0q21q
         3u28WBUqSWtHRua83jcddrA0bmmz/00hMbSiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970197; x=1792574997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        b=disCSuzy7AbTKVVihhoHz8z1tMSWIoWWsZzLRxxWDR7Bu4E8BIQ2/mSwM0BvWWmu2H
         ij3UlnAv0lf+hxf6dPHI78knrqaj9/gwsl2vRLG8faPkoPjA318ght4g6Jn+2T8sWTCz
         MznTJLqNFZ4YNmSNGfvhdYrBo3i76WiTwYlqHuDGz50Zp6lBnMTdSqADeB1KzeDHPnjo
         PDgyVSr2Si+j3z6hefaA0NhaOS6iELw1phaky+AQ1KgBmKMM2aOFFfSoSIzSHzCsqMYF
         hqtOebWLsQpegiEcAv2qc279qcbcTDzdGWzzaaCnPaVkgT13lyFYNoPRyoNFZo+4Ef+L
         08dg==
X-Forwarded-Encrypted: i=1; AKwUvBzaQa1cdTaqRLbhmpYuZfOUFjfPhP7u0bJWR6ZnkwDaerUQZC1yD9bpaPmgYEIxV40GB9s=@lists.linux.dev
X-Gm-Message-State: AFq9FYLDAb68r08px61++uwShH6ruAzFp28nmmoeW57hUnrgghXqSgTn
	32vEfEzuqe7YK/MbEVsvpydzX/J3DKKYq3Ga3+Jvt8PLFjsADpcRvKk/yOTJ3+zb88vkpzf4OaD
	fAAmyejTo0L04ivEdiADPtDZZuXn677lGVmgx1QmU
X-Gm-Gg: AYBFou0zp0l9xowhRHz3crW0D4sLpQJiYgZf7aTh0Muvz/hu9tkT1FIq903vXfEly6L
	OxprrPEVfNuTJ4JnNfTFB8q/oRRDnv/2bX+Z43fDsyFlrLF9Wu96NFCGxdJTGgpK2iYCDw+ox32
	CibknmUjsUQw6QkstVTPuPGwOiEuyXgT3YUEtUUYgnIsbAmcslgO00M5U6R3L60X62ZEaUbUqR7
	Ii+uD9wx534osFLW0KDBs4HROqdK0sSR8F50nxpkbG9NPNTU/61TkZvoCMD6LNTPNoqLERdXlzw
	NAZtmDZtfOONnMUrPhoaj4cdu7dDADd0sq9l/8b2qgxxKLWaprYW5ibAic08rCl3j4U=
X-Received: by 2002:a05:690e:1094:10b0:677:d106:6f97 with SMTP id
 956f58d0204a3-679363475c0mr3180487d50.152.1791970197053; Wed, 14 Oct 2026
 02:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
In-Reply-To: <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 18:29:46 +0900
X-Gm-Features: AclHuK9N2qPZVqRIKj3AC2e-RNgLBJ_oiV-FNmg6s8RgvBJGg_msVeXPasEPdno
Message-ID: <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 10/14/26 10:20, Chen-Yu Tsai wrote:
> > The DWC3 controller can operate in host mode. It does so with a XHCI
> > compliant host controller. The XHCI has two downstream ports, one for
> > HS and one for SS. USB downstream ports start from 1, not 0.
>
> Is there something in index 0 we will need to define at some point ?

On the host side, no. Downstream ports start at 1.

On the device mode side, I believe the numbers are completely made up.

> Using 0 as base for numbering in DT isn't incompatible with the USB
> spec using base 1 for numbering,

But you end up with diverging numbering schemes, and it diverges
from other USB controllers, particularly XHCI, which DWC3 embeds.

And it also differs from the numbering currently used for directly
connected onboard devices (like hubs), which use or expect the USB
numbering scheme.

Sure we can make DWC3 "special", drop inclusion of usb-hcd.yaml,
and duplicate the section for onboard devices. On Linux, we can
add some more code to xhci_find_raw_port_number() to make an
exception for DWC3 controllers.

Also, usb_of_get_connect_type() is already broken for DWC3 based
controllers that only describe the HS connection but not the SS
connection. usb_of_get_connect_type() currently doesn't call
usb_hcd_find_raw_port_number() so both HS and SS get mapped to port 1,
which wouldn't be in the DT since HS is currently port@0. But even if
it did, SS would get mapped to port 2 anyway.


IMHO having consistent numbering across controller types would be
better. This avoids making the USB core and hub code deal with more
exceptions, and also easier to understand and write device trees.

> > Reconcile the downstream port numbering with the common USB host
> > binding, renumbering the downstream port numbers from 0 and 1 to
> > 1 and 2.
> >
> > This is non-backwards compatible, however it won't break current
> > major implementations:
> >
> > - dwc3 "gadget mode" in Linux kernel only requires a connection to be
> >    present; it doesn't matter which port it is
> >    - dwc3 "host mode" OF graph connections aren't supported yet [1]
> > - FreeBSD doesn't use the OF graph for anything
> > - U-boot doesn't use the OF graph for USB
> > - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
> >    the OF graph for USB
> > - coreboot doesn't use the OF graph for anything
> > - Zephyr doesn't support dwc3
> > - TF-A doesn't use the OF graph for anything
> > - EDK2 doesn't support dwc3 and doesn't support OF graph
> > - OP-TEE doesn't support dwc3 and doesn't support OF graph
> >
> > [1] WIP to tie OF graph port node to USB port device
> >
> > Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF =
graph ports")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > It is unclear to me whether the HS/SS numbering is fixed for all dwc3
> > variants. I checked Allwinner H616 and Rockchip RK3588 and they both
> > have HS as port 1 and SS as port 2.
> >
> > This also doesn't cover a potential "multi-port" DWC3 implementation,
> > which Qualcomm seems to have.
>
> It breaks the current Qualcomm numbering on numerous boards.

Yes. It breaks _everyone_ using the current numbering in the sense that
they are no longer valid, but should not affect actual usage.

This comment refers to "multiport" controllers from Qualcomm [1], which
would have ports beyond 1 and 2.

[1] https://lore.kernel.org/all/20240420044901.884098-8-quic_kriskura@quici=
nc.com/


> > ---
> >   Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yam=
l b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > index 6c0b8b653824..4b6304bd2ec1 100644
> > --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > @@ -410,11 +410,11 @@ properties:
> >         property is used.
> >
> >       properties:
> > -      port@0:
> > +      port@1:
> >           $ref: /schemas/graph.yaml#/properties/port
> >           description: High Speed (HS) data bus.
> >
> > -      port@1:
> > +      port@2:
> >           $ref: /schemas/graph.yaml#/properties/port
> >           description: Super Speed (SS) data bus.
> >
>
