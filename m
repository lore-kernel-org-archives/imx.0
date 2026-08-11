Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851703B1EC7
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433416; cv=none; b=YzQ8vFGK/IfEjPmBrKdPgufWh24GXPFcM4ZTm29d1b08TzV2b9+oSU422oeeWbv/LrXgHj2PKl0lSZ8U9NoKZ/PTyL1XomIEY2ZDDOr5fQ6m5gsDPqFg/7iyTE8fSFb9xmx7ffdXAVTp+DW874c4fmT8fbNq9To1iOG95zbXhXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433416; c=relaxed/simple;
	bh=y8WHpVw6+CCMHP4RqzFXXcm3T39z37n7bSX4Jxw/YXU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lM72uQydYDp6d+IxITWCx4+Ct75rAnahlF8Vfb7NhIUVVk6CQ3lDqHj4MkbNC7BD9Sj+Ry7bMQB9j7eWZO2SnTJJ20VL35irPP46Uw6lHUyYl+sp0kLY5b0YvSEO3GfRjaljnmJt0gAMgfJRklPjDmp91OVBa/+7rDIBNdqvRdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7G2kvTV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7G2kvTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B131F00A3A
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786433415;
	bh=y8WHpVw6+CCMHP4RqzFXXcm3T39z37n7bSX4Jxw/YXU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=P7G2kvTVjt9BAmJrnjupT4mms97ylHc8icBv05GVAzpUSpLJpOH1C7GdZ28teb/CP
	 tLkEGY0SEzEA3/zwnzusAQKJxRRBk3ldn9iORpeIF7908Pyjd2/jdMpm5/pbToefTC
	 azhqrrCJgTp5/wzPLyJJ0imRgL2tdlcDbTiZqcbvfzNytVaa6J5/zXmEWXl2iLErPD
	 5/By/hMA78dAnI0l2fRGOCq0m3rfEG+LexTHQkaVRngd1/XtqL8aGvkjjkWxQfj3xq
	 K7lGy4mcNUtV88D8/8nuwnNH+myv2wLuBdhF/TkyTkEWQlC80LLS51c5F381NmVZ9n
	 My3Cb6XCQhNtA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so16047791fa.3
        for <imx@lists.linux.dev>; Tue, 11 Aug 2026 00:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpKmX/i3W0LrihPaNe4ZunBiSZvmIOxeXsoBF3SEEq1tltc29EQBshQpf/1t8n8XvQUNS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVbGaVwPyQjBg3Os5v52cGFuB6spuuDdW82WrzFkn37XXz8u7B
	4UN+SA5i8kI3407+r9iysd6ifXIhEJnfoPOkbSnggafzaVTujLOIAGsbdTkyNFh1Vbc8ZRCTVww
	3g/SRD20n2v6YhmLXrUPjMogoH+Is6D0bKGJ4qMyBvw==
X-Received: by 2002:a05:651c:144c:b0:39b:374a:afb8 with SMTP id
 38308e7fff4ca-3a0f8a9bc43mr1705191fa.0.1786433414081; Tue, 11 Aug 2026
 00:30:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 07:30:12 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 07:30:12 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260810213456.1268831-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810213456.1268831-1-marex@nabladev.com> <20260810213456.1268831-2-marex@nabladev.com>
Date: Tue, 11 Aug 2026 07:30:12 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdjxSyqAxUmvqZPpSQGfFe2BZB98Wqn4D6NxPHo2PDo6A@mail.gmail.com>
X-Gm-Features: AUfX_mxorVfTOjx3cPX8jWYGtrfL5nLyxouAJBW0LD2vHOnfI6cP-TL7yif_Blw
Message-ID: <CAMRc=MdjxSyqAxUmvqZPpSQGfFe2BZB98Wqn4D6NxPHo2PDo6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mn: Expand EEPROM description on ifm
 VHIP4 EvalBoard
To: Marek Vasut <marex@nabladev.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Fedor Ross <fedor.ross@ifm.com>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Aug 2026 23:34:39 +0200, Marek Vasut <marex@nabladev.com> said:
> Describe the EEPROM write protect GPIOs and labels on VHIP4 EvalBoard.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
