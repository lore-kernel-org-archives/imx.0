Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F9248F6F
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 05:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793361; cv=none; b=C8tKUNae8HNSz9hVnqHt18oSjhen7qQesuMKvm3rz8XK8sfcKtPARS61qLV7VS6MOCGnNom8+7toabZHbz+i2N1EmCtzmfvRg61N8yJIZjUFuiltGNa2Bs1wggMsdqeYKTbhZhBwdhmZ3uPiL9z9hppEbBXN1/f9hP8oQbcw2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793361; c=relaxed/simple;
	bh=rwJ46fDsisHcZlPYuwEI+nd115knoVkwcADd1UMbkZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fd2jQw8/oZc1WyIjsthQ2nSbps9FgmfDJqC2n4sB33zwJr2//30rbOzjq5pbZR6gyiB8+zGLFjcwG4Gkv9WlVHggD2t4GMCnxAhXuuViAFd1Cat5NO7WJmPvf1zFD5qeG/EUch34hcm2fPEOV3DSZ2C+k3ejVyiUdayMGniVYXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=pytORs+f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="pytORs+f"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441ab63a415so18860955e9.3
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 22:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749793358; x=1750398158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWWAL+VbrkpZ6XEFuM8I74/gE+9nSHvII7fIBjxxM/w=;
        b=pytORs+fmC1GbPQ+JtQYSSAJsda6KoH9kPJeWEW67YhDXUSjW8eUzxRtKAt4VfAZcU
         KI5cE0gPSsR9CloX2h+ZAc4BRIVbPXCAPfvMh5el840ME7HU467Ra00jZt4cHyX5nLXs
         k1kjvO/MjxCEyyDZ9cDeJFUQvDug1zzSEfwFTO9wHV7RsDKDqrQtaPWlT5e1CYBMTBpi
         JYVtWuF6XzmV85Xoibp2bcl9tVlvqIxSSMqY+XVK8Jydv0LXRyMhMaL/a5quIbV8kwry
         VskxuZIZInDN5Y45EkNHWj4T0Ru7Ocn6j/1TgfArvuLlLoJNMhPqd42kDDrBEOXZQw/v
         /eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793358; x=1750398158;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWWAL+VbrkpZ6XEFuM8I74/gE+9nSHvII7fIBjxxM/w=;
        b=DFrpz3y6eI647W2DZpQ1qpY08YLGuuWW4OQVhHN20Fs25IEVzO/47sVTRDrT2H+zSk
         0X23vCb8tWOBTTkB+pt8AjtfHJsuWlLwvdk7pYfEhof8+um8pG4Fnvi34/8oooWTtZB3
         deAC5iHdWCAg6qTZQ+xsvrrbSlFfjOstRw3YPB27K6vTJW3LLulDpwt7JxZnEZD5CeLr
         Vg+nwh5wYG2+7dBAiGqF5trT3r/Y2ElmRWTvzzkScmUp8mLJIs0OyiEd3P8ELvm+ibRC
         7coXZ+VNsVa3DFRz3nWtDPlB3DYR2xKzvK1T2RtPtJ83ONwsjrNRUQ8uGnspvUwot2BI
         R5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWWKeECR9HCmAUe6SnsRvRjSLMFSv4n8uxLNclIASHtngd0W0Bdn1alvRXaabm3tsr7+y0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzstHY50tHn6dUMGKNS73hfslih7mn7UMqCkVw84HEWap4jdkpu
	Hho8PGz76gBuXV2qD5J6Ou5nrkwlQ4wXEpJG3+AIgJWCoqTr2PvJvBGtVBngNrWwW9I=
X-Gm-Gg: ASbGncsn2CHDwo4lzDoXBpBjXFxjelcn8/uk3Ez1Zb1i2U4Ie8VVLcihHNC2otFOAUI
	Ze2rfyPifoR9+BUViL6EzQYUtpSlJqMiyKIaA4HbTQCOc8ZiyoiXGPvPggK0MmJphFVSfJNz+9Q
	BoK/ugpl5Sug7EWK7FBtr/+zH2c/o7Qfci064a//foadxHWX37quIeCq2mqpoPcCpr5EXHeNONh
	/YtF+vaw1D/mdZiLNt1kSOeAAucICX6+z0goA0p1zwp7dOw7QDvmiZJ30bYsuybtTsSWrKYE2Cd
	XO0GXxWD4+9FWfBZmjxfbtY/e4d/DR5os0Sr3w0g2EKRBs9anZv+8F8RYXCUMQyVbmA=
X-Google-Smtp-Source: AGHT+IG84uiDT4+CauM9tguckCETuGhZolZLjTHippDm6PpPYkpCe5j3nAJMU5AMWProksAHkDncGg==
X-Received: by 2002:a05:600c:1386:b0:442:f4d4:546 with SMTP id 5b1f17b1804b1-45334a6d158mr12403025e9.1.1749793357591;
        Thu, 12 Jun 2025 22:42:37 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087a9sm1273702f8f.55.2025.06.12.22.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:42:37 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:42:33 +0300
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	bharat@chelsio.com, benve@cisco.com, satishkh@cisco.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
	xiaoning.wang@nxp.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, bryan.whitehead@microchip.com,
	ecree.xilinx@gmail.com, rosenp@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH net-next 1/6] eth: cisco: migrate to new RXFH callbacks
Message-ID: <aEu6ScZdFW9Dlc2X@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, bharat@chelsio.com,
	benve@cisco.com, satishkh@cisco.com, claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	bryan.whitehead@microchip.com, ecree.xilinx@gmail.com,
	rosenp@gmail.com, imx@lists.linux.dev
References: <20250613005409.3544529-1-kuba@kernel.org>
 <20250613005409.3544529-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613005409.3544529-2-kuba@kernel.org>

On Thu, Jun 12, 2025 at 05:54:04PM -0700, Jakub Kicinski wrote:
> Migrate to new callbacks added by commit 9bb00786fc61 ("net: ethtool:
> add dedicated callbacks for getting and setting rxfh fields").
> This driver's RXFH config is read only / fixed so the conversion
> is trivial.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/cisco/enic/enic_ethtool.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
