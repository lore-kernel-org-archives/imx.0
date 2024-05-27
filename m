Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43C161302
	for <imx@lists.linux.dev>; Mon, 27 May 2024 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825856; cv=none; b=opbWMy/Pb/0N+ZJ9beafS/ETbttUQt8HEZjNjTm7lOCjkf2m9ghWJkZGa/mHYrBNKVt6+0pEjBvHVs88Ui6ncdSE8jYmOPKtp3luphfyhyviOu9Ck8ox6nv+yqKwAwXAWH40r9CL3DlCZx1LLbANsl1KGv1jeA5XVs3JbEbTaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825856; c=relaxed/simple;
	bh=uacHh6EhTGWzGPaDWbj67AEeFIW5+96vG5JumV2wf8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PgCXfpvHj9e5bz5hIkS27uCb1pGEldR57u1uX1zFVCCHJw5G0LtGxX2s4IyjA7qfz1yqf67WHThFH7pxw+acAsDFhcqwYD5zrZXMBOVsZW+ss3AyzpVINfhsVpHqrgVO4WQk2b4+5szrJIXC1drQ/msY6ZpmZz5pDASZdWGNDko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSgL139X; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSgL139X"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5295e488248so3763016e87.2
        for <imx@lists.linux.dev>; Mon, 27 May 2024 09:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716825853; x=1717430653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apgO11dWsw7OelFO7SGE1rP5mAwL0hohwTCwi5aPKr4=;
        b=YSgL139Xp0fzYnWNoDTootVv25gHzGKK1g/10LmMdRMFEcH18ZyVdoh+Lsq93rOt8y
         FIo/Dllf/9uTLF4yXNt0wxlemY+MZOA4lAkvmjDYKK4KV5m1sgIN+rgYN8MFqE2sFVZY
         o68/bk87jIW7SAoTFghSL3fov3IhaWXpZYh8vG9bVkYHCWAybPXgkL2vC6WkvYTRDa1/
         VAyU4KEjptURl9rhqP3RI7vJXyEswoKimh4g6bqjy1mSsSjIQBvsywoCbHV9f7G/H9eI
         K+u91X7+jQLThysqEkG3dFaDjmgGWQPPr0OPqtXWavVlNpBQMa3Xgzt+FmCdsb8nnqsQ
         MkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716825853; x=1717430653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apgO11dWsw7OelFO7SGE1rP5mAwL0hohwTCwi5aPKr4=;
        b=ZTov/BXtUC9G4b46XqrIHl0FD/C8IDhXr6RbznhHOHmd10ahr7Yw2qZA+TjAv44rk6
         kh9f8neP5qG+qKPcDmDJJZm2kCzWpkL1plv3xWG2Ai11j6pSYUPwRYK3LPrSsnm5jSTY
         MzTso+DBhaSiKI0BDTW7uOV0ZTmwneoazBRdRR+KDIO9q+U5fulZsY6ujIxab/VUIEli
         wz2edY7CTHq0KU2cAXc6YLI8pTudS1D3oSulB1QKBTHZYr9zCCmLT8L5wwww0EuiDBMd
         u/c5GRxpAkB+GRNFOZlq7+mUg4H6nf+KPE+oaoUE901Hv7zajVb82GJdIaPQTSwXjeHD
         oecQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs9leGA8TRcZAYWyYvtrnUZJjEjXLBs0doGOpm94pBSrrYUnJ/U6ETFv518IQ8Q0iX9AqiCXHdrl/sf7KJi8VBNLCq
X-Gm-Message-State: AOJu0YzuJLx8J05l3LTKFQ2q/7pE4BejuIcf98Em6uzVfUOlke71wVoP
	aaS1ndN9zrXhZg3ClBWycJ6tb78oRGVSosCMbScF9GY3FlOYexgY
X-Google-Smtp-Source: AGHT+IHd8fZ9ZjNj+cQlcl9SkrUQUbQdMMCLLzdPkGhasZplYnYRHIfSakWwJL6yK3us9V6TLzOhaw==
X-Received: by 2002:a05:6512:454:b0:529:b697:a0d6 with SMTP id 2adb3069b0e04-529b697a37cmr663484e87.8.1716825852032;
        Mon, 27 May 2024 09:04:12 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579f96519sm9349394f8f.26.2024.05.27.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:04:11 -0700 (PDT)
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8m{m|p}: don't limit i2c2 max. clock
Date: Mon, 27 May 2024 18:03:44 +0200
Message-ID: <20240527160359.1965512-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>


This sets the I2C clock frequency to something people expect it to
be by default.

For I2C DDC we do want to lower the I2C clock to have more reliable
communication. However that should be done where the I2C bus is
assigned to a HDMI DDC, not as the default.


Max Krummenacher (2):
  arm64: dts: freescale: imx8mm-verdin: don't limit i2c2 max. clock
  arm64: dts: freescale: imx8mp-verdin: don't limit i2c2 max. clock

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.42.0

