Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD323F39E
	for <imx@lists.linux.dev>; Wed, 12 Mar 2025 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778700; cv=none; b=ppeOpYcPQj83WzLIq/IrBcuwvFIuk7l2xeC3BlTKV1ZQvbzqYlRfdkNlB/OHLD7qCCXA9yDS2eIfzuqSYb9km2SNTKsq13TpakVXjRPr/QSFfQrGaOoyr00SBUvzxqXUpd42OOP/1bLaOciyZC11It+I2H73t0lfCoiL/xfions=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778700; c=relaxed/simple;
	bh=EyLOE0jVe6Ot5eLlgUxopazARR5tkTAv5HgZzzFVFuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AguM1AwklFkYKTQ8ms6CIe7Sd6qWwaxWlCao+zVfH9ImXQGDuovQikLfi4yQO50IVNJkh7jCrL3lKhWgW/Hy6bRdtUhzWH5yoCIeqRBNDJ1hPnsKXfXtKwzm/nTg80IqulFUscdUevEINGdLjXmRCamrjqr9apTImq+mM9iX+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwArBqXZ; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwArBqXZ"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fead015247so49163057b3.2
        for <imx@lists.linux.dev>; Wed, 12 Mar 2025 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778698; x=1742383498; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESIBsTzEIcUZ/ECc1taqnCKMBy5hYudFtIt6EODPkzM=;
        b=CwArBqXZKo3TRWEOI94OZgx8ixBa/wHv2+FetEg2XiHSo7HJH4l2VDcCmsOh0InNQ7
         8jThmbGJQXazMbn5Ps6Gn7Fg9dJltFGl1ztgHnpd/YRUjFfPoE9YnlFj6nnrFlW6Uang
         tVd/+A0JEJGxzo8l2PfVkvNhUI0lf3B94EDj6M5DUebEIIm9lUsE15eTEpSJbfaponOO
         njJXoVjZhgFR9fBWdrH8ymPu2h/wNw57SesgGaYbLGAVnjYcu5VddNOMybk6ovqbCFth
         KfXcJe3kasXMlcY/LYorc79ML/uW0R5aaMBQc+epvBKLBh0L3eOUtkp3PfkHmwUIX+Ux
         rn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778698; x=1742383498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESIBsTzEIcUZ/ECc1taqnCKMBy5hYudFtIt6EODPkzM=;
        b=edjt+cr1pG1gf5PzZnDYvYTD7E+NUtCyRKyYEHbpFBnQgeKcalMrQ+ql1RhwNo3vCv
         eNMMdCnVnOJ4M9DJ0KmzvdQcpSKmzJfbIKW/7+pQTckUhIrVfIBfuRAjK8VVR2/KYlsZ
         ZG6ZN/PHWHXdZoYM2S10GO5kUOjW5YJcgGG5ATjubp+tXzoYIRK/CI1nn0Ae+W6SYLtu
         m9Mh/lZZBfVJQpJ5dJGJxLDByZCzTNxGi+Mzgfffh6J4pq003UnxiiPmeE8aUjUDhB1f
         egF4MMSYe2NOsg+7fuDB5T/qwH/6TOwLLZClajD2JMn/wpOgdh+xjIubv+MnTs17zGub
         uMcA==
X-Forwarded-Encrypted: i=1; AJvYcCXr4ZXsnrhRUY2Fihi/Vr2RIpZb6Bb7udir4r0IpB668qqYukVgsGncrKLBs9gOa1IKXSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHbHrrortX34Rj3iSWgg7Lre9BQ74DIN2LxrELgFPFTJF1ghU/
	aBvYFRDHxqeWLHUnpYTGndFW05StEuMZUw4LO1dm21t4lzY8zOe0a3kXpJChIfxdPHZDmaW/6pg
	G8t24ASTx8iz9+Eu20LhSB5CLjsR9D1lXcxNOZg==
X-Gm-Gg: ASbGnctk6XPSzVHAt1br5zu0afd27/AX91P+li2RZhE1O5T8UHbnPkjDWvnN+BauODj
	3M2uBMn1WzB+ryC6gDFzE/L5Pv60AiLeHuTMvVjF/pc6hTjRxx/J2RbYGyOQOgSWL6TRUjVXaBm
	NsQa1qj9gQCJ2+wuj8+oUkFskHTlQ=
X-Google-Smtp-Source: AGHT+IHtmnbXh+/xWHNRtVc/+e25TtwDya77gAG3BQFWZJv3xY+g85qmMUghOraOvNz9vB+GjgG9TqOZpEeA4ZqkZEA=
X-Received: by 2002:a05:690c:30e:b0:6f9:8436:3d2a with SMTP id
 00721157ae682-6febf3f7f61mr306802797b3.32.1741778697916; Wed, 12 Mar 2025
 04:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250220164655.2081224-1-Frank.Li@nxp.com>
In-Reply-To: <20250220164655.2081224-1-Frank.Li@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:22 +0100
X-Gm-Features: AQ5f1Jo7KEKuskQ_5cOeKngtf3fN-L7jwpx8y4RoWNvAYB-ewPO61CKAdCrGxr0
Message-ID: <CAPDyKFrxGzyNsr5vQjcxPRzyQMTpoR5sZjreYbO_8ZA6i_-XkA@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mmc: Change to additionalProperties to
 fix fail detect Unevaluated property
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev, shawnguo@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 17:47, Frank Li <Frank.Li@nxp.com> wrote:
>
> mmc-controller.yaml is common schema file. According to writing-schema.rst,
>
> * additionalProperties: true
>    Rare case, used for schemas implementing common set of properties. Such
>    schemas are supposed to be referenced by other schemas, which then use
>    'unevaluatedProperties: false'.  Typically bus or common-part schemas.
>
> Reproduce steps:
> 1. Add unevaluated property 'abc' at example of fsl-imx-esdhc.yaml
> 2. Run make dt_binding_check DT_SCHEMA_FILES=fsl-imx-esdhc.yaml
>
> No any warning report. But suppose report below warning:
> mmc@70004000: Unevaluated properties are not allowed ('abc' was unexpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 9d7a1298c4554..26e4f0f8dc1ce 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -24,7 +24,7 @@ properties:
>    $nodename:
>      pattern: "^mmc(@.*)?$"
>
> -unevaluatedProperties: true
> +additionalProperties: true
>
>  examples:
>    - |
> --
> 2.34.1
>
