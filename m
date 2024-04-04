Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01631B952
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233825; cv=none; b=qitZnQaKEYHUDgUYxENvjYtXJfhFJ60Iuli2d62Sci4XEOUfMOLfT2ov6dqtOelkHOL4tvye6iCLv1f6GRK/k5HB4XDet1lKOuqVpDohpR4rqsZEag4Y4hWAdygd+ubsLfsdZV8/vAqgt1dnV7tCHqMeWliNEU3Mq3RJbQLRQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233825; c=relaxed/simple;
	bh=hMGCi5U/GTUr4s1TD2pXM9wRWDVE6D4wK5xdmE2YqBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2zhoSgT0bFGvMcrT9sylKbifljpq85nqQ/vaNVyxhvuRdWwZQhbE+vmCVKOErPruU6d/mR/EO8H7TeK/O17oGAzNSIhpNNdj9UpPk8KNzps5SKNhSl2he7qn/1mM3wyxJH1SIMXkcFiLAKDBhoQqk/updBirjFNA8ZBPBx6y1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4ZlAa8w; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4ZlAa8w"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51588f70d2dso1183099e87.3
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233822; x=1712838622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X20l1OIbEglZq76t9YzipvH9/8wF8pWqOBX+VeO6mJ4=;
        b=R4ZlAa8w8pPGZb2eobjeNoW3ctpyakr/OK6RLiGfJuL2647PHmlhdiHrvBOAxk9XKu
         OOi253qmsbiLfVPbq8bb+phQsCgoRLdvjlk9mJj1cxSKSk+t4QQBIxPtfAwjyLmMXIJR
         C7B3JcNeLe49G0zoO1QIOhjhrMQHIbHjnXAyYAYG34KK7je6zxX4OnZzpsWf4BXOvrlt
         xOFhSqsOFfCS8uP34uLlEniNZRhyNgpOkw+xlRnU/ZqVK+D5uBqMvtqYOfXUag2ZvAvx
         7PqW87zY0EteMSchaYMQcdXH/uBxbGvJxnAlQXudoEpBsF/lWZm8MpCX8M0Jkh1NrI9K
         dyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233822; x=1712838622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X20l1OIbEglZq76t9YzipvH9/8wF8pWqOBX+VeO6mJ4=;
        b=RNViLEEhU+EehBi4B4GmHOMnFrccJ+V2Qivwin01Kpgd1dcljB7C+nhhxGXiMtttTS
         bsZUFaAGh2LyquvQFu8mXkTnPInvasnhoaDOoSlb+MfNur0vTWVssIkDd7phR7nO4YSw
         N/dlqF2gvAHqvi1z2KkzHy5RZ9b3zx3yLcQoR+KIBjrEWk0T1Pxqu4NtqYd/SCHuxPv2
         YH2el/3ifgrvGZV1AjDrLtOMJutTY60GLO0BTFbL3GGxAUFa81u8BUmnQkdhucevJGHr
         mjrZZOIBHDbCFT3hJujyA/2za9E7NL5Cx1Lw9Co3qewL6jAr5zpjYBLJTWwBTLrH/mGc
         mayg==
X-Forwarded-Encrypted: i=1; AJvYcCUgVimo2mTOztCki0796yVY+4QncPX/o/Y+8/a+5iERLwDJUpVOvyWImScLleEjuMKBSvVDSBUTV6xCg3Oq3sR6ePTd
X-Gm-Message-State: AOJu0Yw9+g1dmvM4KcBOnp9x2mNCLa5v2HKe86iV4Q9cClVx/G43jI9L
	A3LHl+GnKsY1hZ6+7C5i7q4qn/XZ1yof3oQSGsdmA9ndeJPsNkwokqHsOowlYiY=
X-Google-Smtp-Source: AGHT+IFUb5zsg1JnqPSDM6WCJg3DgMPy79GM9WkgadXKzQqBbfSPE4iFlNdz1Kc4Oxni4f8yZOheig==
X-Received: by 2002:a05:6512:3707:b0:516:a115:4a4d with SMTP id z7-20020a056512370700b00516a1154a4dmr1578665lfr.68.1712233822050;
        Thu, 04 Apr 2024 05:30:22 -0700 (PDT)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id b19-20020a056512071300b00515abab7697sm2286667lfs.55.2024.04.04.05.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:30:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Adam Ford <aford173@gmail.com>
Cc: aford@beaconembedded.com,
	laurent.pinchart@ideasonboard.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
Date: Thu,  4 Apr 2024 15:30:19 +0300
Message-ID: <171223381119.1231870.1373781151741394452.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305004859.201085-1-aford173@gmail.com>
References: <20240305004859.201085-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 04 Mar 2024 18:48:57 -0600, Adam Ford wrote:
> The IRQ registration currently assumes that the GPIO is dedicated
> to it, but that may not necessarily be the case. If the board has
> another device sharing the GPIO, it won't be registered and the
> hot-plug detect fails to function.
> 
> Currently, the handler reads two registers and blindly
> assumes one of them caused the interrupt and returns IRQ_HANDLED
> unless there is an error. In order to properly do this, the IRQ
> handler needs to check if it needs to handle the IRQ and return
> IRQ_NONE if there is nothing to handle.  With the check added
> and the return code properly indicating whether or not it there
> was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
      commit: f3d9683346d6b1d6e24f57e954385995601594d4

Best regards,
-- 
With best wishes
Dmitry

