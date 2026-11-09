Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210021;
	b=LaKBDMIk4l2k0mI8dlFA4BpQ94gAkipUxZ14ksed4cryD3X9iiiUsDXplql1+wPrHdYQ
	 q+8y8finsb/agzgOUfteo0nXYCJheNDvOpfhGxmkpYdoi2BBEwoJnqcraq9ateK4n536A
	 LPqZUHR/+raRfyHRH9WRIV6aPNyXvIm45tPcfW8bkKctHaUfJy2uhVbkbUFn967h9NnZQ
	 eqcvkpWjM33BvNx55b1i7UmlTCyUBZ9I2nmFUBKQFPDi3dkCYKHU0+2mxxVfRTBsz54Re
	 9elg30Kehj7plODpEtJvBHi5fDvv7dgsJy0rYyLyKouhpIUn5hVH2uW2PHUVynhZuxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=Mojw+ea6SJ0yRziYArzN+xDgMGxPewYBg7O1WxusoUQ981FiAXwaZtKEYrhHPKVrBKQy
	 wzntBi6CnsxzHLHSLFEpPCvcfZVPDvueNm8sZ8npBxwnP2CTntnrvvOaBYXM6wMW3RmpR
	 xwKczeoVPVARoYjRP3wEuSdm+0+LGjMUh4ulF6Dt7EzpTrnAVGzOhmnFW2uGu0a/KXlI5
	 sJ8p497sY/0nJSqPyyyr9h78J7Tbt0c54L25NG1iWvdfgVkzszKBFS4VCMmZ+ddBot1kj
	 LDbknlcWTMD6F/ZlcwoYwnGQfckmx2cJeDEQa+qJn4XF5n1zTIFEYc7R78Tgq4ReBqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moLMZJYa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109D606A336
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8109D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moLMZJYa
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so265488a91.0
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=YO9R6IDjnr2bn5W9dFVni9bktv3WwT+x3D+QHWzNiDaDpe2HpR9lep8qBRz308SXH/
         m9hNHzBS7XKAKDDwcdiGt36IkSY+If0BfkJhMk8VFf9T7Jf0AZkHZl4ES9gtdQ8Z1Eac
         JgwQN3C6mtPditzW+Si5+4PvO8SkccBhjecv+U9NWdmsqe6GyUhr9grYbV77SF468BZ1
         766UH0hDcFycfP3brrwFxBWVuPW3/y1E0s4kCWXBlPW86btIaXkbg6iFhHOBBKxzxz/C
         kbHODJiLpdw+A6WFaO97oWgQEZmJ8jt9PDosuPoO2sjvQAIcDYh3OGGT86G3expr3q7D
         zECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=WZ+AmsmBJj+fW5YRFTFzMaw34MIALxXZney1afYq+iw=;
        b=ccihSmh1Yw8pt60+fsGg5l+mvIOjbil9srFyPvTn+IJe4xFshFbp75ZGf8w5u8BVKd
         2oFH7TL9wUMPSxikeIMhqmMOesgI/CGnZmD7RBFi5UJ0gDjODco2lFx6Pyzw8Hfaq/F/
         JvbaVKNVjd6SA/8qkpNqqzBhneDi/kK1Tl90S8ZNQCH1Fu5MKzEQh+4aJBp8wktPHWIR
         AKjJeN5eju5vkMmL0eaZSwFclSPUmVA9s3GUTCYHUgEJP80YGZmHrNClSeO1Tbm0FzPO
         w11sGyLS7j9RzPSBWeHXgnklJGHBGCau7TXP8POtbjXmvHt7/dMFhw4jWzg7m1qCiFNL
         45tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=moLMZJYatz9T+7XUTnn117JVrQGiNU2XzHCLKLoGltw3BQHMiSekbDsHI4RFRAlBEm
         mAYZ3QP1b7Z+JHge8gs3oxVCUloGoox3ez+b/xOD6XnSs1gjDDeqXlqU+y9D67EpLyb5
         ufbd13tvUtCwQhL5CwgVwtKuMrCBjqAVrZuxSDZZatN7YvmQd2BCVSOXkjTuLnU8FLoq
         K4p7gDl4dQTVQFA52Es3b9AISXDFIZekAHLyRAFeg9LeiXuwKr1pWV8L1wHqpFdccv1z
         u4ctAMqIMeNG6ctgrCbFlISFqLvCgHU8VY4sB1fPdb4EO9PR7OJhYPe7zq534DZSaC82
         aSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=0fZ+M566Pp4l/OAhfjvrOmlOaDr6YhMYbxesbJrXttjGxZdzYJhNvKzUKAd/Il1gfN
         YOrwwTEuLt0qWhZKzeZgHXzNp0IvMHLu2ZF/enodvCEwp+MSXe2NYJzoGM/UC6V1w/iQ
         oqmOeU3vSsbvkcsnV3AlKFC25TbIXr+fKap9wybRkjr8np91GcDP2/CvjDx2Jw2dVkDC
         cO0rPLKVOvb7NrbXI7hGX2pC0NBt+lLpdJFa+TOUjIzl9fKymYhEkrCI1N1alrn/XNJ4
         89vZYF/r1hCzBMGY631LPei/nSF4KdacFbTdA6bNQBrrESBUDmcTabpwGuLypm5xBa4R
         1Dig==
X-Forwarded-Encrypted: i=1; AL+hErFMSYmsYRwQTZNcXCB3EsJOjnLqcrWTcdoTXovftGRSk8wYWoyGelS2e10LHdGtkG5vnIU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8wbT962tQPzKEbqPkaxVRwWRll9umfE9R6rnXsEP5x2yDak+mH
	FgGWlrmLYb0w2bex2QwkFejEAe4NM2iKFC9OVSAVUsLuuDjjov2iHCBxn742myGRNVHptL+Iewe
	Lo/6yh39miw3D+Ie4yNRwx+1BKW3rSx8=
X-Gm-Gg: AYBFou3zevsVnIGmOAddIhKj9vTGmFDXUZqV275dpE9nGu2yY5Z6PjEBwPEruswqXlT
	z6IphUH3P8VofSYVGAg8Na1lsyMmaWk2ZRjRwQ25yzLp4sIah3i5oFphYPpWfr8ituQb/8IvmPm
	b6yXhD6XMUlY/lET55TSX0rvAmLKOVKG6CF5wDBSLRHg9g7bIs7sEzAT1lg+w1N5KfaOMtloAU6
	VsyqPpqZX7zqTWpyHqnvwrgS0BZZ54Dqi0Prsd/aRKaTxygcug1CuZtIBkQmG5RRhnQTus7xeH2
	IfAJsajEay/pagUI+rqDr9iXSoxt4K4moQXXd8NHHxOTZKuPpalh7HmwT3Tk5QMZi1om/NMlZ2C
	CJX/V7g39FBqKDtkBzpUsWZLywOOslciuAeY=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
