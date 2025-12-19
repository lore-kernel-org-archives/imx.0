Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0982D6400
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123268; cv=none; b=ZfbP/CxwNn9xVow5+80A03q+b1PhmiyQc6LZksr+iBI0L28RaXsgpu5IuVn7mXELsGoPSqCmxACn5aW1OyhpPRc9ANErgEh3cgM9pRukqpsNw7PcNomniYIJVRkQOtwvUQ89Q0tR87eVkvjNwhTl1Ci/xI9BKxpviTLWjoR5K6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123268; c=relaxed/simple;
	bh=qt82SR/vP5Y4Y18D8U8WzWGSwSBnYC+Vs15v4LyIptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkQrsAkSCZfg8K+NjmfpybFWGFgk+tiWnoYaNU0mcnd5FamsnHMnBrPwL9Rrp+rLvJ1/pGdaDP9yQ0GdSIeajGyYO8JFuQlK4PS9OrVhKnL6gcfeEN2VYpIumlM5sekU8TC2iJjZpFhjZ7pJtYUv6vZpyEdLrAGX+vVG/Ldxcwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMVI061G; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMVI061G"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c718c5481so1336534a91.3
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 21:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123264; x=1766728064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPO0eCOfjOBuPv078w1rY+GCMFEF0wn5Tdnt1BmaNcQ=;
        b=DMVI061G8R9dND3AqPVaY5ltlNUkdAgqrYleLbNtBXZ7JJquOJt6JwW0kLaqKOVkIj
         WUYFwineEvrpacSgyhqCYeqIob0j6rEaTeKwWJCg6Wfjdzt+wDVit+8YBQvKH1SF+piY
         YU/lxTNd+/iusEC7oDMrpub2WO87kn/kZjBzmHi99LYonF/7zeiMu+bIcr9jY1ZVtu/y
         tAW/cDZ5LSFxcI+EkTirM8wqWkhyOBCNeL/DIqxt4ziPIuoh8WNIiaE9eJq14nt7/RRb
         YtSPA0D6uj9ECW/42VUqoRJi0gFCzbefOrOp6jsqvPWld+6fh5SIPcplPjYuTFqCpvuP
         Hpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123264; x=1766728064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPO0eCOfjOBuPv078w1rY+GCMFEF0wn5Tdnt1BmaNcQ=;
        b=iujkvSTEFkh0SCSovekS5jwc+j52ZZxs67GuiaXdK/jT/R3qWmKNWZYoGoFrb7f394
         zRL6vCkSb/N/NVNVZdZzWC7dFRozB91NOk5ApBUyw2k83ZgzVppXbmUbf7gGqUI6+ZmH
         g2T6Nt87IADtGGhacaA7LKCqUw0otpTQ44PlcRmGNJBcWacD3FBGsFidA/NPhJqW9Ewu
         XKY9/AlQ2hF0Glq16eMEdCPMk/A4E92zYg0NXdpD6eW+qpaJJrBz+nto41IEqEtGs4Cx
         H+UHLZrJ5ginUsOrIRr4QLASiRWLS467v/X3yz6VU9Cz99eDFjjJ6OTYTcRqGy2RgUAu
         dNGw==
X-Forwarded-Encrypted: i=1; AJvYcCW0VrSAc1Xwtm1JQpO0H5zYAGH1hXA34OLbKqPwEJdVyx6xwdBZWsy7oKXhWAPxljowcPY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3hXitlhBc3ssM/33OC/4arOdIUYDLaIgVlq/ypqfQ7WB0B4h8
	FODsmS0C9Z3b60hELuJpisHhM8gWwJ7CCKCClS0Ql8j9tvo7Ic6+va4h
X-Gm-Gg: AY/fxX7306SuVfHYeecQphKkH8F+B49Q3YomtJWjQnufCqaknwhcBm8IhNjZM4r2K+g
	0CQ8AwD/YTHuwZTLpktlct5l/7ZJ4bA6W2eIICjBnSu3YEYPJzsqkjCT9PgWHRuZ3hgTgfKJmYI
	HfC4vRUKYSEhIybzAd4lufcraAIV9ry9ySXnThi43y0uahuW718OuJZ05FD/8DpD4TkkPivxXxA
	YzsqfsCIsvxjPrVF8JfqadznvyrqE8a0J74DqgIwUld/NV7RGTTn/dIywsMxhat5oPxWZ2stoWX
	cfI3ofIkzgTNbJDKXANUiCw4e0cA8AHUDk2FYNVe8b/U8GDb8VbCTXqdA3JIUIO2ipK8YGKAbO1
	6lfnhliZXT2EiiaqKtClZFrc1B7iV+VdD7gptRNDhP/0HK2+Yk2Ut8r7OJ9ueRlAK1o6KAtDjF0
	MF22e3b+/p2PK31iMM08gOtJK6z54OPf1MkvLai6tSGT7GgBCQ4UWDZAR9fDfsHcI=
X-Google-Smtp-Source: AGHT+IFVBwDVTaEx5xp3GqAkaC1oC6P66f5ES/MfkM7Xqee++lMNo0SereuLr6hl3BVB30yHpD8ptQ==
X-Received: by 2002:a05:701b:2615:b0:11e:354:32cb with SMTP id a92af1059eb24-12172300658mr1959588c88.49.1766123264305;
        Thu, 18 Dec 2025 21:47:44 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm4895244c88.15.2025.12.18.21.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:47:43 -0800 (PST)
Date: Thu, 18 Dec 2025 21:47:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/8] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <6bbjei3z3arl2t2alkyl6gzok3yanzbni63q5z53mbcabb3za5@2ot3tcfkld6g>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
 <20251201-imx8mp-hb-iiot-v4-2-53a4cd6c21bf@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-2-53a4cd6c21bf@solid-run.com>

On Mon, Dec 01, 2025 at 02:07:21PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> Further switch the mdelay calls on the reset path to fsleep (preferred
> in non-atomic contexts).
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thank you.

-- 
Dmitry
