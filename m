Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFA736B058
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762877439; cv=none; b=b/taQnKovDnXLva/SRRkM3DLgRgjrExemkdlMEbpPq2z79TwY7HCFHjvLzydaWCInofqMfHGuuabVu/tEU6p2pXA7oT6Lzoef4CiJtQbr35Q4B+I4MztEHRBFRGhXurNa4g54JQvyyykkMQX35pvdOg8SN1wO13m54dlNgPBzOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762877439; c=relaxed/simple;
	bh=InVSf2VLeK6C3DaC3wVIKtW20lKJD3AjozSf8c1nhDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BL3WbQU6iJQLoqNmC5tfAkipQCV8XUDQgkkuS1M9vwZ0GQL2o/m4MJSRJ5X+VWIVThXjY9MHT3x2wZiA8x2G0UEd/GTiUWFmafusPuqpIfmm5tRKbq/QBMZhu5kkpo2JWDLpqxlQbiPSAgrOxkz1dmpPlR5jEEhTLv9UBQZinU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A1H2wrWH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A1H2wrWH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso22338255e9.1
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762877436; x=1763482236; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoJADF8RVNix0LYicXeY00wntRyKPKYW1PP4cuBTQ0E=;
        b=A1H2wrWHGKv4EljasPGcDeN5utmBJ6ZA3mHuYZ583D6yKd66kvhbwDXCRHEBH/ZUOL
         clEjRZKef9Rj7GNwdrZxN3D9H6YXUnONO5f3Lhxkq9e583M17368sMIAEt3yqZYURcXi
         VK76WKye0z86MBq9lTIAOYGOyng3Dd2vxE6mX3OLcgG7iRJVha9gSPREk+ZsANsiJV3/
         SXmeLiRU/jIECV/2P7jCXAX+qpRcjgd7q56NUvTEsJ2KVl1t/tmwjrpmh7UuN/11nm3U
         P3D2a+dSTq2yM2ADqX3DHurOszLtY/BdNq/U/GT6p0S6PSsjbz92q2V5kMlrzggZxsC3
         zvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762877436; x=1763482236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoJADF8RVNix0LYicXeY00wntRyKPKYW1PP4cuBTQ0E=;
        b=LMjfFFcdA5U9//NxgmrI9eyPZhRvhCOpCCoq4z4SXYdO2uLXXhqQlrXshfvELMJaqa
         qZa1VfXlLTOz2x5mM4Nz/E3Xrgr/E8rnTerwZUSKcUOzZH5XZDedZEI2y1SSk5G8LHBu
         +1rat/BnBl0Y9e8S0qCEYtk955IsXpRvJ2CBBybYU6QEMY1jGqmD1SqqaQjqngXtPtP8
         DcRUTAXlXtfMFTzyodv3FsVxt2y7674BqDi05/WDTMEhQ2WeQDWs9MBY9NgyAChfzKIp
         7KAyw1APcYAQqCdY8JFGUDIzdz5VPcvxVtLnlipo+gtHo8OBCmHIVrp0X6WZATyR5ChP
         fkBA==
X-Forwarded-Encrypted: i=1; AJvYcCV0BpiLwX50GyYSMxjm+6+/6H+MTy0TnLBSsNex0jiBv9S3VHCIkS7I9S1iP4qjobCq0nw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPQWm8c0cW0pklhVJozoskRBJHwEN73BMJi89Qs4kj9PfD7FLQ
	BHsLB7OJPlyJva3+A96Elsg7IRfwm4sRS2x6uprQnodfgWP4ULboq+QFnhSeNCMjJEA=
X-Gm-Gg: ASbGncvgbB1o5USKoAr/tvDi0e5LWZy4nWfhJWAc5V02QtVXLtatHsVf79dxzjXpA9J
	3YORtIZhgQJP1h8B9bqNSJJqmdwXg/l3uqAxm95VLy20xoY/uNhtV70rxlyGtohA7SO6MeXz6oZ
	YuY4Z0u/VAn8avB7yT1mUW+O5rcxRsD64HbNIf0XYMolOaCiQaw9J6N+ngnO6ccKXw5Q8jaT6cz
	ZSLUnemcQZyUSNDNvaNciztrTRCW42rnEDwl0G3TiMSPhAEqWy0ylEJdwHrT+EstPG+kxLzeg06
	v4FRD3MTqlw1/iFZzQjVmYyZPUvOcO9vrg9IxTMD3xj1pKS41LgaTrGHA1GB87/UnlmsiNDwCW3
	vDyaTkYkuzrTUVr7K1KASQt4dnhi36/dP60q2RJl+LgBYObJpuuh+KutfdO5QAZ+qcyjVfaViML
	2SkcxLVdo=
X-Google-Smtp-Source: AGHT+IGf3h4aOkXPIFGmt6Elh6BLQ2gmD9PXDCWL3w2nhAYHGTWFyL3xlC5Ggf4g6An8feZ4EFRkWg==
X-Received: by 2002:a05:600c:1d1d:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47773236fb7mr110096475e9.5.1762877436034;
        Tue, 11 Nov 2025 08:10:36 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc528sm390576215e9.7.2025.11.11.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:10:35 -0800 (PST)
Date: Tue, 11 Nov 2025 18:10:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4 0/8] Add support for i.MX8ULP's SIM LPAV
Message-ID: <rqtqzjjn35pibh42holg7ld6pjkjdyf4taljycu3zw32cr6inr@b7xck2bicm7s>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
 <176287713958.95002.12532568280694164920.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176287713958.95002.12532568280694164920.b4-ty@linaro.org>

On 25-11-11 18:05:39, Abel Vesa wrote:
> 
> On Tue, 04 Nov 2025 04:02:53 -0800, Laurentiu Mihalcea wrote:
> > The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> > LPAV subsystem, which offers clock gating, reset line
> > assertion/de-assertion, and various other misc. options.
> > 
> > This series adds support for the IP by introducing a new clock HW provider
> > driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> > allow it to be used for i.MX8ULP's SIM LPAV as well.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/8] dt-bindings: clock: document 8ULP's SIM LPAV
>       commit: 3b521bf8c51246466e2c337f1f2b60acfdfe82d6
> [3/8] clk: imx: add driver for imx8ulp's sim lpav
>       commit: fdc1dc7dd53b95805d3943ed36785c1ec812915e

I only applied the two ones above. None of the rest.

Sorry for the mess-up.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
