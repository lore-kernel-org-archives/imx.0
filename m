Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0871EB5E5
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 05:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793461; cv=none; b=YeJenqDT61+q3FGOnpVn03NL/apCY5/0ipaQ5Ul0FebXcVuoSGbtxcbQ7I8bfdMMiqxNHpPF7aNhH5+HUs8c7DlIVwsJtK+TjcGtklxzbzbC6eatjHZbJEeMwpfu0Xaz7m2iiwn1wYghY+SAiMMIOisrpMXCFKYyuwLiGgX0BjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793461; c=relaxed/simple;
	bh=/u0arpuLxhgzKttnYWprTMY06QyGbNmIwT2mkYUqVZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taf9KZp2X0ZdYaDQsMIu8HAPV207CGqda5WjvStVrKK2oGCugNIe3hJeYS0pTOWajf+P66hhar4aMBQdOC+Mj1kGfO/BTRfLZQdgh58pks3inhrAX00dljqYu//pKoLtL0AM5vCWzywcwEua0DoLAHOUzVVpCLHlOB1sT5EPTvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=n4q9/zZx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="n4q9/zZx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4508287895dso17907745e9.1
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 22:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749793458; x=1750398258; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gykoMnS52RP7gDSHkbQWw5lL6WmevKJQr79bb2ZfQk4=;
        b=n4q9/zZxv6ucDuLG7EmT6VMl7p+UrrTReY2eC+y1r/A9nC5u+OR9PiVTa4c8mFdnPh
         gX6/KnrROltoVnkxU4Ssfj4Ga6eUrJuFwBlcYDKjv2qExtP7PqN1aTF2V5PNRBlPVsGg
         Sjd6Yp+nESJsFkZGq6ykJ+VKMMHnsad7cWExmjTnVkOmczWVTGX2dyLal5z1B4Tkrl5V
         mAofGW8mewGhRZuO8qF2jMycaWrPiwiqxGQTW7gE1eJ8aUmEbvHu+c59sIsN+z+qG5zE
         E0/15/gRK1jNNmRF0FavRA6MlpnvLh0rA/iNhMsVgpi1OI2RErBBcb4PNd8zjwxrtFBT
         dflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793458; x=1750398258;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gykoMnS52RP7gDSHkbQWw5lL6WmevKJQr79bb2ZfQk4=;
        b=lfbE1mKQp8weGJd+HJC8tDe5Rr7EBC+tdvDv8EWGxi5aVmHRYOFt+JAtjGB+xOzEct
         PNPUcjICCKWmTftZIhVulJQV6LXSWLoQYbkje9KqRfxtM/xaV2/KPJTowmvqvO8CsQfr
         cq3nnvArX4bTTvBmKl60S9BYyGFFmrrKuDE4FtPddA1f9cf/ldadw0iz9zCYJq3bI8kP
         63DWsPq0zSBvYu+87ZcxGYSi+SXhBcFJAvckK0njjFW+HKbJfAxJ04djitTZKFN25Pk9
         QC3yenY1EsShFsAf+JMoO8Mdu6lsiNy0r3qN2SpnHtHZfFJCwbSJtDERvcero6+mzTTY
         3VIA==
X-Forwarded-Encrypted: i=1; AJvYcCVFTTUMpR+c1N16dqfsJcSbD8aYc28FxbdjaTKo74pP/+oMsyk56eZfQJ6WsesodWI764I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvMU/wCmGdrZTMMu31V5+S0ZtMMiAY1XtG8ES+Nu426LdKFZxo
	1IH6a0cELfBpiQzZ+4zeZTWNp+Rn4LYPDbonTqbaVc6Jm/fcFRVnpAnUOEl/sKJQNWY=
X-Gm-Gg: ASbGncuk1ea4EQNQJ1fRn7vHYVctE6wb9p1R/uzZ+YKCI8Kb0Ilujpd+OOHWD3OF3RQ
	P6HWprwq4dNK4OZrqIPSUzCJuF+QobVFkqQEweQmOxRdQIGgvkg7xeLX8E5F74mLFKNmS6RHgrW
	8h5obfmBxli8yqQZ4/AXSx76FtAZmyMv9wKygPs8/lUDU4iiexIu3d7/R5ninmaWN83w39croLB
	nSd+c30xXiloOZ/AxQdYXTvE0Q2uh6b/dED0a0Uso5gu7QGy84FYKVMzCj/dHhRNYBNHGQMZGDC
	nbexARO5W5mSnhJJFNi15jrQFZlw42eo0CIkkoIESXJCeZ9sJLaQLNci3atYfECV16Q=
X-Google-Smtp-Source: AGHT+IGBv3Aqwtn7lt6O5w5s9XFTW33H9ZaQD+WHnSPEU2tjIcBqQ3CXdzA4IBwXSMWFuMfZRQ00dQ==
X-Received: by 2002:a05:600c:6207:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-453372c1b4fmr10520265e9.15.1749793457478;
        Thu, 12 Jun 2025 22:44:17 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14f283sm40965495e9.27.2025.06.12.22.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:44:17 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:44:13 +0300
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	bharat@chelsio.com, benve@cisco.com, satishkh@cisco.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
	xiaoning.wang@nxp.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, bryan.whitehead@microchip.com,
	ecree.xilinx@gmail.com, rosenp@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH net-next 3/6] eth: lan743x: migrate to new RXFH callbacks
Message-ID: <aEu6rQHAW4pXJ-1Q@MacBook-Air.local>
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
 <20250613005409.3544529-4-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613005409.3544529-4-kuba@kernel.org>

On Thu, Jun 12, 2025 at 05:54:06PM -0700, Jakub Kicinski wrote:
> Migrate to new callbacks added by commit 9bb00786fc61 ("net: ethtool:
> add dedicated callbacks for getting and setting rxfh fields").
> This driver's RXFH config is read only / fixed so the conversion
> is purely factoring out the handling into a helper.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  .../net/ethernet/microchip/lan743x_ethtool.c  | 31 ++++++++++++-------
>  1 file changed, 19 insertions(+), 12 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
