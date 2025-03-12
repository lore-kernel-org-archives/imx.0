Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD2C23F377
	for <imx@lists.linux.dev>; Wed, 12 Mar 2025 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778706; cv=none; b=QRH38XUKyrBn7wQhEqNSf4ugbbjf3PoMuSf5SyxDRYfnn9fUQMjkMSX3kkf3ApZd78OEf7U5bNTlyGEzbSVIMqB7Ay/QJ08IlIf2Er0/ezEdRnTbXcSht/BxWl5kF2TKeZpXW9hoye7i2duZAhXboxDmxmFlbEtbSDxqDSBeNZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778706; c=relaxed/simple;
	bh=KZOfhNvGBAR8H62mSv+Cnr7UPfTIt95Y31gyzfttSyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QV2Ef+l5/SMt4imUGe+OaQLmVecyJLMz92ISFlekJZRebtX3a//Ow4jk29Osx2nGjKFkKYzoxaOlrg8R4ATtulCqjY/IMnyeU+fcOC3sJRTvOEe4wXWGv8AzmIGMuF4ZqR+egYpM2be60eB6pSFVGSMhQeb76z00tAE8nhDbbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rl18LG72; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rl18LG72"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6fd80f30ba5so45988667b3.3
        for <imx@lists.linux.dev>; Wed, 12 Mar 2025 04:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778703; x=1742383503; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RAyMzA/EpimoKgZu8On+/pcgYmPCkV2jR9c+DuBL0OM=;
        b=Rl18LG72ORjb02fJAB2r2ds/6gr5LCpA1Gq0bSGNQlXrd0gXSycGdyqCrel4INCOLJ
         KazO8o1aluiUloygsXLk7cq9uogTr3jks60JJiIcMMvJWYIAoXfSIIaBlxIbgFRkywsQ
         0Wn0YA1M1l601UZ5W8kCNrn3BE8biEBih/s/NDPUWxsrp0VAshnPPLPGvpivuPBR759Q
         HscNlg/2OZjPCkvYHqTkGW+hwrLx8Vo28OVQWYtvNhz3bExczyF12jtfo8yQ82+ARI3a
         go8S2Pllrd3BtnmNGwbxYLHyVmWs9HGOnOez1EBB7H7zUZwfd+DvjHahqVJsUivZ3ldY
         CZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778703; x=1742383503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAyMzA/EpimoKgZu8On+/pcgYmPCkV2jR9c+DuBL0OM=;
        b=jqX0cU/UVMeycFWSrt3BOM4GAXqDPbIAexHZU/pTIyFRC7wi0c9+Dhb3kZ782BFuWK
         ZyZc9vcTlbzQugrFYdhWx36nXeZacgUQnelAdYcUcRg5NzAFxpdbnHmKPS0K1mD/Auvk
         MwQEhPqDCO4ToJow2aKCLK1DV14jmAAcpNToDy+RSguJi0+SR+9mwS86VCWLKZUETUlP
         mH7hKCXe4SP4mXkQlrzOuDRQCa5WAx9wHHOzwrmLxK41zDoGUqs5EzpgbWRlNqOeyACh
         nO+v7SmTSE2gPD8AAW+jNDksk6bW3Er8SE0wTYVhW0TqHOctB7VbrXt9zUlwLcsjqK+4
         Sqbg==
X-Forwarded-Encrypted: i=1; AJvYcCWhg5CpB+qpJ4AAPZTEYipj8lquUzwIb3+NBfNfndxOZSHHB52ByJyaAAaiZN3UfRbjHyU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu7+b1ciZ5TQlV0pBv1n0wxFdzrcD0edqTA8kTn7snF36MylNo
	GXM5AKOT2jeZAbaZLImTDjx+Ki8Y2KV3VZ6Ta8uBEu1/vE+Y8EEcdbz5BgVXZaPg59fyzclnMhn
	gG5sFlHp5US1sta+LzGLHG1y3+dfp+0asNRTkpA==
X-Gm-Gg: ASbGncvFlpZNSwOSEqnHgvGI+o+FVmPtjSZYspzrOJqDqZGALuTysIA0IgaBY1ikNUr
	Lw7m1IlGgu9+Ph/wPImop/uaRZTClS9IO0apctqmerk1dCkr+z9IPttT6R0vJCvSp8ftesNamVZ
	t7rl/Ms7Oki3UxBFu8Ym/SLpjVkCk=
X-Google-Smtp-Source: AGHT+IGglu9wcUZQJ7kM7L4REyiuLkmFGiD8FrS6mR3Xkylx8tygAZpPYRnV6JQzsp7VhJrt3avxrAJ6Y8EDAb/0jS8=
X-Received: by 2002:a05:690c:4287:b0:6fe:d759:b156 with SMTP id
 00721157ae682-6fed759b590mr172175717b3.2.1741778703631; Wed, 12 Mar 2025
 04:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306170937.242183-1-Frank.Li@nxp.com>
In-Reply-To: <20250306170937.242183-1-Frank.Li@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:26 +0100
X-Gm-Features: AQ5f1JoI6EhIkJvZ2urcM945k8zoD09K83RZ6y4RdDZ4NA6PxGMieT1lQ5GBlVM
Message-ID: <CAPDyKFprhKa-XqJgfPjphuBCcn4ra2Gj0VewZ8iGqjYAYc2CFw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: fsl-imx-esdhc: Add i.MX94 support
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 18:09, Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string "fsl,imx94-usdhc" for the i.MX94 chip, which is
> backward compatible with i.MX8mm. Set it to fall back to
> "fsl,imx8mm-usdhc".
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index b9b9995705290..b98a84f932772 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -57,6 +57,7 @@ properties:
>                - fsl,imx8mp-usdhc
>                - fsl,imx8ulp-usdhc
>                - fsl,imx93-usdhc
> +              - fsl,imx94-usdhc
>                - fsl,imx95-usdhc
>            - const: fsl,imx8mm-usdhc
>        - items:
> --
> 2.34.1
>
