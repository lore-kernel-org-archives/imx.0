Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880F3B8D53
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028679; cv=pass; b=PbwCnKRm/DIUZjIyVhZo0m2LpbtD2jQALCQFnyh9cPh+VPRO+tak96gAM0B9jJW+qTTiBfS9WVMeFGi8+nSKg23+Ay7AqHf1OyK4OYwQhvNT/Z5tvuWhekESgsOszzmSRMZnojNyE21UWzsTmHz0hQ1X7jP6Br6jAwnSgaqPu8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028679; c=relaxed/simple;
	bh=2SvE1O/725PaxO+/90i2OQ4t8qF/9TIMdRbXJPJvpkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAieIvjs2aGSwoQpiBbYCk2rIX/4TeSM+/Qa3aJCW065cuybJyCYUF3Mzv4qFCQCJqiPGfcXT8xfaTcEH9AgXoap8XuS7mEE+lhvvjw8VqUPTrHHk0Ufa1FCBnyrdDRBPAAlM6HHRyInvS6y8FJl3NORGzhMzxWYH2QV8VXfuW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgePtwSa; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgePtwSa"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65c20dc9577so12428839a12.2
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 06:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772028676; cv=none;
        d=google.com; s=arc-20240605;
        b=EaOJdHmB53M4hivDxHOEVhPy59a1h35fSTqFy4iBF+pikFPzCiC35RACEbQuNGW9cN
         MeizkLmUjvepH1uzNnZn9/JQGTWCLImQtjWeuEelHa07211Q+1CNe77CaCdmjJdj+9A6
         q3Ti9HpIMC9hJ9fKhh7NAiWFGKZ14DPVBqvCO2PFk4h1HPDZdmRzSk143wxI+IwdbJWx
         jptdsNrDlvIcrjSGo+Jc7oXFYfiQfF0mjD/8NggqBUB09MObjdKNqiSEFku+0F3wM35s
         mOdz33z6vl6lQmSF+HslWjb8gLx9QgsD36f6kR1ZcYgsFtLst0kTF4pFHZtbd/Dbzwyo
         ItBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L9jg3LVlUdrt/5saKoO+nhMQWQOQ3FaMpJSoPoujSvM=;
        fh=bKntSQXEwHnLDnt9Qt/heoBQ7b2iGFuIQzAdoqPKL8U=;
        b=exdL4UMm32JV8viR2nV1QdjLz59DVpJ0Hghv3pZ7exFw5wmWtEc6y/jYMV3YSRlgou
         sLUgVIiMEui9q2dbo8KxAu9C1RMDWal5qeLc/mDak2ExILSuICdlWY9F8ZI1nKxt2brF
         27+yCxuauJoBeI6fXdvbWYaS8x98crK2MlNYwj987KRNY0f20cjvjN/uQAviMZyYu92c
         AhNep7WSpxFLkAoxuXj5yX1nUsZ/WstARB1XJsV4mM6Nm4SMqaOC7moz6R5aDUKDyuCw
         P8n2++NhWdbIBCm3wViVOjN6sBK5thI2edBjwQP38JrOwyHZBSZuDfKZYD9z4oqVv1L3
         Yl2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772028676; x=1772633476; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L9jg3LVlUdrt/5saKoO+nhMQWQOQ3FaMpJSoPoujSvM=;
        b=RgePtwSaPIiSMf5Kr/U0H8pE/EJptIF9NC5AAm+2Gcxizm8lOlnTCH06MQLrS6FmGN
         VdE7WF8vzzYNdtM7ahJipmLJLS425i6rCB6RJMRHUSmSUZiC3n4qBcXJA+VzKvFc82Tp
         qxJ03AkS8ZXMEhBEgqi6CXTg6ZLCQj2RU6vUxW8sEITtij8R16vS6Chpe0fjG3pr6Jch
         vXKXHbrKZz9QV4aC1qABt0YgwwhaAvf9dW9Id9LSWPV/ro0dsgyLE+x31WeDkYafykIL
         9/lPSVUJ46+uN3Ir3o/QEoj/XQZY4TRkiXUvgBOPrFbJZS4VhJ3tqrqG7J87888gBvwZ
         Msag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028676; x=1772633476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9jg3LVlUdrt/5saKoO+nhMQWQOQ3FaMpJSoPoujSvM=;
        b=li1I/l1rv/43mdp+53DKr784zQLIIyWsortIbXnwcBaf0YUHj5ZznPPkUb5JToIXf/
         y/N/QpQki5f3nwj1dBjXrugj4RM8mIA3CqTvpVTE++KXaYGP/OcVI2BkTiDQUv9GV2qR
         gjSq9vlepnBBFLPDMdQ8DeblBRO0dyTZ0bmPOQjhT3NqGPcE870Ch62kUdfqy2gaSMDR
         Z7AEmTUJB3DDXeupzNaJ/TEgNnjQTZBvmqTmEFX4xgmDzkkY0HgT75uN4ftECmTqFcne
         Zan0qokexBAmTsS2ZrIhz+gxIxrfGOGw4ey6Xelj8nFun0KZbq5ZW5u9Inu7cPAMG8A4
         46gw==
X-Forwarded-Encrypted: i=1; AJvYcCXNaoQBZuHhKJtvcOqTPOEJyV+fipJIsLSbiAqBgklbzoej3b5HMtOhBfdaPtkci67O7Js=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjyG0WawyT3HOjx6mD2Qps+OKfEHZkgObxap8Duojvpr+pSwUB
	KrHUSud/StR9yHCvO6gRvFCFGbrgTNpmMy65/jZ6yyOgqk0N+O1c6sbfifhyqAZ2RfAE5JkbaEM
	aK0aJOLGkVSP4zFBVmhfFWCbee/WhCs8=
X-Gm-Gg: ATEYQzydvNVjSuLTmUOo96KUef+Bu3K951sZs9Eb64358woKPN7veb1GfZo/o7dDIjf
	U8y7hDsGbPYHYF5kl01w/DSJcXX7b6fWKd32Do43m7PC6IGqaIgiJXXzspinLKzJbh+QbAvMTFo
	IBTxUOYy82M3Q7LOeN5O1I7d1SKOsJyyvZC7GsBjUfo6EzLe84Mr4g+cXIudshTLuRz0DPQnd9a
	Wqqf9z2x0PdObL7P+cYw/doUvBNQRSwsCBPAr2tYigTdYigv7CtUF8Oy6rLs1P7xKXAqCey4rDP
	4i64VEE=
X-Received: by 2002:a17:907:1b1c:b0:b8e:d260:cb20 with SMTP id
 a640c23a62f3a-b9081a09c97mr1077231966b.18.1772028675957; Wed, 25 Feb 2026
 06:11:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129022910.3942028-1-onlywig@gmail.com> <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89> <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
 <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810>
In-Reply-To: <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810>
From: Wig Cheng <onlywig@gmail.com>
Date: Wed, 25 Feb 2026 22:11:02 +0800
X-Gm-Features: AaiRm503W-bxJ6qYfmScp36dL07me8fXiI8oeeybDFZb9ZdLCMZhOZ9palVel14
Message-ID: <CAPStFe6sFCo2-+9ataPBy9pvEUo_uZ5G7XNA_8jH+sF6=FNOpw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, shawnguo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"

>
> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: display@0 (mayqueen,pixpaper): spi-max-frequency: 5000000 is greater than the maximum of 1000000
>         from schema $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml
>
> Does 1000000 work for spi-max-frequency? or need update binding doc?
>

Both 1MHz and 5MHz work on i.MX93. I chose 5MHz for better refresh
performance, which is within the LPSPI3 controller's capabilities.
The 1MHz limit in the binding is a conservative generic value I think.

Thanks,
Wig
