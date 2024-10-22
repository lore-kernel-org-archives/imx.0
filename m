Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D301BC07A
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729615117; cv=none; b=o2K9Olyjg8kEeiAVXq+56sK5Rn94ElKbcOjuPnDNLFUGtKv+BPQs+i04M2a8XqbmfAZUkVVFQNY8Fi/N6UvH4fCABpAzVdpFkHQH5npVIJb5Xy1nkDb4ZXcmWKXJz19aPXbm49Fn08s+lDxttJU2Z1FaJ1Fd3TiWB56nSS0glNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729615117; c=relaxed/simple;
	bh=RXalQ9j7z43rQZHNvLqOPgbiB5PzAJTRu0Fa5uuonRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/ALVqORPnDNYmUcpy6w+1sCF7rfd08I75w51JbJDVh/pH7ewXn8YHYAgXbyUiIn6isvP+X8G/UH+DJ+2g1ZwWA65GHdaVtF1e63OEA31Ew4u7hAHKNSBJZ2BkVlmtadEHqhTGWqBloFHIB15StI/pR5N+Xlo8ax7k59SCDtYbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NdjX63y6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NdjX63y6"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so4473285a91.0
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729615115; x=1730219915; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhSKd2J3l8RyLoipAAMrIXHuHA0SVPJOKCKGMnKgPYA=;
        b=NdjX63y6fMop0pIvqoa1SnSmJ7m/kr2Dt7Dhp7Js7g5wXAnC78/q8Qltn83/rUH7wL
         HOAZ/5AQm2mr9NfIoYjqBwySw5+VCNnoVwFiwgaP3irnZSePsGn8W1YeE3yGm4bbdWp0
         0abf8ul5XgX+7FDis9EdbwDKIwtBrZJFlAJMIyCY4RzdgLG4HOM88GKI6/R3+NbTcne9
         26CjxN0Qjpr6k8ZxX5ZM4NWL+j9uanjAcn3Iu52wTl6edmqLturqZYATKJA/gfQm7ZS/
         USexPPLZg11e4Aicapo0xdf75cWiF+UQB7vQwUvcg2e7fsmZXzRdEPoTOf2joklLoKM6
         Pvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729615115; x=1730219915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhSKd2J3l8RyLoipAAMrIXHuHA0SVPJOKCKGMnKgPYA=;
        b=OvaTXCTLXa3j5AUSzGUroTnZGKT2ByhWxyZBbC84MDLuAkt7ZMtZlpHSRYGrACdBpz
         ZQQi7bc/GMVlxLhuMoKU37eU8GDEkUN1Pz4hwFxhsPn0W7bl3QmMQ62HgoXAgOl3BOyf
         TV0GA/ELrJIcXcpQjcYvUPDP9ns60atZ8Zd2/GpptsMNXrupqyyJE8Gf43/TnHOh+n7Z
         MDeM1wHdbuXWBBFWYc2i7H4JTuG3vDwS/1Q1fR0hShoTtWEkgvzT7g9CR07fACNoFQaw
         e44irsPKphqAoKnuDynipdy3A37lm9h8AebSjRHHrhBPFVRkajSAtSaoe81qiYZB7f7Y
         npbg==
X-Forwarded-Encrypted: i=1; AJvYcCX6FFLRrPxiqfOmCzWNXiqt5FM7GWh0/ombc3UJuYkrno49WZSKd3UnoyvWVduHAece68Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+aaes1I0nUwGdAGtBnYmI0VzDe6xE08zqcEefCkmS9Oe9LUvN
	MEd+ISQJZEiJM+SNj64KlRQ5psSglWFfUbvqIqGEJM3lIlrSxZM4gbnrcNqMWg==
X-Google-Smtp-Source: AGHT+IENmUY9fziUvs63gVSy652sJwbamPCQ2VYyNU8dTskEqduYXYWzphnoXxB4WhyxD1leELQILw==
X-Received: by 2002:a17:90a:f518:b0:2e2:a3aa:6509 with SMTP id 98e67ed59e1d1-2e5ddb758c5mr3458449a91.14.1729615115179;
        Tue, 22 Oct 2024 09:38:35 -0700 (PDT)
Received: from thinkpad ([36.255.17.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed825sm6422503a91.35.2024.10.22.09.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:38:34 -0700 (PDT)
Date: Tue, 22 Oct 2024 22:08:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, kw@linux.com, bhelgaas@google.com,
	lpieralisi@kernel.org, frank.li@nxp.com, l.stach@pengutronix.de,
	robh+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
	s.hauer@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 1/9] dt-bindings: imx6q-pcie: Add ref clock for i.MX95
 PCIe RC
Message-ID: <20241022163826.6w3it42o7kbp6ydp@thinkpad>
References: <1728981213-8771-2-git-send-email-hongxing.zhu@nxp.com>
 <20241018231305.GA768070@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241018231305.GA768070@bhelgaas>

On Fri, Oct 18, 2024 at 06:13:05PM -0500, Bjorn Helgaas wrote:
> On Tue, Oct 15, 2024 at 04:33:25PM +0800, Richard Zhu wrote:
> > Previous reference clock of i.MX95 PCIe RC is on when system boot to
> > kernel. But boot firmware change the behavor, it is off when boot. So it
> > needs be turn on when it is used. Also it needs be turn off/on when suspend
> > and resume.
> 
> I think this background would make more sense in patch 2.  IIUC,
> that's where the driver behavior changes to do something with the
> "ref" clock.
> 
> I'm not sure how to interpret "Previous reference clock of i.MX95 PCIe
> RC is on when system boot to kernel. But boot firmware change the
> behavor, it is off when boot."
> 
> Does that mean a previous version of the boot firmware left the ref
> clock on at handoff to the OS, and newer firmware turns it off?  If
> so, I think it would be useful to include information about the
> relevant firmware versions.
> 

Most likely that the bootloader *used to* turn on the reference clock and now it
decides not to do so (for whatever reason). But ideally, the clock should be
voted/enabled by the kernel irrespective of that. So the reference of 'boot
firmware' is not relevant here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
