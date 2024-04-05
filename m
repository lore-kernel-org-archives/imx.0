Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C39163A97
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712312770; cv=none; b=qqH0RmGOHUHLKvOTNlJcUU+Pmel2D03JYs5nftnzfQYxZTLP0a5z4Z6VQbZLYMprP8nJmJimFsR0vCi25QXbRuvUYsWUz6I7HEqoEx1ku22VRzcIy40x4kqW+OmVox3tmc4nyZVVD2VBtIaNsS1qFG6WAh7u9YCPH8wArshP8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712312770; c=relaxed/simple;
	bh=BmBFgykMPvqdnMoOyGWVJk45cd5kDC9vL/wpVpRu1Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iu/gw6664rfJeCr5H0MiJ+Z7b2yUFEkwYBGPW6E0OQAuPRmxMIJquTwurd8wRxnn0BKIEXSfyIwgH+R52SqwGoOHClPV9KSvDdE4YeKaic5AX5Lr9d1mQk3LDuJTcSOb6xrspiUjb3A4ozf3xwI4OVTCqFsenV4+cnCqTvkcNCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cMmBpyub; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cMmBpyub"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so1930177276.3
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1712312766; x=1712917566; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iARPaYJhsEjl43QzURc5h56Y/6xNJ33w7/reZZghG84=;
        b=cMmBpyubLUD8gDuTShs7iPKMN3o1AXpxdX18jt/hOWe8jZHsa+GPwwgkS/ZJnJuoeL
         6kFaEU+aoBBzzUlSrQq+P+MDsprVyQQttz4KG+N4eATc2+96o5KISpjN56aS+2TKAeSE
         phJsezhgO9i+1RzF3WPVWTwYWV1NYgbzFGz1yaZXwy7puipqve4PQqUJdORpqn6puOMq
         pFdzDDqhmpEsO1NNzGLTltjYKPeVT7Row33h0IAll05mVAoeC0RKcc+cy8xYIO3a5a5f
         GewQUVOS7GsKiq+khs+qB4WG+r75RwFVd+ZAFqYTdDUcsLM/FK88if441C9L7Ns04nre
         poeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712312766; x=1712917566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iARPaYJhsEjl43QzURc5h56Y/6xNJ33w7/reZZghG84=;
        b=XeRQkShvVcixFXEDGL+sSHsNF5iBnRi0/tTitEWo/dLhcQkXCoXBU6636T7NJqCxZK
         JIZnIBRHzsfAzFo9hQalZ/kb3//DiaIML0ED59jeY45vfSzRCOYrKTJwBUjlNKfuKh64
         zOjxr1JWueN28RQtmMw02iiDnOEeVnJTrw0m5C6uQRqg1zY95/2Oxh/BzCBh05/kuDH5
         RzYhwGb5dSeQF+zHuba9HgEdZ1OZF++KblEGmSB66YPD5FHCbSrxJ2BKaAD92XRBAOlK
         LPFS/BZGoBSCPAskjDUUsWyFFrC3qbXT27rvw+A8kYM2U6OfiLqK3GjjWEinAhO0LEXp
         UWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfofAu2naajzm7elenkrgILOKp1GfbnWHn4MfksUSvl11AcFL9xgHhsKsqthNyMH5a894EyKflNZ2b9rBVNUe7ygQa
X-Gm-Message-State: AOJu0YwVvwv59kLs/BP1SCzOfVC0GEBrDBW9YqJagHZV+/H2yJuAO76i
	e2ttGMls8MiAbz+aakqRf2siZMZShbkAMHTQs5dZQ5BB+mF5VPgXwZWw0vz5KEZNASPxPg63cqX
	qBC+jnB7u/cB8dBYX2oPy4xrmhgI968IiMujTEQ==
X-Google-Smtp-Source: AGHT+IGiNf41UOijFcS+nvm5XPR4W+ctyL+gK32z/KhUeqbVvoF5ElMWQNkmalXvInXcffwLsTBQ8Hmu10M3phXGLpo=
X-Received: by 2002:a5b:f04:0:b0:dc6:d22e:ef4c with SMTP id
 x4-20020a5b0f04000000b00dc6d22eef4cmr765600ybr.17.1712312766450; Fri, 05 Apr
 2024 03:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240403150355.189229-1-git@luigi311.com> <20240403150355.189229-19-git@luigi311.com>
 <20240403-vista-defendant-ebadbaa52059@spud>
In-Reply-To: <20240403-vista-defendant-ebadbaa52059@spud>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 5 Apr 2024 11:25:50 +0100
Message-ID: <CAPY8ntC9SHJ6Ma17s0Vf2coB-0NUk-xgCLK9KCkxFMuXKHXNwg@mail.gmail.com>
Subject: Re: [PATCH v3 18/25] dt-bindings: media: imx258: Add alternate
 compatible strings
To: Conor Dooley <conor@kernel.org>
Cc: git@luigi311.com, linux-media@vger.kernel.org, 
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	sakari.ailus@linux.intel.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pavel@ucw.cz, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor

On Wed, 3 Apr 2024 at 17:14, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Apr 03, 2024 at 09:03:47AM -0600, git@luigi311.com wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > There are a number of variants of the imx258 modules that can not
> > be differentiated at runtime, so add compatible strings for the
> > PDAF variant.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Luis Garcia <git@luigi311.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx258.yaml       | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > index bee61a443b23..c978abc0cdb3 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > @@ -13,11 +13,16 @@ description: |-
> >    IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
> >    type stacked image sensor with a square pixel array of size 4208 x 3120. It
> >    is programmable through I2C interface.  Image data is sent through MIPI
> > -  CSI-2.
> > +  CSI-2. The sensor exists in two different models, a standard variant
> > +  (IMX258) and a variant with phase detection autofocus (IMX258-PDAF).
> > +  The camera module does not expose the model through registers, so the
> > +  exact model needs to be specified.
> >
> >  properties:
> >    compatible:
> > -    const: sony,imx258
> > +    enum:
> > +      - sony,imx258
> > +      - sony,imx258-pdaf
>
> Does the pdaf variant support all of the features/is it register
> compatible with the regular variant? If it is, the regular variant
> should be a fallback compatible.

It has the same register set, but certain registers have to be
programmed differently so that the image is corrected for the
partially shielded pixels used for phase detect auto focus (PDAF).
Either compatible will "work" on either variant of the module, but
you'll get weird image artifacts when using the wrong one.

  Dave

> Cheers,
> Conor.
