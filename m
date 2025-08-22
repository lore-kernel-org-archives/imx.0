Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD5126C05
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834612; cv=none; b=KWl8xVGqm2nt7rXzb9x9zhmmUgFZ/6D/yxVDMMW+1f/ipGZ6HuLPABz1e2wHrbAGMd/OlzD7dSFV6WAwFwVjjPcbvasXHbPKiGI0pGDwYSzKw+88qAvEaU2aFROjQzAJHdE82ezZlCsoLJA8pX+SFGKbtglaTLt9rLL3CeGMkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834612; c=relaxed/simple;
	bh=hgVzG6HidK5orceR0qnfKXbDRBYduOwo4V7lILI4Rm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LBkQbPEwhpNWpLOuwc2xU8PN32mPIWW/3Hg5GgM6QEt5A0YluBbS8krCG7X+7zsyJlf9NDLQzmaXFYxrTPTMHAmpGBu3fKfG+KMTcuSyWtLa9QnBjPmINan3/oYr/JULm9jVFnWY54/mSEin8lrYpiV+I/9qFMWCL7FRK4bd820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nhjep2cN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nhjep2cN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4717543ed9so1094041a12.3
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834610; x=1756439410; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSKRWggFm2gwVL+yK6cxP6RJKjf/dyRkrtyiTbymMX4=;
        b=Nhjep2cNnzwAM6nOV5HHZBzS5qn+WWx0887oKutmFL/dBLfUqum3hoU+SxKkPbS89Q
         bU3uLFJRYiRa6TFZPK407xBNxcJ3R6BcCd621uIQG5mty55YUlcAjoL7mZFxPzYmpHRj
         6RuCLn3pvxeopD9goQ2wy/p4BXefQqIgSzyry9U05+0skik8eFBLeSoJFUQMVKenDMtf
         MiQGM6KUdiYcUNqaeypMsRoHA9P3AKzjIEfMiLDZY/dYC8i5IU45V/TPCbSzwj414T4y
         Ub/yaNzuuy/SGpCVqhnpZdlzQjfghb/f8h0yNpGlp5qyvpIdfRWr9uyDXSNdKXyCJ76c
         vB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834610; x=1756439410;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSKRWggFm2gwVL+yK6cxP6RJKjf/dyRkrtyiTbymMX4=;
        b=NQNBdkVeK9WCJmJNMojPdVRnM9J2B6etcGnJlJoQFkw3lpMMalSHYCo8EHs5mfZFjw
         fB/LN3wogupTMazqLoK9Rvu9wmrDJPhEGQvoYR6ZIUIh3K3jcz+7uR6lViIUNP8AV2+N
         YhRgUar/WYxsOPNkWeVom9cKS5Mt9WxgbbfYuSlj67qfvNoV8qZxOktPiGBa2kATVHPk
         1NOpyYsWoYS5Lwcl0m79EvVQ4uRfXeKCAg9s34oG6eSYMBR1QGZ4T+uT8nnVelzxuCr6
         bPRwi0Q/qffBLqtOwHPvpiGSwkBuq0paTzmlEJys7ggqJlryKHma6c+jWcWXPpqjN8oR
         rJPg==
X-Forwarded-Encrypted: i=1; AJvYcCWg7Vdj8t8udVG13GpnabylwmsN6SBWMFGx21a7ycWyupd0EkdiJIzbUUhbb7tO5MyNoEo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxGYmckexZyS4LVpI/hPO2ZdY3x0reD/VoSDqMnwo+d4ySxoiH
	hXckOY533SYoM4jJj74KuH9BPwvcqdyZW04oMHaNqD6zD2Z1zpPwlWM8
X-Gm-Gg: ASbGnct6gWYePWnuxXUFQYjwyxIXJeTehQ+VzU3RXJnTWpzuIIyHcjX+HKWomtP1neO
	QIXu8laLiiUjYiTUczaRMzi22AeE5PllUCDSsV4lrJ+KyB1okwobp6+uo3D8pYCdjfNQ21HKVGV
	X9n5CQAShmcjpI14OjV9wHg4gTMpWbR0Il5tokuDlhk+GKKFVl1Tr37Gh/9t806tA/Gei8x26RZ
	Ej7ix4vyvU0aK0FUrNWKTaA3/bAqRO6YUFiC6cSPFYVPDHXDogPOkhRLNx7hgMPGV9praJoD6QL
	eMX0j+qevQdEIclPbRF2KpCgqxwnSfk0JT9ompedqcpw+Nl3ke2tsmMB5cYa4064N775jAHehGE
	c3uf63xV/YLL5TS9bzEXwhS5j6lIs
X-Google-Smtp-Source: AGHT+IGCVxew1BDZArBDIFetyektFCJx25ozr5W6t7TZGZRe9/Jw3ZLLLMj8b6oUhny28mvLZll1RA==
X-Received: by 2002:a05:6a20:2446:b0:240:66:bfbf with SMTP id adf61e73a8af0-24340d2c0aemr2084997637.32.1755834610000;
        Thu, 21 Aug 2025 20:50:10 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:09 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
Date: Fri, 22 Aug 2025 09:19:48 +0530
Message-Id: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3op2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMj3dS8/NzE3Pic/PRi3TQzMzMTI0tT87QkYyWgjoKi1LTMCrBp0bG
 1tQCmSYNeXQAAAA==
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=3085;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=hgVzG6HidK5orceR0qnfKXbDRBYduOwo4V7lILI4Rm8=;
 b=WRGEFFGiWV0zUgwoAaJABm7znaR2ui0mgJOni6YE0h+a7dxpgGWXH4VPdRYWFcy2vTScWDi7v
 /AbBSSYdX3qABloc3gMuzl/AmRds5P7PoFeLgXP50B5iPhIdDBRp3Z2
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().
With these patches, all the iio drivers now has uniform handling
of the -ENOMEM while device_allocation and trigger_allocation
calls.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
Dixit Parmar (10):
      iio: accel: Drop unnecessary -ENOMEM messages
      iio: adc: Drop unnecessary -ENOMEM messages
      iio: dac: Drop unnecessary -ENOMEM messages
      iio: health: Drop unnecessary -ENOMEM messages
      iio: humidity: Drop unnecessary -ENOMEM messages
      iio: light: Drop unnecessary -ENOMEM messages
      iio: potentiostat: Drop unnecessary -ENOMEM messages
      iio: pressure: Drop unnecessary -ENOMEM messages
      iio: proximity: Drop unnecessary -ENOMEM messages
      iio: temperature: Drop unnecessary -ENOMEM messages

 drivers/iio/accel/bma220_spi.c      | 4 +---
 drivers/iio/accel/dmard06.c         | 4 +---
 drivers/iio/accel/dmard09.c         | 4 +---
 drivers/iio/accel/dmard10.c         | 4 +---
 drivers/iio/accel/mc3230.c          | 4 +---
 drivers/iio/accel/mma7660.c         | 4 +---
 drivers/iio/accel/stk8312.c         | 4 +---
 drivers/iio/accel/stk8ba50.c        | 4 +---
 drivers/iio/adc/ad7949.c            | 4 +---
 drivers/iio/adc/bcm_iproc_adc.c     | 4 +---
 drivers/iio/adc/cpcap-adc.c         | 6 ++----
 drivers/iio/adc/da9150-gpadc.c      | 5 ++---
 drivers/iio/adc/dln2-adc.c          | 9 +++------
 drivers/iio/adc/exynos_adc.c        | 4 +---
 drivers/iio/adc/imx7d_adc.c         | 4 +---
 drivers/iio/adc/imx8qxp-adc.c       | 4 +---
 drivers/iio/adc/mxs-lradc-adc.c     | 4 +---
 drivers/iio/adc/palmas_gpadc.c      | 4 +---
 drivers/iio/adc/rn5t618-adc.c       | 4 +---
 drivers/iio/adc/stm32-dfsdm-adc.c   | 4 +---
 drivers/iio/adc/stmpe-adc.c         | 4 +---
 drivers/iio/adc/ti-adc084s021.c     | 4 +---
 drivers/iio/adc/ti-ads131e08.c      | 8 ++------
 drivers/iio/adc/ti_am335x_adc.c     | 5 ++---
 drivers/iio/adc/twl4030-madc.c      | 4 +---
 drivers/iio/adc/viperboard_adc.c    | 4 +---
 drivers/iio/dac/ad5380.c            | 4 +---
 drivers/iio/dac/ad5764.c            | 4 +---
 drivers/iio/dac/ds4424.c            | 4 +---
 drivers/iio/dac/ti-dac7311.c        | 4 +---
 drivers/iio/dac/vf610_dac.c         | 4 +---
 drivers/iio/health/afe4403.c        | 4 +---
 drivers/iio/health/afe4404.c        | 4 +---
 drivers/iio/humidity/am2315.c       | 4 +---
 drivers/iio/humidity/dht11.c        | 4 +---
 drivers/iio/light/stk3310.c         | 4 +---
 drivers/iio/potentiostat/lmp91000.c | 4 +---
 drivers/iio/pressure/dlhl60d.c      | 4 +---
 drivers/iio/proximity/ping.c        | 4 +---
 drivers/iio/proximity/srf04.c       | 4 +---
 drivers/iio/temperature/mlx90632.c  | 4 +---
 41 files changed, 47 insertions(+), 130 deletions(-)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250822-enomam_logs-f66642957fb3

Best regards,
-- 
Dixit Parmar <dixitparmar19@gmail.com>

