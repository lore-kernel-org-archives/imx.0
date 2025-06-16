Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F882C60
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112205; cv=none; b=kIrGbpOPvN/RI+UXatRpO0IkJ9jU08X3mX1ndcjFVggr0MEfMMhitcE2/xnXUFbu7Ap1i0Fd7bNOuNAQDrRzptim3ieSDdzOXuk5oeTOWn6r2HpBxfk0/4HSbp8W3DvBYR8IYgookhw2Aq+KJdW3nqRVLYsImQriellj/7c+m+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112205; c=relaxed/simple;
	bh=KmLlsiJggLaioGxm5JWtZbVEvujaic5Q0beryzz+APk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZMFsWgmsvVZwFzeOoUmENjhtfGvKJco/2wZ1YI7dKpk/N4gJKjTNhL1IpX8lDd1hchIvHQdVqMIgs5F6qQKUZ1/m57TRRJal6OS+C5re4AleYCNmo9kWgCBtcWUy7IBo1H7BwujL0pR9cZ5ETUP7bEyKOvRBblu+MA7fhQ4pEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6JC+x9q; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6JC+x9q"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23649faf69fso48884225ad.0
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112203; x=1750717003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hk/1RrX60JDmdVrtnshWrtDpcwloR4SRE8DgWiROa1Q=;
        b=G6JC+x9qqh3rl+4PFOhLXaonE2P2BMnfSilPKrPuB5LuSz8KETtJHI2DHKXVwvGsg7
         Gg8yrepGDeEYvVdXilXObc820okDCy6/q9m1/bPCaOBCgTna3iI/W5Nc+XMs7UUpQDbn
         88ibmEufxQIx4euevAPalxDDJOBiac8DVrFudd0RkgRLlB5OfszRcuom5FXY69mqKQ2X
         bD5a/FaBf5nenUcZwjV7eS/rZi2yDnVf4TVpFHX6M1kkRwK5bxCrkuwofKDICDD+e5qU
         ZxZg+pKqj+8q8VOsUa9PgG8vz3VQtaaTZz7Ofuose4z38vL/VwRQXrd4ZcmW9mDm86GB
         uQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112203; x=1750717003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk/1RrX60JDmdVrtnshWrtDpcwloR4SRE8DgWiROa1Q=;
        b=SWHmH3bcCdJXTAuSUzkKBFwf+KSKqGyODNLIvZRADSe0f0nkV/elnI1PTwUHJKAIh5
         SpFpyc/jRk1K/SPamVV58Eol7K2SM9fDZQygmAk94d4iIVi26uyMLEAfKVUtpRdW0plA
         iHvndIHe+oCmUru0dzYX7OjKDppRHoYWCcK9Xq6xgsm9pBkA2XzpFJzeUDFK1WK1XrCg
         u/W7+2H22/Ln81wRuhSGLkqaPLxr8Suei+o/IQ5Yefzdtau3+jyJ3SsN6J6LCoUzFDh+
         8zU4BKwtP9X5mJF4nCNrKu8+PCE8Xceopow0Iel7xhfkgmKe53tX5wGZRJrepbh65RLa
         9pTw==
X-Forwarded-Encrypted: i=1; AJvYcCVdpR3sNf9nmN+oc4817uBNHyRoYS/z0/0cDTLnW8sq1x2f7bAwcCWdEcTaMdh1lMv6vD4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1D27+ir63e7TDNd56s8ZD15jYdo1jULxRRbrs4aZRBM3KpKgm
	SUuKg3xwDMtkRVXt7/8wT5UsRryDVjq91qn3wjaAWGaI4+zal2HQUVWW
X-Gm-Gg: ASbGncuWqPz72nnk6cKlPzvihnNhz70bWRHfEeq58R/cFlGM+mw9HcUQD75qZnB6uJX
	pzrsjSSAJgo8VGPO3ARZQzIArZJQCed7GFkDifEqS4X15fe1q9yhsGkFRSt/+UWHT8kbyWQn5a5
	oYBlRdiahLaDjWYkEBpdNixzISYJf7MJKMBXD+xpwsymxgoLKGNXpw/UFq5WF5n4IMjk+XRl8zK
	xsZbe2IyepBWvxX8MktDwsMPXACPiLziM02Tt/yX/WFhQXr5h8rki/6tXnXhvFNv4NzvWXEgnNy
	tuUvv7WBLTUTWIpLcyJ2mXGqkhNjIXuU/JKeNUaiLzs5l59msEfIjbHbhLRuox93RnR5GlPwSRE
	=
X-Google-Smtp-Source: AGHT+IH/vDq9MzidY2EpHhbnojUd1IyfqI+gwLmq2pgb7YkKLjm2cBD1/eXa2xI2DvQeLeHOp831uQ==
X-Received: by 2002:a17:902:f690:b0:22d:b243:2fee with SMTP id d9443c01a7336-2366b005d10mr141778865ad.13.1750112203018;
        Mon, 16 Jun 2025 15:16:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bf0esm66382195ad.31.2025.06.16.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:16:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:16:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 2/4] hwmon: emc2305: Configure PWM channels based on DT
 properties
Message-ID: <39229deb-41b0-49ba-bd4d-33d57ab38ef0@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-3-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:23PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Add support for configuring each PWM channel using Device Tree (DT)
> properties by parsing the 'pwms' phandle arguments.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
