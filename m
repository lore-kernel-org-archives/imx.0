Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8901F09A3
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915053; cv=none; b=NFbOw2/qKj503hcEAZ9VCvXdKrsPtAw4t4LA5UR0OQFylf1zhXkqJa3BieAzZmAwi4viBnbKEAYxlCPq5EJX6UNxDWkv9Z3Dl591e9sXUCA1fYCOxryZTPdukvKFTqGF8FOe2+Czv+RaOgqWJEbXwJ/rwnKPGDGf2JfXEBmCQeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915053; c=relaxed/simple;
	bh=H4Q6r6e/iHzGIp6iZre79NI2YVcV9IoFpqa7zETW6IA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/4eD2hFq4RvgHuV+2f1uf0QMwBSu/9Xw3mNSpSfywaD+ArF9RE7Cp2ckgji059z4zNxa10WDCZiB8BT0KMUUQVEjcK6nFRkR/lHroTqHkMCe/RNyADfWBymh9Vng58m8sfJbdK4+NfwRUfOouIgkWyaH+GAXiEXDIYVmFDBb68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWGP2KAU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWGP2KAU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so2181028f8f.3
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915050; x=1762519850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mO2KtY6kpP/4dstvJ2/nd3TfZivPb0AjpquB+Jg3MoM=;
        b=UWGP2KAUrSkjgSX22zopua0OsT9sSdEBL0vZBAQWgMcLPtJWmwhYqeIPnpq7IGjSZu
         VcgQ2ssyrWNw936bJctm5ow3iRCyJ+tGQ+eggQZYidkjkchSlPX3PZ0LLEKGGWHshtKe
         WlxlIePW7PklRLfIFOgYQS2SbNLJ/Ec1vfUOSSSkiamFz1LUVZYJBLOqokbNK70M5fKm
         tvd5qLUUQsMzXVsKmn5lJMffWUQZ6GXUJ0mCvDr4VNGZ+hDpgKj0s4i12Jwrv2YyAh5k
         XW70sD7lAxx7JvtHx3cJUxY1KMBesrWjQTJUsexGrXwv+V1LB0jP7+Tn4EwehAgfaNgq
         DvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915050; x=1762519850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mO2KtY6kpP/4dstvJ2/nd3TfZivPb0AjpquB+Jg3MoM=;
        b=gajL7HEiWpZqk0PO6+lxuEIPXIxVjASH8UlJp79zEKZu3FVjvm2D5TNU3DR0U4v739
         s1RMbOhpkUgRADRI37rdFMK/LGbtdIaPgqG5Ap3M+KIPxn/AjCx+dmMg/86kpYLuH/V0
         DjCbmM8R0a1pyPlK+HKA/b7RiLkzeC6xIsW8iflMMAmNKxZIiF6ayCR2jz+FarcRisE4
         gEAjwaaJ2hQz+fPq0Z641kkMfX3Y4gc4ozDY2WwpO8TqkzzqsYAZfN8SN0U6T4evhnSI
         L+pIC5+TfMHuapLAH6Gw78C6yxlVKqY1MDlrZq5yhuCyOET5tttJbMAPXrqHuyXS+F2d
         SMmA==
X-Forwarded-Encrypted: i=1; AJvYcCXPZKEQCm8++5X6yHlnX2Synh6fsdAEob8hFugN+fsNT0m5yZNlGCVMkFuQEOlPyU5t2Zo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy439sIOERR7LHkb3e0Jv1F28H9GHtEqeXqUyc/WnUpORFjyDWb
	6wZ+qkBt080Spizg1/d7gYBODXCfGmE8pa/5RjS5JE0CAwzx7tAr02Kn
X-Gm-Gg: ASbGncv5dvq8MOGopCq7DJGtSqaeHB/sxO0BVsrK0G3V2ZwQgXSg6OR2w+Z2COot8ia
	VYtAzAdGGLXqVSWhALh9X3ja+ULTpm0q3Te/qbDALMzsa/mVzsA+4UxeNfjMJMsrEiBgfVkp42N
	CaOT7JntPQCF9E41DV5VLSpsj3JC4+3CTJP761rq5ps24Uk40r5qPUrE/HI5UzO7rY7W7JOEymt
	8bZnW81+NPMY7dX1hofjqM43DxM+L+/N85J0R7kPNhD/EtzI0KOkEoQwStXAYbcxBZYzjLOenv8
	FOVGyjSj8Z3Iaz+crJEiOo6nmS3D4emPBef0nwcDLj6ko2ZI+HO6GgMaBJOonnmeASZvZH/ieNx
	5rikLa5z8ZozQNtv3LZgLpYj5w1BVzn2BB12BRCoisiZS2CC3LWThse0eiyIwaYpc5P8sBTzG3X
	iE8kr7pjpyAEGjYU2bGZxzfNWTEmGfjB8I1isdijQgYvk6T9XXi+R9X1B+pOgnE4n/xkKIyk929
	ZywUg==
X-Google-Smtp-Source: AGHT+IF9Do9nR03BStcy/ENSw/8pRxFisHxazSviyoAjb3tK/ts2RifiuU7Em2HOcQoiNKmeoGdqBg==
X-Received: by 2002:a05:6000:2908:b0:429:8b47:2f35 with SMTP id ffacd0b85a97d-429bd689dc1mr3344895f8f.26.1761915049784;
        Fri, 31 Oct 2025 05:50:49 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f1d4csm3144559f8f.39.2025.10.31.05.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:50:49 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: imx8x-colibri: add additional functionality
Date: Fri, 31 Oct 2025 13:49:40 +0100
Message-ID: <20251031125003.275033-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Provide a pwm-backlight.
Provide the 32kHz Wi-Fi clock used during low-power operation.
Configure CMA from the device tree.


Max Krummenacher (1):
  arm64: dts: colibri-imx8x: Add wi-fi 32kHz clock

Philippe Schenker (2):
  arm64: dts: colibri-imx8x: Add backlight
  arm64: dts: colibri-imx8x: Add cma memory

 .../boot/dts/freescale/imx8x-colibri.dtsi     | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

-- 
2.42.0

