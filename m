Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FCC15748F
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724834755; cv=none; b=INITITdo6vzAS+3huIBLtvBNSz8YkflrcwsNnDVIecAH1dqly+BbSo14xp8rS8avNbFpMUZ146SDFHcfn33tVNnltZD4c1k90hNJpjRmbsiH64aprSaAsYkzAej8d014q2uANPeonXu2UmO5FD8sDeXcb5OdAsDdoudGV+OTqqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724834755; c=relaxed/simple;
	bh=yu4Wy0wOcgEQcfzt1v6vuNg/URcukRaqet6Jqj3F69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULlD/FNzwlUEFIQa7bIQWsjPqyuRLlUvCbGhSYH9K06f1pQb3tJE78KFxwpjGjhlTXNlzu5gS/AXTqBi1lghjlxgMa0cthi70gnsNIlemE19APmuTP6FO0JHHUGKlEvcY8S/olOwZpFNHenOaOBZX84aA3d5Mf+RAGMs/eO5XII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cV22r+P/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cV22r+P/"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-534366c194fso5694211e87.0
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724834751; x=1725439551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vdBIi5m8EWzWp93xlsbcf9ZPOqz4SwEvCdHpMtK8yDU=;
        b=cV22r+P/VOit4pQjfBz0lgYeYeNxKHVLLjV6lCoECpijNPZLdXojRpkOtwhNIA/pWn
         ThMj0ywDdhGxt3rq0CgH284Jj9KE2Z3U3vApBmp78mP9Vte0KHRM5WH3EOdftagSOxk5
         NiUrmlxTyb/JvXieOqsOg1nX8D7T5QtvbeldiMffMy4fvEh8hpeUgP0+EwAhsLx4pmjs
         E03DzTHQ/Ym4FggRGglJYYanr9pngIzqyoAIUnSSNh1UQurs3uZcBqvCuAojZWIIk5ub
         ppj2kBUjsESvBfVkd7JKAiGwRIA/LnBrpGmMf81u0X+xCFd2NpL6Gvxdg0W6BJojGLby
         KatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724834751; x=1725439551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdBIi5m8EWzWp93xlsbcf9ZPOqz4SwEvCdHpMtK8yDU=;
        b=WgHIHJIr985AOtg07NOYTq/dA3JY9/QyazNbawNROhPZm3HLUKzPTKkYflotZ54nuO
         Fx7twrszMfdHmHXQ12ApTTpbcBKgMhdYHg+69m2B1VJ45cQkdBBj6nhqXRUcIBVRKzju
         4EHevdq2IFyt7S2tQeI5ZvJGOe78EDMxJMueWeKuoNePyZh04Xqe7tWyU59EQ+Gu3YxG
         B/wuPEQ6jip4bPdVlRu3Uscl7g+vWyVhA4wGINBRUaB72ZOhrXDPL7Cif8IBRt66gOlg
         uyDd7kMF3Dspshlx+rc0foqb5dkDrvUTIaVm1WdBMpK+lixuZHBLMTO631D308kCFsnT
         9PzA==
X-Forwarded-Encrypted: i=1; AJvYcCXznWnFak2JtprEfd2/Tp22goNd3PvJIX5m3KY1ETgyJLWB6IZWIzCnH5/m8ey5E8h+lpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfugmjU7rJwrvQEzlu/3+UTEe2PYoa+DwinCVWanklIJwthhQV
	RigVNQsTl15IjKuAhtRF/wKGQp8og5A003bnzNFoSmA4NqPoXRCCz8M77KG/lSU=
X-Google-Smtp-Source: AGHT+IHWxfcTIgRBRkO/+YAr6ZW+2Y5xXvy9KTaUM5ZOJKXQFVXhMO86M5E4uZUCWTKcKt1OVXzUNg==
X-Received: by 2002:a05:6512:224b:b0:533:88d:48ca with SMTP id 2adb3069b0e04-534750c2934mr986691e87.55.1724834750626;
        Wed, 28 Aug 2024 01:45:50 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878562sm211665066b.156.2024.08.28.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 01:45:50 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:45:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 1/4] dt-bindings: clock: add i.MX95 NETCMIX
 block control
Message-ID: <Zs7jvCHO+ifC3VaT@linaro.org>
References: <20240729012756.3686758-1-wei.fang@nxp.com>
 <20240729012756.3686758-2-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729012756.3686758-2-wei.fang@nxp.com>

On 24-07-29 09:27:53, Wei Fang wrote:
> Add 'nxp,imx95-netcmix-blk-ctrl' compatible string for i.MX95 platform.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 2dffc02dcd8b..b0072bae12d9 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -17,6 +17,7 @@ properties:
>            - nxp,imx95-display-csr
>            - nxp,imx95-camera-csr
>            - nxp,imx95-vpu-csr
> +          - nxp,imx95-netcmix-blk-ctrl

Move this above vpu-csr, please.

Also, for some reason, this patchset doesn't apply cleanly.

Please respin.

>        - const: syscon
>  
>    reg:
> -- 
> 2.34.1
> 
