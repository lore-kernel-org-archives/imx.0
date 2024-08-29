Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503915821A
	for <imx@lists.linux.dev>; Thu, 29 Aug 2024 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917826; cv=none; b=nFNmu75JfMadGoKuSMjd9SoOYnHRo6/EpTraz+kwUWj4MNKskGqjw29taYVAiipMBl4Ru7WeOvTIyza7Gq0D0Lqnq4gUpR5AB03N6i7i52JzYi3lsYx7aK2+zgrhBEiuytSbYpDyGKUsqvJg0Ia9OUtOYDDSgK4Jpr5mGwCXm84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917826; c=relaxed/simple;
	bh=flakPB/Oy/MC//bflaM+S4J26kvximlMsgRqG0R+gew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTdoJflMkGfImHKzb3qaK8jMXEGH1pKBHTgITQXyLki1pB9IE0ghoX0jTJxK4DVgcfQDT/BI72S5IXkLhyFAx/QbRKT8JsOH4SgvkxSJYUEc55LM863SXevV4JldLixhECoBPR/RIdeUpLethxhDIA4mBLDBRCFztbLDVptvyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roh1xbSs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roh1xbSs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bebd3b7c22so2507155a12.0
        for <imx@lists.linux.dev>; Thu, 29 Aug 2024 00:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724917823; x=1725522623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtOlD3FPe5eufeLBo3H2oYX+REyBgZmGBdKHUhaeL7Y=;
        b=roh1xbSsc0Q4szMZCJOLXNaGQEnG5GPzhsgJA/qKHjQYK8axvESArby6L8E2ykOjrG
         M/E+J/GG23fEIUMAXpn3IA9f3eVOpAEsDEb4WCpADPc74yBi2CmNi1NDwUr+a0gC70ma
         kOXfXuZgpEjbLliZl3ngZjbBiSv8ujMHjoZostJeyQ/Ii5sX6PgC49GYi9EikwnpVDdk
         taLrdaf8N6+KpPKbttrvOB51PuOD0lQt9VEtl9KNz6PQlAcqTwn1kpUEWbWECleqCt9f
         KfJOhYINki9r5S7w/ElIixjQlCPWaA2z8PeQGZ6aRRyiGVNPBjMiJCHfvDkK2fJwPDgV
         524w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724917823; x=1725522623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtOlD3FPe5eufeLBo3H2oYX+REyBgZmGBdKHUhaeL7Y=;
        b=RHGPKIqF5NLQ/nMHxUb8PSUK1hiGfdwt1ovaEz8eLkG/MxlLy1KZEde9X1EzckW7W/
         YyvXProcVS/HRGsFfbC57W5Bb7NSMLwlL4fJ+pWOTC5EUBIh/gMzrNi4zDNis9zVWm7X
         1WkBnd2yCDNqcT0D7js8A/ETtcvDSE1ssQtmfY9uP8h+7dwGtXMLhVk68GOqBgVBBTs7
         /Iyy+goBktMSdhMoQ2TCEpW9SqSZA05lXblZPaJuRzv8iKqSW/tZoJOWpK/aaeLzUkoW
         3mgIlXxqJXC4lhQLwRvLkQKINc/rV9d0uns7w+awNXt5+MydQhiGHINdNNrjkTT8vKbI
         KptA==
X-Forwarded-Encrypted: i=1; AJvYcCW20W9LT9WfY461+MEUC4r06om5rSs2INZXcGKrE08/tSzhtz5FtzZXacVUoUUcguT5MPk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmG0N/GcP24SPdV5hQBJ4+QK3KEbW4Yv419nh2z3XFi1VPaOAU
	cdU67F3Ad3eHLsNSmjswIhmuRMK1LLHq2NDBkFw44T3E9dqJaG8sqZ5/sT8Hk5M=
X-Google-Smtp-Source: AGHT+IFXOs9RYfg+VvJElRl86xnYVoX+Uymh/Byj0Ee1XO4IInyeCxZFZlFaflMa9nmwVrVrzMyu+A==
X-Received: by 2002:a05:6402:35d3:b0:5be:c8ad:afd0 with SMTP id 4fb4d7f45d1cf-5c220135395mr1963338a12.9.1724917822633;
        Thu, 29 Aug 2024 00:50:22 -0700 (PDT)
Received: from hackbox.lan ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7bf90sm370833a12.43.2024.08.29.00.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:50:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	abelvesa@kernel.org,
	peng.fan@nxp.com,
	Wei Fang <wei.fang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/4] add NETCMIX block control support on i.MX95
Date: Thu, 29 Aug 2024 10:50:16 +0300
Message-Id: <172491778768.2521946.17064463983702008243.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829011849.364987-1-wei.fang@nxp.com>
References: <20240829011849.364987-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 29 Aug 2024 09:18:45 +0800, Wei Fang wrote:
> The NETCMIX block control consists of registers for configuration of
> peripherals in the NETC domain, such as MQS, SAI and NETC. So add the
> NETCMIX block control support on i.MX95 platform.
> 

Applied, thanks!

[1/4] dt-bindings: clock: add i.MX95 NETCMIX block control
      commit: 4b78b54762dbfc2f22f28655fa3cf6f5d50de197
[2/4] dt-bindings: clock: add RMII clock selection
      commit: b4f62001ccd3fa953769ccbd313c9a7a4f5f8f3d
[3/4] clk: imx95: enable the clock of NETCMIX block control
      commit: 42dc425fa8b5be982bcc2025d5bf30be8b26da86
[4/4] arm64: dts: imx95: Add NETCMIX block control support
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
