Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811634DAFB5
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843159; cv=none; b=ocFrCV6oW49C9ygqkD2pdCTkFfrYTpswgyihhroOjvn6xn4BcXHHIDS3hwlCRgaCHsYgFGBHbzV+Sw/WcNdSUNMXWOLdTkN2JH95OcgLAJgIhiaiFNddcBIOFm1qCSq11c0ez0/Yr1y2FImv8IYRNeq9j+Bw5WfYK0BAungbyT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843159; c=relaxed/simple;
	bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL8yWTQIuxJ60CeaM4zRSIITJ7xpxpTlm6oC4+oNukVkft1AfOvIIq6x6Zq4WnpC3bXAjTxPF+XoHkk3J8OzkNF14mP+mZZedgcwfhxeMcdohkZDKjSqLcJWClsVXxRePtskrKhkrrd/AzfecGYy/D9hTFXZBmM8NUy4Uf3KVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKKtPATC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKKtPATC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso64311105e9.1
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 01:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843151; x=1791447951; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=gKKtPATC62ob5y+E+DXyJdis1Rnr0MYLsDKV68djHpXC+bVzheNYPvbxfZaS0MWlLt
         mgj6AnVze8uFRScTZklg5VuVk6KvsGHn5uDd1cGCuAS9xCuTSUwWm+jHMRmLFHiBmITf
         G/9KNgcfqKDmmhnnd8ywzEkHv1dEgFvbS5A3PZmfdDLB2izXSCMzchnfUkT26rX57x8W
         zQCztKY07yfYuvlLhUQWGKlOJ1J8YcAttjvRp766fXEyRfAqayHi15tZ03kf6RzDzRQV
         0Nm2P81H5wDHJo49IircaoMA+l8Gtuf2sSVql6amaEIPnXb8l7DwpaGX2t2x3LptUwhd
         +sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843151; x=1791447951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=ZapOPewe9KG+8kDa3h3mpPN7YtpOJCfc2Y7eW3OaNQn8oVtsnRS7us7GYutxPzc3Lj
         99Pbhxr1HLbXLo810NyjFk4+dNFj5tQ/Bw+cKQucdvboiFJg0Tj2bkmf5u+1II42GA5D
         18wIEmDJmR6qQagpTVYYQW2Af/FzekHkdQeWPlqQVx7GRIwjr33oEz2wYhZpIn5kN/5X
         dQQAIkucsxWbz4A7PJcDn5VV7S1SOdrTAbokGCIL4QOTJUuwIHtorbxk3yVhjSVU5sES
         bIre2vCDuj7Gub62Zw69umKaDuTmLHkkjGcnkY8oDldySb5LZZkEigFsZ1AsYxPiRd3A
         mahQ==
X-Gm-Message-State: AFuF++lvAGW/m+ngYSap4vm84VvjLZBQJnyTweryWdrMH/y3+Ya2c/ZJ
	kR0opXaxz81z1V6N7pAV9ElWC7wMSR0f6WHGGe4S9GOz0xgtLzH9X2Bz
X-Gm-Gg: AYBFou1io5amW8fWELudprJgsN+Uw/EaCr9Z9ly35igBzk8QhDKoHEYMFlTO7gUBEa2
	G66hFgBzUdKa9LnLL2xEHcqmchnz82z586UmmNlj8lbuwk99DJ4IvnrFL7IUfvQ1s8oHvJwHFXe
	u74Ef7meLVVJDOmWi0/DIJn/JqYBxImI92ilR2H5cRV/vxv1WD8JviV0fTOekjV3dn41wtJwI+H
	H6ONwFYl0V/kianHouZvijowF2SNddwYtS2hyHxIGjT2LLpvejLJcYk5wQj37ekIoo9yfdhvCMr
	fEaEEY4/qG3sHRMFKNGAAUMOE35EWzi7c3CGwiTXEAwLEkjbEUebkY7z8Y2pLBqN4Cfkyk2wW2f
	fuDbB7fsNTJ2oUVUigkZTKx18dO1mF1TwPcam7DRWdT5ynuJaAQCpUSzd7oNxBr30/uvSLR5kuC
	TqNzRysb/Wc9A3fuZqX2ILu+3Ipp+gbZufw/EHS+DQ9EZ9Lvre7Fj5OBF19FiSbtcHENmzyTFhs
	lvnxwV/pkiovXOaKFyuWPWS5Ljji9t74pwMfrFnppctWqOAqA+bD1U2rBZ5/97lkOCV2YN+nQ==
X-Received: by 2002:a05:600c:a45:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-4a01afde48emr58311595e9.15.1790843151361;
        Thu, 01 Oct 2026 01:25:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f947898sm54455885e9.10.2026.10.01.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:25:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:25:49 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Message-ID: <rq5ndq2sqsyoqwhnbdy34etudy4xevdqpm7imgd65uu6gy55nj@wpt6jrgnq2vp>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>

Hi Frank,

Is there anything blocking this series from being picked up?

Thank you and kind regards,
Ernest
