Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2283B6342
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421516; cv=none; b=OMX+liWE980gC+dGWTCT3An73tjfTRGS7LNIGtcBIvflP4+i4U24kb9Y/Nr3wSeQCsozgdujEsIQZlBEq91scXQVLJhotsVht2/WTNmG4jMRz+VhIUKfrLKqJnM4dcokpE8kIul5FgJCK7Z8+lIERPfHmxuTsW0bXJpE+YYXPPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421516; c=relaxed/simple;
	bh=0l1WReIp+IXtP5rjc92yCromqx8LCGpVTHfRGoor7Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZ5RfyHcHA5XtWW5qoJmAM3eeXqD+6aG08OLTvydylZwOXd6jA3I1C5vp7CMArsX0f0g2zAsxWUY2juyLX0tspI7b+Kvwz4f9xpe9obLc/3vj+CBBlmKfDx+MdIPZiNHWKlG8MvUoFZGWQOXnlwiX3vmchr0DSWLaNPLJp10HOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO0VT+Oj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO0VT+Oj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439cb5af25bso2656018f8f.1
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773421513; x=1774026313; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqK4MWNrO8rqxWDIz9KeUr6nx3Y9Q/ulNkMGXJyHS+4=;
        b=OO0VT+Ojmkq7oXoR90ef7MRycctVRCF8rCgFYrEDkMGz23VWwC+qooiEL+WjON73KW
         gMUkj0c/7kKkCyp+k5ZE4oPIxv2X2ZBHsO4PVtXdcR3Oz/yua11yU5cmy1D80DY3PM/L
         kQWBJmCws/sZelgSo7jOwkFmJEacDDwg1eRnqITB6TTwwxZmwpawoKp6HNAAHiknTjwU
         YtS/cd1k79jgU+GwdOQCB+bXZ+kdgaleQ/uim0OAXLEe61yE0X1/OzVPtL2ROZefptIG
         WPV/loj/Uhwj6Pz5sfkeA4lphE2eH0ShIm8pjZh/2cJMr+8RJyy9XkqyRUtV7uaj0YNm
         Kf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773421513; x=1774026313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqK4MWNrO8rqxWDIz9KeUr6nx3Y9Q/ulNkMGXJyHS+4=;
        b=XM1NQ5ARpQzrMNkGAJd60BOq8+FINY7sbBRMMnq88528fIACMW9DNcNk48K3n6zKiY
         6/irE86EMX0xHD6D3ivxssTh8F5KsxIog9skDcUGiJ54jGObyKd6dPXaIuKr5MOuBFba
         ZpJCOEtrpafSfx4/HuAuME5jw73O/5Irgxu4l9Aew/7GKjIxYdcvpkIIrg+Y+3ZEeLjx
         06gcrVri+aedvJ+uAXUUx/UTdPmXjM8L/7RG+XogEGxuxmySzq8b9MUownUt4SZaQg4J
         9CQAkdV2Nmkwbt2JaDL2wetJmOIF+2h6UWlxAHPdONKU+qO4f+KytNE2OF/2gqsHXolJ
         EfZA==
X-Forwarded-Encrypted: i=1; AJvYcCWdHerh7guBm5mHD1KAyJnNoFwE6LXUE8Tt/5RJjB5CZwIxo6J0fie3MqQJpAyjeQtWxNE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjwa10q7H/hiU3g+CsySmTfoNdH9s0G/us0jMg0SGcbgjOFMBn
	qnxsBpbQrgFQqSv1l1thyqfWCE9SfBpzVrH+LxophlONd8OwbUcGJ39U
X-Gm-Gg: ATEYQzx/IlQhJntwfrNCbzQFpleK/4mW6qG3oVD6xOs+L67LvhXhzksTO60TMqK32cM
	mnfvJE7aE/lna+D52KhAwUFyj4f3AlESX7sSTJTqB7swFym42a04nijfRBk0ASw7emQCr3PiNq4
	0dfjrFhJf0iBCJaf+d7J+nYOGq7gGl36S9BCDMEI9owXobkgh0bcY8+CKSIwTycTVbY/QU2VhZf
	yFsNmIjLTiu3VTReisfX4iu/nEfBTM5Czdia4wEpZ/vZeFKHCORZmPQLwQRgAMnn2foA8+D8uQZ
	HzwZlKssoOnObxsqMuTNg8iwpiCbb8+DfmGzjDJtCqObLrC/gQ51YBfQkTb4WDaw/VfR563Fe92
	HDmppCD2ccR/cnTOK7xo/9sqR5GCmU2yEOYMJ+BRmsr7bl/5/3wS+vTAnNPF0A5a1EYBwZVb5NH
	l1z/YjGLmZpDtxt/rx4botgR8Kvpc3P1VTzca4gjAObDYdYaZXkEDS0g+BCvNm6NQY4yJw/bRnd
	7mEHwZkaVDmaIiN1TsAgPPFHqmVpCbmq2wM2ffZJS/ijw==
X-Received: by 2002:a05:6000:1866:b0:439:ba69:101d with SMTP id ffacd0b85a97d-43a04d79003mr8013170f8f.1.1773421513225;
        Fri, 13 Mar 2026 10:05:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm10531876f8f.36.2026.03.13.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:05:12 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:05:09 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
Message-ID: <abRDxRK_GFYwmAGE@Lord-Beerus.station>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
 <abQ_d9fGarNobYdo@Lord-Beerus.station>
 <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>

Hi Fabio,

On Fri, Mar 13, 2026 at 01:52:31PM -0300, Fabio Estevam wrote:
> On Fri, Mar 13, 2026 at 1:46 PM Stefano Radaelli
> <stefano.radaelli21@gmail.com> wrote:
> 
> > Correct. It is not included anywhere at the moment.
> > The Symphony evaluation board uses the IW61x configuration.
> > The imx8mm-var-som-wifi-brcm-legacy.dtsi file is kept as a separate include
> > so that carrier boards using the legacy Broadcom-based SOM revision can
> > include it if needed.
> 
> Then imx8mm-var-som-wifi-brcm-legacy.dtsi is dead code. Nothing includes it.
> 
> I don't think we want a dead dts in the tree.
> 
> IW612 has not been upstreamed, right?
> 
> People using the Broadcom Wi-Fi on the old board may still want to
> continue using it.
> 
> Please don't break it.


Thanks for the feedback!

I might have misunderstood the best approach here. The reason I split the
WiFi/BT configuration into separate dtsi files was to follow the direction
discussed in the previous revision, where we decided to keep support for the
legacy Broadcom-based SOM while moving the configuration out of the
device tree, giving the support for both modules revisions.

However, I see your point that if it is not referenced anywhere it becomes
dead code:
Would it make sense to add a legacy Symphony DTS that includes the Broadcom
configuration, in addition to the current Symphony DTS that uses the IW61x?
This way the existing boards would keep working while the default board
description reflects the currently produced hardware.

Or if you have any other suggestion, I'd be happy to follow it!

Best regards,
Stefano
