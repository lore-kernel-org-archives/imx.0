Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1A155CB3
	for <imx@lists.linux.dev>; Tue, 22 Jul 2025 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180638; cv=none; b=u1cQ2D851U9jmqVnINoGxTG9vfNJqKZsCOBYF0bBQwGlH3aYV+rYYO3xym/ifn7SN8Dqr7IyumVQtFhTaZOuYjO+UdBSK9RSU+fuhEuNsIU6n+p+6+DwNqXaIF2KXrS+xml7h8u9KFfdX7SraCCxhGmNXmgVIHtWCff+hJh+fLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180638; c=relaxed/simple;
	bh=fzd736V1k3v1vCZM3Ch2IkXksn65O+KzpQBR36Q5RZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QUYx+2ZWzoMiHa3SQ2icgWeYj1JLoLPt3VfX+zqerBrTSuXySdlsYUO+R1GCp5lRX4HiTAUOU0u7/yrxZB14xdCv06gNnBa7tyeCbRJfj7ao0n1ESpq9Q6Q5ZbZkhI/Q0u6ZyhSBwHeoZLm+1l5O+mVhHaGcU5cvv1DlPQryGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Fjh7tWBs; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Fjh7tWBs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso939272566b.0
        for <imx@lists.linux.dev>; Tue, 22 Jul 2025 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180634; x=1753785434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1iQ+DzVo9DQ7ELRKT5wsmUCmjLHRUNTNjWFoL4XTeQ=;
        b=Fjh7tWBsuta4GwECkLVM4NG7IHx0ODgXBVpZ47p3CeFUG0FYqIN+WRAPUHDTNmusk0
         yL533aEimTpuUADqFI1nF+ieHCmyJgHYjkptk9UvFB4tx8OlrrNyl/3HEO2rBxq9WCjt
         VV5yW4l1YHyC43O+PmbdxMNr/ph4Vo2+OufVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180634; x=1753785434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1iQ+DzVo9DQ7ELRKT5wsmUCmjLHRUNTNjWFoL4XTeQ=;
        b=SACr1E3mKj+ovck1Yo/iZeLEgv1G21l21mlvPTCLAL9G2LkTjMyZd5JyDlGUSuFFKN
         SDyQKLjQ+uj4UR86Mh0f3IWlAPUXSTYLzBxBjl8E02gfZQ2F/qZiKMbvMFGPM7dX2Fpd
         newU8kIDnArHChfl8eDt+FJoo+avrZT7iPeYtv6cBp3Ghekz0s/TI/7BrkvX+61n9y8I
         dijOZzXIJZmOrJYKHSOgF9QuJjFZYEMoqMsiqXBeO5WlKK22z8E0pWLgUY0GEIY5Q/4s
         w1CVOMtB4JnTsA7htB9H9gqe8cXL9p/orzYVGdOPIlT9uDjIlGXDAk0c3PtVLt24Iaai
         SqmA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Ywf4bAiK7Wr2k3nJgoKcJruuxaOnQy9nJPwinfzsLOX2r+EEozrGAr7RvwYFeealeOo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFhnU8MYM8jDvi8aun5tl+ScPKvLZmBVMVxFn6HxmXI9jGo67O
	riV4OR8GubN9d0xWpdmCEum/UtLFMfC3iICCDmY6ef1XO8pMVzBmhbtEIiSI8YtEiVk=
X-Gm-Gg: ASbGncsxz+3vX21qTvK4W0hb1mZl8WHeClc7EsQZF7qblOHHVY1eB1LtxmpxzKpR7a0
	a0A4BELY1q9Hy45pII9jMKAu0FGE/uOemya0NX9/JNbnSmcZG7EcnApDDKb5qrX1oXsiJML8H+B
	Uv5LGBLWsjQ7cee0dzKz96BvSm1/+v+sqCBZ44IxjXbH+RAlGvCcWyjFqWcndJa4ylr+KXzaViZ
	SI9aMPvSWPqsPuKIH5Te7ZFmxcZigPgDzWXJtXuJJXFDL+kUibZ+XfwBVhO4L5P9HvqFmjfNMdy
	8GcxpfwpnKmP4JjLvJmg4KSoimKNuicDQWXOc/z5kkIVdP/Z+XfnwuE5m6tB0WEvqFCgZG8gaI/
	8nHG+O4iT4o714vfT0tfyaknLZxuguKqz/6hptyh+qZIWdVeN7LfCjz1M2DQ=
X-Google-Smtp-Source: AGHT+IHSThhFTO10wKsOhlI2B+/WINETFfgihIq5+JjYua7ZAoLLp3FbG8jE6ltycXzk2pFdKzcM2w==
X-Received: by 2002:a17:907:3f15:b0:ae0:5137:6d6 with SMTP id a640c23a62f3a-af152bf63cfmr214633166b.9.1753180633782;
        Tue, 22 Jul 2025 03:37:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 0/4] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Tue, 22 Jul 2025 12:36:14 +0200
Message-ID: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.


Dario Binacchi (3):
  dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
    fsl,glitch-threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  18 +++
 drivers/input/touchscreen/imx6ul_tsc.c        | 112 +++++++++++-------
 2 files changed, 86 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
branch: tsc_de_glitch
