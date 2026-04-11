Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55496285041
	for <imx@lists.linux.dev>; Sat, 11 Apr 2026 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775934200; cv=none; b=Tdh7GXq4DJDXGNZy/oPu2Yx6wZUDdwp3xWaB6odF1UTjl3COJkBhv2Y3L8302DtGB810O94K5NW7dkyp9GiOOQUBtTeKjQ5+ur6XTuxPU1FrvDpdITQsqFc/e9D+ucXimhGM0qbKuxWsduD3FHEFWQZR/XZ8+KUOFCSdkmg5pog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775934200; c=relaxed/simple;
	bh=NII7TnwJKw9YmpDBsJARaImgJVJgLGoeincDCzPqxIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GLcmbMFaN0W9mxdkY5dqzyN8rRTnHX0AQq2BHos8tBid7GY/HWuvPkAXhsHcu9xzLY5Z74GAuTwnbX6XSfHeYJjUslvvdEpBSV8zkMS9jf+/Y+9+txkwXS8XoPQ1Vl7EUcjG3a2DiROqlojDCmeba5bgtS5Z1BvWMpyvvR/V1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWCMbu1J; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWCMbu1J"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f2766905fso164389b3a.3
        for <imx@lists.linux.dev>; Sat, 11 Apr 2026 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775934198; x=1776538998; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHQbtwOxcmIRSK/UYtPX+LYU+lWy7jhzQ3NwSZU5rqA=;
        b=hWCMbu1JwSaE42nRg2QNHOQnrmkEy1qm2L5xrWnikdmP6iO8FRLecIW1zY6bLKe+gl
         VuNS9jIew9bGS1KhBrnt7ffwpGMf1C/toV8zsXEckom8QoZYrj9Wc0RmmsmXYO5InAM7
         GEwRRxIrf7m7x6SfBFHiGmGSh+XVwnRpmcPy3a7em98dIUVM+f6WZBlB7w8CErDENK83
         pEfWzu393Mr1diioCtPyacfmhhrgpbxeAl/WR0XC0cUGIV18UH0+HO0gcb3X0OFlr8G4
         wbE8xU6K2dYfdZXyTDxvm3EOixcE8r+mGet85gqx8bgVNL96oEIWs7isEIWA+qxXsb74
         Kdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934198; x=1776538998;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHQbtwOxcmIRSK/UYtPX+LYU+lWy7jhzQ3NwSZU5rqA=;
        b=IRjMiFYcvFAGXYguGQBoJQvHpQ3CtSKUQgvWn9hohHrvxL5gASJR6+rqjh69bpeyVX
         4aWBqJq1oSf00L/6R7MXbUY2Y2JspB8i1L4JV9A+Otq/aZeuSBLMaB4hUrovZIAb571r
         nCIiLnCGlq1+KXhG6tlCxU2plrAF+5WgBDSeCk4UnuAQ5S9Vam2hD5XER8AiEvMlqWm3
         lPi2NOsuDt/B8ujioz3nEJTXyTrYbN3lXtwInTswd1iO+Ybragyafr80jhD/b+NJT/Ui
         FCAA3ccjbrdC3owD80kWhnhmM+eXVMRQ3M8SBHVeG0qxbv4V1UTU+bfGevae1goGsMZd
         QOyg==
X-Forwarded-Encrypted: i=1; AJvYcCV8rqeNB+uN4/k4fg1rWFd0n/1QTTZ5EMdzIbKt2cT8kJC6K5lpsOO56j9XJjqSbsUcbZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbeAs7q6QZhF+TekvOunvLQUDy9DCiFrc5BVxSgG3K0CvhmSPB
	rXO/Adub71uv06eH8JbTEy9SCa8EIojSEbjrpatglili4L/OWvfbfzNbD2OE9vwWglU=
X-Gm-Gg: AeBDietL7c0Dtjlw+nH+l63jqbCpZLyT9bEdHj+2g6Qlm0jBPBXAqgD/dn3TlBA3keU
	/ZuaVKV8a+pG3VwZ8CdNVRYOzuyKTg4l6A/7zH6w4/Ai19JM1AKET3BfDb8Ssiw4+McbVHxVlYP
	GXnJscMKOcNiXXLUPlkPvtC+mK5PXkVIe+ykHlPkPQNgee8t9IW94HQqFquats4xi4XasHpwmOZ
	RGd0KeDeWgOpTvQxpd8n6Do7567fyVH20Q5LwKG5R2q6tBLpwhhyh2gShg7hfOOCfL727sSGAyx
	ozCjs+qBzD+l1xXjHlF6K6F56d8aJjdSM1VPrvaJ8RAF9L1AQPVDHhGo+IygBPZuIZF3K+UXJMo
	fn8HV4kZEBnpkVoUd/kuecWMm2l8HwcaXcelRr4yaufYShwPKXxiRMElfL1KHs74bWVTgZ1QVfr
	weUVhYXwaMx+Y22wY0TgKENJMD65YH6ZlTzBEJOvrTOGMEjgERSESVJGFVx2L8Tc7UW/FV7Lt6E
	yNvDvsXDuVgXYH8u4oY
X-Received: by 2002:a05:6a00:4511:b0:82c:d7c4:4c69 with SMTP id d2e1a72fcca58-82f0c25e146mr6937134b3a.3.1775934198466;
        Sat, 11 Apr 2026 12:03:18 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c338dafsm7058962b3a.17.2026.04.11.12.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:03:18 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] thermal/drivers/imx: two fixes
Date: Sun, 12 Apr 2026 03:03:02 +0800
Message-Id: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaa2mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0ND3czcCt0kAyMjc0vD1ETDJEsloMqCotS0zAqwKdGxtbUAiHbDg1U
 AAAA=
X-Change-ID: 20260411-imx-b022791ea1b9
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775934187; l=466;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=NII7TnwJKw9YmpDBsJARaImgJVJgLGoeincDCzPqxIg=;
 b=oOk6zMzS2U2kzS+HMpp1a5HcEb8Vdhy4v8qOt3ufeM4ZWYMHoTsGqtnpnobEicfRXOpK9Rw9s
 BWfCxPCuXf+AiGyK3+8Ttl8xIe6Pr5IcO+NKkx4+Re8Ahgs/MxZAn+n
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      thermal/drivers/imx: Fix thermal zone leak on probe error path
      thermal/drivers/imxl:Fix runtime PM handling on early returns

 drivers/thermal/imx_thermal.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260411-imx-b022791ea1b9

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

