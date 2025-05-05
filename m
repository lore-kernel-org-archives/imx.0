Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D283425E46E
	for <imx@lists.linux.dev>; Mon,  5 May 2025 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460191; cv=none; b=urkhYSL4etEyV0HggAl/F3Bqm1tuI6zcHl5j2efu0HFvdqgH58h5A83Ckael/vfBJfOsMkU9t+fNK/ypGP/XINleq8QALue2HvEZNXEklj5KxMsexEkm8ClpU3LHF0t4FyJIoxdkFhSJUdSMcjE6YMH1s3R6TUNR05f35iJRr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460191; c=relaxed/simple;
	bh=hXB5HIS3f+ZCRt/681Lhw22MgJ3Qq9wuAw99RftnTZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PNugqv82YcSJWve43RAwI8GXJJwwuaZjvHiKnsa3oMcpZsPPK5FEcLYkUDxEOG5kflKdI5/UEgpoz/RWhugljaok54aOk5zvFfCiWq7DEPeevaHoRqfoOeYH9gtIW03qjRB8CI8BjCy0UaQs3+ykizSdhfzRa8XWX/2dU7pd4iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAHbWV66; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAHbWV66"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-601b6146b9cso2280904eaf.0
        for <imx@lists.linux.dev>; Mon, 05 May 2025 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746460189; x=1747064989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfSasfyNn2QOSv32qDVaYS8lEHvMrqjWB4CpFRqIp8o=;
        b=jAHbWV66xb6a1+p51piLAOXoBnRrFY5y2dyxKLxKyqaApbLnBKdXfghLH68P5p60MJ
         y/Q8ak9hMhrrsDyvHqILV2folG32mv5fsax4hpayDbfLQoxrKtR7ot0m+e5HKl1Rzocc
         OxmNk0Nr5aZF14+bXCKjgHI8I/5cFaBAe5ACve57tnSh/cZ2JlpcwofOtYQHoQ3/scoP
         8cHpsUCA1/5/2v4kS3W5Ae7dH3IqYC6u71wHmHNQbIvc42j7dVCmALmdi1FZH7uGtb1w
         DkSkaW6c9NVMzhdgfCwNCyqIzXHOaF9xnfp/eoq+g3tOJ9MKZoc25YShOJDgr/ff6RAI
         4sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460189; x=1747064989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfSasfyNn2QOSv32qDVaYS8lEHvMrqjWB4CpFRqIp8o=;
        b=Nq0xjhRsuBXb2ykGfyCx/SyOnZCz8sbOxI1GZfbgfzbq4qRauyYq+9eaxycniPDS5B
         2Ws5MGLohIFHRyGmjxEvfvDjXTx6JPQLIyy0a7LjoVNue3qtP4hziaJ9cU0i5s6+oI5U
         LFNZp9GEf1BAonNDBLyFAqwfaQLSpjKz2niURt1k+JhwKFIf5cNC1Y59yqW40s7dn5r9
         wygfYY0UTmRaqGTAej+4DXmebp9Z7F5kbksIYX9WpQu6Glqg8bODR5kSeVfmMsl6eU7M
         s/LtobqpyVRHA5XdUQ8tY6a4tAxLF77YD9urhRUIKaBnoz3LZ09IjA6B0zi7Xzds3af7
         113w==
X-Forwarded-Encrypted: i=1; AJvYcCX2ftzlqfKzjrARBUbMBFPnCK6NKM0lF8qFcbYDG7Z4cmuud5W8bEItCVRDKFkQmYkaTgk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyudHfrVWYBgJpJ62wvCfKPYyhDM5kCVbqU3ViPP/UJgroE2tMw
	hJ7eFrxZYP2By8u34JsXtNiDosyuhxR1yEwf8jMJLHQj2BZw8xyO
X-Gm-Gg: ASbGncs+39mfCVS3g+RD2ZXtpoBZMxzB6ly0KghPM/zTug1OCvJFEWm6Mr3GmAN6bIQ
	kZLVPBga/csV0GuzFP0cy6Aq+5LSI3HKd5vaEYNl6UvboP81a/oBsfIvnIAeOwMwzmQ5mOt2WdK
	P/tfZe3F7Vgc1UpBtNioYHbSfL6TTqqN57xg05E3cGZ3u67YuXpC0nKFSYLG1osMmNoi1AdAJla
	9EpyUS0JLOJpdfN0XkhPQetyMmbl51a8kwfxJjlsJuKsTnxKQyUHD4ZW2iDvptEz8XyIdQBCHDQ
	tI0MdvrQnileKw4JsI7TkGkGpK+GCk8hZyTjTSZ3QbktldfcvCsWYJTrui9HIYh/skXh8uWfzw=
	=
X-Google-Smtp-Source: AGHT+IFxZaRAPndA18lDE7ChWtiEoMGY9mLpWkb2iP4H0PkM0TVxr3eZLsRh+qcaLAy4IFe3PQLjgA==
X-Received: by 2002:a05:6820:c81:b0:606:8bce:32a0 with SMTP id 006d021491bc7-608002f986dmr5907169eaf.7.1746460188788;
        Mon, 05 May 2025 08:49:48 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm1606217eaf.36.2025.05.05.08.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:49:48 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Mon,  5 May 2025 12:48:46 -0300
Message-Id: <20250505154849.64889-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This series of patches implement an API call to the SCU which will
return the power mode of a given resource (M core in this case) and if
it is already powered on, the driver will attach to it. This SCU API was
already being used inside pmdomain/imx/scu-pd.c driver, therefore it has
been moved to firmware/imx/misc.c so it can be accessed by imx_rproc
driver.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [1] and from a reported regression [2].

[1] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[2] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

Hiago De Franco (3):
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  firmware: imx: move get power mode function from scu-pd.c to misc.c
  remoteproc: imx_rproc: add power mode check for remote core attachment

 drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
 drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
 drivers/remoteproc/imx_rproc.c        | 27 +++++++++++++--
 include/linux/firmware/imx/svc/misc.h |  8 +++++
 4 files changed, 87 insertions(+), 24 deletions(-)

-- 
2.39.5

