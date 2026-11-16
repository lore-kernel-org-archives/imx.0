Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831113;
	b=SzFAX0LX9iUL9WA66cq5e/HxCpKBV/Lwehr6vacMEiQd9MmzZHjgTPJ42zEs55Gp/5pS
	 MHx6mvMyfTISxM8A6PkTV8wmodDtQLu+FDUNIVBh1XjoZRha56GucFlvEOECOZ3DJ5El1
	 JpLsA0b4Fc/Wr0PLBYh7eoIDq+ODjs8chTjahpJdkpnT9i0SQKnUhYmGfzGXAi5Xn/4T7
	 g7HV2jfYqrfJS8aQK6BcZa3FKnvU+eFMt8jqIbbSWa5+ou553FDKDlzsiQB9fQpkKHLof
	 P2IF4fjV/mHzrPyJQBLVw+c5RZ6QBTxYh2x/20B0JkG1WLYcZFiB3gg1LX+jAtCvZHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
	b=uSMP9XY8l+ESSdbu/uHccwYDgcHNFwh540RHS7/jeTCl8Z8d6UZdKkq7ZtxHyifTa2br
	 4ZA1ixMhFAhw9CVZfhmv0Lb5PYpvD6Ve1Qdfx0H6fSHzmudEeLilpMcOGlnsntCjM/a77
	 RlJTrHBS/UqIdn8ztQtGNLjXz1W45MbUUrGV+XyKzgS4id8x1sgBAlMPa9h/7XwnaDvZQ
	 /Mjrpp56zG0YzZjeT+pYc6ywe60tJ3N2qtBcBdwc49DSj9qp3lauW2g3Q8kjGDfeY3ZYD
	 9ZW3F32cFSBDVlkCECoeHvN9nqeYdObw1yTv5xXcCaxVMqIrg32V34xE6ZAgCmiuI6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03vMja10;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC0606A32C
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BC0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03vMja10
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso11193945e9.3
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831111; x=1795435911; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=03vMja103365S65vsxpoiN6e/uDkn4o5F5d2uABA3XO9OyGv/Uf8H1Li4djz5aA1gs
         f/2u/LRt5rGTwhGGuU3OMi5JHWw4dxG0JCHMbh85nbY7SRsKiMLQO6HiZMRpXu+1FRwb
         CYOUvnvkhU30MM4/UQHETkyBveZZPjJTW7GHOCuYVj2LWWOi6HmM1E258IMkhB4h8vyR
         JVi++MpV6JRwe0PORjr/RvdeRTieXD/OgkeWcokpLlGyC8xgZG4+nKZgmQ3RaoTJoHuu
         jR+oFMsXqyVwX0toIYp/VXcZLNIlFE8I+eR9x+CuCG7hN+WkZ8UVDteQGQp2Ivan6ybC
         BRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831111; x=1795435911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=EzJUOv+GZF7guvTo88FtAbu6N/NMxrb2ODDnXdG29ctUaZIRqll/iwWV190XRAaZYs
         DKwT1oB2I2dc4NDArvyjungqHeui+4jqVi12pq0vDuWaPgvMy1dU/nARSlRxz4te7G7Q
         i2fRooPbryhJ0v9DhvbWW6dHcAg+kIQT9/Y4EzxxcR/b7Gq9FblnFeBY8qeKC6T/M4Fg
         IwrBtR1VuhA9fmrOg3iEeCOZVlNmL8MLNSSfUjRErhI/NkivTMn1/viKeP2xHMJ66G2p
         huLxEMuWc+e64qWK0g9JdHFd/TmE5PhI5C+BrMujRoOSdo+4eFmnSpX6gWcXEI0grtMS
         dR+Q==
X-Forwarded-Encrypted: i=1; AL+hErEmtUfFPdh3CA87+6dRuYM1hVdF8AOMNcZ2cnBmUq5AfHNau6uoVyp8zA5QKuZy0W50jBw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Bz8xt1a+2YfRoVvVsSR7jVVvZskg1OQ8ZuFf8OkACGgcO4KhB
	SKAArBGDgSfjSIW8J6Wz7l2ZnOuqMQq0bIOhpidkbfdEEGXMax0CGmay
X-Gm-Gg: AYBFou1ETC326mzTrJqbpB6ZqBCvGQmxfgQPgnhlLrmJq84Gm7hGGmW4K+fIEhLoAYB
	RPiMTl/ttLgz8NBaS5e3xXBhBfdvJxMpFnOJ3kJs5sgw/+lJ30ArSZCVLJR/5zLO4cv0db8eb/d
	6vFGjGbodq2ETqgr8VYm3WXpMPOa6/sAYeMsV4UK9ejM5epPUUdg3z/sumZqal79jVx6tWeMG8/
	ZRqlUfCze6R9Z514dvrRrsJG/a3CN7SLfL9H6ZAcMvKH6ElOqdF16KpDiopTqxQN4DEuFAs0cFU
	WmDObPYzykHqctGG44KyN35FI/RMcZMw88ATgwBI4TB8BupzhLDUzDjh+3GdFmP0EyTKwH05xJH
	8uCBITPMvYFux8CduuiSexfViYnkFOFyvYq6fKvkM3uE+vQws7pfzwdV/DWn3n2hDw/bSE2E1WS
	DBZdWMqLwdwpDLnbuWmUX0/38hWMRcHpQ518VQmcYMr9ViPxkIi9seXTbOH8jd471OJJ3Ta1Ty8
	TPAFoX2Bux1X25sEHYyTFsRcsWha3tKamDtbdFIjVkA226+kNEAjohJt/Om6KLlMjvCMFgdkVLx
	pz0SjwkL76rOgbFu7buUz5jZBhzGpkeUKbp1Nm9hXKoirSgPoQGrM8blF1SFqNrdsnHvdvhnpBj
	5Ag4o4lNpGi/4/6l/2Rr9XRWIUHwyXKWd0l/tFNrV52KpoOvm8FSTiGWfEjka8nINGFf/efad
X-Received: by 2002:a7b:c009:0:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb55a832famr162798335e9.13.1794831111064;
        Mon, 16 Nov 2026 04:11:51 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:50 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH 0/2] MNT Reform 2: Fix the internal panel on i.MX8MQ
Date: Mon, 16 Nov 2026 13:11:47 +0100
Message-Id: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N+BGuhW/Ij1Em7YBjZIVEWT/7
 uJxYGZOSOIqCbrqBJddky5WIDwqGP9sP0H9FAaqKYYQIrp8F58J1TZx4wlXNpmweY7ti5iHgVo
 o8Vo8Pe5x/875ArE+tEpoAAAA
X-Change-ID: 20261116-reform2-internal-panel-35c872aabb28
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

The internal eDP panel of the MNT Reform 2 with the i.MX8MQ module does
not show a stable picture. There are two problems.

The panel-edp mode for the Innolux N125HCE-GN1 is a 70 Hz mode that is
not in the EDID of the panel. Patch 1 replaces it with the 60 Hz timing
from the EDID.

LCDIF underflows at 1920x1080. Patch 2 connects DCSS to the MIPI-DSI
host instead and leaves LCDIF disabled.

Patch 2 depends on patch 1. The video PLL rate in the device tree is
four times the 138.78 MHz pixel clock of the new mode.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Christian Gmeiner (2):
      drm/panel-edp: Fix Innolux N125HCE-GN1 mode
      arm64: dts: imx8mq-mnt-reform2: Drive the internal panel from DCSS

 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 drivers/gpu/drm/panel/panel-edp.c                  | 15 ++++---
 2 files changed, 56 insertions(+), 11 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261116-reform2-internal-panel-35c872aabb28

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

