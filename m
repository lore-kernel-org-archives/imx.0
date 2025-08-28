Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BF2765E9
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 18:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756406181; cv=none; b=BU95ISTGWqw5DaZgZRoMNpWKCd5BAodH+8QaYhX3YVZan1a/0mcqdmfkliUuOvkzS2b9fbKAg+w1ytlQr7bkkwaLJiP+/ywDGLOJ6p9Qt2mY49m1YyD7GHiXdm5vDDUSXzJu/z3EsnyjO+2bkeHJI7myzhnlIS2kYfjjeNgVfYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756406181; c=relaxed/simple;
	bh=KnS0W5Hh+l57/+HU4seoQni4gqN4R0ph3BTOOgn9K5U=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=G+vwYM+MAYWryl6XYSCrrCA+bdR3nDkrgRwfKGUqfZgAIX8xzvOrrL2g45zOOUXO7OEoKWXSPSw4w2RRoOeJYqWrn0fQKnCy/qHQBYO/mcwUTcKYSnG8J2ATRT53Yw7UQCL5yku0pRiMorteIx00sPZdWBd3BRDqDexTDad8ff0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMOKMuBj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMOKMuBj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b65469a5bso11715455e9.0
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756406178; x=1757010978; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plZI8iRSPLJkfX6UA1rPXxqj9r/osCRLYPnrr8iFbR4=;
        b=DMOKMuBjOxOPp+g3JygJ0qK6QkQHlcRYUjQrrpMiZlBLJE2nFEYACp/dE0fsY7ybaD
         xT7xM9wlORJWIKuloUKDy6kGmQX/OyKSc562TAzfK9bwUh7OCx8mGOGY1n7lBvZ5mcpW
         PIC7wGoIqRj8+Lci2w68QmCSHHAK2gn95y9/QwX2Ai2LalBuRjJPvLmQj++T0Aab5XMP
         50rzlu0wogfPnsJRIyVvQrzn1/CvJ7dnCiCHb/cKRDzFKdDYvgrzu6k790PNAkiZLdTS
         cSW5//V92lVXjqrcuZs0bkTgxFTcrlrrz9bNBYFIbkociM4lpqIoKIc7Sv2ItlfbBksp
         a6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756406178; x=1757010978;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plZI8iRSPLJkfX6UA1rPXxqj9r/osCRLYPnrr8iFbR4=;
        b=eN1uEKCexsj0qG98mjEO2gJOkE3K7rSB6/NyrGuBHqQikS6kP/Y0a4E2eXO3bH5rxg
         3ij/lV50/P/lbJZ5gncwF3BOk048ushO73hLn/uRlVD0uDgLCjCkyfHQjJyv9EuhE87I
         gSGN1TxIGpeIwpTCr75zoKEUgrOenEGHh+Mgcq/CATnFlXjCZlVPKlodu8pzf38ppke/
         WRLlATcbspeXNj3Rpp1o8eYQE/Mw9xgkMP/Ix6/g0Qei/OtRQvl1Z6Hoy+ydBLnxFEpa
         AFczXWeQ0mu3+EyseMtGXTOXN8hJZTLJu3FeEkR87gHRHf1S5WosM7BsnNs0+pBkeJyW
         BjCg==
X-Gm-Message-State: AOJu0YxmzW5XmDyI4GsapT3ciLBcDtULa5QATeRpNajz20wfq2JrT/Eo
	bXg7/2hkM7dYO+2ESApgMPz6USD8SHKbV6WWaZMn1LP1oWyqqCiTGALnyjjwDF53OtY=
X-Gm-Gg: ASbGncsxP+d3Hm37yiRbIyOuu2nwhdsrtjbryLEZeq/mfCQyvay/jER3vf6HDJp3PVG
	QXsyk70aea+52UP8mjr+qij3cBbnCLjd9303jmpNytjlPHUv6dMrmo0Ca20zyaw67CryOwiKhEz
	KgPowJVn0d8dki3q2yOlpjB/xGRUdpolCH6Eggcfc9fwlinbD8m01AHZUao0kGZDSTK5xZzZJND
	7cCrBnmaC/yzninWV+3i7yRr7H9mC8mrGCbYoGosbNjmOcRp/yAncjJKZCWhADwj5XcbsnH1H5V
	g7chz+E7/v0796Lpm15UCxMgUH0Z8O5HvXaUCqWCE1TSoQgiOroKFGY3prYoKVTL3h0tq9f7Obr
	UXod+99nim+Vk85KP/d1a2hLENYNfcnW3lUJshJmFw1rKvGoQquZf6zPb4l/JhENOVZ7KOcx7
X-Google-Smtp-Source: AGHT+IGHfFomVo9e9hFrlPBlCkmuNAzoJAz+YrbYrU3TW1g1KlnphdMtRrEL5U16asEEEUzAcjip5g==
X-Received: by 2002:a05:600c:1f12:b0:45b:629b:dc1e with SMTP id 5b1f17b1804b1-45b72ed0730mr46781205e9.1.1756406178218;
        Thu, 28 Aug 2025 11:36:18 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b66cdaaa6sm56782795e9.7.2025.08.28.11.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 11:36:17 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 19:36:17 +0100
Message-Id: <DCEA0YL5MK30.3VV18EAGTGY5O@linaro.com>
To: "Frank Li" <Frank.Li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "open list:OMNIVISION OV2680 SENSOR DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
Cc: <imx@lists.linux.dev>
Subject: Re: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use
 unevaluatedProperties for endpoint
References: <20250827194919.82725-1-Frank.Li@nxp.com>
In-Reply-To: <20250827194919.82725-1-Frank.Li@nxp.com>

Hi Frank,
Thanks for the patch.

On Wed Aug 27, 2025 at 8:49 PM WEST, Frank Li wrote:

> The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> additionalProperties with unevaluatedProperties to allow use common
> properties.
>
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port=
:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^p=
inctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yam=
l
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

LGTM.
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> index 634d3b821b8c7..ec5c40684b6bd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> @@ -58,7 +58,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        additionalProperties: false
> +        unevaluatedProperties: false
> =20
>          properties:
>            link-frequencies: true
> --=20
> 2.34.1



