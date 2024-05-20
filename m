Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8DA134407
	for <imx@lists.linux.dev>; Mon, 20 May 2024 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716211248; cv=none; b=P6UmhUq95Ym6do7bituaiazFIeEnQ1M5GKPpBN9SMZv3VcbK/bO97NVvX4oUzZiHnpg0v9gJtDKSpFbj4VM/kn4UaKUfzIJ2giApio2fcyw0gqRtDrZGoHgrBG6d5mX16k8MQhKvWvBg7iY0h7wNxGS1PRJCr1g7GDB4yNSlGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716211248; c=relaxed/simple;
	bh=ZtzndvGkIGuejxzhOSScRg7IFRuZt6nV23246Vkm7LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IbRgNAYFQgbiFlZNdZglbsGSm7W6CmUYJVN7BzR9u8XtVyCuuEd9sPxPQO15wdBRDgw5nvd/l+A9uLwUsmJ64fkv5a/zNBcT8/d+F+07GQZOpZRvL+rn3XfpKR0tLWrdAMasmcx0dBadCRDsX35yGKhO6yafiqDJuPpNYdx6e1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pTFzPr7E; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pTFzPr7E"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de45dba15feso2438089276.3
        for <imx@lists.linux.dev>; Mon, 20 May 2024 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1716211244; x=1716816044; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpoD7IfFyo0fRXVXGRhMKLv7hvGmowk4hNOwLuLBHAQ=;
        b=pTFzPr7EGXaihqNCAXkahV3WlnpRrX9Jg2XeGD6M8boxMAw8qtS251xySdoBt7Ug6U
         jdOMoDSRU9jcDjnTT5KoMgL/517gTXeC3rwUVqHodXGPvT7Cnp/Ma8PetMVdceZO+Ydz
         95MYHlnUtNnzVpLSV9ExUsTYUoq4SKZ+TJ3QuF0PXFm90YQTfhg0EvQYlH41cogln1S0
         YBQ7J3Ms45Ai0C3QMYOj1hCfUpcEe+JZmujBiC+Rbo3lyElqnRQ8rYQdtRc2msjNk9Hi
         99H1GjygIMLwPvT2QtSzjrhvyPW6hP/CZut5Y1s7oEvePNalNNoVfIppRVTXgsH++KUR
         KhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211244; x=1716816044;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpoD7IfFyo0fRXVXGRhMKLv7hvGmowk4hNOwLuLBHAQ=;
        b=XiDCn9wrQIOTPrfLU4yFooGenmMqpwhRTsX4nJKfhizUMPVDlXfJwylB7wpMCxCGxq
         lx6Db+JB9tjk7ktTy5paqccEXrFnwC51BfcSmKfNyQA2L2aqB8k8lfw6AwbebaI9FUZC
         N5r8Sl2DeXzeqOFVttM0Mk8GxLfPHpOL6YpBp0cslnI5Hrex470odTrZ7ArWB697rhBb
         Kyc8ZqnAixS2/A4yb75KXxIubyK3fyFogN4YaqPYDxLWCbTzc1VwpqpBWOLVJqL0S8Zd
         1a3fP7GH0xTX5xH7zj/G5NNEWWRgSOqWGtXyjWQnjVIV52xgcPrQNV4fu+UwjhRACn/Z
         8UYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Ut0CkyQIt1XEt7eCskfGpqH82wDVLSrbvsn94jMYnlekFFQssyFiJFZxGIYZBf0Rpe/Ax0EmN9UXmwidFkC/w1Tl
X-Gm-Message-State: AOJu0Yz9H/ovS9IEEy+QzINKimSQn/kWVLrVivHZVETtO4r3+2lMkmnV
	5Fx2OboIYE3sv8mDNNDQ/TwWqPRQUG/mHgFLsvna8m5d/PQFdKOrUywOaWD4WgI5fACQ1X0pSLB
	BDkhhgDfmWQfVIPG3HUXB8ZOsTzs+E7VYZeJgcQ==
X-Google-Smtp-Source: AGHT+IGLhrSKkPUoJZ62vutQInuJJOzTJYTiNFbmW3RNzAPYbVG1k0r6chzGp7BB1txzsNkSl4SqFlkWTloKih5W6g8=
X-Received: by 2002:a5b:3ce:0:b0:de5:51d0:9a8d with SMTP id
 3f1490d57ef6-dee4f334373mr26443106276.55.1716211243868; Mon, 20 May 2024
 06:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501152442.1072627-1-git@luigi311.com> <20240501152442.1072627-22-git@luigi311.com>
 <ZkcV5xWZz2jCszxA@kekkonen.localdomain> <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>
In-Reply-To: <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 May 2024 14:20:28 +0100
Message-ID: <CAPY8ntCfQvp9rCt=fqTFKYEOamLZwKmJDv9agxerQtDvsGKB0g@mail.gmail.com>
Subject: Re: [PATCH v5 21/25] dt-bindings: media: imx258: Add binding for powerdown-gpio
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, git@luigi311.com, 
	linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com, 
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pavel@ucw.cz, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ond=C5=99ej

On Mon, 20 May 2024 at 13:55, Ond=C5=99ej Jirman <megi@xff.cz> wrote:
>
> On Fri, May 17, 2024 at 08:31:35AM GMT, Sakari Ailus wrote:
> > Hi Luis,
> >
> > On Wed, May 01, 2024 at 09:24:38AM -0600, git@luigi311.com wrote:
> > > From: Ondrej Jirman <megi@xff.cz>
> > >
> > > Add powerdown-gpio binding as it is required for some boards.
> >
> > I thought the conclusion was that this wasn't a property of the sensor?=
 If
> > it needs to be controlled, then this should take place somewhere else t=
han
> > in the sensor driver.
>
> It's a property of the sensor modules. It's just optional on
> some, eg. (pin 8):
>
>   https://assets-global.website-files.com/63b65bd4974577341e1fe194/654290=
d4d0fb173e87f754ed_IMX_258_FF_drawing.png
>
> Where else should it be so that the module is described properly in the
> DT and the powerdown signal can be used as part of powerup/down sequence
> of the sensor?

From v3 [1] Luis reported testing dropping the powerdown-gpio on a PPP
and it working fine.

I linked to the IMX258 datasheet in the same thread[2], and that
datasheet does not include such a signal on the imx258 sensor itself.

If your module has a powerdown gpio, then you'll have to ask the
module vendor what it is actually connected to. Potentially it relates
to the VCM driver rather than the sensor.

  Dave

[1] https://www.spinics.net/lists/linux-media/msg252519.html
[2] https://www.spinics.net/lists/linux-media/msg252496.html

> regards,
>         o.
>
> > >
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > Signed-off-by: Luis Garcia <git@luigi311.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Reviewed-by: Pavel Machek <pavel@ucw.cz>
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 +++=
+
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.=
yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > index c978abc0cdb3..33338139e6e8 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > @@ -36,6 +36,10 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > >
> > > +  powerdown-gpios:
> > > +    description:
> > > +      Reference to the GPIO connected to the PWDN pin, if any.
> > > +
> > >    reset-gpios:
> > >      description: |-
> > >        Reference to the GPIO connected to the XCLR pin, if any.
> >
> > --
> > Regards,
> >
> > Sakari Ailus
