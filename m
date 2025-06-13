Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6267082A
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793407; cv=none; b=gZ9ep3gWIZiuZuaz2M1rrjrLGKqinCVjeDA9uFCXjxynwBFaDYndfssMGH1cmtf9aVZ/IPdXnHOYlu2YBcMWW7HnzWOh9tuY+RNUU1rNO3z8AvVLtPq0eho46g2ZJEts+GKrcFMqFJ2lM1zQ5sbQQNGVA3LZxqhAudUHMm0K1xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793407; c=relaxed/simple;
	bh=sXAT8ctTP9IbddpnEz+KTnjlv2skjI0nKsYoiKEG7SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCxrWA3ZS4KEfBzqO7pTdZu323eUskfElOEFdQlr8IJDdG0373CRAz5cmMgB48Xhpp3MwLw2tcTtV8Cm0t6Yv/K/cmAvnW2VLZPGm6XcFYljEoTOeN+/LPMzepVHWXMahtO0XG31Kaco3NA//NrLqvhbRIQ2CC+/EY5yhZLs7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=JWYiyIRx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="JWYiyIRx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso15083925e9.2
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 22:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749793404; x=1750398204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3435kYLA9wFlF8SNOcs53XbvVp6eAORHpcfv9oWBQ8Q=;
        b=JWYiyIRxtHXhzwMH3V3V30k3Zk4odEufwDE8cXDAy7NWtIoLS4EiTd5K98EX+mQ+ug
         do5gNMCxtfYIliOlkb58dfW6ZYh6FMWfikFii6k+reWvzryWExkRmKq73ngs61qh+0Uj
         9v3oQxBFJRom2WANbAkn85WZPLz1Gm3AIsMe2zTNh3rtdvENBoHll3yi/cGsz1SUp4pn
         dvgMS9acDSBuoqJNpLwNbYhTII82OioL8QWMFP04Vdhr8OxpKBqeoAHgzT9055cg5vMe
         sWwZDEEhuK8E5ukvo4xNO6FjHampNObe9r1O7PFihlv2HdjXgRtixoqVTDnwyqqEDk/z
         9p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793404; x=1750398204;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3435kYLA9wFlF8SNOcs53XbvVp6eAORHpcfv9oWBQ8Q=;
        b=ugVu2dzM26BT+qvLSx/PbMmfQ1sA9DFlmqRTmtsh/w7bpQ/yKOlTC1qx/MXTcvovt2
         K1f8YDdQAhe0SixDnaVWGz9YQUB8du6K5odZFyA1xgHPuyVENJp+0YAtFryBouUMHAl9
         f7CwJhpR7zQ95UByyVE1JKVItbhw6Y3QP2S51fLDTebFr0QNK2VtyroYAyeTLbNNzpt+
         QvrISCOMf9x3VFa0zJEE0b3xryZQzcDhsavAUS+16fkVBLB4pWwSDFIUTI/PAPaiWzCS
         WM0ccBvnfmou+c3wJTovWN7On1ZZx19gZAplSck8JSypIk1bVKQKPCTj2oPBoe77ZHgh
         pCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1+1DZTq0h52/rKBhzv0606NZsjt8QK4PC0DE+i4IcBH1bIo4kKUXh0jp8Un5kVI2W30Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjtOv1OKr5p+F4O8ORoCipEk1cu22NTCpfTVwZvSfc6+XgDbzn
	Y7nr4fB/cDLQbCt6dB2NYJTnc11t+yk+EeL1WKs1YXsgL0BFjGjsivG5O/xkLBlQfwY=
X-Gm-Gg: ASbGncvdLs8u1sMx0JT7CsT2Fea3pyFOOp0JpMeE6BIgT0x5Rl88dR3yMGooUi5NTm/
	2fEvaO6H0aiYLqsKkP/wJQj/5K2ctpiYJwcB31EI9S/u147dxGWKVEZBv2ybQJz4ezUxxu2+imv
	FzTfoNOr+1EpqPw4itwBkEsNZ06hrEKSQEP1iMKkBb82d8Lqul7R5ydEDjX/hw+jRKMaabsuwCL
	P9eqWQaJBbhcimof6xN+CCGqLw+besWCSVvgm+tZjY7f9tkVptWBxr+gvvj5xPE49u82Y8FOMPG
	G83Ex/QC0EF0PZZsGdhrKDKQwC7G8FvHDgvxWul8JzIke405rcKqZoU2WMbS2+iCVV0=
X-Google-Smtp-Source: AGHT+IEJFuFqUOnlnGjQjN5WVFL6UkUwlFwEqG0OO5kQPnwz42x6Pj+XObkjiX2VL5pxxrvm4wOE5g==
X-Received: by 2002:a05:600c:45c8:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-45334ad46e0mr14604425e9.9.1749793404493;
        Thu, 12 Jun 2025 22:43:24 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e184724sm40465025e9.39.2025.06.12.22.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:43:24 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:43:20 +0300
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	bharat@chelsio.com, benve@cisco.com, satishkh@cisco.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
	xiaoning.wang@nxp.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, bryan.whitehead@microchip.com,
	ecree.xilinx@gmail.com, rosenp@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH net-next 2/6] eth: cxgb4: migrate to new RXFH callbacks
Message-ID: <aEu6eGlVvNzZnpk0@MacBook-Air.local>
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
 <20250613005409.3544529-3-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613005409.3544529-3-kuba@kernel.org>

On Thu, Jun 12, 2025 at 05:54:05PM -0700, Jakub Kicinski wrote:
> Migrate to new callbacks added by commit 9bb00786fc61 ("net: ethtool:
> add dedicated callbacks for getting and setting rxfh fields").
> This driver's RXFH config is read only / fixed so the conversion
> is purely factoring out the handling into a helper.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  .../ethernet/chelsio/cxgb4/cxgb4_ethtool.c    | 105 +++++++++---------
>  1 file changed, 55 insertions(+), 50 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
