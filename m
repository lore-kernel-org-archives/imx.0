Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215807FD
	for <imx@lists.linux.dev>; Mon, 19 May 2025 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674974; cv=none; b=KtWgOqdRhk3A/dtcVT5zMkPXEoG7MEfqTZD6hfXQlmPGlSYsYgQIUTY94WxZtkdqYr4GBheZlqWcinjkHVl0YQWYotRaQyELTZHNrRuJZIWPqejs1HEMEjZauZRLrfemKe2NcB0Zv6dzIG8k4q8Db37j/aXzxWeZt/IX9qtSHIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674974; c=relaxed/simple;
	bh=pNrf+QD60zmkj70f3+YDaBoATl7U8V/+uFH0RTj/DT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AbyRsDPQdPHTQJbSCNDgpeUQ6jaKQvPG2hzdLl8WzDliIhZYBTjHLyXZ20VPLB1gBud1uaE9Q6ssK5JMCipXaYcmQbiyntMuFD8v2ZNCbklFlbVcSq5VVcnapgtc3XmpiwsQz2tvKLfn6+9DD4SHlUP5UTcCgVnCbLNbzG8YHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB0YmBe5; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB0YmBe5"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-528ce9730cfso940354e0c.3
        for <imx@lists.linux.dev>; Mon, 19 May 2025 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674972; x=1748279772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h52ZvInZ2ZKG98XTL5i3CaIBIWLDrbmN3XBHdiyAOzs=;
        b=gB0YmBe55VHgwh6beRlYR0RNNtgUxIa1OFQEIoiONwDuhCvtSrh4Hy+kcc21TD9p+8
         GljjtyNQ7T1dSuhnqfPZ+bSFm/bx6EB2JvJ4+vTDwnfiYatyO93enlJc+o+KQryhOQBQ
         inFkdOuVjUWZRAPb4htuaDHnp4SXgf48xSDLaqCdNkSEcuKIyI9aQIS1DLAtVrnYyi8V
         t/sNeVWTXE0JHcsYveoQUooyVeyCYMaIT8z/nVaEbKfQyaf+LAnzYLGpqHFZqqGwhjHI
         jO1Dfel0AwC8c/XTpdBYd3eajQp/fXwPOSn9UmejT2lq4POw482RS+vtgBgYFebdaDok
         c/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674972; x=1748279772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h52ZvInZ2ZKG98XTL5i3CaIBIWLDrbmN3XBHdiyAOzs=;
        b=Xp3NULjC2bhglVLZz34SdYRw0lSw0vZREi2Jilk84L+N1BtoSDvcVXPHIaXk9vr/H8
         G2Kegm76M+PO1HQCoGi08qJm/olcXlz87USNS4pg4sumhC/grE8OxAFv1hgrHPpT+dT/
         SLYY6gi0pRjeEekNGj9quKIBIdYIsTpNvVN1Yo5I3mxO4R1na0tTrvn4qpB9qZGyHRIg
         RJ1ZWZwXpJwcDSs1XNOznzudCg6nc9kb5dR3bbX4GvmEFkta8pczknx+l2IfB6GCOJzq
         Rjg5EqZzX6tROsw6tlfO8fbuXz3U/VOGZV9TYUc/l+OZHaGVCsEYUNRz3w1IOwjLe3Ra
         tmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5DFD6rG7BcoLCsCeZ5hARrBpPhsNO7bgOK1AfPYMFBNpFFSfrvK+J9AAuI3PxWzVohu4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxly12BD5wdNEG3jD3kzfI7KbdohAe35pe5E+eWQeLX76JFsLH2
	W/MMItXnsfMJhuanw9BExAA68shNUVfTOdDHUmfl5y+aCfzkXCwb0jpj
X-Gm-Gg: ASbGnctLS3MWkgE2d4yI9BjwoLpNp4HH5xpsSZdHVhfZvw5TfXHbiIfmZAiUJ3NgI10
	c1CwsFdTm+Hq7601gIIA1tnBzdP7d6FifMBHzIpT/h9PGJgaQ6aoYMtBaEierGaNzrWgUvLvr0s
	YLjgfHlTFQ3Cp52c/Jefp77TJDjDIWI2MUxhrqZVhhkltMeDwZf48mHGiJjBQQTCtx2ESVyBpSG
	F9Xw12o1igmeBYbBfjKLFx1NvHIxl/JfJnQrzpqxKWP+SHwKn3FcRqZiFgNkiYI7wV09U3CnKQu
	fjASx93EywLh8wawTGblHTJ3117+IzgSDd7QpKwGcL5EkKY+7YMnNHlfgTI5C2T1g0sspwjZHQ=
	=
X-Google-Smtp-Source: AGHT+IHxO6Q7pyZ10Rjc58jJYNwEv+Q71o6gZRhjB80LZXE2hgkkj3DboWPcXP74AuftkJZQLczGHQ==
X-Received: by 2002:a05:6122:ec9:b0:52a:c0db:29e3 with SMTP id 71dfb90a1353d-52dbce1e5a3mr9485202e0c.10.1747674971615;
        Mon, 19 May 2025 10:16:11 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:11 -0700 (PDT)
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
Subject: [PATCH v3 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Mon, 19 May 2025 14:15:11 -0300
Message-Id: <20250519171514.61974-1-hiagofranco@gmail.com>
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
it is already powered on, the driver will attach to it. This SCU API is
being added to the new file drivers/firmware/imx/power.c, where all PM
related APIs should go.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [1] and from a reported regression [2].

[1] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[2] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v3:
- New file introduced, drivers/firmware/imx/power.c, to handle the PM
  (Power Management) API functions, as suggested in v2.
- First patch, "firmware: imx: move get power mode function from
  scu-pd.c to misc.c" was dropped to make the reviewing process easier
  and in favor of firmware/imx/power.c file. Moving the power mode
  function from scu-pd.c as proposed will be sent later in a different
  future patch, as suggested.

v2:
- https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/

v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  firmware: imx: introduce imx_sc_pm_get_resource_power_mode()
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: add power mode check for remote core attachment

 drivers/firmware/imx/Makefile       |  2 +-
 drivers/firmware/imx/power.c        | 52 +++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c      | 17 ++++++++--
 include/linux/firmware/imx/svc/pm.h |  9 +++++
 4 files changed, 77 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/imx/power.c

-- 
2.39.5

