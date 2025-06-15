Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F151224AE0
	for <imx@lists.linux.dev>; Sun, 15 Jun 2025 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749973289; cv=none; b=ufXNUsVb4MIzwfrRV1fV7xsyaU8DCl+I7/8IXVtRGNLqONelqOB/VbGsKpHwnPN/1jdvnvOq+ho4aS+89ZvueWeSadLpVGzBWAcZhqAwP8y+AM0h8cbdoEeMVTue0yVC/JoVDL+qUwC6DYsDLa0HuuXM8gTHCj2BvFAIcX9BqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749973289; c=relaxed/simple;
	bh=w49Ia7nLZK5BATZbhja7+FbxaKXzLeK7IEP4zr/0bu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGcn3vGLR1JxZx/umIHVBECyJp5BBNFaN0dMYSSjNqd7BolFIOw4xRNu/drLzA30IGRdZWwlAKl7ZAdYfC1vsqsDLEh6enQhnksZGNg2huA6s8/ssp6P4s6G/aBqBjgjy0o/G25HoeR0Ykhn8GtVcziHkgWAgleqwpxDubsT3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=o7Ye+zmu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="o7Ye+zmu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36748920cso3924154f8f.2
        for <imx@lists.linux.dev>; Sun, 15 Jun 2025 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749973286; x=1750578086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15crHfYFg0c3yN9UDEf5GY+yILB0/x4l44MtFuPKz6c=;
        b=o7Ye+zmuVM1ELsROpt2eN4ydbyV4y7sXVnL1Um3wS/Ct4ZUNJ8+p8MQSemaUaH6/Lu
         6Y1A/iFwYVE8s4YnkPjvX8PCE3kWoZ7Bucu4BrQ+GS+rA/fL0I2zdQUodigV4Pm1oTD1
         3BkgFT5n6JsIcC8TywoVvcX5V2cay3hs9QcKrsc9J2FDZAPUpJFqgsB02qmeJZn1+mbs
         4OLlahXBp4mRsWgXYjpx1vQDLb2ymjt+m34WHQwtKh11C+w8bGaJHv1XSOgN4ihCRKdH
         tXnf616C0tQBTkbZTVNFX1F9gaRKlwHqown/4TUj2wPqtGvyNxG8LxX2Pr2KFaqYIney
         50uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749973286; x=1750578086;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15crHfYFg0c3yN9UDEf5GY+yILB0/x4l44MtFuPKz6c=;
        b=POcupGMGRX7Gj5AReEPZzVmumRbWBymVG3ucVtzmfXuTeFWWr2eqEDmLzB3ml9J+pQ
         i0CNJ8BSScMkL2BCTRt1iksY+x+RHDnMDuomVRQyI2tFaNoRjqvrDZYooYkvUgLmXOGv
         X//eGpR1n9Mzbg738/wut8wjCQ9Y3VbnFLAbfZHSz2+6l9aGl9LQTPtupjbz7/4Ic338
         euhbyoD5zC2XE9LTtmfOnq+725msBW2aOnhhczX/kY7nOX+64WCQ94vtBgmZCFFGgPy4
         YPVmVUfw1O7azvopJDoPJNHP+IXksn7K2U+gI0kzVWE1oMP8pufv4/qj482bdGvzALux
         e3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJk32jLLtnQUH3ge3tv7X/c1BtGqJGcI7Mi1P0LFGgB/vLwR4Mtcm5mApraenOur8bXZY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6qRgulay8N8obwp8cWeCmZrDmWVNih5N4lP13lAte2+qgUPb0
	y6YD0gMdkXA2LPhGbmfNNBEnqPj3RKa/fY7b60IFFSVLoRwFI5Bu49LwGZnjR4vCJDk=
X-Gm-Gg: ASbGncujLrDnTEJr9ZRj9DfwyFzF/JLzv//Bp5c6cY06MEEzMuHnOLaU4noDToCC3Ol
	WR0jEm/A2yT2MtdPhQzDsb/bkOzmpqCT31xZY5qpI+eLkLjJnyGhqX0OsyrUBiisVTuTHphPpIh
	HXl+rGWRfnBsV0rt8I5tjFix+3e4LwNYIDFTTncCS8rdbjdafMGeAAO/W0hipVF9Dn7kKN/OmyK
	Ld7Ppxfp8BIV+vFng+0GmWeG6IU07+Qf3YFWeMeSGeSTJRsan5xma6O7ycS6Of6a3hHc8v5LQEc
	fYQB1SEYQDr+puVcpj9+YvvGIn+eDGEEVcEUQ3/MuZMIk6GN8gQvLtpmFkFzRrFDc3U=
X-Google-Smtp-Source: AGHT+IFkqUoRixLle1xv+ipidpI8Wlfsv3yhb3f0P7DkHWCnYQQa64tQfvQew1w3Lcmx1RZCZ782Yg==
X-Received: by 2002:a05:6000:178a:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a572366767mr4802586f8f.5.1749973285894;
        Sun, 15 Jun 2025 00:41:25 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm7289017f8f.33.2025.06.15.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 00:41:25 -0700 (PDT)
Date: Sun, 15 Jun 2025 10:41:22 +0300
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	bharat@chelsio.com, benve@cisco.com, satishkh@cisco.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
	xiaoning.wang@nxp.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, bryan.whitehead@microchip.com,
	ecree.xilinx@gmail.com, rosenp@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH net-next v2 5/5] eth: enetc: migrate to new RXFH callbacks
Message-ID: <aE55Iulol5QTZMMQ@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, bharat@chelsio.com,
	benve@cisco.com, satishkh@cisco.com, claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	bryan.whitehead@microchip.com, ecree.xilinx@gmail.com,
	rosenp@gmail.com, imx@lists.linux.dev
References: <20250614180638.4166766-1-kuba@kernel.org>
 <20250614180638.4166766-6-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614180638.4166766-6-kuba@kernel.org>

On Sat, Jun 14, 2025 at 11:06:38AM -0700, Jakub Kicinski wrote:
> Migrate to new callbacks added by commit 9bb00786fc61 ("net: ethtool:
> add dedicated callbacks for getting and setting rxfh fields").
> This driver's RXFH config is read only / fixed so the conversion
> is trivial.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>  - add get_rxfh_fields to enetc4_pf_ethtool_ops
> v1: https://lore.kernel.org/20250613005409.3544529-6-kuba@kernel.org
> ---
>  drivers/net/ethernet/freescale/enetc/enetc_ethtool.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Reviewed-by: Joe Damato <joe@dama.to>
