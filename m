Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B2173
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727022428; cv=none; b=bIpnEHClev4jNnoboVbH/Z9BJMeSWFYac0bqRvdSanYeq5itPNfWorLV7L7hgqZJIvvl0ESrNyhTc57BZcOB6v0W7QvfCUMqcv4mlookerPJLXlKw+4qgKVNmNyJ3bnCdoQfgzFO3jCSHNzFEeLccKC6s8fdzMENreI8u+tXpNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727022428; c=relaxed/simple;
	bh=xpqEnlxsDOwETVe3NJrlbuyVCvIju2wa1IVxLowOk5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XO4qzRthdXS8+ZNvbqY73rq0I3Gx5lm8i0LiZjsLhdbxMUZjiK4D3PIY4g20grNa+K4Zj+TuuuocJ1ATVMDmKvTMwhJPa4Ei1gUgajJW7TqU1YXavjwSK5kGysXaTVNzo+QJKTTOXiW3mXWOPbNeu526OBGqnn+MRZ/keDntIjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Guudhm2n; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Guudhm2n"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so35543201fa.3
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 09:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727022425; x=1727627225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDY1Rx685xpsDxEMUUtRILc2NYgU/miULZ3NwVaniyE=;
        b=Guudhm2nez3uFczIIP+TsHvmk+yyoREslahJLvgf8qVrdPPzaH4GBrjkql4ip4lK0/
         QOqwe5PtVvfoco7zvwvM/ezAR+j4eUU9HuNXsyvVv0aU1vFhk/KXhdE1mJNtfv/Wm5GF
         gjgoTo4Ws1ALDSM/oyc3Oco3HDATIIAPCDUprhsw+PGDWAD5Q070VZ82euavOjh0xJCb
         +A2EmiRczieHmxfq//IyLoHdYtDzVpU0qNQ4aBpQ+YefX3XxG35ybQW0hkzZXqrZLfUF
         8RdKG20w4t+j/6Ad9nzHH8EhSHu143ZAaucrCYusoANcHkep/K0ZP103QEhFZcLvI2Vm
         q0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727022425; x=1727627225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDY1Rx685xpsDxEMUUtRILc2NYgU/miULZ3NwVaniyE=;
        b=q+sSp16xms9pJgNtWUKW49LgtGZaSV8wrqPgA1DF9KsgKRGXvcmY1T1FuILo7B71XG
         IEDkDgOdFeex3Nd4oIgOWm6pIdti9Zda2UybqmqPB5ZwDslCkuYLGCuOAsy/5uIVNh/H
         buSZm5UcTWy9MFZTzvzauR1p2EWz31nnSjiZbEgPqY7sBohXxx67zYUIyD3F2aTu+txC
         f1RFeueN32byNqD9yiNqNiJ87WTz40nu7sFppxmxhdzNtYEfBp6wdqWr+0n2+D+yyh1s
         5YQaJgug1MjbPecttaC8jGM1CKE1VXgFu1VvzywcbDJhKyfZoeLT9sjhCcSeJRfV3P3x
         +v4A==
X-Forwarded-Encrypted: i=1; AJvYcCVPfWls4g/MKMaYWFY+kOQnF3NChxs5kiqyShYMXWO6In73zcdzaoC1OJ1MaLVXarhpuHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjtLCYXHuLQ9AMi6aoGnWMMw0SGkF1guqOg8b6utLIB4qCAiUJ
	QcwucsYwhir0D4wVR94HEbXk8zViAihPiKbjhSV+YKudWMpE57MXgAFqXb0S1l8=
X-Google-Smtp-Source: AGHT+IFzgViXl1baLryxjIB8pfU38892fW+VxPd/yZA9ZEMdkgBX/TKTyO/x2CPBHUOhIGucSPYPYg==
X-Received: by 2002:a05:651c:1548:b0:2f7:52de:9a35 with SMTP id 38308e7fff4ca-2f7cb342edcmr32442021fa.42.1727022425010;
        Sun, 22 Sep 2024 09:27:05 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d485f11sm26541611fa.111.2024.09.22.09.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 09:27:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
Date: Sun, 22 Sep 2024 19:27:00 +0300
Message-ID: <172702205091.1380824.2685575625082150622.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 06 Sep 2024 08:38:56 +0200, Alexander Stein wrote:
> When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
> users were updated. Add missing Kconfig selections.

Now that drm-misc-next contains both commits...

Applied to drm-misc-next, thanks!

[1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
      commit: f673055a46784ccea04465b9213e999f7bc5187e

Best regards,
-- 
With best wishes
Dmitry

