Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A4221CFF4
	for <imx@lists.linux.dev>; Sat, 16 Aug 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755341226; cv=none; b=dXnsXWEpeSpB9XHdeOxWymQjIYLzQ008Gyv92lNp10fPxBqfIdp7vTvmpsF4As95Y4AynNXnmiwMwaQ1O/NV6mO2EJUueMf21U7EHLKMldEElq7njiUAj9Vbt3CcQoAu9o87GY4qiay6rxw2P2qHew9SDRV3DU4MPJaNCQwPpBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755341226; c=relaxed/simple;
	bh=OfZOqjSEfmBvg1ifBn9VANH8m3yfiI0SQ2MQSnBU/lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmFgaLiwGkKtsn4gYYxVMjR7YmeGbY9+HZtxAf/2pS+dBcfIEabmzWqYlYp3ZETisnMoJ1EeO0NIZogN24OprPMj1AHRmyFkRX8VWb4OgifHDz2huv2Ho/xnqsd1aH7ZWkLmwiZBEX7aYsERfjiV32Oa0B+ezTK1wQKMuEwqAtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfwXpVL6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfwXpVL6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9df0bffc3so1739740f8f.1
        for <imx@lists.linux.dev>; Sat, 16 Aug 2025 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341222; x=1755946022; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8/K9OcQh+VZ2ps1hjk377/rzEGr4MXBz1jHP2xKk3A=;
        b=xfwXpVL63YSag97WmuqYgg7yzgTfM6W7U1tUqhwzOZpRFJ9tqgPoQ3Rj3MFbUAHPa3
         nW/PiTeqG7T2WcvIkdfl8GLQv9dEq3rIsdI/buSuYjIVT45iYb84/goHaVfPvzHxnrqN
         I+VzPtLkn66iVyDX+4YJgC4mKF6nRSYxrI3p2hnl5eWgAVRLUiVZ8z7PXZhkDIS9epyX
         K4fum0BmO0Aqhx84yObPmpcw6xthTcPxEEHC6YSGwC3m5zF/tSdNX5F0j3CrhM9Mp+9X
         nxYW2CW4jOMlzSrhX8jJAN23dBQ+XfzGT2w84gsgt93jicmyTHu7s8bW+GXutYLNnJd+
         NqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341222; x=1755946022;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8/K9OcQh+VZ2ps1hjk377/rzEGr4MXBz1jHP2xKk3A=;
        b=aC1bSCDq6erwXWGxaH/anJMCIP9K12QLmQSfcED0KKKQGneyx34luSCHctSXAiAyZi
         J0ybY4ja0Qz/zOWx3mXL2/4IySHEYj563XKsuTU/GA+MwZbfVgH/NFDoumdGEES/gNax
         RB1jocqgX0WzMScuCgx8Z9MVIu0boz12hQ8eBs8nh0XKo5eFmNu9CG9Ln0XsrKPvv0Bk
         7Vg3pW/W+c/orLyKsAwzV42CMqWD+JzMM+FJLniTCLG/SWOcZYhFsaL6BdSTiglPQHOp
         v+dnkQUJko+CzUxr+oHcYaO5uHP59YTBxB+jNA1iyJ/DNCeoqGlE9G2zFv79/5Jtq09u
         rUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqLI7rXQk6EwpOTEUQwyEplWWhN50pzsQl3P2y9+7864nT0p1Q1LcyToWwKppwZ2ozQeE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs8b5zMSFC3zBYqKeRXhbyYqezTmFj+jJiX37wttFTM0P6nbqG
	FufFajsjf6hWn6E1rziRzYBY/c3+6K31mCD31b7hYQ+HhkI3RChDADyziZLF/cRYUWg=
X-Gm-Gg: ASbGncsWaZouJInMtTSGHrM11S3pIikouEmbIvXx1BdBs9u8SW2trRbRBlyP7q2H3K6
	cs1YaBDIF/kn/7sf/xekuk0oVQg5V96qTjW9s5DjneyRK0mj9KJURDBN6pez64RI0YUdveebV/x
	spwjSmjKurusNb0eKAde4+PYQpZMN7L3jAudQ0rKgXKWnNVctcJ+G4zjhtseib1u+WENBE7xL3u
	JJ7ZmglbLJ86xmbnJbKvQ6wADD49Vfyk/hVff33a3ZwcAHHU1yuFV3BhlDMdlaB/BbfnNnKVCUq
	sgO+6Ry/LnLH8tOyLgvRlhxMWBEDAlNRLAtoqZywf5kqkl0Lpc9JdlIhxVK1/6+XghRgqsEKxsE
	nVyTFb0bQj9NeIIIGBGczoJPK6OMJMhZd/cLuMFzM6Z4=
X-Google-Smtp-Source: AGHT+IGeBUxsWM8TKjBjOCNR7N1cHTH9VLKWrA4KdiQror9m/vvPgYr7/Et0/P2bYgMxSkrNqMzKvQ==
X-Received: by 2002:a05:6000:2f88:b0:3b7:84fc:ef4c with SMTP id ffacd0b85a97d-3bb66180488mr3569613f8f.6.1755341221916;
        Sat, 16 Aug 2025 03:47:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a22210ab4sm51914445e9.3.2025.08.16.03.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:47:01 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:46:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Ciprian Costea <ciprianmarian.costea@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH 0/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
Message-ID: <cover.1755341000.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This driver provides a way to access the On Chip One-Time Programmable
Controller (OCOTP) on the s32g chipset.  There are three versions of this
chip but they're compatible.

Ciprian Costea (2):
  dt-bindings: nvmem: Add the nxp,s32g-ocotp yaml file
  nvmem: s32g-ocotp: Add driver for S32G OCOTP

Dan Carpenter (1):
  arm64: dts: s32g: Add device tree information for the OCOTP driver

 .../bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml  |  57 ++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |   7 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |   7 +
 drivers/nvmem/Kconfig                         |  10 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/s32g-ocotp-nvmem.c              | 171 ++++++++++++++++++
 6 files changed, 254 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml
 create mode 100644 drivers/nvmem/s32g-ocotp-nvmem.c

-- 
2.47.2

