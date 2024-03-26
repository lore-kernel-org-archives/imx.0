Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D93012DDA4
	for <imx@lists.linux.dev>; Tue, 26 Mar 2024 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711437170; cv=none; b=M4IzrAbX4DkfZ4RHAC4d/MBkiR0rnxSX4esJ4pfeD6KVX75tLs2d6auN0cTh6DkGXpIPjggm8vFvRrSs8oiESjdVUzfTh6+1/ZIoxegTIDhPiyzoI8+5v1igJbTfGpPgSbIYUEaFyRGa5IicV/a+CbTNXMvClVuCb4de4VspUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711437170; c=relaxed/simple;
	bh=+DUjQtgmtHLmhR3CCrYX6BaVXKE2KAMRs58wiYJfuCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyizH5SP/8bBKHoTiBbwUOLvrL8kfpVAm7bcZ3sAxKhhoO0dEGVkgnqgFUUpsggoD05UnIfTKQtmjaXCXYlWrGVJl37gbeoGk9/Zjk1TtFfumtGwEKrpbLKBQBEZBfU2QGDdd97zHAOEMYr63YJeGCVbB4nt/i+ztGVLAn7yRhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mUtmvba8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mUtmvba8"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c2787aff5so599387a12.3
        for <imx@lists.linux.dev>; Tue, 26 Mar 2024 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711437167; x=1712041967; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzceid5SahoZKiYm83GmPygJABOhx89XFj2L00RttnM=;
        b=mUtmvba8wEaIbKmlim/xtB+dXwgqG8VxF1K1b2LPQbytIYM9YxJimW4rqNvoEOw2Ec
         2HveOXc+bfRBnKpXGoSTBw+V2sGPWYisidYiqwIzSMXQATs7nK2YWM6+txXoYf6X/e8G
         swuCHwoDLGWQImJBinoptklHqtDEcok7lTwyAC1i5bbK30sWo/LWS8rzYhxYZcJdJzLa
         1gc3hLwbqhV7Nj0PnX0tcQgdcnrn3m3A82s0d0D56CNWCcWjkuGYv9DzKfaP/r65Tlk/
         /g3o4+X8kMHdHMfn5Pv5rHgvrgoTlZeLiptzc1ErIlDAf3aYaLc5z21AeKqyw8ctjLmT
         YT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711437167; x=1712041967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzceid5SahoZKiYm83GmPygJABOhx89XFj2L00RttnM=;
        b=QHzOj26zDVJHgXGstON1q9C/rIEZ00tYT5L3FpY53k23SFfmhp3lOolNzr5C54N8LV
         CXsoR713vl65zVVF7eLxkVmgLee9hniIyHBpYQMtd+16DOBBIkxWW7c3U4C1VaM27bfu
         yWk9j3GCNlDA6t8TSr848+C1qmYNuNpRC/b7bKBt4Po8gblRZcGLhWNE1494mnEKy2en
         pbIZQFRXER0X0hwOme00Ev7l5RWFFVHxBDottMWiNWFSGgt1jawCbymRLvjUtNMehVnI
         k8eB2LkBznoRj8BDBLIDClsFZBrwpK4Ocn3/7gJ4bn89qKApkmo3Te6UdJw9Os8mQT/T
         R/dw==
X-Forwarded-Encrypted: i=1; AJvYcCXRGjukJofB+fbDKpC5TTTgkA/EqM11+BIfk1tNsEk4yITOYt39xYK8BGwVfzH7w0qnRbbFwT4/y53v1SpB9gnnKkFh
X-Gm-Message-State: AOJu0YxvkjF8EOcA1YcN6y2fhQi6uGf4jegpXCgzUjtKCwWoUAOkE075
	KfBKU7I4YFRKzYpZViR9wS8vMjS+VFgmRGF0BBh1FhDUa6GGGwgDRQSPVs7uQ58=
X-Google-Smtp-Source: AGHT+IGCfP1VlPOhs1JH1lNw94K0+XmUVgrjArsJUXccfw+B3g/JMU3n+M7c7F4wd0cpBwQKnRtxHw==
X-Received: by 2002:a50:9ec1:0:b0:568:260b:e502 with SMTP id a59-20020a509ec1000000b00568260be502mr6401139edf.13.1711437167540;
        Tue, 26 Mar 2024 00:12:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id da12-20020a056402176c00b0056b816e253esm3836116edb.13.2024.03.26.00.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 00:12:47 -0700 (PDT)
Message-ID: <8fa53bf5-2467-4d21-9ac9-2824c79a0187@linaro.org>
Date: Tue, 26 Mar 2024 08:12:45 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: Add device tree source for the Au-Zone
 Maivin Starter Kit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Trevor Zaharichuk <trevor@au-zone.com>, Greg Lytle <greg@au-zone.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
 <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2024 21:32, Laurent Pinchart wrote:
> The Maivin board is an AI vision starter kit sold by Au-Zone
> Technologies, developed in collaboration with Toradex and Vision
> Components. It is based on a Toradex Verdin i.MX8MP SoM.
> 
> Add a device tree that covers the base set the peripherals found on the
> board:

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.
And drop redundant parts.
arm64: dts: imx8mp-maivin: Add Au-Zone Maivin Starter Kit board


Best regards,
Krzysztof

