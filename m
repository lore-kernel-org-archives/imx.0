Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283F493D36
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942344; cv=none; b=WJMxvs9UaROP8Ka9XZfOVJmrjm9G78a94Y3kOk3FQJXObvqf0S4c2+c0CcQvfzYsnnYUU61nZiTBHiv4nxGygCT6aBWEDZGy3/mzyT2aXyywU8PSoivZZvYcUz3afELum8oZaCN25xmMLrCPj8gyLctQFxsDwU5cJ/cWCgq42PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942344; c=relaxed/simple;
	bh=hqsUH0xvoOGFRDB3jEl7eLagso4wlU0QytZYQJqM8hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeejgG91OEXGwNF5+tc5jjfvygATAUetnYvAs17R+wfIT0P6ozn7ekSOf3iavkmR+qu6bkdft5Lkk3zUbPIYemhLs1mz9Ay4Nu68m2XIxq+Z67G0npOlj5lqb+EiQyc/k2JNf1tVUirOoJl/x7uSW2KUDC5M+E2uyllVaaSv3Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ8wUDat; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ8wUDat"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so2842430f8f.0
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790942341; x=1791547141; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2Jhfl4IsYX/26MbYUd05Eygx5yXfRkgTahQeUMWqDQ=;
        b=jZ8wUDat19S5A3PKZ7zMrqLxZW/uCRSCryb1UAi72bCgF1lDCeQOY9DXokPgYsbE9C
         FOSOgJQS8wUAraotebbfC3OBPT1ZKC4z7G+5DF1jGSszblbFHiXWBvxigmweYFw3YcoL
         KlJHTpKSb5xRQyWYA6qEMGEcTu4x2lQWDZWuoQVJCVDDYTjQCtQqbFH5k4j7J8TfKjea
         v/RNuCLiADHxdQyhk+rcH/pAafoKvR3xAByMa+42cCvvKR7qKOZYHf7PU3p2KKxTrd3n
         GXSeqNZ4daGoB7SOXK2bcXSn3fZtHIsF92ki6L4TYlcVpfCIaHtilJLx268QV5rP+flR
         rSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942341; x=1791547141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2Jhfl4IsYX/26MbYUd05Eygx5yXfRkgTahQeUMWqDQ=;
        b=1TDDyge9lqzthLRm94GO4A0VQB1my4OAsLCxkeAk1IDjqqD3txzIw4ZEWCqYFp+uSf
         D/dTBHUxq/s0yOsCrY/VPoKKcVFZOnbi1v/kKjZTOyJMUQ+2K516BjmRvAnDGKJAUICQ
         Nh961ncOM/vxtcll68CtMU353maahu1D2Ty+nMQSQZ23XXi09gI3lttxKGw/RsH6vTOH
         HkAUL9jETq9+XSA1ISYG8nvWYG0WRg/JGGVSD/cZlZEOxjmNiXz86kQotv/LRvspHXKL
         6afvJjwYOcj1nsZ74Xlu3xIT9ZnwNWpEBxuDSbK9y1R+sqviug3xCmyFaSPI2Fb6HuUY
         cR3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwqH6u5mzfDbB9cstlxQDlk/QVvBIyNwxwKLsWbIi1YQKWEb3Yo4o4gySfmSCNuc0c5ne8=@lists.linux.dev
X-Gm-Message-State: AFuF++m0Lodo30uqlelF7dJRkprQ0P7Xkb2LjcX8yvWSpkOSopjmE2F+
	gDTNhkxj+nUwHxLx7i50sEJNuycgG3Ym1McdEECXZKCENdVl/xNe4R0J
X-Gm-Gg: AYBFou3xtzKSqO3w81R2qQJFi6UM3XUoIOzaqf+3A+Hms/9ymLr0p18SrY3XZsyclDE
	WFiPcq0Q/5WrBa3Lrr5S1xrjCse+n81M94b4xSg5TLVwlI0oCI3/md7EvCujkjo0k8jqKejtNvI
	TQBCfJIf1nSQ9jmiVNT9vnPAL5ZBn3wfYtstf0EnKw5Jl9m5BDMhG0ZhZ+DSiCjgMyGh/8th+Ep
	tP+tTqMJ3yKzl1x67Zz+pasjsQJDQE7WnYKEmPzWF8gtZ1DTbHidC+nxkG2fY3zAgpmmmP0TKnU
	0QTtrIZFRA/9+UUOseo7+/VIyhZ70CQYe3sX2nM2C4VANZDiArGGEHmtS8IDxFxf62OoVHfMP+3
	Vvx0a0afLOe1xZm5KMBUIx0JP7hZ4EPqTiu5I1QQ/EaI0XsNex08ns5MkjmMnsmu4QQoalJAcP3
	SGbrhiIj9t7Gm09xc3M8VfTyO951Hnmqdoo4ARp1Zy5Xnu1H42OlPfIHqm+hEz6nlBjj2TyxYiL
	WgBR5x3Tu/avA0VkNP63APsLkEO1hcGuVpyRoRlmc1lN8/Q0Iv8E0/j4E8cKFLjj3oDDETZx0SU
	+v8ZTTvsz0mG17kqRPkwh6WfeNdT
X-Received: by 2002:a05:600c:4307:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a0274569f9mr32626085e9.0.1790942341160;
        Fri, 02 Oct 2026 04:59:01 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm44613255e9.4.2026.10.02.04.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:59:00 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:58:57 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 00/13] ARM: dts: imx6ul: Add Variscite VAR-SOM-6UL and
 DART-6UL
Message-ID: <ar-cgeR8U0dmOTvI@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <20260929121455.437291ea4b53130e3e19778c@hugovil.com>
 <arv4MwHV4LntROkN@Lord-Beerus.station>
 <20261001144344.2100854b8f5e2d81cf87b424@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001144344.2100854b8f5e2d81cf87b424@hugovil.com>

On Thu, Oct 01, 2026 at 02:43:44PM -0400, Hugo Villeneuve wrote:

Hi Hugo,

> 
> Great to know Variscite is adding support for the DART-6UL.
> 

Thank you Hugo :)
Over the past year, we have been prioritizing security and consistency
by adopting a mainline-first approach.
We have added support for almost all of our SOMs and configurations,
as well as several driver changes and additions:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=master&qt=author&q=Stefano+Radaelli
And now it's time for the immortal i.MX6UL!

> 
> Please work with the existing modular DTSI files, do not simply remove
> them and reimplement them into your own files.
> 

Agreed. Where possible, I’ll reuse the modular files you added and
propose fix commits wherever changes are needed.

> 
> I tested it and it works. But like I said, if adjustments need to be
> made, they are welcome and can be done in a separate patch to fix it.
> This sequencing is something not very well documented in Variscite
> datasheets. I asked Variscite support to improve the documentation for
> that aspect but it was not accepted.
> 
> 
> > For the LWB5 option, the procedure enables WIFI_PWR, waits 10 ms,
> > enables WLAN_EN and BT_EN, waits 200 ms, then lowers BT_EN before
> > re-enumerating the SDIO device.
> > The other Broadcom option does not use the separate WIFI_PWR step.
> > The existing regulator and MMC power-sequence nodes do not express that
> > complete, module-dependent procedure, particularly the BT_EN step during
> > Wi-Fi initialization.
> > The scripts also select the Bluetooth firmware according to the detected
> > SDIO device.
> 
> Firmware loading is handled properly by the kernel without external
> scripts (tested with Concerto EVK).
> 
> 
> > We use that procedure to avoid sequencing-related failures for our
> > customers.
> > This approach is not new to Variscite’s mainline DTS files.
> 
> Yes, this is an old way of doing things, which may have been
> appropriate in the past when proper support in the kernel was missing
> to achieve the proper sequencing, but no longer true these days, unless
> I am mistaken.
> 

We are glad the kernel-managed sequence works on your Concerto EVK.
However, it is wrong for the LWB5 module configuration we support:
it does not follow the required power-up order and timing validated
by Variscite.
The sequence is based on the module requirements and has been tested
in our labs and across customer configurations over many years.
A successful test on your EVK does not show that it is correct for all
the modules and configurations we ship.

The GPL-2.0-only userspace scripts implement this required sequence.
This is not a matter of preference or an old approach we kept by habit;
replacing it with the sequence in the current DTS would risk breaking
supported Variscite configurations.
If a future kernel implementation can reproduce the complete,
module-specific sequence, Variscite will be happy to update all affected
DTS files to use it, after completing the necessary lab testing across
the supported module variants and configurations.

If you need any additional material, datasheets, or other information
from Variscite, please let me know at stefano.r@variscite.com.
I’ll be happy to provide whatever is needed!

Best Regards,
Stefano

