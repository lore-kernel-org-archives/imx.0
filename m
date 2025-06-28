Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820B191F91
	for <imx@lists.linux.dev>; Sat, 28 Jun 2025 00:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751072374; cv=none; b=KWRNg3Ev3K7YatoNSQH00pW6z5pMtxIpWpwUeXAqwGy9Y/xSz5h9U/RKqMkAHg1T2Oey7yKFxHVF5U0OdgHdOV71eg/I6cy/YApfAFDgAREDra9mAuC7Grds9gqvJy1jWSO3GJOyWSbaTmxgttFGWmZDzPuLvSJqmyrrrI6M/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751072374; c=relaxed/simple;
	bh=HpWrrf8Gn6Gyqh+K+uViIYoXI0Q2VMcjD3NgY74uW08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMIO9T9f8h3MChGqvwzt8UoGzeEOqM4UoPkeMhe0wEpHXJxBPDmmgBcol6s88m1HsFFc+4wTvi1HJgsVkLtiNM0gfwi5cBP6oYXlVRDkj9uLhJ1iGgABXtI6tXmjiU0/BXUO1UXDxYRl7gX3CS04wlSY0lZHXzh28X4C+eo2R+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1+KBbW7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1+KBbW7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234bfe37cccso30190325ad.0
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 17:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751072373; x=1751677173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UAiWn8Pi1tnpIPR4P9XJoko/ztItX7ideDEdvEYdzk=;
        b=G1+KBbW7WQsEArpLPWwZ1Ez1n3+4g0OvytB+7swxaaY83zrMuMSjB9/hb4INbFIAzD
         ob52wVhdKtgKCRfiUsCvIxSc/BtuFuV9SWxqUCExJOT1/hCx2zeiuzlrjj6hClRs70sk
         NLIrCaYqXw/3b41czBjyK8ZqaBjV86RcyTq0fQVIirzY9/JMmuNcbeeVmdW1VVWWed1V
         kQwmlrIdyHx4ILnYP+75qy61me9gJYH8EUKXt/Px/hSrEDLqxUrR+w6xa4A2utb20K0H
         13QcQ7FVK1b/M+jOAEvxHrBERxt3d2Dnxs+evpiqHaw62WdtaOLHyNGpu5NCosId3JL/
         sXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751072373; x=1751677173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UAiWn8Pi1tnpIPR4P9XJoko/ztItX7ideDEdvEYdzk=;
        b=gwFJ+fNq43FtIgf2l/EckNLNAx/lbcVzI3//A13w4Ri/9BbkdnzQlLTQhJLvgMUNh/
         WplfX81pmJZN0pFXhZ3JUvBeEJzxFZ0wo0Wrb2oZnQv83pQ6cwvt/4F4seOUU8aNWMgD
         8uFIUArlCMiX4Y7acIhrRaWSsMrXWeWSFL4n4nDFLT6vtqGU/hljB1npxN0IFCP7EOnc
         T1h3MXrnnXn6a3Zkg4qyJ2J1fQJ5FCm3JYZQLwtPll5901cWQs7OqY+XiNHV/SlGWPId
         /mZmuonTWKubM/R/IfDDeW5QZlhpu+RmAqAUn1rTQe4p7LVWuwjMUFxs/BlnPsXxe47s
         Tdnw==
X-Forwarded-Encrypted: i=1; AJvYcCW2ahsPvdObGsHwLWkh9Fo9VTk7GgTNc8doe2L+wYC+KYXjB752mJuSIbYGmiHISyQSPMU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDycxa/eODbWzgWTu6lt6Mmxe1+M7kXf2YN1EI0lYeXefZTo2v
	ZuPoX9v59exr9rPzp1R0A1H8btUjzBgOND2asRPAh5/B18HFV/pHCA48
X-Gm-Gg: ASbGncseHQsgZut10kWLtb8hlQpuoWrCqWi8ChNMY0LSScS9MqAETq1tswa7rtcLsI/
	JPbwEi9y96Mf5wX5BY7M4BqCQ1eX3AekRyukQl8Zv2dBCUsDc7aaaOG3CKU7GWBXuc2LpsI8+Hp
	TPOGmruwrzp5GOv8EDKozvwr8IsN3Bggz8vQx2UAeGqvx2XBL8cKC4VSVB3CKt2Xk7aZSt00i0P
	epqfFkXyDBWJUuS/++SH4/tvv4x2RqK3aPmKgruiwO5mwhukwEHH0JK6hbd3wU0dxzgO3QRv/Tf
	tCqTryQWYXq7PS6HoJz8GkjAuIOLQ26bm7Nk2JQOpGHAfxxR63lj6DiM8/DNFg==
X-Google-Smtp-Source: AGHT+IER8/+9/mIH4JWCr3PocAX0QsvyiFc1zROda2UNkXjcMckY1zi+itiyjtz9p4IRpOfqlqJ/JA==
X-Received: by 2002:a17:903:32c8:b0:235:2e0:aa9 with SMTP id d9443c01a7336-23ac45d5f4amr79376735ad.14.1751072372489;
        Fri, 27 Jun 2025 17:59:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e39f7sm25732775ad.49.2025.06.27.17.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:59:32 -0700 (PDT)
Date: Fri, 27 Jun 2025 17:59:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
Message-ID: <fw5kqv74vubn5wiarcq767v3aalxnoc7qosg3ao6gchijp7d5w@37vkon4mmnwh>
References: <20250625163431.2543597-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625163431.2543597-1-Frank.Li@nxp.com>

On Wed, Jun 25, 2025 at 12:34:28PM -0400, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
