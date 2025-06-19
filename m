Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30A3227B94
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332034; cv=none; b=sju37GUh7OaJvJzCJe3pwxMkPTeQU8j+IQdJ6RrZpO4u0F99EEyn9Dx/bicRrk5eGK93221VTEQWRXQO7tUrUozJmTvJiWhe+M2cf5PP9KyYImowPWO01dzmADbMIAGLKyImRioZI4H6lJesuyNdrfWP+kv+Xr5yx0zULA2kvHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332034; c=relaxed/simple;
	bh=NZ5ua//HRvEUXqDrATHvprzOWGicDxLR60a8JgIYce8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IB1DJJiYFFEICGr2zkXTAmKMNuckahLZLWfJs6OnyxvPD45r14negGKlYKCgJ/vG5ePwRzaqxu6/JdfUHfk4ZEsagF0Fe2n3RMH6vniU/3wvT6JjBqNjBZny0mYmMd/zXKRlxFsXgNVCgJZtQnmM31lYY30Kb6U7RCtFYv1bGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rafYPWDX; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rafYPWDX"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8273504c67so659351276.0
        for <imx@lists.linux.dev>; Thu, 19 Jun 2025 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332031; x=1750936831; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v/7Q/trZ5SbmALMt3c06DmQkKxihbiVngkXZ1QJXJs8=;
        b=rafYPWDXE7JLttvTXwv3VrgK8foFHRY6WmsALczTJphRbYIxVoN3Np3SfNo4rn73I/
         V5xhBTEKZLNcp647+v8Nz81j9GbvyyNKSh7c9elu8GdCqgtkJDedcJ0mK577NLcvS1Tk
         K09WHJDF367xlsaa47XXmxQzjiFyFZdDYjEqoVNnDDbuKsjbLKRamSgzyh7Ncpip2w5T
         wKc93TAjC0yO89Eu5u4r4Xw+Zft6eMaweaJ7iom039nX468MSrdnCjGofKXBYyUdzSTO
         KUwV/oG3sOgF5x7jHDH9fYpCBwqUwp4noNyFG0L7HdbRcehudL3HGxkVNzZcALmvHD8h
         abkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332031; x=1750936831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/7Q/trZ5SbmALMt3c06DmQkKxihbiVngkXZ1QJXJs8=;
        b=QAJkhChW5TDAnXq9nAKKxqeWw7DfXytcCpWWv7wSVfdms8SOkFBUutgnz2jpvBKU4I
         ocORLpxF5E+6oBWejB/khLodtd6ni9NE+mXUz3Z87XuB4D7KjBzEbgr4RtXsGO92GDut
         xovit/A6iT33JvLyN+V5nrpznSd9av2vQmpPqLcU7fRhuV5tkdNGVsS9xXn48e5JFJT1
         RfzZkHHILLQ9P3ObL8xOiQ8MrOQXrhGO2d7SUZOWdjZu2EnxDQuVmfdYzqJlLP6ncrqq
         VqO8z1jxvahi8r2Fzc3lihwwR/WACJz4fgvdFcz7AecFriC5BTi7FzUmQ2x4kxqBUsKl
         ffXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHeYt/BpZ+3Qx9Ygb3JbEAy0DizpNzVgqTbOKiPZGxSZhoxMaKwduUIWV8Kn1OWOkmTx8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMEjAFZj/JMohUpo6++8yacje6udVjCIuNrbdNBN5ZYc6pGexa
	XBjf5Va6gEV1RHYE0ZZoL6tca08v15o+UvZISOqUqrWQS70SJsE5+FvOtIJq/gFeOXATVI7lUIS
	rFAXRsyctNGQ+rUXo6MyfegT1Bt+zShMAOT6P8jNWkQ==
X-Gm-Gg: ASbGncsT1+bmraaFgkAQz60ptCvT1bCqPJuWmPKsANigHWVTG2cCdy7cuNfm23cLAjq
	Csgns8SYgt/iEg+nsCa6qeEVvGQMBD27Zg6+AAsuAmrLSU/R0RDnGRWoOv/b0y41o1F0VDb7kLX
	6wUoB4FUDTNK+5y/c8p+yocveSCTgZxnLhya3pM2nphHM0
X-Google-Smtp-Source: AGHT+IGY/qzZki/fMsjjuqz3QT3bNQU2e2XUVD7CMMeyaBLxvbqSsIzzLZ3yi5RD+SHlUmmOxvGIAhjFnpWIBIUm4EQ=
X-Received: by 2002:a05:6902:2189:b0:e82:b91:a7d7 with SMTP id
 3f1490d57ef6-e822ac8e43cmr26709534276.29.1750332030811; Thu, 19 Jun 2025
 04:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250603152245.1068740-1-Frank.Li@nxp.com>
In-Reply-To: <20250603152245.1068740-1-Frank.Li@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:19:54 +0200
X-Gm-Features: AX0GCFt2y5yccN4trdKSkYckbzJZTNRqp_GOOavsdhs8BlNDoJbkpBlOUHNguuE
Message-ID: <CAPDyKFo1dAkvvrO_xb3fk8pguTspB2OWxcA-zdN+Z1yOkbt4ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: mmc: mxs-mmc: change ref to
 mmc-controller-common.yaml from mmc-controller.yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, wahrenst@gmx.net
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Jun 2025 at 17:23, Frank Li <Frank.Li@nxp.com> wrote:
>
> Change ref to mmc-controller-common.yaml from mmc-controller.yaml because
> imx23/imx28 use dual mode controller (spi and mmc). So default dts node
> name use spi instead of mmc. The legacy reason, it use difference
> compatible string to distringuish work mode (spi / mmc).
>
> Fix below CHECK_DTB warnings:
> arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dtb: spi@80010000 (fsl,imx23-mmc): $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
>
> Additional add clocks property.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> change in v3
> - add clocks in example to fix dt_binding_check warnings/errors.
>
> change in v2
> - add clocks to required
> - fix typo legancy in commit message
> ---
>  Documentation/devicetree/bindings/mmc/mxs-mmc.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml b/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
> index 32e512a68ed61..df07ea3b81d15 100644
> --- a/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
> @@ -17,7 +17,7 @@ description: |
>    and the properties used by the mxsmmc driver.
>
>  allOf:
> -  - $ref: mmc-controller.yaml
> +  - $ref: mmc-controller-common.yaml#
>
>  properties:
>    compatible:
> @@ -31,6 +31,9 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  clocks:
> +    maxItems: 1
> +
>    dmas:
>      maxItems: 1
>
> @@ -41,6 +44,7 @@ required:
>    - compatible
>    - reg
>    - interrupts
> +  - clocks
>    - dmas
>    - dma-names
>
> @@ -52,6 +56,7 @@ examples:
>          compatible = "fsl,imx28-mmc";
>          reg = <0x80010000 2000>;
>          interrupts = <96>;
> +        clocks = <&clks 46>;
>          dmas = <&dma_apbh 0>;
>          dma-names = "rx-tx";
>          bus-width = <8>;
> --
> 2.34.1
>
