Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06047042E
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651117; cv=none; b=A8knvElKyPmlS0NQ3G5KYxONwRgoKcVKrpEBvJyYpVzODN1Fh0Ty2Uy4cQElom28YJLa7/OeeRFX2sgUxyrIIvutuv4jSEXAyFNFARgofUI3lIMW9GPws2Sv5Kl3UumCY6s6UwD/AISlEJZP46Wdnupn9Wt9QR7yk2DlyM8uGik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651117; c=relaxed/simple;
	bh=s/yMrjuLZs4dlIxARYODOB36Qj1/rm+uTo5X+/vlq80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cStJpQfwgI8XFmRWaSyNcn7AgCsbSr//qQEqIXmyGzi0kqGDc1R+eRr66MAo+yqQt5SPhuV8+Gt+lfslnP/ALNCfPbVDF8Gj8jEn/9UWSG6JD/nlZqJTtieoAGoQIqYoBzx+Sr7vCAr4b9DEGQ6nMwejO+6+NudHJDBG3qsGcPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgZsSxRN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgZsSxRN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8484f229529so5128876b3a.2
        for <imx@lists.linux.dev>; Tue, 21 Jul 2026 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651116; x=1785255916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZ3n3CdOMEFHPEcP0edo4YZhgg3xpqPwg4esUDVoRBk=;
        b=VgZsSxRNSZHOaHTRQokVpAKWCmio6GLFv2pJOje9HJqAdCI+IzoOtuO3buCswg0UXs
         An8eIogkA4lOQTsXUyUl3Ir7G0ycGH3omX+f3Y9XGrwYcmvK7HuSwyNNcuWlpQ4DK7gb
         PU5Z1cT0s7jz9vUNPfJJNtUJ6u3v/mzbLLcY+GeotfiWgPD66sXKt0IQg8YnF2sAy4PP
         c3XqnCZeB4KI7h2E3Ro+7pUO7La5HJhGYHRXTJ8dJttR5Tpo2ysilxOVdZBXBe/hPc62
         txBaM1bVvNmUItSWbgG9jgFwS7d00HxovsjDBCfCWk2eTOn5JMJkgZYuaqFgz2zFhrXW
         cLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651116; x=1785255916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZ3n3CdOMEFHPEcP0edo4YZhgg3xpqPwg4esUDVoRBk=;
        b=RGHNyTw0tAHFGQbxjZz5A3zZxcOcovSWe5HRfPZh8sa+opzE72QlfKodxzqA6WmO4G
         +HVwnDCMk3Zfzi0dg26k5B3mY/4jtHAPlOgiLh3KgPKKe8FgxTz0bOxJB87cHNgmJ2sc
         +7LDAO5vHdl6L2z4KQ4fFIgkccbtx8voDDjMhlF2yfpnMiKGfRlXZHsUu3VqOXzjIhPM
         WGtvCN/kEgfx0mQ1ktC+t6UbT+UKtwR4656d2qKAicmERsc2og2bfMCu/VXOc3+HLXZr
         b9LBvAG3Fa+a2Is829ucfj/etrGkhkoHdylY//24uRW70gTp4N1gUYgSjJRk82t58dw8
         TePw==
X-Forwarded-Encrypted: i=1; AHgh+RrRlha865a+4gbPESLc5Wso/kdoIjXhzSem8jAuNF5W2UfTnieL/SHIKOIe+i0VmEPOBdA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws6i3913cXSBh35m0/DYQR+LV5SrNcawFNqBgLebkdpgm1zGst
	+JXSXK42swoAshZLfX2ZOG+Oq/XyI5NiQZo/e03uIjozE8YS5i4lX2TI
X-Gm-Gg: AR+sD11iurcN1MSaUnLKYtlU1IsHbLWkmZheXAIe9bPs1Hyk3t9IEYYW/yjbz+qyDgc
	SkoRN1MW7tkEWqkQhG/qF0P9PFbDGZc8ABf0oEyrsgNoPZKd1ZiV+3sExXuGL9vh0eBdZlIfbvO
	CJbCv/93EMVB5MPi87vU+PkUIOqHCGWGvN+Fka/zeCACKczrk+egSMC9jJWg9UFMhmORX9LavSW
	cA/7ExhAUSF9ydJjSXKazSIbS88dbxDvI8RnhBfjry9KhmXicubAOG6vCPhdiiLvVb2R5tARzJf
	XTFR7pujtBH1RV5/irApJ89G01EYBB95fa9Z1M3T3BaGDYw6z7XQxdu/l6a9P5m7eJy6ACBqy5z
	1gXTgctb3KI3uoVYjiALaLsS2aXj2jolXMK50Lm0sPeEmaQOaveabiecGtXc5Ihm3lVEen2fP
X-Received: by 2002:a05:6a00:1708:b0:848:2e53:3f63 with SMTP id d2e1a72fcca58-84c292743ecmr19202537b3a.21.1784651115769;
        Tue, 21 Jul 2026 09:25:15 -0700 (PDT)
Received: from localhost ([172.216.252.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm8021278b3a.15.2026.07.21.09.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:25:14 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:25:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jared Kangas <jkangas@redhat.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] arm64: dts: s32g: Add GPR syscon region
Message-ID: <al-dY5TA9jiR8706@stanley.mountain>
References: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>

On Tue, Jul 21, 2026 at 09:12:41AM -0700, Jared Kangas wrote:
> From: Dan Carpenter <error27@gmail.com>
> 
> Add the GPR syscon region for the s32 chipset.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> [jkangas@redhat.com: GPR syscon resized from 0x3000 to 0x100]
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---

Thanks, Jared!

regards,
dan carpenter

