Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56C52F4311
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 05:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793620; cv=none; b=ud3pkMkfHpocCi6fMlBEotdNXb2tWtJEnmynNKhwr4ysXOmW+oBhltm8dQaUrAiGClxpfiZPjXxpXTLtLU4B3vCa7aElBRq8ZBtAc0/aDVIfsjnefTYmVpr6bTQOqahW1r5pJh1S5oXjFW5kqGBZW2+P6J3ylyEpY5SFJLqRZUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793620; c=relaxed/simple;
	bh=1tL574St+l0hhqNeNJRDByJY1z3BVGHZirhTQ29vGZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ+HDxuC1JTu1NMXgPmZRVNBPj3ViyvoieABJ+LhkrwdV8ZWjYf6mUUXvJdS2IobzjwjDdVa9ErOVYnOJFG+sRtR+O/q4nbGdeCJ8uq9/zAh74eSYHUQj2yoAAMIMZhHKu4RW/lHEc7h3LV5sZ70oWd6EQ50q99etIXgBndqWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=GkPR6tJF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="GkPR6tJF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so22197445e9.1
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 22:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749793617; x=1750398417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEwgX9L9/NZFybt++vFWWEkABvQHG7NaD8RX8Gt7I2Q=;
        b=GkPR6tJF/UsxpEFPtymxiY8pGdWicSK5S6IjCbWtnB/UoXRPK9yLjAmLfomtQHAe4n
         u5YG30y/+GNr1rqQD11Jm+CPncGrFkkRJuAAz5pT+gkgWzfZkVQ0FUNoTPEHEtpyHV2p
         p2M9UJ9HVHadMsJ+TJLlhiUtbIl3JPSyjbiEK6l3gm73KZq5ckVjsg2HVO4Tm9k4JPhj
         naxYzY4xXF6TG6CADGe4I5oM1mm38tKCd7qnzITFtdY4p/w5/Q+g38FZRSBW1w5s+CZR
         cHpo1+bwg8D/SsnsnN/g7FDFBgiUKGhq69y8sllY5gqiHTEwyVubwxGiwLOvU7dmjfH6
         5O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793617; x=1750398417;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEwgX9L9/NZFybt++vFWWEkABvQHG7NaD8RX8Gt7I2Q=;
        b=pFA43UX4XJ95+geC8cpNleHYeSt56gwoOa7wIcSc6M/OHxv8G7PGj+F3XgWBGndYAY
         urwAfuOT/hSIT1Ggr3EymJYE3OQc23wSm1lFDBmEzXJTWXX8rBPICP6lRlL/zaLddDl5
         y3t1YOsFWP4P4OjRVhJejS1d4iLXPueQQm78P1HeXRjeVEwCgaBty1a1z8qmoVYWRXsI
         wGx9LiWHE5CQ36aQbeuthKcVCdfnfJ1otXpjt1rqAiY8apZPmkr8vkPEAP1U6CAIxfm5
         7UJlznk/sv3naRBgmvrdefyUizmmSXbc5uRdFOFkVoH3KQeB/lyVGS5e5qh+GsNtfSCs
         KAxw==
X-Forwarded-Encrypted: i=1; AJvYcCWiRMCdOZb3/qaw0a3FDYbCMprDXfSbmMIc4WCkHW8ZdJDbzSp4QSmWqKuZmB+vRTY0N98=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcbpGYyeljmE/ZIwNsZDzJZP32AbSRVRI3KaCxPxM70IwutCgR
	AmpaRJ4huFv3QCJ4yWNB3HVDnHqISYxeZtAdXwap0RLLHPwauj0OBMA0V+WMHP9l+0I=
X-Gm-Gg: ASbGncsb30O7GMy0Dfm4pU+XgopvmG28KGwhAOJN26BxZl9/zm6DQh/Vy7aPFyBhCex
	3jsyj6+WggkVg/z0CyaOlcgbLMBDW/N9DQu1oMIdhgG9jxG+ws5ZHbk6ZiO3RCulESdl/OU5w7X
	frhQkIgA0TBOUBkdihj99LEvnAcBOtewq+GTmx9FyrUA5w5DG+FdZn2I3+Dbzf8ybdJd7sI9aoi
	8kk1JSwBQJprNidJiNov9F57DWGaS/ZA+u8Vr3N/MGlcV67BN72m0k/OaNsqTQDWAe5zndVmfnL
	FwpFqbFQ2KRupDOMxWtS+Pbs0TcKrv7BKwSlqZOG/a0Y2kGWN2rGeeLsEk0tdHFuUso=
X-Google-Smtp-Source: AGHT+IH6+Yv88UzWNVVtuhEJAUQypxvKjQTlMb2Ja3qKZUBUZoQXBTZb8QCbRmLiQf+ok+wu2ZKobg==
X-Received: by 2002:a05:600c:3f97:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-45334b19564mr14025915e9.18.1749793617033;
        Thu, 12 Jun 2025 22:46:57 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm40936085e9.40.2025.06.12.22.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:46:56 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:46:53 +0300
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	bharat@chelsio.com, benve@cisco.com, satishkh@cisco.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
	xiaoning.wang@nxp.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, bryan.whitehead@microchip.com,
	ecree.xilinx@gmail.com, rosenp@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH net-next 4/6] eth: e1000e: migrate to new RXFH callbacks
Message-ID: <aEu7TTei6ggKpS0n@MacBook-Air.local>
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
 <20250613005409.3544529-5-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613005409.3544529-5-kuba@kernel.org>

On Thu, Jun 12, 2025 at 05:54:07PM -0700, Jakub Kicinski wrote:
> Migrate to new callbacks added by commit 9bb00786fc61 ("net: ethtool:
> add dedicated callbacks for getting and setting rxfh fields").
> This driver's RXFH config is read only / fixed and it's the only
> get_rxnfc sub-command the driver supports. So convert the get_rxnfc
> handler into a get_rxfh_fields handler.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/intel/e1000e/ethtool.c | 77 ++++++++++-----------
>  1 file changed, 35 insertions(+), 42 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
