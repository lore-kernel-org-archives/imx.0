Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FE1D58A4
	for <imx@lists.linux.dev>; Fri, 13 Sep 2024 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726215143; cv=none; b=MOqIaTteY8JWVCo6ziq7/UPCjBIfXdYBffUOcWBkIrKGwYoDdy2ABlIQiA3XvjpBm+/Km2flfsKKjdc7m4nRIKAn18UMdWyNaEnh0dkPDn1zrP2uggeM6DmhPiUynD55SB08SaMsmPB4MCVIDa1mBM7BTSgVuURj4s0lG2fn52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726215143; c=relaxed/simple;
	bh=hXeaxmc3DyeXngWYscY86rme60s50CRR2a6cKcCFxSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D1yr65ud6l6atHlb1Wj5jL4re2xrpxOVcixYlrw0zT8cBfYEh+PcpQTIfOnFypiRAvxBQFv0PwBZjrLQYeKFHZZY8zhxBO4l8WtDOYrzyomi+1nCsubmC12UhjlIyOHV74rphWDbqStWaj7/wmXDoya8xkmp8jTcvhWmFErIS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=im7KVR+F; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="im7KVR+F"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374c962e5adso1159262f8f.1
        for <imx@lists.linux.dev>; Fri, 13 Sep 2024 01:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726215140; x=1726819940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9k9rYJMM4C+oTJ2nVf0030SJZ/ekryk/JdGG7NGdvs=;
        b=im7KVR+FoTUf+UUrI9WlqxAJgOsO4LmK+LmPd/hXke4SaKuIh2WCaquf4TvqWf2ySZ
         xVcN6Ks2bgDHDJt0nDWGfI/ejHEJUcqwwkU7rxShawCF8Mp2W4j+5SzLhnALNDKGzRqB
         qQpqtyTGFS4HxOZf/enrvEipE7IF6VBnva3T10kbI+wMPsffWTsWeK9Sc/htmfe5WgzN
         5yTYiIaRz/7i3B1EmQEFfGRxfkWBw1MZ6q6aG1ei4DdFAkfjyuISgTK8RSjeN4fGd1g4
         UO8Dqyf++ZIWwEHiNqE3eAwDpD7y1r2J52G6SVT9g4NHlXLhnGrdi4KJRG041z0FGymT
         8SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726215140; x=1726819940;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9k9rYJMM4C+oTJ2nVf0030SJZ/ekryk/JdGG7NGdvs=;
        b=GPi2kF5QFtq5BlKBEDt+u3x/kPyP1kNYp//37LNsxGLXY5KS0tB69KxUbIa4P8D1RW
         sEbkILAgorcLkroM+KPZ5IFHkqR7GOUgnGyCKRBMqYx1zB9MaOi7pb0kQwfrkw+jo6vf
         /4yD9gYf7toZKgCeFdRv9U5NCpdlOJXqn30MvrH+RPca9Or7pWjhtVGq/tu4EUSk+7hf
         rX3xsGcD17YTwfZNzNtSlfHJqogxkQ6+ylucf0DJ1Gfsxxl2Vc+jrcUuZWyN/ybqRV6W
         0Mkz6i5Lud0vTMwkCEUrNKTfjM3iPZs5XBD9QxYUMAEeBqEmU1loW8wgzN36NVRApW/b
         Q9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmtvNlfcwXGdLT0WBQb4DDcdDEH0swZg3YG70cu9YGpa5yhPwqbYZ0AfhlDC+KzYiTlV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRhhJOjgqxX1f7cajy7Ywta6ZJzmKids9VVPgDMX5z4SSvwFVW
	B9M7MFiD4IpAm8uIYpSa1ziUZpAFE1jUom4gwRouuzmq5ymWnEJqFsaHuSShWTI=
X-Google-Smtp-Source: AGHT+IGUnlSGK+OFJ+A4+PSD8enQEtq3Bf6LxAtm0vLDr//sYtSjZ+IjAZVM1wrdWRVB6siwKSkUvw==
X-Received: by 2002:adf:ef06:0:b0:374:c692:42e2 with SMTP id ffacd0b85a97d-378a8a0b8d9mr7708566f8f.9.1726215139924;
        Fri, 13 Sep 2024 01:12:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm106939955e9.1.2024.09.13.01.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 01:12:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Dominique Martinet <asmadeus@codewreck.org>
Cc: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
In-Reply-To: <20240907-hdmi-tolerance-v2-1-b9d7abd89f5c@codewreck.org>
References: <20240907-hdmi-tolerance-v2-1-b9d7abd89f5c@codewreck.org>
Subject: Re: [PATCH v2] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
Message-Id: <172621513881.966490.122670380841730948.b4-ty@linaro.org>
Date: Fri, 13 Sep 2024 10:12:18 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

Hi,

On Sat, 07 Sep 2024 14:54:33 +0900, Dominique Martinet wrote:
> This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
> cannot output the exact frequency, enabling the imx8mp HDMI output to
> support more modes
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with selected clock
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0d4b950e03fb1c1873c51916fd01ebafbbc48222

-- 
Neil

