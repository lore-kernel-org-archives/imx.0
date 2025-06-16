Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9A219317
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 22:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112256; cv=none; b=KT44Na8ayL/hYCWk2NnYhGD46CTlg0tGDUn5YQ9F7gnmFn2MeqwqeXOMBclSCakyKZ/qqPC/gI9+TmZxnIdjsF+I9THpE8ieswcHnsaGksIEPssUlQZYDpbKAfybF0gYK0GP7R+vIOGxI5F1GSFYMJGk//0aG8G2/i2oggS3lPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112256; c=relaxed/simple;
	bh=Eg7dbGWyyu2ply9sTpPNkidpw4vMgJloLSO8OXtQ3EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBbsaOpViElVZ0TAoI1aN9s+HqTwwRFqUcuSJv5KiOKL1PZeWF7pShX8AcUZCfiG+H+QwhIcNyPYrMCnuaQInpVpD7wgpJWncyKZvrKsO76jMNpdnaEt8nxoSgJVGbVTJ5Jkfq8qd5flU6AiMGFpHLlg8Xs66iGsVUTuj4OCTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDuX6lym; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDuX6lym"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2350fc2591dso46341395ad.1
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112254; x=1750717054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhvWwZ+CXS9Vy+57dCKjZUbuHrxsNmbe1LsJ5SFrRhM=;
        b=DDuX6lymmus7YGYrOi1SGAa7ebqL3Kcwa8W3XxVV3Z1dkipDPcUk8gl0Pdk4Br5Bz0
         zUxz6nvV8Ah15n9JoKWBIhMZVjhqkGlGFVoEupHadbbRQJVNQoNJ0tFqj1YB8YizIzUt
         1gOmnTT74NwH/oC2ROqNHxUbnFAukClZnIiVw6LiOVVM2ASiDlPkJw289erfYu41GXzq
         JFyP154MY7xRp6dj2rukasFfMhMV7zfX3KWH1AFhxcklRpIcLzeO6RyKTuVASHKS8vCv
         dI4rjlwG6j3VJGutdhbyQXQ62VHabXvNk2ijorsuuwGFDTzzoIXBiM2jD/UYoEx6qEh3
         24dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112254; x=1750717054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhvWwZ+CXS9Vy+57dCKjZUbuHrxsNmbe1LsJ5SFrRhM=;
        b=gx3DhuREV04ZntZ2uzy05yheWanb4VXp1XVjcTbLspTg5LQ5uG/Fom/ndV6bYYfhhW
         81UKE9BruNCb6Lcqpi0WaRiBTXwyM0lzPL5SliVZQHOaRL7/jhf6gsdMZpQnfGis+ETi
         k5qNRLpIXjUYH61ZLKjgYNtwKqaUugT2ltY1ygUVJ5yoscEPdhGXZkfTnyIEYl5GZFlt
         0K4ifDb75xHeDt2PbE+NMRAprCw+d2YFKCuTouEJeBdubXwa1y5ltqBlEFg1e3jQyH6Y
         mKFWJ9e8TGvkm9vzfVgCFL45T4zbK6D5Aa0fAuTCAoSdyb6UbV84886eRqLAegCQ1nq8
         ZUNw==
X-Forwarded-Encrypted: i=1; AJvYcCWwAAZwuETnMr6oCjU5nB3CZ3q7cXiKgFPLO3LaXoDdVcMiuYkgDw91neouOSR859vpyig=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA92L/Fmh/cToH3NsjyAhbAmnXw3kN+73a4dDr6JRxxGY0dO01
	0zfOKChI8NYSa9snY6wbhQbvAUCfxhjZBCH3TLTIKNPDt4BlvwseP9wl
X-Gm-Gg: ASbGncuhGOQQPV2Bg4/wDri/uOv9vvUaPSle/939pCwJSRdreePHxnvgZU+4yIt8ZOH
	H5qbfCYpix56PxDRds5ligpViexIqlmRBcDoPlAbOE5KuCjJECZ4Nce4EejRSgmlWMHUcYzi7dI
	lpB0x3F/6aSpUsBMqADnY37FuB2HYnY7JdrgxQREmbFMFi7sK7sAS2je1PCYCFRBDYmP0yftNw8
	u7TXwdiOfyS+nCz4lbUSWi0vVeDEYzfdpXuvuNpxToaHaybWW3IreoKWbA6BtfemvwQa4J/v2EM
	2Yxz/JSULciI9hbLhgpQ0GgKIlaXPay+6L/Q7QvQnDVHvKITh6fIarlAXA/cyExaJBH85yS1IOQ
	=
X-Google-Smtp-Source: AGHT+IHEzMQYGh+Rxc5+so+AO6P4UVnGiCrhcLAB9kdOjmCCaTuKyssep3cuf68orx+kxzfxw5HgOg==
X-Received: by 2002:a17:902:cec2:b0:235:e5aa:f51a with SMTP id d9443c01a7336-23691c138bbmr3644555ad.7.1750112254563;
        Mon, 16 Jun 2025 15:17:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1643ebdsm7498669a12.26.2025.06.16.15.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:17:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:17:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 4/4] hwmon: emc2305: Set initial PWM minimum value during
 probe based on thermal state
Message-ID: <c43f5318-2158-4f7f-b8c7-d4609dbab41a@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-5-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-5-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:25PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Prevent the PWM value from being set to minimum when thermal zone
> temperature exceeds any trip point during driver probe. Otherwise, the
> PWM fan speed will remains at minimum speed and not respond to
> temperature changes.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
