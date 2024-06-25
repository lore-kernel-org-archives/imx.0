Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639CC15667D
	for <imx@lists.linux.dev>; Tue, 25 Jun 2024 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719318860; cv=none; b=iNLr8nbIYxpFw5e5usKR+P5D8oJlFDv1On453qieXob3pSe+JNOVNRCdGNjj18HLqrOYjZ90X+iEnDte1rh+na84Gt0UvuPDKQvp/h4hFeGUo/UcalHtkw32SBAPc92f82vmfSVlgsW7+QqOdo9HUDXlV/GpiYBEmDDWlIOM1ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719318860; c=relaxed/simple;
	bh=MmNcMBBJtVyzgiafwqkLrHq6NRCQRYl4dPawbnLh1E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrmuFQtQAlRZKhxNcXdHRKQfmJbBS1LMJth/2NRiLoVKcdtiDHRfxbWOs9pPzUBEgoid99iCZrpO9QIAOtBSHtjkWGd0XbjXEduWqYJTpk1gAKjXRBxXyGKQPuJzzAyS6XPds/5u7Coi5xjHRz1Bd3Y12rsB91aCoHbop5CVYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MC83ZeIu; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MC83ZeIu"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so31550501fa.0
        for <imx@lists.linux.dev>; Tue, 25 Jun 2024 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318856; x=1719923656; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oN2/K84i9zl3GaHFtyuViU5S2IN/66gi6BYv+zbirms=;
        b=MC83ZeIuGDVmw/WK17jUMZzHOdePDHs6KD6lVIScxeUeZ3T1CVLHWIJn7b3Fd4R1FT
         0nu9l07dHq4qvlhE4RYyivrgPr96fUUV4gtYtuwkK1IbdNAlT9FwAypClRsb8rZplAqT
         Ojto15JV1PLIkdzacTmvySD+Av6jTCwz8H6iVPe6OyKdZ5f6iAoqdFm33wFJl8boZTVs
         NQkMJyTO+0RpCJJIYPpA6hbG0UfZVLAunq5aEBREbLS9k9I//2hliStGN0DqJgtS4937
         yBqo2emMHvV7r3os4wnT9b2KK2ZngsEZJDAd5iQjeDR8UEuGaZU2aYBUavQ1uUPrr9ec
         f45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318856; x=1719923656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN2/K84i9zl3GaHFtyuViU5S2IN/66gi6BYv+zbirms=;
        b=PDmU2M7YGB/ucpH0mIDg+bK7otWxWeHxB0Cm5nEri9lgwjyeqJeiPVsItyp3TXSMk6
         HHtnEaCkfWpKG09hT2KXzXZhmYf2S8ahKr4zXl8CUBIirzY7QhE8/l+EKhg9NLlhHv71
         FxSB4zljzmxh7flyyaxmZ/xxqIsqNpVMMMYPwxdzY6bUEODAV4tHpxwC93rqeRRzNtqI
         AvcNOPAiv4rp8xWZmDSaqa3JqUM7kOO7t8AuETQiWbcXQLdqeFxHxsT4apeVKMDuHHk9
         wyNiI+F8aGVDSGIMkrwyBJxYkk2G065Iwo2qdQDutZwdh/jJIRZnCp5RSzO2fKBwaiLG
         9hqw==
X-Forwarded-Encrypted: i=1; AJvYcCVZfYLasWGMzp3Tgx0A7o2bFgrxdzaa/HJOvpUybp4JttaMBxyvr71RxBG+oP7Dg527ThkJ8Wc6slkuiOwhbmDedEbO
X-Gm-Message-State: AOJu0Yz73kCufXjTAxMjiS+ZC9XDwwazuW4yIw3nkl+gS+dn2Ne/JnOT
	PA1Ozd1MHRxxwHXdfu0cdfJ5h6fmWodeSoDqWCS5/u4njqic0Su/
X-Google-Smtp-Source: AGHT+IEugLyqoJPVUeJAwzI9eTjBQERaf1IqQnBaVqPFo7vfcEFHGeoEL5luenucOLlOBIKM4l/LLQ==
X-Received: by 2002:ac2:420a:0:b0:52c:e00c:21cb with SMTP id 2adb3069b0e04-52ce1861722mr5540533e87.62.1719318856164;
        Tue, 25 Jun 2024 05:34:16 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b6355sm208725045e9.2.2024.06.25.05.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:34:15 -0700 (PDT)
Date: Tue, 25 Jun 2024 15:34:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 3/3] arm64: dts: fsl-ls1043a-rdb: use common
 spi-cs-setup(hold)-delay-ns
Message-ID: <20240625123413.kksqh4zbi5bzfaan@skbuf>
References: <20240624-ls_qspi-v4-0-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-0-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-3-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-3-3d1c6f5005bf@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-ls_qspi-v4-3-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-3-3d1c6f5005bf@nxp.com>

On Mon, Jun 24, 2024 at 02:55:29PM -0400, Frank Li wrote:
> Use SPI common properties 'spi-cs-setup-delay-ns' and
> 'spi-cs-hold-delay-ns', mark private properties 'fsl,spi-cs-sck-delay'
> and 'fsl,spi-sck-cs-delay' as deprecated.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Chang from v3 to v4
> - fix typo at commit message
> - use comments:
> Standard CS timing
> properties replace the deprecated vendor variants below
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
