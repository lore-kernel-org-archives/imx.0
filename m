Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8B220F5A
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966421; cv=none; b=Rs4OyeknTsspIENLnbfSHcdOT0/OtExpjlIO2TLUkls1SqjLiOPrSvyDNAubbRvVu6WVWKZBCVxgiHy51mhdwgpAoVyUUp58QFx6S9pL9Hoo95S1aN3kNtLARvADKb7jLshHB84QcRNikVGT4B11S5t8oMBcj64g9qeK3h+T4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966421; c=relaxed/simple;
	bh=tTnkj9/iMWnXfZ8wbeIpbX5DCcf2AwFFVw7LzOLB13I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lrysr2qi7lyhNHxIt47gGfucXF3BGkOpc07iUuuw9JBME6OGSrzfORWhnKHRJlRgw65PIUREh+U6lSf9ei8YCkmMTy74iPrjP88eOaPQwWGR2HIiSLq6owDdsVoR/+zuW2L20A+x9XA0At/WoJ1tZwgU1DUeX8oeUJUcrXGOyZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzdxhTjG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzdxhTjG"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0dad3a179so711802566b.1
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751966418; x=1752571218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qde20GPEW8GrZb6i2zWlEkGphLDMaxaujFgrrC5mKsw=;
        b=TzdxhTjGYwUwYWNjfLxO+ElgoEw+VjVEygYVsaMuF7aOUb/GIPRPuJq6XS90QGLvwk
         rP5glP5Q5lThh2TWZNihswHz0V5/p8dIvbOztkYY8Jxo/immPigl3yOV7ONcQvGUtUTH
         uxsfMa2O9WtndF4Pyc2j7PeSeMU3OsCQXA4QUU4MTy1dAzoEd0jS1phtGs1v8mec9+B4
         iT/G1hdLFHBLTFy72V+bdrrBCydKzuThfwLKq0whZqQAnNun2T4o3+Cd3oBNwyDF7KKC
         u6OsurlfChULPzRu3+hCjBHcNb8vTPwg/9InZ47wqFXnzhpOGswzR9mK4bIBNm3E6+5P
         1Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751966418; x=1752571218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qde20GPEW8GrZb6i2zWlEkGphLDMaxaujFgrrC5mKsw=;
        b=GLbSCM1qB1l9/ho3zGQAU1hOyuxq02oHUtDpIdaMYyZ7etIjFlCRiDFBIpzYHOJz3u
         dPTbpPgA1VftCmXEBCrX0CkjYzrrq0U+neXABLIvfHeKMjb8wTAIu0Z/7jlpAfJdKmrR
         Fxc3aXrBhfLsdGUSXfQyDicrjUWV7Wnv8LkHd5hW7DKFS/Mjm76o1rw4rUIzAgISF+Ya
         tAhS7Fxzf6voGSOpkQuuA6Ka1ir+4ZKkTrcIIxb0LP8YSTzH9+eUeMZ8Yj62LBt21Bxn
         333gVBEMi9svDQckpneRuB9rHeyuCl8sZuCwS77n6l/Q4IX740VsWR4S9znCPAb85Bjm
         2VoA==
X-Forwarded-Encrypted: i=1; AJvYcCXLo8XDXlZ9PARXaSLk4RdNjAj5aKBUDdrKT2NwJ3MMrb7u8GFIuWSCt/ClVWly9tfM7sM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg5eDTLuiXgLzFmU9Z1rkdCF11fTGFIG92T7/Yy2DZrASc4p9K
	lcYwWOxMm08iw08LAnVIXG8IFWWCIa/1ZWmU8z4f/ds71kitZVnNonWao6Sf9H4DJZI=
X-Gm-Gg: ASbGncsC/h/kDW+JtLrPv2h5c5FsITyE1ff3B31cpTC2lRGHADA60uOVs5IAGAmnOjL
	7Efe17vumr7N01iKOsaqrYet6GoH1ydhuzOZcR2Wgioq60LtLaKAwhjat/fcZJX6uszSVWOapdc
	J4x28JD4amu7J4rRfOlBq+X9wH37EVPkgfHQS4yJO+Uax71tN/Tqq62BcHOI0qzRTT27+ZM7uU4
	R4S1d6Ue0GiIsp/I8XxHx/pouimqu0CepJLTtUn6yt9ViLG2CqGWz64DYOpkmlx1pEOasC0TUy5
	CiIsINgQoR+uMrWiEalav5EjCeLqLG+QWL884Z0xOgzcRnJi33/RBkBSpc4=
X-Google-Smtp-Source: AGHT+IHP/+5wQx+82Xsq93Q+p1ivWxiCeoN5FhCTp6b5wZJQBNJcP3y1aTVdV3ogaf3T1uMqF+NcPg==
X-Received: by 2002:a17:906:f592:b0:ae0:a351:49b with SMTP id a640c23a62f3a-ae6b06f2722mr201059366b.34.1751966417914;
        Tue, 08 Jul 2025 02:20:17 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e7d4asm840670366b.23.2025.07.08.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 02:20:16 -0700 (PDT)
Date: Tue, 8 Jul 2025 12:20:15 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v3 0/6] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Message-ID: <aGzizyLX8HDWsWWm@linaro.org>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>

On 25-07-07 10:24:36, Peng Fan wrote:
> Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
> clock gate for LVDS and DISPLAY Controller. So following same approach
> to add the support, as what have been done for i.MX95.
> 
> Patch 1 is to add the binding doc.
> Patch 2 is fixes when supporting i.MX94, but the issues are
> also exposed to i.MX95 even not triggered. No need to rush the
> two patches for 6.16.
> Patch 3 and 4 is to add the clk driver. Patch 3 is almost picked from
> NXP downstream with a minor update. Patch 4 is modified from NXP
> downstream with a few minor patches merged and updated.
> Patch 5 is the dts part to give reviewer a whole view on how it is used.
> 
> Thanks for Frank Li helping do NXP internal review for the patchset.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For some reason, this doesn't apply cleanly.

Can you rebase on 6.16-rc1 and resend?

Thanks,
Abel

