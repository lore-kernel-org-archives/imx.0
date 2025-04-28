Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD91E27C858
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857326; cv=none; b=K3xS1qB4s49LaK/aiLLUT7K/tOykWlFsY8FtYJLgksOyKMU21dzjqiLgTdNBcS3iCdh1O61ibP9vSiE+mT1r+tcsRvsjLWwUgdIv+37gzPin+K9GJGx65EZ/p9fbRyByCYKxJtt9Tyos38ky/tbmMpNgMtay/brD/I5Cc/QpVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857326; c=relaxed/simple;
	bh=bpFyqVnuV1089Ku+5ux8rJ2ecmqFhHkgxj5EiEeZRv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xv9n5UVhfNSzVuClmj3xke1Wv2lAI0PWajn2N+UKolg8I10brzSwy4EHUnWblxIqfPebirD718UE2TJuzj+Xh2Lm9plxcPqmmP8Ah2/hDRH/79lTpxfWzL96ncdVgWR9z5dIoumqZsqPvjgHhhLyxtKlH8/OTSYSeEP/PS3KGb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zd3qwF/0; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zd3qwF/0"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70821dba48eso38395157b3.0
        for <imx@lists.linux.dev>; Mon, 28 Apr 2025 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857324; x=1746462124; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYJtlwUK9gE9rMaYOlbOBvLsJs+lLIqjK+LtZtlE7Pg=;
        b=Zd3qwF/01xoXcAQt8pYwaWJkqvhS5dLMRi+BFAyC+byhlY1cYqcdwwTagArIrFcKnh
         5whYhcBFxoOqasOK8RvIo/K9lU4xqG9+sLbul1jWDFgBr425fwW7ArKxOxzLnWxsSGJL
         zcitCWIvRZEiOJbTUfnqxX1oWwe9iRao92uTYee6qZbb2yBMS8faoC5x7odopPHTEA5N
         znyFXTYcAjZ4O5qumPct8Jtmx2lbfllAtMB6PcfnMY1zaurfs1iCZILy2H+2DZWAybQH
         995zVpNmSKueJnTqZNKM8Wv8b+3XwaN+AHdN1KfGOpNPGce7bI1Jzxaf80sLqVrIpSJ3
         GVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857324; x=1746462124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYJtlwUK9gE9rMaYOlbOBvLsJs+lLIqjK+LtZtlE7Pg=;
        b=TwVeGUetJve+/9a1rxQuP3MXq+Yk9pu1SIltI28mpIr1h7FS5WzKLoLzH+Pxgs/PKu
         vp3DMA+ABeSkMXywAGTB/HE4y3dnZ3Hh6YLz8qj9f1WCQV9IbvIQPMhwzJr8ilvSd67l
         CyMMeYykuSLQ6NzS8rlCmVu3ygW+0O4aHyRPYw1TnYXA84fzdVkaK5JWmmjz+LHvh9iT
         6ojm2M3Q15XPzHsIvMnAuRt1sUH/6nXWfduCy4llpPrCtIDPchp0PR52rRxjb5aXa5kP
         waU3C3SIjLTHltTXJKf6/iV6MDGsvUa1wFb7G/NVMITmLtDBe/5FxHDBszRAe+naTwan
         o/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmYQjQIn5M9kDHkuZDmx8PQZ2oK33/npWwsIkfHRAGE60LJGSU08PYmkVjrgyFoeldscY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmXEOU2kDrZBGyMv9h94/TnyCZkBq7cuYo6RVOtyvx4OOS6PcK
	h0dmxWthiRQhShfFBc1Aduqecksqd2HAE9n/4Q++3mhiKIDQwyim7pzBwyBr+nx/+BKT5B7rVm0
	iGzCM3zKjdnwLK2bwAel7Z6r02sWMewzSVAiXhg==
X-Gm-Gg: ASbGnctbasj/6LF42JGIHG84eXhmWMKsRQKhYfXwxObaNXF4LJfx7KYWyGIOA8KaxWB
	754kYbS8jMPzjpsL+JVORbajU7OacEIlarv/R2oXHcxXB96WrCpClb8CAHAiou7w9DnlAKbJtOH
	iKvq+j+gDAyJteQ80ZLIb9n6Y=
X-Google-Smtp-Source: AGHT+IEnuPZVaSvesgsXBNiFjLoJWiZy53DGC9o8Sp1zW11942XKrl2X+yuR17blEKZkX8LjsFHcDXXyS5d8LGqn8s4=
X-Received: by 2002:a05:690c:4905:b0:6ee:8363:96d3 with SMTP id
 00721157ae682-7085f23733bmr133253447b3.27.1745857323624; Mon, 28 Apr 2025
 09:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417151300.3570021-1-Frank.Li@nxp.com>
In-Reply-To: <20250417151300.3570021-1-Frank.Li@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:27 +0200
X-Gm-Features: ATxdqUFvglZC6L-IAvGpqWBDcRfYWiynLM-kZ_f4pW7hBaIPW-FcbcKpWQ_mW_g
Message-ID: <CAPDyKFpEGn=xcaG=QF4KkvLxwN3Ak41dJ=1mgY5oDn2pRYJktQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mmc: fsl,esdhc: add compatible string fsl,ls1021a-esdhc
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 17:13, Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string fsl,ls1021a-esdhc for LS1021a SoC.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml
> index b86ffb53b18b5..62087cf920df8 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml
> @@ -24,6 +24,7 @@ properties:
>            - fsl,t1040-esdhc
>            - fsl,t4240-esdhc
>            - fsl,ls1012a-esdhc
> +          - fsl,ls1021a-esdhc
>            - fsl,ls1028a-esdhc
>            - fsl,ls1088a-esdhc
>            - fsl,ls1043a-esdhc
> --
> 2.34.1
>
