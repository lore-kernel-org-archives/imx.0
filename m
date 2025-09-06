Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F523E354
	for <imx@lists.linux.dev>; Sat,  6 Sep 2025 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175635; cv=none; b=D+9Gqa6szgOatLnwgXbOcpSNpPX/i54Old1RRoVjkt5ZTQxVMCN5O2sAZxyCnwZwYTTyEHrCneX2954wn/L6pPEvZnwE9A2PUv3cOYgOsGRzdVCaFKlIY/fz3p8/OcvRBdYQRIAQx8M6CuBFYHLHDTbFJ8T6da+M6XpJoEbZQwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175635; c=relaxed/simple;
	bh=/CQHIaQXdkJAOJAs7O7aBXuqj1loFRx01wXpC3XY/W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYxys7f01XZyv7MXYDrNnLwl+i0NvS/Q+D1TQEqsCPlWSA2oClw0FnN8Vc5lG9uD3ywWYkN7CvMWkxNOkum5uHM07fjTR0Y+wau0WNrcmcUVoPXjjPQpCm2jq2HEWU1GMBquCifEqtmguBVDaP5WOX5dbluKsRkCOU2KT3Vd1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwjDhxQd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwjDhxQd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24eb713b2dfso11517355ad.0
        for <imx@lists.linux.dev>; Sat, 06 Sep 2025 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175632; x=1757780432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bbfrXN9NL/sgXjwGy2qqax60OBMT4y9ypEag/YlvMHc=;
        b=LwjDhxQdPTKDgpMh0CGRlpS5taILSJ6+32jXfmqXA3bnQu6LFQw15iIeoTSBs4yUoD
         EZ/QsPb1zzGUU/nyru3TeNp6UHQsCwqMUx82kw1B4o/RndEb8mPj9l8ZQpyb3ODHGC4L
         Gtd7tfsJUBjcaBn6hqScU90jAu992JLZ+ifknQEThH0zhHhSaWQB9p8hL1ZdfENe0aih
         ZH/4DyZeOU7YHcJXYzk8o0eka3iMO6ZoPOBqxf9VX5Mc+5gybUpm1PKMybIMrVM/nV0A
         /0RaF8c2e+45Ht0FpPHvBLUYh6od+1Tu3ep82w8wiYgqK51gMggvzHNWSlskPIpbf4j4
         wEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175632; x=1757780432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbfrXN9NL/sgXjwGy2qqax60OBMT4y9ypEag/YlvMHc=;
        b=oGOD4UgWX4enI+bnn6L4Cet9OZ8Cx8tTLPdxmqBUCP2IZQgJPrDgS46r3JoDoBpC+g
         qNzIAbAGAsiGhbpAa6VuPnsCHs6Db79m4Yec76hFz+AkwMRXRLSusEsIefzvLzoh3LNe
         wAepmku/lHBV0eZhpeZ9xPqx87U1ToMQ8vjFiXZQPxzcK7ZleCZMi8I7IxjiIPPMOIu6
         2j30QEf2LBnNrx4BwGnHV9dMgaSOnPoiXXTL5zbIZ9Lf9woBAqB6sX/3Kq68N9yVECAB
         rH8UdwSz3ZDWLL2u7PGZyWBQkp262Xmoh4IPcMayEw6xbKonCnMbDXJD87wTiP/J0s9k
         OK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFxws8q/vq/ggO4jVTSpuFgB+jd1rIqg2GWE8ZG+HtXAKe+Rtz2b6cc3dQChuj/TwCdWs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyweM7db07Hmc/WBW0U+e5OPDPdoQcaFUgCPiWJOB+lasmKlhiM
	hEN0LwLNY4Pz5QwdUywuJGTZwkZOjRdGW7RKp6HzlBAZ+sdj2ZZeTiWQ
X-Gm-Gg: ASbGnctzVB+z2zO6lMVTO2tbHe1bys22cFV1xP2S2EXTwmuBsPJGamNZrV5fsrIC4Cq
	onqSqiXyiaIm7YgJtPttLFGY3dj4Xr/ANuNHG5wr3CDcTIdua3xui82wShxmTc6pk4JvFannlI/
	unkOaNyojF0VgL8BQCFXHk8vtp/9w47vRJ9zCGbYXPZTipcdC2hHT2IFvfBAZ+IpPlNkt86gsSe
	WSstofZFSkufL8YNKyTSE3NU7rNu35o3YsDbUi/NkUZiJ5kBVXZjCAJUFaekXPvnL0iwAE13Nw+
	r0UIwmD6ELeYKB7c6M509B2NgZjU8SZpVQB4NlMYnCjk0iblu3Rr/Cq72XPuHp4BnnlDcZ3xQCU
	YJ6C4H6WDIiZv/8WVroBr4hs=
X-Google-Smtp-Source: AGHT+IEKtOgODhkegHRkg01Lx27B71TmWjNKUp2O/vwNN2/Yn1bD5b3dqGY98fdLQw5yzaCgB6oJIg==
X-Received: by 2002:a17:902:ec8f:b0:24c:ccc2:af36 with SMTP id d9443c01a7336-251715f34efmr31134895ad.35.1757175631873;
        Sat, 06 Sep 2025 09:20:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cea3c7a83sm53420805ad.9.2025.09.06.09.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:20:31 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:20:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert semtech,sx8654 to yaml
 format
Message-ID: <i7janoljad6vr5ewhtetnnpmmsyh23uxrqgupelvikcjzea67z@uninqbt3zk7c>
References: <20250904191731.528145-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904191731.528145-1-Frank.Li@nxp.com>

On Thu, Sep 04, 2025 at 03:17:28PM -0400, Frank Li wrote:
> Convert sx8654.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
