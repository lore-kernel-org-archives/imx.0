Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D53433BB
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724698759; cv=none; b=eLqS1EdZrUgsfX4L3sN+jL+qgXsn3K2nXltWFLlHU3vLw/indgFvAf6VwHB/oQcJL9li4PllpBs83SKIVa4yTHH/P8xftpb8p0+Iw64DGa8UJaiSgrUCiW3zaZXQO2KFaKdnKiQt7YxU1QzldGxg7GiuvZnrwi+esNarY2IeSE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724698759; c=relaxed/simple;
	bh=w7ZLaOAld6ib7gFTbrW20kE/JRnuNVjh2y85WKNfY/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMxHnvrQVKq2fhz6fOl8XTuE3ShJWn8xdIxz8RmwFTHV5YcKxNeeTtMf5cSbmZPPpHGT8b2A6vt5D5Fq/bVe4l9oR4MnqgnfnHu4NlDHq/QEN7iIi59EntQA5XUi9GfsRsDeSZhLFVlgTvBGxL8DwOzvtME0cGyayVJshka7gT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKVJR+eo; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKVJR+eo"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3dacaccfaso3115457a91.0
        for <imx@lists.linux.dev>; Mon, 26 Aug 2024 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724698757; x=1725303557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HdmEVyDQG17ChPOr907PVEIjJwdh8VBtXFzrwwwINI=;
        b=bKVJR+eo5A3c3D9ioei1i49rZ77PDVoRpFJzGrsg14O+nMeyUQ16OdMp6oqBhJzkIN
         14kG/yGsaATcGCvtcL2CEPqKjxIH4sjLBeOr2kLjrAOUvDb3mM+lHzI42MEZ03O3gKwF
         KldWFY4soeYxyfPPhhwCoiIrlkUERr0LHcCNAojKFDGLkK5VvT697nAUbv3BI0LrTWqt
         iGVb16CAwv6uuauuN2k8LkhbLQ6wQgV/i/eyB68ymKlDh5fWUXNQcpbVj94X46s4jzPW
         IG1t2Sf9VAkXuXKmud0jKmmkUF9OsgtJxi1ce952eZryJSi7/04LpIW6bM0yVvzKPAVV
         ro+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724698757; x=1725303557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HdmEVyDQG17ChPOr907PVEIjJwdh8VBtXFzrwwwINI=;
        b=q8+4is0jCQougZtF1IzNDDLH2cy5uVwhpGQKx8vtCJIgizs8kpXJ+ux1a142H0231v
         hdH6bqWdmedcSjJqbaNpPRbS9XSm5yQWpHfCrjKlA5tzeTJSkywJhFikfFKjQbOEMsxG
         qdrUo31yFyHkwvjF4PKkTUW2FSxCwd+R3GO/N1thdKkx/vHVdgLNCP7yGrfwdg5BiI2i
         lxg3ANrGLp1V+TkfmfwNEPKDoX/p1sDITs5p87DHc7FgYuMhRbHXxZeMGRODal/CVbbm
         4xLLg39IxkV1eOu9ApJJyW0pwdPz73ofjSwCe61caqoY0iAD5ILz0EPCmYfQRTKHUc9V
         vf6g==
X-Forwarded-Encrypted: i=1; AJvYcCVIsmbnzmFYWJXg6sUM66xx4LL1geRSw0b1n57OggBmshmtZ/XpIWDpaZVmBK9v0ARq1Vw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0vKC+cvMhNMaApOexLAHFI5APwhnOY+wdRyE5DfQ0XHT4exVT
	aD8DIRxWjaYp/7dNc/+gnCN9Ixn2woL3DQ6mQxfrjE6ZpLY/C62h
X-Google-Smtp-Source: AGHT+IH4eyWQA7Wky0LcgP1yStfTpd8Lefa2NZ/4FLxN76r8oGy07r3B58P2jmnq0vMUfNrZtVnRvg==
X-Received: by 2002:a17:90a:f2d7:b0:2ca:f39c:8d76 with SMTP id 98e67ed59e1d1-2d646d56c17mr10278825a91.39.1724698756732;
        Mon, 26 Aug 2024 11:59:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fce4:8959:e48d:980c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6136fcdf4sm10171694a91.1.2024.08.26.11.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 11:59:16 -0700 (PDT)
Date: Mon, 26 Aug 2024 11:59:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v6 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml
Message-ID: <ZszQgR6CLu0F3voc@google.com>
References: <20240826162302.960732-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826162302.960732-1-Frank.Li@nxp.com>

On Mon, Aug 26, 2024 at 12:22:56PM -0400, Frank Li wrote:
> Convert binding doc ads7846.txt to yaml format.
> Additional change:
> - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> - use common node name touchscreen.
> - sort ti properties alphabetically.
> - sort common properties alphabetically.
> - sort compatible string alphabetically.
> - remove vcc-supply from required list.
> - deprecated ti,x-min, ti,y-min
> 
> Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> 	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
