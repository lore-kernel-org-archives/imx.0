Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF30337BA6
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765909819; cv=none; b=uA4Clt0ja5GETi/hugSv/p+uCCRC1SfqI1cOdDYre5brmkOVP/Pd6taBzyuMHzn6IxkoQtOa15PSr7M94krWDssSvjYcIUJfHGQzQhnw5z6Cw53Hfs5OUlEdMp7wNisex7YZKHnKZnivHYrs/xRnzjdwAkXQqyquzYQVlLA+6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765909819; c=relaxed/simple;
	bh=/QX1+siljLhXuETEqMly+imYqZN+VvoqR7nTfdr+yXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwMuI0kFqcfoBhlPXZs/rhP2RXAej/O9u2BOszz1+0iAekgGiElrzPqculkN631ci9OQI7fCGTNO3XfQkQkRcKx1afqOcONyc9lq6LKNRGZczHu910pEhmigYMwqBLLEzebeyYaJChEtN7VmFv/tndwgYMe8W2z5Cot7Bws+A/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fA4Hxxdu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fA4Hxxdu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso59300805e9.0
        for <imx@lists.linux.dev>; Tue, 16 Dec 2025 10:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765909815; x=1766514615; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2qwyKoiSE4y0S7R/sYbAU8Ep9J/DNr0jxtlpXQRjF8=;
        b=fA4HxxdujrS7G4NmhfIAOHjjXkRRaMdeT2d+43AN4IcwJS0RNORuSmUEAbv2KBlLgS
         zuJZosHzzS48X3zJq1raVP/0wrNICOnYgTwuIYKxlSsH7WC/kMxKvNG1yVrq7z9Mumah
         cseNUWG+RQtYYDLKC/SJ1MbaKQjbaeYsMxrk5JVpVyAsdKr9GEOW7IsrzUBHjHopjj7W
         0E2Cbb9VnCNAkLnbKtoKd7rPyGyBUGilpP10265LIdecw9e9/6H0d149rcvfgqnH7/fe
         YHI6Up7Ka7J8MML3Br23s4sEfQ+hn/6MsbmIebrHuPzu2f1pYLfTms1kr8cxGO9N0cvp
         4AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765909815; x=1766514615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2qwyKoiSE4y0S7R/sYbAU8Ep9J/DNr0jxtlpXQRjF8=;
        b=vvNMdQF0iEi0ga+xmBtSUWshGPPzNOxRSriq42iW4Gi2Vz74ZVW9aQIsjDTMXQpmFk
         5F+aKOVG5ZQgtV3FVDqM+Yiz7RbYp3r6d6wrCWULiYoqSnsHz20ythcWSLh0NZD3O0lo
         qlXrVydMYnuYLv5jPKkepRQlpLYGM8oFkXECoVW0g0PdC+5vWR+M/jaiyACPJkGVWxde
         9YOLD3wdC64pOYdH9Y4aFA2K8KoEEfyoZo/Xu4VdJhXWJ3D0hqMOI2WnbFWA+ISydnSf
         W3+TB40AoBgPzc8mkvv4PkXAr3jp1+3jYxObC2xlT8ZbxXmtUYVY2Gnj2h07bpLWoslu
         Txtw==
X-Forwarded-Encrypted: i=1; AJvYcCXcG1YTkVAfVXvfcpi0ycYafyG+R52hSIZfE3ZMdpMrwT86P0jycLdmq/3OFC85ICiqUT0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp7+MpwD57YDJOLfENXSenTECE2+Hquc7BGb8J7W1HQeofi7iT
	uDYo1n3hhCyAonjp0dkNS8zA9NKxvhmhYWatUqXOMJmu5piwJMJdArJfKsJXTOQDRZk=
X-Gm-Gg: AY/fxX7I+gBYOVuHeCVWH30ErEuyir7Qehhg6/5YdXMUWtmvaf7tAlzN5+ZDbawafNc
	ygvHsawtRJHPtzRTuYWRGsabip/4bhPiagU0Vt1/L37xn0EtzKlg4pD6td52cTteIr9Vonbm9mg
	L6aR02RJFf1Suomtc/0hIprGYw/Qe+b8X9d/Nx/i79ROqw1jW7EUGVo4j+CA+YAgRfAi/cVsARe
	IAnQ4IRCsWCDcETBOG508pDY4yGwzckEPVxVBXZuXa+iARTu36xL+8Y3+AlxUpHm1DJK9b8jtnj
	sD+oIgz3DBSBJuvC5FAEdOyHuQ5N24+CBl+QMF7QkQQbJ74ylJ2rAheY/gqx3uHCOQyvp6W2fQd
	aMpFL8cVy4HKU1/PGBh2HbQmCfSwRihNLJ3Vb9hM/9DrU+SlQl4sbBc0J/X/lUcV33FbI813+Os
	GpW0XGhp37+/yllDq/
X-Google-Smtp-Source: AGHT+IF+nY/k4C/6P18u9JysznJj/Z5B3Y6A+1aqCm2cbh7pc65+FeNcv1ODeP4J/8ke38+irCHPGg==
X-Received: by 2002:a05:600c:45c9:b0:479:3a87:2eeb with SMTP id 5b1f17b1804b1-47a8f91515amr130008935e9.37.1765909812657;
        Tue, 16 Dec 2025 10:30:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc23c2b0sm2187435e9.15.2025.12.16.10.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 10:30:12 -0800 (PST)
Date: Tue, 16 Dec 2025 21:30:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <aUGlMP7J19L_AHF2@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
 <aUBrV2_Iv4oTPkC4@stanley.mountain>
 <aUB4pFEwmMBzW52T@lizhi-Precision-Tower-5810>
 <aUEQkuzSZXFs5nqr@stanley.mountain>
 <aUFvvmDUai9QrhZ2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUFvvmDUai9QrhZ2@lizhi-Precision-Tower-5810>

On Tue, Dec 16, 2025 at 09:42:06AM -0500, Frank Li wrote:
> > >
> > > Why not implement standard phy interface,
> > > phy_set_mode_ext(PHY_MODE_ETHERNET, RGMII);
> > >
> > > For example:  drivers/pci/controller/dwc/pci-imx6.c
> > >
> > > In legency platform, it use syscon to set some registers. It becomes mess
> > > when more platform added.  And it becomes hard to convert because avoid
> > > break compatibltiy now.
> > >
> > > It doesn't become worse since new platforms switched to use standard
> > > inteface, (phy, reset ...).
> > >
> >
> > This happens below that layer, this is just saying where the registers
> > are found.  The GMAC_0_CTRL_STS is just one register in the GPR region,
> > most of the others are unrelated to PHY.
> 
> The other register should work as other function's providor with mfd.
> 

Syscons are a really standard way to do register accesses.  The
pci-imx6.c driver you mentioned earlier does it that way...  The only
thing which my code does differently is I put the offset into the
phandle, but that's not so unusual and it's arguably a cleaner way
because now both the base address and offset are in the same file.

regards,
dan carpenter

