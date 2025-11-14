Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F52D4B57
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104099; cv=none; b=LuehzDQewgK5K3r6LBLSYx+dqt9XPXE42aHrvIbS1Bs7x3Hyo58sU26Q7EiHWG2BO47jsW5ZRuxOkXy39IaAp2wMTl4zRtT1+P5CQJu0bUxhnJdr4zN/VyFk4cqvVZGgVgZqEVqXA7iOIbsCzTCfJKvrEmMiwpkzS1a/5b50r7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104099; c=relaxed/simple;
	bh=gRfgO6qz0M6c6jz9+gfX5Kpkygfd3gv/zQPSf6MTBNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNM/DrXrr6Y0Desnl7IhEdko/YGur+bSnu5QOF6t7nlW0M8XTFJHVVqklegqrZqM6WOgO3/4KllGhkw4tyT2WcSlqDKrzbCBwxUbzmXNtw03N33I+YbU3IqG82yfPnSa7qe9vCZM2c6NT9KpUK0hxnb4d4Gu1axga4x3Xyji/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmAXL8Hd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmAXL8Hd"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso226027b3a.0
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 23:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763104098; x=1763708898; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qf7oM2oFrPrqeIGW9RDJgG5aPYxrWcvRZEha2f7Gb2E=;
        b=LmAXL8HduaecOVx+oeqPlyejxuMSh8imvCEhPhxwryvqEPMn2KKi4uQGs7C/VzAdt/
         YQ+RqTlk4DM/XRbt2r5HQmkCqDr2OHEVUaYNVV2disbiEb0bbTRk68tqYO2grpJg1ypc
         0CIes3Ht+DrqMeX3WQbMdjQgN5TI6kPkFr76YeKSPqADykdQnsQxN5+OoC4NMMWI19ld
         JETOcjnWBkDL94A/5/OgVUeGc6PqX56HGRQfIKey8yDbQOJ3u87owx/+bC22uHzw2AWZ
         UjSVfHGDrBDotwmV9AbyBFlVcsUh5jmOvrbchnhey7HX8eMZA1L7WkhHq7HBJ1Mg8GMu
         406w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104098; x=1763708898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf7oM2oFrPrqeIGW9RDJgG5aPYxrWcvRZEha2f7Gb2E=;
        b=l5hPEhdY53kciNcCuQyF+eSthWlq1l4sBwEd+c/UkgljDmOe/C6XTg4UIdhSQLcxLq
         LV6OXvRHIoX9Vz999YxEWnF9Gac1VjfIp37J4U9sE4ez8pVZHicbAydkh4WP8rXncbby
         H57XLZsIwbKmcP08rgRKYHibnydleqOkpr+LM+JbahzheHPn1Fmnbmtmn9cyKp5k8bGk
         3nctJdxVnfNR3/eVu5UMksBu3r2Y6MWl6/yKcapcGcknxomPIvH5uY34di2G0xCQ5CeY
         k6w62vIS+5E/3sGBA4KpN8wKGE9c717+gd7xxx3DiSjeQmx1v2qpDWjy0sCmrlqr3W+Q
         gGRg==
X-Forwarded-Encrypted: i=1; AJvYcCW5PEUZP2acDPsjpFZOrfq2kaq6a91GEqE1ftjqUT0seM35OEIFGUQjqVsazcfqk+0TGtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf9j/V9jnSLLI2BzLmPRGO/hWXH/3391I28POnJKdq1QiGrcBw
	dTj4sP1QCSSahJp+RmukDawHVIH1WroqoE/qxXfQjFJxGvLEOTUcd/OIej08W+aIXbLzyiRI0zY
	JoTNZBxwUJxOs8o8qMeM1c3oMtUPryDY=
X-Gm-Gg: ASbGncsTiBP/+zlrFGzE9rvzGC200T7nDBNx5GNOxwYj50HWevedVRTnicOsrdS7Ur7
	w9EwHk8Gt9dSUBX6KcoWQNf97rB5oir59ki2GB6DKoS9OVJnDrf5cN7x7pvcaIT4aYkPNdi4dES
	3Ki0Hs+iuUg5y1gE5mB9F0AKlwRhtcx+wISgQLlgT3mzHf3qT3L84eV5WNugmJsf7lozTAY2Dyy
	TQkn4HYEmtCa/ZwZEBnJzwSmUYvcd2t6XXxaNCnQlyWXlo5rcHXtfP4lw==
X-Google-Smtp-Source: AGHT+IGsymkdPfMwkbwCyj1YqTZ8hznop11+TfoGs9/58g0chCF5CQB3ik/rPsfU2yzT2kReqKKIsszp14r6geGb8DM=
X-Received: by 2002:a05:7022:43a6:b0:11b:1cae:a0fa with SMTP id
 a92af1059eb24-11b40b29828mr900544c88.0.1763104097709; Thu, 13 Nov 2025
 23:08:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com> <20251114-imx91_frdm-v1-2-e5763bdf9336@nxp.com>
In-Reply-To: <20251114-imx91_frdm-v1-2-e5763bdf9336@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 14 Nov 2025 09:10:40 +0200
X-Gm-Features: AWmQ_bk03ec5WXYu6zBfKnpCmf74S7CEbVFh4TSdNIITolMj2aLH-CXkG7tZ5Lc
Message-ID: <CAEnQRZB5O+UTZ+nW21KuhBmvS2zQ7wbYS00xHhK-dshAOi5djw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: imx Add FRDM-IMX91 board
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Justin Jiang <justin.jiang@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joseph,

Thanks for your patch.

<snip>

>                - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
> +              - fsl,frdm-imx91            # FRDM i.MX91 Development Board
>            - const: fsl,imx91

Community pattern of creating compatibles is fsl,imx91-frdm.

Even we have some internal expectations we need to adhere to community
practices.

Daniel.
