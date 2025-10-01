Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3262B9B9
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301883; cv=none; b=e0Oz/kmCPM+YxsZLziDID6Xa9NtzeZRMuv0Tr8ytXViRxzpusW0dwfNG2hDu0rjeyDyZS9QQveWgm3K60k1uXwD7sWGE5pHarz0DBMnurs3hRIznvIkpcLSzM8jX/tDCtJh9DOChRMy+P6eh8BJgJNQ/JTBVAO5ak99Rf/9IviM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301883; c=relaxed/simple;
	bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVrysNQ4KL240LG4R39docE5OK5Ojq2+9+v4xnqj2bDV1L6Or16zJRTTtFLkMGqvqw95zNqd7G3kQCNOgbJG/XcxsWy0e5940s0g7XqCLhhXbtUxlCsoR9GhTzL/Ix74VHzYimCFTgO3xVo+pus8NLq6xyvvx6dXp6z/0pses/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJR2f59S; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJR2f59S"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3652d7800a8so52827701fa.0
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759301880; x=1759906680; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
        b=IJR2f59SAr0Dun367JGSAEN6Qi2OSHJFieoBbYeoMRe4//6BPnCPzmE434jnZLWtf/
         a4LQmT8uX9KzQvhjmP1+ch5KUPzpVyynblhm92FvRQk890LBrF5UW3/CAXUgPqWSvoLW
         6zmX5p+J2IvqLNbKi27I+UxL1bbq4MCzX8V8nh5gIyFkClU/lHlsRpMFzIQBZ5ND0goQ
         gDyqHDj7JmyIJkH8um1rntvDuXaPcgHM9HjbDID2TgOo7iQdUSftl/V+R+QPEhFuwS3D
         Hb1DHgZdthkiyc/e11lPOR6FOVzychS2bXi7kiyKXWZNSIF+94R7r/Lt571XZdKUAlIy
         0faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759301880; x=1759906680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
        b=KXtz/I3tQitQaKeYGjMuFq/SdkI9DHdChTMT3wtvXq3ZFFGJf7Ljdi9nV1+IcDG2/L
         qsbPBqjKFBOb14na9tnzXaDaQ4evrrp5f/A8BbLKQVvF39N8gB4VPf4TZCJq8XlmjfnQ
         I3b9T1fYJE6+cl61Bby1JAnCMoh58jLYiSv4ZOzn8G/RLoYGPiOZs5FR9fxl6Z9u0RdY
         H7vUjh92WTwRe3DYimfuEzYbCsVxidUNJCCzQ8Ke7KfOcGmpDZgjYtS6ha+fk62c7VIT
         t55FI5NiSpcMVcjmmByXtXUiBFuApw+LQ4ECqXDNa6dVkes/B5KooBuoIkzxbacd9Klc
         cxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEGqBAhP/bge6Lp67DQDsezzNdtyuN1o2KdrIjPyCFNP2Ywz78MbcuJrw8vF9zg1OX4G8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9RWOMP+Aze2uR/pejrT794SEStb1pizqAJm1jrN7RkArwSnGI
	WBTcWsVOUi2lPItdE6F/J25xRQN3wpNrcvOy4Mc7ExG0hthcbL1o/fmj80M/4rQZPpnnjecH4Nn
	OsWVv+RNSAqEgRFGrbsE5HjmYjEEe3BSX45U5KvUe2A==
X-Gm-Gg: ASbGncv2qFHPQQyZs+b8Fs1PywwgDVmyHyKouRh7fh9N1Odd26li8zATRBPlly4MjKa
	aX3D00Pf+UcufPx2l8zhSD8jofX0gYVZAbif6Lc78Y8eGGiQcKWUz6cmt4QwK+8yldpbl6ISq3E
	x5BO5791cdNw1gE/z21ZqEqG4yk+1Dl5Xe2DvUxX9NxVf4Mobj1uouaWQ3Ij3/x/l9ixj7s1G2j
	uwNuVOcWtVwLttLLQyDcXs/+L7og98=
X-Google-Smtp-Source: AGHT+IEFYBTk9nGSfmBNRwdlnBZfU/Sd6UTKJyGtF8VquxDEPDVY/XxX8lcgahg6Ei0VXCczWM+mbwbqwLB0jcHsDcE=
X-Received: by 2002:a2e:a548:0:b0:332:37d5:da95 with SMTP id
 38308e7fff4ca-373a7404f33mr8420991fa.33.1759301880298; Tue, 30 Sep 2025
 23:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922200413.309707-1-shenwei.wang@nxp.com> <20250922200413.309707-4-shenwei.wang@nxp.com>
In-Reply-To: <20250922200413.309707-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:57:49 +0200
X-Gm-Features: AS18NWAuz5cqgLXrZSSINvwGEDmvTaVcLOQI-X1PgOUAiEVmWUpsc5bfCXSgBKo
Message-ID: <CACRpkdbB+DfhqUE-fsz_RQ1U02+nMEhNsXrKB4bd6dvLDLjWUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"

Hi Shenwei,

thanks for your patch!

This patch was not sent to the linux-gpio@vger.kernel.org
mailing list, please include that or we can't merge the driver.

I think the OpenAMP project should show interest in this
patch series so I created an issue in their github:
https://github.com/OpenAMP/website/issues/122

After fixing the issues pointed out by Peng the driver
looks good to me.

Yours,
Linus Walleij
